#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <memory>
#include <functional>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <cassert>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <iomanip>
#include "Bytecode.h"

using namespace std;

// ============================================================
// 1. RENK KODLARI
// ============================================================
#define RESET  "\033[0m"
#define RED    "\033[31m"
#define GREEN  "\033[32m"
#define YELLOW "\033[33m"
#define CYAN   "\033[36m"
#define BOLD   "\033[1m"

// ============================================================
// 2. KAYNAK POZİSYONU VE HATA
// ============================================================
struct SourcePos {
    string file;
    int line = 0, col = 0;
};

class ZedinError : public runtime_error {
public:
    SourcePos pos;
    ZedinError(SourcePos p, string m) : runtime_error(m), pos(p) {}
};

// ============================================================
// 3. DEĞER SİSTEMİ (Tagged Union)
// ============================================================
enum ValType { V_NUM, V_BOOL, V_STR, V_LIST, V_FUNC, V_NULL, V_RESULT };

struct Val;
struct ZedinList { vector<Val> elements; };
struct FuncDef;

struct Val {
    ValType type = V_NULL;
    double num = 0;
    bool boolean = false;
    string str;
    shared_ptr<ZedinList> list;
    shared_ptr<FuncDef> func;
    function<Val(vector<Val>)> native; // Built-in fonksiyonlar için
    // Result tipi için
    bool result_ok = false;
    shared_ptr<Val> result_val;

    Val() : type(V_NULL) {}
    Val(double v)                          : type(V_NUM),  num(v) {}
    Val(bool v)                            : type(V_BOOL), boolean(v) {}
    Val(string v)                          : type(V_STR),  str(v) {}
    Val(shared_ptr<ZedinList> v)           : type(V_LIST), list(v) {}
    Val(shared_ptr<FuncDef> v)             : type(V_FUNC), func(v) {}

    static Val makeNative(function<Val(vector<Val>)> fn) {
        Val v; v.type = V_FUNC; v.native = fn; return v;
    }

    static Val makeResult(bool ok, Val inner) {
        Val v; v.type = V_RESULT; v.result_ok = ok;
        v.result_val = make_shared<Val>(inner); return v;
    }

    bool isTruthy() const {
        if (type == V_BOOL) return boolean;
        if (type == V_NUM)  return num != 0;
        if (type == V_STR)  return !str.empty();
        if (type == V_NULL) return false;
        return true;
    }

    string toString() const {
        switch (type) {
            case V_NUM: {
                string s = to_string(num);
                s.erase(s.find_last_not_of('0') + 1, string::npos);
                if (!s.empty() && s.back() == '.') s.pop_back();
                return s;
            }
            case V_BOOL: return boolean ? "tüz" : "ters";
            case V_STR:  return str;
            case V_LIST: {
                string r = "[";
                for (size_t i = 0; i < list->elements.size(); ++i)
                    r += list->elements[i].toString() + (i + 1 < list->elements.size() ? ", " : "");
                return r + "]";
            }
            case V_FUNC: return "<fonksiyon>";
            case V_RESULT: return result_ok ? "tamam(" + result_val->toString() + ")" : "hata(" + result_val->toString() + ")";
            default:     return "bos";
        }
    }
};

// ============================================================
// 4. TOKEN
// ============================================================
enum TType {
    // Tek karakter
    T_LP, T_RP, T_LB, T_RB, T_LSQ, T_RSQ,
    T_PLUS, T_MINUS, T_STAR, T_SLASH, T_PERCENT,
    T_SEMI, T_COMMA, T_DOT,
    // Tek veya çift karakter
    T_EQ, T_EQEQ, T_BANG, T_BANGEQ,
    T_GT, T_GTE, T_LT, T_LTE,
    // Literaller
    T_NUM, T_STR, T_ID,
    // Anahtar kelimeler
    T_VAR, T_FONK, T_DON, T_EGER, T_YOKSA,
    T_IKEN, T_YAZ, T_VE, T_VEYA, T_DEGIL,
    T_TUZ, T_TERS, T_BOS,
    T_KIR, // break
    T_AKTAR, // içe_aktar
    T_DEVAM, // continue
    T_EOF
};

struct Token {
    TType type;
    string lex;
    Val lit;
    SourcePos pos;
};

// ============================================================
// 5. LEXER
// ============================================================
class Lexer {
    string src;
    string fileName;
    int cur = 0, line = 1, col = 1;
    vector<Token> tokens;

    // Hem Kadim hem Modern Türkçe keyword haritası
    map<string, TType> keywords = {
        // Modern
        {"değişken", T_VAR},   {"degisken", T_VAR},
        {"fonk",     T_FONK},  {"islev",    T_FONK},
        {"dön",      T_DON},   {"don",      T_DON},
        {"eğer",     T_EGER},  {"eger",     T_EGER},  {"erse", T_EGER}, {"pus", T_EGER},
        {"yoksa",    T_YOKSA}, {"degilse",  T_YOKSA},
        {"iken",     T_IKEN},  {"dongu",    T_IKEN},  {"teker", T_IKEN},
        {"yaz",      T_YAZ},   {"anlat",    T_YAZ},   {"ay", T_YAZ}, {"it", T_YAZ},
        {"ve",       T_VE},    {"takı",     T_VE},    {"ile", T_VE},
        {"veya",     T_VEYA},  {"azu",      T_VEYA},
        {"değil",    T_DEGIL}, {"degil",    T_DEGIL}, {"tugul", T_DEGIL},
        // Kadim doğruluk değerleri
        {"tüz",      T_TUZ},   {"tuz",      T_TUZ},   {"doğru", T_TUZ}, {"dogru", T_TUZ}, {"evet", T_TUZ},
        {"ters",     T_TERS},  {"yanlış",   T_TERS},  {"yanlis", T_TERS}, {"hayır", T_TERS}, {"hayir", T_TERS},
        {"boş",      T_BOS},   {"bos",      T_BOS},   {"yok", T_BOS},
        {"kır",      T_KIR},   {"kir",      T_KIR},
        {"devam",    T_DEVAM},
        {"içe_aktar", T_AKTAR}, {"ice_aktar", T_AKTAR}, {"aktar", T_AKTAR},
    };

public:
    Lexer(string s, string fn) : src(s), fileName(fn) {}

    vector<Token> scan() {
        while (cur < (int)src.size()) {
            skipWhitespaceAndComments();
            if (cur >= (int)src.size()) break;
            scanToken();
        }
        addToken(T_EOF, "");
        return tokens;
    }

private:
    char peek(int offset = 0) {
        int i = cur + offset;
        if (i >= (int)src.size()) return '\0';
        return src[i];
    }

    char advance() {
        char c = src[cur++];
        if (c == '\n') { line++; col = 1; } else col++;
        return c;
    }

    bool match(char expected) {
        if (cur >= (int)src.size() || src[cur] != expected) return false;
        advance();
        return true;
    }

    void addToken(TType t, string lx, Val lit = Val()) {
        tokens.push_back({t, lx, lit, {fileName, line, col}});
    }

    void skipWhitespaceAndComments() {
        while (cur < (int)src.size()) {
            char c = src[cur];
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') { advance(); continue; }
            // Tek satır yorum: //
            if (c == '/' && peek(1) == '/') {
                while (cur < (int)src.size() && src[cur] != '\n') advance();
                continue;
            }
            // Çok satır yorum: /* */
            if (c == '/' && peek(1) == '*') {
                advance(); advance();
                while (cur < (int)src.size() && !(src[cur] == '*' && peek(1) == '/')) advance();
                if (cur < (int)src.size()) { advance(); advance(); }
                continue;
            }
            break;
        }
    }

    void scanToken() {
        char c = advance();
        switch (c) {
            case '(': addToken(T_LP,    "("); break;
            case ')': addToken(T_RP,    ")"); break;
            case '{': addToken(T_LB,    "{"); break;
            case '}': addToken(T_RB,    "}"); break;
            case '[': addToken(T_LSQ,   "["); break;
            case ']': addToken(T_RSQ,   "]"); break;
            case '+': addToken(T_PLUS,  "+"); break;
            case '-': addToken(T_MINUS, "-"); break;
            case '*': addToken(T_STAR,  "*"); break;
            case '/': addToken(T_SLASH, "/"); break;
            case '%': addToken(T_PERCENT, "%"); break;
            case ';': addToken(T_SEMI,  ";"); break;
            case ',': addToken(T_COMMA, ","); break;
            case '.': addToken(T_DOT,   "."); break;
            case '=': { bool m = match('='); addToken(m ? T_EQEQ : T_EQ, m ? "==" : "="); break; }
            case '!': { bool m = match('='); addToken(m ? T_BANGEQ : T_BANG, m ? "!=" : "!"); break; }
            case '>': addToken(match('=') ? T_GTE    : T_GT,    match('=') ? ">=" : ">"); break;
            case '<': addToken(match('=') ? T_LTE    : T_LT,    match('=') ? "<=" : "<"); break;
            case '"': scanString(); break;
            default:
                if (isdigit((unsigned char)c)) { scanNumber(c); break; }
                if (isalpha((unsigned char)c) || (unsigned char)c > 127 || c == '_') { scanIdent(c); break; }
                // Bilinmeyen karakter — sessizce atla ama uyar
                cerr << YELLOW << "[Uyarı] Bilinmeyen karakter: '" << c << "' (" << line << ":" << col << ")" << RESET << endl;
        }
    }

    void scanString() {
        string v;
        while (cur < (int)src.size() && src[cur] != '"') {
            if (src[cur] == '\\') {
                advance();
                char esc = advance();
                switch (esc) {
                    case 'n': v += '\n'; break;
                    case 't': v += '\t'; break;
                    case '"': v += '"';  break;
                    case '\\': v += '\\'; break;
                    default: v += esc;
                }
            } else {
                v += advance();
            }
        }
        if (cur >= (int)src.size()) throw ZedinError({fileName, line, col}, "Sonlandırılmamış string.");
        advance(); // kapatan "
        addToken(T_STR, "\"" + v + "\"", Val(v));
    }

    void scanNumber(char first) {
        string s(1, first);
        while (cur < (int)src.size() && (isdigit((unsigned char)src[cur]) || src[cur] == '.'))
            s += advance();
        addToken(T_NUM, s, Val(stod(s)));
    }

    void scanIdent(char first) {
        string s(1, first);
        while (cur < (int)src.size() && (isalnum((unsigned char)src[cur]) || (unsigned char)src[cur] > 127 || src[cur] == '_'))
            s += advance();
        auto it = keywords.find(s);
        if (it != keywords.end()) {
            TType t = it->second;
            Val lit;
            if (t == T_TUZ)  lit = Val(true);
            if (t == T_TERS) lit = Val(false);
            if (t == T_BOS)  lit = Val(); // null
            addToken(t, s, lit);
        } else {
            addToken(T_ID, s);
        }
    }
};

// ============================================================
// 6. AST DÜĞÜMLERİ
// ============================================================

// --- İfadeler (Expr) ---
struct Expr { virtual ~Expr() = default; };

struct LiteralExpr : Expr {
    Val value;
    LiteralExpr(Val v) : value(v) {}
};

struct VarExpr : Expr {
    Token name;
    VarExpr(Token t) : name(t) {}
};

struct AssignExpr : Expr {
    Token name;
    unique_ptr<Expr> value;
    AssignExpr(Token n, unique_ptr<Expr> v) : name(n), value(move(v)) {}
};

struct BinaryExpr : Expr {
    unique_ptr<Expr> left;
    Token op;
    unique_ptr<Expr> right;
    BinaryExpr(unique_ptr<Expr> l, Token o, unique_ptr<Expr> r)
        : left(move(l)), op(o), right(move(r)) {}
};

struct UnaryExpr : Expr {
    Token op;
    unique_ptr<Expr> right;
    UnaryExpr(Token o, unique_ptr<Expr> r) : op(o), right(move(r)) {}
};

struct CallExpr : Expr {
    unique_ptr<Expr> callee;
    vector<unique_ptr<Expr>> args;
    Token paren;
    CallExpr(unique_ptr<Expr> c, vector<unique_ptr<Expr>> a, Token p)
        : callee(move(c)), args(move(a)), paren(p) {}
};

struct ListExpr : Expr {
    vector<unique_ptr<Expr>> elements;
    ListExpr(vector<unique_ptr<Expr>> e) : elements(move(e)) {}
};

struct IndexExpr : Expr {
    unique_ptr<Expr> obj;
    unique_ptr<Expr> index;
    Token bracket;
    IndexExpr(unique_ptr<Expr> o, unique_ptr<Expr> i, Token b)
        : obj(move(o)), index(move(i)), bracket(b) {}
};

struct IndexAssignExpr : Expr {
    unique_ptr<Expr> obj;
    unique_ptr<Expr> index;
    unique_ptr<Expr> value;
    Token bracket;
    IndexAssignExpr(unique_ptr<Expr> o, unique_ptr<Expr> i, unique_ptr<Expr> v, Token b)
        : obj(move(o)), index(move(i)), value(move(v)), bracket(b) {}
};

// --- İfadeler (Stmt) ---
struct Stmt { virtual ~Stmt() = default; };

struct ExprStmt : Stmt {
    unique_ptr<Expr> expr;
    ExprStmt(unique_ptr<Expr> e) : expr(move(e)) {}
};

struct VarDecl : Stmt {
    Token name;
    unique_ptr<Expr> init;
    VarDecl(Token n, unique_ptr<Expr> i) : name(n), init(move(i)) {}
};

struct BlockStmt : Stmt {
    vector<unique_ptr<Stmt>> stmts;
    BlockStmt(vector<unique_ptr<Stmt>> s) : stmts(move(s)) {}
};

struct IfStmt : Stmt {
    unique_ptr<Expr> cond;
    unique_ptr<Stmt> thenBranch;
    unique_ptr<Stmt> elseBranch;
    IfStmt(unique_ptr<Expr> c, unique_ptr<Stmt> t, unique_ptr<Stmt> e)
        : cond(move(c)), thenBranch(move(t)), elseBranch(move(e)) {}
};

struct WhileStmt : Stmt {
    unique_ptr<Expr> cond;
    unique_ptr<Stmt> body;
    WhileStmt(unique_ptr<Expr> c, unique_ptr<Stmt> b) : cond(move(c)), body(move(b)) {}
};

struct PrintStmt : Stmt {
    vector<unique_ptr<Expr>> args;
    PrintStmt(vector<unique_ptr<Expr>> a) : args(move(a)) {}
};

struct FuncDecl : Stmt {
    Token name;
    vector<Token> params;
    unique_ptr<Stmt> body;
    FuncDecl(Token n, vector<Token> p, unique_ptr<Stmt> b)
        : name(n), params(move(p)), body(move(b)) {}
};

struct ReturnStmt : Stmt {
    Token keyword;
    unique_ptr<Expr> value;
    ReturnStmt(Token k, unique_ptr<Expr> v) : keyword(k), value(move(v)) {}
};

struct BreakStmt : Stmt {};
struct ContinueStmt : Stmt {};
struct ImportStmt : Stmt { string path; SourcePos pos; ImportStmt(string p, SourcePos sp) : path(p), pos(sp) {} };

// ============================================================
// 7. ÇEVRE (Environment)
// ============================================================
class Environment : public enable_shared_from_this<Environment> {
    map<string, Val> values;
    shared_ptr<Environment> parent;

public:
    Environment(shared_ptr<Environment> p = nullptr) : parent(p) {}

    void define(const string& name, Val val) {
        values[name] = val;
    }

    Val get(const Token& name) {
        auto it = values.find(name.lex);
        if (it != values.end()) return it->second;
        if (parent) return parent->get(name);
        throw ZedinError(name.pos, "Tanımsız isim: '" + name.lex + "'\n"
            "  İpucu: Fonksiyon çağrısıysa şöyle tanımlayın:\n"
            "  fonk " + name.lex + "() { ... }\n"
            "  Değişken ise şöyle tanımlayın:\n"
            "  degisken " + name.lex + " = 0;");
    }

    void assign(const Token& name, Val val) {
        auto it = values.find(name.lex);
        if (it != values.end()) { it->second = val; return; }
        if (parent) { parent->assign(name, val); return; }
        throw ZedinError(name.pos, "Atanmamış değişken: '" + name.lex + "'\n"
            "  İpucu: '" + name.lex + "' tanımlı ama bu kapsamda erişilemiyor.");
    }

    shared_ptr<Environment> makeChild() {
        return make_shared<Environment>(shared_from_this());
    }
};

// ============================================================
// 8. FONKSİYON TANIMI
// ============================================================
struct FuncDef {
    vector<Token> params;
    shared_ptr<Stmt> body;
    shared_ptr<Environment> closure;

    FuncDef(vector<Token> p, shared_ptr<Stmt> b, shared_ptr<Environment> c)
        : params(move(p)), body(b), closure(c) {}
};

// Return/Break/Continue sinyalleri
struct ReturnSignal { Val value; };
struct BreakSignal {};
struct ContinueSignal {};

// ============================================================
// 9. INTERPRETER
// ============================================================
class Interpreter {
    shared_ptr<Environment> globals;
    shared_ptr<Environment> env;

public:
    Interpreter() {
        globals = make_shared<Environment>();
        env = globals;
        registerBuiltins();
    }

    void interpret(vector<unique_ptr<Stmt>>& stmts) {
        for (auto& s : stmts) execute(s.get());
    }

    // İçe aktarma: dosyayı okur, lexer+parser çalıştırır, bu scope'ta yorumlar
    // run() fonksiyonunun basitleştirilmiş kopyası (circular dep önlemek için inline)
    void importFile(const string& path, SourcePos pos);

private:
    void registerBuiltins() {
        // yaz / anlat / ay / it
        globals->define("yaz", Val::makeNative([](vector<Val> args) -> Val {
            for (size_t i = 0; i < args.size(); ++i)
                cout << args[i].toString() << (i + 1 < args.size() ? " " : "");
            cout << endl;
            return Val();
        }));

        // uzunluk(liste veya string)
        globals->define("uzunluk", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            if (args[0].type == V_STR)  return Val((double)args[0].str.size());
            if (args[0].type == V_LIST) return Val((double)args[0].list->elements.size());
            return Val(0.0);
        }));

        // ekle(liste, eleman)
        globals->define("ekle", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2 || args[0].type != V_LIST) return Val();
            args[0].list->elements.push_back(args[1]);
            return Val();
        }));

        // çıkar(liste, indeks)
        globals->define("cikar", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2 || args[0].type != V_LIST) return Val();
            int i = (int)args[1].num;
            auto& el = args[0].list->elements;
            if (i >= 0 && i < (int)el.size()) el.erase(el.begin() + i);
            return Val();
        }));

        // sayıya(değer)
        globals->define("sayiya", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            if (args[0].type == V_NUM) return args[0];
            if (args[0].type == V_STR) {
                try { return Val(stod(args[0].str)); } catch (...) {}
            }
            return Val(0.0);
        }));

        // metine(değer)
        globals->define("metine", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(string(""));
            return Val(args[0].toString());
        }));

        // oku() — kullanıcıdan girdi al
        globals->define("oku", Val::makeNative([](vector<Val> args) -> Val {
            if (!args.empty()) cout << args[0].toString();
            string line;
            getline(cin, line);
            return Val(line);
        }));

        // ── AĞ BUILT-IN'LER ──

        // http_get(url) → tamam(cevap) veya hata(mesaj)
        globals->define("http_get", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val::makeResult(false, Val(string("URL gerekli")));
            string url = args[0].str;
            // curl kullan - en tasinabilir yol
            string komut = "curl -s --max-time 10 "" + url + "" 2>&1";
            FILE* pipe = popen(komut.c_str(), "r");
            if (!pipe) return Val::makeResult(false, Val(string("curl bulunamadi")));
            string cikti;
            char buf[4096];
            while (fgets(buf, sizeof(buf), pipe)) cikti += buf;
            int ret = pclose(pipe);
            if (ret != 0 && cikti.empty())
                return Val::makeResult(false, Val(string("HTTP isteği başarısız")));
            return Val::makeResult(true, Val(cikti));
        }));

        // http_post(url, veri) → tamam(cevap) veya hata(mesaj)
        globals->define("http_post", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2) return Val::makeResult(false, Val(string("URL ve veri gerekli")));
            string url  = args[0].str;
            string veri = args[1].str;
            string komut = string("curl -s --max-time 10 -X POST ")
                         + string("-H 'Content-Type: application/json' ")
                         + string("-d '") + veri + string("' '") + url + string("' 2>&1");
            FILE* pipe = popen(komut.c_str(), "r");
            if (!pipe) return Val::makeResult(false, Val(string("curl bulunamadi")));
            string cikti;
            char buf[4096];
            while (fgets(buf, sizeof(buf), pipe)) cikti += buf;
            pclose(pipe);
            return Val::makeResult(true, Val(cikti));
        }));

        // http_baslik_al(url) → HTTP başlıklarını döndür
        globals->define("http_baslik_al", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val::makeResult(false, Val(string("URL gerekli")));
            string url = args[0].str;
            string komut = "curl -sI --max-time 10 "" + url + "" 2>&1";
            FILE* pipe = popen(komut.c_str(), "r");
            if (!pipe) return Val::makeResult(false, Val(string("curl bulunamadi")));
            string cikti;
            char buf[4096];
            while (fgets(buf, sizeof(buf), pipe)) cikti += buf;
            pclose(pipe);
            return Val::makeResult(true, Val(cikti));
        }));

        // ── SİSTEM BUILT-IN'LER ──

        // komut_calistir(komut) → çıktıyı string döndürür
        globals->define("komut_calistir", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(string(""));
            FILE* pipe = popen(args[0].str.c_str(), "r");
            if (!pipe) return Val::makeResult(false, Val(string("komut çalıştırılamadı")));
            string cikti;
            char buf[256];
            while (fgets(buf, sizeof(buf), pipe)) cikti += buf;
            pclose(pipe);
            return Val::makeResult(true, Val(cikti));
        }));

        // ortam_degiskeni(ad) → değeri döndürür
        globals->define("ortam_degiskeni", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(string(""));
            const char* v = getenv(args[0].str.c_str());
            if (!v) return Val(string(""));
            return Val(string(v));
        }));

        // cikis(kod) → programı sonlandır
        globals->define("cikis", Val::makeNative([](vector<Val> args) -> Val {
            int kod = args.empty() ? 0 : (int)args[0].num;
            exit(kod);
            return Val();
        }));

        // ── TARİH/SAAT BUILT-IN'LER ──

        // simdi() → Unix timestamp
        globals->define("simdi", Val::makeNative([](vector<Val> args) -> Val {
            return Val((double)time(nullptr));
        }));

        // tarih_bilgi() → [yil, ay, gun, saat, dakika, saniye]
        globals->define("tarih_bilgi", Val::makeNative([](vector<Val> args) -> Val {
            time_t t = time(nullptr);
            struct tm* tm_info = localtime(&t);
            auto lst = make_shared<ZedinList>();
            lst->elements.push_back(Val((double)(tm_info->tm_year + 1900)));
            lst->elements.push_back(Val((double)(tm_info->tm_mon + 1)));
            lst->elements.push_back(Val((double)tm_info->tm_mday));
            lst->elements.push_back(Val((double)tm_info->tm_hour));
            lst->elements.push_back(Val((double)tm_info->tm_min));
            lst->elements.push_back(Val((double)tm_info->tm_sec));
            return Val(lst);
        }));

        // sure_olc() → milisaniye cinsinden zaman
        globals->define("sure_olc", Val::makeNative([](vector<Val> args) -> Val {
            struct timespec ts;
            clock_gettime(CLOCK_MONOTONIC, &ts);
            return Val((double)(ts.tv_sec * 1000 + ts.tv_nsec / 1000000));
        }));

        // ── MATEMATİK BUILT-IN'LER ──

        // Sabitler
        globals->define("pi", Val(3.14159265358979323846));
        globals->define("e",  Val(2.71828182845904523536));
        globals->define("sonsuz", Val(1.0/0.0));

        // Trigonometri
        globals->define("sin", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(sin(args[0].num));
        }));
        globals->define("cos", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(cos(args[0].num));
        }));
        globals->define("tan", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(tan(args[0].num));
        }));
        globals->define("asin", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(asin(args[0].num));
        }));
        globals->define("acos", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(acos(args[0].num));
        }));
        globals->define("atan", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(atan(args[0].num));
        }));
        globals->define("atan2", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2) return Val(0.0);
            return Val(atan2(args[0].num, args[1].num));
        }));

        // Karekök ve üs
        globals->define("kok", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            if (args[0].num < 0) return Val(0.0);
            return Val(sqrt(args[0].num));
        }));
        globals->define("us", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2) return Val(0.0);
            return Val(pow(args[0].num, args[1].num));
        }));

        // Logaritma
        globals->define("log", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].num <= 0) return Val(0.0);
            return Val(log(args[0].num));
        }));
        globals->define("log10", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].num <= 0) return Val(0.0);
            return Val(log10(args[0].num));
        }));
        globals->define("log2", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].num <= 0) return Val(0.0);
            return Val(log2(args[0].num));
        }));

        // Yuvarlama
        globals->define("tavan", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(ceil(args[0].num));
        }));
        globals->define("taban", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(floor(args[0].num));
        }));
        globals->define("yuvarla", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(round(args[0].num));
        }));
        globals->define("mutlak_sayi", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(0.0);
            return Val(fabs(args[0].num));
        }));

        // Rastgele sayi
        globals->define("rastgele", Val::makeNative([](vector<Val> args) -> Val {
            static bool baslatildi = false;
            if (!baslatildi) { srand((unsigned)time(nullptr)); baslatildi = true; }
            if (args.size() >= 2) {
                int min = (int)args[0].num;
                int max = (int)args[1].num;
                return Val((double)(min + rand() % (max - min + 1)));
            }
            return Val((double)rand() / RAND_MAX);
        }));

        // oku_dosya(yol) → tamam(icerik) veya hata(mesaj)
        globals->define("oku_dosya", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val::makeResult(false, Val(string("dosya yolu gerekli")));
            string yol = args[0].str;
            ifstream f(yol);
            if (!f.is_open()) return Val::makeResult(false, Val(string("dosya acilamadi: " + yol)));
            stringstream buf; buf << f.rdbuf();
            return Val::makeResult(true, Val(buf.str()));
        }));

        // yaz_dosya(yol, icerik) → tamam veya hata
        globals->define("yaz_dosya", Val::makeNative([](vector<Val> args) -> Val {
            if (args.size() < 2) return Val::makeResult(false, Val(string("yol ve icerik gerekli")));
            ofstream f(args[0].str);
            if (!f.is_open()) return Val::makeResult(false, Val(string("dosya yazilamadi")));
            f << args[1].str;
            return Val::makeResult(true, Val(string("ok")));
        }));

        // tip(değer)
        globals->define("tip", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty()) return Val(string("bos"));
            switch (args[0].type) {
                case V_NUM:    return Val(string("sayi"));
                case V_BOOL:   return Val(string("mantik"));
                case V_STR:    return Val(string("metin"));
                case V_LIST:   return Val(string("liste"));
                case V_FUNC:   return Val(string("fonksiyon"));
                case V_RESULT: return Val(string("sonuc"));
                default:       return Val(string("bos"));
            }
        }));

        // --- SONUC (Result) sistemi ---

        // tamam(deger) → Ok sonucu oluştur
        globals->define("tamam", Val::makeNative([](vector<Val> args) -> Val {
            Val inner = args.empty() ? Val() : args[0];
            return Val::makeResult(true, inner);
        }));

        // hata(mesaj) → Err sonucu oluştur
        globals->define("hata", Val::makeNative([](vector<Val> args) -> Val {
            Val inner = args.empty() ? Val(string("bilinmeyen hata")) : args[0];
            return Val::makeResult(false, inner);
        }));

        // tamam_mi(sonuc) → true/false
        globals->define("tamam_mi", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].type != V_RESULT) return Val(false);
            return Val(args[0].result_ok);
        }));

        // hata_mi(sonuc) → true/false
        globals->define("hata_mi", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].type != V_RESULT) return Val(false);
            return Val(!args[0].result_ok);
        }));

        // deger_al(sonuc) → içindeki değeri al, hatalıysa bos döner
        globals->define("deger_al", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].type != V_RESULT) return Val();
            if (!args[0].result_ok) return Val();
            return *args[0].result_val;
        }));

        // mesaj_al(sonuc) → hata mesajını al
        globals->define("mesaj_al", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].type != V_RESULT) return Val(string("sonuc degil"));
            if (args[0].result_ok) return Val(string("hata yok"));
            return *args[0].result_val;
        }));

        // ac_ya_hata(sonuc) → tamam ise deger_al, hata ise program durur
        globals->define("ac_ya_hata", Val::makeNative([](vector<Val> args) -> Val {
            if (args.empty() || args[0].type != V_RESULT)
                throw ZedinError({}, "ac_ya_hata: gecersiz sonuc tipi");
            if (!args[0].result_ok)
                throw ZedinError({}, "ac_ya_hata patladı: " + args[0].result_val->toString());
            return *args[0].result_val;
        }));
    }

    // --- Statement yürütücü ---
    void execute(Stmt* s) {
        if (!s) return;

        if (auto st = dynamic_cast<ExprStmt*>(s)) {
            evaluate(st->expr.get());
        }
        else if (auto st = dynamic_cast<VarDecl*>(s)) {
            Val v = st->init ? evaluate(st->init.get()) : Val();
            env->define(st->name.lex, v);
        }
        else if (auto st = dynamic_cast<BlockStmt*>(s)) {
            auto prev = env;
            env = env->makeChild();
            try {
                for (auto& stmt : st->stmts) {
                    execute(stmt.get());
                }
            } catch (...) {
                env = prev;
                throw; // ReturnSignal, BreakSignal, ContinueSignal hepsi yukari tasiniyor
            }
            env = prev;
        }
        else if (auto st = dynamic_cast<IfStmt*>(s)) {
            if (evaluate(st->cond.get()).isTruthy())
                execute(st->thenBranch.get());
            else if (st->elseBranch)
                execute(st->elseBranch.get());
        }
        else if (auto st = dynamic_cast<WhileStmt*>(s)) {
            int guard = 0;
            while (evaluate(st->cond.get()).isTruthy()) {
                if (++guard > 1000000) throw ZedinError({}, "Sonsuz döngü koruması!");
                try { execute(st->body.get()); }
                catch (BreakSignal&) { break; }
                catch (ContinueSignal&) { continue; }
            }
        }
        else if (auto st = dynamic_cast<PrintStmt*>(s)) {
            for (size_t i = 0; i < st->args.size(); ++i) {
                cout << evaluate(st->args[i].get()).toString();
                if (i + 1 < st->args.size()) cout << " ";
            }
            cout << endl;
        }
        else if (auto st = dynamic_cast<FuncDecl*>(s)) {
            auto fn = make_shared<FuncDef>(st->params, shared_ptr<Stmt>(move(st->body)), env);
            env->define(st->name.lex, Val(fn));
        }
        else if (auto st = dynamic_cast<ReturnStmt*>(s)) {
            Val v = st->value ? evaluate(st->value.get()) : Val();
            throw ReturnSignal{v};
        }
        else if (dynamic_cast<BreakStmt*>(s)) {
            throw BreakSignal{};
        }
        else if (dynamic_cast<ContinueStmt*>(s)) {
            throw ContinueSignal{};
        }
        else if (auto st = dynamic_cast<ImportStmt*>(s)) {
            importFile(st->path, st->pos);
        }
    }

    // --- İfade değerlendirici ---
    Val evaluate(Expr* e) {
        if (!e) return Val();

        if (auto ex = dynamic_cast<LiteralExpr*>(e)) return ex->value;

        if (auto ex = dynamic_cast<VarExpr*>(e)) return env->get(ex->name);

        if (auto ex = dynamic_cast<AssignExpr*>(e)) {
            Val v = evaluate(ex->value.get());
            env->assign(ex->name, v);
            return v;
        }

        if (auto ex = dynamic_cast<UnaryExpr*>(e)) {
            Val right = evaluate(ex->right.get());
            if (ex->op.type == T_MINUS) return Val(-right.num);
            if (ex->op.type == T_BANG || ex->op.lex == "değil" || ex->op.lex == "degil" || ex->op.lex == "tugul")
                return Val(!right.isTruthy());
            return Val();
        }

        if (auto ex = dynamic_cast<BinaryExpr*>(e)) {
            // Kısa devre mantıksal operatörler
            if (ex->op.type == T_VE) {
                Val l = evaluate(ex->left.get());
                if (!l.isTruthy()) return Val(false);
                return Val(evaluate(ex->right.get()).isTruthy());
            }
            if (ex->op.type == T_VEYA) {
                Val l = evaluate(ex->left.get());
                if (l.isTruthy()) return Val(true);
                return Val(evaluate(ex->right.get()).isTruthy());
            }

            Val l = evaluate(ex->left.get());
            Val r = evaluate(ex->right.get());
            string op = ex->op.lex;

            if (op == "+") {
                if (l.type == V_STR || r.type == V_STR) return Val(l.toString() + r.toString());
                return Val(l.num + r.num);
            }
            if (op == "-") return Val(l.num - r.num);
            if (op == "*") return Val(l.num * r.num);
            if (op == "/") {
                if (r.num == 0) throw ZedinError(ex->op.pos, "Sıfıra bölme hatası!\n"
            "  İpucu: Bölmeden önce bölenin sıfır olup olmadığını kontrol edin.\n"
            "  Örnek: eger b != 0 { yaz a / b; }");
                return Val(l.num / r.num);
            }
            if (op == "%") return Val(fmod(l.num, r.num));
            if (op == "==") {
                if (l.type != r.type) return Val(false);
                if (l.type == V_NUM)  return Val(l.num == r.num);
                if (l.type == V_STR)  return Val(l.str == r.str);
                if (l.type == V_BOOL) return Val(l.boolean == r.boolean);
                return Val(false);
            }
            if (op == "!=") {
                if (l.type != r.type) return Val(true);
                if (l.type == V_NUM)  return Val(l.num != r.num);
                if (l.type == V_STR)  return Val(l.str != r.str);
                if (l.type == V_BOOL) return Val(l.boolean != r.boolean);
                return Val(true);
            }
            if (op == "<")  return Val(l.num < r.num);
            if (op == ">")  return Val(l.num > r.num);
            if (op == "<=") return Val(l.num <= r.num);
            if (op == ">=") return Val(l.num >= r.num);
            return Val();
        }

        if (auto ex = dynamic_cast<ListExpr*>(e)) {
            auto lst = make_shared<ZedinList>();
            for (auto& el : ex->elements)
                lst->elements.push_back(evaluate(el.get()));
            return Val(lst);
        }

        if (auto ex = dynamic_cast<IndexExpr*>(e)) {
            Val obj = evaluate(ex->obj.get());
            Val idx = evaluate(ex->index.get());
            if (obj.type == V_LIST) {
                int i = (int)idx.num;
                if (i < 0 || i >= (int)obj.list->elements.size())
                    throw ZedinError(ex->bracket.pos, "İndeks sınır dışı: " + to_string(i) + "\n"
                        "  Liste uzunluğu: " + to_string(obj.list->elements.size()) + "\n"
                        "  Geçerli aralık: 0 ile " + to_string((int)obj.list->elements.size()-1) + " arası");
                return obj.list->elements[i];
            }
            if (obj.type == V_STR) {
                int i = (int)idx.num;
                if (i < 0 || i >= (int)obj.str.size())
                    throw ZedinError(ex->bracket.pos, "İndeks sınır dışı: " + to_string(i) + "\n"
                        "  Metin uzunluğu: " + to_string(obj.str.size()) + "\n"
                        "  Geçerli aralık: 0 ile " + to_string((int)obj.str.size()-1) + " arası");
                return Val(string(1, obj.str[i]));
            }
            throw ZedinError(ex->bracket.pos, "İndekslenemez tip: '" + obj.toString() + "'\n"
            "  Yalnızca liste ve metin indekslenebilir.\n"
            "  İpucu: Değişkenin liste veya metin olduğundan emin olun.");
        }

        if (auto ex = dynamic_cast<IndexAssignExpr*>(e)) {
            Val obj = evaluate(ex->obj.get());
            Val idx = evaluate(ex->index.get());
            Val val = evaluate(ex->value.get());
            if (obj.type != V_LIST)
                throw ZedinError(ex->bracket.pos, "Sadece listeler atanabilir.");
            int i = (int)idx.num;
            if (i < 0 || i >= (int)obj.list->elements.size())
                throw ZedinError(ex->bracket.pos, "İndeks sınır dışı (atama).\n"
            "  İpucu: Listeye atama yaparken geçerli bir indeks kullanın.");
            obj.list->elements[i] = val;
            return val;
        }

        if (auto ex = dynamic_cast<CallExpr*>(e)) {
            Val callee = evaluate(ex->callee.get());
            vector<Val> args;
            for (auto& a : ex->args) args.push_back(evaluate(a.get()));

            if (callee.native) return callee.native(args);

            if (callee.func) {
                auto fn = callee.func;
                auto callEnv = make_shared<Environment>(fn->closure);
                for (size_t i = 0; i < fn->params.size(); ++i) {
                    Val arg = i < args.size() ? args[i] : Val();
                    callEnv->define(fn->params[i].lex, arg);
                }
                auto prev = env;
                env = callEnv;
                Val result;
                try { execute(fn->body.get()); }
                catch (ReturnSignal& r) { result = r.value; }
                env = prev;
                return result;
            }

            throw ZedinError(ex->paren.pos, "Çağrılabilir bir değer değil.\n"
            "  İpucu: Bu bir fonksiyon değil. 'fonk' ile tanımlanmış mı kontrol edin.\n"
            "  Örnek: fonk selam() { yaz \"merhaba\"; }");
        }

        return Val();
    }
};

// ============================================================
// 10. PARSER
// ============================================================
class Parser;

class Parser {
    vector<Token> tokens;
    int cur = 0;

    Token& peek(int offset = 0) { return tokens[min((int)tokens.size()-1, cur + offset)]; }
    Token& current() { return peek(0); }
    Token& previous() { return tokens[max(0, cur - 1)]; }

    bool isAtEnd() { return current().type == T_EOF; }

    Token advance() {
        if (!isAtEnd()) cur++;
        return previous();
    }

    bool check(TType t) { return !isAtEnd() && current().type == t; }

    bool match(initializer_list<TType> types) {
        for (auto t : types) {
            if (check(t)) { advance(); return true; }
        }
        return false;
    }

    Token consume(TType t, string msg) {
        if (check(t)) return advance();
        throw ZedinError(current().pos, msg + "\n  Alınan: '" + current().lex + "'\n  İpucu: Sözdizimi hatası, lütfen kodu kontrol edin.");
    }

public:
    Parser(vector<Token> t) : tokens(move(t)) {}

    vector<unique_ptr<Stmt>> parse() {
        vector<unique_ptr<Stmt>> stmts;
        while (!isAtEnd()) {
            auto s = declaration();
            if (s) stmts.push_back(move(s));
        }
        return stmts;
    }

private:
    // --- Statements ---
    unique_ptr<Stmt> declaration() {
        if (match({T_VAR}))  return varDecl();
        if (match({T_FONK})) return funcDecl();
        return statement();
    }

    unique_ptr<Stmt> varDecl() {
        Token name = consume(T_ID, "Değişken adı bekleniyor.");
        unique_ptr<Expr> init;
        if (match({T_EQ})) init = expression();
        if (check(T_SEMI)) advance();
        return make_unique<VarDecl>(name, move(init));
    }

    unique_ptr<Stmt> funcDecl() {
        Token name = consume(T_ID, "Fonksiyon adı bekleniyor.");
        consume(T_LP, "'(' bekleniyor.");
        vector<Token> params;
        if (!check(T_RP)) {
            do { params.push_back(consume(T_ID, "Parametre adı bekleniyor.")); }
            while (match({T_COMMA}));
        }
        consume(T_RP, "')' bekleniyor.");
        consume(T_LB, "'{' bekleniyor.");
        auto body = block();
        return make_unique<FuncDecl>(name, move(params), move(body));
    }

    unique_ptr<Stmt> statement() {
        if (match({T_EGER}))  return ifStmt();
        if (match({T_IKEN}))  return whileStmt();
        if (match({T_YAZ}))   return printStmt();
        if (match({T_DON}))   return returnStmt();
        if (match({T_AKTAR}))  {
            Token pos = previous();
            Token path = consume(T_STR, "içe_aktar: dosya yolu string olmalı.");
            if (check(T_SEMI)) advance();
            return make_unique<ImportStmt>(path.lit.str, pos.pos);
        }
        if (match({T_KIR}))   { if (check(T_SEMI)) advance(); return make_unique<BreakStmt>(); }
        if (match({T_DEVAM})) { if (check(T_SEMI)) advance(); return make_unique<ContinueStmt>(); }
        if (check(T_LB))      { advance(); return block(); }
        return exprStmt();
    }

    unique_ptr<Stmt> ifStmt() {
        auto cond = expression();
        consume(T_LB, "'{' bekleniyor (eğer).");
        auto thenB = block();
        unique_ptr<Stmt> elseB;
        if (match({T_YOKSA})) {
            if (check(T_LB)) { advance(); elseB = block(); }
            else elseB = statement();
        }
        return make_unique<IfStmt>(move(cond), move(thenB), move(elseB));
    }

    unique_ptr<Stmt> whileStmt() {
        auto cond = expression();
        consume(T_LB, "'{' bekleniyor (iken).");
        auto body = block();
        return make_unique<WhileStmt>(move(cond), move(body));
    }

    unique_ptr<Stmt> printStmt() {
        vector<unique_ptr<Expr>> args;
        args.push_back(expression());
        while (match({T_COMMA})) args.push_back(expression());
        if (check(T_SEMI)) advance();
        return make_unique<PrintStmt>(move(args));
    }

    unique_ptr<Stmt> returnStmt() {
        Token kw = previous();
        unique_ptr<Expr> val;
        if (!check(T_SEMI) && !check(T_RB) && !isAtEnd())
            val = expression();
        if (check(T_SEMI)) advance();
        return make_unique<ReturnStmt>(kw, move(val));
    }

    unique_ptr<Stmt> exprStmt() {
        auto e = expression();
        if (check(T_SEMI)) advance();
        return make_unique<ExprStmt>(move(e));
    }

    unique_ptr<Stmt> block() {
        vector<unique_ptr<Stmt>> stmts;
        while (!check(T_RB) && !isAtEnd()) stmts.push_back(declaration());
        consume(T_RB, "'}' bekleniyor.");
        return make_unique<BlockStmt>(move(stmts));
    }

    // --- Expressions (Pratt tarzı öncelik) ---
    unique_ptr<Expr> expression() { return assignment(); }

    unique_ptr<Expr> assignment() {
        auto e = logicOr();
        if (match({T_EQ})) {
            auto val = assignment();
            if (auto ve = dynamic_cast<VarExpr*>(e.get()))
                return make_unique<AssignExpr>(ve->name, move(val));
            if (auto ie = dynamic_cast<IndexExpr*>(e.get())) {
                return make_unique<IndexAssignExpr>(
                    move(ie->obj), move(ie->index), move(val), ie->bracket);
            }
            throw ZedinError(previous().pos, "Geçersiz atama hedefi.");
        }
        return e;
    }

    unique_ptr<Expr> logicOr() {
        auto e = logicAnd();
        while (match({T_VEYA})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, logicAnd());
        }
        return e;
    }

    unique_ptr<Expr> logicAnd() {
        auto e = equality();
        while (match({T_VE})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, equality());
        }
        return e;
    }

    unique_ptr<Expr> equality() {
        auto e = comparison();
        while (match({T_EQEQ, T_BANGEQ})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, comparison());
        }
        return e;
    }

    unique_ptr<Expr> comparison() {
        auto e = addition();
        while (match({T_GT, T_GTE, T_LT, T_LTE})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, addition());
        }
        return e;
    }

    unique_ptr<Expr> addition() {
        auto e = multiplication();
        while (match({T_PLUS, T_MINUS})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, multiplication());
        }
        return e;
    }

    unique_ptr<Expr> multiplication() {
        auto e = unary();
        while (match({T_STAR, T_SLASH, T_PERCENT})) {
            Token op = previous();
            e = make_unique<BinaryExpr>(move(e), op, unary());
        }
        return e;
    }

    unique_ptr<Expr> unary() {
        if (match({T_MINUS, T_BANG, T_DEGIL})) {
            Token op = previous();
            return make_unique<UnaryExpr>(op, unary());
        }
        return call();
    }

    unique_ptr<Expr> call() {
        auto e = primary();
        while (true) {
            if (match({T_LP})) {
                Token paren = previous();
                vector<unique_ptr<Expr>> args;
                if (!check(T_RP)) {
                    do { args.push_back(expression()); }
                    while (match({T_COMMA}));
                }
                consume(T_RP, "')' bekleniyor.");
                e = make_unique<CallExpr>(move(e), move(args), paren);
            }
            else if (match({T_LSQ})) {
                Token bracket = previous();
                auto idx = expression();
                consume(T_RSQ, "']' bekleniyor.");
                e = make_unique<IndexExpr>(move(e), move(idx), bracket);
            }
            else break;
        }
        return e;
    }

    unique_ptr<Expr> primary() {
        if (match({T_NUM})) return make_unique<LiteralExpr>(previous().lit);
        if (match({T_STR})) return make_unique<LiteralExpr>(previous().lit);
        if (match({T_TUZ})) return make_unique<LiteralExpr>(Val(true));
        if (match({T_TERS})) return make_unique<LiteralExpr>(Val(false));
        if (match({T_BOS})) return make_unique<LiteralExpr>(Val());
        if (match({T_ID})) return make_unique<VarExpr>(previous());
        if (match({T_LP})) {
            auto e = expression();
            consume(T_RP, "')' bekleniyor.");
            return e;
        }
        if (match({T_LSQ})) {
            vector<unique_ptr<Expr>> elements;
            if (!check(T_RSQ)) {
                do { elements.push_back(expression()); }
                while (match({T_COMMA}));
            }
            consume(T_RSQ, "']' bekleniyor.");
            return make_unique<ListExpr>(move(elements));
        }
        throw ZedinError(current().pos, "Beklenmeyen token: '" + current().lex + "'");
    }
};

// ============================================================
// 11. RUNNER (Ana yürütücü)
// ============================================================
// Dosyanin gercekten dosya oldugunu kontrol et (klasor degil)
bool gercekDosyaMu(const string& yol) {
    ifstream f(yol);
    if (!f.is_open()) return false;
    // Klasoru filtrele: bos olmayan ve okunabilir dosya
    f.seekg(0, ios::end);
    // Klasorler seekg sonrasi fail() verir
    return !f.fail();
}

// Arama yolları: önce yerel, sonra ~/.zedin/paketler/
string zedinModulBul(const string& path) {
    // 1. Direkt yol - sadece dosyaysa
    if (gercekDosyaMu(path)) return path;
    // 2. .zed uzantısı ekle
    {
        string p = path + ".zed";
        if (gercekDosyaMu(p)) return p;
    }
    // 3. ~/.zedin/paketler/paket.zed
    {
        const char* home = getenv("HOME");
        if (home) {
            string p = string(home) + "/.zedin/paketler/" + path + ".zed";
            ifstream f(p);
            if (f.is_open()) return p;
            // 4. ~/.zedin/paketler/paket/paket.zed
            p = string(home) + "/.zedin/paketler/" + path + "/" + path + ".zed";
            ifstream f2(p);
            if (f2.is_open()) return p;
        }
    }
    return ""; // Bulunamadı
}

// Interpreter::importFile implementasyonu (Parser tanımlandıktan sonra)
void Interpreter::importFile(const string& path, SourcePos pos) {
    string gercekYol = zedinModulBul(path);
    if (gercekYol.empty())
        throw ZedinError(pos, "Modül bulunamadı: '" + path + "'\n"
            "  Aranan yerler:\n"
            "  - " + path + "\n"
            "  - " + path + ".zed\n"
            "  - ~/.zedin/paketler/" + path + ".zed");
    ifstream file(gercekYol);
    stringstream buf; buf << file.rdbuf();
    Lexer lex(buf.str(), gercekYol);
    auto toks = lex.scan();
    Parser par(move(toks));
    auto stmts = par.parse();
    interpret(stmts);
}

void run(const string& source, const string& fileName, Interpreter& interp) {
    try {
        Lexer lexer(source, fileName);
        auto tokens = lexer.scan();

        Parser parser(move(tokens));
        auto stmts = parser.parse();

        interp.interpret(stmts);
    }
    catch (ZedinError& e) {
        cerr << RED << BOLD << "[Hata] " << e.pos.file << ":" << e.pos.line << " → " << e.what() << RESET << endl;
    }
    catch (exception& e) {
        cerr << RED << "[Sistem Hatası] " << e.what() << RESET << endl;
    }
}

// ============================================================
// 11.5 BYTECODE COMPILER
// ============================================================
// ============================================================
// COMPILER
// ============================================================
class BCompiler {
    shared_ptr<BChunk> chunk;
    int satirNo = 0;
    bool isGlobal = false;

public:
    BCompiler(const string& name = "<ana>", bool global = false)
        : isGlobal(global) {
        chunk = make_shared<BChunk>();
        chunk->name = name;
    }

    shared_ptr<BChunk> getChunk() { return chunk; }

    // ---- İfade derleme ----

    void derleExpr(Expr* e) {
        if (!e) { chunk->yazOp(OpCode::OP_BOS, satirNo); return; }

        if (auto ex = dynamic_cast<LiteralExpr*>(e)) {
            derleLiteral(ex->value);
            return;
        }
        if (auto ex = dynamic_cast<VarExpr*>(e)) {
            derleVarOku(ex->name.lex);
            return;
        }
        if (auto ex = dynamic_cast<AssignExpr*>(e)) {
            derleExpr(ex->value.get());
            derleVarYaz(ex->name.lex);
            return;
        }
        if (auto ex = dynamic_cast<UnaryExpr*>(e)) {
            derleExpr(ex->right.get());
            if (ex->op.lex == "-")
                chunk->yazOp(OpCode::OP_NEG, satirNo);
            else
                chunk->yazOp(OpCode::OP_DEGIL, satirNo);
            return;
        }
        if (auto ex = dynamic_cast<BinaryExpr*>(e)) {
            derleBinary(ex);
            return;
        }
        if (auto ex = dynamic_cast<CallExpr*>(e)) {
            derleCall(ex);
            return;
        }
        if (auto ex = dynamic_cast<ListExpr*>(e)) {
            for (auto& el : ex->elements) derleExpr(el.get());
            chunk->yazOpArg(OpCode::OP_LISTE, (int)ex->elements.size(), satirNo);
            return;
        }
        if (auto ex = dynamic_cast<IndexExpr*>(e)) {
            derleExpr(ex->obj.get());
            derleExpr(ex->index.get());
            chunk->yazOp(OpCode::OP_INDEKS_AL, satirNo);
            return;
        }
        if (auto ex = dynamic_cast<IndexAssignExpr*>(e)) {
            derleExpr(ex->obj.get());
            derleExpr(ex->index.get());
            derleExpr(ex->value.get());
            chunk->yazOp(OpCode::OP_INDEKS_ATA, satirNo);
            return;
        }
    }

    // ---- Statement derleme ----

    void derleStmt(Stmt* s) {
        if (!s) return;

        if (auto st = dynamic_cast<ExprStmt*>(s)) {
            derleExpr(st->expr.get());
            chunk->yazOp(OpCode::OP_POP, satirNo); // ifade sonucunu at
            return;
        }
        if (auto st = dynamic_cast<VarDecl*>(s)) {
            if (st->init) derleExpr(st->init.get());
            else chunk->yazOp(OpCode::OP_BOS, satirNo);
            if (isGlobal) {
                // Ana scope'ta global degisken
                int sidx = chunk->sabitEkle(BVal(st->name.lex));
                chunk->yazOpArg(OpCode::OP_TANI_GLOBAL, sidx, satirNo);
            } else {
                int idx = chunk->degiskenEkle(st->name.lex);
                chunk->yazOpArg(OpCode::OP_TANI, idx, satirNo);
            }
            return;
        }
        if (auto st = dynamic_cast<BlockStmt*>(s)) {
            for (auto& stmt : st->stmts) derleStmt(stmt.get());
            return;
        }
        if (auto st = dynamic_cast<PrintStmt*>(s)) {
            for (auto& arg : st->args) derleExpr(arg.get());
            chunk->yazOpArg(OpCode::OP_YAZ, (int)st->args.size(), satirNo);
            return;
        }
        if (auto st = dynamic_cast<IfStmt*>(s)) {
            derleIf(st);
            return;
        }
        if (auto st = dynamic_cast<WhileStmt*>(s)) {
            derleWhile(st);
            return;
        }
        if (auto st = dynamic_cast<FuncDecl*>(s)) {
            derleFonk(st);
            return;
        }
        if (auto st = dynamic_cast<ReturnStmt*>(s)) {
            if (st->value) {
                derleExpr(st->value.get());
                chunk->yazOp(OpCode::OP_DON, satirNo);
            } else {
                chunk->yazOp(OpCode::OP_DON_BOS, satirNo);
            }
            return;
        }
        if (dynamic_cast<BreakStmt*>(s)) {
            chunk->yazOp(OpCode::OP_KIR, satirNo);
            return;
        }
        if (dynamic_cast<ContinueStmt*>(s)) {
            chunk->yazOp(OpCode::OP_DEVAM, satirNo);
            return;
        }
    }

    // Tum programi derle
    void derleProgram(vector<unique_ptr<Stmt>>& stmts) {
        isGlobal = true;
        for (auto& s : stmts) derleStmt(s.get());
        chunk->yazOp(OpCode::OP_HALT, satirNo);
    }

private:
    // Literal değer
    void derleLiteral(const Val& v) {
        switch (v.type) {
            case V_NUM: {
                int idx = chunk->sabitEkle(BVal((double)v.num));
                chunk->yazOpArg(OpCode::OP_SAYI, idx, satirNo);
                break;
            }
            case V_STR: {
                int idx = chunk->sabitEkle(BVal(v.str));
                chunk->yazOpArg(OpCode::OP_METIN, idx, satirNo);
                break;
            }
            case V_BOOL:
                chunk->yazOp(v.boolean ? OpCode::OP_TUZ : OpCode::OP_TERS, satirNo);
                break;
            case V_NULL:
                chunk->yazOp(OpCode::OP_BOS, satirNo);
                break;
            default:
                chunk->yazOp(OpCode::OP_BOS, satirNo);
        }
    }

    // Değişken okuma
    void derleVarOku(const string& ad) {
        int idx = chunk->degiskenBul(ad);
        if (idx >= 0) {
            chunk->yazOpArg(OpCode::OP_YUKLE, idx, satirNo);
        } else {
            // Global degisken
            int sidx = chunk->sabitEkle(BVal(ad));
            chunk->yazOpArg(OpCode::OP_YUKLE_GLOBAL, sidx, satirNo);
        }
    }

    // Değişken yazma
    void derleVarYaz(const string& ad) {
        int idx = chunk->degiskenBul(ad);
        if (idx >= 0) {
            chunk->yazOpArg(OpCode::OP_SAKLA, idx, satirNo);
        } else {
            // Global degisken
            int sidx = chunk->sabitEkle(BVal(ad));
            chunk->yazOpArg(OpCode::OP_SAKLA_GLOBAL, sidx, satirNo);
        }
    }

    // Binary ifade
    void derleBinary(BinaryExpr* ex) {
        // Kısa devre: && ve ||
        if (ex->op.type == T_VE) {
            derleExpr(ex->left.get());
            int jumpPos = chunk->yazJumpPlaceholder(OpCode::OP_ATLA_YANLIS, satirNo);
            chunk->yazOp(OpCode::OP_POP, satirNo);
            derleExpr(ex->right.get());
            chunk->jumpDoldur(jumpPos, (int)chunk->code.size());
            return;
        }
        if (ex->op.type == T_VEYA) {
            derleExpr(ex->left.get());
            int jumpPos = chunk->yazJumpPlaceholder(OpCode::OP_ATLA_DOGRU, satirNo);
            chunk->yazOp(OpCode::OP_POP, satirNo);
            derleExpr(ex->right.get());
            chunk->jumpDoldur(jumpPos, (int)chunk->code.size());
            return;
        }

        derleExpr(ex->left.get());
        derleExpr(ex->right.get());

        string op = ex->op.lex;
        if      (op == "+")  chunk->yazOp(OpCode::OP_TOPLA, satirNo);
        else if (op == "-")  chunk->yazOp(OpCode::OP_CIKAR, satirNo);
        else if (op == "*")  chunk->yazOp(OpCode::OP_CARP,  satirNo);
        else if (op == "/")  chunk->yazOp(OpCode::OP_BOL,   satirNo);
        else if (op == "%")  chunk->yazOp(OpCode::OP_MOD,   satirNo);
        else if (op == "==") chunk->yazOp(OpCode::OP_ESIT,       satirNo);
        else if (op == "!=") chunk->yazOp(OpCode::OP_ESIT_DEGIL, satirNo);
        else if (op == ">")  chunk->yazOp(OpCode::OP_BUYUK,      satirNo);
        else if (op == "<")  chunk->yazOp(OpCode::OP_KUCUK,      satirNo);
        else if (op == ">=") chunk->yazOp(OpCode::OP_BUYUK_ESIT, satirNo);
        else if (op == "<=") chunk->yazOp(OpCode::OP_KUCUK_ESIT, satirNo);
    }

    // Fonksiyon çağrısı
    void derleCall(CallExpr* ex) {
        derleExpr(ex->callee.get());
        for (auto& arg : ex->args) derleExpr(arg.get());
        chunk->yazOpArg(OpCode::OP_CAGIR, (int)ex->args.size(), satirNo);
    }

    // if/else
    void derleIf(IfStmt* st) {
        derleExpr(st->cond.get());
        int thenJump = chunk->yazJumpPlaceholder(OpCode::OP_ATLA_YANLIS, satirNo);

        derleStmt(st->thenBranch.get());

        if (st->elseBranch) {
            int elseJump = chunk->yazJumpPlaceholder(OpCode::OP_ATLA, satirNo);
            chunk->jumpDoldur(thenJump, (int)chunk->code.size());
            derleStmt(st->elseBranch.get());
            chunk->jumpDoldur(elseJump, (int)chunk->code.size());
        } else {
            chunk->jumpDoldur(thenJump, (int)chunk->code.size());
        }
    }

    // while döngüsü
    void derleWhile(WhileStmt* st) {
        int loopStart = (int)chunk->code.size();
        derleExpr(st->cond.get());
        int exitJump = chunk->yazJumpPlaceholder(OpCode::OP_ATLA_YANLIS, satirNo);
        derleStmt(st->body.get());
        // Döngü başına dön
        int backOffset = loopStart - (int)chunk->code.size() - 3;
        chunk->yazOpArg(OpCode::OP_ATLA, backOffset, satirNo);
        chunk->jumpDoldur(exitJump, (int)chunk->code.size());
    }

    // Fonksiyon tanımı
    void derleFonk(FuncDecl* st) {
        // Alt compiler oluştur
        BCompiler subCompiler(st->name.lex, false);
        subCompiler.chunk->paramSayisi = (int)st->params.size();
        subCompiler.chunk->params.reserve(st->params.size());

        for (auto& p : st->params) {
            subCompiler.chunk->params.push_back(p.lex);
            subCompiler.chunk->degiskenEkle(p.lex);
        }

        // Fonksiyon gövdesini derle
        if (auto blk = dynamic_cast<BlockStmt*>(st->body.get())) {
            for (auto& s : blk->stmts) subCompiler.derleStmt(s.get());
        }
        subCompiler.chunk->yazOp(OpCode::OP_DON_BOS, 0);

        // Fonksiyon chunk'ını sabit olarak ekle
        auto fnChunk = subCompiler.getChunk();
        int idx = chunk->sabitEkle(BVal(fnChunk));
        chunk->yazOpArg(OpCode::OP_SAYI, idx, satirNo);

        // Fonksiyonu değişken olarak sakla
        int vidx = chunk->degiskenEkle(st->name.lex);
        chunk->yazOpArg(OpCode::OP_TANI, vidx, satirNo);
    }
};

// ============================================================
// 11.5 VM MODU — Bytecode ile calistir
// ============================================================
void runVM(const string& source, const string& fileName, BVM& vm) {
    try {
        Lexer lexer(source, fileName);
        auto tokens = lexer.scan();
        Parser parser(move(tokens));
        auto stmts = parser.parse();

        BCompiler compiler("<ana>");
        compiler.derleProgram(stmts);
        auto chunk = compiler.getChunk();

        // Debug: bytecode goster
        // chunk->disassemble();

        vm.calistir(chunk);
    }
    catch (ZedinError& e) {
        cerr << RED << BOLD << "[Hata] " << e.pos.file << ":" << e.pos.line
             << " -> " << e.what() << RESET << endl;
    }
    catch (exception& e) {
        cerr << RED << "[VM Hatasi] " << e.what() << RESET << endl;
    }
}

// ============================================================
// 12. MAIN — REPL + DOSYA MODU
// ============================================================
int main(int argc, char* argv[]) {
    Interpreter interp;

    // stdlib.zed otomatik yükleme
    {
        ifstream stdlib("stdlib.zed");
        if (stdlib.is_open()) {
            stringstream buf;
            buf << stdlib.rdbuf();
            run(buf.str(), "stdlib.zed", interp);
        }
    }

    // VM modu: zedin --vm dosya.zed
    if (argc >= 3 && string(argv[1]) == "--vm") {
        BVM vm;
        ifstream file(argv[2]);
        if (!file.is_open()) {
            cerr << RED << "Dosya açılamadı: " << argv[2] << RESET << endl;
            return 1;
        }
        stringstream buf; buf << file.rdbuf();
        runVM(buf.str(), argv[2], vm);
        return 0;
    }

    // Derleme modu: zedin --derle dosya.zed → dosya.zedc
    if (argc >= 3 && string(argv[1]) == "--derle") {
        string kaynak = argv[2];
        ifstream file(kaynak);
        if (!file.is_open()) {
            cerr << RED << "Dosya açılamadı: " << kaynak << RESET << endl;
            return 1;
        }
        stringstream buf; buf << file.rdbuf();
        try {
            Lexer lexer(buf.str(), kaynak);
            auto tokens = lexer.scan();
            Parser parser(move(tokens));
            auto stmts = parser.parse();
            BCompiler compiler("<ana>", true);
            compiler.derleProgram(stmts);
            auto chunk = compiler.getChunk();
            // .zedc uzantısı oluştur
            string cikti = kaynak;
            size_t nokta = cikti.rfind('.');
            if (nokta != string::npos) cikti = cikti.substr(0, nokta);
            cikti += ".zedc";
            chunk->kaydetDosya(cikti);
            cout << GREEN << "Derlendi: " << cikti << RESET << endl;
        } catch (ZedinError& e) {
            cerr << RED << "[Hata] " << e.what() << RESET << endl;
            return 1;
        }
        return 0;
    }

    // Bytecode çalıştırma: zedin dosya.zedc
    if (argc >= 2 && string(argv[1]).size() > 5 &&
        string(argv[1]).substr(string(argv[1]).size()-5) == ".zedc") {
        try {
            auto chunk = BChunk::yukleDosya(argv[1]);
            BVM vm;
            vm.calistir(chunk);
        } catch (exception& e) {
            cerr << RED << "[VM Hatası] " << e.what() << RESET << endl;
            return 1;
        }
        return 0;
    }

    if (argc >= 2) {
        // Dosya modu
        ifstream file(argv[1]);
        if (!file.is_open()) {
            cerr << RED << "Dosya açılamadı: " << argv[1] << RESET << endl;
            return 1;
        }
        stringstream buf;
        buf << file.rdbuf();
        run(buf.str(), argv[1], interp);
    } else {
        // REPL modu
        cout << CYAN << BOLD;
        cout << "  ███████╗███████╗██████╗ ██╗███╗   ██╗" << endl;
        cout << "  ╚══███╔╝██╔════╝██╔══██╗██║████╗  ██║" << endl;
        cout << "    ███╔╝ █████╗  ██║  ██║██║██╔██╗ ██║" << endl;
        cout << "   ███╔╝  ██╔══╝  ██║  ██║██║██║╚██╗██║" << endl;
        cout << "  ███████╗███████╗██████╔╝██║██║ ╚████║" << endl;
        cout << "  ╚══════╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═══╝" << RESET << endl;
        cout << YELLOW << "  v4.0 | Kadim + Modern Türkçe | 2026" << RESET << endl;
        cout << "  Çıkmak için: çık | Yardım: yardım" << endl;
        cout << "─────────────────────────────────────────" << endl;

        string line, block;
        int depth = 0;

        while (true) {
            cout << (depth == 0 ? GREEN "zedin> " RESET : YELLOW "  ...  " RESET);
            if (!getline(cin, line)) break;

            string trimmed = line;
            size_t s = trimmed.find_first_not_of(" \t");
            if (s != string::npos) trimmed = trimmed.substr(s);

            if (trimmed == "çık" || trimmed == "cik" || trimmed == "exit") break;
            if (trimmed == "yardım" || trimmed == "yardim") {
                cout << CYAN
                     << "  değişken x = 5;          → değişken tanımla\n"
                     << "  yaz x;                   → ekrana yaz\n"
                     << "  eğer x > 3 { yaz tüz; }  → koşul\n"
                     << "  iken x > 0 { x = x - 1; }→ döngü\n"
                     << "  fonk topla(a, b) { dön a + b; }\n"
                     << "  değişken l = [1, 2, 3];  → liste\n"
                     << "  uzunluk(l)               → liste uzunluğu\n"
                     << "  oku(\"İsmin: \")           → girdi al\n"
                     << RESET;
                continue;
            }

            block += line + "\n";
            for (char c : line) {
                if (c == '{') depth++;
                if (c == '}') depth--;
            }

            if (depth <= 0) {
                if (!block.empty() && block.find_first_not_of(" \t\n") != string::npos)
                    run(block, "<repl>", interp);
                block.clear();
                depth = 0;
            }
        }

        cout << endl << YELLOW << "Zedin kapanıyor. Görüşürüz!" << RESET << endl;
    }

    return 0;
}

