; Shared support for F0 40-5F absolute data-space tests.
;
; A 16-bit word is printed as four characters:
;     nibble 0 -> 'A'
;     ...
;     nibble F -> 'P'
;
; abs_print_r0_line preserves r0-r3 and r5. It clobbers r4, r6, and r7.
; The helper uses only previously tested instructions.

.section .text,"ax",@progbits

.macro abs_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro abs_emit_r6_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

abs_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    abs_emit_r6_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    abs_emit_r6_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    abs_emit_r6_nibble

    mov r6, r0
    abs_emit_r6_nibble

    abs_emit_char '\n'
    ret
