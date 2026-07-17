; Output helpers for F7 32-bit arithmetic and utility tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; The output path uses only already-tested 16-bit operations. It does not use
; ADD32, SUB32, LSR32.1, ASR32.1, or BOOL.
;
; f7_print_r0_line:
;   Prints r0 as four most-significant-first hexadecimal nibbles.
;   Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.

.section .text,"ax",@progbits

.macro f7_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro f7_emit_c2_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

f7_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    f7_emit_c2_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    f7_emit_c2_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    f7_emit_c2_nibble

    mov r6, r0
    f7_emit_c2_nibble

    f7_emit_char '\n'
    ret
