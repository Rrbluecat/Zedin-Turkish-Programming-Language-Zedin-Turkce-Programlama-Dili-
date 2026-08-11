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

degistir("E1-global",
'''degisken _yerel_offset = 0;
degisken _fonk_satirlar = [];''',
'''degisken _yerel_offset = 0;
degisken _fonk_satirlar = [];
degisken _dongu_etiketler = [];''')

degistir("E2-bool",
'''    eger dt == "STR" {
        degisken etiket = yeni_str_etiketi();
        asm_str_tanimla(etiket, ifade[1]);
        asm_yaz("    adr x0, " + etiket);
        don 0;
    }''',
'''    eger dt == "STR" {
        degisken etiket = yeni_str_etiketi();
        asm_str_tanimla(etiket, ifade[1]);
        asm_yaz("    adr x0, " + etiket);
        don 0;
    }
    eger dt == "BOOL" {
        eger ifade[1] == "1" {
            asm_yaz("    mov x0, #1");
        } yoksa {
            asm_yaz("    mov x0, #0");
        }
        don 0;
    }''')

degistir("E3-ve-veya-yuzde",
'''    eger dt == "BINOP" {
        degisken op = ifade[1];
        kodla_ifade(ifade[2]);
        asm_yaz("    mov x22, x0");
        kodla_ifade(ifade[3]);
        asm_yaz("    mov x23, x0");
        asm_yaz("    mov x0, x22");
        eger op == "+" { asm_yaz("    add x0, x0, x23"); }
        eger op == "-" { asm_yaz("    sub x0, x0, x23"); }
        eger op == "*" { asm_yaz("    mul x0, x0, x23"); }
        eger op == "/" { asm_yaz("    sdiv x0, x0, x23"); }
        don 0;
    }''',
'''    eger dt == "BINOP" {
        degisken op = ifade[1];
        eger op == "ve" {
            degisken ve_son = yeni_etiket();
            degisken ve_sifir = yeni_etiket();
            kodla_ifade(ifade[2]);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    b.eq " + ve_sifir);
            kodla_ifade(ifade[3]);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    cset x0, ne");
            asm_yaz("    b " + ve_son);
            asm_yaz(ve_sifir + ":");
            asm_yaz("    mov x0, #0");
            asm_yaz(ve_son + ":");
            don 0;
        }
        eger op == "veya" {
            degisken veya_son = yeni_etiket();
            degisken veya_bir = yeni_etiket();
            kodla_ifade(ifade[2]);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    b.ne " + veya_bir);
            kodla_ifade(ifade[3]);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    cset x0, ne");
            asm_yaz("    b " + veya_son);
            asm_yaz(veya_bir + ":");
            asm_yaz("    mov x0, #1");
            asm_yaz(veya_son + ":");
            don 0;
        }
        kodla_ifade(ifade[2]);
        asm_yaz("    mov x22, x0");
        kodla_ifade(ifade[3]);
        asm_yaz("    mov x23, x0");
        asm_yaz("    mov x0, x22");
        eger op == "+" { asm_yaz("    add x0, x0, x23"); }
        eger op == "-" { asm_yaz("    sub x0, x0, x23"); }
        eger op == "*" { asm_yaz("    mul x0, x0, x23"); }
        eger op == "/" { asm_yaz("    sdiv x0, x0, x23"); }
        eger op == "%" {
            asm_yaz("    sdiv x24, x22, x23");
            asm_yaz("    msub x0, x24, x23, x22");
        }
        don 0;
    }''')

degistir("E4-eger-kosul",
'''        } yoksa eger kosul[0] == "BINOP" {
            kodla_ifade(kosul[2]);
            asm_yaz("    mov x22, x0");
            kodla_ifade(kosul[3]);
            asm_yaz("    cmp x22, x0");
            asm_yaz("    " + ters_dal(kosul[1]) + " " + etiket_else);''',
'''        } yoksa eger kosul[0] == "BINOP" ve (kosul[1] == "==" veya kosul[1] == "!=" veya kosul[1] == "<" veya kosul[1] == ">" veya kosul[1] == "<=" veya kosul[1] == ">=") {
            kodla_ifade(kosul[2]);
            asm_yaz("    mov x22, x0");
            kodla_ifade(kosul[3]);
            asm_yaz("    cmp x22, x0");
            asm_yaz("    " + ters_dal(kosul[1]) + " " + etiket_else);''')

degistir("E5-iken-push",
'''    eger st == "IKEN" {
        degisken dongu_bas = yeni_etiket();
        degisken dongu_son = yeni_etiket();
        degisken kosul = stmt[1];
        degisken govde = stmt[2][1];''',
'''    eger st == "IKEN" {
        degisken dongu_bas = yeni_etiket();
        degisken dongu_son = yeni_etiket();
        ekle(_dongu_etiketler, [dongu_bas, dongu_son]);
        degisken kosul = stmt[1];
        degisken govde = stmt[2][1];''')

degistir("E6-iken-kosul-pop",
'''        } yoksa eger kosul[0] == "BINOP" {
            kodla_ifade(kosul[2]);
            asm_yaz("    mov x22, x0");
            kodla_ifade(kosul[3]);
            asm_yaz("    cmp x22, x0");
            asm_yaz("    " + ters_dal(kosul[1]) + " " + dongu_son);
        } yoksa {
            kodla_ifade(kosul);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    b.eq " + dongu_son);
        }

        // Govde
        degisken gi = 0;
        iken gi < uzunluk(govde) {
            kodla_stmt(govde[gi]);
            gi = gi + 1;
        }
        asm_yaz("    b " + dongu_bas);
        asm_yaz(dongu_son + ":");
        don 0;
    }''',
'''        } yoksa eger kosul[0] == "BINOP" ve (kosul[1] == "==" veya kosul[1] == "!=" veya kosul[1] == "<" veya kosul[1] == ">" veya kosul[1] == "<=" veya kosul[1] == ">=") {
            kodla_ifade(kosul[2]);
            asm_yaz("    mov x22, x0");
            kodla_ifade(kosul[3]);
            asm_yaz("    cmp x22, x0");
            asm_yaz("    " + ters_dal(kosul[1]) + " " + dongu_son);
        } yoksa {
            kodla_ifade(kosul);
            asm_yaz("    cmp x0, #0");
            asm_yaz("    b.eq " + dongu_son);
        }

        // Govde
        degisken gi = 0;
        iken gi < uzunluk(govde) {
            kodla_stmt(govde[gi]);
            gi = gi + 1;
        }
        asm_yaz("    b " + dongu_bas);
        asm_yaz(dongu_son + ":");
        cikar(_dongu_etiketler, uzunluk(_dongu_etiketler) - 1);
        don 0;
    }''')

degistir("E7-kir-devam",
'''        asm_yaz("    b " + dongu_bas);
        asm_yaz(dongu_son + ":");
        cikar(_dongu_etiketler, uzunluk(_dongu_etiketler) - 1);
        don 0;
    }

    eger st == "IFADE" {''',
'''        asm_yaz("    b " + dongu_bas);
        asm_yaz(dongu_son + ":");
        cikar(_dongu_etiketler, uzunluk(_dongu_etiketler) - 1);
        don 0;
    }

    eger st == "KIR" {
        eger uzunluk(_dongu_etiketler) > 0 {
            asm_yaz("    b " + _dongu_etiketler[uzunluk(_dongu_etiketler) - 1][1]);
        }
        don 0;
    }

    eger st == "DEVAM" {
        eger uzunluk(_dongu_etiketler) > 0 {
            asm_yaz("    b " + _dongu_etiketler[uzunluk(_dongu_etiketler) - 1][0]);
        }
        don 0;
    }

    eger st == "IFADE" {''')

degistir("E8-sifirla",
'''    _yerel_mod = ters;
    _yerel_degiskenler = [];
    _yerel_offset = 0;''',
'''    _yerel_mod = ters;
    _yerel_degiskenler = [];
    _yerel_offset = 0;
    _dongu_etiketler = [];''')

open(p, "w", encoding="utf-8").write(s)
print("TAMAM")
