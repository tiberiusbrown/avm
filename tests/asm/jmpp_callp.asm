.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; JMPP q0.
    ldi16 c0, %lo16(.Ljpcp_jmpp_q0_target)
    mov r0, r4
    ldi8 c0, %hi8(.Ljpcp_jmpp_q0_target)
    mov r1, r4
    jmpp q0
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_jmpp_q0_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; JMPP q1.
    ldi16 c0, %lo16(.Ljpcp_jmpp_q1_target)
    mov r2, r4
    ldi8 c0, %hi8(.Ljpcp_jmpp_q1_target)
    mov r3, r4
    jmpp q1
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_jmpp_q1_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; JMPP q2.
    ldi16 c0, %lo16(.Ljpcp_jmpp_q2_target)
    ldi8 c1, %hi8(.Ljpcp_jmpp_q2_target)
    jmpp q2
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_jmpp_q2_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; JMPP q3.
    ldi16 c2, %lo16(.Ljpcp_jmpp_q3_target)
    ldi8 c3, %hi8(.Ljpcp_jmpp_q3_target)
    jmpp q3
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_jmpp_q3_target:
    ldi8 c0, 'B'
    sys debug_putc

    ; CALLP q0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c0, %lo16(.Ljpcp_callp_q0_target)
    mov r0, r4
    ldi8 c0, %hi8(.Ljpcp_callp_q0_target)
    mov r1, r4
    callp q0
.Ljpcp_callp_q0_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljpcp_callp_q0_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q0_sp_done
.Ljpcp_callp_q0_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q0_sp_done:

    ; CALLP q1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c0, %lo16(.Ljpcp_callp_q1_target)
    mov r2, r4
    ldi8 c0, %hi8(.Ljpcp_callp_q1_target)
    mov r3, r4
    callp q1
.Ljpcp_callp_q1_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljpcp_callp_q1_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q1_sp_done
.Ljpcp_callp_q1_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q1_sp_done:

    ; CALLP q2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c0, %lo16(.Ljpcp_callp_q2_target)
    ldi8 c1, %hi8(.Ljpcp_callp_q2_target)
    callp q2
.Ljpcp_callp_q2_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljpcp_callp_q2_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q2_sp_done
.Ljpcp_callp_q2_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q2_sp_done:

    ; CALLP q3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, %lo16(.Ljpcp_callp_q3_target)
    ldi8 c3, %hi8(.Ljpcp_callp_q3_target)
    callp q3
.Ljpcp_callp_q3_return:
    getsp r0
    mov r4, r0
    ldi16 c1, 0x0980
    cmp c0, c1
    brne8 .Ljpcp_callp_q3_sp_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q3_sp_done
.Ljpcp_callp_q3_sp_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q3_sp_done:

    debug_emit_newline
    sys debug_break

.Ljpcp_callp_q0_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljpcp_callp_q0_return)
    cmp c1, c3
    brne8 .Ljpcp_callp_q0_frame_fail
    ldi8 c3, %hi8(.Ljpcp_callp_q0_return)
    cmp c2, c3
    brne8 .Ljpcp_callp_q0_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljpcp_callp_q0_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q0_frame_done
.Ljpcp_callp_q0_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q0_frame_done:
    ret

.Ljpcp_callp_q1_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljpcp_callp_q1_return)
    cmp c1, c3
    brne8 .Ljpcp_callp_q1_frame_fail
    ldi8 c3, %hi8(.Ljpcp_callp_q1_return)
    cmp c2, c3
    brne8 .Ljpcp_callp_q1_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljpcp_callp_q1_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q1_frame_done
.Ljpcp_callp_q1_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q1_frame_done:
    ret

.Ljpcp_callp_q2_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljpcp_callp_q2_return)
    cmp c1, c3
    brne8 .Ljpcp_callp_q2_frame_fail
    ldi8 c3, %hi8(.Ljpcp_callp_q2_return)
    cmp c2, c3
    brne8 .Ljpcp_callp_q2_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljpcp_callp_q2_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q2_frame_done
.Ljpcp_callp_q2_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q2_frame_done:
    ret

.Ljpcp_callp_q3_target:
    getsp r0
    mov r4, r0
    ld16 c1, [c0]
    addi.s8 c0, 2
    ld8u c2, [c0]
    ldi16 c3, %lo16(.Ljpcp_callp_q3_return)
    cmp c1, c3
    brne8 .Ljpcp_callp_q3_frame_fail
    ldi8 c3, %hi8(.Ljpcp_callp_q3_return)
    cmp c2, c3
    brne8 .Ljpcp_callp_q3_frame_fail
    mov r4, r0
    ldi16 c1, 0x097d
    cmp c0, c1
    brne8 .Ljpcp_callp_q3_frame_fail
    ldi8 c0, 'B'
    sys debug_putc
    jmp8 .Ljpcp_callp_q3_frame_done
.Ljpcp_callp_q3_frame_fail:
    ldi8 c0, 'A'
    sys debug_putc
.Ljpcp_callp_q3_frame_done:
    ret
