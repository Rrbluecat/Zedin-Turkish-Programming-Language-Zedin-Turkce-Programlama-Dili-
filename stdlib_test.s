.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x0, _str_4
    adr x1, _var_metin
    str x0, [x1]
    adr x1, _var_metin
    ldr x0, [x1]
    mov x19, x0
    adr x0, _str_5
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ile_baslar
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    adr x1, _var_baslar_mi
    str x0, [x1]
    adr x0, _str_6
    bl puts
    adr x1, _var_baslar_mi
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x1, _var_metin
    ldr x0, [x1]
    mov x19, x0
    adr x0, _str_7
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ile_biter
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    adr x1, _var_biter_mi
    str x0, [x1]
    adr x0, _str_8
    bl puts
    adr x1, _var_biter_mi
    ldr x0, [x1]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

icerir:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+16]
    bl _zedin_strlen
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.ne _L1
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L2
_L1:
_L2:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.le _L3
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L4
_L3:
_L4:
    mov x0, #0
    str x0, [x29, #16+40]
_L5:
    ldr x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    cmp x22, x0
    b.ge _L6
    mov x0, #0
    str x0, [x29, #16+48]
    mov x0, #1
    str x0, [x29, #16+56]
_L7:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+32]
    cmp x22, x0
    b.ge _L8
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.eq _L9
    mov x0, #0
    str x0, [x29, #16+56]
    b _L10
_L9:
_L10:
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+48]
    b _L7
_L8:
    ldr x0, [x29, #16+56]
    cmp x0, #0
    b.eq _L11
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L12
_L11:
_L12:
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+40]
    b _L5
_L6:
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ile_baslar:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+16]
    bl _zedin_strlen
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.le _L13
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L14
_L13:
_L14:
    mov x0, #0
    str x0, [x29, #16+40]
_L15:
    ldr x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+32]
    cmp x22, x0
    b.ge _L16
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x19, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.eq _L17
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L18
_L17:
_L18:
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+40]
    b _L15
_L16:
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ile_biter:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+16]
    bl _zedin_strlen
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.le _L19
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L20
_L19:
_L20:
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    str x0, [x29, #16+40]
    mov x0, #0
    str x0, [x29, #16+48]
_L21:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+32]
    cmp x22, x0
    b.ge _L22
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.eq _L23
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L24
_L23:
_L24:
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+48]
    b _L21
_L22:
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

parcala:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+24]
    adr x0, _str_1
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+16]
    bl _zedin_strlen
    str x0, [x29, #16+48]
    mov x0, #0
    str x0, [x29, #16+56]
_L25:
    ldr x0, [x29, #16+56]
    mov x22, x0
    ldr x0, [x29, #16+40]
    cmp x22, x0
    b.ge _L26
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    mov x19, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    cset x0, eq
    cmp x0, #0
    b.eq _L30
    ldr x0, [x29, #16+56]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    mov x19, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    cset x0, eq
    cmp x0, #0
    cset x0, ne
    b _L29
_L30:
    mov x0, #0
_L29:
    cmp x0, #0
    b.eq _L27
    ldr x0, [x29, #16+24]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl liste_ekle
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+24]
    adr x0, _str_2
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+56]
    b _L25
    b _L28
_L27:
_L28:
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    cmp x0, x1
    cset x0, gt
    cmp x0, #0
    b.eq _L34
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+40]
    mov x1, x0
    ldr x0, [sp], #16
    cmp x0, x1
    cset x0, le
    cmp x0, #0
    cset x0, ne
    b _L33
_L34:
    mov x0, #0
_L33:
    cmp x0, #0
    b.eq _L31
    mov x0, #1
    str x0, [x29, #16+64]
    mov x0, #0
    str x0, [x29, #16+72]
_L35:
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+48]
    cmp x22, x0
    b.ge _L36
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+72]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.eq _L37
    mov x0, #0
    str x0, [x29, #16+64]
    b _L38
_L37:
_L38:
    ldr x0, [x29, #16+72]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+72]
    b _L35
_L36:
    ldr x0, [x29, #16+64]
    cmp x0, #0
    b.eq _L39
    ldr x0, [x29, #16+24]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl liste_ekle
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+24]
    adr x0, _str_3
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+56]
    b _L25
    b _L40
_L39:
_L40:
    b _L32
_L31:
_L32:
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+56]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    ldr x0, [sp], #16
    mov x19, x0
    mov x20, x1
    mov x0, x19
    bl strlen
    mov x21, x0
    mov x0, x20
    bl strlen
    add x0, x0, x21
    add x0, x0, #1
    bl malloc
    mov x22, x0
    mov x0, x22
    mov x1, x19
    bl strcpy
    mov x0, x22
    mov x1, x20
    bl strcat
    mov x0, x22
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+56]
    b _L25
_L26:
    ldr x0, [x29, #16+24]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl liste_ekle
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

tekrarsiz:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L41:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    cmp x22, x0
    b.ge _L42
    ldr x0, [x29, #16+16]
    mov x19, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl iceriyor_mu
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.ne _L43
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L44
_L43:
_L44:
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+24]
    b _L41
_L42:
    ldr x0, [x29, #16+16]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

liste_ekle:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+8]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

iceriyor_mu:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #0
    str x0, [x29, #16+24]
_L45:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    bl _zedin_strlen
    cmp x22, x0
    b.ge _L46
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    mov x1, x21
    bl _zedin_str_chr
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L47
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L48
_L47:
_L48:
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+24]
    b _L45
_L46:
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
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
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    mov x19, x0
    mov x20, x1
    mov x0, #2
    bl malloc
    ldrb w3, [x19, x20]
    strb w3, [x0]
    mov w3, #0
    strb w3, [x0, #1]
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

_zedin_char_kodu:
    ldrb w0, [x0]
    ret

_zedin_liste_yeni:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    mov x19, x0
    mov x0, #24
    bl malloc
    mov x20, x0
    lsl x0, x19, #3
    bl malloc
    str x0, [x20, #16]
    str x19, [x20]
    str x19, [x20, #8]
    mov x0, x20
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

_zedin_ekle:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    mov x19, x0
    mov x20, x1
    ldr x21, [x19]
    ldr x22, [x19, #8]
    cmp x22, x21
    b.lt _zedin_ekle_yaz
    cbnz x21, _zedin_ekle_buyut
    mov x21, #4
    b _zedin_ekle_realloc
_zedin_ekle_buyut:
    lsl x21, x21, #1
_zedin_ekle_realloc:
    str x21, [x19]
    ldr x0, [x19, #16]
    lsl x1, x21, #3
    bl realloc
    str x0, [x19, #16]
_zedin_ekle_yaz:
    ldr x0, [x19, #16]
    ldr x1, [x19, #8]
    str x20, [x0, x1, lsl #3]
    add x1, x1, #1
    str x1, [x19, #8]
    mov x0, x19
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

_zedin_cikar:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    mov x19, x0
    mov x20, x1
    ldr x21, [x19, #8]
    cmp x20, x21
    b.ge _zedin_cikar_bitis
    ldr x22, [x19, #16]
    sub x21, x21, #1
_zedin_cikar_dongu:
    add x0, x20, #1
    cmp x0, x21
    b.ge _zedin_cikar_son
    ldr x0, [x22, x0, lsl #3]
    str x0, [x22, x20, lsl #3]
    add x20, x20, #1
    b _zedin_cikar_dongu
_zedin_cikar_son:
    str x21, [x19, #8]
_zedin_cikar_bitis:
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret
.section .data
_str_1: .asciz ""
_str_2: .asciz ""
_str_3: .asciz ""
_var_metin: .quad 0
_str_4: .asciz "zedin dili"
_var_baslar_mi: .quad 0
_str_5: .asciz "zedin"
_str_6: .asciz "Zedin ile mi basliyor? (1=Evet, 0=Hayir):"
_var_biter_mi: .quad 0
_str_7: .asciz "dili"
_str_8: .asciz "Dili ile mi bitiyor? (1=Evet, 0=Hayir):"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
