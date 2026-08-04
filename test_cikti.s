.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_1
    adr x1, _var_isim
    str x0, [x1]
    mov x0, #4
    adr x1, _var_versiyon
    str x0, [x1]
    adr x19, _str_2
    adr x1, _var_isim
    ldr x20, [x1]
    adr x0, _fmt_str_str
    mov x1, x19
    mov x2, x20
    bl printf
    adr x19, _str_3
    adr x1, _var_versiyon
    ldr x0, [x1]
    mov x20, x0
    adr x0, _fmt_str_sayi
    mov x1, x19
    mov x2, x20
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_var_isim: .quad 0
_str_1: .asciz "Zedin"
_var_versiyon: .quad 0
_str_2: .asciz "Dil: "
_str_3: .asciz "Versiyon: "
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
