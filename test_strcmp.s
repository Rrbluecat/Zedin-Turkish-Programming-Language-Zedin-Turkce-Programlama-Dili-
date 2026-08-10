.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_1
    adr x1, _var_isim
    str x0, [x1]
    adr x1, _var_isim
    ldr x0, [x1]
    mov x19, x0
    adr x0, _str_2
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L1
    adr x0, _str_3
    bl puts
    b _L2
_L1:
    adr x0, _str_4
    bl puts
_L2:
    mov x0, #0
    adr x1, _var_sayac
    str x0, [x1]
    adr x0, _str_5
    adr x1, _var_kelime
    str x0, [x1]
_L3:
    adr x1, _var_kelime
    ldr x0, [x1]
    mov x19, x0
    adr x0, _str_6
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.eq _L4
    adr x1, _var_sayac
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var_sayac
    str x0, [x1]
    adr x1, _var_sayac
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    cmp x22, x0
    b.le _L5
    adr x0, _str_7
    adr x1, _var_kelime
    str x0, [x1]
    b _L6
_L5:
_L6:
    b _L3
_L4:
    adr x1, _var_sayac
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret
.section .data
_var_isim: .quad 0
_str_1: .asciz "eger"
_str_2: .asciz "eger"
_str_3: .asciz "eslesti"
_str_4: .asciz "eslesmedi"
_var_sayac: .quad 0
_var_kelime: .quad 0
_str_5: .asciz "abc"
_str_6: .asciz "xyz"
_str_7: .asciz "xyz"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
