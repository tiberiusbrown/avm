; Stackless output helpers for compact stack-relative tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; csr_print_r0_line:
;   Prints r0 as four most-significant-first nibble characters.
;   Preserves r0-r3 and r5. Clobbers r4/c0, r6/c2, and r7/c3.
;   Uses no PUSH/POP, CALL/RET, or stack-relative memory instruction.

.macro csr_emit_char character
    ldi8 c0, \character
    sys debug_putc
.endm

.macro csr_emit_c2_nibble
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

.macro csr_print_r0_line
    mov r6, r0
    lsr16i c2, 12
    csr_emit_c2_nibble

    mov r6, r0
    lsr16i c2, 8
    csr_emit_c2_nibble

    mov r6, r0
    lsr16i c2, 4
    csr_emit_c2_nibble

    mov r6, r0
    csr_emit_c2_nibble

    csr_emit_char '\n'
.endm

; Print snapshots in r0-r3, one line each. All four values are captured before
; this macro is entered, so output scratch cannot hide compact-register damage.
.macro csr_print_r0_r3
    csr_print_r0_line
    mov r0, r1
    csr_print_r0_line
    mov r0, r2
    csr_print_r0_line
    mov r0, r3
    csr_print_r0_line
.endm
