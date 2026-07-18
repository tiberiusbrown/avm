; Shared helpers for floating-point conversion tests.
;
; Exact-result line:
;   <EQ NE ULT UGE SLT SGE>=<r0>...<r7>
;
; Unspecified-result line:
;   <EQ NE ULT UGE SLT SGE>?<r0>...<r7>
;
; Conditions use A=false/B=true. Register words use A-P hexadecimal nibbles.
; For NaN or out-of-range float-to-integer inputs, only destination words are
; printed as "----". The instruction must still complete, preserve CC, and
; preserve every non-destination register.

.include "include/debug_output.inc"

.section .text,"ax",@progbits

.macro fpc_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

; Print EQ, NE, ULT, UGE, SLT, and SGE while preserving CC on every path.
.macro fpc_print_cc
    breq8 .Lfpc_eq_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_eq_done_\@
.Lfpc_eq_true_\@:
    fpc_emit_char 'B'
.Lfpc_eq_done_\@:

    brne8 .Lfpc_ne_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_ne_done_\@
.Lfpc_ne_true_\@:
    fpc_emit_char 'B'
.Lfpc_ne_done_\@:

    brult8 .Lfpc_ult_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_ult_done_\@
.Lfpc_ult_true_\@:
    fpc_emit_char 'B'
.Lfpc_ult_done_\@:

    bruge8 .Lfpc_uge_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_uge_done_\@
.Lfpc_uge_true_\@:
    fpc_emit_char 'B'
.Lfpc_uge_done_\@:

    brslt8 .Lfpc_slt_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_slt_done_\@
.Lfpc_slt_true_\@:
    fpc_emit_char 'B'
.Lfpc_slt_done_\@:

    brsge8 .Lfpc_sge_true_\@
    fpc_emit_char 'A'
    jmp8 .Lfpc_sge_done_\@
.Lfpc_sge_true_\@:
    fpc_emit_char 'B'
.Lfpc_sge_done_\@:
.endm

.macro fpc_push_all_regs
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
.endm

.type fpc_print_exact_state, @function
fpc_print_exact_state:
    fpc_push_all_regs
    fpc_print_cc
    fpc_emit_char '='
    .rept 8
        pop16 r0
        call debug_print_r0
    .endr
    fpc_emit_char '\n'
    ret

.macro fpc_emit_placeholder_word
    fpc_emit_char '-'
    fpc_emit_char '-'
    fpc_emit_char '-'
    fpc_emit_char '-'
.endm

.macro fpc_pop_unknown_r_word rd_index, word_index
    pop16 r0
    .if (\word_index) == (\rd_index)
        fpc_emit_placeholder_word
    .else
        call debug_print_r0
    .endif
.endm

.macro fpc_pop_unknown_q_word qd_index, word_index
    pop16 r0
    .if ((\word_index) == (2 * (\qd_index))) || ((\word_index) == (2 * (\qd_index) + 1))
        fpc_emit_placeholder_word
    .else
        call debug_print_r0
    .endif
.endm

.macro fpc_print_unknown_r_state rd_index
    fpc_push_all_regs
    fpc_print_cc
    fpc_emit_char '?'
    fpc_pop_unknown_r_word \rd_index, 0
    fpc_pop_unknown_r_word \rd_index, 1
    fpc_pop_unknown_r_word \rd_index, 2
    fpc_pop_unknown_r_word \rd_index, 3
    fpc_pop_unknown_r_word \rd_index, 4
    fpc_pop_unknown_r_word \rd_index, 5
    fpc_pop_unknown_r_word \rd_index, 6
    fpc_pop_unknown_r_word \rd_index, 7
    fpc_emit_char '\n'
.endm

.macro fpc_print_unknown_q_state qd_index
    fpc_push_all_regs
    fpc_print_cc
    fpc_emit_char '?'
    fpc_pop_unknown_q_word \qd_index, 0
    fpc_pop_unknown_q_word \qd_index, 1
    fpc_pop_unknown_q_word \qd_index, 2
    fpc_pop_unknown_q_word \qd_index, 3
    fpc_pop_unknown_q_word \qd_index, 4
    fpc_pop_unknown_q_word \qd_index, 5
    fpc_pop_unknown_q_word \qd_index, 6
    fpc_pop_unknown_q_word \qd_index, 7
    fpc_emit_char '\n'
.endm

.macro fpc_load_regs v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7
.endm

.macro fpc_set_cc cc_lhs, cc_rhs
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7
.endm

; qD,rS conversions: S16TOF and U16TOF.
.macro fpc_qr_exact_case mnemonic, qd, rs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpc_set_cc \cc_lhs, \cc_rhs
    fpc_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpc_qr_begin_\@:
    \mnemonic \qd, \rs
.Lfpc_qr_end_\@:
    .if (.Lfpc_qr_end_\@ - .Lfpc_qr_begin_\@) != 3
        .error "floating-point conversion must occupy exactly three bytes"
    .endif
    call fpc_print_exact_state
.endm

; rD,qS conversions: FTOS16 and FTOU16.
.macro fpc_rq_exact_case mnemonic, rd, qs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpc_set_cc \cc_lhs, \cc_rhs
    fpc_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpc_rq_begin_\@:
    \mnemonic \rd, \qs
.Lfpc_rq_end_\@:
    .if (.Lfpc_rq_end_\@ - .Lfpc_rq_begin_\@) != 3
        .error "floating-point conversion must occupy exactly three bytes"
    .endif
    call fpc_print_exact_state
.endm

.macro fpc_rq_unknown_case mnemonic, rd, qs, rd_index, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpc_set_cc \cc_lhs, \cc_rhs
    fpc_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpc_rqu_begin_\@:
    \mnemonic \rd, \qs
.Lfpc_rqu_end_\@:
    .if (.Lfpc_rqu_end_\@ - .Lfpc_rqu_begin_\@) != 3
        .error "floating-point conversion must occupy exactly three bytes"
    .endif
    fpc_print_unknown_r_state \rd_index
.endm

; qD,qS conversions: S32TOF, U32TOF, FTOS32, and FTOU32.
.macro fpc_qq_exact_case mnemonic, qd, qs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpc_set_cc \cc_lhs, \cc_rhs
    fpc_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpc_qq_begin_\@:
    \mnemonic \qd, \qs
.Lfpc_qq_end_\@:
    .if (.Lfpc_qq_end_\@ - .Lfpc_qq_begin_\@) != 3
        .error "floating-point conversion must occupy exactly three bytes"
    .endif
    call fpc_print_exact_state
.endm

.macro fpc_qq_unknown_case mnemonic, qd, qs, qd_index, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpc_set_cc \cc_lhs, \cc_rhs
    fpc_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpc_qqu_begin_\@:
    \mnemonic \qd, \qs
.Lfpc_qqu_end_\@:
    .if (.Lfpc_qqu_end_\@ - .Lfpc_qqu_begin_\@) != 3
        .error "floating-point conversion must occupy exactly three bytes"
    .endif
    fpc_print_unknown_q_state \qd_index
.endm
