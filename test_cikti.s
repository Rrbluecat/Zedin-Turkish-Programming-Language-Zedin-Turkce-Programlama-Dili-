.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #10
    adr x1, _var_x
    str x0, [x1]
    mov x0, #0
    adr x1, _var_i
    str x0, [x1]
    mov x0, #0
    adr x1, _var_toplam
    str x0, [x1]
    adr x1, _var_x
    ldr x0, [x1]
    mov x9, x0
    mov x0, #5
    cmp x9, x0
    b.le _L1
    adr x0, _str_1
    bl puts
    b _L2
_L1:
    adr x0, _str_2
    bl puts
_L2:
_L3:
    adr x1, _var_i
    ldr x0, [x1]
    mov x9, x0
    mov x0, #5
    cmp x9, x0
    b.ge _L4
    adr x1, _var_toplam
    ldr x0, [x1]
    mov x9, x0
    adr x1, _var_i
    ldr x0, [x1]
    mov x10, x0
    mov x0, x9
    add x0, x0, x10
    adr x1, _var_toplam
    str x0, [x1]
    adr x1, _var_i
    ldr x0, [x1]
    mov x9, x0
    mov x0, #1
    mov x10, x0
    mov x0, x9
    add x0, x0, x10
    adr x1, _var_i
    str x0, [x1]
    b _L3
_L4:
    adr x1, _var_toplam
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_var_x: .quad 0
_var_i: .quad 0
_var_toplam: .quad 0
_str_1: .asciz "x buyuk"
_str_2: .asciz "x kucuk"
_fmt_sayi: .byte 37, 100, 10, 0
