.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Forward JMPF.
    jmpf .Ljcf_jump_forward_target
    ldi8 c0, 'A'
    sys debug_putc
.Ljcf_jump_forward_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; Backward JMPF.
    jmpf .Ljcf_jump_backward_start
.Ljcf_jump_backward_target:
    ldi8 c0, 'C'
    sys debug_putc
    jmpf .Ljcf_jump_backward_done
.Ljcf_jump_backward_start:
    jmpf .Ljcf_jump_backward_target
.Ljcf_jump_backward_done:
    ldi8 c0, 'D'
    sys debug_putc

    ; Forward CALLF with three-byte return-address validation.
    ldi16 c0, 0x0980
    setsp r4
    callf .Ljcf_call_forward_target
.Ljcf_call_forward_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljcf_call_forward_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_forward_sp_done
.Ljcf_call_forward_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljcf_call_forward_sp_done:
    jmpf .Ljcf_after_call_forward_target
.Ljcf_call_forward_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljcf_call_forward_return)
    cmp c1, c3
    brne8 .Ljcf_call_forward_frame_fail
    ldi8 c3, %hi8(.Ljcf_call_forward_return)
    cmp c2, c3
    brne8 .Ljcf_call_forward_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljcf_call_forward_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_forward_frame_done
.Ljcf_call_forward_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljcf_call_forward_frame_done:
    ret

.Ljcf_after_call_forward_target:

    ; Backward CALLF.
    jmpf .Ljcf_call_backward_start
.Ljcf_call_backward_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljcf_call_backward_return)
    cmp c1, c3
    brne8 .Ljcf_call_backward_frame_fail
    ldi8 c3, %hi8(.Ljcf_call_backward_return)
    cmp c2, c3
    brne8 .Ljcf_call_backward_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljcf_call_backward_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_backward_frame_done
.Ljcf_call_backward_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljcf_call_backward_frame_done:
    ret

.Ljcf_call_backward_start:
    ldi16 c0, 0x0980
    setsp r4
    callf .Ljcf_call_backward_target
.Ljcf_call_backward_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljcf_call_backward_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljcf_call_backward_sp_done
.Ljcf_call_backward_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljcf_call_backward_sp_done:
    debug_emit_newline
    sys debug_break
