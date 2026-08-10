.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_2
    mov x19, x0
    adr x1, _str_1
    bl fopen
    cmp x0, #0
    b.eq _L1
    bl fclose
_L1:
    adr x0, _str_4
    mov x19, x0
    mov x0, #90
    mov x20, x0
    mov x0, x19
    adr x1, _str_3
    bl fopen
    cmp x0, #0
    b.eq _L2
    mov x1, x20
    bl fputc
_L2:
    adr x0, _str_6
    mov x19, x0
    mov x0, #69
    mov x20, x0
    mov x0, x19
    adr x1, _str_5
    bl fopen
    cmp x0, #0
    b.eq _L3
    mov x1, x20
    bl fputc
_L3:
    adr x0, _str_8
    mov x19, x0
    mov x0, #68
    mov x20, x0
    mov x0, x19
    adr x1, _str_7
    bl fopen
    cmp x0, #0
    b.eq _L4
    mov x1, x20
    bl fputc
_L4:
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_str_1: .asciz "w"
_str_2: .asciz "test_cikti_asm.txt"
_str_3: .asciz "ab"
_str_4: .asciz "test_cikti_asm.txt"
_str_5: .asciz "ab"
_str_6: .asciz "test_cikti_asm.txt"
_str_7: .asciz "ab"
_str_8: .asciz "test_cikti_asm.txt"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
