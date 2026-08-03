.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #5
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kare
    ldp x22, x23, [sp], #16
    adr x1, _var_r1
    str x0, [x1]
    adr x1, _var_r1
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #3
    mov x19, x0
    mov x0, #4
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl topla
    ldp x22, x23, [sp], #16
    adr x1, _var_r2
    str x0, [x1]
    adr x1, _var_r2
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    adr x1, _var_i
    str x0, [x1]
    mov x0, #0
    adr x1, _var_toplam
    str x0, [x1]
_L1:
    adr x1, _var_i
    ldr x0, [x1]
    mov x22, x0
    mov x0, #5
    cmp x22, x0
    b.gt _L2
    adr x1, _var_toplam
    ldr x0, [x1]
    mov x22, x0
    adr x1, _var_i
    ldr x0, [x1]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kare
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var_toplam
    str x0, [x1]
    adr x1, _var_i
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var_i
    str x0, [x1]
    b _L1
_L2:
    adr x1, _var_toplam
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

kare:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    adr x9, _var_x
    str x0, [x9]
    adr x1, _var_x
    ldr x0, [x1]
    mov x22, x0
    adr x1, _var_x
    ldr x0, [x1]
    mov x23, x0
    mov x0, x22
    mul x0, x0, x23
    ldp x29, x30, [sp], #64
    ret
    ldp x29, x30, [sp], #64
    ret

topla:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    adr x9, _var_a
    str x0, [x9]
    adr x9, _var_b
    str x1, [x9]
    adr x1, _var_a
    ldr x0, [x1]
    mov x22, x0
    adr x1, _var_b
    ldr x0, [x1]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #64
    ret
    ldp x29, x30, [sp], #64
    ret
.section .data
_var_x: .quad 0
_var_a: .quad 0
_var_b: .quad 0
_var_r1: .quad 0
_var_r2: .quad 0
_var_i: .quad 0
_var_toplam: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
