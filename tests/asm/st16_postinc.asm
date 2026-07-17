.include "include/secondary_memory_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0680
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x0681
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0683
    ldi8 r5, 0xc0
    st8 [r4], r5

    ; POST pointer r4, data r0, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x7fff
    push16 r5
    pop16 r0
    ldi16 r5, 0x6401
    push16 r5
    pop16 r1
    ldi16 r4, 0x0681
    st16 [r4+], r0
    push16 r0
    push16 r4
    push16 r1
    ldi16 r4, 0x0680
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0682
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_000_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_EQ_done
.Lst16_postinc_000_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_000_EQ_done:
    brne8 .Lst16_postinc_000_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_NE_done
.Lst16_postinc_000_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_000_NE_done:
    brult8 .Lst16_postinc_000_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_ULT_done
.Lst16_postinc_000_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_000_ULT_done:
    bruge8 .Lst16_postinc_000_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_UGE_done
.Lst16_postinc_000_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_000_UGE_done:
    brslt8 .Lst16_postinc_000_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_SLT_done
.Lst16_postinc_000_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_000_SLT_done:
    brsge8 .Lst16_postinc_000_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_000_SGE_done
.Lst16_postinc_000_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_000_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0684
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x0685
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x0687
    ldi8 r5, 0xc7
    st8 [r4], r5

    ; POST pointer r4, data r0, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8631
    push16 r5
    pop16 r0
    ldi16 r5, 0x644e
    push16 r5
    pop16 r1
    ldi16 r4, 0x0685
    st16 [r4+], r0
    push16 r0
    push16 r4
    push16 r1
    ldi16 r4, 0x0684
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0686
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_001_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_EQ_done
.Lst16_postinc_001_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_001_EQ_done:
    brne8 .Lst16_postinc_001_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_NE_done
.Lst16_postinc_001_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_001_NE_done:
    brult8 .Lst16_postinc_001_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_ULT_done
.Lst16_postinc_001_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_001_ULT_done:
    bruge8 .Lst16_postinc_001_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_UGE_done
.Lst16_postinc_001_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_001_UGE_done:
    brslt8 .Lst16_postinc_001_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_SLT_done
.Lst16_postinc_001_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_001_SLT_done:
    brsge8 .Lst16_postinc_001_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_001_SGE_done
.Lst16_postinc_001_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_001_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0688
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x0689
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x068b
    ldi8 r5, 0xcf
    st8 [r4], r5

    ; POST pointer r4, data r1, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa938
    push16 r5
    pop16 r1
    ldi16 r5, 0x639a
    push16 r5
    pop16 r0
    ldi16 r4, 0x0689
    st16 [r4+], r1
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x0688
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x068a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_002_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_EQ_done
.Lst16_postinc_002_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_002_EQ_done:
    brne8 .Lst16_postinc_002_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_NE_done
.Lst16_postinc_002_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_002_NE_done:
    brult8 .Lst16_postinc_002_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_ULT_done
.Lst16_postinc_002_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_002_ULT_done:
    bruge8 .Lst16_postinc_002_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_UGE_done
.Lst16_postinc_002_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_002_UGE_done:
    brslt8 .Lst16_postinc_002_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_SLT_done
.Lst16_postinc_002_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_002_SLT_done:
    brsge8 .Lst16_postinc_002_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_002_SGE_done
.Lst16_postinc_002_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_002_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x068c
    ldi8 r5, 0x4b
    st8 [r4], r5
    ldi16 r4, 0x068d
    ldi16 r5, 0x7fff
    st16 [r4], r5
    ldi16 r4, 0x068f
    ldi8 r5, 0xd6
    st8 [r4], r5

    ; POST pointer r4, data r1, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x1293
    push16 r5
    pop16 r1
    ldi16 r5, 0x63e7
    push16 r5
    pop16 r0
    ldi16 r4, 0x068d
    st16 [r4+], r1
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x068c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x068e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_003_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_EQ_done
.Lst16_postinc_003_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_003_EQ_done:
    brne8 .Lst16_postinc_003_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_NE_done
.Lst16_postinc_003_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_003_NE_done:
    brult8 .Lst16_postinc_003_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_ULT_done
.Lst16_postinc_003_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_003_ULT_done:
    bruge8 .Lst16_postinc_003_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_UGE_done
.Lst16_postinc_003_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_003_UGE_done:
    brslt8 .Lst16_postinc_003_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_SLT_done
.Lst16_postinc_003_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_003_SLT_done:
    brsge8 .Lst16_postinc_003_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_003_SGE_done
.Lst16_postinc_003_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_003_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0690
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x0691
    ldi16 r5, 0x7fff
    st16 [r4], r5
    ldi16 r4, 0x0693
    ldi8 r5, 0xde
    st8 [r4], r5

    ; POST pointer r4, data r2, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x183b
    push16 r5
    pop16 r2
    ldi16 r5, 0x6434
    push16 r5
    pop16 r0
    ldi16 r4, 0x0691
    st16 [r4+], r2
    push16 r2
    push16 r4
    push16 r0
    ldi16 r4, 0x0690
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0692
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_004_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_EQ_done
.Lst16_postinc_004_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_004_EQ_done:
    brne8 .Lst16_postinc_004_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_NE_done
.Lst16_postinc_004_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_004_NE_done:
    brult8 .Lst16_postinc_004_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_ULT_done
.Lst16_postinc_004_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_004_ULT_done:
    bruge8 .Lst16_postinc_004_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_UGE_done
.Lst16_postinc_004_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_004_UGE_done:
    brslt8 .Lst16_postinc_004_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_SLT_done
.Lst16_postinc_004_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_004_SLT_done:
    brsge8 .Lst16_postinc_004_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_004_SGE_done
.Lst16_postinc_004_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_004_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0694
    ldi8 r5, 0x5d
    st8 [r4], r5
    ldi16 r4, 0x0695
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x0697
    ldi8 r5, 0xe5
    st8 [r4], r5

    ; POST pointer r4, data r2, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x1ff5
    push16 r5
    pop16 r2
    ldi16 r5, 0x6481
    push16 r5
    pop16 r0
    ldi16 r4, 0x0695
    st16 [r4+], r2
    push16 r2
    push16 r4
    push16 r0
    ldi16 r4, 0x0694
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0696
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_005_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_EQ_done
.Lst16_postinc_005_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_005_EQ_done:
    brne8 .Lst16_postinc_005_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_NE_done
.Lst16_postinc_005_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_005_NE_done:
    brult8 .Lst16_postinc_005_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_ULT_done
.Lst16_postinc_005_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_005_ULT_done:
    bruge8 .Lst16_postinc_005_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_UGE_done
.Lst16_postinc_005_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_005_UGE_done:
    brslt8 .Lst16_postinc_005_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_SLT_done
.Lst16_postinc_005_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_005_SLT_done:
    brsge8 .Lst16_postinc_005_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_005_SGE_done
.Lst16_postinc_005_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_005_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0698
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0699
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x069b
    ldi8 r5, 0xed
    st8 [r4], r5

    ; POST pointer r4, data r3, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xa526
    push16 r5
    pop16 r3
    ldi16 r5, 0x64ce
    push16 r5
    pop16 r0
    ldi16 r4, 0x0699
    st16 [r4+], r3
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x0698
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x069a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_006_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_EQ_done
.Lst16_postinc_006_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_006_EQ_done:
    brne8 .Lst16_postinc_006_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_NE_done
.Lst16_postinc_006_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_006_NE_done:
    brult8 .Lst16_postinc_006_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_ULT_done
.Lst16_postinc_006_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_006_ULT_done:
    bruge8 .Lst16_postinc_006_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_UGE_done
.Lst16_postinc_006_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_006_UGE_done:
    brslt8 .Lst16_postinc_006_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_SLT_done
.Lst16_postinc_006_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_006_SLT_done:
    brsge8 .Lst16_postinc_006_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_006_SGE_done
.Lst16_postinc_006_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_006_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x069c
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x069d
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x069f
    ldi8 r5, 0xf4
    st8 [r4], r5

    ; POST pointer r4, data r3, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xd4a8
    push16 r5
    pop16 r3
    ldi16 r5, 0x651b
    push16 r5
    pop16 r0
    ldi16 r4, 0x069d
    st16 [r4+], r3
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x069c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x069e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_007_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_EQ_done
.Lst16_postinc_007_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_007_EQ_done:
    brne8 .Lst16_postinc_007_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_NE_done
.Lst16_postinc_007_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_007_NE_done:
    brult8 .Lst16_postinc_007_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_ULT_done
.Lst16_postinc_007_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_007_ULT_done:
    bruge8 .Lst16_postinc_007_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_UGE_done
.Lst16_postinc_007_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_007_UGE_done:
    brslt8 .Lst16_postinc_007_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_SLT_done
.Lst16_postinc_007_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_007_SLT_done:
    brsge8 .Lst16_postinc_007_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_007_SGE_done
.Lst16_postinc_007_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_007_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a0
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x06a1
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x06a3
    ldi8 r5, 0xfc
    st8 [r4], r5

    ; POST pointer r4, data r4, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x6568
    push16 r5
    pop16 r0
    ldi16 r4, 0x06a1
    st16 [r4+], r4
    push16 r4
    push16 r4
    push16 r0
    ldi16 r4, 0x06a0
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06a2
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_008_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_EQ_done
.Lst16_postinc_008_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_008_EQ_done:
    brne8 .Lst16_postinc_008_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_NE_done
.Lst16_postinc_008_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_008_NE_done:
    brult8 .Lst16_postinc_008_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_ULT_done
.Lst16_postinc_008_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_008_ULT_done:
    bruge8 .Lst16_postinc_008_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_UGE_done
.Lst16_postinc_008_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_008_UGE_done:
    brslt8 .Lst16_postinc_008_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_SLT_done
.Lst16_postinc_008_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_008_SLT_done:
    brsge8 .Lst16_postinc_008_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_008_SGE_done
.Lst16_postinc_008_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_008_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a4
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x06a5
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x06a7
    ldi8 r5, 0x03
    st8 [r4], r5

    ; POST pointer r4, data r4, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x65b5
    push16 r5
    pop16 r0
    ldi16 r4, 0x06a5
    st16 [r4+], r4
    push16 r4
    push16 r4
    push16 r0
    ldi16 r4, 0x06a4
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06a6
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_009_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_EQ_done
.Lst16_postinc_009_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_009_EQ_done:
    brne8 .Lst16_postinc_009_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_NE_done
.Lst16_postinc_009_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_009_NE_done:
    brult8 .Lst16_postinc_009_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_ULT_done
.Lst16_postinc_009_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_009_ULT_done:
    bruge8 .Lst16_postinc_009_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_UGE_done
.Lst16_postinc_009_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_009_UGE_done:
    brslt8 .Lst16_postinc_009_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_SLT_done
.Lst16_postinc_009_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_009_SLT_done:
    brsge8 .Lst16_postinc_009_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_009_SGE_done
.Lst16_postinc_009_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_009_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a8
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x06a9
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x06ab
    ldi8 r5, 0x0b
    st8 [r4], r5

    ; POST pointer r4, data r5, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x3cea
    push16 r6
    pop16 r5
    ldi16 r6, 0x6602
    push16 r6
    pop16 r0
    ldi16 r4, 0x06a9
    st16 [r4+], r5
    push16 r5
    push16 r4
    push16 r0
    ldi16 r4, 0x06a8
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06aa
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_EQ_done
.Lst16_postinc_00a_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_EQ_done:
    brne8 .Lst16_postinc_00a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_NE_done
.Lst16_postinc_00a_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_NE_done:
    brult8 .Lst16_postinc_00a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_ULT_done
.Lst16_postinc_00a_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_ULT_done:
    bruge8 .Lst16_postinc_00a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_UGE_done
.Lst16_postinc_00a_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_UGE_done:
    brslt8 .Lst16_postinc_00a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_SLT_done
.Lst16_postinc_00a_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_SLT_done:
    brsge8 .Lst16_postinc_00a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00a_SGE_done
.Lst16_postinc_00a_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06ac
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x06ad
    ldi16 r5, 0x7fff
    st16 [r4], r5
    ldi16 r4, 0x06af
    ldi8 r5, 0x12
    st8 [r4], r5

    ; POST pointer r4, data r5, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x3be4
    push16 r6
    pop16 r5
    ldi16 r6, 0x664f
    push16 r6
    pop16 r0
    ldi16 r4, 0x06ad
    st16 [r4+], r5
    push16 r5
    push16 r4
    push16 r0
    ldi16 r4, 0x06ac
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06ae
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_EQ_done
.Lst16_postinc_00b_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_EQ_done:
    brne8 .Lst16_postinc_00b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_NE_done
.Lst16_postinc_00b_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_NE_done:
    brult8 .Lst16_postinc_00b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_ULT_done
.Lst16_postinc_00b_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_ULT_done:
    bruge8 .Lst16_postinc_00b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_UGE_done
.Lst16_postinc_00b_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_UGE_done:
    brslt8 .Lst16_postinc_00b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_SLT_done
.Lst16_postinc_00b_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_SLT_done:
    brsge8 .Lst16_postinc_00b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00b_SGE_done
.Lst16_postinc_00b_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b0
    ldi8 r5, 0x9c
    st8 [r4], r5
    ldi16 r4, 0x06b1
    ldi16 r5, 0x7fff
    st16 [r4], r5
    ldi16 r4, 0x06b3
    ldi8 r5, 0x1a
    st8 [r4], r5

    ; POST pointer r4, data r6, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xb5b3
    push16 r5
    pop16 r6
    ldi16 r5, 0x669c
    push16 r5
    pop16 r0
    ldi16 r4, 0x06b1
    st16 [r4+], r6
    push16 r6
    push16 r4
    push16 r0
    ldi16 r4, 0x06b0
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06b2
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_EQ_done
.Lst16_postinc_00c_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_EQ_done:
    brne8 .Lst16_postinc_00c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_NE_done
.Lst16_postinc_00c_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_NE_done:
    brult8 .Lst16_postinc_00c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_ULT_done
.Lst16_postinc_00c_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_ULT_done:
    bruge8 .Lst16_postinc_00c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_UGE_done
.Lst16_postinc_00c_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_UGE_done:
    brslt8 .Lst16_postinc_00c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_SLT_done
.Lst16_postinc_00c_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_SLT_done:
    brsge8 .Lst16_postinc_00c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00c_SGE_done
.Lst16_postinc_00c_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b4
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x06b5
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x06b7
    ldi8 r5, 0x21
    st8 [r4], r5

    ; POST pointer r4, data r6, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xf527
    push16 r5
    pop16 r6
    ldi16 r5, 0x66e9
    push16 r5
    pop16 r0
    ldi16 r4, 0x06b5
    st16 [r4+], r6
    push16 r6
    push16 r4
    push16 r0
    ldi16 r4, 0x06b4
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06b6
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_EQ_done
.Lst16_postinc_00d_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_EQ_done:
    brne8 .Lst16_postinc_00d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_NE_done
.Lst16_postinc_00d_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_NE_done:
    brult8 .Lst16_postinc_00d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_ULT_done
.Lst16_postinc_00d_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_ULT_done:
    bruge8 .Lst16_postinc_00d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_UGE_done
.Lst16_postinc_00d_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_UGE_done:
    brslt8 .Lst16_postinc_00d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_SLT_done
.Lst16_postinc_00d_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_SLT_done:
    brsge8 .Lst16_postinc_00d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00d_SGE_done
.Lst16_postinc_00d_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b8
    ldi8 r5, 0xae
    st8 [r4], r5
    ldi16 r4, 0x06b9
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x06bb
    ldi8 r5, 0x29
    st8 [r4], r5

    ; POST pointer r4, data r7, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x56af
    push16 r5
    pop16 r7
    ldi16 r5, 0x6736
    push16 r5
    pop16 r0
    ldi16 r4, 0x06b9
    st16 [r4+], r7
    push16 r7
    push16 r4
    push16 r0
    ldi16 r4, 0x06b8
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06ba
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_EQ_done
.Lst16_postinc_00e_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_EQ_done:
    brne8 .Lst16_postinc_00e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_NE_done
.Lst16_postinc_00e_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_NE_done:
    brult8 .Lst16_postinc_00e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_ULT_done
.Lst16_postinc_00e_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_ULT_done:
    bruge8 .Lst16_postinc_00e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_UGE_done
.Lst16_postinc_00e_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_UGE_done:
    brslt8 .Lst16_postinc_00e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_SLT_done
.Lst16_postinc_00e_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_SLT_done:
    brsge8 .Lst16_postinc_00e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00e_SGE_done
.Lst16_postinc_00e_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06bc
    ldi8 r5, 0xb7
    st8 [r4], r5
    ldi16 r4, 0x06bd
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x06bf
    ldi8 r5, 0x30
    st8 [r4], r5

    ; POST pointer r4, data r7, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x5c20
    push16 r5
    pop16 r7
    ldi16 r5, 0x6783
    push16 r5
    pop16 r0
    ldi16 r4, 0x06bd
    st16 [r4+], r7
    push16 r7
    push16 r4
    push16 r0
    ldi16 r4, 0x06bc
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06be
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_00f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_EQ_done
.Lst16_postinc_00f_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_EQ_done:
    brne8 .Lst16_postinc_00f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_NE_done
.Lst16_postinc_00f_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_NE_done:
    brult8 .Lst16_postinc_00f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_ULT_done
.Lst16_postinc_00f_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_ULT_done:
    bruge8 .Lst16_postinc_00f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_UGE_done
.Lst16_postinc_00f_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_UGE_done:
    brslt8 .Lst16_postinc_00f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_SLT_done
.Lst16_postinc_00f_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_SLT_done:
    brsge8 .Lst16_postinc_00f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_00f_SGE_done
.Lst16_postinc_00f_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_00f_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0600
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x0603
    ldi8 r5, 0x30
    st8 [r4], r5

    ; POST pointer r5, data r0, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1cef
    push16 r4
    pop16 r0
    ldi16 r4, 0x68d1
    push16 r4
    pop16 r1
    ldi16 r5, 0x0601
    st16 [r5+], r0
    push16 r0
    push16 r5
    push16 r1
    ldi16 r4, 0x0600
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0602
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_010_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_EQ_done
.Lst16_postinc_010_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_010_EQ_done:
    brne8 .Lst16_postinc_010_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_NE_done
.Lst16_postinc_010_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_010_NE_done:
    brult8 .Lst16_postinc_010_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_ULT_done
.Lst16_postinc_010_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_010_ULT_done:
    bruge8 .Lst16_postinc_010_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_UGE_done
.Lst16_postinc_010_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_010_UGE_done:
    brslt8 .Lst16_postinc_010_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_SLT_done
.Lst16_postinc_010_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_010_SLT_done:
    brsge8 .Lst16_postinc_010_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_010_SGE_done
.Lst16_postinc_010_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_010_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0604
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x0605
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x0607
    ldi8 r5, 0x37
    st8 [r4], r5

    ; POST pointer r5, data r0, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xe941
    push16 r4
    pop16 r0
    ldi16 r4, 0x691e
    push16 r4
    pop16 r1
    ldi16 r5, 0x0605
    st16 [r5+], r0
    push16 r0
    push16 r5
    push16 r1
    ldi16 r4, 0x0604
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0606
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_011_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_EQ_done
.Lst16_postinc_011_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_011_EQ_done:
    brne8 .Lst16_postinc_011_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_NE_done
.Lst16_postinc_011_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_011_NE_done:
    brult8 .Lst16_postinc_011_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_ULT_done
.Lst16_postinc_011_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_011_ULT_done:
    bruge8 .Lst16_postinc_011_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_UGE_done
.Lst16_postinc_011_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_011_UGE_done:
    brslt8 .Lst16_postinc_011_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_SLT_done
.Lst16_postinc_011_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_011_SLT_done:
    brsge8 .Lst16_postinc_011_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_011_SGE_done
.Lst16_postinc_011_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_011_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0608
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x0609
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x060b
    ldi8 r5, 0x3f
    st8 [r4], r5

    ; POST pointer r5, data r1, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xca28
    push16 r4
    pop16 r1
    ldi16 r4, 0x686a
    push16 r4
    pop16 r0
    ldi16 r5, 0x0609
    st16 [r5+], r1
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x0608
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x060a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_012_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_EQ_done
.Lst16_postinc_012_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_012_EQ_done:
    brne8 .Lst16_postinc_012_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_NE_done
.Lst16_postinc_012_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_012_NE_done:
    brult8 .Lst16_postinc_012_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_ULT_done
.Lst16_postinc_012_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_012_ULT_done:
    bruge8 .Lst16_postinc_012_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_UGE_done
.Lst16_postinc_012_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_012_UGE_done:
    brslt8 .Lst16_postinc_012_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_SLT_done
.Lst16_postinc_012_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_012_SLT_done:
    brsge8 .Lst16_postinc_012_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_012_SGE_done
.Lst16_postinc_012_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_012_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x060c
    ldi8 r5, 0xdc
    st8 [r4], r5
    ldi16 r4, 0x060d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x060f
    ldi8 r5, 0x46
    st8 [r4], r5

    ; POST pointer r5, data r1, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x75a3
    push16 r4
    pop16 r1
    ldi16 r4, 0x68b7
    push16 r4
    pop16 r0
    ldi16 r5, 0x060d
    st16 [r5+], r1
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x060c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x060e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_013_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_EQ_done
.Lst16_postinc_013_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_013_EQ_done:
    brne8 .Lst16_postinc_013_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_NE_done
.Lst16_postinc_013_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_013_NE_done:
    brult8 .Lst16_postinc_013_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_ULT_done
.Lst16_postinc_013_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_013_ULT_done:
    bruge8 .Lst16_postinc_013_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_UGE_done
.Lst16_postinc_013_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_013_UGE_done:
    brslt8 .Lst16_postinc_013_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_SLT_done
.Lst16_postinc_013_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_013_SLT_done:
    brsge8 .Lst16_postinc_013_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_013_SGE_done
.Lst16_postinc_013_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_013_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0610
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x0611
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x0613
    ldi8 r5, 0x4e
    st8 [r4], r5

    ; POST pointer r5, data r2, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7b2b
    push16 r4
    pop16 r2
    ldi16 r4, 0x6904
    push16 r4
    pop16 r0
    ldi16 r5, 0x0611
    st16 [r5+], r2
    push16 r2
    push16 r5
    push16 r0
    ldi16 r4, 0x0610
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0612
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_014_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_EQ_done
.Lst16_postinc_014_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_014_EQ_done:
    brne8 .Lst16_postinc_014_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_NE_done
.Lst16_postinc_014_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_014_NE_done:
    brult8 .Lst16_postinc_014_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_ULT_done
.Lst16_postinc_014_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_014_ULT_done:
    bruge8 .Lst16_postinc_014_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_UGE_done
.Lst16_postinc_014_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_014_UGE_done:
    brslt8 .Lst16_postinc_014_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_SLT_done
.Lst16_postinc_014_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_014_SLT_done:
    brsge8 .Lst16_postinc_014_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_014_SGE_done
.Lst16_postinc_014_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_014_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0614
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x0615
    ldi16 r5, 0xa55a
    st16 [r4], r5
    ldi16 r4, 0x0617
    ldi8 r5, 0x55
    st8 [r4], r5

    ; POST pointer r5, data r2, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8305
    push16 r4
    pop16 r2
    ldi16 r4, 0x6951
    push16 r4
    pop16 r0
    ldi16 r5, 0x0615
    st16 [r5+], r2
    push16 r2
    push16 r5
    push16 r0
    ldi16 r4, 0x0614
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0616
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_015_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_EQ_done
.Lst16_postinc_015_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_015_EQ_done:
    brne8 .Lst16_postinc_015_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_NE_done
.Lst16_postinc_015_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_015_NE_done:
    brult8 .Lst16_postinc_015_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_ULT_done
.Lst16_postinc_015_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_015_ULT_done:
    bruge8 .Lst16_postinc_015_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_UGE_done
.Lst16_postinc_015_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_015_UGE_done:
    brslt8 .Lst16_postinc_015_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_SLT_done
.Lst16_postinc_015_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_015_SLT_done:
    brsge8 .Lst16_postinc_015_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_015_SGE_done
.Lst16_postinc_015_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_015_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0618
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x0619
    ldi16 r5, 0xa55a
    st16 [r4], r5
    ldi16 r4, 0x061b
    ldi8 r5, 0x5d
    st8 [r4], r5

    ; POST pointer r5, data r3, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0836
    push16 r4
    pop16 r3
    ldi16 r4, 0x699e
    push16 r4
    pop16 r0
    ldi16 r5, 0x0619
    st16 [r5+], r3
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x0618
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x061a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_016_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_EQ_done
.Lst16_postinc_016_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_016_EQ_done:
    brne8 .Lst16_postinc_016_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_NE_done
.Lst16_postinc_016_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_016_NE_done:
    brult8 .Lst16_postinc_016_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_ULT_done
.Lst16_postinc_016_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_016_ULT_done:
    bruge8 .Lst16_postinc_016_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_UGE_done
.Lst16_postinc_016_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_016_UGE_done:
    brslt8 .Lst16_postinc_016_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_SLT_done
.Lst16_postinc_016_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_016_SLT_done:
    brsge8 .Lst16_postinc_016_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_016_SGE_done
.Lst16_postinc_016_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_016_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x061c
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x061d
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x061f
    ldi8 r5, 0x64
    st8 [r4], r5

    ; POST pointer r5, data r3, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7198
    push16 r4
    pop16 r3
    ldi16 r4, 0x69eb
    push16 r4
    pop16 r0
    ldi16 r5, 0x061d
    st16 [r5+], r3
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x061c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x061e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_017_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_EQ_done
.Lst16_postinc_017_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_017_EQ_done:
    brne8 .Lst16_postinc_017_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_NE_done
.Lst16_postinc_017_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_017_NE_done:
    brult8 .Lst16_postinc_017_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_ULT_done
.Lst16_postinc_017_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_017_ULT_done:
    bruge8 .Lst16_postinc_017_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_UGE_done
.Lst16_postinc_017_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_017_UGE_done:
    brslt8 .Lst16_postinc_017_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_SLT_done
.Lst16_postinc_017_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_017_SLT_done:
    brsge8 .Lst16_postinc_017_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_017_SGE_done
.Lst16_postinc_017_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_017_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0620
    ldi8 r5, 0x09
    st8 [r4], r5
    ldi16 r4, 0x0621
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x0623
    ldi8 r5, 0x6c
    st8 [r4], r5

    ; POST pointer r5, data r4, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r6, 0x9498
    push16 r6
    pop16 r4
    ldi16 r6, 0x6a38
    push16 r6
    pop16 r0
    ldi16 r5, 0x0621
    st16 [r5+], r4
    push16 r4
    push16 r5
    push16 r0
    ldi16 r4, 0x0620
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0622
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_018_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_EQ_done
.Lst16_postinc_018_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_018_EQ_done:
    brne8 .Lst16_postinc_018_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_NE_done
.Lst16_postinc_018_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_018_NE_done:
    brult8 .Lst16_postinc_018_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_ULT_done
.Lst16_postinc_018_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_018_ULT_done:
    bruge8 .Lst16_postinc_018_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_UGE_done
.Lst16_postinc_018_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_018_UGE_done:
    brslt8 .Lst16_postinc_018_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_SLT_done
.Lst16_postinc_018_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_018_SLT_done:
    brsge8 .Lst16_postinc_018_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_018_SGE_done
.Lst16_postinc_018_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_018_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0624
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x0625
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x0627
    ldi8 r5, 0x73
    st8 [r4], r5

    ; POST pointer r5, data r4, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r6, 0x9ac8
    push16 r6
    pop16 r4
    ldi16 r6, 0x6a85
    push16 r6
    pop16 r0
    ldi16 r5, 0x0625
    st16 [r5+], r4
    push16 r4
    push16 r5
    push16 r0
    ldi16 r4, 0x0624
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0626
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_019_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_EQ_done
.Lst16_postinc_019_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_019_EQ_done:
    brne8 .Lst16_postinc_019_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_NE_done
.Lst16_postinc_019_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_019_NE_done:
    brult8 .Lst16_postinc_019_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_ULT_done
.Lst16_postinc_019_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_019_ULT_done:
    bruge8 .Lst16_postinc_019_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_UGE_done
.Lst16_postinc_019_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_019_UGE_done:
    brslt8 .Lst16_postinc_019_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_SLT_done
.Lst16_postinc_019_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_019_SLT_done:
    brsge8 .Lst16_postinc_019_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_019_SGE_done
.Lst16_postinc_019_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_019_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0628
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x0629
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x062b
    ldi8 r5, 0x7b
    st8 [r4], r5

    ; POST pointer r5, data r5, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x6ad2
    push16 r4
    pop16 r0
    ldi16 r5, 0x0629
    st16 [r5+], r5
    push16 r5
    push16 r5
    push16 r0
    ldi16 r4, 0x0628
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x062a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_EQ_done
.Lst16_postinc_01a_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_EQ_done:
    brne8 .Lst16_postinc_01a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_NE_done
.Lst16_postinc_01a_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_NE_done:
    brult8 .Lst16_postinc_01a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_ULT_done
.Lst16_postinc_01a_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_ULT_done:
    bruge8 .Lst16_postinc_01a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_UGE_done
.Lst16_postinc_01a_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_UGE_done:
    brslt8 .Lst16_postinc_01a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_SLT_done
.Lst16_postinc_01a_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_SLT_done:
    brsge8 .Lst16_postinc_01a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01a_SGE_done
.Lst16_postinc_01a_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x062c
    ldi8 r5, 0x24
    st8 [r4], r5
    ldi16 r4, 0x062d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x062f
    ldi8 r5, 0x82
    st8 [r4], r5

    ; POST pointer r5, data r5, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6b1f
    push16 r4
    pop16 r0
    ldi16 r5, 0x062d
    st16 [r5+], r5
    push16 r5
    push16 r5
    push16 r0
    ldi16 r4, 0x062c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x062e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_EQ_done
.Lst16_postinc_01b_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_EQ_done:
    brne8 .Lst16_postinc_01b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_NE_done
.Lst16_postinc_01b_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_NE_done:
    brult8 .Lst16_postinc_01b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_ULT_done
.Lst16_postinc_01b_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_ULT_done:
    bruge8 .Lst16_postinc_01b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_UGE_done
.Lst16_postinc_01b_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_UGE_done:
    brslt8 .Lst16_postinc_01b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_SLT_done
.Lst16_postinc_01b_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_SLT_done:
    brsge8 .Lst16_postinc_01b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01b_SGE_done
.Lst16_postinc_01b_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0630
    ldi8 r5, 0x2d
    st8 [r4], r5
    ldi16 r4, 0x0631
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x0633
    ldi8 r5, 0x8a
    st8 [r4], r5

    ; POST pointer r5, data r6, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x52a3
    push16 r4
    pop16 r6
    ldi16 r4, 0x6b6c
    push16 r4
    pop16 r0
    ldi16 r5, 0x0631
    st16 [r5+], r6
    push16 r6
    push16 r5
    push16 r0
    ldi16 r4, 0x0630
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0632
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_EQ_done
.Lst16_postinc_01c_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_EQ_done:
    brne8 .Lst16_postinc_01c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_NE_done
.Lst16_postinc_01c_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_NE_done:
    brult8 .Lst16_postinc_01c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_ULT_done
.Lst16_postinc_01c_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_ULT_done:
    bruge8 .Lst16_postinc_01c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_UGE_done
.Lst16_postinc_01c_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_UGE_done:
    brslt8 .Lst16_postinc_01c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_SLT_done
.Lst16_postinc_01c_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_SLT_done:
    brsge8 .Lst16_postinc_01c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01c_SGE_done
.Lst16_postinc_01c_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0634
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x0635
    ldi16 r5, 0xa55a
    st16 [r4], r5
    ldi16 r4, 0x0637
    ldi8 r5, 0x91
    st8 [r4], r5

    ; POST pointer r5, data r6, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x16d7
    push16 r4
    pop16 r6
    ldi16 r4, 0x6bb9
    push16 r4
    pop16 r0
    ldi16 r5, 0x0635
    st16 [r5+], r6
    push16 r6
    push16 r5
    push16 r0
    ldi16 r4, 0x0634
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0636
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_EQ_done
.Lst16_postinc_01d_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_EQ_done:
    brne8 .Lst16_postinc_01d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_NE_done
.Lst16_postinc_01d_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_NE_done:
    brult8 .Lst16_postinc_01d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_ULT_done
.Lst16_postinc_01d_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_ULT_done:
    bruge8 .Lst16_postinc_01d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_UGE_done
.Lst16_postinc_01d_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_UGE_done:
    brslt8 .Lst16_postinc_01d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_SLT_done
.Lst16_postinc_01d_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_SLT_done:
    brsge8 .Lst16_postinc_01d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01d_SGE_done
.Lst16_postinc_01d_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0638
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x0639
    ldi16 r5, 0xa55a
    st16 [r4], r5
    ldi16 r4, 0x063b
    ldi8 r5, 0x99
    st8 [r4], r5

    ; POST pointer r5, data r7, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb9bf
    push16 r4
    pop16 r7
    ldi16 r4, 0x6c06
    push16 r4
    pop16 r0
    ldi16 r5, 0x0639
    st16 [r5+], r7
    push16 r7
    push16 r5
    push16 r0
    ldi16 c0, 0x0638
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x063a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_EQ_done
.Lst16_postinc_01e_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_EQ_done:
    brne8 .Lst16_postinc_01e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_NE_done
.Lst16_postinc_01e_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_NE_done:
    brult8 .Lst16_postinc_01e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_ULT_done
.Lst16_postinc_01e_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_ULT_done:
    bruge8 .Lst16_postinc_01e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_UGE_done
.Lst16_postinc_01e_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_UGE_done:
    brslt8 .Lst16_postinc_01e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_SLT_done
.Lst16_postinc_01e_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_SLT_done:
    brsge8 .Lst16_postinc_01e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01e_SGE_done
.Lst16_postinc_01e_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x063c
    ldi8 r5, 0x48
    st8 [c0], r5
    ldi16 c0, 0x063d
    ldi16 r5, 0x0001
    st16 [c0], r5
    ldi16 c0, 0x063f
    ldi8 r5, 0xa0
    st8 [c0], r5

    ; POST pointer r5, data r7, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0xbf10
    push16 r4
    pop16 r7
    ldi16 c0, 0x6c53
    push16 r4
    pop16 r0
    ldi16 r5, 0x063d
    st16 [r5+], r7
    push16 r7
    push16 r5
    push16 r0
    ldi16 c0, 0x063c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x063e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_01f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_EQ_done
.Lst16_postinc_01f_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_EQ_done:
    brne8 .Lst16_postinc_01f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_NE_done
.Lst16_postinc_01f_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_NE_done:
    brult8 .Lst16_postinc_01f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_ULT_done
.Lst16_postinc_01f_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_ULT_done:
    bruge8 .Lst16_postinc_01f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_UGE_done
.Lst16_postinc_01f_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_UGE_done:
    brslt8 .Lst16_postinc_01f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_SLT_done
.Lst16_postinc_01f_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_SLT_done:
    brsge8 .Lst16_postinc_01f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_01f_SGE_done
.Lst16_postinc_01f_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_01f_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0640
    ldi8 r5, 0x52
    st8 [c0], r5
    ldi16 c0, 0x0641
    ldi16 r5, 0x00ff
    st16 [c0], r5
    ldi16 c0, 0x0643
    ldi8 r5, 0xa0
    st8 [c0], r5

    ; POST pointer r6, data r0, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0xb9df
    push16 r4
    pop16 r0
    ldi16 c0, 0x6da1
    push16 r4
    pop16 r1
    ldi16 r6, 0x0641
    st16 [r6+], r0
    push16 r0
    push16 r6
    push16 r1
    ldi16 c0, 0x0640
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0642
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_020_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_EQ_done
.Lst16_postinc_020_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_020_EQ_done:
    brne8 .Lst16_postinc_020_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_NE_done
.Lst16_postinc_020_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_020_NE_done:
    brult8 .Lst16_postinc_020_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_ULT_done
.Lst16_postinc_020_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_020_ULT_done:
    bruge8 .Lst16_postinc_020_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_UGE_done
.Lst16_postinc_020_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_020_UGE_done:
    brslt8 .Lst16_postinc_020_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_SLT_done
.Lst16_postinc_020_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_020_SLT_done:
    brsge8 .Lst16_postinc_020_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_020_SGE_done
.Lst16_postinc_020_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_020_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0644
    ldi8 r5, 0x5b
    st8 [c0], r5
    ldi16 c0, 0x0645
    ldi16 r5, 0x7fff
    st16 [c0], r5
    ldi16 c0, 0x0647
    ldi8 r5, 0xa7
    st8 [c0], r5

    ; POST pointer r6, data r0, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x4c51
    push16 r4
    pop16 r0
    ldi16 c0, 0x6dee
    push16 r4
    pop16 r1
    ldi16 r6, 0x0645
    st16 [r6+], r0
    push16 r0
    push16 r6
    push16 r1
    ldi16 c0, 0x0644
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0646
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_021_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_EQ_done
.Lst16_postinc_021_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_021_EQ_done:
    brne8 .Lst16_postinc_021_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_NE_done
.Lst16_postinc_021_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_021_NE_done:
    brult8 .Lst16_postinc_021_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_ULT_done
.Lst16_postinc_021_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_021_ULT_done:
    bruge8 .Lst16_postinc_021_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_UGE_done
.Lst16_postinc_021_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_021_UGE_done:
    brslt8 .Lst16_postinc_021_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_SLT_done
.Lst16_postinc_021_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_021_SLT_done:
    brsge8 .Lst16_postinc_021_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_021_SGE_done
.Lst16_postinc_021_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_021_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0648
    ldi8 r5, 0x64
    st8 [c0], r5
    ldi16 c0, 0x0649
    ldi16 r5, 0x7fff
    st16 [c0], r5
    ldi16 c0, 0x064b
    ldi8 r5, 0xaf
    st8 [c0], r5

    ; POST pointer r6, data r1, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x77d8
    push16 r4
    pop16 r1
    ldi16 c0, 0x6d3a
    push16 r4
    pop16 r0
    ldi16 r6, 0x0649
    st16 [r6+], r1
    push16 r1
    push16 r6
    push16 r0
    ldi16 c0, 0x0648
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x064a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_022_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_EQ_done
.Lst16_postinc_022_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_022_EQ_done:
    brne8 .Lst16_postinc_022_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_NE_done
.Lst16_postinc_022_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_022_NE_done:
    brult8 .Lst16_postinc_022_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_ULT_done
.Lst16_postinc_022_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_022_ULT_done:
    bruge8 .Lst16_postinc_022_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_UGE_done
.Lst16_postinc_022_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_022_UGE_done:
    brslt8 .Lst16_postinc_022_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_SLT_done
.Lst16_postinc_022_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_022_SLT_done:
    brsge8 .Lst16_postinc_022_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_022_SGE_done
.Lst16_postinc_022_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_022_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x064c
    ldi8 r5, 0x6d
    st8 [c0], r5
    ldi16 c0, 0x064d
    ldi16 r5, 0xffff
    st16 [c0], r5
    ldi16 c0, 0x064f
    ldi8 r5, 0xb6
    st8 [c0], r5

    ; POST pointer r6, data r1, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0xd8b3
    push16 r4
    pop16 r1
    ldi16 c0, 0x6d87
    push16 r4
    pop16 r0
    ldi16 r6, 0x064d
    st16 [r6+], r1
    push16 r1
    push16 r6
    push16 r0
    ldi16 c0, 0x064c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x064e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_023_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_EQ_done
.Lst16_postinc_023_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_023_EQ_done:
    brne8 .Lst16_postinc_023_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_NE_done
.Lst16_postinc_023_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_023_NE_done:
    brult8 .Lst16_postinc_023_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_ULT_done
.Lst16_postinc_023_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_023_ULT_done:
    bruge8 .Lst16_postinc_023_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_UGE_done
.Lst16_postinc_023_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_023_UGE_done:
    brslt8 .Lst16_postinc_023_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_SLT_done
.Lst16_postinc_023_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_023_SLT_done:
    brsge8 .Lst16_postinc_023_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_023_SGE_done
.Lst16_postinc_023_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_023_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0650
    ldi8 r5, 0x76
    st8 [c0], r5
    ldi16 c0, 0x0651
    ldi16 r5, 0xffff
    st16 [c0], r5
    ldi16 c0, 0x0653
    ldi8 r5, 0xbe
    st8 [c0], r5

    ; POST pointer r6, data r2, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0xde1b
    push16 r4
    pop16 r2
    ldi16 c0, 0x6dd4
    push16 r4
    pop16 r0
    ldi16 r6, 0x0651
    st16 [r6+], r2
    push16 r2
    push16 r6
    push16 r0
    ldi16 c0, 0x0650
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0652
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_024_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_EQ_done
.Lst16_postinc_024_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_024_EQ_done:
    brne8 .Lst16_postinc_024_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_NE_done
.Lst16_postinc_024_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_024_NE_done:
    brult8 .Lst16_postinc_024_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_ULT_done
.Lst16_postinc_024_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_024_ULT_done:
    bruge8 .Lst16_postinc_024_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_UGE_done
.Lst16_postinc_024_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_024_UGE_done:
    brslt8 .Lst16_postinc_024_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_SLT_done
.Lst16_postinc_024_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_024_SLT_done:
    brsge8 .Lst16_postinc_024_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_024_SGE_done
.Lst16_postinc_024_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_024_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0654
    ldi8 r5, 0x7f
    st8 [c0], r5
    ldi16 c0, 0x0655
    ldi16 r5, 0x0000
    st16 [c0], r5
    ldi16 c0, 0x0657
    ldi8 r5, 0xc5
    st8 [c0], r5

    ; POST pointer r6, data r2, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0xe415
    push16 r4
    pop16 r2
    ldi16 c0, 0x6e21
    push16 r4
    pop16 r0
    ldi16 r6, 0x0655
    st16 [r6+], r2
    push16 r2
    push16 r6
    push16 r0
    ldi16 c0, 0x0654
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0656
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_025_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_EQ_done
.Lst16_postinc_025_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_025_EQ_done:
    brne8 .Lst16_postinc_025_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_NE_done
.Lst16_postinc_025_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_025_NE_done:
    brult8 .Lst16_postinc_025_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_ULT_done
.Lst16_postinc_025_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_025_ULT_done:
    bruge8 .Lst16_postinc_025_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_UGE_done
.Lst16_postinc_025_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_025_UGE_done:
    brslt8 .Lst16_postinc_025_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_SLT_done
.Lst16_postinc_025_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_025_SLT_done:
    brsge8 .Lst16_postinc_025_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_025_SGE_done
.Lst16_postinc_025_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_025_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0658
    ldi8 r5, 0x88
    st8 [c0], r5
    ldi16 c0, 0x0659
    ldi16 r5, 0x0000
    st16 [c0], r5
    ldi16 c0, 0x065b
    ldi8 r5, 0xcd
    st8 [c0], r5

    ; POST pointer r6, data r3, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x6b46
    push16 r4
    pop16 r3
    ldi16 c0, 0x6e6e
    push16 r4
    pop16 r0
    ldi16 r6, 0x0659
    st16 [r6+], r3
    push16 r3
    push16 r6
    push16 r0
    ldi16 c0, 0x0658
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x065a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_026_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_EQ_done
.Lst16_postinc_026_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_026_EQ_done:
    brne8 .Lst16_postinc_026_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_NE_done
.Lst16_postinc_026_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_026_NE_done:
    brult8 .Lst16_postinc_026_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_ULT_done
.Lst16_postinc_026_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_026_ULT_done:
    bruge8 .Lst16_postinc_026_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_UGE_done
.Lst16_postinc_026_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_026_UGE_done:
    brslt8 .Lst16_postinc_026_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_SLT_done
.Lst16_postinc_026_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_026_SLT_done:
    brsge8 .Lst16_postinc_026_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_026_SGE_done
.Lst16_postinc_026_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_026_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x065c
    ldi8 r5, 0x91
    st8 [c0], r5
    ldi16 c0, 0x065d
    ldi16 r5, 0x00ff
    st16 [c0], r5
    ldi16 c0, 0x065f
    ldi8 r5, 0xd4
    st8 [c0], r5

    ; POST pointer r6, data r3, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0e88
    push16 r4
    pop16 r3
    ldi16 c0, 0x6ebb
    push16 r4
    pop16 r0
    ldi16 r6, 0x065d
    st16 [r6+], r3
    push16 r3
    push16 r6
    push16 r0
    ldi16 c0, 0x065c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x065e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_027_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_EQ_done
.Lst16_postinc_027_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_027_EQ_done:
    brne8 .Lst16_postinc_027_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_NE_done
.Lst16_postinc_027_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_027_NE_done:
    brult8 .Lst16_postinc_027_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_ULT_done
.Lst16_postinc_027_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_027_ULT_done:
    bruge8 .Lst16_postinc_027_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_UGE_done
.Lst16_postinc_027_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_027_UGE_done:
    brslt8 .Lst16_postinc_027_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_SLT_done
.Lst16_postinc_027_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_027_SLT_done:
    brsge8 .Lst16_postinc_027_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_027_SGE_done
.Lst16_postinc_027_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_027_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0660
    ldi8 r5, 0x9a
    st8 [c0], r5
    ldi16 c0, 0x0661
    ldi16 r5, 0x00ff
    st16 [c0], r5
    ldi16 c0, 0x0663
    ldi8 r5, 0xdc
    st8 [c0], r5

    ; POST pointer r6, data r4, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xf7a8
    push16 r5
    pop16 r4
    ldi16 r5, 0x6f08
    push16 r5
    pop16 r0
    ldi16 r6, 0x0661
    st16 [r6+], r4
    push16 r4
    push16 r6
    push16 r0
    ldi16 c0, 0x0660
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0662
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_028_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_EQ_done
.Lst16_postinc_028_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_028_EQ_done:
    brne8 .Lst16_postinc_028_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_NE_done
.Lst16_postinc_028_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_028_NE_done:
    brult8 .Lst16_postinc_028_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_ULT_done
.Lst16_postinc_028_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_028_ULT_done:
    bruge8 .Lst16_postinc_028_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_UGE_done
.Lst16_postinc_028_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_028_UGE_done:
    brslt8 .Lst16_postinc_028_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_SLT_done
.Lst16_postinc_028_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_028_SLT_done:
    brsge8 .Lst16_postinc_028_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_028_SGE_done
.Lst16_postinc_028_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_028_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0664
    ldi8 r5, 0xa3
    st8 [c0], r5
    ldi16 c0, 0x0665
    ldi16 r5, 0x7fff
    st16 [c0], r5
    ldi16 c0, 0x0667
    ldi8 r5, 0xe3
    st8 [c0], r5

    ; POST pointer r6, data r4, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xfdd8
    push16 r5
    pop16 r4
    ldi16 r5, 0x6f55
    push16 r5
    pop16 r0
    ldi16 r6, 0x0665
    st16 [r6+], r4
    push16 r4
    push16 r6
    push16 r0
    ldi16 c0, 0x0664
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0666
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_029_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_EQ_done
.Lst16_postinc_029_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_029_EQ_done:
    brne8 .Lst16_postinc_029_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_NE_done
.Lst16_postinc_029_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_029_NE_done:
    brult8 .Lst16_postinc_029_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_ULT_done
.Lst16_postinc_029_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_029_ULT_done:
    bruge8 .Lst16_postinc_029_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_UGE_done
.Lst16_postinc_029_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_029_UGE_done:
    brslt8 .Lst16_postinc_029_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_SLT_done
.Lst16_postinc_029_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_029_SLT_done:
    brsge8 .Lst16_postinc_029_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_029_SGE_done
.Lst16_postinc_029_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_029_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0668
    ldi8 r5, 0xac
    st8 [c0], r5
    ldi16 c0, 0x0669
    ldi16 r5, 0x7fff
    st16 [c0], r5
    ldi16 c0, 0x066b
    ldi8 r5, 0xeb
    st8 [c0], r5

    ; POST pointer r6, data r5, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x050a
    push16 r4
    pop16 r5
    ldi16 c0, 0x6fa2
    push16 r4
    pop16 r0
    ldi16 r6, 0x0669
    st16 [r6+], r5
    push16 r5
    push16 r6
    push16 r0
    ldi16 c0, 0x0668
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x066a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_EQ_done
.Lst16_postinc_02a_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_EQ_done:
    brne8 .Lst16_postinc_02a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_NE_done
.Lst16_postinc_02a_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_NE_done:
    brult8 .Lst16_postinc_02a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_ULT_done
.Lst16_postinc_02a_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_ULT_done:
    bruge8 .Lst16_postinc_02a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_UGE_done
.Lst16_postinc_02a_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_UGE_done:
    brslt8 .Lst16_postinc_02a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_SLT_done
.Lst16_postinc_02a_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_SLT_done:
    brsge8 .Lst16_postinc_02a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02a_SGE_done
.Lst16_postinc_02a_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x066c
    ldi8 r5, 0xb5
    st8 [c0], r5
    ldi16 c0, 0x066d
    ldi16 r5, 0xffff
    st16 [c0], r5
    ldi16 c0, 0x066f
    ldi8 r5, 0xf2
    st8 [c0], r5

    ; POST pointer r6, data r5, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x75c4
    push16 r4
    pop16 r5
    ldi16 c0, 0x6fef
    push16 r4
    pop16 r0
    ldi16 r6, 0x066d
    st16 [r6+], r5
    push16 r5
    push16 r6
    push16 r0
    ldi16 c0, 0x066c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x066e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_EQ_done
.Lst16_postinc_02b_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_EQ_done:
    brne8 .Lst16_postinc_02b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_NE_done
.Lst16_postinc_02b_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_NE_done:
    brult8 .Lst16_postinc_02b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_ULT_done
.Lst16_postinc_02b_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_ULT_done:
    bruge8 .Lst16_postinc_02b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_UGE_done
.Lst16_postinc_02b_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_UGE_done:
    brslt8 .Lst16_postinc_02b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_SLT_done
.Lst16_postinc_02b_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_SLT_done:
    brsge8 .Lst16_postinc_02b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02b_SGE_done
.Lst16_postinc_02b_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0670
    ldi8 r5, 0xbe
    st8 [c0], r5
    ldi16 c0, 0x0671
    ldi16 r5, 0xffff
    st16 [c0], r5
    ldi16 c0, 0x0673
    ldi8 r5, 0xfa
    st8 [c0], r5

    ; POST pointer r6, data r6, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x703c
    push16 r4
    pop16 r0
    ldi16 r6, 0x0671
    st16 [r6+], r6
    push16 r6
    push16 r6
    push16 r0
    ldi16 c0, 0x0670
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0672
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_EQ_done
.Lst16_postinc_02c_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_EQ_done:
    brne8 .Lst16_postinc_02c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_NE_done
.Lst16_postinc_02c_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_NE_done:
    brult8 .Lst16_postinc_02c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_ULT_done
.Lst16_postinc_02c_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_ULT_done:
    bruge8 .Lst16_postinc_02c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_UGE_done
.Lst16_postinc_02c_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_UGE_done:
    brslt8 .Lst16_postinc_02c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_SLT_done
.Lst16_postinc_02c_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_SLT_done:
    brsge8 .Lst16_postinc_02c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02c_SGE_done
.Lst16_postinc_02c_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0674
    ldi8 r5, 0xc7
    st8 [c0], r5
    ldi16 c0, 0x0675
    ldi16 r5, 0x0000
    st16 [c0], r5
    ldi16 c0, 0x0677
    ldi8 r5, 0x01
    st8 [c0], r5

    ; POST pointer r6, data r6, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x7089
    push16 r4
    pop16 r0
    ldi16 r6, 0x0675
    st16 [r6+], r6
    push16 r6
    push16 r6
    push16 r0
    ldi16 c0, 0x0674
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0676
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_EQ_done
.Lst16_postinc_02d_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_EQ_done:
    brne8 .Lst16_postinc_02d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_NE_done
.Lst16_postinc_02d_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_NE_done:
    brult8 .Lst16_postinc_02d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_ULT_done
.Lst16_postinc_02d_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_ULT_done:
    bruge8 .Lst16_postinc_02d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_UGE_done
.Lst16_postinc_02d_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_UGE_done:
    brslt8 .Lst16_postinc_02d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_SLT_done
.Lst16_postinc_02d_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_SLT_done:
    brsge8 .Lst16_postinc_02d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02d_SGE_done
.Lst16_postinc_02d_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0678
    ldi8 r5, 0xd0
    st8 [c0], r5
    ldi16 c0, 0x0679
    ldi16 r5, 0x0000
    st16 [c0], r5
    ldi16 c0, 0x067b
    ldi8 r5, 0x09
    st8 [c0], r5

    ; POST pointer r6, data r7, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x1ccf
    push16 r4
    pop16 r7
    ldi16 c0, 0x70d6
    push16 r4
    pop16 r0
    ldi16 r6, 0x0679
    st16 [r6+], r7
    push16 r7
    push16 r6
    push16 r0
    ldi16 c0, 0x0678
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x067a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_EQ_done
.Lst16_postinc_02e_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_EQ_done:
    brne8 .Lst16_postinc_02e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_NE_done
.Lst16_postinc_02e_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_NE_done:
    brult8 .Lst16_postinc_02e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_ULT_done
.Lst16_postinc_02e_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_ULT_done:
    bruge8 .Lst16_postinc_02e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_UGE_done
.Lst16_postinc_02e_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_UGE_done:
    brslt8 .Lst16_postinc_02e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_SLT_done
.Lst16_postinc_02e_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_SLT_done:
    brsge8 .Lst16_postinc_02e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02e_SGE_done
.Lst16_postinc_02e_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x067c
    ldi8 r5, 0xd9
    st8 [c0], r5
    ldi16 c0, 0x067d
    ldi16 r5, 0x00ff
    st16 [c0], r5
    ldi16 c0, 0x067f
    ldi8 r5, 0x10
    st8 [c0], r5

    ; POST pointer r6, data r7, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x2200
    push16 r4
    pop16 r7
    ldi16 c0, 0x7123
    push16 r4
    pop16 r0
    ldi16 r6, 0x067d
    st16 [r6+], r7
    push16 r7
    push16 r6
    push16 r0
    ldi16 c0, 0x067c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x067e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_02f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_EQ_done
.Lst16_postinc_02f_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_EQ_done:
    brne8 .Lst16_postinc_02f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_NE_done
.Lst16_postinc_02f_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_NE_done:
    brult8 .Lst16_postinc_02f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_ULT_done
.Lst16_postinc_02f_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_ULT_done:
    bruge8 .Lst16_postinc_02f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_UGE_done
.Lst16_postinc_02f_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_UGE_done:
    brslt8 .Lst16_postinc_02f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_SLT_done
.Lst16_postinc_02f_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_SLT_done:
    brsge8 .Lst16_postinc_02f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_02f_SGE_done
.Lst16_postinc_02f_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_02f_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0680
    ldi8 r5, 0xe3
    st8 [c0], r5
    ldi16 c0, 0x0681
    ldi16 r5, 0x0100
    st16 [c0], r5
    ldi16 c0, 0x0683
    ldi8 r5, 0x10
    st8 [c0], r5

    ; POST pointer r7, data r0, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x56cf
    push16 r4
    pop16 r0
    ldi16 c0, 0x7271
    push16 r4
    pop16 r1
    ldi16 r7, 0x0681
    st16 [r7+], r0
    push16 r0
    push16 r7
    push16 r1
    ldi16 c0, 0x0680
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0682
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_030_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_EQ_done
.Lst16_postinc_030_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_030_EQ_done:
    brne8 .Lst16_postinc_030_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_NE_done
.Lst16_postinc_030_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_030_NE_done:
    brult8 .Lst16_postinc_030_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_ULT_done
.Lst16_postinc_030_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_030_ULT_done:
    bruge8 .Lst16_postinc_030_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_UGE_done
.Lst16_postinc_030_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_030_UGE_done:
    brslt8 .Lst16_postinc_030_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_SLT_done
.Lst16_postinc_030_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_030_SLT_done:
    brsge8 .Lst16_postinc_030_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_030_SGE_done
.Lst16_postinc_030_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_030_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0684
    ldi8 r5, 0xec
    st8 [c0], r5
    ldi16 c0, 0x0685
    ldi16 r5, 0x8000
    st16 [c0], r5
    ldi16 c0, 0x0687
    ldi8 r5, 0x17
    st8 [c0], r5

    ; POST pointer r7, data r0, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0xaf61
    push16 r4
    pop16 r0
    ldi16 c0, 0x72be
    push16 r4
    pop16 r1
    ldi16 r7, 0x0685
    st16 [r7+], r0
    push16 r0
    push16 r7
    push16 r1
    ldi16 c0, 0x0684
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0686
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_031_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_EQ_done
.Lst16_postinc_031_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_031_EQ_done:
    brne8 .Lst16_postinc_031_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_NE_done
.Lst16_postinc_031_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_031_NE_done:
    brult8 .Lst16_postinc_031_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_ULT_done
.Lst16_postinc_031_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_031_ULT_done:
    bruge8 .Lst16_postinc_031_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_UGE_done
.Lst16_postinc_031_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_031_UGE_done:
    brslt8 .Lst16_postinc_031_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_SLT_done
.Lst16_postinc_031_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_031_SLT_done:
    brsge8 .Lst16_postinc_031_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_031_SGE_done
.Lst16_postinc_031_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_031_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0688
    ldi8 r5, 0xf5
    st8 [c0], r5
    ldi16 c0, 0x0689
    ldi16 r5, 0x8000
    st16 [c0], r5
    ldi16 c0, 0x068b
    ldi8 r5, 0x1f
    st8 [c0], r5

    ; POST pointer r7, data r1, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x90c8
    push16 r4
    pop16 r1
    ldi16 c0, 0x720a
    push16 r4
    pop16 r0
    ldi16 r7, 0x0689
    st16 [r7+], r1
    push16 r1
    push16 r7
    push16 r0
    ldi16 c0, 0x0688
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x068a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_032_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_EQ_done
.Lst16_postinc_032_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_032_EQ_done:
    brne8 .Lst16_postinc_032_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_NE_done
.Lst16_postinc_032_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_032_NE_done:
    brult8 .Lst16_postinc_032_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_ULT_done
.Lst16_postinc_032_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_032_ULT_done:
    bruge8 .Lst16_postinc_032_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_UGE_done
.Lst16_postinc_032_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_032_UGE_done:
    brslt8 .Lst16_postinc_032_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_SLT_done
.Lst16_postinc_032_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_032_SLT_done:
    brsge8 .Lst16_postinc_032_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_032_SGE_done
.Lst16_postinc_032_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_032_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x068c
    ldi8 r5, 0xfe
    st8 [c0], r5
    ldi16 c0, 0x068d
    ldi16 r5, 0xa55a
    st16 [c0], r5
    ldi16 c0, 0x068f
    ldi8 r5, 0x26
    st8 [c0], r5

    ; POST pointer r7, data r1, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x3bc3
    push16 r4
    pop16 r1
    ldi16 c0, 0x7257
    push16 r4
    pop16 r0
    ldi16 r7, 0x068d
    st16 [r7+], r1
    push16 r1
    push16 r7
    push16 r0
    ldi16 c0, 0x068c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x068e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_033_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_EQ_done
.Lst16_postinc_033_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_033_EQ_done:
    brne8 .Lst16_postinc_033_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_NE_done
.Lst16_postinc_033_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_033_NE_done:
    brult8 .Lst16_postinc_033_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_ULT_done
.Lst16_postinc_033_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_033_ULT_done:
    bruge8 .Lst16_postinc_033_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_UGE_done
.Lst16_postinc_033_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_033_UGE_done:
    brslt8 .Lst16_postinc_033_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_SLT_done
.Lst16_postinc_033_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_033_SLT_done:
    brsge8 .Lst16_postinc_033_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_033_SGE_done
.Lst16_postinc_033_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_033_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0690
    ldi8 r5, 0x07
    st8 [c0], r5
    ldi16 c0, 0x0691
    ldi16 r5, 0xa55a
    st16 [c0], r5
    ldi16 c0, 0x0693
    ldi8 r5, 0x2e
    st8 [c0], r5

    ; POST pointer r7, data r2, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x410b
    push16 r4
    pop16 r2
    ldi16 c0, 0x72a4
    push16 r4
    pop16 r0
    ldi16 r7, 0x0691
    st16 [r7+], r2
    push16 r2
    push16 r7
    push16 r0
    ldi16 c0, 0x0690
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0692
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_034_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_EQ_done
.Lst16_postinc_034_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_034_EQ_done:
    brne8 .Lst16_postinc_034_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_NE_done
.Lst16_postinc_034_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_034_NE_done:
    brult8 .Lst16_postinc_034_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_ULT_done
.Lst16_postinc_034_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_034_ULT_done:
    bruge8 .Lst16_postinc_034_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_UGE_done
.Lst16_postinc_034_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_034_UGE_done:
    brslt8 .Lst16_postinc_034_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_SLT_done
.Lst16_postinc_034_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_034_SLT_done:
    brsge8 .Lst16_postinc_034_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_034_SGE_done
.Lst16_postinc_034_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_034_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0694
    ldi8 r5, 0x10
    st8 [c0], r5
    ldi16 c0, 0x0695
    ldi16 r5, 0x0001
    st16 [c0], r5
    ldi16 c0, 0x0697
    ldi8 r5, 0x35
    st8 [c0], r5

    ; POST pointer r7, data r2, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x4925
    push16 r4
    pop16 r2
    ldi16 c0, 0x72f1
    push16 r4
    pop16 r0
    ldi16 r7, 0x0695
    st16 [r7+], r2
    push16 r2
    push16 r7
    push16 r0
    ldi16 c0, 0x0694
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0696
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_035_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_EQ_done
.Lst16_postinc_035_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_035_EQ_done:
    brne8 .Lst16_postinc_035_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_NE_done
.Lst16_postinc_035_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_035_NE_done:
    brult8 .Lst16_postinc_035_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_ULT_done
.Lst16_postinc_035_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_035_ULT_done:
    bruge8 .Lst16_postinc_035_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_UGE_done
.Lst16_postinc_035_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_035_UGE_done:
    brslt8 .Lst16_postinc_035_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_SLT_done
.Lst16_postinc_035_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_035_SLT_done:
    brsge8 .Lst16_postinc_035_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_035_SGE_done
.Lst16_postinc_035_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_035_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0698
    ldi8 r5, 0x19
    st8 [c0], r5
    ldi16 c0, 0x0699
    ldi16 r5, 0x0001
    st16 [c0], r5
    ldi16 c0, 0x069b
    ldi8 r5, 0x3d
    st8 [c0], r5

    ; POST pointer r7, data r3, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0xce56
    push16 r4
    pop16 r3
    ldi16 c0, 0x733e
    push16 r4
    pop16 r0
    ldi16 r7, 0x0699
    st16 [r7+], r3
    push16 r3
    push16 r7
    push16 r0
    ldi16 c0, 0x0698
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x069a
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_036_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_EQ_done
.Lst16_postinc_036_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_036_EQ_done:
    brne8 .Lst16_postinc_036_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_NE_done
.Lst16_postinc_036_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_036_NE_done:
    brult8 .Lst16_postinc_036_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_ULT_done
.Lst16_postinc_036_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_036_ULT_done:
    bruge8 .Lst16_postinc_036_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_UGE_done
.Lst16_postinc_036_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_036_UGE_done:
    brslt8 .Lst16_postinc_036_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_SLT_done
.Lst16_postinc_036_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_036_SLT_done:
    brsge8 .Lst16_postinc_036_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_036_SGE_done
.Lst16_postinc_036_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_036_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x069c
    ldi8 r5, 0x22
    st8 [c0], r5
    ldi16 c0, 0x069d
    ldi16 r5, 0x0100
    st16 [c0], r5
    ldi16 c0, 0x069f
    ldi8 r5, 0x44
    st8 [c0], r5

    ; POST pointer r7, data r3, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0xab78
    push16 r4
    pop16 r3
    ldi16 c0, 0x738b
    push16 r4
    pop16 r0
    ldi16 r7, 0x069d
    st16 [r7+], r3
    push16 r3
    push16 r7
    push16 r0
    ldi16 c0, 0x069c
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x069e
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_037_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_EQ_done
.Lst16_postinc_037_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_037_EQ_done:
    brne8 .Lst16_postinc_037_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_NE_done
.Lst16_postinc_037_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_037_NE_done:
    brult8 .Lst16_postinc_037_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_ULT_done
.Lst16_postinc_037_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_037_ULT_done:
    bruge8 .Lst16_postinc_037_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_UGE_done
.Lst16_postinc_037_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_037_UGE_done:
    brslt8 .Lst16_postinc_037_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_SLT_done
.Lst16_postinc_037_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_037_SLT_done:
    brsge8 .Lst16_postinc_037_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_037_SGE_done
.Lst16_postinc_037_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_037_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a0
    ldi8 r5, 0x2b
    st8 [c0], r5
    ldi16 c0, 0x06a1
    ldi16 r5, 0x0100
    st16 [c0], r5
    ldi16 c0, 0x06a3
    ldi8 r5, 0x4c
    st8 [c0], r5

    ; POST pointer r7, data r4, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x5ab8
    push16 r5
    pop16 r4
    ldi16 r5, 0x73d8
    push16 r5
    pop16 r0
    ldi16 r7, 0x06a1
    st16 [r7+], r4
    push16 r4
    push16 r7
    push16 r0
    ldi16 c0, 0x06a0
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a2
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_038_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_EQ_done
.Lst16_postinc_038_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_038_EQ_done:
    brne8 .Lst16_postinc_038_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_NE_done
.Lst16_postinc_038_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_038_NE_done:
    brult8 .Lst16_postinc_038_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_ULT_done
.Lst16_postinc_038_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_038_ULT_done:
    bruge8 .Lst16_postinc_038_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_UGE_done
.Lst16_postinc_038_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_038_UGE_done:
    brslt8 .Lst16_postinc_038_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_SLT_done
.Lst16_postinc_038_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_038_SLT_done:
    brsge8 .Lst16_postinc_038_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_038_SGE_done
.Lst16_postinc_038_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_038_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a4
    ldi8 r5, 0x34
    st8 [c0], r5
    ldi16 c0, 0x06a5
    ldi16 r5, 0x8000
    st16 [c0], r5
    ldi16 c0, 0x06a7
    ldi8 r5, 0x53
    st8 [c0], r5

    ; POST pointer r7, data r4, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x60e8
    push16 r5
    pop16 r4
    ldi16 r5, 0x7425
    push16 r5
    pop16 r0
    ldi16 r7, 0x06a5
    st16 [r7+], r4
    push16 r4
    push16 r7
    push16 r0
    ldi16 c0, 0x06a4
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a6
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_039_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_EQ_done
.Lst16_postinc_039_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_039_EQ_done:
    brne8 .Lst16_postinc_039_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_NE_done
.Lst16_postinc_039_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_039_NE_done:
    brult8 .Lst16_postinc_039_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_ULT_done
.Lst16_postinc_039_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_039_ULT_done:
    bruge8 .Lst16_postinc_039_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_UGE_done
.Lst16_postinc_039_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_039_UGE_done:
    brslt8 .Lst16_postinc_039_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_SLT_done
.Lst16_postinc_039_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_039_SLT_done:
    brsge8 .Lst16_postinc_039_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_039_SGE_done
.Lst16_postinc_039_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_039_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a8
    ldi8 r5, 0x3d
    st8 [c0], r5
    ldi16 c0, 0x06a9
    ldi16 r5, 0x8000
    st16 [c0], r5
    ldi16 c0, 0x06ab
    ldi8 r5, 0x5b
    st8 [c0], r5

    ; POST pointer r7, data r5, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x661a
    push16 r4
    pop16 r5
    ldi16 c0, 0x7472
    push16 r4
    pop16 r0
    ldi16 r7, 0x06a9
    st16 [r7+], r5
    push16 r5
    push16 r7
    push16 r0
    ldi16 c0, 0x06a8
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06aa
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_EQ_done
.Lst16_postinc_03a_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_EQ_done:
    brne8 .Lst16_postinc_03a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_NE_done
.Lst16_postinc_03a_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_NE_done:
    brult8 .Lst16_postinc_03a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_ULT_done
.Lst16_postinc_03a_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_ULT_done:
    bruge8 .Lst16_postinc_03a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_UGE_done
.Lst16_postinc_03a_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_UGE_done:
    brslt8 .Lst16_postinc_03a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_SLT_done
.Lst16_postinc_03a_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_SLT_done:
    brsge8 .Lst16_postinc_03a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03a_SGE_done
.Lst16_postinc_03a_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06ac
    ldi8 r5, 0x46
    st8 [c0], r5
    ldi16 c0, 0x06ad
    ldi16 r5, 0xa55a
    st16 [c0], r5
    ldi16 c0, 0x06af
    ldi8 r5, 0x62
    st8 [c0], r5

    ; POST pointer r7, data r5, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0x12b4
    push16 r4
    pop16 r5
    ldi16 c0, 0x74bf
    push16 r4
    pop16 r0
    ldi16 r7, 0x06ad
    st16 [r7+], r5
    push16 r5
    push16 r7
    push16 r0
    ldi16 c0, 0x06ac
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06ae
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_EQ_done
.Lst16_postinc_03b_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_EQ_done:
    brne8 .Lst16_postinc_03b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_NE_done
.Lst16_postinc_03b_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_NE_done:
    brult8 .Lst16_postinc_03b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_ULT_done
.Lst16_postinc_03b_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_ULT_done:
    bruge8 .Lst16_postinc_03b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_UGE_done
.Lst16_postinc_03b_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_UGE_done:
    brslt8 .Lst16_postinc_03b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_SLT_done
.Lst16_postinc_03b_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_SLT_done:
    brsge8 .Lst16_postinc_03b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03b_SGE_done
.Lst16_postinc_03b_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b0
    ldi8 r5, 0x4f
    st8 [c0], r5
    ldi16 c0, 0x06b1
    ldi16 r5, 0xa55a
    st16 [c0], r5
    ldi16 c0, 0x06b3
    ldi8 r5, 0x6a
    st8 [c0], r5

    ; POST pointer r7, data r6, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x8c83
    push16 r4
    pop16 r6
    ldi16 c0, 0x750c
    push16 r4
    pop16 r0
    ldi16 r7, 0x06b1
    st16 [r7+], r6
    push16 r6
    push16 r7
    push16 r0
    ldi16 c0, 0x06b0
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b2
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_EQ_done
.Lst16_postinc_03c_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_EQ_done:
    brne8 .Lst16_postinc_03c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_NE_done
.Lst16_postinc_03c_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_NE_done:
    brult8 .Lst16_postinc_03c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_ULT_done
.Lst16_postinc_03c_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_ULT_done:
    bruge8 .Lst16_postinc_03c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_UGE_done
.Lst16_postinc_03c_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_UGE_done:
    brslt8 .Lst16_postinc_03c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_SLT_done
.Lst16_postinc_03c_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_SLT_done:
    brsge8 .Lst16_postinc_03c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03c_SGE_done
.Lst16_postinc_03c_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b4
    ldi8 r5, 0x58
    st8 [c0], r5
    ldi16 c0, 0x06b5
    ldi16 r5, 0x0001
    st16 [c0], r5
    ldi16 c0, 0x06b7
    ldi8 r5, 0x71
    st8 [c0], r5

    ; POST pointer r7, data r6, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0xdcf7
    push16 r4
    pop16 r6
    ldi16 c0, 0x7559
    push16 r4
    pop16 r0
    ldi16 r7, 0x06b5
    st16 [r7+], r6
    push16 r6
    push16 r7
    push16 r0
    ldi16 c0, 0x06b4
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b6
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_EQ_done
.Lst16_postinc_03d_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_EQ_done:
    brne8 .Lst16_postinc_03d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_NE_done
.Lst16_postinc_03d_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_NE_done:
    brult8 .Lst16_postinc_03d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_ULT_done
.Lst16_postinc_03d_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_ULT_done:
    bruge8 .Lst16_postinc_03d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_UGE_done
.Lst16_postinc_03d_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_UGE_done:
    brslt8 .Lst16_postinc_03d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_SLT_done
.Lst16_postinc_03d_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_SLT_done:
    brsge8 .Lst16_postinc_03d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03d_SGE_done
.Lst16_postinc_03d_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b8
    ldi8 r5, 0x61
    st8 [c0], r5
    ldi16 c0, 0x06b9
    ldi16 r5, 0x0001
    st16 [c0], r5
    ldi16 c0, 0x06bb
    ldi8 r5, 0x79
    st8 [c0], r5

    ; POST pointer r7, data r7, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x75a6
    push16 r4
    pop16 r0
    ldi16 r7, 0x06b9
    st16 [r7+], r7
    push16 r7
    push16 r7
    push16 r0
    ldi16 c0, 0x06b8
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06ba
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_EQ_done
.Lst16_postinc_03e_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_EQ_done:
    brne8 .Lst16_postinc_03e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_NE_done
.Lst16_postinc_03e_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_NE_done:
    brult8 .Lst16_postinc_03e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_ULT_done
.Lst16_postinc_03e_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_ULT_done:
    bruge8 .Lst16_postinc_03e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_UGE_done
.Lst16_postinc_03e_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_UGE_done:
    brslt8 .Lst16_postinc_03e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_SLT_done
.Lst16_postinc_03e_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_SLT_done:
    brsge8 .Lst16_postinc_03e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03e_SGE_done
.Lst16_postinc_03e_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06bc
    ldi8 r5, 0x6a
    st8 [c0], r5
    ldi16 c0, 0x06bd
    ldi16 r5, 0x0100
    st16 [c0], r5
    ldi16 c0, 0x06bf
    ldi8 r5, 0x80
    st8 [c0], r5

    ; POST pointer r7, data r7, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0x75f3
    push16 r4
    pop16 r0
    ldi16 r7, 0x06bd
    st16 [r7+], r7
    push16 r7
    push16 r7
    push16 r0
    ldi16 c0, 0x06bc
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06be
    ld16 r5, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_03f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_EQ_done
.Lst16_postinc_03f_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_EQ_done:
    brne8 .Lst16_postinc_03f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_NE_done
.Lst16_postinc_03f_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_NE_done:
    brult8 .Lst16_postinc_03f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_ULT_done
.Lst16_postinc_03f_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_ULT_done:
    bruge8 .Lst16_postinc_03f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_UGE_done
.Lst16_postinc_03f_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_UGE_done:
    brslt8 .Lst16_postinc_03f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_SLT_done
.Lst16_postinc_03f_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_SLT_done:
    brsge8 .Lst16_postinc_03f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_03f_SGE_done
.Lst16_postinc_03f_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_03f_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer c0, source r4, start 0xFFFE.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x7400
    push16 r5
    pop16 r0
    ldi16 c0, 0xfffe
    st16 [c0+], r4
    push16 r4
    push16 r4
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_wrap_0_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_EQ_done
.Lst16_postinc_wrap_0_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_EQ_done:
    brne8 .Lst16_postinc_wrap_0_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_NE_done
.Lst16_postinc_wrap_0_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_NE_done:
    brult8 .Lst16_postinc_wrap_0_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_ULT_done
.Lst16_postinc_wrap_0_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_ULT_done:
    bruge8 .Lst16_postinc_wrap_0_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_UGE_done
.Lst16_postinc_wrap_0_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_UGE_done:
    brslt8 .Lst16_postinc_wrap_0_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_SLT_done
.Lst16_postinc_wrap_0_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_SLT_done:
    brsge8 .Lst16_postinc_wrap_0_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_0_SGE_done
.Lst16_postinc_wrap_0_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_0_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer r5, source r1, start 0xFFFE.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 c0, 0xa723
    push16 r4
    pop16 r1
    ldi16 c0, 0x7511
    push16 r4
    pop16 r0
    ldi16 r5, 0xfffe
    st16 [r5+], r1
    push16 r1
    push16 r5
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_wrap_1_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_EQ_done
.Lst16_postinc_wrap_1_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_EQ_done:
    brne8 .Lst16_postinc_wrap_1_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_NE_done
.Lst16_postinc_wrap_1_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_NE_done:
    brult8 .Lst16_postinc_wrap_1_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_ULT_done
.Lst16_postinc_wrap_1_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_ULT_done:
    bruge8 .Lst16_postinc_wrap_1_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_UGE_done
.Lst16_postinc_wrap_1_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_UGE_done:
    brslt8 .Lst16_postinc_wrap_1_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_SLT_done
.Lst16_postinc_wrap_1_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_SLT_done:
    brsge8 .Lst16_postinc_wrap_1_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_1_SGE_done
.Lst16_postinc_wrap_1_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_1_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer r6, source r6, start 0xFFFE.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x7622
    push16 r4
    pop16 r0
    ldi16 r6, 0xfffe
    st16 [r6+], r6
    push16 r6
    push16 r6
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_wrap_2_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_EQ_done
.Lst16_postinc_wrap_2_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_EQ_done:
    brne8 .Lst16_postinc_wrap_2_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_NE_done
.Lst16_postinc_wrap_2_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_NE_done:
    brult8 .Lst16_postinc_wrap_2_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_ULT_done
.Lst16_postinc_wrap_2_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_ULT_done:
    bruge8 .Lst16_postinc_wrap_2_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_UGE_done
.Lst16_postinc_wrap_2_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_UGE_done:
    brslt8 .Lst16_postinc_wrap_2_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_SLT_done
.Lst16_postinc_wrap_2_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_SLT_done:
    brsge8 .Lst16_postinc_wrap_2_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_2_SGE_done
.Lst16_postinc_wrap_2_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_2_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer r7, source r3, start 0xFFFE.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 c0, 0xa969
    push16 r4
    pop16 r3
    ldi16 c0, 0x7733
    push16 r4
    pop16 r0
    ldi16 r7, 0xfffe
    st16 [r7+], r3
    push16 r3
    push16 r7
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst16_postinc_wrap_3_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_EQ_done
.Lst16_postinc_wrap_3_EQ_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_EQ_done:
    brne8 .Lst16_postinc_wrap_3_NE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_NE_done
.Lst16_postinc_wrap_3_NE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_NE_done:
    brult8 .Lst16_postinc_wrap_3_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_ULT_done
.Lst16_postinc_wrap_3_ULT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_ULT_done:
    bruge8 .Lst16_postinc_wrap_3_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_UGE_done
.Lst16_postinc_wrap_3_UGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_UGE_done:
    brslt8 .Lst16_postinc_wrap_3_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_SLT_done
.Lst16_postinc_wrap_3_SLT_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_SLT_done:
    brsge8 .Lst16_postinc_wrap_3_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst16_postinc_wrap_3_SGE_done
.Lst16_postinc_wrap_3_SGE_true:
    mem_emit_char 'B'
.Lst16_postinc_wrap_3_SGE_done:
    mem_emit_char '\n'

    sys debug_break
