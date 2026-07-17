; Output helpers for FA shift-page tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; The output path deliberately uses only the already-tested one-bit LSR16.1
; instruction. It does not use any FA immediate or register-count shift.
;
; fa_print_r0_line:
;   Prints r0 as four most-significant-first hexadecimal nibbles.
;   Preserves r0-r3 and r5. Clobbers r4/c0, r6/c2, and r7/c3.

.section .text,"ax",@progbits

.macro fa_emit_char character
    ldi8 c0, \character
    sys debug_putc
.endm

.macro fa_emit_c2_nibble
    ldi8 c3, 0x0f
    and c2, c3
    ldi8 c3, 'A'
    add c2, c3
    mov c0, c2
    sys debug_putc
.endm

fa_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    fa_emit_c2_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    fa_emit_c2_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    fa_emit_c2_nibble

    mov r6, r0
    fa_emit_c2_nibble

    fa_emit_char '\n'
    ret

; Print snapshots already held in r0-r3.
.macro fa_print_r0_r3
    call fa_print_r0_line
    mov r0, r1
    call fa_print_r0_line
    mov r0, r2
    call fa_print_r0_line
    mov r0, r3
    call fa_print_r0_line
.endm
