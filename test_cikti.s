.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #3
    mov x19, x0
    mov x0, #4
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl topla
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    mul x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #10
    mov x19, x0
    mov x0, #5
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl topla
    ldp x22, x23, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

topla:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #-8]
    mov x22, x0
    ldr x0, [x29, #-16]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret
.section .data
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
