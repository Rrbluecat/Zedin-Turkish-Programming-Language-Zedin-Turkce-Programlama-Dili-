.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #10
    adr x1, _str_1
    str x0, [x1]
    mov x0, #20
    adr x1, _str_1
    add x1, x1, #8
    str x0, [x1]
    mov x0, #30
    adr x1, _str_1
    add x1, x1, #16
    str x0, [x1]
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
    adr x1, _var_i
    ldr x0, [x1]
    mov x21, x0
    adr x0, _str_1
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
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
    mov x0, #99
    mov x22, x0
    mov x0, #1
    mov x21, x0
    adr x0, _str_1
    lsl x21, x21, #3
    add x0, x0, x21
    str x22, [x0]
    mov x0, #1
    mov x21, x0
    adr x0, _str_1
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x1, _str_1_len
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_str_1: .quad 0, 0, 0
_str_1_len: .quad 3
_var_i: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
