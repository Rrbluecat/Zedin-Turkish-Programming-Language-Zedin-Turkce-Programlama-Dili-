.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_1
    bl puts
    adr x0, _str_2
    bl puts
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
_str_1: .asciz "Merhaba Zedin!"
_str_2: .asciz "Native compilation calisiyor!"
.section .data
