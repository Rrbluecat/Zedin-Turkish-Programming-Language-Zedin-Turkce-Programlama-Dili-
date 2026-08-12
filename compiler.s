.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__fn_imzalar
    str x0, [x1]
    mov x0, #0
    adr x1, _var_OP_SAYI
    str x0, [x1]
    mov x0, #1
    adr x1, _var_OP_METIN
    str x0, [x1]
    mov x0, #2
    adr x1, _var_OP_TUZ
    str x0, [x1]
    mov x0, #3
    adr x1, _var_OP_TERS
    str x0, [x1]
    mov x0, #4
    adr x1, _var_OP_BOS
    str x0, [x1]
    mov x0, #5
    adr x1, _var_OP_YUKLE
    str x0, [x1]
    mov x0, #6
    adr x1, _var_OP_SAKLA
    str x0, [x1]
    mov x0, #7
    adr x1, _var_OP_TANI
    str x0, [x1]
    mov x0, #8
    adr x1, _var_OP_TOPLA
    str x0, [x1]
    mov x0, #9
    adr x1, _var_OP_CIKAR
    str x0, [x1]
    mov x0, #10
    adr x1, _var_OP_CARP
    str x0, [x1]
    mov x0, #11
    adr x1, _var_OP_BOL
    str x0, [x1]
    mov x0, #12
    adr x1, _var_OP_MOD
    str x0, [x1]
    mov x0, #13
    adr x1, _var_OP_NEG
    str x0, [x1]
    mov x0, #14
    adr x1, _var_OP_ESIT
    str x0, [x1]
    mov x0, #15
    adr x1, _var_OP_ESIT_DEGIL
    str x0, [x1]
    mov x0, #16
    adr x1, _var_OP_BUYUK
    str x0, [x1]
    mov x0, #17
    adr x1, _var_OP_KUCUK
    str x0, [x1]
    mov x0, #18
    adr x1, _var_OP_BUYUK_ESIT
    str x0, [x1]
    mov x0, #19
    adr x1, _var_OP_KUCUK_ESIT
    str x0, [x1]
    mov x0, #20
    adr x1, _var_OP_VE
    str x0, [x1]
    mov x0, #21
    adr x1, _var_OP_VEYA
    str x0, [x1]
    mov x0, #22
    adr x1, _var_OP_DEGIL
    str x0, [x1]
    mov x0, #23
    adr x1, _var_OP_LISTE
    str x0, [x1]
    mov x0, #24
    adr x1, _var_OP_INDEKS_AL
    str x0, [x1]
    mov x0, #25
    adr x1, _var_OP_INDEKS_ATA
    str x0, [x1]
    mov x0, #26
    adr x1, _var_OP_ATLA
    str x0, [x1]
    mov x0, #27
    adr x1, _var_OP_ATLA_YANLIS
    str x0, [x1]
    mov x0, #28
    adr x1, _var_OP_ATLA_DOGRU
    str x0, [x1]
    mov x0, #29
    adr x1, _var_OP_CAGIR
    str x0, [x1]
    mov x0, #30
    adr x1, _var_OP_DON
    str x0, [x1]
    mov x0, #31
    adr x1, _var_OP_DON_BOS
    str x0, [x1]
    mov x0, #32
    adr x1, _var_OP_KIR
    str x0, [x1]
    mov x0, #33
    adr x1, _var_OP_DEVAM
    str x0, [x1]
    mov x0, #34
    adr x1, _var_OP_YUKLE_GLOBAL
    str x0, [x1]
    mov x0, #35
    adr x1, _var_OP_SAKLA_GLOBAL
    str x0, [x1]
    mov x0, #36
    adr x1, _var_OP_TANI_GLOBAL
    str x0, [x1]
    mov x0, #37
    adr x1, _var_OP_YAZ
    str x0, [x1]
    mov x0, #38
    adr x1, _var_OP_POP
    str x0, [x1]
    mov x0, #39
    adr x1, _var_OP_KOPYALA
    str x0, [x1]
    mov x0, #40
    adr x1, _var_OP_HALT
    str x0, [x1]
    mov x0, #45
    adr x1, _var_OP_SORU
    str x0, [x1]
    mov x0, #0
    adr x1, _var__global_mod
    str x0, [x1]
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

imza_ekle:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    str x2, [x29, #-24]
    adr x1, _var__fn_imzalar
    ldr x0, [x1]
    str x0, [sp, #-16]!
    mov x0, #3
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
    ldp x0, x1, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #48
    ret

imza_bul:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #16+16]
_L1:
    ldr x0, [x29, #16+16]
    mov x22, x0
    adr x1, _var__fn_imzalar
    ldr x0, [x1]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L2
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__fn_imzalar
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
    b.ne _L3
    ldr x0, [x29, #16+16]
    mov x21, x0
    adr x1, _var__fn_imzalar
    ldr x0, [x1]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    b _L4
_L3:
_L4:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L1
_L2:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

ast_tip:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L5
    ldp x29, x30, [sp], #32
    ret
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
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L7
    ldp x29, x30, [sp], #32
    ret
    b _L8
_L7:
_L8:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L9
    ldp x29, x30, [sp], #32
    ret
    b _L10
_L9:
_L10:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L11
    ldp x29, x30, [sp], #32
    ret
    b _L12
_L11:
_L12:
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L13
    ldp x29, x30, [sp], #32
    ret
    b _L14
_L13:
_L14:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

tip_kontrol_stmt:
    stp x29, x30, [sp, #-160]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L15
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L16
_L15:
_L16:
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
    b.ne _L17
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+40]
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+48]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+56]
    mov x0, #0
    str x0, [x29, #16+64]
_L19:
    ldr x0, [x29, #16+64]
    mov x22, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L20
    ldr x0, [x29, #16+56]
    str x0, [sp, #-16]!
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+64]
    b _L19
_L20:
    ldr x0, [x29, #16+32]
    mov x19, x0
    ldr x0, [x29, #16+56]
    mov x20, x0
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl imza_ekle
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.le _L21
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+48]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+72]
    mov x0, #0
    str x0, [x29, #16+80]
_L23:
    ldr x0, [x29, #16+80]
    mov x22, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L24
    ldr x0, [x29, #16+80]
    mov x21, x0
    ldr x0, [x29, #16+72]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+80]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+80]
    b _L23
_L24:
    b _L22
_L21:
_L22:
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L18
_L17:
_L18:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L25
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L26
_L25:
_L26:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L27
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+88]
    ldr x0, [x29, #16+88]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L29
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
    bl imza_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+96]
    ldr x0, [x29, #16+96]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L34
    mov x0, #2
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
    cset x0, ne
    b _L33
_L34:
    mov x0, #0
_L33:
    cmp x0, #0
    b.eq _L31
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L32
_L31:
_L32:
    b _L30
_L29:
_L30:
    mov x0, #0
    ldp x29, x30, [sp], #112
    ret
    b _L28
_L27:
_L28:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L35
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #112
    ret
    b _L36
_L35:
_L36:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L37
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #112
    ret
    b _L38
_L37:
_L38:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L39
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.le _L41
    mov x0, #0
    str x0, [x29, #16+104]
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
    str x0, [x29, #16+112]
_L43:
    ldr x0, [x29, #16+104]
    mov x22, x0
    ldr x0, [x29, #16+112]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L44
    ldr x0, [x29, #16+104]
    mov x21, x0
    ldr x0, [x29, #16+112]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+104]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+104]
    b _L43
_L44:
    b _L42
_L41:
_L42:
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #3
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L48
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L47
_L48:
    mov x0, #0
_L47:
    cmp x0, #0
    b.eq _L45
    mov x0, #0
    str x0, [x29, #16+120]
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
    str x0, [x29, #16+128]
_L49:
    ldr x0, [x29, #16+120]
    mov x22, x0
    ldr x0, [x29, #16+128]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L50
    ldr x0, [x29, #16+120]
    mov x21, x0
    ldr x0, [x29, #16+128]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+120]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+120]
    b _L49
_L50:
    b _L46
_L45:
_L46:
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L40
_L39:
_L40:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L51
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.le _L53
    mov x0, #0
    str x0, [x29, #16+136]
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
    str x0, [x29, #16+144]
_L55:
    ldr x0, [x29, #16+136]
    mov x22, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L56
    ldr x0, [x29, #16+136]
    mov x21, x0
    ldr x0, [x29, #16+144]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+136]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+136]
    b _L55
_L56:
    b _L54
_L53:
_L54:
    mov x0, #0
    ldp x29, x30, [sp], #160
    ret
    b _L52
_L51:
_L52:
    mov x0, #0
    ldp x29, x30, [sp], #160
    ret
    ldp x29, x30, [sp], #160
    ret

tip_kontrol_ifade:
    stp x29, x30, [sp, #-112]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L57
    ldp x29, x30, [sp], #32
    ret
    b _L58
_L57:
_L58:
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
    b.ne _L59
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+40]
    mov x0, #0
    str x0, [x29, #16+48]
_L61:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L62
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+48]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+48]
    b _L61
_L62:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl imza_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L66
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L65
_L66:
    mov x0, #0
_L65:
    cmp x0, #0
    b.eq _L63
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #8]
    mov x22, x0
    ldr x0, [x29, #16+64]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.eq _L67
    ldr x0, [x29, #16+64]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L69
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+64]
    ldr x0, [x0, #8]
    bl _zedin_metine
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #8]
    bl _zedin_metine
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
    b _L70
_L69:
_L70:
    b _L68
_L67:
    mov x0, #0
    str x0, [x29, #16+72]
_L71:
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+64]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L72
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+64]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+80]
    ldr x0, [x29, #16+80]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L73
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ast_tip
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+88]
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L78
    ldr x0, [x29, #16+88]
    mov x22, x0
    ldr x0, [x29, #16+80]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L77
_L78:
    mov x0, #0
_L77:
    cmp x0, #0
    b.eq _L75
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #1
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
    mov x22, x0
    ldr x0, [x29, #16+80]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+88]
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
    b _L76
_L75:
_L76:
    b _L74
_L73:
_L74:
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    b _L71
_L72:
_L68:
    b _L64
_L63:
_L64:
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L82
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L81
_L82:
    mov x0, #0
_L81:
    cmp x0, #0
    b.eq _L79
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #112
    ret
    b _L80
_L79:
_L80:
    ldp x29, x30, [sp], #112
    ret
    b _L60
_L59:
_L60:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L83
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
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
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L84
_L83:
_L84:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L85
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_ifade
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    b _L86
_L85:
_L86:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl ast_tip
    ldp x22, x23, [sp], #16
    ldp x29, x30, [sp], #112
    ret
    ldp x29, x30, [sp], #112
    ret

tip_kontrol:
    stp x29, x30, [sp, #-112]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    adr x1, _var__fn_imzalar
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L87:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L88
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    b.ne _L89
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    str x0, [x29, #16+32]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #4
    cmp x22, x0
    b.le _L91
    mov x0, #4
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    str x0, [x29, #16+40]
    b _L92
_L91:
    mov x0, #0
    str x0, [x29, #16+48]
_L93:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L94
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
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
    b _L93
_L94:
_L92:
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #5
    cmp x22, x0
    b.le _L95
    mov x0, #5
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    str x0, [x29, #16+56]
    b _L96
_L95:
_L96:
    ldr x0, [x29, #16+56]
    mov x22, x0
    cmp x22, x0
    b.ne _L97
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    bl _zedin_metine
    str x0, [x29, #16+64]
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    bl _zedin_metine
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    bl _zedin_metine
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L99
    mov x0, #0
    str x0, [x29, #16+72]
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #3
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L104
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L103
_L104:
    mov x0, #1
_L103:
    cmp x0, #0
    b.eq _L101
    movz x0, #16959
    movk x0, #15, lsl #16
    str x0, [x29, #16+72]
    b _L87
    b _L102
_L101:
_L102:
    mov x0, #1
    mov x21, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+80]
_L105:
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+80]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L106
    ldr x0, [x29, #16+72]
    mov x21, x0
    ldr x0, [x29, #16+80]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+88]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L107
    mov x0, #0
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
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
    b.ne _L109
    mov x0, #1
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L114
    mov x0, #1
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
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
    mov x0, #1
_L113:
    cmp x0, #0
    b.eq _L111
    str x0, [x29, #16+56]
    b _L112
_L111:
_L112:
    b _L110
_L109:
_L110:
    b _L108
_L107:
_L108:
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    b _L105
_L106:
    b _L100
_L99:
_L100:
    b _L98
_L97:
_L98:
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+24]
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
    ldr x0, [x29, #16+40]
    mov x20, x0
    ldr x0, [x29, #16+56]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl imza_ekle
    ldp x22, x23, [sp], #16
    b _L90
_L89:
_L90:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L87
_L88:
    mov x0, #0
    str x0, [x29, #16+24]
_L115:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L116
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl tip_kontrol_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L115
_L116:
    ldr x0, [x29, #16+16]
    ldp x29, x30, [sp], #112
    ret
    ldp x29, x30, [sp], #112
    ret

chunk_yeni:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #5
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
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
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #16
    str x0, [x1]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #24
    str x0, [x1]
    ldr x0, [x29, #16+8]
    ldr x1, [sp]
    ldr x1, [x1, #16]
    add x1, x1, #32
    str x0, [x1]
    ldp x0, x1, [sp], #16
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_kod:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_sabitler:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_degiskenler:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_params:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_isim:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x0, #4
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_yaz_byte:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret

chunk_yaz_op:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #32
    ret

chunk_yaz_op_arg:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    str x2, [x29, #-24]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, #8
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldp x29, x30, [sp], #48
    ret

chunk_sabit_ekle:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
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
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_degisken_ekle:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    str x0, [x29, #16+24]
_L117:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L118
    ldr x0, [x29, #16+24]
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
    ldr x0, [x29, #16+16]
    cmp x22, x0
    b.ne _L119
    ldr x0, [x29, #16+24]
    ldp x29, x30, [sp], #48
    ret
    b _L120
_L119:
_L120:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L117
_L118:
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

chunk_degisken_bul:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    str x0, [x29, #16+24]
_L121:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L122
    ldr x0, [x29, #16+24]
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
    ldr x0, [x29, #16+16]
    cmp x22, x0
    b.ne _L123
    ldr x0, [x29, #16+24]
    ldp x29, x30, [sp], #48
    ret
    b _L124
_L123:
_L124:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L121
_L122:
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

chunk_jump_placeholder:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #255
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #255
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

chunk_jump_doldur:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    str x2, [x29, #-24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    str x22, [x0]
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, #8
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x21, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    str x22, [x0]
    ldp x29, x30, [sp], #48
    ret

derle_var_oku:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_degisken_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L125
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_YUKLE
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    b _L126
_L125:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_YUKLE_GLOBAL
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
_L126:
    ldp x29, x30, [sp], #48
    ret

derle_var_yaz:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_degisken_bul
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.lt _L127
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_SAKLA
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    b _L128
_L127:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_SAKLA_GLOBAL
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
_L128:
    ldp x29, x30, [sp], #48
    ret

derle_ifade:
    stp x29, x30, [sp, #-96]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L129
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_BOS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L130
_L129:
_L130:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L131
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_SAYI
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    b _L132
_L131:
_L132:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L133
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_METIN
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L134
_L133:
_L134:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L135
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L137
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TUZ
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    b _L138
_L137:
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TERS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
_L138:
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L136
_L135:
_L136:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L139
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_var_oku
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L140
_L139:
_L140:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L141
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_var_yaz
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L142
_L141:
_L142:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L143
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L145
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA_YANLIS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_placeholder
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_POP
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+56]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L146
_L145:
_L146:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L147
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA_DOGRU
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_placeholder
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_POP
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+64]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L148
_L147:
_L148:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L149
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TOPLA
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L150
_L149:
_L150:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L151
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_CIKAR
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L152
_L151:
_L152:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L153
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_CARP
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L154
_L153:
_L154:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L155
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_BOL
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L156
_L155:
_L156:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L157
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_MOD
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L158
_L157:
_L158:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L159
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ESIT
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L160
_L159:
_L160:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L161
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ESIT_DEGIL
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L162
_L161:
_L162:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L163
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_BUYUK
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L164
_L163:
_L164:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L165
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_KUCUK
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L166
_L165:
_L166:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L167
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_BUYUK_ESIT
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L168
_L167:
_L168:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L169
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_KUCUK_ESIT
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L170
_L169:
_L170:
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L144
_L143:
_L144:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L171
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_var_oku
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+72]
_L173:
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L174
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x21, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+72]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+72]
    b _L173
_L174:
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_CAGIR
    ldr x0, [x1]
    mov x20, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L172
_L171:
_L172:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L175
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_SORU
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L176
_L175:
_L176:
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    ldp x29, x30, [sp], #96
    ret

derle_stmt:
    stp x29, x30, [sp, #-144]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L177
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L178
_L177:
_L178:
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L179
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #2
    cmp x22, x0
    b.le _L181
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    b _L182
_L181:
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_BOS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
_L182:
    adr x1, _var__global_mod
    ldr x0, [x1]
    cmp x0, #0
    b.eq _L183
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TANI_GLOBAL
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    b _L184
_L183:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_degisken_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TANI
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+40]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
_L184:
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L180
_L179:
_L180:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L185
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_YAZ
    ldr x0, [x1]
    mov x20, x0
    mov x0, #1
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L186
_L185:
_L186:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L187
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_POP
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #64
    ret
    b _L188
_L187:
_L188:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L189
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA_YANLIS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_placeholder
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_blok
    ldp x22, x23, [sp], #16
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.eq _L191
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_placeholder
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_blok
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+56]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
    b _L192
_L191:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
_L192:
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L190
_L189:
_L190:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L193
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA_YANLIS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_placeholder
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+72]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_blok
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    mov x22, x0
    mov x0, #3
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    str x0, [x29, #16+80]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_ATLA
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+80]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_jump_doldur
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #96
    ret
    b _L194
_L193:
_L194:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L195
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_yeni
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+88]
    adr x1, _var__global_mod
    ldr x0, [x1]
    str x0, [x29, #16+96]
    mov x0, #0
    adr x1, _var__global_mod
    str x0, [x1]
    mov x0, #0
    str x0, [x29, #16+104]
_L197:
    ldr x0, [x29, #16+104]
    mov x22, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L198
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+88]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+104]
    mov x21, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    ldr x0, [x29, #16+88]
    mov x19, x0
    ldr x0, [x29, #16+104]
    mov x21, x0
    mov x0, #2
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_degisken_ekle
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+104]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+104]
    b _L197
_L198:
    ldr x0, [x29, #16+88]
    mov x19, x0
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_blok
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+88]
    mov x19, x0
    adr x1, _var_OP_DON_BOS
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+96]
    adr x1, _var__global_mod
    str x0, [x1]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+88]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+112]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_SAYI
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+112]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_sabit_ekle
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+120]
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_TANI_GLOBAL
    ldr x0, [x1]
    mov x20, x0
    ldr x0, [x29, #16+120]
    mov x21, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op_arg
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L196
_L195:
_L196:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L199
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_ifade
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_DON
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L200
_L199:
_L200:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L201
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_DEVAM
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L202
_L201:
_L202:
    ldr x0, [x29, #16+24]
    mov x22, x0
    cmp x22, x0
    b.ne _L203
    ldr x0, [x29, #16+8]
    mov x19, x0
    adr x1, _var_OP_KIR
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    b _L204
_L203:
_L204:
    mov x0, #0
    ldp x29, x30, [sp], #144
    ret
    ldp x29, x30, [sp], #144
    ret

derle_blok:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+16]
    mov x22, x0
    cmp x22, x0
    b.ne _L205
    mov x0, #0
    ldp x29, x30, [sp], #32
    ret
    b _L206
_L205:
_L206:
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+24]
    mov x0, #0
    str x0, [x29, #16+32]
_L207:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L208
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl derle_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+32]
    b _L207
_L208:
    mov x0, #0
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

derle_program:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #-8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_yeni
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #0
    adr x1, _var__global_mod
    str x0, [x1]
    mov x0, #0
    str x0, [x29, #16+24]
_L209:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L210
    ldr x0, [x29, #16+16]
    mov x19, x0
    ldr x0, [x29, #16+24]
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
    bl derle_stmt
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L209
_L210:
    ldr x0, [x29, #16+16]
    mov x19, x0
    adr x1, _var_OP_HALT
    ldr x0, [x1]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_yaz_op
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    ldp x29, x30, [sp], #48
    ret
    ldp x29, x30, [sp], #48
    ret

yaz_u8:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_1
    bl fopen
    cmp x0, #0
    b.eq _L211
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L211:
    ldp x29, x30, [sp], #32
    ret

yaz_u16:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_2
    bl fopen
    cmp x0, #0
    b.eq _L212
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L212:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #8
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_3
    bl fopen
    cmp x0, #0
    b.eq _L213
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L213:
    ldp x29, x30, [sp], #32
    ret

yaz_u32:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_4
    bl fopen
    cmp x0, #0
    b.eq _L214
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L214:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #8
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_5
    bl fopen
    cmp x0, #0
    b.eq _L215
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L215:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #16
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_6
    bl fopen
    cmp x0, #0
    b.eq _L216
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L216:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #24
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_kaydir_sag
    ldp x22, x23, [sp], #16
    mov x19, x0
    mov x0, #255
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl bit_ve
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    adr x1, _str_7
    bl fopen
    cmp x0, #0
    b.eq _L217
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L217:
    ldp x29, x30, [sp], #32
    ret

yaz_str:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u16
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+24]
_L218:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L219
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    bl _zedin_char_kodu
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+40]
    mov x20, x0
    mov x0, x19
    adr x1, _str_8
    bl fopen
    cmp x0, #0
    b.eq _L220
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L220:
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L218
_L219:
    ldp x29, x30, [sp], #64
    ret

yaz_f64:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x22, x0
    ldr x0, [x29, #16+16]
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
    bl komut_calistir
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tamam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L221
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+32]
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tara
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+40]
    mov x0, #0
    str x0, [x29, #16+48]
_L223:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    sub x0, x0, x23
    cmp x22, x0
    b.ge _L224
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+40]
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
    b.ne _L225
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+40]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    adr x1, _str_9
    bl fopen
    cmp x0, #0
    b.eq _L227
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L227:
    b _L226
_L225:
_L226:
    ldr x0, [x29, #16+48]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+48]
    b _L223
_L224:
    b _L222
_L221:
_L222:
    ldp x29, x30, [sp], #64
    ret

chunk_kaydet:
    stp x29, x30, [sp, #-80]!
    mov x29, sp
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_isim
    ldp x22, x23, [sp], #16
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_str
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_params
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_params
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+24]
_L228:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_params
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L229
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_params
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_str
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L228
_L229:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_degiskenler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u16
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+32]
_L230:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_degiskenler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L231
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+32]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_degiskenler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_str
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+32]
    b _L230
_L231:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_sabitler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u16
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+40]
_L232:
    ldr x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_sabitler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L233
    ldr x0, [x29, #16+40]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_sabitler
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tip
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+56]
    mov x22, x0
    cmp x22, x0
    b.ne _L234
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_f64
    ldp x22, x23, [sp], #16
    b _L235
_L234:
_L235:
    ldr x0, [x29, #16+56]
    mov x22, x0
    cmp x22, x0
    b.ne _L236
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #2
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_str
    ldp x22, x23, [sp], #16
    b _L237
_L236:
_L237:
    ldr x0, [x29, #16+56]
    mov x22, x0
    cmp x22, x0
    b.ne _L238
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+48]
    cmp x0, #0
    b.eq _L240
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #1
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    b _L241
_L240:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #0
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
_L241:
    b _L239
_L238:
_L239:
    ldr x0, [x29, #16+56]
    mov x22, x0
    cmp x22, x0
    b.ne _L242
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, #4
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+48]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_kaydet
    ldp x22, x23, [sp], #16
    b _L243
_L242:
_L243:
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    b _L232
_L233:
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_kod
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u32
    ldp x22, x23, [sp], #16
    mov x0, #0
    str x0, [x29, #16+64]
_L244:
    ldr x0, [x29, #16+64]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_kod
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L245
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+64]
    mov x21, x0
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl chunk_kod
    ldp x22, x23, [sp], #16
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl yaz_u8
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+64]
    b _L244
_L245:
    ldp x29, x30, [sp], #80
    ret

zedin_derle:
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
    adr x1, _str_10
    bl fopen
    mov x20, x0
    cmp x20, #0
    b.eq _L246
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
    b _L247
_L246:
    mov x0, #0
_L247:
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl hata_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L248
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
    b _L249
_L248:
_L249:
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
    bl tip_kontrol
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+56]
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L250
    mov x0, #0
    str x0, [x29, #16+64]
_L252:
    ldr x0, [x29, #16+64]
    mov x22, x0
    ldr x0, [x29, #16+56]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L253
    mov x22, x0
    ldr x0, [x29, #16+64]
    mov x21, x0
    ldr x0, [x29, #16+56]
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
    ldr x0, [x29, #16+64]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+64]
    b _L252
_L253:
    mov x0, #0
    ldp x29, x30, [sp], #80
    ret
    b _L251
_L250:
_L251:
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+48]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl derle_program
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    adr x1, _str_11
    bl fopen
    cmp x0, #0
    b.eq _L254
    bl fclose
_L254:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #90
    mov x20, x0
    mov x0, x19
    adr x1, _str_12
    bl fopen
    cmp x0, #0
    b.eq _L255
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L255:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #69
    mov x20, x0
    mov x0, x19
    adr x1, _str_13
    bl fopen
    cmp x0, #0
    b.eq _L256
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L256:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #68
    mov x20, x0
    mov x0, x19
    adr x1, _str_14
    bl fopen
    cmp x0, #0
    b.eq _L257
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L257:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #67
    mov x20, x0
    mov x0, x19
    adr x1, _str_15
    bl fopen
    cmp x0, #0
    b.eq _L258
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L258:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, #1
    mov x20, x0
    mov x0, x19
    adr x1, _str_16
    bl fopen
    cmp x0, #0
    b.eq _L259
    mov x21, x0
    mov x0, x20
    mov x1, x21
    bl fputc
    mov x0, x21
    bl fclose
_L259:
    ldr x0, [x29, #16+16]
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x22, x23, [sp, #-16]!
    bl chunk_kaydet
    ldp x22, x23, [sp], #16
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
_var__fn_imzalar: .quad 0
_var_OP_SAYI: .quad 0
_var_OP_METIN: .quad 0
_var_OP_TUZ: .quad 0
_var_OP_TERS: .quad 0
_var_OP_BOS: .quad 0
_var_OP_YUKLE: .quad 0
_var_OP_SAKLA: .quad 0
_var_OP_TANI: .quad 0
_var_OP_TOPLA: .quad 0
_var_OP_CIKAR: .quad 0
_var_OP_CARP: .quad 0
_var_OP_BOL: .quad 0
_var_OP_MOD: .quad 0
_var_OP_NEG: .quad 0
_var_OP_ESIT: .quad 0
_var_OP_ESIT_DEGIL: .quad 0
_var_OP_BUYUK: .quad 0
_var_OP_KUCUK: .quad 0
_var_OP_BUYUK_ESIT: .quad 0
_var_OP_KUCUK_ESIT: .quad 0
_var_OP_VE: .quad 0
_var_OP_VEYA: .quad 0
_var_OP_DEGIL: .quad 0
_var_OP_LISTE: .quad 0
_var_OP_INDEKS_AL: .quad 0
_var_OP_INDEKS_ATA: .quad 0
_var_OP_ATLA: .quad 0
_var_OP_ATLA_YANLIS: .quad 0
_var_OP_ATLA_DOGRU: .quad 0
_var_OP_CAGIR: .quad 0
_var_OP_DON: .quad 0
_var_OP_DON_BOS: .quad 0
_var_OP_KIR: .quad 0
_var_OP_DEVAM: .quad 0
_var_OP_YUKLE_GLOBAL: .quad 0
_var_OP_SAKLA_GLOBAL: .quad 0
_var_OP_TANI_GLOBAL: .quad 0
_var_OP_YAZ: .quad 0
_var_OP_POP: .quad 0
_var_OP_KOPYALA: .quad 0
_var_OP_HALT: .quad 0
_var_OP_SORU: .quad 0
_var__global_mod: .quad 0
_str_1: .asciz "ab"
_str_2: .asciz "ab"
_str_3: .asciz "ab"
_str_4: .asciz "ab"
_str_5: .asciz "ab"
_str_6: .asciz "ab"
_str_7: .asciz "ab"
_str_8: .asciz "ab"
_str_9: .asciz "ab"
_str_10: .asciz "r"
_str_11: .asciz "w"
_str_12: .asciz "ab"
_str_13: .asciz "ab"
_str_14: .asciz "ab"
_str_15: .asciz "ab"
_str_16: .asciz "ab"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
