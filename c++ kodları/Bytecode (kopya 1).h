#pragma once
/*
 * ZEDİN Bytecode VM
 * Stack tabanlı sanal makine
 * Her Chunk bir fonksiyonun veya programin bytecode blogu
 */

#include <vector>
#include <string>
#include <variant>
#include <memory>
#include <iostream>
#include <unordered_map>
#include <functional>
#include <cmath>

using namespace std;

// ============================================================
// 1. OPCODE TANIMI
// ============================================================
enum class OpCode : uint8_t {
    // Sabit yukleme
    OP_SAYI,        // [indeks] → sabitler[indeks] yükle
    OP_METIN,       // [indeks] → sabitler[indeks] yükle
    OP_TUZ,         // true yükle
    OP_TERS,        // false yükle
    OP_BOS,         // null yükle

    // Değişken
    OP_YUKLE,       // [indeks] → değişken adı sabitler[indeks], değeri yükle
    OP_SAKLA,       // [indeks] → stack'ten al, değişkene yaz
    OP_TANI,        // [indeks] → yeni değişken tanımla (degisken x = ...)

    // Aritmetik
    OP_TOPLA,
    OP_CIKAR,
    OP_CARP,
    OP_BOL,
    OP_MOD,
    OP_NEG,         // tekli eksi (-x)

    // Karşılaştırma
    OP_ESIT,
    OP_ESIT_DEGIL,
    OP_BUYUK,
    OP_KUCUK,
    OP_BUYUK_ESIT,
    OP_KUCUK_ESIT,

    // Mantık
    OP_VE,
    OP_VEYA,
    OP_DEGIL,

    // Liste
    OP_LISTE,       // [n] → stack'ten n eleman al, liste oluştur
    OP_INDEKS_AL,   // liste[i]
    OP_INDEKS_ATA,  // liste[i] = x

    // Kontrol akışı
    OP_ATLA,        // [offset] → koşulsuz jump
    OP_ATLA_YANLIS, // [offset] → stack'ten pop, false ise jump
    OP_ATLA_DOGRU,  // [offset] → stack'ten pop, true ise jump (&&, || için)

    // Fonksiyon
    OP_CAGIR,       // [argc] → argc argüman + fonksiyon stackte
    OP_DON,         // return değeri stackte
    OP_DON_BOS,     // return (değersiz)

    // Döngü kontrolü
    OP_KIR,         // break
    OP_DEVAM,       // continue

    // Global degisken
    OP_YUKLE_GLOBAL,  // [indeks] → globals map'ten al
    OP_SAKLA_GLOBAL,  // [indeks] → globals map'e yaz
    OP_TANI_GLOBAL,   // [indeks] → globals map'e tanimla

    // Diğer
    OP_YAZ,         // [argc] → argc argüman yazdır
    OP_POP,         // stack'ten at
    OP_KOPYALA,     // stack'in tepesini kopyala
    OP_HALT,        // program sonu
};

// ============================================================
// 2. BYTECODE DEĞERİ (VM Val)
// ============================================================
struct BVal;
struct BChunk;
struct BNativeFn;

using BNativeFunc = function<BVal(vector<BVal>)>;

struct BVal {
    enum Type { NUM, BOOL, STR, LIST, FUNC, NATIVE, NIL, RESULT } type = NIL;

    double      num    = 0;
    bool        boolean= false;
    string      str;
    shared_ptr<vector<BVal>>  list;
    shared_ptr<BChunk>        func;
    shared_ptr<BNativeFunc>   native;
    // Result için
    bool        result_ok = false;
    shared_ptr<BVal> result_val;

    // Constructorlar
    BVal() : type(NIL) {}
    explicit BVal(double v)           : type(NUM),  num(v) {}
    explicit BVal(bool v)             : type(BOOL), boolean(v) {}
    explicit BVal(string v)           : type(STR),  str(move(v)) {}
    explicit BVal(shared_ptr<vector<BVal>> v) : type(LIST), list(v) {}
    explicit BVal(shared_ptr<BChunk> v)       : type(FUNC), func(v) {}
    explicit BVal(shared_ptr<BNativeFunc> v)  : type(NATIVE), native(v) {}

    static BVal makeResult(bool ok, BVal inner) {
        BVal v; v.type = RESULT; v.result_ok = ok;
        v.result_val = make_shared<BVal>(inner); return v;
    }

    bool isTruthy() const {
        switch (type) {
            case BOOL: return boolean;
            case NUM:  return num != 0;
            case STR:  return !str.empty();
            case NIL:  return false;
            default:   return true;
        }
    }

    string toString() const {
        switch (type) {
            case NUM: {
                string s = to_string(num);
                s.erase(s.find_last_not_of('0') + 1);
                if (!s.empty() && s.back() == '.') s.pop_back();
                return s;
            }
            case BOOL:   return boolean ? "tüz" : "ters";
            case STR:    return str;
            case NIL:    return "boş";
            case FUNC:   return "<fonksiyon>";
            case NATIVE: return "<yerleşik>";
            case RESULT: return result_ok
                ? "tamam(" + result_val->toString() + ")"
                : "hata(" + result_val->toString() + ")";
            case LIST: {
                string r = "[";
                for (size_t i = 0; i < list->size(); ++i)
                    r += (*list)[i].toString() + (i+1 < list->size() ? ", " : "");
                return r + "]";
            }
        }
        return "?";
    }

    bool operator==(const BVal& o) const {
        if (type != o.type) return false;
        switch (type) {
            case NUM:  return num == o.num;
            case BOOL: return boolean == o.boolean;
            case STR:  return str == o.str;
            case NIL:  return true;
            default:   return false;
        }
    }
    bool operator!=(const BVal& o) const { return !(*this == o); }
};

// ============================================================
// 3. CHUNK — Bytecode blogu
// ============================================================
struct BChunk {
    string name;                    // Fonksiyon adı veya "<ana>"
    vector<uint8_t> code;           // Bytecode talimatları
    vector<BVal>    sabitler;       // Sabit havuzu
    vector<string>  degiskenler;    // Değişken adları (lokal)
    vector<int>     satirlar;       // Hata ayıklama için satır numaraları
    int             paramSayisi = 0;// Fonksiyon parametre sayısı
    vector<string>  params;         // Parametre adları

    // Sabit ekle, indeks döndür
    int sabitEkle(BVal val) {
        sabitler.push_back(val);
        return (int)sabitler.size() - 1;
    }

    // Değişken adı ekle, indeks döndür
    int degiskenEkle(const string& ad) {
        for (int i = 0; i < (int)degiskenler.size(); i++)
            if (degiskenler[i] == ad) return i;
        degiskenler.push_back(ad);
        return (int)degiskenler.size() - 1;
    }

    int degiskenBul(const string& ad) const {
        for (int i = 0; i < (int)degiskenler.size(); i++)
            if (degiskenler[i] == ad) return i;
        return -1;
    }

    // Byte ekle
    void yaz(uint8_t byte, int satir = 0) {
        code.push_back(byte);
        satirlar.push_back(satir);
    }

    void yazOp(OpCode op, int satir = 0) {
        yaz((uint8_t)op, satir);
    }

    void yazOpArg(OpCode op, int arg, int satir = 0) {
        yaz((uint8_t)op, satir);
        yaz((uint8_t)(arg & 0xFF), satir);
        yaz((uint8_t)((arg >> 8) & 0xFF), satir);
    }

    // Jump için placeholder yaz, sonra doldur
    int yazJumpPlaceholder(OpCode op, int satir = 0) {
        yaz((uint8_t)op, satir);
        yaz(0xFF, satir);
        yaz(0xFF, satir);
        return (int)code.size() - 2; // Placeholder konumu
    }

    void jumpDoldur(int placeholder, int hedef) {
        int offset = hedef - (placeholder + 2);
        code[placeholder]     = (uint8_t)(offset & 0xFF);
        code[placeholder + 1] = (uint8_t)((offset >> 8) & 0xFF);
    }

    // Bytecode'u okunaklı yazdır (debug)
    void disassemble() const {
        cout << "=== Chunk: " << name << " ===" << endl;
        int i = 0;
        while (i < (int)code.size()) {
            cout << setw(4) << i << " ";
            OpCode op = (OpCode)code[i++];
            switch (op) {
                case OpCode::OP_SAYI:
                case OpCode::OP_METIN: {
                    int idx = code[i] | (code[i+1] << 8); i += 2;
                    cout << (op == OpCode::OP_SAYI ? "OP_SAYI" : "OP_METIN")
                         << " [" << idx << "] = " << sabitler[idx].toString() << endl;
                    break;
                }
                case OpCode::OP_YUKLE:
                case OpCode::OP_SAKLA:
                case OpCode::OP_TANI: {
                    int idx = code[i] | (code[i+1] << 8); i += 2;
                    string opName = op == OpCode::OP_YUKLE ? "OP_YUKLE" :
                                    op == OpCode::OP_SAKLA ? "OP_SAKLA" : "OP_TANI";
                    cout << opName << " [" << idx << "] = ";
                    if (idx < (int)degiskenler.size()) cout << degiskenler[idx];
                    cout << endl;
                    break;
                }
                case OpCode::OP_ATLA:
                case OpCode::OP_ATLA_YANLIS:
                case OpCode::OP_ATLA_DOGRU: {
                    int offset = (int8_t)code[i] | (code[i+1] << 8); i += 2;
                    string opName = op == OpCode::OP_ATLA ? "OP_ATLA" :
                                    op == OpCode::OP_ATLA_YANLIS ? "OP_ATLA_YANLIS" : "OP_ATLA_DOGRU";
                    cout << opName << " → " << (i + offset) << endl;
                    break;
                }
                case OpCode::OP_CAGIR:
                case OpCode::OP_LISTE:
                case OpCode::OP_YAZ: {
                    int argc = code[i] | (code[i+1] << 8); i += 2;
                    string opName = op == OpCode::OP_CAGIR ? "OP_CAGIR" :
                                    op == OpCode::OP_LISTE ? "OP_LISTE" : "OP_YAZ";
                    cout << opName << " argc=" << argc << endl;
                    break;
                }
                #define SIMPLE(name) case OpCode::name: cout << #name << endl; break;
                SIMPLE(OP_TUZ) SIMPLE(OP_TERS) SIMPLE(OP_BOS)
                SIMPLE(OP_TOPLA) SIMPLE(OP_CIKAR) SIMPLE(OP_CARP)
                SIMPLE(OP_BOL) SIMPLE(OP_MOD) SIMPLE(OP_NEG)
                SIMPLE(OP_ESIT) SIMPLE(OP_ESIT_DEGIL)
                SIMPLE(OP_BUYUK) SIMPLE(OP_KUCUK)
                SIMPLE(OP_BUYUK_ESIT) SIMPLE(OP_KUCUK_ESIT)
                SIMPLE(OP_VE) SIMPLE(OP_VEYA) SIMPLE(OP_DEGIL)
                SIMPLE(OP_INDEKS_AL) SIMPLE(OP_INDEKS_ATA)
                SIMPLE(OP_DON) SIMPLE(OP_DON_BOS)
                SIMPLE(OP_KIR) SIMPLE(OP_DEVAM)
                SIMPLE(OP_POP) SIMPLE(OP_KOPYALA) SIMPLE(OP_HALT)
                #undef SIMPLE
                default: cout << "BILINMEYEN(" << (int)code[i-1] << ")" << endl;
            }
        }
    }

    // ---- BYTECODE KAYDET / YUKLE (.zedc) ----

    void yaz8(ofstream& f, uint8_t v)  { f.write((char*)&v, 1); }
    void yaz16(ofstream& f, uint16_t v){ f.write((char*)&v, 2); }
    void yaz32(ofstream& f, uint32_t v){ f.write((char*)&v, 4); }
    void yaz64(ofstream& f, double v)  { f.write((char*)&v, 8); }
    void yazStr(ofstream& f, const string& s) {
        uint16_t len = s.size();
        yaz16(f, len);
        f.write(s.c_str(), len);
    }

    void kaydet(ofstream& f) const {
        // Chunk adi
        uint16_t adLen = name.size();
        f.write((char*)&adLen, 2);
        f.write(name.c_str(), adLen);

        // paramSayisi
        uint8_t ps = paramSayisi;
        f.write((char*)&ps, 1);

        // Parametre adlari
        uint8_t paramCount = params.size();
        f.write((char*)&paramCount, 1);
        for (auto& p : params) {
            uint16_t len = p.size();
            f.write((char*)&len, 2);
            f.write(p.c_str(), len);
        }

        // Degisken adlari
        uint16_t degCount = degiskenler.size();
        f.write((char*)&degCount, 2);
        for (auto& d : degiskenler) {
            uint16_t len = d.size();
            f.write((char*)&len, 2);
            f.write(d.c_str(), len);
        }

        // Sabitler
        uint16_t sabitCount = sabitler.size();
        f.write((char*)&sabitCount, 2);
        for (auto& s : sabitler) {
            uint8_t tip = (uint8_t)s.type;
            f.write((char*)&tip, 1);
            switch (s.type) {
                case BVal::NUM:
                    f.write((char*)&s.num, 8);
                    break;
                case BVal::STR: {
                    uint16_t len = s.str.size();
                    f.write((char*)&len, 2);
                    f.write(s.str.c_str(), len);
                    break;
                }
                case BVal::BOOL: {
                    uint8_t b = s.boolean ? 1 : 0;
                    f.write((char*)&b, 1);
                    break;
                }
                case BVal::FUNC:
                    s.func->kaydet(f); // Recursive
                    break;
                default: break;
            }
        }

        // Bytecode
        uint32_t codeSize = code.size();
        f.write((char*)&codeSize, 4);
        f.write((char*)code.data(), codeSize);
    }

    void kaydetDosya(const string& dosyaAdi) const {
        ofstream f(dosyaAdi, ios::binary);
        if (!f.is_open()) throw runtime_error("Dosya açılamadı: " + dosyaAdi);
        // Magic + versiyon
        f.write("ZEDC", 4);
        uint8_t v = 1; f.write((char*)&v, 1);
        kaydet(f);
    }

    static shared_ptr<BChunk> yukle(ifstream& f) {
        auto chunk = make_shared<BChunk>();

        uint16_t adLen; f.read((char*)&adLen, 2);
        chunk->name.resize(adLen); f.read(&chunk->name[0], adLen);

        uint8_t ps; f.read((char*)&ps, 1);
        chunk->paramSayisi = ps;

        uint8_t paramCount; f.read((char*)&paramCount, 1);
        for (int i = 0; i < paramCount; i++) {
            uint16_t len; f.read((char*)&len, 2);
            string s(len, 0); f.read(&s[0], len);
            chunk->params.push_back(s);
        }

        uint16_t degCount; f.read((char*)&degCount, 2);
        for (int i = 0; i < degCount; i++) {
            uint16_t len; f.read((char*)&len, 2);
            string s(len, 0); f.read(&s[0], len);
            chunk->degiskenler.push_back(s);
        }

        uint16_t sabitCount; f.read((char*)&sabitCount, 2);
        for (int i = 0; i < sabitCount; i++) {
            uint8_t tip; f.read((char*)&tip, 1);
            switch ((BVal::Type)tip) {
                case BVal::NUM: {
                    double num; f.read((char*)&num, 8);
                    chunk->sabitler.push_back(BVal(num));
                    break;
                }
                case BVal::STR: {
                    uint16_t len; f.read((char*)&len, 2);
                    string s(len, 0); f.read(&s[0], len);
                    chunk->sabitler.push_back(BVal(s));
                    break;
                }
                case BVal::BOOL: {
                    uint8_t b; f.read((char*)&b, 1);
                    chunk->sabitler.push_back(BVal(b != 0));
                    break;
                }
                case BVal::FUNC: {
                    auto sub = BChunk::yukle(f);
                    chunk->sabitler.push_back(BVal(sub));
                    break;
                }
                default:
                    chunk->sabitler.push_back(BVal());
                    break;
            }
        }

        uint32_t codeSize; f.read((char*)&codeSize, 4);
        chunk->code.resize(codeSize);
        f.read((char*)chunk->code.data(), codeSize);

        return chunk;
    }

    static shared_ptr<BChunk> yukleDosya(const string& dosyaAdi) {
        ifstream f(dosyaAdi, ios::binary);
        if (!f.is_open()) throw runtime_error("Dosya açılamadı: " + dosyaAdi);
        char magic[4]; f.read(magic, 4);
        if (string(magic, 4) != "ZEDC")
            throw runtime_error("Geçersiz .zedc dosyası!");
        uint8_t v; f.read((char*)&v, 1);
        return BChunk::yukle(f);
    }
};

// ============================================================
// 4. CALL FRAME — Fonksiyon çağrı çerçevesi
// ============================================================
struct CallFrame {
    shared_ptr<BChunk> chunk;
    int ip = 0;                         // Instruction pointer
    vector<BVal> locals;                // Lokal değişkenler
    int stackBase = 0;                  // Stack'teki başlangıç konumu

    CallFrame(shared_ptr<BChunk> c, int base)
        : chunk(c), ip(0), stackBase(base) {
        locals.resize(c->degiskenler.size());
    }

    uint8_t oku() { return chunk->code[ip++]; }

    int okuArg() {
        int lo = oku();
        int hi = oku();
        return lo | (hi << 8);
    }

    int okuJump() {
        int lo = (int8_t)oku();
        int hi = oku();
        return lo | (hi << 8);
    }
};

// ============================================================
// 5. VM — Sanal makine
// ============================================================
struct BreakException  {};
struct ContinueException {};
struct ReturnException { BVal value; };

class BVM {
    vector<BVal>       stack;
    vector<CallFrame>  frames;
    unordered_map<string, BVal> globals;

public:
    BVM() { registerBuiltins(); }

    void registerBuiltins() {
        // yaz
        globals["yaz"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            for (size_t i = 0; i < args.size(); ++i)
                cout << args[i].toString() << (i+1 < args.size() ? " " : "");
            cout << endl;
            return BVal();
        }));

        // uzunluk
        globals["uzunluk"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty()) return BVal(0.0);
            if (args[0].type == BVal::STR)  return BVal((double)args[0].str.size());
            if (args[0].type == BVal::LIST) return BVal((double)args[0].list->size());
            return BVal(0.0);
        }));

        // ekle
        globals["ekle"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.size() >= 2 && args[0].type == BVal::LIST)
                args[0].list->push_back(args[1]);
            return BVal();
        }));

        // cikar
        globals["cikar"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.size() >= 2 && args[0].type == BVal::LIST) {
                int i = (int)args[1].num;
                auto& l = *args[0].list;
                if (i >= 0 && i < (int)l.size()) l.erase(l.begin() + i);
            }
            return BVal();
        }));

        // sayiya
        globals["sayiya"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty()) return BVal(0.0);
            if (args[0].type == BVal::NUM) return args[0];
            if (args[0].type == BVal::STR) {
                try { return BVal(stod(args[0].str)); } catch (...) {}
            }
            return BVal(0.0);
        }));

        // metine
        globals["metine"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty()) return BVal(string(""));
            return BVal(args[0].toString());
        }));

        // oku
        globals["oku"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (!args.empty()) cout << args[0].toString();
            string line; getline(cin, line);
            return BVal(line);
        }));

        // tip
        globals["tip"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty()) return BVal(string("bos"));
            switch (args[0].type) {
                case BVal::NUM:    return BVal(string("sayi"));
                case BVal::BOOL:   return BVal(string("mantik"));
                case BVal::STR:    return BVal(string("metin"));
                case BVal::LIST:   return BVal(string("liste"));
                case BVal::FUNC:
                case BVal::NATIVE: return BVal(string("fonksiyon"));
                case BVal::RESULT: return BVal(string("sonuc"));
                default:           return BVal(string("bos"));
            }
        }));

        // tamam / hata / tamam_mi / hata_mi / deger_al / mesaj_al
        globals["tamam"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            return BVal::makeResult(true, args.empty() ? BVal() : args[0]);
        }));
        globals["hata"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            BVal msg = args.empty() ? BVal(string("bilinmeyen hata")) : args[0];
            return BVal::makeResult(false, msg);
        }));
        globals["tamam_mi"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty() || args[0].type != BVal::RESULT) return BVal(false);
            return BVal(args[0].result_ok);
        }));
        globals["hata_mi"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty() || args[0].type != BVal::RESULT) return BVal(false);
            return BVal(!args[0].result_ok);
        }));
        globals["deger_al"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty() || args[0].type != BVal::RESULT || !args[0].result_ok) return BVal();
            return *args[0].result_val;
        }));
        globals["mesaj_al"] = BVal(make_shared<BNativeFunc>([](vector<BVal> args) -> BVal {
            if (args.empty() || args[0].type != BVal::RESULT) return BVal(string("sonuc degil"));
            if (args[0].result_ok) return BVal(string("hata yok"));
            return *args[0].result_val;
        }));
    }

    // Stack işlemleri
    void push(BVal v) { stack.push_back(move(v)); }
    BVal pop() { auto v = stack.back(); stack.pop_back(); return v; }
    BVal& peek(int offset = 0) { return stack[stack.size() - 1 - offset]; }

    // Global değişken al/yaz
    void globalAta(const string& ad, BVal val) { globals[ad] = move(val); }

    BVal globalAl(const string& ad) {
        auto it = globals.find(ad);
        if (it != globals.end()) return it->second;
        throw runtime_error("Tanımsız değişken: '" + ad + "'");
    }

    // Ana çalıştırma döngüsü
    BVal calistir(shared_ptr<BChunk> chunk) {
        frames.push_back(CallFrame(chunk, 0));

        while (!frames.empty()) {
            CallFrame& frame = frames.back();
            if (frame.ip >= (int)frame.chunk->code.size()) {
                frames.pop_back();
                break;
            }

            OpCode op = (OpCode)frame.oku();

            switch (op) {
                case OpCode::OP_SAYI: {
                    int idx = frame.okuArg();
                    push(frame.chunk->sabitler[idx]);
                    break;
                }
                case OpCode::OP_METIN: {
                    int idx = frame.okuArg();
                    push(frame.chunk->sabitler[idx]);
                    break;
                }
                case OpCode::OP_TUZ:  push(BVal(true));  break;
                case OpCode::OP_TERS: push(BVal(false)); break;
                case OpCode::OP_BOS:  push(BVal());      break;

                case OpCode::OP_TANI: {
                    int idx = frame.okuArg();
                    if (idx >= (int)frame.locals.size())
                        frame.locals.resize(idx + 1);
                    frame.locals[idx] = pop();
                    break;
                }
                case OpCode::OP_YUKLE: {
                    int idx = frame.okuArg();
                    if (idx < (int)frame.locals.size())
                        push(frame.locals[idx]);
                    else
                        throw runtime_error("Tanımsız lokal değişken: " + to_string(idx));
                    break;
                }
                case OpCode::OP_SAKLA: {
                    int idx = frame.okuArg();
                    if (idx >= (int)frame.locals.size())
                        frame.locals.resize(idx + 1);
                    frame.locals[idx] = peek(0); // pop etme, atama ifade döndürür
                    break;
                }

                // Aritmetik
                case OpCode::OP_TOPLA: {
                    BVal b = pop(), a = pop();
                    if (a.type == BVal::STR || b.type == BVal::STR)
                        push(BVal(a.toString() + b.toString()));
                    else
                        push(BVal(a.num + b.num));
                    break;
                }
                case OpCode::OP_CIKAR: { BVal b=pop(),a=pop(); push(BVal(a.num-b.num)); break; }
                case OpCode::OP_CARP:  { BVal b=pop(),a=pop(); push(BVal(a.num*b.num)); break; }
                case OpCode::OP_BOL: {
                    BVal b=pop(),a=pop();
                    if (b.num == 0) throw runtime_error("Sıfıra bölme hatası!");
                    push(BVal(a.num/b.num));
                    break;
                }
                case OpCode::OP_MOD: { BVal b=pop(),a=pop(); push(BVal(fmod(a.num,b.num))); break; }
                case OpCode::OP_NEG:  { BVal a=pop(); push(BVal(-a.num)); break; }

                // Karşılaştırma
                case OpCode::OP_ESIT:       { BVal b=pop(),a=pop(); push(BVal(a==b)); break; }
                case OpCode::OP_ESIT_DEGIL: { BVal b=pop(),a=pop(); push(BVal(a!=b)); break; }
                case OpCode::OP_BUYUK:      { BVal b=pop(),a=pop(); push(BVal(a.num>b.num)); break; }
                case OpCode::OP_KUCUK:      { BVal b=pop(),a=pop(); push(BVal(a.num<b.num)); break; }
                case OpCode::OP_BUYUK_ESIT: { BVal b=pop(),a=pop(); push(BVal(a.num>=b.num)); break; }
                case OpCode::OP_KUCUK_ESIT: { BVal b=pop(),a=pop(); push(BVal(a.num<=b.num)); break; }

                // Mantık
                case OpCode::OP_VE:   { BVal b=pop(),a=pop(); push(BVal(a.isTruthy()&&b.isTruthy())); break; }
                case OpCode::OP_VEYA: { BVal b=pop(),a=pop(); push(BVal(a.isTruthy()||b.isTruthy())); break; }
                case OpCode::OP_DEGIL:{ BVal a=pop(); push(BVal(!a.isTruthy())); break; }

                // Liste
                case OpCode::OP_LISTE: {
                    int n = frame.okuArg();
                    auto lst = make_shared<vector<BVal>>(n);
                    for (int i = n-1; i >= 0; i--) (*lst)[i] = pop();
                    push(BVal(lst));
                    break;
                }
                case OpCode::OP_INDEKS_AL: {
                    BVal idx = pop(), obj = pop();
                    if (obj.type == BVal::LIST) {
                        int i = (int)idx.num;
                        if (i < 0 || i >= (int)obj.list->size())
                            throw runtime_error("İndeks sınır dışı: " + to_string(i));
                        push((*obj.list)[i]);
                    } else if (obj.type == BVal::STR) {
                        int i = (int)idx.num;
                        if (i < 0 || i >= (int)obj.str.size())
                            throw runtime_error("İndeks sınır dışı: " + to_string(i));
                        push(BVal(string(1, obj.str[i])));
                    } else {
                        throw runtime_error("İndekslenemez tip");
                    }
                    break;
                }
                case OpCode::OP_INDEKS_ATA: {
                    BVal val = pop(), idx = pop(), obj = peek(0);
                    if (obj.type != BVal::LIST) throw runtime_error("Sadece listeler atanabilir");
                    int i = (int)idx.num;
                    if (i < 0 || i >= (int)obj.list->size())
                        throw runtime_error("İndeks sınır dışı: " + to_string(i));
                    (*obj.list)[i] = val;
                    break;
                }

                // Jump
                case OpCode::OP_ATLA: {
                    int offset = frame.okuJump();
                    frame.ip += offset;
                    break;
                }
                case OpCode::OP_ATLA_YANLIS: {
                    int offset = frame.okuJump();
                    BVal cond = pop();
                    if (!cond.isTruthy()) frame.ip += offset;
                    break;
                }
                case OpCode::OP_ATLA_DOGRU: {
                    int offset = frame.okuJump();
                    BVal cond = pop();
                    if (cond.isTruthy()) frame.ip += offset;
                    break;
                }

                // Fonksiyon çağrısı
                case OpCode::OP_CAGIR: {
                    int argc = frame.okuArg();
                    // Stack: [... fonksiyon, arg0, arg1, ...]
                    BVal fn = stack[stack.size() - argc - 1];

                    if (fn.type == BVal::NATIVE) {
                        vector<BVal> args(stack.end() - argc, stack.end());
                        for (int i = 0; i <= argc; i++) stack.pop_back();
                        BVal result = (*fn.native)(args);
                        push(result);
                    } else if (fn.type == BVal::FUNC) {
                        vector<BVal> args(stack.end() - argc, stack.end());
                        for (int i = 0; i <= argc; i++) stack.pop_back();
                        // Yeni frame aç
                        CallFrame newFrame(fn.func, (int)stack.size());
                        // Parametreleri lokal değişkenlere aktar
                        for (int i = 0; i < (int)fn.func->params.size() && i < (int)args.size(); i++) {
                            int idx = fn.func->degiskenBul(fn.func->params[i]);
                            if (idx < 0) {
                                fn.func->degiskenEkle(fn.func->params[i]);
                                idx = fn.func->degiskenler.size() - 1;
                            }
                            if (idx >= (int)newFrame.locals.size())
                                newFrame.locals.resize(idx + 1);
                            newFrame.locals[idx] = args[i];
                        }
                        frames.push_back(move(newFrame));
                    } else {
                        throw runtime_error("Çağrılabilir değil: " + fn.toString());
                    }
                    break;
                }

                case OpCode::OP_DON: {
                    BVal result = pop();
                    frames.pop_back();
                    push(result);
                    break;
                }
                case OpCode::OP_DON_BOS: {
                    frames.pop_back();
                    push(BVal());
                    break;
                }

                // Global değişken (henüz lokal scope dışında)
                // VM global değişkenleri doğrudan map'te tutar
                // Lokal değişkenler frame.locals'ta

                case OpCode::OP_YAZ: {
                    int argc = frame.okuArg();
                    for (int i = argc - 1; i >= 0; i--)
                        cout << stack[stack.size() - 1 - i].toString()
                             << (i > 0 ? " " : "");
                    cout << endl;
                    for (int i = 0; i < argc; i++) pop();
                    break;
                }

                case OpCode::OP_POP:    pop(); break;
                case OpCode::OP_KOPYALA: push(peek(0)); break;
                case OpCode::OP_HALT:   return stack.empty() ? BVal() : pop();

                case OpCode::OP_YUKLE_GLOBAL: {
                    int idx = frame.okuArg();
                    string ad = frame.chunk->sabitler[idx].str;
                    auto it = globals.find(ad);
                    if (it != globals.end()) push(it->second);
                    else throw runtime_error("Tanimsiz global: '" + ad + "'");
                    break;
                }
                case OpCode::OP_SAKLA_GLOBAL: {
                    int idx = frame.okuArg();
                    string ad = frame.chunk->sabitler[idx].str;
                    globals[ad] = peek(0);
                    break;
                }
                case OpCode::OP_TANI_GLOBAL: {
                    int idx = frame.okuArg();
                    string ad = frame.chunk->sabitler[idx].str;
                    globals[ad] = pop();
                    break;
                }
                case OpCode::OP_KIR:    throw BreakException{};
                case OpCode::OP_DEVAM:  throw ContinueException{};

                default:
                    throw runtime_error("Bilinmeyen opcode: " + to_string((int)op));
            }
        }

        return stack.empty() ? BVal() : pop();
    }

    // Global değişkeni VM'e tanıt
    void tani(const string& ad, BVal val) {
        globals[ad] = move(val);
    }

    BVal global(const string& ad) {
        return globalAl(ad);
    }
};
