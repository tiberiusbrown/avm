; Primitive output helpers for immediate and control-flow tests.
;
; These macros use no stack operations and no CALL/RET instructions.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; debug_print_r0_inline:
;   Prints r0 as four most-significant-first nibble characters.
;   Preserves r0-r3 and r5. Clobbers r4/c0, r6/c2, and r7/c3.

.macro debug_emit_char character
    ldi8 c0, \character
    sys debug_putc
.endm

.macro debug_emit_newline
    debug_emit_char '\n'
.endm

.macro debug_emit_c2_nibble_inline
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

.macro debug_print_r0_inline
    mov r6, r0
    lsr16i c2, 12
    debug_emit_c2_nibble_inline

    mov r6, r0
    lsr16i c2, 8
    debug_emit_c2_nibble_inline

    mov r6, r0
    lsr16i c2, 4
    debug_emit_c2_nibble_inline

    mov r6, r0
    debug_emit_c2_nibble_inline
.endm

.macro debug_print_r0_line_inline
    debug_print_r0_inline
    debug_emit_newline
.endm

; Emit the six CSET results as A=false/B=true, preserving CC.
.macro debug_print_conditions_inline
    cset.eq r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    cset.ne r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    cset.ult r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    cset.uge r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    cset.slt r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    cset.sge r0
    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    debug_emit_newline
.endm
