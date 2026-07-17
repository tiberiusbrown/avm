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
; debug_print_upper_regs:
;   Prints r4, r5, r6, and r7 in that order, then a newline.
;   Preserves every general-purpose register and CC.

.section .text,"ax",@progbits

.type debug_print_r0, @function
debug_print_r0:
    ; r4 is the DEBUG_PUTC argument. r6 holds the working value and r7
    ; alternately holds the nibble mask and character base.
    push16 r4
    push16 r5
    push16 r6
    push16 r7

    ; Bits 15:12.
    mov r6, r0
    lsr16i r6, 12
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc

    ; Bits 11:8.
    mov r6, r0
    lsr16i r6, 8
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc

    ; Bits 7:4.
    mov r6, r0
    lsr16i r6, 4
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc

    ; Bits 3:0.
    mov r6, r0
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc

    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    ret

.type debug_print_upper_regs, @function
debug_print_upper_regs:
    push16 r0

    mov r0, r4
    call debug_print_r0
    mov r0, r5
    call debug_print_r0
    mov r0, r6
    call debug_print_r0
    mov r0, r7
    call debug_print_r0

    ; DEBUG_PUTC consumes low8(r4), so preserve r4 around the newline.
    push16 r4
    ldi8 r4, '\n'
    sys debug_putc
    pop16 r4

    pop16 r0
    ret

; debug_print_newline:
;   Emits a newline and preserves every general-purpose register and CC.
.type debug_print_newline, @function
debug_print_newline:
    push16 r4
    ldi8 r4, '\n'
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
    ldi8 r5, 'A'
    add r4, r5
    sys debug_putc

    pop16 r5
    pop16 r4
    pop16 r0
    ret
