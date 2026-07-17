.include "include/absolute_memory_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; stm16: r0, addr=0x0501, secondary=0x58.
    ldi16 r4, 0x0500
    ldi8 r5, 0x31
    st8 [r4], r5
    ldi16 r4, 0x0501
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0502
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0503
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1234
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
    .byte 0xf0, 0x58, 0x01, 0x05 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0500
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0502
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_00_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_EQ_done
.Lstm16_00_EQ_true:
    abs_emit_char 'B'
.Lstm16_00_EQ_done:
    brne8 .Lstm16_00_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_NE_done
.Lstm16_00_NE_true:
    abs_emit_char 'B'
.Lstm16_00_NE_done:
    brult8 .Lstm16_00_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_ULT_done
.Lstm16_00_ULT_true:
    abs_emit_char 'B'
.Lstm16_00_ULT_done:
    bruge8 .Lstm16_00_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_UGE_done
.Lstm16_00_UGE_true:
    abs_emit_char 'B'
.Lstm16_00_UGE_done:
    brslt8 .Lstm16_00_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_SLT_done
.Lstm16_00_SLT_true:
    abs_emit_char 'B'
.Lstm16_00_SLT_done:
    brsge8 .Lstm16_00_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_00_SGE_done
.Lstm16_00_SGE_true:
    abs_emit_char 'B'
.Lstm16_00_SGE_done:
    abs_emit_char '\n'

    ; stm16: r1, addr=0x0502, secondary=0x59.
    ldi16 r4, 0x0501
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x0502
    ldi8 r5, 0xa4
    st8 [r4], r5
    ldi16 r4, 0x0503
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0504
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x114e
    push16 r4
    ldi16 r4, 0x0001
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
    .byte 0xf0, 0x59, 0x02, 0x05 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0501
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0503
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_01_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_EQ_done
.Lstm16_01_EQ_true:
    abs_emit_char 'B'
.Lstm16_01_EQ_done:
    brne8 .Lstm16_01_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_NE_done
.Lstm16_01_NE_true:
    abs_emit_char 'B'
.Lstm16_01_NE_done:
    brult8 .Lstm16_01_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_ULT_done
.Lstm16_01_ULT_true:
    abs_emit_char 'B'
.Lstm16_01_ULT_done:
    bruge8 .Lstm16_01_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_UGE_done
.Lstm16_01_UGE_true:
    abs_emit_char 'B'
.Lstm16_01_UGE_done:
    brslt8 .Lstm16_01_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_SLT_done
.Lstm16_01_SLT_true:
    abs_emit_char 'B'
.Lstm16_01_SLT_done:
    brsge8 .Lstm16_01_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_01_SGE_done
.Lstm16_01_SGE_true:
    abs_emit_char 'B'
.Lstm16_01_SGE_done:
    abs_emit_char '\n'

    ; stm16: r2, addr=0x057F, secondary=0x5A.
    ldi16 r4, 0x057e
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x057f
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x0580
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0581
    ldi8 r5, 0xbd
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x118b
    push16 r4
    ldi16 r4, 0x12ae
    push16 r4
    ldi16 r4, 0x007f
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
    .byte 0xf0, 0x5a, 0x7f, 0x05 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x057e
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0580
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_02_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_EQ_done
.Lstm16_02_EQ_true:
    abs_emit_char 'B'
.Lstm16_02_EQ_done:
    brne8 .Lstm16_02_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_NE_done
.Lstm16_02_NE_true:
    abs_emit_char 'B'
.Lstm16_02_NE_done:
    brult8 .Lstm16_02_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_ULT_done
.Lstm16_02_ULT_true:
    abs_emit_char 'B'
.Lstm16_02_ULT_done:
    bruge8 .Lstm16_02_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_UGE_done
.Lstm16_02_UGE_true:
    abs_emit_char 'B'
.Lstm16_02_UGE_done:
    brslt8 .Lstm16_02_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_SLT_done
.Lstm16_02_SLT_true:
    abs_emit_char 'B'
.Lstm16_02_SLT_done:
    brsge8 .Lstm16_02_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_02_SGE_done
.Lstm16_02_SGE_true:
    abs_emit_char 'B'
.Lstm16_02_SGE_done:
    abs_emit_char '\n'

    ; stm16: r3, addr=0x0580, secondary=0x5B.
    ldi16 r4, 0x057f
    ldi8 r5, 0x46
    st8 [r4], r5
    ldi16 r4, 0x0580
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x0581
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0582
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x11c8
    push16 r4
    ldi16 r4, 0x12eb
    push16 r4
    ldi16 r4, 0x140e
    push16 r4
    ldi16 r4, 0x0080
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
    .byte 0xf0, 0x5b, 0x80, 0x05 ; TEST
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
    call abs_print_r0_line
    ldi16 r4, 0x0581
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_03_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_EQ_done
.Lstm16_03_EQ_true:
    abs_emit_char 'B'
.Lstm16_03_EQ_done:
    brne8 .Lstm16_03_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_NE_done
.Lstm16_03_NE_true:
    abs_emit_char 'B'
.Lstm16_03_NE_done:
    brult8 .Lstm16_03_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_ULT_done
.Lstm16_03_ULT_true:
    abs_emit_char 'B'
.Lstm16_03_ULT_done:
    bruge8 .Lstm16_03_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_UGE_done
.Lstm16_03_UGE_true:
    abs_emit_char 'B'
.Lstm16_03_UGE_done:
    brslt8 .Lstm16_03_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_SLT_done
.Lstm16_03_SLT_true:
    abs_emit_char 'B'
.Lstm16_03_SLT_done:
    brsge8 .Lstm16_03_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_03_SGE_done
.Lstm16_03_SGE_true:
    abs_emit_char 'B'
.Lstm16_03_SGE_done:
    abs_emit_char '\n'

    ; stm16: r4, addr=0x05FF, secondary=0x5C.
    ldi16 r4, 0x05fe
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x05ff
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0600
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1205
    push16 r4
    ldi16 r4, 0x1328
    push16 r4
    ldi16 r4, 0x144b
    push16 r4
    ldi16 r4, 0x156e
    push16 r4
    ldi16 r4, 0x00ff
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
    .byte 0xf0, 0x5c, 0xff, 0x05 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05fe
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0600
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_04_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_EQ_done
.Lstm16_04_EQ_true:
    abs_emit_char 'B'
.Lstm16_04_EQ_done:
    brne8 .Lstm16_04_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_NE_done
.Lstm16_04_NE_true:
    abs_emit_char 'B'
.Lstm16_04_NE_done:
    brult8 .Lstm16_04_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_ULT_done
.Lstm16_04_ULT_true:
    abs_emit_char 'B'
.Lstm16_04_ULT_done:
    bruge8 .Lstm16_04_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_UGE_done
.Lstm16_04_UGE_true:
    abs_emit_char 'B'
.Lstm16_04_UGE_done:
    brslt8 .Lstm16_04_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_SLT_done
.Lstm16_04_SLT_true:
    abs_emit_char 'B'
.Lstm16_04_SLT_done:
    brsge8 .Lstm16_04_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_04_SGE_done
.Lstm16_04_SGE_true:
    abs_emit_char 'B'
.Lstm16_04_SGE_done:
    abs_emit_char '\n'

    ; stm16: r5, addr=0x0600, secondary=0x5D.
    ldi16 r4, 0x05ff
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x0600
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0602
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1242
    push16 r4
    ldi16 r4, 0x1365
    push16 r4
    ldi16 r4, 0x1488
    push16 r4
    ldi16 r4, 0x15ab
    push16 r4
    ldi16 r4, 0x16ce
    push16 r4
    ldi16 r4, 0x0100
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
    .byte 0xf0, 0x5d, 0x00, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x05ff
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0601
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_05_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_EQ_done
.Lstm16_05_EQ_true:
    abs_emit_char 'B'
.Lstm16_05_EQ_done:
    brne8 .Lstm16_05_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_NE_done
.Lstm16_05_NE_true:
    abs_emit_char 'B'
.Lstm16_05_NE_done:
    brult8 .Lstm16_05_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_ULT_done
.Lstm16_05_ULT_true:
    abs_emit_char 'B'
.Lstm16_05_ULT_done:
    bruge8 .Lstm16_05_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_UGE_done
.Lstm16_05_UGE_true:
    abs_emit_char 'B'
.Lstm16_05_UGE_done:
    brslt8 .Lstm16_05_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_SLT_done
.Lstm16_05_SLT_true:
    abs_emit_char 'B'
.Lstm16_05_SLT_done:
    brsge8 .Lstm16_05_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_05_SGE_done
.Lstm16_05_SGE_true:
    abs_emit_char 'B'
.Lstm16_05_SGE_done:
    abs_emit_char '\n'

    ; stm16: r6, addr=0x067F, secondary=0x5E.
    ldi16 r4, 0x067e
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x067f
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0680
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x0681
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x127f
    push16 r4
    ldi16 r4, 0x13a2
    push16 r4
    ldi16 r4, 0x14c5
    push16 r4
    ldi16 r4, 0x15e8
    push16 r4
    ldi16 r4, 0x170b
    push16 r4
    ldi16 r4, 0x182e
    push16 r4
    ldi16 r4, 0x7fff
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
    .byte 0xf0, 0x5e, 0x7f, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x067e
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0680
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_06_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_EQ_done
.Lstm16_06_EQ_true:
    abs_emit_char 'B'
.Lstm16_06_EQ_done:
    brne8 .Lstm16_06_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_NE_done
.Lstm16_06_NE_true:
    abs_emit_char 'B'
.Lstm16_06_NE_done:
    brult8 .Lstm16_06_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_ULT_done
.Lstm16_06_ULT_true:
    abs_emit_char 'B'
.Lstm16_06_ULT_done:
    bruge8 .Lstm16_06_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_UGE_done
.Lstm16_06_UGE_true:
    abs_emit_char 'B'
.Lstm16_06_UGE_done:
    brslt8 .Lstm16_06_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_SLT_done
.Lstm16_06_SLT_true:
    abs_emit_char 'B'
.Lstm16_06_SLT_done:
    brsge8 .Lstm16_06_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_06_SGE_done
.Lstm16_06_SGE_true:
    abs_emit_char 'B'
.Lstm16_06_SGE_done:
    abs_emit_char '\n'

    ; stm16: r7, addr=0x0680, secondary=0x5F.
    ldi16 r4, 0x067f
    ldi8 r5, 0x62
    st8 [r4], r5
    ldi16 r4, 0x0680
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0681
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x0682
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x12bc
    push16 r4
    ldi16 r4, 0x13df
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
    .byte 0xf0, 0x5f, 0x80, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x067f
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0681
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_07_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_EQ_done
.Lstm16_07_EQ_true:
    abs_emit_char 'B'
.Lstm16_07_EQ_done:
    brne8 .Lstm16_07_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_NE_done
.Lstm16_07_NE_true:
    abs_emit_char 'B'
.Lstm16_07_NE_done:
    brult8 .Lstm16_07_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_ULT_done
.Lstm16_07_ULT_true:
    abs_emit_char 'B'
.Lstm16_07_ULT_done:
    bruge8 .Lstm16_07_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_UGE_done
.Lstm16_07_UGE_true:
    abs_emit_char 'B'
.Lstm16_07_UGE_done:
    brslt8 .Lstm16_07_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_SLT_done
.Lstm16_07_SLT_true:
    abs_emit_char 'B'
.Lstm16_07_SLT_done:
    brsge8 .Lstm16_07_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_07_SGE_done
.Lstm16_07_SGE_true:
    abs_emit_char 'B'
.Lstm16_07_SGE_done:
    abs_emit_char '\n'

    ; stm16: r0, addr=0x06FF, secondary=0x58.
    ldi16 r4, 0x06fe
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x06ff
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0700
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0701
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x141c
    push16 r4
    ldi16 r4, 0x153f
    push16 r4
    ldi16 r4, 0x1662
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
    .byte 0xf0, 0x58, 0xff, 0x06 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x06fe
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0700
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_08_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_EQ_done
.Lstm16_08_EQ_true:
    abs_emit_char 'B'
.Lstm16_08_EQ_done:
    brne8 .Lstm16_08_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_NE_done
.Lstm16_08_NE_true:
    abs_emit_char 'B'
.Lstm16_08_NE_done:
    brult8 .Lstm16_08_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_ULT_done
.Lstm16_08_ULT_true:
    abs_emit_char 'B'
.Lstm16_08_ULT_done:
    bruge8 .Lstm16_08_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_UGE_done
.Lstm16_08_UGE_true:
    abs_emit_char 'B'
.Lstm16_08_UGE_done:
    brslt8 .Lstm16_08_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_SLT_done
.Lstm16_08_SLT_true:
    abs_emit_char 'B'
.Lstm16_08_SLT_done:
    brsge8 .Lstm16_08_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_08_SGE_done
.Lstm16_08_SGE_true:
    abs_emit_char 'B'
.Lstm16_08_SGE_done:
    abs_emit_char '\n'

    ; stm16: r1, addr=0x0700, secondary=0x59.
    ldi16 r4, 0x06ff
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x0700
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x0701
    ldi8 r5, 0x48
    st8 [r4], r5
    ldi16 r4, 0x0702
    ldi8 r5, 0x0a
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1336
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0x157c
    push16 r4
    ldi16 r4, 0x169f
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
    .byte 0xf0, 0x59, 0x00, 0x07 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x06ff
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0701
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_09_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_EQ_done
.Lstm16_09_EQ_true:
    abs_emit_char 'B'
.Lstm16_09_EQ_done:
    brne8 .Lstm16_09_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_NE_done
.Lstm16_09_NE_true:
    abs_emit_char 'B'
.Lstm16_09_NE_done:
    brult8 .Lstm16_09_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_ULT_done
.Lstm16_09_ULT_true:
    abs_emit_char 'B'
.Lstm16_09_ULT_done:
    bruge8 .Lstm16_09_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_UGE_done
.Lstm16_09_UGE_true:
    abs_emit_char 'B'
.Lstm16_09_UGE_done:
    brslt8 .Lstm16_09_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_SLT_done
.Lstm16_09_SLT_true:
    abs_emit_char 'B'
.Lstm16_09_SLT_done:
    brsge8 .Lstm16_09_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_09_SGE_done
.Lstm16_09_SGE_true:
    abs_emit_char 'B'
.Lstm16_09_SGE_done:
    abs_emit_char '\n'

    ; stm16: r2, addr=0x077F, secondary=0x5A.
    ldi16 r4, 0x077e
    ldi8 r5, 0x77
    st8 [r4], r5
    ldi16 r4, 0x077f
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x0780
    ldi8 r5, 0xff
    st8 [r4], r5
    ldi16 r4, 0x0781
    ldi8 r5, 0x15
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1373
    push16 r4
    ldi16 r4, 0x1496
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x16dc
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
    .byte 0xf0, 0x5a, 0x7f, 0x07 ; TEST
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
    call abs_print_r0_line
    ldi16 r4, 0x0780
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0a_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_EQ_done
.Lstm16_0a_EQ_true:
    abs_emit_char 'B'
.Lstm16_0a_EQ_done:
    brne8 .Lstm16_0a_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_NE_done
.Lstm16_0a_NE_true:
    abs_emit_char 'B'
.Lstm16_0a_NE_done:
    brult8 .Lstm16_0a_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_ULT_done
.Lstm16_0a_ULT_true:
    abs_emit_char 'B'
.Lstm16_0a_ULT_done:
    bruge8 .Lstm16_0a_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_UGE_done
.Lstm16_0a_UGE_true:
    abs_emit_char 'B'
.Lstm16_0a_UGE_done:
    brslt8 .Lstm16_0a_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_SLT_done
.Lstm16_0a_SLT_true:
    abs_emit_char 'B'
.Lstm16_0a_SLT_done:
    brsge8 .Lstm16_0a_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0a_SGE_done
.Lstm16_0a_SGE_true:
    abs_emit_char 'B'
.Lstm16_0a_SGE_done:
    abs_emit_char '\n'

    ; stm16: r3, addr=0x0780, secondary=0x5B.
    ldi16 r4, 0x077f
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x0780
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0781
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0782
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x13b0
    push16 r4
    ldi16 r4, 0x14d3
    push16 r4
    ldi16 r4, 0x15f6
    push16 r4
    ldi16 r4, 0x5aa5
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
    .byte 0xf0, 0x5b, 0x80, 0x07 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x077f
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0781
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0b_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_EQ_done
.Lstm16_0b_EQ_true:
    abs_emit_char 'B'
.Lstm16_0b_EQ_done:
    brne8 .Lstm16_0b_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_NE_done
.Lstm16_0b_NE_true:
    abs_emit_char 'B'
.Lstm16_0b_NE_done:
    brult8 .Lstm16_0b_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_ULT_done
.Lstm16_0b_ULT_true:
    abs_emit_char 'B'
.Lstm16_0b_ULT_done:
    bruge8 .Lstm16_0b_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_UGE_done
.Lstm16_0b_UGE_true:
    abs_emit_char 'B'
.Lstm16_0b_UGE_done:
    brslt8 .Lstm16_0b_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_SLT_done
.Lstm16_0b_SLT_true:
    abs_emit_char 'B'
.Lstm16_0b_SLT_done:
    brsge8 .Lstm16_0b_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0b_SGE_done
.Lstm16_0b_SGE_true:
    abs_emit_char 'B'
.Lstm16_0b_SGE_done:
    abs_emit_char '\n'

    ; stm16: r4, addr=0x07FF, secondary=0x5C.
    ldi16 r4, 0x07fe
    ldi8 r5, 0x85
    st8 [r4], r5
    ldi16 r4, 0x07ff
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0800
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0801
    ldi8 r5, 0x2b
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x13ed
    push16 r4
    ldi16 r4, 0x1510
    push16 r4
    ldi16 r4, 0x1633
    push16 r4
    ldi16 r4, 0x1756
    push16 r4
    ldi16 r4, 0xff00
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
    .byte 0xf0, 0x5c, 0xff, 0x07 ; TEST
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
    call abs_print_r0_line
    ldi16 r4, 0x0800
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0c_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_EQ_done
.Lstm16_0c_EQ_true:
    abs_emit_char 'B'
.Lstm16_0c_EQ_done:
    brne8 .Lstm16_0c_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_NE_done
.Lstm16_0c_NE_true:
    abs_emit_char 'B'
.Lstm16_0c_NE_done:
    brult8 .Lstm16_0c_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_ULT_done
.Lstm16_0c_ULT_true:
    abs_emit_char 'B'
.Lstm16_0c_ULT_done:
    bruge8 .Lstm16_0c_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_UGE_done
.Lstm16_0c_UGE_true:
    abs_emit_char 'B'
.Lstm16_0c_UGE_done:
    brslt8 .Lstm16_0c_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_SLT_done
.Lstm16_0c_SLT_true:
    abs_emit_char 'B'
.Lstm16_0c_SLT_done:
    brsge8 .Lstm16_0c_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0c_SGE_done
.Lstm16_0c_SGE_true:
    abs_emit_char 'B'
.Lstm16_0c_SGE_done:
    abs_emit_char '\n'

    ; stm16: r5, addr=0x0800, secondary=0x5D.
    ldi16 r4, 0x07ff
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x0800
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0801
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x0802
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x142a
    push16 r4
    ldi16 r4, 0x154d
    push16 r4
    ldi16 r4, 0x1670
    push16 r4
    ldi16 r4, 0x1793
    push16 r4
    ldi16 r4, 0x18b6
    push16 r4
    ldi16 r4, 0x00fe
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
    .byte 0xf0, 0x5d, 0x00, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x07ff
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0801
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0d_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_EQ_done
.Lstm16_0d_EQ_true:
    abs_emit_char 'B'
.Lstm16_0d_EQ_done:
    brne8 .Lstm16_0d_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_NE_done
.Lstm16_0d_NE_true:
    abs_emit_char 'B'
.Lstm16_0d_NE_done:
    brult8 .Lstm16_0d_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_ULT_done
.Lstm16_0d_ULT_true:
    abs_emit_char 'B'
.Lstm16_0d_ULT_done:
    bruge8 .Lstm16_0d_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_UGE_done
.Lstm16_0d_UGE_true:
    abs_emit_char 'B'
.Lstm16_0d_UGE_done:
    brslt8 .Lstm16_0d_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_SLT_done
.Lstm16_0d_SLT_true:
    abs_emit_char 'B'
.Lstm16_0d_SLT_done:
    brsge8 .Lstm16_0d_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0d_SGE_done
.Lstm16_0d_SGE_true:
    abs_emit_char 'B'
.Lstm16_0d_SGE_done:
    abs_emit_char '\n'

    ; stm16: r6, addr=0x087F, secondary=0x5E.
    ldi16 r4, 0x087e
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x087f
    ldi8 r5, 0x24
    st8 [r4], r5
    ldi16 r4, 0x0880
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0881
    ldi8 r5, 0x41
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1467
    push16 r4
    ldi16 r4, 0x158a
    push16 r4
    ldi16 r4, 0x16ad
    push16 r4
    ldi16 r4, 0x17d0
    push16 r4
    ldi16 r4, 0x18f3
    push16 r4
    ldi16 r4, 0x1a16
    push16 r4
    ldi16 r4, 0xc381
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
    .byte 0xf0, 0x5e, 0x7f, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x087e
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x0880
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0e_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_EQ_done
.Lstm16_0e_EQ_true:
    abs_emit_char 'B'
.Lstm16_0e_EQ_done:
    brne8 .Lstm16_0e_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_NE_done
.Lstm16_0e_NE_true:
    abs_emit_char 'B'
.Lstm16_0e_NE_done:
    brult8 .Lstm16_0e_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_ULT_done
.Lstm16_0e_ULT_true:
    abs_emit_char 'B'
.Lstm16_0e_ULT_done:
    bruge8 .Lstm16_0e_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_UGE_done
.Lstm16_0e_UGE_true:
    abs_emit_char 'B'
.Lstm16_0e_UGE_done:
    brslt8 .Lstm16_0e_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_SLT_done
.Lstm16_0e_SLT_true:
    abs_emit_char 'B'
.Lstm16_0e_SLT_done:
    brsge8 .Lstm16_0e_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0e_SGE_done
.Lstm16_0e_SGE_true:
    abs_emit_char 'B'
.Lstm16_0e_SGE_done:
    abs_emit_char '\n'

    ; stm16: r7, addr=0x08FC, secondary=0x5F.
    ldi16 r4, 0x08fb
    ldi8 r5, 0x9a
    st8 [r4], r5
    ldi16 r4, 0x08fc
    ldi8 r5, 0xdb
    st8 [r4], r5
    ldi16 r4, 0x08fd
    ldi8 r5, 0xdb
    st8 [r4], r5
    ldi16 r4, 0x08fe
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x14a4
    push16 r4
    ldi16 r4, 0x15c7
    push16 r4
    ldi16 r4, 0x16ea
    push16 r4
    ldi16 r4, 0x180d
    push16 r4
    ldi16 r4, 0x1930
    push16 r4
    ldi16 r4, 0x1a53
    push16 r4
    ldi16 r4, 0x1b76
    push16 r4
    ldi16 r4, 0x817e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x5f, 0xfc, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x08fb
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    ldi16 r4, 0x08fd
    ld16 r5, [r4]
    mov r0, r5
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    pop16 r0
    call abs_print_r0_line
    breq8 .Lstm16_0f_EQ_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_EQ_done
.Lstm16_0f_EQ_true:
    abs_emit_char 'B'
.Lstm16_0f_EQ_done:
    brne8 .Lstm16_0f_NE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_NE_done
.Lstm16_0f_NE_true:
    abs_emit_char 'B'
.Lstm16_0f_NE_done:
    brult8 .Lstm16_0f_ULT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_ULT_done
.Lstm16_0f_ULT_true:
    abs_emit_char 'B'
.Lstm16_0f_ULT_done:
    bruge8 .Lstm16_0f_UGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_UGE_done
.Lstm16_0f_UGE_true:
    abs_emit_char 'B'
.Lstm16_0f_UGE_done:
    brslt8 .Lstm16_0f_SLT_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_SLT_done
.Lstm16_0f_SLT_true:
    abs_emit_char 'B'
.Lstm16_0f_SLT_done:
    brsge8 .Lstm16_0f_SGE_true
    abs_emit_char 'A'
    jmp8 .Lstm16_0f_SGE_done
.Lstm16_0f_SGE_true:
    abs_emit_char 'B'
.Lstm16_0f_SGE_done:
    abs_emit_char '\n'

    sys debug_break
