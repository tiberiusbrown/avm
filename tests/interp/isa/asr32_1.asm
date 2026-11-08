.include "include/f7_32bit_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; qD=q0, pattern 0; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0101
    push16 r4
    ldi16 r4, 0x6c01
    push16 r4
    ldi16 r4, 0x4554
    push16 r4
    ldi16 r4, 0x4665
    push16 r4
    ldi16 r4, 0x4776
    push16 r4
    ldi16 r4, 0x4887
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_000_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_EQ_done
.Lasr32_1_000_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_000_EQ_done:
    brne8 .Lasr32_1_000_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_NE_done
.Lasr32_1_000_NE_true:
    f7_emit_char 'B'
.Lasr32_1_000_NE_done:
    brult8 .Lasr32_1_000_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_ULT_done
.Lasr32_1_000_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_000_ULT_done:
    bruge8 .Lasr32_1_000_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_UGE_done
.Lasr32_1_000_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_000_UGE_done:
    brslt8 .Lasr32_1_000_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_SLT_done
.Lasr32_1_000_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_000_SLT_done:
    brsge8 .Lasr32_1_000_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_000_SGE_done
.Lasr32_1_000_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_000_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 1; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x4363
    push16 r4
    ldi16 r4, 0x4474
    push16 r4
    ldi16 r4, 0x488f
    push16 r4
    ldi16 r4, 0x6d14
    push16 r4
    ldi16 r4, 0x47a7
    push16 r4
    ldi16 r4, 0x48b8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_001_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_EQ_done
.Lasr32_1_001_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_001_EQ_done:
    brne8 .Lasr32_1_001_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_NE_done
.Lasr32_1_001_NE_true:
    f7_emit_char 'B'
.Lasr32_1_001_NE_done:
    brult8 .Lasr32_1_001_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_ULT_done
.Lasr32_1_001_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_001_ULT_done:
    bruge8 .Lasr32_1_001_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_UGE_done
.Lasr32_1_001_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_001_UGE_done:
    brslt8 .Lasr32_1_001_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_SLT_done
.Lasr32_1_001_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_001_SLT_done:
    brsge8 .Lasr32_1_001_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_001_SGE_done
.Lasr32_1_001_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_001_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 2; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x4394
    push16 r4
    ldi16 r4, 0x44a5
    push16 r4
    ldi16 r4, 0x45b6
    push16 r4
    ldi16 r4, 0x46c7
    push16 r4
    ldi16 r4, 0x901d
    push16 r4
    ldi16 r4, 0x6e27
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_002_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_EQ_done
.Lasr32_1_002_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_002_EQ_done:
    brne8 .Lasr32_1_002_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_NE_done
.Lasr32_1_002_NE_true:
    f7_emit_char 'B'
.Lasr32_1_002_NE_done:
    brult8 .Lasr32_1_002_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_ULT_done
.Lasr32_1_002_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_002_ULT_done:
    bruge8 .Lasr32_1_002_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_UGE_done
.Lasr32_1_002_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_002_UGE_done:
    brslt8 .Lasr32_1_002_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_SLT_done
.Lasr32_1_002_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_002_SLT_done:
    brsge8 .Lasr32_1_002_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_002_SGE_done
.Lasr32_1_002_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_002_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 3; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0xd4a8
    push16 r4
    ldi16 r4, 0x6c37
    push16 r4
    ldi16 r4, 0x45e7
    push16 r4
    ldi16 r4, 0x46f8
    push16 r4
    ldi16 r4, 0x4809
    push16 r4
    ldi16 r4, 0x491a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_003_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_EQ_done
.Lasr32_1_003_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_003_EQ_done:
    brne8 .Lasr32_1_003_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_NE_done
.Lasr32_1_003_NE_true:
    f7_emit_char 'B'
.Lasr32_1_003_NE_done:
    brult8 .Lasr32_1_003_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_ULT_done
.Lasr32_1_003_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_003_ULT_done:
    bruge8 .Lasr32_1_003_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_UGE_done
.Lasr32_1_003_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_003_UGE_done:
    brslt8 .Lasr32_1_003_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_SLT_done
.Lasr32_1_003_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_003_SLT_done:
    brsge8 .Lasr32_1_003_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_003_SGE_done
.Lasr32_1_003_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_003_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 4; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1b35
    push16 r4
    ldi16 r4, 0x6c4a
    push16 r4
    ldi16 r4, 0x4618
    push16 r4
    ldi16 r4, 0x4729
    push16 r4
    ldi16 r4, 0x483a
    push16 r4
    ldi16 r4, 0x494b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_004_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_EQ_done
.Lasr32_1_004_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_004_EQ_done:
    brne8 .Lasr32_1_004_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_NE_done
.Lasr32_1_004_NE_true:
    f7_emit_char 'B'
.Lasr32_1_004_NE_done:
    brult8 .Lasr32_1_004_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_ULT_done
.Lasr32_1_004_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_004_ULT_done:
    bruge8 .Lasr32_1_004_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_UGE_done
.Lasr32_1_004_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_004_UGE_done:
    brslt8 .Lasr32_1_004_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_SLT_done
.Lasr32_1_004_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_004_SLT_done:
    brsge8 .Lasr32_1_004_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_004_SGE_done
.Lasr32_1_004_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_004_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 5; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x4427
    push16 r4
    ldi16 r4, 0x4538
    push16 r4
    ldi16 r4, 0x62c3
    push16 r4
    ldi16 r4, 0x6d5d
    push16 r4
    ldi16 r4, 0x486b
    push16 r4
    ldi16 r4, 0x497c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_005_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_EQ_done
.Lasr32_1_005_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_005_EQ_done:
    brne8 .Lasr32_1_005_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_NE_done
.Lasr32_1_005_NE_true:
    f7_emit_char 'B'
.Lasr32_1_005_NE_done:
    brult8 .Lasr32_1_005_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_ULT_done
.Lasr32_1_005_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_005_ULT_done:
    bruge8 .Lasr32_1_005_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_UGE_done
.Lasr32_1_005_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_005_UGE_done:
    brslt8 .Lasr32_1_005_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_SLT_done
.Lasr32_1_005_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_005_SLT_done:
    brsge8 .Lasr32_1_005_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_005_SGE_done
.Lasr32_1_005_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_005_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 6; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5aa5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4458
    push16 r4
    ldi16 r4, 0x4569
    push16 r4
    ldi16 r4, 0x467a
    push16 r4
    ldi16 r4, 0x478b
    push16 r4
    ldi16 r4, 0xaa51
    push16 r4
    ldi16 r4, 0x6e70
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_006_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_EQ_done
.Lasr32_1_006_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_006_EQ_done:
    brne8 .Lasr32_1_006_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_NE_done
.Lasr32_1_006_NE_true:
    f7_emit_char 'B'
.Lasr32_1_006_NE_done:
    brult8 .Lasr32_1_006_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_ULT_done
.Lasr32_1_006_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_006_ULT_done:
    bruge8 .Lasr32_1_006_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_UGE_done
.Lasr32_1_006_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_006_UGE_done:
    brslt8 .Lasr32_1_006_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_SLT_done
.Lasr32_1_006_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_006_SLT_done:
    brsge8 .Lasr32_1_006_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_006_SGE_done
.Lasr32_1_006_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_006_SGE_done:
    f7_emit_char '\n'

    ; qD=q0, pattern 7; guard q1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xeedc
    push16 r4
    ldi16 r4, 0x6c80
    push16 r4
    ldi16 r4, 0x46ab
    push16 r4
    ldi16 r4, 0x47bc
    push16 r4
    ldi16 r4, 0x48cd
    push16 r4
    ldi16 r4, 0x49de
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q0
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
    breq8 .Lasr32_1_007_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_EQ_done
.Lasr32_1_007_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_007_EQ_done:
    brne8 .Lasr32_1_007_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_NE_done
.Lasr32_1_007_NE_true:
    f7_emit_char 'B'
.Lasr32_1_007_NE_done:
    brult8 .Lasr32_1_007_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_ULT_done
.Lasr32_1_007_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_007_ULT_done:
    bruge8 .Lasr32_1_007_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_UGE_done
.Lasr32_1_007_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_007_UGE_done:
    brslt8 .Lasr32_1_007_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_SLT_done
.Lasr32_1_007_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_007_SLT_done:
    brsge8 .Lasr32_1_007_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_007_SGE_done
.Lasr32_1_007_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_007_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 0; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4298
    push16 r4
    ldi16 r4, 0x43a9
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x366a
    push16 r4
    ldi16 r4, 0x6d94
    push16 r4
    ldi16 r4, 0x48fe
    push16 r4
    ldi16 r4, 0x4a0f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_008_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_EQ_done
.Lasr32_1_008_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_008_EQ_done:
    brne8 .Lasr32_1_008_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_NE_done
.Lasr32_1_008_NE_true:
    f7_emit_char 'B'
.Lasr32_1_008_NE_done:
    brult8 .Lasr32_1_008_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_ULT_done
.Lasr32_1_008_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_008_ULT_done:
    bruge8 .Lasr32_1_008_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_UGE_done
.Lasr32_1_008_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_008_UGE_done:
    brslt8 .Lasr32_1_008_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_SLT_done
.Lasr32_1_008_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_008_SLT_done:
    brsge8 .Lasr32_1_008_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_008_SGE_done
.Lasr32_1_008_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_008_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 1; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x42c9
    push16 r4
    ldi16 r4, 0x43da
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x470d
    push16 r4
    ldi16 r4, 0x481e
    push16 r4
    ldi16 r4, 0x7df8
    push16 r4
    ldi16 r4, 0x6ea7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_009_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_EQ_done
.Lasr32_1_009_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_009_EQ_done:
    brne8 .Lasr32_1_009_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_NE_done
.Lasr32_1_009_NE_true:
    f7_emit_char 'B'
.Lasr32_1_009_NE_done:
    brult8 .Lasr32_1_009_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_ULT_done
.Lasr32_1_009_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_009_ULT_done:
    bruge8 .Lasr32_1_009_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_UGE_done
.Lasr32_1_009_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_009_UGE_done:
    brslt8 .Lasr32_1_009_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_SLT_done
.Lasr32_1_009_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_009_SLT_done:
    brsge8 .Lasr32_1_009_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_009_SGE_done
.Lasr32_1_009_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_009_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 2; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xc182
    push16 r4
    ldi16 r4, 0x6bb6
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x473e
    push16 r4
    ldi16 r4, 0x484f
    push16 r4
    ldi16 r4, 0x4960
    push16 r4
    ldi16 r4, 0x4a71
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_EQ_done
.Lasr32_1_00a_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00a_EQ_done:
    brne8 .Lasr32_1_00a_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_NE_done
.Lasr32_1_00a_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00a_NE_done:
    brult8 .Lasr32_1_00a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_ULT_done
.Lasr32_1_00a_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00a_ULT_done:
    bruge8 .Lasr32_1_00a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_UGE_done
.Lasr32_1_00a_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00a_UGE_done:
    brslt8 .Lasr32_1_00a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_SLT_done
.Lasr32_1_00a_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00a_SLT_done:
    brsge8 .Lasr32_1_00a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00a_SGE_done
.Lasr32_1_00a_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00a_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 3; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x432b
    push16 r4
    ldi16 r4, 0x443c
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0a11
    push16 r4
    ldi16 r4, 0x6dcb
    push16 r4
    ldi16 r4, 0x4991
    push16 r4
    ldi16 r4, 0x4aa2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_EQ_done
.Lasr32_1_00b_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00b_EQ_done:
    brne8 .Lasr32_1_00b_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_NE_done
.Lasr32_1_00b_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00b_NE_done:
    brult8 .Lasr32_1_00b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_ULT_done
.Lasr32_1_00b_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00b_ULT_done:
    bruge8 .Lasr32_1_00b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_UGE_done
.Lasr32_1_00b_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00b_UGE_done:
    brslt8 .Lasr32_1_00b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_SLT_done
.Lasr32_1_00b_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00b_SLT_done:
    brsge8 .Lasr32_1_00b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00b_SGE_done
.Lasr32_1_00b_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00b_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 4; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x435c
    push16 r4
    ldi16 r4, 0x446d
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x509e
    push16 r4
    ldi16 r4, 0x6ddd
    push16 r4
    ldi16 r4, 0x49c2
    push16 r4
    ldi16 r4, 0x4ad3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_EQ_done
.Lasr32_1_00c_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00c_EQ_done:
    brne8 .Lasr32_1_00c_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_NE_done
.Lasr32_1_00c_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00c_NE_done:
    brult8 .Lasr32_1_00c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_ULT_done
.Lasr32_1_00c_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00c_ULT_done:
    bruge8 .Lasr32_1_00c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_UGE_done
.Lasr32_1_00c_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00c_UGE_done:
    brslt8 .Lasr32_1_00c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_SLT_done
.Lasr32_1_00c_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00c_SLT_done:
    brsge8 .Lasr32_1_00c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00c_SGE_done
.Lasr32_1_00c_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00c_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 5; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x438d
    push16 r4
    ldi16 r4, 0x449e
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x47d1
    push16 r4
    ldi16 r4, 0x48e2
    push16 r4
    ldi16 r4, 0x982c
    push16 r4
    ldi16 r4, 0x6ef0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_EQ_done
.Lasr32_1_00d_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00d_EQ_done:
    brne8 .Lasr32_1_00d_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_NE_done
.Lasr32_1_00d_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00d_NE_done:
    brult8 .Lasr32_1_00d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_ULT_done
.Lasr32_1_00d_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00d_ULT_done:
    bruge8 .Lasr32_1_00d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_UGE_done
.Lasr32_1_00d_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00d_UGE_done:
    brslt8 .Lasr32_1_00d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_SLT_done
.Lasr32_1_00d_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00d_SLT_done:
    brsge8 .Lasr32_1_00d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00d_SGE_done
.Lasr32_1_00d_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00d_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 6; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xdbb6
    push16 r4
    ldi16 r4, 0x6bff
    push16 r4
    ldi16 r4, 0x5aa5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4802
    push16 r4
    ldi16 r4, 0x4913
    push16 r4
    ldi16 r4, 0x4a24
    push16 r4
    ldi16 r4, 0x4b35
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_EQ_done
.Lasr32_1_00e_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00e_EQ_done:
    brne8 .Lasr32_1_00e_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_NE_done
.Lasr32_1_00e_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00e_NE_done:
    brult8 .Lasr32_1_00e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_ULT_done
.Lasr32_1_00e_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00e_ULT_done:
    bruge8 .Lasr32_1_00e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_UGE_done
.Lasr32_1_00e_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00e_UGE_done:
    brslt8 .Lasr32_1_00e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_SLT_done
.Lasr32_1_00e_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00e_SLT_done:
    brsge8 .Lasr32_1_00e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00e_SGE_done
.Lasr32_1_00e_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00e_SGE_done:
    f7_emit_char '\n'

    ; qD=q1, pattern 7; guard q2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x43ef
    push16 r4
    ldi16 r4, 0x4500
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x2445
    push16 r4
    ldi16 r4, 0x6e14
    push16 r4
    ldi16 r4, 0x4a55
    push16 r4
    ldi16 r4, 0x4b66
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q1
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
    breq8 .Lasr32_1_00f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_EQ_done
.Lasr32_1_00f_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_00f_EQ_done:
    brne8 .Lasr32_1_00f_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_NE_done
.Lasr32_1_00f_NE_true:
    f7_emit_char 'B'
.Lasr32_1_00f_NE_done:
    brult8 .Lasr32_1_00f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_ULT_done
.Lasr32_1_00f_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_00f_ULT_done:
    bruge8 .Lasr32_1_00f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_UGE_done
.Lasr32_1_00f_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_00f_UGE_done:
    brslt8 .Lasr32_1_00f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_SLT_done
.Lasr32_1_00f_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_00f_SLT_done:
    brsge8 .Lasr32_1_00f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_00f_SGE_done
.Lasr32_1_00f_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_00f_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 0; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4420
    push16 r4
    ldi16 r4, 0x4531
    push16 r4
    ldi16 r4, 0x4642
    push16 r4
    ldi16 r4, 0x4753
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x6bd3
    push16 r4
    ldi16 r4, 0x6f27
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_010_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_EQ_done
.Lasr32_1_010_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_010_EQ_done:
    brne8 .Lasr32_1_010_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_NE_done
.Lasr32_1_010_NE_true:
    f7_emit_char 'B'
.Lasr32_1_010_NE_done:
    brult8 .Lasr32_1_010_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_ULT_done
.Lasr32_1_010_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_010_ULT_done:
    bruge8 .Lasr32_1_010_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_UGE_done
.Lasr32_1_010_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_010_UGE_done:
    brslt8 .Lasr32_1_010_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_SLT_done
.Lasr32_1_010_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_010_SLT_done:
    brsge8 .Lasr32_1_010_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_010_SGE_done
.Lasr32_1_010_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_010_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 1; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xaf5d
    push16 r4
    ldi16 r4, 0x6c36
    push16 r4
    ldi16 r4, 0x4673
    push16 r4
    ldi16 r4, 0x4784
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x4ab7
    push16 r4
    ldi16 r4, 0x4bc8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_011_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_EQ_done
.Lasr32_1_011_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_011_EQ_done:
    brne8 .Lasr32_1_011_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_NE_done
.Lasr32_1_011_NE_true:
    f7_emit_char 'B'
.Lasr32_1_011_NE_done:
    brult8 .Lasr32_1_011_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_ULT_done
.Lasr32_1_011_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_011_ULT_done:
    bruge8 .Lasr32_1_011_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_UGE_done
.Lasr32_1_011_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_011_UGE_done:
    brslt8 .Lasr32_1_011_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_SLT_done
.Lasr32_1_011_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_011_SLT_done:
    brsge8 .Lasr32_1_011_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_011_SGE_done
.Lasr32_1_011_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_011_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 2; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4482
    push16 r4
    ldi16 r4, 0x4593
    push16 r4
    ldi16 r4, 0xf6eb
    push16 r4
    ldi16 r4, 0x6d49
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x4ae8
    push16 r4
    ldi16 r4, 0x4bf9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_012_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_EQ_done
.Lasr32_1_012_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_012_EQ_done:
    brne8 .Lasr32_1_012_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_NE_done
.Lasr32_1_012_NE_true:
    f7_emit_char 'B'
.Lasr32_1_012_NE_done:
    brult8 .Lasr32_1_012_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_ULT_done
.Lasr32_1_012_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_012_ULT_done:
    bruge8 .Lasr32_1_012_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_UGE_done
.Lasr32_1_012_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_012_UGE_done:
    brslt8 .Lasr32_1_012_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_SLT_done
.Lasr32_1_012_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_012_SLT_done:
    brsge8 .Lasr32_1_012_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_012_SGE_done
.Lasr32_1_012_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_012_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 3; guard q3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x44b3
    push16 r4
    ldi16 r4, 0x45c4
    push16 r4
    ldi16 r4, 0x46d5
    push16 r4
    ldi16 r4, 0x47e6
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x3f7a
    push16 r4
    ldi16 r4, 0x6f5e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_013_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_EQ_done
.Lasr32_1_013_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_013_EQ_done:
    brne8 .Lasr32_1_013_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_NE_done
.Lasr32_1_013_NE_true:
    f7_emit_char 'B'
.Lasr32_1_013_NE_done:
    brult8 .Lasr32_1_013_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_ULT_done
.Lasr32_1_013_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_013_ULT_done:
    bruge8 .Lasr32_1_013_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_UGE_done
.Lasr32_1_013_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_013_UGE_done:
    brslt8 .Lasr32_1_013_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_SLT_done
.Lasr32_1_013_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_013_SLT_done:
    brsge8 .Lasr32_1_013_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_013_SGE_done
.Lasr32_1_013_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_013_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 4; guard q3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x44e4
    push16 r4
    ldi16 r4, 0x45f5
    push16 r4
    ldi16 r4, 0x4706
    push16 r4
    ldi16 r4, 0x4817
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8607
    push16 r4
    ldi16 r4, 0x6f70
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_014_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_EQ_done
.Lasr32_1_014_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_014_EQ_done:
    brne8 .Lasr32_1_014_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_NE_done
.Lasr32_1_014_NE_true:
    f7_emit_char 'B'
.Lasr32_1_014_NE_done:
    brult8 .Lasr32_1_014_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_ULT_done
.Lasr32_1_014_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_014_ULT_done:
    bruge8 .Lasr32_1_014_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_UGE_done
.Lasr32_1_014_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_014_UGE_done:
    brslt8 .Lasr32_1_014_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_SLT_done
.Lasr32_1_014_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_014_SLT_done:
    brsge8 .Lasr32_1_014_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_014_SGE_done
.Lasr32_1_014_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_014_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 5; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xc991
    push16 r4
    ldi16 r4, 0x6c7f
    push16 r4
    ldi16 r4, 0x4737
    push16 r4
    ldi16 r4, 0x4848
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x4b7b
    push16 r4
    ldi16 r4, 0x4c8c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_015_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_EQ_done
.Lasr32_1_015_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_015_EQ_done:
    brne8 .Lasr32_1_015_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_NE_done
.Lasr32_1_015_NE_true:
    f7_emit_char 'B'
.Lasr32_1_015_NE_done:
    brult8 .Lasr32_1_015_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_ULT_done
.Lasr32_1_015_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_015_ULT_done:
    bruge8 .Lasr32_1_015_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_UGE_done
.Lasr32_1_015_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_015_UGE_done:
    brslt8 .Lasr32_1_015_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_SLT_done
.Lasr32_1_015_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_015_SLT_done:
    brsge8 .Lasr32_1_015_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_015_SGE_done
.Lasr32_1_015_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_015_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 6; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4546
    push16 r4
    ldi16 r4, 0x4657
    push16 r4
    ldi16 r4, 0x111f
    push16 r4
    ldi16 r4, 0x6d93
    push16 r4
    ldi16 r4, 0x5aa5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4bac
    push16 r4
    ldi16 r4, 0x4cbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_016_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_EQ_done
.Lasr32_1_016_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_016_EQ_done:
    brne8 .Lasr32_1_016_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_NE_done
.Lasr32_1_016_NE_true:
    f7_emit_char 'B'
.Lasr32_1_016_NE_done:
    brult8 .Lasr32_1_016_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_ULT_done
.Lasr32_1_016_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_016_ULT_done:
    bruge8 .Lasr32_1_016_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_UGE_done
.Lasr32_1_016_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_016_UGE_done:
    brslt8 .Lasr32_1_016_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_SLT_done
.Lasr32_1_016_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_016_SLT_done:
    brsge8 .Lasr32_1_016_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_016_SGE_done
.Lasr32_1_016_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_016_SGE_done:
    f7_emit_char '\n'

    ; qD=q2, pattern 7; guard q3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4577
    push16 r4
    ldi16 r4, 0x4688
    push16 r4
    ldi16 r4, 0x4799
    push16 r4
    ldi16 r4, 0x48aa
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x59ae
    push16 r4
    ldi16 r4, 0x6fa7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q2
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
    breq8 .Lasr32_1_017_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_EQ_done
.Lasr32_1_017_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_017_EQ_done:
    brne8 .Lasr32_1_017_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_NE_done
.Lasr32_1_017_NE_true:
    f7_emit_char 'B'
.Lasr32_1_017_NE_done:
    brult8 .Lasr32_1_017_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_ULT_done
.Lasr32_1_017_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_017_ULT_done:
    bruge8 .Lasr32_1_017_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_UGE_done
.Lasr32_1_017_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_017_UGE_done:
    brslt8 .Lasr32_1_017_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_SLT_done
.Lasr32_1_017_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_017_SLT_done:
    brsge8 .Lasr32_1_017_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_017_SGE_done
.Lasr32_1_017_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_017_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 0; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9d38
    push16 r4
    ldi16 r4, 0x6cb6
    push16 r4
    ldi16 r4, 0x47ca
    push16 r4
    ldi16 r4, 0x48db
    push16 r4
    ldi16 r4, 0x49ec
    push16 r4
    ldi16 r4, 0x4afd
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_018_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_EQ_done
.Lasr32_1_018_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_018_EQ_done:
    brne8 .Lasr32_1_018_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_NE_done
.Lasr32_1_018_NE_true:
    f7_emit_char 'B'
.Lasr32_1_018_NE_done:
    brult8 .Lasr32_1_018_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_ULT_done
.Lasr32_1_018_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_018_ULT_done:
    bruge8 .Lasr32_1_018_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_UGE_done
.Lasr32_1_018_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_018_UGE_done:
    brslt8 .Lasr32_1_018_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_SLT_done
.Lasr32_1_018_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_018_SLT_done:
    brsge8 .Lasr32_1_018_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_018_SGE_done
.Lasr32_1_018_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_018_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 1; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x45d9
    push16 r4
    ldi16 r4, 0x46ea
    push16 r4
    ldi16 r4, 0xe4c6
    push16 r4
    ldi16 r4, 0x6dc9
    push16 r4
    ldi16 r4, 0x4a1d
    push16 r4
    ldi16 r4, 0x4b2e
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_019_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_EQ_done
.Lasr32_1_019_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_019_EQ_done:
    brne8 .Lasr32_1_019_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_NE_done
.Lasr32_1_019_NE_true:
    f7_emit_char 'B'
.Lasr32_1_019_NE_done:
    brult8 .Lasr32_1_019_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_ULT_done
.Lasr32_1_019_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_019_ULT_done:
    bruge8 .Lasr32_1_019_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_UGE_done
.Lasr32_1_019_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_019_UGE_done:
    brslt8 .Lasr32_1_019_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_SLT_done
.Lasr32_1_019_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_019_SLT_done:
    brsge8 .Lasr32_1_019_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_019_SGE_done
.Lasr32_1_019_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_019_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 2; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x460a
    push16 r4
    ldi16 r4, 0x471b
    push16 r4
    ldi16 r4, 0x482c
    push16 r4
    ldi16 r4, 0x493d
    push16 r4
    ldi16 r4, 0x2c54
    push16 r4
    ldi16 r4, 0x6edd
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_EQ_done
.Lasr32_1_01a_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01a_EQ_done:
    brne8 .Lasr32_1_01a_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_NE_done
.Lasr32_1_01a_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01a_NE_done:
    brult8 .Lasr32_1_01a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_ULT_done
.Lasr32_1_01a_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01a_ULT_done:
    bruge8 .Lasr32_1_01a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_UGE_done
.Lasr32_1_01a_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01a_UGE_done:
    brslt8 .Lasr32_1_01a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_SLT_done
.Lasr32_1_01a_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01a_SLT_done:
    brsge8 .Lasr32_1_01a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01a_SGE_done
.Lasr32_1_01a_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01a_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 3; guard q0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x70df
    push16 r4
    ldi16 r4, 0x6ced
    push16 r4
    ldi16 r4, 0x485d
    push16 r4
    ldi16 r4, 0x496e
    push16 r4
    ldi16 r4, 0x4a7f
    push16 r4
    ldi16 r4, 0x4b90
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_EQ_done
.Lasr32_1_01b_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01b_EQ_done:
    brne8 .Lasr32_1_01b_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_NE_done
.Lasr32_1_01b_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01b_NE_done:
    brult8 .Lasr32_1_01b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_ULT_done
.Lasr32_1_01b_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01b_ULT_done:
    bruge8 .Lasr32_1_01b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_UGE_done
.Lasr32_1_01b_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01b_UGE_done:
    brslt8 .Lasr32_1_01b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_SLT_done
.Lasr32_1_01b_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01b_SLT_done:
    brsge8 .Lasr32_1_01b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01b_SGE_done
.Lasr32_1_01b_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01b_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 4; guard q0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb76c
    push16 r4
    ldi16 r4, 0x6cff
    push16 r4
    ldi16 r4, 0x488e
    push16 r4
    ldi16 r4, 0x499f
    push16 r4
    ldi16 r4, 0x4ab0
    push16 r4
    ldi16 r4, 0x4bc1
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_EQ_done
.Lasr32_1_01c_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01c_EQ_done:
    brne8 .Lasr32_1_01c_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_NE_done
.Lasr32_1_01c_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01c_NE_done:
    brult8 .Lasr32_1_01c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_ULT_done
.Lasr32_1_01c_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01c_ULT_done:
    bruge8 .Lasr32_1_01c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_UGE_done
.Lasr32_1_01c_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01c_UGE_done:
    brslt8 .Lasr32_1_01c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_SLT_done
.Lasr32_1_01c_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01c_SLT_done:
    brsge8 .Lasr32_1_01c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01c_SGE_done
.Lasr32_1_01c_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01c_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 5; guard q1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x469d
    push16 r4
    ldi16 r4, 0x47ae
    push16 r4
    ldi16 r4, 0xfefa
    push16 r4
    ldi16 r4, 0x6e12
    push16 r4
    ldi16 r4, 0x4ae1
    push16 r4
    ldi16 r4, 0x4bf2
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_EQ_done
.Lasr32_1_01d_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01d_EQ_done:
    brne8 .Lasr32_1_01d_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_NE_done
.Lasr32_1_01d_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01d_NE_done:
    brult8 .Lasr32_1_01d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_ULT_done
.Lasr32_1_01d_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01d_ULT_done:
    bruge8 .Lasr32_1_01d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_UGE_done
.Lasr32_1_01d_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01d_UGE_done:
    brslt8 .Lasr32_1_01d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_SLT_done
.Lasr32_1_01d_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01d_SLT_done:
    brsge8 .Lasr32_1_01d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01d_SGE_done
.Lasr32_1_01d_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01d_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 6; guard q2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x46ce
    push16 r4
    ldi16 r4, 0x47df
    push16 r4
    ldi16 r4, 0x48f0
    push16 r4
    ldi16 r4, 0x4a01
    push16 r4
    ldi16 r4, 0x4688
    push16 r4
    ldi16 r4, 0x6f26
    push16 r4
    ldi16 r4, 0x5aa5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_EQ_done
.Lasr32_1_01e_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01e_EQ_done:
    brne8 .Lasr32_1_01e_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_NE_done
.Lasr32_1_01e_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01e_NE_done:
    brult8 .Lasr32_1_01e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_ULT_done
.Lasr32_1_01e_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01e_ULT_done:
    bruge8 .Lasr32_1_01e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_UGE_done
.Lasr32_1_01e_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01e_UGE_done:
    brslt8 .Lasr32_1_01e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_SLT_done
.Lasr32_1_01e_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01e_SLT_done:
    brsge8 .Lasr32_1_01e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01e_SGE_done
.Lasr32_1_01e_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01e_SGE_done:
    f7_emit_char '\n'

    ; qD=q3, pattern 7; guard q0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8b13
    push16 r4
    ldi16 r4, 0x6d36
    push16 r4
    ldi16 r4, 0x4921
    push16 r4
    ldi16 r4, 0x4a32
    push16 r4
    ldi16 r4, 0x4b43
    push16 r4
    ldi16 r4, 0x4c54
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    asr32.1 q3
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
    breq8 .Lasr32_1_01f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_EQ_done
.Lasr32_1_01f_EQ_true:
    f7_emit_char 'B'
.Lasr32_1_01f_EQ_done:
    brne8 .Lasr32_1_01f_NE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_NE_done
.Lasr32_1_01f_NE_true:
    f7_emit_char 'B'
.Lasr32_1_01f_NE_done:
    brult8 .Lasr32_1_01f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_ULT_done
.Lasr32_1_01f_ULT_true:
    f7_emit_char 'B'
.Lasr32_1_01f_ULT_done:
    bruge8 .Lasr32_1_01f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_UGE_done
.Lasr32_1_01f_UGE_true:
    f7_emit_char 'B'
.Lasr32_1_01f_UGE_done:
    brslt8 .Lasr32_1_01f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_SLT_done
.Lasr32_1_01f_SLT_true:
    f7_emit_char 'B'
.Lasr32_1_01f_SLT_done:
    brsge8 .Lasr32_1_01f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lasr32_1_01f_SGE_done
.Lasr32_1_01f_SGE_true:
    f7_emit_char 'B'
.Lasr32_1_01f_SGE_done:
    f7_emit_char '\n'

    sys debug_break
