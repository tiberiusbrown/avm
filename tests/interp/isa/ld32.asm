.include "include/cold32_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; ld32: q0,r0, unaligned overlap, addr=0x05FD, RRSPEC32=0x00.
    ldi16 r4, 0x05fc
    ldi8 r5, 0x31
    st8 [r4], r5
    ldi16 r4, 0x05fd
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x05fe
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x05ff
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0600
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x05fd
    push16 r4
    ldi16 r4, 0xc200
    push16 r4
    ldi16 r4, 0x1357
    push16 r4
    ldi16 r4, 0x147a
    push16 r4
    ldi16 r4, 0x159d
    push16 r4
    ldi16 r4, 0x16c0
    push16 r4
    ldi16 r4, 0x17e3
    push16 r4
    ldi16 r4, 0x1906
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x00 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05fc
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05fe
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0600
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_000_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_EQ_done
.Lld32_000_EQ_true:
    cold32_emit_char 'B'
.Lld32_000_EQ_done:
    brne8 .Lld32_000_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_NE_done
.Lld32_000_NE_true:
    cold32_emit_char 'B'
.Lld32_000_NE_done:
    brult8 .Lld32_000_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_ULT_done
.Lld32_000_ULT_true:
    cold32_emit_char 'B'
.Lld32_000_ULT_done:
    bruge8 .Lld32_000_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_UGE_done
.Lld32_000_UGE_true:
    cold32_emit_char 'B'
.Lld32_000_UGE_done:
    brslt8 .Lld32_000_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_SLT_done
.Lld32_000_SLT_true:
    cold32_emit_char 'B'
.Lld32_000_SLT_done:
    brsge8 .Lld32_000_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_000_SGE_done
.Lld32_000_SGE_true:
    cold32_emit_char 'B'
.Lld32_000_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r1, aligned overlap, addr=0x0526, RRSPEC32=0x02.
    ldi16 r4, 0x0525
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x0526
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0527
    ldi8 r5, 0x46
    st8 [r4], r5
    ldi16 r4, 0x0528
    ldi8 r5, 0x23
    st8 [r4], r5
    ldi16 r4, 0x0529
    ldi8 r5, 0x11
    st8 [r4], r5
    ldi16 r4, 0x052a
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb131
    push16 r4
    ldi16 r4, 0x0526
    push16 r4
    ldi16 r4, 0x1394
    push16 r4
    ldi16 r4, 0x14b7
    push16 r4
    ldi16 r4, 0x15da
    push16 r4
    ldi16 r4, 0x16fd
    push16 r4
    ldi16 r4, 0x1820
    push16 r4
    ldi16 r4, 0x1943
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x02 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0525
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0527
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0529
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_001_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_EQ_done
.Lld32_001_EQ_true:
    cold32_emit_char 'B'
.Lld32_001_EQ_done:
    brne8 .Lld32_001_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_NE_done
.Lld32_001_NE_true:
    cold32_emit_char 'B'
.Lld32_001_NE_done:
    brult8 .Lld32_001_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_ULT_done
.Lld32_001_ULT_true:
    cold32_emit_char 'B'
.Lld32_001_ULT_done:
    bruge8 .Lld32_001_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_UGE_done
.Lld32_001_UGE_true:
    cold32_emit_char 'B'
.Lld32_001_UGE_done:
    brslt8 .Lld32_001_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_SLT_done
.Lld32_001_SLT_true:
    cold32_emit_char 'B'
.Lld32_001_SLT_done:
    brsge8 .Lld32_001_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_001_SGE_done
.Lld32_001_SGE_true:
    cold32_emit_char 'B'
.Lld32_001_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r2, aligned, addr=0x052C, RRSPEC32=0x04.
    ldi16 r4, 0x052b
    ldi8 r5, 0x41
    st8 [r4], r5
    ldi16 r4, 0x052c
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x052d
    ldi8 r5, 0x5c
    st8 [r4], r5
    ldi16 r4, 0x052e
    ldi8 r5, 0x26
    st8 [r4], r5
    ldi16 r4, 0x052f
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x0530
    ldi8 r5, 0xbd
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb162
    push16 r4
    ldi16 r4, 0xc26e
    push16 r4
    ldi16 r4, 0x052c
    push16 r4
    ldi16 r4, 0x14f4
    push16 r4
    ldi16 r4, 0x1617
    push16 r4
    ldi16 r4, 0x173a
    push16 r4
    ldi16 r4, 0x185d
    push16 r4
    ldi16 r4, 0x1980
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x052b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x052d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x052f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_002_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_EQ_done
.Lld32_002_EQ_true:
    cold32_emit_char 'B'
.Lld32_002_EQ_done:
    brne8 .Lld32_002_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_NE_done
.Lld32_002_NE_true:
    cold32_emit_char 'B'
.Lld32_002_NE_done:
    brult8 .Lld32_002_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_ULT_done
.Lld32_002_ULT_true:
    cold32_emit_char 'B'
.Lld32_002_ULT_done:
    bruge8 .Lld32_002_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_UGE_done
.Lld32_002_UGE_true:
    cold32_emit_char 'B'
.Lld32_002_UGE_done:
    brslt8 .Lld32_002_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_SLT_done
.Lld32_002_SLT_true:
    cold32_emit_char 'B'
.Lld32_002_SLT_done:
    brsge8 .Lld32_002_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_002_SGE_done
.Lld32_002_SGE_true:
    cold32_emit_char 'B'
.Lld32_002_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r3, aligned, addr=0x0532, RRSPEC32=0x06.
    ldi16 r4, 0x0531
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0532
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0533
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x0534
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x0535
    ldi8 r5, 0x13
    st8 [r4], r5
    ldi16 r4, 0x0536
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb193
    push16 r4
    ldi16 r4, 0xc2a5
    push16 r4
    ldi16 r4, 0x140e
    push16 r4
    ldi16 r4, 0x0532
    push16 r4
    ldi16 r4, 0x1654
    push16 r4
    ldi16 r4, 0x1777
    push16 r4
    ldi16 r4, 0x189a
    push16 r4
    ldi16 r4, 0x19bd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0531
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0533
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0535
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_003_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_EQ_done
.Lld32_003_EQ_true:
    cold32_emit_char 'B'
.Lld32_003_EQ_done:
    brne8 .Lld32_003_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_NE_done
.Lld32_003_NE_true:
    cold32_emit_char 'B'
.Lld32_003_NE_done:
    brult8 .Lld32_003_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_ULT_done
.Lld32_003_ULT_true:
    cold32_emit_char 'B'
.Lld32_003_ULT_done:
    bruge8 .Lld32_003_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_UGE_done
.Lld32_003_UGE_true:
    cold32_emit_char 'B'
.Lld32_003_UGE_done:
    brslt8 .Lld32_003_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_SLT_done
.Lld32_003_SLT_true:
    cold32_emit_char 'B'
.Lld32_003_SLT_done:
    brsge8 .Lld32_003_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_003_SGE_done
.Lld32_003_SGE_true:
    cold32_emit_char 'B'
.Lld32_003_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r4, aligned, addr=0x0538, RRSPEC32=0x08.
    ldi16 r4, 0x0537
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x0538
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0539
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x053a
    ldi8 r5, 0x2c
    st8 [r4], r5
    ldi16 r4, 0x053b
    ldi8 r5, 0x14
    st8 [r4], r5
    ldi16 r4, 0x053c
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb1c4
    push16 r4
    ldi16 r4, 0xc2dc
    push16 r4
    ldi16 r4, 0x144b
    push16 r4
    ldi16 r4, 0x156e
    push16 r4
    ldi16 r4, 0x0538
    push16 r4
    ldi16 r4, 0x17b4
    push16 r4
    ldi16 r4, 0x18d7
    push16 r4
    ldi16 r4, 0x19fa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0537
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0539
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x053b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_004_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_EQ_done
.Lld32_004_EQ_true:
    cold32_emit_char 'B'
.Lld32_004_EQ_done:
    brne8 .Lld32_004_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_NE_done
.Lld32_004_NE_true:
    cold32_emit_char 'B'
.Lld32_004_NE_done:
    brult8 .Lld32_004_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_ULT_done
.Lld32_004_ULT_true:
    cold32_emit_char 'B'
.Lld32_004_ULT_done:
    bruge8 .Lld32_004_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_UGE_done
.Lld32_004_UGE_true:
    cold32_emit_char 'B'
.Lld32_004_UGE_done:
    brslt8 .Lld32_004_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_SLT_done
.Lld32_004_SLT_true:
    cold32_emit_char 'B'
.Lld32_004_SLT_done:
    brsge8 .Lld32_004_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_004_SGE_done
.Lld32_004_SGE_true:
    cold32_emit_char 'B'
.Lld32_004_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r5, aligned, addr=0x053E, RRSPEC32=0x0A.
    ldi16 r4, 0x053d
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x053e
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x053f
    ldi8 r5, 0x9e
    st8 [r4], r5
    ldi16 r4, 0x0540
    ldi8 r5, 0x2f
    st8 [r4], r5
    ldi16 r4, 0x0541
    ldi8 r5, 0x15
    st8 [r4], r5
    ldi16 r4, 0x0542
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb1f5
    push16 r4
    ldi16 r4, 0xc313
    push16 r4
    ldi16 r4, 0x1488
    push16 r4
    ldi16 r4, 0x15ab
    push16 r4
    ldi16 r4, 0x16ce
    push16 r4
    ldi16 r4, 0x053e
    push16 r4
    ldi16 r4, 0x1914
    push16 r4
    ldi16 r4, 0x1a37
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x053d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x053f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0541
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_005_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_EQ_done
.Lld32_005_EQ_true:
    cold32_emit_char 'B'
.Lld32_005_EQ_done:
    brne8 .Lld32_005_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_NE_done
.Lld32_005_NE_true:
    cold32_emit_char 'B'
.Lld32_005_NE_done:
    brult8 .Lld32_005_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_ULT_done
.Lld32_005_ULT_true:
    cold32_emit_char 'B'
.Lld32_005_ULT_done:
    bruge8 .Lld32_005_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_UGE_done
.Lld32_005_UGE_true:
    cold32_emit_char 'B'
.Lld32_005_UGE_done:
    brslt8 .Lld32_005_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_SLT_done
.Lld32_005_SLT_true:
    cold32_emit_char 'B'
.Lld32_005_SLT_done:
    brsge8 .Lld32_005_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_005_SGE_done
.Lld32_005_SGE_true:
    cold32_emit_char 'B'
.Lld32_005_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r6, aligned, addr=0x0544, RRSPEC32=0x0C.
    ldi16 r4, 0x0543
    ldi8 r5, 0x61
    st8 [r4], r5
    ldi16 r4, 0x0544
    ldi8 r5, 0xd0
    st8 [r4], r5
    ldi16 r4, 0x0545
    ldi8 r5, 0xb4
    st8 [r4], r5
    ldi16 r4, 0x0546
    ldi8 r5, 0x32
    st8 [r4], r5
    ldi16 r4, 0x0547
    ldi8 r5, 0x16
    st8 [r4], r5
    ldi16 r4, 0x0548
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb226
    push16 r4
    ldi16 r4, 0xc34a
    push16 r4
    ldi16 r4, 0x14c5
    push16 r4
    ldi16 r4, 0x15e8
    push16 r4
    ldi16 r4, 0x170b
    push16 r4
    ldi16 r4, 0x182e
    push16 r4
    ldi16 r4, 0x0544
    push16 r4
    ldi16 r4, 0x1a74
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0543
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0545
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0547
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_006_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_EQ_done
.Lld32_006_EQ_true:
    cold32_emit_char 'B'
.Lld32_006_EQ_done:
    brne8 .Lld32_006_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_NE_done
.Lld32_006_NE_true:
    cold32_emit_char 'B'
.Lld32_006_NE_done:
    brult8 .Lld32_006_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_ULT_done
.Lld32_006_ULT_true:
    cold32_emit_char 'B'
.Lld32_006_ULT_done:
    bruge8 .Lld32_006_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_UGE_done
.Lld32_006_UGE_true:
    cold32_emit_char 'B'
.Lld32_006_UGE_done:
    brslt8 .Lld32_006_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_SLT_done
.Lld32_006_SLT_true:
    cold32_emit_char 'B'
.Lld32_006_SLT_done:
    brsge8 .Lld32_006_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_006_SGE_done
.Lld32_006_SGE_true:
    cold32_emit_char 'B'
.Lld32_006_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r7, aligned, addr=0x054A, RRSPEC32=0x0E.
    ldi16 r4, 0x0549
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x054a
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x054b
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x054c
    ldi8 r5, 0x35
    st8 [r4], r5
    ldi16 r4, 0x054d
    ldi8 r5, 0x17
    st8 [r4], r5
    ldi16 r4, 0x054e
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb257
    push16 r4
    ldi16 r4, 0xc381
    push16 r4
    ldi16 r4, 0x1502
    push16 r4
    ldi16 r4, 0x1625
    push16 r4
    ldi16 r4, 0x1748
    push16 r4
    ldi16 r4, 0x186b
    push16 r4
    ldi16 r4, 0x198e
    push16 r4
    ldi16 r4, 0x054a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0549
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x054b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x054d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_007_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_EQ_done
.Lld32_007_EQ_true:
    cold32_emit_char 'B'
.Lld32_007_EQ_done:
    brne8 .Lld32_007_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_NE_done
.Lld32_007_NE_true:
    cold32_emit_char 'B'
.Lld32_007_NE_done:
    brult8 .Lld32_007_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_ULT_done
.Lld32_007_ULT_true:
    cold32_emit_char 'B'
.Lld32_007_ULT_done:
    bruge8 .Lld32_007_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_UGE_done
.Lld32_007_UGE_true:
    cold32_emit_char 'B'
.Lld32_007_UGE_done:
    brslt8 .Lld32_007_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_SLT_done
.Lld32_007_SLT_true:
    cold32_emit_char 'B'
.Lld32_007_SLT_done:
    brsge8 .Lld32_007_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_007_SGE_done
.Lld32_007_SGE_true:
    cold32_emit_char 'B'
.Lld32_007_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r0, aligned, addr=0x0550, RRSPEC32=0x40.
    ldi16 r4, 0x054f
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x0550
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x0551
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0552
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0553
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x0554
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0550
    push16 r4
    ldi16 r4, 0x141c
    push16 r4
    ldi16 r4, 0xb389
    push16 r4
    ldi16 r4, 0xc4c9
    push16 r4
    ldi16 r4, 0x1785
    push16 r4
    ldi16 r4, 0x18a8
    push16 r4
    ldi16 r4, 0x19cb
    push16 r4
    ldi16 r4, 0x1aee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x054f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0551
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0553
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_008_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_EQ_done
.Lld32_008_EQ_true:
    cold32_emit_char 'B'
.Lld32_008_EQ_done:
    brne8 .Lld32_008_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_NE_done
.Lld32_008_NE_true:
    cold32_emit_char 'B'
.Lld32_008_NE_done:
    brult8 .Lld32_008_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_ULT_done
.Lld32_008_ULT_true:
    cold32_emit_char 'B'
.Lld32_008_ULT_done:
    bruge8 .Lld32_008_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_UGE_done
.Lld32_008_UGE_true:
    cold32_emit_char 'B'
.Lld32_008_UGE_done:
    brslt8 .Lld32_008_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_SLT_done
.Lld32_008_SLT_true:
    cold32_emit_char 'B'
.Lld32_008_SLT_done:
    brsge8 .Lld32_008_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_008_SGE_done
.Lld32_008_SGE_true:
    cold32_emit_char 'B'
.Lld32_008_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r1, aligned, addr=0x0556, RRSPEC32=0x42.
    ldi16 r4, 0x0555
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x0556
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x0557
    ldi8 r5, 0x6e
    st8 [r4], r5
    ldi16 r4, 0x0558
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0559
    ldi8 r5, 0x2a
    st8 [r4], r5
    ldi16 r4, 0x055a
    ldi8 r5, 0x0b
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1336
    push16 r4
    ldi16 r4, 0x0556
    push16 r4
    ldi16 r4, 0xb3ba
    push16 r4
    ldi16 r4, 0xc500
    push16 r4
    ldi16 r4, 0x17c2
    push16 r4
    ldi16 r4, 0x18e5
    push16 r4
    ldi16 r4, 0x1a08
    push16 r4
    ldi16 r4, 0x1b2b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x42 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0555
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0557
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0559
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_009_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_EQ_done
.Lld32_009_EQ_true:
    cold32_emit_char 'B'
.Lld32_009_EQ_done:
    brne8 .Lld32_009_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_NE_done
.Lld32_009_NE_true:
    cold32_emit_char 'B'
.Lld32_009_NE_done:
    brult8 .Lld32_009_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_ULT_done
.Lld32_009_ULT_true:
    cold32_emit_char 'B'
.Lld32_009_ULT_done:
    bruge8 .Lld32_009_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_UGE_done
.Lld32_009_UGE_true:
    cold32_emit_char 'B'
.Lld32_009_UGE_done:
    brslt8 .Lld32_009_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_SLT_done
.Lld32_009_SLT_true:
    cold32_emit_char 'B'
.Lld32_009_SLT_done:
    brsge8 .Lld32_009_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_009_SGE_done
.Lld32_009_SGE_true:
    cold32_emit_char 'B'
.Lld32_009_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r2, aligned overlap, addr=0x06FE, RRSPEC32=0x44.
    ldi16 r4, 0x06fd
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x06fe
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x06ff
    ldi8 r5, 0x84
    st8 [r4], r5
    ldi16 r4, 0x0700
    ldi8 r5, 0x4f
    st8 [r4], r5
    ldi16 r4, 0x0701
    ldi8 r5, 0x2b
    st8 [r4], r5
    ldi16 r4, 0x0702
    ldi8 r5, 0x16
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1373
    push16 r4
    ldi16 r4, 0x1496
    push16 r4
    ldi16 r4, 0x06fe
    push16 r4
    ldi16 r4, 0xc537
    push16 r4
    ldi16 r4, 0x17ff
    push16 r4
    ldi16 r4, 0x1922
    push16 r4
    ldi16 r4, 0x1a45
    push16 r4
    ldi16 r4, 0x1b68
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x44 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x06fd
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x06ff
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0701
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_EQ_done
.Lld32_00a_EQ_true:
    cold32_emit_char 'B'
.Lld32_00a_EQ_done:
    brne8 .Lld32_00a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_NE_done
.Lld32_00a_NE_true:
    cold32_emit_char 'B'
.Lld32_00a_NE_done:
    brult8 .Lld32_00a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_ULT_done
.Lld32_00a_ULT_true:
    cold32_emit_char 'B'
.Lld32_00a_ULT_done:
    bruge8 .Lld32_00a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_UGE_done
.Lld32_00a_UGE_true:
    cold32_emit_char 'B'
.Lld32_00a_UGE_done:
    brslt8 .Lld32_00a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_SLT_done
.Lld32_00a_SLT_true:
    cold32_emit_char 'B'
.Lld32_00a_SLT_done:
    brsge8 .Lld32_00a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00a_SGE_done
.Lld32_00a_SGE_true:
    cold32_emit_char 'B'
.Lld32_00a_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r3, aligned overlap, addr=0x0562, RRSPEC32=0x46.
    ldi16 r4, 0x0561
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x0562
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x0563
    ldi8 r5, 0x9a
    st8 [r4], r5
    ldi16 r4, 0x0564
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x0565
    ldi8 r5, 0x2c
    st8 [r4], r5
    ldi16 r4, 0x0566
    ldi8 r5, 0x21
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x13b0
    push16 r4
    ldi16 r4, 0x14d3
    push16 r4
    ldi16 r4, 0xb41c
    push16 r4
    ldi16 r4, 0x0562
    push16 r4
    ldi16 r4, 0x183c
    push16 r4
    ldi16 r4, 0x195f
    push16 r4
    ldi16 r4, 0x1a82
    push16 r4
    ldi16 r4, 0x1ba5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x46 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0561
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0563
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0565
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_EQ_done
.Lld32_00b_EQ_true:
    cold32_emit_char 'B'
.Lld32_00b_EQ_done:
    brne8 .Lld32_00b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_NE_done
.Lld32_00b_NE_true:
    cold32_emit_char 'B'
.Lld32_00b_NE_done:
    brult8 .Lld32_00b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_ULT_done
.Lld32_00b_ULT_true:
    cold32_emit_char 'B'
.Lld32_00b_ULT_done:
    bruge8 .Lld32_00b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_UGE_done
.Lld32_00b_UGE_true:
    cold32_emit_char 'B'
.Lld32_00b_UGE_done:
    brslt8 .Lld32_00b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_SLT_done
.Lld32_00b_SLT_true:
    cold32_emit_char 'B'
.Lld32_00b_SLT_done:
    brsge8 .Lld32_00b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00b_SGE_done
.Lld32_00b_SGE_true:
    cold32_emit_char 'B'
.Lld32_00b_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r4, aligned, addr=0x0568, RRSPEC32=0x48.
    ldi16 r4, 0x0567
    ldi8 r5, 0x89
    st8 [r4], r5
    ldi16 r4, 0x0568
    ldi8 r5, 0xd8
    st8 [r4], r5
    ldi16 r4, 0x0569
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x056a
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x056b
    ldi8 r5, 0x2d
    st8 [r4], r5
    ldi16 r4, 0x056c
    ldi8 r5, 0x2c
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x13ed
    push16 r4
    ldi16 r4, 0x1510
    push16 r4
    ldi16 r4, 0xb44d
    push16 r4
    ldi16 r4, 0xc5a5
    push16 r4
    ldi16 r4, 0x0568
    push16 r4
    ldi16 r4, 0x199c
    push16 r4
    ldi16 r4, 0x1abf
    push16 r4
    ldi16 r4, 0x1be2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0567
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0569
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x056b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_EQ_done
.Lld32_00c_EQ_true:
    cold32_emit_char 'B'
.Lld32_00c_EQ_done:
    brne8 .Lld32_00c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_NE_done
.Lld32_00c_NE_true:
    cold32_emit_char 'B'
.Lld32_00c_NE_done:
    brult8 .Lld32_00c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_ULT_done
.Lld32_00c_ULT_true:
    cold32_emit_char 'B'
.Lld32_00c_ULT_done:
    bruge8 .Lld32_00c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_UGE_done
.Lld32_00c_UGE_true:
    cold32_emit_char 'B'
.Lld32_00c_UGE_done:
    brslt8 .Lld32_00c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_SLT_done
.Lld32_00c_SLT_true:
    cold32_emit_char 'B'
.Lld32_00c_SLT_done:
    brsge8 .Lld32_00c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00c_SGE_done
.Lld32_00c_SGE_true:
    cold32_emit_char 'B'
.Lld32_00c_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r5, aligned, addr=0x056E, RRSPEC32=0x4A.
    ldi16 r4, 0x056d
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x056e
    ldi8 r5, 0xf0
    st8 [r4], r5
    ldi16 r4, 0x056f
    ldi8 r5, 0xc6
    st8 [r4], r5
    ldi16 r4, 0x0570
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0571
    ldi8 r5, 0x2e
    st8 [r4], r5
    ldi16 r4, 0x0572
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x142a
    push16 r4
    ldi16 r4, 0x154d
    push16 r4
    ldi16 r4, 0xb47e
    push16 r4
    ldi16 r4, 0xc5dc
    push16 r4
    ldi16 r4, 0x18b6
    push16 r4
    ldi16 r4, 0x056e
    push16 r4
    ldi16 r4, 0x1afc
    push16 r4
    ldi16 r4, 0x1c1f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x056d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x056f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0571
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_EQ_done
.Lld32_00d_EQ_true:
    cold32_emit_char 'B'
.Lld32_00d_EQ_done:
    brne8 .Lld32_00d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_NE_done
.Lld32_00d_NE_true:
    cold32_emit_char 'B'
.Lld32_00d_NE_done:
    brult8 .Lld32_00d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_ULT_done
.Lld32_00d_ULT_true:
    cold32_emit_char 'B'
.Lld32_00d_ULT_done:
    bruge8 .Lld32_00d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_UGE_done
.Lld32_00d_UGE_true:
    cold32_emit_char 'B'
.Lld32_00d_UGE_done:
    brslt8 .Lld32_00d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_SLT_done
.Lld32_00d_SLT_true:
    cold32_emit_char 'B'
.Lld32_00d_SLT_done:
    brsge8 .Lld32_00d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00d_SGE_done
.Lld32_00d_SGE_true:
    cold32_emit_char 'B'
.Lld32_00d_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r6, aligned, addr=0x0574, RRSPEC32=0x4C.
    ldi16 r4, 0x0573
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0574
    ldi8 r5, 0x08
    st8 [r4], r5
    ldi16 r4, 0x0575
    ldi8 r5, 0xdd
    st8 [r4], r5
    ldi16 r4, 0x0576
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0577
    ldi8 r5, 0x2f
    st8 [r4], r5
    ldi16 r4, 0x0578
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1467
    push16 r4
    ldi16 r4, 0x158a
    push16 r4
    ldi16 r4, 0xb4af
    push16 r4
    ldi16 r4, 0xc613
    push16 r4
    ldi16 r4, 0x18f3
    push16 r4
    ldi16 r4, 0x1a16
    push16 r4
    ldi16 r4, 0x0574
    push16 r4
    ldi16 r4, 0x1c5c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0573
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0575
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0577
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_EQ_done
.Lld32_00e_EQ_true:
    cold32_emit_char 'B'
.Lld32_00e_EQ_done:
    brne8 .Lld32_00e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_NE_done
.Lld32_00e_NE_true:
    cold32_emit_char 'B'
.Lld32_00e_NE_done:
    brult8 .Lld32_00e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_ULT_done
.Lld32_00e_ULT_true:
    cold32_emit_char 'B'
.Lld32_00e_ULT_done:
    bruge8 .Lld32_00e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_UGE_done
.Lld32_00e_UGE_true:
    cold32_emit_char 'B'
.Lld32_00e_UGE_done:
    brslt8 .Lld32_00e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_SLT_done
.Lld32_00e_SLT_true:
    cold32_emit_char 'B'
.Lld32_00e_SLT_done:
    brsge8 .Lld32_00e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00e_SGE_done
.Lld32_00e_SGE_true:
    cold32_emit_char 'B'
.Lld32_00e_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r7, aligned, addr=0x057A, RRSPEC32=0x4E.
    ldi16 r4, 0x0579
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x057a
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x057b
    ldi8 r5, 0xf3
    st8 [r4], r5
    ldi16 r4, 0x057c
    ldi8 r5, 0x5e
    st8 [r4], r5
    ldi16 r4, 0x057d
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x057e
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x14a4
    push16 r4
    ldi16 r4, 0x15c7
    push16 r4
    ldi16 r4, 0xb4e0
    push16 r4
    ldi16 r4, 0xc64a
    push16 r4
    ldi16 r4, 0x1930
    push16 r4
    ldi16 r4, 0x1a53
    push16 r4
    ldi16 r4, 0x1b76
    push16 r4
    ldi16 r4, 0x057a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0579
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x057b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x057d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_00f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_EQ_done
.Lld32_00f_EQ_true:
    cold32_emit_char 'B'
.Lld32_00f_EQ_done:
    brne8 .Lld32_00f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_NE_done
.Lld32_00f_NE_true:
    cold32_emit_char 'B'
.Lld32_00f_NE_done:
    brult8 .Lld32_00f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_ULT_done
.Lld32_00f_ULT_true:
    cold32_emit_char 'B'
.Lld32_00f_ULT_done:
    bruge8 .Lld32_00f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_UGE_done
.Lld32_00f_UGE_true:
    cold32_emit_char 'B'
.Lld32_00f_UGE_done:
    brslt8 .Lld32_00f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_SLT_done
.Lld32_00f_SLT_true:
    cold32_emit_char 'B'
.Lld32_00f_SLT_done:
    brsge8 .Lld32_00f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_00f_SGE_done
.Lld32_00f_SGE_true:
    cold32_emit_char 'B'
.Lld32_00f_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r0, aligned, addr=0x0580, RRSPEC32=0x80.
    ldi16 r4, 0x057f
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x0580
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x0581
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0582
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x0583
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x0584
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0580
    push16 r4
    ldi16 r4, 0x1604
    push16 r4
    ldi16 r4, 0x1727
    push16 r4
    ldi16 r4, 0x184a
    push16 r4
    ldi16 r4, 0xb612
    push16 r4
    ldi16 r4, 0xc792
    push16 r4
    ldi16 r4, 0x1bb3
    push16 r4
    ldi16 r4, 0x1cd6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x057f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0581
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0583
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_010_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_EQ_done
.Lld32_010_EQ_true:
    cold32_emit_char 'B'
.Lld32_010_EQ_done:
    brne8 .Lld32_010_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_NE_done
.Lld32_010_NE_true:
    cold32_emit_char 'B'
.Lld32_010_NE_done:
    brult8 .Lld32_010_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_ULT_done
.Lld32_010_ULT_true:
    cold32_emit_char 'B'
.Lld32_010_ULT_done:
    bruge8 .Lld32_010_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_UGE_done
.Lld32_010_UGE_true:
    cold32_emit_char 'B'
.Lld32_010_UGE_done:
    brslt8 .Lld32_010_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_SLT_done
.Lld32_010_SLT_true:
    cold32_emit_char 'B'
.Lld32_010_SLT_done:
    brsge8 .Lld32_010_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_010_SGE_done
.Lld32_010_SGE_true:
    cold32_emit_char 'B'
.Lld32_010_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r1, aligned, addr=0x0586, RRSPEC32=0x82.
    ldi16 r4, 0x0585
    ldi8 r5, 0xa9
    st8 [r4], r5
    ldi16 r4, 0x0586
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x0587
    ldi8 r5, 0x96
    st8 [r4], r5
    ldi16 r4, 0x0588
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x0589
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x058a
    ldi8 r5, 0x64
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x151e
    push16 r4
    ldi16 r4, 0x0586
    push16 r4
    ldi16 r4, 0x1764
    push16 r4
    ldi16 r4, 0x1887
    push16 r4
    ldi16 r4, 0xb643
    push16 r4
    ldi16 r4, 0xc7c9
    push16 r4
    ldi16 r4, 0x1bf0
    push16 r4
    ldi16 r4, 0x1d13
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x82 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0585
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0587
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0589
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_011_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_EQ_done
.Lld32_011_EQ_true:
    cold32_emit_char 'B'
.Lld32_011_EQ_done:
    brne8 .Lld32_011_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_NE_done
.Lld32_011_NE_true:
    cold32_emit_char 'B'
.Lld32_011_NE_done:
    brult8 .Lld32_011_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_ULT_done
.Lld32_011_ULT_true:
    cold32_emit_char 'B'
.Lld32_011_ULT_done:
    bruge8 .Lld32_011_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_UGE_done
.Lld32_011_UGE_true:
    cold32_emit_char 'B'
.Lld32_011_UGE_done:
    brslt8 .Lld32_011_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_SLT_done
.Lld32_011_SLT_true:
    cold32_emit_char 'B'
.Lld32_011_SLT_done:
    brsge8 .Lld32_011_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_011_SGE_done
.Lld32_011_SGE_true:
    cold32_emit_char 'B'
.Lld32_011_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r2, aligned, addr=0x058C, RRSPEC32=0x84.
    ldi16 r4, 0x058b
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x058c
    ldi8 r5, 0xe0
    st8 [r4], r5
    ldi16 r4, 0x058d
    ldi8 r5, 0xac
    st8 [r4], r5
    ldi16 r4, 0x058e
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x058f
    ldi8 r5, 0x44
    st8 [r4], r5
    ldi16 r4, 0x0590
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x155b
    push16 r4
    ldi16 r4, 0x167e
    push16 r4
    ldi16 r4, 0x058c
    push16 r4
    ldi16 r4, 0x18c4
    push16 r4
    ldi16 r4, 0xb674
    push16 r4
    ldi16 r4, 0xc800
    push16 r4
    ldi16 r4, 0x1c2d
    push16 r4
    ldi16 r4, 0x1d50
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x058b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x058d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x058f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_012_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_EQ_done
.Lld32_012_EQ_true:
    cold32_emit_char 'B'
.Lld32_012_EQ_done:
    brne8 .Lld32_012_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_NE_done
.Lld32_012_NE_true:
    cold32_emit_char 'B'
.Lld32_012_NE_done:
    brult8 .Lld32_012_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_ULT_done
.Lld32_012_ULT_true:
    cold32_emit_char 'B'
.Lld32_012_ULT_done:
    bruge8 .Lld32_012_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_UGE_done
.Lld32_012_UGE_true:
    cold32_emit_char 'B'
.Lld32_012_UGE_done:
    brslt8 .Lld32_012_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_SLT_done
.Lld32_012_SLT_true:
    cold32_emit_char 'B'
.Lld32_012_SLT_done:
    brsge8 .Lld32_012_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_012_SGE_done
.Lld32_012_SGE_true:
    cold32_emit_char 'B'
.Lld32_012_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r3, aligned, addr=0x0592, RRSPEC32=0x86.
    ldi16 r4, 0x0591
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0592
    ldi8 r5, 0xf8
    st8 [r4], r5
    ldi16 r4, 0x0593
    ldi8 r5, 0xc2
    st8 [r4], r5
    ldi16 r4, 0x0594
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x0595
    ldi8 r5, 0x45
    st8 [r4], r5
    ldi16 r4, 0x0596
    ldi8 r5, 0x7a
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1598
    push16 r4
    ldi16 r4, 0x16bb
    push16 r4
    ldi16 r4, 0x17de
    push16 r4
    ldi16 r4, 0x0592
    push16 r4
    ldi16 r4, 0xb6a5
    push16 r4
    ldi16 r4, 0xc837
    push16 r4
    ldi16 r4, 0x1c6a
    push16 r4
    ldi16 r4, 0x1d8d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x86 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0591
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0593
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0595
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_013_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_EQ_done
.Lld32_013_EQ_true:
    cold32_emit_char 'B'
.Lld32_013_EQ_done:
    brne8 .Lld32_013_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_NE_done
.Lld32_013_NE_true:
    cold32_emit_char 'B'
.Lld32_013_NE_done:
    brult8 .Lld32_013_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_ULT_done
.Lld32_013_ULT_true:
    cold32_emit_char 'B'
.Lld32_013_ULT_done:
    bruge8 .Lld32_013_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_UGE_done
.Lld32_013_UGE_true:
    cold32_emit_char 'B'
.Lld32_013_UGE_done:
    brslt8 .Lld32_013_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_SLT_done
.Lld32_013_SLT_true:
    cold32_emit_char 'B'
.Lld32_013_SLT_done:
    brsge8 .Lld32_013_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_013_SGE_done
.Lld32_013_SGE_true:
    cold32_emit_char 'B'
.Lld32_013_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r4, aligned overlap, addr=0x0598, RRSPEC32=0x88.
    ldi16 r4, 0x0597
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x0598
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x0599
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x059a
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x059b
    ldi8 r5, 0x46
    st8 [r4], r5
    ldi16 r4, 0x059c
    ldi8 r5, 0x85
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x15d5
    push16 r4
    ldi16 r4, 0x16f8
    push16 r4
    ldi16 r4, 0x181b
    push16 r4
    ldi16 r4, 0x193e
    push16 r4
    ldi16 r4, 0x0598
    push16 r4
    ldi16 r4, 0xc86e
    push16 r4
    ldi16 r4, 0x1ca7
    push16 r4
    ldi16 r4, 0x1dca
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x88 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0597
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0599
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x059b
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_014_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_EQ_done
.Lld32_014_EQ_true:
    cold32_emit_char 'B'
.Lld32_014_EQ_done:
    brne8 .Lld32_014_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_NE_done
.Lld32_014_NE_true:
    cold32_emit_char 'B'
.Lld32_014_NE_done:
    brult8 .Lld32_014_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_ULT_done
.Lld32_014_ULT_true:
    cold32_emit_char 'B'
.Lld32_014_ULT_done:
    bruge8 .Lld32_014_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_UGE_done
.Lld32_014_UGE_true:
    cold32_emit_char 'B'
.Lld32_014_UGE_done:
    brslt8 .Lld32_014_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_SLT_done
.Lld32_014_SLT_true:
    cold32_emit_char 'B'
.Lld32_014_SLT_done:
    brsge8 .Lld32_014_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_014_SGE_done
.Lld32_014_SGE_true:
    cold32_emit_char 'B'
.Lld32_014_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r5, aligned overlap, addr=0x059E, RRSPEC32=0x8A.
    ldi16 r4, 0x059d
    ldi8 r5, 0xc9
    st8 [r4], r5
    ldi16 r4, 0x059e
    ldi8 r5, 0x28
    st8 [r4], r5
    ldi16 r4, 0x059f
    ldi8 r5, 0xef
    st8 [r4], r5
    ldi16 r4, 0x05a0
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x05a1
    ldi8 r5, 0x47
    st8 [r4], r5
    ldi16 r4, 0x05a2
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1612
    push16 r4
    ldi16 r4, 0x1735
    push16 r4
    ldi16 r4, 0x1858
    push16 r4
    ldi16 r4, 0x197b
    push16 r4
    ldi16 r4, 0xb707
    push16 r4
    ldi16 r4, 0x059e
    push16 r4
    ldi16 r4, 0x1ce4
    push16 r4
    ldi16 r4, 0x1e07
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x059d
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x059f
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05a1
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_015_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_EQ_done
.Lld32_015_EQ_true:
    cold32_emit_char 'B'
.Lld32_015_EQ_done:
    brne8 .Lld32_015_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_NE_done
.Lld32_015_NE_true:
    cold32_emit_char 'B'
.Lld32_015_NE_done:
    brult8 .Lld32_015_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_ULT_done
.Lld32_015_ULT_true:
    cold32_emit_char 'B'
.Lld32_015_ULT_done:
    bruge8 .Lld32_015_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_UGE_done
.Lld32_015_UGE_true:
    cold32_emit_char 'B'
.Lld32_015_UGE_done:
    brslt8 .Lld32_015_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_SLT_done
.Lld32_015_SLT_true:
    cold32_emit_char 'B'
.Lld32_015_SLT_done:
    brsge8 .Lld32_015_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_015_SGE_done
.Lld32_015_SGE_true:
    cold32_emit_char 'B'
.Lld32_015_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r6, aligned, addr=0x05A4, RRSPEC32=0x8C.
    ldi16 r4, 0x05a3
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x05a4
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x05a5
    ldi8 r5, 0x05
    st8 [r4], r5
    ldi16 r4, 0x05a6
    ldi8 r5, 0x85
    st8 [r4], r5
    ldi16 r4, 0x05a7
    ldi8 r5, 0x48
    st8 [r4], r5
    ldi16 r4, 0x05a8
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x164f
    push16 r4
    ldi16 r4, 0x1772
    push16 r4
    ldi16 r4, 0x1895
    push16 r4
    ldi16 r4, 0x19b8
    push16 r4
    ldi16 r4, 0xb738
    push16 r4
    ldi16 r4, 0xc8dc
    push16 r4
    ldi16 r4, 0x05a4
    push16 r4
    ldi16 r4, 0x1e44
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05a3
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05a5
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05a7
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_016_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_EQ_done
.Lld32_016_EQ_true:
    cold32_emit_char 'B'
.Lld32_016_EQ_done:
    brne8 .Lld32_016_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_NE_done
.Lld32_016_NE_true:
    cold32_emit_char 'B'
.Lld32_016_NE_done:
    brult8 .Lld32_016_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_ULT_done
.Lld32_016_ULT_true:
    cold32_emit_char 'B'
.Lld32_016_ULT_done:
    bruge8 .Lld32_016_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_UGE_done
.Lld32_016_UGE_true:
    cold32_emit_char 'B'
.Lld32_016_UGE_done:
    brslt8 .Lld32_016_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_SLT_done
.Lld32_016_SLT_true:
    cold32_emit_char 'B'
.Lld32_016_SLT_done:
    brsge8 .Lld32_016_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_016_SGE_done
.Lld32_016_SGE_true:
    cold32_emit_char 'B'
.Lld32_016_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r7, aligned, addr=0x05AA, RRSPEC32=0x8E.
    ldi16 r4, 0x05a9
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x05aa
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x05ab
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x05ac
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x05ad
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x05ae
    ldi8 r5, 0xa6
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x168c
    push16 r4
    ldi16 r4, 0x17af
    push16 r4
    ldi16 r4, 0x18d2
    push16 r4
    ldi16 r4, 0x19f5
    push16 r4
    ldi16 r4, 0xb769
    push16 r4
    ldi16 r4, 0xc913
    push16 r4
    ldi16 r4, 0x1d5e
    push16 r4
    ldi16 r4, 0x05aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05a9
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05ab
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05ad
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_017_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_EQ_done
.Lld32_017_EQ_true:
    cold32_emit_char 'B'
.Lld32_017_EQ_done:
    brne8 .Lld32_017_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_NE_done
.Lld32_017_NE_true:
    cold32_emit_char 'B'
.Lld32_017_NE_done:
    brult8 .Lld32_017_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_ULT_done
.Lld32_017_ULT_true:
    cold32_emit_char 'B'
.Lld32_017_ULT_done:
    bruge8 .Lld32_017_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_UGE_done
.Lld32_017_UGE_true:
    cold32_emit_char 'B'
.Lld32_017_UGE_done:
    brslt8 .Lld32_017_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_SLT_done
.Lld32_017_SLT_true:
    cold32_emit_char 'B'
.Lld32_017_SLT_done:
    brsge8 .Lld32_017_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_017_SGE_done
.Lld32_017_SGE_true:
    cold32_emit_char 'B'
.Lld32_017_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r0, aligned, addr=0x05B0, RRSPEC32=0xC0.
    ldi16 r4, 0x05af
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x05b0
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x05b1
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x05b2
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x05b3
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x05b4
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x05b0
    push16 r4
    ldi16 r4, 0x17ec
    push16 r4
    ldi16 r4, 0x190f
    push16 r4
    ldi16 r4, 0x1a32
    push16 r4
    ldi16 r4, 0x1b55
    push16 r4
    ldi16 r4, 0x1c78
    push16 r4
    ldi16 r4, 0xb89b
    push16 r4
    ldi16 r4, 0xca5b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05af
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05b1
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05b3
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_018_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_EQ_done
.Lld32_018_EQ_true:
    cold32_emit_char 'B'
.Lld32_018_EQ_done:
    brne8 .Lld32_018_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_NE_done
.Lld32_018_NE_true:
    cold32_emit_char 'B'
.Lld32_018_NE_done:
    brult8 .Lld32_018_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_ULT_done
.Lld32_018_ULT_true:
    cold32_emit_char 'B'
.Lld32_018_ULT_done:
    bruge8 .Lld32_018_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_UGE_done
.Lld32_018_UGE_true:
    cold32_emit_char 'B'
.Lld32_018_UGE_done:
    brslt8 .Lld32_018_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_SLT_done
.Lld32_018_SLT_true:
    cold32_emit_char 'B'
.Lld32_018_SLT_done:
    brsge8 .Lld32_018_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_018_SGE_done
.Lld32_018_SGE_true:
    cold32_emit_char 'B'
.Lld32_018_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r1, aligned, addr=0x05B6, RRSPEC32=0xC2.
    ldi16 r4, 0x05b5
    ldi8 r5, 0xe1
    st8 [r4], r5
    ldi16 r4, 0x05b6
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x05b7
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x05b8
    ldi8 r5, 0x9e
    st8 [r4], r5
    ldi16 r4, 0x05b9
    ldi8 r5, 0x5c
    st8 [r4], r5
    ldi16 r4, 0x05ba
    ldi8 r5, 0xbd
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1706
    push16 r4
    ldi16 r4, 0x05b6
    push16 r4
    ldi16 r4, 0x194c
    push16 r4
    ldi16 r4, 0x1a6f
    push16 r4
    ldi16 r4, 0x1b92
    push16 r4
    ldi16 r4, 0x1cb5
    push16 r4
    ldi16 r4, 0xb8cc
    push16 r4
    ldi16 r4, 0xca92
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05b5
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05b7
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05b9
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_019_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_EQ_done
.Lld32_019_EQ_true:
    cold32_emit_char 'B'
.Lld32_019_EQ_done:
    brne8 .Lld32_019_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_NE_done
.Lld32_019_NE_true:
    cold32_emit_char 'B'
.Lld32_019_NE_done:
    brult8 .Lld32_019_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_ULT_done
.Lld32_019_ULT_true:
    cold32_emit_char 'B'
.Lld32_019_ULT_done:
    bruge8 .Lld32_019_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_UGE_done
.Lld32_019_UGE_true:
    cold32_emit_char 'B'
.Lld32_019_UGE_done:
    brslt8 .Lld32_019_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_SLT_done
.Lld32_019_SLT_true:
    cold32_emit_char 'B'
.Lld32_019_SLT_done:
    brsge8 .Lld32_019_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_019_SGE_done
.Lld32_019_SGE_true:
    cold32_emit_char 'B'
.Lld32_019_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r2, aligned, addr=0x05BC, RRSPEC32=0xC4.
    ldi16 r4, 0x05bb
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x05bc
    ldi8 r5, 0x18
    st8 [r4], r5
    ldi16 r4, 0x05bd
    ldi8 r5, 0xd5
    st8 [r4], r5
    ldi16 r4, 0x05be
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x05bf
    ldi8 r5, 0x5d
    st8 [r4], r5
    ldi16 r4, 0x05c0
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1743
    push16 r4
    ldi16 r4, 0x1866
    push16 r4
    ldi16 r4, 0x05bc
    push16 r4
    ldi16 r4, 0x1aac
    push16 r4
    ldi16 r4, 0x1bcf
    push16 r4
    ldi16 r4, 0x1cf2
    push16 r4
    ldi16 r4, 0xb8fd
    push16 r4
    ldi16 r4, 0xcac9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05bb
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05bd
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05bf
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_EQ_done
.Lld32_01a_EQ_true:
    cold32_emit_char 'B'
.Lld32_01a_EQ_done:
    brne8 .Lld32_01a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_NE_done
.Lld32_01a_NE_true:
    cold32_emit_char 'B'
.Lld32_01a_NE_done:
    brult8 .Lld32_01a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_ULT_done
.Lld32_01a_ULT_true:
    cold32_emit_char 'B'
.Lld32_01a_ULT_done:
    bruge8 .Lld32_01a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_UGE_done
.Lld32_01a_UGE_true:
    cold32_emit_char 'B'
.Lld32_01a_UGE_done:
    brslt8 .Lld32_01a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_SLT_done
.Lld32_01a_SLT_true:
    cold32_emit_char 'B'
.Lld32_01a_SLT_done:
    brsge8 .Lld32_01a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01a_SGE_done
.Lld32_01a_SGE_true:
    cold32_emit_char 'B'
.Lld32_01a_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r3, aligned, addr=0x05C2, RRSPEC32=0xC6.
    ldi16 r4, 0x05c1
    ldi8 r5, 0xf1
    st8 [r4], r5
    ldi16 r4, 0x05c2
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x05c3
    ldi8 r5, 0xeb
    st8 [r4], r5
    ldi16 r4, 0x05c4
    ldi8 r5, 0xa4
    st8 [r4], r5
    ldi16 r4, 0x05c5
    ldi8 r5, 0x5e
    st8 [r4], r5
    ldi16 r4, 0x05c6
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1780
    push16 r4
    ldi16 r4, 0x18a3
    push16 r4
    ldi16 r4, 0x19c6
    push16 r4
    ldi16 r4, 0x05c2
    push16 r4
    ldi16 r4, 0x1c0c
    push16 r4
    ldi16 r4, 0x1d2f
    push16 r4
    ldi16 r4, 0xb92e
    push16 r4
    ldi16 r4, 0xcb00
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05c1
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05c3
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05c5
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_EQ_done
.Lld32_01b_EQ_true:
    cold32_emit_char 'B'
.Lld32_01b_EQ_done:
    brne8 .Lld32_01b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_NE_done
.Lld32_01b_NE_true:
    cold32_emit_char 'B'
.Lld32_01b_NE_done:
    brult8 .Lld32_01b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_ULT_done
.Lld32_01b_ULT_true:
    cold32_emit_char 'B'
.Lld32_01b_ULT_done:
    bruge8 .Lld32_01b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_UGE_done
.Lld32_01b_UGE_true:
    cold32_emit_char 'B'
.Lld32_01b_UGE_done:
    brslt8 .Lld32_01b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_SLT_done
.Lld32_01b_SLT_true:
    cold32_emit_char 'B'
.Lld32_01b_SLT_done:
    brsge8 .Lld32_01b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01b_SGE_done
.Lld32_01b_SGE_true:
    cold32_emit_char 'B'
.Lld32_01b_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r4, aligned, addr=0x05C8, RRSPEC32=0xC8.
    ldi16 r4, 0x05c7
    ldi8 r5, 0xf9
    st8 [r4], r5
    ldi16 r4, 0x05c8
    ldi8 r5, 0x48
    st8 [r4], r5
    ldi16 r4, 0x05c9
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x05ca
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x05cb
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x05cc
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x17bd
    push16 r4
    ldi16 r4, 0x18e0
    push16 r4
    ldi16 r4, 0x1a03
    push16 r4
    ldi16 r4, 0x1b26
    push16 r4
    ldi16 r4, 0x05c8
    push16 r4
    ldi16 r4, 0x1d6c
    push16 r4
    ldi16 r4, 0xb95f
    push16 r4
    ldi16 r4, 0xcb37
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05c7
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05c9
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05cb
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_EQ_done
.Lld32_01c_EQ_true:
    cold32_emit_char 'B'
.Lld32_01c_EQ_done:
    brne8 .Lld32_01c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_NE_done
.Lld32_01c_NE_true:
    cold32_emit_char 'B'
.Lld32_01c_NE_done:
    brult8 .Lld32_01c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_ULT_done
.Lld32_01c_ULT_true:
    cold32_emit_char 'B'
.Lld32_01c_ULT_done:
    bruge8 .Lld32_01c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_UGE_done
.Lld32_01c_UGE_true:
    cold32_emit_char 'B'
.Lld32_01c_UGE_done:
    brslt8 .Lld32_01c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_SLT_done
.Lld32_01c_SLT_true:
    cold32_emit_char 'B'
.Lld32_01c_SLT_done:
    brsge8 .Lld32_01c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01c_SGE_done
.Lld32_01c_SGE_true:
    cold32_emit_char 'B'
.Lld32_01c_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r5, aligned, addr=0x05CE, RRSPEC32=0xCA.
    ldi16 r4, 0x05cd
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x05ce
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x05cf
    ldi8 r5, 0x17
    st8 [r4], r5
    ldi16 r4, 0x05d0
    ldi8 r5, 0xab
    st8 [r4], r5
    ldi16 r4, 0x05d1
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x05d2
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x17fa
    push16 r4
    ldi16 r4, 0x191d
    push16 r4
    ldi16 r4, 0x1a40
    push16 r4
    ldi16 r4, 0x1b63
    push16 r4
    ldi16 r4, 0x1c86
    push16 r4
    ldi16 r4, 0x05ce
    push16 r4
    ldi16 r4, 0xb990
    push16 r4
    ldi16 r4, 0xcb6e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xca ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05cd
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05cf
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05d1
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_EQ_done
.Lld32_01d_EQ_true:
    cold32_emit_char 'B'
.Lld32_01d_EQ_done:
    brne8 .Lld32_01d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_NE_done
.Lld32_01d_NE_true:
    cold32_emit_char 'B'
.Lld32_01d_NE_done:
    brult8 .Lld32_01d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_ULT_done
.Lld32_01d_ULT_true:
    cold32_emit_char 'B'
.Lld32_01d_ULT_done:
    bruge8 .Lld32_01d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_UGE_done
.Lld32_01d_UGE_true:
    cold32_emit_char 'B'
.Lld32_01d_UGE_done:
    brslt8 .Lld32_01d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_SLT_done
.Lld32_01d_SLT_true:
    cold32_emit_char 'B'
.Lld32_01d_SLT_done:
    brsge8 .Lld32_01d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01d_SGE_done
.Lld32_01d_SGE_true:
    cold32_emit_char 'B'
.Lld32_01d_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r6, aligned overlap, addr=0x05D4, RRSPEC32=0xCC.
    ldi16 r4, 0x05d3
    ldi8 r5, 0x09
    st8 [r4], r5
    ldi16 r4, 0x05d4
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x05d5
    ldi8 r5, 0x2d
    st8 [r4], r5
    ldi16 r4, 0x05d6
    ldi8 r5, 0xae
    st8 [r4], r5
    ldi16 r4, 0x05d7
    ldi8 r5, 0x61
    st8 [r4], r5
    ldi16 r4, 0x05d8
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1837
    push16 r4
    ldi16 r4, 0x195a
    push16 r4
    ldi16 r4, 0x1a7d
    push16 r4
    ldi16 r4, 0x1ba0
    push16 r4
    ldi16 r4, 0x1cc3
    push16 r4
    ldi16 r4, 0x1de6
    push16 r4
    ldi16 r4, 0x05d4
    push16 r4
    ldi16 r4, 0xcba5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xcc ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05d3
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05d5
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05d7
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_EQ_done
.Lld32_01e_EQ_true:
    cold32_emit_char 'B'
.Lld32_01e_EQ_done:
    brne8 .Lld32_01e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_NE_done
.Lld32_01e_NE_true:
    cold32_emit_char 'B'
.Lld32_01e_NE_done:
    brult8 .Lld32_01e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_ULT_done
.Lld32_01e_ULT_true:
    cold32_emit_char 'B'
.Lld32_01e_ULT_done:
    bruge8 .Lld32_01e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_UGE_done
.Lld32_01e_UGE_true:
    cold32_emit_char 'B'
.Lld32_01e_UGE_done:
    brslt8 .Lld32_01e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_SLT_done
.Lld32_01e_SLT_true:
    cold32_emit_char 'B'
.Lld32_01e_SLT_done:
    brsge8 .Lld32_01e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01e_SGE_done
.Lld32_01e_SGE_true:
    cold32_emit_char 'B'
.Lld32_01e_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r7, aligned overlap, addr=0x05DA, RRSPEC32=0xCE.
    ldi16 r4, 0x05d9
    ldi8 r5, 0x11
    st8 [r4], r5
    ldi16 r4, 0x05da
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x05db
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x05dc
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x05dd
    ldi8 r5, 0x62
    st8 [r4], r5
    ldi16 r4, 0x05de
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1874
    push16 r4
    ldi16 r4, 0x1997
    push16 r4
    ldi16 r4, 0x1aba
    push16 r4
    ldi16 r4, 0x1bdd
    push16 r4
    ldi16 r4, 0x1d00
    push16 r4
    ldi16 r4, 0x1e23
    push16 r4
    ldi16 r4, 0xb9f2
    push16 r4
    ldi16 r4, 0x05da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xce ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05d9
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05db
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x05dd
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_01f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_EQ_done
.Lld32_01f_EQ_true:
    cold32_emit_char 'B'
.Lld32_01f_EQ_done:
    brne8 .Lld32_01f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_NE_done
.Lld32_01f_NE_true:
    cold32_emit_char 'B'
.Lld32_01f_NE_done:
    brult8 .Lld32_01f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_ULT_done
.Lld32_01f_ULT_true:
    cold32_emit_char 'B'
.Lld32_01f_ULT_done:
    bruge8 .Lld32_01f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_UGE_done
.Lld32_01f_UGE_true:
    cold32_emit_char 'B'
.Lld32_01f_UGE_done:
    brslt8 .Lld32_01f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_SLT_done
.Lld32_01f_SLT_true:
    cold32_emit_char 'B'
.Lld32_01f_SLT_done:
    brsge8 .Lld32_01f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_01f_SGE_done
.Lld32_01f_SGE_true:
    cold32_emit_char 'B'
.Lld32_01f_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r0, unaligned overlap, addr=0x0701, RRSPEC32=0x00.
    ldi16 r4, 0x0700
    ldi8 r5, 0x11
    st8 [r4], r5
    ldi16 r4, 0x0701
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0702
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0703
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0704
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x0705
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0701
    push16 r4
    ldi16 r4, 0xc8e0
    push16 r4
    ldi16 r4, 0x1af7
    push16 r4
    ldi16 r4, 0x1c1a
    push16 r4
    ldi16 r4, 0x1d3d
    push16 r4
    ldi16 r4, 0x1e60
    push16 r4
    ldi16 r4, 0x1f83
    push16 r4
    ldi16 r4, 0x20a6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x00 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0700
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0702
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0704
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_020_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_EQ_done
.Lld32_020_EQ_true:
    cold32_emit_char 'B'
.Lld32_020_EQ_done:
    brne8 .Lld32_020_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_NE_done
.Lld32_020_NE_true:
    cold32_emit_char 'B'
.Lld32_020_NE_done:
    brult8 .Lld32_020_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_ULT_done
.Lld32_020_ULT_true:
    cold32_emit_char 'B'
.Lld32_020_ULT_done:
    bruge8 .Lld32_020_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_UGE_done
.Lld32_020_UGE_true:
    cold32_emit_char 'B'
.Lld32_020_UGE_done:
    brslt8 .Lld32_020_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_SLT_done
.Lld32_020_SLT_true:
    cold32_emit_char 'B'
.Lld32_020_SLT_done:
    brsge8 .Lld32_020_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_020_SGE_done
.Lld32_020_SGE_true:
    cold32_emit_char 'B'
.Lld32_020_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r1, unaligned overlap, addr=0x0707, RRSPEC32=0x02.
    ldi16 r4, 0x0706
    ldi8 r5, 0x19
    st8 [r4], r5
    ldi16 r4, 0x0707
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x0708
    ldi8 r5, 0xe7
    st8 [r4], r5
    ldi16 r4, 0x0709
    ldi8 r5, 0x83
    st8 [r4], r5
    ldi16 r4, 0x070a
    ldi8 r5, 0x31
    st8 [r4], r5
    ldi16 r4, 0x070b
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb751
    push16 r4
    ldi16 r4, 0x0707
    push16 r4
    ldi16 r4, 0x1b34
    push16 r4
    ldi16 r4, 0x1c57
    push16 r4
    ldi16 r4, 0x1d7a
    push16 r4
    ldi16 r4, 0x1e9d
    push16 r4
    ldi16 r4, 0x1fc0
    push16 r4
    ldi16 r4, 0x20e3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x02 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0706
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0708
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x070a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_021_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_EQ_done
.Lld32_021_EQ_true:
    cold32_emit_char 'B'
.Lld32_021_EQ_done:
    brne8 .Lld32_021_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_NE_done
.Lld32_021_NE_true:
    cold32_emit_char 'B'
.Lld32_021_NE_done:
    brult8 .Lld32_021_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_ULT_done
.Lld32_021_ULT_true:
    cold32_emit_char 'B'
.Lld32_021_ULT_done:
    bruge8 .Lld32_021_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_UGE_done
.Lld32_021_UGE_true:
    cold32_emit_char 'B'
.Lld32_021_UGE_done:
    brslt8 .Lld32_021_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_SLT_done
.Lld32_021_SLT_true:
    cold32_emit_char 'B'
.Lld32_021_SLT_done:
    brsge8 .Lld32_021_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_021_SGE_done
.Lld32_021_SGE_true:
    cold32_emit_char 'B'
.Lld32_021_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r2, unaligned, addr=0x070D, RRSPEC32=0x04.
    ldi16 r4, 0x070c
    ldi8 r5, 0x21
    st8 [r4], r5
    ldi16 r4, 0x070d
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x070e
    ldi8 r5, 0xfd
    st8 [r4], r5
    ldi16 r4, 0x070f
    ldi8 r5, 0x86
    st8 [r4], r5
    ldi16 r4, 0x0710
    ldi8 r5, 0x32
    st8 [r4], r5
    ldi16 r4, 0x0711
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb782
    push16 r4
    ldi16 r4, 0xc94e
    push16 r4
    ldi16 r4, 0x070d
    push16 r4
    ldi16 r4, 0x1c94
    push16 r4
    ldi16 r4, 0x1db7
    push16 r4
    ldi16 r4, 0x1eda
    push16 r4
    ldi16 r4, 0x1ffd
    push16 r4
    ldi16 r4, 0x2120
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x070c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x070e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0710
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_022_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_EQ_done
.Lld32_022_EQ_true:
    cold32_emit_char 'B'
.Lld32_022_EQ_done:
    brne8 .Lld32_022_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_NE_done
.Lld32_022_NE_true:
    cold32_emit_char 'B'
.Lld32_022_NE_done:
    brult8 .Lld32_022_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_ULT_done
.Lld32_022_ULT_true:
    cold32_emit_char 'B'
.Lld32_022_ULT_done:
    bruge8 .Lld32_022_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_UGE_done
.Lld32_022_UGE_true:
    cold32_emit_char 'B'
.Lld32_022_UGE_done:
    brslt8 .Lld32_022_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_SLT_done
.Lld32_022_SLT_true:
    cold32_emit_char 'B'
.Lld32_022_SLT_done:
    brsge8 .Lld32_022_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_022_SGE_done
.Lld32_022_SGE_true:
    cold32_emit_char 'B'
.Lld32_022_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r3, unaligned, addr=0x0713, RRSPEC32=0x06.
    ldi16 r4, 0x0712
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x0713
    ldi8 r5, 0x68
    st8 [r4], r5
    ldi16 r4, 0x0714
    ldi8 r5, 0x13
    st8 [r4], r5
    ldi16 r4, 0x0715
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x0716
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x0717
    ldi8 r5, 0x28
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb7b3
    push16 r4
    ldi16 r4, 0xc985
    push16 r4
    ldi16 r4, 0x1bae
    push16 r4
    ldi16 r4, 0x0713
    push16 r4
    ldi16 r4, 0x1df4
    push16 r4
    ldi16 r4, 0x1f17
    push16 r4
    ldi16 r4, 0x203a
    push16 r4
    ldi16 r4, 0x215d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0712
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0714
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0716
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_023_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_EQ_done
.Lld32_023_EQ_true:
    cold32_emit_char 'B'
.Lld32_023_EQ_done:
    brne8 .Lld32_023_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_NE_done
.Lld32_023_NE_true:
    cold32_emit_char 'B'
.Lld32_023_NE_done:
    brult8 .Lld32_023_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_ULT_done
.Lld32_023_ULT_true:
    cold32_emit_char 'B'
.Lld32_023_ULT_done:
    bruge8 .Lld32_023_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_UGE_done
.Lld32_023_UGE_true:
    cold32_emit_char 'B'
.Lld32_023_UGE_done:
    brslt8 .Lld32_023_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_SLT_done
.Lld32_023_SLT_true:
    cold32_emit_char 'B'
.Lld32_023_SLT_done:
    brsge8 .Lld32_023_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_023_SGE_done
.Lld32_023_SGE_true:
    cold32_emit_char 'B'
.Lld32_023_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r4, unaligned, addr=0x0719, RRSPEC32=0x08.
    ldi16 r4, 0x0718
    ldi8 r5, 0x31
    st8 [r4], r5
    ldi16 r4, 0x0719
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x071a
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x071b
    ldi8 r5, 0x8d
    st8 [r4], r5
    ldi16 r4, 0x071c
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x071d
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb7e4
    push16 r4
    ldi16 r4, 0xc9bc
    push16 r4
    ldi16 r4, 0x1beb
    push16 r4
    ldi16 r4, 0x1d0e
    push16 r4
    ldi16 r4, 0x0719
    push16 r4
    ldi16 r4, 0x1f54
    push16 r4
    ldi16 r4, 0x2077
    push16 r4
    ldi16 r4, 0x219a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0718
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x071a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x071c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_024_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_EQ_done
.Lld32_024_EQ_true:
    cold32_emit_char 'B'
.Lld32_024_EQ_done:
    brne8 .Lld32_024_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_NE_done
.Lld32_024_NE_true:
    cold32_emit_char 'B'
.Lld32_024_NE_done:
    brult8 .Lld32_024_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_ULT_done
.Lld32_024_ULT_true:
    cold32_emit_char 'B'
.Lld32_024_ULT_done:
    bruge8 .Lld32_024_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_UGE_done
.Lld32_024_UGE_true:
    cold32_emit_char 'B'
.Lld32_024_UGE_done:
    brslt8 .Lld32_024_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_SLT_done
.Lld32_024_SLT_true:
    cold32_emit_char 'B'
.Lld32_024_SLT_done:
    brsge8 .Lld32_024_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_024_SGE_done
.Lld32_024_SGE_true:
    cold32_emit_char 'B'
.Lld32_024_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r5, unaligned, addr=0x071F, RRSPEC32=0x0A.
    ldi16 r4, 0x071e
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x071f
    ldi8 r5, 0x98
    st8 [r4], r5
    ldi16 r4, 0x0720
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x0721
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x0722
    ldi8 r5, 0x35
    st8 [r4], r5
    ldi16 r4, 0x0723
    ldi8 r5, 0x3e
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb815
    push16 r4
    ldi16 r4, 0xc9f3
    push16 r4
    ldi16 r4, 0x1c28
    push16 r4
    ldi16 r4, 0x1d4b
    push16 r4
    ldi16 r4, 0x1e6e
    push16 r4
    ldi16 r4, 0x071f
    push16 r4
    ldi16 r4, 0x20b4
    push16 r4
    ldi16 r4, 0x21d7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x071e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0720
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0722
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_025_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_EQ_done
.Lld32_025_EQ_true:
    cold32_emit_char 'B'
.Lld32_025_EQ_done:
    brne8 .Lld32_025_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_NE_done
.Lld32_025_NE_true:
    cold32_emit_char 'B'
.Lld32_025_NE_done:
    brult8 .Lld32_025_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_ULT_done
.Lld32_025_ULT_true:
    cold32_emit_char 'B'
.Lld32_025_ULT_done:
    bruge8 .Lld32_025_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_UGE_done
.Lld32_025_UGE_true:
    cold32_emit_char 'B'
.Lld32_025_UGE_done:
    brslt8 .Lld32_025_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_SLT_done
.Lld32_025_SLT_true:
    cold32_emit_char 'B'
.Lld32_025_SLT_done:
    brsge8 .Lld32_025_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_025_SGE_done
.Lld32_025_SGE_true:
    cold32_emit_char 'B'
.Lld32_025_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r6, unaligned, addr=0x0725, RRSPEC32=0x0C.
    ldi16 r4, 0x0724
    ldi8 r5, 0x41
    st8 [r4], r5
    ldi16 r4, 0x0725
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x0726
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x0727
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x0728
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x0729
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb846
    push16 r4
    ldi16 r4, 0xca2a
    push16 r4
    ldi16 r4, 0x1c65
    push16 r4
    ldi16 r4, 0x1d88
    push16 r4
    ldi16 r4, 0x1eab
    push16 r4
    ldi16 r4, 0x1fce
    push16 r4
    ldi16 r4, 0x0725
    push16 r4
    ldi16 r4, 0x2214
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0724
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0726
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0728
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_026_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_EQ_done
.Lld32_026_EQ_true:
    cold32_emit_char 'B'
.Lld32_026_EQ_done:
    brne8 .Lld32_026_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_NE_done
.Lld32_026_NE_true:
    cold32_emit_char 'B'
.Lld32_026_NE_done:
    brult8 .Lld32_026_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_ULT_done
.Lld32_026_ULT_true:
    cold32_emit_char 'B'
.Lld32_026_ULT_done:
    bruge8 .Lld32_026_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_UGE_done
.Lld32_026_UGE_true:
    cold32_emit_char 'B'
.Lld32_026_UGE_done:
    brslt8 .Lld32_026_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_SLT_done
.Lld32_026_SLT_true:
    cold32_emit_char 'B'
.Lld32_026_SLT_done:
    brsge8 .Lld32_026_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_026_SGE_done
.Lld32_026_SGE_true:
    cold32_emit_char 'B'
.Lld32_026_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q0,r7, unaligned, addr=0x072B, RRSPEC32=0x0E.
    ldi16 r4, 0x072a
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x072b
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x072c
    ldi8 r5, 0x6b
    st8 [r4], r5
    ldi16 r4, 0x072d
    ldi8 r5, 0x96
    st8 [r4], r5
    ldi16 r4, 0x072e
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x072f
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb877
    push16 r4
    ldi16 r4, 0xca61
    push16 r4
    ldi16 r4, 0x1ca2
    push16 r4
    ldi16 r4, 0x1dc5
    push16 r4
    ldi16 r4, 0x1ee8
    push16 r4
    ldi16 r4, 0x200b
    push16 r4
    ldi16 r4, 0x212e
    push16 r4
    ldi16 r4, 0x072b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x0e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x072a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x072c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x072e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_027_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_EQ_done
.Lld32_027_EQ_true:
    cold32_emit_char 'B'
.Lld32_027_EQ_done:
    brne8 .Lld32_027_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_NE_done
.Lld32_027_NE_true:
    cold32_emit_char 'B'
.Lld32_027_NE_done:
    brult8 .Lld32_027_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_ULT_done
.Lld32_027_ULT_true:
    cold32_emit_char 'B'
.Lld32_027_ULT_done:
    bruge8 .Lld32_027_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_UGE_done
.Lld32_027_UGE_true:
    cold32_emit_char 'B'
.Lld32_027_UGE_done:
    brslt8 .Lld32_027_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_SLT_done
.Lld32_027_SLT_true:
    cold32_emit_char 'B'
.Lld32_027_SLT_done:
    brsge8 .Lld32_027_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_027_SGE_done
.Lld32_027_SGE_true:
    cold32_emit_char 'B'
.Lld32_027_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r0, unaligned, addr=0x0731, RRSPEC32=0x40.
    ldi16 r4, 0x0730
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0731
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0732
    ldi8 r5, 0xf9
    st8 [r4], r5
    ldi16 r4, 0x0733
    ldi8 r5, 0xa9
    st8 [r4], r5
    ldi16 r4, 0x0734
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0735
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0731
    push16 r4
    ldi16 r4, 0x1bbc
    push16 r4
    ldi16 r4, 0xb9a9
    push16 r4
    ldi16 r4, 0xcba9
    push16 r4
    ldi16 r4, 0x1f25
    push16 r4
    ldi16 r4, 0x2048
    push16 r4
    ldi16 r4, 0x216b
    push16 r4
    ldi16 r4, 0x228e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0730
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0732
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0734
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_028_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_EQ_done
.Lld32_028_EQ_true:
    cold32_emit_char 'B'
.Lld32_028_EQ_done:
    brne8 .Lld32_028_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_NE_done
.Lld32_028_NE_true:
    cold32_emit_char 'B'
.Lld32_028_NE_done:
    brult8 .Lld32_028_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_ULT_done
.Lld32_028_ULT_true:
    cold32_emit_char 'B'
.Lld32_028_ULT_done:
    bruge8 .Lld32_028_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_UGE_done
.Lld32_028_UGE_true:
    cold32_emit_char 'B'
.Lld32_028_UGE_done:
    brslt8 .Lld32_028_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_SLT_done
.Lld32_028_SLT_true:
    cold32_emit_char 'B'
.Lld32_028_SLT_done:
    brsge8 .Lld32_028_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_028_SGE_done
.Lld32_028_SGE_true:
    cold32_emit_char 'B'
.Lld32_028_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r1, unaligned, addr=0x0737, RRSPEC32=0x42.
    ldi16 r4, 0x0736
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x0737
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x0738
    ldi8 r5, 0x0f
    st8 [r4], r5
    ldi16 r4, 0x0739
    ldi8 r5, 0xad
    st8 [r4], r5
    ldi16 r4, 0x073a
    ldi8 r5, 0x4a
    st8 [r4], r5
    ldi16 r4, 0x073b
    ldi8 r5, 0x6b
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1ad6
    push16 r4
    ldi16 r4, 0x0737
    push16 r4
    ldi16 r4, 0xb9da
    push16 r4
    ldi16 r4, 0xcbe0
    push16 r4
    ldi16 r4, 0x1f62
    push16 r4
    ldi16 r4, 0x2085
    push16 r4
    ldi16 r4, 0x21a8
    push16 r4
    ldi16 r4, 0x22cb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x42 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0736
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0738
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x073a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_029_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_EQ_done
.Lld32_029_EQ_true:
    cold32_emit_char 'B'
.Lld32_029_EQ_done:
    brne8 .Lld32_029_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_NE_done
.Lld32_029_NE_true:
    cold32_emit_char 'B'
.Lld32_029_NE_done:
    brult8 .Lld32_029_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_ULT_done
.Lld32_029_ULT_true:
    cold32_emit_char 'B'
.Lld32_029_ULT_done:
    bruge8 .Lld32_029_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_UGE_done
.Lld32_029_UGE_true:
    cold32_emit_char 'B'
.Lld32_029_UGE_done:
    brslt8 .Lld32_029_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_SLT_done
.Lld32_029_SLT_true:
    cold32_emit_char 'B'
.Lld32_029_SLT_done:
    brsge8 .Lld32_029_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_029_SGE_done
.Lld32_029_SGE_true:
    cold32_emit_char 'B'
.Lld32_029_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r2, unaligned overlap, addr=0x073D, RRSPEC32=0x44.
    ldi16 r4, 0x073c
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x073d
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x073e
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x073f
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x0740
    ldi8 r5, 0x4b
    st8 [r4], r5
    ldi16 r4, 0x0741
    ldi8 r5, 0x76
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1b13
    push16 r4
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0x073d
    push16 r4
    ldi16 r4, 0xcc17
    push16 r4
    ldi16 r4, 0x1f9f
    push16 r4
    ldi16 r4, 0x20c2
    push16 r4
    ldi16 r4, 0x21e5
    push16 r4
    ldi16 r4, 0x2308
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x44 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x073c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x073e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0740
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_EQ_done
.Lld32_02a_EQ_true:
    cold32_emit_char 'B'
.Lld32_02a_EQ_done:
    brne8 .Lld32_02a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_NE_done
.Lld32_02a_NE_true:
    cold32_emit_char 'B'
.Lld32_02a_NE_done:
    brult8 .Lld32_02a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_ULT_done
.Lld32_02a_ULT_true:
    cold32_emit_char 'B'
.Lld32_02a_ULT_done:
    bruge8 .Lld32_02a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_UGE_done
.Lld32_02a_UGE_true:
    cold32_emit_char 'B'
.Lld32_02a_UGE_done:
    brslt8 .Lld32_02a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_SLT_done
.Lld32_02a_SLT_true:
    cold32_emit_char 'B'
.Lld32_02a_SLT_done:
    brsge8 .Lld32_02a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02a_SGE_done
.Lld32_02a_SGE_true:
    cold32_emit_char 'B'
.Lld32_02a_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r3, unaligned overlap, addr=0x0743, RRSPEC32=0x46.
    ldi16 r4, 0x0742
    ldi8 r5, 0x61
    st8 [r4], r5
    ldi16 r4, 0x0743
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0744
    ldi8 r5, 0x3b
    st8 [r4], r5
    ldi16 r4, 0x0745
    ldi8 r5, 0xb3
    st8 [r4], r5
    ldi16 r4, 0x0746
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0747
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1b50
    push16 r4
    ldi16 r4, 0x1c73
    push16 r4
    ldi16 r4, 0xba3c
    push16 r4
    ldi16 r4, 0x0743
    push16 r4
    ldi16 r4, 0x1fdc
    push16 r4
    ldi16 r4, 0x20ff
    push16 r4
    ldi16 r4, 0x2222
    push16 r4
    ldi16 r4, 0x2345
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x46 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0742
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0744
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0746
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_EQ_done
.Lld32_02b_EQ_true:
    cold32_emit_char 'B'
.Lld32_02b_EQ_done:
    brne8 .Lld32_02b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_NE_done
.Lld32_02b_NE_true:
    cold32_emit_char 'B'
.Lld32_02b_NE_done:
    brult8 .Lld32_02b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_ULT_done
.Lld32_02b_ULT_true:
    cold32_emit_char 'B'
.Lld32_02b_ULT_done:
    bruge8 .Lld32_02b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_UGE_done
.Lld32_02b_UGE_true:
    cold32_emit_char 'B'
.Lld32_02b_UGE_done:
    brslt8 .Lld32_02b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_SLT_done
.Lld32_02b_SLT_true:
    cold32_emit_char 'B'
.Lld32_02b_SLT_done:
    brsge8 .Lld32_02b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02b_SGE_done
.Lld32_02b_SGE_true:
    cold32_emit_char 'B'
.Lld32_02b_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r4, unaligned, addr=0x0749, RRSPEC32=0x48.
    ldi16 r4, 0x0748
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x0749
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x074a
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x074b
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x074c
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x074d
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1b8d
    push16 r4
    ldi16 r4, 0x1cb0
    push16 r4
    ldi16 r4, 0xba6d
    push16 r4
    ldi16 r4, 0xcc85
    push16 r4
    ldi16 r4, 0x0749
    push16 r4
    ldi16 r4, 0x213c
    push16 r4
    ldi16 r4, 0x225f
    push16 r4
    ldi16 r4, 0x2382
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0748
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x074a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x074c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_EQ_done
.Lld32_02c_EQ_true:
    cold32_emit_char 'B'
.Lld32_02c_EQ_done:
    brne8 .Lld32_02c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_NE_done
.Lld32_02c_NE_true:
    cold32_emit_char 'B'
.Lld32_02c_NE_done:
    brult8 .Lld32_02c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_ULT_done
.Lld32_02c_ULT_true:
    cold32_emit_char 'B'
.Lld32_02c_ULT_done:
    bruge8 .Lld32_02c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_UGE_done
.Lld32_02c_UGE_true:
    cold32_emit_char 'B'
.Lld32_02c_UGE_done:
    brslt8 .Lld32_02c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_SLT_done
.Lld32_02c_SLT_true:
    cold32_emit_char 'B'
.Lld32_02c_SLT_done:
    brsge8 .Lld32_02c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02c_SGE_done
.Lld32_02c_SGE_true:
    cold32_emit_char 'B'
.Lld32_02c_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r5, unaligned, addr=0x074F, RRSPEC32=0x4A.
    ldi16 r4, 0x074e
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x074f
    ldi8 r5, 0xd0
    st8 [r4], r5
    ldi16 r4, 0x0750
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x0751
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0752
    ldi8 r5, 0x4e
    st8 [r4], r5
    ldi16 r4, 0x0753
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1bca
    push16 r4
    ldi16 r4, 0x1ced
    push16 r4
    ldi16 r4, 0xba9e
    push16 r4
    ldi16 r4, 0xccbc
    push16 r4
    ldi16 r4, 0x2056
    push16 r4
    ldi16 r4, 0x074f
    push16 r4
    ldi16 r4, 0x229c
    push16 r4
    ldi16 r4, 0x23bf
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x074e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0750
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0752
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_EQ_done
.Lld32_02d_EQ_true:
    cold32_emit_char 'B'
.Lld32_02d_EQ_done:
    brne8 .Lld32_02d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_NE_done
.Lld32_02d_NE_true:
    cold32_emit_char 'B'
.Lld32_02d_NE_done:
    brult8 .Lld32_02d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_ULT_done
.Lld32_02d_ULT_true:
    cold32_emit_char 'B'
.Lld32_02d_ULT_done:
    bruge8 .Lld32_02d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_UGE_done
.Lld32_02d_UGE_true:
    cold32_emit_char 'B'
.Lld32_02d_UGE_done:
    brslt8 .Lld32_02d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_SLT_done
.Lld32_02d_SLT_true:
    cold32_emit_char 'B'
.Lld32_02d_SLT_done:
    brsge8 .Lld32_02d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02d_SGE_done
.Lld32_02d_SGE_true:
    cold32_emit_char 'B'
.Lld32_02d_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r6, unaligned, addr=0x0755, RRSPEC32=0x4C.
    ldi16 r4, 0x0754
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x0755
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x0756
    ldi8 r5, 0x7d
    st8 [r4], r5
    ldi16 r4, 0x0757
    ldi8 r5, 0xbc
    st8 [r4], r5
    ldi16 r4, 0x0758
    ldi8 r5, 0x4f
    st8 [r4], r5
    ldi16 r4, 0x0759
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1c07
    push16 r4
    ldi16 r4, 0x1d2a
    push16 r4
    ldi16 r4, 0xbacf
    push16 r4
    ldi16 r4, 0xccf3
    push16 r4
    ldi16 r4, 0x2093
    push16 r4
    ldi16 r4, 0x21b6
    push16 r4
    ldi16 r4, 0x0755
    push16 r4
    ldi16 r4, 0x23fc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0754
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0756
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0758
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_EQ_done
.Lld32_02e_EQ_true:
    cold32_emit_char 'B'
.Lld32_02e_EQ_done:
    brne8 .Lld32_02e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_NE_done
.Lld32_02e_NE_true:
    cold32_emit_char 'B'
.Lld32_02e_NE_done:
    brult8 .Lld32_02e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_ULT_done
.Lld32_02e_ULT_true:
    cold32_emit_char 'B'
.Lld32_02e_ULT_done:
    bruge8 .Lld32_02e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_UGE_done
.Lld32_02e_UGE_true:
    cold32_emit_char 'B'
.Lld32_02e_UGE_done:
    brslt8 .Lld32_02e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_SLT_done
.Lld32_02e_SLT_true:
    cold32_emit_char 'B'
.Lld32_02e_SLT_done:
    brsge8 .Lld32_02e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02e_SGE_done
.Lld32_02e_SGE_true:
    cold32_emit_char 'B'
.Lld32_02e_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q1,r7, unaligned, addr=0x075B, RRSPEC32=0x4E.
    ldi16 r4, 0x075a
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x075b
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x075c
    ldi8 r5, 0x94
    st8 [r4], r5
    ldi16 r4, 0x075d
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x075e
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x075f
    ldi8 r5, 0xad
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1c44
    push16 r4
    ldi16 r4, 0x1d67
    push16 r4
    ldi16 r4, 0xbb00
    push16 r4
    ldi16 r4, 0xcd2a
    push16 r4
    ldi16 r4, 0x20d0
    push16 r4
    ldi16 r4, 0x21f3
    push16 r4
    ldi16 r4, 0x2316
    push16 r4
    ldi16 r4, 0x075b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x4e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x075a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x075c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x075e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_02f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_EQ_done
.Lld32_02f_EQ_true:
    cold32_emit_char 'B'
.Lld32_02f_EQ_done:
    brne8 .Lld32_02f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_NE_done
.Lld32_02f_NE_true:
    cold32_emit_char 'B'
.Lld32_02f_NE_done:
    brult8 .Lld32_02f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_ULT_done
.Lld32_02f_ULT_true:
    cold32_emit_char 'B'
.Lld32_02f_ULT_done:
    bruge8 .Lld32_02f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_UGE_done
.Lld32_02f_UGE_true:
    cold32_emit_char 'B'
.Lld32_02f_UGE_done:
    brslt8 .Lld32_02f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_SLT_done
.Lld32_02f_SLT_true:
    cold32_emit_char 'B'
.Lld32_02f_SLT_done:
    brsge8 .Lld32_02f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_02f_SGE_done
.Lld32_02f_SGE_true:
    cold32_emit_char 'B'
.Lld32_02f_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r0, unaligned, addr=0x0761, RRSPEC32=0x80.
    ldi16 r4, 0x0760
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x0761
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x0762
    ldi8 r5, 0x21
    st8 [r4], r5
    ldi16 r4, 0x0763
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x0764
    ldi8 r5, 0x62
    st8 [r4], r5
    ldi16 r4, 0x0765
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0761
    push16 r4
    ldi16 r4, 0x1da4
    push16 r4
    ldi16 r4, 0x1ec7
    push16 r4
    ldi16 r4, 0x1fea
    push16 r4
    ldi16 r4, 0xbc32
    push16 r4
    ldi16 r4, 0xce72
    push16 r4
    ldi16 r4, 0x2353
    push16 r4
    ldi16 r4, 0x2476
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0760
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0762
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0764
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_030_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_EQ_done
.Lld32_030_EQ_true:
    cold32_emit_char 'B'
.Lld32_030_EQ_done:
    brne8 .Lld32_030_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_NE_done
.Lld32_030_NE_true:
    cold32_emit_char 'B'
.Lld32_030_NE_done:
    brult8 .Lld32_030_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_ULT_done
.Lld32_030_ULT_true:
    cold32_emit_char 'B'
.Lld32_030_ULT_done:
    bruge8 .Lld32_030_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_UGE_done
.Lld32_030_UGE_true:
    cold32_emit_char 'B'
.Lld32_030_UGE_done:
    brslt8 .Lld32_030_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_SLT_done
.Lld32_030_SLT_true:
    cold32_emit_char 'B'
.Lld32_030_SLT_done:
    brsge8 .Lld32_030_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_030_SGE_done
.Lld32_030_SGE_true:
    cold32_emit_char 'B'
.Lld32_030_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r1, unaligned, addr=0x0767, RRSPEC32=0x82.
    ldi16 r4, 0x0766
    ldi8 r5, 0x89
    st8 [r4], r5
    ldi16 r4, 0x0767
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x0768
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x0769
    ldi8 r5, 0xd6
    st8 [r4], r5
    ldi16 r4, 0x076a
    ldi8 r5, 0x63
    st8 [r4], r5
    ldi16 r4, 0x076b
    ldi8 r5, 0xc4
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1cbe
    push16 r4
    ldi16 r4, 0x0767
    push16 r4
    ldi16 r4, 0x1f04
    push16 r4
    ldi16 r4, 0x2027
    push16 r4
    ldi16 r4, 0xbc63
    push16 r4
    ldi16 r4, 0xcea9
    push16 r4
    ldi16 r4, 0x2390
    push16 r4
    ldi16 r4, 0x24b3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x82 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0766
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0768
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x076a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_031_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_EQ_done
.Lld32_031_EQ_true:
    cold32_emit_char 'B'
.Lld32_031_EQ_done:
    brne8 .Lld32_031_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_NE_done
.Lld32_031_NE_true:
    cold32_emit_char 'B'
.Lld32_031_NE_done:
    brult8 .Lld32_031_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_ULT_done
.Lld32_031_ULT_true:
    cold32_emit_char 'B'
.Lld32_031_ULT_done:
    bruge8 .Lld32_031_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_UGE_done
.Lld32_031_UGE_true:
    cold32_emit_char 'B'
.Lld32_031_UGE_done:
    brslt8 .Lld32_031_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_SLT_done
.Lld32_031_SLT_true:
    cold32_emit_char 'B'
.Lld32_031_SLT_done:
    brsge8 .Lld32_031_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_031_SGE_done
.Lld32_031_SGE_true:
    cold32_emit_char 'B'
.Lld32_031_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r2, unaligned, addr=0x076D, RRSPEC32=0x84.
    ldi16 r4, 0x076c
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x076d
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x076e
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x076f
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x0770
    ldi8 r5, 0x64
    st8 [r4], r5
    ldi16 r4, 0x0771
    ldi8 r5, 0xcf
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1cfb
    push16 r4
    ldi16 r4, 0x1e1e
    push16 r4
    ldi16 r4, 0x076d
    push16 r4
    ldi16 r4, 0x2064
    push16 r4
    ldi16 r4, 0xbc94
    push16 r4
    ldi16 r4, 0xcee0
    push16 r4
    ldi16 r4, 0x23cd
    push16 r4
    ldi16 r4, 0x24f0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x076c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x076e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0770
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_032_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_EQ_done
.Lld32_032_EQ_true:
    cold32_emit_char 'B'
.Lld32_032_EQ_done:
    brne8 .Lld32_032_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_NE_done
.Lld32_032_NE_true:
    cold32_emit_char 'B'
.Lld32_032_NE_done:
    brult8 .Lld32_032_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_ULT_done
.Lld32_032_ULT_true:
    cold32_emit_char 'B'
.Lld32_032_ULT_done:
    bruge8 .Lld32_032_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_UGE_done
.Lld32_032_UGE_true:
    cold32_emit_char 'B'
.Lld32_032_UGE_done:
    brslt8 .Lld32_032_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_SLT_done
.Lld32_032_SLT_true:
    cold32_emit_char 'B'
.Lld32_032_SLT_done:
    brsge8 .Lld32_032_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_032_SGE_done
.Lld32_032_SGE_true:
    cold32_emit_char 'B'
.Lld32_032_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r3, unaligned, addr=0x0773, RRSPEC32=0x86.
    ldi16 r4, 0x0772
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0773
    ldi8 r5, 0xd8
    st8 [r4], r5
    ldi16 r4, 0x0774
    ldi8 r5, 0x63
    st8 [r4], r5
    ldi16 r4, 0x0775
    ldi8 r5, 0xdc
    st8 [r4], r5
    ldi16 r4, 0x0776
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0777
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1d38
    push16 r4
    ldi16 r4, 0x1e5b
    push16 r4
    ldi16 r4, 0x1f7e
    push16 r4
    ldi16 r4, 0x0773
    push16 r4
    ldi16 r4, 0xbcc5
    push16 r4
    ldi16 r4, 0xcf17
    push16 r4
    ldi16 r4, 0x240a
    push16 r4
    ldi16 r4, 0x252d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x86 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0772
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0774
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0776
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_033_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_EQ_done
.Lld32_033_EQ_true:
    cold32_emit_char 'B'
.Lld32_033_EQ_done:
    brne8 .Lld32_033_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_NE_done
.Lld32_033_NE_true:
    cold32_emit_char 'B'
.Lld32_033_NE_done:
    brult8 .Lld32_033_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_ULT_done
.Lld32_033_ULT_true:
    cold32_emit_char 'B'
.Lld32_033_ULT_done:
    bruge8 .Lld32_033_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_UGE_done
.Lld32_033_UGE_true:
    cold32_emit_char 'B'
.Lld32_033_UGE_done:
    brslt8 .Lld32_033_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_SLT_done
.Lld32_033_SLT_true:
    cold32_emit_char 'B'
.Lld32_033_SLT_done:
    brsge8 .Lld32_033_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_033_SGE_done
.Lld32_033_SGE_true:
    cold32_emit_char 'B'
.Lld32_033_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r4, unaligned overlap, addr=0x07FF, RRSPEC32=0x88.
    ldi16 r4, 0x07fe
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x07ff
    ldi8 r5, 0xf0
    st8 [r4], r5
    ldi16 r4, 0x0800
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x0801
    ldi8 r5, 0xdf
    st8 [r4], r5
    ldi16 r4, 0x0802
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0803
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1d75
    push16 r4
    ldi16 r4, 0x1e98
    push16 r4
    ldi16 r4, 0x1fbb
    push16 r4
    ldi16 r4, 0x20de
    push16 r4
    ldi16 r4, 0x07ff
    push16 r4
    ldi16 r4, 0xcf4e
    push16 r4
    ldi16 r4, 0x2447
    push16 r4
    ldi16 r4, 0x256a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x88 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07fe
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0800
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0802
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_034_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_EQ_done
.Lld32_034_EQ_true:
    cold32_emit_char 'B'
.Lld32_034_EQ_done:
    brne8 .Lld32_034_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_NE_done
.Lld32_034_NE_true:
    cold32_emit_char 'B'
.Lld32_034_NE_done:
    brult8 .Lld32_034_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_ULT_done
.Lld32_034_ULT_true:
    cold32_emit_char 'B'
.Lld32_034_ULT_done:
    bruge8 .Lld32_034_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_UGE_done
.Lld32_034_UGE_true:
    cold32_emit_char 'B'
.Lld32_034_UGE_done:
    brslt8 .Lld32_034_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_SLT_done
.Lld32_034_SLT_true:
    cold32_emit_char 'B'
.Lld32_034_SLT_done:
    brsge8 .Lld32_034_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_034_SGE_done
.Lld32_034_SGE_true:
    cold32_emit_char 'B'
.Lld32_034_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r5, unaligned overlap, addr=0x077F, RRSPEC32=0x8A.
    ldi16 r4, 0x077e
    ldi8 r5, 0xa9
    st8 [r4], r5
    ldi16 r4, 0x077f
    ldi8 r5, 0x08
    st8 [r4], r5
    ldi16 r4, 0x0780
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x0781
    ldi8 r5, 0xe2
    st8 [r4], r5
    ldi16 r4, 0x0782
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x0783
    ldi8 r5, 0xf0
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1db2
    push16 r4
    ldi16 r4, 0x1ed5
    push16 r4
    ldi16 r4, 0x1ff8
    push16 r4
    ldi16 r4, 0x211b
    push16 r4
    ldi16 r4, 0xbd27
    push16 r4
    ldi16 r4, 0x077f
    push16 r4
    ldi16 r4, 0x2484
    push16 r4
    ldi16 r4, 0x25a7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8a ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x077e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0780
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0782
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_035_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_EQ_done
.Lld32_035_EQ_true:
    cold32_emit_char 'B'
.Lld32_035_EQ_done:
    brne8 .Lld32_035_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_NE_done
.Lld32_035_NE_true:
    cold32_emit_char 'B'
.Lld32_035_NE_done:
    brult8 .Lld32_035_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_ULT_done
.Lld32_035_ULT_true:
    cold32_emit_char 'B'
.Lld32_035_ULT_done:
    bruge8 .Lld32_035_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_UGE_done
.Lld32_035_UGE_true:
    cold32_emit_char 'B'
.Lld32_035_UGE_done:
    brslt8 .Lld32_035_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_SLT_done
.Lld32_035_SLT_true:
    cold32_emit_char 'B'
.Lld32_035_SLT_done:
    brsge8 .Lld32_035_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_035_SGE_done
.Lld32_035_SGE_true:
    cold32_emit_char 'B'
.Lld32_035_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r6, unaligned, addr=0x0785, RRSPEC32=0x8C.
    ldi16 r4, 0x0784
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x0785
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0786
    ldi8 r5, 0xa6
    st8 [r4], r5
    ldi16 r4, 0x0787
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x0788
    ldi8 r5, 0x68
    st8 [r4], r5
    ldi16 r4, 0x0789
    ldi8 r5, 0xfb
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1def
    push16 r4
    ldi16 r4, 0x1f12
    push16 r4
    ldi16 r4, 0x2035
    push16 r4
    ldi16 r4, 0x2158
    push16 r4
    ldi16 r4, 0xbd58
    push16 r4
    ldi16 r4, 0xcfbc
    push16 r4
    ldi16 r4, 0x0785
    push16 r4
    ldi16 r4, 0x25e4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0784
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0786
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0788
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_036_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_EQ_done
.Lld32_036_EQ_true:
    cold32_emit_char 'B'
.Lld32_036_EQ_done:
    brne8 .Lld32_036_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_NE_done
.Lld32_036_NE_true:
    cold32_emit_char 'B'
.Lld32_036_NE_done:
    brult8 .Lld32_036_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_ULT_done
.Lld32_036_ULT_true:
    cold32_emit_char 'B'
.Lld32_036_ULT_done:
    bruge8 .Lld32_036_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_UGE_done
.Lld32_036_UGE_true:
    cold32_emit_char 'B'
.Lld32_036_UGE_done:
    brslt8 .Lld32_036_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_SLT_done
.Lld32_036_SLT_true:
    cold32_emit_char 'B'
.Lld32_036_SLT_done:
    brsge8 .Lld32_036_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_036_SGE_done
.Lld32_036_SGE_true:
    cold32_emit_char 'B'
.Lld32_036_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q2,r7, unaligned, addr=0x078B, RRSPEC32=0x8E.
    ldi16 r4, 0x078a
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x078b
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x078c
    ldi8 r5, 0xbc
    st8 [r4], r5
    ldi16 r4, 0x078d
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x078e
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x078f
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1e2c
    push16 r4
    ldi16 r4, 0x1f4f
    push16 r4
    ldi16 r4, 0x2072
    push16 r4
    ldi16 r4, 0x2195
    push16 r4
    ldi16 r4, 0xbd89
    push16 r4
    ldi16 r4, 0xcff3
    push16 r4
    ldi16 r4, 0x24fe
    push16 r4
    ldi16 r4, 0x078b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0x8e ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x078a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x078c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x078e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_037_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_EQ_done
.Lld32_037_EQ_true:
    cold32_emit_char 'B'
.Lld32_037_EQ_done:
    brne8 .Lld32_037_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_NE_done
.Lld32_037_NE_true:
    cold32_emit_char 'B'
.Lld32_037_NE_done:
    brult8 .Lld32_037_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_ULT_done
.Lld32_037_ULT_true:
    cold32_emit_char 'B'
.Lld32_037_ULT_done:
    bruge8 .Lld32_037_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_UGE_done
.Lld32_037_UGE_true:
    cold32_emit_char 'B'
.Lld32_037_UGE_done:
    brslt8 .Lld32_037_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_SLT_done
.Lld32_037_SLT_true:
    cold32_emit_char 'B'
.Lld32_037_SLT_done:
    brsge8 .Lld32_037_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_037_SGE_done
.Lld32_037_SGE_true:
    cold32_emit_char 'B'
.Lld32_037_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r0, unaligned, addr=0x0791, RRSPEC32=0xC0.
    ldi16 r4, 0x0790
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0791
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x0792
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0793
    ldi8 r5, 0xfc
    st8 [r4], r5
    ldi16 r4, 0x0794
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x0795
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0791
    push16 r4
    ldi16 r4, 0x1f8c
    push16 r4
    ldi16 r4, 0x20af
    push16 r4
    ldi16 r4, 0x21d2
    push16 r4
    ldi16 r4, 0x22f5
    push16 r4
    ldi16 r4, 0x2418
    push16 r4
    ldi16 r4, 0xbebb
    push16 r4
    ldi16 r4, 0xd13b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0790
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0792
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0794
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_038_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_EQ_done
.Lld32_038_EQ_true:
    cold32_emit_char 'B'
.Lld32_038_EQ_done:
    brne8 .Lld32_038_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_NE_done
.Lld32_038_NE_true:
    cold32_emit_char 'B'
.Lld32_038_NE_done:
    brult8 .Lld32_038_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_ULT_done
.Lld32_038_ULT_true:
    cold32_emit_char 'B'
.Lld32_038_ULT_done:
    bruge8 .Lld32_038_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_UGE_done
.Lld32_038_UGE_true:
    cold32_emit_char 'B'
.Lld32_038_UGE_done:
    brslt8 .Lld32_038_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_SLT_done
.Lld32_038_SLT_true:
    cold32_emit_char 'B'
.Lld32_038_SLT_done:
    brsge8 .Lld32_038_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_038_SGE_done
.Lld32_038_SGE_true:
    cold32_emit_char 'B'
.Lld32_038_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r1, unaligned, addr=0x0797, RRSPEC32=0xC2.
    ldi16 r4, 0x0796
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x0797
    ldi8 r5, 0xe0
    st8 [r4], r5
    ldi16 r4, 0x0798
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x0799
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x079a
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x079b
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1ea6
    push16 r4
    ldi16 r4, 0x0797
    push16 r4
    ldi16 r4, 0x20ec
    push16 r4
    ldi16 r4, 0x220f
    push16 r4
    ldi16 r4, 0x2332
    push16 r4
    ldi16 r4, 0x2455
    push16 r4
    ldi16 r4, 0xbeec
    push16 r4
    ldi16 r4, 0xd172
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0796
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x0798
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x079a
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_039_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_EQ_done
.Lld32_039_EQ_true:
    cold32_emit_char 'B'
.Lld32_039_EQ_done:
    brne8 .Lld32_039_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_NE_done
.Lld32_039_NE_true:
    cold32_emit_char 'B'
.Lld32_039_NE_done:
    brult8 .Lld32_039_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_ULT_done
.Lld32_039_ULT_true:
    cold32_emit_char 'B'
.Lld32_039_ULT_done:
    bruge8 .Lld32_039_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_UGE_done
.Lld32_039_UGE_true:
    cold32_emit_char 'B'
.Lld32_039_UGE_done:
    brslt8 .Lld32_039_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_SLT_done
.Lld32_039_SLT_true:
    cold32_emit_char 'B'
.Lld32_039_SLT_done:
    brsge8 .Lld32_039_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_039_SGE_done
.Lld32_039_SGE_true:
    cold32_emit_char 'B'
.Lld32_039_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r2, unaligned, addr=0x079D, RRSPEC32=0xC4.
    ldi16 r4, 0x079c
    ldi8 r5, 0xc9
    st8 [r4], r5
    ldi16 r4, 0x079d
    ldi8 r5, 0xf8
    st8 [r4], r5
    ldi16 r4, 0x079e
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x079f
    ldi8 r5, 0x02
    st8 [r4], r5
    ldi16 r4, 0x07a0
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x07a1
    ldi8 r5, 0x28
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1ee3
    push16 r4
    ldi16 r4, 0x2006
    push16 r4
    ldi16 r4, 0x079d
    push16 r4
    ldi16 r4, 0x224c
    push16 r4
    ldi16 r4, 0x236f
    push16 r4
    ldi16 r4, 0x2492
    push16 r4
    ldi16 r4, 0xbf1d
    push16 r4
    ldi16 r4, 0xd1a9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x079c
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x079e
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07a0
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_EQ_done
.Lld32_03a_EQ_true:
    cold32_emit_char 'B'
.Lld32_03a_EQ_done:
    brne8 .Lld32_03a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_NE_done
.Lld32_03a_NE_true:
    cold32_emit_char 'B'
.Lld32_03a_NE_done:
    brult8 .Lld32_03a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_ULT_done
.Lld32_03a_ULT_true:
    cold32_emit_char 'B'
.Lld32_03a_ULT_done:
    bruge8 .Lld32_03a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_UGE_done
.Lld32_03a_UGE_true:
    cold32_emit_char 'B'
.Lld32_03a_UGE_done:
    brslt8 .Lld32_03a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_SLT_done
.Lld32_03a_SLT_true:
    cold32_emit_char 'B'
.Lld32_03a_SLT_done:
    brsge8 .Lld32_03a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03a_SGE_done
.Lld32_03a_SGE_true:
    cold32_emit_char 'B'
.Lld32_03a_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r3, unaligned, addr=0x07A3, RRSPEC32=0xC6.
    ldi16 r4, 0x07a2
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x07a3
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x07a4
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x07a5
    ldi8 r5, 0x05
    st8 [r4], r5
    ldi16 r4, 0x07a6
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x07a7
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1f20
    push16 r4
    ldi16 r4, 0x2043
    push16 r4
    ldi16 r4, 0x2166
    push16 r4
    ldi16 r4, 0x07a3
    push16 r4
    ldi16 r4, 0x23ac
    push16 r4
    ldi16 r4, 0x24cf
    push16 r4
    ldi16 r4, 0xbf4e
    push16 r4
    ldi16 r4, 0xd1e0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07a2
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07a4
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07a6
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_EQ_done
.Lld32_03b_EQ_true:
    cold32_emit_char 'B'
.Lld32_03b_EQ_done:
    brne8 .Lld32_03b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_NE_done
.Lld32_03b_NE_true:
    cold32_emit_char 'B'
.Lld32_03b_NE_done:
    brult8 .Lld32_03b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_ULT_done
.Lld32_03b_ULT_true:
    cold32_emit_char 'B'
.Lld32_03b_ULT_done:
    bruge8 .Lld32_03b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_UGE_done
.Lld32_03b_UGE_true:
    cold32_emit_char 'B'
.Lld32_03b_UGE_done:
    brslt8 .Lld32_03b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_SLT_done
.Lld32_03b_SLT_true:
    cold32_emit_char 'B'
.Lld32_03b_SLT_done:
    brsge8 .Lld32_03b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03b_SGE_done
.Lld32_03b_SGE_true:
    cold32_emit_char 'B'
.Lld32_03b_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r4, unaligned, addr=0x07A9, RRSPEC32=0xC8.
    ldi16 r4, 0x07a8
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x07a9
    ldi8 r5, 0x28
    st8 [r4], r5
    ldi16 r4, 0x07aa
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x07ab
    ldi8 r5, 0x08
    st8 [r4], r5
    ldi16 r4, 0x07ac
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x07ad
    ldi8 r5, 0x3e
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1f5d
    push16 r4
    ldi16 r4, 0x2080
    push16 r4
    ldi16 r4, 0x21a3
    push16 r4
    ldi16 r4, 0x22c6
    push16 r4
    ldi16 r4, 0x07a9
    push16 r4
    ldi16 r4, 0x250c
    push16 r4
    ldi16 r4, 0xbf7f
    push16 r4
    ldi16 r4, 0xd217
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07a8
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07aa
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07ac
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_EQ_done
.Lld32_03c_EQ_true:
    cold32_emit_char 'B'
.Lld32_03c_EQ_done:
    brne8 .Lld32_03c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_NE_done
.Lld32_03c_NE_true:
    cold32_emit_char 'B'
.Lld32_03c_NE_done:
    brult8 .Lld32_03c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_ULT_done
.Lld32_03c_ULT_true:
    cold32_emit_char 'B'
.Lld32_03c_ULT_done:
    bruge8 .Lld32_03c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_UGE_done
.Lld32_03c_UGE_true:
    cold32_emit_char 'B'
.Lld32_03c_UGE_done:
    brslt8 .Lld32_03c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_SLT_done
.Lld32_03c_SLT_true:
    cold32_emit_char 'B'
.Lld32_03c_SLT_done:
    brsge8 .Lld32_03c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03c_SGE_done
.Lld32_03c_SGE_true:
    cold32_emit_char 'B'
.Lld32_03c_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r5, unaligned, addr=0x07AF, RRSPEC32=0xCA.
    ldi16 r4, 0x07ae
    ldi8 r5, 0xe1
    st8 [r4], r5
    ldi16 r4, 0x07af
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x07b0
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x07b1
    ldi8 r5, 0x0b
    st8 [r4], r5
    ldi16 r4, 0x07b2
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x07b3
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1f9a
    push16 r4
    ldi16 r4, 0x20bd
    push16 r4
    ldi16 r4, 0x21e0
    push16 r4
    ldi16 r4, 0x2303
    push16 r4
    ldi16 r4, 0x2426
    push16 r4
    ldi16 r4, 0x07af
    push16 r4
    ldi16 r4, 0xbfb0
    push16 r4
    ldi16 r4, 0xd24e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xca ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07ae
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07b0
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07b2
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_EQ_done
.Lld32_03d_EQ_true:
    cold32_emit_char 'B'
.Lld32_03d_EQ_done:
    brne8 .Lld32_03d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_NE_done
.Lld32_03d_NE_true:
    cold32_emit_char 'B'
.Lld32_03d_NE_done:
    brult8 .Lld32_03d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_ULT_done
.Lld32_03d_ULT_true:
    cold32_emit_char 'B'
.Lld32_03d_ULT_done:
    bruge8 .Lld32_03d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_UGE_done
.Lld32_03d_UGE_true:
    cold32_emit_char 'B'
.Lld32_03d_UGE_done:
    brslt8 .Lld32_03d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_SLT_done
.Lld32_03d_SLT_true:
    cold32_emit_char 'B'
.Lld32_03d_SLT_done:
    brsge8 .Lld32_03d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03d_SGE_done
.Lld32_03d_SGE_true:
    cold32_emit_char 'B'
.Lld32_03d_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r6, unaligned overlap, addr=0x07B5, RRSPEC32=0xCC.
    ldi16 r4, 0x07b4
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x07b5
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x07b6
    ldi8 r5, 0xce
    st8 [r4], r5
    ldi16 r4, 0x07b7
    ldi8 r5, 0x0e
    st8 [r4], r5
    ldi16 r4, 0x07b8
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x07b9
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1fd7
    push16 r4
    ldi16 r4, 0x20fa
    push16 r4
    ldi16 r4, 0x221d
    push16 r4
    ldi16 r4, 0x2340
    push16 r4
    ldi16 r4, 0x2463
    push16 r4
    ldi16 r4, 0x2586
    push16 r4
    ldi16 r4, 0x07b5
    push16 r4
    ldi16 r4, 0xd285
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xcc ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07b4
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07b6
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x07b8
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_EQ_done
.Lld32_03e_EQ_true:
    cold32_emit_char 'B'
.Lld32_03e_EQ_done:
    brne8 .Lld32_03e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_NE_done
.Lld32_03e_NE_true:
    cold32_emit_char 'B'
.Lld32_03e_NE_done:
    brult8 .Lld32_03e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_ULT_done
.Lld32_03e_ULT_true:
    cold32_emit_char 'B'
.Lld32_03e_ULT_done:
    bruge8 .Lld32_03e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_UGE_done
.Lld32_03e_UGE_true:
    cold32_emit_char 'B'
.Lld32_03e_UGE_done:
    brslt8 .Lld32_03e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_SLT_done
.Lld32_03e_SLT_true:
    cold32_emit_char 'B'
.Lld32_03e_SLT_done:
    brsge8 .Lld32_03e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03e_SGE_done
.Lld32_03e_SGE_true:
    cold32_emit_char 'B'
.Lld32_03e_SGE_done:
    cold32_emit_char '\n'

    ; ld32: q3,r7, unaligned overlap, addr=0x08FB, RRSPEC32=0xCE.
    ldi16 r4, 0x08fa
    ldi8 r5, 0xf1
    st8 [r4], r5
    ldi16 r4, 0x08fb
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x08fc
    ldi8 r5, 0xe4
    st8 [r4], r5
    ldi16 r4, 0x08fd
    ldi8 r5, 0x11
    st8 [r4], r5
    ldi16 r4, 0x08fe
    ldi8 r5, 0x83
    st8 [r4], r5
    ldi16 r4, 0x08ff
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2014
    push16 r4
    ldi16 r4, 0x2137
    push16 r4
    ldi16 r4, 0x225a
    push16 r4
    ldi16 r4, 0x237d
    push16 r4
    ldi16 r4, 0x24a0
    push16 r4
    ldi16 r4, 0x25c3
    push16 r4
    ldi16 r4, 0xc012
    push16 r4
    ldi16 r4, 0x08fb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6a, 0xce ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x08fa
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x08fc
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    ldi16 r4, 0x08fe
    ld16 r5, [r4]
    mov r0, r5
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lld32_03f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_EQ_done
.Lld32_03f_EQ_true:
    cold32_emit_char 'B'
.Lld32_03f_EQ_done:
    brne8 .Lld32_03f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_NE_done
.Lld32_03f_NE_true:
    cold32_emit_char 'B'
.Lld32_03f_NE_done:
    brult8 .Lld32_03f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_ULT_done
.Lld32_03f_ULT_true:
    cold32_emit_char 'B'
.Lld32_03f_ULT_done:
    bruge8 .Lld32_03f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_UGE_done
.Lld32_03f_UGE_true:
    cold32_emit_char 'B'
.Lld32_03f_UGE_done:
    brslt8 .Lld32_03f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_SLT_done
.Lld32_03f_SLT_true:
    cold32_emit_char 'B'
.Lld32_03f_SLT_done:
    brsge8 .Lld32_03f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lld32_03f_SGE_done
.Lld32_03f_SGE_true:
    cold32_emit_char 'B'
.Lld32_03f_SGE_done:
    cold32_emit_char '\n'

    sys debug_break

.section .avm.metadata,"",@progbits

ld32_full_16bit_wrap_external_observation_manifest:
    ; These bytes describe a true 0xffff -> 0x0000 crossing case.
    ; It is not executed by the serial-only runtime suite because
    ; guest addresses 0x0000-0x0001 alias native AVR r0-r1 and
    ; cannot be observed after interpreter dispatch without an
    ; external memory-state probe.
    .byte 0xfe, 0xff              ; effective address 0xfffe
    .byte 0xf0, 0x6a, 0x0e
