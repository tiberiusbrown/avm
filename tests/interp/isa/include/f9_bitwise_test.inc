; Output helpers for F9 full-register bitwise tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; These helpers do not use any full-register AND/OR/XOR instruction. They rely
; on already-tested upper operations, one-bit shifts, CALL/RET, and SYS.
;
; bit_print_r0_line:
;   Prints r0 as four most-significant-first hexadecimal nibbles.
;   Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.

.section .text,"ax",@progbits

.macro bit_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro bit_emit_c2_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

bit_print_r0_line:
    mov r6, r0
    .rept 12
        lsr16.1 r6
    .endr
    bit_emit_c2_nibble

    mov r6, r0
    .rept 8
        lsr16.1 r6
    .endr
    bit_emit_c2_nibble

    mov r6, r0
    .rept 4
        lsr16.1 r6
    .endr
    bit_emit_c2_nibble

    mov r6, r0
    bit_emit_c2_nibble

    bit_emit_char '\n'
    ret

; Print snapshots already held in r0-r2.
.macro bit_print_r0_r2
    call bit_print_r0_line
    mov r0, r1
    call bit_print_r0_line
    mov r0, r2
    call bit_print_r0_line
.endm
