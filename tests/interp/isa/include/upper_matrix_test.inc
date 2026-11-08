; Common initialization for exhaustive upper-register matrix tests.
;
; r4 = 0x0123 -> ABCD
; r5 = 0x4567 -> EFGH
; r6 = 0x89AB -> IJKL
; r7 = 0xCDEF -> MNOP

.macro reset_upper_regs
    ldi16 r4, 0x0123
    ldi16 r5, 0x4567
    ldi16 r6, 0x89ab
    ldi16 r7, 0xcdef
.endm
