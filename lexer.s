.section .text
.global main
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
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
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

harf_mi:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L128
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L127
_L128:
    mov x0, #1
_L127:
    cmp x0, #0
    b.ne _L126
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L125
_L126:
    mov x0, #1
_L125:
    cmp x0, #0
    b.ne _L124
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L123
_L124:
    mov x0, #1
_L123:
    cmp x0, #0
    b.ne _L122
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L121
_L122:
    mov x0, #1
_L121:
    cmp x0, #0
    b.ne _L120
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L119
_L120:
    mov x0, #1
_L119:
    cmp x0, #0
    b.ne _L118
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L117
_L118:
    mov x0, #1
_L117:
    cmp x0, #0
    b.ne _L116
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L115
_L116:
    mov x0, #1
_L115:
    cmp x0, #0
    b.ne _L114
    ldr x0, [x29, #16+8]
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
    b.ne _L112
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L111
_L112:
    mov x0, #1
_L111:
    cmp x0, #0
    b.ne _L110
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L109
_L110:
    mov x0, #1
_L109:
    cmp x0, #0
    b.ne _L108
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L107
_L108:
    mov x0, #1
_L107:
    cmp x0, #0
    b.ne _L106
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    b.ne _L98
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L97
_L98:
    mov x0, #1
_L97:
    cmp x0, #0
    b.ne _L96
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L95
_L96:
    mov x0, #1
_L95:
    cmp x0, #0
    b.ne _L94
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L93
_L94:
    mov x0, #1
_L93:
    cmp x0, #0
    b.ne _L92
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L91
_L92:
    mov x0, #1
_L91:
    cmp x0, #0
    b.ne _L90
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L89
_L90:
    mov x0, #1
_L89:
    cmp x0, #0
    b.ne _L88
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    b.ne _L78
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L77
_L78:
    mov x0, #1
_L77:
    cmp x0, #0
    b.ne _L76
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L75
_L76:
    mov x0, #1
_L75:
    cmp x0, #0
    b.ne _L74
    ldr x0, [x29, #16+8]
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
    b.ne _L72
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L71
_L72:
    mov x0, #1
_L71:
    cmp x0, #0
    b.ne _L70
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L69
_L70:
    mov x0, #1
_L69:
    cmp x0, #0
    b.ne _L68
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    b.ne _L62
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L61
_L62:
    mov x0, #1
_L61:
    cmp x0, #0
    b.ne _L60
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L59
_L60:
    mov x0, #1
_L59:
    cmp x0, #0
    b.ne _L58
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L57
_L58:
    mov x0, #1
_L57:
    cmp x0, #0
    b.ne _L56
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L55
_L56:
    mov x0, #1
_L55:
    cmp x0, #0
    b.ne _L54
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L53
_L54:
    mov x0, #1
_L53:
    cmp x0, #0
    b.ne _L52
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L51
_L52:
    mov x0, #1
_L51:
    cmp x0, #0
    b.ne _L50
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L49
_L50:
    mov x0, #1
_L49:
    cmp x0, #0
    b.ne _L48
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L47
_L48:
    mov x0, #1
_L47:
    cmp x0, #0
    b.ne _L46
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L45
_L46:
    mov x0, #1
_L45:
    cmp x0, #0
    b.ne _L44
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L43
_L44:
    mov x0, #1
_L43:
    cmp x0, #0
    b.ne _L42
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L41
_L42:
    mov x0, #1
_L41:
    cmp x0, #0
    b.ne _L40
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L39
_L40:
    mov x0, #1
_L39:
    cmp x0, #0
    b.ne _L38
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L37
_L38:
    mov x0, #1
_L37:
    cmp x0, #0
    b.ne _L36
    ldr x0, [x29, #16+8]
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
    b.ne _L34
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L33
_L34:
    mov x0, #1
_L33:
    cmp x0, #0
    b.ne _L32
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L31
_L32:
    mov x0, #1
_L31:
    cmp x0, #0
    b.ne _L30
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L29
_L30:
    mov x0, #1
_L29:
    cmp x0, #0
    b.ne _L28
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L27
_L28:
    mov x0, #1
_L27:
    cmp x0, #0
    b.ne _L26
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L25
_L26:
    mov x0, #1
_L25:
    cmp x0, #0
    b.ne _L24
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L23
_L24:
    mov x0, #1
_L23:
    cmp x0, #0
    b.ne _L22
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L21
_L22:
    mov x0, #1
_L21:
    cmp x0, #0
    b.ne _L20
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L19
_L20:
    mov x0, #1
_L19:
    cmp x0, #0
    b.ne _L18
    ldr x0, [x29, #16+8]
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
    ldr x0, [x29, #16+8]
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
    b.ne _L14
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L13
_L14:
    mov x0, #1
_L13:
    cmp x0, #0
    b.ne _L12
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L11
_L12:
    mov x0, #1
_L11:
    cmp x0, #0
    b.ne _L10
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L9
_L10:
    mov x0, #1
_L9:
    cmp x0, #0
    b.ne _L8
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L7
_L8:
    mov x0, #1
_L7:
    cmp x0, #0
    b.ne _L6
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L5
_L6:
    mov x0, #1
_L5:
    cmp x0, #0
    b.ne _L4
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L3
_L4:
    mov x0, #1
_L3:
    cmp x0, #0
    b.ne _L2
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L1
_L2:
    mov x0, #1
_L1:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

akam_mi:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L146
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L145
_L146:
    mov x0, #1
_L145:
    cmp x0, #0
    b.ne _L144
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L143
_L144:
    mov x0, #1
_L143:
    cmp x0, #0
    b.ne _L142
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L141
_L142:
    mov x0, #1
_L141:
    cmp x0, #0
    b.ne _L140
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L139
_L140:
    mov x0, #1
_L139:
    cmp x0, #0
    b.ne _L138
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L137
_L138:
    mov x0, #1
_L137:
    cmp x0, #0
    b.ne _L136
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L135
_L136:
    mov x0, #1
_L135:
    cmp x0, #0
    b.ne _L134
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L133
_L134:
    mov x0, #1
_L133:
    cmp x0, #0
    b.ne _L132
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L131
_L132:
    mov x0, #1
_L131:
    cmp x0, #0
    b.ne _L130
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L129
_L130:
    mov x0, #1
_L129:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

bosluk_mu:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.ne _L150
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L149
_L150:
    mov x0, #1
_L149:
    cmp x0, #0
    b.ne _L148
    ldr x0, [x29, #16+8]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L147
_L148:
    mov x0, #1
_L147:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
    ret

keyword_tipi:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    str x0, [x29, #-8]
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L151
    ldp x29, x30, [sp], #32
    ret
    b _L152
_L151:
_L152:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L153
    ldp x29, x30, [sp], #32
    ret
    b _L154
_L153:
_L154:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L155
    ldp x29, x30, [sp], #32
    ret
    b _L156
_L155:
_L156:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L157
    ldp x29, x30, [sp], #32
    ret
    b _L158
_L157:
_L158:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L159
    ldp x29, x30, [sp], #32
    ret
    b _L160
_L159:
_L160:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L161
    ldp x29, x30, [sp], #32
    ret
    b _L162
_L161:
_L162:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L163
    ldp x29, x30, [sp], #32
    ret
    b _L164
_L163:
_L164:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L165
    ldp x29, x30, [sp], #32
    ret
    b _L166
_L165:
_L166:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L167
    ldp x29, x30, [sp], #32
    ret
    b _L168
_L167:
_L168:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L169
    ldp x29, x30, [sp], #32
    ret
    b _L170
_L169:
_L170:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L171
    ldp x29, x30, [sp], #32
    ret
    b _L172
_L171:
_L172:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L173
    ldp x29, x30, [sp], #32
    ret
    b _L174
_L173:
_L174:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L175
    ldp x29, x30, [sp], #32
    ret
    b _L176
_L175:
_L176:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L177
    ldp x29, x30, [sp], #32
    ret
    b _L178
_L177:
_L178:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L179
    ldp x29, x30, [sp], #32
    ret
    b _L180
_L179:
_L180:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L181
    ldp x29, x30, [sp], #32
    ret
    b _L182
_L181:
_L182:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L183
    ldp x29, x30, [sp], #32
    ret
    b _L184
_L183:
_L184:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L185
    ldp x29, x30, [sp], #32
    ret
    b _L186
_L185:
_L186:
    ldr x0, [x29, #16+8]
    mov x22, x0
    cmp x22, x0
    b.ne _L187
    ldp x29, x30, [sp], #32
    ret
    b _L188
_L187:
_L188:
    ldp x29, x30, [sp], #32
    ret
    ldp x29, x30, [sp], #32
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

escape_coz:
    stp x29, x30, [sp, #-64]!
    mov x29, sp
    str x0, [x29, #-8]
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    str x0, [x29, #16+32]
_L189:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+32]
    cmp x22, x0
    b.ge _L190
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L194
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+32]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L193
_L194:
    mov x0, #0
_L193:
    cmp x0, #0
    b.eq _L191
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
    str x0, [x29, #16+48]
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L195
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L196
_L195:
_L196:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L197
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L198
_L197:
_L198:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L199
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L200
_L199:
_L200:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L201
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L202
_L201:
_L202:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L203
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L204
_L203:
_L204:
    ldr x0, [x29, #16+48]
    mov x22, x0
    cmp x22, x0
    b.ne _L205
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L206
_L205:
_L206:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+40]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
    b _L192
_L191:
_L192:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+40]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L189
_L190:
    ldr x0, [x29, #16+16]
    ldp x29, x30, [sp], #64
    ret
    ldp x29, x30, [sp], #64
    ret

tara:
    stp x29, x30, [sp, #-176]!
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
    mov x0, #0
    str x0, [x29, #16+16]
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #8]
    str x0, [x29, #16+24]
_L207:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.ge _L208
    ldr x0, [x29, #16+16]
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
    b.ne _L209
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
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L207
    b _L210
_L209:
_L210:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl bosluk_mu
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L211
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L207
    b _L212
_L211:
_L212:
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L218
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L217
_L218:
    mov x0, #0
_L217:
    cmp x0, #0
    b.eq _L216
    ldr x0, [x29, #16+16]
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
    b _L215
_L216:
    mov x0, #0
_L215:
    cmp x0, #0
    b.eq _L213
_L219:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L222
    ldr x0, [x29, #16+16]
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
    b _L221
_L222:
    mov x0, #0
_L221:
    cmp x0, #0
    b.eq _L220
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L219
_L220:
    b _L207
    b _L214
_L213:
_L214:
    ldr x0, [x29, #16+32]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L228
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L227
_L228:
    mov x0, #0
_L227:
    cmp x0, #0
    b.eq _L226
    ldr x0, [x29, #16+16]
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
    b _L225
_L226:
    mov x0, #0
_L225:
    cmp x0, #0
    b.eq _L223
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
_L229:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.ge _L230
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L231
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
    b _L232
_L231:
_L232:
    ldr x0, [x29, #16+16]
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
    b.eq _L236
    ldr x0, [x29, #16+16]
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
    b _L235
_L236:
    mov x0, #0
_L235:
    cmp x0, #0
    b.eq _L233
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L230
    b _L234
_L233:
_L234:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    b _L229
_L230:
    b _L207
    b _L224
_L223:
_L224:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl akam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L237
    str x0, [x29, #16+40]
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+48]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+56]
    str x0, [x29, #16+64]
_L239:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L242
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl akam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L241
_L242:
    mov x0, #0
_L241:
    cmp x0, #0
    b.eq _L240
    ldr x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L239
_L240:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L250
    ldr x0, [x29, #16+16]
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
    b _L249
_L250:
    mov x0, #0
_L249:
    cmp x0, #0
    b.eq _L248
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L247
_L248:
    mov x0, #0
_L247:
    cmp x0, #0
    b.eq _L246
    ldr x0, [x29, #16+16]
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
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl akam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L245
_L246:
    mov x0, #0
_L245:
    cmp x0, #0
    b.eq _L243
    str x0, [x29, #16+64]
    ldr x0, [x29, #16+40]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
_L251:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L254
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl akam_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    cset x0, ne
    b _L253
_L254:
    mov x0, #0
_L253:
    cmp x0, #0
    b.eq _L252
    ldr x0, [x29, #16+40]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+40]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L251
_L252:
    b _L244
_L243:
_L244:
    ldr x0, [x29, #16+64]
    mov x22, x0
    cmp x22, x0
    b.ne _L255
    mov x19, x0
    ldr x0, [x29, #16+40]
    mov x20, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L256
_L255:
    mov x19, x0
    ldr x0, [x29, #16+40]
    mov x20, x0
    ldr x0, [x29, #16+48]
    mov x21, x0
    ldr x0, [x29, #16+56]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
_L256:
    b _L207
    b _L238
_L237:
_L238:
    ldr x0, [x29, #16+32]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl harf_mi
    ldp x22, x23, [sp], #16
    cmp x0, #0
    b.eq _L257
    str x0, [x29, #16+72]
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+80]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+88]
_L259:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L262
    ldr x0, [x29, #16+16]
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
    b.ne _L264
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl akam_mi
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
    ldr x0, [x29, #16+72]
    mov x22, x0
    ldr x0, [x29, #16+16]
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
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L259
_L260:
    ldr x0, [x29, #16+72]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl keyword_tipi
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+96]
    ldr x0, [x29, #16+96]
    mov x19, x0
    ldr x0, [x29, #16+72]
    mov x20, x0
    ldr x0, [x29, #16+80]
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
    b _L207
    b _L258
_L257:
_L258:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L265
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+104]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+112]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    str x0, [x29, #16+120]
_L267:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L270
    ldr x0, [x29, #16+16]
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
    b _L269
_L270:
    mov x0, #0
_L269:
    cmp x0, #0
    b.eq _L268
    ldr x0, [x29, #16+16]
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
    b.eq _L274
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L273
_L274:
    mov x0, #0
_L273:
    cmp x0, #0
    b.eq _L271
    ldr x0, [x29, #16+120]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+120]
    ldr x0, [x29, #16+120]
    mov x22, x0
    ldr x0, [x29, #16+16]
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
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+120]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L267
    b _L272
_L271:
_L272:
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    cmp x22, x0
    b.ne _L275
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
    b _L276
_L275:
_L276:
    ldr x0, [x29, #16+120]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+120]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L267
_L268:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.ge _L277
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L278
_L277:
    mov x22, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
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
_L278:
    mov x19, x0
    ldr x0, [x29, #16+120]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl escape_coz
    ldp x22, x23, [sp], #16
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
    b _L207
    b _L266
_L265:
_L266:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L279
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+128]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+136]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    str x0, [x29, #16+144]
_L281:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L284
    ldr x0, [x29, #16+16]
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
    b _L283
_L284:
    mov x0, #0
_L283:
    cmp x0, #0
    b.eq _L282
    ldr x0, [x29, #16+16]
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
    b.eq _L288
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L287
_L288:
    mov x0, #0
_L287:
    cmp x0, #0
    b.eq _L285
    ldr x0, [x29, #16+144]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+144]
    ldr x0, [x29, #16+144]
    mov x22, x0
    ldr x0, [x29, #16+16]
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
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+144]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L281
    b _L286
_L285:
_L286:
    ldr x0, [x29, #16+144]
    mov x22, x0
    ldr x0, [x29, #16+16]
    mov x21, x0
    ldr x0, [x29, #16+8]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+144]
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L281
_L282:
    ldr x0, [x29, #16+16]
    mov x22, x0
    ldr x0, [x29, #16+24]
    cmp x22, x0
    b.ge _L289
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L290
_L289:
_L290:
    mov x19, x0
    ldr x0, [x29, #16+144]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl escape_coz
    ldp x22, x23, [sp], #16
    mov x20, x0
    ldr x0, [x29, #16+128]
    mov x21, x0
    ldr x0, [x29, #16+136]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    b _L207
    b _L280
_L279:
_L280:
    adr x1, _var__lex_satir
    ldr x0, [x1]
    str x0, [x29, #16+152]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    str x0, [x29, #16+160]
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L291
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L296
    ldr x0, [x29, #16+16]
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
    b _L295
_L296:
    mov x0, #0
_L295:
    cmp x0, #0
    b.eq _L293
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L294
_L293:
_L294:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L292
_L291:
_L292:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L297
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L302
    ldr x0, [x29, #16+16]
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
    b _L301
_L302:
    mov x0, #0
_L301:
    cmp x0, #0
    b.eq _L299
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L300
_L299:
_L300:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L298
_L297:
_L298:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L303
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L308
    ldr x0, [x29, #16+16]
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
    b _L307
_L308:
    mov x0, #0
_L307:
    cmp x0, #0
    b.eq _L305
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L306
_L305:
_L306:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L304
_L303:
_L304:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L309
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L314
    ldr x0, [x29, #16+16]
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
    b _L313
_L314:
    mov x0, #0
_L313:
    cmp x0, #0
    b.eq _L311
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L312
_L311:
_L312:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L310
_L309:
_L310:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L315
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L320
    ldr x0, [x29, #16+16]
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
    b _L319
_L320:
    mov x0, #0
_L319:
    cmp x0, #0
    b.eq _L317
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L318
_L317:
_L318:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L316
_L315:
_L316:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L321
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L326
    ldr x0, [x29, #16+16]
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
    b _L325
_L326:
    mov x0, #0
_L325:
    cmp x0, #0
    b.eq _L323
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L324
_L323:
_L324:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L330
    ldr x0, [x29, #16+16]
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
    b _L329
_L330:
    mov x0, #0
_L329:
    cmp x0, #0
    b.eq _L327
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L328
_L327:
_L328:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L322
_L321:
_L322:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L331
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L336
    ldr x0, [x29, #16+16]
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
    b _L335
_L336:
    mov x0, #0
_L335:
    cmp x0, #0
    b.eq _L333
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L334
_L333:
_L334:
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L340
    ldr x0, [x29, #16+16]
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
    b _L339
_L340:
    mov x0, #0
_L339:
    cmp x0, #0
    b.eq _L337
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L338
_L337:
_L338:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L332
_L331:
_L332:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L341
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L346
    ldr x0, [x29, #16+16]
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
    b _L345
_L346:
    mov x0, #0
_L345:
    cmp x0, #0
    b.eq _L343
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L344
_L343:
_L344:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L342
_L341:
_L342:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L347
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L352
    ldr x0, [x29, #16+16]
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
    b _L351
_L352:
    mov x0, #0
_L351:
    cmp x0, #0
    b.eq _L349
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L350
_L349:
_L350:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L348
_L347:
_L348:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L353
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L358
    ldr x0, [x29, #16+16]
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
    b _L357
_L358:
    mov x0, #0
_L357:
    cmp x0, #0
    b.eq _L355
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L356
_L355:
_L356:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L354
_L353:
_L354:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L359
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+24]
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L364
    ldr x0, [x29, #16+16]
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
    b _L363
_L364:
    mov x0, #0
_L363:
    cmp x0, #0
    b.eq _L361
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #2
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L362
_L361:
_L362:
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L360
_L359:
_L360:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L365
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L366
_L365:
_L366:
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L370
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L369
_L370:
    mov x0, #0
_L369:
    cmp x0, #0
    b.eq _L367
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L368
_L367:
_L368:
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #8]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    b.eq _L374
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    cmp x0, #0
    cset x0, ne
    b _L373
_L374:
    mov x0, #0
_L373:
    cmp x0, #0
    b.eq _L371
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L372
_L371:
_L372:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L375
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L376
_L375:
_L376:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L377
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L378
_L377:
_L378:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L379
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L380
_L379:
_L380:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L381
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L382
_L381:
_L382:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L383
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L384
_L383:
_L384:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L385
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L386
_L385:
_L386:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L387
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L388
_L387:
_L388:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L389
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L390
_L389:
_L390:
    ldr x0, [x29, #16+32]
    mov x22, x0
    cmp x22, x0
    b.ne _L391
    mov x19, x0
    mov x20, x0
    ldr x0, [x29, #16+152]
    mov x21, x0
    ldr x0, [x29, #16+160]
    mov x22, x0
    mov x0, x19
    mov x1, x20
    mov x2, x21
    mov x3, x22
    stp x22, x23, [sp, #-16]!
    bl tok_ekle_lex
    ldp x22, x23, [sp], #16
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
    b _L392
_L391:
_L392:
    mov x22, x0
    adr x1, _var__lex_satir
    ldr x0, [x1]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    ldr x0, [x29, #16+32]
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
    ldr x0, [x29, #16+16]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+16]
    adr x1, _var__lex_kolon
    ldr x0, [x1]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    adr x1, _var__lex_kolon
    str x0, [x1]
    b _L207
_L208:
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
    ldp x29, x30, [sp], #176
    ret
    ldp x29, x30, [sp], #176
    ret

lexer_test:
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    str x0, [x29, #16+8]
    ldr x0, [x29, #16+8]
    mov x19, x0
    mov x0, x19
    stp x22, x23, [sp, #-16]!
    bl tara
    ldp x22, x23, [sp], #16
    str x0, [x29, #16+16]
    mov x0, #0
    str x0, [x29, #16+24]
_L393:
    ldr x0, [x29, #16+24]
    mov x22, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #8]
    cmp x22, x0
    b.ge _L394
    ldr x0, [x29, #16+24]
    mov x21, x0
    ldr x0, [x29, #16+16]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    str x0, [x29, #16+32]
    mov x0, #0
    mov x21, x0
    ldr x0, [x29, #16+32]
    ldr x0, [x0, #16]
    lsl x21, x21, #3
    add x0, x0, x21
    ldr x0, [x0]
    mov x22, x0
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    mov x22, x0
    mov x0, #1
    mov x21, x0
    ldr x0, [x29, #16+32]
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
    ldr x0, [x29, #16+32]
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
    mov x0, #3
    mov x21, x0
    ldr x0, [x29, #16+32]
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
    ldr x0, [x29, #16+24]
    mov x22, x0
    mov x0, #1
    mov x23, x0
    mov x0, x22
    add x0, x0, x23
    str x0, [x29, #16+24]
    b _L393
_L394:
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
_var__lexer_tokenlar: .quad 0
_var__lex_satir: .quad 0
_var__lex_kolon: .quad 0
_fmt_sayi: .byte 37, 100, 10, 0
_fmt_str_sayi: .byte 37, 115, 37, 100, 10, 0
_fmt_str_str: .byte 37, 115, 37, 115, 10, 0
_buf: .space 256
_metine_buf: .space 32
_char_buf: .space 16
