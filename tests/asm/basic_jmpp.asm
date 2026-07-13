.equ SYS_DEBUG_PUTC,  0
.equ SYS_DEBUG_BREAK, 1

.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro putc value
    ldi8 c0, \value
    sys SYS_DEBUG_PUTC
.endm

.macro require_imm reg, value
    cmpi16 \reg, \value
    breq 1f
    jmp16 .L_fail
1:
.endm

.macro require_eq lhs, rhs
    ; CMP16 only accepts distinct compact operands (or A,r0-r3). Preserve
    ; c0/c1 and compare arbitrary registers through temporary stack copies.
    push16 c0
    push16 c1
    push16 \lhs
    push16 \rhs
    pop16  c1
    pop16  c0
    cmp16  c0, c1
    pop16  c1
    pop16  c0
    breq 1f
    jmp16 .L_fail
1:
.endm

; Establish C=1, Z=0, S=0 and set PB to a value unrelated to the code target.
; Pointer construction and indirect control must preserve this state.
.macro establish_state
    ldpbi 0x5a
    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    cmp16 c0, c1
.endm

_start:
    ; JMPP q0.
    establish_state
    ldi16 r0, prog_lo16(.L_q0_target)
    ldi8  r1, prog_hi8(.L_q0_target)
    jmpp q0
    jmp16 .L_fail                    ; fallthrough must not execute

.p2align 1
.L_q0_target:
    ; Capture the original CC before any validation compare changes it.
    cset r4, ult
    cset r5, ne
    cset r6, sge
    mfpb r7
    ldi16 r2, prog_lo16(.L_q0_target)
    ldi8  r3, prog_hi8(.L_q0_target)
    require_imm r4, 1
    require_imm r5, 1
    require_imm r6, 1
    require_imm r7, 0x005a
    require_eq  r0, r2
    require_eq  r1, r3
    putc 0x30                        ; 0

    ; JMPP q1.
    establish_state
    ldi16 r2, prog_lo16(.L_q1_target)
    ldi8  r3, prog_hi8(.L_q1_target)
    jmpp q1
    jmp16 .L_fail

.p2align 1
.L_q1_target:
    cset r4, ult
    cset r5, ne
    cset r6, sge
    mfpb r7
    ldi16 r0, prog_lo16(.L_q1_target)
    ldi8  r1, prog_hi8(.L_q1_target)
    require_imm r4, 1
    require_imm r5, 1
    require_imm r6, 1
    require_imm r7, 0x005a
    require_eq  r2, r0
    require_eq  r3, r1
    putc 0x31                        ; 1

    ; JMPP q2.
    establish_state
    ldi16 r4, prog_lo16(.L_q2_target)
    ldi8  r5, prog_hi8(.L_q2_target)
    jmpp q2
    jmp16 .L_fail

.p2align 1
.L_q2_target:
    cset r2, ult
    cset r3, ne
    cset r6, sge
    mfpb r7
    require_imm r2, 1
    require_imm r3, 1
    require_imm r6, 1
    require_imm r7, 0x005a
    ldi16 r0, prog_lo16(.L_q2_target)
    ldi8  r1, prog_hi8(.L_q2_target)
    require_eq  r4, r0
    require_eq  r5, r1
    putc 0x32                        ; 2

    ; JMPP q3.
    establish_state
    ldi16 r6, prog_lo16(.L_q3_target)
    ldi8  r7, prog_hi8(.L_q3_target)
    jmpp q3
    jmp16 .L_fail

.p2align 1
.L_q3_target:
    cset r2, ult
    cset r3, ne
    cset r4, sge
    mfpb r5
    require_imm r2, 1
    require_imm r3, 1
    require_imm r4, 1
    require_imm r5, 0x005a
    ldi16 r0, prog_lo16(.L_q3_target)
    ldi8  r1, prog_hi8(.L_q3_target)
    require_eq  r6, r0
    require_eq  r7, r1
    putc 0x33                        ; 3

    putc 0x0d
    putc 0x0a
    sys SYS_DEBUG_BREAK

.L_fail:
    putc 0x46                        ; F
    putc 0x41                        ; A
    putc 0x49                        ; I
    putc 0x4c                        ; L
    putc 0x0d
    putc 0x0a
    sys SYS_DEBUG_BREAK

.size _start, .-_start
