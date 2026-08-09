```markdown
# Zedin Programlama Dili

**Türkçe keywordlü, bytecode VM'li, self-hosting programlama dili**

> 10. sınıf öğrencisi tarafından sıfırdan geliştirildi. Termux'ta. Telefondan.

---

## Ne Bu?

Zedin, tamamen Türkçe keyword kullanan, kendi Lexer/Parser/VM altyapısıyla çalışan bir programlama dili. Python gibi okunabiliyor, C kadar hızlı derlenebiliyor. Ve artık **Zedin, kendini Zedin ile çalıştırıyor.**

```
degisken isim = "Zedin";
yaz "Merhaba " + isim + "!";

fonk fakt(n) {
    eger n <= 1 { don 1; }
    don n * fakt(n - 1);
}

yaz fakt(10);
```

---

Dosya uzantısı: `.zed`



![Zedin Logo](zedin_logo.png)



---

## Özellikler

| Özellik | Durum | Açıklama |
|---------|-------|----------|
| 🇹🇷 Türkçe Syntax | ✅ | `degisken`, `fonk`, `eger`, `iken`, `don`, `ve`, `veya` |
| ⚡ Bytecode VM | ✅ | Tree-walking'den 2.5x hızlı |
| 🔄 Self-hosting Lexer | ✅ %100 | Lexer tamamen `.zed` ile yazıldı |
| 🔄 Self-hosting Parser | ✅ %100 | Parser tamamen `.zed` ile yazıldı |
| 🔄 Self-hosting Interpreter | ✅ %100 | Interpreter tamamen `.zed` ile yazıldı |
| 🔄 Self-hosting Compiler | ✅ %100 | Compiler tamamen `.zed` ile yazıldı — gerçek `.zedc` binary üretiyor |
| 🔄 Self-hosting VM | ✅ %100 | vm.zed — bytecode'u Zedin üzerinde çalıştırır, native fonksiyon köprüsü destekli |
| 🛡️ Rust-tipi Hata Yönetimi | ✅ | `Sonuc<T>` (tamam/hata) + `?` operatörü ile hata yayılımı |
| 🔍 Derleme Zamanı Tip Kontrolü | ✅ %100 | Argüman sayısı, literal tip, zorunlu hata ele alma |
| 🚀 Native ARM64 Compilation | ✅ | `.zed` → ARM64 assembly → native binary, C(O2) ile karşılaştırılabilir hız |
| 📚 Stdlib | ✅ | `parcala`, `icerir`, `kirp`, `sirala`, `toplam` ve daha fazlası |
| 🖥️ ODY | ✅ | Oku-Değerlendir-Yaz etkileşimli ortam |
| 🔧 C Transpiler | ✅ | Zedin → C → native binary |
| 📦 ZPM | ✅ | Zedin Paket Yöneticisi |

---

## Kurulum

```bash
# Derle
g++ -std=c++17 -O2 -o zedin zedin_v5.cpp -lreadline

# PATH'e ekle (isteğe bağlı)
mkdir -p ~/bin
cp zedin ~/bin/zedin
```

Linux, Ubuntu ve Termux (Android) üzerinde test edildi.

---

## Kullanım

```bash
# Normal çalıştır
zedin program.zed

# Bytecode VM (2.5x hızlı)
zedin --vm program.zed

# Bytecode derle
zedin --derle program.zed
zedin program.zedc

# C'ye transpile et
zedin --c program.zed
gcc program.c -o program -lm
./program

# ODY - Etkileşimli ortam (Self-hosting REPL)
cat interpreter.zed ody.zed > ody_tam.zed
zedin ody_tam.zed

# Self-hosting compiler ile derle
aktar "interpreter.zed"; aktar "compiler.zed"; zedin_derle("program.zed", "program.zedc");
zedin program.zedc

# Self-hosting compiler + VM ile derle ve çalıştır (tamamen Zedin üzerinde)
aktar "interpreter.zed"; aktar "compiler.zed"; aktar "vm.zed";
zedin_derle("program.zed", "program.zedc");
zedin_vm_calistir("program.zedc");
```

---

## ODY (Oku-Değerlendir-Yaz)

Zedin'in etkileşimli ortamı — **Zedin ile yazılmış, Zedin üzerinde çalışan** self-hosting REPL.

```
$ zedin ody_tam.zed
╔════════════════════════════════╗
║     Zedin ODY v1.0             ║
║     Oku-Değerlendir-Yaz        ║
╚════════════════════════════════╝

>>> degisken x = 42;
>>> yaz x;
42
>>> fonk kare(n) { don n * n; }
>>> yaz kare(7);
49
>>> yaz parcala("a,b,c", ",");
[a, b, c]
>>> yardim
```

### ODY Komutları

| Komut | Açıklama |
|-------|----------|
| `yardim` | Yardım mesajı |
| `cikis` | ODY'den çık |

---

## Self-hosting

Zedin artık **tamamen kendi kendini çalıştırabiliyor.** Lexer, Parser, Interpreter, Compiler ve VM'in tamamı `.zed` dosyalarıyla yazılmış ve Zedin üzerinde çalışıyor.

```
Lexer       → lexer.zed        ✅ %100
Parser      → parser.zed       ✅ %100
Interpreter → interpreter.zed  ✅ %100
Stdlib      → stdlib.zed       ✅ %100
ODY (REPL)  → ody.zed          ✅ %100
Compiler    → compiler.zed     ✅ %100
VM          → vm.zed           ✅ %100
```

```bash
# Self-hosting interpreter üzerinden kod çalıştır
zedin ody_tam.zed
>>> calistir_kod("fonk kare(n) { don n * n; } yaz kare(7);");
49
```

Self-hosting VM (`vm.zed`), C++ tarafındaki native fonksiyonlara (`yaz`, `uzunluk`, `tamam`, `hata` vb.) `native_cagir` köprüsü üzerinden erişebiliyor — yani bytecode dünyası ile tree-walking interpreter dünyası aynı native fonksiyon havuzunu paylaşıyor.

---

## Hata Yönetimi (Rust-tipi Sonuc<T>)

Zedin, panic yerine açık hata yönetimi kullanır — Rust'ın `Result<T,E>` yapısına benzer bir `Sonuc<T>` tipi ile.

```
fonk guvenli_bol(a: sayi, b: sayi) {
    eger b == 0 { don hata("sifira bolme"); }
    don tamam(a / b);
}

degisken sonuc = guvenli_bol(10, 2)?;
yaz sonuc;
```

`?` operatörü hata durumunda otomatik olarak üst fonksiyona hatayı yayar (Rust'taki `?` gibi). Manuel kontrol için `tamam_mi()`, `hata_mi()`, `deger_al()`, `mesaj_al()` fonksiyonları da kullanılabilir.

Derleme zamanı tip kontrolü, `Sonuc` dönen bir fonksiyon çağrısının sonucu `?` veya `tamam_mi()` ile ele alınmazsa hata verir — hatanın sessizce yutulmasını engeller.

---

## Native ARM64 Compilation

Zedin kodu doğrudan ARM64 assembly'ye derlenip native binary üretilebiliyor (`asm_backend.zed`, tamamen Zedin ile yazılı).

Desteklenenler: değişkenler, aritmetik işlemler, döngüler, koşullar, fonksiyonlar (recursive dahil), string işlemleri ve string birleştirme.

```bash
# (native ARM64 derleme akışı için ilgili giris_asm.zed kullanılır)
```

---

## Stdlib

Self-hosting stdlib — tamamen Zedin ile yazılmış:

```
parcala(metin, ayirici)      # "a,b,c" → ["a","b","c"]
birlestir(liste, ayirici)    # ["a","b","c"] → "a,b,c"
icerir(metin, aranan)        # true/false
ile_baslar(metin, on_ek)     # true/false
ile_biter(metin, son_ek)     # true/false
kirp(metin)                  # "  hello  " → "hello"
bul(metin, aranan)           # indis veya -1
alt_string(metin, bas, bit)  # alt parça
tekrarla(metin, n)           # "ab" × 3 → "ababab"
ters_cevir(metin)            # "abc" → "cba"

sirala(liste)                # küçükten büyüğe
liste_ters(liste)            # tersine çevir
toplam(liste)                # elemanların toplamı
maksimum(liste)              # en büyük
minimum(liste)               # en küçük
ortalama(liste)              # ortalama
dilim(liste, bas, bit)       # alt liste
listede_bul(liste, eleman)   # indis veya -1

maks(a, b)                   # büyük olanı
min(a, b)                    # küçük olanı
sayi_mi(metin)               # "123" → true
```

---

## Türkçe Yazılım Terimleri Sözlüğü

### Zedin'de Kullanılan Terimler

| İngilizce | Zedin Türkçesi |
|-----------|---------------|
| variable | değişken |
| function | fonk |
| if/else | eger/yoksa |
| while | iken |
| return | don |
| print | yaz |
| import | aktar |
| true/false | tuz/ters |
| null | bos |
| and/or | ve/veya |
| not | degil |
| break | kir |
| continue | devam |

### Genel Terimler

| İngilizce | Türkçe | Kısaltma |
|-----------|--------|----------|
| Compiler | Derleyici | DR |
| Interpreter | Yorumlayıcı | YR |
| Lexer | Sözcüksel Çözümleyici | SÇ |
| Parser | Sözdizim Çözümleyici | SDÇ |
| AST | Soyut Sözdizim Ağacı | SSA |
| Bytecode | Bayt Kodu | BK |
| VM | Sanal Makine | SAM |
| REPL | Oku-Değerlendir-Yaz | ODY |
| Self-hosting | Özyürür | ÖZYÜR |
| Self-compiling | Özderleme | ÖZD |
| Recursion | Özyineleme | ÖZYİN |
| Scope | Kapsam | KP |
| Closure | Kapatma | KPT |
| Pointer | Gösterici | GS |
| Stack | Yığın | YĞ |
| Heap | Öbek | ÖK |
| Frontend | Ön Yüz | ÖNY |
| Backend | Arka Yüz | ARY |
| API | Uygulama Programlama Arayüzü | UPA |

---

## Hız Karşılaştırması

100.000 iterasyon döngüsü (Redmi Note 15 Pro):

| Mod | Süre |
|-----|------|
| Tree-walking | 196ms |
| Bytecode VM | 78ms |
| .zedc (önceden derlenmiş) | 84ms |

1.000.000 iterasyon döngüsü (native ARM64 derleme):

| Mod | Süre |
|-----|------|
| C (O2) | 0.022s |
| Zedin (native ARM64) | 0.018s |

---

## Yol Haritası

- [x] Lexer, Parser, AST
- [x] Tree-walking Interpreter
- [x] Bytecode VM
- [x] C Transpiler
- [x] ZPM Paket Yöneticisi
- [x] ODY (Etkileşimli Ortam)
- [x] **Self-hosting Lexer %100**
- [x] **Self-hosting Parser %100**
- [x] **Self-hosting Interpreter %100**
- [x] **Self-hosting Stdlib**
- [x] **Self-hosting Compiler %100** (Zedin → .zedc binary, özyinelemeli fonksiyonlar dahil)
- [x] **Self-hosting VM %100** (vm.zed, native fonksiyon köprüsü ile)
- [x] **Rust-tipi Sonuc<T> ve `?` operatörü** (hata yayılımı)
- [x] **Derleme zamanı tip kontrolü** (argüman sayısı, literal tip, zorunlu hata ele alma)
- [x] **Native ARM64 backend** (değişken, döngü, koşul, fonksiyon, recursive, string desteği)
- [x] Türkçe Yazılım Terimleri Sözlüğü
- [ ] Liste native desteği (ARM64'te statik dizi ile)
- [ ] VS Code sözdizimi desteği
- [ ] Tam self-compiling (Zedin → Zedin binary, C++ olmadan)

---

## Neden Zedin?

Türkiye'de programlama eğitiminin önündeki engellerden biri İngilizce syntax. Zedin, Türkçe düşünen zihinler için tasarlandı — ama altında tam anlamıyla profesyonel bir dil altyapısı var.

Lexer'dan Parser'a, Interpreter'dan Compiler ve VM'e kadar her şey artık Zedin ile yazılmış ve Zedin üzerinde çalışıyor.

---

*Sıfırdan. Telefonda. Termux'ta.*
```
