.include "include/debug_output.inc"
.include "include/upper_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Left operand c0, every right operand.
    reset_upper_regs
    cmp c0, c0
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c0, c1
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c0, c2
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c0, c3
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    ; Left operand c1, every right operand.
    reset_upper_regs
    cmp c1, c0
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c1, c1
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c1, c2
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c1, c3
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    ; Left operand c2, every right operand.
    reset_upper_regs
    cmp c2, c0
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c2, c1
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c2, c2
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c2, c3
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    ; Left operand c3, every right operand.
    reset_upper_regs
    cmp c3, c0
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c3, c1
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c3, c2
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    reset_upper_regs
    cmp c3, c3
    cset.eq r0
    call debug_print_bool_r0
    cset.ne r0
    call debug_print_bool_r0
    cset.ult r0
    call debug_print_bool_r0
    cset.uge r0
    call debug_print_bool_r0
    cset.slt r0
    call debug_print_bool_r0
    cset.sge r0
    call debug_print_bool_r0
    call debug_print_upper_regs

    sys debug_break
