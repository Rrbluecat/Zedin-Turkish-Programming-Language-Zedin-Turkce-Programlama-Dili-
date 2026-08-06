.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #10
    adr x1, _str_1_0
    str x0, [x1]
    mov x0, #20
    adr x1, _str_1_1
    str x0, [x1]
    mov x0, #30
    adr x1, _str_1_2
    str x0, [x1]
    adr x0, _str_1_0
    adr x1, _var_liste
    str x0, [x1]
    adr x1, _var_liste
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_var_liste: .quad 0
_str_1_0: .quad 0
_str_1_1: .quad 0
_str_1_2: .quad 0
_str_1_len: .quad 3
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
