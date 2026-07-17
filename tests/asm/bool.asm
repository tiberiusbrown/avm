.include "include/f7_32bit_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; rD=r0, pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x3d01
    push16 r4
    ldi16 r4, 0x7432
    push16 r4
    ldi16 r4, 0x7543
    push16 r4
    ldi16 r4, 0x7654
    push16 r4
    ldi16 r4, 0x7765
    push16 r4
    ldi16 r4, 0x7876
    push16 r4
    ldi16 r4, 0x7987
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_000_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_EQ_done
.Lbool_000_EQ_true:
    f7_emit_char 'B'
.Lbool_000_EQ_done:
    brne8 .Lbool_000_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_NE_done
.Lbool_000_NE_true:
    f7_emit_char 'B'
.Lbool_000_NE_done:
    brult8 .Lbool_000_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_ULT_done
.Lbool_000_ULT_true:
    f7_emit_char 'B'
.Lbool_000_ULT_done:
    bruge8 .Lbool_000_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_UGE_done
.Lbool_000_UGE_true:
    f7_emit_char 'B'
.Lbool_000_UGE_done:
    brslt8 .Lbool_000_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_SLT_done
.Lbool_000_SLT_true:
    f7_emit_char 'B'
.Lbool_000_SLT_done:
    brsge8 .Lbool_000_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_000_SGE_done
.Lbool_000_SGE_true:
    f7_emit_char 'B'
.Lbool_000_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x7352
    push16 r4
    ldi16 r4, 0x3e49
    push16 r4
    ldi16 r4, 0x7574
    push16 r4
    ldi16 r4, 0x7685
    push16 r4
    ldi16 r4, 0x7796
    push16 r4
    ldi16 r4, 0x78a7
    push16 r4
    ldi16 r4, 0x79b8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r2
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_001_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_EQ_done
.Lbool_001_EQ_true:
    f7_emit_char 'B'
.Lbool_001_EQ_done:
    brne8 .Lbool_001_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_NE_done
.Lbool_001_NE_true:
    f7_emit_char 'B'
.Lbool_001_NE_done:
    brult8 .Lbool_001_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_ULT_done
.Lbool_001_ULT_true:
    f7_emit_char 'B'
.Lbool_001_ULT_done:
    bruge8 .Lbool_001_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_UGE_done
.Lbool_001_UGE_true:
    f7_emit_char 'B'
.Lbool_001_UGE_done:
    brslt8 .Lbool_001_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_SLT_done
.Lbool_001_SLT_true:
    f7_emit_char 'B'
.Lbool_001_SLT_done:
    brsge8 .Lbool_001_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_001_SGE_done
.Lbool_001_SGE_true:
    f7_emit_char 'B'
.Lbool_001_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 2; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x7383
    push16 r4
    ldi16 r4, 0x7494
    push16 r4
    ldi16 r4, 0x3f91
    push16 r4
    ldi16 r4, 0x76b6
    push16 r4
    ldi16 r4, 0x77c7
    push16 r4
    ldi16 r4, 0x78d8
    push16 r4
    ldi16 r4, 0x79e9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r3
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_002_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_EQ_done
.Lbool_002_EQ_true:
    f7_emit_char 'B'
.Lbool_002_EQ_done:
    brne8 .Lbool_002_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_NE_done
.Lbool_002_NE_true:
    f7_emit_char 'B'
.Lbool_002_NE_done:
    brult8 .Lbool_002_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_ULT_done
.Lbool_002_ULT_true:
    f7_emit_char 'B'
.Lbool_002_ULT_done:
    bruge8 .Lbool_002_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_UGE_done
.Lbool_002_UGE_true:
    f7_emit_char 'B'
.Lbool_002_UGE_done:
    brslt8 .Lbool_002_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_SLT_done
.Lbool_002_SLT_true:
    f7_emit_char 'B'
.Lbool_002_SLT_done:
    brsge8 .Lbool_002_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_002_SGE_done
.Lbool_002_SGE_true:
    f7_emit_char 'B'
.Lbool_002_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x73b4
    push16 r4
    ldi16 r4, 0x74c5
    push16 r4
    ldi16 r4, 0x75d6
    push16 r4
    ldi16 r4, 0x40d9
    push16 r4
    ldi16 r4, 0x77f8
    push16 r4
    ldi16 r4, 0x7909
    push16 r4
    ldi16 r4, 0x7a1a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r4
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_003_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_EQ_done
.Lbool_003_EQ_true:
    f7_emit_char 'B'
.Lbool_003_EQ_done:
    brne8 .Lbool_003_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_NE_done
.Lbool_003_NE_true:
    f7_emit_char 'B'
.Lbool_003_NE_done:
    brult8 .Lbool_003_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_ULT_done
.Lbool_003_ULT_true:
    f7_emit_char 'B'
.Lbool_003_ULT_done:
    bruge8 .Lbool_003_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_UGE_done
.Lbool_003_UGE_true:
    f7_emit_char 'B'
.Lbool_003_UGE_done:
    brslt8 .Lbool_003_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_SLT_done
.Lbool_003_SLT_true:
    f7_emit_char 'B'
.Lbool_003_SLT_done:
    brsge8 .Lbool_003_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_003_SGE_done
.Lbool_003_SGE_true:
    f7_emit_char 'B'
.Lbool_003_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 4; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x73e5
    push16 r4
    ldi16 r4, 0x74f6
    push16 r4
    ldi16 r4, 0x7607
    push16 r4
    ldi16 r4, 0x7718
    push16 r4
    ldi16 r4, 0x4221
    push16 r4
    ldi16 r4, 0x793a
    push16 r4
    ldi16 r4, 0x7a4b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r5
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_004_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_EQ_done
.Lbool_004_EQ_true:
    f7_emit_char 'B'
.Lbool_004_EQ_done:
    brne8 .Lbool_004_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_NE_done
.Lbool_004_NE_true:
    f7_emit_char 'B'
.Lbool_004_NE_done:
    brult8 .Lbool_004_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_ULT_done
.Lbool_004_ULT_true:
    f7_emit_char 'B'
.Lbool_004_ULT_done:
    bruge8 .Lbool_004_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_UGE_done
.Lbool_004_UGE_true:
    f7_emit_char 'B'
.Lbool_004_UGE_done:
    brslt8 .Lbool_004_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_SLT_done
.Lbool_004_SLT_true:
    f7_emit_char 'B'
.Lbool_004_SLT_done:
    brsge8 .Lbool_004_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_004_SGE_done
.Lbool_004_SGE_true:
    f7_emit_char 'B'
.Lbool_004_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 5; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7416
    push16 r4
    ldi16 r4, 0x7527
    push16 r4
    ldi16 r4, 0x7638
    push16 r4
    ldi16 r4, 0x7749
    push16 r4
    ldi16 r4, 0x785a
    push16 r4
    ldi16 r4, 0x4369
    push16 r4
    ldi16 r4, 0x7a7c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r6
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_005_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_EQ_done
.Lbool_005_EQ_true:
    f7_emit_char 'B'
.Lbool_005_EQ_done:
    brne8 .Lbool_005_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_NE_done
.Lbool_005_NE_true:
    f7_emit_char 'B'
.Lbool_005_NE_done:
    brult8 .Lbool_005_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_ULT_done
.Lbool_005_ULT_true:
    f7_emit_char 'B'
.Lbool_005_ULT_done:
    bruge8 .Lbool_005_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_UGE_done
.Lbool_005_UGE_true:
    f7_emit_char 'B'
.Lbool_005_UGE_done:
    brslt8 .Lbool_005_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_SLT_done
.Lbool_005_SLT_true:
    f7_emit_char 'B'
.Lbool_005_SLT_done:
    brsge8 .Lbool_005_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_005_SGE_done
.Lbool_005_SGE_true:
    f7_emit_char 'B'
.Lbool_005_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 6; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7447
    push16 r4
    ldi16 r4, 0x7558
    push16 r4
    ldi16 r4, 0x7669
    push16 r4
    ldi16 r4, 0x777a
    push16 r4
    ldi16 r4, 0x788b
    push16 r4
    ldi16 r4, 0x799c
    push16 r4
    ldi16 r4, 0x44b1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r7
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_006_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_EQ_done
.Lbool_006_EQ_true:
    f7_emit_char 'B'
.Lbool_006_EQ_done:
    brne8 .Lbool_006_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_NE_done
.Lbool_006_NE_true:
    f7_emit_char 'B'
.Lbool_006_NE_done:
    brult8 .Lbool_006_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_ULT_done
.Lbool_006_ULT_true:
    f7_emit_char 'B'
.Lbool_006_ULT_done:
    bruge8 .Lbool_006_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_UGE_done
.Lbool_006_UGE_true:
    f7_emit_char 'B'
.Lbool_006_UGE_done:
    brslt8 .Lbool_006_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_SLT_done
.Lbool_006_SLT_true:
    f7_emit_char 'B'
.Lbool_006_SLT_done:
    brsge8 .Lbool_006_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_006_SGE_done
.Lbool_006_SGE_true:
    f7_emit_char 'B'
.Lbool_006_SGE_done:
    f7_emit_char '\n'

    ; rD=r0, pattern 7; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x3ef2
    push16 r4
    ldi16 r4, 0x7589
    push16 r4
    ldi16 r4, 0x769a
    push16 r4
    ldi16 r4, 0x77ab
    push16 r4
    ldi16 r4, 0x78bc
    push16 r4
    ldi16 r4, 0x79cd
    push16 r4
    ldi16 r4, 0x7ade
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r0
    push16 r1
    push16 r0
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_007_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_EQ_done
.Lbool_007_EQ_true:
    f7_emit_char 'B'
.Lbool_007_EQ_done:
    brne8 .Lbool_007_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_NE_done
.Lbool_007_NE_true:
    f7_emit_char 'B'
.Lbool_007_NE_done:
    brult8 .Lbool_007_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_ULT_done
.Lbool_007_ULT_true:
    f7_emit_char 'B'
.Lbool_007_ULT_done:
    bruge8 .Lbool_007_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_UGE_done
.Lbool_007_UGE_true:
    f7_emit_char 'B'
.Lbool_007_UGE_done:
    brslt8 .Lbool_007_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_SLT_done
.Lbool_007_SLT_true:
    f7_emit_char 'B'
.Lbool_007_SLT_done:
    brsge8 .Lbool_007_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_007_SGE_done
.Lbool_007_SGE_true:
    f7_emit_char 'B'
.Lbool_007_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7398
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x403a
    push16 r4
    ldi16 r4, 0x76cb
    push16 r4
    ldi16 r4, 0x77dc
    push16 r4
    ldi16 r4, 0x78ed
    push16 r4
    ldi16 r4, 0x79fe
    push16 r4
    ldi16 r4, 0x7b0f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r2
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_008_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_EQ_done
.Lbool_008_EQ_true:
    f7_emit_char 'B'
.Lbool_008_EQ_done:
    brne8 .Lbool_008_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_NE_done
.Lbool_008_NE_true:
    f7_emit_char 'B'
.Lbool_008_NE_done:
    brult8 .Lbool_008_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_ULT_done
.Lbool_008_ULT_true:
    f7_emit_char 'B'
.Lbool_008_ULT_done:
    bruge8 .Lbool_008_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_UGE_done
.Lbool_008_UGE_true:
    f7_emit_char 'B'
.Lbool_008_UGE_done:
    brslt8 .Lbool_008_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_SLT_done
.Lbool_008_SLT_true:
    f7_emit_char 'B'
.Lbool_008_SLT_done:
    brsge8 .Lbool_008_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_008_SGE_done
.Lbool_008_SGE_true:
    f7_emit_char 'B'
.Lbool_008_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x73c9
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x75eb
    push16 r4
    ldi16 r4, 0x4182
    push16 r4
    ldi16 r4, 0x780d
    push16 r4
    ldi16 r4, 0x791e
    push16 r4
    ldi16 r4, 0x7a2f
    push16 r4
    ldi16 r4, 0x7b40
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r3
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_009_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_EQ_done
.Lbool_009_EQ_true:
    f7_emit_char 'B'
.Lbool_009_EQ_done:
    brne8 .Lbool_009_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_NE_done
.Lbool_009_NE_true:
    f7_emit_char 'B'
.Lbool_009_NE_done:
    brult8 .Lbool_009_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_ULT_done
.Lbool_009_ULT_true:
    f7_emit_char 'B'
.Lbool_009_ULT_done:
    bruge8 .Lbool_009_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_UGE_done
.Lbool_009_UGE_true:
    f7_emit_char 'B'
.Lbool_009_UGE_done:
    brslt8 .Lbool_009_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_SLT_done
.Lbool_009_SLT_true:
    f7_emit_char 'B'
.Lbool_009_SLT_done:
    brsge8 .Lbool_009_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_009_SGE_done
.Lbool_009_SGE_true:
    f7_emit_char 'B'
.Lbool_009_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x73fa
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x761c
    push16 r4
    ldi16 r4, 0x772d
    push16 r4
    ldi16 r4, 0x42ca
    push16 r4
    ldi16 r4, 0x794f
    push16 r4
    ldi16 r4, 0x7a60
    push16 r4
    ldi16 r4, 0x7b71
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r4
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_EQ_done
.Lbool_00a_EQ_true:
    f7_emit_char 'B'
.Lbool_00a_EQ_done:
    brne8 .Lbool_00a_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_NE_done
.Lbool_00a_NE_true:
    f7_emit_char 'B'
.Lbool_00a_NE_done:
    brult8 .Lbool_00a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_ULT_done
.Lbool_00a_ULT_true:
    f7_emit_char 'B'
.Lbool_00a_ULT_done:
    bruge8 .Lbool_00a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_UGE_done
.Lbool_00a_UGE_true:
    f7_emit_char 'B'
.Lbool_00a_UGE_done:
    brslt8 .Lbool_00a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_SLT_done
.Lbool_00a_SLT_true:
    f7_emit_char 'B'
.Lbool_00a_SLT_done:
    brsge8 .Lbool_00a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00a_SGE_done
.Lbool_00a_SGE_true:
    f7_emit_char 'B'
.Lbool_00a_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x742b
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x764d
    push16 r4
    ldi16 r4, 0x775e
    push16 r4
    ldi16 r4, 0x786f
    push16 r4
    ldi16 r4, 0x4412
    push16 r4
    ldi16 r4, 0x7a91
    push16 r4
    ldi16 r4, 0x7ba2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r5
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_EQ_done
.Lbool_00b_EQ_true:
    f7_emit_char 'B'
.Lbool_00b_EQ_done:
    brne8 .Lbool_00b_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_NE_done
.Lbool_00b_NE_true:
    f7_emit_char 'B'
.Lbool_00b_NE_done:
    brult8 .Lbool_00b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_ULT_done
.Lbool_00b_ULT_true:
    f7_emit_char 'B'
.Lbool_00b_ULT_done:
    bruge8 .Lbool_00b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_UGE_done
.Lbool_00b_UGE_true:
    f7_emit_char 'B'
.Lbool_00b_UGE_done:
    brslt8 .Lbool_00b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_SLT_done
.Lbool_00b_SLT_true:
    f7_emit_char 'B'
.Lbool_00b_SLT_done:
    brsge8 .Lbool_00b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00b_SGE_done
.Lbool_00b_SGE_true:
    f7_emit_char 'B'
.Lbool_00b_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 4; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x745c
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x767e
    push16 r4
    ldi16 r4, 0x778f
    push16 r4
    ldi16 r4, 0x78a0
    push16 r4
    ldi16 r4, 0x79b1
    push16 r4
    ldi16 r4, 0x455a
    push16 r4
    ldi16 r4, 0x7bd3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r6
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_EQ_done
.Lbool_00c_EQ_true:
    f7_emit_char 'B'
.Lbool_00c_EQ_done:
    brne8 .Lbool_00c_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_NE_done
.Lbool_00c_NE_true:
    f7_emit_char 'B'
.Lbool_00c_NE_done:
    brult8 .Lbool_00c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_ULT_done
.Lbool_00c_ULT_true:
    f7_emit_char 'B'
.Lbool_00c_ULT_done:
    bruge8 .Lbool_00c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_UGE_done
.Lbool_00c_UGE_true:
    f7_emit_char 'B'
.Lbool_00c_UGE_done:
    brslt8 .Lbool_00c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_SLT_done
.Lbool_00c_SLT_true:
    f7_emit_char 'B'
.Lbool_00c_SLT_done:
    brsge8 .Lbool_00c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00c_SGE_done
.Lbool_00c_SGE_true:
    f7_emit_char 'B'
.Lbool_00c_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 5; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x748d
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x76af
    push16 r4
    ldi16 r4, 0x77c0
    push16 r4
    ldi16 r4, 0x78d1
    push16 r4
    ldi16 r4, 0x79e2
    push16 r4
    ldi16 r4, 0x7af3
    push16 r4
    ldi16 r4, 0x46a2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r7
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_EQ_done
.Lbool_00d_EQ_true:
    f7_emit_char 'B'
.Lbool_00d_EQ_done:
    brne8 .Lbool_00d_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_NE_done
.Lbool_00d_NE_true:
    f7_emit_char 'B'
.Lbool_00d_NE_done:
    brult8 .Lbool_00d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_ULT_done
.Lbool_00d_ULT_true:
    f7_emit_char 'B'
.Lbool_00d_ULT_done:
    bruge8 .Lbool_00d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_UGE_done
.Lbool_00d_UGE_true:
    f7_emit_char 'B'
.Lbool_00d_UGE_done:
    brslt8 .Lbool_00d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_SLT_done
.Lbool_00d_SLT_true:
    f7_emit_char 'B'
.Lbool_00d_SLT_done:
    brsge8 .Lbool_00d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00d_SGE_done
.Lbool_00d_SGE_true:
    f7_emit_char 'B'
.Lbool_00d_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 6; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3fe2
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x76e0
    push16 r4
    ldi16 r4, 0x77f1
    push16 r4
    ldi16 r4, 0x7902
    push16 r4
    ldi16 r4, 0x7a13
    push16 r4
    ldi16 r4, 0x7b24
    push16 r4
    ldi16 r4, 0x7c35
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r0
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_EQ_done
.Lbool_00e_EQ_true:
    f7_emit_char 'B'
.Lbool_00e_EQ_done:
    brne8 .Lbool_00e_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_NE_done
.Lbool_00e_NE_true:
    f7_emit_char 'B'
.Lbool_00e_NE_done:
    brult8 .Lbool_00e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_ULT_done
.Lbool_00e_ULT_true:
    f7_emit_char 'B'
.Lbool_00e_ULT_done:
    bruge8 .Lbool_00e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_UGE_done
.Lbool_00e_UGE_true:
    f7_emit_char 'B'
.Lbool_00e_UGE_done:
    brslt8 .Lbool_00e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_SLT_done
.Lbool_00e_SLT_true:
    f7_emit_char 'B'
.Lbool_00e_SLT_done:
    brsge8 .Lbool_00e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00e_SGE_done
.Lbool_00e_SGE_true:
    f7_emit_char 'B'
.Lbool_00e_SGE_done:
    f7_emit_char '\n'

    ; rD=r1, pattern 7; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x74ef
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x422b
    push16 r4
    ldi16 r4, 0x7822
    push16 r4
    ldi16 r4, 0x7933
    push16 r4
    ldi16 r4, 0x7a44
    push16 r4
    ldi16 r4, 0x7b55
    push16 r4
    ldi16 r4, 0x7c66
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r1
    push16 r2
    push16 r1
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_00f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_EQ_done
.Lbool_00f_EQ_true:
    f7_emit_char 'B'
.Lbool_00f_EQ_done:
    brne8 .Lbool_00f_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_NE_done
.Lbool_00f_NE_true:
    f7_emit_char 'B'
.Lbool_00f_NE_done:
    brult8 .Lbool_00f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_ULT_done
.Lbool_00f_ULT_true:
    f7_emit_char 'B'
.Lbool_00f_ULT_done:
    bruge8 .Lbool_00f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_UGE_done
.Lbool_00f_UGE_true:
    f7_emit_char 'B'
.Lbool_00f_UGE_done:
    brslt8 .Lbool_00f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_SLT_done
.Lbool_00f_SLT_true:
    f7_emit_char 'B'
.Lbool_00f_SLT_done:
    brsge8 .Lbool_00f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_00f_SGE_done
.Lbool_00f_SGE_true:
    f7_emit_char 'B'
.Lbool_00f_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7520
    push16 r4
    ldi16 r4, 0x7631
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x4373
    push16 r4
    ldi16 r4, 0x7964
    push16 r4
    ldi16 r4, 0x7a75
    push16 r4
    ldi16 r4, 0x7b86
    push16 r4
    ldi16 r4, 0x7c97
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_010_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_EQ_done
.Lbool_010_EQ_true:
    f7_emit_char 'B'
.Lbool_010_EQ_done:
    brne8 .Lbool_010_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_NE_done
.Lbool_010_NE_true:
    f7_emit_char 'B'
.Lbool_010_NE_done:
    brult8 .Lbool_010_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_ULT_done
.Lbool_010_ULT_true:
    f7_emit_char 'B'
.Lbool_010_ULT_done:
    bruge8 .Lbool_010_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_UGE_done
.Lbool_010_UGE_true:
    f7_emit_char 'B'
.Lbool_010_UGE_done:
    brslt8 .Lbool_010_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_SLT_done
.Lbool_010_SLT_true:
    f7_emit_char 'B'
.Lbool_010_SLT_done:
    brsge8 .Lbool_010_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_010_SGE_done
.Lbool_010_SGE_true:
    f7_emit_char 'B'
.Lbool_010_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7551
    push16 r4
    ldi16 r4, 0x7662
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x7884
    push16 r4
    ldi16 r4, 0x44bb
    push16 r4
    ldi16 r4, 0x7aa6
    push16 r4
    ldi16 r4, 0x7bb7
    push16 r4
    ldi16 r4, 0x7cc8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r4
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_011_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_EQ_done
.Lbool_011_EQ_true:
    f7_emit_char 'B'
.Lbool_011_EQ_done:
    brne8 .Lbool_011_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_NE_done
.Lbool_011_NE_true:
    f7_emit_char 'B'
.Lbool_011_NE_done:
    brult8 .Lbool_011_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_ULT_done
.Lbool_011_ULT_true:
    f7_emit_char 'B'
.Lbool_011_ULT_done:
    bruge8 .Lbool_011_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_UGE_done
.Lbool_011_UGE_true:
    f7_emit_char 'B'
.Lbool_011_UGE_done:
    brslt8 .Lbool_011_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_SLT_done
.Lbool_011_SLT_true:
    f7_emit_char 'B'
.Lbool_011_SLT_done:
    brsge8 .Lbool_011_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_011_SGE_done
.Lbool_011_SGE_true:
    f7_emit_char 'B'
.Lbool_011_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 2; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7582
    push16 r4
    ldi16 r4, 0x7693
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x78b5
    push16 r4
    ldi16 r4, 0x79c6
    push16 r4
    ldi16 r4, 0x4603
    push16 r4
    ldi16 r4, 0x7be8
    push16 r4
    ldi16 r4, 0x7cf9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r5
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_012_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_EQ_done
.Lbool_012_EQ_true:
    f7_emit_char 'B'
.Lbool_012_EQ_done:
    brne8 .Lbool_012_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_NE_done
.Lbool_012_NE_true:
    f7_emit_char 'B'
.Lbool_012_NE_done:
    brult8 .Lbool_012_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_ULT_done
.Lbool_012_ULT_true:
    f7_emit_char 'B'
.Lbool_012_ULT_done:
    bruge8 .Lbool_012_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_UGE_done
.Lbool_012_UGE_true:
    f7_emit_char 'B'
.Lbool_012_UGE_done:
    brslt8 .Lbool_012_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_SLT_done
.Lbool_012_SLT_true:
    f7_emit_char 'B'
.Lbool_012_SLT_done:
    brsge8 .Lbool_012_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_012_SGE_done
.Lbool_012_SGE_true:
    f7_emit_char 'B'
.Lbool_012_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x75b3
    push16 r4
    ldi16 r4, 0x76c4
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x78e6
    push16 r4
    ldi16 r4, 0x79f7
    push16 r4
    ldi16 r4, 0x7b08
    push16 r4
    ldi16 r4, 0x474b
    push16 r4
    ldi16 r4, 0x7d2a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r6
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_013_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_EQ_done
.Lbool_013_EQ_true:
    f7_emit_char 'B'
.Lbool_013_EQ_done:
    brne8 .Lbool_013_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_NE_done
.Lbool_013_NE_true:
    f7_emit_char 'B'
.Lbool_013_NE_done:
    brult8 .Lbool_013_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_ULT_done
.Lbool_013_ULT_true:
    f7_emit_char 'B'
.Lbool_013_ULT_done:
    bruge8 .Lbool_013_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_UGE_done
.Lbool_013_UGE_true:
    f7_emit_char 'B'
.Lbool_013_UGE_done:
    brslt8 .Lbool_013_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_SLT_done
.Lbool_013_SLT_true:
    f7_emit_char 'B'
.Lbool_013_SLT_done:
    brsge8 .Lbool_013_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_013_SGE_done
.Lbool_013_SGE_true:
    f7_emit_char 'B'
.Lbool_013_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 4; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x75e4
    push16 r4
    ldi16 r4, 0x76f5
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x7917
    push16 r4
    ldi16 r4, 0x7a28
    push16 r4
    ldi16 r4, 0x7b39
    push16 r4
    ldi16 r4, 0x7c4a
    push16 r4
    ldi16 r4, 0x4893
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r7
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_014_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_EQ_done
.Lbool_014_EQ_true:
    f7_emit_char 'B'
.Lbool_014_EQ_done:
    brne8 .Lbool_014_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_NE_done
.Lbool_014_NE_true:
    f7_emit_char 'B'
.Lbool_014_NE_done:
    brult8 .Lbool_014_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_ULT_done
.Lbool_014_ULT_true:
    f7_emit_char 'B'
.Lbool_014_ULT_done:
    bruge8 .Lbool_014_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_UGE_done
.Lbool_014_UGE_true:
    f7_emit_char 'B'
.Lbool_014_UGE_done:
    brslt8 .Lbool_014_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_SLT_done
.Lbool_014_SLT_true:
    f7_emit_char 'B'
.Lbool_014_SLT_done:
    brsge8 .Lbool_014_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_014_SGE_done
.Lbool_014_SGE_true:
    f7_emit_char 'B'
.Lbool_014_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 5; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x41d3
    push16 r4
    ldi16 r4, 0x7726
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7948
    push16 r4
    ldi16 r4, 0x7a59
    push16 r4
    ldi16 r4, 0x7b6a
    push16 r4
    ldi16 r4, 0x7c7b
    push16 r4
    ldi16 r4, 0x7d8c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r0
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_015_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_EQ_done
.Lbool_015_EQ_true:
    f7_emit_char 'B'
.Lbool_015_EQ_done:
    brne8 .Lbool_015_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_NE_done
.Lbool_015_NE_true:
    f7_emit_char 'B'
.Lbool_015_NE_done:
    brult8 .Lbool_015_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_ULT_done
.Lbool_015_ULT_true:
    f7_emit_char 'B'
.Lbool_015_ULT_done:
    bruge8 .Lbool_015_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_UGE_done
.Lbool_015_UGE_true:
    f7_emit_char 'B'
.Lbool_015_UGE_done:
    brslt8 .Lbool_015_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_SLT_done
.Lbool_015_SLT_true:
    f7_emit_char 'B'
.Lbool_015_SLT_done:
    brsge8 .Lbool_015_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_015_SGE_done
.Lbool_015_SGE_true:
    f7_emit_char 'B'
.Lbool_015_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 6; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7646
    push16 r4
    ldi16 r4, 0x431b
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7979
    push16 r4
    ldi16 r4, 0x7a8a
    push16 r4
    ldi16 r4, 0x7b9b
    push16 r4
    ldi16 r4, 0x7cac
    push16 r4
    ldi16 r4, 0x7dbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r1
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_016_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_EQ_done
.Lbool_016_EQ_true:
    f7_emit_char 'B'
.Lbool_016_EQ_done:
    brne8 .Lbool_016_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_NE_done
.Lbool_016_NE_true:
    f7_emit_char 'B'
.Lbool_016_NE_done:
    brult8 .Lbool_016_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_ULT_done
.Lbool_016_ULT_true:
    f7_emit_char 'B'
.Lbool_016_ULT_done:
    bruge8 .Lbool_016_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_UGE_done
.Lbool_016_UGE_true:
    f7_emit_char 'B'
.Lbool_016_UGE_done:
    brslt8 .Lbool_016_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_SLT_done
.Lbool_016_SLT_true:
    f7_emit_char 'B'
.Lbool_016_SLT_done:
    brsge8 .Lbool_016_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_016_SGE_done
.Lbool_016_SGE_true:
    f7_emit_char 'B'
.Lbool_016_SGE_done:
    f7_emit_char '\n'

    ; rD=r2, pattern 7; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7677
    push16 r4
    ldi16 r4, 0x7788
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4564
    push16 r4
    ldi16 r4, 0x7abb
    push16 r4
    ldi16 r4, 0x7bcc
    push16 r4
    ldi16 r4, 0x7cdd
    push16 r4
    ldi16 r4, 0x7dee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r2
    push16 r3
    push16 r2
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_017_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_EQ_done
.Lbool_017_EQ_true:
    f7_emit_char 'B'
.Lbool_017_EQ_done:
    brne8 .Lbool_017_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_NE_done
.Lbool_017_NE_true:
    f7_emit_char 'B'
.Lbool_017_NE_done:
    brult8 .Lbool_017_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_ULT_done
.Lbool_017_ULT_true:
    f7_emit_char 'B'
.Lbool_017_ULT_done:
    bruge8 .Lbool_017_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_UGE_done
.Lbool_017_UGE_true:
    f7_emit_char 'B'
.Lbool_017_UGE_done:
    brslt8 .Lbool_017_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_SLT_done
.Lbool_017_SLT_true:
    f7_emit_char 'B'
.Lbool_017_SLT_done:
    brsge8 .Lbool_017_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_017_SGE_done
.Lbool_017_SGE_true:
    f7_emit_char 'B'
.Lbool_017_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x76a8
    push16 r4
    ldi16 r4, 0x77b9
    push16 r4
    ldi16 r4, 0x78ca
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x46ac
    push16 r4
    ldi16 r4, 0x7bfd
    push16 r4
    ldi16 r4, 0x7d0e
    push16 r4
    ldi16 r4, 0x7e1f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r4
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_018_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_EQ_done
.Lbool_018_EQ_true:
    f7_emit_char 'B'
.Lbool_018_EQ_done:
    brne8 .Lbool_018_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_NE_done
.Lbool_018_NE_true:
    f7_emit_char 'B'
.Lbool_018_NE_done:
    brult8 .Lbool_018_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_ULT_done
.Lbool_018_ULT_true:
    f7_emit_char 'B'
.Lbool_018_ULT_done:
    bruge8 .Lbool_018_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_UGE_done
.Lbool_018_UGE_true:
    f7_emit_char 'B'
.Lbool_018_UGE_done:
    brslt8 .Lbool_018_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_SLT_done
.Lbool_018_SLT_true:
    f7_emit_char 'B'
.Lbool_018_SLT_done:
    brsge8 .Lbool_018_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_018_SGE_done
.Lbool_018_SGE_true:
    f7_emit_char 'B'
.Lbool_018_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x76d9
    push16 r4
    ldi16 r4, 0x77ea
    push16 r4
    ldi16 r4, 0x78fb
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x7b1d
    push16 r4
    ldi16 r4, 0x47f4
    push16 r4
    ldi16 r4, 0x7d3f
    push16 r4
    ldi16 r4, 0x7e50
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r5
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_019_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_EQ_done
.Lbool_019_EQ_true:
    f7_emit_char 'B'
.Lbool_019_EQ_done:
    brne8 .Lbool_019_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_NE_done
.Lbool_019_NE_true:
    f7_emit_char 'B'
.Lbool_019_NE_done:
    brult8 .Lbool_019_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_ULT_done
.Lbool_019_ULT_true:
    f7_emit_char 'B'
.Lbool_019_ULT_done:
    bruge8 .Lbool_019_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_UGE_done
.Lbool_019_UGE_true:
    f7_emit_char 'B'
.Lbool_019_UGE_done:
    brslt8 .Lbool_019_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_SLT_done
.Lbool_019_SLT_true:
    f7_emit_char 'B'
.Lbool_019_SLT_done:
    brsge8 .Lbool_019_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_019_SGE_done
.Lbool_019_SGE_true:
    f7_emit_char 'B'
.Lbool_019_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x770a
    push16 r4
    ldi16 r4, 0x781b
    push16 r4
    ldi16 r4, 0x792c
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x7b4e
    push16 r4
    ldi16 r4, 0x7c5f
    push16 r4
    ldi16 r4, 0x493c
    push16 r4
    ldi16 r4, 0x7e81
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r6
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_EQ_done
.Lbool_01a_EQ_true:
    f7_emit_char 'B'
.Lbool_01a_EQ_done:
    brne8 .Lbool_01a_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_NE_done
.Lbool_01a_NE_true:
    f7_emit_char 'B'
.Lbool_01a_NE_done:
    brult8 .Lbool_01a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_ULT_done
.Lbool_01a_ULT_true:
    f7_emit_char 'B'
.Lbool_01a_ULT_done:
    bruge8 .Lbool_01a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_UGE_done
.Lbool_01a_UGE_true:
    f7_emit_char 'B'
.Lbool_01a_UGE_done:
    brslt8 .Lbool_01a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_SLT_done
.Lbool_01a_SLT_true:
    f7_emit_char 'B'
.Lbool_01a_SLT_done:
    brsge8 .Lbool_01a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01a_SGE_done
.Lbool_01a_SGE_true:
    f7_emit_char 'B'
.Lbool_01a_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x773b
    push16 r4
    ldi16 r4, 0x784c
    push16 r4
    ldi16 r4, 0x795d
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x7b7f
    push16 r4
    ldi16 r4, 0x7c90
    push16 r4
    ldi16 r4, 0x7da1
    push16 r4
    ldi16 r4, 0x4a84
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r7
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_EQ_done
.Lbool_01b_EQ_true:
    f7_emit_char 'B'
.Lbool_01b_EQ_done:
    brne8 .Lbool_01b_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_NE_done
.Lbool_01b_NE_true:
    f7_emit_char 'B'
.Lbool_01b_NE_done:
    brult8 .Lbool_01b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_ULT_done
.Lbool_01b_ULT_true:
    f7_emit_char 'B'
.Lbool_01b_ULT_done:
    bruge8 .Lbool_01b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_UGE_done
.Lbool_01b_UGE_true:
    f7_emit_char 'B'
.Lbool_01b_UGE_done:
    brslt8 .Lbool_01b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_SLT_done
.Lbool_01b_SLT_true:
    f7_emit_char 'B'
.Lbool_01b_SLT_done:
    brsge8 .Lbool_01b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01b_SGE_done
.Lbool_01b_SGE_true:
    f7_emit_char 'B'
.Lbool_01b_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 4; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x43c4
    push16 r4
    ldi16 r4, 0x787d
    push16 r4
    ldi16 r4, 0x798e
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x7bb0
    push16 r4
    ldi16 r4, 0x7cc1
    push16 r4
    ldi16 r4, 0x7dd2
    push16 r4
    ldi16 r4, 0x7ee3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r0
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_EQ_done
.Lbool_01c_EQ_true:
    f7_emit_char 'B'
.Lbool_01c_EQ_done:
    brne8 .Lbool_01c_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_NE_done
.Lbool_01c_NE_true:
    f7_emit_char 'B'
.Lbool_01c_NE_done:
    brult8 .Lbool_01c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_ULT_done
.Lbool_01c_ULT_true:
    f7_emit_char 'B'
.Lbool_01c_ULT_done:
    bruge8 .Lbool_01c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_UGE_done
.Lbool_01c_UGE_true:
    f7_emit_char 'B'
.Lbool_01c_UGE_done:
    brslt8 .Lbool_01c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_SLT_done
.Lbool_01c_SLT_true:
    f7_emit_char 'B'
.Lbool_01c_SLT_done:
    brsge8 .Lbool_01c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01c_SGE_done
.Lbool_01c_SGE_true:
    f7_emit_char 'B'
.Lbool_01c_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 5; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x779d
    push16 r4
    ldi16 r4, 0x450c
    push16 r4
    ldi16 r4, 0x79bf
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7be1
    push16 r4
    ldi16 r4, 0x7cf2
    push16 r4
    ldi16 r4, 0x7e03
    push16 r4
    ldi16 r4, 0x7f14
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r1
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_EQ_done
.Lbool_01d_EQ_true:
    f7_emit_char 'B'
.Lbool_01d_EQ_done:
    brne8 .Lbool_01d_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_NE_done
.Lbool_01d_NE_true:
    f7_emit_char 'B'
.Lbool_01d_NE_done:
    brult8 .Lbool_01d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_ULT_done
.Lbool_01d_ULT_true:
    f7_emit_char 'B'
.Lbool_01d_ULT_done:
    bruge8 .Lbool_01d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_UGE_done
.Lbool_01d_UGE_true:
    f7_emit_char 'B'
.Lbool_01d_UGE_done:
    brslt8 .Lbool_01d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_SLT_done
.Lbool_01d_SLT_true:
    f7_emit_char 'B'
.Lbool_01d_SLT_done:
    brsge8 .Lbool_01d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01d_SGE_done
.Lbool_01d_SGE_true:
    f7_emit_char 'B'
.Lbool_01d_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 6; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x77ce
    push16 r4
    ldi16 r4, 0x78df
    push16 r4
    ldi16 r4, 0x4654
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7c12
    push16 r4
    ldi16 r4, 0x7d23
    push16 r4
    ldi16 r4, 0x7e34
    push16 r4
    ldi16 r4, 0x7f45
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r2
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_EQ_done
.Lbool_01e_EQ_true:
    f7_emit_char 'B'
.Lbool_01e_EQ_done:
    brne8 .Lbool_01e_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_NE_done
.Lbool_01e_NE_true:
    f7_emit_char 'B'
.Lbool_01e_NE_done:
    brult8 .Lbool_01e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_ULT_done
.Lbool_01e_ULT_true:
    f7_emit_char 'B'
.Lbool_01e_ULT_done:
    bruge8 .Lbool_01e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_UGE_done
.Lbool_01e_UGE_true:
    f7_emit_char 'B'
.Lbool_01e_UGE_done:
    brslt8 .Lbool_01e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_SLT_done
.Lbool_01e_SLT_true:
    f7_emit_char 'B'
.Lbool_01e_SLT_done:
    brsge8 .Lbool_01e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01e_SGE_done
.Lbool_01e_SGE_true:
    f7_emit_char 'B'
.Lbool_01e_SGE_done:
    f7_emit_char '\n'

    ; rD=r3, pattern 7; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x77ff
    push16 r4
    ldi16 r4, 0x7910
    push16 r4
    ldi16 r4, 0x7a21
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x489d
    push16 r4
    ldi16 r4, 0x7d54
    push16 r4
    ldi16 r4, 0x7e65
    push16 r4
    ldi16 r4, 0x7f76
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r3
    push16 r4
    push16 r3
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_01f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_EQ_done
.Lbool_01f_EQ_true:
    f7_emit_char 'B'
.Lbool_01f_EQ_done:
    brne8 .Lbool_01f_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_NE_done
.Lbool_01f_NE_true:
    f7_emit_char 'B'
.Lbool_01f_NE_done:
    brult8 .Lbool_01f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_ULT_done
.Lbool_01f_ULT_true:
    f7_emit_char 'B'
.Lbool_01f_ULT_done:
    bruge8 .Lbool_01f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_UGE_done
.Lbool_01f_UGE_true:
    f7_emit_char 'B'
.Lbool_01f_UGE_done:
    brslt8 .Lbool_01f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_SLT_done
.Lbool_01f_SLT_true:
    f7_emit_char 'B'
.Lbool_01f_SLT_done:
    brsge8 .Lbool_01f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_01f_SGE_done
.Lbool_01f_SGE_true:
    f7_emit_char 'B'
.Lbool_01f_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7830
    push16 r4
    ldi16 r4, 0x7941
    push16 r4
    ldi16 r4, 0x7a52
    push16 r4
    ldi16 r4, 0x7b63
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x49e5
    push16 r4
    ldi16 r4, 0x7e96
    push16 r4
    ldi16 r4, 0x7fa7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_020_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_EQ_done
.Lbool_020_EQ_true:
    f7_emit_char 'B'
.Lbool_020_EQ_done:
    brne8 .Lbool_020_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_NE_done
.Lbool_020_NE_true:
    f7_emit_char 'B'
.Lbool_020_NE_done:
    brult8 .Lbool_020_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_ULT_done
.Lbool_020_ULT_true:
    f7_emit_char 'B'
.Lbool_020_ULT_done:
    bruge8 .Lbool_020_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_UGE_done
.Lbool_020_UGE_true:
    f7_emit_char 'B'
.Lbool_020_UGE_done:
    brslt8 .Lbool_020_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_SLT_done
.Lbool_020_SLT_true:
    f7_emit_char 'B'
.Lbool_020_SLT_done:
    brsge8 .Lbool_020_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_020_SGE_done
.Lbool_020_SGE_true:
    f7_emit_char 'B'
.Lbool_020_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7861
    push16 r4
    ldi16 r4, 0x7972
    push16 r4
    ldi16 r4, 0x7a83
    push16 r4
    ldi16 r4, 0x7b94
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x7db6
    push16 r4
    ldi16 r4, 0x4b2d
    push16 r4
    ldi16 r4, 0x7fd8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r6
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_021_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_EQ_done
.Lbool_021_EQ_true:
    f7_emit_char 'B'
.Lbool_021_EQ_done:
    brne8 .Lbool_021_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_NE_done
.Lbool_021_NE_true:
    f7_emit_char 'B'
.Lbool_021_NE_done:
    brult8 .Lbool_021_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_ULT_done
.Lbool_021_ULT_true:
    f7_emit_char 'B'
.Lbool_021_ULT_done:
    bruge8 .Lbool_021_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_UGE_done
.Lbool_021_UGE_true:
    f7_emit_char 'B'
.Lbool_021_UGE_done:
    brslt8 .Lbool_021_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_SLT_done
.Lbool_021_SLT_true:
    f7_emit_char 'B'
.Lbool_021_SLT_done:
    brsge8 .Lbool_021_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_021_SGE_done
.Lbool_021_SGE_true:
    f7_emit_char 'B'
.Lbool_021_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7892
    push16 r4
    ldi16 r4, 0x79a3
    push16 r4
    ldi16 r4, 0x7ab4
    push16 r4
    ldi16 r4, 0x7bc5
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x7de7
    push16 r4
    ldi16 r4, 0x7ef8
    push16 r4
    ldi16 r4, 0x4c75
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r7
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_022_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_EQ_done
.Lbool_022_EQ_true:
    f7_emit_char 'B'
.Lbool_022_EQ_done:
    brne8 .Lbool_022_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_NE_done
.Lbool_022_NE_true:
    f7_emit_char 'B'
.Lbool_022_NE_done:
    brult8 .Lbool_022_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_ULT_done
.Lbool_022_ULT_true:
    f7_emit_char 'B'
.Lbool_022_ULT_done:
    bruge8 .Lbool_022_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_UGE_done
.Lbool_022_UGE_true:
    f7_emit_char 'B'
.Lbool_022_UGE_done:
    brslt8 .Lbool_022_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_SLT_done
.Lbool_022_SLT_true:
    f7_emit_char 'B'
.Lbool_022_SLT_done:
    brsge8 .Lbool_022_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_022_SGE_done
.Lbool_022_SGE_true:
    f7_emit_char 'B'
.Lbool_022_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x45b5
    push16 r4
    ldi16 r4, 0x79d4
    push16 r4
    ldi16 r4, 0x7ae5
    push16 r4
    ldi16 r4, 0x7bf6
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x7e18
    push16 r4
    ldi16 r4, 0x7f29
    push16 r4
    ldi16 r4, 0x803a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r0
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_023_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_EQ_done
.Lbool_023_EQ_true:
    f7_emit_char 'B'
.Lbool_023_EQ_done:
    brne8 .Lbool_023_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_NE_done
.Lbool_023_NE_true:
    f7_emit_char 'B'
.Lbool_023_NE_done:
    brult8 .Lbool_023_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_ULT_done
.Lbool_023_ULT_true:
    f7_emit_char 'B'
.Lbool_023_ULT_done:
    bruge8 .Lbool_023_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_UGE_done
.Lbool_023_UGE_true:
    f7_emit_char 'B'
.Lbool_023_UGE_done:
    brslt8 .Lbool_023_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_SLT_done
.Lbool_023_SLT_true:
    f7_emit_char 'B'
.Lbool_023_SLT_done:
    brsge8 .Lbool_023_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_023_SGE_done
.Lbool_023_SGE_true:
    f7_emit_char 'B'
.Lbool_023_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 4; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x78f4
    push16 r4
    ldi16 r4, 0x46fd
    push16 r4
    ldi16 r4, 0x7b16
    push16 r4
    ldi16 r4, 0x7c27
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x7e49
    push16 r4
    ldi16 r4, 0x7f5a
    push16 r4
    ldi16 r4, 0x806b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r1
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_024_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_EQ_done
.Lbool_024_EQ_true:
    f7_emit_char 'B'
.Lbool_024_EQ_done:
    brne8 .Lbool_024_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_NE_done
.Lbool_024_NE_true:
    f7_emit_char 'B'
.Lbool_024_NE_done:
    brult8 .Lbool_024_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_ULT_done
.Lbool_024_ULT_true:
    f7_emit_char 'B'
.Lbool_024_ULT_done:
    bruge8 .Lbool_024_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_UGE_done
.Lbool_024_UGE_true:
    f7_emit_char 'B'
.Lbool_024_UGE_done:
    brslt8 .Lbool_024_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_SLT_done
.Lbool_024_SLT_true:
    f7_emit_char 'B'
.Lbool_024_SLT_done:
    brsge8 .Lbool_024_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_024_SGE_done
.Lbool_024_SGE_true:
    f7_emit_char 'B'
.Lbool_024_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 5; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7925
    push16 r4
    ldi16 r4, 0x7a36
    push16 r4
    ldi16 r4, 0x4845
    push16 r4
    ldi16 r4, 0x7c58
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7e7a
    push16 r4
    ldi16 r4, 0x7f8b
    push16 r4
    ldi16 r4, 0x809c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r2
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_025_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_EQ_done
.Lbool_025_EQ_true:
    f7_emit_char 'B'
.Lbool_025_EQ_done:
    brne8 .Lbool_025_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_NE_done
.Lbool_025_NE_true:
    f7_emit_char 'B'
.Lbool_025_NE_done:
    brult8 .Lbool_025_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_ULT_done
.Lbool_025_ULT_true:
    f7_emit_char 'B'
.Lbool_025_ULT_done:
    bruge8 .Lbool_025_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_UGE_done
.Lbool_025_UGE_true:
    f7_emit_char 'B'
.Lbool_025_UGE_done:
    brslt8 .Lbool_025_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_SLT_done
.Lbool_025_SLT_true:
    f7_emit_char 'B'
.Lbool_025_SLT_done:
    brsge8 .Lbool_025_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_025_SGE_done
.Lbool_025_SGE_true:
    f7_emit_char 'B'
.Lbool_025_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 6; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7956
    push16 r4
    ldi16 r4, 0x7a67
    push16 r4
    ldi16 r4, 0x7b78
    push16 r4
    ldi16 r4, 0x498d
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7eab
    push16 r4
    ldi16 r4, 0x7fbc
    push16 r4
    ldi16 r4, 0x80cd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r3
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_026_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_EQ_done
.Lbool_026_EQ_true:
    f7_emit_char 'B'
.Lbool_026_EQ_done:
    brne8 .Lbool_026_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_NE_done
.Lbool_026_NE_true:
    f7_emit_char 'B'
.Lbool_026_NE_done:
    brult8 .Lbool_026_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_ULT_done
.Lbool_026_ULT_true:
    f7_emit_char 'B'
.Lbool_026_ULT_done:
    bruge8 .Lbool_026_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_UGE_done
.Lbool_026_UGE_true:
    f7_emit_char 'B'
.Lbool_026_UGE_done:
    brslt8 .Lbool_026_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_SLT_done
.Lbool_026_SLT_true:
    f7_emit_char 'B'
.Lbool_026_SLT_done:
    brsge8 .Lbool_026_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_026_SGE_done
.Lbool_026_SGE_true:
    f7_emit_char 'B'
.Lbool_026_SGE_done:
    f7_emit_char '\n'

    ; rD=r4, pattern 7; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7987
    push16 r4
    ldi16 r4, 0x7a98
    push16 r4
    ldi16 r4, 0x7ba9
    push16 r4
    ldi16 r4, 0x7cba
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4bd6
    push16 r4
    ldi16 r4, 0x7fed
    push16 r4
    ldi16 r4, 0x80fe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r4
    push16 r5
    push16 r4
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_027_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_EQ_done
.Lbool_027_EQ_true:
    f7_emit_char 'B'
.Lbool_027_EQ_done:
    brne8 .Lbool_027_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_NE_done
.Lbool_027_NE_true:
    f7_emit_char 'B'
.Lbool_027_NE_done:
    brult8 .Lbool_027_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_ULT_done
.Lbool_027_ULT_true:
    f7_emit_char 'B'
.Lbool_027_ULT_done:
    bruge8 .Lbool_027_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_UGE_done
.Lbool_027_UGE_true:
    f7_emit_char 'B'
.Lbool_027_UGE_done:
    brslt8 .Lbool_027_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_SLT_done
.Lbool_027_SLT_true:
    f7_emit_char 'B'
.Lbool_027_SLT_done:
    brsge8 .Lbool_027_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_027_SGE_done
.Lbool_027_SGE_true:
    f7_emit_char 'B'
.Lbool_027_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x79b8
    push16 r4
    ldi16 r4, 0x7ac9
    push16 r4
    ldi16 r4, 0x7bda
    push16 r4
    ldi16 r4, 0x7ceb
    push16 r4
    ldi16 r4, 0x7dfc
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x4d1e
    push16 r4
    ldi16 r4, 0x812f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r6
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_028_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_EQ_done
.Lbool_028_EQ_true:
    f7_emit_char 'B'
.Lbool_028_EQ_done:
    brne8 .Lbool_028_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_NE_done
.Lbool_028_NE_true:
    f7_emit_char 'B'
.Lbool_028_NE_done:
    brult8 .Lbool_028_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_ULT_done
.Lbool_028_ULT_true:
    f7_emit_char 'B'
.Lbool_028_ULT_done:
    bruge8 .Lbool_028_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_UGE_done
.Lbool_028_UGE_true:
    f7_emit_char 'B'
.Lbool_028_UGE_done:
    brslt8 .Lbool_028_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_SLT_done
.Lbool_028_SLT_true:
    f7_emit_char 'B'
.Lbool_028_SLT_done:
    brsge8 .Lbool_028_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_028_SGE_done
.Lbool_028_SGE_true:
    f7_emit_char 'B'
.Lbool_028_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x79e9
    push16 r4
    ldi16 r4, 0x7afa
    push16 r4
    ldi16 r4, 0x7c0b
    push16 r4
    ldi16 r4, 0x7d1c
    push16 r4
    ldi16 r4, 0x7e2d
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x804f
    push16 r4
    ldi16 r4, 0x4e66
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r7
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_029_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_EQ_done
.Lbool_029_EQ_true:
    f7_emit_char 'B'
.Lbool_029_EQ_done:
    brne8 .Lbool_029_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_NE_done
.Lbool_029_NE_true:
    f7_emit_char 'B'
.Lbool_029_NE_done:
    brult8 .Lbool_029_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_ULT_done
.Lbool_029_ULT_true:
    f7_emit_char 'B'
.Lbool_029_ULT_done:
    bruge8 .Lbool_029_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_UGE_done
.Lbool_029_UGE_true:
    f7_emit_char 'B'
.Lbool_029_UGE_done:
    brslt8 .Lbool_029_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_SLT_done
.Lbool_029_SLT_true:
    f7_emit_char 'B'
.Lbool_029_SLT_done:
    brsge8 .Lbool_029_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_029_SGE_done
.Lbool_029_SGE_true:
    f7_emit_char 'B'
.Lbool_029_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 2; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x47a6
    push16 r4
    ldi16 r4, 0x7b2b
    push16 r4
    ldi16 r4, 0x7c3c
    push16 r4
    ldi16 r4, 0x7d4d
    push16 r4
    ldi16 r4, 0x7e5e
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x8080
    push16 r4
    ldi16 r4, 0x8191
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r0
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_EQ_done
.Lbool_02a_EQ_true:
    f7_emit_char 'B'
.Lbool_02a_EQ_done:
    brne8 .Lbool_02a_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_NE_done
.Lbool_02a_NE_true:
    f7_emit_char 'B'
.Lbool_02a_NE_done:
    brult8 .Lbool_02a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_ULT_done
.Lbool_02a_ULT_true:
    f7_emit_char 'B'
.Lbool_02a_ULT_done:
    bruge8 .Lbool_02a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_UGE_done
.Lbool_02a_UGE_true:
    f7_emit_char 'B'
.Lbool_02a_UGE_done:
    brslt8 .Lbool_02a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_SLT_done
.Lbool_02a_SLT_true:
    f7_emit_char 'B'
.Lbool_02a_SLT_done:
    brsge8 .Lbool_02a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02a_SGE_done
.Lbool_02a_SGE_true:
    f7_emit_char 'B'
.Lbool_02a_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 3; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7a4b
    push16 r4
    ldi16 r4, 0x48ee
    push16 r4
    ldi16 r4, 0x7c6d
    push16 r4
    ldi16 r4, 0x7d7e
    push16 r4
    ldi16 r4, 0x7e8f
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x80b1
    push16 r4
    ldi16 r4, 0x81c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r1
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_EQ_done
.Lbool_02b_EQ_true:
    f7_emit_char 'B'
.Lbool_02b_EQ_done:
    brne8 .Lbool_02b_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_NE_done
.Lbool_02b_NE_true:
    f7_emit_char 'B'
.Lbool_02b_NE_done:
    brult8 .Lbool_02b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_ULT_done
.Lbool_02b_ULT_true:
    f7_emit_char 'B'
.Lbool_02b_ULT_done:
    bruge8 .Lbool_02b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_UGE_done
.Lbool_02b_UGE_true:
    f7_emit_char 'B'
.Lbool_02b_UGE_done:
    brslt8 .Lbool_02b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_SLT_done
.Lbool_02b_SLT_true:
    f7_emit_char 'B'
.Lbool_02b_SLT_done:
    brsge8 .Lbool_02b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02b_SGE_done
.Lbool_02b_SGE_true:
    f7_emit_char 'B'
.Lbool_02b_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 4; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7a7c
    push16 r4
    ldi16 r4, 0x7b8d
    push16 r4
    ldi16 r4, 0x4a36
    push16 r4
    ldi16 r4, 0x7daf
    push16 r4
    ldi16 r4, 0x7ec0
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x80e2
    push16 r4
    ldi16 r4, 0x81f3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r2
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_EQ_done
.Lbool_02c_EQ_true:
    f7_emit_char 'B'
.Lbool_02c_EQ_done:
    brne8 .Lbool_02c_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_NE_done
.Lbool_02c_NE_true:
    f7_emit_char 'B'
.Lbool_02c_NE_done:
    brult8 .Lbool_02c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_ULT_done
.Lbool_02c_ULT_true:
    f7_emit_char 'B'
.Lbool_02c_ULT_done:
    bruge8 .Lbool_02c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_UGE_done
.Lbool_02c_UGE_true:
    f7_emit_char 'B'
.Lbool_02c_UGE_done:
    brslt8 .Lbool_02c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_SLT_done
.Lbool_02c_SLT_true:
    f7_emit_char 'B'
.Lbool_02c_SLT_done:
    brsge8 .Lbool_02c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02c_SGE_done
.Lbool_02c_SGE_true:
    f7_emit_char 'B'
.Lbool_02c_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 5; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7aad
    push16 r4
    ldi16 r4, 0x7bbe
    push16 r4
    ldi16 r4, 0x7ccf
    push16 r4
    ldi16 r4, 0x4b7e
    push16 r4
    ldi16 r4, 0x7ef1
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8113
    push16 r4
    ldi16 r4, 0x8224
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r3
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_EQ_done
.Lbool_02d_EQ_true:
    f7_emit_char 'B'
.Lbool_02d_EQ_done:
    brne8 .Lbool_02d_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_NE_done
.Lbool_02d_NE_true:
    f7_emit_char 'B'
.Lbool_02d_NE_done:
    brult8 .Lbool_02d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_ULT_done
.Lbool_02d_ULT_true:
    f7_emit_char 'B'
.Lbool_02d_ULT_done:
    bruge8 .Lbool_02d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_UGE_done
.Lbool_02d_UGE_true:
    f7_emit_char 'B'
.Lbool_02d_UGE_done:
    brslt8 .Lbool_02d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_SLT_done
.Lbool_02d_SLT_true:
    f7_emit_char 'B'
.Lbool_02d_SLT_done:
    brsge8 .Lbool_02d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02d_SGE_done
.Lbool_02d_SGE_true:
    f7_emit_char 'B'
.Lbool_02d_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 6; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7ade
    push16 r4
    ldi16 r4, 0x7bef
    push16 r4
    ldi16 r4, 0x7d00
    push16 r4
    ldi16 r4, 0x7e11
    push16 r4
    ldi16 r4, 0x4cc6
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x8144
    push16 r4
    ldi16 r4, 0x8255
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r4
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_EQ_done
.Lbool_02e_EQ_true:
    f7_emit_char 'B'
.Lbool_02e_EQ_done:
    brne8 .Lbool_02e_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_NE_done
.Lbool_02e_NE_true:
    f7_emit_char 'B'
.Lbool_02e_NE_done:
    brult8 .Lbool_02e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_ULT_done
.Lbool_02e_ULT_true:
    f7_emit_char 'B'
.Lbool_02e_ULT_done:
    bruge8 .Lbool_02e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_UGE_done
.Lbool_02e_UGE_true:
    f7_emit_char 'B'
.Lbool_02e_UGE_done:
    brslt8 .Lbool_02e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_SLT_done
.Lbool_02e_SLT_true:
    f7_emit_char 'B'
.Lbool_02e_SLT_done:
    brsge8 .Lbool_02e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02e_SGE_done
.Lbool_02e_SGE_true:
    f7_emit_char 'B'
.Lbool_02e_SGE_done:
    f7_emit_char '\n'

    ; rD=r5, pattern 7; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7b0f
    push16 r4
    ldi16 r4, 0x7c20
    push16 r4
    ldi16 r4, 0x7d31
    push16 r4
    ldi16 r4, 0x7e42
    push16 r4
    ldi16 r4, 0x7f53
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x4f0f
    push16 r4
    ldi16 r4, 0x8286
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r5
    push16 r6
    push16 r5
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_02f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_EQ_done
.Lbool_02f_EQ_true:
    f7_emit_char 'B'
.Lbool_02f_EQ_done:
    brne8 .Lbool_02f_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_NE_done
.Lbool_02f_NE_true:
    f7_emit_char 'B'
.Lbool_02f_NE_done:
    brult8 .Lbool_02f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_ULT_done
.Lbool_02f_ULT_true:
    f7_emit_char 'B'
.Lbool_02f_ULT_done:
    bruge8 .Lbool_02f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_UGE_done
.Lbool_02f_UGE_true:
    f7_emit_char 'B'
.Lbool_02f_UGE_done:
    brslt8 .Lbool_02f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_SLT_done
.Lbool_02f_SLT_true:
    f7_emit_char 'B'
.Lbool_02f_SLT_done:
    brsge8 .Lbool_02f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_02f_SGE_done
.Lbool_02f_SGE_true:
    f7_emit_char 'B'
.Lbool_02f_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7b40
    push16 r4
    ldi16 r4, 0x7c51
    push16 r4
    ldi16 r4, 0x7d62
    push16 r4
    ldi16 r4, 0x7e73
    push16 r4
    ldi16 r4, 0x7f84
    push16 r4
    ldi16 r4, 0x8095
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x5057
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_030_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_EQ_done
.Lbool_030_EQ_true:
    f7_emit_char 'B'
.Lbool_030_EQ_done:
    brne8 .Lbool_030_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_NE_done
.Lbool_030_NE_true:
    f7_emit_char 'B'
.Lbool_030_NE_done:
    brult8 .Lbool_030_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_ULT_done
.Lbool_030_ULT_true:
    f7_emit_char 'B'
.Lbool_030_ULT_done:
    bruge8 .Lbool_030_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_UGE_done
.Lbool_030_UGE_true:
    f7_emit_char 'B'
.Lbool_030_UGE_done:
    brslt8 .Lbool_030_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_SLT_done
.Lbool_030_SLT_true:
    f7_emit_char 'B'
.Lbool_030_SLT_done:
    brsge8 .Lbool_030_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_030_SGE_done
.Lbool_030_SGE_true:
    f7_emit_char 'B'
.Lbool_030_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4997
    push16 r4
    ldi16 r4, 0x7c82
    push16 r4
    ldi16 r4, 0x7d93
    push16 r4
    ldi16 r4, 0x7ea4
    push16 r4
    ldi16 r4, 0x7fb5
    push16 r4
    ldi16 r4, 0x80c6
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x82e8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r0
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_031_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_EQ_done
.Lbool_031_EQ_true:
    f7_emit_char 'B'
.Lbool_031_EQ_done:
    brne8 .Lbool_031_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_NE_done
.Lbool_031_NE_true:
    f7_emit_char 'B'
.Lbool_031_NE_done:
    brult8 .Lbool_031_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_ULT_done
.Lbool_031_ULT_true:
    f7_emit_char 'B'
.Lbool_031_ULT_done:
    bruge8 .Lbool_031_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_UGE_done
.Lbool_031_UGE_true:
    f7_emit_char 'B'
.Lbool_031_UGE_done:
    brslt8 .Lbool_031_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_SLT_done
.Lbool_031_SLT_true:
    f7_emit_char 'B'
.Lbool_031_SLT_done:
    brsge8 .Lbool_031_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_031_SGE_done
.Lbool_031_SGE_true:
    f7_emit_char 'B'
.Lbool_031_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7ba2
    push16 r4
    ldi16 r4, 0x4adf
    push16 r4
    ldi16 r4, 0x7dc4
    push16 r4
    ldi16 r4, 0x7ed5
    push16 r4
    ldi16 r4, 0x7fe6
    push16 r4
    ldi16 r4, 0x80f7
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    ldi16 r4, 0x8319
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r1
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_032_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_EQ_done
.Lbool_032_EQ_true:
    f7_emit_char 'B'
.Lbool_032_EQ_done:
    brne8 .Lbool_032_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_NE_done
.Lbool_032_NE_true:
    f7_emit_char 'B'
.Lbool_032_NE_done:
    brult8 .Lbool_032_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_ULT_done
.Lbool_032_ULT_true:
    f7_emit_char 'B'
.Lbool_032_ULT_done:
    bruge8 .Lbool_032_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_UGE_done
.Lbool_032_UGE_true:
    f7_emit_char 'B'
.Lbool_032_UGE_done:
    brslt8 .Lbool_032_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_SLT_done
.Lbool_032_SLT_true:
    f7_emit_char 'B'
.Lbool_032_SLT_done:
    brsge8 .Lbool_032_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_032_SGE_done
.Lbool_032_SGE_true:
    f7_emit_char 'B'
.Lbool_032_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7bd3
    push16 r4
    ldi16 r4, 0x7ce4
    push16 r4
    ldi16 r4, 0x4c27
    push16 r4
    ldi16 r4, 0x7f06
    push16 r4
    ldi16 r4, 0x8017
    push16 r4
    ldi16 r4, 0x8128
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x834a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r2
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_033_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_EQ_done
.Lbool_033_EQ_true:
    f7_emit_char 'B'
.Lbool_033_EQ_done:
    brne8 .Lbool_033_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_NE_done
.Lbool_033_NE_true:
    f7_emit_char 'B'
.Lbool_033_NE_done:
    brult8 .Lbool_033_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_ULT_done
.Lbool_033_ULT_true:
    f7_emit_char 'B'
.Lbool_033_ULT_done:
    bruge8 .Lbool_033_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_UGE_done
.Lbool_033_UGE_true:
    f7_emit_char 'B'
.Lbool_033_UGE_done:
    brslt8 .Lbool_033_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_SLT_done
.Lbool_033_SLT_true:
    f7_emit_char 'B'
.Lbool_033_SLT_done:
    brsge8 .Lbool_033_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_033_SGE_done
.Lbool_033_SGE_true:
    f7_emit_char 'B'
.Lbool_033_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 4; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7c04
    push16 r4
    ldi16 r4, 0x7d15
    push16 r4
    ldi16 r4, 0x7e26
    push16 r4
    ldi16 r4, 0x4d6f
    push16 r4
    ldi16 r4, 0x8048
    push16 r4
    ldi16 r4, 0x8159
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    ldi16 r4, 0x837b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r3
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_034_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_EQ_done
.Lbool_034_EQ_true:
    f7_emit_char 'B'
.Lbool_034_EQ_done:
    brne8 .Lbool_034_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_NE_done
.Lbool_034_NE_true:
    f7_emit_char 'B'
.Lbool_034_NE_done:
    brult8 .Lbool_034_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_ULT_done
.Lbool_034_ULT_true:
    f7_emit_char 'B'
.Lbool_034_ULT_done:
    bruge8 .Lbool_034_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_UGE_done
.Lbool_034_UGE_true:
    f7_emit_char 'B'
.Lbool_034_UGE_done:
    brslt8 .Lbool_034_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_SLT_done
.Lbool_034_SLT_true:
    f7_emit_char 'B'
.Lbool_034_SLT_done:
    brsge8 .Lbool_034_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_034_SGE_done
.Lbool_034_SGE_true:
    f7_emit_char 'B'
.Lbool_034_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 5; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7c35
    push16 r4
    ldi16 r4, 0x7d46
    push16 r4
    ldi16 r4, 0x7e57
    push16 r4
    ldi16 r4, 0x7f68
    push16 r4
    ldi16 r4, 0x4eb7
    push16 r4
    ldi16 r4, 0x818a
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x83ac
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r4
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_035_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_EQ_done
.Lbool_035_EQ_true:
    f7_emit_char 'B'
.Lbool_035_EQ_done:
    brne8 .Lbool_035_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_NE_done
.Lbool_035_NE_true:
    f7_emit_char 'B'
.Lbool_035_NE_done:
    brult8 .Lbool_035_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_ULT_done
.Lbool_035_ULT_true:
    f7_emit_char 'B'
.Lbool_035_ULT_done:
    bruge8 .Lbool_035_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_UGE_done
.Lbool_035_UGE_true:
    f7_emit_char 'B'
.Lbool_035_UGE_done:
    brslt8 .Lbool_035_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_SLT_done
.Lbool_035_SLT_true:
    f7_emit_char 'B'
.Lbool_035_SLT_done:
    brsge8 .Lbool_035_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_035_SGE_done
.Lbool_035_SGE_true:
    f7_emit_char 'B'
.Lbool_035_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 6; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7c66
    push16 r4
    ldi16 r4, 0x7d77
    push16 r4
    ldi16 r4, 0x7e88
    push16 r4
    ldi16 r4, 0x7f99
    push16 r4
    ldi16 r4, 0x80aa
    push16 r4
    ldi16 r4, 0x4fff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x83dd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r5
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_036_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_EQ_done
.Lbool_036_EQ_true:
    f7_emit_char 'B'
.Lbool_036_EQ_done:
    brne8 .Lbool_036_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_NE_done
.Lbool_036_NE_true:
    f7_emit_char 'B'
.Lbool_036_NE_done:
    brult8 .Lbool_036_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_ULT_done
.Lbool_036_ULT_true:
    f7_emit_char 'B'
.Lbool_036_ULT_done:
    bruge8 .Lbool_036_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_UGE_done
.Lbool_036_UGE_true:
    f7_emit_char 'B'
.Lbool_036_UGE_done:
    brslt8 .Lbool_036_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_SLT_done
.Lbool_036_SLT_true:
    f7_emit_char 'B'
.Lbool_036_SLT_done:
    brsge8 .Lbool_036_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_036_SGE_done
.Lbool_036_SGE_true:
    f7_emit_char 'B'
.Lbool_036_SGE_done:
    f7_emit_char '\n'

    ; rD=r6, pattern 7; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7c97
    push16 r4
    ldi16 r4, 0x7da8
    push16 r4
    ldi16 r4, 0x7eb9
    push16 r4
    ldi16 r4, 0x7fca
    push16 r4
    ldi16 r4, 0x80db
    push16 r4
    ldi16 r4, 0x81ec
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x5248
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r6
    push16 r7
    push16 r6
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_037_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_EQ_done
.Lbool_037_EQ_true:
    f7_emit_char 'B'
.Lbool_037_EQ_done:
    brne8 .Lbool_037_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_NE_done
.Lbool_037_NE_true:
    f7_emit_char 'B'
.Lbool_037_NE_done:
    brult8 .Lbool_037_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_ULT_done
.Lbool_037_ULT_true:
    f7_emit_char 'B'
.Lbool_037_ULT_done:
    bruge8 .Lbool_037_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_UGE_done
.Lbool_037_UGE_true:
    f7_emit_char 'B'
.Lbool_037_UGE_done:
    brslt8 .Lbool_037_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_SLT_done
.Lbool_037_SLT_true:
    f7_emit_char 'B'
.Lbool_037_SLT_done:
    brsge8 .Lbool_037_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_037_SGE_done
.Lbool_037_SGE_true:
    f7_emit_char 'B'
.Lbool_037_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4b88
    push16 r4
    ldi16 r4, 0x7dd9
    push16 r4
    ldi16 r4, 0x7eea
    push16 r4
    ldi16 r4, 0x7ffb
    push16 r4
    ldi16 r4, 0x810c
    push16 r4
    ldi16 r4, 0x821d
    push16 r4
    ldi16 r4, 0x832e
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
    bool r7
    push16 r0
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_038_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_EQ_done
.Lbool_038_EQ_true:
    f7_emit_char 'B'
.Lbool_038_EQ_done:
    brne8 .Lbool_038_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_NE_done
.Lbool_038_NE_true:
    f7_emit_char 'B'
.Lbool_038_NE_done:
    brult8 .Lbool_038_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_ULT_done
.Lbool_038_ULT_true:
    f7_emit_char 'B'
.Lbool_038_ULT_done:
    bruge8 .Lbool_038_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_UGE_done
.Lbool_038_UGE_true:
    f7_emit_char 'B'
.Lbool_038_UGE_done:
    brslt8 .Lbool_038_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_SLT_done
.Lbool_038_SLT_true:
    f7_emit_char 'B'
.Lbool_038_SLT_done:
    brsge8 .Lbool_038_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_038_SGE_done
.Lbool_038_SGE_true:
    f7_emit_char 'B'
.Lbool_038_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7cf9
    push16 r4
    ldi16 r4, 0x4cd0
    push16 r4
    ldi16 r4, 0x7f1b
    push16 r4
    ldi16 r4, 0x802c
    push16 r4
    ldi16 r4, 0x813d
    push16 r4
    ldi16 r4, 0x824e
    push16 r4
    ldi16 r4, 0x835f
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
    bool r7
    push16 r1
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_039_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_EQ_done
.Lbool_039_EQ_true:
    f7_emit_char 'B'
.Lbool_039_EQ_done:
    brne8 .Lbool_039_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_NE_done
.Lbool_039_NE_true:
    f7_emit_char 'B'
.Lbool_039_NE_done:
    brult8 .Lbool_039_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_ULT_done
.Lbool_039_ULT_true:
    f7_emit_char 'B'
.Lbool_039_ULT_done:
    bruge8 .Lbool_039_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_UGE_done
.Lbool_039_UGE_true:
    f7_emit_char 'B'
.Lbool_039_UGE_done:
    brslt8 .Lbool_039_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_SLT_done
.Lbool_039_SLT_true:
    f7_emit_char 'B'
.Lbool_039_SLT_done:
    brsge8 .Lbool_039_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_039_SGE_done
.Lbool_039_SGE_true:
    f7_emit_char 'B'
.Lbool_039_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 2; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7d2a
    push16 r4
    ldi16 r4, 0x7e3b
    push16 r4
    ldi16 r4, 0x4e18
    push16 r4
    ldi16 r4, 0x805d
    push16 r4
    ldi16 r4, 0x816e
    push16 r4
    ldi16 r4, 0x827f
    push16 r4
    ldi16 r4, 0x8390
    push16 r4
    ldi16 r4, 0x0080
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r7
    push16 r2
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03a_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_EQ_done
.Lbool_03a_EQ_true:
    f7_emit_char 'B'
.Lbool_03a_EQ_done:
    brne8 .Lbool_03a_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_NE_done
.Lbool_03a_NE_true:
    f7_emit_char 'B'
.Lbool_03a_NE_done:
    brult8 .Lbool_03a_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_ULT_done
.Lbool_03a_ULT_true:
    f7_emit_char 'B'
.Lbool_03a_ULT_done:
    bruge8 .Lbool_03a_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_UGE_done
.Lbool_03a_UGE_true:
    f7_emit_char 'B'
.Lbool_03a_UGE_done:
    brslt8 .Lbool_03a_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_SLT_done
.Lbool_03a_SLT_true:
    f7_emit_char 'B'
.Lbool_03a_SLT_done:
    brsge8 .Lbool_03a_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03a_SGE_done
.Lbool_03a_SGE_true:
    f7_emit_char 'B'
.Lbool_03a_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 3; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7d5b
    push16 r4
    ldi16 r4, 0x7e6c
    push16 r4
    ldi16 r4, 0x7f7d
    push16 r4
    ldi16 r4, 0x4f60
    push16 r4
    ldi16 r4, 0x819f
    push16 r4
    ldi16 r4, 0x82b0
    push16 r4
    ldi16 r4, 0x83c1
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r7
    push16 r3
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03b_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_EQ_done
.Lbool_03b_EQ_true:
    f7_emit_char 'B'
.Lbool_03b_EQ_done:
    brne8 .Lbool_03b_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_NE_done
.Lbool_03b_NE_true:
    f7_emit_char 'B'
.Lbool_03b_NE_done:
    brult8 .Lbool_03b_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_ULT_done
.Lbool_03b_ULT_true:
    f7_emit_char 'B'
.Lbool_03b_ULT_done:
    bruge8 .Lbool_03b_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_UGE_done
.Lbool_03b_UGE_true:
    f7_emit_char 'B'
.Lbool_03b_UGE_done:
    brslt8 .Lbool_03b_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_SLT_done
.Lbool_03b_SLT_true:
    f7_emit_char 'B'
.Lbool_03b_SLT_done:
    brsge8 .Lbool_03b_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03b_SGE_done
.Lbool_03b_SGE_true:
    f7_emit_char 'B'
.Lbool_03b_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 4; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7d8c
    push16 r4
    ldi16 r4, 0x7e9d
    push16 r4
    ldi16 r4, 0x7fae
    push16 r4
    ldi16 r4, 0x80bf
    push16 r4
    ldi16 r4, 0x50a8
    push16 r4
    ldi16 r4, 0x82e1
    push16 r4
    ldi16 r4, 0x83f2
    push16 r4
    ldi16 r4, 0x7f00
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    bool r7
    push16 r4
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03c_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_EQ_done
.Lbool_03c_EQ_true:
    f7_emit_char 'B'
.Lbool_03c_EQ_done:
    brne8 .Lbool_03c_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_NE_done
.Lbool_03c_NE_true:
    f7_emit_char 'B'
.Lbool_03c_NE_done:
    brult8 .Lbool_03c_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_ULT_done
.Lbool_03c_ULT_true:
    f7_emit_char 'B'
.Lbool_03c_ULT_done:
    bruge8 .Lbool_03c_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_UGE_done
.Lbool_03c_UGE_true:
    f7_emit_char 'B'
.Lbool_03c_UGE_done:
    brslt8 .Lbool_03c_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_SLT_done
.Lbool_03c_SLT_true:
    f7_emit_char 'B'
.Lbool_03c_SLT_done:
    brsge8 .Lbool_03c_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03c_SGE_done
.Lbool_03c_SGE_true:
    f7_emit_char 'B'
.Lbool_03c_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 5; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7dbd
    push16 r4
    ldi16 r4, 0x7ece
    push16 r4
    ldi16 r4, 0x7fdf
    push16 r4
    ldi16 r4, 0x80f0
    push16 r4
    ldi16 r4, 0x8201
    push16 r4
    ldi16 r4, 0x51f0
    push16 r4
    ldi16 r4, 0x8423
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
    bool r7
    push16 r5
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03d_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_EQ_done
.Lbool_03d_EQ_true:
    f7_emit_char 'B'
.Lbool_03d_EQ_done:
    brne8 .Lbool_03d_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_NE_done
.Lbool_03d_NE_true:
    f7_emit_char 'B'
.Lbool_03d_NE_done:
    brult8 .Lbool_03d_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_ULT_done
.Lbool_03d_ULT_true:
    f7_emit_char 'B'
.Lbool_03d_ULT_done:
    bruge8 .Lbool_03d_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_UGE_done
.Lbool_03d_UGE_true:
    f7_emit_char 'B'
.Lbool_03d_UGE_done:
    brslt8 .Lbool_03d_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_SLT_done
.Lbool_03d_SLT_true:
    f7_emit_char 'B'
.Lbool_03d_SLT_done:
    brsge8 .Lbool_03d_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03d_SGE_done
.Lbool_03d_SGE_true:
    f7_emit_char 'B'
.Lbool_03d_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 6; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7dee
    push16 r4
    ldi16 r4, 0x7eff
    push16 r4
    ldi16 r4, 0x8010
    push16 r4
    ldi16 r4, 0x8121
    push16 r4
    ldi16 r4, 0x8232
    push16 r4
    ldi16 r4, 0x8343
    push16 r4
    ldi16 r4, 0x5338
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
    bool r7
    push16 r6
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03e_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_EQ_done
.Lbool_03e_EQ_true:
    f7_emit_char 'B'
.Lbool_03e_EQ_done:
    brne8 .Lbool_03e_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_NE_done
.Lbool_03e_NE_true:
    f7_emit_char 'B'
.Lbool_03e_NE_done:
    brult8 .Lbool_03e_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_ULT_done
.Lbool_03e_ULT_true:
    f7_emit_char 'B'
.Lbool_03e_ULT_done:
    bruge8 .Lbool_03e_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_UGE_done
.Lbool_03e_UGE_true:
    f7_emit_char 'B'
.Lbool_03e_UGE_done:
    brslt8 .Lbool_03e_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_SLT_done
.Lbool_03e_SLT_true:
    f7_emit_char 'B'
.Lbool_03e_SLT_done:
    brsge8 .Lbool_03e_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03e_SGE_done
.Lbool_03e_SGE_true:
    f7_emit_char 'B'
.Lbool_03e_SGE_done:
    f7_emit_char '\n'

    ; rD=r7, pattern 7; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4d79
    push16 r4
    ldi16 r4, 0x7f30
    push16 r4
    ldi16 r4, 0x8041
    push16 r4
    ldi16 r4, 0x8152
    push16 r4
    ldi16 r4, 0x8263
    push16 r4
    ldi16 r4, 0x8374
    push16 r4
    ldi16 r4, 0x8485
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
    bool r7
    push16 r0
    push16 r7
    pop16 r0
    call f7_print_r0_line
    pop16 r0
    call f7_print_r0_line
    breq8 .Lbool_03f_EQ_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_EQ_done
.Lbool_03f_EQ_true:
    f7_emit_char 'B'
.Lbool_03f_EQ_done:
    brne8 .Lbool_03f_NE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_NE_done
.Lbool_03f_NE_true:
    f7_emit_char 'B'
.Lbool_03f_NE_done:
    brult8 .Lbool_03f_ULT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_ULT_done
.Lbool_03f_ULT_true:
    f7_emit_char 'B'
.Lbool_03f_ULT_done:
    bruge8 .Lbool_03f_UGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_UGE_done
.Lbool_03f_UGE_true:
    f7_emit_char 'B'
.Lbool_03f_UGE_done:
    brslt8 .Lbool_03f_SLT_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_SLT_done
.Lbool_03f_SLT_true:
    f7_emit_char 'B'
.Lbool_03f_SLT_done:
    brsge8 .Lbool_03f_SGE_true
    f7_emit_char 'A'
    jmp8 .Lbool_03f_SGE_done
.Lbool_03f_SGE_true:
    f7_emit_char 'B'
.Lbool_03f_SGE_done:
    f7_emit_char '\n'

    sys debug_break
