.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__asm_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__veri_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__degisken_satirlar
    str x0, [x1]
    mov x0, #0
    adr x1, _var__str_sayac
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__degiskenler
    str x0, [x1]
    mov x0, #0
    adr x1, _var__stack_boyut
    str x0, [x1]
    mov x0, #0
    adr x1, _var__etiket_sayac
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_mod
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__yerel_degiskenler
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_offset
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__ust_kapsamlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__fonk_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__dongu_etiketler
    str x0, [x1]
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

asm_yaz:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret

veri_yaz:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__veri_satirlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret

yeni_str_etiketi:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x1, _var__str_sayac
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__str_sayac
    str x0, [x1]
    mov x22, x0
    adr x1, _var__str_sayac
    ldr x0, [x1]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

yeni_etiket:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adr x1, _var__etiket_sayac
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__etiket_sayac
    str x0, [x1]
    mov x22, x0
    adr x1, _var__etiket_sayac
    ldr x0, [x1]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #16
    ret
    ldp x29, x30, [sp], #16
    ret

ifade_metin_mi:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L1
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L2
_L1:
_L2:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L3
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L4
_L3:
_L4:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L5
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L7
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L8
_L7:
_L8:
    b _L6
_L5:
_L6:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L14
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L13
_L14:
    mov x0, #0
_L13:
    cmp x0, #0
    b.eq _L12
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L15
_L16:
    mov x0, #1
_L15:
    cmp x0, #0
    cset x0, ne
    b _L11
_L12:
    mov x0, #0
_L11:
    cmp x0, #0
    b.eq _L9
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L10
_L9:
_L10:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L20
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L19
_L20:
    mov x0, #0
_L19:
    cmp x0, #0
    b.eq _L17
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L24
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L23
_L24:
    mov x0, #0
_L23:
    cmp x0, #0
    b.eq _L21
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    b _L22
_L21:
_L22:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L25
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    b _L26
_L25:
_L26:
    b _L18
_L17:
_L18:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L32
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L31
_L32:
    mov x0, #0
_L31:
    cmp x0, #0
    b.eq _L30
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #3
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L29
_L30:
    mov x0, #0
_L29:
    cmp x0, #0
    b.eq _L27
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.ne _L36
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L35
_L36:
    mov x0, #1
_L35:
    cmp x0, #0
    b.eq _L33
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    b _L34
_L33:
_L34:
    b _L28
_L27:
_L28:
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

ters_dal:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L37
    ldp x29, x30, [sp], #32
    ret
    b _L38
_L37:
_L38:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L39
    ldp x29, x30, [sp], #32
    ret
    b _L40
_L39:
_L40:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L41
    ldp x29, x30, [sp], #32
    ret
    b _L42
_L41:
_L42:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L43
    ldp x29, x30, [sp], #32
    ret
    b _L44
_L43:
_L44:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L45
    ldp x29, x30, [sp], #32
    ret
    b _L46
_L45:
_L46:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L47
    ldp x29, x30, [sp], #32
    ret
    b _L48
_L47:
_L48:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

asm_baslik:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__degiskenler
    str x0, [x1]
    mov x0, #0
    adr x1, _var__stack_boyut
    str x0, [x1]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #16
    ret

asm_son:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+8]
_L49:
    ldr x0, [x29, #16+8]
    mov x22, x0
    adr x1, _var__fonk_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L50
    ldr x0, [x29, #16+8]
    mov x21, x0
    adr x1, _var__fonk_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+8]
    b _L49
_L50:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+16]
_L51:
    ldr x0, [x29, #16+16]
    mov x22, x0
    adr x1, _var__degisken_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L52
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__degisken_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L51
_L52:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl veri_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret

asm_str_tanimla:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    adr x1, _var__degisken_satirlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret

asm_puts:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret

degisken_bul:
    stp x29, x30, [sp, #-80]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__yerel_mod
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L53
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
_L55:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L56
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L57
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #32
    ret
    b _L58
_L57:
_L58:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
    b _L55
_L56:
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+24]
_L59:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L60
    ldr x0, [x29, #16+24]
    mov x21, x0
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+40]
_L61:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L62
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L63
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+48]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    ldp x29, x30, [sp], #64
    ret
    b _L64
_L63:
_L64:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+40]
    b _L61
_L62:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+24]
    b _L59
_L60:
    b _L54
_L53:
_L54:
    mov x0, #0
    str x0, [x29, #16+56]
_L65:
    ldr x0, [x29, #16+56]
    mov x22, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L66
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+56]
    mov x21, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L67
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+56]
    mov x21, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #80
    ret
    b _L68
_L67:
_L68:
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+56]
    b _L65
_L66:
    ldp x29, x30, [sp], #80
    ret
    ldp x29, x30, [sp], #80
    ret

degisken_tip_bul_tam:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__yerel_mod
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L69
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl yerel_tip_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L74
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl yerel_bul
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x0, #0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L73
_L74:
    mov x0, #1
_L73:
    cmp x0, #0
    b.eq _L71
    ldr x0, [x29, #16+16]
    ldp x29, x30, [sp], #32
    ret
    b _L72
_L71:
_L72:
    b _L70
_L69:
_L70:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

degisken_tip_bul:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #16+16]
_L75:
    ldr x0, [x29, #16+16]
    mov x22, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L76
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L77
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    b _L78
_L77:
_L78:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L75
_L76:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

degisken_ekle_tipli:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    adr x1, _var__yerel_mod
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L79
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__yerel_offset
    str x0, [x1]
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    adr x1, _var__yerel_offset
    ldr x0, [x1]
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
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret
    b _L80
_L79:
_L80:
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__degiskenler
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+24]
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
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    adr x1, _var__degisken_satirlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+24]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

degisken_ekle:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl degisken_ekle_tipli
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

yerel_bul:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
_L81:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L82
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L83
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    b _L84
_L83:
_L84:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
    b _L81
_L82:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

yerel_tip_bul:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
_L85:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L86
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L87
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    b _L88
_L87:
_L88:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+16]
    b _L85
_L86:
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+24]
_L89:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L90
    ldr x0, [x29, #16+24]
    mov x21, x0
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+40]
_L91:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L92
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.ne _L93
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #64
    ret
    b _L94
_L93:
_L94:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+40]
    b _L91
_L92:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+24]
    b _L89
_L90:
    ldp x29, x30, [sp], #64
    ret
    ldp x29, x30, [sp], #64
    ret

kodla_ifade:
    stp x29, x30, [sp, #-304]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L95
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L96
_L95:
_L96:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L97
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L102
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #65535
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L101
_L102:
    mov x0, #0
_L101:
    cmp x0, #0
    b.eq _L99
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
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L100
_L99:
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, #65535
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    bl _zedin_metine
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, #16
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #65535
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    bl _zedin_metine
    str x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+32]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+40]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L100:
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L98
_L97:
_L98:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L103
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+48]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L104
_L103:
_L104:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L105
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L107
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L108
_L107:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L108:
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L106
_L105:
_L106:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L109
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L111
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L120
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L119
_L120:
    mov x0, #0
_L119:
    cmp x0, #0
    b.eq _L118
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L117
_L118:
    mov x0, #0
_L117:
    cmp x0, #0
    b.eq _L116
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L115
_L116:
    mov x0, #0
_L115:
    cmp x0, #0
    b.eq _L113
    str x0, [x29, #16+64]
    mov x0, #8
    str x0, [x29, #16+72]
_L121:
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L124
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L123
_L124:
    mov x0, #0
_L123:
    cmp x0, #0
    b.eq _L122
    ldr x0, [x29, #16+64]
    mov x22, x0
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    b _L121
_L122:
    mov x22, x0
    ldr x0, [x29, #16+64]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L114
_L113:
_L114:
    b _L112
_L111:
_L112:
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L110
_L109:
_L110:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L125
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+80]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+88]
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L130
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L129
_L130:
    mov x0, #0
_L129:
    cmp x0, #0
    b.eq _L127
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+96]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+96]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L134
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+96]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L133
_L134:
    mov x0, #0
_L133:
    cmp x0, #0
    b.eq _L131
    ldr x0, [x29, #16+96]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #112
    ret
    b _L132
_L131:
_L132:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+96]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L135
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+104]
    ldr x0, [x29, #16+104]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+96]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+104]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L136
_L135:
_L136:
    ldr x0, [x29, #16+96]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L128
_L127:
_L128:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L140
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L139
_L140:
    mov x0, #0
_L139:
    cmp x0, #0
    b.eq _L137
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L138
_L137:
_L138:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L144
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L143
_L144:
    mov x0, #0
_L143:
    cmp x0, #0
    b.eq _L141
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L142
_L141:
_L142:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L148
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L147
_L148:
    mov x0, #0
_L147:
    cmp x0, #0
    b.eq _L145
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L146
_L145:
_L146:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L152
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L151
_L152:
    mov x0, #0
_L151:
    cmp x0, #0
    b.eq _L149
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+112]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+112]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L153
    ldr x0, [x29, #16+112]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L154
_L153:
_L154:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+112]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L158
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+112]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L157
_L158:
    mov x0, #0
_L157:
    cmp x0, #0
    b.eq _L155
    ldr x0, [x29, #16+112]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L156
_L155:
_L156:
    ldr x0, [x29, #16+112]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L150
_L149:
_L150:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L162
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L161
_L162:
    mov x0, #0
_L161:
    cmp x0, #0
    b.eq _L159
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #128
    ret
    b _L160
_L159:
_L160:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L166
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L165
_L166:
    mov x0, #0
_L165:
    cmp x0, #0
    b.eq _L163
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+120]
    ldr x0, [x29, #16+120]
    mov x19, x0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+120]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+128]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+136]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+128]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+136]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+128]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+136]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #160
    ret
    b _L164
_L163:
_L164:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L170
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L169
_L170:
    mov x0, #0
_L169:
    cmp x0, #0
    b.eq _L167
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+144]
    ldr x0, [x29, #16+144]
    mov x19, x0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+144]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+152]
    mov x22, x0
    ldr x0, [x29, #16+152]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+152]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #176
    ret
    b _L168
_L167:
_L168:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L174
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L173
_L174:
    mov x0, #0
_L173:
    cmp x0, #0
    b.eq _L171
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+160]
    ldr x0, [x29, #16+160]
    mov x19, x0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+160]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+168]
    mov x22, x0
    ldr x0, [x29, #16+168]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+168]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #192
    ret
    b _L172
_L171:
_L172:
    mov x0, #0
    str x0, [x29, #16+176]
_L175:
    ldr x0, [x29, #16+176]
    mov x22, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L176
    ldr x0, [x29, #16+176]
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+176]
    mov x22, x0
    mov x0, #19
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+176]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+176]
    b _L175
_L176:
    mov x0, #0
    str x0, [x29, #16+176]
_L177:
    ldr x0, [x29, #16+176]
    mov x22, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L178
    mov x22, x0
    ldr x0, [x29, #16+176]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+176]
    mov x22, x0
    mov x0, #19
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+176]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+176]
    b _L177
_L178:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+80]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #192
    ret
    b _L126
_L125:
_L126:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L179
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+184]
    mov x22, x0
    ldr x0, [x29, #16+184]
    ldr x0, [x0, #8]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+192]
_L181:
    ldr x0, [x29, #16+192]
    mov x22, x0
    ldr x0, [x29, #16+184]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L182
    ldr x0, [x29, #16+192]
    mov x21, x0
    ldr x0, [x29, #16+184]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+192]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L183
    mov x22, x0
    ldr x0, [x29, #16+192]
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    mul x0, x0, x23
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L184
_L183:
_L184:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+192]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+192]
    b _L181
_L182:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #208
    ret
    b _L180
_L179:
_L180:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L185
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+200]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+200]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L192
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+200]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L191
_L192:
    mov x0, #0
_L191:
    cmp x0, #0
    b.ne _L190
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+200]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L189
_L190:
    mov x0, #1
_L189:
    cmp x0, #0
    b.eq _L187
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+200]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L193
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+208]
    ldr x0, [x29, #16+208]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+200]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+208]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L194
_L193:
    ldr x0, [x29, #16+200]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
_L194:
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #224
    ret
    b _L188
_L187:
_L188:
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #224
    ret
    b _L186
_L185:
_L186:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L195
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+216]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+216]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L197
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+216]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+216]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #240
    ret
    b _L198
_L197:
_L198:
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+216]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L199
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+216]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+224]
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L201
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L210
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L209
_L210:
    mov x0, #0
_L209:
    cmp x0, #0
    b.eq _L208
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L207
_L208:
    mov x0, #0
_L207:
    cmp x0, #0
    b.eq _L206
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L205
_L206:
    mov x0, #0
_L205:
    cmp x0, #0
    b.eq _L203
    str x0, [x29, #16+232]
    mov x0, #8
    str x0, [x29, #16+240]
_L211:
    ldr x0, [x29, #16+240]
    mov x22, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #8]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L214
    ldr x0, [x29, #16+240]
    mov x21, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L213
_L214:
    mov x0, #0
_L213:
    cmp x0, #0
    b.eq _L212
    ldr x0, [x29, #16+232]
    mov x22, x0
    ldr x0, [x29, #16+240]
    mov x21, x0
    ldr x0, [x29, #16+224]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+232]
    ldr x0, [x29, #16+240]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+240]
    b _L211
_L212:
    mov x22, x0
    ldr x0, [x29, #16+232]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L204
_L203:
_L204:
    b _L202
_L201:
_L202:
    b _L200
_L199:
_L200:
    mov x0, #0
    ldp x29, x30, [sp], #256
    ret
    b _L196
_L195:
_L196:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L215
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+248]
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L217
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+256]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+264]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+264]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+256]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+264]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+256]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #288
    ret
    b _L218
_L217:
_L218:
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L219
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+272]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+280]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+280]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+272]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+280]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+272]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #304
    ret
    b _L220
_L219:
_L220:
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L221
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L222
_L221:
_L222:
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L223
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L224
_L223:
_L224:
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L225
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L226
_L225:
_L226:
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L227
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L228
_L227:
_L228:
    ldr x0, [x29, #16+248]
    mov x22, x0
    cmp x22, x0
    b.ne _L229
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L230
_L229:
_L230:
    mov x0, #0
    ldp x29, x30, [sp], #304
    ret
    b _L216
_L215:
_L216:
    mov x0, #0
    ldp x29, x30, [sp], #304
    ret
    ldp x29, x30, [sp], #304
    ret

kodla_stmt:
    stp x29, x30, [sp, #-320]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L231
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L232
_L231:
_L232:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L233
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L238
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L237
_L238:
    mov x0, #0
_L237:
    cmp x0, #0
    b.eq _L235
    mov x0, #0
    mov x21, x0
    mov x0, #2
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
    mov x22, x0
    cmp x22, x0
    b.ne _L239
    str x0, [x29, #16+32]
    b _L240
_L239:
_L240:
    b _L236
_L235:
_L236:
    ldr x0, [x29, #16+24]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl degisken_ekle_tipli
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+40]
    mov x22, x0
    cmp x22, x0
    b.ne _L241
    mov x22, x0
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L242
_L241:
    mov x22, x0
    ldr x0, [x29, #16+40]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L242:
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L234
_L233:
_L234:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L243
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+48]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L245
    stp x22, x23, [sp, #-16]!
    bl yeni_str_etiketi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+56]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl asm_str_tanimla
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+56]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_puts
    ldp x22, x23, [sp], #16
    b _L246
_L245:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L247
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl degisken_tip_bul_tam
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+64]
    mov x22, x0
    cmp x22, x0
    b.ne _L249
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L250
_L249:
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L250:
    b _L248
_L247:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L254
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L253
_L254:
    mov x0, #0
_L253:
    cmp x0, #0
    b.eq _L251
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L252
_L251:
_L252:
_L248:
_L246:
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L244
_L243:
_L244:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L255
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+72]
    mov x0, #1
    mov x21, x0
    mov x0, #2
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
    str x0, [x29, #16+80]
    mov x0, #1
    mov x21, x0
    mov x0, #3
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
    str x0, [x29, #16+88]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+96]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+104]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L262
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.ne _L264
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L263
_L264:
    mov x0, #1
_L263:
    cmp x0, #0
    cset x0, ne
    b _L261
_L262:
    mov x0, #0
_L261:
    cmp x0, #0
    b.eq _L260
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L266
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L265
_L266:
    mov x0, #1
_L265:
    cmp x0, #0
    cset x0, ne
    b _L259
_L260:
    mov x0, #0
_L259:
    cmp x0, #0
    b.eq _L257
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L267
    mov x22, x0
    ldr x0, [x29, #16+96]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L268
_L267:
    mov x22, x0
    ldr x0, [x29, #16+96]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L268:
    b _L258
_L257:
_L258:
    mov x0, #0
    str x0, [x29, #16+112]
_L269:
    ldr x0, [x29, #16+112]
    mov x22, x0
    ldr x0, [x29, #16+80]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L270
    ldr x0, [x29, #16+112]
    mov x21, x0
    ldr x0, [x29, #16+80]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+112]
    b _L269
_L270:
    mov x22, x0
    ldr x0, [x29, #16+104]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+96]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+120]
_L271:
    ldr x0, [x29, #16+120]
    mov x22, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L272
    ldr x0, [x29, #16+120]
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+120]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+120]
    b _L271
_L272:
    ldr x0, [x29, #16+104]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L256
_L255:
_L256:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L273
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+128]
    stp x22, x23, [sp, #-16]!
    bl yeni_etiket
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+136]
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #2
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x0, [x29, #16+128]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+136]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldp x0, x1, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+144]
    mov x0, #1
    mov x21, x0
    mov x0, #2
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
    str x0, [x29, #16+152]
    ldr x0, [x29, #16+128]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L280
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.ne _L282
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ifade_metin_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L281
_L282:
    mov x0, #1
_L281:
    cmp x0, #0
    cset x0, ne
    b _L279
_L280:
    mov x0, #0
_L279:
    cmp x0, #0
    b.eq _L278
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L284
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L283
_L284:
    mov x0, #1
_L283:
    cmp x0, #0
    cset x0, ne
    b _L277
_L278:
    mov x0, #0
_L277:
    cmp x0, #0
    b.eq _L275
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L285
    mov x22, x0
    ldr x0, [x29, #16+136]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L286
_L285:
    mov x22, x0
    ldr x0, [x29, #16+136]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
_L286:
    b _L276
_L275:
_L276:
    mov x0, #0
    str x0, [x29, #16+160]
_L287:
    ldr x0, [x29, #16+160]
    mov x22, x0
    ldr x0, [x29, #16+152]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L288
    ldr x0, [x29, #16+160]
    mov x21, x0
    ldr x0, [x29, #16+152]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+160]
    b _L287
_L288:
    mov x22, x0
    ldr x0, [x29, #16+128]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+136]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    str x0, [sp, #-16]!
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_cikar
    mov x0, #0
    ldp x29, x30, [sp], #176
    ret
    b _L274
_L273:
_L274:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L289
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L291
    mov x22, x0
    mov x0, #1
    mov x21, x0
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x21, x0
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L292
_L291:
_L292:
    mov x0, #0
    ldp x29, x30, [sp], #176
    ret
    b _L290
_L289:
_L290:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L293
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L295
    mov x22, x0
    mov x0, #0
    mov x21, x0
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x21, x0
    adr x1, _var__dongu_etiketler
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    b _L296
_L295:
_L296:
    mov x0, #0
    ldp x29, x30, [sp], #176
    ret
    b _L294
_L293:
_L294:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L297
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #176
    ret
    b _L298
_L297:
_L298:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L299
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+168]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+176]
    mov x0, #1
    mov x21, x0
    mov x0, #3
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
    str x0, [x29, #16+184]
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    str x0, [x29, #16+192]
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    str x0, [x29, #16+200]
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    str x0, [x29, #16+208]
    adr x1, _var__yerel_mod
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L301
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L302
_L301:
_L302:
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__asm_satirlar
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_mod
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__yerel_degiskenler
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_offset
    str x0, [x1]
    mov x0, #0
    str x0, [x29, #16+216]
_L303:
    ldr x0, [x29, #16+216]
    mov x22, x0
    ldr x0, [x29, #16+176]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L304
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__yerel_offset
    str x0, [x1]
    adr x1, _var__yerel_degiskenler
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #3
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x0, [x29, #16+216]
    mov x21, x0
    ldr x0, [x29, #16+176]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #8
    str x0, [x1]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    ldp x0, x1, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+216]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+216]
    b _L303
_L304:
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+224]
    mov x0, #0
    str x0, [x29, #16+232]
_L305:
    ldr x0, [x29, #16+232]
    mov x22, x0
    ldr x0, [x29, #16+184]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L306
    ldr x0, [x29, #16+232]
    mov x21, x0
    ldr x0, [x29, #16+184]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+232]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+232]
    b _L305
_L306:
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    mov x22, x0
    mov x0, #15
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    mov x22, x0
    mov x0, #15
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #16
    mov x23, x0
    mov x0, x22
    sdiv x24, x22, x23
    msub x0, x24, x23, x22
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x22, x0
    mov x0, #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+240]
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    str x0, [x29, #16+248]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__asm_satirlar
    str x0, [x1]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+168]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+240]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+216]
_L307:
    ldr x0, [x29, #16+216]
    mov x22, x0
    ldr x0, [x29, #16+176]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L308
    mov x22, x0
    ldr x0, [x29, #16+216]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+216]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #8
    mov x23, x0
    mov x0, x22
    mul x0, x0, x23
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+216]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+216]
    b _L307
_L308:
    mov x0, #0
    str x0, [x29, #16+256]
_L309:
    ldr x0, [x29, #16+256]
    mov x22, x0
    ldr x0, [x29, #16+248]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L310
    ldr x0, [x29, #16+256]
    mov x21, x0
    ldr x0, [x29, #16+248]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+256]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+256]
    b _L309
_L310:
    mov x22, x0
    ldr x0, [x29, #16+240]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+264]
_L311:
    ldr x0, [x29, #16+264]
    mov x22, x0
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L312
    adr x1, _var__fonk_satirlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+264]
    mov x21, x0
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+264]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+264]
    b _L311
_L312:
    ldr x0, [x29, #16+192]
    adr x1, _var__asm_satirlar
    str x0, [x1]
    ldr x0, [x29, #16+200]
    adr x1, _var__yerel_degiskenler
    str x0, [x1]
    ldr x0, [x29, #16+208]
    adr x1, _var__yerel_offset
    str x0, [x1]
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L313
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+272]
    mov x0, #0
    str x0, [x29, #16+280]
_L315:
    ldr x0, [x29, #16+280]
    mov x22, x0
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    cmp x22, x0
    b.ge _L316
    ldr x0, [x29, #16+272]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+280]
    mov x21, x0
    adr x1, _var__ust_kapsamlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+280]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+280]
    b _L315
_L316:
    ldr x0, [x29, #16+272]
    adr x1, _var__ust_kapsamlar
    str x0, [x1]
    b _L314
_L313:
    mov x0, #0
    adr x1, _var__yerel_mod
    str x0, [x1]
_L314:
    mov x0, #0
    ldp x29, x30, [sp], #304
    ret
    b _L300
_L299:
_L300:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L317
    adr x1, _var__yerel_offset
    ldr x0, [x1]
    str x0, [x29, #16+288]
    ldr x0, [x29, #16+288]
    mov x22, x0
    mov x0, #15
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+288]
    mov x22, x0
    mov x0, #15
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #16
    mov x23, x0
    mov x0, x22
    sdiv x24, x22, x23
    msub x0, x24, x23, x22
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x22, x0
    mov x0, #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+296]
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_ifade
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+296]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #320
    ret
    b _L318
_L317:
_L318:
    mov x0, #0
    ldp x29, x30, [sp], #320
    ret
    ldp x29, x30, [sp], #320
    ret

asm_uret:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L322
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L321
_L322:
    mov x0, #0
_L321:
    cmp x0, #0
    b.eq _L319
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+16]
    b _L320
_L319:
_L320:
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__asm_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__veri_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__degisken_satirlar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__fonk_satirlar
    str x0, [x1]
    mov x0, #0
    adr x1, _var__str_sayac
    str x0, [x1]
    mov x0, #0
    adr x1, _var__etiket_sayac
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_mod
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__yerel_degiskenler
    str x0, [x1]
    mov x0, #0
    adr x1, _var__yerel_offset
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__dongu_etiketler
    str x0, [x1]
    stp x22, x23, [sp, #-16]!
    bl asm_baslik
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+24]
_L323:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L324
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl kodla_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L323
_L324:
    stp x22, x23, [sp, #-16]!
    bl asm_son
    ldp x22, x23, [sp], #16
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+32]
    mov x0, #0
    str x0, [x29, #16+40]
_L325:
    ldr x0, [x29, #16+40]
    mov x22, x0
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L326
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+40]
    mov x21, x0
    adr x1, _var__asm_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    b _L325
_L326:
    mov x0, #0
    str x0, [x29, #16+48]
_L327:
    ldr x0, [x29, #16+48]
    mov x22, x0
    adr x1, _var__veri_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L328
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x21, x0
    adr x1, _var__veri_satirlar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+48]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+48]
    b _L327
_L328:
    ldr x0, [x29, #16+32]
    ldp x29, x30, [sp], #64
    ret
    ldp x29, x30, [sp], #64
    ret

zedin_asm_derle:
    stp x29, x30, [sp, #-96]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x22, x0
    ldr x0, [x29, #16+8]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _str_1
    bl fopen
    mov x20, x0
    cmp x20, #0
    b.eq _L329
    mov x0, x20
    mov x1, #0
    mov x2, #2
    bl fseek
    mov x0, x20
    bl ftell
    mov x21, x0
    mov x0, x20
    mov x1, #0
    mov x2, #0
    bl fseek
    mov x0, x21
    add x0, x0, #1
    bl malloc
    mov x22, x0
    mov x1, #1
    mov x2, x21
    mov x3, x20
    bl fread
    mov x0, x22
    add x0, x0, x21
    mov w1, #0
    strb w1, [x0]
    mov x0, x20
    bl fclose
    mov x0, x22
    b _L330
_L329:
    mov x0, #0
_L330:
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl hata_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L331
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl mesaj_al
    ldp x22, x23, [sp], #16
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    b _L332
_L331:
_L332:
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tara
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+40]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl parse
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+48]
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl asm_uret
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    adr x1, _str_2
    bl fopen
    cmp x0, #0
    b.eq _L333
    bl fclose
_L333:
    mov x0, #0
    str x0, [x29, #16+64]
_L334:
    ldr x0, [x29, #16+64]
    mov x22, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L335
    ldr x0, [x29, #16+64]
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    mov x0, #0
    str x0, [x29, #16+80]
_L336:
    ldr x0, [x29, #16+80]
    mov x22, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L337
    ldr x0, [x29, #16+16]
    mov x19, x0
    ldr x0, [x29, #16+80]
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    bl _zedin_char_kodu
    mov x20, x0
    mov x0, x19
    adr x1, _str_3
    bl fopen
    cmp x0, #0
    b.eq _L338
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L338:
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+80]
    b _L336
_L337:
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+64]
    b _L334
_L335:
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    ldp x29, x30, [sp], #96
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
_var__asm_satirlar: .quad 0
_var__veri_satirlar: .quad 0
_var__degisken_satirlar: .quad 0
_var__str_sayac: .quad 0
_var__degiskenler: .quad 0
_var__stack_boyut: .quad 0
_var__etiket_sayac: .quad 0
_var__yerel_mod: .quad 0
_var__yerel_degiskenler: .quad 0
_var__yerel_offset: .quad 0
_var__ust_kapsamlar: .quad 0
_var__fonk_satirlar: .quad 0
_var__dongu_etiketler: .quad 0
_str_1: .asciz "r"
_str_2: .asciz "w"
_str_3: .asciz "ab"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
