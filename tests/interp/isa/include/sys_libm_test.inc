; Shared helpers for SYS-backed avr-libc floating-point tests.
;
; Every case verifies:
;   * the symbolic SYS service occupies exactly two bytes;
;   * architectural condition flags are preserved;
;   * q2 contains the exact result, a result within a raw-bit tolerance, or NaN;
;   * q0, q1, and q3 are preserved exactly.
;
; A passing test prints "P\n". A failed check prints "F\n" and reaches
; debug_break immediately, producing an output mismatch instead of a timeout.

.section .text,"ax",@progbits

.macro syslibm_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro syslibm_expect condition, expected
    .if \expected
        \condition .Lsyslibm_condition_ok_\@
        jmp16 syslibm_fail
.Lsyslibm_condition_ok_\@:
    .else
        \condition .Lsyslibm_condition_bad_\@
        jmp8 .Lsyslibm_condition_ok_\@
.Lsyslibm_condition_bad_\@:
        jmp16 syslibm_fail
.Lsyslibm_condition_ok_\@:
    .endif
.endm

.macro syslibm_check_cc eq, ne, ult, uge, slt, sge
    syslibm_expect breq8,  \eq
    syslibm_expect brne8,  \ne
    syslibm_expect brult8, \ult
    syslibm_expect bruge8, \uge
    syslibm_expect brslt8, \slt
    syslibm_expect brsge8, \sge
.endm

.macro syslibm_set_cc lhs, rhs
    ldi16 r6, \lhs
    ldi16 r7, \rhs
    cmp   r6, r7
.endm

.macro syslibm_load_unary input_lo, input_hi
    ldi16 r0, 0xcdef
    ldi16 r1, 0x89ab
    ldi16 r2, 0x9bdf
    ldi16 r3, 0x1357
    ldi16 r4, \input_lo
    ldi16 r5, \input_hi
    ldi16 r6, 0xace0
    ldi16 r7, 0x2468
.endm

.macro syslibm_load_binary lhs_lo, lhs_hi, rhs_lo, rhs_hi
    ldi16 r0, 0xcdef
    ldi16 r1, 0x89ab
    ldi16 r2, 0x9bdf
    ldi16 r3, 0x1357
    ldi16 r4, \lhs_lo
    ldi16 r5, \lhs_hi
    ldi16 r6, \rhs_lo
    ldi16 r7, \rhs_hi
.endm

.macro syslibm_invoke service
.Lsyslibm_sys_begin_\@:
    sys \service
.Lsyslibm_sys_end_\@:
    .if (.Lsyslibm_sys_end_\@ - .Lsyslibm_sys_begin_\@) != 2
        .error "named libm SYS instruction must occupy exactly two bytes"
    .endif
.endm

.macro syslibm_push_all_regs
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
.endm

.macro syslibm_check_saved_word expected
    pop16 r0
    ldi16 r1, \expected
    cmp   r0, r1
    breq8 .Lsyslibm_word_ok_\@
    jmp16 syslibm_fail
.Lsyslibm_word_ok_\@:
.endm

.macro syslibm_check_preserved_head
    syslibm_check_saved_word 0xcdef
    syslibm_check_saved_word 0x89ab
    syslibm_check_saved_word 0x9bdf
    syslibm_check_saved_word 0x1357
.endm

.macro syslibm_check_unary_tail
    syslibm_check_saved_word 0xace0
    syslibm_check_saved_word 0x2468
.endm

.macro syslibm_check_binary_tail rhs_lo, rhs_hi
    syslibm_check_saved_word \rhs_lo
    syslibm_check_saved_word \rhs_hi
.endm

.macro syslibm_check_exact_unary result_lo, result_hi
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_saved_word \result_lo
    syslibm_check_saved_word \result_hi
    syslibm_check_unary_tail
.endm

.macro syslibm_check_exact_binary rhs_lo, rhs_hi, result_lo, result_hi
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_saved_word \result_lo
    syslibm_check_saved_word \result_hi
    syslibm_check_binary_tail \rhs_lo, \rhs_hi
.endm

; Check q2's raw 32-bit representation against an inclusive raw-bit interval.
; The interval may be centered on either a positive or negative finite result.
.macro syslibm_check_raw_range lower_lo, lower_hi, upper_lo, upper_hi
    pop16 r0                         ; result low word
    pop16 r1                         ; result high word

    ; result >= lower, interpreted as unsigned raw bits
    ldi16 r2, \lower_hi
    cmp   r1, r2
    brult8 .Lsyslibm_range_bad_\@
    brne8 .Lsyslibm_lower_ok_\@
    ldi16 r2, \lower_lo
    cmp   r0, r2
    brult8 .Lsyslibm_range_bad_\@
.Lsyslibm_lower_ok_\@:

    ; result <= upper, interpreted as unsigned raw bits
    ldi16 r2, \upper_hi
    cmp   r1, r2
    brult8 .Lsyslibm_upper_ok_\@
    brne8 .Lsyslibm_range_bad_\@
    ldi16 r2, \upper_lo
    cmp   r0, r2
    brult8 .Lsyslibm_upper_ok_\@
    breq8 .Lsyslibm_upper_ok_\@
    jmp8 .Lsyslibm_range_bad_\@

.Lsyslibm_range_bad_\@:
    jmp16 syslibm_fail
.Lsyslibm_upper_ok_\@:
.endm

.macro syslibm_check_range_unary lower_lo, lower_hi, upper_lo, upper_hi
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_raw_range \lower_lo, \lower_hi, \upper_lo, \upper_hi
    syslibm_check_unary_tail
.endm

.macro syslibm_check_range_binary rhs_lo, rhs_hi, lower_lo, lower_hi, upper_lo, upper_hi
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_raw_range \lower_lo, \lower_hi, \upper_lo, \upper_hi
    syslibm_check_binary_tail \rhs_lo, \rhs_hi
.endm

.macro syslibm_check_nan_head
    pop16 r0                         ; result low word
    pop16 r1                         ; result high word

    mov   r2, r1
    ldi16 r3, 0x7f80
    and   r2, r3
    cmp   r2, r3
    breq8 .Lsyslibm_nan_exponent_ok_\@
    jmp16 syslibm_fail
.Lsyslibm_nan_exponent_ok_\@:

    mov   r2, r1
    ldi16 r3, 0x007f
    and   r2, r3
    or    r2, r0
    ldi16 r3, 0
    cmp   r2, r3
    brne8 .Lsyslibm_nan_fraction_ok_\@
    jmp16 syslibm_fail
.Lsyslibm_nan_fraction_ok_\@:
.endm

.macro syslibm_check_nan_unary
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_nan_head
    syslibm_check_unary_tail
.endm

.macro syslibm_check_nan_binary rhs_lo, rhs_hi
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_nan_head
    syslibm_check_binary_tail \rhs_lo, \rhs_hi
.endm

.macro syslibm_unary_exact service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, input_lo, input_hi, result_lo, result_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_unary \input_lo, \input_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_check_exact_unary \result_lo, \result_hi
.endm

.macro syslibm_unary_range service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, input_lo, input_hi, lower_lo, lower_hi, upper_lo, upper_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_unary \input_lo, \input_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_raw_range \lower_lo, \lower_hi, \upper_lo, \upper_hi
    syslibm_check_unary_tail
.endm

.macro syslibm_unary_nan service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, input_lo, input_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_unary \input_lo, \input_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_check_nan_unary
.endm

.macro syslibm_binary_exact service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, lhs_lo, lhs_hi, rhs_lo, rhs_hi, result_lo, result_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_binary \lhs_lo, \lhs_hi, \rhs_lo, \rhs_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_check_exact_binary \rhs_lo, \rhs_hi, \result_lo, \result_hi
.endm

.macro syslibm_binary_range service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, lhs_lo, lhs_hi, rhs_lo, rhs_hi, lower_lo, lower_hi, upper_lo, upper_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_binary \lhs_lo, \lhs_hi, \rhs_lo, \rhs_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_push_all_regs
    syslibm_check_preserved_head
    syslibm_check_raw_range \lower_lo, \lower_hi, \upper_lo, \upper_hi
    syslibm_check_binary_tail \rhs_lo, \rhs_hi
.endm

.macro syslibm_binary_nan service, cc_lhs, cc_rhs, eq, ne, ult, uge, slt, sge, lhs_lo, lhs_hi, rhs_lo, rhs_hi
    syslibm_set_cc \cc_lhs, \cc_rhs
    syslibm_load_binary \lhs_lo, \lhs_hi, \rhs_lo, \rhs_hi
    syslibm_invoke \service
    syslibm_check_cc \eq, \ne, \ult, \uge, \slt, \sge
    syslibm_check_nan_binary \rhs_lo, \rhs_hi
.endm

.type syslibm_fail, @function
syslibm_fail:
    syslibm_emit_char 'F'
    syslibm_emit_char '\n'
    sys debug_break
    jmp16 syslibm_fail

.type syslibm_pass, @function
syslibm_pass:
    syslibm_emit_char 'P'
    syslibm_emit_char '\n'
    sys debug_break
    jmp16 syslibm_pass
