.include "include/multiplication_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; d=r0, s=r0, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x4b01
    push16 r4
    pop16 r1
    mul16 r0, r0
    push16 r1
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_000_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_EQ_done
.Lmul16_000_EQ_true:
    mul_emit_char 'B'
.Lmul16_000_EQ_done:
    brne8 .Lmul16_000_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_NE_done
.Lmul16_000_NE_true:
    mul_emit_char 'B'
.Lmul16_000_NE_done:
    brult8 .Lmul16_000_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_ULT_done
.Lmul16_000_ULT_true:
    mul_emit_char 'B'
.Lmul16_000_ULT_done:
    bruge8 .Lmul16_000_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_UGE_done
.Lmul16_000_UGE_true:
    mul_emit_char 'B'
.Lmul16_000_UGE_done:
    brslt8 .Lmul16_000_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_SLT_done
.Lmul16_000_SLT_true:
    mul_emit_char 'B'
.Lmul16_000_SLT_done:
    brsge8 .Lmul16_000_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_000_SGE_done
.Lmul16_000_SGE_true:
    mul_emit_char 'B'
.Lmul16_000_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r0, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x4c5d
    push16 r4
    pop16 r2
    mul16 r0, r0
    push16 r2
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_001_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_EQ_done
.Lmul16_001_EQ_true:
    mul_emit_char 'B'
.Lmul16_001_EQ_done:
    brne8 .Lmul16_001_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_NE_done
.Lmul16_001_NE_true:
    mul_emit_char 'B'
.Lmul16_001_NE_done:
    brult8 .Lmul16_001_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_ULT_done
.Lmul16_001_ULT_true:
    mul_emit_char 'B'
.Lmul16_001_ULT_done:
    bruge8 .Lmul16_001_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_UGE_done
.Lmul16_001_UGE_true:
    mul_emit_char 'B'
.Lmul16_001_UGE_done:
    brslt8 .Lmul16_001_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_SLT_done
.Lmul16_001_SLT_true:
    mul_emit_char 'B'
.Lmul16_001_SLT_done:
    brsge8 .Lmul16_001_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_001_SGE_done
.Lmul16_001_SGE_true:
    mul_emit_char 'B'
.Lmul16_001_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r1, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0100
    push16 r5
    pop16 r0
    ldi16 r5, 0x0100
    push16 r5
    pop16 r1
    ldi16 r5, 0x4eba
    push16 r5
    pop16 r4
    mul16 r0, r1
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_002_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_EQ_done
.Lmul16_002_EQ_true:
    mul_emit_char 'B'
.Lmul16_002_EQ_done:
    brne8 .Lmul16_002_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_NE_done
.Lmul16_002_NE_true:
    mul_emit_char 'B'
.Lmul16_002_NE_done:
    brult8 .Lmul16_002_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_ULT_done
.Lmul16_002_ULT_true:
    mul_emit_char 'B'
.Lmul16_002_ULT_done:
    bruge8 .Lmul16_002_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_UGE_done
.Lmul16_002_UGE_true:
    mul_emit_char 'B'
.Lmul16_002_UGE_done:
    brslt8 .Lmul16_002_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_SLT_done
.Lmul16_002_SLT_true:
    mul_emit_char 'B'
.Lmul16_002_SLT_done:
    brsge8 .Lmul16_002_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_002_SGE_done
.Lmul16_002_SGE_true:
    mul_emit_char 'B'
.Lmul16_002_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r1, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r0
    ldi16 r4, 0x0002
    push16 r4
    pop16 r1
    ldi16 r4, 0x5016
    push16 r4
    pop16 r5
    mul16 r0, r1
    push16 r5
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_003_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_EQ_done
.Lmul16_003_EQ_true:
    mul_emit_char 'B'
.Lmul16_003_EQ_done:
    brne8 .Lmul16_003_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_NE_done
.Lmul16_003_NE_true:
    mul_emit_char 'B'
.Lmul16_003_NE_done:
    brult8 .Lmul16_003_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_ULT_done
.Lmul16_003_ULT_true:
    mul_emit_char 'B'
.Lmul16_003_ULT_done:
    bruge8 .Lmul16_003_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_UGE_done
.Lmul16_003_UGE_true:
    mul_emit_char 'B'
.Lmul16_003_UGE_done:
    brslt8 .Lmul16_003_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_SLT_done
.Lmul16_003_SLT_true:
    mul_emit_char 'B'
.Lmul16_003_SLT_done:
    brsge8 .Lmul16_003_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_003_SGE_done
.Lmul16_003_SGE_true:
    mul_emit_char 'B'
.Lmul16_003_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r2, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x5273
    push16 r4
    pop16 r7
    mul16 r0, r2
    push16 r7
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_004_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_EQ_done
.Lmul16_004_EQ_true:
    mul_emit_char 'B'
.Lmul16_004_EQ_done:
    brne8 .Lmul16_004_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_NE_done
.Lmul16_004_NE_true:
    mul_emit_char 'B'
.Lmul16_004_NE_done:
    brult8 .Lmul16_004_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_ULT_done
.Lmul16_004_ULT_true:
    mul_emit_char 'B'
.Lmul16_004_ULT_done:
    bruge8 .Lmul16_004_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_UGE_done
.Lmul16_004_UGE_true:
    mul_emit_char 'B'
.Lmul16_004_UGE_done:
    brslt8 .Lmul16_004_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_SLT_done
.Lmul16_004_SLT_true:
    mul_emit_char 'B'
.Lmul16_004_SLT_done:
    brsge8 .Lmul16_004_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_004_SGE_done
.Lmul16_004_SGE_true:
    mul_emit_char 'B'
.Lmul16_004_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r2, pattern 1; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x4cc8
    push16 r4
    pop16 r1
    mul16 r0, r2
    push16 r1
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_005_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_EQ_done
.Lmul16_005_EQ_true:
    mul_emit_char 'B'
.Lmul16_005_EQ_done:
    brne8 .Lmul16_005_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_NE_done
.Lmul16_005_NE_true:
    mul_emit_char 'B'
.Lmul16_005_NE_done:
    brult8 .Lmul16_005_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_ULT_done
.Lmul16_005_ULT_true:
    mul_emit_char 'B'
.Lmul16_005_ULT_done:
    bruge8 .Lmul16_005_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_UGE_done
.Lmul16_005_UGE_true:
    mul_emit_char 'B'
.Lmul16_005_UGE_done:
    brslt8 .Lmul16_005_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_SLT_done
.Lmul16_005_SLT_true:
    mul_emit_char 'B'
.Lmul16_005_SLT_done:
    brsge8 .Lmul16_005_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_005_SGE_done
.Lmul16_005_SGE_true:
    mul_emit_char 'B'
.Lmul16_005_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r3, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r0
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x4e24
    push16 r4
    pop16 r2
    mul16 r0, r3
    push16 r2
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_006_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_EQ_done
.Lmul16_006_EQ_true:
    mul_emit_char 'B'
.Lmul16_006_EQ_done:
    brne8 .Lmul16_006_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_NE_done
.Lmul16_006_NE_true:
    mul_emit_char 'B'
.Lmul16_006_NE_done:
    brult8 .Lmul16_006_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_ULT_done
.Lmul16_006_ULT_true:
    mul_emit_char 'B'
.Lmul16_006_ULT_done:
    bruge8 .Lmul16_006_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_UGE_done
.Lmul16_006_UGE_true:
    mul_emit_char 'B'
.Lmul16_006_UGE_done:
    brslt8 .Lmul16_006_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_SLT_done
.Lmul16_006_SLT_true:
    mul_emit_char 'B'
.Lmul16_006_SLT_done:
    brsge8 .Lmul16_006_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_006_SGE_done
.Lmul16_006_SGE_true:
    mul_emit_char 'B'
.Lmul16_006_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r3, pattern 1; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0100
    push16 r5
    pop16 r0
    ldi16 r5, 0x0100
    push16 r5
    pop16 r3
    ldi16 r5, 0x5081
    push16 r5
    pop16 r4
    mul16 r0, r3
    push16 r4
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_007_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_EQ_done
.Lmul16_007_EQ_true:
    mul_emit_char 'B'
.Lmul16_007_EQ_done:
    brne8 .Lmul16_007_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_NE_done
.Lmul16_007_NE_true:
    mul_emit_char 'B'
.Lmul16_007_NE_done:
    brult8 .Lmul16_007_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_ULT_done
.Lmul16_007_ULT_true:
    mul_emit_char 'B'
.Lmul16_007_ULT_done:
    bruge8 .Lmul16_007_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_UGE_done
.Lmul16_007_UGE_true:
    mul_emit_char 'B'
.Lmul16_007_UGE_done:
    brslt8 .Lmul16_007_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_SLT_done
.Lmul16_007_SLT_true:
    mul_emit_char 'B'
.Lmul16_007_SLT_done:
    brsge8 .Lmul16_007_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_007_SGE_done
.Lmul16_007_SGE_true:
    mul_emit_char 'B'
.Lmul16_007_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r4, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x7fff
    push16 r6
    pop16 r0
    ldi16 r6, 0x0002
    push16 r6
    pop16 r4
    ldi16 r6, 0x51dd
    push16 r6
    pop16 r5
    mul16 r0, r4
    push16 r5
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_008_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_EQ_done
.Lmul16_008_EQ_true:
    mul_emit_char 'B'
.Lmul16_008_EQ_done:
    brne8 .Lmul16_008_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_NE_done
.Lmul16_008_NE_true:
    mul_emit_char 'B'
.Lmul16_008_NE_done:
    brult8 .Lmul16_008_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_ULT_done
.Lmul16_008_ULT_true:
    mul_emit_char 'B'
.Lmul16_008_ULT_done:
    bruge8 .Lmul16_008_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_UGE_done
.Lmul16_008_UGE_true:
    mul_emit_char 'B'
.Lmul16_008_UGE_done:
    brslt8 .Lmul16_008_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_SLT_done
.Lmul16_008_SLT_true:
    mul_emit_char 'B'
.Lmul16_008_SLT_done:
    brsge8 .Lmul16_008_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_008_SGE_done
.Lmul16_008_SGE_true:
    mul_emit_char 'B'
.Lmul16_008_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r4, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r0
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x5339
    push16 r5
    pop16 r6
    mul16 r0, r4
    push16 r6
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_009_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_EQ_done
.Lmul16_009_EQ_true:
    mul_emit_char 'B'
.Lmul16_009_EQ_done:
    brne8 .Lmul16_009_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_NE_done
.Lmul16_009_NE_true:
    mul_emit_char 'B'
.Lmul16_009_NE_done:
    brult8 .Lmul16_009_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_ULT_done
.Lmul16_009_ULT_true:
    mul_emit_char 'B'
.Lmul16_009_ULT_done:
    bruge8 .Lmul16_009_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_UGE_done
.Lmul16_009_UGE_true:
    mul_emit_char 'B'
.Lmul16_009_UGE_done:
    brslt8 .Lmul16_009_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_SLT_done
.Lmul16_009_SLT_true:
    mul_emit_char 'B'
.Lmul16_009_SLT_done:
    brsge8 .Lmul16_009_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_009_SGE_done
.Lmul16_009_SGE_true:
    mul_emit_char 'B'
.Lmul16_009_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r5, pattern 0; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r0
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r5
    ldi16 r4, 0x4e8f
    push16 r4
    pop16 r1
    mul16 r0, r5
    push16 r1
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_EQ_done
.Lmul16_00a_EQ_true:
    mul_emit_char 'B'
.Lmul16_00a_EQ_done:
    brne8 .Lmul16_00a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_NE_done
.Lmul16_00a_NE_true:
    mul_emit_char 'B'
.Lmul16_00a_NE_done:
    brult8 .Lmul16_00a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_ULT_done
.Lmul16_00a_ULT_true:
    mul_emit_char 'B'
.Lmul16_00a_ULT_done:
    bruge8 .Lmul16_00a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_UGE_done
.Lmul16_00a_UGE_true:
    mul_emit_char 'B'
.Lmul16_00a_UGE_done:
    brslt8 .Lmul16_00a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_SLT_done
.Lmul16_00a_SLT_true:
    mul_emit_char 'B'
.Lmul16_00a_SLT_done:
    brsge8 .Lmul16_00a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00a_SGE_done
.Lmul16_00a_SGE_true:
    mul_emit_char 'B'
.Lmul16_00a_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r5, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r0
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x4eea
    push16 r4
    pop16 r1
    mul16 r0, r5
    push16 r1
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_EQ_done
.Lmul16_00b_EQ_true:
    mul_emit_char 'B'
.Lmul16_00b_EQ_done:
    brne8 .Lmul16_00b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_NE_done
.Lmul16_00b_NE_true:
    mul_emit_char 'B'
.Lmul16_00b_NE_done:
    brult8 .Lmul16_00b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_ULT_done
.Lmul16_00b_ULT_true:
    mul_emit_char 'B'
.Lmul16_00b_ULT_done:
    bruge8 .Lmul16_00b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_UGE_done
.Lmul16_00b_UGE_true:
    mul_emit_char 'B'
.Lmul16_00b_UGE_done:
    brslt8 .Lmul16_00b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_SLT_done
.Lmul16_00b_SLT_true:
    mul_emit_char 'B'
.Lmul16_00b_SLT_done:
    brsge8 .Lmul16_00b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00b_SGE_done
.Lmul16_00b_SGE_true:
    mul_emit_char 'B'
.Lmul16_00b_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r6, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x0101
    push16 r4
    pop16 r6
    ldi16 r4, 0x5147
    push16 r4
    pop16 r3
    mul16 r0, r6
    push16 r3
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_EQ_done
.Lmul16_00c_EQ_true:
    mul_emit_char 'B'
.Lmul16_00c_EQ_done:
    brne8 .Lmul16_00c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_NE_done
.Lmul16_00c_NE_true:
    mul_emit_char 'B'
.Lmul16_00c_NE_done:
    brult8 .Lmul16_00c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_ULT_done
.Lmul16_00c_ULT_true:
    mul_emit_char 'B'
.Lmul16_00c_ULT_done:
    bruge8 .Lmul16_00c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_UGE_done
.Lmul16_00c_UGE_true:
    mul_emit_char 'B'
.Lmul16_00c_UGE_done:
    brslt8 .Lmul16_00c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_SLT_done
.Lmul16_00c_SLT_true:
    mul_emit_char 'B'
.Lmul16_00c_SLT_done:
    brsge8 .Lmul16_00c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00c_SGE_done
.Lmul16_00c_SGE_true:
    mul_emit_char 'B'
.Lmul16_00c_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r6, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x7fff
    push16 r5
    pop16 r0
    ldi16 r5, 0x0002
    push16 r5
    pop16 r6
    ldi16 r5, 0x52a3
    push16 r5
    pop16 r4
    mul16 r0, r6
    push16 r4
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_EQ_done
.Lmul16_00d_EQ_true:
    mul_emit_char 'B'
.Lmul16_00d_EQ_done:
    brne8 .Lmul16_00d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_NE_done
.Lmul16_00d_NE_true:
    mul_emit_char 'B'
.Lmul16_00d_NE_done:
    brult8 .Lmul16_00d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_ULT_done
.Lmul16_00d_ULT_true:
    mul_emit_char 'B'
.Lmul16_00d_ULT_done:
    bruge8 .Lmul16_00d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_UGE_done
.Lmul16_00d_UGE_true:
    mul_emit_char 'B'
.Lmul16_00d_UGE_done:
    brslt8 .Lmul16_00d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_SLT_done
.Lmul16_00d_SLT_true:
    mul_emit_char 'B'
.Lmul16_00d_SLT_done:
    brsge8 .Lmul16_00d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00d_SGE_done
.Lmul16_00d_SGE_true:
    mul_emit_char 'B'
.Lmul16_00d_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r7, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r0
    ldi16 r4, 0x0002
    push16 r4
    pop16 r7
    ldi16 r4, 0x5500
    push16 r4
    pop16 r6
    mul16 r0, r7
    push16 r6
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_EQ_done
.Lmul16_00e_EQ_true:
    mul_emit_char 'B'
.Lmul16_00e_EQ_done:
    brne8 .Lmul16_00e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_NE_done
.Lmul16_00e_NE_true:
    mul_emit_char 'B'
.Lmul16_00e_NE_done:
    brult8 .Lmul16_00e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_ULT_done
.Lmul16_00e_ULT_true:
    mul_emit_char 'B'
.Lmul16_00e_ULT_done:
    bruge8 .Lmul16_00e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_UGE_done
.Lmul16_00e_UGE_true:
    mul_emit_char 'B'
.Lmul16_00e_UGE_done:
    brslt8 .Lmul16_00e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_SLT_done
.Lmul16_00e_SLT_true:
    mul_emit_char 'B'
.Lmul16_00e_SLT_done:
    brsge8 .Lmul16_00e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00e_SGE_done
.Lmul16_00e_SGE_true:
    mul_emit_char 'B'
.Lmul16_00e_SGE_done:
    mul_emit_char '\n'

    ; d=r0, s=r7, pattern 1; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r0
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r7
    ldi16 r4, 0x5056
    push16 r4
    pop16 r1
    mul16 r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_00f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_EQ_done
.Lmul16_00f_EQ_true:
    mul_emit_char 'B'
.Lmul16_00f_EQ_done:
    brne8 .Lmul16_00f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_NE_done
.Lmul16_00f_NE_true:
    mul_emit_char 'B'
.Lmul16_00f_NE_done:
    brult8 .Lmul16_00f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_ULT_done
.Lmul16_00f_ULT_true:
    mul_emit_char 'B'
.Lmul16_00f_ULT_done:
    bruge8 .Lmul16_00f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_UGE_done
.Lmul16_00f_UGE_true:
    mul_emit_char 'B'
.Lmul16_00f_UGE_done:
    brslt8 .Lmul16_00f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_SLT_done
.Lmul16_00f_SLT_true:
    mul_emit_char 'B'
.Lmul16_00f_SLT_done:
    brsge8 .Lmul16_00f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_00f_SGE_done
.Lmul16_00f_SGE_true:
    mul_emit_char 'B'
.Lmul16_00f_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r0, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r1
    ldi16 r4, 0x0100
    push16 r4
    pop16 r0
    ldi16 r4, 0x51b2
    push16 r4
    pop16 r2
    mul16 r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_010_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_EQ_done
.Lmul16_010_EQ_true:
    mul_emit_char 'B'
.Lmul16_010_EQ_done:
    brne8 .Lmul16_010_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_NE_done
.Lmul16_010_NE_true:
    mul_emit_char 'B'
.Lmul16_010_NE_done:
    brult8 .Lmul16_010_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_ULT_done
.Lmul16_010_ULT_true:
    mul_emit_char 'B'
.Lmul16_010_ULT_done:
    bruge8 .Lmul16_010_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_UGE_done
.Lmul16_010_UGE_true:
    mul_emit_char 'B'
.Lmul16_010_UGE_done:
    brslt8 .Lmul16_010_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_SLT_done
.Lmul16_010_SLT_true:
    mul_emit_char 'B'
.Lmul16_010_SLT_done:
    brsge8 .Lmul16_010_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_010_SGE_done
.Lmul16_010_SGE_true:
    mul_emit_char 'B'
.Lmul16_010_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r0, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r1
    ldi16 r4, 0x0002
    push16 r4
    pop16 r0
    ldi16 r4, 0x530e
    push16 r4
    pop16 r3
    mul16 r1, r0
    push16 r3
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_011_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_EQ_done
.Lmul16_011_EQ_true:
    mul_emit_char 'B'
.Lmul16_011_EQ_done:
    brne8 .Lmul16_011_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_NE_done
.Lmul16_011_NE_true:
    mul_emit_char 'B'
.Lmul16_011_NE_done:
    brult8 .Lmul16_011_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_ULT_done
.Lmul16_011_ULT_true:
    mul_emit_char 'B'
.Lmul16_011_ULT_done:
    bruge8 .Lmul16_011_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_UGE_done
.Lmul16_011_UGE_true:
    mul_emit_char 'B'
.Lmul16_011_UGE_done:
    brslt8 .Lmul16_011_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_SLT_done
.Lmul16_011_SLT_true:
    mul_emit_char 'B'
.Lmul16_011_SLT_done:
    brsge8 .Lmul16_011_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_011_SGE_done
.Lmul16_011_SGE_true:
    mul_emit_char 'B'
.Lmul16_011_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r1, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x556b
    push16 r4
    pop16 r5
    mul16 r1, r1
    push16 r5
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_012_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_EQ_done
.Lmul16_012_EQ_true:
    mul_emit_char 'B'
.Lmul16_012_EQ_done:
    brne8 .Lmul16_012_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_NE_done
.Lmul16_012_NE_true:
    mul_emit_char 'B'
.Lmul16_012_NE_done:
    brult8 .Lmul16_012_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_ULT_done
.Lmul16_012_ULT_true:
    mul_emit_char 'B'
.Lmul16_012_ULT_done:
    bruge8 .Lmul16_012_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_UGE_done
.Lmul16_012_UGE_true:
    mul_emit_char 'B'
.Lmul16_012_UGE_done:
    brslt8 .Lmul16_012_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_SLT_done
.Lmul16_012_SLT_true:
    mul_emit_char 'B'
.Lmul16_012_SLT_done:
    brsge8 .Lmul16_012_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_012_SGE_done
.Lmul16_012_SGE_true:
    mul_emit_char 'B'
.Lmul16_012_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r1, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x56c7
    push16 r4
    pop16 r6
    mul16 r1, r1
    push16 r6
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_013_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_EQ_done
.Lmul16_013_EQ_true:
    mul_emit_char 'B'
.Lmul16_013_EQ_done:
    brne8 .Lmul16_013_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_NE_done
.Lmul16_013_NE_true:
    mul_emit_char 'B'
.Lmul16_013_NE_done:
    brult8 .Lmul16_013_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_ULT_done
.Lmul16_013_ULT_true:
    mul_emit_char 'B'
.Lmul16_013_ULT_done:
    bruge8 .Lmul16_013_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_UGE_done
.Lmul16_013_UGE_true:
    mul_emit_char 'B'
.Lmul16_013_UGE_done:
    brslt8 .Lmul16_013_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_SLT_done
.Lmul16_013_SLT_true:
    mul_emit_char 'B'
.Lmul16_013_SLT_done:
    brsge8 .Lmul16_013_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_013_SGE_done
.Lmul16_013_SGE_true:
    mul_emit_char 'B'
.Lmul16_013_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r2, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r1
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x511c
    push16 r4
    pop16 r0
    mul16 r1, r2
    push16 r0
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_014_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_EQ_done
.Lmul16_014_EQ_true:
    mul_emit_char 'B'
.Lmul16_014_EQ_done:
    brne8 .Lmul16_014_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_NE_done
.Lmul16_014_NE_true:
    mul_emit_char 'B'
.Lmul16_014_NE_done:
    brult8 .Lmul16_014_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_ULT_done
.Lmul16_014_ULT_true:
    mul_emit_char 'B'
.Lmul16_014_ULT_done:
    bruge8 .Lmul16_014_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_UGE_done
.Lmul16_014_UGE_true:
    mul_emit_char 'B'
.Lmul16_014_UGE_done:
    brslt8 .Lmul16_014_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_SLT_done
.Lmul16_014_SLT_true:
    mul_emit_char 'B'
.Lmul16_014_SLT_done:
    brsge8 .Lmul16_014_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_014_SGE_done
.Lmul16_014_SGE_true:
    mul_emit_char 'B'
.Lmul16_014_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r2, pattern 1; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r1
    ldi16 r4, 0x0100
    push16 r4
    pop16 r2
    ldi16 r4, 0x547a
    push16 r4
    pop16 r3
    mul16 r1, r2
    push16 r3
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_015_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_EQ_done
.Lmul16_015_EQ_true:
    mul_emit_char 'B'
.Lmul16_015_EQ_done:
    brne8 .Lmul16_015_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_NE_done
.Lmul16_015_NE_true:
    mul_emit_char 'B'
.Lmul16_015_NE_done:
    brult8 .Lmul16_015_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_ULT_done
.Lmul16_015_ULT_true:
    mul_emit_char 'B'
.Lmul16_015_ULT_done:
    bruge8 .Lmul16_015_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_UGE_done
.Lmul16_015_UGE_true:
    mul_emit_char 'B'
.Lmul16_015_UGE_done:
    brslt8 .Lmul16_015_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_SLT_done
.Lmul16_015_SLT_true:
    mul_emit_char 'B'
.Lmul16_015_SLT_done:
    brsge8 .Lmul16_015_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_015_SGE_done
.Lmul16_015_SGE_true:
    mul_emit_char 'B'
.Lmul16_015_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r3, pattern 0; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x7fff
    push16 r5
    pop16 r1
    ldi16 r5, 0x0002
    push16 r5
    pop16 r3
    ldi16 r5, 0x55d6
    push16 r5
    pop16 r4
    mul16 r1, r3
    push16 r4
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_016_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_EQ_done
.Lmul16_016_EQ_true:
    mul_emit_char 'B'
.Lmul16_016_EQ_done:
    brne8 .Lmul16_016_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_NE_done
.Lmul16_016_NE_true:
    mul_emit_char 'B'
.Lmul16_016_NE_done:
    brult8 .Lmul16_016_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_ULT_done
.Lmul16_016_ULT_true:
    mul_emit_char 'B'
.Lmul16_016_ULT_done:
    bruge8 .Lmul16_016_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_UGE_done
.Lmul16_016_UGE_true:
    mul_emit_char 'B'
.Lmul16_016_UGE_done:
    brslt8 .Lmul16_016_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_SLT_done
.Lmul16_016_SLT_true:
    mul_emit_char 'B'
.Lmul16_016_SLT_done:
    brsge8 .Lmul16_016_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_016_SGE_done
.Lmul16_016_SGE_true:
    mul_emit_char 'B'
.Lmul16_016_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r3, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r1
    ldi16 r5, 0xffff
    push16 r5
    pop16 r3
    ldi16 r5, 0x5631
    push16 r5
    pop16 r4
    mul16 r1, r3
    push16 r4
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_017_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_EQ_done
.Lmul16_017_EQ_true:
    mul_emit_char 'B'
.Lmul16_017_EQ_done:
    brne8 .Lmul16_017_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_NE_done
.Lmul16_017_NE_true:
    mul_emit_char 'B'
.Lmul16_017_NE_done:
    brult8 .Lmul16_017_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_ULT_done
.Lmul16_017_ULT_true:
    mul_emit_char 'B'
.Lmul16_017_ULT_done:
    bruge8 .Lmul16_017_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_UGE_done
.Lmul16_017_UGE_true:
    mul_emit_char 'B'
.Lmul16_017_UGE_done:
    brslt8 .Lmul16_017_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_SLT_done
.Lmul16_017_SLT_true:
    mul_emit_char 'B'
.Lmul16_017_SLT_done:
    brsge8 .Lmul16_017_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_017_SGE_done
.Lmul16_017_SGE_true:
    mul_emit_char 'B'
.Lmul16_017_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r4, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r1
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r4
    ldi16 r5, 0x588e
    push16 r5
    pop16 r6
    mul16 r1, r4
    push16 r6
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_018_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_EQ_done
.Lmul16_018_EQ_true:
    mul_emit_char 'B'
.Lmul16_018_EQ_done:
    brne8 .Lmul16_018_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_NE_done
.Lmul16_018_NE_true:
    mul_emit_char 'B'
.Lmul16_018_NE_done:
    brult8 .Lmul16_018_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_ULT_done
.Lmul16_018_ULT_true:
    mul_emit_char 'B'
.Lmul16_018_ULT_done:
    bruge8 .Lmul16_018_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_UGE_done
.Lmul16_018_UGE_true:
    mul_emit_char 'B'
.Lmul16_018_UGE_done:
    brslt8 .Lmul16_018_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_SLT_done
.Lmul16_018_SLT_true:
    mul_emit_char 'B'
.Lmul16_018_SLT_done:
    brsge8 .Lmul16_018_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_018_SGE_done
.Lmul16_018_SGE_true:
    mul_emit_char 'B'
.Lmul16_018_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r4, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r1
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x59ea
    push16 r5
    pop16 r7
    mul16 r1, r4
    push16 r7
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_019_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_EQ_done
.Lmul16_019_EQ_true:
    mul_emit_char 'B'
.Lmul16_019_EQ_done:
    brne8 .Lmul16_019_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_NE_done
.Lmul16_019_NE_true:
    mul_emit_char 'B'
.Lmul16_019_NE_done:
    brult8 .Lmul16_019_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_ULT_done
.Lmul16_019_ULT_true:
    mul_emit_char 'B'
.Lmul16_019_ULT_done:
    bruge8 .Lmul16_019_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_UGE_done
.Lmul16_019_UGE_true:
    mul_emit_char 'B'
.Lmul16_019_UGE_done:
    brslt8 .Lmul16_019_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_SLT_done
.Lmul16_019_SLT_true:
    mul_emit_char 'B'
.Lmul16_019_SLT_done:
    brsge8 .Lmul16_019_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_019_SGE_done
.Lmul16_019_SGE_true:
    mul_emit_char 'B'
.Lmul16_019_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r5, pattern 0; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0101
    push16 r4
    pop16 r5
    ldi16 r4, 0x5540
    push16 r4
    pop16 r2
    mul16 r1, r5
    push16 r2
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_EQ_done
.Lmul16_01a_EQ_true:
    mul_emit_char 'B'
.Lmul16_01a_EQ_done:
    brne8 .Lmul16_01a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_NE_done
.Lmul16_01a_NE_true:
    mul_emit_char 'B'
.Lmul16_01a_NE_done:
    brult8 .Lmul16_01a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_ULT_done
.Lmul16_01a_ULT_true:
    mul_emit_char 'B'
.Lmul16_01a_ULT_done:
    bruge8 .Lmul16_01a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_UGE_done
.Lmul16_01a_UGE_true:
    mul_emit_char 'B'
.Lmul16_01a_UGE_done:
    brslt8 .Lmul16_01a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_SLT_done
.Lmul16_01a_SLT_true:
    mul_emit_char 'B'
.Lmul16_01a_SLT_done:
    brsge8 .Lmul16_01a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01a_SGE_done
.Lmul16_01a_SGE_true:
    mul_emit_char 'B'
.Lmul16_01a_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r5, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0002
    push16 r4
    pop16 r5
    ldi16 r4, 0x559b
    push16 r4
    pop16 r2
    mul16 r1, r5
    push16 r2
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_EQ_done
.Lmul16_01b_EQ_true:
    mul_emit_char 'B'
.Lmul16_01b_EQ_done:
    brne8 .Lmul16_01b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_NE_done
.Lmul16_01b_NE_true:
    mul_emit_char 'B'
.Lmul16_01b_NE_done:
    brult8 .Lmul16_01b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_ULT_done
.Lmul16_01b_ULT_true:
    mul_emit_char 'B'
.Lmul16_01b_ULT_done:
    bruge8 .Lmul16_01b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_UGE_done
.Lmul16_01b_UGE_true:
    mul_emit_char 'B'
.Lmul16_01b_UGE_done:
    brslt8 .Lmul16_01b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_SLT_done
.Lmul16_01b_SLT_true:
    mul_emit_char 'B'
.Lmul16_01b_SLT_done:
    brsge8 .Lmul16_01b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01b_SGE_done
.Lmul16_01b_SGE_true:
    mul_emit_char 'B'
.Lmul16_01b_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r6, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8000
    push16 r5
    pop16 r1
    ldi16 r5, 0x0002
    push16 r5
    pop16 r6
    ldi16 r5, 0x57f8
    push16 r5
    pop16 r4
    mul16 r1, r6
    push16 r4
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_EQ_done
.Lmul16_01c_EQ_true:
    mul_emit_char 'B'
.Lmul16_01c_EQ_done:
    brne8 .Lmul16_01c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_NE_done
.Lmul16_01c_NE_true:
    mul_emit_char 'B'
.Lmul16_01c_NE_done:
    brult8 .Lmul16_01c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_ULT_done
.Lmul16_01c_ULT_true:
    mul_emit_char 'B'
.Lmul16_01c_ULT_done:
    bruge8 .Lmul16_01c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_UGE_done
.Lmul16_01c_UGE_true:
    mul_emit_char 'B'
.Lmul16_01c_UGE_done:
    brslt8 .Lmul16_01c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_SLT_done
.Lmul16_01c_SLT_true:
    mul_emit_char 'B'
.Lmul16_01c_SLT_done:
    brsge8 .Lmul16_01c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01c_SGE_done
.Lmul16_01c_SGE_true:
    mul_emit_char 'B'
.Lmul16_01c_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r6, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r6
    ldi16 r4, 0x5954
    push16 r4
    pop16 r5
    mul16 r1, r6
    push16 r5
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_EQ_done
.Lmul16_01d_EQ_true:
    mul_emit_char 'B'
.Lmul16_01d_EQ_done:
    brne8 .Lmul16_01d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_NE_done
.Lmul16_01d_NE_true:
    mul_emit_char 'B'
.Lmul16_01d_NE_done:
    brult8 .Lmul16_01d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_ULT_done
.Lmul16_01d_ULT_true:
    mul_emit_char 'B'
.Lmul16_01d_ULT_done:
    bruge8 .Lmul16_01d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_UGE_done
.Lmul16_01d_UGE_true:
    mul_emit_char 'B'
.Lmul16_01d_UGE_done:
    brslt8 .Lmul16_01d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_SLT_done
.Lmul16_01d_SLT_true:
    mul_emit_char 'B'
.Lmul16_01d_SLT_done:
    brsge8 .Lmul16_01d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01d_SGE_done
.Lmul16_01d_SGE_true:
    mul_emit_char 'B'
.Lmul16_01d_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r7, pattern 0; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x54aa
    push16 r4
    pop16 r0
    mul16 r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_EQ_done
.Lmul16_01e_EQ_true:
    mul_emit_char 'B'
.Lmul16_01e_EQ_done:
    brne8 .Lmul16_01e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_NE_done
.Lmul16_01e_NE_true:
    mul_emit_char 'B'
.Lmul16_01e_NE_done:
    brult8 .Lmul16_01e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_ULT_done
.Lmul16_01e_ULT_true:
    mul_emit_char 'B'
.Lmul16_01e_ULT_done:
    bruge8 .Lmul16_01e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_UGE_done
.Lmul16_01e_UGE_true:
    mul_emit_char 'B'
.Lmul16_01e_UGE_done:
    brslt8 .Lmul16_01e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_SLT_done
.Lmul16_01e_SLT_true:
    mul_emit_char 'B'
.Lmul16_01e_SLT_done:
    brsge8 .Lmul16_01e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01e_SGE_done
.Lmul16_01e_SGE_true:
    mul_emit_char 'B'
.Lmul16_01e_SGE_done:
    mul_emit_char '\n'

    ; d=r1, s=r7, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0101
    push16 r4
    pop16 r7
    ldi16 r4, 0x5505
    push16 r4
    pop16 r0
    mul16 r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_01f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_EQ_done
.Lmul16_01f_EQ_true:
    mul_emit_char 'B'
.Lmul16_01f_EQ_done:
    brne8 .Lmul16_01f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_NE_done
.Lmul16_01f_NE_true:
    mul_emit_char 'B'
.Lmul16_01f_NE_done:
    brult8 .Lmul16_01f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_ULT_done
.Lmul16_01f_ULT_true:
    mul_emit_char 'B'
.Lmul16_01f_ULT_done:
    bruge8 .Lmul16_01f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_UGE_done
.Lmul16_01f_UGE_true:
    mul_emit_char 'B'
.Lmul16_01f_UGE_done:
    brslt8 .Lmul16_01f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_SLT_done
.Lmul16_01f_SLT_true:
    mul_emit_char 'B'
.Lmul16_01f_SLT_done:
    brsge8 .Lmul16_01f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_01f_SGE_done
.Lmul16_01f_SGE_true:
    mul_emit_char 'B'
.Lmul16_01f_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r0, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x5863
    push16 r4
    pop16 r3
    mul16 r2, r0
    push16 r3
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_020_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_EQ_done
.Lmul16_020_EQ_true:
    mul_emit_char 'B'
.Lmul16_020_EQ_done:
    brne8 .Lmul16_020_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_NE_done
.Lmul16_020_NE_true:
    mul_emit_char 'B'
.Lmul16_020_NE_done:
    brult8 .Lmul16_020_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_ULT_done
.Lmul16_020_ULT_true:
    mul_emit_char 'B'
.Lmul16_020_ULT_done:
    bruge8 .Lmul16_020_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_UGE_done
.Lmul16_020_UGE_true:
    mul_emit_char 'B'
.Lmul16_020_UGE_done:
    brslt8 .Lmul16_020_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_SLT_done
.Lmul16_020_SLT_true:
    mul_emit_char 'B'
.Lmul16_020_SLT_done:
    brsge8 .Lmul16_020_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_020_SGE_done
.Lmul16_020_SGE_true:
    mul_emit_char 'B'
.Lmul16_020_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r0, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r2
    ldi16 r5, 0x0000
    push16 r5
    pop16 r0
    ldi16 r5, 0x59bf
    push16 r5
    pop16 r4
    mul16 r2, r0
    push16 r4
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_021_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_EQ_done
.Lmul16_021_EQ_true:
    mul_emit_char 'B'
.Lmul16_021_EQ_done:
    brne8 .Lmul16_021_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_NE_done
.Lmul16_021_NE_true:
    mul_emit_char 'B'
.Lmul16_021_NE_done:
    brult8 .Lmul16_021_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_ULT_done
.Lmul16_021_ULT_true:
    mul_emit_char 'B'
.Lmul16_021_ULT_done:
    bruge8 .Lmul16_021_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_UGE_done
.Lmul16_021_UGE_true:
    mul_emit_char 'B'
.Lmul16_021_UGE_done:
    brslt8 .Lmul16_021_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_SLT_done
.Lmul16_021_SLT_true:
    mul_emit_char 'B'
.Lmul16_021_SLT_done:
    brsge8 .Lmul16_021_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_021_SGE_done
.Lmul16_021_SGE_true:
    mul_emit_char 'B'
.Lmul16_021_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r1, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r2
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x5c1c
    push16 r4
    pop16 r6
    mul16 r2, r1
    push16 r6
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_022_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_EQ_done
.Lmul16_022_EQ_true:
    mul_emit_char 'B'
.Lmul16_022_EQ_done:
    brne8 .Lmul16_022_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_NE_done
.Lmul16_022_NE_true:
    mul_emit_char 'B'
.Lmul16_022_NE_done:
    brult8 .Lmul16_022_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_ULT_done
.Lmul16_022_ULT_true:
    mul_emit_char 'B'
.Lmul16_022_ULT_done:
    bruge8 .Lmul16_022_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_UGE_done
.Lmul16_022_UGE_true:
    mul_emit_char 'B'
.Lmul16_022_UGE_done:
    brslt8 .Lmul16_022_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_SLT_done
.Lmul16_022_SLT_true:
    mul_emit_char 'B'
.Lmul16_022_SLT_done:
    brsge8 .Lmul16_022_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_022_SGE_done
.Lmul16_022_SGE_true:
    mul_emit_char 'B'
.Lmul16_022_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r1, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r2
    ldi16 r4, 0x0100
    push16 r4
    pop16 r1
    ldi16 r4, 0x5d78
    push16 r4
    pop16 r7
    mul16 r2, r1
    push16 r7
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_023_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_EQ_done
.Lmul16_023_EQ_true:
    mul_emit_char 'B'
.Lmul16_023_EQ_done:
    brne8 .Lmul16_023_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_NE_done
.Lmul16_023_NE_true:
    mul_emit_char 'B'
.Lmul16_023_NE_done:
    brult8 .Lmul16_023_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_ULT_done
.Lmul16_023_ULT_true:
    mul_emit_char 'B'
.Lmul16_023_ULT_done:
    bruge8 .Lmul16_023_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_UGE_done
.Lmul16_023_UGE_true:
    mul_emit_char 'B'
.Lmul16_023_UGE_done:
    brslt8 .Lmul16_023_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_SLT_done
.Lmul16_023_SLT_true:
    mul_emit_char 'B'
.Lmul16_023_SLT_done:
    brsge8 .Lmul16_023_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_023_SGE_done
.Lmul16_023_SGE_true:
    mul_emit_char 'B'
.Lmul16_023_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r2, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r2
    ldi16 r4, 0x57cd
    push16 r4
    pop16 r1
    mul16 r2, r2
    push16 r1
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_024_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_EQ_done
.Lmul16_024_EQ_true:
    mul_emit_char 'B'
.Lmul16_024_EQ_done:
    brne8 .Lmul16_024_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_NE_done
.Lmul16_024_NE_true:
    mul_emit_char 'B'
.Lmul16_024_NE_done:
    brult8 .Lmul16_024_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_ULT_done
.Lmul16_024_ULT_true:
    mul_emit_char 'B'
.Lmul16_024_ULT_done:
    bruge8 .Lmul16_024_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_UGE_done
.Lmul16_024_UGE_true:
    mul_emit_char 'B'
.Lmul16_024_UGE_done:
    brslt8 .Lmul16_024_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_SLT_done
.Lmul16_024_SLT_true:
    mul_emit_char 'B'
.Lmul16_024_SLT_done:
    brsge8 .Lmul16_024_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_024_SGE_done
.Lmul16_024_SGE_true:
    mul_emit_char 'B'
.Lmul16_024_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r2, pattern 1; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x5a2a
    push16 r4
    pop16 r3
    mul16 r2, r2
    push16 r3
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_025_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_EQ_done
.Lmul16_025_EQ_true:
    mul_emit_char 'B'
.Lmul16_025_EQ_done:
    brne8 .Lmul16_025_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_NE_done
.Lmul16_025_NE_true:
    mul_emit_char 'B'
.Lmul16_025_NE_done:
    brult8 .Lmul16_025_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_ULT_done
.Lmul16_025_ULT_true:
    mul_emit_char 'B'
.Lmul16_025_ULT_done:
    bruge8 .Lmul16_025_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_UGE_done
.Lmul16_025_UGE_true:
    mul_emit_char 'B'
.Lmul16_025_UGE_done:
    brslt8 .Lmul16_025_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_SLT_done
.Lmul16_025_SLT_true:
    mul_emit_char 'B'
.Lmul16_025_SLT_done:
    brsge8 .Lmul16_025_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_025_SGE_done
.Lmul16_025_SGE_true:
    mul_emit_char 'B'
.Lmul16_025_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r3, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r2
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r3
    ldi16 r5, 0x5b86
    push16 r5
    pop16 r4
    mul16 r2, r3
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_026_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_EQ_done
.Lmul16_026_EQ_true:
    mul_emit_char 'B'
.Lmul16_026_EQ_done:
    brne8 .Lmul16_026_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_NE_done
.Lmul16_026_NE_true:
    mul_emit_char 'B'
.Lmul16_026_NE_done:
    brult8 .Lmul16_026_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_ULT_done
.Lmul16_026_ULT_true:
    mul_emit_char 'B'
.Lmul16_026_ULT_done:
    bruge8 .Lmul16_026_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_UGE_done
.Lmul16_026_UGE_true:
    mul_emit_char 'B'
.Lmul16_026_UGE_done:
    brslt8 .Lmul16_026_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_SLT_done
.Lmul16_026_SLT_true:
    mul_emit_char 'B'
.Lmul16_026_SLT_done:
    brsge8 .Lmul16_026_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_026_SGE_done
.Lmul16_026_SGE_true:
    mul_emit_char 'B'
.Lmul16_026_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r3, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r2
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x5ce2
    push16 r4
    pop16 r5
    mul16 r2, r3
    push16 r5
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_027_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_EQ_done
.Lmul16_027_EQ_true:
    mul_emit_char 'B'
.Lmul16_027_EQ_done:
    brne8 .Lmul16_027_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_NE_done
.Lmul16_027_NE_true:
    mul_emit_char 'B'
.Lmul16_027_NE_done:
    brult8 .Lmul16_027_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_ULT_done
.Lmul16_027_ULT_true:
    mul_emit_char 'B'
.Lmul16_027_ULT_done:
    bruge8 .Lmul16_027_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_UGE_done
.Lmul16_027_UGE_true:
    mul_emit_char 'B'
.Lmul16_027_UGE_done:
    brslt8 .Lmul16_027_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_SLT_done
.Lmul16_027_SLT_true:
    mul_emit_char 'B'
.Lmul16_027_SLT_done:
    brsge8 .Lmul16_027_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_027_SGE_done
.Lmul16_027_SGE_true:
    mul_emit_char 'B'
.Lmul16_027_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r4, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r2
    ldi16 r5, 0x0101
    push16 r5
    pop16 r4
    ldi16 r5, 0x5f3f
    push16 r5
    pop16 r7
    mul16 r2, r4
    push16 r7
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_028_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_EQ_done
.Lmul16_028_EQ_true:
    mul_emit_char 'B'
.Lmul16_028_EQ_done:
    brne8 .Lmul16_028_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_NE_done
.Lmul16_028_NE_true:
    mul_emit_char 'B'
.Lmul16_028_NE_done:
    brult8 .Lmul16_028_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_ULT_done
.Lmul16_028_ULT_true:
    mul_emit_char 'B'
.Lmul16_028_ULT_done:
    bruge8 .Lmul16_028_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_UGE_done
.Lmul16_028_UGE_true:
    mul_emit_char 'B'
.Lmul16_028_UGE_done:
    brslt8 .Lmul16_028_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_SLT_done
.Lmul16_028_SLT_true:
    mul_emit_char 'B'
.Lmul16_028_SLT_done:
    brsge8 .Lmul16_028_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_028_SGE_done
.Lmul16_028_SGE_true:
    mul_emit_char 'B'
.Lmul16_028_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r4, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x7fff
    push16 r5
    pop16 r2
    ldi16 r5, 0x0002
    push16 r5
    pop16 r4
    ldi16 r5, 0x5893
    push16 r5
    pop16 r0
    mul16 r2, r4
    push16 r0
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_029_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_EQ_done
.Lmul16_029_EQ_true:
    mul_emit_char 'B'
.Lmul16_029_EQ_done:
    brne8 .Lmul16_029_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_NE_done
.Lmul16_029_NE_true:
    mul_emit_char 'B'
.Lmul16_029_NE_done:
    brult8 .Lmul16_029_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_ULT_done
.Lmul16_029_ULT_true:
    mul_emit_char 'B'
.Lmul16_029_ULT_done:
    bruge8 .Lmul16_029_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_UGE_done
.Lmul16_029_UGE_true:
    mul_emit_char 'B'
.Lmul16_029_UGE_done:
    brslt8 .Lmul16_029_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_SLT_done
.Lmul16_029_SLT_true:
    mul_emit_char 'B'
.Lmul16_029_SLT_done:
    brsge8 .Lmul16_029_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_029_SGE_done
.Lmul16_029_SGE_true:
    mul_emit_char 'B'
.Lmul16_029_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r5, pattern 0; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r2
    ldi16 r4, 0x0002
    push16 r4
    pop16 r5
    ldi16 r4, 0x5bf1
    push16 r4
    pop16 r3
    mul16 r2, r5
    push16 r3
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_EQ_done
.Lmul16_02a_EQ_true:
    mul_emit_char 'B'
.Lmul16_02a_EQ_done:
    brne8 .Lmul16_02a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_NE_done
.Lmul16_02a_NE_true:
    mul_emit_char 'B'
.Lmul16_02a_NE_done:
    brult8 .Lmul16_02a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_ULT_done
.Lmul16_02a_ULT_true:
    mul_emit_char 'B'
.Lmul16_02a_ULT_done:
    bruge8 .Lmul16_02a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_UGE_done
.Lmul16_02a_UGE_true:
    mul_emit_char 'B'
.Lmul16_02a_UGE_done:
    brslt8 .Lmul16_02a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_SLT_done
.Lmul16_02a_SLT_true:
    mul_emit_char 'B'
.Lmul16_02a_SLT_done:
    brsge8 .Lmul16_02a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02a_SGE_done
.Lmul16_02a_SGE_true:
    mul_emit_char 'B'
.Lmul16_02a_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r5, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r2
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r5
    ldi16 r4, 0x5c4c
    push16 r4
    pop16 r3
    mul16 r2, r5
    push16 r3
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_EQ_done
.Lmul16_02b_EQ_true:
    mul_emit_char 'B'
.Lmul16_02b_EQ_done:
    brne8 .Lmul16_02b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_NE_done
.Lmul16_02b_NE_true:
    mul_emit_char 'B'
.Lmul16_02b_NE_done:
    brult8 .Lmul16_02b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_ULT_done
.Lmul16_02b_ULT_true:
    mul_emit_char 'B'
.Lmul16_02b_ULT_done:
    bruge8 .Lmul16_02b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_UGE_done
.Lmul16_02b_UGE_true:
    mul_emit_char 'B'
.Lmul16_02b_UGE_done:
    brslt8 .Lmul16_02b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_SLT_done
.Lmul16_02b_SLT_true:
    mul_emit_char 'B'
.Lmul16_02b_SLT_done:
    brsge8 .Lmul16_02b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02b_SGE_done
.Lmul16_02b_SGE_true:
    mul_emit_char 'B'
.Lmul16_02b_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r6, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x0000
    push16 r4
    pop16 r6
    ldi16 r4, 0x5ea9
    push16 r4
    pop16 r5
    mul16 r2, r6
    push16 r5
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_EQ_done
.Lmul16_02c_EQ_true:
    mul_emit_char 'B'
.Lmul16_02c_EQ_done:
    brne8 .Lmul16_02c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_NE_done
.Lmul16_02c_NE_true:
    mul_emit_char 'B'
.Lmul16_02c_NE_done:
    brult8 .Lmul16_02c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_ULT_done
.Lmul16_02c_ULT_true:
    mul_emit_char 'B'
.Lmul16_02c_ULT_done:
    bruge8 .Lmul16_02c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_UGE_done
.Lmul16_02c_UGE_true:
    mul_emit_char 'B'
.Lmul16_02c_UGE_done:
    brslt8 .Lmul16_02c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_SLT_done
.Lmul16_02c_SLT_true:
    mul_emit_char 'B'
.Lmul16_02c_SLT_done:
    brsge8 .Lmul16_02c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02c_SGE_done
.Lmul16_02c_SGE_true:
    mul_emit_char 'B'
.Lmul16_02c_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r6, pattern 1; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r2
    ldi16 r4, 0x0101
    push16 r4
    pop16 r6
    ldi16 r4, 0x6106
    push16 r4
    pop16 r7
    mul16 r2, r6
    push16 r7
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_EQ_done
.Lmul16_02d_EQ_true:
    mul_emit_char 'B'
.Lmul16_02d_EQ_done:
    brne8 .Lmul16_02d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_NE_done
.Lmul16_02d_NE_true:
    mul_emit_char 'B'
.Lmul16_02d_NE_done:
    brult8 .Lmul16_02d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_ULT_done
.Lmul16_02d_ULT_true:
    mul_emit_char 'B'
.Lmul16_02d_ULT_done:
    bruge8 .Lmul16_02d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_UGE_done
.Lmul16_02d_UGE_true:
    mul_emit_char 'B'
.Lmul16_02d_UGE_done:
    brslt8 .Lmul16_02d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_SLT_done
.Lmul16_02d_SLT_true:
    mul_emit_char 'B'
.Lmul16_02d_SLT_done:
    brsge8 .Lmul16_02d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02d_SGE_done
.Lmul16_02d_SGE_true:
    mul_emit_char 'B'
.Lmul16_02d_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r7, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r2
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    ldi16 r4, 0x5a5a
    push16 r4
    pop16 r0
    mul16 r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_EQ_done
.Lmul16_02e_EQ_true:
    mul_emit_char 'B'
.Lmul16_02e_EQ_done:
    brne8 .Lmul16_02e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_NE_done
.Lmul16_02e_NE_true:
    mul_emit_char 'B'
.Lmul16_02e_NE_done:
    brult8 .Lmul16_02e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_ULT_done
.Lmul16_02e_ULT_true:
    mul_emit_char 'B'
.Lmul16_02e_ULT_done:
    bruge8 .Lmul16_02e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_UGE_done
.Lmul16_02e_UGE_true:
    mul_emit_char 'B'
.Lmul16_02e_UGE_done:
    brslt8 .Lmul16_02e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_SLT_done
.Lmul16_02e_SLT_true:
    mul_emit_char 'B'
.Lmul16_02e_SLT_done:
    brsge8 .Lmul16_02e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02e_SGE_done
.Lmul16_02e_SGE_true:
    mul_emit_char 'B'
.Lmul16_02e_SGE_done:
    mul_emit_char '\n'

    ; d=r2, s=r7, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r2
    ldi16 r4, 0x0002
    push16 r4
    pop16 r7
    ldi16 r4, 0x5bb6
    push16 r4
    pop16 r1
    mul16 r2, r7
    push16 r1
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_02f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_EQ_done
.Lmul16_02f_EQ_true:
    mul_emit_char 'B'
.Lmul16_02f_EQ_done:
    brne8 .Lmul16_02f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_NE_done
.Lmul16_02f_NE_true:
    mul_emit_char 'B'
.Lmul16_02f_NE_done:
    brult8 .Lmul16_02f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_ULT_done
.Lmul16_02f_ULT_true:
    mul_emit_char 'B'
.Lmul16_02f_ULT_done:
    bruge8 .Lmul16_02f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_UGE_done
.Lmul16_02f_UGE_true:
    mul_emit_char 'B'
.Lmul16_02f_UGE_done:
    brslt8 .Lmul16_02f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_SLT_done
.Lmul16_02f_SLT_true:
    mul_emit_char 'B'
.Lmul16_02f_SLT_done:
    brsge8 .Lmul16_02f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_02f_SGE_done
.Lmul16_02f_SGE_true:
    mul_emit_char 'B'
.Lmul16_02f_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r0, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r3
    ldi16 r5, 0xffff
    push16 r5
    pop16 r0
    ldi16 r5, 0x5f14
    push16 r5
    pop16 r4
    mul16 r3, r0
    push16 r4
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_030_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_EQ_done
.Lmul16_030_EQ_true:
    mul_emit_char 'B'
.Lmul16_030_EQ_done:
    brne8 .Lmul16_030_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_NE_done
.Lmul16_030_NE_true:
    mul_emit_char 'B'
.Lmul16_030_NE_done:
    brult8 .Lmul16_030_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_ULT_done
.Lmul16_030_ULT_true:
    mul_emit_char 'B'
.Lmul16_030_ULT_done:
    bruge8 .Lmul16_030_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_UGE_done
.Lmul16_030_UGE_true:
    mul_emit_char 'B'
.Lmul16_030_UGE_done:
    brslt8 .Lmul16_030_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_SLT_done
.Lmul16_030_SLT_true:
    mul_emit_char 'B'
.Lmul16_030_SLT_done:
    brsge8 .Lmul16_030_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_030_SGE_done
.Lmul16_030_SGE_true:
    mul_emit_char 'B'
.Lmul16_030_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r0, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r3
    ldi16 r4, 0x0100
    push16 r4
    pop16 r0
    ldi16 r4, 0x6070
    push16 r4
    pop16 r5
    mul16 r3, r0
    push16 r5
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_031_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_EQ_done
.Lmul16_031_EQ_true:
    mul_emit_char 'B'
.Lmul16_031_EQ_done:
    brne8 .Lmul16_031_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_NE_done
.Lmul16_031_NE_true:
    mul_emit_char 'B'
.Lmul16_031_NE_done:
    brult8 .Lmul16_031_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_ULT_done
.Lmul16_031_ULT_true:
    mul_emit_char 'B'
.Lmul16_031_ULT_done:
    bruge8 .Lmul16_031_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_UGE_done
.Lmul16_031_UGE_true:
    mul_emit_char 'B'
.Lmul16_031_UGE_done:
    brslt8 .Lmul16_031_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_SLT_done
.Lmul16_031_SLT_true:
    mul_emit_char 'B'
.Lmul16_031_SLT_done:
    brsge8 .Lmul16_031_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_031_SGE_done
.Lmul16_031_SGE_true:
    mul_emit_char 'B'
.Lmul16_031_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r1, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r3
    ldi16 r4, 0x0002
    push16 r4
    pop16 r1
    ldi16 r4, 0x62cd
    push16 r4
    pop16 r7
    mul16 r3, r1
    push16 r7
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_032_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_EQ_done
.Lmul16_032_EQ_true:
    mul_emit_char 'B'
.Lmul16_032_EQ_done:
    brne8 .Lmul16_032_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_NE_done
.Lmul16_032_NE_true:
    mul_emit_char 'B'
.Lmul16_032_NE_done:
    brult8 .Lmul16_032_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_ULT_done
.Lmul16_032_ULT_true:
    mul_emit_char 'B'
.Lmul16_032_ULT_done:
    bruge8 .Lmul16_032_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_UGE_done
.Lmul16_032_UGE_true:
    mul_emit_char 'B'
.Lmul16_032_UGE_done:
    brslt8 .Lmul16_032_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_SLT_done
.Lmul16_032_SLT_true:
    mul_emit_char 'B'
.Lmul16_032_SLT_done:
    brsge8 .Lmul16_032_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_032_SGE_done
.Lmul16_032_SGE_true:
    mul_emit_char 'B'
.Lmul16_032_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r1, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x5c21
    push16 r4
    pop16 r0
    mul16 r3, r1
    push16 r0
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_033_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_EQ_done
.Lmul16_033_EQ_true:
    mul_emit_char 'B'
.Lmul16_033_EQ_done:
    brne8 .Lmul16_033_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_NE_done
.Lmul16_033_NE_true:
    mul_emit_char 'B'
.Lmul16_033_NE_done:
    brult8 .Lmul16_033_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_ULT_done
.Lmul16_033_ULT_true:
    mul_emit_char 'B'
.Lmul16_033_ULT_done:
    bruge8 .Lmul16_033_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_UGE_done
.Lmul16_033_UGE_true:
    mul_emit_char 'B'
.Lmul16_033_UGE_done:
    brslt8 .Lmul16_033_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_SLT_done
.Lmul16_033_SLT_true:
    mul_emit_char 'B'
.Lmul16_033_SLT_done:
    brsge8 .Lmul16_033_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_033_SGE_done
.Lmul16_033_SGE_true:
    mul_emit_char 'B'
.Lmul16_033_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r2, pattern 0; guard r4.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r3
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r2
    ldi16 r5, 0x6080
    push16 r5
    pop16 r4
    mul16 r3, r2
    push16 r4
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_034_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_EQ_done
.Lmul16_034_EQ_true:
    mul_emit_char 'B'
.Lmul16_034_EQ_done:
    brne8 .Lmul16_034_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_NE_done
.Lmul16_034_NE_true:
    mul_emit_char 'B'
.Lmul16_034_NE_done:
    brult8 .Lmul16_034_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_ULT_done
.Lmul16_034_ULT_true:
    mul_emit_char 'B'
.Lmul16_034_ULT_done:
    bruge8 .Lmul16_034_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_UGE_done
.Lmul16_034_UGE_true:
    mul_emit_char 'B'
.Lmul16_034_UGE_done:
    brslt8 .Lmul16_034_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_SLT_done
.Lmul16_034_SLT_true:
    mul_emit_char 'B'
.Lmul16_034_SLT_done:
    brsge8 .Lmul16_034_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_034_SGE_done
.Lmul16_034_SGE_true:
    mul_emit_char 'B'
.Lmul16_034_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r2, pattern 1; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r3
    ldi16 r5, 0xffff
    push16 r5
    pop16 r2
    ldi16 r5, 0x60db
    push16 r5
    pop16 r4
    mul16 r3, r2
    push16 r4
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_035_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_EQ_done
.Lmul16_035_EQ_true:
    mul_emit_char 'B'
.Lmul16_035_EQ_done:
    brne8 .Lmul16_035_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_NE_done
.Lmul16_035_NE_true:
    mul_emit_char 'B'
.Lmul16_035_NE_done:
    brult8 .Lmul16_035_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_ULT_done
.Lmul16_035_ULT_true:
    mul_emit_char 'B'
.Lmul16_035_ULT_done:
    bruge8 .Lmul16_035_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_UGE_done
.Lmul16_035_UGE_true:
    mul_emit_char 'B'
.Lmul16_035_UGE_done:
    brslt8 .Lmul16_035_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_SLT_done
.Lmul16_035_SLT_true:
    mul_emit_char 'B'
.Lmul16_035_SLT_done:
    brsge8 .Lmul16_035_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_035_SGE_done
.Lmul16_035_SGE_true:
    mul_emit_char 'B'
.Lmul16_035_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r3, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r3
    ldi16 r4, 0x6237
    push16 r4
    pop16 r5
    mul16 r3, r3
    push16 r5
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_036_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_EQ_done
.Lmul16_036_EQ_true:
    mul_emit_char 'B'
.Lmul16_036_EQ_done:
    brne8 .Lmul16_036_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_NE_done
.Lmul16_036_NE_true:
    mul_emit_char 'B'
.Lmul16_036_NE_done:
    brult8 .Lmul16_036_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_ULT_done
.Lmul16_036_ULT_true:
    mul_emit_char 'B'
.Lmul16_036_ULT_done:
    bruge8 .Lmul16_036_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_UGE_done
.Lmul16_036_UGE_true:
    mul_emit_char 'B'
.Lmul16_036_UGE_done:
    brslt8 .Lmul16_036_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_SLT_done
.Lmul16_036_SLT_true:
    mul_emit_char 'B'
.Lmul16_036_SLT_done:
    brsge8 .Lmul16_036_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_036_SGE_done
.Lmul16_036_SGE_true:
    mul_emit_char 'B'
.Lmul16_036_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r3, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r3
    ldi16 r4, 0x6393
    push16 r4
    pop16 r6
    mul16 r3, r3
    push16 r6
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_037_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_EQ_done
.Lmul16_037_EQ_true:
    mul_emit_char 'B'
.Lmul16_037_EQ_done:
    brne8 .Lmul16_037_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_NE_done
.Lmul16_037_NE_true:
    mul_emit_char 'B'
.Lmul16_037_NE_done:
    brult8 .Lmul16_037_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_ULT_done
.Lmul16_037_ULT_true:
    mul_emit_char 'B'
.Lmul16_037_ULT_done:
    bruge8 .Lmul16_037_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_UGE_done
.Lmul16_037_UGE_true:
    mul_emit_char 'B'
.Lmul16_037_UGE_done:
    brslt8 .Lmul16_037_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_SLT_done
.Lmul16_037_SLT_true:
    mul_emit_char 'B'
.Lmul16_037_SLT_done:
    brsge8 .Lmul16_037_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_037_SGE_done
.Lmul16_037_SGE_true:
    mul_emit_char 'B'
.Lmul16_037_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r4, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8000
    push16 r5
    pop16 r3
    ldi16 r5, 0x0002
    push16 r5
    pop16 r4
    ldi16 r5, 0x5de8
    push16 r5
    pop16 r0
    mul16 r3, r4
    push16 r0
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_038_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_EQ_done
.Lmul16_038_EQ_true:
    mul_emit_char 'B'
.Lmul16_038_EQ_done:
    brne8 .Lmul16_038_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_NE_done
.Lmul16_038_NE_true:
    mul_emit_char 'B'
.Lmul16_038_NE_done:
    brult8 .Lmul16_038_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_ULT_done
.Lmul16_038_ULT_true:
    mul_emit_char 'B'
.Lmul16_038_ULT_done:
    bruge8 .Lmul16_038_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_UGE_done
.Lmul16_038_UGE_true:
    mul_emit_char 'B'
.Lmul16_038_UGE_done:
    brslt8 .Lmul16_038_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_SLT_done
.Lmul16_038_SLT_true:
    mul_emit_char 'B'
.Lmul16_038_SLT_done:
    brsge8 .Lmul16_038_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_038_SGE_done
.Lmul16_038_SGE_true:
    mul_emit_char 'B'
.Lmul16_038_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r4, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r3
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r4
    ldi16 r5, 0x5f44
    push16 r5
    pop16 r1
    mul16 r3, r4
    push16 r1
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_039_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_EQ_done
.Lmul16_039_EQ_true:
    mul_emit_char 'B'
.Lmul16_039_EQ_done:
    brne8 .Lmul16_039_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_NE_done
.Lmul16_039_NE_true:
    mul_emit_char 'B'
.Lmul16_039_NE_done:
    brult8 .Lmul16_039_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_ULT_done
.Lmul16_039_ULT_true:
    mul_emit_char 'B'
.Lmul16_039_ULT_done:
    bruge8 .Lmul16_039_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_UGE_done
.Lmul16_039_UGE_true:
    mul_emit_char 'B'
.Lmul16_039_UGE_done:
    brslt8 .Lmul16_039_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_SLT_done
.Lmul16_039_SLT_true:
    mul_emit_char 'B'
.Lmul16_039_SLT_done:
    brsge8 .Lmul16_039_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_039_SGE_done
.Lmul16_039_SGE_true:
    mul_emit_char 'B'
.Lmul16_039_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r5, pattern 0; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r6, 0x0000
    push16 r6
    pop16 r3
    ldi16 r6, 0x0000
    push16 r6
    pop16 r5
    ldi16 r6, 0x62a2
    push16 r6
    pop16 r4
    mul16 r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_EQ_done
.Lmul16_03a_EQ_true:
    mul_emit_char 'B'
.Lmul16_03a_EQ_done:
    brne8 .Lmul16_03a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_NE_done
.Lmul16_03a_NE_true:
    mul_emit_char 'B'
.Lmul16_03a_NE_done:
    brult8 .Lmul16_03a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_ULT_done
.Lmul16_03a_ULT_true:
    mul_emit_char 'B'
.Lmul16_03a_ULT_done:
    bruge8 .Lmul16_03a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_UGE_done
.Lmul16_03a_UGE_true:
    mul_emit_char 'B'
.Lmul16_03a_UGE_done:
    brslt8 .Lmul16_03a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_SLT_done
.Lmul16_03a_SLT_true:
    mul_emit_char 'B'
.Lmul16_03a_SLT_done:
    brsge8 .Lmul16_03a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03a_SGE_done
.Lmul16_03a_SGE_true:
    mul_emit_char 'B'
.Lmul16_03a_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r5, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x00ff
    push16 r6
    pop16 r3
    ldi16 r6, 0x0101
    push16 r6
    pop16 r5
    ldi16 r6, 0x62fd
    push16 r6
    pop16 r4
    mul16 r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_EQ_done
.Lmul16_03b_EQ_true:
    mul_emit_char 'B'
.Lmul16_03b_EQ_done:
    brne8 .Lmul16_03b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_NE_done
.Lmul16_03b_NE_true:
    mul_emit_char 'B'
.Lmul16_03b_NE_done:
    brult8 .Lmul16_03b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_ULT_done
.Lmul16_03b_ULT_true:
    mul_emit_char 'B'
.Lmul16_03b_ULT_done:
    bruge8 .Lmul16_03b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_UGE_done
.Lmul16_03b_UGE_true:
    mul_emit_char 'B'
.Lmul16_03b_UGE_done:
    brslt8 .Lmul16_03b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_SLT_done
.Lmul16_03b_SLT_true:
    mul_emit_char 'B'
.Lmul16_03b_SLT_done:
    brsge8 .Lmul16_03b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03b_SGE_done
.Lmul16_03b_SGE_true:
    mul_emit_char 'B'
.Lmul16_03b_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r6, pattern 0; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r3
    ldi16 r4, 0x0100
    push16 r4
    pop16 r6
    ldi16 r4, 0x665b
    push16 r4
    pop16 r7
    mul16 r3, r6
    push16 r7
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_EQ_done
.Lmul16_03c_EQ_true:
    mul_emit_char 'B'
.Lmul16_03c_EQ_done:
    brne8 .Lmul16_03c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_NE_done
.Lmul16_03c_NE_true:
    mul_emit_char 'B'
.Lmul16_03c_NE_done:
    brult8 .Lmul16_03c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_ULT_done
.Lmul16_03c_ULT_true:
    mul_emit_char 'B'
.Lmul16_03c_ULT_done:
    bruge8 .Lmul16_03c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_UGE_done
.Lmul16_03c_UGE_true:
    mul_emit_char 'B'
.Lmul16_03c_UGE_done:
    brslt8 .Lmul16_03c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_SLT_done
.Lmul16_03c_SLT_true:
    mul_emit_char 'B'
.Lmul16_03c_SLT_done:
    brsge8 .Lmul16_03c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03c_SGE_done
.Lmul16_03c_SGE_true:
    mul_emit_char 'B'
.Lmul16_03c_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r6, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r3
    ldi16 r4, 0x0002
    push16 r4
    pop16 r6
    ldi16 r4, 0x66b6
    push16 r4
    pop16 r7
    mul16 r3, r6
    push16 r7
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_EQ_done
.Lmul16_03d_EQ_true:
    mul_emit_char 'B'
.Lmul16_03d_EQ_done:
    brne8 .Lmul16_03d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_NE_done
.Lmul16_03d_NE_true:
    mul_emit_char 'B'
.Lmul16_03d_NE_done:
    brult8 .Lmul16_03d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_ULT_done
.Lmul16_03d_ULT_true:
    mul_emit_char 'B'
.Lmul16_03d_ULT_done:
    bruge8 .Lmul16_03d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_UGE_done
.Lmul16_03d_UGE_true:
    mul_emit_char 'B'
.Lmul16_03d_UGE_done:
    brslt8 .Lmul16_03d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_SLT_done
.Lmul16_03d_SLT_true:
    mul_emit_char 'B'
.Lmul16_03d_SLT_done:
    brsge8 .Lmul16_03d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03d_SGE_done
.Lmul16_03d_SGE_true:
    mul_emit_char 'B'
.Lmul16_03d_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r7, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x610b
    push16 r4
    pop16 r1
    mul16 r3, r7
    push16 r1
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_EQ_done
.Lmul16_03e_EQ_true:
    mul_emit_char 'B'
.Lmul16_03e_EQ_done:
    brne8 .Lmul16_03e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_NE_done
.Lmul16_03e_NE_true:
    mul_emit_char 'B'
.Lmul16_03e_NE_done:
    brult8 .Lmul16_03e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_ULT_done
.Lmul16_03e_ULT_true:
    mul_emit_char 'B'
.Lmul16_03e_ULT_done:
    bruge8 .Lmul16_03e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_UGE_done
.Lmul16_03e_UGE_true:
    mul_emit_char 'B'
.Lmul16_03e_UGE_done:
    brslt8 .Lmul16_03e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_SLT_done
.Lmul16_03e_SLT_true:
    mul_emit_char 'B'
.Lmul16_03e_SLT_done:
    brsge8 .Lmul16_03e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03e_SGE_done
.Lmul16_03e_SGE_true:
    mul_emit_char 'B'
.Lmul16_03e_SGE_done:
    mul_emit_char '\n'

    ; d=r3, s=r7, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x6267
    push16 r4
    pop16 r2
    mul16 r3, r7
    push16 r2
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_03f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_EQ_done
.Lmul16_03f_EQ_true:
    mul_emit_char 'B'
.Lmul16_03f_EQ_done:
    brne8 .Lmul16_03f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_NE_done
.Lmul16_03f_NE_true:
    mul_emit_char 'B'
.Lmul16_03f_NE_done:
    brult8 .Lmul16_03f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_ULT_done
.Lmul16_03f_ULT_true:
    mul_emit_char 'B'
.Lmul16_03f_ULT_done:
    bruge8 .Lmul16_03f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_UGE_done
.Lmul16_03f_UGE_true:
    mul_emit_char 'B'
.Lmul16_03f_UGE_done:
    brslt8 .Lmul16_03f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_SLT_done
.Lmul16_03f_SLT_true:
    mul_emit_char 'B'
.Lmul16_03f_SLT_done:
    brsge8 .Lmul16_03f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_03f_SGE_done
.Lmul16_03f_SGE_true:
    mul_emit_char 'B'
.Lmul16_03f_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r0, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x7fff
    push16 r6
    pop16 r4
    ldi16 r6, 0x0002
    push16 r6
    pop16 r0
    ldi16 r6, 0x65c5
    push16 r6
    pop16 r5
    mul16 r4, r0
    push16 r5
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_040_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_EQ_done
.Lmul16_040_EQ_true:
    mul_emit_char 'B'
.Lmul16_040_EQ_done:
    brne8 .Lmul16_040_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_NE_done
.Lmul16_040_NE_true:
    mul_emit_char 'B'
.Lmul16_040_NE_done:
    brult8 .Lmul16_040_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_ULT_done
.Lmul16_040_ULT_true:
    mul_emit_char 'B'
.Lmul16_040_ULT_done:
    bruge8 .Lmul16_040_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_UGE_done
.Lmul16_040_UGE_true:
    mul_emit_char 'B'
.Lmul16_040_UGE_done:
    brslt8 .Lmul16_040_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_SLT_done
.Lmul16_040_SLT_true:
    mul_emit_char 'B'
.Lmul16_040_SLT_done:
    brsge8 .Lmul16_040_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_040_SGE_done
.Lmul16_040_SGE_true:
    mul_emit_char 'B'
.Lmul16_040_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r0, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r0
    ldi16 r5, 0x6721
    push16 r5
    pop16 r6
    mul16 r4, r0
    push16 r6
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_041_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_EQ_done
.Lmul16_041_EQ_true:
    mul_emit_char 'B'
.Lmul16_041_EQ_done:
    brne8 .Lmul16_041_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_NE_done
.Lmul16_041_NE_true:
    mul_emit_char 'B'
.Lmul16_041_NE_done:
    brult8 .Lmul16_041_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_ULT_done
.Lmul16_041_ULT_true:
    mul_emit_char 'B'
.Lmul16_041_ULT_done:
    bruge8 .Lmul16_041_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_UGE_done
.Lmul16_041_UGE_true:
    mul_emit_char 'B'
.Lmul16_041_UGE_done:
    brslt8 .Lmul16_041_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_SLT_done
.Lmul16_041_SLT_true:
    mul_emit_char 'B'
.Lmul16_041_SLT_done:
    brsge8 .Lmul16_041_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_041_SGE_done
.Lmul16_041_SGE_true:
    mul_emit_char 'B'
.Lmul16_041_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r1, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r4
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r1
    ldi16 r5, 0x6176
    push16 r5
    pop16 r0
    mul16 r4, r1
    push16 r0
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_042_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_EQ_done
.Lmul16_042_EQ_true:
    mul_emit_char 'B'
.Lmul16_042_EQ_done:
    brne8 .Lmul16_042_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_NE_done
.Lmul16_042_NE_true:
    mul_emit_char 'B'
.Lmul16_042_NE_done:
    brult8 .Lmul16_042_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_ULT_done
.Lmul16_042_ULT_true:
    mul_emit_char 'B'
.Lmul16_042_ULT_done:
    bruge8 .Lmul16_042_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_UGE_done
.Lmul16_042_UGE_true:
    mul_emit_char 'B'
.Lmul16_042_UGE_done:
    brslt8 .Lmul16_042_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_SLT_done
.Lmul16_042_SLT_true:
    mul_emit_char 'B'
.Lmul16_042_SLT_done:
    brsge8 .Lmul16_042_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_042_SGE_done
.Lmul16_042_SGE_true:
    mul_emit_char 'B'
.Lmul16_042_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r1, pattern 1; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r1
    ldi16 r5, 0x63d3
    push16 r5
    pop16 r2
    mul16 r4, r1
    push16 r2
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_043_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_EQ_done
.Lmul16_043_EQ_true:
    mul_emit_char 'B'
.Lmul16_043_EQ_done:
    brne8 .Lmul16_043_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_NE_done
.Lmul16_043_NE_true:
    mul_emit_char 'B'
.Lmul16_043_NE_done:
    brult8 .Lmul16_043_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_ULT_done
.Lmul16_043_ULT_true:
    mul_emit_char 'B'
.Lmul16_043_ULT_done:
    bruge8 .Lmul16_043_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_UGE_done
.Lmul16_043_UGE_true:
    mul_emit_char 'B'
.Lmul16_043_UGE_done:
    brslt8 .Lmul16_043_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_SLT_done
.Lmul16_043_SLT_true:
    mul_emit_char 'B'
.Lmul16_043_SLT_done:
    brsge8 .Lmul16_043_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_043_SGE_done
.Lmul16_043_SGE_true:
    mul_emit_char 'B'
.Lmul16_043_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r2, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r4
    ldi16 r5, 0x0101
    push16 r5
    pop16 r2
    ldi16 r5, 0x652f
    push16 r5
    pop16 r3
    mul16 r4, r2
    push16 r3
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_044_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_EQ_done
.Lmul16_044_EQ_true:
    mul_emit_char 'B'
.Lmul16_044_EQ_done:
    brne8 .Lmul16_044_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_NE_done
.Lmul16_044_NE_true:
    mul_emit_char 'B'
.Lmul16_044_NE_done:
    brult8 .Lmul16_044_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_ULT_done
.Lmul16_044_ULT_true:
    mul_emit_char 'B'
.Lmul16_044_ULT_done:
    bruge8 .Lmul16_044_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_UGE_done
.Lmul16_044_UGE_true:
    mul_emit_char 'B'
.Lmul16_044_UGE_done:
    brslt8 .Lmul16_044_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_SLT_done
.Lmul16_044_SLT_true:
    mul_emit_char 'B'
.Lmul16_044_SLT_done:
    brsge8 .Lmul16_044_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_044_SGE_done
.Lmul16_044_SGE_true:
    mul_emit_char 'B'
.Lmul16_044_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r2, pattern 1; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x7fff
    push16 r6
    pop16 r4
    ldi16 r6, 0x0002
    push16 r6
    pop16 r2
    ldi16 r6, 0x678c
    push16 r6
    pop16 r5
    mul16 r4, r2
    push16 r5
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_045_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_EQ_done
.Lmul16_045_EQ_true:
    mul_emit_char 'B'
.Lmul16_045_EQ_done:
    brne8 .Lmul16_045_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_NE_done
.Lmul16_045_NE_true:
    mul_emit_char 'B'
.Lmul16_045_NE_done:
    brult8 .Lmul16_045_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_ULT_done
.Lmul16_045_ULT_true:
    mul_emit_char 'B'
.Lmul16_045_ULT_done:
    bruge8 .Lmul16_045_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_UGE_done
.Lmul16_045_UGE_true:
    mul_emit_char 'B'
.Lmul16_045_UGE_done:
    brslt8 .Lmul16_045_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_SLT_done
.Lmul16_045_SLT_true:
    mul_emit_char 'B'
.Lmul16_045_SLT_done:
    brsge8 .Lmul16_045_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_045_SGE_done
.Lmul16_045_SGE_true:
    mul_emit_char 'B'
.Lmul16_045_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r3, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8000
    push16 r5
    pop16 r4
    ldi16 r5, 0x0002
    push16 r5
    pop16 r3
    ldi16 r5, 0x68e8
    push16 r5
    pop16 r6
    mul16 r4, r3
    push16 r6
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_046_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_EQ_done
.Lmul16_046_EQ_true:
    mul_emit_char 'B'
.Lmul16_046_EQ_done:
    brne8 .Lmul16_046_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_NE_done
.Lmul16_046_NE_true:
    mul_emit_char 'B'
.Lmul16_046_NE_done:
    brult8 .Lmul16_046_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_ULT_done
.Lmul16_046_ULT_true:
    mul_emit_char 'B'
.Lmul16_046_ULT_done:
    bruge8 .Lmul16_046_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_UGE_done
.Lmul16_046_UGE_true:
    mul_emit_char 'B'
.Lmul16_046_UGE_done:
    brslt8 .Lmul16_046_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_SLT_done
.Lmul16_046_SLT_true:
    mul_emit_char 'B'
.Lmul16_046_SLT_done:
    brsge8 .Lmul16_046_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_046_SGE_done
.Lmul16_046_SGE_true:
    mul_emit_char 'B'
.Lmul16_046_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r3, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r4
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r3
    ldi16 r5, 0x6a44
    push16 r5
    pop16 r7
    mul16 r4, r3
    push16 r7
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_047_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_EQ_done
.Lmul16_047_EQ_true:
    mul_emit_char 'B'
.Lmul16_047_EQ_done:
    brne8 .Lmul16_047_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_NE_done
.Lmul16_047_NE_true:
    mul_emit_char 'B'
.Lmul16_047_NE_done:
    brult8 .Lmul16_047_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_ULT_done
.Lmul16_047_ULT_true:
    mul_emit_char 'B'
.Lmul16_047_ULT_done:
    bruge8 .Lmul16_047_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_UGE_done
.Lmul16_047_UGE_true:
    mul_emit_char 'B'
.Lmul16_047_UGE_done:
    brslt8 .Lmul16_047_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_SLT_done
.Lmul16_047_SLT_true:
    mul_emit_char 'B'
.Lmul16_047_SLT_done:
    brsge8 .Lmul16_047_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_047_SGE_done
.Lmul16_047_SGE_true:
    mul_emit_char 'B'
.Lmul16_047_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r4, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0x6499
    push16 r5
    pop16 r1
    mul16 r4, r4
    push16 r1
    push16 r4
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_048_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_EQ_done
.Lmul16_048_EQ_true:
    mul_emit_char 'B'
.Lmul16_048_EQ_done:
    brne8 .Lmul16_048_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_NE_done
.Lmul16_048_NE_true:
    mul_emit_char 'B'
.Lmul16_048_NE_done:
    brult8 .Lmul16_048_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_ULT_done
.Lmul16_048_ULT_true:
    mul_emit_char 'B'
.Lmul16_048_ULT_done:
    bruge8 .Lmul16_048_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_UGE_done
.Lmul16_048_UGE_true:
    mul_emit_char 'B'
.Lmul16_048_UGE_done:
    brslt8 .Lmul16_048_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_SLT_done
.Lmul16_048_SLT_true:
    mul_emit_char 'B'
.Lmul16_048_SLT_done:
    brsge8 .Lmul16_048_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_048_SGE_done
.Lmul16_048_SGE_true:
    mul_emit_char 'B'
.Lmul16_048_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r4, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r4
    ldi16 r5, 0x65f5
    push16 r5
    pop16 r2
    mul16 r4, r4
    push16 r2
    push16 r4
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_049_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_EQ_done
.Lmul16_049_EQ_true:
    mul_emit_char 'B'
.Lmul16_049_EQ_done:
    brne8 .Lmul16_049_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_NE_done
.Lmul16_049_NE_true:
    mul_emit_char 'B'
.Lmul16_049_NE_done:
    brult8 .Lmul16_049_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_ULT_done
.Lmul16_049_ULT_true:
    mul_emit_char 'B'
.Lmul16_049_ULT_done:
    bruge8 .Lmul16_049_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_UGE_done
.Lmul16_049_UGE_true:
    mul_emit_char 'B'
.Lmul16_049_UGE_done:
    brslt8 .Lmul16_049_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_SLT_done
.Lmul16_049_SLT_true:
    mul_emit_char 'B'
.Lmul16_049_SLT_done:
    brsge8 .Lmul16_049_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_049_SGE_done
.Lmul16_049_SGE_true:
    mul_emit_char 'B'
.Lmul16_049_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 0; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r7, 0x0100
    push16 r7
    pop16 r4
    ldi16 r7, 0x0100
    push16 r7
    pop16 r5
    ldi16 r7, 0x6a54
    push16 r7
    pop16 r6
    mul16 r4, r5
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_EQ_done
.Lmul16_04a_EQ_true:
    mul_emit_char 'B'
.Lmul16_04a_EQ_done:
    brne8 .Lmul16_04a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_NE_done
.Lmul16_04a_NE_true:
    mul_emit_char 'B'
.Lmul16_04a_NE_done:
    brult8 .Lmul16_04a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_ULT_done
.Lmul16_04a_ULT_true:
    mul_emit_char 'B'
.Lmul16_04a_ULT_done:
    bruge8 .Lmul16_04a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_UGE_done
.Lmul16_04a_UGE_true:
    mul_emit_char 'B'
.Lmul16_04a_UGE_done:
    brslt8 .Lmul16_04a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_SLT_done
.Lmul16_04a_SLT_true:
    mul_emit_char 'B'
.Lmul16_04a_SLT_done:
    brsge8 .Lmul16_04a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04a_SGE_done
.Lmul16_04a_SGE_true:
    mul_emit_char 'B'
.Lmul16_04a_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r5, pattern 1; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r7, 0x8000
    push16 r7
    pop16 r4
    ldi16 r7, 0x0002
    push16 r7
    pop16 r5
    ldi16 r7, 0x6aaf
    push16 r7
    pop16 r6
    mul16 r4, r5
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_EQ_done
.Lmul16_04b_EQ_true:
    mul_emit_char 'B'
.Lmul16_04b_EQ_done:
    brne8 .Lmul16_04b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_NE_done
.Lmul16_04b_NE_true:
    mul_emit_char 'B'
.Lmul16_04b_NE_done:
    brult8 .Lmul16_04b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_ULT_done
.Lmul16_04b_ULT_true:
    mul_emit_char 'B'
.Lmul16_04b_ULT_done:
    bruge8 .Lmul16_04b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_UGE_done
.Lmul16_04b_UGE_true:
    mul_emit_char 'B'
.Lmul16_04b_UGE_done:
    brslt8 .Lmul16_04b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_SLT_done
.Lmul16_04b_SLT_true:
    mul_emit_char 'B'
.Lmul16_04b_SLT_done:
    brsge8 .Lmul16_04b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04b_SGE_done
.Lmul16_04b_SGE_true:
    mul_emit_char 'B'
.Lmul16_04b_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r6
    ldi16 r5, 0x6c0b
    push16 r5
    pop16 r7
    mul16 r4, r6
    push16 r7
    push16 r6
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_EQ_done
.Lmul16_04c_EQ_true:
    mul_emit_char 'B'
.Lmul16_04c_EQ_done:
    brne8 .Lmul16_04c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_NE_done
.Lmul16_04c_NE_true:
    mul_emit_char 'B'
.Lmul16_04c_NE_done:
    brult8 .Lmul16_04c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_ULT_done
.Lmul16_04c_ULT_true:
    mul_emit_char 'B'
.Lmul16_04c_ULT_done:
    bruge8 .Lmul16_04c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_UGE_done
.Lmul16_04c_UGE_true:
    mul_emit_char 'B'
.Lmul16_04c_UGE_done:
    brslt8 .Lmul16_04c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_SLT_done
.Lmul16_04c_SLT_true:
    mul_emit_char 'B'
.Lmul16_04c_SLT_done:
    brsge8 .Lmul16_04c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04c_SGE_done
.Lmul16_04c_SGE_true:
    mul_emit_char 'B'
.Lmul16_04c_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r6, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0x0000
    push16 r5
    pop16 r6
    ldi16 r5, 0x655f
    push16 r5
    pop16 r0
    mul16 r4, r6
    push16 r0
    push16 r6
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_EQ_done
.Lmul16_04d_EQ_true:
    mul_emit_char 'B'
.Lmul16_04d_EQ_done:
    brne8 .Lmul16_04d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_NE_done
.Lmul16_04d_NE_true:
    mul_emit_char 'B'
.Lmul16_04d_NE_done:
    brult8 .Lmul16_04d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_ULT_done
.Lmul16_04d_ULT_true:
    mul_emit_char 'B'
.Lmul16_04d_ULT_done:
    bruge8 .Lmul16_04d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_UGE_done
.Lmul16_04d_UGE_true:
    mul_emit_char 'B'
.Lmul16_04d_UGE_done:
    brslt8 .Lmul16_04d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_SLT_done
.Lmul16_04d_SLT_true:
    mul_emit_char 'B'
.Lmul16_04d_SLT_done:
    brsge8 .Lmul16_04d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04d_SGE_done
.Lmul16_04d_SGE_true:
    mul_emit_char 'B'
.Lmul16_04d_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r7
    ldi16 r5, 0x67bc
    push16 r5
    pop16 r2
    mul16 r4, r7
    push16 r2
    push16 r7
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_EQ_done
.Lmul16_04e_EQ_true:
    mul_emit_char 'B'
.Lmul16_04e_EQ_done:
    brne8 .Lmul16_04e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_NE_done
.Lmul16_04e_NE_true:
    mul_emit_char 'B'
.Lmul16_04e_NE_done:
    brult8 .Lmul16_04e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_ULT_done
.Lmul16_04e_ULT_true:
    mul_emit_char 'B'
.Lmul16_04e_ULT_done:
    bruge8 .Lmul16_04e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_UGE_done
.Lmul16_04e_UGE_true:
    mul_emit_char 'B'
.Lmul16_04e_UGE_done:
    brslt8 .Lmul16_04e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_SLT_done
.Lmul16_04e_SLT_true:
    mul_emit_char 'B'
.Lmul16_04e_SLT_done:
    brsge8 .Lmul16_04e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04e_SGE_done
.Lmul16_04e_SGE_true:
    mul_emit_char 'B'
.Lmul16_04e_SGE_done:
    mul_emit_char '\n'

    ; d=r4, s=r7, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0100
    push16 r5
    pop16 r4
    ldi16 r5, 0x0100
    push16 r5
    pop16 r7
    ldi16 r5, 0x6918
    push16 r5
    pop16 r3
    mul16 r4, r7
    push16 r3
    push16 r7
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_04f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_EQ_done
.Lmul16_04f_EQ_true:
    mul_emit_char 'B'
.Lmul16_04f_EQ_done:
    brne8 .Lmul16_04f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_NE_done
.Lmul16_04f_NE_true:
    mul_emit_char 'B'
.Lmul16_04f_NE_done:
    brult8 .Lmul16_04f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_ULT_done
.Lmul16_04f_ULT_true:
    mul_emit_char 'B'
.Lmul16_04f_ULT_done:
    bruge8 .Lmul16_04f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_UGE_done
.Lmul16_04f_UGE_true:
    mul_emit_char 'B'
.Lmul16_04f_UGE_done:
    brslt8 .Lmul16_04f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_SLT_done
.Lmul16_04f_SLT_true:
    mul_emit_char 'B'
.Lmul16_04f_SLT_done:
    brsge8 .Lmul16_04f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_04f_SGE_done
.Lmul16_04f_SGE_true:
    mul_emit_char 'B'
.Lmul16_04f_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r0, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r5
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r0
    ldi16 r4, 0x6c76
    push16 r4
    pop16 r6
    mul16 r5, r0
    push16 r6
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_050_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_EQ_done
.Lmul16_050_EQ_true:
    mul_emit_char 'B'
.Lmul16_050_EQ_done:
    brne8 .Lmul16_050_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_NE_done
.Lmul16_050_NE_true:
    mul_emit_char 'B'
.Lmul16_050_NE_done:
    brult8 .Lmul16_050_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_ULT_done
.Lmul16_050_ULT_true:
    mul_emit_char 'B'
.Lmul16_050_ULT_done:
    bruge8 .Lmul16_050_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_UGE_done
.Lmul16_050_UGE_true:
    mul_emit_char 'B'
.Lmul16_050_UGE_done:
    brslt8 .Lmul16_050_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_SLT_done
.Lmul16_050_SLT_true:
    mul_emit_char 'B'
.Lmul16_050_SLT_done:
    brsge8 .Lmul16_050_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_050_SGE_done
.Lmul16_050_SGE_true:
    mul_emit_char 'B'
.Lmul16_050_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r0, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r5
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x6dd2
    push16 r4
    pop16 r7
    mul16 r5, r0
    push16 r7
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_051_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_EQ_done
.Lmul16_051_EQ_true:
    mul_emit_char 'B'
.Lmul16_051_EQ_done:
    brne8 .Lmul16_051_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_NE_done
.Lmul16_051_NE_true:
    mul_emit_char 'B'
.Lmul16_051_NE_done:
    brult8 .Lmul16_051_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_ULT_done
.Lmul16_051_ULT_true:
    mul_emit_char 'B'
.Lmul16_051_ULT_done:
    bruge8 .Lmul16_051_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_UGE_done
.Lmul16_051_UGE_true:
    mul_emit_char 'B'
.Lmul16_051_UGE_done:
    brslt8 .Lmul16_051_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_SLT_done
.Lmul16_051_SLT_true:
    mul_emit_char 'B'
.Lmul16_051_SLT_done:
    brsge8 .Lmul16_051_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_051_SGE_done
.Lmul16_051_SGE_true:
    mul_emit_char 'B'
.Lmul16_051_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r1, pattern 0; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0101
    push16 r4
    pop16 r1
    ldi16 r4, 0x6928
    push16 r4
    pop16 r2
    mul16 r5, r1
    push16 r2
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_052_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_EQ_done
.Lmul16_052_EQ_true:
    mul_emit_char 'B'
.Lmul16_052_EQ_done:
    brne8 .Lmul16_052_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_NE_done
.Lmul16_052_NE_true:
    mul_emit_char 'B'
.Lmul16_052_NE_done:
    brult8 .Lmul16_052_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_ULT_done
.Lmul16_052_ULT_true:
    mul_emit_char 'B'
.Lmul16_052_ULT_done:
    bruge8 .Lmul16_052_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_UGE_done
.Lmul16_052_UGE_true:
    mul_emit_char 'B'
.Lmul16_052_UGE_done:
    brslt8 .Lmul16_052_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_SLT_done
.Lmul16_052_SLT_true:
    mul_emit_char 'B'
.Lmul16_052_SLT_done:
    brsge8 .Lmul16_052_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_052_SGE_done
.Lmul16_052_SGE_true:
    mul_emit_char 'B'
.Lmul16_052_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r1, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0002
    push16 r4
    pop16 r1
    ldi16 r4, 0x6983
    push16 r4
    pop16 r2
    mul16 r5, r1
    push16 r2
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_053_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_EQ_done
.Lmul16_053_EQ_true:
    mul_emit_char 'B'
.Lmul16_053_EQ_done:
    brne8 .Lmul16_053_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_NE_done
.Lmul16_053_NE_true:
    mul_emit_char 'B'
.Lmul16_053_NE_done:
    brult8 .Lmul16_053_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_ULT_done
.Lmul16_053_ULT_true:
    mul_emit_char 'B'
.Lmul16_053_ULT_done:
    bruge8 .Lmul16_053_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_UGE_done
.Lmul16_053_UGE_true:
    mul_emit_char 'B'
.Lmul16_053_UGE_done:
    brslt8 .Lmul16_053_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_SLT_done
.Lmul16_053_SLT_true:
    mul_emit_char 'B'
.Lmul16_053_SLT_done:
    brsge8 .Lmul16_053_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_053_SGE_done
.Lmul16_053_SGE_true:
    mul_emit_char 'B'
.Lmul16_053_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r2, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x8000
    push16 r6
    pop16 r5
    ldi16 r6, 0x0002
    push16 r6
    pop16 r2
    ldi16 r6, 0x6be0
    push16 r6
    pop16 r4
    mul16 r5, r2
    push16 r4
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_054_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_EQ_done
.Lmul16_054_EQ_true:
    mul_emit_char 'B'
.Lmul16_054_EQ_done:
    brne8 .Lmul16_054_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_NE_done
.Lmul16_054_NE_true:
    mul_emit_char 'B'
.Lmul16_054_NE_done:
    brult8 .Lmul16_054_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_ULT_done
.Lmul16_054_ULT_true:
    mul_emit_char 'B'
.Lmul16_054_ULT_done:
    bruge8 .Lmul16_054_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_UGE_done
.Lmul16_054_UGE_true:
    mul_emit_char 'B'
.Lmul16_054_UGE_done:
    brslt8 .Lmul16_054_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_SLT_done
.Lmul16_054_SLT_true:
    mul_emit_char 'B'
.Lmul16_054_SLT_done:
    brsge8 .Lmul16_054_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_054_SGE_done
.Lmul16_054_SGE_true:
    mul_emit_char 'B'
.Lmul16_054_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r2, pattern 1; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r5
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r2
    ldi16 r4, 0x6e3d
    push16 r4
    pop16 r6
    mul16 r5, r2
    push16 r6
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_055_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_EQ_done
.Lmul16_055_EQ_true:
    mul_emit_char 'B'
.Lmul16_055_EQ_done:
    brne8 .Lmul16_055_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_NE_done
.Lmul16_055_NE_true:
    mul_emit_char 'B'
.Lmul16_055_NE_done:
    brult8 .Lmul16_055_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_ULT_done
.Lmul16_055_ULT_true:
    mul_emit_char 'B'
.Lmul16_055_ULT_done:
    bruge8 .Lmul16_055_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_UGE_done
.Lmul16_055_UGE_true:
    mul_emit_char 'B'
.Lmul16_055_UGE_done:
    brslt8 .Lmul16_055_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_SLT_done
.Lmul16_055_SLT_true:
    mul_emit_char 'B'
.Lmul16_055_SLT_done:
    brsge8 .Lmul16_055_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_055_SGE_done
.Lmul16_055_SGE_true:
    mul_emit_char 'B'
.Lmul16_055_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r3, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0x6f99
    push16 r4
    pop16 r7
    mul16 r5, r3
    push16 r7
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_056_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_EQ_done
.Lmul16_056_EQ_true:
    mul_emit_char 'B'
.Lmul16_056_EQ_done:
    brne8 .Lmul16_056_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_NE_done
.Lmul16_056_NE_true:
    mul_emit_char 'B'
.Lmul16_056_NE_done:
    brult8 .Lmul16_056_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_ULT_done
.Lmul16_056_ULT_true:
    mul_emit_char 'B'
.Lmul16_056_ULT_done:
    bruge8 .Lmul16_056_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_UGE_done
.Lmul16_056_UGE_true:
    mul_emit_char 'B'
.Lmul16_056_UGE_done:
    brslt8 .Lmul16_056_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_SLT_done
.Lmul16_056_SLT_true:
    mul_emit_char 'B'
.Lmul16_056_SLT_done:
    brsge8 .Lmul16_056_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_056_SGE_done
.Lmul16_056_SGE_true:
    mul_emit_char 'B'
.Lmul16_056_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r3, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0101
    push16 r4
    pop16 r3
    ldi16 r4, 0x68ed
    push16 r4
    pop16 r0
    mul16 r5, r3
    push16 r0
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_057_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_EQ_done
.Lmul16_057_EQ_true:
    mul_emit_char 'B'
.Lmul16_057_EQ_done:
    brne8 .Lmul16_057_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_NE_done
.Lmul16_057_NE_true:
    mul_emit_char 'B'
.Lmul16_057_NE_done:
    brult8 .Lmul16_057_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_ULT_done
.Lmul16_057_ULT_true:
    mul_emit_char 'B'
.Lmul16_057_ULT_done:
    bruge8 .Lmul16_057_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_UGE_done
.Lmul16_057_UGE_true:
    mul_emit_char 'B'
.Lmul16_057_UGE_done:
    brslt8 .Lmul16_057_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_SLT_done
.Lmul16_057_SLT_true:
    mul_emit_char 'B'
.Lmul16_057_SLT_done:
    brsge8 .Lmul16_057_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_057_SGE_done
.Lmul16_057_SGE_true:
    mul_emit_char 'B'
.Lmul16_057_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r6, 0x0100
    push16 r6
    pop16 r5
    ldi16 r6, 0x0100
    push16 r6
    pop16 r4
    ldi16 r6, 0x6b4a
    push16 r6
    pop16 r2
    mul16 r5, r4
    push16 r2
    push16 r4
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_058_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_EQ_done
.Lmul16_058_EQ_true:
    mul_emit_char 'B'
.Lmul16_058_EQ_done:
    brne8 .Lmul16_058_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_NE_done
.Lmul16_058_NE_true:
    mul_emit_char 'B'
.Lmul16_058_NE_done:
    brult8 .Lmul16_058_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_ULT_done
.Lmul16_058_ULT_true:
    mul_emit_char 'B'
.Lmul16_058_ULT_done:
    bruge8 .Lmul16_058_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_UGE_done
.Lmul16_058_UGE_true:
    mul_emit_char 'B'
.Lmul16_058_UGE_done:
    brslt8 .Lmul16_058_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_SLT_done
.Lmul16_058_SLT_true:
    mul_emit_char 'B'
.Lmul16_058_SLT_done:
    brsge8 .Lmul16_058_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_058_SGE_done
.Lmul16_058_SGE_true:
    mul_emit_char 'B'
.Lmul16_058_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r4, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r6, 0x8000
    push16 r6
    pop16 r5
    ldi16 r6, 0x0002
    push16 r6
    pop16 r4
    ldi16 r6, 0x6ca6
    push16 r6
    pop16 r3
    mul16 r5, r4
    push16 r3
    push16 r4
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_059_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_EQ_done
.Lmul16_059_EQ_true:
    mul_emit_char 'B'
.Lmul16_059_EQ_done:
    brne8 .Lmul16_059_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_NE_done
.Lmul16_059_NE_true:
    mul_emit_char 'B'
.Lmul16_059_NE_done:
    brult8 .Lmul16_059_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_ULT_done
.Lmul16_059_ULT_true:
    mul_emit_char 'B'
.Lmul16_059_ULT_done:
    bruge8 .Lmul16_059_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_UGE_done
.Lmul16_059_UGE_true:
    mul_emit_char 'B'
.Lmul16_059_UGE_done:
    brslt8 .Lmul16_059_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_SLT_done
.Lmul16_059_SLT_true:
    mul_emit_char 'B'
.Lmul16_059_SLT_done:
    brsge8 .Lmul16_059_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_059_SGE_done
.Lmul16_059_SGE_true:
    mul_emit_char 'B'
.Lmul16_059_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 0; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x7004
    push16 r4
    pop16 r6
    mul16 r5, r5
    push16 r6
    push16 r5
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_EQ_done
.Lmul16_05a_EQ_true:
    mul_emit_char 'B'
.Lmul16_05a_EQ_done:
    brne8 .Lmul16_05a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_NE_done
.Lmul16_05a_NE_true:
    mul_emit_char 'B'
.Lmul16_05a_NE_done:
    brult8 .Lmul16_05a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_ULT_done
.Lmul16_05a_ULT_true:
    mul_emit_char 'B'
.Lmul16_05a_ULT_done:
    bruge8 .Lmul16_05a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_UGE_done
.Lmul16_05a_UGE_true:
    mul_emit_char 'B'
.Lmul16_05a_UGE_done:
    brslt8 .Lmul16_05a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_SLT_done
.Lmul16_05a_SLT_true:
    mul_emit_char 'B'
.Lmul16_05a_SLT_done:
    brsge8 .Lmul16_05a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05a_SGE_done
.Lmul16_05a_SGE_true:
    mul_emit_char 'B'
.Lmul16_05a_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r5, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0x705f
    push16 r4
    pop16 r6
    mul16 r5, r5
    push16 r6
    push16 r5
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_EQ_done
.Lmul16_05b_EQ_true:
    mul_emit_char 'B'
.Lmul16_05b_EQ_done:
    brne8 .Lmul16_05b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_NE_done
.Lmul16_05b_NE_true:
    mul_emit_char 'B'
.Lmul16_05b_NE_done:
    brult8 .Lmul16_05b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_ULT_done
.Lmul16_05b_ULT_true:
    mul_emit_char 'B'
.Lmul16_05b_ULT_done:
    bruge8 .Lmul16_05b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_UGE_done
.Lmul16_05b_UGE_true:
    mul_emit_char 'B'
.Lmul16_05b_UGE_done:
    brslt8 .Lmul16_05b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_SLT_done
.Lmul16_05b_SLT_true:
    mul_emit_char 'B'
.Lmul16_05b_SLT_done:
    brsge8 .Lmul16_05b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05b_SGE_done
.Lmul16_05b_SGE_true:
    mul_emit_char 'B'
.Lmul16_05b_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r5
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x6ab4
    push16 r4
    pop16 r0
    mul16 r5, r6
    push16 r0
    push16 r6
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_EQ_done
.Lmul16_05c_EQ_true:
    mul_emit_char 'B'
.Lmul16_05c_EQ_done:
    brne8 .Lmul16_05c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_NE_done
.Lmul16_05c_NE_true:
    mul_emit_char 'B'
.Lmul16_05c_NE_done:
    brult8 .Lmul16_05c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_ULT_done
.Lmul16_05c_ULT_true:
    mul_emit_char 'B'
.Lmul16_05c_ULT_done:
    bruge8 .Lmul16_05c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_UGE_done
.Lmul16_05c_UGE_true:
    mul_emit_char 'B'
.Lmul16_05c_UGE_done:
    brslt8 .Lmul16_05c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_SLT_done
.Lmul16_05c_SLT_true:
    mul_emit_char 'B'
.Lmul16_05c_SLT_done:
    brsge8 .Lmul16_05c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05c_SGE_done
.Lmul16_05c_SGE_true:
    mul_emit_char 'B'
.Lmul16_05c_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r6, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r5
    ldi16 r4, 0x0100
    push16 r4
    pop16 r6
    ldi16 r4, 0x6c10
    push16 r4
    pop16 r1
    mul16 r5, r6
    push16 r1
    push16 r6
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_EQ_done
.Lmul16_05d_EQ_true:
    mul_emit_char 'B'
.Lmul16_05d_EQ_done:
    brne8 .Lmul16_05d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_NE_done
.Lmul16_05d_NE_true:
    mul_emit_char 'B'
.Lmul16_05d_NE_done:
    brult8 .Lmul16_05d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_ULT_done
.Lmul16_05d_ULT_true:
    mul_emit_char 'B'
.Lmul16_05d_ULT_done:
    bruge8 .Lmul16_05d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_UGE_done
.Lmul16_05d_UGE_true:
    mul_emit_char 'B'
.Lmul16_05d_UGE_done:
    brslt8 .Lmul16_05d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_SLT_done
.Lmul16_05d_SLT_true:
    mul_emit_char 'B'
.Lmul16_05d_SLT_done:
    brsge8 .Lmul16_05d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05d_SGE_done
.Lmul16_05d_SGE_true:
    mul_emit_char 'B'
.Lmul16_05d_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0002
    push16 r4
    pop16 r7
    ldi16 r4, 0x6e6d
    push16 r4
    pop16 r3
    mul16 r5, r7
    push16 r3
    push16 r7
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_EQ_done
.Lmul16_05e_EQ_true:
    mul_emit_char 'B'
.Lmul16_05e_EQ_done:
    brne8 .Lmul16_05e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_NE_done
.Lmul16_05e_NE_true:
    mul_emit_char 'B'
.Lmul16_05e_NE_done:
    brult8 .Lmul16_05e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_ULT_done
.Lmul16_05e_ULT_true:
    mul_emit_char 'B'
.Lmul16_05e_ULT_done:
    bruge8 .Lmul16_05e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_UGE_done
.Lmul16_05e_UGE_true:
    mul_emit_char 'B'
.Lmul16_05e_UGE_done:
    brslt8 .Lmul16_05e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_SLT_done
.Lmul16_05e_SLT_true:
    mul_emit_char 'B'
.Lmul16_05e_SLT_done:
    brsge8 .Lmul16_05e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05e_SGE_done
.Lmul16_05e_SGE_true:
    mul_emit_char 'B'
.Lmul16_05e_SGE_done:
    mul_emit_char '\n'

    ; d=r5, s=r7, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0xffff
    push16 r6
    pop16 r5
    ldi16 r6, 0xffff
    push16 r6
    pop16 r7
    ldi16 r6, 0x6fc9
    push16 r6
    pop16 r4
    mul16 r5, r7
    push16 r4
    push16 r7
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_05f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_EQ_done
.Lmul16_05f_EQ_true:
    mul_emit_char 'B'
.Lmul16_05f_EQ_done:
    brne8 .Lmul16_05f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_NE_done
.Lmul16_05f_NE_true:
    mul_emit_char 'B'
.Lmul16_05f_NE_done:
    brult8 .Lmul16_05f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_ULT_done
.Lmul16_05f_ULT_true:
    mul_emit_char 'B'
.Lmul16_05f_ULT_done:
    bruge8 .Lmul16_05f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_UGE_done
.Lmul16_05f_UGE_true:
    mul_emit_char 'B'
.Lmul16_05f_UGE_done:
    brslt8 .Lmul16_05f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_SLT_done
.Lmul16_05f_SLT_true:
    mul_emit_char 'B'
.Lmul16_05f_SLT_done:
    brsge8 .Lmul16_05f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_05f_SGE_done
.Lmul16_05f_SGE_true:
    mul_emit_char 'B'
.Lmul16_05f_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r0, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r6
    ldi16 r4, 0x0101
    push16 r4
    pop16 r0
    ldi16 r4, 0x7327
    push16 r4
    pop16 r7
    mul16 r6, r0
    push16 r7
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_060_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_EQ_done
.Lmul16_060_EQ_true:
    mul_emit_char 'B'
.Lmul16_060_EQ_done:
    brne8 .Lmul16_060_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_NE_done
.Lmul16_060_NE_true:
    mul_emit_char 'B'
.Lmul16_060_NE_done:
    brult8 .Lmul16_060_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_ULT_done
.Lmul16_060_ULT_true:
    mul_emit_char 'B'
.Lmul16_060_ULT_done:
    bruge8 .Lmul16_060_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_UGE_done
.Lmul16_060_UGE_true:
    mul_emit_char 'B'
.Lmul16_060_UGE_done:
    brslt8 .Lmul16_060_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_SLT_done
.Lmul16_060_SLT_true:
    mul_emit_char 'B'
.Lmul16_060_SLT_done:
    brsge8 .Lmul16_060_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_060_SGE_done
.Lmul16_060_SGE_true:
    mul_emit_char 'B'
.Lmul16_060_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r0, pattern 1; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r6
    ldi16 r4, 0x0002
    push16 r4
    pop16 r0
    ldi16 r4, 0x6d7c
    push16 r4
    pop16 r1
    mul16 r6, r0
    push16 r1
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_061_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_EQ_done
.Lmul16_061_EQ_true:
    mul_emit_char 'B'
.Lmul16_061_EQ_done:
    brne8 .Lmul16_061_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_NE_done
.Lmul16_061_NE_true:
    mul_emit_char 'B'
.Lmul16_061_NE_done:
    brult8 .Lmul16_061_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_ULT_done
.Lmul16_061_ULT_true:
    mul_emit_char 'B'
.Lmul16_061_ULT_done:
    bruge8 .Lmul16_061_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_UGE_done
.Lmul16_061_UGE_true:
    mul_emit_char 'B'
.Lmul16_061_UGE_done:
    brslt8 .Lmul16_061_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_SLT_done
.Lmul16_061_SLT_true:
    mul_emit_char 'B'
.Lmul16_061_SLT_done:
    brsge8 .Lmul16_061_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_061_SGE_done
.Lmul16_061_SGE_true:
    mul_emit_char 'B'
.Lmul16_061_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r1, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r6
    ldi16 r4, 0x0002
    push16 r4
    pop16 r1
    ldi16 r4, 0x6ed8
    push16 r4
    pop16 r2
    mul16 r6, r1
    push16 r2
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_062_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_EQ_done
.Lmul16_062_EQ_true:
    mul_emit_char 'B'
.Lmul16_062_EQ_done:
    brne8 .Lmul16_062_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_NE_done
.Lmul16_062_NE_true:
    mul_emit_char 'B'
.Lmul16_062_NE_done:
    brult8 .Lmul16_062_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_ULT_done
.Lmul16_062_ULT_true:
    mul_emit_char 'B'
.Lmul16_062_ULT_done:
    bruge8 .Lmul16_062_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_UGE_done
.Lmul16_062_UGE_true:
    mul_emit_char 'B'
.Lmul16_062_UGE_done:
    brslt8 .Lmul16_062_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_SLT_done
.Lmul16_062_SLT_true:
    mul_emit_char 'B'
.Lmul16_062_SLT_done:
    brsge8 .Lmul16_062_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_062_SGE_done
.Lmul16_062_SGE_true:
    mul_emit_char 'B'
.Lmul16_062_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r1, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r6
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r1
    ldi16 r4, 0x7034
    push16 r4
    pop16 r3
    mul16 r6, r1
    push16 r3
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_063_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_EQ_done
.Lmul16_063_EQ_true:
    mul_emit_char 'B'
.Lmul16_063_EQ_done:
    brne8 .Lmul16_063_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_NE_done
.Lmul16_063_NE_true:
    mul_emit_char 'B'
.Lmul16_063_NE_done:
    brult8 .Lmul16_063_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_ULT_done
.Lmul16_063_ULT_true:
    mul_emit_char 'B'
.Lmul16_063_ULT_done:
    bruge8 .Lmul16_063_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_UGE_done
.Lmul16_063_UGE_true:
    mul_emit_char 'B'
.Lmul16_063_UGE_done:
    brslt8 .Lmul16_063_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_SLT_done
.Lmul16_063_SLT_true:
    mul_emit_char 'B'
.Lmul16_063_SLT_done:
    brsge8 .Lmul16_063_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_063_SGE_done
.Lmul16_063_SGE_true:
    mul_emit_char 'B'
.Lmul16_063_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r2, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r6
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x7291
    push16 r4
    pop16 r5
    mul16 r6, r2
    push16 r5
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_064_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_EQ_done
.Lmul16_064_EQ_true:
    mul_emit_char 'B'
.Lmul16_064_EQ_done:
    brne8 .Lmul16_064_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_NE_done
.Lmul16_064_NE_true:
    mul_emit_char 'B'
.Lmul16_064_NE_done:
    brult8 .Lmul16_064_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_ULT_done
.Lmul16_064_ULT_true:
    mul_emit_char 'B'
.Lmul16_064_ULT_done:
    bruge8 .Lmul16_064_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_UGE_done
.Lmul16_064_UGE_true:
    mul_emit_char 'B'
.Lmul16_064_UGE_done:
    brslt8 .Lmul16_064_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_SLT_done
.Lmul16_064_SLT_true:
    mul_emit_char 'B'
.Lmul16_064_SLT_done:
    brsge8 .Lmul16_064_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_064_SGE_done
.Lmul16_064_SGE_true:
    mul_emit_char 'B'
.Lmul16_064_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r2, pattern 1; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r6
    ldi16 r4, 0x0101
    push16 r4
    pop16 r2
    ldi16 r4, 0x74ee
    push16 r4
    pop16 r7
    mul16 r6, r2
    push16 r7
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_065_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_EQ_done
.Lmul16_065_EQ_true:
    mul_emit_char 'B'
.Lmul16_065_EQ_done:
    brne8 .Lmul16_065_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_NE_done
.Lmul16_065_NE_true:
    mul_emit_char 'B'
.Lmul16_065_NE_done:
    brult8 .Lmul16_065_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_ULT_done
.Lmul16_065_ULT_true:
    mul_emit_char 'B'
.Lmul16_065_ULT_done:
    bruge8 .Lmul16_065_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_UGE_done
.Lmul16_065_UGE_true:
    mul_emit_char 'B'
.Lmul16_065_UGE_done:
    brslt8 .Lmul16_065_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_SLT_done
.Lmul16_065_SLT_true:
    mul_emit_char 'B'
.Lmul16_065_SLT_done:
    brsge8 .Lmul16_065_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_065_SGE_done
.Lmul16_065_SGE_true:
    mul_emit_char 'B'
.Lmul16_065_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r3, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r6
    ldi16 r4, 0x0100
    push16 r4
    pop16 r3
    ldi16 r4, 0x6e42
    push16 r4
    pop16 r0
    mul16 r6, r3
    push16 r0
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_066_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_EQ_done
.Lmul16_066_EQ_true:
    mul_emit_char 'B'
.Lmul16_066_EQ_done:
    brne8 .Lmul16_066_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_NE_done
.Lmul16_066_NE_true:
    mul_emit_char 'B'
.Lmul16_066_NE_done:
    brult8 .Lmul16_066_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_ULT_done
.Lmul16_066_ULT_true:
    mul_emit_char 'B'
.Lmul16_066_ULT_done:
    bruge8 .Lmul16_066_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_UGE_done
.Lmul16_066_UGE_true:
    mul_emit_char 'B'
.Lmul16_066_UGE_done:
    brslt8 .Lmul16_066_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_SLT_done
.Lmul16_066_SLT_true:
    mul_emit_char 'B'
.Lmul16_066_SLT_done:
    brsge8 .Lmul16_066_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_066_SGE_done
.Lmul16_066_SGE_true:
    mul_emit_char 'B'
.Lmul16_066_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r3, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r6
    ldi16 r4, 0x0002
    push16 r4
    pop16 r3
    ldi16 r4, 0x6f9e
    push16 r4
    pop16 r1
    mul16 r6, r3
    push16 r1
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_067_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_EQ_done
.Lmul16_067_EQ_true:
    mul_emit_char 'B'
.Lmul16_067_EQ_done:
    brne8 .Lmul16_067_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_NE_done
.Lmul16_067_NE_true:
    mul_emit_char 'B'
.Lmul16_067_NE_done:
    brult8 .Lmul16_067_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_ULT_done
.Lmul16_067_ULT_true:
    mul_emit_char 'B'
.Lmul16_067_ULT_done:
    bruge8 .Lmul16_067_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_UGE_done
.Lmul16_067_UGE_true:
    mul_emit_char 'B'
.Lmul16_067_UGE_done:
    brslt8 .Lmul16_067_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_SLT_done
.Lmul16_067_SLT_true:
    mul_emit_char 'B'
.Lmul16_067_SLT_done:
    brsge8 .Lmul16_067_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_067_SGE_done
.Lmul16_067_SGE_true:
    mul_emit_char 'B'
.Lmul16_067_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r6
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x71fb
    push16 r5
    pop16 r3
    mul16 r6, r4
    push16 r3
    push16 r4
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_068_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_EQ_done
.Lmul16_068_EQ_true:
    mul_emit_char 'B'
.Lmul16_068_EQ_done:
    brne8 .Lmul16_068_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_NE_done
.Lmul16_068_NE_true:
    mul_emit_char 'B'
.Lmul16_068_NE_done:
    brult8 .Lmul16_068_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_ULT_done
.Lmul16_068_ULT_true:
    mul_emit_char 'B'
.Lmul16_068_ULT_done:
    bruge8 .Lmul16_068_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_UGE_done
.Lmul16_068_UGE_true:
    mul_emit_char 'B'
.Lmul16_068_UGE_done:
    brslt8 .Lmul16_068_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_SLT_done
.Lmul16_068_SLT_true:
    mul_emit_char 'B'
.Lmul16_068_SLT_done:
    brsge8 .Lmul16_068_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_068_SGE_done
.Lmul16_068_SGE_true:
    mul_emit_char 'B'
.Lmul16_068_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r4, pattern 1; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r7, 0x0000
    push16 r7
    pop16 r6
    ldi16 r7, 0x0000
    push16 r7
    pop16 r4
    ldi16 r7, 0x7458
    push16 r7
    pop16 r5
    mul16 r6, r4
    push16 r5
    push16 r4
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_069_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_EQ_done
.Lmul16_069_EQ_true:
    mul_emit_char 'B'
.Lmul16_069_EQ_done:
    brne8 .Lmul16_069_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_NE_done
.Lmul16_069_NE_true:
    mul_emit_char 'B'
.Lmul16_069_NE_done:
    brult8 .Lmul16_069_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_ULT_done
.Lmul16_069_ULT_true:
    mul_emit_char 'B'
.Lmul16_069_ULT_done:
    bruge8 .Lmul16_069_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_UGE_done
.Lmul16_069_UGE_true:
    mul_emit_char 'B'
.Lmul16_069_UGE_done:
    brslt8 .Lmul16_069_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_SLT_done
.Lmul16_069_SLT_true:
    mul_emit_char 'B'
.Lmul16_069_SLT_done:
    brsge8 .Lmul16_069_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_069_SGE_done
.Lmul16_069_SGE_true:
    mul_emit_char 'B'
.Lmul16_069_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 0; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r6
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x76b5
    push16 r4
    pop16 r7
    mul16 r6, r5
    push16 r7
    push16 r5
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_EQ_done
.Lmul16_06a_EQ_true:
    mul_emit_char 'B'
.Lmul16_06a_EQ_done:
    brne8 .Lmul16_06a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_NE_done
.Lmul16_06a_NE_true:
    mul_emit_char 'B'
.Lmul16_06a_NE_done:
    brult8 .Lmul16_06a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_ULT_done
.Lmul16_06a_ULT_true:
    mul_emit_char 'B'
.Lmul16_06a_ULT_done:
    bruge8 .Lmul16_06a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_UGE_done
.Lmul16_06a_UGE_true:
    mul_emit_char 'B'
.Lmul16_06a_UGE_done:
    brslt8 .Lmul16_06a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_SLT_done
.Lmul16_06a_SLT_true:
    mul_emit_char 'B'
.Lmul16_06a_SLT_done:
    brsge8 .Lmul16_06a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06a_SGE_done
.Lmul16_06a_SGE_true:
    mul_emit_char 'B'
.Lmul16_06a_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r5, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r6
    ldi16 r4, 0x0100
    push16 r4
    pop16 r5
    ldi16 r4, 0x7710
    push16 r4
    pop16 r7
    mul16 r6, r5
    push16 r7
    push16 r5
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_EQ_done
.Lmul16_06b_EQ_true:
    mul_emit_char 'B'
.Lmul16_06b_EQ_done:
    brne8 .Lmul16_06b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_NE_done
.Lmul16_06b_NE_true:
    mul_emit_char 'B'
.Lmul16_06b_NE_done:
    brult8 .Lmul16_06b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_ULT_done
.Lmul16_06b_ULT_true:
    mul_emit_char 'B'
.Lmul16_06b_ULT_done:
    bruge8 .Lmul16_06b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_UGE_done
.Lmul16_06b_UGE_true:
    mul_emit_char 'B'
.Lmul16_06b_UGE_done:
    brslt8 .Lmul16_06b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_SLT_done
.Lmul16_06b_SLT_true:
    mul_emit_char 'B'
.Lmul16_06b_SLT_done:
    brsge8 .Lmul16_06b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06b_SGE_done
.Lmul16_06b_SGE_true:
    mul_emit_char 'B'
.Lmul16_06b_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r6
    ldi16 r4, 0x7165
    push16 r4
    pop16 r1
    mul16 r6, r6
    push16 r1
    push16 r6
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_EQ_done
.Lmul16_06c_EQ_true:
    mul_emit_char 'B'
.Lmul16_06c_EQ_done:
    brne8 .Lmul16_06c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_NE_done
.Lmul16_06c_NE_true:
    mul_emit_char 'B'
.Lmul16_06c_NE_done:
    brult8 .Lmul16_06c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_ULT_done
.Lmul16_06c_ULT_true:
    mul_emit_char 'B'
.Lmul16_06c_ULT_done:
    bruge8 .Lmul16_06c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_UGE_done
.Lmul16_06c_UGE_true:
    mul_emit_char 'B'
.Lmul16_06c_UGE_done:
    brslt8 .Lmul16_06c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_SLT_done
.Lmul16_06c_SLT_true:
    mul_emit_char 'B'
.Lmul16_06c_SLT_done:
    brsge8 .Lmul16_06c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06c_SGE_done
.Lmul16_06c_SGE_true:
    mul_emit_char 'B'
.Lmul16_06c_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r6, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x72c1
    push16 r4
    pop16 r2
    mul16 r6, r6
    push16 r2
    push16 r6
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_EQ_done
.Lmul16_06d_EQ_true:
    mul_emit_char 'B'
.Lmul16_06d_EQ_done:
    brne8 .Lmul16_06d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_NE_done
.Lmul16_06d_NE_true:
    mul_emit_char 'B'
.Lmul16_06d_NE_done:
    brult8 .Lmul16_06d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_ULT_done
.Lmul16_06d_ULT_true:
    mul_emit_char 'B'
.Lmul16_06d_ULT_done:
    bruge8 .Lmul16_06d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_UGE_done
.Lmul16_06d_UGE_true:
    mul_emit_char 'B'
.Lmul16_06d_UGE_done:
    brslt8 .Lmul16_06d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_SLT_done
.Lmul16_06d_SLT_true:
    mul_emit_char 'B'
.Lmul16_06d_SLT_done:
    brsge8 .Lmul16_06d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06d_SGE_done
.Lmul16_06d_SGE_true:
    mul_emit_char 'B'
.Lmul16_06d_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r6
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r7
    ldi16 r5, 0x751e
    push16 r5
    pop16 r4
    mul16 r6, r7
    push16 r4
    push16 r7
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_EQ_done
.Lmul16_06e_EQ_true:
    mul_emit_char 'B'
.Lmul16_06e_EQ_done:
    brne8 .Lmul16_06e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_NE_done
.Lmul16_06e_NE_true:
    mul_emit_char 'B'
.Lmul16_06e_NE_done:
    brult8 .Lmul16_06e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_ULT_done
.Lmul16_06e_ULT_true:
    mul_emit_char 'B'
.Lmul16_06e_ULT_done:
    bruge8 .Lmul16_06e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_UGE_done
.Lmul16_06e_UGE_true:
    mul_emit_char 'B'
.Lmul16_06e_UGE_done:
    brslt8 .Lmul16_06e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_SLT_done
.Lmul16_06e_SLT_true:
    mul_emit_char 'B'
.Lmul16_06e_SLT_done:
    brsge8 .Lmul16_06e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06e_SGE_done
.Lmul16_06e_SGE_true:
    mul_emit_char 'B'
.Lmul16_06e_SGE_done:
    mul_emit_char '\n'

    ; d=r6, s=r7, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r6
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x767a
    push16 r4
    pop16 r5
    mul16 r6, r7
    push16 r5
    push16 r7
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_06f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_EQ_done
.Lmul16_06f_EQ_true:
    mul_emit_char 'B'
.Lmul16_06f_EQ_done:
    brne8 .Lmul16_06f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_NE_done
.Lmul16_06f_NE_true:
    mul_emit_char 'B'
.Lmul16_06f_NE_done:
    brult8 .Lmul16_06f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_ULT_done
.Lmul16_06f_ULT_true:
    mul_emit_char 'B'
.Lmul16_06f_ULT_done:
    bruge8 .Lmul16_06f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_UGE_done
.Lmul16_06f_UGE_true:
    mul_emit_char 'B'
.Lmul16_06f_UGE_done:
    brslt8 .Lmul16_06f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_SLT_done
.Lmul16_06f_SLT_true:
    mul_emit_char 'B'
.Lmul16_06f_SLT_done:
    brsge8 .Lmul16_06f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_06f_SGE_done
.Lmul16_06f_SGE_true:
    mul_emit_char 'B'
.Lmul16_06f_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r0, pattern 0; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    ldi16 r4, 0x0002
    push16 r4
    pop16 r0
    ldi16 r4, 0x72d1
    push16 r4
    pop16 r1
    mul16 r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_070_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_EQ_done
.Lmul16_070_EQ_true:
    mul_emit_char 'B'
.Lmul16_070_EQ_done:
    brne8 .Lmul16_070_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_NE_done
.Lmul16_070_NE_true:
    mul_emit_char 'B'
.Lmul16_070_NE_done:
    brult8 .Lmul16_070_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_ULT_done
.Lmul16_070_ULT_true:
    mul_emit_char 'B'
.Lmul16_070_ULT_done:
    bruge8 .Lmul16_070_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_UGE_done
.Lmul16_070_UGE_true:
    mul_emit_char 'B'
.Lmul16_070_UGE_done:
    brslt8 .Lmul16_070_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_SLT_done
.Lmul16_070_SLT_true:
    mul_emit_char 'B'
.Lmul16_070_SLT_done:
    brsge8 .Lmul16_070_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_070_SGE_done
.Lmul16_070_SGE_true:
    mul_emit_char 'B'
.Lmul16_070_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r0, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r7
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r0
    ldi16 r4, 0x732c
    push16 r4
    pop16 r1
    mul16 r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_071_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_EQ_done
.Lmul16_071_EQ_true:
    mul_emit_char 'B'
.Lmul16_071_EQ_done:
    brne8 .Lmul16_071_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_NE_done
.Lmul16_071_NE_true:
    mul_emit_char 'B'
.Lmul16_071_NE_done:
    brult8 .Lmul16_071_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_ULT_done
.Lmul16_071_ULT_true:
    mul_emit_char 'B'
.Lmul16_071_ULT_done:
    bruge8 .Lmul16_071_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_UGE_done
.Lmul16_071_UGE_true:
    mul_emit_char 'B'
.Lmul16_071_UGE_done:
    brslt8 .Lmul16_071_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_SLT_done
.Lmul16_071_SLT_true:
    mul_emit_char 'B'
.Lmul16_071_SLT_done:
    brsge8 .Lmul16_071_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_071_SGE_done
.Lmul16_071_SGE_true:
    mul_emit_char 'B'
.Lmul16_071_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r1, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x7589
    push16 r4
    pop16 r3
    mul16 r7, r1
    push16 r3
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_072_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_EQ_done
.Lmul16_072_EQ_true:
    mul_emit_char 'B'
.Lmul16_072_EQ_done:
    brne8 .Lmul16_072_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_NE_done
.Lmul16_072_NE_true:
    mul_emit_char 'B'
.Lmul16_072_NE_done:
    brult8 .Lmul16_072_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_ULT_done
.Lmul16_072_ULT_true:
    mul_emit_char 'B'
.Lmul16_072_ULT_done:
    bruge8 .Lmul16_072_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_UGE_done
.Lmul16_072_UGE_true:
    mul_emit_char 'B'
.Lmul16_072_UGE_done:
    brslt8 .Lmul16_072_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_SLT_done
.Lmul16_072_SLT_true:
    mul_emit_char 'B'
.Lmul16_072_SLT_done:
    brsge8 .Lmul16_072_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_072_SGE_done
.Lmul16_072_SGE_true:
    mul_emit_char 'B'
.Lmul16_072_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r1, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r7
    ldi16 r5, 0x0101
    push16 r5
    pop16 r1
    ldi16 r5, 0x76e5
    push16 r5
    pop16 r4
    mul16 r7, r1
    push16 r4
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_073_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_EQ_done
.Lmul16_073_EQ_true:
    mul_emit_char 'B'
.Lmul16_073_EQ_done:
    brne8 .Lmul16_073_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_NE_done
.Lmul16_073_NE_true:
    mul_emit_char 'B'
.Lmul16_073_NE_done:
    brult8 .Lmul16_073_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_ULT_done
.Lmul16_073_ULT_true:
    mul_emit_char 'B'
.Lmul16_073_ULT_done:
    bruge8 .Lmul16_073_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_UGE_done
.Lmul16_073_UGE_true:
    mul_emit_char 'B'
.Lmul16_073_UGE_done:
    brslt8 .Lmul16_073_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_SLT_done
.Lmul16_073_SLT_true:
    mul_emit_char 'B'
.Lmul16_073_SLT_done:
    brsge8 .Lmul16_073_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_073_SGE_done
.Lmul16_073_SGE_true:
    mul_emit_char 'B'
.Lmul16_073_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r2, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r2
    ldi16 r4, 0x7942
    push16 r4
    pop16 r6
    mul16 r7, r2
    push16 r6
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_074_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_EQ_done
.Lmul16_074_EQ_true:
    mul_emit_char 'B'
.Lmul16_074_EQ_done:
    brne8 .Lmul16_074_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_NE_done
.Lmul16_074_NE_true:
    mul_emit_char 'B'
.Lmul16_074_NE_done:
    brult8 .Lmul16_074_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_ULT_done
.Lmul16_074_ULT_true:
    mul_emit_char 'B'
.Lmul16_074_ULT_done:
    bruge8 .Lmul16_074_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_UGE_done
.Lmul16_074_UGE_true:
    mul_emit_char 'B'
.Lmul16_074_UGE_done:
    brslt8 .Lmul16_074_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_SLT_done
.Lmul16_074_SLT_true:
    mul_emit_char 'B'
.Lmul16_074_SLT_done:
    brsge8 .Lmul16_074_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_074_SGE_done
.Lmul16_074_SGE_true:
    mul_emit_char 'B'
.Lmul16_074_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r2, pattern 1; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    ldi16 r4, 0x0002
    push16 r4
    pop16 r2
    ldi16 r4, 0x7397
    push16 r4
    pop16 r0
    mul16 r7, r2
    push16 r0
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_075_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_EQ_done
.Lmul16_075_EQ_true:
    mul_emit_char 'B'
.Lmul16_075_EQ_done:
    brne8 .Lmul16_075_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_NE_done
.Lmul16_075_NE_true:
    mul_emit_char 'B'
.Lmul16_075_NE_done:
    brult8 .Lmul16_075_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_ULT_done
.Lmul16_075_ULT_true:
    mul_emit_char 'B'
.Lmul16_075_ULT_done:
    bruge8 .Lmul16_075_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_UGE_done
.Lmul16_075_UGE_true:
    mul_emit_char 'B'
.Lmul16_075_UGE_done:
    brslt8 .Lmul16_075_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_SLT_done
.Lmul16_075_SLT_true:
    mul_emit_char 'B'
.Lmul16_075_SLT_done:
    brsge8 .Lmul16_075_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_075_SGE_done
.Lmul16_075_SGE_true:
    mul_emit_char 'B'
.Lmul16_075_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r3, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x74f3
    push16 r4
    pop16 r1
    mul16 r7, r3
    push16 r1
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_076_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_EQ_done
.Lmul16_076_EQ_true:
    mul_emit_char 'B'
.Lmul16_076_EQ_done:
    brne8 .Lmul16_076_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_NE_done
.Lmul16_076_NE_true:
    mul_emit_char 'B'
.Lmul16_076_NE_done:
    brult8 .Lmul16_076_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_ULT_done
.Lmul16_076_ULT_true:
    mul_emit_char 'B'
.Lmul16_076_ULT_done:
    bruge8 .Lmul16_076_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_UGE_done
.Lmul16_076_UGE_true:
    mul_emit_char 'B'
.Lmul16_076_UGE_done:
    brslt8 .Lmul16_076_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_SLT_done
.Lmul16_076_SLT_true:
    mul_emit_char 'B'
.Lmul16_076_SLT_done:
    brsge8 .Lmul16_076_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_076_SGE_done
.Lmul16_076_SGE_true:
    mul_emit_char 'B'
.Lmul16_076_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r3, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0x764f
    push16 r4
    pop16 r2
    mul16 r7, r3
    push16 r2
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_077_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_EQ_done
.Lmul16_077_EQ_true:
    mul_emit_char 'B'
.Lmul16_077_EQ_done:
    brne8 .Lmul16_077_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_NE_done
.Lmul16_077_NE_true:
    mul_emit_char 'B'
.Lmul16_077_NE_done:
    brult8 .Lmul16_077_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_ULT_done
.Lmul16_077_ULT_true:
    mul_emit_char 'B'
.Lmul16_077_ULT_done:
    bruge8 .Lmul16_077_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_UGE_done
.Lmul16_077_UGE_true:
    mul_emit_char 'B'
.Lmul16_077_UGE_done:
    brslt8 .Lmul16_077_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_SLT_done
.Lmul16_077_SLT_true:
    mul_emit_char 'B'
.Lmul16_077_SLT_done:
    brsge8 .Lmul16_077_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_077_SGE_done
.Lmul16_077_SGE_true:
    mul_emit_char 'B'
.Lmul16_077_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 0; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x0001
    push16 r6
    pop16 r7
    ldi16 r6, 0xffff
    push16 r6
    pop16 r4
    ldi16 r6, 0x79ad
    push16 r6
    pop16 r5
    mul16 r7, r4
    push16 r5
    push16 r4
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_078_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_EQ_done
.Lmul16_078_EQ_true:
    mul_emit_char 'B'
.Lmul16_078_EQ_done:
    brne8 .Lmul16_078_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_NE_done
.Lmul16_078_NE_true:
    mul_emit_char 'B'
.Lmul16_078_NE_done:
    brult8 .Lmul16_078_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_ULT_done
.Lmul16_078_ULT_true:
    mul_emit_char 'B'
.Lmul16_078_ULT_done:
    bruge8 .Lmul16_078_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_UGE_done
.Lmul16_078_UGE_true:
    mul_emit_char 'B'
.Lmul16_078_UGE_done:
    brslt8 .Lmul16_078_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_SLT_done
.Lmul16_078_SLT_true:
    mul_emit_char 'B'
.Lmul16_078_SLT_done:
    brsge8 .Lmul16_078_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_078_SGE_done
.Lmul16_078_SGE_true:
    mul_emit_char 'B'
.Lmul16_078_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r4, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x0100
    push16 r6
    pop16 r7
    ldi16 r6, 0x0100
    push16 r6
    pop16 r4
    ldi16 r6, 0x7a08
    push16 r6
    pop16 r5
    mul16 r7, r4
    push16 r5
    push16 r4
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_079_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_EQ_done
.Lmul16_079_EQ_true:
    mul_emit_char 'B'
.Lmul16_079_EQ_done:
    brne8 .Lmul16_079_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_NE_done
.Lmul16_079_NE_true:
    mul_emit_char 'B'
.Lmul16_079_NE_done:
    brult8 .Lmul16_079_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_ULT_done
.Lmul16_079_ULT_true:
    mul_emit_char 'B'
.Lmul16_079_ULT_done:
    bruge8 .Lmul16_079_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_UGE_done
.Lmul16_079_UGE_true:
    mul_emit_char 'B'
.Lmul16_079_UGE_done:
    brslt8 .Lmul16_079_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_SLT_done
.Lmul16_079_SLT_true:
    mul_emit_char 'B'
.Lmul16_079_SLT_done:
    brsge8 .Lmul16_079_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_079_SGE_done
.Lmul16_079_SGE_true:
    mul_emit_char 'B'
.Lmul16_079_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 0; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    ldi16 r4, 0x0002
    push16 r4
    pop16 r5
    ldi16 r4, 0x755e
    push16 r4
    pop16 r0
    mul16 r7, r5
    push16 r0
    push16 r5
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07a_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_EQ_done
.Lmul16_07a_EQ_true:
    mul_emit_char 'B'
.Lmul16_07a_EQ_done:
    brne8 .Lmul16_07a_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_NE_done
.Lmul16_07a_NE_true:
    mul_emit_char 'B'
.Lmul16_07a_NE_done:
    brult8 .Lmul16_07a_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_ULT_done
.Lmul16_07a_ULT_true:
    mul_emit_char 'B'
.Lmul16_07a_ULT_done:
    bruge8 .Lmul16_07a_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_UGE_done
.Lmul16_07a_UGE_true:
    mul_emit_char 'B'
.Lmul16_07a_UGE_done:
    brslt8 .Lmul16_07a_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_SLT_done
.Lmul16_07a_SLT_true:
    mul_emit_char 'B'
.Lmul16_07a_SLT_done:
    brsge8 .Lmul16_07a_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07a_SGE_done
.Lmul16_07a_SGE_true:
    mul_emit_char 'B'
.Lmul16_07a_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r5, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x75b9
    push16 r4
    pop16 r0
    mul16 r7, r5
    push16 r0
    push16 r5
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07b_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_EQ_done
.Lmul16_07b_EQ_true:
    mul_emit_char 'B'
.Lmul16_07b_EQ_done:
    brne8 .Lmul16_07b_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_NE_done
.Lmul16_07b_NE_true:
    mul_emit_char 'B'
.Lmul16_07b_NE_done:
    brult8 .Lmul16_07b_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_ULT_done
.Lmul16_07b_ULT_true:
    mul_emit_char 'B'
.Lmul16_07b_ULT_done:
    bruge8 .Lmul16_07b_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_UGE_done
.Lmul16_07b_UGE_true:
    mul_emit_char 'B'
.Lmul16_07b_UGE_done:
    brslt8 .Lmul16_07b_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_SLT_done
.Lmul16_07b_SLT_true:
    mul_emit_char 'B'
.Lmul16_07b_SLT_done:
    brsge8 .Lmul16_07b_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07b_SGE_done
.Lmul16_07b_SGE_true:
    mul_emit_char 'B'
.Lmul16_07b_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r7
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r6
    ldi16 r4, 0x7816
    push16 r4
    pop16 r2
    mul16 r7, r6
    push16 r2
    push16 r6
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07c_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_EQ_done
.Lmul16_07c_EQ_true:
    mul_emit_char 'B'
.Lmul16_07c_EQ_done:
    brne8 .Lmul16_07c_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_NE_done
.Lmul16_07c_NE_true:
    mul_emit_char 'B'
.Lmul16_07c_NE_done:
    brult8 .Lmul16_07c_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_ULT_done
.Lmul16_07c_ULT_true:
    mul_emit_char 'B'
.Lmul16_07c_ULT_done:
    bruge8 .Lmul16_07c_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_UGE_done
.Lmul16_07c_UGE_true:
    mul_emit_char 'B'
.Lmul16_07c_UGE_done:
    brslt8 .Lmul16_07c_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_SLT_done
.Lmul16_07c_SLT_true:
    mul_emit_char 'B'
.Lmul16_07c_SLT_done:
    brsge8 .Lmul16_07c_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07c_SGE_done
.Lmul16_07c_SGE_true:
    mul_emit_char 'B'
.Lmul16_07c_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r6, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x7972
    push16 r4
    pop16 r3
    mul16 r7, r6
    push16 r3
    push16 r6
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07d_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_EQ_done
.Lmul16_07d_EQ_true:
    mul_emit_char 'B'
.Lmul16_07d_EQ_done:
    brne8 .Lmul16_07d_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_NE_done
.Lmul16_07d_NE_true:
    mul_emit_char 'B'
.Lmul16_07d_NE_done:
    brult8 .Lmul16_07d_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_ULT_done
.Lmul16_07d_ULT_true:
    mul_emit_char 'B'
.Lmul16_07d_ULT_done:
    bruge8 .Lmul16_07d_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_UGE_done
.Lmul16_07d_UGE_true:
    mul_emit_char 'B'
.Lmul16_07d_UGE_done:
    brslt8 .Lmul16_07d_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_SLT_done
.Lmul16_07d_SLT_true:
    mul_emit_char 'B'
.Lmul16_07d_SLT_done:
    brsge8 .Lmul16_07d_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07d_SGE_done
.Lmul16_07d_SGE_true:
    mul_emit_char 'B'
.Lmul16_07d_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r7
    ldi16 r4, 0x7bcf
    push16 r4
    pop16 r5
    mul16 r7, r7
    push16 r5
    push16 r7
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07e_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_EQ_done
.Lmul16_07e_EQ_true:
    mul_emit_char 'B'
.Lmul16_07e_EQ_done:
    brne8 .Lmul16_07e_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_NE_done
.Lmul16_07e_NE_true:
    mul_emit_char 'B'
.Lmul16_07e_NE_done:
    brult8 .Lmul16_07e_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_ULT_done
.Lmul16_07e_ULT_true:
    mul_emit_char 'B'
.Lmul16_07e_ULT_done:
    bruge8 .Lmul16_07e_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_UGE_done
.Lmul16_07e_UGE_true:
    mul_emit_char 'B'
.Lmul16_07e_UGE_done:
    brslt8 .Lmul16_07e_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_SLT_done
.Lmul16_07e_SLT_true:
    mul_emit_char 'B'
.Lmul16_07e_SLT_done:
    brsge8 .Lmul16_07e_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07e_SGE_done
.Lmul16_07e_SGE_true:
    mul_emit_char 'B'
.Lmul16_07e_SGE_done:
    mul_emit_char '\n'

    ; d=r7, s=r7, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    ldi16 r4, 0x7d2b
    push16 r4
    pop16 r6
    mul16 r7, r7
    push16 r6
    push16 r7
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    mul_print_r0_r2
    breq8 .Lmul16_07f_EQ_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_EQ_done
.Lmul16_07f_EQ_true:
    mul_emit_char 'B'
.Lmul16_07f_EQ_done:
    brne8 .Lmul16_07f_NE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_NE_done
.Lmul16_07f_NE_true:
    mul_emit_char 'B'
.Lmul16_07f_NE_done:
    brult8 .Lmul16_07f_ULT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_ULT_done
.Lmul16_07f_ULT_true:
    mul_emit_char 'B'
.Lmul16_07f_ULT_done:
    bruge8 .Lmul16_07f_UGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_UGE_done
.Lmul16_07f_UGE_true:
    mul_emit_char 'B'
.Lmul16_07f_UGE_done:
    brslt8 .Lmul16_07f_SLT_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_SLT_done
.Lmul16_07f_SLT_true:
    mul_emit_char 'B'
.Lmul16_07f_SLT_done:
    brsge8 .Lmul16_07f_SGE_true
    mul_emit_char 'A'
    jmp8 .Lmul16_07f_SGE_done
.Lmul16_07f_SGE_true:
    mul_emit_char 'B'
.Lmul16_07f_SGE_done:
    mul_emit_char '\n'

    sys debug_break
