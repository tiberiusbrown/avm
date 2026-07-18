; Shared helpers for FCMP and FCLASS tests.
;
; Output line:
;   <EQ NE ULT UGE SLT SGE>=<r0>...<r7>
;
; Conditions use A=false/B=true. Each register is printed as four A-P
; hexadecimal nibbles, with A=0 through P=15.

.include "include/debug_output.inc"

.section .text,"ax",@progbits

.macro fpcx_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

; Print EQ, NE, ULT, UGE, SLT, and SGE while preserving architectural CC.
.macro fpcx_print_cc
    breq8 .Lfpcx_eq_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_eq_done_\@
.Lfpcx_eq_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_eq_done_\@:

    brne8 .Lfpcx_ne_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_ne_done_\@
.Lfpcx_ne_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_ne_done_\@:

    brult8 .Lfpcx_ult_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_ult_done_\@
.Lfpcx_ult_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_ult_done_\@:

    bruge8 .Lfpcx_uge_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_uge_done_\@
.Lfpcx_uge_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_uge_done_\@:

    brslt8 .Lfpcx_slt_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_slt_done_\@
.Lfpcx_slt_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_slt_done_\@:

    brsge8 .Lfpcx_sge_true_\@
    fpcx_emit_char 'A'
    jmp8 .Lfpcx_sge_done_\@
.Lfpcx_sge_true_\@:
    fpcx_emit_char 'B'
.Lfpcx_sge_done_\@:
.endm

.macro fpcx_push_all_regs
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
.endm

.type fpcx_print_exact_state, @function
fpcx_print_exact_state:
    fpcx_push_all_regs
    fpcx_print_cc
    fpcx_emit_char '='
    .rept 8
        pop16 r0
        call debug_print_r0
    .endr
    fpcx_emit_char '\n'
    ret

.macro fpcx_set_cc lhs, rhs
    ldi16 r6, \lhs
    ldi16 r7, \rhs
    cmp r6, r7
.endm

.macro fpcx_load_regs v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7
.endm

.macro fpcx_fcmp_case rd, ql, qr, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpcx_set_cc \cc_lhs, \cc_rhs
    fpcx_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpcx_fcmp_begin_\@:
    fcmp \rd, \ql, \qr
.Lfpcx_fcmp_end_\@:
    .if (.Lfpcx_fcmp_end_\@ - .Lfpcx_fcmp_begin_\@) != 3
        .error "FCMP must occupy exactly three bytes"
    .endif
    call fpcx_print_exact_state
.endm

.macro fpcx_fclass_case rd, qs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    fpcx_set_cc \cc_lhs, \cc_rhs
    fpcx_load_regs \v0, \v1, \v2, \v3, \v4, \v5, \v6, \v7
.Lfpcx_fclass_begin_\@:
    fclass \rd, \qs
.Lfpcx_fclass_end_\@:
    .if (.Lfpcx_fclass_end_\@ - .Lfpcx_fclass_begin_\@) != 3
        .error "FCLASS must occupy exactly three bytes"
    .endif
    call fpcx_print_exact_state
.endm
