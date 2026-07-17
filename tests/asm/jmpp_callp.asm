.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; JMPP q0.
    ldi16 r4, %lo16(.Ljpcp_jmpp_q0_target)
    mov r0, r4
    ldi8 r4, %hi8(.Ljpcp_jmpp_q0_target)
    mov r1, r4
    jmpp q0
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_jmpp_q0_target:
    ldi8 r4, 'B'
    sys debug_putc

    ; JMPP q1.
    ldi16 r4, %lo16(.Ljpcp_jmpp_q1_target)
    mov r2, r4
    ldi8 r4, %hi8(.Ljpcp_jmpp_q1_target)
    mov r3, r4
    jmpp q1
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_jmpp_q1_target:
    ldi8 r4, 'B'
    sys debug_putc

    ; JMPP q2.
    ldi16 r4, %lo16(.Ljpcp_jmpp_q2_target)
    ldi8 r5, %hi8(.Ljpcp_jmpp_q2_target)
    jmpp q2
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_jmpp_q2_target:
    ldi8 r4, 'B'
    sys debug_putc

    ; JMPP q3.
    ldi16 r6, %lo16(.Ljpcp_jmpp_q3_target)
    ldi8 r7, %hi8(.Ljpcp_jmpp_q3_target)
    jmpp q3
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_jmpp_q3_target:
    ldi8 r4, 'B'
    sys debug_putc

    ; CALLP q0.
    ldi16 r4, 0x0980
    setsp r4
    ldi16 r4, %lo16(.Ljpcp_callp_q0_target)
    mov r0, r4
    ldi8 r4, %hi8(.Ljpcp_callp_q0_target)
    mov r1, r4
    callp q0
.Ljpcp_callp_q0_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljpcp_callp_q0_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q0_sp_done
.Ljpcp_callp_q0_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q0_sp_done:

    ; CALLP q1.
    ldi16 r4, 0x0980
    setsp r4
    ldi16 r4, %lo16(.Ljpcp_callp_q1_target)
    mov r2, r4
    ldi8 r4, %hi8(.Ljpcp_callp_q1_target)
    mov r3, r4
    callp q1
.Ljpcp_callp_q1_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljpcp_callp_q1_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q1_sp_done
.Ljpcp_callp_q1_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q1_sp_done:

    ; CALLP q2.
    ldi16 r4, 0x0980
    setsp r4
    ldi16 r4, %lo16(.Ljpcp_callp_q2_target)
    ldi8 r5, %hi8(.Ljpcp_callp_q2_target)
    callp q2
.Ljpcp_callp_q2_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljpcp_callp_q2_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q2_sp_done
.Ljpcp_callp_q2_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q2_sp_done:

    ; CALLP q3.
    ldi16 r4, 0x0980
    setsp r4
    ldi16 r6, %lo16(.Ljpcp_callp_q3_target)
    ldi8 r7, %hi8(.Ljpcp_callp_q3_target)
    callp q3
.Ljpcp_callp_q3_return:
    getsp r0
    mov r4, r0
    ldi16 r5, 0x0980
    cmp r4, r5
    brne8 .Ljpcp_callp_q3_sp_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q3_sp_done
.Ljpcp_callp_q3_sp_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q3_sp_done:

    debug_emit_newline
    sys debug_break

.Ljpcp_callp_q0_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljpcp_callp_q0_return)
    cmp r5, r7
    brne8 .Ljpcp_callp_q0_frame_fail
    ldi8 r7, %hi8(.Ljpcp_callp_q0_return)
    cmp r6, r7
    brne8 .Ljpcp_callp_q0_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljpcp_callp_q0_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q0_frame_done
.Ljpcp_callp_q0_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q0_frame_done:
    ret

.Ljpcp_callp_q1_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljpcp_callp_q1_return)
    cmp r5, r7
    brne8 .Ljpcp_callp_q1_frame_fail
    ldi8 r7, %hi8(.Ljpcp_callp_q1_return)
    cmp r6, r7
    brne8 .Ljpcp_callp_q1_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljpcp_callp_q1_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q1_frame_done
.Ljpcp_callp_q1_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q1_frame_done:
    ret

.Ljpcp_callp_q2_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljpcp_callp_q2_return)
    cmp r5, r7
    brne8 .Ljpcp_callp_q2_frame_fail
    ldi8 r7, %hi8(.Ljpcp_callp_q2_return)
    cmp r6, r7
    brne8 .Ljpcp_callp_q2_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljpcp_callp_q2_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q2_frame_done
.Ljpcp_callp_q2_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q2_frame_done:
    ret

.Ljpcp_callp_q3_target:
    getsp r0
    mov r4, r0
    ld16 r5, [r4]
    addi.s8 r4, 2
    ld8u r6, [r4]
    ldi16 r7, %lo16(.Ljpcp_callp_q3_return)
    cmp r5, r7
    brne8 .Ljpcp_callp_q3_frame_fail
    ldi8 r7, %hi8(.Ljpcp_callp_q3_return)
    cmp r6, r7
    brne8 .Ljpcp_callp_q3_frame_fail
    mov r4, r0
    ldi16 r5, 0x097d
    cmp r4, r5
    brne8 .Ljpcp_callp_q3_frame_fail
    ldi8 r4, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q3_frame_done
.Ljpcp_callp_q3_frame_fail:
    ldi8 r4, 'A'
    sys debug_putc
.Ljpcp_callp_q3_frame_done:
    ret
