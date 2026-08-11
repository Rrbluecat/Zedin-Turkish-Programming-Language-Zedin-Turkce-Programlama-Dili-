.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #5
    adr x1, _var_a
    str x0, [x1]
    mov x0, #3
    adr x1, _var_b
    str x0, [x1]
    adr x1, _var_a
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L4
    adr x1, _var_b
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L3
_L4:
    mov x0, #0
_L3:
    cmp x0, #0
    b.eq _L1
    adr x0, _str_1
    bl puts
    b _L2
_L1:
    adr x0, _str_2
    bl puts
_L2:
    adr x1, _var_a
    ldr x0, [x1]
    mov x22, x0
    mov x0, #10
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L8
    adr x1, _var_b
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L7
_L8:
    mov x0, #1
_L7:
    cmp x0, #0
    b.eq _L5
    adr x0, _str_3
    bl puts
    b _L6
_L5:
    adr x0, _str_4
    bl puts
_L6:
    mov x0, #17
    adr x1, _var_x
    str x0, [x1]
    adr x1, _var_x
    ldr x0, [x1]
    mov x22, x0
    mov x0, #5
    mov x23, x0
    mov x0, x22
    sdiv x24, x22, x23
    msub x0, x24, x23, x22
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    adr x1, _var_durum
    str x0, [x1]
    adr x1, _var_durum
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L9
    adr x0, _str_5
    bl puts
    b _L10
_L9:
    adr x0, _str_6
    bl puts
_L10:
    mov x0, #0
    adr x1, _var_sayi
    str x0, [x1]
_L11:
    mov x0, #1
    cmp x0, #0
    b.eq _L12
    adr x1, _var_sayi
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var_sayi
    str x0, [x1]
    adr x1, _var_sayi
    ldr x0, [x1]
    mov x22, x0
    mov x0, #3
    cmp x22, x0
    b.ne _L13
    b _L11
    b _L14
_L13:
_L14:
    adr x1, _var_sayi
    ldr x0, [x1]
    mov x22, x0
    mov x0, #5
    cmp x22, x0
    b.ne _L15
    b _L12
    b _L16
_L15:
_L16:
    adr x1, _var_sayi
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    b _L11
_L12:
    adr x0, _str_7
    bl puts
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

_zedin_strlen:
    mov x1, x0
    mov x2, #0
_zedin_strlen_dongu:
    ldrb w3, [x1], #1
    cbz w3, _zedin_strlen_bitis
    add x2, x2, #1
    b _zedin_strlen_dongu
_zedin_strlen_bitis:
    mov x0, x2
    ret

_zedin_metine:
    mov x1, x0
    adr x2, _metine_buf
    add x2, x2, #31
    mov x3, #0
    strb w3, [x2]
    mov x4, #10
_zedin_metine_dongu:
    sub x2, x2, #1
    udiv x3, x1, x4
    msub x5, x3, x4, x1
    add x5, x5, #48
    strb w5, [x2]
    mov x1, x3
    cbnz x1, _zedin_metine_dongu
    mov x0, x2
    ret

_zedin_sayiya:
    mov x1, x0
    mov x2, #0
    mov x4, #10
_zedin_sayiya_dongu:
    ldrb w3, [x1], #1
    sub w3, w3, #48
    cmp w3, #9
    b.hi _zedin_sayiya_bitis
    madd x2, x2, x4, x3
    b _zedin_sayiya_dongu
_zedin_sayiya_bitis:
    mov x0, x2
    ret

_zedin_str_chr:
    adr x2, _char_buf
    ldrb w3, [x0, x1]
    strb w3, [x2]
    mov w3, #0
    strb w3, [x2, #1]
    mov x0, x2
    ret

_zedin_char_kodu:
    ldrb w0, [x0]
    ret
.section .data
_var_a: .quad 0
_var_b: .quad 0
_str_1: .asciz "ikisi buyuk"
_str_2: .asciz "hayir"
_str_3: .asciz "veya oldu"
_str_4: .asciz "veya olmadi"
_var_x: .quad 0
_var_durum: .quad 0
_str_5: .asciz "dogru"
_str_6: .asciz "yanlis"
_var_sayi: .quad 0
_str_7: .asciz "bitti"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
