.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; RET to a forward target.
    ldi16 r4, 0x097d
    ldi16 r5, %lo16(.Lret_forward_target)
    st16 [r4], r5
    addi.s8 r4, 2
    ldi8 r5, %hi8(.Lret_forward_target)
    st8 [r4], r5
    ldi16 r4, 0x097d
    setsp r4
    ret
    ldi8 r4, 'A'
    sys debug_putc
.Lret_forward_target:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Lret_forward_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Lret_forward_done
.Lret_forward_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Lret_forward_done:

    ; RET to a backward target.
    jmp8 .Lret_backward_setup
.Lret_backward_target:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Lret_backward_fail
    ldi8 r4, 'C'
    sys debug_putc
    jmp8 .Lret_backward_done
.Lret_backward_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Lret_backward_done:
    jmp8 .Lret_backward_finished
.Lret_backward_setup:
    ldi16 r4, 0x097d
    ldi16 r5, %lo16(.Lret_backward_target)
    st16 [r4], r5
    addi.s8 r4, 2
    ldi8 r5, %hi8(.Lret_backward_target)
    st8 [r4], r5
    ldi16 r4, 0x097d
    setsp r4
    ret
    ldi8 r4, 'A'
    sys debug_putc
.Lret_backward_finished:
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline
    sys debug_break
