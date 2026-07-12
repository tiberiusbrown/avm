; Emit a 16-bit value as four A-P digits, most-significant nibble first, then
; a newline.  A represents zero and P represents fifteen.  The macro copies
; the input first and intentionally treats all compact registers as scratch.
.macro print_reg16 reg
    ; c2 is the scratch copy.  Its compact self-move encoding is CLR, so use
    ; c0 as a one-instruction relay when printing c2 itself.
    .ifc \reg,c2
        mov c0, c2
        mov c2, c0
    .else
    mov c2, \reg
    .endif
    ldi8 c1, 0x0f
    ldi8 c3, 'A'

    mov c0, c2
    .rept 12
        lsr16 c0
    .endr
    and c0, c1
    add c0, c3
    sys 0

    mov c0, c2
    .rept 8
        lsr16 c0
    .endr
    and c0, c1
    add c0, c3
    sys 0

    mov c0, c2
    swap8 c0
    and c0, c1
    add c0, c3
    sys 0

    mov c0, c2
    and c0, c1
    add c0, c3
    sys 0

    ldi8 c0, '\n'
    sys 0
.endm

.macro test_add dst, src, dv, sv
    ldi8 \dst, \dv
    ldi8 \src, \sv
    add \dst, \src
    print_reg16 \dst
.endm

.macro test_sub dst, src, dv, sv
    ldi8 \dst, \dv
    ldi8 \src, \sv
    sub \dst, \src
    print_reg16 \dst
.endm

.macro test_and dst, src, dv, sv
    ldi8 \dst, \dv
    ldi8 \src, \sv
    and \dst, \src
    print_reg16 \dst
.endm

.macro test_swap reg, value
    ldi8 \reg, \value
    swap8 \reg
    print_reg16 \reg
.endm
