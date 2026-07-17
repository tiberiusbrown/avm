.include "include/multiplication_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; d=c0, s=c0, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1200
    ldi16 c1, 0x3333
    ldi16 c2, 0x5555
    ldi16 c3, 0x7777
    muls8.w c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_000_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_EQ_done
.Lmuls8_w_000_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_000_EQ_done:
    brne8 .Lmuls8_w_000_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_NE_done
.Lmuls8_w_000_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_000_NE_done:
    brult8 .Lmuls8_w_000_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_ULT_done
.Lmuls8_w_000_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_000_ULT_done:
    bruge8 .Lmuls8_w_000_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_UGE_done
.Lmuls8_w_000_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_000_UGE_done:
    brslt8 .Lmuls8_w_000_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_SLT_done
.Lmuls8_w_000_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_000_SLT_done:
    brsge8 .Lmuls8_w_000_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_000_SGE_done
.Lmuls8_w_000_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_000_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c0, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x9a7f
    ldi16 c1, 0x334a
    ldi16 c2, 0x5572
    ldi16 c3, 0x779a
    muls8.w c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_001_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_EQ_done
.Lmuls8_w_001_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_001_EQ_done:
    brne8 .Lmuls8_w_001_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_NE_done
.Lmuls8_w_001_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_001_NE_done:
    brult8 .Lmuls8_w_001_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_ULT_done
.Lmuls8_w_001_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_001_ULT_done:
    bruge8 .Lmuls8_w_001_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_UGE_done
.Lmuls8_w_001_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_001_UGE_done:
    brslt8 .Lmuls8_w_001_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_SLT_done
.Lmuls8_w_001_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_001_SLT_done:
    brsge8 .Lmuls8_w_001_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_001_SGE_done
.Lmuls8_w_001_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_001_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c0, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x11ff
    ldi16 c1, 0x3361
    ldi16 c2, 0x558f
    ldi16 c3, 0x77bd
    muls8.w c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_002_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_EQ_done
.Lmuls8_w_002_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_002_EQ_done:
    brne8 .Lmuls8_w_002_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_NE_done
.Lmuls8_w_002_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_002_NE_done:
    brult8 .Lmuls8_w_002_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_ULT_done
.Lmuls8_w_002_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_002_ULT_done:
    bruge8 .Lmuls8_w_002_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_UGE_done
.Lmuls8_w_002_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_002_UGE_done:
    brslt8 .Lmuls8_w_002_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_SLT_done
.Lmuls8_w_002_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_002_SLT_done:
    brsge8 .Lmuls8_w_002_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_002_SGE_done
.Lmuls8_w_002_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_002_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c0, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x55fe
    ldi16 c1, 0x3378
    ldi16 c2, 0x55ac
    ldi16 c3, 0x77e0
    muls8.w c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_003_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_EQ_done
.Lmuls8_w_003_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_003_EQ_done:
    brne8 .Lmuls8_w_003_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_NE_done
.Lmuls8_w_003_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_003_NE_done:
    brult8 .Lmuls8_w_003_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_ULT_done
.Lmuls8_w_003_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_003_ULT_done:
    bruge8 .Lmuls8_w_003_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_UGE_done
.Lmuls8_w_003_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_003_UGE_done:
    brslt8 .Lmuls8_w_003_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_SLT_done
.Lmuls8_w_003_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_003_SLT_done:
    brsge8 .Lmuls8_w_003_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_003_SGE_done
.Lmuls8_w_003_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_003_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c1, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x3380
    ldi16 c1, 0x447f
    ldi16 c2, 0x55c9
    ldi16 c3, 0x7803
    muls8.w c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_004_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_EQ_done
.Lmuls8_w_004_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_004_EQ_done:
    brne8 .Lmuls8_w_004_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_NE_done
.Lmuls8_w_004_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_004_NE_done:
    brult8 .Lmuls8_w_004_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_ULT_done
.Lmuls8_w_004_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_004_ULT_done:
    bruge8 .Lmuls8_w_004_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_UGE_done
.Lmuls8_w_004_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_004_UGE_done:
    brslt8 .Lmuls8_w_004_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_SLT_done
.Lmuls8_w_004_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_004_SLT_done:
    brsge8 .Lmuls8_w_004_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_004_SGE_done
.Lmuls8_w_004_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_004_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c1, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x77aa
    ldi16 c1, 0x8855
    ldi16 c2, 0x55e6
    ldi16 c3, 0x7826
    muls8.w c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_005_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_EQ_done
.Lmuls8_w_005_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_005_EQ_done:
    brne8 .Lmuls8_w_005_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_NE_done
.Lmuls8_w_005_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_005_NE_done:
    brult8 .Lmuls8_w_005_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_ULT_done
.Lmuls8_w_005_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_005_ULT_done:
    bruge8 .Lmuls8_w_005_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_UGE_done
.Lmuls8_w_005_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_005_UGE_done:
    brslt8 .Lmuls8_w_005_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_SLT_done
.Lmuls8_w_005_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_005_SLT_done:
    brsge8 .Lmuls8_w_005_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_005_SGE_done
.Lmuls8_w_005_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_005_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c1, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x5601
    ldi16 c1, 0x7801
    ldi16 c2, 0x5603
    ldi16 c3, 0x7849
    muls8.w c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_006_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_EQ_done
.Lmuls8_w_006_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_006_EQ_done:
    brne8 .Lmuls8_w_006_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_NE_done
.Lmuls8_w_006_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_006_NE_done:
    brult8 .Lmuls8_w_006_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_ULT_done
.Lmuls8_w_006_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_006_ULT_done:
    bruge8 .Lmuls8_w_006_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_UGE_done
.Lmuls8_w_006_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_006_UGE_done:
    brslt8 .Lmuls8_w_006_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_SLT_done
.Lmuls8_w_006_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_006_SLT_done:
    brsge8 .Lmuls8_w_006_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_006_SGE_done
.Lmuls8_w_006_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_006_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c1, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xde80
    ldi16 c1, 0xf003
    ldi16 c2, 0x5620
    ldi16 c3, 0x786c
    muls8.w c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_007_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_EQ_done
.Lmuls8_w_007_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_007_EQ_done:
    brne8 .Lmuls8_w_007_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_NE_done
.Lmuls8_w_007_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_007_NE_done:
    brult8 .Lmuls8_w_007_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_ULT_done
.Lmuls8_w_007_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_007_ULT_done:
    bruge8 .Lmuls8_w_007_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_UGE_done
.Lmuls8_w_007_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_007_UGE_done:
    brslt8 .Lmuls8_w_007_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_SLT_done
.Lmuls8_w_007_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_007_SLT_done:
    brsge8 .Lmuls8_w_007_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_007_SGE_done
.Lmuls8_w_007_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_007_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c2, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x9a7f
    ldi16 c1, 0x33eb
    ldi16 c2, 0xbc02
    ldi16 c3, 0x788f
    muls8.w c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_008_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_EQ_done
.Lmuls8_w_008_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_008_EQ_done:
    brne8 .Lmuls8_w_008_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_NE_done
.Lmuls8_w_008_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_008_NE_done:
    brult8 .Lmuls8_w_008_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_ULT_done
.Lmuls8_w_008_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_008_ULT_done:
    bruge8 .Lmuls8_w_008_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_UGE_done
.Lmuls8_w_008_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_008_UGE_done:
    brslt8 .Lmuls8_w_008_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_SLT_done
.Lmuls8_w_008_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_008_SLT_done:
    brsge8 .Lmuls8_w_008_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_008_SGE_done
.Lmuls8_w_008_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_008_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c2, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x11ff
    ldi16 c1, 0x3402
    ldi16 c2, 0x2202
    ldi16 c3, 0x78b2
    muls8.w c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_009_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_EQ_done
.Lmuls8_w_009_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_009_EQ_done:
    brne8 .Lmuls8_w_009_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_NE_done
.Lmuls8_w_009_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_009_NE_done:
    brult8 .Lmuls8_w_009_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_ULT_done
.Lmuls8_w_009_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_009_ULT_done:
    bruge8 .Lmuls8_w_009_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_UGE_done
.Lmuls8_w_009_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_009_UGE_done:
    brslt8 .Lmuls8_w_009_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_SLT_done
.Lmuls8_w_009_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_009_SLT_done:
    brsge8 .Lmuls8_w_009_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_009_SGE_done
.Lmuls8_w_009_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_009_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c2, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x55fe
    ldi16 c1, 0x3419
    ldi16 c2, 0x6680
    ldi16 c3, 0x78d5
    muls8.w c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_EQ_done
.Lmuls8_w_00a_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_EQ_done:
    brne8 .Lmuls8_w_00a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_NE_done
.Lmuls8_w_00a_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_NE_done:
    brult8 .Lmuls8_w_00a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_ULT_done
.Lmuls8_w_00a_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_ULT_done:
    bruge8 .Lmuls8_w_00a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_UGE_done
.Lmuls8_w_00a_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_UGE_done:
    brslt8 .Lmuls8_w_00a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_SLT_done
.Lmuls8_w_00a_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_SLT_done:
    brsge8 .Lmuls8_w_00a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00a_SGE_done
.Lmuls8_w_00a_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00a_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c2, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1200
    ldi16 c1, 0x3430
    ldi16 c2, 0x3400
    ldi16 c3, 0x78f8
    muls8.w c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_EQ_done
.Lmuls8_w_00b_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_EQ_done:
    brne8 .Lmuls8_w_00b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_NE_done
.Lmuls8_w_00b_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_NE_done:
    brult8 .Lmuls8_w_00b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_ULT_done
.Lmuls8_w_00b_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_ULT_done:
    bruge8 .Lmuls8_w_00b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_UGE_done
.Lmuls8_w_00b_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_UGE_done:
    brslt8 .Lmuls8_w_00b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_SLT_done
.Lmuls8_w_00b_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_SLT_done:
    brsge8 .Lmuls8_w_00b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00b_SGE_done
.Lmuls8_w_00b_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00b_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c3, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x77aa
    ldi16 c1, 0x3447
    ldi16 c2, 0x56b1
    ldi16 c3, 0x8855
    muls8.w c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_EQ_done
.Lmuls8_w_00c_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_EQ_done:
    brne8 .Lmuls8_w_00c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_NE_done
.Lmuls8_w_00c_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_NE_done:
    brult8 .Lmuls8_w_00c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_ULT_done
.Lmuls8_w_00c_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_ULT_done:
    bruge8 .Lmuls8_w_00c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_UGE_done
.Lmuls8_w_00c_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_UGE_done:
    brslt8 .Lmuls8_w_00c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_SLT_done
.Lmuls8_w_00c_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_SLT_done:
    brsge8 .Lmuls8_w_00c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00c_SGE_done
.Lmuls8_w_00c_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00c_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c3, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x5601
    ldi16 c1, 0x345e
    ldi16 c2, 0x56ce
    ldi16 c3, 0x7801
    muls8.w c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_EQ_done
.Lmuls8_w_00d_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_EQ_done:
    brne8 .Lmuls8_w_00d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_NE_done
.Lmuls8_w_00d_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_NE_done:
    brult8 .Lmuls8_w_00d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_ULT_done
.Lmuls8_w_00d_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_ULT_done:
    bruge8 .Lmuls8_w_00d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_UGE_done
.Lmuls8_w_00d_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_UGE_done:
    brslt8 .Lmuls8_w_00d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_SLT_done
.Lmuls8_w_00d_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_SLT_done:
    brsge8 .Lmuls8_w_00d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00d_SGE_done
.Lmuls8_w_00d_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00d_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c3, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xde80
    ldi16 c1, 0x3475
    ldi16 c2, 0x56eb
    ldi16 c3, 0xf003
    muls8.w c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_EQ_done
.Lmuls8_w_00e_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_EQ_done:
    brne8 .Lmuls8_w_00e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_NE_done
.Lmuls8_w_00e_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_NE_done:
    brult8 .Lmuls8_w_00e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_ULT_done
.Lmuls8_w_00e_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_ULT_done:
    bruge8 .Lmuls8_w_00e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_UGE_done
.Lmuls8_w_00e_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_UGE_done:
    brslt8 .Lmuls8_w_00e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_SLT_done
.Lmuls8_w_00e_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_SLT_done:
    brsge8 .Lmuls8_w_00e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00e_SGE_done
.Lmuls8_w_00e_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00e_SGE_done:
    mul_emit_char '\n'

    ; d=c0, s=c3, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x3380
    ldi16 c1, 0x348c
    ldi16 c2, 0x5708
    ldi16 c3, 0x447f
    muls8.w c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_00f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_EQ_done
.Lmuls8_w_00f_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_EQ_done:
    brne8 .Lmuls8_w_00f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_NE_done
.Lmuls8_w_00f_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_NE_done:
    brult8 .Lmuls8_w_00f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_ULT_done
.Lmuls8_w_00f_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_ULT_done:
    bruge8 .Lmuls8_w_00f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_UGE_done
.Lmuls8_w_00f_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_UGE_done:
    brslt8 .Lmuls8_w_00f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_SLT_done
.Lmuls8_w_00f_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_SLT_done:
    brsge8 .Lmuls8_w_00f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_00f_SGE_done
.Lmuls8_w_00f_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_00f_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c0, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xbc02
    ldi16 c1, 0x9a7f
    ldi16 c2, 0x5725
    ldi16 c3, 0x79a7
    muls8.w c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_010_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_EQ_done
.Lmuls8_w_010_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_010_EQ_done:
    brne8 .Lmuls8_w_010_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_NE_done
.Lmuls8_w_010_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_010_NE_done:
    brult8 .Lmuls8_w_010_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_ULT_done
.Lmuls8_w_010_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_010_ULT_done:
    bruge8 .Lmuls8_w_010_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_UGE_done
.Lmuls8_w_010_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_010_UGE_done:
    brslt8 .Lmuls8_w_010_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_SLT_done
.Lmuls8_w_010_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_010_SLT_done:
    brsge8 .Lmuls8_w_010_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_010_SGE_done
.Lmuls8_w_010_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_010_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c0, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x2202
    ldi16 c1, 0x11ff
    ldi16 c2, 0x5742
    ldi16 c3, 0x79ca
    muls8.w c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_011_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_EQ_done
.Lmuls8_w_011_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_011_EQ_done:
    brne8 .Lmuls8_w_011_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_NE_done
.Lmuls8_w_011_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_011_NE_done:
    brult8 .Lmuls8_w_011_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_ULT_done
.Lmuls8_w_011_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_011_ULT_done:
    bruge8 .Lmuls8_w_011_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_UGE_done
.Lmuls8_w_011_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_011_UGE_done:
    brslt8 .Lmuls8_w_011_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_SLT_done
.Lmuls8_w_011_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_011_SLT_done:
    brsge8 .Lmuls8_w_011_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_011_SGE_done
.Lmuls8_w_011_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_011_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c0, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x6680
    ldi16 c1, 0x55fe
    ldi16 c2, 0x575f
    ldi16 c3, 0x79ed
    muls8.w c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_012_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_EQ_done
.Lmuls8_w_012_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_012_EQ_done:
    brne8 .Lmuls8_w_012_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_NE_done
.Lmuls8_w_012_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_012_NE_done:
    brult8 .Lmuls8_w_012_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_ULT_done
.Lmuls8_w_012_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_012_ULT_done:
    bruge8 .Lmuls8_w_012_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_UGE_done
.Lmuls8_w_012_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_012_UGE_done:
    brslt8 .Lmuls8_w_012_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_SLT_done
.Lmuls8_w_012_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_012_SLT_done:
    brsge8 .Lmuls8_w_012_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_012_SGE_done
.Lmuls8_w_012_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_012_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c0, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x3400
    ldi16 c1, 0x1200
    ldi16 c2, 0x577c
    ldi16 c3, 0x7a10
    muls8.w c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_013_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_EQ_done
.Lmuls8_w_013_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_013_EQ_done:
    brne8 .Lmuls8_w_013_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_NE_done
.Lmuls8_w_013_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_013_NE_done:
    brult8 .Lmuls8_w_013_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_ULT_done
.Lmuls8_w_013_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_013_ULT_done:
    bruge8 .Lmuls8_w_013_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_UGE_done
.Lmuls8_w_013_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_013_UGE_done:
    brslt8 .Lmuls8_w_013_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_SLT_done
.Lmuls8_w_013_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_013_SLT_done:
    brsge8 .Lmuls8_w_013_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_013_SGE_done
.Lmuls8_w_013_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_013_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c1, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x128d
    ldi16 c1, 0x77aa
    ldi16 c2, 0x5799
    ldi16 c3, 0x7a33
    muls8.w c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_014_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_EQ_done
.Lmuls8_w_014_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_014_EQ_done:
    brne8 .Lmuls8_w_014_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_NE_done
.Lmuls8_w_014_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_014_NE_done:
    brult8 .Lmuls8_w_014_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_ULT_done
.Lmuls8_w_014_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_014_ULT_done:
    bruge8 .Lmuls8_w_014_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_UGE_done
.Lmuls8_w_014_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_014_UGE_done:
    brslt8 .Lmuls8_w_014_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_SLT_done
.Lmuls8_w_014_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_014_SLT_done:
    brsge8 .Lmuls8_w_014_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_014_SGE_done
.Lmuls8_w_014_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_014_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c1, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x12a0
    ldi16 c1, 0x5601
    ldi16 c2, 0x57b6
    ldi16 c3, 0x7a56
    muls8.w c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_015_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_EQ_done
.Lmuls8_w_015_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_015_EQ_done:
    brne8 .Lmuls8_w_015_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_NE_done
.Lmuls8_w_015_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_015_NE_done:
    brult8 .Lmuls8_w_015_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_ULT_done
.Lmuls8_w_015_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_015_ULT_done:
    bruge8 .Lmuls8_w_015_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_UGE_done
.Lmuls8_w_015_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_015_UGE_done:
    brslt8 .Lmuls8_w_015_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_SLT_done
.Lmuls8_w_015_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_015_SLT_done:
    brsge8 .Lmuls8_w_015_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_015_SGE_done
.Lmuls8_w_015_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_015_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c1, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x12b3
    ldi16 c1, 0xde80
    ldi16 c2, 0x57d3
    ldi16 c3, 0x7a79
    muls8.w c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_016_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_EQ_done
.Lmuls8_w_016_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_016_EQ_done:
    brne8 .Lmuls8_w_016_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_NE_done
.Lmuls8_w_016_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_016_NE_done:
    brult8 .Lmuls8_w_016_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_ULT_done
.Lmuls8_w_016_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_016_ULT_done:
    bruge8 .Lmuls8_w_016_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_UGE_done
.Lmuls8_w_016_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_016_UGE_done:
    brslt8 .Lmuls8_w_016_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_SLT_done
.Lmuls8_w_016_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_016_SLT_done:
    brsge8 .Lmuls8_w_016_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_016_SGE_done
.Lmuls8_w_016_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_016_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c1, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x12c6
    ldi16 c1, 0x3380
    ldi16 c2, 0x57f0
    ldi16 c3, 0x7a9c
    muls8.w c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_017_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_EQ_done
.Lmuls8_w_017_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_017_EQ_done:
    brne8 .Lmuls8_w_017_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_NE_done
.Lmuls8_w_017_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_017_NE_done:
    brult8 .Lmuls8_w_017_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_ULT_done
.Lmuls8_w_017_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_017_ULT_done:
    bruge8 .Lmuls8_w_017_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_UGE_done
.Lmuls8_w_017_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_017_UGE_done:
    brslt8 .Lmuls8_w_017_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_SLT_done
.Lmuls8_w_017_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_017_SLT_done:
    brsge8 .Lmuls8_w_017_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_017_SGE_done
.Lmuls8_w_017_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_017_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c2, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x12d9
    ldi16 c1, 0x11ff
    ldi16 c2, 0x2202
    ldi16 c3, 0x7abf
    muls8.w c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_018_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_EQ_done
.Lmuls8_w_018_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_018_EQ_done:
    brne8 .Lmuls8_w_018_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_NE_done
.Lmuls8_w_018_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_018_NE_done:
    brult8 .Lmuls8_w_018_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_ULT_done
.Lmuls8_w_018_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_018_ULT_done:
    bruge8 .Lmuls8_w_018_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_UGE_done
.Lmuls8_w_018_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_018_UGE_done:
    brslt8 .Lmuls8_w_018_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_SLT_done
.Lmuls8_w_018_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_018_SLT_done:
    brsge8 .Lmuls8_w_018_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_018_SGE_done
.Lmuls8_w_018_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_018_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c2, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x12ec
    ldi16 c1, 0x55fe
    ldi16 c2, 0x6680
    ldi16 c3, 0x7ae2
    muls8.w c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_019_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_EQ_done
.Lmuls8_w_019_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_019_EQ_done:
    brne8 .Lmuls8_w_019_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_NE_done
.Lmuls8_w_019_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_019_NE_done:
    brult8 .Lmuls8_w_019_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_ULT_done
.Lmuls8_w_019_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_019_ULT_done:
    bruge8 .Lmuls8_w_019_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_UGE_done
.Lmuls8_w_019_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_019_UGE_done:
    brslt8 .Lmuls8_w_019_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_SLT_done
.Lmuls8_w_019_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_019_SLT_done:
    brsge8 .Lmuls8_w_019_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_019_SGE_done
.Lmuls8_w_019_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_019_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c2, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x12ff
    ldi16 c1, 0x1200
    ldi16 c2, 0x3400
    ldi16 c3, 0x7b05
    muls8.w c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_EQ_done
.Lmuls8_w_01a_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_EQ_done:
    brne8 .Lmuls8_w_01a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_NE_done
.Lmuls8_w_01a_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_NE_done:
    brult8 .Lmuls8_w_01a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_ULT_done
.Lmuls8_w_01a_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_ULT_done:
    bruge8 .Lmuls8_w_01a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_UGE_done
.Lmuls8_w_01a_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_UGE_done:
    brslt8 .Lmuls8_w_01a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_SLT_done
.Lmuls8_w_01a_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_SLT_done:
    brsge8 .Lmuls8_w_01a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01a_SGE_done
.Lmuls8_w_01a_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01a_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c2, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1312
    ldi16 c1, 0x9a7f
    ldi16 c2, 0xbc02
    ldi16 c3, 0x7b28
    muls8.w c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_EQ_done
.Lmuls8_w_01b_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_EQ_done:
    brne8 .Lmuls8_w_01b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_NE_done
.Lmuls8_w_01b_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_NE_done:
    brult8 .Lmuls8_w_01b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_ULT_done
.Lmuls8_w_01b_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_ULT_done:
    bruge8 .Lmuls8_w_01b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_UGE_done
.Lmuls8_w_01b_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_UGE_done:
    brslt8 .Lmuls8_w_01b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_SLT_done
.Lmuls8_w_01b_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_SLT_done:
    brsge8 .Lmuls8_w_01b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01b_SGE_done
.Lmuls8_w_01b_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01b_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c3, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1325
    ldi16 c1, 0x5601
    ldi16 c2, 0x5881
    ldi16 c3, 0x7801
    muls8.w c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_EQ_done
.Lmuls8_w_01c_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_EQ_done:
    brne8 .Lmuls8_w_01c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_NE_done
.Lmuls8_w_01c_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_NE_done:
    brult8 .Lmuls8_w_01c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_ULT_done
.Lmuls8_w_01c_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_ULT_done:
    bruge8 .Lmuls8_w_01c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_UGE_done
.Lmuls8_w_01c_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_UGE_done:
    brslt8 .Lmuls8_w_01c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_SLT_done
.Lmuls8_w_01c_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_SLT_done:
    brsge8 .Lmuls8_w_01c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01c_SGE_done
.Lmuls8_w_01c_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01c_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c3, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1338
    ldi16 c1, 0xde80
    ldi16 c2, 0x589e
    ldi16 c3, 0xf003
    muls8.w c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_EQ_done
.Lmuls8_w_01d_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_EQ_done:
    brne8 .Lmuls8_w_01d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_NE_done
.Lmuls8_w_01d_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_NE_done:
    brult8 .Lmuls8_w_01d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_ULT_done
.Lmuls8_w_01d_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_ULT_done:
    bruge8 .Lmuls8_w_01d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_UGE_done
.Lmuls8_w_01d_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_UGE_done:
    brslt8 .Lmuls8_w_01d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_SLT_done
.Lmuls8_w_01d_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_SLT_done:
    brsge8 .Lmuls8_w_01d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01d_SGE_done
.Lmuls8_w_01d_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01d_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c3, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x134b
    ldi16 c1, 0x3380
    ldi16 c2, 0x58bb
    ldi16 c3, 0x447f
    muls8.w c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_EQ_done
.Lmuls8_w_01e_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_EQ_done:
    brne8 .Lmuls8_w_01e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_NE_done
.Lmuls8_w_01e_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_NE_done:
    brult8 .Lmuls8_w_01e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_ULT_done
.Lmuls8_w_01e_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_ULT_done:
    bruge8 .Lmuls8_w_01e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_UGE_done
.Lmuls8_w_01e_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_UGE_done:
    brslt8 .Lmuls8_w_01e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_SLT_done
.Lmuls8_w_01e_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_SLT_done:
    brsge8 .Lmuls8_w_01e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01e_SGE_done
.Lmuls8_w_01e_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01e_SGE_done:
    mul_emit_char '\n'

    ; d=c1, s=c3, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x135e
    ldi16 c1, 0x77aa
    ldi16 c2, 0x58d8
    ldi16 c3, 0x8855
    muls8.w c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_01f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_EQ_done
.Lmuls8_w_01f_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_EQ_done:
    brne8 .Lmuls8_w_01f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_NE_done
.Lmuls8_w_01f_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_NE_done:
    brult8 .Lmuls8_w_01f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_ULT_done
.Lmuls8_w_01f_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_ULT_done:
    bruge8 .Lmuls8_w_01f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_UGE_done
.Lmuls8_w_01f_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_UGE_done:
    brslt8 .Lmuls8_w_01f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_SLT_done
.Lmuls8_w_01f_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_SLT_done:
    brsge8 .Lmuls8_w_01f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_01f_SGE_done
.Lmuls8_w_01f_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_01f_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c0, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x2202
    ldi16 c1, 0x3613
    ldi16 c2, 0x11ff
    ldi16 c3, 0x7bd7
    muls8.w c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_020_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_EQ_done
.Lmuls8_w_020_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_020_EQ_done:
    brne8 .Lmuls8_w_020_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_NE_done
.Lmuls8_w_020_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_020_NE_done:
    brult8 .Lmuls8_w_020_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_ULT_done
.Lmuls8_w_020_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_020_ULT_done:
    bruge8 .Lmuls8_w_020_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_UGE_done
.Lmuls8_w_020_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_020_UGE_done:
    brslt8 .Lmuls8_w_020_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_SLT_done
.Lmuls8_w_020_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_020_SLT_done:
    brsge8 .Lmuls8_w_020_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_020_SGE_done
.Lmuls8_w_020_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_020_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c0, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x6680
    ldi16 c1, 0x362a
    ldi16 c2, 0x55fe
    ldi16 c3, 0x7bfa
    muls8.w c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_021_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_EQ_done
.Lmuls8_w_021_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_021_EQ_done:
    brne8 .Lmuls8_w_021_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_NE_done
.Lmuls8_w_021_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_021_NE_done:
    brult8 .Lmuls8_w_021_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_ULT_done
.Lmuls8_w_021_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_021_ULT_done:
    bruge8 .Lmuls8_w_021_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_UGE_done
.Lmuls8_w_021_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_021_UGE_done:
    brslt8 .Lmuls8_w_021_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_SLT_done
.Lmuls8_w_021_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_021_SLT_done:
    brsge8 .Lmuls8_w_021_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_021_SGE_done
.Lmuls8_w_021_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_021_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c0, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x3400
    ldi16 c1, 0x3641
    ldi16 c2, 0x1200
    ldi16 c3, 0x7c1d
    muls8.w c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_022_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_EQ_done
.Lmuls8_w_022_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_022_EQ_done:
    brne8 .Lmuls8_w_022_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_NE_done
.Lmuls8_w_022_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_022_NE_done:
    brult8 .Lmuls8_w_022_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_ULT_done
.Lmuls8_w_022_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_022_ULT_done:
    bruge8 .Lmuls8_w_022_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_UGE_done
.Lmuls8_w_022_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_022_UGE_done:
    brslt8 .Lmuls8_w_022_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_SLT_done
.Lmuls8_w_022_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_022_SLT_done:
    brsge8 .Lmuls8_w_022_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_022_SGE_done
.Lmuls8_w_022_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_022_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c0, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xbc02
    ldi16 c1, 0x3658
    ldi16 c2, 0x9a7f
    ldi16 c3, 0x7c40
    muls8.w c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_023_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_EQ_done
.Lmuls8_w_023_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_023_EQ_done:
    brne8 .Lmuls8_w_023_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_NE_done
.Lmuls8_w_023_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_023_NE_done:
    brult8 .Lmuls8_w_023_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_ULT_done
.Lmuls8_w_023_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_023_ULT_done:
    bruge8 .Lmuls8_w_023_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_UGE_done
.Lmuls8_w_023_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_023_UGE_done:
    brslt8 .Lmuls8_w_023_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_SLT_done
.Lmuls8_w_023_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_023_SLT_done:
    brsge8 .Lmuls8_w_023_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_023_SGE_done
.Lmuls8_w_023_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_023_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c1, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x13bd
    ldi16 c1, 0x7801
    ldi16 c2, 0x5601
    ldi16 c3, 0x7c63
    muls8.w c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_024_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_EQ_done
.Lmuls8_w_024_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_024_EQ_done:
    brne8 .Lmuls8_w_024_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_NE_done
.Lmuls8_w_024_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_024_NE_done:
    brult8 .Lmuls8_w_024_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_ULT_done
.Lmuls8_w_024_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_024_ULT_done:
    bruge8 .Lmuls8_w_024_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_UGE_done
.Lmuls8_w_024_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_024_UGE_done:
    brslt8 .Lmuls8_w_024_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_SLT_done
.Lmuls8_w_024_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_024_SLT_done:
    brsge8 .Lmuls8_w_024_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_024_SGE_done
.Lmuls8_w_024_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_024_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c1, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x13d0
    ldi16 c1, 0xf003
    ldi16 c2, 0xde80
    ldi16 c3, 0x7c86
    muls8.w c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_025_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_EQ_done
.Lmuls8_w_025_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_025_EQ_done:
    brne8 .Lmuls8_w_025_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_NE_done
.Lmuls8_w_025_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_025_NE_done:
    brult8 .Lmuls8_w_025_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_ULT_done
.Lmuls8_w_025_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_025_ULT_done:
    bruge8 .Lmuls8_w_025_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_UGE_done
.Lmuls8_w_025_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_025_UGE_done:
    brslt8 .Lmuls8_w_025_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_SLT_done
.Lmuls8_w_025_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_025_SLT_done:
    brsge8 .Lmuls8_w_025_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_025_SGE_done
.Lmuls8_w_025_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_025_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c1, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x13e3
    ldi16 c1, 0x447f
    ldi16 c2, 0x3380
    ldi16 c3, 0x7ca9
    muls8.w c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_026_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_EQ_done
.Lmuls8_w_026_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_026_EQ_done:
    brne8 .Lmuls8_w_026_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_NE_done
.Lmuls8_w_026_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_026_NE_done:
    brult8 .Lmuls8_w_026_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_ULT_done
.Lmuls8_w_026_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_026_ULT_done:
    bruge8 .Lmuls8_w_026_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_UGE_done
.Lmuls8_w_026_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_026_UGE_done:
    brslt8 .Lmuls8_w_026_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_SLT_done
.Lmuls8_w_026_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_026_SLT_done:
    brsge8 .Lmuls8_w_026_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_026_SGE_done
.Lmuls8_w_026_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_026_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c1, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x13f6
    ldi16 c1, 0x8855
    ldi16 c2, 0x77aa
    ldi16 c3, 0x7ccc
    muls8.w c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_027_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_EQ_done
.Lmuls8_w_027_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_027_EQ_done:
    brne8 .Lmuls8_w_027_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_NE_done
.Lmuls8_w_027_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_027_NE_done:
    brult8 .Lmuls8_w_027_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_ULT_done
.Lmuls8_w_027_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_027_ULT_done:
    bruge8 .Lmuls8_w_027_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_UGE_done
.Lmuls8_w_027_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_027_UGE_done:
    brslt8 .Lmuls8_w_027_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_SLT_done
.Lmuls8_w_027_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_027_SLT_done:
    brsge8 .Lmuls8_w_027_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_027_SGE_done
.Lmuls8_w_027_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_027_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c2, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1409
    ldi16 c1, 0x36cb
    ldi16 c2, 0x55fe
    ldi16 c3, 0x7cef
    muls8.w c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_028_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_EQ_done
.Lmuls8_w_028_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_028_EQ_done:
    brne8 .Lmuls8_w_028_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_NE_done
.Lmuls8_w_028_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_028_NE_done:
    brult8 .Lmuls8_w_028_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_ULT_done
.Lmuls8_w_028_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_028_ULT_done:
    bruge8 .Lmuls8_w_028_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_UGE_done
.Lmuls8_w_028_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_028_UGE_done:
    brslt8 .Lmuls8_w_028_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_SLT_done
.Lmuls8_w_028_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_028_SLT_done:
    brsge8 .Lmuls8_w_028_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_028_SGE_done
.Lmuls8_w_028_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_028_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c2, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x141c
    ldi16 c1, 0x36e2
    ldi16 c2, 0x1200
    ldi16 c3, 0x7d12
    muls8.w c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_029_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_EQ_done
.Lmuls8_w_029_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_029_EQ_done:
    brne8 .Lmuls8_w_029_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_NE_done
.Lmuls8_w_029_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_029_NE_done:
    brult8 .Lmuls8_w_029_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_ULT_done
.Lmuls8_w_029_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_029_ULT_done:
    bruge8 .Lmuls8_w_029_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_UGE_done
.Lmuls8_w_029_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_029_UGE_done:
    brslt8 .Lmuls8_w_029_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_SLT_done
.Lmuls8_w_029_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_029_SLT_done:
    brsge8 .Lmuls8_w_029_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_029_SGE_done
.Lmuls8_w_029_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_029_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c2, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x142f
    ldi16 c1, 0x36f9
    ldi16 c2, 0x9a7f
    ldi16 c3, 0x7d35
    muls8.w c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_EQ_done
.Lmuls8_w_02a_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_EQ_done:
    brne8 .Lmuls8_w_02a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_NE_done
.Lmuls8_w_02a_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_NE_done:
    brult8 .Lmuls8_w_02a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_ULT_done
.Lmuls8_w_02a_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_ULT_done:
    bruge8 .Lmuls8_w_02a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_UGE_done
.Lmuls8_w_02a_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_UGE_done:
    brslt8 .Lmuls8_w_02a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_SLT_done
.Lmuls8_w_02a_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_SLT_done:
    brsge8 .Lmuls8_w_02a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02a_SGE_done
.Lmuls8_w_02a_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02a_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c2, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1442
    ldi16 c1, 0x3710
    ldi16 c2, 0x11ff
    ldi16 c3, 0x7d58
    muls8.w c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_EQ_done
.Lmuls8_w_02b_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_EQ_done:
    brne8 .Lmuls8_w_02b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_NE_done
.Lmuls8_w_02b_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_NE_done:
    brult8 .Lmuls8_w_02b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_ULT_done
.Lmuls8_w_02b_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_ULT_done:
    bruge8 .Lmuls8_w_02b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_UGE_done
.Lmuls8_w_02b_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_UGE_done:
    brslt8 .Lmuls8_w_02b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_SLT_done
.Lmuls8_w_02b_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_SLT_done:
    brsge8 .Lmuls8_w_02b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02b_SGE_done
.Lmuls8_w_02b_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02b_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c3, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1455
    ldi16 c1, 0x3727
    ldi16 c2, 0xde80
    ldi16 c3, 0xf003
    muls8.w c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_EQ_done
.Lmuls8_w_02c_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_EQ_done:
    brne8 .Lmuls8_w_02c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_NE_done
.Lmuls8_w_02c_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_NE_done:
    brult8 .Lmuls8_w_02c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_ULT_done
.Lmuls8_w_02c_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_ULT_done:
    bruge8 .Lmuls8_w_02c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_UGE_done
.Lmuls8_w_02c_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_UGE_done:
    brslt8 .Lmuls8_w_02c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_SLT_done
.Lmuls8_w_02c_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_SLT_done:
    brsge8 .Lmuls8_w_02c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02c_SGE_done
.Lmuls8_w_02c_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02c_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c3, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1468
    ldi16 c1, 0x373e
    ldi16 c2, 0x3380
    ldi16 c3, 0x447f
    muls8.w c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_EQ_done
.Lmuls8_w_02d_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_EQ_done:
    brne8 .Lmuls8_w_02d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_NE_done
.Lmuls8_w_02d_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_NE_done:
    brult8 .Lmuls8_w_02d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_ULT_done
.Lmuls8_w_02d_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_ULT_done:
    bruge8 .Lmuls8_w_02d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_UGE_done
.Lmuls8_w_02d_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_UGE_done:
    brslt8 .Lmuls8_w_02d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_SLT_done
.Lmuls8_w_02d_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_SLT_done:
    brsge8 .Lmuls8_w_02d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02d_SGE_done
.Lmuls8_w_02d_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02d_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c3, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x147b
    ldi16 c1, 0x3755
    ldi16 c2, 0x77aa
    ldi16 c3, 0x8855
    muls8.w c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_EQ_done
.Lmuls8_w_02e_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_EQ_done:
    brne8 .Lmuls8_w_02e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_NE_done
.Lmuls8_w_02e_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_NE_done:
    brult8 .Lmuls8_w_02e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_ULT_done
.Lmuls8_w_02e_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_ULT_done:
    bruge8 .Lmuls8_w_02e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_UGE_done
.Lmuls8_w_02e_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_UGE_done:
    brslt8 .Lmuls8_w_02e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_SLT_done
.Lmuls8_w_02e_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_SLT_done:
    brsge8 .Lmuls8_w_02e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02e_SGE_done
.Lmuls8_w_02e_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02e_SGE_done:
    mul_emit_char '\n'

    ; d=c2, s=c3, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x148e
    ldi16 c1, 0x376c
    ldi16 c2, 0x5601
    ldi16 c3, 0x7801
    muls8.w c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_02f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_EQ_done
.Lmuls8_w_02f_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_EQ_done:
    brne8 .Lmuls8_w_02f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_NE_done
.Lmuls8_w_02f_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_NE_done:
    brult8 .Lmuls8_w_02f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_ULT_done
.Lmuls8_w_02f_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_ULT_done:
    bruge8 .Lmuls8_w_02f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_UGE_done
.Lmuls8_w_02f_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_UGE_done:
    brslt8 .Lmuls8_w_02f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_SLT_done
.Lmuls8_w_02f_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_SLT_done:
    brsge8 .Lmuls8_w_02f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_02f_SGE_done
.Lmuls8_w_02f_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_02f_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c0, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x6680
    ldi16 c1, 0x3783
    ldi16 c2, 0x5ac5
    ldi16 c3, 0x55fe
    muls8.w c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_030_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_EQ_done
.Lmuls8_w_030_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_030_EQ_done:
    brne8 .Lmuls8_w_030_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_NE_done
.Lmuls8_w_030_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_030_NE_done:
    brult8 .Lmuls8_w_030_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_ULT_done
.Lmuls8_w_030_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_030_ULT_done:
    bruge8 .Lmuls8_w_030_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_UGE_done
.Lmuls8_w_030_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_030_UGE_done:
    brslt8 .Lmuls8_w_030_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_SLT_done
.Lmuls8_w_030_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_030_SLT_done:
    brsge8 .Lmuls8_w_030_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_030_SGE_done
.Lmuls8_w_030_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_030_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c0, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x3400
    ldi16 c1, 0x379a
    ldi16 c2, 0x5ae2
    ldi16 c3, 0x1200
    muls8.w c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_031_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_EQ_done
.Lmuls8_w_031_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_031_EQ_done:
    brne8 .Lmuls8_w_031_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_NE_done
.Lmuls8_w_031_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_031_NE_done:
    brult8 .Lmuls8_w_031_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_ULT_done
.Lmuls8_w_031_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_031_ULT_done:
    bruge8 .Lmuls8_w_031_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_UGE_done
.Lmuls8_w_031_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_031_UGE_done:
    brslt8 .Lmuls8_w_031_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_SLT_done
.Lmuls8_w_031_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_031_SLT_done:
    brsge8 .Lmuls8_w_031_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_031_SGE_done
.Lmuls8_w_031_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_031_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c0, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xbc02
    ldi16 c1, 0x37b1
    ldi16 c2, 0x5aff
    ldi16 c3, 0x9a7f
    muls8.w c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_032_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_EQ_done
.Lmuls8_w_032_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_032_EQ_done:
    brne8 .Lmuls8_w_032_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_NE_done
.Lmuls8_w_032_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_032_NE_done:
    brult8 .Lmuls8_w_032_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_ULT_done
.Lmuls8_w_032_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_032_ULT_done:
    bruge8 .Lmuls8_w_032_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_UGE_done
.Lmuls8_w_032_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_032_UGE_done:
    brslt8 .Lmuls8_w_032_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_SLT_done
.Lmuls8_w_032_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_032_SLT_done:
    brsge8 .Lmuls8_w_032_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_032_SGE_done
.Lmuls8_w_032_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_032_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c0, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x2202
    ldi16 c1, 0x37c8
    ldi16 c2, 0x5b1c
    ldi16 c3, 0x11ff
    muls8.w c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_033_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_EQ_done
.Lmuls8_w_033_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_033_EQ_done:
    brne8 .Lmuls8_w_033_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_NE_done
.Lmuls8_w_033_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_033_NE_done:
    brult8 .Lmuls8_w_033_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_ULT_done
.Lmuls8_w_033_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_033_ULT_done:
    bruge8 .Lmuls8_w_033_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_UGE_done
.Lmuls8_w_033_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_033_UGE_done:
    brslt8 .Lmuls8_w_033_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_SLT_done
.Lmuls8_w_033_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_033_SLT_done:
    brsge8 .Lmuls8_w_033_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_033_SGE_done
.Lmuls8_w_033_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_033_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c1, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x14ed
    ldi16 c1, 0xf003
    ldi16 c2, 0x5b39
    ldi16 c3, 0xde80
    muls8.w c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_034_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_EQ_done
.Lmuls8_w_034_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_034_EQ_done:
    brne8 .Lmuls8_w_034_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_NE_done
.Lmuls8_w_034_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_034_NE_done:
    brult8 .Lmuls8_w_034_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_ULT_done
.Lmuls8_w_034_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_034_ULT_done:
    bruge8 .Lmuls8_w_034_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_UGE_done
.Lmuls8_w_034_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_034_UGE_done:
    brslt8 .Lmuls8_w_034_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_SLT_done
.Lmuls8_w_034_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_034_SLT_done:
    brsge8 .Lmuls8_w_034_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_034_SGE_done
.Lmuls8_w_034_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_034_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c1, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1500
    ldi16 c1, 0x447f
    ldi16 c2, 0x5b56
    ldi16 c3, 0x3380
    muls8.w c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_035_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_EQ_done
.Lmuls8_w_035_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_035_EQ_done:
    brne8 .Lmuls8_w_035_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_NE_done
.Lmuls8_w_035_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_035_NE_done:
    brult8 .Lmuls8_w_035_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_ULT_done
.Lmuls8_w_035_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_035_ULT_done:
    bruge8 .Lmuls8_w_035_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_UGE_done
.Lmuls8_w_035_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_035_UGE_done:
    brslt8 .Lmuls8_w_035_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_SLT_done
.Lmuls8_w_035_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_035_SLT_done:
    brsge8 .Lmuls8_w_035_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_035_SGE_done
.Lmuls8_w_035_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_035_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c1, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1513
    ldi16 c1, 0x8855
    ldi16 c2, 0x5b73
    ldi16 c3, 0x77aa
    muls8.w c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_036_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_EQ_done
.Lmuls8_w_036_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_036_EQ_done:
    brne8 .Lmuls8_w_036_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_NE_done
.Lmuls8_w_036_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_036_NE_done:
    brult8 .Lmuls8_w_036_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_ULT_done
.Lmuls8_w_036_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_036_ULT_done:
    bruge8 .Lmuls8_w_036_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_UGE_done
.Lmuls8_w_036_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_036_UGE_done:
    brslt8 .Lmuls8_w_036_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_SLT_done
.Lmuls8_w_036_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_036_SLT_done:
    brsge8 .Lmuls8_w_036_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_036_SGE_done
.Lmuls8_w_036_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_036_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c1, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1526
    ldi16 c1, 0x7801
    ldi16 c2, 0x5b90
    ldi16 c3, 0x5601
    muls8.w c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_037_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_EQ_done
.Lmuls8_w_037_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_037_EQ_done:
    brne8 .Lmuls8_w_037_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_NE_done
.Lmuls8_w_037_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_037_NE_done:
    brult8 .Lmuls8_w_037_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_ULT_done
.Lmuls8_w_037_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_037_ULT_done:
    bruge8 .Lmuls8_w_037_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_UGE_done
.Lmuls8_w_037_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_037_UGE_done:
    brslt8 .Lmuls8_w_037_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_SLT_done
.Lmuls8_w_037_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_037_SLT_done:
    brsge8 .Lmuls8_w_037_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_037_SGE_done
.Lmuls8_w_037_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_037_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c2, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1539
    ldi16 c1, 0x383b
    ldi16 c2, 0x3400
    ldi16 c3, 0x1200
    muls8.w c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_038_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_EQ_done
.Lmuls8_w_038_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_038_EQ_done:
    brne8 .Lmuls8_w_038_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_NE_done
.Lmuls8_w_038_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_038_NE_done:
    brult8 .Lmuls8_w_038_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_ULT_done
.Lmuls8_w_038_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_038_ULT_done:
    bruge8 .Lmuls8_w_038_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_UGE_done
.Lmuls8_w_038_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_038_UGE_done:
    brslt8 .Lmuls8_w_038_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_SLT_done
.Lmuls8_w_038_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_038_SLT_done:
    brsge8 .Lmuls8_w_038_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_038_SGE_done
.Lmuls8_w_038_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_038_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c2, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x154c
    ldi16 c1, 0x3852
    ldi16 c2, 0xbc02
    ldi16 c3, 0x9a7f
    muls8.w c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_039_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_EQ_done
.Lmuls8_w_039_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_039_EQ_done:
    brne8 .Lmuls8_w_039_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_NE_done
.Lmuls8_w_039_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_039_NE_done:
    brult8 .Lmuls8_w_039_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_ULT_done
.Lmuls8_w_039_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_039_ULT_done:
    bruge8 .Lmuls8_w_039_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_UGE_done
.Lmuls8_w_039_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_039_UGE_done:
    brslt8 .Lmuls8_w_039_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_SLT_done
.Lmuls8_w_039_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_039_SLT_done:
    brsge8 .Lmuls8_w_039_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_039_SGE_done
.Lmuls8_w_039_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_039_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c2, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x155f
    ldi16 c1, 0x3869
    ldi16 c2, 0x2202
    ldi16 c3, 0x11ff
    muls8.w c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_EQ_done
.Lmuls8_w_03a_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_EQ_done:
    brne8 .Lmuls8_w_03a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_NE_done
.Lmuls8_w_03a_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_NE_done:
    brult8 .Lmuls8_w_03a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_ULT_done
.Lmuls8_w_03a_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_ULT_done:
    bruge8 .Lmuls8_w_03a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_UGE_done
.Lmuls8_w_03a_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_UGE_done:
    brslt8 .Lmuls8_w_03a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_SLT_done
.Lmuls8_w_03a_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_SLT_done:
    brsge8 .Lmuls8_w_03a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03a_SGE_done
.Lmuls8_w_03a_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03a_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c2, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1572
    ldi16 c1, 0x3880
    ldi16 c2, 0x6680
    ldi16 c3, 0x55fe
    muls8.w c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_EQ_done
.Lmuls8_w_03b_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_EQ_done:
    brne8 .Lmuls8_w_03b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_NE_done
.Lmuls8_w_03b_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_NE_done:
    brult8 .Lmuls8_w_03b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_ULT_done
.Lmuls8_w_03b_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_ULT_done:
    bruge8 .Lmuls8_w_03b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_UGE_done
.Lmuls8_w_03b_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_UGE_done:
    brslt8 .Lmuls8_w_03b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_SLT_done
.Lmuls8_w_03b_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_SLT_done:
    brsge8 .Lmuls8_w_03b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03b_SGE_done
.Lmuls8_w_03b_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03b_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c3, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1585
    ldi16 c1, 0x3897
    ldi16 c2, 0x5c21
    ldi16 c3, 0x3380
    muls8.w c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_EQ_done
.Lmuls8_w_03c_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_EQ_done:
    brne8 .Lmuls8_w_03c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_NE_done
.Lmuls8_w_03c_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_NE_done:
    brult8 .Lmuls8_w_03c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_ULT_done
.Lmuls8_w_03c_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_ULT_done:
    bruge8 .Lmuls8_w_03c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_UGE_done
.Lmuls8_w_03c_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_UGE_done:
    brslt8 .Lmuls8_w_03c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_SLT_done
.Lmuls8_w_03c_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_SLT_done:
    brsge8 .Lmuls8_w_03c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03c_SGE_done
.Lmuls8_w_03c_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03c_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c3, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1598
    ldi16 c1, 0x38ae
    ldi16 c2, 0x5c3e
    ldi16 c3, 0x77aa
    muls8.w c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_EQ_done
.Lmuls8_w_03d_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_EQ_done:
    brne8 .Lmuls8_w_03d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_NE_done
.Lmuls8_w_03d_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_NE_done:
    brult8 .Lmuls8_w_03d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_ULT_done
.Lmuls8_w_03d_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_ULT_done:
    bruge8 .Lmuls8_w_03d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_UGE_done
.Lmuls8_w_03d_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_UGE_done:
    brslt8 .Lmuls8_w_03d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_SLT_done
.Lmuls8_w_03d_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_SLT_done:
    brsge8 .Lmuls8_w_03d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03d_SGE_done
.Lmuls8_w_03d_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03d_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c3, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x15ab
    ldi16 c1, 0x38c5
    ldi16 c2, 0x5c5b
    ldi16 c3, 0x5601
    muls8.w c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_EQ_done
.Lmuls8_w_03e_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_EQ_done:
    brne8 .Lmuls8_w_03e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_NE_done
.Lmuls8_w_03e_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_NE_done:
    brult8 .Lmuls8_w_03e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_ULT_done
.Lmuls8_w_03e_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_ULT_done:
    bruge8 .Lmuls8_w_03e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_UGE_done
.Lmuls8_w_03e_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_UGE_done:
    brslt8 .Lmuls8_w_03e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_SLT_done
.Lmuls8_w_03e_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_SLT_done:
    brsge8 .Lmuls8_w_03e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03e_SGE_done
.Lmuls8_w_03e_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03e_SGE_done:
    mul_emit_char '\n'

    ; d=c3, s=c3, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x15be
    ldi16 c1, 0x38dc
    ldi16 c2, 0x5c78
    ldi16 c3, 0xde80
    muls8.w c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmuls8_w_03f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_EQ_done
.Lmuls8_w_03f_EQ_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_EQ_done:
    brne8 .Lmuls8_w_03f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_NE_done
.Lmuls8_w_03f_NE_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_NE_done:
    brult8 .Lmuls8_w_03f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_ULT_done
.Lmuls8_w_03f_ULT_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_ULT_done:
    bruge8 .Lmuls8_w_03f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_UGE_done
.Lmuls8_w_03f_UGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_UGE_done:
    brslt8 .Lmuls8_w_03f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_SLT_done
.Lmuls8_w_03f_SLT_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_SLT_done:
    brsge8 .Lmuls8_w_03f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmuls8_w_03f_SGE_done
.Lmuls8_w_03f_SGE_true:
    mul_emit_char 'B'
.Lmuls8_w_03f_SGE_done:
    mul_emit_char '\n'

    sys debug_break
