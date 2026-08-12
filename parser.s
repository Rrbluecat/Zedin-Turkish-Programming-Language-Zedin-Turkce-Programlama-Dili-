.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    adr x1, _var__hata_sayisi
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__p_tok
    str x0, [x1]
    mov x0, #0
    adr x1, _var__p_pos
    str x0, [x1]
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

p_simdiki:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x1, _var__p_pos
    ldr x0, [x1]
    mov x22, x0
    adr x1, _var__p_tok
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.lt _L1
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    mov x0, #0
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    mov x0, #0
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #16
    ret
    b _L2
_L1:
_L2:
    adr x1, _var__p_pos
    ldr x0, [x1]
    mov x21, x0
    adr x1, _var__p_tok
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

p_tip:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    mov x21, x0
    stp x22, x23, [sp, #-16]!
    bl p_simdiki
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

p_deger:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #1
    mov x21, x0
    stp x22, x23, [sp, #-16]!
    bl p_simdiki
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

p_satir:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #2
    mov x21, x0
    stp x22, x23, [sp, #-16]!
    bl p_simdiki
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

p_ilerle:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x1, _var__p_pos
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__p_pos
    str x0, [x1]
    ldp x29, x30, [sp], #16
    ret

p_esles:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    stp x22, x23, [sp, #-16]!
    bl p_tip
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L3
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    ldp x29, x30, [sp], #32
    ret
    b _L4
_L3:
_L4:
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_satir
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    adr x1, _var__p_pos
    ldr x0, [x1]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_tip
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x20, x0
    adr x0, _fmt_str_sayi
    mov x1, x19
    mov x2, x20
    bl printf
    adr x1, _var__hata_sayisi
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__hata_sayisi
    str x0, [x1]
    adr x1, _var__hata_sayisi
    ldr x0, [x1]
    mov x22, x0
    mov x0, #5
    cmp x22, x0
    b.lt _L5
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl sistem_cikis
    ldp x22, x23, [sp], #16
    b _L6
_L5:
_L6:
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

p_kontrol:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    stp x22, x23, [sp, #-16]!
    bl p_tip
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

p_kontrol2:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    stp x22, x23, [sp, #-16]!
    bl p_tip
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L8
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L7
_L8:
    mov x0, #0
_L7:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

parse_birincil:
    stp x29, x30, [sp, #-96]!
    mov x29, sp
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L9
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    b _L10
_L9:
_L10:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L11
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    b _L12
_L11:
_L12:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L13
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L14
_L13:
_L14:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L15
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L16
_L15:
_L16:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L17
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L18
_L17:
_L18:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L19
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #1
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L20
_L19:
_L20:
    mov x19, x0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl p_kontrol2
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L21
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_birincil
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+32]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L22
_L21:
_L22:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L23
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_birincil
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+40]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L24
_L23:
_L24:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L25
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+48]
_L27:
    cmp x0, #0
    b.eq _L30
    cmp x0, #0
    cset x0, ne
    b _L29
_L30:
    mov x0, #0
_L29:
    cmp x0, #0
    b.eq _L28
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L31
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    b _L32
_L31:
_L32:
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L27
_L28:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+48]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L26
_L25:
_L26:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L33
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+56]
    ldp x29, x30, [sp], #80
    ret
    b _L34
_L33:
_L34:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L35
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+64]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L37
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+72]
_L39:
    cmp x0, #0
    b.eq _L42
    cmp x0, #0
    cset x0, ne
    b _L41
_L42:
    mov x0, #0
_L41:
    cmp x0, #0
    b.eq _L40
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L43
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    b _L44
_L43:
_L44:
    ldr x0, [x29, #16+72]
    str x0, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L39
_L40:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+64]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+72]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #96
    ret
    b _L38
_L37:
_L38:
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+64]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #96
    ret
    b _L36
_L35:
_L36:
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_satir
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_tip
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #96
    ret
    ldp x29, x30, [sp], #96
    ret

parse_postfix:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_birincil
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L45:
    mov x0, #0
    cmp x0, #0
    b.eq _L46
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L47
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L45
    b _L48
_L47:
_L48:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L49
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L51
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+32]
_L53:
    cmp x0, #0
    b.eq _L56
    cmp x0, #0
    cset x0, ne
    b _L55
_L56:
    mov x0, #0
_L55:
    cmp x0, #0
    b.eq _L54
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L57
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    b _L58
_L57:
_L58:
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L53
_L54:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+32]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L45
    b _L52
_L51:
_L52:
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L45
    b _L50
_L49:
_L50:
    b _L46
    b _L45
_L46:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

parse_carpma:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_postfix
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L59:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L62
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L68
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L67
_L68:
    mov x0, #1
_L67:
    cmp x0, #0
    b.ne _L66
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L65
_L66:
    mov x0, #1
_L65:
    cmp x0, #0
    b.ne _L64
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L63
_L64:
    mov x0, #1
_L63:
    cmp x0, #0
    cset x0, ne
    b _L61
_L62:
    mov x0, #0
_L61:
    cmp x0, #0
    b.eq _L60
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_postfix
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L59
_L60:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

parse_toplama:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_carpma
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L69:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L72
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L74
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L73
_L74:
    mov x0, #1
_L73:
    cmp x0, #0
    cset x0, ne
    b _L71
_L72:
    mov x0, #0
_L71:
    cmp x0, #0
    b.eq _L70
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_carpma
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L69
_L70:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

parse_karsilastirma:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_toplama
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L75:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L78
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L88
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L87
_L88:
    mov x0, #1
_L87:
    cmp x0, #0
    b.ne _L86
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L85
_L86:
    mov x0, #1
_L85:
    cmp x0, #0
    b.ne _L84
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L83
_L84:
    mov x0, #1
_L83:
    cmp x0, #0
    b.ne _L82
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L81
_L82:
    mov x0, #1
_L81:
    cmp x0, #0
    b.ne _L80
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L79
_L80:
    mov x0, #1
_L79:
    cmp x0, #0
    cset x0, ne
    b _L77
_L78:
    mov x0, #0
_L77:
    cmp x0, #0
    b.eq _L76
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_toplama
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L75
_L76:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

parse_ve:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_karsilastirma
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L89:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L90
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_karsilastirma
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L89
_L90:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

parse_veya:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_ve
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
_L91:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L92
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ve
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
    b _L91
_L92:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

parse_ifade:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x22, x23, [sp, #-16]!
    bl parse_veya
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L93
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    b _L94
_L93:
_L94:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L98
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L106
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L105
_L106:
    mov x0, #1
_L105:
    cmp x0, #0
    b.ne _L104
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L103
_L104:
    mov x0, #1
_L103:
    cmp x0, #0
    b.ne _L102
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L101
_L102:
    mov x0, #1
_L101:
    cmp x0, #0
    b.ne _L100
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L99
_L100:
    mov x0, #1
_L99:
    cmp x0, #0
    cset x0, ne
    b _L97
_L98:
    mov x0, #0
_L97:
    cmp x0, #0
    b.eq _L95
    stp x22, x23, [sp, #-16]!
    bl p_deger
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+32]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #48
    ret
    b _L96
_L95:
_L96:
    ldr x0, [x29, #16+8]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

parse_stmt:
    stp x29, x30, [sp, #-128]!
    mov x29, sp
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L107
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    b _L108
_L107:
_L108:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L109
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+32]
_L111:
    cmp x0, #0
    b.eq _L114
    cmp x0, #0
    cset x0, ne
    b _L113
_L114:
    mov x0, #0
_L113:
    cmp x0, #0
    b.eq _L112
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L115
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    b _L116
_L115:
_L116:
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L111
_L112:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_blok
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+24]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+32]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+40]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L110
_L109:
_L110:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L117
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+48]
    stp x22, x23, [sp, #-16]!
    bl parse_blok
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L119
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L121
    stp x22, x23, [sp, #-16]!
    bl parse_stmt
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+64]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+48]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+56]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+64]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #80
    ret
    b _L122
_L121:
_L122:
    stp x22, x23, [sp, #-16]!
    bl parse_blok
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+72]
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+48]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+56]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldr x0, [x29, #16+72]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #96
    ret
    b _L120
_L119:
_L120:
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+48]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+56]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #96
    ret
    b _L118
_L117:
_L118:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L123
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+80]
    stp x22, x23, [sp, #-16]!
    bl parse_blok
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+88]
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+80]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x0, [x29, #16+88]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L124
_L123:
_L124:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L125
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L127
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    mov x0, #1
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L128
_L127:
_L128:
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+96]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+96]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L126
_L125:
_L126:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L129
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #1
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L130
_L129:
_L130:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L131
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #1
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L132
_L131:
_L132:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L133
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+104]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+104]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #128
    ret
    b _L134
_L133:
_L134:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L135
    stp x22, x23, [sp, #-16]!
    bl parse_blok
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #128
    ret
    b _L136
_L135:
_L136:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_kontrol
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L137
    stp x22, x23, [sp, #-16]!
    bl p_ilerle
    ldp x22, x23, [sp], #16
    mov x0, #1
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #128
    ret
    b _L138
_L137:
_L138:
    stp x22, x23, [sp, #-16]!
    bl parse_ifade
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+112]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+112]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #128
    ret
    ldp x29, x30, [sp], #128
    ret

parse_blok:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+8]
_L139:
    cmp x0, #0
    b.eq _L142
    cmp x0, #0
    cset x0, ne
    b _L141
_L142:
    mov x0, #0
_L141:
    cmp x0, #0
    b.eq _L140
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl parse_stmt
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L139
_L140:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl p_esles
    ldp x22, x23, [sp], #16
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

parse:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    adr x1, _var__p_tok
    str x0, [x1]
    mov x0, #0
    adr x1, _var__p_pos
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+16]
_L143:
    cmp x0, #0
    b.eq _L144
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl parse_stmt
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L143
_L144:
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

ast_yaz:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L145
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #32
    ret
    b _L146
_L145:
_L146:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L147
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    str x0, [x29, #16+32]
_L149:
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L150
    ldr x0, [x29, #16+32]
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+32]
    b _L149
_L150:
    ldp x29, x30, [sp], #48
    ret
    b _L148
_L147:
_L148:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L151
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    str x0, [x29, #16+40]
_L153:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L154
    ldr x0, [x29, #16+40]
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    b _L153
_L154:
    ldp x29, x30, [sp], #64
    ret
    b _L152
_L151:
_L152:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L155
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L156
_L155:
_L156:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L157
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L158
_L157:
_L158:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L159
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L160
_L159:
_L160:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L161
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L162
_L161:
_L162:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L163
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L164
_L163:
_L164:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L165
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L166
_L165:
_L166:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L167
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L168
_L167:
_L168:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L169
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L170
_L169:
_L170:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L171
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L172
_L171:
_L172:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L173
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L174
_L173:
_L174:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L175
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L176
_L175:
_L176:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L177
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L178
_L177:
_L178:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L179
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L180
_L179:
_L180:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L181
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L182
_L181:
_L182:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L183
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L184
_L183:
_L184:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L185
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L186
_L185:
_L186:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L187
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L188
_L187:
_L188:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L189
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L190
_L189:
_L190:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L191
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret
    b _L192
_L191:
_L192:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L193
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl ast_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #64
    ret
    b _L194
_L193:
_L194:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldp x29, x30, [sp], #64
    ret

zedin_parse:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tara
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl parse
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
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
_var__hata_sayisi: .quad 0
_var__p_tok: .quad 0
_var__p_pos: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
