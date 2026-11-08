.include "include/f7_32bit_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; qD=q0, qS=q0, pattern 0; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0101
    push16 r4
    ldi16 c0, 0x4b01
    push16 r4
    ldi16 c0, 0x1454
    push16 r4
    ldi16 c0, 0x1565
    push16 r4
    ldi16 c0, 0x1676
    push16 r4
    ldi16 c0, 0x1787
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_000_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_EQ_done
.Lsub32_000_EQ_true:
    f7_emit_char 'B'
.Lsub32_000_EQ_done:
    brne8 .Lsub32_000_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_NE_done
.Lsub32_000_NE_true:
    f7_emit_char 'B'
.Lsub32_000_NE_done:
    brult8 .Lsub32_000_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_ULT_done
.Lsub32_000_ULT_true:
    f7_emit_char 'B'
.Lsub32_000_ULT_done:
    bruge8 .Lsub32_000_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_UGE_done
.Lsub32_000_UGE_true:
    f7_emit_char 'B'
.Lsub32_000_UGE_done:
    brslt8 .Lsub32_000_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_SLT_done
.Lsub32_000_SLT_true:
    f7_emit_char 'B'
.Lsub32_000_SLT_done:
    brsge8 .Lsub32_000_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_000_SGE_done
.Lsub32_000_SGE_true:
    f7_emit_char 'B'
.Lsub32_000_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q0, pattern 1; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0x1263
    push16 r4
    ldi16 c0, 0x1374
    push16 r4
    ldi16 c0, 0x599d
    push16 r4
    ldi16 c0, 0x4c15
    push16 r4
    ldi16 c0, 0x16a7
    push16 r4
    ldi16 c0, 0x17b8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q0
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_001_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_EQ_done
.Lsub32_001_EQ_true:
    f7_emit_char 'B'
.Lsub32_001_EQ_done:
    brne8 .Lsub32_001_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_NE_done
.Lsub32_001_NE_true:
    f7_emit_char 'B'
.Lsub32_001_NE_done:
    brult8 .Lsub32_001_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_ULT_done
.Lsub32_001_ULT_true:
    f7_emit_char 'B'
.Lsub32_001_ULT_done:
    bruge8 .Lsub32_001_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_UGE_done
.Lsub32_001_UGE_true:
    f7_emit_char 'B'
.Lsub32_001_UGE_done:
    brslt8 .Lsub32_001_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_SLT_done
.Lsub32_001_SLT_true:
    f7_emit_char 'B'
.Lsub32_001_SLT_done:
    brsge8 .Lsub32_001_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_001_SGE_done
.Lsub32_001_SGE_true:
    f7_emit_char 'B'
.Lsub32_001_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q0, pattern 2; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x1294
    push16 r4
    ldi16 c0, 0x13a5
    push16 r4
    ldi16 c0, 0x14b6
    push16 r4
    ldi16 c0, 0x15c7
    push16 r4
    ldi16 c0, 0xb239
    push16 r4
    ldi16 c0, 0x4d29
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q0
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_002_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_EQ_done
.Lsub32_002_EQ_true:
    f7_emit_char 'B'
.Lsub32_002_EQ_done:
    brne8 .Lsub32_002_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_NE_done
.Lsub32_002_NE_true:
    f7_emit_char 'B'
.Lsub32_002_NE_done:
    brult8 .Lsub32_002_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_ULT_done
.Lsub32_002_ULT_true:
    f7_emit_char 'B'
.Lsub32_002_ULT_done:
    bruge8 .Lsub32_002_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_UGE_done
.Lsub32_002_UGE_true:
    f7_emit_char 'B'
.Lsub32_002_UGE_done:
    brslt8 .Lsub32_002_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_SLT_done
.Lsub32_002_SLT_true:
    f7_emit_char 'B'
.Lsub32_002_SLT_done:
    brsge8 .Lsub32_002_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_002_SGE_done
.Lsub32_002_SGE_true:
    f7_emit_char 'B'
.Lsub32_002_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q0, pattern 3; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x07d2
    push16 r4
    ldi16 c0, 0x4b3b
    push16 r4
    ldi16 c0, 0x14e7
    push16 r4
    ldi16 c0, 0x15f8
    push16 r4
    ldi16 c0, 0x1709
    push16 r4
    ldi16 c0, 0x181a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_003_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_EQ_done
.Lsub32_003_EQ_true:
    f7_emit_char 'B'
.Lsub32_003_EQ_done:
    brne8 .Lsub32_003_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_NE_done
.Lsub32_003_NE_true:
    f7_emit_char 'B'
.Lsub32_003_NE_done:
    brult8 .Lsub32_003_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_ULT_done
.Lsub32_003_ULT_true:
    f7_emit_char 'B'
.Lsub32_003_ULT_done:
    bruge8 .Lsub32_003_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_UGE_done
.Lsub32_003_UGE_true:
    f7_emit_char 'B'
.Lsub32_003_UGE_done:
    brslt8 .Lsub32_003_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_SLT_done
.Lsub32_003_SLT_true:
    f7_emit_char 'B'
.Lsub32_003_SLT_done:
    brsge8 .Lsub32_003_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_003_SGE_done
.Lsub32_003_SGE_true:
    f7_emit_char 'B'
.Lsub32_003_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q1, pattern 0; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x606e
    push16 r4
    ldi16 c0, 0x4c4f
    push16 r4
    ldi16 c0, 0x173a
    push16 r4
    ldi16 c0, 0x184b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_004_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_EQ_done
.Lsub32_004_EQ_true:
    f7_emit_char 'B'
.Lsub32_004_EQ_done:
    brne8 .Lsub32_004_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_NE_done
.Lsub32_004_NE_true:
    f7_emit_char 'B'
.Lsub32_004_NE_done:
    brult8 .Lsub32_004_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_ULT_done
.Lsub32_004_ULT_true:
    f7_emit_char 'B'
.Lsub32_004_ULT_done:
    bruge8 .Lsub32_004_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_UGE_done
.Lsub32_004_UGE_true:
    f7_emit_char 'B'
.Lsub32_004_UGE_done:
    brslt8 .Lsub32_004_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_SLT_done
.Lsub32_004_SLT_true:
    f7_emit_char 'B'
.Lsub32_004_SLT_done:
    brsge8 .Lsub32_004_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_004_SGE_done
.Lsub32_004_SGE_true:
    f7_emit_char 'B'
.Lsub32_004_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q1, pattern 1; guard q2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0xb809
    push16 r4
    ldi16 c0, 0x4c62
    push16 r4
    ldi16 c0, 0x176b
    push16 r4
    ldi16 c0, 0x187c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_005_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_EQ_done
.Lsub32_005_EQ_true:
    f7_emit_char 'B'
.Lsub32_005_EQ_done:
    brne8 .Lsub32_005_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_NE_done
.Lsub32_005_NE_true:
    f7_emit_char 'B'
.Lsub32_005_NE_done:
    brult8 .Lsub32_005_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_ULT_done
.Lsub32_005_ULT_true:
    f7_emit_char 'B'
.Lsub32_005_ULT_done:
    bruge8 .Lsub32_005_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_UGE_done
.Lsub32_005_UGE_true:
    f7_emit_char 'B'
.Lsub32_005_UGE_done:
    brslt8 .Lsub32_005_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_SLT_done
.Lsub32_005_SLT_true:
    f7_emit_char 'B'
.Lsub32_005_SLT_done:
    brsge8 .Lsub32_005_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_005_SGE_done
.Lsub32_005_SGE_true:
    f7_emit_char 'B'
.Lsub32_005_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q1, pattern 2; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x157a
    push16 r4
    ldi16 c0, 0x168b
    push16 r4
    ldi16 c0, 0x10a5
    push16 r4
    ldi16 c0, 0x4d77
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q1
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_006_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_EQ_done
.Lsub32_006_EQ_true:
    f7_emit_char 'B'
.Lsub32_006_EQ_done:
    brne8 .Lsub32_006_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_NE_done
.Lsub32_006_NE_true:
    f7_emit_char 'B'
.Lsub32_006_NE_done:
    brult8 .Lsub32_006_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_ULT_done
.Lsub32_006_ULT_true:
    f7_emit_char 'B'
.Lsub32_006_ULT_done:
    bruge8 .Lsub32_006_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_UGE_done
.Lsub32_006_UGE_true:
    f7_emit_char 'B'
.Lsub32_006_UGE_done:
    brslt8 .Lsub32_006_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_SLT_done
.Lsub32_006_SLT_true:
    f7_emit_char 'B'
.Lsub32_006_SLT_done:
    brsge8 .Lsub32_006_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_006_SGE_done
.Lsub32_006_SGE_true:
    f7_emit_char 'B'
.Lsub32_006_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q1, pattern 3; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x673f
    push16 r4
    ldi16 c0, 0x4c89
    push16 r4
    ldi16 c0, 0x17cd
    push16 r4
    ldi16 c0, 0x18de
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_007_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_EQ_done
.Lsub32_007_EQ_true:
    f7_emit_char 'B'
.Lsub32_007_EQ_done:
    brne8 .Lsub32_007_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_NE_done
.Lsub32_007_NE_true:
    f7_emit_char 'B'
.Lsub32_007_NE_done:
    brult8 .Lsub32_007_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_ULT_done
.Lsub32_007_ULT_true:
    f7_emit_char 'B'
.Lsub32_007_ULT_done:
    bruge8 .Lsub32_007_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_UGE_done
.Lsub32_007_UGE_true:
    f7_emit_char 'B'
.Lsub32_007_UGE_done:
    brslt8 .Lsub32_007_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_SLT_done
.Lsub32_007_SLT_true:
    f7_emit_char 'B'
.Lsub32_007_SLT_done:
    brsge8 .Lsub32_007_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_007_SGE_done
.Lsub32_007_SGE_true:
    f7_emit_char 'B'
.Lsub32_007_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q2, pattern 0; guard q1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0xbdd9
    push16 r4
    ldi16 c0, 0x4b9b
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x17fe
    push16 r4
    ldi16 c0, 0x190f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q2
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_008_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_EQ_done
.Lsub32_008_EQ_true:
    f7_emit_char 'B'
.Lsub32_008_EQ_done:
    brne8 .Lsub32_008_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_NE_done
.Lsub32_008_NE_true:
    f7_emit_char 'B'
.Lsub32_008_NE_done:
    brult8 .Lsub32_008_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_ULT_done
.Lsub32_008_ULT_true:
    f7_emit_char 'B'
.Lsub32_008_ULT_done:
    bruge8 .Lsub32_008_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_UGE_done
.Lsub32_008_UGE_true:
    f7_emit_char 'B'
.Lsub32_008_UGE_done:
    brslt8 .Lsub32_008_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_SLT_done
.Lsub32_008_SLT_true:
    f7_emit_char 'B'
.Lsub32_008_SLT_done:
    brsge8 .Lsub32_008_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_008_SGE_done
.Lsub32_008_SGE_true:
    f7_emit_char 'B'
.Lsub32_008_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q2, pattern 1; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x13eb
    push16 r4
    ldi16 c0, 0x14fc
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1776
    push16 r4
    ldi16 c0, 0x4db1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_009_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_EQ_done
.Lsub32_009_EQ_true:
    f7_emit_char 'B'
.Lsub32_009_EQ_done:
    brne8 .Lsub32_009_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_NE_done
.Lsub32_009_NE_true:
    f7_emit_char 'B'
.Lsub32_009_NE_done:
    brult8 .Lsub32_009_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_ULT_done
.Lsub32_009_ULT_true:
    f7_emit_char 'B'
.Lsub32_009_ULT_done:
    bruge8 .Lsub32_009_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_UGE_done
.Lsub32_009_UGE_true:
    f7_emit_char 'B'
.Lsub32_009_UGE_done:
    brslt8 .Lsub32_009_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_SLT_done
.Lsub32_009_SLT_true:
    f7_emit_char 'B'
.Lsub32_009_SLT_done:
    brsge8 .Lsub32_009_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_009_SGE_done
.Lsub32_009_SGE_true:
    f7_emit_char 'B'
.Lsub32_009_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q2, pattern 2; guard q3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x141c
    push16 r4
    ldi16 c0, 0x152d
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0x6f11
    push16 r4
    ldi16 c0, 0x4dc4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_EQ_done
.Lsub32_00a_EQ_true:
    f7_emit_char 'B'
.Lsub32_00a_EQ_done:
    brne8 .Lsub32_00a_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_NE_done
.Lsub32_00a_NE_true:
    f7_emit_char 'B'
.Lsub32_00a_NE_done:
    brult8 .Lsub32_00a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_ULT_done
.Lsub32_00a_ULT_true:
    f7_emit_char 'B'
.Lsub32_00a_ULT_done:
    bruge8 .Lsub32_00a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_UGE_done
.Lsub32_00a_UGE_true:
    f7_emit_char 'B'
.Lsub32_00a_UGE_done:
    brslt8 .Lsub32_00a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_SLT_done
.Lsub32_00a_SLT_true:
    f7_emit_char 'B'
.Lsub32_00a_SLT_done:
    brsge8 .Lsub32_00a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00a_SGE_done
.Lsub32_00a_SGE_true:
    f7_emit_char 'B'
.Lsub32_00a_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q2, pattern 3; guard q1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xc4aa
    push16 r4
    ldi16 c0, 0x4bd5
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1891
    push16 r4
    ldi16 c0, 0x19a2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q2
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_EQ_done
.Lsub32_00b_EQ_true:
    f7_emit_char 'B'
.Lsub32_00b_EQ_done:
    brne8 .Lsub32_00b_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_NE_done
.Lsub32_00b_NE_true:
    f7_emit_char 'B'
.Lsub32_00b_NE_done:
    brult8 .Lsub32_00b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_ULT_done
.Lsub32_00b_ULT_true:
    f7_emit_char 'B'
.Lsub32_00b_ULT_done:
    bruge8 .Lsub32_00b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_UGE_done
.Lsub32_00b_UGE_true:
    f7_emit_char 'B'
.Lsub32_00b_UGE_done:
    brslt8 .Lsub32_00b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_SLT_done
.Lsub32_00b_SLT_true:
    f7_emit_char 'B'
.Lsub32_00b_SLT_done:
    brsge8 .Lsub32_00b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00b_SGE_done
.Lsub32_00b_SGE_true:
    f7_emit_char 'B'
.Lsub32_00b_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q3, pattern 0; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x1c45
    push16 r4
    ldi16 c0, 0x4be9
    push16 r4
    ldi16 c0, 0x16a0
    push16 r4
    ldi16 c0, 0x17b1
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q3
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_EQ_done
.Lsub32_00c_EQ_true:
    f7_emit_char 'B'
.Lsub32_00c_EQ_done:
    brne8 .Lsub32_00c_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_NE_done
.Lsub32_00c_NE_true:
    f7_emit_char 'B'
.Lsub32_00c_NE_done:
    brult8 .Lsub32_00c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_ULT_done
.Lsub32_00c_ULT_true:
    f7_emit_char 'B'
.Lsub32_00c_ULT_done:
    bruge8 .Lsub32_00c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_UGE_done
.Lsub32_00c_UGE_true:
    f7_emit_char 'B'
.Lsub32_00c_UGE_done:
    brslt8 .Lsub32_00c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_SLT_done
.Lsub32_00c_SLT_true:
    f7_emit_char 'B'
.Lsub32_00c_SLT_done:
    brsge8 .Lsub32_00c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00c_SGE_done
.Lsub32_00c_SGE_true:
    f7_emit_char 'B'
.Lsub32_00c_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q3, pattern 1; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x14af
    push16 r4
    ldi16 c0, 0x15c0
    push16 r4
    ldi16 c0, 0x74e1
    push16 r4
    ldi16 c0, 0x4cfd
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q3
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_EQ_done
.Lsub32_00d_EQ_true:
    f7_emit_char 'B'
.Lsub32_00d_EQ_done:
    brne8 .Lsub32_00d_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_NE_done
.Lsub32_00d_NE_true:
    f7_emit_char 'B'
.Lsub32_00d_NE_done:
    brult8 .Lsub32_00d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_ULT_done
.Lsub32_00d_ULT_true:
    f7_emit_char 'B'
.Lsub32_00d_ULT_done:
    bruge8 .Lsub32_00d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_UGE_done
.Lsub32_00d_UGE_true:
    f7_emit_char 'B'
.Lsub32_00d_UGE_done:
    brslt8 .Lsub32_00d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_SLT_done
.Lsub32_00d_SLT_true:
    f7_emit_char 'B'
.Lsub32_00d_SLT_done:
    brsge8 .Lsub32_00d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00d_SGE_done
.Lsub32_00d_SGE_true:
    f7_emit_char 'B'
.Lsub32_00d_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q3, pattern 2; guard q1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xcb7b
    push16 r4
    ldi16 c0, 0x4c0f
    push16 r4
    ldi16 c0, 0x1702
    push16 r4
    ldi16 c0, 0x1813
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q3
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_EQ_done
.Lsub32_00e_EQ_true:
    f7_emit_char 'B'
.Lsub32_00e_EQ_done:
    brne8 .Lsub32_00e_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_NE_done
.Lsub32_00e_NE_true:
    f7_emit_char 'B'
.Lsub32_00e_NE_done:
    brult8 .Lsub32_00e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_ULT_done
.Lsub32_00e_ULT_true:
    f7_emit_char 'B'
.Lsub32_00e_ULT_done:
    bruge8 .Lsub32_00e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_UGE_done
.Lsub32_00e_UGE_true:
    f7_emit_char 'B'
.Lsub32_00e_UGE_done:
    brslt8 .Lsub32_00e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_SLT_done
.Lsub32_00e_SLT_true:
    f7_emit_char 'B'
.Lsub32_00e_SLT_done:
    brsge8 .Lsub32_00e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00e_SGE_done
.Lsub32_00e_SGE_true:
    f7_emit_char 'B'
.Lsub32_00e_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, qS=q3, pattern 3; guard q1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x2316
    push16 r4
    ldi16 c0, 0x4c23
    push16 r4
    ldi16 c0, 0x1733
    push16 r4
    ldi16 c0, 0x1844
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q0, q3
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_00f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_EQ_done
.Lsub32_00f_EQ_true:
    f7_emit_char 'B'
.Lsub32_00f_EQ_done:
    brne8 .Lsub32_00f_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_NE_done
.Lsub32_00f_NE_true:
    f7_emit_char 'B'
.Lsub32_00f_NE_done:
    brult8 .Lsub32_00f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_ULT_done
.Lsub32_00f_ULT_true:
    f7_emit_char 'B'
.Lsub32_00f_ULT_done:
    bruge8 .Lsub32_00f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_UGE_done
.Lsub32_00f_UGE_true:
    f7_emit_char 'B'
.Lsub32_00f_UGE_done:
    brslt8 .Lsub32_00f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_SLT_done
.Lsub32_00f_SLT_true:
    f7_emit_char 'B'
.Lsub32_00f_SLT_done:
    brsge8 .Lsub32_00f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_00f_SGE_done
.Lsub32_00f_SGE_true:
    f7_emit_char 'B'
.Lsub32_00f_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q0, pattern 0; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x7bb2
    push16 r4
    ldi16 c0, 0x4d37
    push16 r4
    ldi16 c0, 0x1986
    push16 r4
    ldi16 c0, 0x1a97
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q0
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_010_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_EQ_done
.Lsub32_010_EQ_true:
    f7_emit_char 'B'
.Lsub32_010_EQ_done:
    brne8 .Lsub32_010_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_NE_done
.Lsub32_010_NE_true:
    f7_emit_char 'B'
.Lsub32_010_NE_done:
    brult8 .Lsub32_010_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_ULT_done
.Lsub32_010_ULT_true:
    f7_emit_char 'B'
.Lsub32_010_ULT_done:
    bruge8 .Lsub32_010_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_UGE_done
.Lsub32_010_UGE_true:
    f7_emit_char 'B'
.Lsub32_010_UGE_done:
    brslt8 .Lsub32_010_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_SLT_done
.Lsub32_010_SLT_true:
    f7_emit_char 'B'
.Lsub32_010_SLT_done:
    brsge8 .Lsub32_010_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_010_SGE_done
.Lsub32_010_SGE_true:
    f7_emit_char 'B'
.Lsub32_010_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q0, pattern 1; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1795
    push16 r4
    ldi16 c0, 0x18a6
    push16 r4
    ldi16 c0, 0xd44e
    push16 r4
    ldi16 c0, 0x4e4b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q0
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_011_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_EQ_done
.Lsub32_011_EQ_true:
    f7_emit_char 'B'
.Lsub32_011_EQ_done:
    brne8 .Lsub32_011_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_NE_done
.Lsub32_011_NE_true:
    f7_emit_char 'B'
.Lsub32_011_NE_done:
    brult8 .Lsub32_011_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_ULT_done
.Lsub32_011_ULT_true:
    f7_emit_char 'B'
.Lsub32_011_ULT_done:
    bruge8 .Lsub32_011_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_UGE_done
.Lsub32_011_UGE_true:
    f7_emit_char 'B'
.Lsub32_011_UGE_done:
    brslt8 .Lsub32_011_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_SLT_done
.Lsub32_011_SLT_true:
    f7_emit_char 'B'
.Lsub32_011_SLT_done:
    brsge8 .Lsub32_011_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_011_SGE_done
.Lsub32_011_SGE_true:
    f7_emit_char 'B'
.Lsub32_011_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q0, pattern 2; guard q2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x2ae8
    push16 r4
    ldi16 c0, 0x4d5e
    push16 r4
    ldi16 c0, 0x19e8
    push16 r4
    ldi16 c0, 0x1af9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q0
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_012_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_EQ_done
.Lsub32_012_EQ_true:
    f7_emit_char 'B'
.Lsub32_012_EQ_done:
    brne8 .Lsub32_012_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_NE_done
.Lsub32_012_NE_true:
    f7_emit_char 'B'
.Lsub32_012_NE_done:
    brult8 .Lsub32_012_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_ULT_done
.Lsub32_012_ULT_true:
    f7_emit_char 'B'
.Lsub32_012_ULT_done:
    bruge8 .Lsub32_012_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_UGE_done
.Lsub32_012_UGE_true:
    f7_emit_char 'B'
.Lsub32_012_UGE_done:
    brslt8 .Lsub32_012_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_SLT_done
.Lsub32_012_SLT_true:
    f7_emit_char 'B'
.Lsub32_012_SLT_done:
    brsge8 .Lsub32_012_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_012_SGE_done
.Lsub32_012_SGE_true:
    f7_emit_char 'B'
.Lsub32_012_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q0, pattern 3; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x8283
    push16 r4
    ldi16 c0, 0x4d71
    push16 r4
    ldi16 c0, 0x1a19
    push16 r4
    ldi16 c0, 0x1b2a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q0
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_013_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_EQ_done
.Lsub32_013_EQ_true:
    f7_emit_char 'B'
.Lsub32_013_EQ_done:
    brne8 .Lsub32_013_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_NE_done
.Lsub32_013_NE_true:
    f7_emit_char 'B'
.Lsub32_013_NE_done:
    brult8 .Lsub32_013_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_ULT_done
.Lsub32_013_ULT_true:
    f7_emit_char 'B'
.Lsub32_013_ULT_done:
    bruge8 .Lsub32_013_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_UGE_done
.Lsub32_013_UGE_true:
    f7_emit_char 'B'
.Lsub32_013_UGE_done:
    brslt8 .Lsub32_013_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_SLT_done
.Lsub32_013_SLT_true:
    f7_emit_char 'B'
.Lsub32_013_SLT_done:
    brsge8 .Lsub32_013_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_013_SGE_done
.Lsub32_013_SGE_true:
    f7_emit_char 'B'
.Lsub32_013_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q1, pattern 0; guard q2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x13e4
    push16 r4
    ldi16 c0, 0x14f5
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xda1e
    push16 r4
    ldi16 c0, 0x4d84
    push16 r4
    ldi16 c0, 0x1a4a
    push16 r4
    ldi16 c0, 0x1b5b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_014_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_EQ_done
.Lsub32_014_EQ_true:
    f7_emit_char 'B'
.Lsub32_014_EQ_done:
    brne8 .Lsub32_014_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_NE_done
.Lsub32_014_NE_true:
    f7_emit_char 'B'
.Lsub32_014_NE_done:
    brult8 .Lsub32_014_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_ULT_done
.Lsub32_014_ULT_true:
    f7_emit_char 'B'
.Lsub32_014_ULT_done:
    bruge8 .Lsub32_014_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_UGE_done
.Lsub32_014_UGE_true:
    f7_emit_char 'B'
.Lsub32_014_UGE_done:
    brslt8 .Lsub32_014_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_SLT_done
.Lsub32_014_SLT_true:
    f7_emit_char 'B'
.Lsub32_014_SLT_done:
    brsge8 .Lsub32_014_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_014_SGE_done
.Lsub32_014_SGE_true:
    f7_emit_char 'B'
.Lsub32_014_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q1, pattern 1; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x1415
    push16 r4
    ldi16 c0, 0x1526
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0x1859
    push16 r4
    ldi16 c0, 0x196a
    push16 r4
    ldi16 c0, 0x32ba
    push16 r4
    ldi16 c0, 0x4e99
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q1
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_015_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_EQ_done
.Lsub32_015_EQ_true:
    f7_emit_char 'B'
.Lsub32_015_EQ_done:
    brne8 .Lsub32_015_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_NE_done
.Lsub32_015_NE_true:
    f7_emit_char 'B'
.Lsub32_015_NE_done:
    brult8 .Lsub32_015_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_ULT_done
.Lsub32_015_ULT_true:
    f7_emit_char 'B'
.Lsub32_015_ULT_done:
    bruge8 .Lsub32_015_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_UGE_done
.Lsub32_015_UGE_true:
    f7_emit_char 'B'
.Lsub32_015_UGE_done:
    brslt8 .Lsub32_015_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_SLT_done
.Lsub32_015_SLT_true:
    f7_emit_char 'B'
.Lsub32_015_SLT_done:
    brsge8 .Lsub32_015_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_015_SGE_done
.Lsub32_015_SGE_true:
    f7_emit_char 'B'
.Lsub32_015_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q1, pattern 2; guard q0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x8752
    push16 r4
    ldi16 c0, 0x4ba9
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x188a
    push16 r4
    ldi16 c0, 0x199b
    push16 r4
    ldi16 c0, 0x1aac
    push16 r4
    ldi16 c0, 0x1bbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q1
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_016_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_EQ_done
.Lsub32_016_EQ_true:
    f7_emit_char 'B'
.Lsub32_016_EQ_done:
    brne8 .Lsub32_016_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_NE_done
.Lsub32_016_NE_true:
    f7_emit_char 'B'
.Lsub32_016_NE_done:
    brult8 .Lsub32_016_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_ULT_done
.Lsub32_016_ULT_true:
    f7_emit_char 'B'
.Lsub32_016_ULT_done:
    bruge8 .Lsub32_016_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_UGE_done
.Lsub32_016_UGE_true:
    f7_emit_char 'B'
.Lsub32_016_UGE_done:
    brslt8 .Lsub32_016_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_SLT_done
.Lsub32_016_SLT_true:
    f7_emit_char 'B'
.Lsub32_016_SLT_done:
    brsge8 .Lsub32_016_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_016_SGE_done
.Lsub32_016_SGE_true:
    f7_emit_char 'B'
.Lsub32_016_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q1, pattern 3; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x1477
    push16 r4
    ldi16 c0, 0x1588
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0xe0ef
    push16 r4
    ldi16 c0, 0x4dbe
    push16 r4
    ldi16 c0, 0x1add
    push16 r4
    ldi16 c0, 0x1bee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_017_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_EQ_done
.Lsub32_017_EQ_true:
    f7_emit_char 'B'
.Lsub32_017_EQ_done:
    brne8 .Lsub32_017_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_NE_done
.Lsub32_017_NE_true:
    f7_emit_char 'B'
.Lsub32_017_NE_done:
    brult8 .Lsub32_017_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_ULT_done
.Lsub32_017_ULT_true:
    f7_emit_char 'B'
.Lsub32_017_ULT_done:
    bruge8 .Lsub32_017_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_UGE_done
.Lsub32_017_UGE_true:
    f7_emit_char 'B'
.Lsub32_017_UGE_done:
    brslt8 .Lsub32_017_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_SLT_done
.Lsub32_017_SLT_true:
    f7_emit_char 'B'
.Lsub32_017_SLT_done:
    brsge8 .Lsub32_017_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_017_SGE_done
.Lsub32_017_SGE_true:
    f7_emit_char 'B'
.Lsub32_017_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q2, pattern 0; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x14a8
    push16 r4
    ldi16 c0, 0x15b9
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x398b
    push16 r4
    ldi16 c0, 0x4ed3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_018_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_EQ_done
.Lsub32_018_EQ_true:
    f7_emit_char 'B'
.Lsub32_018_EQ_done:
    brne8 .Lsub32_018_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_NE_done
.Lsub32_018_NE_true:
    f7_emit_char 'B'
.Lsub32_018_NE_done:
    brult8 .Lsub32_018_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_ULT_done
.Lsub32_018_ULT_true:
    f7_emit_char 'B'
.Lsub32_018_ULT_done:
    bruge8 .Lsub32_018_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_UGE_done
.Lsub32_018_UGE_true:
    f7_emit_char 'B'
.Lsub32_018_UGE_done:
    brslt8 .Lsub32_018_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_SLT_done
.Lsub32_018_SLT_true:
    f7_emit_char 'B'
.Lsub32_018_SLT_done:
    brsge8 .Lsub32_018_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_018_SGE_done
.Lsub32_018_SGE_true:
    f7_emit_char 'B'
.Lsub32_018_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q2, pattern 1; guard q3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x14d9
    push16 r4
    ldi16 c0, 0x15ea
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0x9126
    push16 r4
    ldi16 c0, 0x4ee6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_019_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_EQ_done
.Lsub32_019_EQ_true:
    f7_emit_char 'B'
.Lsub32_019_EQ_done:
    brne8 .Lsub32_019_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_NE_done
.Lsub32_019_NE_true:
    f7_emit_char 'B'
.Lsub32_019_NE_done:
    brult8 .Lsub32_019_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_ULT_done
.Lsub32_019_ULT_true:
    f7_emit_char 'B'
.Lsub32_019_ULT_done:
    bruge8 .Lsub32_019_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_UGE_done
.Lsub32_019_UGE_true:
    f7_emit_char 'B'
.Lsub32_019_UGE_done:
    brslt8 .Lsub32_019_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_SLT_done
.Lsub32_019_SLT_true:
    f7_emit_char 'B'
.Lsub32_019_SLT_done:
    brsge8 .Lsub32_019_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_019_SGE_done
.Lsub32_019_SGE_true:
    f7_emit_char 'B'
.Lsub32_019_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q2, pattern 2; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0xe5be
    push16 r4
    ldi16 c0, 0x4bf6
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1b70
    push16 r4
    ldi16 c0, 0x1c81
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_EQ_done
.Lsub32_01a_EQ_true:
    f7_emit_char 'B'
.Lsub32_01a_EQ_done:
    brne8 .Lsub32_01a_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_NE_done
.Lsub32_01a_NE_true:
    f7_emit_char 'B'
.Lsub32_01a_NE_done:
    brult8 .Lsub32_01a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_ULT_done
.Lsub32_01a_ULT_true:
    f7_emit_char 'B'
.Lsub32_01a_ULT_done:
    bruge8 .Lsub32_01a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_UGE_done
.Lsub32_01a_UGE_true:
    f7_emit_char 'B'
.Lsub32_01a_UGE_done:
    brslt8 .Lsub32_01a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_SLT_done
.Lsub32_01a_SLT_true:
    f7_emit_char 'B'
.Lsub32_01a_SLT_done:
    brsge8 .Lsub32_01a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01a_SGE_done
.Lsub32_01a_SGE_true:
    f7_emit_char 'B'
.Lsub32_01a_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q2, pattern 3; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x153b
    push16 r4
    ldi16 c0, 0x164c
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x405c
    push16 r4
    ldi16 c0, 0x4f0d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_EQ_done
.Lsub32_01b_EQ_true:
    f7_emit_char 'B'
.Lsub32_01b_EQ_done:
    brne8 .Lsub32_01b_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_NE_done
.Lsub32_01b_NE_true:
    f7_emit_char 'B'
.Lsub32_01b_NE_done:
    brult8 .Lsub32_01b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_ULT_done
.Lsub32_01b_ULT_true:
    f7_emit_char 'B'
.Lsub32_01b_ULT_done:
    bruge8 .Lsub32_01b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_UGE_done
.Lsub32_01b_UGE_true:
    f7_emit_char 'B'
.Lsub32_01b_UGE_done:
    brslt8 .Lsub32_01b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_SLT_done
.Lsub32_01b_SLT_true:
    f7_emit_char 'B'
.Lsub32_01b_SLT_done:
    brsge8 .Lsub32_01b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01b_SGE_done
.Lsub32_01b_SGE_true:
    f7_emit_char 'B'
.Lsub32_01b_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q3, pattern 0; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x156c
    push16 r4
    ldi16 c0, 0x167d
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0x96f6
    push16 r4
    ldi16 c0, 0x4e1f
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q3
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_EQ_done
.Lsub32_01c_EQ_true:
    f7_emit_char 'B'
.Lsub32_01c_EQ_done:
    brne8 .Lsub32_01c_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_NE_done
.Lsub32_01c_NE_true:
    f7_emit_char 'B'
.Lsub32_01c_NE_done:
    brult8 .Lsub32_01c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_ULT_done
.Lsub32_01c_ULT_true:
    f7_emit_char 'B'
.Lsub32_01c_ULT_done:
    bruge8 .Lsub32_01c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_UGE_done
.Lsub32_01c_UGE_true:
    f7_emit_char 'B'
.Lsub32_01c_UGE_done:
    brslt8 .Lsub32_01c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_SLT_done
.Lsub32_01c_SLT_true:
    f7_emit_char 'B'
.Lsub32_01c_SLT_done:
    brsge8 .Lsub32_01c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01c_SGE_done
.Lsub32_01c_SGE_true:
    f7_emit_char 'B'
.Lsub32_01c_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q3, pattern 1; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0xec8f
    push16 r4
    ldi16 c0, 0x4c30
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x19e1
    push16 r4
    ldi16 c0, 0x1af2
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_EQ_done
.Lsub32_01d_EQ_true:
    f7_emit_char 'B'
.Lsub32_01d_EQ_done:
    brne8 .Lsub32_01d_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_NE_done
.Lsub32_01d_NE_true:
    f7_emit_char 'B'
.Lsub32_01d_NE_done:
    brult8 .Lsub32_01d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_ULT_done
.Lsub32_01d_ULT_true:
    f7_emit_char 'B'
.Lsub32_01d_ULT_done:
    bruge8 .Lsub32_01d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_UGE_done
.Lsub32_01d_UGE_true:
    f7_emit_char 'B'
.Lsub32_01d_UGE_done:
    brslt8 .Lsub32_01d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_SLT_done
.Lsub32_01d_SLT_true:
    f7_emit_char 'B'
.Lsub32_01d_SLT_done:
    brsge8 .Lsub32_01d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01d_SGE_done
.Lsub32_01d_SGE_true:
    f7_emit_char 'B'
.Lsub32_01d_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q3, pattern 2; guard q0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x442a
    push16 r4
    ldi16 c0, 0x4c44
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x1a12
    push16 r4
    ldi16 c0, 0x1b23
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_EQ_done
.Lsub32_01e_EQ_true:
    f7_emit_char 'B'
.Lsub32_01e_EQ_done:
    brne8 .Lsub32_01e_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_NE_done
.Lsub32_01e_NE_true:
    f7_emit_char 'B'
.Lsub32_01e_NE_done:
    brult8 .Lsub32_01e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_ULT_done
.Lsub32_01e_ULT_true:
    f7_emit_char 'B'
.Lsub32_01e_ULT_done:
    bruge8 .Lsub32_01e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_UGE_done
.Lsub32_01e_UGE_true:
    f7_emit_char 'B'
.Lsub32_01e_UGE_done:
    brslt8 .Lsub32_01e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_SLT_done
.Lsub32_01e_SLT_true:
    f7_emit_char 'B'
.Lsub32_01e_SLT_done:
    brsge8 .Lsub32_01e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01e_SGE_done
.Lsub32_01e_SGE_true:
    f7_emit_char 'B'
.Lsub32_01e_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, qS=q3, pattern 3; guard q2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x15ff
    push16 r4
    ldi16 c0, 0x1710
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x9dc7
    push16 r4
    ldi16 c0, 0x4e59
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q1, q3
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_01f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_EQ_done
.Lsub32_01f_EQ_true:
    f7_emit_char 'B'
.Lsub32_01f_EQ_done:
    brne8 .Lsub32_01f_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_NE_done
.Lsub32_01f_NE_true:
    f7_emit_char 'B'
.Lsub32_01f_NE_done:
    brult8 .Lsub32_01f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_ULT_done
.Lsub32_01f_ULT_true:
    f7_emit_char 'B'
.Lsub32_01f_ULT_done:
    bruge8 .Lsub32_01f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_UGE_done
.Lsub32_01f_UGE_true:
    f7_emit_char 'B'
.Lsub32_01f_UGE_done:
    brslt8 .Lsub32_01f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_SLT_done
.Lsub32_01f_SLT_true:
    f7_emit_char 'B'
.Lsub32_01f_SLT_done:
    brsge8 .Lsub32_01f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_01f_SGE_done
.Lsub32_01f_SGE_true:
    f7_emit_char 'B'
.Lsub32_01f_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q0, pattern 0; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0x1852
    push16 r4
    ldi16 c0, 0x1963
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0xf663
    push16 r4
    ldi16 c0, 0x4f6d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q0
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_020_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_EQ_done
.Lsub32_020_EQ_true:
    f7_emit_char 'B'
.Lsub32_020_EQ_done:
    brne8 .Lsub32_020_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_NE_done
.Lsub32_020_NE_true:
    f7_emit_char 'B'
.Lsub32_020_NE_done:
    brult8 .Lsub32_020_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_ULT_done
.Lsub32_020_ULT_true:
    f7_emit_char 'B'
.Lsub32_020_ULT_done:
    bruge8 .Lsub32_020_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_UGE_done
.Lsub32_020_UGE_true:
    f7_emit_char 'B'
.Lsub32_020_UGE_done:
    brslt8 .Lsub32_020_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_SLT_done
.Lsub32_020_SLT_true:
    f7_emit_char 'B'
.Lsub32_020_SLT_done:
    brsge8 .Lsub32_020_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_020_SGE_done
.Lsub32_020_SGE_true:
    f7_emit_char 'B'
.Lsub32_020_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q0, pattern 1; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x4bfc
    push16 r4
    ldi16 c0, 0x4d7f
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1cc7
    push16 r4
    ldi16 c0, 0x1dd8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_021_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_EQ_done
.Lsub32_021_EQ_true:
    f7_emit_char 'B'
.Lsub32_021_EQ_done:
    brne8 .Lsub32_021_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_NE_done
.Lsub32_021_NE_true:
    f7_emit_char 'B'
.Lsub32_021_NE_done:
    brult8 .Lsub32_021_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_ULT_done
.Lsub32_021_ULT_true:
    f7_emit_char 'B'
.Lsub32_021_ULT_done:
    bruge8 .Lsub32_021_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_UGE_done
.Lsub32_021_UGE_true:
    f7_emit_char 'B'
.Lsub32_021_UGE_done:
    brslt8 .Lsub32_021_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_SLT_done
.Lsub32_021_SLT_true:
    f7_emit_char 'B'
.Lsub32_021_SLT_done:
    brsge8 .Lsub32_021_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_021_SGE_done
.Lsub32_021_SGE_true:
    f7_emit_char 'B'
.Lsub32_021_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q0, pattern 2; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xa397
    push16 r4
    ldi16 c0, 0x4d92
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0x1cf8
    push16 r4
    ldi16 c0, 0x1e09
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_022_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_EQ_done
.Lsub32_022_EQ_true:
    f7_emit_char 'B'
.Lsub32_022_EQ_done:
    brne8 .Lsub32_022_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_NE_done
.Lsub32_022_NE_true:
    f7_emit_char 'B'
.Lsub32_022_NE_done:
    brult8 .Lsub32_022_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_ULT_done
.Lsub32_022_ULT_true:
    f7_emit_char 'B'
.Lsub32_022_ULT_done:
    bruge8 .Lsub32_022_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_UGE_done
.Lsub32_022_UGE_true:
    f7_emit_char 'B'
.Lsub32_022_UGE_done:
    brslt8 .Lsub32_022_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_SLT_done
.Lsub32_022_SLT_true:
    f7_emit_char 'B'
.Lsub32_022_SLT_done:
    brsge8 .Lsub32_022_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_022_SGE_done
.Lsub32_022_SGE_true:
    f7_emit_char 'B'
.Lsub32_022_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q0, pattern 3; guard q3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x18e5
    push16 r4
    ldi16 c0, 0x19f6
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0xfd34
    push16 r4
    ldi16 c0, 0x4fa7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q0
    push16 r7
    push16 r6
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_023_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_EQ_done
.Lsub32_023_EQ_true:
    f7_emit_char 'B'
.Lsub32_023_EQ_done:
    brne8 .Lsub32_023_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_NE_done
.Lsub32_023_NE_true:
    f7_emit_char 'B'
.Lsub32_023_NE_done:
    brult8 .Lsub32_023_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_ULT_done
.Lsub32_023_ULT_true:
    f7_emit_char 'B'
.Lsub32_023_ULT_done:
    bruge8 .Lsub32_023_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_UGE_done
.Lsub32_023_UGE_true:
    f7_emit_char 'B'
.Lsub32_023_UGE_done:
    brslt8 .Lsub32_023_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_SLT_done
.Lsub32_023_SLT_true:
    f7_emit_char 'B'
.Lsub32_023_SLT_done:
    brsge8 .Lsub32_023_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_023_SGE_done
.Lsub32_023_SGE_true:
    f7_emit_char 'B'
.Lsub32_023_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q1, pattern 0; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x16f4
    push16 r4
    ldi16 c0, 0x1805
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x54cf
    push16 r4
    ldi16 c0, 0x4fbb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q1
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_024_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_EQ_done
.Lsub32_024_EQ_true:
    f7_emit_char 'B'
.Lsub32_024_EQ_done:
    brne8 .Lsub32_024_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_NE_done
.Lsub32_024_NE_true:
    f7_emit_char 'B'
.Lsub32_024_NE_done:
    brult8 .Lsub32_024_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_ULT_done
.Lsub32_024_ULT_true:
    f7_emit_char 'B'
.Lsub32_024_ULT_done:
    bruge8 .Lsub32_024_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_UGE_done
.Lsub32_024_UGE_true:
    f7_emit_char 'B'
.Lsub32_024_UGE_done:
    brslt8 .Lsub32_024_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_SLT_done
.Lsub32_024_SLT_true:
    f7_emit_char 'B'
.Lsub32_024_SLT_done:
    brsge8 .Lsub32_024_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_024_SGE_done
.Lsub32_024_SGE_true:
    f7_emit_char 'B'
.Lsub32_024_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q1, pattern 1; guard q0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0xa967
    push16 r4
    ldi16 c0, 0x4ccb
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1d8b
    push16 r4
    ldi16 c0, 0x1e9c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q1
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_025_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_EQ_done
.Lsub32_025_EQ_true:
    f7_emit_char 'B'
.Lsub32_025_EQ_done:
    brne8 .Lsub32_025_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_NE_done
.Lsub32_025_NE_true:
    f7_emit_char 'B'
.Lsub32_025_NE_done:
    brult8 .Lsub32_025_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_ULT_done
.Lsub32_025_ULT_true:
    f7_emit_char 'B'
.Lsub32_025_ULT_done:
    bruge8 .Lsub32_025_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_UGE_done
.Lsub32_025_UGE_true:
    f7_emit_char 'B'
.Lsub32_025_UGE_done:
    brslt8 .Lsub32_025_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_SLT_done
.Lsub32_025_SLT_true:
    f7_emit_char 'B'
.Lsub32_025_SLT_done:
    brsge8 .Lsub32_025_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_025_SGE_done
.Lsub32_025_SGE_true:
    f7_emit_char 'B'
.Lsub32_025_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q1, pattern 2; guard q3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x1756
    push16 r4
    ldi16 c0, 0x1867
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x0405
    push16 r4
    ldi16 c0, 0x4fe2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q1
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_026_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_EQ_done
.Lsub32_026_EQ_true:
    f7_emit_char 'B'
.Lsub32_026_EQ_done:
    brne8 .Lsub32_026_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_NE_done
.Lsub32_026_NE_true:
    f7_emit_char 'B'
.Lsub32_026_NE_done:
    brult8 .Lsub32_026_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_ULT_done
.Lsub32_026_ULT_true:
    f7_emit_char 'B'
.Lsub32_026_ULT_done:
    bruge8 .Lsub32_026_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_UGE_done
.Lsub32_026_UGE_true:
    f7_emit_char 'B'
.Lsub32_026_UGE_done:
    brslt8 .Lsub32_026_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_SLT_done
.Lsub32_026_SLT_true:
    f7_emit_char 'B'
.Lsub32_026_SLT_done:
    brsge8 .Lsub32_026_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_026_SGE_done
.Lsub32_026_SGE_true:
    f7_emit_char 'B'
.Lsub32_026_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q1, pattern 3; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x1787
    push16 r4
    ldi16 c0, 0x1898
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x5ba0
    push16 r4
    ldi16 c0, 0x4ff5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q1
    push16 r7
    push16 r6
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_027_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_EQ_done
.Lsub32_027_EQ_true:
    f7_emit_char 'B'
.Lsub32_027_EQ_done:
    brne8 .Lsub32_027_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_NE_done
.Lsub32_027_NE_true:
    f7_emit_char 'B'
.Lsub32_027_NE_done:
    brult8 .Lsub32_027_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_ULT_done
.Lsub32_027_ULT_true:
    f7_emit_char 'B'
.Lsub32_027_ULT_done:
    bruge8 .Lsub32_027_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_UGE_done
.Lsub32_027_UGE_true:
    f7_emit_char 'B'
.Lsub32_027_UGE_done:
    brslt8 .Lsub32_027_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_SLT_done
.Lsub32_027_SLT_true:
    f7_emit_char 'B'
.Lsub32_027_SLT_done:
    brsge8 .Lsub32_027_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_027_SGE_done
.Lsub32_027_SGE_true:
    f7_emit_char 'B'
.Lsub32_027_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q2, pattern 0; guard q3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x17b8
    push16 r4
    ldi16 c0, 0x18c9
    push16 r4
    ldi16 c0, 0x19da
    push16 r4
    ldi16 c0, 0x1aeb
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xb33b
    push16 r4
    ldi16 c0, 0x5008
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_028_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_EQ_done
.Lsub32_028_EQ_true:
    f7_emit_char 'B'
.Lsub32_028_EQ_done:
    brne8 .Lsub32_028_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_NE_done
.Lsub32_028_NE_true:
    f7_emit_char 'B'
.Lsub32_028_NE_done:
    brult8 .Lsub32_028_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_ULT_done
.Lsub32_028_ULT_true:
    f7_emit_char 'B'
.Lsub32_028_ULT_done:
    bruge8 .Lsub32_028_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_UGE_done
.Lsub32_028_UGE_true:
    f7_emit_char 'B'
.Lsub32_028_UGE_done:
    brslt8 .Lsub32_028_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_SLT_done
.Lsub32_028_SLT_true:
    f7_emit_char 'B'
.Lsub32_028_SLT_done:
    brsge8 .Lsub32_028_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_028_SGE_done
.Lsub32_028_SGE_true:
    f7_emit_char 'B'
.Lsub32_028_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q2, pattern 1; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x07d3
    push16 r4
    ldi16 c0, 0x4d19
    push16 r4
    ldi16 c0, 0x1a0b
    push16 r4
    ldi16 c0, 0x1b1c
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    ldi16 c0, 0x1e4f
    push16 r4
    ldi16 c0, 0x1f60
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_029_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_EQ_done
.Lsub32_029_EQ_true:
    f7_emit_char 'B'
.Lsub32_029_EQ_done:
    brne8 .Lsub32_029_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_NE_done
.Lsub32_029_NE_true:
    f7_emit_char 'B'
.Lsub32_029_NE_done:
    brult8 .Lsub32_029_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_ULT_done
.Lsub32_029_ULT_true:
    f7_emit_char 'B'
.Lsub32_029_ULT_done:
    bruge8 .Lsub32_029_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_UGE_done
.Lsub32_029_UGE_true:
    f7_emit_char 'B'
.Lsub32_029_UGE_done:
    brslt8 .Lsub32_029_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_SLT_done
.Lsub32_029_SLT_true:
    f7_emit_char 'B'
.Lsub32_029_SLT_done:
    brsge8 .Lsub32_029_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_029_SGE_done
.Lsub32_029_SGE_true:
    f7_emit_char 'B'
.Lsub32_029_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q2, pattern 2; guard q1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x181a
    push16 r4
    ldi16 c0, 0x192b
    push16 r4
    ldi16 c0, 0x606f
    push16 r4
    ldi16 c0, 0x4e2d
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x1e80
    push16 r4
    ldi16 c0, 0x1f91
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q2
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_EQ_done
.Lsub32_02a_EQ_true:
    f7_emit_char 'B'
.Lsub32_02a_EQ_done:
    brne8 .Lsub32_02a_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_NE_done
.Lsub32_02a_NE_true:
    f7_emit_char 'B'
.Lsub32_02a_NE_done:
    brult8 .Lsub32_02a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_ULT_done
.Lsub32_02a_ULT_true:
    f7_emit_char 'B'
.Lsub32_02a_ULT_done:
    bruge8 .Lsub32_02a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_UGE_done
.Lsub32_02a_UGE_true:
    f7_emit_char 'B'
.Lsub32_02a_UGE_done:
    brslt8 .Lsub32_02a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_SLT_done
.Lsub32_02a_SLT_true:
    f7_emit_char 'B'
.Lsub32_02a_SLT_done:
    brsge8 .Lsub32_02a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02a_SGE_done
.Lsub32_02a_SGE_true:
    f7_emit_char 'B'
.Lsub32_02a_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q2, pattern 3; guard q3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x184b
    push16 r4
    ldi16 c0, 0x195c
    push16 r4
    ldi16 c0, 0x1a6d
    push16 r4
    ldi16 c0, 0x1b7e
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0xba0c
    push16 r4
    ldi16 c0, 0x5042
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_EQ_done
.Lsub32_02b_EQ_true:
    f7_emit_char 'B'
.Lsub32_02b_EQ_done:
    brne8 .Lsub32_02b_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_NE_done
.Lsub32_02b_NE_true:
    f7_emit_char 'B'
.Lsub32_02b_NE_done:
    brult8 .Lsub32_02b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_ULT_done
.Lsub32_02b_ULT_true:
    f7_emit_char 'B'
.Lsub32_02b_ULT_done:
    bruge8 .Lsub32_02b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_UGE_done
.Lsub32_02b_UGE_true:
    f7_emit_char 'B'
.Lsub32_02b_UGE_done:
    brslt8 .Lsub32_02b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_SLT_done
.Lsub32_02b_SLT_true:
    f7_emit_char 'B'
.Lsub32_02b_SLT_done:
    brsge8 .Lsub32_02b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02b_SGE_done
.Lsub32_02b_SGE_true:
    f7_emit_char 'B'
.Lsub32_02b_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q3, pattern 0; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0ea4
    push16 r4
    ldi16 c0, 0x4d53
    push16 r4
    ldi16 c0, 0x1a9e
    push16 r4
    ldi16 c0, 0x1baf
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_EQ_done
.Lsub32_02c_EQ_true:
    f7_emit_char 'B'
.Lsub32_02c_EQ_done:
    brne8 .Lsub32_02c_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_NE_done
.Lsub32_02c_NE_true:
    f7_emit_char 'B'
.Lsub32_02c_NE_done:
    brult8 .Lsub32_02c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_ULT_done
.Lsub32_02c_ULT_true:
    f7_emit_char 'B'
.Lsub32_02c_ULT_done:
    bruge8 .Lsub32_02c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_UGE_done
.Lsub32_02c_UGE_true:
    f7_emit_char 'B'
.Lsub32_02c_UGE_done:
    brslt8 .Lsub32_02c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_SLT_done
.Lsub32_02c_SLT_true:
    f7_emit_char 'B'
.Lsub32_02c_SLT_done:
    brsge8 .Lsub32_02c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02c_SGE_done
.Lsub32_02c_SGE_true:
    f7_emit_char 'B'
.Lsub32_02c_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q3, pattern 1; guard q0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x663f
    push16 r4
    ldi16 c0, 0x4d66
    push16 r4
    ldi16 c0, 0x1acf
    push16 r4
    ldi16 c0, 0x1be0
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_EQ_done
.Lsub32_02d_EQ_true:
    f7_emit_char 'B'
.Lsub32_02d_EQ_done:
    brne8 .Lsub32_02d_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_NE_done
.Lsub32_02d_NE_true:
    f7_emit_char 'B'
.Lsub32_02d_NE_done:
    brult8 .Lsub32_02d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_ULT_done
.Lsub32_02d_ULT_true:
    f7_emit_char 'B'
.Lsub32_02d_ULT_done:
    bruge8 .Lsub32_02d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_UGE_done
.Lsub32_02d_UGE_true:
    f7_emit_char 'B'
.Lsub32_02d_UGE_done:
    brslt8 .Lsub32_02d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_SLT_done
.Lsub32_02d_SLT_true:
    f7_emit_char 'B'
.Lsub32_02d_SLT_done:
    brsge8 .Lsub32_02d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02d_SGE_done
.Lsub32_02d_SGE_true:
    f7_emit_char 'B'
.Lsub32_02d_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q3, pattern 2; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x18de
    push16 r4
    ldi16 c0, 0x19ef
    push16 r4
    ldi16 c0, 0xbedb
    push16 r4
    ldi16 c0, 0x4e7a
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q3
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_EQ_done
.Lsub32_02e_EQ_true:
    f7_emit_char 'B'
.Lsub32_02e_EQ_done:
    brne8 .Lsub32_02e_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_NE_done
.Lsub32_02e_NE_true:
    f7_emit_char 'B'
.Lsub32_02e_NE_done:
    brult8 .Lsub32_02e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_ULT_done
.Lsub32_02e_ULT_true:
    f7_emit_char 'B'
.Lsub32_02e_ULT_done:
    bruge8 .Lsub32_02e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_UGE_done
.Lsub32_02e_UGE_true:
    f7_emit_char 'B'
.Lsub32_02e_UGE_done:
    brslt8 .Lsub32_02e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_SLT_done
.Lsub32_02e_SLT_true:
    f7_emit_char 'B'
.Lsub32_02e_SLT_done:
    brsge8 .Lsub32_02e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02e_SGE_done
.Lsub32_02e_SGE_true:
    f7_emit_char 'B'
.Lsub32_02e_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, qS=q3, pattern 3; guard q0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x1575
    push16 r4
    ldi16 c0, 0x4d8d
    push16 r4
    ldi16 c0, 0x1b31
    push16 r4
    ldi16 c0, 0x1c42
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q2, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_02f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_EQ_done
.Lsub32_02f_EQ_true:
    f7_emit_char 'B'
.Lsub32_02f_EQ_done:
    brne8 .Lsub32_02f_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_NE_done
.Lsub32_02f_NE_true:
    f7_emit_char 'B'
.Lsub32_02f_NE_done:
    brult8 .Lsub32_02f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_ULT_done
.Lsub32_02f_ULT_true:
    f7_emit_char 'B'
.Lsub32_02f_ULT_done:
    bruge8 .Lsub32_02f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_UGE_done
.Lsub32_02f_UGE_true:
    f7_emit_char 'B'
.Lsub32_02f_UGE_done:
    brslt8 .Lsub32_02f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_SLT_done
.Lsub32_02f_SLT_true:
    f7_emit_char 'B'
.Lsub32_02f_SLT_done:
    brsge8 .Lsub32_02f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_02f_SGE_done
.Lsub32_02f_SGE_true:
    f7_emit_char 'B'
.Lsub32_02f_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q0, pattern 0; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x6e11
    push16 r4
    ldi16 c0, 0x4ea1
    push16 r4
    ldi16 c0, 0x1d84
    push16 r4
    ldi16 c0, 0x1e95
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_030_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_EQ_done
.Lsub32_030_EQ_true:
    f7_emit_char 'B'
.Lsub32_030_EQ_done:
    brne8 .Lsub32_030_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_NE_done
.Lsub32_030_NE_true:
    f7_emit_char 'B'
.Lsub32_030_NE_done:
    brult8 .Lsub32_030_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_ULT_done
.Lsub32_030_ULT_true:
    f7_emit_char 'B'
.Lsub32_030_ULT_done:
    bruge8 .Lsub32_030_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_UGE_done
.Lsub32_030_UGE_true:
    f7_emit_char 'B'
.Lsub32_030_UGE_done:
    brslt8 .Lsub32_030_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_SLT_done
.Lsub32_030_SLT_true:
    f7_emit_char 'B'
.Lsub32_030_SLT_done:
    brsge8 .Lsub32_030_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_030_SGE_done
.Lsub32_030_SGE_true:
    f7_emit_char 'B'
.Lsub32_030_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q0, pattern 1; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0xc5ac
    push16 r4
    ldi16 c0, 0x4eb4
    push16 r4
    ldi16 c0, 0x1db5
    push16 r4
    ldi16 c0, 0x1ec6
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_031_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_EQ_done
.Lsub32_031_EQ_true:
    f7_emit_char 'B'
.Lsub32_031_EQ_done:
    brne8 .Lsub32_031_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_NE_done
.Lsub32_031_NE_true:
    f7_emit_char 'B'
.Lsub32_031_NE_done:
    brult8 .Lsub32_031_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_ULT_done
.Lsub32_031_ULT_true:
    f7_emit_char 'B'
.Lsub32_031_ULT_done:
    bruge8 .Lsub32_031_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_UGE_done
.Lsub32_031_UGE_true:
    f7_emit_char 'B'
.Lsub32_031_UGE_done:
    brslt8 .Lsub32_031_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_SLT_done
.Lsub32_031_SLT_true:
    f7_emit_char 'B'
.Lsub32_031_SLT_done:
    brsge8 .Lsub32_031_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_031_SGE_done
.Lsub32_031_SGE_true:
    f7_emit_char 'B'
.Lsub32_031_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q0, pattern 2; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x1bc4
    push16 r4
    ldi16 c0, 0x1cd5
    push16 r4
    ldi16 c0, 0x1e48
    push16 r4
    ldi16 c0, 0x4fc9
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q0
    push16 r5
    push16 r4
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_032_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_EQ_done
.Lsub32_032_EQ_true:
    f7_emit_char 'B'
.Lsub32_032_EQ_done:
    brne8 .Lsub32_032_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_NE_done
.Lsub32_032_NE_true:
    f7_emit_char 'B'
.Lsub32_032_NE_done:
    brult8 .Lsub32_032_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_ULT_done
.Lsub32_032_ULT_true:
    f7_emit_char 'B'
.Lsub32_032_ULT_done:
    bruge8 .Lsub32_032_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_UGE_done
.Lsub32_032_UGE_true:
    f7_emit_char 'B'
.Lsub32_032_UGE_done:
    brslt8 .Lsub32_032_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_SLT_done
.Lsub32_032_SLT_true:
    f7_emit_char 'B'
.Lsub32_032_SLT_done:
    brsge8 .Lsub32_032_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_032_SGE_done
.Lsub32_032_SGE_true:
    f7_emit_char 'B'
.Lsub32_032_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q0, pattern 3; guard q1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0x74e2
    push16 r4
    ldi16 c0, 0x4edb
    push16 r4
    ldi16 c0, 0x1e17
    push16 r4
    ldi16 c0, 0x1f28
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q0
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_033_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_EQ_done
.Lsub32_033_EQ_true:
    f7_emit_char 'B'
.Lsub32_033_EQ_done:
    brne8 .Lsub32_033_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_NE_done
.Lsub32_033_NE_true:
    f7_emit_char 'B'
.Lsub32_033_NE_done:
    brult8 .Lsub32_033_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_ULT_done
.Lsub32_033_ULT_true:
    f7_emit_char 'B'
.Lsub32_033_ULT_done:
    bruge8 .Lsub32_033_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_UGE_done
.Lsub32_033_UGE_true:
    f7_emit_char 'B'
.Lsub32_033_UGE_done:
    brslt8 .Lsub32_033_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_SLT_done
.Lsub32_033_SLT_true:
    f7_emit_char 'B'
.Lsub32_033_SLT_done:
    brsge8 .Lsub32_033_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_033_SGE_done
.Lsub32_033_SGE_true:
    f7_emit_char 'B'
.Lsub32_033_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q1, pattern 0; guard q0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0xcb7c
    push16 r4
    ldi16 c0, 0x4ded
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0x1e48
    push16 r4
    ldi16 c0, 0x1f59
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q1
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_034_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_EQ_done
.Lsub32_034_EQ_true:
    f7_emit_char 'B'
.Lsub32_034_EQ_done:
    brne8 .Lsub32_034_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_NE_done
.Lsub32_034_NE_true:
    f7_emit_char 'B'
.Lsub32_034_NE_done:
    brult8 .Lsub32_034_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_ULT_done
.Lsub32_034_ULT_true:
    f7_emit_char 'B'
.Lsub32_034_ULT_done:
    bruge8 .Lsub32_034_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_UGE_done
.Lsub32_034_UGE_true:
    f7_emit_char 'B'
.Lsub32_034_UGE_done:
    brslt8 .Lsub32_034_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_SLT_done
.Lsub32_034_SLT_true:
    f7_emit_char 'B'
.Lsub32_034_SLT_done:
    brsge8 .Lsub32_034_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_034_SGE_done
.Lsub32_034_SGE_true:
    f7_emit_char 'B'
.Lsub32_034_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q1, pattern 1; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x1a35
    push16 r4
    ldi16 c0, 0x1b46
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x2519
    push16 r4
    ldi16 c0, 0x5003
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_035_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_EQ_done
.Lsub32_035_EQ_true:
    f7_emit_char 'B'
.Lsub32_035_EQ_done:
    brne8 .Lsub32_035_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_NE_done
.Lsub32_035_NE_true:
    f7_emit_char 'B'
.Lsub32_035_NE_done:
    brult8 .Lsub32_035_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_ULT_done
.Lsub32_035_ULT_true:
    f7_emit_char 'B'
.Lsub32_035_ULT_done:
    bruge8 .Lsub32_035_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_UGE_done
.Lsub32_035_UGE_true:
    f7_emit_char 'B'
.Lsub32_035_UGE_done:
    brslt8 .Lsub32_035_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_SLT_done
.Lsub32_035_SLT_true:
    f7_emit_char 'B'
.Lsub32_035_SLT_done:
    brsge8 .Lsub32_035_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_035_SGE_done
.Lsub32_035_SGE_true:
    f7_emit_char 'B'
.Lsub32_035_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q1, pattern 2; guard q2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x1a66
    push16 r4
    ldi16 c0, 0x1b77
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x7cb4
    push16 r4
    ldi16 c0, 0x5016
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q1
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_036_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_EQ_done
.Lsub32_036_EQ_true:
    f7_emit_char 'B'
.Lsub32_036_EQ_done:
    brne8 .Lsub32_036_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_NE_done
.Lsub32_036_NE_true:
    f7_emit_char 'B'
.Lsub32_036_NE_done:
    brult8 .Lsub32_036_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_ULT_done
.Lsub32_036_ULT_true:
    f7_emit_char 'B'
.Lsub32_036_ULT_done:
    bruge8 .Lsub32_036_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_UGE_done
.Lsub32_036_UGE_true:
    f7_emit_char 'B'
.Lsub32_036_UGE_done:
    brslt8 .Lsub32_036_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_SLT_done
.Lsub32_036_SLT_true:
    f7_emit_char 'B'
.Lsub32_036_SLT_done:
    brsge8 .Lsub32_036_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_036_SGE_done
.Lsub32_036_SGE_true:
    f7_emit_char 'B'
.Lsub32_036_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q1, pattern 3; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0xd24d
    push16 r4
    ldi16 c0, 0x4e27
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1edb
    push16 r4
    ldi16 c0, 0x1fec
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q1
    push16 r1
    push16 r0
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_037_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_EQ_done
.Lsub32_037_EQ_true:
    f7_emit_char 'B'
.Lsub32_037_EQ_done:
    brne8 .Lsub32_037_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_NE_done
.Lsub32_037_NE_true:
    f7_emit_char 'B'
.Lsub32_037_NE_done:
    brult8 .Lsub32_037_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_ULT_done
.Lsub32_037_ULT_true:
    f7_emit_char 'B'
.Lsub32_037_ULT_done:
    bruge8 .Lsub32_037_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_UGE_done
.Lsub32_037_UGE_true:
    f7_emit_char 'B'
.Lsub32_037_UGE_done:
    brslt8 .Lsub32_037_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_SLT_done
.Lsub32_037_SLT_true:
    f7_emit_char 'B'
.Lsub32_037_SLT_done:
    brsge8 .Lsub32_037_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_037_SGE_done
.Lsub32_037_SGE_true:
    f7_emit_char 'B'
.Lsub32_037_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q2, pattern 0; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x29e8
    push16 r4
    ldi16 c0, 0x4e3b
    push16 r4
    ldi16 c0, 0x1cea
    push16 r4
    ldi16 c0, 0x1dfb
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_038_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_EQ_done
.Lsub32_038_EQ_true:
    f7_emit_char 'B'
.Lsub32_038_EQ_done:
    brne8 .Lsub32_038_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_NE_done
.Lsub32_038_NE_true:
    f7_emit_char 'B'
.Lsub32_038_NE_done:
    brult8 .Lsub32_038_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_ULT_done
.Lsub32_038_ULT_true:
    f7_emit_char 'B'
.Lsub32_038_ULT_done:
    bruge8 .Lsub32_038_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_UGE_done
.Lsub32_038_UGE_true:
    f7_emit_char 'B'
.Lsub32_038_UGE_done:
    brslt8 .Lsub32_038_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_SLT_done
.Lsub32_038_SLT_true:
    f7_emit_char 'B'
.Lsub32_038_SLT_done:
    brsge8 .Lsub32_038_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_038_SGE_done
.Lsub32_038_SGE_true:
    f7_emit_char 'B'
.Lsub32_038_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q2, pattern 1; guard q1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x1af9
    push16 r4
    ldi16 c0, 0x1c0a
    push16 r4
    ldi16 c0, 0x8284
    push16 r4
    ldi16 c0, 0x4f4f
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q2
    push16 r3
    push16 r2
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_039_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_EQ_done
.Lsub32_039_EQ_true:
    f7_emit_char 'B'
.Lsub32_039_EQ_done:
    brne8 .Lsub32_039_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_NE_done
.Lsub32_039_NE_true:
    f7_emit_char 'B'
.Lsub32_039_NE_done:
    brult8 .Lsub32_039_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_ULT_done
.Lsub32_039_ULT_true:
    f7_emit_char 'B'
.Lsub32_039_ULT_done:
    bruge8 .Lsub32_039_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_UGE_done
.Lsub32_039_UGE_true:
    f7_emit_char 'B'
.Lsub32_039_UGE_done:
    brslt8 .Lsub32_039_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_SLT_done
.Lsub32_039_SLT_true:
    f7_emit_char 'B'
.Lsub32_039_SLT_done:
    brsge8 .Lsub32_039_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_039_SGE_done
.Lsub32_039_SGE_true:
    f7_emit_char 'B'
.Lsub32_039_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q2, pattern 2; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0xd91e
    push16 r4
    ldi16 c0, 0x4e61
    push16 r4
    ldi16 c0, 0x1d4c
    push16 r4
    ldi16 c0, 0x1e5d
    push16 r4
    ldi16 c0, 0x4321
    push16 r4
    ldi16 c0, 0x8765
    push16 r4
    ldi16 c0, 0x5678
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_EQ_done
.Lsub32_03a_EQ_true:
    f7_emit_char 'B'
.Lsub32_03a_EQ_done:
    brne8 .Lsub32_03a_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_NE_done
.Lsub32_03a_NE_true:
    f7_emit_char 'B'
.Lsub32_03a_NE_done:
    brult8 .Lsub32_03a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_ULT_done
.Lsub32_03a_ULT_true:
    f7_emit_char 'B'
.Lsub32_03a_ULT_done:
    bruge8 .Lsub32_03a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_UGE_done
.Lsub32_03a_UGE_true:
    f7_emit_char 'B'
.Lsub32_03a_UGE_done:
    brslt8 .Lsub32_03a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_SLT_done
.Lsub32_03a_SLT_true:
    f7_emit_char 'B'
.Lsub32_03a_SLT_done:
    brsge8 .Lsub32_03a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03a_SGE_done
.Lsub32_03a_SGE_true:
    f7_emit_char 'B'
.Lsub32_03a_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q2, pattern 3; guard q0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x30b9
    push16 r4
    ldi16 c0, 0x4e75
    push16 r4
    ldi16 c0, 0x1d7d
    push16 r4
    ldi16 c0, 0x1e8e
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q2
    push16 r1
    push16 r0
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_EQ_done
.Lsub32_03b_EQ_true:
    f7_emit_char 'B'
.Lsub32_03b_EQ_done:
    brne8 .Lsub32_03b_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_NE_done
.Lsub32_03b_NE_true:
    f7_emit_char 'B'
.Lsub32_03b_NE_done:
    brult8 .Lsub32_03b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_ULT_done
.Lsub32_03b_ULT_true:
    f7_emit_char 'B'
.Lsub32_03b_ULT_done:
    bruge8 .Lsub32_03b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_UGE_done
.Lsub32_03b_UGE_true:
    f7_emit_char 'B'
.Lsub32_03b_UGE_done:
    brslt8 .Lsub32_03b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_SLT_done
.Lsub32_03b_SLT_true:
    f7_emit_char 'B'
.Lsub32_03b_SLT_done:
    brsge8 .Lsub32_03b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03b_SGE_done
.Lsub32_03b_SGE_true:
    f7_emit_char 'B'
.Lsub32_03b_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q3, pattern 0; guard q0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x8854
    push16 r4
    ldi16 c0, 0x4e88
    push16 r4
    ldi16 c0, 0x1dae
    push16 r4
    ldi16 c0, 0x1ebf
    push16 r4
    ldi16 c0, 0x1fd0
    push16 r4
    ldi16 c0, 0x20e1
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_EQ_done
.Lsub32_03c_EQ_true:
    f7_emit_char 'B'
.Lsub32_03c_EQ_done:
    brne8 .Lsub32_03c_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_NE_done
.Lsub32_03c_NE_true:
    f7_emit_char 'B'
.Lsub32_03c_NE_done:
    brult8 .Lsub32_03c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_ULT_done
.Lsub32_03c_ULT_true:
    f7_emit_char 'B'
.Lsub32_03c_ULT_done:
    bruge8 .Lsub32_03c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_UGE_done
.Lsub32_03c_UGE_true:
    f7_emit_char 'B'
.Lsub32_03c_UGE_done:
    brslt8 .Lsub32_03c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_SLT_done
.Lsub32_03c_SLT_true:
    f7_emit_char 'B'
.Lsub32_03c_SLT_done:
    brsge8 .Lsub32_03c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03c_SGE_done
.Lsub32_03c_SGE_true:
    f7_emit_char 'B'
.Lsub32_03c_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q3, pattern 1; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x1bbd
    push16 r4
    ldi16 c0, 0x1cce
    push16 r4
    ldi16 c0, 0xe0f0
    push16 r4
    ldi16 c0, 0x4f9c
    push16 r4
    ldi16 c0, 0x2001
    push16 r4
    ldi16 c0, 0x2112
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q3
    push16 r3
    push16 r2
    push16 r7
    push16 r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_EQ_done
.Lsub32_03d_EQ_true:
    f7_emit_char 'B'
.Lsub32_03d_EQ_done:
    brne8 .Lsub32_03d_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_NE_done
.Lsub32_03d_NE_true:
    f7_emit_char 'B'
.Lsub32_03d_NE_done:
    brult8 .Lsub32_03d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_ULT_done
.Lsub32_03d_ULT_true:
    f7_emit_char 'B'
.Lsub32_03d_ULT_done:
    bruge8 .Lsub32_03d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_UGE_done
.Lsub32_03d_UGE_true:
    f7_emit_char 'B'
.Lsub32_03d_UGE_done:
    brslt8 .Lsub32_03d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_SLT_done
.Lsub32_03d_SLT_true:
    f7_emit_char 'B'
.Lsub32_03d_SLT_done:
    brsge8 .Lsub32_03d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03d_SGE_done
.Lsub32_03d_SGE_true:
    f7_emit_char 'B'
.Lsub32_03d_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q3, pattern 2; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x1bee
    push16 r4
    ldi16 c0, 0x1cff
    push16 r4
    ldi16 c0, 0x1e10
    push16 r4
    ldi16 c0, 0x1f21
    push16 r4
    ldi16 c0, 0x398c
    push16 r4
    ldi16 c0, 0x50b1
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q3
    push16 r5
    push16 r4
    push16 r7
    push16 r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_EQ_done
.Lsub32_03e_EQ_true:
    f7_emit_char 'B'
.Lsub32_03e_EQ_done:
    brne8 .Lsub32_03e_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_NE_done
.Lsub32_03e_NE_true:
    f7_emit_char 'B'
.Lsub32_03e_NE_done:
    brult8 .Lsub32_03e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_ULT_done
.Lsub32_03e_ULT_true:
    f7_emit_char 'B'
.Lsub32_03e_ULT_done:
    bruge8 .Lsub32_03e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_UGE_done
.Lsub32_03e_UGE_true:
    f7_emit_char 'B'
.Lsub32_03e_UGE_done:
    brslt8 .Lsub32_03e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_SLT_done
.Lsub32_03e_SLT_true:
    f7_emit_char 'B'
.Lsub32_03e_SLT_done:
    brsge8 .Lsub32_03e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03e_SGE_done
.Lsub32_03e_SGE_true:
    f7_emit_char 'B'
.Lsub32_03e_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, qS=q3, pattern 3; guard q0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x8f25
    push16 r4
    ldi16 c0, 0x4ec2
    push16 r4
    ldi16 c0, 0x1e41
    push16 r4
    ldi16 c0, 0x1f52
    push16 r4
    ldi16 c0, 0x2063
    push16 r4
    ldi16 c0, 0x2174
    push16 r4
    ldi16 c0, 0x5a5a
    push16 r4
    ldi16 c0, 0xa5a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    sub32 q3, q3
    push16 r1
    push16 r0
    push16 r7
    push16 r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lsub32_03f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_EQ_done
.Lsub32_03f_EQ_true:
    f7_emit_char 'B'
.Lsub32_03f_EQ_done:
    brne8 .Lsub32_03f_NE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_NE_done
.Lsub32_03f_NE_true:
    f7_emit_char 'B'
.Lsub32_03f_NE_done:
    brult8 .Lsub32_03f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_ULT_done
.Lsub32_03f_ULT_true:
    f7_emit_char 'B'
.Lsub32_03f_ULT_done:
    bruge8 .Lsub32_03f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_UGE_done
.Lsub32_03f_UGE_true:
    f7_emit_char 'B'
.Lsub32_03f_UGE_done:
    brslt8 .Lsub32_03f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_SLT_done
.Lsub32_03f_SLT_true:
    f7_emit_char 'B'
.Lsub32_03f_SLT_done:
    brsge8 .Lsub32_03f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lsub32_03f_SGE_done
.Lsub32_03f_SGE_true:
    f7_emit_char 'B'
.Lsub32_03f_SGE_done:
    f7_emit_char '\n'

    sys debug_break
