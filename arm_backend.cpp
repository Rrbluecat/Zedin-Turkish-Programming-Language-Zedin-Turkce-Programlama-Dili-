// ============================================================
// arm_backend.cpp - Zedin ARM64 Assembly Backend
// Kullanim: zedin --arm program.zed → program.s
//           as -o program.o program.s
//           ld -o program program.o -lc
// ============================================================

#pragma once
#include "Bytecode.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <map>

using namespace std;

class ARMBackend {
    shared_ptr<BChunk> chunk;
    stringstream cikti;
    int etiket_sayac = 0;
    vector<string> sabitler;     // string sabitleri
    map<string, int> degiskenler; // degisken → stack offset
    int stack_derinligi = 0;
    int yerel_boyut = 0;

    string yeni_etiket(string on_ek = "L") {
        return on_ek + to_string(etiket_sayac++);
    }

    void yaz(string satir, int girinti = 1) {
        if (girinti) cikti << "    ";
        cikti << satir << "\n";
    }

    void etiket(string isim) {
        cikti << isim << ":\n";
    }

    // Stack'e değer it (x0 register'ından)
    void stack_it() {
        yaz("str x0, [sp, #-16]!");
        stack_derinligi++;
    }

    // Stack'ten değer al (x0'a)
    void stack_al() {
        yaz("ldr x0, [sp], #16");
        stack_derinligi--;
    }

    // Stack'ten iki değer al (x0, x1'e)
    void stack_al2() {
        yaz("ldr x1, [sp], #16");  // ikinci (sag)
        yaz("ldr x0, [sp], #16");  // birinci (sol) -- dikkat: ters sira
        // Aslında sol x0, sag x1 olacak şekilde düzelt
        yaz("// sol=x0, sag=x1");
        stack_derinligi -= 2;
    }

public:
    ARMBackend(shared_ptr<BChunk> c) : chunk(c) {}

    string uret() {
        // --- Header ---
        cikti << "// Zedin ARM64 Assembly Ciktisi\n";
        cikti << "// Zedin ARM Backend v0.1\n\n";
        cikti << ".section .text\n";
        cikti << ".global main\n";
        cikti << ".align 2\n\n";

        // --- String sabitler bolumu ---
        uret_sabit_bolumu();

        // --- Main fonksiyon ---
        etiket("main");
        yaz("// Stack frame kur");
        yaz("stp x29, x30, [sp, #-16]!");
        yaz("mov x29, sp");
        yaz("");

        // Yerel degiskenler icin yer ayir
        int yerel_alan = hesapla_yerel_alan();
        if (yerel_alan > 0) {
            yaz("sub sp, sp, #" + to_string(yerel_alan));
        }

        // --- Bytecode'u cevir ---
        uret_bytecode(chunk, false);

        // --- Cikis ---
        yaz("");
        yaz("// Program bitis");
        yaz("mov x0, #0");      // return 0
        if (yerel_alan > 0) {
            yaz("add sp, sp, #" + to_string(yerel_alan));
        }
        yaz("ldp x29, x30, [sp], #16");
        yaz("ret");
        yaz("");

        return cikti.str();
    }

private:
    int hesapla_yerel_alan() {
        // Her degisken icin 16 byte (ARM64 hizalama)
        int sayi = 0;
        for (auto& op : chunk->code) {
            if (op == (uint8_t)OpCode::OP_TANI) sayi++;
        }
        return sayi * 16;
    }

    void uret_sabit_bolumu() {
        // String sabitlerini .data bolumune yaz
        cikti << ".section .data\n";
        cikti << ".align 3\n";

        // printf format stringleri
        cikti << "_fmt_int:   .asciz \"%lld\\n\"\n";
        cikti << "_fmt_float: .asciz \"%g\\n\"\n";
        cikti << "_fmt_str:   .asciz \"%s\\n\"\n";
        cikti << "_fmt_true:  .asciz \"tuz\\n\"\n";
        cikti << "_fmt_false: .asciz \"ters\\n\"\n";
        cikti << "_fmt_null:  .asciz \"bos\\n\"\n";

        // Programdaki string sabitleri
        for (size_t i = 0; i < chunk->sabitler.size(); i++) {
            if (chunk->sabitler[i].type == BVal::STR) {
                cikti << "_str" << i << ": .asciz \"" 
                      << chunk->sabitler[i].str << "\"\n";
            }
        }

        cikti << "\n.section .text\n\n";
    }

    void uret_bytecode(shared_ptr<BChunk> c, bool fonksiyon_mu) {
        size_t i = 0;
        while (i < c->code.size()) {
            OpCode op = (OpCode)c->code[i];
            i++;

            switch (op) {
                // --- Sabit yukleme ---
                case OpCode::OP_SAYI: {
                    int idx = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    double val = c->sabitler[idx].num;
                    long long ival = (long long)val;
                    yaz("// SAYI " + to_string(ival));
                    if (ival >= 0 && ival <= 65535) {
                        yaz("mov x0, #" + to_string(ival));
                    } else {
                        yaz("mov x0, #" + to_string(ival & 0xFFFF));
                        yaz("movk x0, #" + to_string((ival >> 16) & 0xFFFF) + ", lsl #16");
                    }
                    stack_it();
                    break;
                }

                case OpCode::OP_METIN: {
                    int idx = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    yaz("// METIN");
                    yaz("adr x0, _str" + to_string(idx) + "");
                    yaz("// str ref handled" + to_string(idx) + "OFF");
                    stack_it();
                    break;
                }

                case OpCode::OP_TUZ: {
                    yaz("// TUZ (true=1)");
                    yaz("mov x0, #1");
                    stack_it();
                    break;
                }

                case OpCode::OP_TERS: {
                    yaz("// TERS (false=0)");
                    yaz("mov x0, #0");
                    stack_it();
                    break;
                }

                case OpCode::OP_BOS: {
                    yaz("// BOS (null=0)");
                    yaz("mov x0, #0");
                    stack_it();
                    break;
                }

                // --- Aritmetik ---
                case OpCode::OP_TOPLA: {
                    yaz("// TOPLA");
                    yaz("ldr x1, [sp], #16");   // sag
                    yaz("ldr x0, [sp], #16");   // sol
                    yaz("add x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_CIKAR: {
                    yaz("// CIKAR");
                    yaz("ldr x1, [sp], #16");   // sag
                    yaz("ldr x0, [sp], #16");   // sol
                    yaz("sub x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_CARP: {
                    yaz("// CARP");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("mul x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_BOL: {
                    yaz("// BOL");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("sdiv x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_MOD: {
                    yaz("// MOD");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("sdiv x2, x0, x1");
                    yaz("msub x0, x2, x1, x0");  // x0 = x0 - (x2 * x1)
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_NEG: {
                    yaz("// NEG");
                    yaz("ldr x0, [sp], #16");
                    yaz("neg x0, x0");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                // --- Karsilastirma ---
                case OpCode::OP_ESIT: {
                    yaz("// ESIT (==)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, eq");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_ESIT_DEGIL: {
                    yaz("// ESIT_DEGIL (!=)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, ne");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_BUYUK: {
                    yaz("// BUYUK (>)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, gt");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_KUCUK: {
                    yaz("// KUCUK (<)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, lt");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_BUYUK_ESIT: {
                    yaz("// BUYUK_ESIT (>=)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, ge");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_KUCUK_ESIT: {
                    yaz("// KUCUK_ESIT (<=)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, x1");
                    yaz("cset x0, le");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                // --- Mantik ---
                case OpCode::OP_VE: {
                    yaz("// VE (and)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("and x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_VEYA: {
                    yaz("// VEYA (or)");
                    yaz("ldr x1, [sp], #16");
                    yaz("ldr x0, [sp], #16");
                    yaz("orr x0, x0, x1");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                case OpCode::OP_DEGIL: {
                    yaz("// DEGIL (not)");
                    yaz("ldr x0, [sp], #16");
                    yaz("cmp x0, #0");
                    yaz("cset x0, eq");
                    yaz("str x0, [sp, #-16]!");
                    break;
                }

                // --- Atlama (if/while) ---
                case OpCode::OP_ATLA: {
                    int offset = (int16_t)((int)c->code[i] | ((int)c->code[i+1] << 8));
                    i += 2;
                    int hedef = (int)i + offset;
                    yaz("// ATLA → " + to_string(hedef));
                    yaz("b _L" + to_string(hedef));
                    break;
                }

                case OpCode::OP_ATLA_YANLIS: {
                    int offset = (int16_t)((int)c->code[i] | ((int)c->code[i+1] << 8));
                    i += 2;
                    int hedef = (int)i + offset;
                    yaz("// ATLA_YANLIS → " + to_string(hedef));
                    yaz("ldr x0, [sp], #16");
                    yaz("cbz x0, _L" + to_string(hedef));
                    // Hedef etiketini kaydet
                    break;
                }

                case OpCode::OP_ATLA_DOGRU: {
                    int offset = (int16_t)((int)c->code[i] | ((int)c->code[i+1] << 8));
                    i += 2;
                    int hedef = (int)i + offset;
                    yaz("// ATLA_DOGRU → " + to_string(hedef));
                    yaz("ldr x0, [sp], #16");
                    yaz("cbnz x0, _L" + to_string(hedef));
                    break;
                }

                // --- Degisken islemleri ---
                case OpCode::OP_TANI: {
                    int idx = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    string isim = c->sabitler[idx].str;
                    int offset = degiskenler.size() * 16;
                    degiskenler[isim] = offset;
                    yaz("// TANI " + isim + " @ fp-" + to_string(offset+16));
                    yaz("ldr x0, [sp], #16");  // deger stack'ten al
                    yaz("str x0, [x29, #-" + to_string(offset+16) + "]");
                    break;
                }

                case OpCode::OP_YUKLE: {
                    int idx = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    string isim = c->sabitler[idx].str;
                    if (degiskenler.count(isim)) {
                        int offset = degiskenler[isim];
                        yaz("// YUKLE " + isim);
                        yaz("ldr x0, [x29, #-" + to_string(offset+16) + "]");
                        yaz("str x0, [sp, #-16]!");
                    } else {
                        yaz("// YUKLE " + isim + " (global - TODO)");
                        yaz("mov x0, #0");
                        yaz("str x0, [sp, #-16]!");
                    }
                    break;
                }

                case OpCode::OP_SAKLA: {
                    int idx = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    string isim = c->sabitler[idx].str;
                    if (degiskenler.count(isim)) {
                        int offset = degiskenler[isim];
                        yaz("// SAKLA " + isim);
                        yaz("ldr x0, [sp], #16");
                        yaz("str x0, [x29, #-" + to_string(offset+16) + "]");
                    }
                    break;
                }

                // --- Cikti ---
                case OpCode::OP_YAZ: {
                    int argc = (int)c->code[i] | ((int)c->code[i+1] << 8);
                    i += 2;
                    yaz("// YAZ (" + to_string(argc) + " arg)");
                    // Basit: sadece integer yaz
                    yaz("ldr x1, [sp], #16");   // deger
                    yaz("adr x0, _fmt_int");
                    yaz("add x0, x0, _fmt_intOFF");
                    yaz("bl printf");
                    break;
                }

                // --- Diger ---
                case OpCode::OP_POP: {
                    yaz("// POP");
                    yaz("add sp, sp, #16");
                    stack_derinligi--;
                    break;
                }

                case OpCode::OP_HALT: {
                    yaz("// HALT");
                    // main'in sonunda ret yapacagiz
                    break;
                }

                case OpCode::OP_DON: {
                    yaz("// DON");
                    yaz("ldr x0, [sp], #16");
                    if (fonksiyon_mu) {
                        yaz("ldp x29, x30, [sp], #16");
                        yaz("ret");
                    }
                    break;
                }

                case OpCode::OP_DON_BOS: {
                    yaz("// DON_BOS");
                    yaz("mov x0, #0");
                    if (fonksiyon_mu) {
                        yaz("ldp x29, x30, [sp], #16");
                        yaz("ret");
                    }
                    break;
                }

                default: {
                    // Argumanlı opcode'lar için 2 byte atla
                    yaz("// TODO: opcode " + to_string((int)op));
                    break;
                }
            }

            // Etiket noktası
            cikti << "_L" << i << ":\n";
        }
    }
};

// ============================================================
// Kullanim fonksiyonu
// ============================================================
string zedin_arm_uret(shared_ptr<BChunk> chunk) {
    ARMBackend backend(chunk);
    return backend.uret();
}
