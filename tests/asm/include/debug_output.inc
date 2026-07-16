; Shared AVM assembly-test output helpers.
;
; Nibble encoding:
;     0 -> 'A'
;     1 -> 'B'
;     ...
;    15 -> 'P'
;
; debug_print_r0:
;   Prints r0 as four most-significant-first nibble characters.
;   Example: r0 = 0x0123 prints "ABCD".
;   Preserves every general-purpose register and CC.
;
; debug_print_compact_regs:
;   Prints c0, c1, c2, and c3 in that order, then a newline.
;   Preserves every general-purpose register and CC.

.section .text,"ax",@progbits

.type debug_print_r0, @function
debug_print_r0:
    ; c0 is the DEBUG_PUTC argument. c2 holds the working value and c3
    ; alternately holds the nibble mask and character base.
    push16 r4
    push16 r5
    push16 r6
    push16 r7

    ; Bits 15:12.
    mov r6, r0
    lsr16i c2, 12
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc

    ; Bits 11:8.
    mov r6, r0
    lsr16i c2, 8
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc

    ; Bits 7:4.
    mov r6, r0
    lsr16i c2, 4
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc

    ; Bits 3:0.
    mov r6, r0
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc

    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    ret

.type debug_print_compact_regs, @function
debug_print_compact_regs:
    push16 r0

    mov r0, r4
    call debug_print_r0
    mov r0, r5
    call debug_print_r0
    mov r0, r6
    call debug_print_r0
    mov r0, r7
    call debug_print_r0

    ; DEBUG_PUTC consumes low8(c0), so preserve c0 around the newline.
    push16 r4
    ldi8 c0, '\n'
    sys debug_putc
    pop16 r4

    pop16 r0
    ret

; debug_print_newline:
;   Emits a newline and preserves every general-purpose register and CC.
.type debug_print_newline, @function
debug_print_newline:
    push16 r4
    ldi8 c0, '\n'
    sys debug_putc
    pop16 r4
    ret

; debug_print_r0_line:
;   Prints r0 as four nibble characters followed by a newline.
;   Preserves every general-purpose register and CC.
.type debug_print_r0_line, @function
debug_print_r0_line:
    call debug_print_r0
    call debug_print_newline
    ret

; debug_print_bool_r0:
;   Prints "A" when r0 is zero and "B" when r0 is one.
;   Intended for CSET results. Preserves every general-purpose register and CC.
.type debug_print_bool_r0, @function
debug_print_bool_r0:
    push16 r0
    push16 r4
    push16 r5

    mov r4, r0
    ldi8 c1, 'A'
    add c0, c1
    sys debug_putc

    pop16 r5
    pop16 r4
    pop16 r0
    ret
