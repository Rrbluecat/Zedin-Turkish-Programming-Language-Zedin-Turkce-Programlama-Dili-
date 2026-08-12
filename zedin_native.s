.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #1
    adr x1, _var__lex_satir
    str x0, [x1]
    mov x0, #1
    adr x1, _var__lex_kolon
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__lexer_tokenlar
    str x0, [x1]
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

tok_ekle_lex:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    str x2, [x29, #-24]
    str x3, [x29, #-32]
    adr x1, _var__lexer_tokenlar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #4
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    str x0, [x1]
    ldr x0, [x29, #16+16]
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
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #48
    ret

harf_mi:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L1:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L2
    ldr x0, [x29, #16+8]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    cmp x22, x0
    b.ne _L3
    mov x0, #1
    ldp x29, x30, [sp], #48
    ret
    b _L4
_L3:
_L4:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L1
_L2:
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

rakam_mi:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L5:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L6
    ldr x0, [x29, #16+8]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    cmp x22, x0
    b.ne _L7
    mov x0, #1
    ldp x29, x30, [sp], #48
    ret
    b _L8
_L7:
_L8:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L5
_L6:
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

tara:
    stp x29, x30, [sp, #-128]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__lexer_tokenlar
    str x0, [x1]
    mov x0, #1
    adr x1, _var__lex_satir
    str x0, [x1]
    mov x0, #1
    adr x1, _var__lex_kolon
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L9:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    cmp x22, x0
    b.ge _L10
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L11
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_satir
    str x0, [x1]
    mov x0, #1
    adr x1, _var__lex_kolon
    str x0, [x1]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L9
    b _L12
_L11:
_L12:
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L18
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L17
_L18:
    mov x0, #1
_L17:
    cmp x0, #0
    b.ne _L16
    ldr x0, [x29, #16+32]
    bl _zedin_char_kodu
    mov x22, x0
    mov x0, #13
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L15
_L16:
    mov x0, #1
_L15:
    cmp x0, #0
    b.eq _L13
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L9
    b _L14
_L13:
_L14:
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L24
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L23
_L24:
    mov x0, #0
_L23:
    cmp x0, #0
    b.eq _L22
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L21
_L22:
    mov x0, #0
_L21:
    cmp x0, #0
    b.eq _L19
_L25:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L28
    ldr x0, [x29, #16+24]
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
    b _L27
_L28:
    mov x0, #0
_L27:
    cmp x0, #0
    b.eq _L26
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L25
_L26:
    b _L9
    b _L20
_L19:
_L20:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl rakam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L29
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+40]
    str x0, [x29, #16+48]
    mov x0, #0
    str x0, [x29, #16+56]
_L31:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L34
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl rakam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.ne _L36
    ldr x0, [x29, #16+24]
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
    b _L35
_L36:
    mov x0, #1
_L35:
    cmp x0, #0
    cset x0, ne
    b _L33
_L34:
    mov x0, #0
_L33:
    cmp x0, #0
    b.eq _L32
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L37
    mov x0, #1
    str x0, [x29, #16+56]
    b _L38
_L37:
_L38:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L31
_L32:
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.ne _L39
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L40
_L39:
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
_L40:
    b _L9
    b _L30
_L29:
_L30:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl harf_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L41
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+64]
    str x0, [x29, #16+72]
_L43:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L46
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl harf_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.ne _L48
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl rakam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L47
_L48:
    mov x0, #1
_L47:
    cmp x0, #0
    cset x0, ne
    b _L45
_L46:
    mov x0, #0
_L45:
    cmp x0, #0
    b.eq _L44
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L43
_L44:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L49
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L50
_L49:
_L50:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L51
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L52
_L51:
_L52:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L53
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L54
_L53:
_L54:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L55
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L56
_L55:
_L56:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L57
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L58
_L57:
_L58:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L59
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L60
_L59:
_L60:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L61
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L62
_L61:
_L62:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L63
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L64
_L63:
_L64:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L65
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L66
_L65:
_L66:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L67
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L68
_L67:
_L68:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L69
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L70
_L69:
_L70:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L71
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L72
_L71:
_L72:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L73
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L74
_L73:
_L74:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L75
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L76
_L75:
_L76:
    ldr x0, [x29, #16+72]
    mov x22, x0
    cmp x22, x0
    b.ne _L77
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L78
_L77:
_L78:
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L42
_L41:
_L42:
    mov x0, #34
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl karakter_yap
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+80]
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+80]
    cmp x22, x0
    b.ne _L79
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+88]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    str x0, [x29, #16+96]
_L81:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L84
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    ldr x0, [x29, #16+80]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L83
_L84:
    mov x0, #0
_L83:
    cmp x0, #0
    b.eq _L82
    ldr x0, [x29, #16+96]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+96]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L81
_L82:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    mov x19, x0
    ldr x0, [x29, #16+96]
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    ldr x0, [x29, #16+88]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L9
    b _L80
_L79:
_L80:
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+104]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+112]
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L85
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L90
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L89
_L90:
    mov x0, #0
_L89:
    cmp x0, #0
    b.eq _L87
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L88
_L87:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L88:
    b _L86
_L85:
_L86:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L91
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L96
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L95
_L96:
    mov x0, #0
_L95:
    cmp x0, #0
    b.eq _L93
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L94
_L93:
_L94:
    b _L92
_L91:
_L92:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L97
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L102
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L101
_L102:
    mov x0, #0
_L101:
    cmp x0, #0
    b.eq _L99
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L100
_L99:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L100:
    b _L98
_L97:
_L98:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L103
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L108
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L107
_L108:
    mov x0, #0
_L107:
    cmp x0, #0
    b.eq _L105
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L106
_L105:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L106:
    b _L104
_L103:
_L104:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L109
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L114
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L113
_L114:
    mov x0, #0
_L113:
    cmp x0, #0
    b.eq _L111
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L112
_L111:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L112:
    b _L110
_L109:
_L110:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L115
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L120
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L119
_L120:
    mov x0, #0
_L119:
    cmp x0, #0
    b.eq _L117
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L118
_L117:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L118:
    b _L116
_L115:
_L116:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L121
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L122
_L121:
_L122:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L123
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L128
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L127
_L128:
    mov x0, #0
_L127:
    cmp x0, #0
    b.eq _L125
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L126
_L125:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L126:
    b _L124
_L123:
_L124:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L129
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L134
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
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
    b _L133
_L134:
    mov x0, #0
_L133:
    cmp x0, #0
    b.eq _L131
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L132
_L131:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L132:
    b _L130
_L129:
_L130:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L135
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L136
_L135:
_L136:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L137
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L138
_L137:
_L138:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L139
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L140
_L139:
_L140:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L141
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L142
_L141:
_L142:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L143
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L144
_L143:
_L144:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L145
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L146
_L145:
_L146:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L147
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L148
_L147:
_L148:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L149
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L150
_L149:
_L150:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L151
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
    b _L152
_L151:
_L152:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L9
_L10:
    mov x19, x0
    mov x20, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x21, x0
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    adr x1, _var__lexer_tokenlar
    ldr x0, [x1]
    ldp x29, x30, [sp], #128
    ret
    ldp x29, x30, [sp], #128
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
_var__lex_satir: .quad 0
_var__lex_kolon: .quad 0
_var__lexer_tokenlar: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
