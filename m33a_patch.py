import sys

p = "asm_backend.zed"
s = open(p, encoding="utf-8").read()


def degistir(etiket, eski, yeni):
    global s
    n = s.count(eski)
    if n != 1:
        print("HATA: '" + etiket + "' eski metin " + str(n) + " tane")
        sys.exit(1)
    s = s.replace(eski, yeni, 1)
    print("OK: " + etiket)


# A: heap liste runtime yardimcilari (list_struct: [0]cap [8]len [16]data*)
degistir("A-heap-yardimcilar",
'''    asm_yaz("    ldrb w0, [x0]");
    asm_yaz("    ret");
    veri_yaz(".section .data");''',
'''    asm_yaz("    ldrb w0, [x0]");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_liste_yeni:");
    asm_yaz("    stp x29, x30, [sp, #-16]!");
    asm_yaz("    mov x29, sp");
    asm_yaz("    stp x19, x20, [sp, #-16]!");
    asm_yaz("    mov x19, x0");
    asm_yaz("    mov x0, #24");
    asm_yaz("    bl malloc");
    asm_yaz("    mov x20, x0");
    asm_yaz("    lsl x0, x19, #3");
    asm_yaz("    bl malloc");
    asm_yaz("    str x0, [x20, #16]");
    asm_yaz("    str x19, [x20]");
    asm_yaz("    str x19, [x20, #8]");
    asm_yaz("    mov x0, x20");
    asm_yaz("    ldp x19, x20, [sp], #16");
    asm_yaz("    ldp x29, x30, [sp], #16");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_ekle:");
    asm_yaz("    stp x29, x30, [sp, #-16]!");
    asm_yaz("    mov x29, sp");
    asm_yaz("    stp x19, x20, [sp, #-16]!");
    asm_yaz("    stp x21, x22, [sp, #-16]!");
    asm_yaz("    mov x19, x0");
    asm_yaz("    mov x20, x1");
    asm_yaz("    ldr x21, [x19]");
    asm_yaz("    ldr x22, [x19, #8]");
    asm_yaz("    cmp x22, x21");
    asm_yaz("    b.lt _zedin_ekle_yaz");
    asm_yaz("    cbnz x21, _zedin_ekle_buyut");
    asm_yaz("    mov x21, #4");
    asm_yaz("    b _zedin_ekle_realloc");
    asm_yaz("_zedin_ekle_buyut:");
    asm_yaz("    lsl x21, x21, #1");
    asm_yaz("_zedin_ekle_realloc:");
    asm_yaz("    str x21, [x19]");
    asm_yaz("    ldr x0, [x19, #16]");
    asm_yaz("    lsl x1, x21, #3");
    asm_yaz("    bl realloc");
    asm_yaz("    str x0, [x19, #16]");
    asm_yaz("_zedin_ekle_yaz:");
    asm_yaz("    ldr x0, [x19, #16]");
    asm_yaz("    ldr x1, [x19, #8]");
    asm_yaz("    str x20, [x0, x1, lsl #3]");
    asm_yaz("    add x1, x1, #1");
    asm_yaz("    str x1, [x19, #8]");
    asm_yaz("    mov x0, x19");
    asm_yaz("    ldp x21, x22, [sp], #16");
    asm_yaz("    ldp x19, x20, [sp], #16");
    asm_yaz("    ldp x29, x30, [sp], #16");
    asm_yaz("    ret");
    asm_yaz("");
    asm_yaz("_zedin_cikar:");
    asm_yaz("    stp x29, x30, [sp, #-16]!");
    asm_yaz("    mov x29, sp");
    asm_yaz("    stp x19, x20, [sp, #-16]!");
    asm_yaz("    stp x21, x22, [sp, #-16]!");
    asm_yaz("    mov x19, x0");
    asm_yaz("    mov x20, x1");
    asm_yaz("    ldr x21, [x19, #8]");
    asm_yaz("    cmp x20, x21");
    asm_yaz("    b.ge _zedin_cikar_bitis");
    asm_yaz("    ldr x22, [x19, #16]");
    asm_yaz("    sub x21, x21, #1");
    asm_yaz("_zedin_cikar_dongu:");
    asm_yaz("    add x0, x20, #1");
    asm_yaz("    cmp x0, x21");
    asm_yaz("    b.ge _zedin_cikar_son");
    asm_yaz("    ldr x0, [x22, x0, lsl #3]");
    asm_yaz("    str x0, [x22, x20, lsl #3]");
    asm_yaz("    add x20, x20, #1");
    asm_yaz("    b _zedin_cikar_dongu");
    asm_yaz("_zedin_cikar_son:");
    asm_yaz("    str x21, [x19, #8]");
    asm_yaz("_zedin_cikar_bitis:");
    asm_yaz("    ldp x21, x22, [sp], #16");
    asm_yaz("    ldp x19, x20, [sp], #16");
    asm_yaz("    ldp x29, x30, [sp], #16");
    asm_yaz("    ret");
    veri_yaz(".section .data");''')

# B: olmu liste etiketi yardimci fonksiyonlarini sil
degistir("B-liste-eti-fonklar",
'''// Degisken bul: etiket adi don
fonk liste_etiket_soy(etiket) {
    // "liste:_str_1" -> "_str_1"
    eger uzunluk(etiket) > 6 ve etiket[0] == "l" ve etiket[1] == "i" ve etiket[2] == "s" ve etiket[3] == "t" ve etiket[4] == "e" ve etiket[5] == ":" {
        don alt_string(etiket, 6, uzunluk(etiket));
    }
    don etiket;
}

fonk etiket_liste_mi(etiket) {
    eger uzunluk(etiket) > 6 ve etiket[0] == "l" ve etiket[1] == "i" ve etiket[2] == "s" ve etiket[3] == "t" ve etiket[4] == "e" ve etiket[5] == ":" {
        don tuz;
    }
    don ters;
}

fonk degisken_bul(isim) {''',
'''// Degisken bul: etiket adi don
fonk degisken_bul(isim) {''')

# C: degisken_bul yerel sadeleştirme (liste alias yok)
degistir("C-degisken-bul-yerel",
'''            eger _yerel_degiskenler[yi][0] == isim {
                degisken yoff2 = _yerel_degiskenler[yi][1];
                eger yoff2 == -1 { don _yerel_degiskenler[yi][2]; } // "liste:" + etiket
                don "__yerel_" + metine(yoff2) + "__";
            }''',
'''            eger _yerel_degiskenler[yi][0] == isim {
                don "__yerel_" + metine(_yerel_degiskenler[yi][1]) + "__";
            }''')

# D: degisken_bul global sadeleştirme
degistir("D-degisken-bul-global",
'''        eger _degiskenler[i][0] == isim {
            eger uzunluk(_degiskenler[i]) > 2 ve _degiskenler[i][2] == "liste" {
                don "liste:" + _degiskenler[i][1];
            }
            don _degiskenler[i][1];
        }''',
'''        eger _degiskenler[i][0] == isim {
            don _degiskenler[i][1];
        }''')

# E: ID yukleme sadeleştirme
degistir("E-id-yukleme",
'''            eger etiket_liste_mi(etiket) {
                // Liste alias'i: dogrudan blogun adresini yukle (pointer degil, veri!)
                asm_yaz("    adr x0, " + liste_etiket_soy(etiket));
            } yoksa {
                eger etiket[0] == "_" ve uzunluk(etiket) > 8 ve etiket[1] == "_" {
                    degisken off_str = "";
                    degisken oi = 8;
                    iken oi < uzunluk(etiket) ve etiket[oi] != "_" {
                        off_str = off_str + etiket[oi];
                        oi = oi + 1;
                    }
                    asm_yaz("    ldr x0, [x29, #-" + off_str + "]");
                } yoksa {
                    asm_yaz("    adr x1, " + etiket);
                    asm_yaz("    ldr x0, [x1]");
                }
            }''',
'''            eger etiket[0] == "_" ve uzunluk(etiket) > 8 ve etiket[1] == "_" {
                degisken off_str = "";
                degisken oi = 8;
                iken oi < uzunluk(etiket) ve etiket[oi] != "_" {
                    off_str = off_str + etiket[oi];
                    oi = oi + 1;
                }
                asm_yaz("    ldr x0, [x29, #-" + off_str + "]");
            } yoksa {
                asm_yaz("    adr x1, " + etiket);
                asm_yaz("    ldr x0, [x1]");
            }''')

# F: uzunluk (liste=heap len) + ekle/cikar CAGRI durumlari
degistir("F-uzunluk-ekle-cikar",
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
        }''',
'''        eger fn_isim == "uzunluk" ve uzunluk(fn_arglar) == 1 {
            degisken hedef_ifade = fn_arglar[0];
            eger hedef_ifade[0] == "ID" ve degisken_tip_bul_tam(hedef_ifade[1]) == "metin" {
                kodla_ifade(hedef_ifade);
                asm_yaz("    bl _zedin_strlen");
                don 0;
            }
            eger hedef_ifade[0] == "STR" {
                degisken uzun_st_etiket = yeni_str_etiketi();
                asm_str_tanimla(uzun_st_etiket, hedef_ifade[1]);
                asm_yaz("    adr x0, " + uzun_st_etiket);
                asm_yaz("    bl _zedin_strlen");
                don 0;
            }
            // Liste (heap struct): uzunluk = [x0 + 8]
            kodla_ifade(hedef_ifade);
            asm_yaz("    ldr x0, [x0, #8]");
            don 0;
        }

        eger fn_isim == "ekle" ve uzunluk(fn_arglar) == 2 {
            kodla_ifade(fn_arglar[0]);
            asm_yaz("    str x0, [sp, #-16]!");
            kodla_ifade(fn_arglar[1]);
            asm_yaz("    mov x1, x0");
            asm_yaz("    ldr x0, [sp]");
            asm_yaz("    add sp, sp, #16");
            asm_yaz("    bl _zedin_ekle");
            don 0;
        }

        eger fn_isim == "cikar" ve uzunluk(fn_arglar) == 2 {
            kodla_ifade(fn_arglar[0]);
            asm_yaz("    str x0, [sp, #-16]!");
            kodla_ifade(fn_arglar[1]);
            asm_yaz("    mov x1, x0");
            asm_yaz("    ldr x0, [sp]");
            asm_yaz("    add sp, sp, #16");
            asm_yaz("    bl _zedin_cikar");
            don 0;
        }''')

# G: LISTE literal -> heap liste
degistir("G-liste-literal",
'''    eger dt == "LISTE" {
        degisken elemanlar = ifade[1];
        degisken liste_etiket = yeni_str_etiketi();
        // Tek blok, ardisik .quad dizisi -> runtime index destegi icin sart
        degisken satir = liste_etiket + ": .quad ";
        degisken li = 0;
        iken li < uzunluk(elemanlar) {
            eger li > 0 { satir = satir + ", "; }
            satir = satir + "0";
            li = li + 1;
        }
        eger uzunluk(elemanlar) == 0 { satir = liste_etiket + ": .quad 0"; }
        ekle(_degisken_satirlar, satir);
        ekle(_degisken_satirlar, liste_etiket + "_len: .quad " + metine(uzunluk(elemanlar)));
        li = 0;
        iken li < uzunluk(elemanlar) {
            kodla_ifade(elemanlar[li]);
            asm_yaz("    adr x1, " + liste_etiket);
            eger li > 0 {
                asm_yaz("    add x1, x1, #" + metine(li * 8));
            }
            asm_yaz("    str x0, [x1]");
            li = li + 1;
        }
        asm_yaz("    adr x0, " + liste_etiket);
        don 0;
    }''',
'''    eger dt == "LISTE" {
        degisken elemanlar = ifade[1];
        asm_yaz("    mov x0, #" + metine(uzunluk(elemanlar)));
        asm_yaz("    bl _zedin_liste_yeni");
        asm_yaz("    stp x0, x1, [sp, #-16]!");
        degisken li = 0;
        iken li < uzunluk(elemanlar) {
            kodla_ifade(elemanlar[li]);
            asm_yaz("    ldr x1, [sp]");
            asm_yaz("    ldr x1, [x1, #16]");
            eger li > 0 {
                asm_yaz("    add x1, x1, #" + metine(li * 8));
            }
            asm_yaz("    str x0, [x1]");
            li = li + 1;
        }
        asm_yaz("    ldp x0, x1, [sp], #16");
        don 0;
    }''')

# H: INDEX okuma - heap data ptr
degistir("H-index-oku",
'''        asm_yaz("    mov x21, x0");     // index'i kaydet
        kodla_ifade(ifade[1]);          // liste adresi -> x0
        asm_yaz("    lsl x21, x21, #3"); // index * 8''',
'''        asm_yaz("    mov x21, x0");     // index'i kaydet
        kodla_ifade(ifade[1]);          // liste adresi -> x0
        asm_yaz("    ldr x0, [x0, #16]"); // data ptr (heap struct)
        asm_yaz("    lsl x21, x21, #3"); // index * 8''')

# I: ATAMA INDEX yazma - heap data ptr
degistir("I-index-yaz",
'''            asm_yaz("    mov x21, x0");
            kodla_ifade(hedef[1]);       // liste adresi -> x0
            asm_yaz("    lsl x21, x21, #3");''',
'''            asm_yaz("    mov x21, x0");
            kodla_ifade(hedef[1]);       // liste adresi -> x0
            asm_yaz("    ldr x0, [x0, #16]"); // data ptr (heap struct)
            asm_yaz("    lsl x21, x21, #3");''')

# J: DEGISKEN - liste alias ozel durumunu kaldir, LISTE tipini kaydet
degistir("J-degisken-liste",
'''        degisken isim = stmt[1];

        // Ozel durum: liste literali -> ekstra pointer slotu acma,
        // ismi dogrudan liste bellek blogunun etiketine bagla (alias)
        eger uzunluk(stmt) > 2 ve stmt[2] != bos ve stmt[2][0] == "LISTE" {
            degisken elemanlar = stmt[2][1];
            degisken liste_etiket = yeni_str_etiketi();
            degisken satir = liste_etiket + ": .quad ";
            degisken li = 0;
            iken li < uzunluk(elemanlar) {
                eger li > 0 { satir = satir + ", "; }
                satir = satir + "0";
                li = li + 1;
            }
            eger uzunluk(elemanlar) == 0 { satir = liste_etiket + ": .quad 0"; }
            ekle(_degisken_satirlar, satir);
            ekle(_degisken_satirlar, liste_etiket + "_len: .quad " + metine(uzunluk(elemanlar)));
            li = 0;
            iken li < uzunluk(elemanlar) {
                kodla_ifade(elemanlar[li]);
                asm_yaz("    adr x1, " + liste_etiket);
                eger li > 0 { asm_yaz("    add x1, x1, #" + metine(li * 8)); }
                asm_yaz("    str x0, [x1]");
                li = li + 1;
            }
            // ismi dogrudan liste etiketine alias et (yerel modda da calisir mi kontrolu asagida)
            eger _yerel_mod {
                // yerel kapsamda liste alias'i icin ozel bir kayit: [isim, -1, "liste:" + etiket]
                ekle(_yerel_degiskenler, [isim, -1, "liste:" + liste_etiket]);
            } yoksa {
                ekle(_degiskenler, [isim, liste_etiket, "liste"]);
            }
            don 0;
        }

        degisken ifade_tipi = "sayi";
        eger uzunluk(stmt) > 2 ve stmt[2] != bos {
            eger stmt[2][0] == "STR" { ifade_tipi = "metin"; }
            yoksa eger ifade_metin_mi(stmt[2]) { ifade_tipi = "metin"; }
        }''',
'''        degisken isim = stmt[1];
        degisken ifade_tipi = "sayi";
        eger uzunluk(stmt) > 2 ve stmt[2] != bos {
            eger stmt[2][0] == "STR" { ifade_tipi = "metin"; }
            yoksa eger stmt[2][0] == "LISTE" { ifade_tipi = "liste"; }
            yoksa eger ifade_metin_mi(stmt[2]) { ifade_tipi = "metin"; }
        }''')

open(p, "w", encoding="utf-8").write(s)
print("TAMAM")
