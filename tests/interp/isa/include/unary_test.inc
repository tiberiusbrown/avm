; Output and setup helpers for unary-operation tests.
;
; Nibble encoding:
;     0 -> 'A'
;     ...
;    15 -> 'P'
;
; Register setup in the generated tests stages values through a upper
; register chosen not to alias either the target or guard register.
;
; These helpers do not use any unary instruction under test. They rely on
; already-tested upper immediates, primary upper operations, PUSH16/POP16,
; full-register MOV, branches, and SYS debug output.

.macro unary_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro unary_emit_c2_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

; Print r0 as four most-significant-first hexadecimal nibbles encoded A-P.
; Preserves r0-r3 and r5. Clobbers r4/r4, r6/r6, and r7/r7.
.macro unary_print_r0_line
    mov r6, r0
    lsr16i r6, 12
    unary_emit_c2_nibble

    mov r6, r0
    lsr16i r6, 8
    unary_emit_c2_nibble

    mov r6, r0
    lsr16i r6, 4
    unary_emit_c2_nibble

    mov r6, r0
    unary_emit_c2_nibble

    unary_emit_char '\n'
.endm

; Snapshot target and guard before output scratch is modified.
; On entry, the target and guard values have already been pushed in that order:
;     push16 guard
;     push16 target
.macro unary_print_target_guard
    pop16 r0
    pop16 r1
    unary_print_r0_line
    mov r0, r1
    unary_print_r0_line
.endm
