; Shared helpers for unary floating-point assembly tests.
;
; Exact-result line:
;   <EQ NE ULT UGE SLT SGE>=<r0>...<r7>
;
; NaN-result line:
;   <EQ NE ULT UGE SLT SGE>N<r0>...<r7>
;
; Conditions use A=false/B=true. Register words use A-P hexadecimal nibbles.
; For an unspecified arithmetic NaN, the destination pair is printed as eight
; dashes. The helper independently checks the raw exponent/fraction pattern;
; it does not rely on FCLASS.

.include "include/debug_output.inc"

.section .text,"ax",@progbits

.macro fpu_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

; Print EQ, NE, ULT, UGE, SLT, SGE while preserving CC on every path.
.macro fpu_print_cc
    breq8 .Lfpu_eq_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_eq_done_\@
.Lfpu_eq_true_\@:
    fpu_emit_char 'B'
.Lfpu_eq_done_\@:

    brne8 .Lfpu_ne_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_ne_done_\@
.Lfpu_ne_true_\@:
    fpu_emit_char 'B'
.Lfpu_ne_done_\@:

    brult8 .Lfpu_ult_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_ult_done_\@
.Lfpu_ult_true_\@:
    fpu_emit_char 'B'
.Lfpu_ult_done_\@:

    bruge8 .Lfpu_uge_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_uge_done_\@
.Lfpu_uge_true_\@:
    fpu_emit_char 'B'
.Lfpu_uge_done_\@:

    brslt8 .Lfpu_slt_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_slt_done_\@
.Lfpu_slt_true_\@:
    fpu_emit_char 'B'
.Lfpu_slt_done_\@:

    brsge8 .Lfpu_sge_true_\@
    fpu_emit_char 'A'
    jmp8 .Lfpu_sge_done_\@
.Lfpu_sge_true_\@:
    fpu_emit_char 'B'
.Lfpu_sge_done_\@:
.endm

.macro fpu_push_all_regs
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
.endm

.type fpu_print_exact_state, @function
fpu_print_exact_state:
    fpu_push_all_regs
    fpu_print_cc
    fpu_emit_char '='
    .rept 8
        pop16 r0
        call debug_print_r0
    .endr
    fpu_emit_char '\n'
    ret

.macro fpu_emit_placeholder_word
    fpu_emit_char '-'
    fpu_emit_char '-'
    fpu_emit_char '-'
    fpu_emit_char '-'
.endm

.macro fpu_pop_print_nan_word qd_index, word_index
    pop16 r0
    .if ((\word_index) == (2 * (\qd_index))) || ((\word_index) == (2 * (\qd_index) + 1))
        fpu_emit_placeholder_word
    .else
        call debug_print_r0
    .endif
.endm

; Save all architectural registers, copy qD to q0, print CC, then classify q0.
; The condition signature is emitted before classification modifies CC.
.macro fpu_print_nan_state qd, qd_index
    fpu_push_all_regs
    mov32 q0, \qd
    fpu_print_cc

    ; NaN iff exponent == 0xff and fraction != zero.
    mov r6, r1
    ldi16 r7, 0x7f80
    and r6, r7
    cmp r6, r7
    brne8 .Lfpu_not_nan_\@

    mov r6, r1
    ldi16 r7, 0x007f
    and r6, r7
    or r6, r0
    ldi16 r7, 0
    cmp r6, r7
    breq8 .Lfpu_not_nan_\@

    fpu_emit_char 'N'
    jmp8 .Lfpu_nan_marker_done_\@
.Lfpu_not_nan_\@:
    fpu_emit_char 'X'
.Lfpu_nan_marker_done_\@:

    fpu_pop_print_nan_word \qd_index, 0
    fpu_pop_print_nan_word \qd_index, 1
    fpu_pop_print_nan_word \qd_index, 2
    fpu_pop_print_nan_word \qd_index, 3
    fpu_pop_print_nan_word \qd_index, 4
    fpu_pop_print_nan_word \qd_index, 5
    fpu_pop_print_nan_word \qd_index, 6
    fpu_pop_print_nan_word \qd_index, 7
    fpu_emit_char '\n'
.endm

.macro fpu_load_regs v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7
.endm

.macro fpu_exact_case mnemonic, qd, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7
    fpu_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpu_begin_\@:
    \mnemonic \qd
.Lfpu_end_\@:
    .if (.Lfpu_end_\@ - .Lfpu_begin_\@) != 2
        .error "unary floating-point instruction must occupy exactly two bytes"
    .endif
    call fpu_print_exact_state
.endm

.macro fpu_nan_case mnemonic, qd, qd_index, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7
    fpu_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpu_nan_begin_\@:
    \mnemonic \qd
.Lfpu_nan_end_\@:
    .if (.Lfpu_nan_end_\@ - .Lfpu_nan_begin_\@) != 2
        .error "unary floating-point instruction must occupy exactly two bytes"
    .endif
    fpu_print_nan_state \qd, \qd_index
.endm
