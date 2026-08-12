.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_1
    bl puts
    mov x0, #0
    adr x1, _var_i
    str x0, [x1]
_L1:
    adr x1, _var_i
    ldr x0, [x1]
    mov x22, x0
    mov x0, #3
    cmp x22, x0
    b.ge _L2
    mov x0, #0
    adr x1, _var_j
    str x0, [x1]
_L3:
    adr x1, _var_j
    ldr x0, [x1]
    mov x22, x0
    mov x0, #5
    cmp x22, x0
    b.ge _L4
    adr x1, _var_j
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    adr x1, _var_j
    str x0, [x1]
    adr x1, _var_j
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    cmp x22, x0
    b.ne _L5
    b _L3
    b _L6
_L5:
_L6:
    adr x1, _var_j
    ldr x0, [x1]
    mov x22, x0
    mov x0, #4
    cmp x22, x0
    b.ne _L7
    b _L8
_L7:
_L8:
    adr x1, _var_i
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #10
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    str x0, [sp, #-16]!
    adr x1, _var_j
    ldr x0, [x1]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    b _L3
_L4:
    adr x1, _var_i
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    adr x1, _var_i
    str x0, [x1]
    b _L1
_L2:
    adr x0, _str_2
    bl puts
    adr x0, _str_3
    adr x1, _var_selam
    str x0, [x1]
    adr x0, _str_4
    adr x1, _var_dunya
    str x0, [x1]
    adr x1, _var_selam
    ldr x0, [x1]
    str x0, [sp, #-16]!
    adr x1, _var_dunya
    ldr x0, [x1]
    mov x1, x0
    ldr x0, [sp], #16
    mov x19, x0
    mov x20, x1
    mov x0, x19
    bl strlen
    mov x21, x0
    mov x0, x20
    bl strlen
    add x0, x0, x21
    add x0, x0, #1
    bl malloc
    mov x22, x0
    mov x0, x22
    mov x1, x19
    bl strcpy
    mov x0, x22
    mov x1, x20
    bl strcat
    mov x0, x22
    adr x1, _var_mesaj
    str x0, [x1]
    adr x1, _var_mesaj
    ldr x0, [x1]
    bl puts
    adr x1, _var_mesaj
    ldr x0, [x1]
    mov x19, x0
    adr x0, _str_5
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L9
    adr x0, _str_6
    bl puts
    b _L10
_L9:
    adr x0, _str_7
    bl puts
_L10:
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

_zedin_strlen:
    mov x1, x0
    mov x2, #0
_zedin_strlen_dongu:
    ldrb w3, [x1], #1
    cbz w3, _zedin_strlen_bitis
    add x2, x2, #1
    b _zedin_strlen_dongu
_zedin_strlen_bitis:
    mov x0, x2
    ret

_zedin_metine:
    mov x1, x0
    adr x2, _metine_buf
    add x2, x2, #31
    mov x3, #0
    strb w3, [x2]
    mov x4, #10
_zedin_metine_dongu:
    sub x2, x2, #1
    udiv x3, x1, x4
    msub x5, x3, x4, x1
    add x5, x5, #48
    strb w5, [x2]
    mov x1, x3
    cbnz x1, _zedin_metine_dongu
    mov x0, x2
    ret

_zedin_sayiya:
    mov x1, x0
    mov x2, #0
    mov x4, #10
_zedin_sayiya_dongu:
    ldrb w3, [x1], #1
    sub w3, w3, #48
    cmp w3, #9
    b.hi _zedin_sayiya_bitis
    madd x2, x2, x4, x3
    b _zedin_sayiya_dongu
_zedin_sayiya_bitis:
    mov x0, x2
    ret

_zedin_str_chr:
    adr x2, _char_buf
    ldrb w3, [x0, x1]
    strb w3, [x2]
    mov w3, #0
    strb w3, [x2, #1]
    mov x0, x2
    ret

_zedin_char_kodu:
    ldrb w0, [x0]
    ret

_zedin_liste_yeni:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    mov x19, x0
    mov x0, #24
    bl malloc
    mov x20, x0
    lsl x0, x19, #3
    bl malloc
    str x0, [x20, #16]
    str x19, [x20]
    str x19, [x20, #8]
    mov x0, x20
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

_zedin_ekle:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    mov x19, x0
    mov x20, x1
    ldr x21, [x19]
    ldr x22, [x19, #8]
    cmp x22, x21
    b.lt _zedin_ekle_yaz
    cbnz x21, _zedin_ekle_buyut
    mov x21, #4
    b _zedin_ekle_realloc
_zedin_ekle_buyut:
    lsl x21, x21, #1
_zedin_ekle_realloc:
    str x21, [x19]
    ldr x0, [x19, #16]
    lsl x1, x21, #3
    bl realloc
    str x0, [x19, #16]
_zedin_ekle_yaz:
    ldr x0, [x19, #16]
    ldr x1, [x19, #8]
    str x20, [x0, x1, lsl #3]
    add x1, x1, #1
    str x1, [x19, #8]
    mov x0, x19
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

_zedin_cikar:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    mov x19, x0
    mov x20, x1
    ldr x21, [x19, #8]
    cmp x20, x21
    b.ge _zedin_cikar_bitis
    ldr x22, [x19, #16]
    sub x21, x21, #1
_zedin_cikar_dongu:
    add x0, x20, #1
    cmp x0, x21
    b.ge _zedin_cikar_son
    ldr x0, [x22, x0, lsl #3]
    str x0, [x22, x20, lsl #3]
    add x20, x20, #1
    b _zedin_cikar_dongu
_zedin_cikar_son:
    str x21, [x19, #8]
_zedin_cikar_bitis:
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret
.section .data
_str_1: .asciz "--- 1. Döngü Testi (İç İçe, Kır ve Devam) ---"
_var_i: .quad 0
_var_j: .quad 0
_str_2: .asciz "--- 2. Metin Testi (Birleştirme ve Karşılaştırma) ---"
_var_selam: .quad 0
_str_3: .asciz "Merhaba "
_var_dunya: .quad 0
_str_4: .asciz "Zedin"
_var_mesaj: .quad 0
_str_5: .asciz "Merhaba Zedin"
_str_6: .asciz "Eşitlik Yakalandı: Tamam!"
_str_7: .asciz "Hata: Metinler Eşleşmedi!"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
