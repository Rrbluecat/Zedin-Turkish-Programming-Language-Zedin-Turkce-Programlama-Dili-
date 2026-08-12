.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ev_klasoru
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    adr x0, _str_16
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
    adr x1, _var_ev
    str x0, [x1]
    adr x0, _str_17
    bl puts
    adr x1, _var_ev
    ldr x0, [x1]
    bl puts
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl platform
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [sp, #-16]!
    adr x0, _str_18
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
    adr x1, _var_p
    str x0, [x1]
    adr x0, _str_19
    bl puts
    adr x1, _var_p
    ldr x0, [x1]
    bl puts
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

calistir:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl hata_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L1
    adr x0, _str_1
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L2
_L1:
_L2:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

env:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ortam_degiskeni
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

ev_klasoru:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_2
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ortam_degiskeni
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

kullanici:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_3
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl ortam_degiskeni
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

klasor:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_4
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl tamam_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L3
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L5
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    adr x0, _str_5
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L7
    adr x0, _str_6
    str x0, [x29, #16+24]
    mov x0, #0
    str x0, [x29, #16+32]
_L9:
    ldr x0, [x29, #16+32]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    sub x0, x0, x1
    cmp x22, x0
    b.ge _L10
    ldr x0, [x29, #16+24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+32]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
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
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+32]
    b _L9
_L10:
    ldr x0, [x29, #16+24]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L8
_L7:
_L8:
    b _L6
_L5:
_L6:
    ldr x0, [x29, #16+16]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L4
_L3:
_L4:
    adr x0, _str_7
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

dosyalar:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    adr x0, _str_8
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
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
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl hata_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L11
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L12
_L11:
_L12:
    ldr x0, [x29, #16+16]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+24]
    mov x0, #0
    bl _zedin_liste_yeni
    stp x0, x1, [sp, #-16]!
    ldp x0, x1, [sp], #16
    str x0, [x29, #16+32]
    adr x0, _str_9
    str x0, [x29, #16+40]
    mov x0, #0
    str x0, [x29, #16+48]
_L13:
    ldr x0, [x29, #16+48]
    mov x22, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L14
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    adr x0, _str_10
    mov x1, x0
    mov x0, x19
    bl strcmp
    cmp x0, #0
    b.ne _L15
    ldr x0, [x29, #16+40]
    bl _zedin_strlen
    mov x22, x0
    mov x0, #0
    cmp x22, x0
    b.le _L17
    ldr x0, [x29, #16+32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+40]
    mov x1, x0
    ldr x0, [sp]
    add sp, sp, #16
    bl _zedin_ekle
    adr x0, _str_11
    str x0, [x29, #16+40]
    b _L18
_L17:
_L18:
    b _L16
_L15:
    ldr x0, [x29, #16+40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+24]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
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
    str x0, [x29, #16+40]
_L16:
    ldr x0, [x29, #16+48]
    str x0, [sp, #-16]!
    mov x0, #1
    mov x1, x0
    ldr x0, [sp], #16
    add x0, x0, x1
    str x0, [x29, #16+48]
    b _L13
_L14:
    ldr x0, [x29, #16+32]
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

platform:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_12
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl tamam_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L19
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L20
_L19:
_L20:
    adr x0, _str_13
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

bellek_kullanimi:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    adr x0, _str_14
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    str x0, [x29, #16+8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl tamam_mi
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    cmp x0, #0
    b.eq _L21
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl deger_al
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    b _L22
_L21:
_L22:
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret
    mov sp, x29
    ldp x29, x30, [sp], #48
    ret

uyku:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #24]
    adr x0, _str_15
    str x0, [sp, #-16]!
    ldr x0, [x29, #16+8]
    bl _zedin_metine
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
    mov x19, x0
    mov x0, x19
    stp x19, x20, [sp, #-16]!
    stp x22, x23, [sp, #-16]!
    bl komut_calistir
    ldp x22, x23, [sp], #16
    ldp x19, x20, [sp], #16
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
_str_1: .asciz ""
_str_2: .asciz "HOME"
_str_3: .asciz "USER"
_str_4: .asciz "pwd"
_str_5: .asciz "\n"
_str_6: .asciz ""
_str_7: .asciz ""
_str_8: .asciz "ls "
_str_9: .asciz ""
_str_10: .asciz "\n"
_str_11: .asciz ""
_str_12: .asciz "uname -s"
_str_13: .asciz "bilinmiyor"
_str_14: .asciz "free -m | awk 'NR==2{print $3}'"
_str_15: .asciz "sleep "
_var_ev: .quad 0
_str_16: .asciz ""
_str_17: .asciz "Ev Klasörü:"
_var_p: .quad 0
_str_18: .asciz ""
_str_19: .asciz "Platform:"
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
