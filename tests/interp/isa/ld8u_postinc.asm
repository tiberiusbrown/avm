.include "include/secondary_memory_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0680
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x0681
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0682
    ldi8 r5, 0xc0
    st8 [r4], r5

    ; POST pointer r4, data r0, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x8700
    push16 r5
    pop16 r0
    ldi16 r5, 0x6401
    push16 r5
    pop16 r1
    ldi16 r4, 0x0681
    ld8u r0, [r4+]
    push16 r0
    push16 r4
    push16 r1
    ldi16 r4, 0x0680
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0681
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_000_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_EQ_done
.Lld8u_postinc_000_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_EQ_done:
    brne8 .Lld8u_postinc_000_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_NE_done
.Lld8u_postinc_000_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_NE_done:
    brult8 .Lld8u_postinc_000_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_ULT_done
.Lld8u_postinc_000_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_ULT_done:
    bruge8 .Lld8u_postinc_000_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_UGE_done
.Lld8u_postinc_000_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_UGE_done:
    brslt8 .Lld8u_postinc_000_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_SLT_done
.Lld8u_postinc_000_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_SLT_done:
    brsge8 .Lld8u_postinc_000_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_000_SGE_done
.Lld8u_postinc_000_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_000_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0684
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x0685
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0686
    ldi8 r5, 0xc7
    st8 [r4], r5

    ; POST pointer r4, data r0, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8739
    push16 r5
    pop16 r0
    ldi16 r5, 0x644e
    push16 r5
    pop16 r1
    ldi16 r4, 0x0685
    ld8u r0, [r4+]
    push16 r0
    push16 r4
    push16 r1
    ldi16 r4, 0x0684
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0685
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_001_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_EQ_done
.Lld8u_postinc_001_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_EQ_done:
    brne8 .Lld8u_postinc_001_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_NE_done
.Lld8u_postinc_001_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_NE_done:
    brult8 .Lld8u_postinc_001_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_ULT_done
.Lld8u_postinc_001_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_ULT_done:
    bruge8 .Lld8u_postinc_001_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_UGE_done
.Lld8u_postinc_001_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_UGE_done:
    brslt8 .Lld8u_postinc_001_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_SLT_done
.Lld8u_postinc_001_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_SLT_done:
    brsge8 .Lld8u_postinc_001_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_001_SGE_done
.Lld8u_postinc_001_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_001_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0688
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x0689
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x068a
    ldi8 r5, 0xcf
    st8 [r4], r5

    ; POST pointer r4, data r1, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8773
    push16 r5
    pop16 r1
    ldi16 r5, 0x639a
    push16 r5
    pop16 r0
    ldi16 r4, 0x0689
    ld8u r1, [r4+]
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x0688
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0689
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_002_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_EQ_done
.Lld8u_postinc_002_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_EQ_done:
    brne8 .Lld8u_postinc_002_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_NE_done
.Lld8u_postinc_002_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_NE_done:
    brult8 .Lld8u_postinc_002_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_ULT_done
.Lld8u_postinc_002_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_ULT_done:
    bruge8 .Lld8u_postinc_002_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_UGE_done
.Lld8u_postinc_002_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_UGE_done:
    brslt8 .Lld8u_postinc_002_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_SLT_done
.Lld8u_postinc_002_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_SLT_done:
    brsge8 .Lld8u_postinc_002_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_002_SGE_done
.Lld8u_postinc_002_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_002_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x068c
    ldi8 r5, 0x4b
    st8 [r4], r5
    ldi16 r4, 0x068d
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x068e
    ldi8 r5, 0xd6
    st8 [r4], r5

    ; POST pointer r4, data r1, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x87ac
    push16 r5
    pop16 r1
    ldi16 r5, 0x63e7
    push16 r5
    pop16 r0
    ldi16 r4, 0x068d
    ld8u r1, [r4+]
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x068c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x068d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_003_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_EQ_done
.Lld8u_postinc_003_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_EQ_done:
    brne8 .Lld8u_postinc_003_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_NE_done
.Lld8u_postinc_003_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_NE_done:
    brult8 .Lld8u_postinc_003_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_ULT_done
.Lld8u_postinc_003_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_ULT_done:
    bruge8 .Lld8u_postinc_003_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_UGE_done
.Lld8u_postinc_003_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_UGE_done:
    brslt8 .Lld8u_postinc_003_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_SLT_done
.Lld8u_postinc_003_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_SLT_done:
    brsge8 .Lld8u_postinc_003_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_003_SGE_done
.Lld8u_postinc_003_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_003_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0690
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x0691
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x0692
    ldi8 r5, 0xde
    st8 [r4], r5

    ; POST pointer r4, data r2, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x87e6
    push16 r5
    pop16 r2
    ldi16 r5, 0x6434
    push16 r5
    pop16 r0
    ldi16 r4, 0x0691
    ld8u r2, [r4+]
    push16 r2
    push16 r4
    push16 r0
    ldi16 r4, 0x0690
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0691
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_004_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_EQ_done
.Lld8u_postinc_004_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_EQ_done:
    brne8 .Lld8u_postinc_004_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_NE_done
.Lld8u_postinc_004_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_NE_done:
    brult8 .Lld8u_postinc_004_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_ULT_done
.Lld8u_postinc_004_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_ULT_done:
    bruge8 .Lld8u_postinc_004_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_UGE_done
.Lld8u_postinc_004_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_UGE_done:
    brslt8 .Lld8u_postinc_004_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_SLT_done
.Lld8u_postinc_004_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_SLT_done:
    brsge8 .Lld8u_postinc_004_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_004_SGE_done
.Lld8u_postinc_004_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_004_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0694
    ldi8 r5, 0x5d
    st8 [r4], r5
    ldi16 r4, 0x0695
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x0696
    ldi8 r5, 0xe5
    st8 [r4], r5

    ; POST pointer r4, data r2, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x881f
    push16 r5
    pop16 r2
    ldi16 r5, 0x6481
    push16 r5
    pop16 r0
    ldi16 r4, 0x0695
    ld8u r2, [r4+]
    push16 r2
    push16 r4
    push16 r0
    ldi16 r4, 0x0694
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0695
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_005_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_EQ_done
.Lld8u_postinc_005_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_EQ_done:
    brne8 .Lld8u_postinc_005_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_NE_done
.Lld8u_postinc_005_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_NE_done:
    brult8 .Lld8u_postinc_005_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_ULT_done
.Lld8u_postinc_005_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_ULT_done:
    bruge8 .Lld8u_postinc_005_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_UGE_done
.Lld8u_postinc_005_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_UGE_done:
    brslt8 .Lld8u_postinc_005_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_SLT_done
.Lld8u_postinc_005_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_SLT_done:
    brsge8 .Lld8u_postinc_005_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_005_SGE_done
.Lld8u_postinc_005_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_005_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0698
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0699
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x069a
    ldi8 r5, 0xed
    st8 [r4], r5

    ; POST pointer r4, data r3, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8859
    push16 r5
    pop16 r3
    ldi16 r5, 0x64ce
    push16 r5
    pop16 r0
    ldi16 r4, 0x0699
    ld8u r3, [r4+]
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x0698
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0699
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_006_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_EQ_done
.Lld8u_postinc_006_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_EQ_done:
    brne8 .Lld8u_postinc_006_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_NE_done
.Lld8u_postinc_006_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_NE_done:
    brult8 .Lld8u_postinc_006_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_ULT_done
.Lld8u_postinc_006_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_ULT_done:
    bruge8 .Lld8u_postinc_006_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_UGE_done
.Lld8u_postinc_006_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_UGE_done:
    brslt8 .Lld8u_postinc_006_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_SLT_done
.Lld8u_postinc_006_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_SLT_done:
    brsge8 .Lld8u_postinc_006_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_006_SGE_done
.Lld8u_postinc_006_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_006_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x069c
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x069d
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x069e
    ldi8 r5, 0xf4
    st8 [r4], r5

    ; POST pointer r4, data r3, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x8892
    push16 r5
    pop16 r3
    ldi16 r5, 0x651b
    push16 r5
    pop16 r0
    ldi16 r4, 0x069d
    ld8u r3, [r4+]
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x069c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x069d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_007_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_EQ_done
.Lld8u_postinc_007_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_EQ_done:
    brne8 .Lld8u_postinc_007_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_NE_done
.Lld8u_postinc_007_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_NE_done:
    brult8 .Lld8u_postinc_007_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_ULT_done
.Lld8u_postinc_007_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_ULT_done:
    bruge8 .Lld8u_postinc_007_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_UGE_done
.Lld8u_postinc_007_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_UGE_done:
    brslt8 .Lld8u_postinc_007_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_SLT_done
.Lld8u_postinc_007_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_SLT_done:
    brsge8 .Lld8u_postinc_007_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_007_SGE_done
.Lld8u_postinc_007_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_007_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a0
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x06a1
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x06a2
    ldi8 r5, 0xfd
    st8 [r4], r5

    ; POST pointer r4, data r5, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r6, 0x88cd
    push16 r6
    pop16 r5
    ldi16 r6, 0x6568
    push16 r6
    pop16 r0
    ldi16 r4, 0x06a1
    ld8u r5, [r4+]
    push16 r5
    push16 r4
    push16 r0
    ldi16 r4, 0x06a0
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06a1
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_008_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_EQ_done
.Lld8u_postinc_008_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_EQ_done:
    brne8 .Lld8u_postinc_008_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_NE_done
.Lld8u_postinc_008_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_NE_done:
    brult8 .Lld8u_postinc_008_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_ULT_done
.Lld8u_postinc_008_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_ULT_done:
    bruge8 .Lld8u_postinc_008_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_UGE_done
.Lld8u_postinc_008_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_UGE_done:
    brslt8 .Lld8u_postinc_008_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_SLT_done
.Lld8u_postinc_008_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_SLT_done:
    brsge8 .Lld8u_postinc_008_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_008_SGE_done
.Lld8u_postinc_008_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_008_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a4
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x06a5
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x06a6
    ldi8 r5, 0x04
    st8 [r4], r5

    ; POST pointer r4, data r5, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r6, 0x8906
    push16 r6
    pop16 r5
    ldi16 r6, 0x65b5
    push16 r6
    pop16 r0
    ldi16 r4, 0x06a5
    ld8u r5, [r4+]
    push16 r5
    push16 r4
    push16 r0
    ldi16 r4, 0x06a4
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06a5
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_009_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_EQ_done
.Lld8u_postinc_009_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_EQ_done:
    brne8 .Lld8u_postinc_009_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_NE_done
.Lld8u_postinc_009_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_NE_done:
    brult8 .Lld8u_postinc_009_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_ULT_done
.Lld8u_postinc_009_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_ULT_done:
    bruge8 .Lld8u_postinc_009_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_UGE_done
.Lld8u_postinc_009_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_UGE_done:
    brslt8 .Lld8u_postinc_009_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_SLT_done
.Lld8u_postinc_009_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_SLT_done:
    brsge8 .Lld8u_postinc_009_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_009_SGE_done
.Lld8u_postinc_009_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_009_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06a8
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x06a9
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x06aa
    ldi8 r5, 0x0c
    st8 [r4], r5

    ; POST pointer r4, data r6, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x8940
    push16 r5
    pop16 r6
    ldi16 r5, 0x6602
    push16 r5
    pop16 r0
    ldi16 r4, 0x06a9
    ld8u r6, [r4+]
    push16 r6
    push16 r4
    push16 r0
    ldi16 r4, 0x06a8
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06a9
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_EQ_done
.Lld8u_postinc_00a_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_EQ_done:
    brne8 .Lld8u_postinc_00a_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_NE_done
.Lld8u_postinc_00a_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_NE_done:
    brult8 .Lld8u_postinc_00a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_ULT_done
.Lld8u_postinc_00a_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_ULT_done:
    bruge8 .Lld8u_postinc_00a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_UGE_done
.Lld8u_postinc_00a_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_UGE_done:
    brslt8 .Lld8u_postinc_00a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_SLT_done
.Lld8u_postinc_00a_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_SLT_done:
    brsge8 .Lld8u_postinc_00a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00a_SGE_done
.Lld8u_postinc_00a_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06ac
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x06ad
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x06ae
    ldi8 r5, 0x13
    st8 [r4], r5

    ; POST pointer r4, data r6, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8979
    push16 r5
    pop16 r6
    ldi16 r5, 0x664f
    push16 r5
    pop16 r0
    ldi16 r4, 0x06ad
    ld8u r6, [r4+]
    push16 r6
    push16 r4
    push16 r0
    ldi16 r4, 0x06ac
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06ad
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_EQ_done
.Lld8u_postinc_00b_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_EQ_done:
    brne8 .Lld8u_postinc_00b_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_NE_done
.Lld8u_postinc_00b_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_NE_done:
    brult8 .Lld8u_postinc_00b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_ULT_done
.Lld8u_postinc_00b_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_ULT_done:
    bruge8 .Lld8u_postinc_00b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_UGE_done
.Lld8u_postinc_00b_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_UGE_done:
    brslt8 .Lld8u_postinc_00b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_SLT_done
.Lld8u_postinc_00b_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_SLT_done:
    brsge8 .Lld8u_postinc_00b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00b_SGE_done
.Lld8u_postinc_00b_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b0
    ldi8 r5, 0x9c
    st8 [r4], r5
    ldi16 r4, 0x06b1
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x06b2
    ldi8 r5, 0x1b
    st8 [r4], r5

    ; POST pointer r4, data r7, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x89b3
    push16 r5
    pop16 r7
    ldi16 r5, 0x669c
    push16 r5
    pop16 r0
    ldi16 r4, 0x06b1
    ld8u r7, [r4+]
    push16 r7
    push16 r4
    push16 r0
    ldi16 r4, 0x06b0
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06b1
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_EQ_done
.Lld8u_postinc_00c_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_EQ_done:
    brne8 .Lld8u_postinc_00c_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_NE_done
.Lld8u_postinc_00c_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_NE_done:
    brult8 .Lld8u_postinc_00c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_ULT_done
.Lld8u_postinc_00c_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_ULT_done:
    bruge8 .Lld8u_postinc_00c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_UGE_done
.Lld8u_postinc_00c_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_UGE_done:
    brslt8 .Lld8u_postinc_00c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_SLT_done
.Lld8u_postinc_00c_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_SLT_done:
    brsge8 .Lld8u_postinc_00c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00c_SGE_done
.Lld8u_postinc_00c_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b4
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x06b5
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x06b6
    ldi8 r5, 0x22
    st8 [r4], r5

    ; POST pointer r4, data r7, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x89ec
    push16 r5
    pop16 r7
    ldi16 r5, 0x66e9
    push16 r5
    pop16 r0
    ldi16 r4, 0x06b5
    ld8u r7, [r4+]
    push16 r7
    push16 r4
    push16 r0
    ldi16 r4, 0x06b4
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06b5
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_EQ_done
.Lld8u_postinc_00d_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_EQ_done:
    brne8 .Lld8u_postinc_00d_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_NE_done
.Lld8u_postinc_00d_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_NE_done:
    brult8 .Lld8u_postinc_00d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_ULT_done
.Lld8u_postinc_00d_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_ULT_done:
    bruge8 .Lld8u_postinc_00d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_UGE_done
.Lld8u_postinc_00d_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_UGE_done:
    brslt8 .Lld8u_postinc_00d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_SLT_done
.Lld8u_postinc_00d_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_SLT_done:
    brsge8 .Lld8u_postinc_00d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00d_SGE_done
.Lld8u_postinc_00d_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06b8
    ldi8 r5, 0xaf
    st8 [r4], r5
    ldi16 r4, 0x06b9
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x06ba
    ldi8 r5, 0x22
    st8 [r4], r5

    ; POST pointer r5, data r0, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8a1e
    push16 r4
    pop16 r0
    ldi16 r4, 0x6837
    push16 r4
    pop16 r1
    ldi16 r5, 0x06b9
    ld8u r0, [r5+]
    push16 r0
    push16 r5
    push16 r1
    ldi16 r4, 0x06b8
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06b9
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_EQ_done
.Lld8u_postinc_00e_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_EQ_done:
    brne8 .Lld8u_postinc_00e_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_NE_done
.Lld8u_postinc_00e_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_NE_done:
    brult8 .Lld8u_postinc_00e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_ULT_done
.Lld8u_postinc_00e_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_ULT_done:
    bruge8 .Lld8u_postinc_00e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_UGE_done
.Lld8u_postinc_00e_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_UGE_done:
    brslt8 .Lld8u_postinc_00e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_SLT_done
.Lld8u_postinc_00e_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_SLT_done:
    brsge8 .Lld8u_postinc_00e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00e_SGE_done
.Lld8u_postinc_00e_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x06bc
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x06bd
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x06be
    ldi8 r5, 0x29
    st8 [r4], r5

    ; POST pointer r5, data r0, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8a57
    push16 r4
    pop16 r0
    ldi16 r4, 0x6884
    push16 r4
    pop16 r1
    ldi16 r5, 0x06bd
    ld8u r0, [r5+]
    push16 r0
    push16 r5
    push16 r1
    ldi16 r4, 0x06bc
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x06bd
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_00f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_EQ_done
.Lld8u_postinc_00f_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_EQ_done:
    brne8 .Lld8u_postinc_00f_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_NE_done
.Lld8u_postinc_00f_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_NE_done:
    brult8 .Lld8u_postinc_00f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_ULT_done
.Lld8u_postinc_00f_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_ULT_done:
    bruge8 .Lld8u_postinc_00f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_UGE_done
.Lld8u_postinc_00f_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_UGE_done:
    brslt8 .Lld8u_postinc_00f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_SLT_done
.Lld8u_postinc_00f_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_SLT_done:
    brsge8 .Lld8u_postinc_00f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_00f_SGE_done
.Lld8u_postinc_00f_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_00f_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0600
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0602
    ldi8 r5, 0x31
    st8 [r4], r5

    ; POST pointer r5, data r1, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8a91
    push16 r4
    pop16 r1
    ldi16 r4, 0x67d0
    push16 r4
    pop16 r0
    ldi16 r5, 0x0601
    ld8u r1, [r5+]
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x0600
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0601
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_010_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_EQ_done
.Lld8u_postinc_010_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_EQ_done:
    brne8 .Lld8u_postinc_010_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_NE_done
.Lld8u_postinc_010_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_NE_done:
    brult8 .Lld8u_postinc_010_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_ULT_done
.Lld8u_postinc_010_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_ULT_done:
    bruge8 .Lld8u_postinc_010_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_UGE_done
.Lld8u_postinc_010_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_UGE_done:
    brslt8 .Lld8u_postinc_010_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_SLT_done
.Lld8u_postinc_010_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_SLT_done:
    brsge8 .Lld8u_postinc_010_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_010_SGE_done
.Lld8u_postinc_010_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_010_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0604
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x0605
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0606
    ldi8 r5, 0x38
    st8 [r4], r5

    ; POST pointer r5, data r1, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8aca
    push16 r4
    pop16 r1
    ldi16 r4, 0x681d
    push16 r4
    pop16 r0
    ldi16 r5, 0x0605
    ld8u r1, [r5+]
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x0604
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0605
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_011_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_EQ_done
.Lld8u_postinc_011_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_EQ_done:
    brne8 .Lld8u_postinc_011_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_NE_done
.Lld8u_postinc_011_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_NE_done:
    brult8 .Lld8u_postinc_011_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_ULT_done
.Lld8u_postinc_011_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_ULT_done:
    bruge8 .Lld8u_postinc_011_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_UGE_done
.Lld8u_postinc_011_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_UGE_done:
    brslt8 .Lld8u_postinc_011_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_SLT_done
.Lld8u_postinc_011_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_SLT_done:
    brsge8 .Lld8u_postinc_011_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_011_SGE_done
.Lld8u_postinc_011_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_011_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0608
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x0609
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x060a
    ldi8 r5, 0x40
    st8 [r4], r5

    ; POST pointer r5, data r2, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8b04
    push16 r4
    pop16 r2
    ldi16 r4, 0x686a
    push16 r4
    pop16 r0
    ldi16 r5, 0x0609
    ld8u r2, [r5+]
    push16 r2
    push16 r5
    push16 r0
    ldi16 r4, 0x0608
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0609
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_012_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_EQ_done
.Lld8u_postinc_012_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_EQ_done:
    brne8 .Lld8u_postinc_012_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_NE_done
.Lld8u_postinc_012_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_NE_done:
    brult8 .Lld8u_postinc_012_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_ULT_done
.Lld8u_postinc_012_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_ULT_done:
    bruge8 .Lld8u_postinc_012_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_UGE_done
.Lld8u_postinc_012_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_UGE_done:
    brslt8 .Lld8u_postinc_012_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_SLT_done
.Lld8u_postinc_012_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_SLT_done:
    brsge8 .Lld8u_postinc_012_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_012_SGE_done
.Lld8u_postinc_012_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_012_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x060c
    ldi8 r5, 0xdc
    st8 [r4], r5
    ldi16 r4, 0x060d
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x060e
    ldi8 r5, 0x47
    st8 [r4], r5

    ; POST pointer r5, data r2, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8b3d
    push16 r4
    pop16 r2
    ldi16 r4, 0x68b7
    push16 r4
    pop16 r0
    ldi16 r5, 0x060d
    ld8u r2, [r5+]
    push16 r2
    push16 r5
    push16 r0
    ldi16 r4, 0x060c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x060d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_013_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_EQ_done
.Lld8u_postinc_013_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_EQ_done:
    brne8 .Lld8u_postinc_013_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_NE_done
.Lld8u_postinc_013_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_NE_done:
    brult8 .Lld8u_postinc_013_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_ULT_done
.Lld8u_postinc_013_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_ULT_done:
    bruge8 .Lld8u_postinc_013_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_UGE_done
.Lld8u_postinc_013_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_UGE_done:
    brslt8 .Lld8u_postinc_013_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_SLT_done
.Lld8u_postinc_013_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_SLT_done:
    brsge8 .Lld8u_postinc_013_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_013_SGE_done
.Lld8u_postinc_013_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_013_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0610
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x0611
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x0612
    ldi8 r5, 0x4f
    st8 [r4], r5

    ; POST pointer r5, data r3, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8b77
    push16 r4
    pop16 r3
    ldi16 r4, 0x6904
    push16 r4
    pop16 r0
    ldi16 r5, 0x0611
    ld8u r3, [r5+]
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x0610
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0611
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_014_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_EQ_done
.Lld8u_postinc_014_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_EQ_done:
    brne8 .Lld8u_postinc_014_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_NE_done
.Lld8u_postinc_014_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_NE_done:
    brult8 .Lld8u_postinc_014_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_ULT_done
.Lld8u_postinc_014_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_ULT_done:
    bruge8 .Lld8u_postinc_014_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_UGE_done
.Lld8u_postinc_014_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_UGE_done:
    brslt8 .Lld8u_postinc_014_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_SLT_done
.Lld8u_postinc_014_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_SLT_done:
    brsge8 .Lld8u_postinc_014_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_014_SGE_done
.Lld8u_postinc_014_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_014_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0614
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x0615
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x0616
    ldi8 r5, 0x56
    st8 [r4], r5

    ; POST pointer r5, data r3, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8bb0
    push16 r4
    pop16 r3
    ldi16 r4, 0x6951
    push16 r4
    pop16 r0
    ldi16 r5, 0x0615
    ld8u r3, [r5+]
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x0614
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0615
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_015_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_EQ_done
.Lld8u_postinc_015_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_EQ_done:
    brne8 .Lld8u_postinc_015_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_NE_done
.Lld8u_postinc_015_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_NE_done:
    brult8 .Lld8u_postinc_015_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_ULT_done
.Lld8u_postinc_015_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_ULT_done:
    bruge8 .Lld8u_postinc_015_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_UGE_done
.Lld8u_postinc_015_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_UGE_done:
    brslt8 .Lld8u_postinc_015_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_SLT_done
.Lld8u_postinc_015_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_SLT_done:
    brsge8 .Lld8u_postinc_015_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_015_SGE_done
.Lld8u_postinc_015_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_015_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0618
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x0619
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x061a
    ldi8 r5, 0x5e
    st8 [r4], r5

    ; POST pointer r5, data r4, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x8bea
    push16 r6
    pop16 r4
    ldi16 r6, 0x699e
    push16 r6
    pop16 r0
    ldi16 r5, 0x0619
    ld8u r4, [r5+]
    push16 r4
    push16 r5
    push16 r0
    ldi16 r4, 0x0618
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0619
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_016_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_EQ_done
.Lld8u_postinc_016_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_EQ_done:
    brne8 .Lld8u_postinc_016_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_NE_done
.Lld8u_postinc_016_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_NE_done:
    brult8 .Lld8u_postinc_016_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_ULT_done
.Lld8u_postinc_016_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_ULT_done:
    bruge8 .Lld8u_postinc_016_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_UGE_done
.Lld8u_postinc_016_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_UGE_done:
    brslt8 .Lld8u_postinc_016_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_SLT_done
.Lld8u_postinc_016_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_SLT_done:
    brsge8 .Lld8u_postinc_016_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_016_SGE_done
.Lld8u_postinc_016_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_016_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x061c
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x061d
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x061e
    ldi8 r5, 0x65
    st8 [r4], r5

    ; POST pointer r5, data r4, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x8c23
    push16 r6
    pop16 r4
    ldi16 r6, 0x69eb
    push16 r6
    pop16 r0
    ldi16 r5, 0x061d
    ld8u r4, [r5+]
    push16 r4
    push16 r5
    push16 r0
    ldi16 r4, 0x061c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x061d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_017_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_EQ_done
.Lld8u_postinc_017_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_EQ_done:
    brne8 .Lld8u_postinc_017_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_NE_done
.Lld8u_postinc_017_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_NE_done:
    brult8 .Lld8u_postinc_017_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_ULT_done
.Lld8u_postinc_017_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_ULT_done:
    bruge8 .Lld8u_postinc_017_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_UGE_done
.Lld8u_postinc_017_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_UGE_done:
    brslt8 .Lld8u_postinc_017_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_SLT_done
.Lld8u_postinc_017_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_SLT_done:
    brsge8 .Lld8u_postinc_017_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_017_SGE_done
.Lld8u_postinc_017_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_017_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0620
    ldi8 r5, 0x09
    st8 [r4], r5
    ldi16 r4, 0x0621
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0622
    ldi8 r5, 0x6e
    st8 [r4], r5

    ; POST pointer r5, data r6, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8c5e
    push16 r4
    pop16 r6
    ldi16 r4, 0x6a38
    push16 r4
    pop16 r0
    ldi16 r5, 0x0621
    ld8u r6, [r5+]
    push16 r6
    push16 r5
    push16 r0
    ldi16 r4, 0x0620
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0621
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_018_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_EQ_done
.Lld8u_postinc_018_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_EQ_done:
    brne8 .Lld8u_postinc_018_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_NE_done
.Lld8u_postinc_018_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_NE_done:
    brult8 .Lld8u_postinc_018_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_ULT_done
.Lld8u_postinc_018_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_ULT_done:
    bruge8 .Lld8u_postinc_018_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_UGE_done
.Lld8u_postinc_018_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_UGE_done:
    brslt8 .Lld8u_postinc_018_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_SLT_done
.Lld8u_postinc_018_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_SLT_done:
    brsge8 .Lld8u_postinc_018_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_018_SGE_done
.Lld8u_postinc_018_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_018_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0624
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x0625
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0626
    ldi8 r5, 0x75
    st8 [r4], r5

    ; POST pointer r5, data r6, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8c97
    push16 r4
    pop16 r6
    ldi16 r4, 0x6a85
    push16 r4
    pop16 r0
    ldi16 r5, 0x0625
    ld8u r6, [r5+]
    push16 r6
    push16 r5
    push16 r0
    ldi16 r4, 0x0624
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0625
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_019_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_EQ_done
.Lld8u_postinc_019_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_EQ_done:
    brne8 .Lld8u_postinc_019_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_NE_done
.Lld8u_postinc_019_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_NE_done:
    brult8 .Lld8u_postinc_019_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_ULT_done
.Lld8u_postinc_019_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_ULT_done:
    bruge8 .Lld8u_postinc_019_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_UGE_done
.Lld8u_postinc_019_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_UGE_done:
    brslt8 .Lld8u_postinc_019_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_SLT_done
.Lld8u_postinc_019_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_SLT_done:
    brsge8 .Lld8u_postinc_019_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_019_SGE_done
.Lld8u_postinc_019_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_019_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0628
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x0629
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x062a
    ldi8 r5, 0x7d
    st8 [r4], r5

    ; POST pointer r5, data r7, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8cd1
    push16 r4
    pop16 r7
    ldi16 r4, 0x6ad2
    push16 r4
    pop16 r0
    ldi16 r5, 0x0629
    ld8u r7, [r5+]
    push16 r7
    push16 r5
    push16 r0
    ldi16 r4, 0x0628
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0629
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_EQ_done
.Lld8u_postinc_01a_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_EQ_done:
    brne8 .Lld8u_postinc_01a_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_NE_done
.Lld8u_postinc_01a_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_NE_done:
    brult8 .Lld8u_postinc_01a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_ULT_done
.Lld8u_postinc_01a_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_ULT_done:
    bruge8 .Lld8u_postinc_01a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_UGE_done
.Lld8u_postinc_01a_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_UGE_done:
    brslt8 .Lld8u_postinc_01a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_SLT_done
.Lld8u_postinc_01a_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_SLT_done:
    brsge8 .Lld8u_postinc_01a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01a_SGE_done
.Lld8u_postinc_01a_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x062c
    ldi8 r5, 0x24
    st8 [r4], r5
    ldi16 r4, 0x062d
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x062e
    ldi8 r5, 0x84
    st8 [r4], r5

    ; POST pointer r5, data r7, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8d0a
    push16 r4
    pop16 r7
    ldi16 r4, 0x6b1f
    push16 r4
    pop16 r0
    ldi16 r5, 0x062d
    ld8u r7, [r5+]
    push16 r7
    push16 r5
    push16 r0
    ldi16 r4, 0x062c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x062d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_EQ_done
.Lld8u_postinc_01b_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_EQ_done:
    brne8 .Lld8u_postinc_01b_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_NE_done
.Lld8u_postinc_01b_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_NE_done:
    brult8 .Lld8u_postinc_01b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_ULT_done
.Lld8u_postinc_01b_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_ULT_done:
    bruge8 .Lld8u_postinc_01b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_UGE_done
.Lld8u_postinc_01b_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_UGE_done:
    brslt8 .Lld8u_postinc_01b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_SLT_done
.Lld8u_postinc_01b_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_SLT_done:
    brsge8 .Lld8u_postinc_01b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01b_SGE_done
.Lld8u_postinc_01b_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0630
    ldi8 r5, 0x2e
    st8 [r4], r5
    ldi16 r4, 0x0631
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x0632
    ldi8 r5, 0x84
    st8 [r4], r5

    ; POST pointer r6, data r0, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8d3c
    push16 r4
    pop16 r0
    ldi16 r4, 0x6c6d
    push16 r4
    pop16 r1
    ldi16 r6, 0x0631
    ld8u r0, [r6+]
    push16 r0
    push16 r6
    push16 r1
    ldi16 r4, 0x0630
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0631
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_EQ_done
.Lld8u_postinc_01c_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_EQ_done:
    brne8 .Lld8u_postinc_01c_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_NE_done
.Lld8u_postinc_01c_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_NE_done:
    brult8 .Lld8u_postinc_01c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_ULT_done
.Lld8u_postinc_01c_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_ULT_done:
    bruge8 .Lld8u_postinc_01c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_UGE_done
.Lld8u_postinc_01c_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_UGE_done:
    brslt8 .Lld8u_postinc_01c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_SLT_done
.Lld8u_postinc_01c_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_SLT_done:
    brsge8 .Lld8u_postinc_01c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01c_SGE_done
.Lld8u_postinc_01c_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0634
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x0635
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0636
    ldi8 r5, 0x8b
    st8 [r4], r5

    ; POST pointer r6, data r0, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8d75
    push16 r4
    pop16 r0
    ldi16 r4, 0x6cba
    push16 r4
    pop16 r1
    ldi16 r6, 0x0635
    ld8u r0, [r6+]
    push16 r0
    push16 r6
    push16 r1
    ldi16 r4, 0x0634
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0635
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_EQ_done
.Lld8u_postinc_01d_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_EQ_done:
    brne8 .Lld8u_postinc_01d_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_NE_done
.Lld8u_postinc_01d_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_NE_done:
    brult8 .Lld8u_postinc_01d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_ULT_done
.Lld8u_postinc_01d_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_ULT_done:
    bruge8 .Lld8u_postinc_01d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_UGE_done
.Lld8u_postinc_01d_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_UGE_done:
    brslt8 .Lld8u_postinc_01d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_SLT_done
.Lld8u_postinc_01d_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_SLT_done:
    brsge8 .Lld8u_postinc_01d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01d_SGE_done
.Lld8u_postinc_01d_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0638
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x0639
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x063a
    ldi8 r5, 0x93
    st8 [r4], r5

    ; POST pointer r6, data r1, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8daf
    push16 r4
    pop16 r1
    ldi16 r4, 0x6c06
    push16 r4
    pop16 r0
    ldi16 r6, 0x0639
    ld8u r1, [r6+]
    push16 r1
    push16 r6
    push16 r0
    ldi16 r4, 0x0638
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0639
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_EQ_done
.Lld8u_postinc_01e_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_EQ_done:
    brne8 .Lld8u_postinc_01e_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_NE_done
.Lld8u_postinc_01e_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_NE_done:
    brult8 .Lld8u_postinc_01e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_ULT_done
.Lld8u_postinc_01e_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_ULT_done:
    bruge8 .Lld8u_postinc_01e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_UGE_done
.Lld8u_postinc_01e_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_UGE_done:
    brslt8 .Lld8u_postinc_01e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_SLT_done
.Lld8u_postinc_01e_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_SLT_done:
    brsge8 .Lld8u_postinc_01e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01e_SGE_done
.Lld8u_postinc_01e_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x063c
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x063d
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x063e
    ldi8 r5, 0x9a
    st8 [r4], r5

    ; POST pointer r6, data r1, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8de8
    push16 r4
    pop16 r1
    ldi16 r4, 0x6c53
    push16 r4
    pop16 r0
    ldi16 r6, 0x063d
    ld8u r1, [r6+]
    push16 r1
    push16 r6
    push16 r0
    ldi16 r4, 0x063c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x063d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_01f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_EQ_done
.Lld8u_postinc_01f_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_EQ_done:
    brne8 .Lld8u_postinc_01f_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_NE_done
.Lld8u_postinc_01f_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_NE_done:
    brult8 .Lld8u_postinc_01f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_ULT_done
.Lld8u_postinc_01f_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_ULT_done:
    bruge8 .Lld8u_postinc_01f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_UGE_done
.Lld8u_postinc_01f_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_UGE_done:
    brslt8 .Lld8u_postinc_01f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_SLT_done
.Lld8u_postinc_01f_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_SLT_done:
    brsge8 .Lld8u_postinc_01f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_01f_SGE_done
.Lld8u_postinc_01f_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_01f_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0640
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x0641
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0642
    ldi8 r5, 0xa2
    st8 [r4], r5

    ; POST pointer r6, data r2, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8e22
    push16 r4
    pop16 r2
    ldi16 r4, 0x6ca0
    push16 r4
    pop16 r0
    ldi16 r6, 0x0641
    ld8u r2, [r6+]
    push16 r2
    push16 r6
    push16 r0
    ldi16 r4, 0x0640
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0641
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_020_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_EQ_done
.Lld8u_postinc_020_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_EQ_done:
    brne8 .Lld8u_postinc_020_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_NE_done
.Lld8u_postinc_020_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_NE_done:
    brult8 .Lld8u_postinc_020_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_ULT_done
.Lld8u_postinc_020_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_ULT_done:
    bruge8 .Lld8u_postinc_020_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_UGE_done
.Lld8u_postinc_020_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_UGE_done:
    brslt8 .Lld8u_postinc_020_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_SLT_done
.Lld8u_postinc_020_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_SLT_done:
    brsge8 .Lld8u_postinc_020_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_020_SGE_done
.Lld8u_postinc_020_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_020_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0644
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0645
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x0646
    ldi8 r5, 0xa9
    st8 [r4], r5

    ; POST pointer r6, data r2, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8e5b
    push16 r4
    pop16 r2
    ldi16 r4, 0x6ced
    push16 r4
    pop16 r0
    ldi16 r6, 0x0645
    ld8u r2, [r6+]
    push16 r2
    push16 r6
    push16 r0
    ldi16 r4, 0x0644
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0645
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_021_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_EQ_done
.Lld8u_postinc_021_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_EQ_done:
    brne8 .Lld8u_postinc_021_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_NE_done
.Lld8u_postinc_021_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_NE_done:
    brult8 .Lld8u_postinc_021_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_ULT_done
.Lld8u_postinc_021_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_ULT_done:
    bruge8 .Lld8u_postinc_021_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_UGE_done
.Lld8u_postinc_021_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_UGE_done:
    brslt8 .Lld8u_postinc_021_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_SLT_done
.Lld8u_postinc_021_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_SLT_done:
    brsge8 .Lld8u_postinc_021_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_021_SGE_done
.Lld8u_postinc_021_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_021_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0648
    ldi8 r5, 0x64
    st8 [r4], r5
    ldi16 r4, 0x0649
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x064a
    ldi8 r5, 0xb1
    st8 [r4], r5

    ; POST pointer r6, data r3, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8e95
    push16 r4
    pop16 r3
    ldi16 r4, 0x6d3a
    push16 r4
    pop16 r0
    ldi16 r6, 0x0649
    ld8u r3, [r6+]
    push16 r3
    push16 r6
    push16 r0
    ldi16 r4, 0x0648
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0649
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_022_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_EQ_done
.Lld8u_postinc_022_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_EQ_done:
    brne8 .Lld8u_postinc_022_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_NE_done
.Lld8u_postinc_022_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_NE_done:
    brult8 .Lld8u_postinc_022_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_ULT_done
.Lld8u_postinc_022_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_ULT_done:
    bruge8 .Lld8u_postinc_022_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_UGE_done
.Lld8u_postinc_022_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_UGE_done:
    brslt8 .Lld8u_postinc_022_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_SLT_done
.Lld8u_postinc_022_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_SLT_done:
    brsge8 .Lld8u_postinc_022_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_022_SGE_done
.Lld8u_postinc_022_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_022_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x064c
    ldi8 r5, 0x6d
    st8 [r4], r5
    ldi16 r4, 0x064d
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x064e
    ldi8 r5, 0xb8
    st8 [r4], r5

    ; POST pointer r6, data r3, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8ece
    push16 r4
    pop16 r3
    ldi16 r4, 0x6d87
    push16 r4
    pop16 r0
    ldi16 r6, 0x064d
    ld8u r3, [r6+]
    push16 r3
    push16 r6
    push16 r0
    ldi16 r4, 0x064c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x064d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_023_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_EQ_done
.Lld8u_postinc_023_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_EQ_done:
    brne8 .Lld8u_postinc_023_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_NE_done
.Lld8u_postinc_023_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_NE_done:
    brult8 .Lld8u_postinc_023_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_ULT_done
.Lld8u_postinc_023_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_ULT_done:
    bruge8 .Lld8u_postinc_023_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_UGE_done
.Lld8u_postinc_023_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_UGE_done:
    brslt8 .Lld8u_postinc_023_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_SLT_done
.Lld8u_postinc_023_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_SLT_done:
    brsge8 .Lld8u_postinc_023_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_023_SGE_done
.Lld8u_postinc_023_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_023_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0650
    ldi8 r5, 0x76
    st8 [r4], r5
    ldi16 r4, 0x0651
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x0652
    ldi8 r5, 0xc0
    st8 [r4], r5

    ; POST pointer r6, data r4, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x8f08
    push16 r5
    pop16 r4
    ldi16 r5, 0x6dd4
    push16 r5
    pop16 r0
    ldi16 r6, 0x0651
    ld8u r4, [r6+]
    push16 r4
    push16 r6
    push16 r0
    ldi16 r4, 0x0650
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0651
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_024_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_EQ_done
.Lld8u_postinc_024_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_EQ_done:
    brne8 .Lld8u_postinc_024_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_NE_done
.Lld8u_postinc_024_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_NE_done:
    brult8 .Lld8u_postinc_024_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_ULT_done
.Lld8u_postinc_024_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_ULT_done:
    bruge8 .Lld8u_postinc_024_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_UGE_done
.Lld8u_postinc_024_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_UGE_done:
    brslt8 .Lld8u_postinc_024_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_SLT_done
.Lld8u_postinc_024_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_SLT_done:
    brsge8 .Lld8u_postinc_024_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_024_SGE_done
.Lld8u_postinc_024_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_024_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0654
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0655
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0656
    ldi8 r5, 0xc7
    st8 [r4], r5

    ; POST pointer r6, data r4, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8f41
    push16 r5
    pop16 r4
    ldi16 r5, 0x6e21
    push16 r5
    pop16 r0
    ldi16 r6, 0x0655
    ld8u r4, [r6+]
    push16 r4
    push16 r6
    push16 r0
    ldi16 r4, 0x0654
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0655
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_025_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_EQ_done
.Lld8u_postinc_025_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_EQ_done:
    brne8 .Lld8u_postinc_025_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_NE_done
.Lld8u_postinc_025_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_NE_done:
    brult8 .Lld8u_postinc_025_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_ULT_done
.Lld8u_postinc_025_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_ULT_done:
    bruge8 .Lld8u_postinc_025_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_UGE_done
.Lld8u_postinc_025_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_UGE_done:
    brslt8 .Lld8u_postinc_025_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_SLT_done
.Lld8u_postinc_025_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_SLT_done:
    brsge8 .Lld8u_postinc_025_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_025_SGE_done
.Lld8u_postinc_025_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_025_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0658
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0659
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x065a
    ldi8 r5, 0xcf
    st8 [r4], r5

    ; POST pointer r6, data r5, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8f7b
    push16 r4
    pop16 r5
    ldi16 r4, 0x6e6e
    push16 r4
    pop16 r0
    ldi16 r6, 0x0659
    ld8u r5, [r6+]
    push16 r5
    push16 r6
    push16 r0
    ldi16 r4, 0x0658
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0659
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_026_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_EQ_done
.Lld8u_postinc_026_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_EQ_done:
    brne8 .Lld8u_postinc_026_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_NE_done
.Lld8u_postinc_026_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_NE_done:
    brult8 .Lld8u_postinc_026_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_ULT_done
.Lld8u_postinc_026_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_ULT_done:
    bruge8 .Lld8u_postinc_026_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_UGE_done
.Lld8u_postinc_026_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_UGE_done:
    brslt8 .Lld8u_postinc_026_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_SLT_done
.Lld8u_postinc_026_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_SLT_done:
    brsge8 .Lld8u_postinc_026_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_026_SGE_done
.Lld8u_postinc_026_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_026_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x065c
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x065d
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x065e
    ldi8 r5, 0xd6
    st8 [r4], r5

    ; POST pointer r6, data r5, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8fb4
    push16 r4
    pop16 r5
    ldi16 r4, 0x6ebb
    push16 r4
    pop16 r0
    ldi16 r6, 0x065d
    ld8u r5, [r6+]
    push16 r5
    push16 r6
    push16 r0
    ldi16 r4, 0x065c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x065d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_027_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_EQ_done
.Lld8u_postinc_027_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_EQ_done:
    brne8 .Lld8u_postinc_027_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_NE_done
.Lld8u_postinc_027_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_NE_done:
    brult8 .Lld8u_postinc_027_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_ULT_done
.Lld8u_postinc_027_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_ULT_done:
    bruge8 .Lld8u_postinc_027_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_UGE_done
.Lld8u_postinc_027_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_UGE_done:
    brslt8 .Lld8u_postinc_027_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_SLT_done
.Lld8u_postinc_027_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_SLT_done:
    brsge8 .Lld8u_postinc_027_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_027_SGE_done
.Lld8u_postinc_027_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_027_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0660
    ldi8 r5, 0x9a
    st8 [r4], r5
    ldi16 r4, 0x0661
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0662
    ldi8 r5, 0xdf
    st8 [r4], r5

    ; POST pointer r6, data r7, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8fef
    push16 r4
    pop16 r7
    ldi16 r4, 0x6f08
    push16 r4
    pop16 r0
    ldi16 r6, 0x0661
    ld8u r7, [r6+]
    push16 r7
    push16 r6
    push16 r0
    ldi16 r4, 0x0660
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0661
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_028_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_EQ_done
.Lld8u_postinc_028_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_EQ_done:
    brne8 .Lld8u_postinc_028_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_NE_done
.Lld8u_postinc_028_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_NE_done:
    brult8 .Lld8u_postinc_028_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_ULT_done
.Lld8u_postinc_028_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_ULT_done:
    bruge8 .Lld8u_postinc_028_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_UGE_done
.Lld8u_postinc_028_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_UGE_done:
    brslt8 .Lld8u_postinc_028_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_SLT_done
.Lld8u_postinc_028_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_SLT_done:
    brsge8 .Lld8u_postinc_028_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_028_SGE_done
.Lld8u_postinc_028_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_028_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0664
    ldi8 r5, 0xa3
    st8 [r4], r5
    ldi16 r4, 0x0665
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x0666
    ldi8 r5, 0xe6
    st8 [r4], r5

    ; POST pointer r6, data r7, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9028
    push16 r4
    pop16 r7
    ldi16 r4, 0x6f55
    push16 r4
    pop16 r0
    ldi16 r6, 0x0665
    ld8u r7, [r6+]
    push16 r7
    push16 r6
    push16 r0
    ldi16 r4, 0x0664
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0665
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_029_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_EQ_done
.Lld8u_postinc_029_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_EQ_done:
    brne8 .Lld8u_postinc_029_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_NE_done
.Lld8u_postinc_029_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_NE_done:
    brult8 .Lld8u_postinc_029_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_ULT_done
.Lld8u_postinc_029_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_ULT_done:
    bruge8 .Lld8u_postinc_029_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_UGE_done
.Lld8u_postinc_029_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_UGE_done:
    brslt8 .Lld8u_postinc_029_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_SLT_done
.Lld8u_postinc_029_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_SLT_done:
    brsge8 .Lld8u_postinc_029_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_029_SGE_done
.Lld8u_postinc_029_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_029_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0668
    ldi8 r5, 0xad
    st8 [r4], r5
    ldi16 r4, 0x0669
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x066a
    ldi8 r5, 0xe6
    st8 [r4], r5

    ; POST pointer r7, data r0, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x905a
    push16 r4
    pop16 r0
    ldi16 r4, 0x70a3
    push16 r4
    pop16 r1
    ldi16 r7, 0x0669
    ld8u r0, [r7+]
    push16 r0
    push16 r7
    push16 r1
    ldi16 r4, 0x0668
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0669
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_EQ_done
.Lld8u_postinc_02a_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_EQ_done:
    brne8 .Lld8u_postinc_02a_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_NE_done
.Lld8u_postinc_02a_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_NE_done:
    brult8 .Lld8u_postinc_02a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_ULT_done
.Lld8u_postinc_02a_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_ULT_done:
    bruge8 .Lld8u_postinc_02a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_UGE_done
.Lld8u_postinc_02a_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_UGE_done:
    brslt8 .Lld8u_postinc_02a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_SLT_done
.Lld8u_postinc_02a_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_SLT_done:
    brsge8 .Lld8u_postinc_02a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02a_SGE_done
.Lld8u_postinc_02a_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x066c
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x066d
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x066e
    ldi8 r5, 0xed
    st8 [r4], r5

    ; POST pointer r7, data r0, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9093
    push16 r4
    pop16 r0
    ldi16 r4, 0x70f0
    push16 r4
    pop16 r1
    ldi16 r7, 0x066d
    ld8u r0, [r7+]
    push16 r0
    push16 r7
    push16 r1
    ldi16 r4, 0x066c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x066d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_EQ_done
.Lld8u_postinc_02b_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_EQ_done:
    brne8 .Lld8u_postinc_02b_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_NE_done
.Lld8u_postinc_02b_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_NE_done:
    brult8 .Lld8u_postinc_02b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_ULT_done
.Lld8u_postinc_02b_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_ULT_done:
    bruge8 .Lld8u_postinc_02b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_UGE_done
.Lld8u_postinc_02b_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_UGE_done:
    brslt8 .Lld8u_postinc_02b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_SLT_done
.Lld8u_postinc_02b_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_SLT_done:
    brsge8 .Lld8u_postinc_02b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02b_SGE_done
.Lld8u_postinc_02b_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0670
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x0671
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x0672
    ldi8 r5, 0xf5
    st8 [r4], r5

    ; POST pointer r7, data r1, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x90cd
    push16 r4
    pop16 r1
    ldi16 r4, 0x703c
    push16 r4
    pop16 r0
    ldi16 r7, 0x0671
    ld8u r1, [r7+]
    push16 r1
    push16 r7
    push16 r0
    ldi16 r4, 0x0670
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0671
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_EQ_done
.Lld8u_postinc_02c_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_EQ_done:
    brne8 .Lld8u_postinc_02c_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_NE_done
.Lld8u_postinc_02c_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_NE_done:
    brult8 .Lld8u_postinc_02c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_ULT_done
.Lld8u_postinc_02c_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_ULT_done:
    bruge8 .Lld8u_postinc_02c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_UGE_done
.Lld8u_postinc_02c_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_UGE_done:
    brslt8 .Lld8u_postinc_02c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_SLT_done
.Lld8u_postinc_02c_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_SLT_done:
    brsge8 .Lld8u_postinc_02c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02c_SGE_done
.Lld8u_postinc_02c_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0674
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x0675
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0676
    ldi8 r5, 0xfc
    st8 [r4], r5

    ; POST pointer r7, data r1, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x9106
    push16 r4
    pop16 r1
    ldi16 r4, 0x7089
    push16 r4
    pop16 r0
    ldi16 r7, 0x0675
    ld8u r1, [r7+]
    push16 r1
    push16 r7
    push16 r0
    ldi16 r4, 0x0674
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0675
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_EQ_done
.Lld8u_postinc_02d_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_EQ_done:
    brne8 .Lld8u_postinc_02d_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_NE_done
.Lld8u_postinc_02d_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_NE_done:
    brult8 .Lld8u_postinc_02d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_ULT_done
.Lld8u_postinc_02d_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_ULT_done:
    bruge8 .Lld8u_postinc_02d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_UGE_done
.Lld8u_postinc_02d_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_UGE_done:
    brslt8 .Lld8u_postinc_02d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_SLT_done
.Lld8u_postinc_02d_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_SLT_done:
    brsge8 .Lld8u_postinc_02d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02d_SGE_done
.Lld8u_postinc_02d_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0678
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0679
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x067a
    ldi8 r5, 0x04
    st8 [r4], r5

    ; POST pointer r7, data r2, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9140
    push16 r4
    pop16 r2
    ldi16 r4, 0x70d6
    push16 r4
    pop16 r0
    ldi16 r7, 0x0679
    ld8u r2, [r7+]
    push16 r2
    push16 r7
    push16 r0
    ldi16 r4, 0x0678
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0679
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_EQ_done
.Lld8u_postinc_02e_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_EQ_done:
    brne8 .Lld8u_postinc_02e_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_NE_done
.Lld8u_postinc_02e_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_NE_done:
    brult8 .Lld8u_postinc_02e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_ULT_done
.Lld8u_postinc_02e_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_ULT_done:
    bruge8 .Lld8u_postinc_02e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_UGE_done
.Lld8u_postinc_02e_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_UGE_done:
    brslt8 .Lld8u_postinc_02e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_SLT_done
.Lld8u_postinc_02e_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_SLT_done:
    brsge8 .Lld8u_postinc_02e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02e_SGE_done
.Lld8u_postinc_02e_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x067c
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x067d
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x067e
    ldi8 r5, 0x0b
    st8 [r4], r5

    ; POST pointer r7, data r2, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x9179
    push16 r4
    pop16 r2
    ldi16 r4, 0x7123
    push16 r4
    pop16 r0
    ldi16 r7, 0x067d
    ld8u r2, [r7+]
    push16 r2
    push16 r7
    push16 r0
    ldi16 r4, 0x067c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x067d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_02f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_EQ_done
.Lld8u_postinc_02f_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_EQ_done:
    brne8 .Lld8u_postinc_02f_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_NE_done
.Lld8u_postinc_02f_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_NE_done:
    brult8 .Lld8u_postinc_02f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_ULT_done
.Lld8u_postinc_02f_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_ULT_done:
    bruge8 .Lld8u_postinc_02f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_UGE_done
.Lld8u_postinc_02f_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_UGE_done:
    brslt8 .Lld8u_postinc_02f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_SLT_done
.Lld8u_postinc_02f_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_SLT_done:
    brsge8 .Lld8u_postinc_02f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_02f_SGE_done
.Lld8u_postinc_02f_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_02f_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0680
    ldi8 r5, 0xe3
    st8 [r4], r5
    ldi16 r4, 0x0681
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0682
    ldi8 r5, 0x13
    st8 [r4], r5

    ; POST pointer r7, data r3, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x91b3
    push16 r4
    pop16 r3
    ldi16 r4, 0x7170
    push16 r4
    pop16 r0
    ldi16 r7, 0x0681
    ld8u r3, [r7+]
    push16 r3
    push16 r7
    push16 r0
    ldi16 r4, 0x0680
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0681
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_030_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_EQ_done
.Lld8u_postinc_030_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_EQ_done:
    brne8 .Lld8u_postinc_030_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_NE_done
.Lld8u_postinc_030_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_NE_done:
    brult8 .Lld8u_postinc_030_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_ULT_done
.Lld8u_postinc_030_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_ULT_done:
    bruge8 .Lld8u_postinc_030_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_UGE_done
.Lld8u_postinc_030_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_UGE_done:
    brslt8 .Lld8u_postinc_030_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_SLT_done
.Lld8u_postinc_030_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_SLT_done:
    brsge8 .Lld8u_postinc_030_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_030_SGE_done
.Lld8u_postinc_030_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_030_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0684
    ldi8 r5, 0xec
    st8 [r4], r5
    ldi16 r4, 0x0685
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x0686
    ldi8 r5, 0x1a
    st8 [r4], r5

    ; POST pointer r7, data r3, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x91ec
    push16 r4
    pop16 r3
    ldi16 r4, 0x71bd
    push16 r4
    pop16 r0
    ldi16 r7, 0x0685
    ld8u r3, [r7+]
    push16 r3
    push16 r7
    push16 r0
    ldi16 r4, 0x0684
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0685
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_031_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_EQ_done
.Lld8u_postinc_031_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_EQ_done:
    brne8 .Lld8u_postinc_031_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_NE_done
.Lld8u_postinc_031_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_NE_done:
    brult8 .Lld8u_postinc_031_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_ULT_done
.Lld8u_postinc_031_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_ULT_done:
    bruge8 .Lld8u_postinc_031_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_UGE_done
.Lld8u_postinc_031_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_UGE_done:
    brslt8 .Lld8u_postinc_031_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_SLT_done
.Lld8u_postinc_031_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_SLT_done:
    brsge8 .Lld8u_postinc_031_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_031_SGE_done
.Lld8u_postinc_031_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_031_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0688
    ldi8 r5, 0xf5
    st8 [r4], r5
    ldi16 r4, 0x0689
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x068a
    ldi8 r5, 0x22
    st8 [r4], r5

    ; POST pointer r7, data r4, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x9226
    push16 r5
    pop16 r4
    ldi16 r5, 0x720a
    push16 r5
    pop16 r0
    ldi16 r7, 0x0689
    ld8u r4, [r7+]
    push16 r4
    push16 r7
    push16 r0
    ldi16 r4, 0x0688
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0689
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_032_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_EQ_done
.Lld8u_postinc_032_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_EQ_done:
    brne8 .Lld8u_postinc_032_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_NE_done
.Lld8u_postinc_032_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_NE_done:
    brult8 .Lld8u_postinc_032_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_ULT_done
.Lld8u_postinc_032_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_ULT_done:
    bruge8 .Lld8u_postinc_032_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_UGE_done
.Lld8u_postinc_032_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_UGE_done:
    brslt8 .Lld8u_postinc_032_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_SLT_done
.Lld8u_postinc_032_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_SLT_done:
    brsge8 .Lld8u_postinc_032_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_032_SGE_done
.Lld8u_postinc_032_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_032_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x068c
    ldi8 r5, 0xfe
    st8 [r4], r5
    ldi16 r4, 0x068d
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x068e
    ldi8 r5, 0x29
    st8 [r4], r5

    ; POST pointer r7, data r4, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x925f
    push16 r5
    pop16 r4
    ldi16 r5, 0x7257
    push16 r5
    pop16 r0
    ldi16 r7, 0x068d
    ld8u r4, [r7+]
    push16 r4
    push16 r7
    push16 r0
    ldi16 r4, 0x068c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x068d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_033_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_EQ_done
.Lld8u_postinc_033_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_EQ_done:
    brne8 .Lld8u_postinc_033_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_NE_done
.Lld8u_postinc_033_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_NE_done:
    brult8 .Lld8u_postinc_033_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_ULT_done
.Lld8u_postinc_033_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_ULT_done:
    bruge8 .Lld8u_postinc_033_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_UGE_done
.Lld8u_postinc_033_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_UGE_done:
    brslt8 .Lld8u_postinc_033_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_SLT_done
.Lld8u_postinc_033_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_SLT_done:
    brsge8 .Lld8u_postinc_033_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_033_SGE_done
.Lld8u_postinc_033_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_033_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0690
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x0691
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x0692
    ldi8 r5, 0x31
    st8 [r4], r5

    ; POST pointer r7, data r5, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x9299
    push16 r4
    pop16 r5
    ldi16 r4, 0x72a4
    push16 r4
    pop16 r0
    ldi16 r7, 0x0691
    ld8u r5, [r7+]
    push16 r5
    push16 r7
    push16 r0
    ldi16 r4, 0x0690
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0691
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_034_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_EQ_done
.Lld8u_postinc_034_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_EQ_done:
    brne8 .Lld8u_postinc_034_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_NE_done
.Lld8u_postinc_034_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_NE_done:
    brult8 .Lld8u_postinc_034_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_ULT_done
.Lld8u_postinc_034_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_ULT_done:
    bruge8 .Lld8u_postinc_034_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_UGE_done
.Lld8u_postinc_034_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_UGE_done:
    brslt8 .Lld8u_postinc_034_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_SLT_done
.Lld8u_postinc_034_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_SLT_done:
    brsge8 .Lld8u_postinc_034_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_034_SGE_done
.Lld8u_postinc_034_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_034_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0694
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x0695
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0696
    ldi8 r5, 0x38
    st8 [r4], r5

    ; POST pointer r7, data r5, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x92d2
    push16 r4
    pop16 r5
    ldi16 r4, 0x72f1
    push16 r4
    pop16 r0
    ldi16 r7, 0x0695
    ld8u r5, [r7+]
    push16 r5
    push16 r7
    push16 r0
    ldi16 r4, 0x0694
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0695
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_035_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_EQ_done
.Lld8u_postinc_035_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_EQ_done:
    brne8 .Lld8u_postinc_035_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_NE_done
.Lld8u_postinc_035_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_NE_done:
    brult8 .Lld8u_postinc_035_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_ULT_done
.Lld8u_postinc_035_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_ULT_done:
    bruge8 .Lld8u_postinc_035_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_UGE_done
.Lld8u_postinc_035_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_UGE_done:
    brslt8 .Lld8u_postinc_035_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_SLT_done
.Lld8u_postinc_035_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_SLT_done:
    brsge8 .Lld8u_postinc_035_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_035_SGE_done
.Lld8u_postinc_035_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_035_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0698
    ldi8 r5, 0x19
    st8 [r4], r5
    ldi16 r4, 0x0699
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x069a
    ldi8 r5, 0x40
    st8 [r4], r5

    ; POST pointer r7, data r6, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x930c
    push16 r4
    pop16 r6
    ldi16 r4, 0x733e
    push16 r4
    pop16 r0
    ldi16 r7, 0x0699
    ld8u r6, [r7+]
    push16 r6
    push16 r7
    push16 r0
    ldi16 r4, 0x0698
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0699
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_036_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_EQ_done
.Lld8u_postinc_036_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_EQ_done:
    brne8 .Lld8u_postinc_036_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_NE_done
.Lld8u_postinc_036_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_NE_done:
    brult8 .Lld8u_postinc_036_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_ULT_done
.Lld8u_postinc_036_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_ULT_done:
    bruge8 .Lld8u_postinc_036_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_UGE_done
.Lld8u_postinc_036_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_UGE_done:
    brslt8 .Lld8u_postinc_036_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_SLT_done
.Lld8u_postinc_036_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_SLT_done:
    brsge8 .Lld8u_postinc_036_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_036_SGE_done
.Lld8u_postinc_036_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_036_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x069c
    ldi8 r5, 0x22
    st8 [r4], r5
    ldi16 r4, 0x069d
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x069e
    ldi8 r5, 0x47
    st8 [r4], r5

    ; POST pointer r7, data r6, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x9345
    push16 r4
    pop16 r6
    ldi16 r4, 0x738b
    push16 r4
    pop16 r0
    ldi16 r7, 0x069d
    ld8u r6, [r7+]
    push16 r6
    push16 r7
    push16 r0
    ldi16 r4, 0x069c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x069d
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld8u_postinc_037_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_EQ_done
.Lld8u_postinc_037_EQ_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_EQ_done:
    brne8 .Lld8u_postinc_037_NE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_NE_done
.Lld8u_postinc_037_NE_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_NE_done:
    brult8 .Lld8u_postinc_037_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_ULT_done
.Lld8u_postinc_037_ULT_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_ULT_done:
    bruge8 .Lld8u_postinc_037_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_UGE_done
.Lld8u_postinc_037_UGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_UGE_done:
    brslt8 .Lld8u_postinc_037_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_SLT_done
.Lld8u_postinc_037_SLT_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_SLT_done:
    brsge8 .Lld8u_postinc_037_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld8u_postinc_037_SGE_done
.Lld8u_postinc_037_SGE_true:
    mem_emit_char 'B'
.Lld8u_postinc_037_SGE_done:
    mem_emit_char '\n'

    sys debug_break
