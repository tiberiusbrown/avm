; Output helpers for CSET and CMOV tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; The output path does not use CSET or CMOV. It relies on already-tested
; one-bit shifts, upper arithmetic/bitwise operations, CALL/RET, and SYS.
;
; cond_print_r0_line:
;   Prints r0 as four most-significant-first hexadecimal nibbles.
;   Preserves r0-r3 and r5. Clobbers r4/c0, r6/c2, and r7/c3.

.section .text,"ax",@progbits

.macro cond_emit_char character
    ldi8 c0, \character
    sys debug_putc
.endm

.macro cond_emit_c2_nibble
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

cond_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    cond_emit_c2_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    cond_emit_c2_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    cond_emit_c2_nibble

    mov r6, r0
    cond_emit_c2_nibble

    cond_emit_char '\n'
    ret
