.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #10
    adr x1, _var_x
    str x0, [x1]
    mov x0, #20
    adr x1, _var_y
    str x0, [x1]
    adr x0, _str_1
    bl puts
    adr x0, _var_x
    ldr x0, [x0]
    adr x1, _var_y
    ldr x1, [x1]
    add x0, x0, x1
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
_str_1: .asciz "Toplam:"
.section .data
_var_x: .quad 0
_var_y: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
