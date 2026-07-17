; Shared output support for EC 16-bit division/remainder tests.
;
; Each case prints:
;   SP after eight register snapshots were pushed
;   r0-r7 after the instruction
;   CC signature: EQ, NE, ULT, UGE, SLT, SGE
;
; A 16-bit value is printed as four hexadecimal nibbles encoded A-P.
; These helpers do not use division/remainder instructions and preserve CC.

.section .text,"ax",@progbits

.macro divrem_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro divrem_emit_r6_nibble
    ldi8 r7, 0x0f
    and r6, r7
    ldi8 r7, 'A'
    add r6, r7
    mov r4, r6
    sys debug_putc
.endm

divrem_print_r0_line:
    mov r6, r0
    lsr16i r6, 12
    divrem_emit_r6_nibble
    mov r6, r0
    lsr16i r6, 8
    divrem_emit_r6_nibble
    mov r6, r0
    lsr16i r6, 4
    divrem_emit_r6_nibble
    mov r6, r0
    divrem_emit_r6_nibble
    divrem_emit_char '\n'
    ret

divrem_print_flags:
    breq8 .Ldivrem_EQ_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_EQ_done
.Ldivrem_EQ_true:
    divrem_emit_char 'B'
.Ldivrem_EQ_done:
    brne8 .Ldivrem_NE_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_NE_done
.Ldivrem_NE_true:
    divrem_emit_char 'B'
.Ldivrem_NE_done:
    brult8 .Ldivrem_ULT_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_ULT_done
.Ldivrem_ULT_true:
    divrem_emit_char 'B'
.Ldivrem_ULT_done:
    bruge8 .Ldivrem_UGE_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_UGE_done
.Ldivrem_UGE_true:
    divrem_emit_char 'B'
.Ldivrem_UGE_done:
    brslt8 .Ldivrem_SLT_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_SLT_done
.Ldivrem_SLT_true:
    divrem_emit_char 'B'
.Ldivrem_SLT_done:
    brsge8 .Ldivrem_SGE_true
    divrem_emit_char 'A'
    jmp8 .Ldivrem_SGE_done
.Ldivrem_SGE_true:
    divrem_emit_char 'B'
.Ldivrem_SGE_done:
    divrem_emit_char '\n'
    ret
