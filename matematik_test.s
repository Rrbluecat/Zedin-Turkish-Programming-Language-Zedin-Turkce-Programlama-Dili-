.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

derece_radyan:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    str x0, [sp, #-16]!
    mov x0, #180
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

radyan_derece:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    mov x0, #180
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    str x0, [sp, #-16]!
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

sind:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl derece_radyan
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl sin
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

cosd:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl derece_radyan
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl cos
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

tand:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl derece_radyan
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl tan
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

fakt:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.gt _L1
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L2
_L1:
_L2:
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

kombinasyon:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #0
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.le _L3
    mov x0, #0
    str x0, [x29, #16+24]
    b _L4
_L3:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    str x0, [x29, #16+24]
_L4:
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

permutasyon:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #0
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.le _L5
    mov x0, #0
    str x0, [x29, #16+24]
    b _L6
_L5:
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    str x0, [x29, #16+24]
_L6:
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ebob:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
_L7:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.eq _L8
    ldr x0, [x29, #16+16]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x2, x0, x1
    msub x0, x2, x1, x0
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    str x0, [x29, #16+8]
    b _L7
_L8:
    ldr x0, [x29, #16+8]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ekok:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ebob
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

asal_mi:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #2
    cmp x22, x0
    b.ge _L9
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L10
_L9:
_L10:
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #2
    cmp x22, x0
    b.ne _L11
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L12
_L11:
_L12:
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    mov x0, #2
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x2, x0, x1
    msub x0, x2, x1, x0
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.ne _L13
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L14
_L13:
_L14:
    mov x0, #3
    str x0, [x29, #16+16]
_L15:
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.gt _L16
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x2, x0, x1
    msub x0, x2, x1, x0
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.ne _L17
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L18
_L17:
_L18:
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    mov x0, #2
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+16]
    b _L15
_L16:
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

asallar:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #2
    str x0, [x29, #16+24]
_L19:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.gt _L20
    ldr x0, [x29, #16+24]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl asal_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L21
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    b _L22
_L21:
_L22:
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+24]
    b _L19
_L20:
    ldr x0, [x29, #16+16]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

fib:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.gt _L23
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L24
_L23:
_L24:
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #1
    cmp x22, x0
    b.ne _L25
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L26
_L25:
_L26:
    mov x0, #0
    str x0, [x29, #16+16]
    mov x0, #1
    str x0, [x29, #16+24]
    mov x0, #2
    str x0, [x29, #16+32]
_L27:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+8]
    cmp x22, x0
    b.gt _L28
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+24]
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+40]
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+32]
    b _L27
_L28:
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ondalik_yuvarla:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #10
    mov x19, x0
    ldr x0, [x29, #16+16]
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl us
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl yuvarla
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x1, x0
    ldr x0, [sp], #16
    sdiv x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

hipotenus:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl kok
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

mesafe:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    str x2, [x29, #40]
    str x3, [x29, #48]
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x19, x0
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl hipotenus
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

lerp:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    str x2, [x29, #40]
    ldr x0, [x29, #16+8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+24]
    mov x1, x0
    ldr x0, [sp], #16
    mul x0, x0, x1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

sinirla:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    str x2, [x29, #40]
    ldr x0, [x29, #16+8]
    mov x22, x0
    ldr x0, [x29, #16+16]
    cmp x22, x0
    b.ge _L29
    ldr x0, [x29, #16+16]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L30
_L29:
_L30:
    ldr x0, [x29, #16+8]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.le _L31
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L32
_L31:
_L32:
    ldr x0, [x29, #16+8]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

isaret:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L33
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L34
_L33:
_L34:
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.ge _L35
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L36
_L35:
_L36:
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

sigma:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    str x1, [x29, #32]
    mov x0, #0
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+8]
    str x0, [x29, #16+32]
_L37:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+16]
    cmp x22, x0
    b.gt _L38
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+32]
    b _L37
_L38:
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ana:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_1
    bl puts
    adr x0, _str_2
    bl puts
    mov x0, #5
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fakt
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_3
    bl puts
    mov x0, #48
    mov x19, x0
    mov x0, #18
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ebob
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_4
    bl puts
    mov x0, #12
    mov x19, x0
    mov x0, #15
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ekok
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_5
    bl puts
    mov x0, #7
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl asal_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_6
    bl puts
    mov x0, #8
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl fib
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
    adr x0, _str_7
    bl puts
    mov x0, #1
    mov x19, x0
    mov x0, #10
    mov x20, x0
    mov x0, x19
    mov x1, x20
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl sigma
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov x19, x0
    adr x0, _fmt_sayi
    mov x1, x19
    bl printf
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
_str_1: .asciz "=== Zedin Matematik Modulu Testi ==="
_str_2: .asciz "5 Faktoriyel (Beklenen: 120):"
_str_3: .asciz "EBOB(48, 18) (Beklenen: 6):"
_str_4: .asciz "EKOK(12, 15) (Beklenen: 60):"
_str_5: .asciz "7 Asal mi? (Beklenen: 1):"
_str_6: .asciz "Fibonacci(8) (Beklenen: 21):"
_str_7: .asciz "Sigma(1, 10) (Beklenen: 55):"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
