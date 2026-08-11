.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _yol
    adr x1, _mod
    bl fopen
    cmp x0, #0
    b.eq _bitis
    bl fclose
_bitis:
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_yol: .asciz "minimal_test.txt"
_mod: .asciz "w"
