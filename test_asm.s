.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, mesaj
    bl puts
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

.section .data
mesaj: .asciz "Merhaba Zedin!"
