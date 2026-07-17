; Shared output support for cold-immediate and F0 stack-relative tests.
;
; Each 16-bit word is printed as four characters:
;     nibble 0 -> 'A'
;     ...
;     nibble F -> 'P'
;
; The helper uses only already-tested instructions and canonical rN spellings.
; cold_print_r0_line preserves r0-r3 and r5; it clobbers r4, r6, and r7.

.section .text,"ax",@progbits

.macro cold_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro cold_emit_r6_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

cold_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    cold_emit_r6_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    cold_emit_r6_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    cold_emit_r6_nibble

    mov r6, r0
    cold_emit_r6_nibble

    cold_emit_char '\n'
    ret
