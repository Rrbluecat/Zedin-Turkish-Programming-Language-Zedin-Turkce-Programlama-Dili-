.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_1
    adr x1, _var_m
    str x0, [x1]
    adr x1, _var_m
    ldr x0, [x1]
    bl _zedin_strlen
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    mov x21, x0
    adr x1, _var_m
    ldr x0, [x1]
    mov x1, x21
    bl _zedin_str_chr
    adr x1, _var_c
    str x0, [x1]
    adr x1, _var_c
    ldr x0, [x1]
    bl puts
    mov x0, #1
    mov x21, x0
    adr x1, _var_m
    ldr x0, [x1]
    mov x1, x21
    bl _zedin_str_chr
    bl puts
    mov x0, #123
    bl _zedin_metine
    adr x1, _var_s
    str x0, [x1]
    adr x1, _var_s
    ldr x0, [x1]
    bl puts
    adr x0, _str_2
    bl _zedin_sayiya
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_3
    bl _zedin_char_kodu
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
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
.section .data
_var_m: .quad 0
_str_1: .asciz "merhaba"
_var_c: .quad 0
_var_s: .quad 0
_str_2: .asciz "456"
_str_3: .asciz "A"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
