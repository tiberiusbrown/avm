.include "include/multiplication_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; d=r4, s=r4, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1200
    ldi16 r5, 0x3333
    ldi16 r6, 0x5555
    ldi16 r7, 0x7777
    mul8 r4, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_000_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_EQ_done
.Lmul8_000_EQ_true:
    mul_emit_char 'B'
.Lmul8_000_EQ_done:
    brne8 .Lmul8_000_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_NE_done
.Lmul8_000_NE_true:
    mul_emit_char 'B'
.Lmul8_000_NE_done:
    brult8 .Lmul8_000_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_ULT_done
.Lmul8_000_ULT_true:
    mul_emit_char 'B'
.Lmul8_000_ULT_done:
    bruge8 .Lmul8_000_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_UGE_done
.Lmul8_000_UGE_true:
    mul_emit_char 'B'
.Lmul8_000_UGE_done:
    brslt8 .Lmul8_000_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_SLT_done
.Lmul8_000_SLT_true:
    mul_emit_char 'B'
.Lmul8_000_SLT_done:
    brsge8 .Lmul8_000_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_000_SGE_done
.Lmul8_000_SGE_true:
    mul_emit_char 'B'
.Lmul8_000_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r4, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x9a7f
    ldi16 r5, 0x334a
    ldi16 r6, 0x5572
    ldi16 r7, 0x779a
    mul8 r4, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_001_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_EQ_done
.Lmul8_001_EQ_true:
    mul_emit_char 'B'
.Lmul8_001_EQ_done:
    brne8 .Lmul8_001_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_NE_done
.Lmul8_001_NE_true:
    mul_emit_char 'B'
.Lmul8_001_NE_done:
    brult8 .Lmul8_001_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_ULT_done
.Lmul8_001_ULT_true:
    mul_emit_char 'B'
.Lmul8_001_ULT_done:
    bruge8 .Lmul8_001_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_UGE_done
.Lmul8_001_UGE_true:
    mul_emit_char 'B'
.Lmul8_001_UGE_done:
    brslt8 .Lmul8_001_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_SLT_done
.Lmul8_001_SLT_true:
    mul_emit_char 'B'
.Lmul8_001_SLT_done:
    brsge8 .Lmul8_001_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_001_SGE_done
.Lmul8_001_SGE_true:
    mul_emit_char 'B'
.Lmul8_001_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r4, pattern 2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x11ff
    ldi16 r5, 0x3361
    ldi16 r6, 0x558f
    ldi16 r7, 0x77bd
    mul8 r4, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_002_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_EQ_done
.Lmul8_002_EQ_true:
    mul_emit_char 'B'
.Lmul8_002_EQ_done:
    brne8 .Lmul8_002_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_NE_done
.Lmul8_002_NE_true:
    mul_emit_char 'B'
.Lmul8_002_NE_done:
    brult8 .Lmul8_002_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_ULT_done
.Lmul8_002_ULT_true:
    mul_emit_char 'B'
.Lmul8_002_ULT_done:
    bruge8 .Lmul8_002_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_UGE_done
.Lmul8_002_UGE_true:
    mul_emit_char 'B'
.Lmul8_002_UGE_done:
    brslt8 .Lmul8_002_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_SLT_done
.Lmul8_002_SLT_true:
    mul_emit_char 'B'
.Lmul8_002_SLT_done:
    brsge8 .Lmul8_002_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_002_SGE_done
.Lmul8_002_SGE_true:
    mul_emit_char 'B'
.Lmul8_002_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r4, pattern 3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x55fe
    ldi16 r5, 0x3378
    ldi16 r6, 0x55ac
    ldi16 r7, 0x77e0
    mul8 r4, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_003_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_EQ_done
.Lmul8_003_EQ_true:
    mul_emit_char 'B'
.Lmul8_003_EQ_done:
    brne8 .Lmul8_003_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_NE_done
.Lmul8_003_NE_true:
    mul_emit_char 'B'
.Lmul8_003_NE_done:
    brult8 .Lmul8_003_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_ULT_done
.Lmul8_003_ULT_true:
    mul_emit_char 'B'
.Lmul8_003_ULT_done:
    bruge8 .Lmul8_003_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_UGE_done
.Lmul8_003_UGE_true:
    mul_emit_char 'B'
.Lmul8_003_UGE_done:
    brslt8 .Lmul8_003_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_SLT_done
.Lmul8_003_SLT_true:
    mul_emit_char 'B'
.Lmul8_003_SLT_done:
    brsge8 .Lmul8_003_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_003_SGE_done
.Lmul8_003_SGE_true:
    mul_emit_char 'B'
.Lmul8_003_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3380
    ldi16 r5, 0x447f
    ldi16 r6, 0x55c9
    ldi16 r7, 0x7803
    mul8 r4, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_004_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_EQ_done
.Lmul8_004_EQ_true:
    mul_emit_char 'B'
.Lmul8_004_EQ_done:
    brne8 .Lmul8_004_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_NE_done
.Lmul8_004_NE_true:
    mul_emit_char 'B'
.Lmul8_004_NE_done:
    brult8 .Lmul8_004_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_ULT_done
.Lmul8_004_ULT_true:
    mul_emit_char 'B'
.Lmul8_004_ULT_done:
    bruge8 .Lmul8_004_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_UGE_done
.Lmul8_004_UGE_true:
    mul_emit_char 'B'
.Lmul8_004_UGE_done:
    brslt8 .Lmul8_004_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_SLT_done
.Lmul8_004_SLT_true:
    mul_emit_char 'B'
.Lmul8_004_SLT_done:
    brsge8 .Lmul8_004_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_004_SGE_done
.Lmul8_004_SGE_true:
    mul_emit_char 'B'
.Lmul8_004_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x77aa
    ldi16 r5, 0x8855
    ldi16 r6, 0x55e6
    ldi16 r7, 0x7826
    mul8 r4, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_005_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_EQ_done
.Lmul8_005_EQ_true:
    mul_emit_char 'B'
.Lmul8_005_EQ_done:
    brne8 .Lmul8_005_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_NE_done
.Lmul8_005_NE_true:
    mul_emit_char 'B'
.Lmul8_005_NE_done:
    brult8 .Lmul8_005_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_ULT_done
.Lmul8_005_ULT_true:
    mul_emit_char 'B'
.Lmul8_005_ULT_done:
    bruge8 .Lmul8_005_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_UGE_done
.Lmul8_005_UGE_true:
    mul_emit_char 'B'
.Lmul8_005_UGE_done:
    brslt8 .Lmul8_005_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_SLT_done
.Lmul8_005_SLT_true:
    mul_emit_char 'B'
.Lmul8_005_SLT_done:
    brsge8 .Lmul8_005_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_005_SGE_done
.Lmul8_005_SGE_true:
    mul_emit_char 'B'
.Lmul8_005_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5601
    ldi16 r5, 0x7801
    ldi16 r6, 0x5603
    ldi16 r7, 0x7849
    mul8 r4, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_006_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_EQ_done
.Lmul8_006_EQ_true:
    mul_emit_char 'B'
.Lmul8_006_EQ_done:
    brne8 .Lmul8_006_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_NE_done
.Lmul8_006_NE_true:
    mul_emit_char 'B'
.Lmul8_006_NE_done:
    brult8 .Lmul8_006_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_ULT_done
.Lmul8_006_ULT_true:
    mul_emit_char 'B'
.Lmul8_006_ULT_done:
    bruge8 .Lmul8_006_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_UGE_done
.Lmul8_006_UGE_true:
    mul_emit_char 'B'
.Lmul8_006_UGE_done:
    brslt8 .Lmul8_006_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_SLT_done
.Lmul8_006_SLT_true:
    mul_emit_char 'B'
.Lmul8_006_SLT_done:
    brsge8 .Lmul8_006_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_006_SGE_done
.Lmul8_006_SGE_true:
    mul_emit_char 'B'
.Lmul8_006_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xde80
    ldi16 r5, 0xf003
    ldi16 r6, 0x5620
    ldi16 r7, 0x786c
    mul8 r4, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_007_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_EQ_done
.Lmul8_007_EQ_true:
    mul_emit_char 'B'
.Lmul8_007_EQ_done:
    brne8 .Lmul8_007_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_NE_done
.Lmul8_007_NE_true:
    mul_emit_char 'B'
.Lmul8_007_NE_done:
    brult8 .Lmul8_007_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_ULT_done
.Lmul8_007_ULT_true:
    mul_emit_char 'B'
.Lmul8_007_ULT_done:
    bruge8 .Lmul8_007_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_UGE_done
.Lmul8_007_UGE_true:
    mul_emit_char 'B'
.Lmul8_007_UGE_done:
    brslt8 .Lmul8_007_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_SLT_done
.Lmul8_007_SLT_true:
    mul_emit_char 'B'
.Lmul8_007_SLT_done:
    brsge8 .Lmul8_007_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_007_SGE_done
.Lmul8_007_SGE_true:
    mul_emit_char 'B'
.Lmul8_007_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9a7f
    ldi16 r5, 0x33eb
    ldi16 r6, 0xbc02
    ldi16 r7, 0x788f
    mul8 r4, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_008_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_EQ_done
.Lmul8_008_EQ_true:
    mul_emit_char 'B'
.Lmul8_008_EQ_done:
    brne8 .Lmul8_008_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_NE_done
.Lmul8_008_NE_true:
    mul_emit_char 'B'
.Lmul8_008_NE_done:
    brult8 .Lmul8_008_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_ULT_done
.Lmul8_008_ULT_true:
    mul_emit_char 'B'
.Lmul8_008_ULT_done:
    bruge8 .Lmul8_008_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_UGE_done
.Lmul8_008_UGE_true:
    mul_emit_char 'B'
.Lmul8_008_UGE_done:
    brslt8 .Lmul8_008_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_SLT_done
.Lmul8_008_SLT_true:
    mul_emit_char 'B'
.Lmul8_008_SLT_done:
    brsge8 .Lmul8_008_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_008_SGE_done
.Lmul8_008_SGE_true:
    mul_emit_char 'B'
.Lmul8_008_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x11ff
    ldi16 r5, 0x3402
    ldi16 r6, 0x2202
    ldi16 r7, 0x78b2
    mul8 r4, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_009_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_EQ_done
.Lmul8_009_EQ_true:
    mul_emit_char 'B'
.Lmul8_009_EQ_done:
    brne8 .Lmul8_009_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_NE_done
.Lmul8_009_NE_true:
    mul_emit_char 'B'
.Lmul8_009_NE_done:
    brult8 .Lmul8_009_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_ULT_done
.Lmul8_009_ULT_true:
    mul_emit_char 'B'
.Lmul8_009_ULT_done:
    bruge8 .Lmul8_009_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_UGE_done
.Lmul8_009_UGE_true:
    mul_emit_char 'B'
.Lmul8_009_UGE_done:
    brslt8 .Lmul8_009_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_SLT_done
.Lmul8_009_SLT_true:
    mul_emit_char 'B'
.Lmul8_009_SLT_done:
    brsge8 .Lmul8_009_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_009_SGE_done
.Lmul8_009_SGE_true:
    mul_emit_char 'B'
.Lmul8_009_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x55fe
    ldi16 r5, 0x3419
    ldi16 r6, 0x6680
    ldi16 r7, 0x78d5
    mul8 r4, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_EQ_done
.Lmul8_00a_EQ_true:
    mul_emit_char 'B'
.Lmul8_00a_EQ_done:
    brne8 .Lmul8_00a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_NE_done
.Lmul8_00a_NE_true:
    mul_emit_char 'B'
.Lmul8_00a_NE_done:
    brult8 .Lmul8_00a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_ULT_done
.Lmul8_00a_ULT_true:
    mul_emit_char 'B'
.Lmul8_00a_ULT_done:
    bruge8 .Lmul8_00a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_UGE_done
.Lmul8_00a_UGE_true:
    mul_emit_char 'B'
.Lmul8_00a_UGE_done:
    brslt8 .Lmul8_00a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_SLT_done
.Lmul8_00a_SLT_true:
    mul_emit_char 'B'
.Lmul8_00a_SLT_done:
    brsge8 .Lmul8_00a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00a_SGE_done
.Lmul8_00a_SGE_true:
    mul_emit_char 'B'
.Lmul8_00a_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1200
    ldi16 r5, 0x3430
    ldi16 r6, 0x3400
    ldi16 r7, 0x78f8
    mul8 r4, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_EQ_done
.Lmul8_00b_EQ_true:
    mul_emit_char 'B'
.Lmul8_00b_EQ_done:
    brne8 .Lmul8_00b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_NE_done
.Lmul8_00b_NE_true:
    mul_emit_char 'B'
.Lmul8_00b_NE_done:
    brult8 .Lmul8_00b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_ULT_done
.Lmul8_00b_ULT_true:
    mul_emit_char 'B'
.Lmul8_00b_ULT_done:
    bruge8 .Lmul8_00b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_UGE_done
.Lmul8_00b_UGE_true:
    mul_emit_char 'B'
.Lmul8_00b_UGE_done:
    brslt8 .Lmul8_00b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_SLT_done
.Lmul8_00b_SLT_true:
    mul_emit_char 'B'
.Lmul8_00b_SLT_done:
    brsge8 .Lmul8_00b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00b_SGE_done
.Lmul8_00b_SGE_true:
    mul_emit_char 'B'
.Lmul8_00b_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x77aa
    ldi16 r5, 0x3447
    ldi16 r6, 0x56b1
    ldi16 r7, 0x8855
    mul8 r4, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_EQ_done
.Lmul8_00c_EQ_true:
    mul_emit_char 'B'
.Lmul8_00c_EQ_done:
    brne8 .Lmul8_00c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_NE_done
.Lmul8_00c_NE_true:
    mul_emit_char 'B'
.Lmul8_00c_NE_done:
    brult8 .Lmul8_00c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_ULT_done
.Lmul8_00c_ULT_true:
    mul_emit_char 'B'
.Lmul8_00c_ULT_done:
    bruge8 .Lmul8_00c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_UGE_done
.Lmul8_00c_UGE_true:
    mul_emit_char 'B'
.Lmul8_00c_UGE_done:
    brslt8 .Lmul8_00c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_SLT_done
.Lmul8_00c_SLT_true:
    mul_emit_char 'B'
.Lmul8_00c_SLT_done:
    brsge8 .Lmul8_00c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00c_SGE_done
.Lmul8_00c_SGE_true:
    mul_emit_char 'B'
.Lmul8_00c_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x5601
    ldi16 r5, 0x345e
    ldi16 r6, 0x56ce
    ldi16 r7, 0x7801
    mul8 r4, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_EQ_done
.Lmul8_00d_EQ_true:
    mul_emit_char 'B'
.Lmul8_00d_EQ_done:
    brne8 .Lmul8_00d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_NE_done
.Lmul8_00d_NE_true:
    mul_emit_char 'B'
.Lmul8_00d_NE_done:
    brult8 .Lmul8_00d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_ULT_done
.Lmul8_00d_ULT_true:
    mul_emit_char 'B'
.Lmul8_00d_ULT_done:
    bruge8 .Lmul8_00d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_UGE_done
.Lmul8_00d_UGE_true:
    mul_emit_char 'B'
.Lmul8_00d_UGE_done:
    brslt8 .Lmul8_00d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_SLT_done
.Lmul8_00d_SLT_true:
    mul_emit_char 'B'
.Lmul8_00d_SLT_done:
    brsge8 .Lmul8_00d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00d_SGE_done
.Lmul8_00d_SGE_true:
    mul_emit_char 'B'
.Lmul8_00d_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xde80
    ldi16 r5, 0x3475
    ldi16 r6, 0x56eb
    ldi16 r7, 0xf003
    mul8 r4, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_EQ_done
.Lmul8_00e_EQ_true:
    mul_emit_char 'B'
.Lmul8_00e_EQ_done:
    brne8 .Lmul8_00e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_NE_done
.Lmul8_00e_NE_true:
    mul_emit_char 'B'
.Lmul8_00e_NE_done:
    brult8 .Lmul8_00e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_ULT_done
.Lmul8_00e_ULT_true:
    mul_emit_char 'B'
.Lmul8_00e_ULT_done:
    bruge8 .Lmul8_00e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_UGE_done
.Lmul8_00e_UGE_true:
    mul_emit_char 'B'
.Lmul8_00e_UGE_done:
    brslt8 .Lmul8_00e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_SLT_done
.Lmul8_00e_SLT_true:
    mul_emit_char 'B'
.Lmul8_00e_SLT_done:
    brsge8 .Lmul8_00e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00e_SGE_done
.Lmul8_00e_SGE_true:
    mul_emit_char 'B'
.Lmul8_00e_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3380
    ldi16 r5, 0x348c
    ldi16 r6, 0x5708
    ldi16 r7, 0x447f
    mul8 r4, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_00f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_EQ_done
.Lmul8_00f_EQ_true:
    mul_emit_char 'B'
.Lmul8_00f_EQ_done:
    brne8 .Lmul8_00f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_NE_done
.Lmul8_00f_NE_true:
    mul_emit_char 'B'
.Lmul8_00f_NE_done:
    brult8 .Lmul8_00f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_ULT_done
.Lmul8_00f_ULT_true:
    mul_emit_char 'B'
.Lmul8_00f_ULT_done:
    bruge8 .Lmul8_00f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_UGE_done
.Lmul8_00f_UGE_true:
    mul_emit_char 'B'
.Lmul8_00f_UGE_done:
    brslt8 .Lmul8_00f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_SLT_done
.Lmul8_00f_SLT_true:
    mul_emit_char 'B'
.Lmul8_00f_SLT_done:
    brsge8 .Lmul8_00f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_00f_SGE_done
.Lmul8_00f_SGE_true:
    mul_emit_char 'B'
.Lmul8_00f_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xbc02
    ldi16 r5, 0x9a7f
    ldi16 r6, 0x5725
    ldi16 r7, 0x79a7
    mul8 r5, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_010_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_EQ_done
.Lmul8_010_EQ_true:
    mul_emit_char 'B'
.Lmul8_010_EQ_done:
    brne8 .Lmul8_010_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_NE_done
.Lmul8_010_NE_true:
    mul_emit_char 'B'
.Lmul8_010_NE_done:
    brult8 .Lmul8_010_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_ULT_done
.Lmul8_010_ULT_true:
    mul_emit_char 'B'
.Lmul8_010_ULT_done:
    bruge8 .Lmul8_010_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_UGE_done
.Lmul8_010_UGE_true:
    mul_emit_char 'B'
.Lmul8_010_UGE_done:
    brslt8 .Lmul8_010_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_SLT_done
.Lmul8_010_SLT_true:
    mul_emit_char 'B'
.Lmul8_010_SLT_done:
    brsge8 .Lmul8_010_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_010_SGE_done
.Lmul8_010_SGE_true:
    mul_emit_char 'B'
.Lmul8_010_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2202
    ldi16 r5, 0x11ff
    ldi16 r6, 0x5742
    ldi16 r7, 0x79ca
    mul8 r5, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_011_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_EQ_done
.Lmul8_011_EQ_true:
    mul_emit_char 'B'
.Lmul8_011_EQ_done:
    brne8 .Lmul8_011_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_NE_done
.Lmul8_011_NE_true:
    mul_emit_char 'B'
.Lmul8_011_NE_done:
    brult8 .Lmul8_011_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_ULT_done
.Lmul8_011_ULT_true:
    mul_emit_char 'B'
.Lmul8_011_ULT_done:
    bruge8 .Lmul8_011_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_UGE_done
.Lmul8_011_UGE_true:
    mul_emit_char 'B'
.Lmul8_011_UGE_done:
    brslt8 .Lmul8_011_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_SLT_done
.Lmul8_011_SLT_true:
    mul_emit_char 'B'
.Lmul8_011_SLT_done:
    brsge8 .Lmul8_011_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_011_SGE_done
.Lmul8_011_SGE_true:
    mul_emit_char 'B'
.Lmul8_011_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6680
    ldi16 r5, 0x55fe
    ldi16 r6, 0x575f
    ldi16 r7, 0x79ed
    mul8 r5, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_012_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_EQ_done
.Lmul8_012_EQ_true:
    mul_emit_char 'B'
.Lmul8_012_EQ_done:
    brne8 .Lmul8_012_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_NE_done
.Lmul8_012_NE_true:
    mul_emit_char 'B'
.Lmul8_012_NE_done:
    brult8 .Lmul8_012_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_ULT_done
.Lmul8_012_ULT_true:
    mul_emit_char 'B'
.Lmul8_012_ULT_done:
    bruge8 .Lmul8_012_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_UGE_done
.Lmul8_012_UGE_true:
    mul_emit_char 'B'
.Lmul8_012_UGE_done:
    brslt8 .Lmul8_012_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_SLT_done
.Lmul8_012_SLT_true:
    mul_emit_char 'B'
.Lmul8_012_SLT_done:
    brsge8 .Lmul8_012_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_012_SGE_done
.Lmul8_012_SGE_true:
    mul_emit_char 'B'
.Lmul8_012_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x3400
    ldi16 r5, 0x1200
    ldi16 r6, 0x577c
    ldi16 r7, 0x7a10
    mul8 r5, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_013_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_EQ_done
.Lmul8_013_EQ_true:
    mul_emit_char 'B'
.Lmul8_013_EQ_done:
    brne8 .Lmul8_013_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_NE_done
.Lmul8_013_NE_true:
    mul_emit_char 'B'
.Lmul8_013_NE_done:
    brult8 .Lmul8_013_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_ULT_done
.Lmul8_013_ULT_true:
    mul_emit_char 'B'
.Lmul8_013_ULT_done:
    bruge8 .Lmul8_013_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_UGE_done
.Lmul8_013_UGE_true:
    mul_emit_char 'B'
.Lmul8_013_UGE_done:
    brslt8 .Lmul8_013_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_SLT_done
.Lmul8_013_SLT_true:
    mul_emit_char 'B'
.Lmul8_013_SLT_done:
    brsge8 .Lmul8_013_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_013_SGE_done
.Lmul8_013_SGE_true:
    mul_emit_char 'B'
.Lmul8_013_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x128d
    ldi16 r5, 0x77aa
    ldi16 r6, 0x5799
    ldi16 r7, 0x7a33
    mul8 r5, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_014_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_EQ_done
.Lmul8_014_EQ_true:
    mul_emit_char 'B'
.Lmul8_014_EQ_done:
    brne8 .Lmul8_014_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_NE_done
.Lmul8_014_NE_true:
    mul_emit_char 'B'
.Lmul8_014_NE_done:
    brult8 .Lmul8_014_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_ULT_done
.Lmul8_014_ULT_true:
    mul_emit_char 'B'
.Lmul8_014_ULT_done:
    bruge8 .Lmul8_014_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_UGE_done
.Lmul8_014_UGE_true:
    mul_emit_char 'B'
.Lmul8_014_UGE_done:
    brslt8 .Lmul8_014_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_SLT_done
.Lmul8_014_SLT_true:
    mul_emit_char 'B'
.Lmul8_014_SLT_done:
    brsge8 .Lmul8_014_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_014_SGE_done
.Lmul8_014_SGE_true:
    mul_emit_char 'B'
.Lmul8_014_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x12a0
    ldi16 r5, 0x5601
    ldi16 r6, 0x57b6
    ldi16 r7, 0x7a56
    mul8 r5, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_015_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_EQ_done
.Lmul8_015_EQ_true:
    mul_emit_char 'B'
.Lmul8_015_EQ_done:
    brne8 .Lmul8_015_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_NE_done
.Lmul8_015_NE_true:
    mul_emit_char 'B'
.Lmul8_015_NE_done:
    brult8 .Lmul8_015_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_ULT_done
.Lmul8_015_ULT_true:
    mul_emit_char 'B'
.Lmul8_015_ULT_done:
    bruge8 .Lmul8_015_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_UGE_done
.Lmul8_015_UGE_true:
    mul_emit_char 'B'
.Lmul8_015_UGE_done:
    brslt8 .Lmul8_015_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_SLT_done
.Lmul8_015_SLT_true:
    mul_emit_char 'B'
.Lmul8_015_SLT_done:
    brsge8 .Lmul8_015_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_015_SGE_done
.Lmul8_015_SGE_true:
    mul_emit_char 'B'
.Lmul8_015_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x12b3
    ldi16 r5, 0xde80
    ldi16 r6, 0x57d3
    ldi16 r7, 0x7a79
    mul8 r5, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_016_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_EQ_done
.Lmul8_016_EQ_true:
    mul_emit_char 'B'
.Lmul8_016_EQ_done:
    brne8 .Lmul8_016_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_NE_done
.Lmul8_016_NE_true:
    mul_emit_char 'B'
.Lmul8_016_NE_done:
    brult8 .Lmul8_016_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_ULT_done
.Lmul8_016_ULT_true:
    mul_emit_char 'B'
.Lmul8_016_ULT_done:
    bruge8 .Lmul8_016_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_UGE_done
.Lmul8_016_UGE_true:
    mul_emit_char 'B'
.Lmul8_016_UGE_done:
    brslt8 .Lmul8_016_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_SLT_done
.Lmul8_016_SLT_true:
    mul_emit_char 'B'
.Lmul8_016_SLT_done:
    brsge8 .Lmul8_016_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_016_SGE_done
.Lmul8_016_SGE_true:
    mul_emit_char 'B'
.Lmul8_016_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x12c6
    ldi16 r5, 0x3380
    ldi16 r6, 0x57f0
    ldi16 r7, 0x7a9c
    mul8 r5, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_017_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_EQ_done
.Lmul8_017_EQ_true:
    mul_emit_char 'B'
.Lmul8_017_EQ_done:
    brne8 .Lmul8_017_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_NE_done
.Lmul8_017_NE_true:
    mul_emit_char 'B'
.Lmul8_017_NE_done:
    brult8 .Lmul8_017_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_ULT_done
.Lmul8_017_ULT_true:
    mul_emit_char 'B'
.Lmul8_017_ULT_done:
    bruge8 .Lmul8_017_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_UGE_done
.Lmul8_017_UGE_true:
    mul_emit_char 'B'
.Lmul8_017_UGE_done:
    brslt8 .Lmul8_017_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_SLT_done
.Lmul8_017_SLT_true:
    mul_emit_char 'B'
.Lmul8_017_SLT_done:
    brsge8 .Lmul8_017_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_017_SGE_done
.Lmul8_017_SGE_true:
    mul_emit_char 'B'
.Lmul8_017_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x12d9
    ldi16 r5, 0x11ff
    ldi16 r6, 0x2202
    ldi16 r7, 0x7abf
    mul8 r5, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_018_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_EQ_done
.Lmul8_018_EQ_true:
    mul_emit_char 'B'
.Lmul8_018_EQ_done:
    brne8 .Lmul8_018_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_NE_done
.Lmul8_018_NE_true:
    mul_emit_char 'B'
.Lmul8_018_NE_done:
    brult8 .Lmul8_018_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_ULT_done
.Lmul8_018_ULT_true:
    mul_emit_char 'B'
.Lmul8_018_ULT_done:
    bruge8 .Lmul8_018_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_UGE_done
.Lmul8_018_UGE_true:
    mul_emit_char 'B'
.Lmul8_018_UGE_done:
    brslt8 .Lmul8_018_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_SLT_done
.Lmul8_018_SLT_true:
    mul_emit_char 'B'
.Lmul8_018_SLT_done:
    brsge8 .Lmul8_018_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_018_SGE_done
.Lmul8_018_SGE_true:
    mul_emit_char 'B'
.Lmul8_018_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x12ec
    ldi16 r5, 0x55fe
    ldi16 r6, 0x6680
    ldi16 r7, 0x7ae2
    mul8 r5, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_019_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_EQ_done
.Lmul8_019_EQ_true:
    mul_emit_char 'B'
.Lmul8_019_EQ_done:
    brne8 .Lmul8_019_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_NE_done
.Lmul8_019_NE_true:
    mul_emit_char 'B'
.Lmul8_019_NE_done:
    brult8 .Lmul8_019_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_ULT_done
.Lmul8_019_ULT_true:
    mul_emit_char 'B'
.Lmul8_019_ULT_done:
    bruge8 .Lmul8_019_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_UGE_done
.Lmul8_019_UGE_true:
    mul_emit_char 'B'
.Lmul8_019_UGE_done:
    brslt8 .Lmul8_019_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_SLT_done
.Lmul8_019_SLT_true:
    mul_emit_char 'B'
.Lmul8_019_SLT_done:
    brsge8 .Lmul8_019_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_019_SGE_done
.Lmul8_019_SGE_true:
    mul_emit_char 'B'
.Lmul8_019_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x12ff
    ldi16 r5, 0x1200
    ldi16 r6, 0x3400
    ldi16 r7, 0x7b05
    mul8 r5, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_EQ_done
.Lmul8_01a_EQ_true:
    mul_emit_char 'B'
.Lmul8_01a_EQ_done:
    brne8 .Lmul8_01a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_NE_done
.Lmul8_01a_NE_true:
    mul_emit_char 'B'
.Lmul8_01a_NE_done:
    brult8 .Lmul8_01a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_ULT_done
.Lmul8_01a_ULT_true:
    mul_emit_char 'B'
.Lmul8_01a_ULT_done:
    bruge8 .Lmul8_01a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_UGE_done
.Lmul8_01a_UGE_true:
    mul_emit_char 'B'
.Lmul8_01a_UGE_done:
    brslt8 .Lmul8_01a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_SLT_done
.Lmul8_01a_SLT_true:
    mul_emit_char 'B'
.Lmul8_01a_SLT_done:
    brsge8 .Lmul8_01a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01a_SGE_done
.Lmul8_01a_SGE_true:
    mul_emit_char 'B'
.Lmul8_01a_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1312
    ldi16 r5, 0x9a7f
    ldi16 r6, 0xbc02
    ldi16 r7, 0x7b28
    mul8 r5, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_EQ_done
.Lmul8_01b_EQ_true:
    mul_emit_char 'B'
.Lmul8_01b_EQ_done:
    brne8 .Lmul8_01b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_NE_done
.Lmul8_01b_NE_true:
    mul_emit_char 'B'
.Lmul8_01b_NE_done:
    brult8 .Lmul8_01b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_ULT_done
.Lmul8_01b_ULT_true:
    mul_emit_char 'B'
.Lmul8_01b_ULT_done:
    bruge8 .Lmul8_01b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_UGE_done
.Lmul8_01b_UGE_true:
    mul_emit_char 'B'
.Lmul8_01b_UGE_done:
    brslt8 .Lmul8_01b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_SLT_done
.Lmul8_01b_SLT_true:
    mul_emit_char 'B'
.Lmul8_01b_SLT_done:
    brsge8 .Lmul8_01b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01b_SGE_done
.Lmul8_01b_SGE_true:
    mul_emit_char 'B'
.Lmul8_01b_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1325
    ldi16 r5, 0x5601
    ldi16 r6, 0x5881
    ldi16 r7, 0x7801
    mul8 r5, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_EQ_done
.Lmul8_01c_EQ_true:
    mul_emit_char 'B'
.Lmul8_01c_EQ_done:
    brne8 .Lmul8_01c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_NE_done
.Lmul8_01c_NE_true:
    mul_emit_char 'B'
.Lmul8_01c_NE_done:
    brult8 .Lmul8_01c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_ULT_done
.Lmul8_01c_ULT_true:
    mul_emit_char 'B'
.Lmul8_01c_ULT_done:
    bruge8 .Lmul8_01c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_UGE_done
.Lmul8_01c_UGE_true:
    mul_emit_char 'B'
.Lmul8_01c_UGE_done:
    brslt8 .Lmul8_01c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_SLT_done
.Lmul8_01c_SLT_true:
    mul_emit_char 'B'
.Lmul8_01c_SLT_done:
    brsge8 .Lmul8_01c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01c_SGE_done
.Lmul8_01c_SGE_true:
    mul_emit_char 'B'
.Lmul8_01c_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1338
    ldi16 r5, 0xde80
    ldi16 r6, 0x589e
    ldi16 r7, 0xf003
    mul8 r5, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_EQ_done
.Lmul8_01d_EQ_true:
    mul_emit_char 'B'
.Lmul8_01d_EQ_done:
    brne8 .Lmul8_01d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_NE_done
.Lmul8_01d_NE_true:
    mul_emit_char 'B'
.Lmul8_01d_NE_done:
    brult8 .Lmul8_01d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_ULT_done
.Lmul8_01d_ULT_true:
    mul_emit_char 'B'
.Lmul8_01d_ULT_done:
    bruge8 .Lmul8_01d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_UGE_done
.Lmul8_01d_UGE_true:
    mul_emit_char 'B'
.Lmul8_01d_UGE_done:
    brslt8 .Lmul8_01d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_SLT_done
.Lmul8_01d_SLT_true:
    mul_emit_char 'B'
.Lmul8_01d_SLT_done:
    brsge8 .Lmul8_01d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01d_SGE_done
.Lmul8_01d_SGE_true:
    mul_emit_char 'B'
.Lmul8_01d_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x134b
    ldi16 r5, 0x3380
    ldi16 r6, 0x58bb
    ldi16 r7, 0x447f
    mul8 r5, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_EQ_done
.Lmul8_01e_EQ_true:
    mul_emit_char 'B'
.Lmul8_01e_EQ_done:
    brne8 .Lmul8_01e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_NE_done
.Lmul8_01e_NE_true:
    mul_emit_char 'B'
.Lmul8_01e_NE_done:
    brult8 .Lmul8_01e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_ULT_done
.Lmul8_01e_ULT_true:
    mul_emit_char 'B'
.Lmul8_01e_ULT_done:
    bruge8 .Lmul8_01e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_UGE_done
.Lmul8_01e_UGE_true:
    mul_emit_char 'B'
.Lmul8_01e_UGE_done:
    brslt8 .Lmul8_01e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_SLT_done
.Lmul8_01e_SLT_true:
    mul_emit_char 'B'
.Lmul8_01e_SLT_done:
    brsge8 .Lmul8_01e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01e_SGE_done
.Lmul8_01e_SGE_true:
    mul_emit_char 'B'
.Lmul8_01e_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x135e
    ldi16 r5, 0x77aa
    ldi16 r6, 0x58d8
    ldi16 r7, 0x8855
    mul8 r5, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_01f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_EQ_done
.Lmul8_01f_EQ_true:
    mul_emit_char 'B'
.Lmul8_01f_EQ_done:
    brne8 .Lmul8_01f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_NE_done
.Lmul8_01f_NE_true:
    mul_emit_char 'B'
.Lmul8_01f_NE_done:
    brult8 .Lmul8_01f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_ULT_done
.Lmul8_01f_ULT_true:
    mul_emit_char 'B'
.Lmul8_01f_ULT_done:
    bruge8 .Lmul8_01f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_UGE_done
.Lmul8_01f_UGE_true:
    mul_emit_char 'B'
.Lmul8_01f_UGE_done:
    brslt8 .Lmul8_01f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_SLT_done
.Lmul8_01f_SLT_true:
    mul_emit_char 'B'
.Lmul8_01f_SLT_done:
    brsge8 .Lmul8_01f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_01f_SGE_done
.Lmul8_01f_SGE_true:
    mul_emit_char 'B'
.Lmul8_01f_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2202
    ldi16 r5, 0x3613
    ldi16 r6, 0x11ff
    ldi16 r7, 0x7bd7
    mul8 r6, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_020_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_EQ_done
.Lmul8_020_EQ_true:
    mul_emit_char 'B'
.Lmul8_020_EQ_done:
    brne8 .Lmul8_020_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_NE_done
.Lmul8_020_NE_true:
    mul_emit_char 'B'
.Lmul8_020_NE_done:
    brult8 .Lmul8_020_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_ULT_done
.Lmul8_020_ULT_true:
    mul_emit_char 'B'
.Lmul8_020_ULT_done:
    bruge8 .Lmul8_020_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_UGE_done
.Lmul8_020_UGE_true:
    mul_emit_char 'B'
.Lmul8_020_UGE_done:
    brslt8 .Lmul8_020_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_SLT_done
.Lmul8_020_SLT_true:
    mul_emit_char 'B'
.Lmul8_020_SLT_done:
    brsge8 .Lmul8_020_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_020_SGE_done
.Lmul8_020_SGE_true:
    mul_emit_char 'B'
.Lmul8_020_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6680
    ldi16 r5, 0x362a
    ldi16 r6, 0x55fe
    ldi16 r7, 0x7bfa
    mul8 r6, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_021_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_EQ_done
.Lmul8_021_EQ_true:
    mul_emit_char 'B'
.Lmul8_021_EQ_done:
    brne8 .Lmul8_021_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_NE_done
.Lmul8_021_NE_true:
    mul_emit_char 'B'
.Lmul8_021_NE_done:
    brult8 .Lmul8_021_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_ULT_done
.Lmul8_021_ULT_true:
    mul_emit_char 'B'
.Lmul8_021_ULT_done:
    bruge8 .Lmul8_021_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_UGE_done
.Lmul8_021_UGE_true:
    mul_emit_char 'B'
.Lmul8_021_UGE_done:
    brslt8 .Lmul8_021_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_SLT_done
.Lmul8_021_SLT_true:
    mul_emit_char 'B'
.Lmul8_021_SLT_done:
    brsge8 .Lmul8_021_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_021_SGE_done
.Lmul8_021_SGE_true:
    mul_emit_char 'B'
.Lmul8_021_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x3400
    ldi16 r5, 0x3641
    ldi16 r6, 0x1200
    ldi16 r7, 0x7c1d
    mul8 r6, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_022_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_EQ_done
.Lmul8_022_EQ_true:
    mul_emit_char 'B'
.Lmul8_022_EQ_done:
    brne8 .Lmul8_022_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_NE_done
.Lmul8_022_NE_true:
    mul_emit_char 'B'
.Lmul8_022_NE_done:
    brult8 .Lmul8_022_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_ULT_done
.Lmul8_022_ULT_true:
    mul_emit_char 'B'
.Lmul8_022_ULT_done:
    bruge8 .Lmul8_022_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_UGE_done
.Lmul8_022_UGE_true:
    mul_emit_char 'B'
.Lmul8_022_UGE_done:
    brslt8 .Lmul8_022_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_SLT_done
.Lmul8_022_SLT_true:
    mul_emit_char 'B'
.Lmul8_022_SLT_done:
    brsge8 .Lmul8_022_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_022_SGE_done
.Lmul8_022_SGE_true:
    mul_emit_char 'B'
.Lmul8_022_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xbc02
    ldi16 r5, 0x3658
    ldi16 r6, 0x9a7f
    ldi16 r7, 0x7c40
    mul8 r6, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_023_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_EQ_done
.Lmul8_023_EQ_true:
    mul_emit_char 'B'
.Lmul8_023_EQ_done:
    brne8 .Lmul8_023_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_NE_done
.Lmul8_023_NE_true:
    mul_emit_char 'B'
.Lmul8_023_NE_done:
    brult8 .Lmul8_023_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_ULT_done
.Lmul8_023_ULT_true:
    mul_emit_char 'B'
.Lmul8_023_ULT_done:
    bruge8 .Lmul8_023_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_UGE_done
.Lmul8_023_UGE_true:
    mul_emit_char 'B'
.Lmul8_023_UGE_done:
    brslt8 .Lmul8_023_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_SLT_done
.Lmul8_023_SLT_true:
    mul_emit_char 'B'
.Lmul8_023_SLT_done:
    brsge8 .Lmul8_023_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_023_SGE_done
.Lmul8_023_SGE_true:
    mul_emit_char 'B'
.Lmul8_023_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x13bd
    ldi16 r5, 0x7801
    ldi16 r6, 0x5601
    ldi16 r7, 0x7c63
    mul8 r6, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_024_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_EQ_done
.Lmul8_024_EQ_true:
    mul_emit_char 'B'
.Lmul8_024_EQ_done:
    brne8 .Lmul8_024_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_NE_done
.Lmul8_024_NE_true:
    mul_emit_char 'B'
.Lmul8_024_NE_done:
    brult8 .Lmul8_024_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_ULT_done
.Lmul8_024_ULT_true:
    mul_emit_char 'B'
.Lmul8_024_ULT_done:
    bruge8 .Lmul8_024_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_UGE_done
.Lmul8_024_UGE_true:
    mul_emit_char 'B'
.Lmul8_024_UGE_done:
    brslt8 .Lmul8_024_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_SLT_done
.Lmul8_024_SLT_true:
    mul_emit_char 'B'
.Lmul8_024_SLT_done:
    brsge8 .Lmul8_024_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_024_SGE_done
.Lmul8_024_SGE_true:
    mul_emit_char 'B'
.Lmul8_024_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x13d0
    ldi16 r5, 0xf003
    ldi16 r6, 0xde80
    ldi16 r7, 0x7c86
    mul8 r6, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_025_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_EQ_done
.Lmul8_025_EQ_true:
    mul_emit_char 'B'
.Lmul8_025_EQ_done:
    brne8 .Lmul8_025_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_NE_done
.Lmul8_025_NE_true:
    mul_emit_char 'B'
.Lmul8_025_NE_done:
    brult8 .Lmul8_025_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_ULT_done
.Lmul8_025_ULT_true:
    mul_emit_char 'B'
.Lmul8_025_ULT_done:
    bruge8 .Lmul8_025_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_UGE_done
.Lmul8_025_UGE_true:
    mul_emit_char 'B'
.Lmul8_025_UGE_done:
    brslt8 .Lmul8_025_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_SLT_done
.Lmul8_025_SLT_true:
    mul_emit_char 'B'
.Lmul8_025_SLT_done:
    brsge8 .Lmul8_025_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_025_SGE_done
.Lmul8_025_SGE_true:
    mul_emit_char 'B'
.Lmul8_025_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x13e3
    ldi16 r5, 0x447f
    ldi16 r6, 0x3380
    ldi16 r7, 0x7ca9
    mul8 r6, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_026_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_EQ_done
.Lmul8_026_EQ_true:
    mul_emit_char 'B'
.Lmul8_026_EQ_done:
    brne8 .Lmul8_026_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_NE_done
.Lmul8_026_NE_true:
    mul_emit_char 'B'
.Lmul8_026_NE_done:
    brult8 .Lmul8_026_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_ULT_done
.Lmul8_026_ULT_true:
    mul_emit_char 'B'
.Lmul8_026_ULT_done:
    bruge8 .Lmul8_026_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_UGE_done
.Lmul8_026_UGE_true:
    mul_emit_char 'B'
.Lmul8_026_UGE_done:
    brslt8 .Lmul8_026_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_SLT_done
.Lmul8_026_SLT_true:
    mul_emit_char 'B'
.Lmul8_026_SLT_done:
    brsge8 .Lmul8_026_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_026_SGE_done
.Lmul8_026_SGE_true:
    mul_emit_char 'B'
.Lmul8_026_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x13f6
    ldi16 r5, 0x8855
    ldi16 r6, 0x77aa
    ldi16 r7, 0x7ccc
    mul8 r6, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_027_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_EQ_done
.Lmul8_027_EQ_true:
    mul_emit_char 'B'
.Lmul8_027_EQ_done:
    brne8 .Lmul8_027_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_NE_done
.Lmul8_027_NE_true:
    mul_emit_char 'B'
.Lmul8_027_NE_done:
    brult8 .Lmul8_027_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_ULT_done
.Lmul8_027_ULT_true:
    mul_emit_char 'B'
.Lmul8_027_ULT_done:
    bruge8 .Lmul8_027_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_UGE_done
.Lmul8_027_UGE_true:
    mul_emit_char 'B'
.Lmul8_027_UGE_done:
    brslt8 .Lmul8_027_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_SLT_done
.Lmul8_027_SLT_true:
    mul_emit_char 'B'
.Lmul8_027_SLT_done:
    brsge8 .Lmul8_027_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_027_SGE_done
.Lmul8_027_SGE_true:
    mul_emit_char 'B'
.Lmul8_027_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1409
    ldi16 r5, 0x36cb
    ldi16 r6, 0x55fe
    ldi16 r7, 0x7cef
    mul8 r6, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_028_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_EQ_done
.Lmul8_028_EQ_true:
    mul_emit_char 'B'
.Lmul8_028_EQ_done:
    brne8 .Lmul8_028_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_NE_done
.Lmul8_028_NE_true:
    mul_emit_char 'B'
.Lmul8_028_NE_done:
    brult8 .Lmul8_028_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_ULT_done
.Lmul8_028_ULT_true:
    mul_emit_char 'B'
.Lmul8_028_ULT_done:
    bruge8 .Lmul8_028_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_UGE_done
.Lmul8_028_UGE_true:
    mul_emit_char 'B'
.Lmul8_028_UGE_done:
    brslt8 .Lmul8_028_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_SLT_done
.Lmul8_028_SLT_true:
    mul_emit_char 'B'
.Lmul8_028_SLT_done:
    brsge8 .Lmul8_028_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_028_SGE_done
.Lmul8_028_SGE_true:
    mul_emit_char 'B'
.Lmul8_028_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x141c
    ldi16 r5, 0x36e2
    ldi16 r6, 0x1200
    ldi16 r7, 0x7d12
    mul8 r6, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_029_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_EQ_done
.Lmul8_029_EQ_true:
    mul_emit_char 'B'
.Lmul8_029_EQ_done:
    brne8 .Lmul8_029_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_NE_done
.Lmul8_029_NE_true:
    mul_emit_char 'B'
.Lmul8_029_NE_done:
    brult8 .Lmul8_029_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_ULT_done
.Lmul8_029_ULT_true:
    mul_emit_char 'B'
.Lmul8_029_ULT_done:
    bruge8 .Lmul8_029_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_UGE_done
.Lmul8_029_UGE_true:
    mul_emit_char 'B'
.Lmul8_029_UGE_done:
    brslt8 .Lmul8_029_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_SLT_done
.Lmul8_029_SLT_true:
    mul_emit_char 'B'
.Lmul8_029_SLT_done:
    brsge8 .Lmul8_029_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_029_SGE_done
.Lmul8_029_SGE_true:
    mul_emit_char 'B'
.Lmul8_029_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x142f
    ldi16 r5, 0x36f9
    ldi16 r6, 0x9a7f
    ldi16 r7, 0x7d35
    mul8 r6, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_EQ_done
.Lmul8_02a_EQ_true:
    mul_emit_char 'B'
.Lmul8_02a_EQ_done:
    brne8 .Lmul8_02a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_NE_done
.Lmul8_02a_NE_true:
    mul_emit_char 'B'
.Lmul8_02a_NE_done:
    brult8 .Lmul8_02a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_ULT_done
.Lmul8_02a_ULT_true:
    mul_emit_char 'B'
.Lmul8_02a_ULT_done:
    bruge8 .Lmul8_02a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_UGE_done
.Lmul8_02a_UGE_true:
    mul_emit_char 'B'
.Lmul8_02a_UGE_done:
    brslt8 .Lmul8_02a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_SLT_done
.Lmul8_02a_SLT_true:
    mul_emit_char 'B'
.Lmul8_02a_SLT_done:
    brsge8 .Lmul8_02a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02a_SGE_done
.Lmul8_02a_SGE_true:
    mul_emit_char 'B'
.Lmul8_02a_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1442
    ldi16 r5, 0x3710
    ldi16 r6, 0x11ff
    ldi16 r7, 0x7d58
    mul8 r6, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_EQ_done
.Lmul8_02b_EQ_true:
    mul_emit_char 'B'
.Lmul8_02b_EQ_done:
    brne8 .Lmul8_02b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_NE_done
.Lmul8_02b_NE_true:
    mul_emit_char 'B'
.Lmul8_02b_NE_done:
    brult8 .Lmul8_02b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_ULT_done
.Lmul8_02b_ULT_true:
    mul_emit_char 'B'
.Lmul8_02b_ULT_done:
    bruge8 .Lmul8_02b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_UGE_done
.Lmul8_02b_UGE_true:
    mul_emit_char 'B'
.Lmul8_02b_UGE_done:
    brslt8 .Lmul8_02b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_SLT_done
.Lmul8_02b_SLT_true:
    mul_emit_char 'B'
.Lmul8_02b_SLT_done:
    brsge8 .Lmul8_02b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02b_SGE_done
.Lmul8_02b_SGE_true:
    mul_emit_char 'B'
.Lmul8_02b_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1455
    ldi16 r5, 0x3727
    ldi16 r6, 0xde80
    ldi16 r7, 0xf003
    mul8 r6, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_EQ_done
.Lmul8_02c_EQ_true:
    mul_emit_char 'B'
.Lmul8_02c_EQ_done:
    brne8 .Lmul8_02c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_NE_done
.Lmul8_02c_NE_true:
    mul_emit_char 'B'
.Lmul8_02c_NE_done:
    brult8 .Lmul8_02c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_ULT_done
.Lmul8_02c_ULT_true:
    mul_emit_char 'B'
.Lmul8_02c_ULT_done:
    bruge8 .Lmul8_02c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_UGE_done
.Lmul8_02c_UGE_true:
    mul_emit_char 'B'
.Lmul8_02c_UGE_done:
    brslt8 .Lmul8_02c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_SLT_done
.Lmul8_02c_SLT_true:
    mul_emit_char 'B'
.Lmul8_02c_SLT_done:
    brsge8 .Lmul8_02c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02c_SGE_done
.Lmul8_02c_SGE_true:
    mul_emit_char 'B'
.Lmul8_02c_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1468
    ldi16 r5, 0x373e
    ldi16 r6, 0x3380
    ldi16 r7, 0x447f
    mul8 r6, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_EQ_done
.Lmul8_02d_EQ_true:
    mul_emit_char 'B'
.Lmul8_02d_EQ_done:
    brne8 .Lmul8_02d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_NE_done
.Lmul8_02d_NE_true:
    mul_emit_char 'B'
.Lmul8_02d_NE_done:
    brult8 .Lmul8_02d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_ULT_done
.Lmul8_02d_ULT_true:
    mul_emit_char 'B'
.Lmul8_02d_ULT_done:
    bruge8 .Lmul8_02d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_UGE_done
.Lmul8_02d_UGE_true:
    mul_emit_char 'B'
.Lmul8_02d_UGE_done:
    brslt8 .Lmul8_02d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_SLT_done
.Lmul8_02d_SLT_true:
    mul_emit_char 'B'
.Lmul8_02d_SLT_done:
    brsge8 .Lmul8_02d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02d_SGE_done
.Lmul8_02d_SGE_true:
    mul_emit_char 'B'
.Lmul8_02d_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x147b
    ldi16 r5, 0x3755
    ldi16 r6, 0x77aa
    ldi16 r7, 0x8855
    mul8 r6, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_EQ_done
.Lmul8_02e_EQ_true:
    mul_emit_char 'B'
.Lmul8_02e_EQ_done:
    brne8 .Lmul8_02e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_NE_done
.Lmul8_02e_NE_true:
    mul_emit_char 'B'
.Lmul8_02e_NE_done:
    brult8 .Lmul8_02e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_ULT_done
.Lmul8_02e_ULT_true:
    mul_emit_char 'B'
.Lmul8_02e_ULT_done:
    bruge8 .Lmul8_02e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_UGE_done
.Lmul8_02e_UGE_true:
    mul_emit_char 'B'
.Lmul8_02e_UGE_done:
    brslt8 .Lmul8_02e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_SLT_done
.Lmul8_02e_SLT_true:
    mul_emit_char 'B'
.Lmul8_02e_SLT_done:
    brsge8 .Lmul8_02e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02e_SGE_done
.Lmul8_02e_SGE_true:
    mul_emit_char 'B'
.Lmul8_02e_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x148e
    ldi16 r5, 0x376c
    ldi16 r6, 0x5601
    ldi16 r7, 0x7801
    mul8 r6, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_02f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_EQ_done
.Lmul8_02f_EQ_true:
    mul_emit_char 'B'
.Lmul8_02f_EQ_done:
    brne8 .Lmul8_02f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_NE_done
.Lmul8_02f_NE_true:
    mul_emit_char 'B'
.Lmul8_02f_NE_done:
    brult8 .Lmul8_02f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_ULT_done
.Lmul8_02f_ULT_true:
    mul_emit_char 'B'
.Lmul8_02f_ULT_done:
    bruge8 .Lmul8_02f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_UGE_done
.Lmul8_02f_UGE_true:
    mul_emit_char 'B'
.Lmul8_02f_UGE_done:
    brslt8 .Lmul8_02f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_SLT_done
.Lmul8_02f_SLT_true:
    mul_emit_char 'B'
.Lmul8_02f_SLT_done:
    brsge8 .Lmul8_02f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_02f_SGE_done
.Lmul8_02f_SGE_true:
    mul_emit_char 'B'
.Lmul8_02f_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6680
    ldi16 r5, 0x3783
    ldi16 r6, 0x5ac5
    ldi16 r7, 0x55fe
    mul8 r7, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_030_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_EQ_done
.Lmul8_030_EQ_true:
    mul_emit_char 'B'
.Lmul8_030_EQ_done:
    brne8 .Lmul8_030_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_NE_done
.Lmul8_030_NE_true:
    mul_emit_char 'B'
.Lmul8_030_NE_done:
    brult8 .Lmul8_030_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_ULT_done
.Lmul8_030_ULT_true:
    mul_emit_char 'B'
.Lmul8_030_ULT_done:
    bruge8 .Lmul8_030_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_UGE_done
.Lmul8_030_UGE_true:
    mul_emit_char 'B'
.Lmul8_030_UGE_done:
    brslt8 .Lmul8_030_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_SLT_done
.Lmul8_030_SLT_true:
    mul_emit_char 'B'
.Lmul8_030_SLT_done:
    brsge8 .Lmul8_030_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_030_SGE_done
.Lmul8_030_SGE_true:
    mul_emit_char 'B'
.Lmul8_030_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x3400
    ldi16 r5, 0x379a
    ldi16 r6, 0x5ae2
    ldi16 r7, 0x1200
    mul8 r7, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_031_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_EQ_done
.Lmul8_031_EQ_true:
    mul_emit_char 'B'
.Lmul8_031_EQ_done:
    brne8 .Lmul8_031_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_NE_done
.Lmul8_031_NE_true:
    mul_emit_char 'B'
.Lmul8_031_NE_done:
    brult8 .Lmul8_031_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_ULT_done
.Lmul8_031_ULT_true:
    mul_emit_char 'B'
.Lmul8_031_ULT_done:
    bruge8 .Lmul8_031_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_UGE_done
.Lmul8_031_UGE_true:
    mul_emit_char 'B'
.Lmul8_031_UGE_done:
    brslt8 .Lmul8_031_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_SLT_done
.Lmul8_031_SLT_true:
    mul_emit_char 'B'
.Lmul8_031_SLT_done:
    brsge8 .Lmul8_031_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_031_SGE_done
.Lmul8_031_SGE_true:
    mul_emit_char 'B'
.Lmul8_031_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xbc02
    ldi16 r5, 0x37b1
    ldi16 r6, 0x5aff
    ldi16 r7, 0x9a7f
    mul8 r7, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_032_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_EQ_done
.Lmul8_032_EQ_true:
    mul_emit_char 'B'
.Lmul8_032_EQ_done:
    brne8 .Lmul8_032_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_NE_done
.Lmul8_032_NE_true:
    mul_emit_char 'B'
.Lmul8_032_NE_done:
    brult8 .Lmul8_032_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_ULT_done
.Lmul8_032_ULT_true:
    mul_emit_char 'B'
.Lmul8_032_ULT_done:
    bruge8 .Lmul8_032_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_UGE_done
.Lmul8_032_UGE_true:
    mul_emit_char 'B'
.Lmul8_032_UGE_done:
    brslt8 .Lmul8_032_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_SLT_done
.Lmul8_032_SLT_true:
    mul_emit_char 'B'
.Lmul8_032_SLT_done:
    brsge8 .Lmul8_032_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_032_SGE_done
.Lmul8_032_SGE_true:
    mul_emit_char 'B'
.Lmul8_032_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2202
    ldi16 r5, 0x37c8
    ldi16 r6, 0x5b1c
    ldi16 r7, 0x11ff
    mul8 r7, r4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_033_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_EQ_done
.Lmul8_033_EQ_true:
    mul_emit_char 'B'
.Lmul8_033_EQ_done:
    brne8 .Lmul8_033_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_NE_done
.Lmul8_033_NE_true:
    mul_emit_char 'B'
.Lmul8_033_NE_done:
    brult8 .Lmul8_033_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_ULT_done
.Lmul8_033_ULT_true:
    mul_emit_char 'B'
.Lmul8_033_ULT_done:
    bruge8 .Lmul8_033_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_UGE_done
.Lmul8_033_UGE_true:
    mul_emit_char 'B'
.Lmul8_033_UGE_done:
    brslt8 .Lmul8_033_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_SLT_done
.Lmul8_033_SLT_true:
    mul_emit_char 'B'
.Lmul8_033_SLT_done:
    brsge8 .Lmul8_033_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_033_SGE_done
.Lmul8_033_SGE_true:
    mul_emit_char 'B'
.Lmul8_033_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x14ed
    ldi16 r5, 0xf003
    ldi16 r6, 0x5b39
    ldi16 r7, 0xde80
    mul8 r7, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_034_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_EQ_done
.Lmul8_034_EQ_true:
    mul_emit_char 'B'
.Lmul8_034_EQ_done:
    brne8 .Lmul8_034_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_NE_done
.Lmul8_034_NE_true:
    mul_emit_char 'B'
.Lmul8_034_NE_done:
    brult8 .Lmul8_034_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_ULT_done
.Lmul8_034_ULT_true:
    mul_emit_char 'B'
.Lmul8_034_ULT_done:
    bruge8 .Lmul8_034_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_UGE_done
.Lmul8_034_UGE_true:
    mul_emit_char 'B'
.Lmul8_034_UGE_done:
    brslt8 .Lmul8_034_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_SLT_done
.Lmul8_034_SLT_true:
    mul_emit_char 'B'
.Lmul8_034_SLT_done:
    brsge8 .Lmul8_034_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_034_SGE_done
.Lmul8_034_SGE_true:
    mul_emit_char 'B'
.Lmul8_034_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1500
    ldi16 r5, 0x447f
    ldi16 r6, 0x5b56
    ldi16 r7, 0x3380
    mul8 r7, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_035_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_EQ_done
.Lmul8_035_EQ_true:
    mul_emit_char 'B'
.Lmul8_035_EQ_done:
    brne8 .Lmul8_035_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_NE_done
.Lmul8_035_NE_true:
    mul_emit_char 'B'
.Lmul8_035_NE_done:
    brult8 .Lmul8_035_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_ULT_done
.Lmul8_035_ULT_true:
    mul_emit_char 'B'
.Lmul8_035_ULT_done:
    bruge8 .Lmul8_035_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_UGE_done
.Lmul8_035_UGE_true:
    mul_emit_char 'B'
.Lmul8_035_UGE_done:
    brslt8 .Lmul8_035_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_SLT_done
.Lmul8_035_SLT_true:
    mul_emit_char 'B'
.Lmul8_035_SLT_done:
    brsge8 .Lmul8_035_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_035_SGE_done
.Lmul8_035_SGE_true:
    mul_emit_char 'B'
.Lmul8_035_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1513
    ldi16 r5, 0x8855
    ldi16 r6, 0x5b73
    ldi16 r7, 0x77aa
    mul8 r7, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_036_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_EQ_done
.Lmul8_036_EQ_true:
    mul_emit_char 'B'
.Lmul8_036_EQ_done:
    brne8 .Lmul8_036_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_NE_done
.Lmul8_036_NE_true:
    mul_emit_char 'B'
.Lmul8_036_NE_done:
    brult8 .Lmul8_036_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_ULT_done
.Lmul8_036_ULT_true:
    mul_emit_char 'B'
.Lmul8_036_ULT_done:
    bruge8 .Lmul8_036_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_UGE_done
.Lmul8_036_UGE_true:
    mul_emit_char 'B'
.Lmul8_036_UGE_done:
    brslt8 .Lmul8_036_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_SLT_done
.Lmul8_036_SLT_true:
    mul_emit_char 'B'
.Lmul8_036_SLT_done:
    brsge8 .Lmul8_036_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_036_SGE_done
.Lmul8_036_SGE_true:
    mul_emit_char 'B'
.Lmul8_036_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1526
    ldi16 r5, 0x7801
    ldi16 r6, 0x5b90
    ldi16 r7, 0x5601
    mul8 r7, r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_037_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_EQ_done
.Lmul8_037_EQ_true:
    mul_emit_char 'B'
.Lmul8_037_EQ_done:
    brne8 .Lmul8_037_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_NE_done
.Lmul8_037_NE_true:
    mul_emit_char 'B'
.Lmul8_037_NE_done:
    brult8 .Lmul8_037_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_ULT_done
.Lmul8_037_ULT_true:
    mul_emit_char 'B'
.Lmul8_037_ULT_done:
    bruge8 .Lmul8_037_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_UGE_done
.Lmul8_037_UGE_true:
    mul_emit_char 'B'
.Lmul8_037_UGE_done:
    brslt8 .Lmul8_037_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_SLT_done
.Lmul8_037_SLT_true:
    mul_emit_char 'B'
.Lmul8_037_SLT_done:
    brsge8 .Lmul8_037_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_037_SGE_done
.Lmul8_037_SGE_true:
    mul_emit_char 'B'
.Lmul8_037_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1539
    ldi16 r5, 0x383b
    ldi16 r6, 0x3400
    ldi16 r7, 0x1200
    mul8 r7, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_038_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_EQ_done
.Lmul8_038_EQ_true:
    mul_emit_char 'B'
.Lmul8_038_EQ_done:
    brne8 .Lmul8_038_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_NE_done
.Lmul8_038_NE_true:
    mul_emit_char 'B'
.Lmul8_038_NE_done:
    brult8 .Lmul8_038_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_ULT_done
.Lmul8_038_ULT_true:
    mul_emit_char 'B'
.Lmul8_038_ULT_done:
    bruge8 .Lmul8_038_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_UGE_done
.Lmul8_038_UGE_true:
    mul_emit_char 'B'
.Lmul8_038_UGE_done:
    brslt8 .Lmul8_038_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_SLT_done
.Lmul8_038_SLT_true:
    mul_emit_char 'B'
.Lmul8_038_SLT_done:
    brsge8 .Lmul8_038_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_038_SGE_done
.Lmul8_038_SGE_true:
    mul_emit_char 'B'
.Lmul8_038_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x154c
    ldi16 r5, 0x3852
    ldi16 r6, 0xbc02
    ldi16 r7, 0x9a7f
    mul8 r7, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_039_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_EQ_done
.Lmul8_039_EQ_true:
    mul_emit_char 'B'
.Lmul8_039_EQ_done:
    brne8 .Lmul8_039_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_NE_done
.Lmul8_039_NE_true:
    mul_emit_char 'B'
.Lmul8_039_NE_done:
    brult8 .Lmul8_039_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_ULT_done
.Lmul8_039_ULT_true:
    mul_emit_char 'B'
.Lmul8_039_ULT_done:
    bruge8 .Lmul8_039_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_UGE_done
.Lmul8_039_UGE_true:
    mul_emit_char 'B'
.Lmul8_039_UGE_done:
    brslt8 .Lmul8_039_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_SLT_done
.Lmul8_039_SLT_true:
    mul_emit_char 'B'
.Lmul8_039_SLT_done:
    brsge8 .Lmul8_039_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_039_SGE_done
.Lmul8_039_SGE_true:
    mul_emit_char 'B'
.Lmul8_039_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x155f
    ldi16 r5, 0x3869
    ldi16 r6, 0x2202
    ldi16 r7, 0x11ff
    mul8 r7, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_EQ_done
.Lmul8_03a_EQ_true:
    mul_emit_char 'B'
.Lmul8_03a_EQ_done:
    brne8 .Lmul8_03a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_NE_done
.Lmul8_03a_NE_true:
    mul_emit_char 'B'
.Lmul8_03a_NE_done:
    brult8 .Lmul8_03a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_ULT_done
.Lmul8_03a_ULT_true:
    mul_emit_char 'B'
.Lmul8_03a_ULT_done:
    bruge8 .Lmul8_03a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_UGE_done
.Lmul8_03a_UGE_true:
    mul_emit_char 'B'
.Lmul8_03a_UGE_done:
    brslt8 .Lmul8_03a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_SLT_done
.Lmul8_03a_SLT_true:
    mul_emit_char 'B'
.Lmul8_03a_SLT_done:
    brsge8 .Lmul8_03a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03a_SGE_done
.Lmul8_03a_SGE_true:
    mul_emit_char 'B'
.Lmul8_03a_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1572
    ldi16 r5, 0x3880
    ldi16 r6, 0x6680
    ldi16 r7, 0x55fe
    mul8 r7, r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_EQ_done
.Lmul8_03b_EQ_true:
    mul_emit_char 'B'
.Lmul8_03b_EQ_done:
    brne8 .Lmul8_03b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_NE_done
.Lmul8_03b_NE_true:
    mul_emit_char 'B'
.Lmul8_03b_NE_done:
    brult8 .Lmul8_03b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_ULT_done
.Lmul8_03b_ULT_true:
    mul_emit_char 'B'
.Lmul8_03b_ULT_done:
    bruge8 .Lmul8_03b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_UGE_done
.Lmul8_03b_UGE_true:
    mul_emit_char 'B'
.Lmul8_03b_UGE_done:
    brslt8 .Lmul8_03b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_SLT_done
.Lmul8_03b_SLT_true:
    mul_emit_char 'B'
.Lmul8_03b_SLT_done:
    brsge8 .Lmul8_03b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03b_SGE_done
.Lmul8_03b_SGE_true:
    mul_emit_char 'B'
.Lmul8_03b_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1585
    ldi16 r5, 0x3897
    ldi16 r6, 0x5c21
    ldi16 r7, 0x3380
    mul8 r7, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_EQ_done
.Lmul8_03c_EQ_true:
    mul_emit_char 'B'
.Lmul8_03c_EQ_done:
    brne8 .Lmul8_03c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_NE_done
.Lmul8_03c_NE_true:
    mul_emit_char 'B'
.Lmul8_03c_NE_done:
    brult8 .Lmul8_03c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_ULT_done
.Lmul8_03c_ULT_true:
    mul_emit_char 'B'
.Lmul8_03c_ULT_done:
    bruge8 .Lmul8_03c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_UGE_done
.Lmul8_03c_UGE_true:
    mul_emit_char 'B'
.Lmul8_03c_UGE_done:
    brslt8 .Lmul8_03c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_SLT_done
.Lmul8_03c_SLT_true:
    mul_emit_char 'B'
.Lmul8_03c_SLT_done:
    brsge8 .Lmul8_03c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03c_SGE_done
.Lmul8_03c_SGE_true:
    mul_emit_char 'B'
.Lmul8_03c_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1598
    ldi16 r5, 0x38ae
    ldi16 r6, 0x5c3e
    ldi16 r7, 0x77aa
    mul8 r7, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_EQ_done
.Lmul8_03d_EQ_true:
    mul_emit_char 'B'
.Lmul8_03d_EQ_done:
    brne8 .Lmul8_03d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_NE_done
.Lmul8_03d_NE_true:
    mul_emit_char 'B'
.Lmul8_03d_NE_done:
    brult8 .Lmul8_03d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_ULT_done
.Lmul8_03d_ULT_true:
    mul_emit_char 'B'
.Lmul8_03d_ULT_done:
    bruge8 .Lmul8_03d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_UGE_done
.Lmul8_03d_UGE_true:
    mul_emit_char 'B'
.Lmul8_03d_UGE_done:
    brslt8 .Lmul8_03d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_SLT_done
.Lmul8_03d_SLT_true:
    mul_emit_char 'B'
.Lmul8_03d_SLT_done:
    brsge8 .Lmul8_03d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03d_SGE_done
.Lmul8_03d_SGE_true:
    mul_emit_char 'B'
.Lmul8_03d_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x15ab
    ldi16 r5, 0x38c5
    ldi16 r6, 0x5c5b
    ldi16 r7, 0x5601
    mul8 r7, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_EQ_done
.Lmul8_03e_EQ_true:
    mul_emit_char 'B'
.Lmul8_03e_EQ_done:
    brne8 .Lmul8_03e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_NE_done
.Lmul8_03e_NE_true:
    mul_emit_char 'B'
.Lmul8_03e_NE_done:
    brult8 .Lmul8_03e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_ULT_done
.Lmul8_03e_ULT_true:
    mul_emit_char 'B'
.Lmul8_03e_ULT_done:
    bruge8 .Lmul8_03e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_UGE_done
.Lmul8_03e_UGE_true:
    mul_emit_char 'B'
.Lmul8_03e_UGE_done:
    brslt8 .Lmul8_03e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_SLT_done
.Lmul8_03e_SLT_true:
    mul_emit_char 'B'
.Lmul8_03e_SLT_done:
    brsge8 .Lmul8_03e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03e_SGE_done
.Lmul8_03e_SGE_true:
    mul_emit_char 'B'
.Lmul8_03e_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x15be
    ldi16 r5, 0x38dc
    ldi16 r6, 0x5c78
    ldi16 r7, 0xde80
    mul8 r7, r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    mul_print_r0_r3
    breq8 .Lmul8_03f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_EQ_done
.Lmul8_03f_EQ_true:
    mul_emit_char 'B'
.Lmul8_03f_EQ_done:
    brne8 .Lmul8_03f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_NE_done
.Lmul8_03f_NE_true:
    mul_emit_char 'B'
.Lmul8_03f_NE_done:
    brult8 .Lmul8_03f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_ULT_done
.Lmul8_03f_ULT_true:
    mul_emit_char 'B'
.Lmul8_03f_ULT_done:
    bruge8 .Lmul8_03f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_UGE_done
.Lmul8_03f_UGE_true:
    mul_emit_char 'B'
.Lmul8_03f_UGE_done:
    brslt8 .Lmul8_03f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_SLT_done
.Lmul8_03f_SLT_true:
    mul_emit_char 'B'
.Lmul8_03f_SLT_done:
    brsge8 .Lmul8_03f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul8_03f_SGE_done
.Lmul8_03f_SGE_true:
    mul_emit_char 'B'
.Lmul8_03f_SGE_done:
    mul_emit_char '\n'

    sys debug_break
