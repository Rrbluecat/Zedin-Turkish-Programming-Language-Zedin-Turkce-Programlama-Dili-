# Zedin Programlama Dili

**Türkçe keywordlü, bytecode VM'li, self-hosting programlama dili**

> 10. sınıf öğrencisi tarafından sıfırdan geliştirildi.

---

## Ne Bu?

Zedin, tamamen Türkçe keyword kullanan, kendi Lexer/Parser/VM altyapısıyla çalışan bir programlama dili. Python gibi okunabiliyor, C kadar hızlı derlenebiliyor.

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

## Özellikler

| Özellik | Açıklama |
|---------|----------|
| 🇹🇷 Türkçe Syntax | `degisken`, `fonk`, `eger`, `iken`, `don`, `ve`, `veya` |
| ⚡ Bytecode VM | Tree-walking'den 2.5x hızlı |
| 🔄 Self-hosting | Zedin, kendi interpreter'ını Zedin ile çalıştırıyor |
| 🔧 C Transpiler | Zedin → C → native binary |
| 📦 ZPM | Zedin Paket Yöneticisi |
| 📚 Stdlib | 10+ modül (liste, metin, matematik, json, ag...) |
| 🖥️ ODY | Oku-Değerlendir-Yaz etkileşimli ortam |

---

## Kurulum

```bash
# Derle
g++ -std=c++17 -O2 -o zedin zedin_v5.cpp -lreadline
g++ -std=c++17 -O2 -o zpm zpm.cpp

# PATH'e ekle
mkdir -p ~/bin
cp zedin ~/bin/zedin
cp zpm ~/bin/zpm
```

Linux Mint, Ubuntu ve Termux (Android) üzerinde test edildi.

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

# ODY - Etkileşimli ortam
zedin ody.zed
```

---

## ODY (Oku-Değerlendir-Yaz)

Zedin'in etkileşimli ortamı — Zedin ile yazılmış self-hosting REPL.

```
$ zedin ody.zed
╔════════════════════════════════╗
║     Zedin ODY v1.0             ║
║     Oku-Değerlendir-Yaz        ║
╚════════════════════════════════╝

>>> degisken x = 42;
>>> yaz x;
42
>>> fonk kare(n) {
...     don n * n;
... }
>>> yaz kare(7);
49
>>> yardim
```

### ODY Komutları

| Komut | Açıklama |
|-------|----------|
| `yardim` | Yardım mesajı |
| `temizle` | Ekranı temizle |
| `degiskenler` | Tanımlı değişkenleri göster |
| `fonksiyonlar` | Tanımlı fonksiyonları göster |
| `cikis` | ODY'den çık |

### ODY Özellikleri
- ✅ Değişkenler ve fonksiyonlar oturum boyunca kalıcı
- ✅ Çok satırlı kod desteği (`{` açıkken `...` ile devam)
- ✅ Komut geçmişi (yukarı ok)
- ✅ Güzel hata mesajları

---

## Self-hosting

Zedin kendi kendini çalıştırabiliyor:

```bash
zedin ody.zed
>>> calistir_kod("fonk kare(n) { don n * n; } yaz kare(7);");
49
```

---

## Stdlib Modülleri

```
aktar "liste";      # sirala, filtrele, tersine, aralik...
aktar "metin";      # bol, birlestir, buyuk_harf, bul...
aktar "matematik";  # kok, sin, cos, fakt, asal_mi, fib...
aktar "dosya";      # dosya_oku, dosya_yaz, csv_oku...
aktar "json";       # json_parse, json_uret, json_al...
aktar "ag";         # get, post, api_get...
aktar "test";       # suite, esit, assert, ozet...
aktar "sistem";     # calistir, env, klasor...
aktar "tarih_saat"; # tarih_str, saat_str, sure_baslat...
```

---

## Türkçe Yazılım Terimleri Sözlüğü

Zedin projesi kapsamında geliştirilen Türkçe yazılım terimleri:

| İngilizce | Türkçe | Kısaltma |
|-----------|--------|----------|
| Virtual Machine | Sanal Makine | SAM |
| API | Uygulama Programlama Arayüzü | UPA |
| REPL | Oku-Değerlendir-Yaz | ODY |
| AST | Soyut Sözdizim Ağacı | SSA |
| Frontend | Ön Yüz | ÖNY |
| Backend | Arka Yüz | ARY |
| Self-hosting | Özyürür | ÖZYÜR |

---

## Hız Karşılaştırması

100.000 iterasyon döngüsü (Redmi Note 15 Pro):

| Mod | Süre |
|-----|------|
| Tree-walking | 196ms |
| Bytecode VM | 78ms |
| .zedc (önceden derlenmiş) | 84ms |

---

## Yol Haritası

- [x] Lexer, Parser, AST
- [x] Tree-walking Interpreter
- [x] Bytecode VM
- [x] Self-hosting
- [x] C Transpiler
- [x] ZPM Paket Yöneticisi
- [x] Stdlib (10+ modül)
- [x] ODY (Etkileşimli Ortam)
- [x] Türkçe Yazılım Terimleri Sözlüğü
- [ ] Lexer %100 (self-hosting)
- [ ] Parser %100 (self-hosting)
- [ ] Interpreter %100 (self-hosting)
- [ ] ARM Assembly backend
- [ ] VS Code sözdizimi desteği

---

## Neden Zedin?

Türkiye'de programlama eğitiminin önündeki engellerden biri İngilizce syntax. Zedin, Türkçe düşünen zihinler için tasarlandı — ama altında tam anlamıyla profesyonel bir dil altyapısı var.

---

*Sıfırdan. Telefonda. Termux'ta.*
