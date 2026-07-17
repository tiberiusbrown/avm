; Output helpers for multiplication tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; These helpers do not use multiplication instructions. They rely on already
; tested upper immediates, upper arithmetic/bitwise operations, shifts,
; PUSH16/POP16, full-register MOV, branches, and SYS debug output.

.macro mul_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro mul_emit_c2_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

; Print r0 as four most-significant-first hexadecimal nibbles encoded A-P.
; Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.
.macro mul_print_r0_line
    mov r6, r0
    lsr16i r6, 12
    mul_emit_c2_nibble

    mov r6, r0
    lsr16i r6, 8
    mul_emit_c2_nibble

    mov r6, r0
    lsr16i r6, 4
    mul_emit_c2_nibble

    mov r6, r0
    mul_emit_c2_nibble

    mul_emit_char '\n'
.endm

; Print snapshots already held in r0-r3.
.macro mul_print_r0_r3
    mul_print_r0_line
    mov r0, r1
    mul_print_r0_line
    mov r0, r2
    mul_print_r0_line
    mov r0, r3
    mul_print_r0_line
.endm

; Print snapshots already held in r0-r2.
.macro mul_print_r0_r2
    mul_print_r0_line
    mov r0, r1
    mul_print_r0_line
    mov r0, r2
    mul_print_r0_line
.endm
