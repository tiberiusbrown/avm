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
;   Prints c0/r4 as four most-significant-first nibble characters.
;   Clobbers c0-c3. Architectural condition state is preserved.
;
; fm_print_stack_word:
;   Pops one word into c0 and prints it. This lets a test snapshot all values
;   before output scratch registers are modified.

.macro fm_emit_char character
    ldi8 c0, \character
    sys debug_putc
.endm

.macro fm_emit_c2_nibble
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

.macro fm_print_c0_line
    mov c1, c0

    mov c2, c1
    lsr16i c2, 12
    fm_emit_c2_nibble

    mov c2, c1
    lsr16i c2, 8
    fm_emit_c2_nibble

    mov c2, c1
    lsr16i c2, 4
    fm_emit_c2_nibble

    mov c2, c1
    fm_emit_c2_nibble

    fm_emit_char '\n'
.endm

.macro fm_print_stack_word
    pop16 r4
    fm_print_c0_line
.endm
