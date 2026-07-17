.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Forward JMPF.
    jmpf .Ljcf_jump_forward_target
    ldi8 r4, 'A'
    sys debug_putc
.Ljcf_jump_forward_target:
    ldi8 r4, 'B'
    sys debug_putc

    ; Backward JMPF.
    jmpf .Ljcf_jump_backward_start
.Ljcf_jump_backward_target:
    ldi8 r4, 'C'
    sys debug_putc
    jmpf .Ljcf_jump_backward_done
.Ljcf_jump_backward_start:
    jmpf .Ljcf_jump_backward_target
.Ljcf_jump_backward_done:
    ldi8 r4, 'D'
    sys debug_putc

    ; Forward CALLF with three-byte return-address validation.
    ldi16 r4, 0x0980
    setsp r4
    callf .Ljcf_call_forward_target
.Ljcf_call_forward_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljcf_call_forward_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_forward_sp_done
.Ljcf_call_forward_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljcf_call_forward_sp_done:
    jmpf .Ljcf_after_call_forward_target
.Ljcf_call_forward_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljcf_call_forward_return)
    cmp r5, r7
    brne8 .Ljcf_call_forward_frame_fail
    ldi8 r7, %hi8(.Ljcf_call_forward_return)
    cmp r6, r7
    brne8 .Ljcf_call_forward_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljcf_call_forward_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_forward_frame_done
.Ljcf_call_forward_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljcf_call_forward_frame_done:
    ret

.Ljcf_after_call_forward_target:

    ; Backward CALLF.
    jmpf .Ljcf_call_backward_start
.Ljcf_call_backward_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljcf_call_backward_return)
    cmp r5, r7
    brne8 .Ljcf_call_backward_frame_fail
    ldi8 r7, %hi8(.Ljcf_call_backward_return)
    cmp r6, r7
    brne8 .Ljcf_call_backward_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljcf_call_backward_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_backward_frame_done
.Ljcf_call_backward_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljcf_call_backward_frame_done:
    ret

.Ljcf_call_backward_start:
    ldi16 r4, 0x0980
    setsp r4
    callf .Ljcf_call_backward_target
.Ljcf_call_backward_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljcf_call_backward_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_backward_sp_done
.Ljcf_call_backward_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljcf_call_backward_sp_done:
    debug_emit_newline
    sys debug_break
