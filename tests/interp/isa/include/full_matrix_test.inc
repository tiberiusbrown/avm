; Output helpers for full-register secondary-matrix tests.
;
; These helpers deliberately avoid full-register MOV/ADD/SUB/CMP operations.
; They use only upper primary operations, immediate shifts, stack operations,
; and SYS debug output.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; fm_print_c0_line:
;   Prints r4/r4 as four most-significant-first nibble characters.
;   Clobbers r4-r7. Architectural condition state is preserved.
;
; fm_print_stack_word:
;   Pops one word into r4 and prints it. This lets a test snapshot all values
;   before output scratch registers are modified.

.macro fm_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro fm_emit_c2_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

.macro fm_print_c0_line
    mov r5, r4

    mov r6, r5
    lsr16i r6, 12
    fm_emit_c2_nibble

    mov r6, r5
    lsr16i r6, 8
    fm_emit_c2_nibble

    mov r6, r5
    lsr16i r6, 4
    fm_emit_c2_nibble

    mov r6, r5
    fm_emit_c2_nibble

    fm_emit_char '\n'
.endm

.macro fm_print_stack_word
    pop16 r4
    fm_print_c0_line
.endm
