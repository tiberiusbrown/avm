; Shared helpers for binary floating-point assembly tests.
;
; Exact-result line format:
;     <EQ NE ULT UGE SLT SGE>=<r0>...<r7>
; with no spaces. Conditions use A=false/B=true. Each register is printed as
; four A-P nibble characters, using A=0 through P=15.
;
; NaN-result line format:
;     <condition signature><N><r0>...<r7>
; N means that the raw result was any binary32 NaN. The destination pair is
; printed as eight '-' characters because arithmetic NaN payload bits are not
; architecturally fixed. All other registers are printed exactly.
;
; These helpers classify NaNs using integer bit tests rather than FCLASS, so a
; failure in FCLASS cannot hide a failure in the arithmetic instruction.

.include "include/debug_output.inc"

.section .text,"ax",@progbits

.macro fp_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

; Print EQ, NE, ULT, UGE, SLT, and SGE as A=false/B=true.
; Every instruction on each selected path preserves architectural CC.
.macro fp_print_cc
    breq8 .Lfp_eq_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_eq_done_\@
.Lfp_eq_true_\@:
    fp_emit_char 'B'
.Lfp_eq_done_\@:

    brne8 .Lfp_ne_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_ne_done_\@
.Lfp_ne_true_\@:
    fp_emit_char 'B'
.Lfp_ne_done_\@:

    brult8 .Lfp_ult_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_ult_done_\@
.Lfp_ult_true_\@:
    fp_emit_char 'B'
.Lfp_ult_done_\@:

    bruge8 .Lfp_uge_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_uge_done_\@
.Lfp_uge_true_\@:
    fp_emit_char 'B'
.Lfp_uge_done_\@:

    brslt8 .Lfp_slt_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_slt_done_\@
.Lfp_slt_true_\@:
    fp_emit_char 'B'
.Lfp_slt_done_\@:

    brsge8 .Lfp_sge_true_\@
    fp_emit_char 'A'
    jmp8 .Lfp_sge_done_\@
.Lfp_sge_true_\@:
    fp_emit_char 'B'
.Lfp_sge_done_\@:
.endm

.macro fp_push_all_regs
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
.endm

; Print exact r0-r7 state and the preserved condition signature.
.type fp_print_exact_state, @function
fp_print_exact_state:
    fp_push_all_regs
    fp_print_cc
    fp_emit_char '='

    .rept 8
        pop16 r0
        call debug_print_r0
    .endr

    fp_emit_char '\n'
    ret

.macro fp_emit_placeholder_word
    fp_emit_char '-'
    fp_emit_char '-'
    fp_emit_char '-'
    fp_emit_char '-'
.endm

; Print one saved word, replacing words belonging to qD with "----".
.macro fp_pop_print_nan_word qd, word_index
    pop16 r0
    .if ((\word_index) == (2 * (\qd))) || ((\word_index) == (2 * (\qd) + 1))
        fp_emit_placeholder_word
    .else
        call debug_print_r0
    .endif
.endm

; Verify that qD contains any NaN, print N/X, then print all non-destination
; registers exactly. MOV32 preserves CC, so the condition signature is emitted
; before the integer classification changes CC.
.macro fp_print_nan_state qd, qd_index
    fp_push_all_regs
    mov32 q0, \qd
    fp_print_cc

    ; q0 is NaN iff exponent == 0xff and fraction != 0.
    mov r6, r1
    ldi16 r7, 0x7f80
    and r6, r7
    cmp r6, r7
    brne8 .Lfp_not_nan_\@

    mov r6, r1
    ldi16 r7, 0x007f
    and r6, r7
    or r6, r0
    ldi16 r7, 0
    cmp r6, r7
    breq8 .Lfp_not_nan_\@

    fp_emit_char 'N'
    jmp8 .Lfp_nan_marker_done_\@
.Lfp_not_nan_\@:
    fp_emit_char 'X'
.Lfp_nan_marker_done_\@:

    fp_pop_print_nan_word \qd_index, 0
    fp_pop_print_nan_word \qd_index, 1
    fp_pop_print_nan_word \qd_index, 2
    fp_pop_print_nan_word \qd_index, 3
    fp_pop_print_nan_word \qd_index, 4
    fp_pop_print_nan_word \qd_index, 5
    fp_pop_print_nan_word \qd_index, 6
    fp_pop_print_nan_word \qd_index, 7

    fp_emit_char '\n'
.endm

; Establish CC, initialize all registers, execute one two-byte binary-float
; instruction, and print its exact state.
.macro fp_binary_exact_case mnemonic, qd, qs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7

    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7

.Lfp_begin_\@:
    \mnemonic \qd, \qs
.Lfp_end_\@:
    .if (.Lfp_end_\@ - .Lfp_begin_\@) != 2
        .error "binary floating-point instruction must occupy exactly two bytes"
    .endif

    call fp_print_exact_state
.endm

; Same setup, but accept any NaN payload/sign and print all non-destination
; registers exactly.
.macro fp_binary_nan_case mnemonic, qd, qs, qd_index, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7

    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7

.Lfp_nan_begin_\@:
    \mnemonic \qd, \qs
.Lfp_nan_end_\@:
    .if (.Lfp_nan_end_\@ - .Lfp_nan_begin_\@) != 2
        .error "binary floating-point instruction must occupy exactly two bytes"
    .endif

    fp_print_nan_state \qd, \qd_index
.endm
