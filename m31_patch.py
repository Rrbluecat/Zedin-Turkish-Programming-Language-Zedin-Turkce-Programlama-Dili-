import sys

p = "asm_backend.zed"
s = open(p, encoding="utf-8").read()

def degistir(etiket, eski, yeni):
    global s
    n = s.count(eski)
    if n != 1:
        print("HATA: '" + etiket + "' " + str(n) + " tane bulundu")
        sys.exit(1)
    s = s.replace(eski, yeni, 1)
    print("OK: " + etiket)

# 1) ifade_metin_mi genislet
degistir("1-ifade_metin_mi",
'''fonk ifade_metin_mi(ifade) {
    eger ifade == bos { don ters; }
    eger ifade[0] == "STR" { don tuz; }
    eger ifade[0] == "ID" {
        degisken t = degisken_tip_bul_tam(ifade[1]);
        eger t == "metin" { don tuz; }
    }
    don ters;
}''',
'''fonk ifade_metin_mi(ifade) {
    eger ifade == bos { don ters; }
    eger ifade[0] == "STR" { don tuz; }
    eger ifade[0] == "ID" {
        degisken t = degisken_tip_bul_tam(ifade[1]);
        eger t == "metin" { don tuz; }
    }
    eger ifade[0] == "CAGRI" ve uzunluk(ifade) > 1 ve ifade[1] == "metine" { don tuz; }
    eger ifade[0] == "INDEX" ve uzunluk(ifade) > 1 {
        degisken itaban = ifade[1];
        eger itaban[0] == "ID" ve degisken_tip_bul_tam(itaban[1]) == "metin" { don tuz; }
        eger itaban[0] == "STR" { don tuz; }
    }
    eger ifade[0] == "BINOP" ve ifade[1] == "+" ve uzunluk(ifade) > 3 {
        eger ifade_metin_mi(ifade[2]) veya ifade_metin_mi(ifade[3]) { don tuz; }
    }
    don ters;
}''')

# 2) Runtime yardimcilari (asm_son icinde)
degistir("2-runtime-yardimcilar",
'''    iken fi < uzunluk(_fonk_satirlar) {
        asm_yaz(_fonk_satirlar[fi]);
        fi = fi + 1;
    }
    veri_yaz(".section .data");''',
'''    iken fi < uzunluk(_fonk_satirlar) {
        asm_yaz(_fonk_satirlar[fi]);
        fi = fi + 1;
    }
    // Zedin runtime yardimcilari (string islemleri)
    asm_yaz("");
    asm_yaz("_zedin_strlen:");
    asm_yaz("    mov x1, x0");
    asm_yaz("    mov x2, #0");
    asm_yaz("_zedin_strlen_dongu:");
    asm_yaz("    ldrb w3, [x1], #1");
    asm_yaz("    cbz w3, _zedin_strlen_bitis");
    asm_yaz("    add x2, x2, #1");
    asm_yaz("    b _zedin_strlen_dongu");
    asm_yaz("_zedin_strlen_bitis:");
    asm_yaz("    mov x0, x2");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_metine:");
    asm_yaz("    mov x1, x0");
    asm_yaz("    adr x2, _metine_buf");
    asm_yaz("    add x2, x2, #31");
    asm_yaz("    mov x3, #0");
    asm_yaz("    strb w3, [x2]");
    asm_yaz("    mov x4, #10");
    asm_yaz("_zedin_metine_dongu:");
    asm_yaz("    sub x2, x2, #1");
    asm_yaz("    udiv x3, x1, x4");
    asm_yaz("    msub x5, x3, x4, x1");
    asm_yaz("    add x5, x5, #48");
    asm_yaz("    strb w5, [x2]");
    asm_yaz("    mov x1, x3");
    asm_yaz("    cbnz x1, _zedin_metine_dongu");
    asm_yaz("    mov x0, x2");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_sayiya:");
    asm_yaz("    mov x1, x0");
    asm_yaz("    mov x2, #0");
    asm_yaz("    mov x4, #10");
    asm_yaz("_zedin_sayiya_dongu:");
    asm_yaz("    ldrb w3, [x1], #1");
    asm_yaz("    sub w3, w3, #48");
    asm_yaz("    cmp w3, #9");
    asm_yaz("    b.hi _zedin_sayiya_bitis");
    asm_yaz("    madd x2, x2, x4, x3");
    asm_yaz("    b _zedin_sayiya_dongu");
    asm_yaz("_zedin_sayiya_bitis:");
    asm_yaz("    mov x0, x2");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_str_chr:");
    asm_yaz("    adr x2, _char_buf");
    asm_yaz("    ldrb w3, [x0, x1]");
    asm_yaz("    strb w3, [x2]");
    asm_yaz("    mov w3, #0");
    asm_yaz("    strb w3, [x2, #1]");
    asm_yaz("    mov x0, x2");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_char_kodu:");
    asm_yaz("    ldrb w0, [x0]");
    asm_yaz("    ret");
    veri_yaz(".section .data");''')

# 3) Data tamponlari
degistir("3-data-buffer",
'''    veri_yaz("_buf: .space 256");
}''',
'''    veri_yaz("_buf: .space 256");
    veri_yaz("_metine_buf: .space 32");
    veri_yaz("_char_buf: .space 16");
}''')

# 4) uzunluk(metin) destegi
degistir("4-uzunluk-metin",
'''        eger fn_isim == "uzunluk" ve uzunluk(fn_arglar) == 1 {
            degisken hedef_ifade = fn_arglar[0];
            eger hedef_ifade[0] == "ID" {
                degisken liste_etiket2 = degisken_bul(hedef_ifade[1]);
                eger etiket_liste_mi(liste_etiket2) {
                    degisken temiz_etiket = liste_etiket_soy(liste_etiket2);
                    asm_yaz("    adr x1, " + temiz_etiket + "_len");
                    asm_yaz("    ldr x0, [x1]");
                    don 0;
                }
            }
        }''',
'''        eger fn_isim == "uzunluk" ve uzunluk(fn_arglar) == 1 {
            degisken hedef_ifade = fn_arglar[0];
            eger hedef_ifade[0] == "ID" {
                degisken liste_etiket2 = degisken_bul(hedef_ifade[1]);
                eger etiket_liste_mi(liste_etiket2) {
                    degisken temiz_etiket = liste_etiket_soy(liste_etiket2);
                    asm_yaz("    adr x1, " + temiz_etiket + "_len");
                    asm_yaz("    ldr x0, [x1]");
                    don 0;
                }
                eger degisken_tip_bul_tam(hedef_ifade[1]) == "metin" {
                    kodla_ifade(hedef_ifade);
                    asm_yaz("    bl _zedin_strlen");
                    don 0;
                }
            }
            eger hedef_ifade[0] == "STR" {
                degisken uzun_st_etiket = yeni_str_etiketi();
                asm_str_tanimla(uzun_st_etiket, hedef_ifade[1]);
                asm_yaz("    adr x0, " + uzun_st_etiket);
                asm_yaz("    bl _zedin_strlen");
                don 0;
            }
        }''')

# 5) metine / sayiya / char_kodu
degistir("5-metine-sayiya-char_kodu",
'''        eger fn_isim == "oku_dosya" ve uzunluk(fn_arglar) == 1 {''',
'''        eger fn_isim == "metine" ve uzunluk(fn_arglar) == 1 {
            kodla_ifade(fn_arglar[0]);
            asm_yaz("    bl _zedin_metine");
            don 0;
        }

        eger fn_isim == "sayiya" ve uzunluk(fn_arglar) == 1 {
            degisken sarg = fn_arglar[0];
            eger sarg[0] == "STR" {
                kodla_ifade(sarg);
                asm_yaz("    bl _zedin_sayiya");
                don 0;
            }
            eger sarg[0] == "ID" ve degisken_tip_bul_tam(sarg[1]) == "metin" {
                kodla_ifade(sarg);
                asm_yaz("    bl _zedin_sayiya");
                don 0;
            }
            kodla_ifade(sarg);
            don 0;
        }

        eger fn_isim == "char_kodu" ve uzunluk(fn_arglar) == 1 {
            kodla_ifade(fn_arglar[0]);
            asm_yaz("    bl _zedin_char_kodu");
            don 0;
        }

        eger fn_isim == "oku_dosya" ve uzunluk(fn_arglar) == 1 {''')

# 6) String index metin[i]
degistir("6-string-index",
'''    eger dt == "INDEX" {
        // ifade = [INDEKS_AL, liste_ifade, index_ifade]
        kodla_ifade(ifade[2]);          // index -> x0
        asm_yaz("    mov x21, x0");     // index'i kaydet
        kodla_ifade(ifade[1]);          // liste adresi -> x0
        asm_yaz("    lsl x21, x21, #3"); // index * 8
        asm_yaz("    add x0, x0, x21");
        asm_yaz("    ldr x0, [x0]");
        don 0;
    }''',
'''    eger dt == "INDEX" {
        // ifade = [INDEKS_AL, liste_ifade, index_ifade]
        degisken taban = ifade[1];
        eger (taban[0] == "ID" ve degisken_tip_bul_tam(taban[1]) == "metin") veya taban[0] == "STR" {
            kodla_ifade(ifade[2]);          // index -> x0
            asm_yaz("    mov x21, x0");     // index'i kaydet
            eger taban[0] == "STR" {
                degisken sc_etiket = yeni_str_etiketi();
                asm_str_tanimla(sc_etiket, taban[1]);
                asm_yaz("    adr x0, " + sc_etiket);
            } yoksa {
                kodla_ifade(taban);         // string adresi -> x0
            }
            asm_yaz("    mov x1, x21");
            asm_yaz("    bl _zedin_str_chr");
            don 0;
        }
        kodla_ifade(ifade[2]);          // index -> x0
        asm_yaz("    mov x21, x0");     // index'i kaydet
        kodla_ifade(ifade[1]);          // liste adresi -> x0
        asm_yaz("    lsl x21, x21, #3"); // index * 8
        asm_yaz("    add x0, x0, x21");
        asm_yaz("    ldr x0, [x0]");
        don 0;
    }''')

# 7) YAZ: string sonuclari puts ile bas, sayisal toplamayi duzelt
degistir("7-yaz-string",
'''            } yoksa {
                eger ifade[0] == "BINOP" ve ifade[1] == "+" {
                    // String birlestirme: sol + sag''',
'''            } yoksa {
                eger ifade[0] != "BINOP" ve ifade_metin_mi(ifade) {
                    kodla_ifade(ifade);
                    asm_yaz("    bl puts");
                } yoksa eger ifade[0] == "BINOP" ve ifade[1] == "+" ve (ifade_metin_mi(ifade[2]) veya ifade_metin_mi(ifade[3])) {
                    // String birlestirme: sol + sag''')

# 8) DEGISKEN tip cikarimi
degistir("8-degisken-tip",
'''        degisken ifade_tipi = "sayi";
        eger uzunluk(stmt) > 2 ve stmt[2] != bos {
            eger stmt[2][0] == "STR" { ifade_tipi = "metin"; }
        }''',
'''        degisken ifade_tipi = "sayi";
        eger uzunluk(stmt) > 2 ve stmt[2] != bos {
            eger stmt[2][0] == "STR" { ifade_tipi = "metin"; }
            yoksa eger ifade_metin_mi(stmt[2]) { ifade_tipi = "metin"; }
        }''')

open(p, "w", encoding="utf-8").write(s)
print("TAMAM: asm_backend.zed guncellendi")
