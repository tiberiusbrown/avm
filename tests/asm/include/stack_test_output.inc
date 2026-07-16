; Stackless output macros for AVM stack-instruction tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; debug_print_r0_inline:
;   Prints r0 as four most-significant-first nibble characters.
;   Preserves r0-r3 and r5. Clobbers r4/c0, r6/c2, and r7/c3.
;
; debug_print_r0_line_inline:
;   Prints r0 followed by a newline with the same clobbers.
;
; These are macros rather than callable functions. They use no stack
; instructions and perform no CALL/RET operations.

.macro debug_emit_c2_nibble_inline
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

.macro debug_print_r0_inline
    ; Bits 15:12.
    mov r6, r0
    lsr16i c2, 12
    debug_emit_c2_nibble_inline

    ; Bits 11:8.
    mov r6, r0
    lsr16i c2, 8
    debug_emit_c2_nibble_inline

    ; Bits 7:4.
    mov r6, r0
    lsr16i c2, 4
    debug_emit_c2_nibble_inline

    ; Bits 3:0.
    mov r6, r0
    debug_emit_c2_nibble_inline
.endm

.macro debug_print_r0_line_inline
    debug_print_r0_inline
    ldi8 c0, '\n'
    sys debug_putc
.endm
