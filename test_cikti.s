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
    adr x1, _var_x
    ldr x0, [x1]
    mov x9, x0
    adr x1, _var_y
    ldr x0, [x1]
    mov x10, x0
    mov x0, x9
    add x0, x0, x10
    adr x1, _var_z
    str x0, [x1]
    adr x0, _str_1
    bl puts
    adr x1, _var_z
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x1, _var_x
    ldr x0, [x1]
    mov x9, x0
    adr x1, _var_y
    ldr x0, [x1]
    mov x10, x0
    mov x0, x9
    mul x0, x0, x10
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_var_x: .quad 0
_var_y: .quad 0
_var_z: .quad 0
_str_1: .asciz "Toplam:"
_fmt_sayi: .byte 37, 100, 10, 0
