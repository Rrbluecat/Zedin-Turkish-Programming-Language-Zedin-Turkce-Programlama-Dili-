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

Dosya kısayolu:.zed
Logosu:
![Zedin Logo](zedin_logo.png)

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

# Zedin Türkçe Yazılım Terimleri Sözlüğü

> Zedin projesinde kullanılan ve önerilen Türkçe yazılım terimleri.
> Her terim, anlaşılırlık ve dijital bağlam gözetilerek seçilmiştir.

---

## Veri Yapıları

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Array | Dizi | DZ | Bellekte yan yana, sabit boyutlu eleman dizisi |
| List | Liste | LS | Dinamik boyutlu eleman koleksiyonu |
| Queue | Kuyruk | KY | İlk giren ilk çıkar yapısı |
| Stack | Yığın | YĞ | Son giren ilk çıkar yapısı |
| Tree | Ağaç | AĞ | Hiyerarşik düğüm yapısı |
| Graph | Bağıntı Yapısı | BY | Noktalar ve bağlantılardan oluşan yapı |
| Hash Table | İz Tablosu | İZT | Anahtar-değer çifti saklayan yapı |
| Linked List | Bağlı Liste | BL | Her elemanın bir sonrakini gösterdiği liste |
| Node | Düğüm | DĞ | Veri yapısındaki tek bir birim |

---

## Programlama Kavramları

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Variable | Değişken | DĞK | Veri saklayan isimlendirilmiş alan |
| Function | İşlev | İŞ | Belirli bir görevi yapan kod bloğu |
| Loop | Döngü | DG | Tekrar eden kod bloğu |
| Recursion | Özyineleme | ÖZYİN | Kendini çağıran işlev |
| Callback | Geri Çağırma | GÇ | Başka bir işleve parametre olarak verilen işlev |
| Scope | Kapsam | KP | Değişkenin erişilebilir olduğu alan |
| Closure | Kapatma | KPT | Dış kapsamı yakalayan işlev |
| Inheritance | Devralma | DV | Bir sınıfın başka sınıf özelliklerini alması |
| Encapsulation | Gizleyici | GZ | İç detayları saklayıp dışa belirli kapılar açmak |
| Polymorphism | Çoklu Davranış | ÇD | Aynı işlevin farklı tiplerle farklı davranması |
| Interface | Arayüz | AY | Sınıfın dışarıya açtığı kapılar |
| Class | Sınıf | SN | Nesne şablonu |
| Object | Nesne | NS | Sınıftan üretilen somut varlık |
| Instance | Örnek | ÖR | Sınıfın belirli bir nesnesi |
| Method | Yöntem | YT | Sınıfa ait işlev |
| Parameter | Parametre | PM | İşlev tanımındaki değişken |
| Argument | Bağımsız Değişken | BD | İşlev çağrısındaki gerçek değer |

---

## Derleme ve Çalışma

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Compiler | Derleyici | DR | Kodu makine diline çeviren program |
| Interpreter | Yorumlayıcı | YR | Kodu satır satır çalıştıran program |
| Lexer | Sözcüksel Çözümleyici | SÇ | Kodu tokenlara ayıran bileşen |
| Parser | Sözdizim Çözümleyici | SDÇ | Tokenlardan ağaç yapısı üreten bileşen |
| AST | Soyut Sözdizim Ağacı | SSA | Kodun ağaç yapısındaki temsili |
| Bytecode | Bayt Kodu | BK | Sanal makine için ara kod |
| Runtime | Çalışma Zamanı | ÇZ | Programın çalıştığı ortam |
| VM | Sanal Makine | SAM | Bayt kodunu çalıştıran sanal işlemci |
| REPL | Oku-Değerlendir-Yaz-Döngüsü | ODY | Etkileşimli programlama ortamı |
| Debug | Hata Ayıklama | HA | Programdaki hataları bulma ve düzeltme |
| Self-hosting | Özyürür | ÖZYÜR | Dilin kendi kendini derleyip çalıştırabilmesi |
| Self-compiling | Özderleme | ÖZD | Dilin kendi derleyicisini kendisiyle yazması |
| Pipeline | İşlem Zinciri | İZ | Birbiri ardına çalışan işlemler dizisi |

---

## Sistem ve Donanım

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Kernel | Çekirdek | ÇK | İşletim sisteminin temel katmanı |
| Driver | Sürücü | SR | Donanım ile işletim sistemi arası köprü |
| Process | Süreç | SÜ | Çalışan program örneği |
| Thread | İş Parçacığı | İP | Süreç içinde bağımsız çalışan birim |
| Syscall | Sistem Çağrısı | SÇ | Çekirdeğe yapılan doğrudan istek |
| Interrupt | Kesme | KS | İşlemciyi durduran donanım sinyali |
| Register | Yazmaç | YZ | İşlemci içindeki hızlı bellek birimi |
| Flag | Bayrak | BY | İşlemci durum biti |
| Bit | Bit | BT | En küçük veri birimi (0 veya 1) |
| Byte | Bayt | BY | 8 bitten oluşan veri birimi |
| Memory | Bellek | BL | Veri saklama birimi |
| Cache | Önbellek | ÖB | Hızlı erişim için yakın bellek |
| Address | Adres | AD | Bellekteki konum bilgisi |
| Pointer | Gösterici | GS | Bellek adresi saklayan değişken |
| Instruction | Komut | KM | İşlemcinin anlayacağı tek işlem |
| Stack | Yığın | YĞ | Son giren ilk çıkar bellek bölgesi |
| Heap | Öbek | ÖK | Dinamik bellek bölgesi |
| Buffer | Tampon | TP | Geçici veri saklama alanı |

---

## Ağ ve İletişim

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Network | Ağ | AĞ | Birbirine bağlı sistemler topluluğu |
| Protocol | İletişim Kuralı | İK | Sistemlerin konuşma standardı |
| Packet | Paket | PK | Ağ üzerinde taşınan veri birimi |
| Socket | Soket | SK | Ağ bağlantısı uç noktası |
| Port | İskele | İSK | Bağlantı için kullanılan numaralı giriş noktası |
| Server | Sunucu | SN | Hizmet sağlayan sistem |
| Client | İstemci | İS | Hizmet talep eden sistem |
| Request | İstek | İT | İstemciden sunucuya gönderilen talep |
| Response | Yanıt | YN | Sunucudan istemciye dönen cevap |
| Firewall | Güvenlik Duvarı | GD | Ağ trafiğini filtreleyen sistem |
| API | Uygulama Programlama Arayüzü | UPA | Sistemler arası iletişim kapısı |

---

## Güvenlik

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Hash | İz | İZ |
| Self-hosting | Özyürür | ÖZYÜR |
| Self-compiling | Özderleme | ÖZD |
| Recursion | Özyineleme | ÖZYİN | Veriden üretilen sabit uzunluklu kimlik kodu |
| Encryption | Şifreleme | ŞF | Veriyi gizlemek için dönüştürme |
| Token | Belirteç | BÇ | Kimlik veya yetki taşıyan kod |
| Authentication | Kimlik Doğrulama | KD | Kullanıcının kim olduğunu doğrulama |
| Vulnerability | Güvenlik Açığı | GA | Sistemdeki istismar edilebilir zayıflık |

---

## Yazılım Mimarisi

| İngilizce | Türkçe | Kısaltma | Açıklama |
|-----------|--------|----------|----------|
| Frontend | Ön Yüz | ÖNY | Kullanıcının gördüğü katman |
| Backend | Arka Yüz | ARY | Arka planda çalışan işlem katmanı |
| Database | Veritabanı | VT | Veri saklama ve yönetim sistemi |
| Framework | Çatı | ÇT | Uygulama geliştirme iskelet yapısı |
| Library | Kütüphane | KÜT | Hazır kod koleksiyonu |
| Module | Modül | MD | Bağımsız çalışabilen kod birimi |
| Package | Paket | PK | Dağıtılabilir kod koleksiyonu |
| Repository | Depo | DP | Kod saklama ve versiyon yönetim alanı |
| IDE | Bütünleşik Geliştirme Ortamı | BGO | Yazılım geliştirme aracı |

---

## Zedin'de Kullanılan Terimler

| İngilizce | Zedin Türkçesi |
|-----------|---------------|
| variable | değişken |
| function | fonk (işlev) |
| if/else | eger/yoksa |
| while | iken |
| return | don |
| print | yaz |
| import | aktar |
| true/false | tuz/ters |
| null | bos |
| and/or | ve/veya |
| not | degil |
| break | kır |
| continue | devam |

---


---

## Standart Kısaltmalar

| İngilizce | Türkçe | Kısaltma |
|-----------|--------|----------|
| VM | Sanal Makine | SAM |
| API | Uygulama Programlama Arayüzü | UPA |
| REPL | Oku-Değerlendir-Yaz-Döngüsü | ODY |
| AST | Soyut Sözdizim Ağacı | SSA |
| IDE | Bütünleşik Geliştirme Ortamı | BGO |
| CPU | Merkezi İşlem Birimi | MİB |
| RAM | Rastgele Erişim Belleği | REB |
| OS | İşletim Sistemi | İŞS |
| Array | Dizi | DZ |
| Frontend | Ön Yüz | ÖNY |
| Backend | Arka Yüz | ARY |
| Port | İskele | İSK |
| Hash | İz | İZ |
| Self-hosting | Özyürür | ÖZYÜR |
| Self-compiling | Özderleme | ÖZD |
| Recursion | Özyineleme | ÖZYİN |

---

*Zedin Projesi — Türkçe yazılım terimleri sözlüğü v1.2*
*Kısaltma seçim kriterleri: TDK uyumu, telaffuz kolaylığı, çakışmama*


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
