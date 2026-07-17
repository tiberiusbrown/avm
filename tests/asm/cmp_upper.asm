.include "include/debug_output.inc"
.include "include/upper_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Left operand r4, every right operand.
    reset_upper_regs
    cmp r4, r4
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
    cmp r4, r5
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
    cmp r4, r6
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
    cmp r4, r7
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

    ; Left operand r5, every right operand.
    reset_upper_regs
    cmp r5, r4
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
    cmp r5, r5
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
    cmp r5, r6
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
    cmp r5, r7
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

    ; Left operand r6, every right operand.
    reset_upper_regs
    cmp r6, r4
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
    cmp r6, r5
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
    cmp r6, r6
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
    cmp r6, r7
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

    ; Left operand r7, every right operand.
    reset_upper_regs
    cmp r7, r4
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
    cmp r7, r5
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
    cmp r7, r6
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
    cmp r7, r7
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
