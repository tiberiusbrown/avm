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
;   Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.

.macro debug_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro debug_emit_newline
    debug_emit_char '\n'
.endm

.macro debug_emit_c2_nibble_inline
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

.macro debug_print_r0_inline
    mov r6, r0
    lsr16i r6, 12
    debug_emit_c2_nibble_inline

    mov r6, r0
    lsr16i r6, 8
    debug_emit_c2_nibble_inline

    mov r6, r0
    lsr16i r6, 4
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
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    cset.ne r0
    mov r4, r0
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    cset.ult r0
    mov r4, r0
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    cset.uge r0
    mov r4, r0
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    cset.slt r0
    mov r4, r0
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    cset.sge r0
    mov r4, r0
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    debug_emit_newline
.endm
