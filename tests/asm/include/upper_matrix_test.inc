; Common initialization for exhaustive upper-register matrix tests.
;
; c0 = 0x0123 -> ABCD
; c1 = 0x4567 -> EFGH
; c2 = 0x89AB -> IJKL
; c3 = 0xCDEF -> MNOP

.macro reset_upper_regs
    ldi16 c0, 0x0123
    ldi16 c1, 0x4567
    ldi16 c2, 0x89ab
    ldi16 c3, 0xcdef
.endm
