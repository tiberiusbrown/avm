; Shared support for F0 6C/6D general-pointer memory tests.
;
; A 16-bit word is printed as four characters:
;     nibble 0 -> 'A'
;     ...
;     nibble F -> 'P'
;
; gp_print_r0_line preserves r0-r3 and r5. It clobbers r4, r6, and r7.
; The helper uses only previously tested instructions.

.section .text,"ax",@progbits

.macro gp_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro gp_emit_r6_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

gp_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    gp_emit_r6_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    gp_emit_r6_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    gp_emit_r6_nibble

    mov r6, r0
    gp_emit_r6_nibble

    gp_emit_char '\n'
    ret
