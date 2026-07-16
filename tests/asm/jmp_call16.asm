.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Forward JMP16, target more than 127 bytes away.
    jmp16 .Ljc16_jump_forward_target
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.Ljc16_jump_forward_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; Backward JMP16, target more than 127 bytes behind.
    jmp16 .Ljc16_jump_backward_start
.Ljc16_jump_backward_target:
    ldi8 c0, 'C'
    sys debug_putc
    jmp16 .Ljc16_jump_backward_done
    .zero 130
.Ljc16_jump_backward_start:
    jmp16 .Ljc16_jump_backward_target
.Ljc16_jump_backward_done:
    ldi8 c0, 'D'
    sys debug_putc

    ; Forward CALL16 with a displacement greater than 127.
    ldi16 c0, 0x0980
    setsp r4
    call16 .Ljc16_call_forward_target
.Ljc16_call_forward_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljc16_call_forward_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljc16_call_forward_sp_done
.Ljc16_call_forward_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljc16_call_forward_sp_done:
    jmp16 .Ljc16_after_call_forward_target
    .zero 130
.Ljc16_call_forward_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljc16_call_forward_return)
    cmp c1, c3
    brne8 .Ljc16_call_forward_frame_fail
    ldi8 c3, %hi8(.Ljc16_call_forward_return)
    cmp c2, c3
    brne8 .Ljc16_call_forward_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljc16_call_forward_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljc16_call_forward_frame_done
.Ljc16_call_forward_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljc16_call_forward_frame_done:
    ret

.Ljc16_after_call_forward_target:

    ; Backward CALL16 with a displacement less than -127.
    jmp16 .Ljc16_call_backward_start
.Ljc16_call_backward_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljc16_call_backward_return)
    cmp c1, c3
    brne8 .Ljc16_call_backward_frame_fail
    ldi8 c3, %hi8(.Ljc16_call_backward_return)
    cmp c2, c3
    brne8 .Ljc16_call_backward_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljc16_call_backward_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljc16_call_backward_frame_done
.Ljc16_call_backward_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljc16_call_backward_frame_done:
    ret

    .zero 130
.Ljc16_call_backward_start:
    ldi16 c0, 0x0980
    setsp r4
    call16 .Ljc16_call_backward_target
.Ljc16_call_backward_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljc16_call_backward_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljc16_call_backward_sp_done
.Ljc16_call_backward_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljc16_call_backward_sp_done:
    debug_emit_newline
    sys debug_break
