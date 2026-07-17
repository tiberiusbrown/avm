; Stackless output macros for AVM stack-instruction tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; debug_print_r0_inline:
;   Prints r0 as four most-significant-first nibble characters.
;   Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.
;
; debug_print_r0_line_inline:
;   Prints r0 followed by a newline with the same clobbers.
;
; These are macros rather than callable functions. They use no stack
; instructions and perform no CALL/RET operations.

.macro debug_emit_c2_nibble_inline
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

.macro debug_print_r0_inline
    ; Bits 15:12.
    mov r6, r0
    lsr16i r6, 12
    debug_emit_c2_nibble_inline

    ; Bits 11:8.
    mov r6, r0
    lsr16i r6, 8
    debug_emit_c2_nibble_inline

    ; Bits 7:4.
    mov r6, r0
    lsr16i r6, 4
    debug_emit_c2_nibble_inline

    ; Bits 3:0.
    mov r6, r0
    debug_emit_c2_nibble_inline
.endm

.macro debug_print_r0_line_inline
    debug_print_r0_inline
    ldi8 r4, '\n'
    sys debug_putc
.endm
