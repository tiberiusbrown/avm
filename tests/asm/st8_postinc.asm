.include "include/secondary_memory_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 c0, 0x0680
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x0681
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x0682
    ldi8 c1, 0xc0
    st8 [c0], c1

    ; POST pointer c0, data r0, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0x8080
    push16 r5
    pop16 r0
    ldi16 c1, 0x6401
    push16 r5
    pop16 r1
    ldi16 c0, 0x0681
    st8 [c0+], r0
    push16 r0
    push16 r4
    push16 r1
    ldi16 c0, 0x0680
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0681
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_000_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_EQ_done
.Lst8_postinc_000_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_000_EQ_done:
    brne8 .Lst8_postinc_000_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_NE_done
.Lst8_postinc_000_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_000_NE_done:
    brult8 .Lst8_postinc_000_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_ULT_done
.Lst8_postinc_000_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_000_ULT_done:
    bruge8 .Lst8_postinc_000_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_UGE_done
.Lst8_postinc_000_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_000_UGE_done:
    brslt8 .Lst8_postinc_000_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_SLT_done
.Lst8_postinc_000_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_000_SLT_done:
    brsge8 .Lst8_postinc_000_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_000_SGE_done
.Lst8_postinc_000_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_000_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0684
    ldi8 c1, 0x39
    st8 [c0], c1
    ldi16 c0, 0x0685
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x0686
    ldi8 c1, 0xc7
    st8 [c0], c1

    ; POST pointer c0, data r0, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0x8dff
    push16 r5
    pop16 r0
    ldi16 c1, 0x644e
    push16 r5
    pop16 r1
    ldi16 c0, 0x0685
    st8 [c0+], r0
    push16 r0
    push16 r4
    push16 r1
    ldi16 c0, 0x0684
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0685
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_001_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_EQ_done
.Lst8_postinc_001_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_001_EQ_done:
    brne8 .Lst8_postinc_001_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_NE_done
.Lst8_postinc_001_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_001_NE_done:
    brult8 .Lst8_postinc_001_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_ULT_done
.Lst8_postinc_001_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_001_ULT_done:
    bruge8 .Lst8_postinc_001_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_UGE_done
.Lst8_postinc_001_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_001_UGE_done:
    brslt8 .Lst8_postinc_001_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_SLT_done
.Lst8_postinc_001_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_001_SLT_done:
    brsge8 .Lst8_postinc_001_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_001_SGE_done
.Lst8_postinc_001_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_001_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0688
    ldi8 c1, 0x42
    st8 [c0], c1
    ldi16 c0, 0x0689
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x068a
    ldi8 c1, 0xcf
    st8 [c0], c1

    ; POST pointer c0, data r1, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x9aaa
    push16 r5
    pop16 r1
    ldi16 c1, 0x639a
    push16 r5
    pop16 r0
    ldi16 c0, 0x0689
    st8 [c0+], r1
    push16 r1
    push16 r4
    push16 r0
    ldi16 c0, 0x0688
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0689
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_002_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_EQ_done
.Lst8_postinc_002_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_002_EQ_done:
    brne8 .Lst8_postinc_002_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_NE_done
.Lst8_postinc_002_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_002_NE_done:
    brult8 .Lst8_postinc_002_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_ULT_done
.Lst8_postinc_002_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_002_ULT_done:
    bruge8 .Lst8_postinc_002_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_UGE_done
.Lst8_postinc_002_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_002_UGE_done:
    brslt8 .Lst8_postinc_002_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_SLT_done
.Lst8_postinc_002_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_002_SLT_done:
    brsge8 .Lst8_postinc_002_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_002_SGE_done
.Lst8_postinc_002_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_002_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x068c
    ldi8 c1, 0x4b
    st8 [c0], c1
    ldi16 c0, 0x068d
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x068e
    ldi8 c1, 0xd6
    st8 [c0], c1

    ; POST pointer c0, data r1, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0xa7c3
    push16 r5
    pop16 r1
    ldi16 c1, 0x63e7
    push16 r5
    pop16 r0
    ldi16 c0, 0x068d
    st8 [c0+], r1
    push16 r1
    push16 r4
    push16 r0
    ldi16 c0, 0x068c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x068d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_003_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_EQ_done
.Lst8_postinc_003_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_003_EQ_done:
    brne8 .Lst8_postinc_003_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_NE_done
.Lst8_postinc_003_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_003_NE_done:
    brult8 .Lst8_postinc_003_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_ULT_done
.Lst8_postinc_003_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_003_ULT_done:
    bruge8 .Lst8_postinc_003_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_UGE_done
.Lst8_postinc_003_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_003_UGE_done:
    brslt8 .Lst8_postinc_003_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_SLT_done
.Lst8_postinc_003_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_003_SLT_done:
    brsge8 .Lst8_postinc_003_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_003_SGE_done
.Lst8_postinc_003_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_003_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0690
    ldi8 c1, 0x54
    st8 [c0], c1
    ldi16 c0, 0x0691
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x0692
    ldi8 c1, 0xde
    st8 [c0], c1

    ; POST pointer c0, data r2, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0xb401
    push16 r5
    pop16 r2
    ldi16 c1, 0x6434
    push16 r5
    pop16 r0
    ldi16 c0, 0x0691
    st8 [c0+], r2
    push16 r2
    push16 r4
    push16 r0
    ldi16 c0, 0x0690
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0691
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_004_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_EQ_done
.Lst8_postinc_004_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_004_EQ_done:
    brne8 .Lst8_postinc_004_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_NE_done
.Lst8_postinc_004_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_004_NE_done:
    brult8 .Lst8_postinc_004_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_ULT_done
.Lst8_postinc_004_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_004_ULT_done:
    bruge8 .Lst8_postinc_004_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_UGE_done
.Lst8_postinc_004_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_004_UGE_done:
    brslt8 .Lst8_postinc_004_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_SLT_done
.Lst8_postinc_004_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_004_SLT_done:
    brsge8 .Lst8_postinc_004_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_004_SGE_done
.Lst8_postinc_004_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_004_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0694
    ldi8 c1, 0x5d
    st8 [c0], c1
    ldi16 c0, 0x0695
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x0696
    ldi8 c1, 0xe5
    st8 [c0], c1

    ; POST pointer c0, data r2, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0xc17f
    push16 r5
    pop16 r2
    ldi16 c1, 0x6481
    push16 r5
    pop16 r0
    ldi16 c0, 0x0695
    st8 [c0+], r2
    push16 r2
    push16 r4
    push16 r0
    ldi16 c0, 0x0694
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0695
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_005_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_EQ_done
.Lst8_postinc_005_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_005_EQ_done:
    brne8 .Lst8_postinc_005_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_NE_done
.Lst8_postinc_005_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_005_NE_done:
    brult8 .Lst8_postinc_005_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_ULT_done
.Lst8_postinc_005_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_005_ULT_done:
    bruge8 .Lst8_postinc_005_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_UGE_done
.Lst8_postinc_005_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_005_UGE_done:
    brslt8 .Lst8_postinc_005_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_SLT_done
.Lst8_postinc_005_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_005_SLT_done:
    brsge8 .Lst8_postinc_005_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_005_SGE_done
.Lst8_postinc_005_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_005_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0698
    ldi8 c1, 0x66
    st8 [c0], c1
    ldi16 c0, 0x0699
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x069a
    ldi8 c1, 0xed
    st8 [c0], c1

    ; POST pointer c0, data r3, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0xceff
    push16 r5
    pop16 r3
    ldi16 c1, 0x64ce
    push16 r5
    pop16 r0
    ldi16 c0, 0x0699
    st8 [c0+], r3
    push16 r3
    push16 r4
    push16 r0
    ldi16 c0, 0x0698
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0699
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_006_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_EQ_done
.Lst8_postinc_006_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_006_EQ_done:
    brne8 .Lst8_postinc_006_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_NE_done
.Lst8_postinc_006_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_006_NE_done:
    brult8 .Lst8_postinc_006_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_ULT_done
.Lst8_postinc_006_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_006_ULT_done:
    bruge8 .Lst8_postinc_006_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_UGE_done
.Lst8_postinc_006_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_006_UGE_done:
    brslt8 .Lst8_postinc_006_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_SLT_done
.Lst8_postinc_006_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_006_SLT_done:
    brsge8 .Lst8_postinc_006_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_006_SGE_done
.Lst8_postinc_006_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_006_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x069c
    ldi8 c1, 0x6f
    st8 [c0], c1
    ldi16 c0, 0x069d
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x069e
    ldi8 c1, 0xf4
    st8 [c0], c1

    ; POST pointer c0, data r3, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0xdb55
    push16 r5
    pop16 r3
    ldi16 c1, 0x651b
    push16 r5
    pop16 r0
    ldi16 c0, 0x069d
    st8 [c0+], r3
    push16 r3
    push16 r4
    push16 r0
    ldi16 c0, 0x069c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x069d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_007_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_EQ_done
.Lst8_postinc_007_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_007_EQ_done:
    brne8 .Lst8_postinc_007_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_NE_done
.Lst8_postinc_007_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_007_NE_done:
    brult8 .Lst8_postinc_007_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_ULT_done
.Lst8_postinc_007_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_007_ULT_done:
    bruge8 .Lst8_postinc_007_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_UGE_done
.Lst8_postinc_007_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_007_UGE_done:
    brslt8 .Lst8_postinc_007_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_SLT_done
.Lst8_postinc_007_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_007_SLT_done:
    brsge8 .Lst8_postinc_007_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_007_SGE_done
.Lst8_postinc_007_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_007_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a0
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x06a1
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x06a2
    ldi8 c1, 0xfc
    st8 [c0], c1

    ; POST pointer c0, data r4, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0x6568
    push16 r5
    pop16 r0
    ldi16 c0, 0x06a1
    st8 [c0+], r4
    push16 r4
    push16 r4
    push16 r0
    ldi16 c0, 0x06a0
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a1
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_008_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_EQ_done
.Lst8_postinc_008_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_008_EQ_done:
    brne8 .Lst8_postinc_008_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_NE_done
.Lst8_postinc_008_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_008_NE_done:
    brult8 .Lst8_postinc_008_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_ULT_done
.Lst8_postinc_008_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_008_ULT_done:
    bruge8 .Lst8_postinc_008_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_UGE_done
.Lst8_postinc_008_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_008_UGE_done:
    brslt8 .Lst8_postinc_008_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_SLT_done
.Lst8_postinc_008_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_008_SLT_done:
    brsge8 .Lst8_postinc_008_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_008_SGE_done
.Lst8_postinc_008_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_008_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a4
    ldi8 c1, 0x81
    st8 [c0], c1
    ldi16 c0, 0x06a5
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x06a6
    ldi8 c1, 0x03
    st8 [c0], c1

    ; POST pointer c0, data r4, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0x65b5
    push16 r5
    pop16 r0
    ldi16 c0, 0x06a5
    st8 [c0+], r4
    push16 r4
    push16 r4
    push16 r0
    ldi16 c0, 0x06a4
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a5
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_009_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_EQ_done
.Lst8_postinc_009_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_009_EQ_done:
    brne8 .Lst8_postinc_009_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_NE_done
.Lst8_postinc_009_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_009_NE_done:
    brult8 .Lst8_postinc_009_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_ULT_done
.Lst8_postinc_009_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_009_ULT_done:
    bruge8 .Lst8_postinc_009_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_UGE_done
.Lst8_postinc_009_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_009_UGE_done:
    brslt8 .Lst8_postinc_009_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_SLT_done
.Lst8_postinc_009_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_009_SLT_done:
    brsge8 .Lst8_postinc_009_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_009_SGE_done
.Lst8_postinc_009_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_009_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a8
    ldi8 c1, 0x8a
    st8 [c0], c1
    ldi16 c0, 0x06a9
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x06aa
    ldi8 c1, 0x0b
    st8 [c0], c1

    ; POST pointer c0, data r5, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c2, 0x027f
    push16 r6
    pop16 r5
    ldi16 c2, 0x6602
    push16 r6
    pop16 r0
    ldi16 c0, 0x06a9
    st8 [c0+], r5
    push16 r5
    push16 r4
    push16 r0
    ldi16 c0, 0x06a8
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a9
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_EQ_done
.Lst8_postinc_00a_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_EQ_done:
    brne8 .Lst8_postinc_00a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_NE_done
.Lst8_postinc_00a_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_NE_done:
    brult8 .Lst8_postinc_00a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_ULT_done
.Lst8_postinc_00a_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_ULT_done:
    bruge8 .Lst8_postinc_00a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_UGE_done
.Lst8_postinc_00a_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_UGE_done:
    brslt8 .Lst8_postinc_00a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_SLT_done
.Lst8_postinc_00a_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_SLT_done:
    brsge8 .Lst8_postinc_00a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00a_SGE_done
.Lst8_postinc_00a_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06ac
    ldi8 c1, 0x93
    st8 [c0], c1
    ldi16 c0, 0x06ad
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x06ae
    ldi8 c1, 0x12
    st8 [c0], c1

    ; POST pointer c0, data r5, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c2, 0x0f80
    push16 r6
    pop16 r5
    ldi16 c2, 0x664f
    push16 r6
    pop16 r0
    ldi16 c0, 0x06ad
    st8 [c0+], r5
    push16 r5
    push16 r4
    push16 r0
    ldi16 c0, 0x06ac
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06ad
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_EQ_done
.Lst8_postinc_00b_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_EQ_done:
    brne8 .Lst8_postinc_00b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_NE_done
.Lst8_postinc_00b_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_NE_done:
    brult8 .Lst8_postinc_00b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_ULT_done
.Lst8_postinc_00b_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_ULT_done:
    bruge8 .Lst8_postinc_00b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_UGE_done
.Lst8_postinc_00b_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_UGE_done:
    brslt8 .Lst8_postinc_00b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_SLT_done
.Lst8_postinc_00b_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_SLT_done:
    brsge8 .Lst8_postinc_00b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00b_SGE_done
.Lst8_postinc_00b_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b0
    ldi8 c1, 0x9c
    st8 [c0], c1
    ldi16 c0, 0x06b1
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x06b2
    ldi8 c1, 0x1a
    st8 [c0], c1

    ; POST pointer c0, data r6, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0x1c55
    push16 r5
    pop16 r6
    ldi16 c1, 0x669c
    push16 r5
    pop16 r0
    ldi16 c0, 0x06b1
    st8 [c0+], r6
    push16 r6
    push16 r4
    push16 r0
    ldi16 c0, 0x06b0
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b1
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_EQ_done
.Lst8_postinc_00c_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_EQ_done:
    brne8 .Lst8_postinc_00c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_NE_done
.Lst8_postinc_00c_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_NE_done:
    brult8 .Lst8_postinc_00c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_ULT_done
.Lst8_postinc_00c_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_ULT_done:
    bruge8 .Lst8_postinc_00c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_UGE_done
.Lst8_postinc_00c_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_UGE_done:
    brslt8 .Lst8_postinc_00c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_SLT_done
.Lst8_postinc_00c_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_SLT_done:
    brsge8 .Lst8_postinc_00c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00c_SGE_done
.Lst8_postinc_00c_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b4
    ldi8 c1, 0xa5
    st8 [c0], c1
    ldi16 c0, 0x06b5
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x06b6
    ldi8 c1, 0x21
    st8 [c0], c1

    ; POST pointer c0, data r6, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x29aa
    push16 r5
    pop16 r6
    ldi16 c1, 0x66e9
    push16 r5
    pop16 r0
    ldi16 c0, 0x06b5
    st8 [c0+], r6
    push16 r6
    push16 r4
    push16 r0
    ldi16 c0, 0x06b4
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b5
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_EQ_done
.Lst8_postinc_00d_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_EQ_done:
    brne8 .Lst8_postinc_00d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_NE_done
.Lst8_postinc_00d_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_NE_done:
    brult8 .Lst8_postinc_00d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_ULT_done
.Lst8_postinc_00d_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_ULT_done:
    bruge8 .Lst8_postinc_00d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_UGE_done
.Lst8_postinc_00d_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_UGE_done:
    brslt8 .Lst8_postinc_00d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_SLT_done
.Lst8_postinc_00d_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_SLT_done:
    brsge8 .Lst8_postinc_00d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00d_SGE_done
.Lst8_postinc_00d_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b8
    ldi8 c1, 0xae
    st8 [c0], c1
    ldi16 c0, 0x06b9
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x06ba
    ldi8 c1, 0x29
    st8 [c0], c1

    ; POST pointer c0, data r7, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0x3600
    push16 r5
    pop16 r7
    ldi16 c1, 0x6736
    push16 r5
    pop16 r0
    ldi16 c0, 0x06b9
    st8 [c0+], r7
    push16 r7
    push16 r4
    push16 r0
    ldi16 c0, 0x06b8
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b9
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_EQ_done
.Lst8_postinc_00e_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_EQ_done:
    brne8 .Lst8_postinc_00e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_NE_done
.Lst8_postinc_00e_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_NE_done:
    brult8 .Lst8_postinc_00e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_ULT_done
.Lst8_postinc_00e_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_ULT_done:
    bruge8 .Lst8_postinc_00e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_UGE_done
.Lst8_postinc_00e_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_UGE_done:
    brslt8 .Lst8_postinc_00e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_SLT_done
.Lst8_postinc_00e_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_SLT_done:
    brsge8 .Lst8_postinc_00e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00e_SGE_done
.Lst8_postinc_00e_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06bc
    ldi8 c1, 0xb7
    st8 [c0], c1
    ldi16 c0, 0x06bd
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x06be
    ldi8 c1, 0x30
    st8 [c0], c1

    ; POST pointer c0, data r7, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0x4301
    push16 r5
    pop16 r7
    ldi16 c1, 0x6783
    push16 r5
    pop16 r0
    ldi16 c0, 0x06bd
    st8 [c0+], r7
    push16 r7
    push16 r4
    push16 r0
    ldi16 c0, 0x06bc
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06bd
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_00f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_EQ_done
.Lst8_postinc_00f_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_EQ_done:
    brne8 .Lst8_postinc_00f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_NE_done
.Lst8_postinc_00f_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_NE_done:
    brult8 .Lst8_postinc_00f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_ULT_done
.Lst8_postinc_00f_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_ULT_done:
    bruge8 .Lst8_postinc_00f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_UGE_done
.Lst8_postinc_00f_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_UGE_done:
    brslt8 .Lst8_postinc_00f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_SLT_done
.Lst8_postinc_00f_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_SLT_done:
    brsge8 .Lst8_postinc_00f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_00f_SGE_done
.Lst8_postinc_00f_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_00f_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0600
    ldi8 c1, 0xc1
    st8 [c0], c1
    ldi16 c0, 0x0601
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x0602
    ldi8 c1, 0x30
    st8 [c0], c1

    ; POST pointer c1, data r0, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x5080
    push16 r4
    pop16 r0
    ldi16 c0, 0x68d1
    push16 r4
    pop16 r1
    ldi16 c1, 0x0601
    st8 [c1+], r0
    push16 r0
    push16 r5
    push16 r1
    ldi16 c0, 0x0600
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0601
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_010_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_EQ_done
.Lst8_postinc_010_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_010_EQ_done:
    brne8 .Lst8_postinc_010_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_NE_done
.Lst8_postinc_010_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_010_NE_done:
    brult8 .Lst8_postinc_010_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_ULT_done
.Lst8_postinc_010_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_010_ULT_done:
    bruge8 .Lst8_postinc_010_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_UGE_done
.Lst8_postinc_010_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_010_UGE_done:
    brslt8 .Lst8_postinc_010_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_SLT_done
.Lst8_postinc_010_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_010_SLT_done:
    brsge8 .Lst8_postinc_010_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_010_SGE_done
.Lst8_postinc_010_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_010_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0604
    ldi8 c1, 0xca
    st8 [c0], c1
    ldi16 c0, 0x0605
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0606
    ldi8 c1, 0x37
    st8 [c0], c1

    ; POST pointer c1, data r0, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x5dff
    push16 r4
    pop16 r0
    ldi16 c0, 0x691e
    push16 r4
    pop16 r1
    ldi16 c1, 0x0605
    st8 [c1+], r0
    push16 r0
    push16 r5
    push16 r1
    ldi16 c0, 0x0604
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0605
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_011_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_EQ_done
.Lst8_postinc_011_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_011_EQ_done:
    brne8 .Lst8_postinc_011_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_NE_done
.Lst8_postinc_011_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_011_NE_done:
    brult8 .Lst8_postinc_011_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_ULT_done
.Lst8_postinc_011_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_011_ULT_done:
    bruge8 .Lst8_postinc_011_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_UGE_done
.Lst8_postinc_011_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_011_UGE_done:
    brslt8 .Lst8_postinc_011_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_SLT_done
.Lst8_postinc_011_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_011_SLT_done:
    brsge8 .Lst8_postinc_011_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_011_SGE_done
.Lst8_postinc_011_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_011_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0608
    ldi8 c1, 0xd3
    st8 [c0], c1
    ldi16 c0, 0x0609
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x060a
    ldi8 c1, 0x3f
    st8 [c0], c1

    ; POST pointer c1, data r1, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x6aaa
    push16 r4
    pop16 r1
    ldi16 c0, 0x686a
    push16 r4
    pop16 r0
    ldi16 c1, 0x0609
    st8 [c1+], r1
    push16 r1
    push16 r5
    push16 r0
    ldi16 c0, 0x0608
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0609
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_012_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_EQ_done
.Lst8_postinc_012_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_012_EQ_done:
    brne8 .Lst8_postinc_012_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_NE_done
.Lst8_postinc_012_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_012_NE_done:
    brult8 .Lst8_postinc_012_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_ULT_done
.Lst8_postinc_012_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_012_ULT_done:
    bruge8 .Lst8_postinc_012_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_UGE_done
.Lst8_postinc_012_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_012_UGE_done:
    brslt8 .Lst8_postinc_012_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_SLT_done
.Lst8_postinc_012_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_012_SLT_done:
    brsge8 .Lst8_postinc_012_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_012_SGE_done
.Lst8_postinc_012_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_012_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x060c
    ldi8 c1, 0xdc
    st8 [c0], c1
    ldi16 c0, 0x060d
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x060e
    ldi8 c1, 0x46
    st8 [c0], c1

    ; POST pointer c1, data r1, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x77c3
    push16 r4
    pop16 r1
    ldi16 c0, 0x68b7
    push16 r4
    pop16 r0
    ldi16 c1, 0x060d
    st8 [c1+], r1
    push16 r1
    push16 r5
    push16 r0
    ldi16 c0, 0x060c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x060d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_013_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_EQ_done
.Lst8_postinc_013_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_013_EQ_done:
    brne8 .Lst8_postinc_013_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_NE_done
.Lst8_postinc_013_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_013_NE_done:
    brult8 .Lst8_postinc_013_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_ULT_done
.Lst8_postinc_013_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_013_ULT_done:
    bruge8 .Lst8_postinc_013_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_UGE_done
.Lst8_postinc_013_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_013_UGE_done:
    brslt8 .Lst8_postinc_013_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_SLT_done
.Lst8_postinc_013_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_013_SLT_done:
    brsge8 .Lst8_postinc_013_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_013_SGE_done
.Lst8_postinc_013_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_013_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0610
    ldi8 c1, 0xe5
    st8 [c0], c1
    ldi16 c0, 0x0611
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x0612
    ldi8 c1, 0x4e
    st8 [c0], c1

    ; POST pointer c1, data r2, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x8401
    push16 r4
    pop16 r2
    ldi16 c0, 0x6904
    push16 r4
    pop16 r0
    ldi16 c1, 0x0611
    st8 [c1+], r2
    push16 r2
    push16 r5
    push16 r0
    ldi16 c0, 0x0610
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0611
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_014_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_EQ_done
.Lst8_postinc_014_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_014_EQ_done:
    brne8 .Lst8_postinc_014_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_NE_done
.Lst8_postinc_014_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_014_NE_done:
    brult8 .Lst8_postinc_014_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_ULT_done
.Lst8_postinc_014_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_014_ULT_done:
    bruge8 .Lst8_postinc_014_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_UGE_done
.Lst8_postinc_014_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_014_UGE_done:
    brslt8 .Lst8_postinc_014_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_SLT_done
.Lst8_postinc_014_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_014_SLT_done:
    brsge8 .Lst8_postinc_014_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_014_SGE_done
.Lst8_postinc_014_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_014_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0614
    ldi8 c1, 0xee
    st8 [c0], c1
    ldi16 c0, 0x0615
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x0616
    ldi8 c1, 0x55
    st8 [c0], c1

    ; POST pointer c1, data r2, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x917f
    push16 r4
    pop16 r2
    ldi16 c0, 0x6951
    push16 r4
    pop16 r0
    ldi16 c1, 0x0615
    st8 [c1+], r2
    push16 r2
    push16 r5
    push16 r0
    ldi16 c0, 0x0614
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0615
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_015_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_EQ_done
.Lst8_postinc_015_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_015_EQ_done:
    brne8 .Lst8_postinc_015_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_NE_done
.Lst8_postinc_015_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_015_NE_done:
    brult8 .Lst8_postinc_015_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_ULT_done
.Lst8_postinc_015_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_015_ULT_done:
    bruge8 .Lst8_postinc_015_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_UGE_done
.Lst8_postinc_015_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_015_UGE_done:
    brslt8 .Lst8_postinc_015_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_SLT_done
.Lst8_postinc_015_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_015_SLT_done:
    brsge8 .Lst8_postinc_015_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_015_SGE_done
.Lst8_postinc_015_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_015_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0618
    ldi8 c1, 0xf7
    st8 [c0], c1
    ldi16 c0, 0x0619
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x061a
    ldi8 c1, 0x5d
    st8 [c0], c1

    ; POST pointer c1, data r3, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x9eff
    push16 r4
    pop16 r3
    ldi16 c0, 0x699e
    push16 r4
    pop16 r0
    ldi16 c1, 0x0619
    st8 [c1+], r3
    push16 r3
    push16 r5
    push16 r0
    ldi16 c0, 0x0618
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0619
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_016_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_EQ_done
.Lst8_postinc_016_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_016_EQ_done:
    brne8 .Lst8_postinc_016_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_NE_done
.Lst8_postinc_016_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_016_NE_done:
    brult8 .Lst8_postinc_016_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_ULT_done
.Lst8_postinc_016_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_016_ULT_done:
    bruge8 .Lst8_postinc_016_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_UGE_done
.Lst8_postinc_016_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_016_UGE_done:
    brslt8 .Lst8_postinc_016_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_SLT_done
.Lst8_postinc_016_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_016_SLT_done:
    brsge8 .Lst8_postinc_016_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_016_SGE_done
.Lst8_postinc_016_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_016_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x061c
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x061d
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x061e
    ldi8 c1, 0x64
    st8 [c0], c1

    ; POST pointer c1, data r3, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xab55
    push16 r4
    pop16 r3
    ldi16 c0, 0x69eb
    push16 r4
    pop16 r0
    ldi16 c1, 0x061d
    st8 [c1+], r3
    push16 r3
    push16 r5
    push16 r0
    ldi16 c0, 0x061c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x061d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_017_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_EQ_done
.Lst8_postinc_017_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_017_EQ_done:
    brne8 .Lst8_postinc_017_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_NE_done
.Lst8_postinc_017_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_017_NE_done:
    brult8 .Lst8_postinc_017_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_ULT_done
.Lst8_postinc_017_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_017_ULT_done:
    bruge8 .Lst8_postinc_017_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_UGE_done
.Lst8_postinc_017_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_017_UGE_done:
    brslt8 .Lst8_postinc_017_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_SLT_done
.Lst8_postinc_017_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_017_SLT_done:
    brsge8 .Lst8_postinc_017_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_017_SGE_done
.Lst8_postinc_017_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_017_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0620
    ldi8 c1, 0x09
    st8 [c0], c1
    ldi16 c0, 0x0621
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x0622
    ldi8 c1, 0x6c
    st8 [c0], c1

    ; POST pointer c1, data r4, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c2, 0xb8c3
    push16 r6
    pop16 r4
    ldi16 c2, 0x6a38
    push16 r6
    pop16 r0
    ldi16 c1, 0x0621
    st8 [c1+], r4
    push16 r4
    push16 r5
    push16 r0
    ldi16 c0, 0x0620
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0621
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_018_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_EQ_done
.Lst8_postinc_018_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_018_EQ_done:
    brne8 .Lst8_postinc_018_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_NE_done
.Lst8_postinc_018_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_018_NE_done:
    brult8 .Lst8_postinc_018_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_ULT_done
.Lst8_postinc_018_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_018_ULT_done:
    bruge8 .Lst8_postinc_018_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_UGE_done
.Lst8_postinc_018_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_018_UGE_done:
    brslt8 .Lst8_postinc_018_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_SLT_done
.Lst8_postinc_018_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_018_SLT_done:
    brsge8 .Lst8_postinc_018_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_018_SGE_done
.Lst8_postinc_018_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_018_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0624
    ldi8 c1, 0x12
    st8 [c0], c1
    ldi16 c0, 0x0625
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0626
    ldi8 c1, 0x73
    st8 [c0], c1

    ; POST pointer c1, data r4, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c2, 0xc500
    push16 r6
    pop16 r4
    ldi16 c2, 0x6a85
    push16 r6
    pop16 r0
    ldi16 c1, 0x0625
    st8 [c1+], r4
    push16 r4
    push16 r5
    push16 r0
    ldi16 c0, 0x0624
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0625
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_019_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_EQ_done
.Lst8_postinc_019_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_019_EQ_done:
    brne8 .Lst8_postinc_019_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_NE_done
.Lst8_postinc_019_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_019_NE_done:
    brult8 .Lst8_postinc_019_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_ULT_done
.Lst8_postinc_019_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_019_ULT_done:
    bruge8 .Lst8_postinc_019_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_UGE_done
.Lst8_postinc_019_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_019_UGE_done:
    brslt8 .Lst8_postinc_019_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_SLT_done
.Lst8_postinc_019_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_019_SLT_done:
    brsge8 .Lst8_postinc_019_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_019_SGE_done
.Lst8_postinc_019_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_019_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0628
    ldi8 c1, 0x1b
    st8 [c0], c1
    ldi16 c0, 0x0629
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x062a
    ldi8 c1, 0x7b
    st8 [c0], c1

    ; POST pointer c1, data r5, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x6ad2
    push16 r4
    pop16 r0
    ldi16 c1, 0x0629
    st8 [c1+], r5
    push16 r5
    push16 r5
    push16 r0
    ldi16 c0, 0x0628
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0629
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_EQ_done
.Lst8_postinc_01a_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_EQ_done:
    brne8 .Lst8_postinc_01a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_NE_done
.Lst8_postinc_01a_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_NE_done:
    brult8 .Lst8_postinc_01a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_ULT_done
.Lst8_postinc_01a_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_ULT_done:
    bruge8 .Lst8_postinc_01a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_UGE_done
.Lst8_postinc_01a_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_UGE_done:
    brslt8 .Lst8_postinc_01a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_SLT_done
.Lst8_postinc_01a_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_SLT_done:
    brsge8 .Lst8_postinc_01a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01a_SGE_done
.Lst8_postinc_01a_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x062c
    ldi8 c1, 0x24
    st8 [c0], c1
    ldi16 c0, 0x062d
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x062e
    ldi8 c1, 0x82
    st8 [c0], c1

    ; POST pointer c1, data r5, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x6b1f
    push16 r4
    pop16 r0
    ldi16 c1, 0x062d
    st8 [c1+], r5
    push16 r5
    push16 r5
    push16 r0
    ldi16 c0, 0x062c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x062d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_EQ_done
.Lst8_postinc_01b_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_EQ_done:
    brne8 .Lst8_postinc_01b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_NE_done
.Lst8_postinc_01b_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_NE_done:
    brult8 .Lst8_postinc_01b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_ULT_done
.Lst8_postinc_01b_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_ULT_done:
    bruge8 .Lst8_postinc_01b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_UGE_done
.Lst8_postinc_01b_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_UGE_done:
    brslt8 .Lst8_postinc_01b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_SLT_done
.Lst8_postinc_01b_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_SLT_done:
    brsge8 .Lst8_postinc_01b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01b_SGE_done
.Lst8_postinc_01b_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0630
    ldi8 c1, 0x2d
    st8 [c0], c1
    ldi16 c0, 0x0631
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x0632
    ldi8 c1, 0x8a
    st8 [c0], c1

    ; POST pointer c1, data r6, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xec55
    push16 r4
    pop16 r6
    ldi16 c0, 0x6b6c
    push16 r4
    pop16 r0
    ldi16 c1, 0x0631
    st8 [c1+], r6
    push16 r6
    push16 r5
    push16 r0
    ldi16 c0, 0x0630
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0631
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_EQ_done
.Lst8_postinc_01c_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_EQ_done:
    brne8 .Lst8_postinc_01c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_NE_done
.Lst8_postinc_01c_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_NE_done:
    brult8 .Lst8_postinc_01c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_ULT_done
.Lst8_postinc_01c_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_ULT_done:
    bruge8 .Lst8_postinc_01c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_UGE_done
.Lst8_postinc_01c_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_UGE_done:
    brslt8 .Lst8_postinc_01c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_SLT_done
.Lst8_postinc_01c_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_SLT_done:
    brsge8 .Lst8_postinc_01c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01c_SGE_done
.Lst8_postinc_01c_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0634
    ldi8 c1, 0x36
    st8 [c0], c1
    ldi16 c0, 0x0635
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x0636
    ldi8 c1, 0x91
    st8 [c0], c1

    ; POST pointer c1, data r6, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xf9aa
    push16 r4
    pop16 r6
    ldi16 c0, 0x6bb9
    push16 r4
    pop16 r0
    ldi16 c1, 0x0635
    st8 [c1+], r6
    push16 r6
    push16 r5
    push16 r0
    ldi16 c0, 0x0634
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0635
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_EQ_done
.Lst8_postinc_01d_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_EQ_done:
    brne8 .Lst8_postinc_01d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_NE_done
.Lst8_postinc_01d_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_NE_done:
    brult8 .Lst8_postinc_01d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_ULT_done
.Lst8_postinc_01d_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_ULT_done:
    bruge8 .Lst8_postinc_01d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_UGE_done
.Lst8_postinc_01d_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_UGE_done:
    brslt8 .Lst8_postinc_01d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_SLT_done
.Lst8_postinc_01d_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_SLT_done:
    brsge8 .Lst8_postinc_01d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01d_SGE_done
.Lst8_postinc_01d_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0638
    ldi8 c1, 0x3f
    st8 [c0], c1
    ldi16 c0, 0x0639
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x063a
    ldi8 c1, 0x99
    st8 [c0], c1

    ; POST pointer c1, data r7, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x0600
    push16 r4
    pop16 r7
    ldi16 c0, 0x6c06
    push16 r4
    pop16 r0
    ldi16 c1, 0x0639
    st8 [c1+], r7
    push16 r7
    push16 r5
    push16 r0
    ldi16 c0, 0x0638
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0639
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_EQ_done
.Lst8_postinc_01e_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_EQ_done:
    brne8 .Lst8_postinc_01e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_NE_done
.Lst8_postinc_01e_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_NE_done:
    brult8 .Lst8_postinc_01e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_ULT_done
.Lst8_postinc_01e_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_ULT_done:
    bruge8 .Lst8_postinc_01e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_UGE_done
.Lst8_postinc_01e_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_UGE_done:
    brslt8 .Lst8_postinc_01e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_SLT_done
.Lst8_postinc_01e_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_SLT_done:
    brsge8 .Lst8_postinc_01e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01e_SGE_done
.Lst8_postinc_01e_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x063c
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x063d
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x063e
    ldi8 c1, 0xa0
    st8 [c0], c1

    ; POST pointer c1, data r7, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1301
    push16 r4
    pop16 r7
    ldi16 c0, 0x6c53
    push16 r4
    pop16 r0
    ldi16 c1, 0x063d
    st8 [c1+], r7
    push16 r7
    push16 r5
    push16 r0
    ldi16 c0, 0x063c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x063d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_01f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_EQ_done
.Lst8_postinc_01f_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_EQ_done:
    brne8 .Lst8_postinc_01f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_NE_done
.Lst8_postinc_01f_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_NE_done:
    brult8 .Lst8_postinc_01f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_ULT_done
.Lst8_postinc_01f_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_ULT_done:
    bruge8 .Lst8_postinc_01f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_UGE_done
.Lst8_postinc_01f_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_UGE_done:
    brslt8 .Lst8_postinc_01f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_SLT_done
.Lst8_postinc_01f_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_SLT_done:
    brsge8 .Lst8_postinc_01f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_01f_SGE_done
.Lst8_postinc_01f_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_01f_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0640
    ldi8 c1, 0x52
    st8 [c0], c1
    ldi16 c0, 0x0641
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x0642
    ldi8 c1, 0xa0
    st8 [c0], c1

    ; POST pointer c2, data r0, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x2080
    push16 r4
    pop16 r0
    ldi16 c0, 0x6da1
    push16 r4
    pop16 r1
    ldi16 c2, 0x0641
    st8 [c2+], r0
    push16 r0
    push16 r6
    push16 r1
    ldi16 c0, 0x0640
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0641
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_020_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_EQ_done
.Lst8_postinc_020_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_020_EQ_done:
    brne8 .Lst8_postinc_020_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_NE_done
.Lst8_postinc_020_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_020_NE_done:
    brult8 .Lst8_postinc_020_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_ULT_done
.Lst8_postinc_020_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_020_ULT_done:
    bruge8 .Lst8_postinc_020_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_UGE_done
.Lst8_postinc_020_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_020_UGE_done:
    brslt8 .Lst8_postinc_020_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_SLT_done
.Lst8_postinc_020_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_020_SLT_done:
    brsge8 .Lst8_postinc_020_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_020_SGE_done
.Lst8_postinc_020_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_020_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0644
    ldi8 c1, 0x5b
    st8 [c0], c1
    ldi16 c0, 0x0645
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x0646
    ldi8 c1, 0xa7
    st8 [c0], c1

    ; POST pointer c2, data r0, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x2dff
    push16 r4
    pop16 r0
    ldi16 c0, 0x6dee
    push16 r4
    pop16 r1
    ldi16 c2, 0x0645
    st8 [c2+], r0
    push16 r0
    push16 r6
    push16 r1
    ldi16 c0, 0x0644
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0645
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_021_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_EQ_done
.Lst8_postinc_021_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_021_EQ_done:
    brne8 .Lst8_postinc_021_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_NE_done
.Lst8_postinc_021_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_021_NE_done:
    brult8 .Lst8_postinc_021_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_ULT_done
.Lst8_postinc_021_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_021_ULT_done:
    bruge8 .Lst8_postinc_021_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_UGE_done
.Lst8_postinc_021_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_021_UGE_done:
    brslt8 .Lst8_postinc_021_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_SLT_done
.Lst8_postinc_021_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_021_SLT_done:
    brsge8 .Lst8_postinc_021_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_021_SGE_done
.Lst8_postinc_021_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_021_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0648
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x0649
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x064a
    ldi8 c1, 0xaf
    st8 [c0], c1

    ; POST pointer c2, data r1, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x3aaa
    push16 r4
    pop16 r1
    ldi16 c0, 0x6d3a
    push16 r4
    pop16 r0
    ldi16 c2, 0x0649
    st8 [c2+], r1
    push16 r1
    push16 r6
    push16 r0
    ldi16 c0, 0x0648
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0649
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_022_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_EQ_done
.Lst8_postinc_022_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_022_EQ_done:
    brne8 .Lst8_postinc_022_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_NE_done
.Lst8_postinc_022_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_022_NE_done:
    brult8 .Lst8_postinc_022_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_ULT_done
.Lst8_postinc_022_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_022_ULT_done:
    bruge8 .Lst8_postinc_022_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_UGE_done
.Lst8_postinc_022_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_022_UGE_done:
    brslt8 .Lst8_postinc_022_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_SLT_done
.Lst8_postinc_022_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_022_SLT_done:
    brsge8 .Lst8_postinc_022_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_022_SGE_done
.Lst8_postinc_022_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_022_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x064c
    ldi8 c1, 0x6d
    st8 [c0], c1
    ldi16 c0, 0x064d
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x064e
    ldi8 c1, 0xb6
    st8 [c0], c1

    ; POST pointer c2, data r1, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x47c3
    push16 r4
    pop16 r1
    ldi16 c0, 0x6d87
    push16 r4
    pop16 r0
    ldi16 c2, 0x064d
    st8 [c2+], r1
    push16 r1
    push16 r6
    push16 r0
    ldi16 c0, 0x064c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x064d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_023_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_EQ_done
.Lst8_postinc_023_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_023_EQ_done:
    brne8 .Lst8_postinc_023_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_NE_done
.Lst8_postinc_023_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_023_NE_done:
    brult8 .Lst8_postinc_023_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_ULT_done
.Lst8_postinc_023_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_023_ULT_done:
    bruge8 .Lst8_postinc_023_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_UGE_done
.Lst8_postinc_023_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_023_UGE_done:
    brslt8 .Lst8_postinc_023_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_SLT_done
.Lst8_postinc_023_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_023_SLT_done:
    brsge8 .Lst8_postinc_023_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_023_SGE_done
.Lst8_postinc_023_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_023_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0650
    ldi8 c1, 0x76
    st8 [c0], c1
    ldi16 c0, 0x0651
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x0652
    ldi8 c1, 0xbe
    st8 [c0], c1

    ; POST pointer c2, data r2, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x5401
    push16 r4
    pop16 r2
    ldi16 c0, 0x6dd4
    push16 r4
    pop16 r0
    ldi16 c2, 0x0651
    st8 [c2+], r2
    push16 r2
    push16 r6
    push16 r0
    ldi16 c0, 0x0650
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0651
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_024_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_EQ_done
.Lst8_postinc_024_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_024_EQ_done:
    brne8 .Lst8_postinc_024_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_NE_done
.Lst8_postinc_024_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_024_NE_done:
    brult8 .Lst8_postinc_024_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_ULT_done
.Lst8_postinc_024_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_024_ULT_done:
    bruge8 .Lst8_postinc_024_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_UGE_done
.Lst8_postinc_024_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_024_UGE_done:
    brslt8 .Lst8_postinc_024_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_SLT_done
.Lst8_postinc_024_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_024_SLT_done:
    brsge8 .Lst8_postinc_024_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_024_SGE_done
.Lst8_postinc_024_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_024_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0654
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x0655
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x0656
    ldi8 c1, 0xc5
    st8 [c0], c1

    ; POST pointer c2, data r2, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x617f
    push16 r4
    pop16 r2
    ldi16 c0, 0x6e21
    push16 r4
    pop16 r0
    ldi16 c2, 0x0655
    st8 [c2+], r2
    push16 r2
    push16 r6
    push16 r0
    ldi16 c0, 0x0654
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0655
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_025_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_EQ_done
.Lst8_postinc_025_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_025_EQ_done:
    brne8 .Lst8_postinc_025_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_NE_done
.Lst8_postinc_025_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_025_NE_done:
    brult8 .Lst8_postinc_025_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_ULT_done
.Lst8_postinc_025_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_025_ULT_done:
    bruge8 .Lst8_postinc_025_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_UGE_done
.Lst8_postinc_025_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_025_UGE_done:
    brslt8 .Lst8_postinc_025_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_SLT_done
.Lst8_postinc_025_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_025_SLT_done:
    brsge8 .Lst8_postinc_025_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_025_SGE_done
.Lst8_postinc_025_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_025_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0658
    ldi8 c1, 0x88
    st8 [c0], c1
    ldi16 c0, 0x0659
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x065a
    ldi8 c1, 0xcd
    st8 [c0], c1

    ; POST pointer c2, data r3, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x6eff
    push16 r4
    pop16 r3
    ldi16 c0, 0x6e6e
    push16 r4
    pop16 r0
    ldi16 c2, 0x0659
    st8 [c2+], r3
    push16 r3
    push16 r6
    push16 r0
    ldi16 c0, 0x0658
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0659
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_026_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_EQ_done
.Lst8_postinc_026_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_026_EQ_done:
    brne8 .Lst8_postinc_026_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_NE_done
.Lst8_postinc_026_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_026_NE_done:
    brult8 .Lst8_postinc_026_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_ULT_done
.Lst8_postinc_026_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_026_ULT_done:
    bruge8 .Lst8_postinc_026_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_UGE_done
.Lst8_postinc_026_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_026_UGE_done:
    brslt8 .Lst8_postinc_026_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_SLT_done
.Lst8_postinc_026_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_026_SLT_done:
    brsge8 .Lst8_postinc_026_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_026_SGE_done
.Lst8_postinc_026_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_026_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x065c
    ldi8 c1, 0x91
    st8 [c0], c1
    ldi16 c0, 0x065d
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x065e
    ldi8 c1, 0xd4
    st8 [c0], c1

    ; POST pointer c2, data r3, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7b55
    push16 r4
    pop16 r3
    ldi16 c0, 0x6ebb
    push16 r4
    pop16 r0
    ldi16 c2, 0x065d
    st8 [c2+], r3
    push16 r3
    push16 r6
    push16 r0
    ldi16 c0, 0x065c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x065d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_027_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_EQ_done
.Lst8_postinc_027_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_027_EQ_done:
    brne8 .Lst8_postinc_027_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_NE_done
.Lst8_postinc_027_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_027_NE_done:
    brult8 .Lst8_postinc_027_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_ULT_done
.Lst8_postinc_027_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_027_ULT_done:
    bruge8 .Lst8_postinc_027_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_UGE_done
.Lst8_postinc_027_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_027_UGE_done:
    brslt8 .Lst8_postinc_027_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_SLT_done
.Lst8_postinc_027_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_027_SLT_done:
    brsge8 .Lst8_postinc_027_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_027_SGE_done
.Lst8_postinc_027_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_027_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0660
    ldi8 c1, 0x9a
    st8 [c0], c1
    ldi16 c0, 0x0661
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x0662
    ldi8 c1, 0xdc
    st8 [c0], c1

    ; POST pointer c2, data r4, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0x88c3
    push16 r5
    pop16 r4
    ldi16 c1, 0x6f08
    push16 r5
    pop16 r0
    ldi16 c2, 0x0661
    st8 [c2+], r4
    push16 r4
    push16 r6
    push16 r0
    ldi16 c0, 0x0660
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0661
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_028_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_EQ_done
.Lst8_postinc_028_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_028_EQ_done:
    brne8 .Lst8_postinc_028_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_NE_done
.Lst8_postinc_028_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_028_NE_done:
    brult8 .Lst8_postinc_028_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_ULT_done
.Lst8_postinc_028_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_028_ULT_done:
    bruge8 .Lst8_postinc_028_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_UGE_done
.Lst8_postinc_028_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_028_UGE_done:
    brslt8 .Lst8_postinc_028_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_SLT_done
.Lst8_postinc_028_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_028_SLT_done:
    brsge8 .Lst8_postinc_028_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_028_SGE_done
.Lst8_postinc_028_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_028_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0664
    ldi8 c1, 0xa3
    st8 [c0], c1
    ldi16 c0, 0x0665
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x0666
    ldi8 c1, 0xe3
    st8 [c0], c1

    ; POST pointer c2, data r4, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x9500
    push16 r5
    pop16 r4
    ldi16 c1, 0x6f55
    push16 r5
    pop16 r0
    ldi16 c2, 0x0665
    st8 [c2+], r4
    push16 r4
    push16 r6
    push16 r0
    ldi16 c0, 0x0664
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0665
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_029_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_EQ_done
.Lst8_postinc_029_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_029_EQ_done:
    brne8 .Lst8_postinc_029_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_NE_done
.Lst8_postinc_029_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_029_NE_done:
    brult8 .Lst8_postinc_029_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_ULT_done
.Lst8_postinc_029_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_029_ULT_done:
    bruge8 .Lst8_postinc_029_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_UGE_done
.Lst8_postinc_029_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_029_UGE_done:
    brslt8 .Lst8_postinc_029_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_SLT_done
.Lst8_postinc_029_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_029_SLT_done:
    brsge8 .Lst8_postinc_029_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_029_SGE_done
.Lst8_postinc_029_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_029_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0668
    ldi8 c1, 0xac
    st8 [c0], c1
    ldi16 c0, 0x0669
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x066a
    ldi8 c1, 0xeb
    st8 [c0], c1

    ; POST pointer c2, data r5, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa27f
    push16 r4
    pop16 r5
    ldi16 c0, 0x6fa2
    push16 r4
    pop16 r0
    ldi16 c2, 0x0669
    st8 [c2+], r5
    push16 r5
    push16 r6
    push16 r0
    ldi16 c0, 0x0668
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0669
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_EQ_done
.Lst8_postinc_02a_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_EQ_done:
    brne8 .Lst8_postinc_02a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_NE_done
.Lst8_postinc_02a_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_NE_done:
    brult8 .Lst8_postinc_02a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_ULT_done
.Lst8_postinc_02a_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_ULT_done:
    bruge8 .Lst8_postinc_02a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_UGE_done
.Lst8_postinc_02a_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_UGE_done:
    brslt8 .Lst8_postinc_02a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_SLT_done
.Lst8_postinc_02a_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_SLT_done:
    brsge8 .Lst8_postinc_02a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02a_SGE_done
.Lst8_postinc_02a_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x066c
    ldi8 c1, 0xb5
    st8 [c0], c1
    ldi16 c0, 0x066d
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x066e
    ldi8 c1, 0xf2
    st8 [c0], c1

    ; POST pointer c2, data r5, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xaf80
    push16 r4
    pop16 r5
    ldi16 c0, 0x6fef
    push16 r4
    pop16 r0
    ldi16 c2, 0x066d
    st8 [c2+], r5
    push16 r5
    push16 r6
    push16 r0
    ldi16 c0, 0x066c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x066d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_EQ_done
.Lst8_postinc_02b_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_EQ_done:
    brne8 .Lst8_postinc_02b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_NE_done
.Lst8_postinc_02b_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_NE_done:
    brult8 .Lst8_postinc_02b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_ULT_done
.Lst8_postinc_02b_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_ULT_done:
    bruge8 .Lst8_postinc_02b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_UGE_done
.Lst8_postinc_02b_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_UGE_done:
    brslt8 .Lst8_postinc_02b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_SLT_done
.Lst8_postinc_02b_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_SLT_done:
    brsge8 .Lst8_postinc_02b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02b_SGE_done
.Lst8_postinc_02b_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0670
    ldi8 c1, 0xbe
    st8 [c0], c1
    ldi16 c0, 0x0671
    ldi8 c1, 0xaa
    st8 [c0], c1
    ldi16 c0, 0x0672
    ldi8 c1, 0xfa
    st8 [c0], c1

    ; POST pointer c2, data r6, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x703c
    push16 r4
    pop16 r0
    ldi16 c2, 0x0671
    st8 [c2+], r6
    push16 r6
    push16 r6
    push16 r0
    ldi16 c0, 0x0670
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0671
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_EQ_done
.Lst8_postinc_02c_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_EQ_done:
    brne8 .Lst8_postinc_02c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_NE_done
.Lst8_postinc_02c_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_NE_done:
    brult8 .Lst8_postinc_02c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_ULT_done
.Lst8_postinc_02c_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_ULT_done:
    bruge8 .Lst8_postinc_02c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_UGE_done
.Lst8_postinc_02c_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_UGE_done:
    brslt8 .Lst8_postinc_02c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_SLT_done
.Lst8_postinc_02c_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_SLT_done:
    brsge8 .Lst8_postinc_02c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02c_SGE_done
.Lst8_postinc_02c_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0674
    ldi8 c1, 0xc7
    st8 [c0], c1
    ldi16 c0, 0x0675
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x0676
    ldi8 c1, 0x01
    st8 [c0], c1

    ; POST pointer c2, data r6, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x7089
    push16 r4
    pop16 r0
    ldi16 c2, 0x0675
    st8 [c2+], r6
    push16 r6
    push16 r6
    push16 r0
    ldi16 c0, 0x0674
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0675
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_EQ_done
.Lst8_postinc_02d_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_EQ_done:
    brne8 .Lst8_postinc_02d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_NE_done
.Lst8_postinc_02d_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_NE_done:
    brult8 .Lst8_postinc_02d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_ULT_done
.Lst8_postinc_02d_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_ULT_done:
    bruge8 .Lst8_postinc_02d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_UGE_done
.Lst8_postinc_02d_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_UGE_done:
    brslt8 .Lst8_postinc_02d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_SLT_done
.Lst8_postinc_02d_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_SLT_done:
    brsge8 .Lst8_postinc_02d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02d_SGE_done
.Lst8_postinc_02d_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0678
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x0679
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x067a
    ldi8 c1, 0x09
    st8 [c0], c1

    ; POST pointer c2, data r7, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xd600
    push16 r4
    pop16 r7
    ldi16 c0, 0x70d6
    push16 r4
    pop16 r0
    ldi16 c2, 0x0679
    st8 [c2+], r7
    push16 r7
    push16 r6
    push16 r0
    ldi16 c0, 0x0678
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0679
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_EQ_done
.Lst8_postinc_02e_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_EQ_done:
    brne8 .Lst8_postinc_02e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_NE_done
.Lst8_postinc_02e_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_NE_done:
    brult8 .Lst8_postinc_02e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_ULT_done
.Lst8_postinc_02e_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_ULT_done:
    bruge8 .Lst8_postinc_02e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_UGE_done
.Lst8_postinc_02e_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_UGE_done:
    brslt8 .Lst8_postinc_02e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_SLT_done
.Lst8_postinc_02e_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_SLT_done:
    brsge8 .Lst8_postinc_02e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02e_SGE_done
.Lst8_postinc_02e_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x067c
    ldi8 c1, 0xd9
    st8 [c0], c1
    ldi16 c0, 0x067d
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x067e
    ldi8 c1, 0x10
    st8 [c0], c1

    ; POST pointer c2, data r7, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xe301
    push16 r4
    pop16 r7
    ldi16 c0, 0x7123
    push16 r4
    pop16 r0
    ldi16 c2, 0x067d
    st8 [c2+], r7
    push16 r7
    push16 r6
    push16 r0
    ldi16 c0, 0x067c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x067d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_02f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_EQ_done
.Lst8_postinc_02f_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_EQ_done:
    brne8 .Lst8_postinc_02f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_NE_done
.Lst8_postinc_02f_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_NE_done:
    brult8 .Lst8_postinc_02f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_ULT_done
.Lst8_postinc_02f_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_ULT_done:
    bruge8 .Lst8_postinc_02f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_UGE_done
.Lst8_postinc_02f_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_UGE_done:
    brslt8 .Lst8_postinc_02f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_SLT_done
.Lst8_postinc_02f_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_SLT_done:
    brsge8 .Lst8_postinc_02f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_02f_SGE_done
.Lst8_postinc_02f_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_02f_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0680
    ldi8 c1, 0xe3
    st8 [c0], c1
    ldi16 c0, 0x0681
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0682
    ldi8 c1, 0x10
    st8 [c0], c1

    ; POST pointer c3, data r0, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xf080
    push16 r4
    pop16 r0
    ldi16 c0, 0x7271
    push16 r4
    pop16 r1
    ldi16 c3, 0x0681
    st8 [c3+], r0
    push16 r0
    push16 r7
    push16 r1
    ldi16 c0, 0x0680
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0681
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_030_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_EQ_done
.Lst8_postinc_030_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_030_EQ_done:
    brne8 .Lst8_postinc_030_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_NE_done
.Lst8_postinc_030_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_030_NE_done:
    brult8 .Lst8_postinc_030_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_ULT_done
.Lst8_postinc_030_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_030_ULT_done:
    bruge8 .Lst8_postinc_030_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_UGE_done
.Lst8_postinc_030_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_030_UGE_done:
    brslt8 .Lst8_postinc_030_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_SLT_done
.Lst8_postinc_030_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_030_SLT_done:
    brsge8 .Lst8_postinc_030_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_030_SGE_done
.Lst8_postinc_030_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_030_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0684
    ldi8 c1, 0xec
    st8 [c0], c1
    ldi16 c0, 0x0685
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x0686
    ldi8 c1, 0x17
    st8 [c0], c1

    ; POST pointer c3, data r0, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xfdff
    push16 r4
    pop16 r0
    ldi16 c0, 0x72be
    push16 r4
    pop16 r1
    ldi16 c3, 0x0685
    st8 [c3+], r0
    push16 r0
    push16 r7
    push16 r1
    ldi16 c0, 0x0684
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0685
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_031_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_EQ_done
.Lst8_postinc_031_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_031_EQ_done:
    brne8 .Lst8_postinc_031_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_NE_done
.Lst8_postinc_031_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_031_NE_done:
    brult8 .Lst8_postinc_031_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_ULT_done
.Lst8_postinc_031_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_031_ULT_done:
    bruge8 .Lst8_postinc_031_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_UGE_done
.Lst8_postinc_031_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_031_UGE_done:
    brslt8 .Lst8_postinc_031_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_SLT_done
.Lst8_postinc_031_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_031_SLT_done:
    brsge8 .Lst8_postinc_031_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_031_SGE_done
.Lst8_postinc_031_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_031_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0688
    ldi8 c1, 0xf5
    st8 [c0], c1
    ldi16 c0, 0x0689
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x068a
    ldi8 c1, 0x1f
    st8 [c0], c1

    ; POST pointer c3, data r1, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x0aaa
    push16 r4
    pop16 r1
    ldi16 c0, 0x720a
    push16 r4
    pop16 r0
    ldi16 c3, 0x0689
    st8 [c3+], r1
    push16 r1
    push16 r7
    push16 r0
    ldi16 c0, 0x0688
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0689
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_032_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_EQ_done
.Lst8_postinc_032_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_032_EQ_done:
    brne8 .Lst8_postinc_032_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_NE_done
.Lst8_postinc_032_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_032_NE_done:
    brult8 .Lst8_postinc_032_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_ULT_done
.Lst8_postinc_032_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_032_ULT_done:
    bruge8 .Lst8_postinc_032_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_UGE_done
.Lst8_postinc_032_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_032_UGE_done:
    brslt8 .Lst8_postinc_032_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_SLT_done
.Lst8_postinc_032_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_032_SLT_done:
    brsge8 .Lst8_postinc_032_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_032_SGE_done
.Lst8_postinc_032_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_032_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x068c
    ldi8 c1, 0xfe
    st8 [c0], c1
    ldi16 c0, 0x068d
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x068e
    ldi8 c1, 0x26
    st8 [c0], c1

    ; POST pointer c3, data r1, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x17c3
    push16 r4
    pop16 r1
    ldi16 c0, 0x7257
    push16 r4
    pop16 r0
    ldi16 c3, 0x068d
    st8 [c3+], r1
    push16 r1
    push16 r7
    push16 r0
    ldi16 c0, 0x068c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x068d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_033_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_EQ_done
.Lst8_postinc_033_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_033_EQ_done:
    brne8 .Lst8_postinc_033_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_NE_done
.Lst8_postinc_033_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_033_NE_done:
    brult8 .Lst8_postinc_033_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_ULT_done
.Lst8_postinc_033_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_033_ULT_done:
    bruge8 .Lst8_postinc_033_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_UGE_done
.Lst8_postinc_033_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_033_UGE_done:
    brslt8 .Lst8_postinc_033_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_SLT_done
.Lst8_postinc_033_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_033_SLT_done:
    brsge8 .Lst8_postinc_033_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_033_SGE_done
.Lst8_postinc_033_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_033_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0690
    ldi8 c1, 0x07
    st8 [c0], c1
    ldi16 c0, 0x0691
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x0692
    ldi8 c1, 0x2e
    st8 [c0], c1

    ; POST pointer c3, data r2, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x2401
    push16 r4
    pop16 r2
    ldi16 c0, 0x72a4
    push16 r4
    pop16 r0
    ldi16 c3, 0x0691
    st8 [c3+], r2
    push16 r2
    push16 r7
    push16 r0
    ldi16 c0, 0x0690
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0691
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_034_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_EQ_done
.Lst8_postinc_034_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_034_EQ_done:
    brne8 .Lst8_postinc_034_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_NE_done
.Lst8_postinc_034_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_034_NE_done:
    brult8 .Lst8_postinc_034_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_ULT_done
.Lst8_postinc_034_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_034_ULT_done:
    bruge8 .Lst8_postinc_034_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_UGE_done
.Lst8_postinc_034_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_034_UGE_done:
    brslt8 .Lst8_postinc_034_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_SLT_done
.Lst8_postinc_034_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_034_SLT_done:
    brsge8 .Lst8_postinc_034_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_034_SGE_done
.Lst8_postinc_034_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_034_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0694
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x0695
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x0696
    ldi8 c1, 0x35
    st8 [c0], c1

    ; POST pointer c3, data r2, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x317f
    push16 r4
    pop16 r2
    ldi16 c0, 0x72f1
    push16 r4
    pop16 r0
    ldi16 c3, 0x0695
    st8 [c3+], r2
    push16 r2
    push16 r7
    push16 r0
    ldi16 c0, 0x0694
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0695
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_035_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_EQ_done
.Lst8_postinc_035_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_035_EQ_done:
    brne8 .Lst8_postinc_035_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_NE_done
.Lst8_postinc_035_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_035_NE_done:
    brult8 .Lst8_postinc_035_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_ULT_done
.Lst8_postinc_035_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_035_ULT_done:
    bruge8 .Lst8_postinc_035_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_UGE_done
.Lst8_postinc_035_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_035_UGE_done:
    brslt8 .Lst8_postinc_035_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_SLT_done
.Lst8_postinc_035_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_035_SLT_done:
    brsge8 .Lst8_postinc_035_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_035_SGE_done
.Lst8_postinc_035_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_035_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x0698
    ldi8 c1, 0x19
    st8 [c0], c1
    ldi16 c0, 0x0699
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x069a
    ldi8 c1, 0x3d
    st8 [c0], c1

    ; POST pointer c3, data r3, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x3eff
    push16 r4
    pop16 r3
    ldi16 c0, 0x733e
    push16 r4
    pop16 r0
    ldi16 c3, 0x0699
    st8 [c3+], r3
    push16 r3
    push16 r7
    push16 r0
    ldi16 c0, 0x0698
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x0699
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_036_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_EQ_done
.Lst8_postinc_036_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_036_EQ_done:
    brne8 .Lst8_postinc_036_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_NE_done
.Lst8_postinc_036_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_036_NE_done:
    brult8 .Lst8_postinc_036_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_ULT_done
.Lst8_postinc_036_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_036_ULT_done:
    bruge8 .Lst8_postinc_036_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_UGE_done
.Lst8_postinc_036_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_036_UGE_done:
    brslt8 .Lst8_postinc_036_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_SLT_done
.Lst8_postinc_036_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_036_SLT_done:
    brsge8 .Lst8_postinc_036_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_036_SGE_done
.Lst8_postinc_036_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_036_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x069c
    ldi8 c1, 0x22
    st8 [c0], c1
    ldi16 c0, 0x069d
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x069e
    ldi8 c1, 0x44
    st8 [c0], c1

    ; POST pointer c3, data r3, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4b55
    push16 r4
    pop16 r3
    ldi16 c0, 0x738b
    push16 r4
    pop16 r0
    ldi16 c3, 0x069d
    st8 [c3+], r3
    push16 r3
    push16 r7
    push16 r0
    ldi16 c0, 0x069c
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x069d
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_037_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_EQ_done
.Lst8_postinc_037_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_037_EQ_done:
    brne8 .Lst8_postinc_037_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_NE_done
.Lst8_postinc_037_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_037_NE_done:
    brult8 .Lst8_postinc_037_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_ULT_done
.Lst8_postinc_037_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_037_ULT_done:
    bruge8 .Lst8_postinc_037_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_UGE_done
.Lst8_postinc_037_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_037_UGE_done:
    brslt8 .Lst8_postinc_037_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_SLT_done
.Lst8_postinc_037_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_037_SLT_done:
    brsge8 .Lst8_postinc_037_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_037_SGE_done
.Lst8_postinc_037_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_037_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a0
    ldi8 c1, 0x2b
    st8 [c0], c1
    ldi16 c0, 0x06a1
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x06a2
    ldi8 c1, 0x4c
    st8 [c0], c1

    ; POST pointer c3, data r4, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x58c3
    push16 r5
    pop16 r4
    ldi16 c1, 0x73d8
    push16 r5
    pop16 r0
    ldi16 c3, 0x06a1
    st8 [c3+], r4
    push16 r4
    push16 r7
    push16 r0
    ldi16 c0, 0x06a0
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a1
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_038_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_EQ_done
.Lst8_postinc_038_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_038_EQ_done:
    brne8 .Lst8_postinc_038_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_NE_done
.Lst8_postinc_038_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_038_NE_done:
    brult8 .Lst8_postinc_038_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_ULT_done
.Lst8_postinc_038_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_038_ULT_done:
    bruge8 .Lst8_postinc_038_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_UGE_done
.Lst8_postinc_038_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_038_UGE_done:
    brslt8 .Lst8_postinc_038_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_SLT_done
.Lst8_postinc_038_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_038_SLT_done:
    brsge8 .Lst8_postinc_038_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_038_SGE_done
.Lst8_postinc_038_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_038_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a4
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x06a5
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x06a6
    ldi8 c1, 0x53
    st8 [c0], c1

    ; POST pointer c3, data r4, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0x6500
    push16 r5
    pop16 r4
    ldi16 c1, 0x7425
    push16 r5
    pop16 r0
    ldi16 c3, 0x06a5
    st8 [c3+], r4
    push16 r4
    push16 r7
    push16 r0
    ldi16 c0, 0x06a4
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a5
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_039_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_EQ_done
.Lst8_postinc_039_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_039_EQ_done:
    brne8 .Lst8_postinc_039_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_NE_done
.Lst8_postinc_039_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_039_NE_done:
    brult8 .Lst8_postinc_039_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_ULT_done
.Lst8_postinc_039_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_039_ULT_done:
    bruge8 .Lst8_postinc_039_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_UGE_done
.Lst8_postinc_039_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_039_UGE_done:
    brslt8 .Lst8_postinc_039_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_SLT_done
.Lst8_postinc_039_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_039_SLT_done:
    brsge8 .Lst8_postinc_039_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_039_SGE_done
.Lst8_postinc_039_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_039_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06a8
    ldi8 c1, 0x3d
    st8 [c0], c1
    ldi16 c0, 0x06a9
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x06aa
    ldi8 c1, 0x5b
    st8 [c0], c1

    ; POST pointer c3, data r5, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x727f
    push16 r4
    pop16 r5
    ldi16 c0, 0x7472
    push16 r4
    pop16 r0
    ldi16 c3, 0x06a9
    st8 [c3+], r5
    push16 r5
    push16 r7
    push16 r0
    ldi16 c0, 0x06a8
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06a9
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_EQ_done
.Lst8_postinc_03a_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_EQ_done:
    brne8 .Lst8_postinc_03a_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_NE_done
.Lst8_postinc_03a_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_NE_done:
    brult8 .Lst8_postinc_03a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_ULT_done
.Lst8_postinc_03a_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_ULT_done:
    bruge8 .Lst8_postinc_03a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_UGE_done
.Lst8_postinc_03a_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_UGE_done:
    brslt8 .Lst8_postinc_03a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_SLT_done
.Lst8_postinc_03a_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_SLT_done:
    brsge8 .Lst8_postinc_03a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03a_SGE_done
.Lst8_postinc_03a_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03a_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06ac
    ldi8 c1, 0x46
    st8 [c0], c1
    ldi16 c0, 0x06ad
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x06ae
    ldi8 c1, 0x62
    st8 [c0], c1

    ; POST pointer c3, data r5, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x7f80
    push16 r4
    pop16 r5
    ldi16 c0, 0x74bf
    push16 r4
    pop16 r0
    ldi16 c3, 0x06ad
    st8 [c3+], r5
    push16 r5
    push16 r7
    push16 r0
    ldi16 c0, 0x06ac
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06ad
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_EQ_done
.Lst8_postinc_03b_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_EQ_done:
    brne8 .Lst8_postinc_03b_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_NE_done
.Lst8_postinc_03b_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_NE_done:
    brult8 .Lst8_postinc_03b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_ULT_done
.Lst8_postinc_03b_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_ULT_done:
    bruge8 .Lst8_postinc_03b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_UGE_done
.Lst8_postinc_03b_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_UGE_done:
    brslt8 .Lst8_postinc_03b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_SLT_done
.Lst8_postinc_03b_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_SLT_done:
    brsge8 .Lst8_postinc_03b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03b_SGE_done
.Lst8_postinc_03b_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03b_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b0
    ldi8 c1, 0x4f
    st8 [c0], c1
    ldi16 c0, 0x06b1
    ldi8 c1, 0xc3
    st8 [c0], c1
    ldi16 c0, 0x06b2
    ldi8 c1, 0x6a
    st8 [c0], c1

    ; POST pointer c3, data r6, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8c55
    push16 r4
    pop16 r6
    ldi16 c0, 0x750c
    push16 r4
    pop16 r0
    ldi16 c3, 0x06b1
    st8 [c3+], r6
    push16 r6
    push16 r7
    push16 r0
    ldi16 c0, 0x06b0
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b1
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_EQ_done
.Lst8_postinc_03c_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_EQ_done:
    brne8 .Lst8_postinc_03c_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_NE_done
.Lst8_postinc_03c_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_NE_done:
    brult8 .Lst8_postinc_03c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_ULT_done
.Lst8_postinc_03c_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_ULT_done:
    bruge8 .Lst8_postinc_03c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_UGE_done
.Lst8_postinc_03c_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_UGE_done:
    brslt8 .Lst8_postinc_03c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_SLT_done
.Lst8_postinc_03c_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_SLT_done:
    brsge8 .Lst8_postinc_03c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03c_SGE_done
.Lst8_postinc_03c_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03c_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b4
    ldi8 c1, 0x58
    st8 [c0], c1
    ldi16 c0, 0x06b5
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x06b6
    ldi8 c1, 0x71
    st8 [c0], c1

    ; POST pointer c3, data r6, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x99aa
    push16 r4
    pop16 r6
    ldi16 c0, 0x7559
    push16 r4
    pop16 r0
    ldi16 c3, 0x06b5
    st8 [c3+], r6
    push16 r6
    push16 r7
    push16 r0
    ldi16 c0, 0x06b4
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b5
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_EQ_done
.Lst8_postinc_03d_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_EQ_done:
    brne8 .Lst8_postinc_03d_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_NE_done
.Lst8_postinc_03d_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_NE_done:
    brult8 .Lst8_postinc_03d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_ULT_done
.Lst8_postinc_03d_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_ULT_done:
    bruge8 .Lst8_postinc_03d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_UGE_done
.Lst8_postinc_03d_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_UGE_done:
    brslt8 .Lst8_postinc_03d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_SLT_done
.Lst8_postinc_03d_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_SLT_done:
    brsge8 .Lst8_postinc_03d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03d_SGE_done
.Lst8_postinc_03d_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03d_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06b8
    ldi8 c1, 0x61
    st8 [c0], c1
    ldi16 c0, 0x06b9
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x06ba
    ldi8 c1, 0x79
    st8 [c0], c1

    ; POST pointer c3, data r7, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x75a6
    push16 r4
    pop16 r0
    ldi16 c3, 0x06b9
    st8 [c3+], r7
    push16 r7
    push16 r7
    push16 r0
    ldi16 c0, 0x06b8
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06b9
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_EQ_done
.Lst8_postinc_03e_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_EQ_done:
    brne8 .Lst8_postinc_03e_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_NE_done
.Lst8_postinc_03e_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_NE_done:
    brult8 .Lst8_postinc_03e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_ULT_done
.Lst8_postinc_03e_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_ULT_done:
    bruge8 .Lst8_postinc_03e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_UGE_done
.Lst8_postinc_03e_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_UGE_done:
    brslt8 .Lst8_postinc_03e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_SLT_done
.Lst8_postinc_03e_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_SLT_done:
    brsge8 .Lst8_postinc_03e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03e_SGE_done
.Lst8_postinc_03e_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03e_SGE_done:
    mem_emit_char '\n'
    ldi16 c0, 0x06bc
    ldi8 c1, 0x6a
    st8 [c0], c1
    ldi16 c0, 0x06bd
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x06be
    ldi8 c1, 0x80
    st8 [c0], c1

    ; POST pointer c3, data r7, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x75f3
    push16 r4
    pop16 r0
    ldi16 c3, 0x06bd
    st8 [c3+], r7
    push16 r7
    push16 r7
    push16 r0
    ldi16 c0, 0x06bc
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    ldi16 c0, 0x06bd
    ld16 c1, [c0]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_03f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_EQ_done
.Lst8_postinc_03f_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_EQ_done:
    brne8 .Lst8_postinc_03f_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_NE_done
.Lst8_postinc_03f_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_NE_done:
    brult8 .Lst8_postinc_03f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_ULT_done
.Lst8_postinc_03f_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_ULT_done:
    bruge8 .Lst8_postinc_03f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_UGE_done
.Lst8_postinc_03f_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_UGE_done:
    brslt8 .Lst8_postinc_03f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_SLT_done
.Lst8_postinc_03f_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_SLT_done:
    brsge8 .Lst8_postinc_03f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_03f_SGE_done
.Lst8_postinc_03f_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_03f_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer c0, source r4, start 0xFFFF.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0x7400
    push16 r5
    pop16 r0
    ldi16 c0, 0xffff
    st8 [c0+], r4
    push16 r4
    push16 r4
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_wrap_0_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_EQ_done
.Lst8_postinc_wrap_0_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_EQ_done:
    brne8 .Lst8_postinc_wrap_0_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_NE_done
.Lst8_postinc_wrap_0_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_NE_done:
    brult8 .Lst8_postinc_wrap_0_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_ULT_done
.Lst8_postinc_wrap_0_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_ULT_done:
    bruge8 .Lst8_postinc_wrap_0_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_UGE_done
.Lst8_postinc_wrap_0_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_UGE_done:
    brslt8 .Lst8_postinc_wrap_0_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_SLT_done
.Lst8_postinc_wrap_0_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_SLT_done:
    brsge8 .Lst8_postinc_wrap_0_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_0_SGE_done
.Lst8_postinc_wrap_0_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_0_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer c1, source r1, start 0xFFFF.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa723
    push16 r4
    pop16 r1
    ldi16 c0, 0x7511
    push16 r4
    pop16 r0
    ldi16 c1, 0xffff
    st8 [c1+], r1
    push16 r1
    push16 r5
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_wrap_1_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_EQ_done
.Lst8_postinc_wrap_1_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_EQ_done:
    brne8 .Lst8_postinc_wrap_1_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_NE_done
.Lst8_postinc_wrap_1_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_NE_done:
    brult8 .Lst8_postinc_wrap_1_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_ULT_done
.Lst8_postinc_wrap_1_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_ULT_done:
    bruge8 .Lst8_postinc_wrap_1_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_UGE_done
.Lst8_postinc_wrap_1_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_UGE_done:
    brslt8 .Lst8_postinc_wrap_1_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_SLT_done
.Lst8_postinc_wrap_1_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_SLT_done:
    brsge8 .Lst8_postinc_wrap_1_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_1_SGE_done
.Lst8_postinc_wrap_1_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_1_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer c2, source r6, start 0xFFFF.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7622
    push16 r4
    pop16 r0
    ldi16 c2, 0xffff
    st8 [c2+], r6
    push16 r6
    push16 r6
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_wrap_2_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_EQ_done
.Lst8_postinc_wrap_2_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_EQ_done:
    brne8 .Lst8_postinc_wrap_2_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_NE_done
.Lst8_postinc_wrap_2_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_NE_done:
    brult8 .Lst8_postinc_wrap_2_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_ULT_done
.Lst8_postinc_wrap_2_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_ULT_done:
    bruge8 .Lst8_postinc_wrap_2_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_UGE_done
.Lst8_postinc_wrap_2_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_UGE_done:
    brslt8 .Lst8_postinc_wrap_2_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_SLT_done
.Lst8_postinc_wrap_2_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_SLT_done:
    brsge8 .Lst8_postinc_wrap_2_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_2_SGE_done
.Lst8_postinc_wrap_2_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_2_SGE_done:
    mem_emit_char '\n'

    ; WRAP pointer c3, source r3, start 0xFFFF.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa969
    push16 r4
    pop16 r3
    ldi16 c0, 0x7733
    push16 r4
    pop16 r0
    ldi16 c3, 0xffff
    st8 [c3+], r3
    push16 r3
    push16 r7
    push16 r0
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lst8_postinc_wrap_3_EQ_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_EQ_done
.Lst8_postinc_wrap_3_EQ_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_EQ_done:
    brne8 .Lst8_postinc_wrap_3_NE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_NE_done
.Lst8_postinc_wrap_3_NE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_NE_done:
    brult8 .Lst8_postinc_wrap_3_ULT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_ULT_done
.Lst8_postinc_wrap_3_ULT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_ULT_done:
    bruge8 .Lst8_postinc_wrap_3_UGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_UGE_done
.Lst8_postinc_wrap_3_UGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_UGE_done:
    brslt8 .Lst8_postinc_wrap_3_SLT_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_SLT_done
.Lst8_postinc_wrap_3_SLT_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_SLT_done:
    brsge8 .Lst8_postinc_wrap_3_SGE_true
    mem_emit_char 'A'
    jmp8 .Lst8_postinc_wrap_3_SGE_done
.Lst8_postinc_wrap_3_SGE_true:
    mem_emit_char 'B'
.Lst8_postinc_wrap_3_SGE_done:
    mem_emit_char '\n'

    sys debug_break
