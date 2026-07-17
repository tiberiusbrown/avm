.section .text,"ax",@progbits
.Lpl_text_start:

    ; These fixtures precede every relaxable instruction. The linker therefore
    ; cannot shift them while shortening calls, jumps, or branches later in
    ; this section. With no static data, .text begins at logical 0x000100.
    .org 0xfeff
.Lpl_boundary_data:
    .byte 0x12, 0x34, 0x56, 0x78, 0x9a

    .org 0xff10
.Lpl_normal_data:
    .byte 0x00, 0x7f, 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0x21, 0x43, 0x65, 0x87, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x10, 0x20, 0x30, 0x40, 0x5a, 0xa5, 0x01, 0x81, 0x2c, 0x4d, 0x6e, 0x8f

.include "include/program_load_test.inc"

.globl _start
.type _start, @function
_start:

    ; ldp24: ordinary, q0, q0, PSPEC=0x00.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1111
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
    ldi16 r0, %lo16(.Lpl_normal_data + 9)
    ldi8 r1, %hi8(.Lpl_normal_data + 9)
    .byte 0xf0, 0x63, 0x00 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_000_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_EQ_done
.Lldp24_000_EQ_true:
    pl_emit_char 'B'
.Lldp24_000_EQ_done:
    brne8 .Lldp24_000_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_NE_done
.Lldp24_000_NE_true:
    pl_emit_char 'B'
.Lldp24_000_NE_done:
    brult8 .Lldp24_000_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_ULT_done
.Lldp24_000_ULT_true:
    pl_emit_char 'B'
.Lldp24_000_ULT_done:
    bruge8 .Lldp24_000_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_UGE_done
.Lldp24_000_UGE_true:
    pl_emit_char 'B'
.Lldp24_000_UGE_done:
    brslt8 .Lldp24_000_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_SLT_done
.Lldp24_000_SLT_true:
    pl_emit_char 'B'
.Lldp24_000_SLT_done:
    brsge8 .Lldp24_000_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_000_SGE_done
.Lldp24_000_SGE_true:
    pl_emit_char 'B'
.Lldp24_000_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q1, q0, PSPEC=0x40.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x114e
    push16 r4
    ldi16 r4, 0x1271
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
    ldi16 r0, %lo16(.Lpl_normal_data + 14)
    ldi8 r1, %hi8(.Lpl_normal_data + 14)
    ldi16 r2, 0xb12d
    ldi16 r3, 0xc231
    .byte 0xf0, 0x63, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_001_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_EQ_done
.Lldp24_001_EQ_true:
    pl_emit_char 'B'
.Lldp24_001_EQ_done:
    brne8 .Lldp24_001_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_NE_done
.Lldp24_001_NE_true:
    pl_emit_char 'B'
.Lldp24_001_NE_done:
    brult8 .Lldp24_001_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_ULT_done
.Lldp24_001_ULT_true:
    pl_emit_char 'B'
.Lldp24_001_ULT_done:
    bruge8 .Lldp24_001_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_UGE_done
.Lldp24_001_UGE_true:
    pl_emit_char 'B'
.Lldp24_001_UGE_done:
    brslt8 .Lldp24_001_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_SLT_done
.Lldp24_001_SLT_true:
    pl_emit_char 'B'
.Lldp24_001_SLT_done:
    brsge8 .Lldp24_001_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_001_SGE_done
.Lldp24_001_SGE_true:
    pl_emit_char 'B'
.Lldp24_001_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q2, q0, PSPEC=0x80.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x118b
    push16 r4
    ldi16 r4, 0x12ae
    push16 r4
    ldi16 r4, 0x13d1
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
    ldi16 r0, %lo16(.Lpl_normal_data + 19)
    ldi8 r1, %hi8(.Lpl_normal_data + 19)
    ldi16 r4, 0xb15a
    ldi16 r5, 0xc262
    .byte 0xf0, 0x63, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_002_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_EQ_done
.Lldp24_002_EQ_true:
    pl_emit_char 'B'
.Lldp24_002_EQ_done:
    brne8 .Lldp24_002_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_NE_done
.Lldp24_002_NE_true:
    pl_emit_char 'B'
.Lldp24_002_NE_done:
    brult8 .Lldp24_002_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_ULT_done
.Lldp24_002_ULT_true:
    pl_emit_char 'B'
.Lldp24_002_ULT_done:
    bruge8 .Lldp24_002_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_UGE_done
.Lldp24_002_UGE_true:
    pl_emit_char 'B'
.Lldp24_002_UGE_done:
    brslt8 .Lldp24_002_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_SLT_done
.Lldp24_002_SLT_true:
    pl_emit_char 'B'
.Lldp24_002_SLT_done:
    brsge8 .Lldp24_002_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_002_SGE_done
.Lldp24_002_SGE_true:
    pl_emit_char 'B'
.Lldp24_002_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q3, q0, PSPEC=0xC0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x11c8
    push16 r4
    ldi16 r4, 0x12eb
    push16 r4
    ldi16 r4, 0x140e
    push16 r4
    ldi16 r4, 0x1531
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
    ldi16 r0, %lo16(.Lpl_normal_data + 24)
    ldi8 r1, %hi8(.Lpl_normal_data + 24)
    ldi16 r6, 0xb187
    ldi16 r7, 0xc293
    .byte 0xf0, 0x63, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_003_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_EQ_done
.Lldp24_003_EQ_true:
    pl_emit_char 'B'
.Lldp24_003_EQ_done:
    brne8 .Lldp24_003_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_NE_done
.Lldp24_003_NE_true:
    pl_emit_char 'B'
.Lldp24_003_NE_done:
    brult8 .Lldp24_003_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_ULT_done
.Lldp24_003_ULT_true:
    pl_emit_char 'B'
.Lldp24_003_ULT_done:
    bruge8 .Lldp24_003_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_UGE_done
.Lldp24_003_UGE_true:
    pl_emit_char 'B'
.Lldp24_003_UGE_done:
    brslt8 .Lldp24_003_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_SLT_done
.Lldp24_003_SLT_true:
    pl_emit_char 'B'
.Lldp24_003_SLT_done:
    brsge8 .Lldp24_003_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_003_SGE_done
.Lldp24_003_SGE_true:
    pl_emit_char 'B'
.Lldp24_003_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q0, q1, PSPEC=0x04.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1205
    push16 r4
    ldi16 r4, 0x1328
    push16 r4
    ldi16 r4, 0x144b
    push16 r4
    ldi16 r4, 0x156e
    push16 r4
    ldi16 r4, 0x1691
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
    ldi16 r2, %lo16(.Lpl_normal_data + 29)
    ldi8 r3, %hi8(.Lpl_normal_data + 29)
    ldi16 r0, 0xb1b4
    ldi16 r1, 0xc2c4
    .byte 0xf0, 0x63, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_004_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_EQ_done
.Lldp24_004_EQ_true:
    pl_emit_char 'B'
.Lldp24_004_EQ_done:
    brne8 .Lldp24_004_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_NE_done
.Lldp24_004_NE_true:
    pl_emit_char 'B'
.Lldp24_004_NE_done:
    brult8 .Lldp24_004_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_ULT_done
.Lldp24_004_ULT_true:
    pl_emit_char 'B'
.Lldp24_004_ULT_done:
    bruge8 .Lldp24_004_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_UGE_done
.Lldp24_004_UGE_true:
    pl_emit_char 'B'
.Lldp24_004_UGE_done:
    brslt8 .Lldp24_004_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_SLT_done
.Lldp24_004_SLT_true:
    pl_emit_char 'B'
.Lldp24_004_SLT_done:
    brsge8 .Lldp24_004_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_004_SGE_done
.Lldp24_004_SGE_true:
    pl_emit_char 'B'
.Lldp24_004_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q1, q1, PSPEC=0x44.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r4, 0x17f1
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
    ldi16 r2, %lo16(.Lpl_normal_data + 4)
    ldi8 r3, %hi8(.Lpl_normal_data + 4)
    .byte 0xf0, 0x63, 0x44 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_005_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_EQ_done
.Lldp24_005_EQ_true:
    pl_emit_char 'B'
.Lldp24_005_EQ_done:
    brne8 .Lldp24_005_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_NE_done
.Lldp24_005_NE_true:
    pl_emit_char 'B'
.Lldp24_005_NE_done:
    brult8 .Lldp24_005_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_ULT_done
.Lldp24_005_ULT_true:
    pl_emit_char 'B'
.Lldp24_005_ULT_done:
    bruge8 .Lldp24_005_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_UGE_done
.Lldp24_005_UGE_true:
    pl_emit_char 'B'
.Lldp24_005_UGE_done:
    brslt8 .Lldp24_005_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_SLT_done
.Lldp24_005_SLT_true:
    pl_emit_char 'B'
.Lldp24_005_SLT_done:
    brsge8 .Lldp24_005_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_005_SGE_done
.Lldp24_005_SGE_true:
    pl_emit_char 'B'
.Lldp24_005_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q2, q1, PSPEC=0x84.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r4, 0x1951
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
    ldi16 r2, %lo16(.Lpl_normal_data + 9)
    ldi8 r3, %hi8(.Lpl_normal_data + 9)
    ldi16 r4, 0xb20e
    ldi16 r5, 0xc326
    .byte 0xf0, 0x63, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_006_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_EQ_done
.Lldp24_006_EQ_true:
    pl_emit_char 'B'
.Lldp24_006_EQ_done:
    brne8 .Lldp24_006_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_NE_done
.Lldp24_006_NE_true:
    pl_emit_char 'B'
.Lldp24_006_NE_done:
    brult8 .Lldp24_006_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_ULT_done
.Lldp24_006_ULT_true:
    pl_emit_char 'B'
.Lldp24_006_ULT_done:
    bruge8 .Lldp24_006_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_UGE_done
.Lldp24_006_UGE_true:
    pl_emit_char 'B'
.Lldp24_006_UGE_done:
    brslt8 .Lldp24_006_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_SLT_done
.Lldp24_006_SLT_true:
    pl_emit_char 'B'
.Lldp24_006_SLT_done:
    brsge8 .Lldp24_006_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_006_SGE_done
.Lldp24_006_SGE_true:
    pl_emit_char 'B'
.Lldp24_006_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q3, q1, PSPEC=0xC4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r4, 0x1ab1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r2, %lo16(.Lpl_normal_data + 14)
    ldi8 r3, %hi8(.Lpl_normal_data + 14)
    ldi16 r6, 0xb23b
    ldi16 r7, 0xc357
    .byte 0xf0, 0x63, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_007_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_EQ_done
.Lldp24_007_EQ_true:
    pl_emit_char 'B'
.Lldp24_007_EQ_done:
    brne8 .Lldp24_007_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_NE_done
.Lldp24_007_NE_true:
    pl_emit_char 'B'
.Lldp24_007_NE_done:
    brult8 .Lldp24_007_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_ULT_done
.Lldp24_007_ULT_true:
    pl_emit_char 'B'
.Lldp24_007_ULT_done:
    bruge8 .Lldp24_007_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_UGE_done
.Lldp24_007_UGE_true:
    pl_emit_char 'B'
.Lldp24_007_UGE_done:
    brslt8 .Lldp24_007_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_SLT_done
.Lldp24_007_SLT_true:
    pl_emit_char 'B'
.Lldp24_007_SLT_done:
    brsge8 .Lldp24_007_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_007_SGE_done
.Lldp24_007_SGE_true:
    pl_emit_char 'B'
.Lldp24_007_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q0, q2, PSPEC=0x08.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x12f9
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
    ldi16 r4, %lo16(.Lpl_normal_data + 19)
    ldi8 r5, %hi8(.Lpl_normal_data + 19)
    ldi16 r0, 0xb268
    ldi16 r1, 0xc388
    .byte 0xf0, 0x63, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_008_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_EQ_done
.Lldp24_008_EQ_true:
    pl_emit_char 'B'
.Lldp24_008_EQ_done:
    brne8 .Lldp24_008_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_NE_done
.Lldp24_008_NE_true:
    pl_emit_char 'B'
.Lldp24_008_NE_done:
    brult8 .Lldp24_008_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_ULT_done
.Lldp24_008_ULT_true:
    pl_emit_char 'B'
.Lldp24_008_ULT_done:
    bruge8 .Lldp24_008_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_UGE_done
.Lldp24_008_UGE_true:
    pl_emit_char 'B'
.Lldp24_008_UGE_done:
    brslt8 .Lldp24_008_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_SLT_done
.Lldp24_008_SLT_true:
    pl_emit_char 'B'
.Lldp24_008_SLT_done:
    brsge8 .Lldp24_008_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_008_SGE_done
.Lldp24_008_SGE_true:
    pl_emit_char 'B'
.Lldp24_008_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q1, q2, PSPEC=0x48.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1336
    push16 r4
    ldi16 r4, 0x1459
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
    ldi16 r4, %lo16(.Lpl_normal_data + 24)
    ldi8 r5, %hi8(.Lpl_normal_data + 24)
    ldi16 r2, 0xb295
    ldi16 r3, 0xc3b9
    .byte 0xf0, 0x63, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_009_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_EQ_done
.Lldp24_009_EQ_true:
    pl_emit_char 'B'
.Lldp24_009_EQ_done:
    brne8 .Lldp24_009_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_NE_done
.Lldp24_009_NE_true:
    pl_emit_char 'B'
.Lldp24_009_NE_done:
    brult8 .Lldp24_009_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_ULT_done
.Lldp24_009_ULT_true:
    pl_emit_char 'B'
.Lldp24_009_ULT_done:
    bruge8 .Lldp24_009_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_UGE_done
.Lldp24_009_UGE_true:
    pl_emit_char 'B'
.Lldp24_009_UGE_done:
    brslt8 .Lldp24_009_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_SLT_done
.Lldp24_009_SLT_true:
    pl_emit_char 'B'
.Lldp24_009_SLT_done:
    brsge8 .Lldp24_009_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_009_SGE_done
.Lldp24_009_SGE_true:
    pl_emit_char 'B'
.Lldp24_009_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q2, q2, PSPEC=0x88.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1373
    push16 r4
    ldi16 r4, 0x1496
    push16 r4
    ldi16 r4, 0x15b9
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
    ldi16 r4, %lo16(.Lpl_normal_data + 29)
    ldi8 r5, %hi8(.Lpl_normal_data + 29)
    .byte 0xf0, 0x63, 0x88 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00a_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_EQ_done
.Lldp24_00a_EQ_true:
    pl_emit_char 'B'
.Lldp24_00a_EQ_done:
    brne8 .Lldp24_00a_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_NE_done
.Lldp24_00a_NE_true:
    pl_emit_char 'B'
.Lldp24_00a_NE_done:
    brult8 .Lldp24_00a_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_ULT_done
.Lldp24_00a_ULT_true:
    pl_emit_char 'B'
.Lldp24_00a_ULT_done:
    bruge8 .Lldp24_00a_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_UGE_done
.Lldp24_00a_UGE_true:
    pl_emit_char 'B'
.Lldp24_00a_UGE_done:
    brslt8 .Lldp24_00a_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_SLT_done
.Lldp24_00a_SLT_true:
    pl_emit_char 'B'
.Lldp24_00a_SLT_done:
    brsge8 .Lldp24_00a_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00a_SGE_done
.Lldp24_00a_SGE_true:
    pl_emit_char 'B'
.Lldp24_00a_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q3, q2, PSPEC=0xC8.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1719
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
    ldi16 r4, %lo16(.Lpl_normal_data + 4)
    ldi8 r5, %hi8(.Lpl_normal_data + 4)
    ldi16 r6, 0xb2ef
    ldi16 r7, 0xc41b
    .byte 0xf0, 0x63, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00b_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_EQ_done
.Lldp24_00b_EQ_true:
    pl_emit_char 'B'
.Lldp24_00b_EQ_done:
    brne8 .Lldp24_00b_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_NE_done
.Lldp24_00b_NE_true:
    pl_emit_char 'B'
.Lldp24_00b_NE_done:
    brult8 .Lldp24_00b_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_ULT_done
.Lldp24_00b_ULT_true:
    pl_emit_char 'B'
.Lldp24_00b_ULT_done:
    bruge8 .Lldp24_00b_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_UGE_done
.Lldp24_00b_UGE_true:
    pl_emit_char 'B'
.Lldp24_00b_UGE_done:
    brslt8 .Lldp24_00b_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_SLT_done
.Lldp24_00b_SLT_true:
    pl_emit_char 'B'
.Lldp24_00b_SLT_done:
    brsge8 .Lldp24_00b_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00b_SGE_done
.Lldp24_00b_SGE_true:
    pl_emit_char 'B'
.Lldp24_00b_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q0, q3, PSPEC=0x0C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x13ed
    push16 r4
    ldi16 r4, 0x1510
    push16 r4
    ldi16 r4, 0x1633
    push16 r4
    ldi16 r4, 0x1756
    push16 r4
    ldi16 r4, 0x1879
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
    ldi16 r6, %lo16(.Lpl_normal_data + 9)
    ldi8 r7, %hi8(.Lpl_normal_data + 9)
    ldi16 r0, 0xb31c
    ldi16 r1, 0xc44c
    .byte 0xf0, 0x63, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00c_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_EQ_done
.Lldp24_00c_EQ_true:
    pl_emit_char 'B'
.Lldp24_00c_EQ_done:
    brne8 .Lldp24_00c_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_NE_done
.Lldp24_00c_NE_true:
    pl_emit_char 'B'
.Lldp24_00c_NE_done:
    brult8 .Lldp24_00c_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_ULT_done
.Lldp24_00c_ULT_true:
    pl_emit_char 'B'
.Lldp24_00c_ULT_done:
    bruge8 .Lldp24_00c_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_UGE_done
.Lldp24_00c_UGE_true:
    pl_emit_char 'B'
.Lldp24_00c_UGE_done:
    brslt8 .Lldp24_00c_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_SLT_done
.Lldp24_00c_SLT_true:
    pl_emit_char 'B'
.Lldp24_00c_SLT_done:
    brsge8 .Lldp24_00c_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00c_SGE_done
.Lldp24_00c_SGE_true:
    pl_emit_char 'B'
.Lldp24_00c_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q1, q3, PSPEC=0x4C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r4, 0x19d9
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
    ldi16 r6, %lo16(.Lpl_normal_data + 14)
    ldi8 r7, %hi8(.Lpl_normal_data + 14)
    ldi16 r2, 0xb349
    ldi16 r3, 0xc47d
    .byte 0xf0, 0x63, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00d_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_EQ_done
.Lldp24_00d_EQ_true:
    pl_emit_char 'B'
.Lldp24_00d_EQ_done:
    brne8 .Lldp24_00d_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_NE_done
.Lldp24_00d_NE_true:
    pl_emit_char 'B'
.Lldp24_00d_NE_done:
    brult8 .Lldp24_00d_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_ULT_done
.Lldp24_00d_ULT_true:
    pl_emit_char 'B'
.Lldp24_00d_ULT_done:
    bruge8 .Lldp24_00d_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_UGE_done
.Lldp24_00d_UGE_true:
    pl_emit_char 'B'
.Lldp24_00d_UGE_done:
    brslt8 .Lldp24_00d_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_SLT_done
.Lldp24_00d_SLT_true:
    pl_emit_char 'B'
.Lldp24_00d_SLT_done:
    brsge8 .Lldp24_00d_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00d_SGE_done
.Lldp24_00d_SGE_true:
    pl_emit_char 'B'
.Lldp24_00d_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q2, q3, PSPEC=0x8C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r4, 0x1b39
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
    ldi16 r6, %lo16(.Lpl_normal_data + 19)
    ldi8 r7, %hi8(.Lpl_normal_data + 19)
    ldi16 r4, 0xb376
    ldi16 r5, 0xc4ae
    .byte 0xf0, 0x63, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00e_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_EQ_done
.Lldp24_00e_EQ_true:
    pl_emit_char 'B'
.Lldp24_00e_EQ_done:
    brne8 .Lldp24_00e_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_NE_done
.Lldp24_00e_NE_true:
    pl_emit_char 'B'
.Lldp24_00e_NE_done:
    brult8 .Lldp24_00e_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_ULT_done
.Lldp24_00e_ULT_true:
    pl_emit_char 'B'
.Lldp24_00e_ULT_done:
    bruge8 .Lldp24_00e_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_UGE_done
.Lldp24_00e_UGE_true:
    pl_emit_char 'B'
.Lldp24_00e_UGE_done:
    brslt8 .Lldp24_00e_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_SLT_done
.Lldp24_00e_SLT_true:
    pl_emit_char 'B'
.Lldp24_00e_SLT_done:
    brsge8 .Lldp24_00e_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00e_SGE_done
.Lldp24_00e_SGE_true:
    pl_emit_char 'B'
.Lldp24_00e_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary, q3, q3, PSPEC=0xCC.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r4, 0x1c99
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 24)
    ldi8 r7, %hi8(.Lpl_normal_data + 24)
    .byte 0xf0, 0x63, 0xcc ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_00f_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_EQ_done
.Lldp24_00f_EQ_true:
    pl_emit_char 'B'
.Lldp24_00f_EQ_done:
    brne8 .Lldp24_00f_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_NE_done
.Lldp24_00f_NE_true:
    pl_emit_char 'B'
.Lldp24_00f_NE_done:
    brult8 .Lldp24_00f_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_ULT_done
.Lldp24_00f_ULT_true:
    pl_emit_char 'B'
.Lldp24_00f_ULT_done:
    bruge8 .Lldp24_00f_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_UGE_done
.Lldp24_00f_UGE_true:
    pl_emit_char 'B'
.Lldp24_00f_UGE_done:
    brslt8 .Lldp24_00f_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_SLT_done
.Lldp24_00f_SLT_true:
    pl_emit_char 'B'
.Lldp24_00f_SLT_done:
    brsge8 .Lldp24_00f_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_00f_SGE_done
.Lldp24_00f_SGE_true:
    pl_emit_char 'B'
.Lldp24_00f_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q1, q0, PSPEC=0x40.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x14e1
    push16 r4
    ldi16 r4, 0x1604
    push16 r4
    ldi16 r4, 0x1727
    push16 r4
    ldi16 r4, 0x184a
    push16 r4
    ldi16 r4, 0x196d
    push16 r4
    ldi16 r4, 0x1a90
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
    ldi16 r0, %lo16(.Lpl_normal_data + 29)
    ldi8 r1, %hi8(.Lpl_normal_data + 29)
    ldi16 r2, 0xb3d0
    ldi16 r3, 0xc510
    .byte 0xf0, 0x67, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_010_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_EQ_done
.Lldp24_010_EQ_true:
    pl_emit_char 'B'
.Lldp24_010_EQ_done:
    brne8 .Lldp24_010_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_NE_done
.Lldp24_010_NE_true:
    pl_emit_char 'B'
.Lldp24_010_NE_done:
    brult8 .Lldp24_010_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_ULT_done
.Lldp24_010_ULT_true:
    pl_emit_char 'B'
.Lldp24_010_ULT_done:
    bruge8 .Lldp24_010_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_UGE_done
.Lldp24_010_UGE_true:
    pl_emit_char 'B'
.Lldp24_010_UGE_done:
    brslt8 .Lldp24_010_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_SLT_done
.Lldp24_010_SLT_true:
    pl_emit_char 'B'
.Lldp24_010_SLT_done:
    brsge8 .Lldp24_010_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_010_SGE_done
.Lldp24_010_SGE_true:
    pl_emit_char 'B'
.Lldp24_010_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q2, q0, PSPEC=0x80.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x151e
    push16 r4
    ldi16 r4, 0x1641
    push16 r4
    ldi16 r4, 0x1764
    push16 r4
    ldi16 r4, 0x1887
    push16 r4
    ldi16 r4, 0x19aa
    push16 r4
    ldi16 r4, 0x1acd
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
    ldi16 r0, %lo16(.Lpl_normal_data + 4)
    ldi8 r1, %hi8(.Lpl_normal_data + 4)
    ldi16 r4, 0xb3fd
    ldi16 r5, 0xc541
    .byte 0xf0, 0x67, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_011_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_EQ_done
.Lldp24_011_EQ_true:
    pl_emit_char 'B'
.Lldp24_011_EQ_done:
    brne8 .Lldp24_011_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_NE_done
.Lldp24_011_NE_true:
    pl_emit_char 'B'
.Lldp24_011_NE_done:
    brult8 .Lldp24_011_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_ULT_done
.Lldp24_011_ULT_true:
    pl_emit_char 'B'
.Lldp24_011_ULT_done:
    bruge8 .Lldp24_011_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_UGE_done
.Lldp24_011_UGE_true:
    pl_emit_char 'B'
.Lldp24_011_UGE_done:
    brslt8 .Lldp24_011_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_SLT_done
.Lldp24_011_SLT_true:
    pl_emit_char 'B'
.Lldp24_011_SLT_done:
    brsge8 .Lldp24_011_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_011_SGE_done
.Lldp24_011_SGE_true:
    pl_emit_char 'B'
.Lldp24_011_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q3, q0, PSPEC=0xC0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x155b
    push16 r4
    ldi16 r4, 0x167e
    push16 r4
    ldi16 r4, 0x17a1
    push16 r4
    ldi16 r4, 0x18c4
    push16 r4
    ldi16 r4, 0x19e7
    push16 r4
    ldi16 r4, 0x1b0a
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
    ldi16 r0, %lo16(.Lpl_normal_data + 9)
    ldi8 r1, %hi8(.Lpl_normal_data + 9)
    ldi16 r6, 0xb42a
    ldi16 r7, 0xc572
    .byte 0xf0, 0x67, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_012_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_EQ_done
.Lldp24_012_EQ_true:
    pl_emit_char 'B'
.Lldp24_012_EQ_done:
    brne8 .Lldp24_012_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_NE_done
.Lldp24_012_NE_true:
    pl_emit_char 'B'
.Lldp24_012_NE_done:
    brult8 .Lldp24_012_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_ULT_done
.Lldp24_012_ULT_true:
    pl_emit_char 'B'
.Lldp24_012_ULT_done:
    bruge8 .Lldp24_012_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_UGE_done
.Lldp24_012_UGE_true:
    pl_emit_char 'B'
.Lldp24_012_UGE_done:
    brslt8 .Lldp24_012_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_SLT_done
.Lldp24_012_SLT_true:
    pl_emit_char 'B'
.Lldp24_012_SLT_done:
    brsge8 .Lldp24_012_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_012_SGE_done
.Lldp24_012_SGE_true:
    pl_emit_char 'B'
.Lldp24_012_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q0, q1, PSPEC=0x04.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1598
    push16 r4
    ldi16 r4, 0x16bb
    push16 r4
    ldi16 r4, 0x17de
    push16 r4
    ldi16 r4, 0x1901
    push16 r4
    ldi16 r4, 0x1a24
    push16 r4
    ldi16 r4, 0x1b47
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
    ldi16 r2, %lo16(.Lpl_normal_data + 14)
    ldi8 r3, %hi8(.Lpl_normal_data + 14)
    ldi16 r0, 0xb457
    ldi16 r1, 0xc5a3
    .byte 0xf0, 0x67, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_013_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_EQ_done
.Lldp24_013_EQ_true:
    pl_emit_char 'B'
.Lldp24_013_EQ_done:
    brne8 .Lldp24_013_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_NE_done
.Lldp24_013_NE_true:
    pl_emit_char 'B'
.Lldp24_013_NE_done:
    brult8 .Lldp24_013_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_ULT_done
.Lldp24_013_ULT_true:
    pl_emit_char 'B'
.Lldp24_013_ULT_done:
    bruge8 .Lldp24_013_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_UGE_done
.Lldp24_013_UGE_true:
    pl_emit_char 'B'
.Lldp24_013_UGE_done:
    brslt8 .Lldp24_013_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_SLT_done
.Lldp24_013_SLT_true:
    pl_emit_char 'B'
.Lldp24_013_SLT_done:
    brsge8 .Lldp24_013_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_013_SGE_done
.Lldp24_013_SGE_true:
    pl_emit_char 'B'
.Lldp24_013_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q2, q1, PSPEC=0x84.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x15d5
    push16 r4
    ldi16 r4, 0x16f8
    push16 r4
    ldi16 r4, 0x181b
    push16 r4
    ldi16 r4, 0x193e
    push16 r4
    ldi16 r4, 0x1a61
    push16 r4
    ldi16 r4, 0x1b84
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
    ldi16 r2, %lo16(.Lpl_normal_data + 19)
    ldi8 r3, %hi8(.Lpl_normal_data + 19)
    ldi16 r4, 0xb484
    ldi16 r5, 0xc5d4
    .byte 0xf0, 0x67, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_014_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_EQ_done
.Lldp24_014_EQ_true:
    pl_emit_char 'B'
.Lldp24_014_EQ_done:
    brne8 .Lldp24_014_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_NE_done
.Lldp24_014_NE_true:
    pl_emit_char 'B'
.Lldp24_014_NE_done:
    brult8 .Lldp24_014_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_ULT_done
.Lldp24_014_ULT_true:
    pl_emit_char 'B'
.Lldp24_014_ULT_done:
    bruge8 .Lldp24_014_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_UGE_done
.Lldp24_014_UGE_true:
    pl_emit_char 'B'
.Lldp24_014_UGE_done:
    brslt8 .Lldp24_014_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_SLT_done
.Lldp24_014_SLT_true:
    pl_emit_char 'B'
.Lldp24_014_SLT_done:
    brsge8 .Lldp24_014_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_014_SGE_done
.Lldp24_014_SGE_true:
    pl_emit_char 'B'
.Lldp24_014_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q3, q1, PSPEC=0xC4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1612
    push16 r4
    ldi16 r4, 0x1735
    push16 r4
    ldi16 r4, 0x1858
    push16 r4
    ldi16 r4, 0x197b
    push16 r4
    ldi16 r4, 0x1a9e
    push16 r4
    ldi16 r4, 0x1bc1
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
    ldi16 r2, %lo16(.Lpl_normal_data + 24)
    ldi8 r3, %hi8(.Lpl_normal_data + 24)
    ldi16 r6, 0xb4b1
    ldi16 r7, 0xc605
    .byte 0xf0, 0x67, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_015_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_EQ_done
.Lldp24_015_EQ_true:
    pl_emit_char 'B'
.Lldp24_015_EQ_done:
    brne8 .Lldp24_015_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_NE_done
.Lldp24_015_NE_true:
    pl_emit_char 'B'
.Lldp24_015_NE_done:
    brult8 .Lldp24_015_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_ULT_done
.Lldp24_015_ULT_true:
    pl_emit_char 'B'
.Lldp24_015_ULT_done:
    bruge8 .Lldp24_015_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_UGE_done
.Lldp24_015_UGE_true:
    pl_emit_char 'B'
.Lldp24_015_UGE_done:
    brslt8 .Lldp24_015_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_SLT_done
.Lldp24_015_SLT_true:
    pl_emit_char 'B'
.Lldp24_015_SLT_done:
    brsge8 .Lldp24_015_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_015_SGE_done
.Lldp24_015_SGE_true:
    pl_emit_char 'B'
.Lldp24_015_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q0, q2, PSPEC=0x08.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x164f
    push16 r4
    ldi16 r4, 0x1772
    push16 r4
    ldi16 r4, 0x1895
    push16 r4
    ldi16 r4, 0x19b8
    push16 r4
    ldi16 r4, 0x1adb
    push16 r4
    ldi16 r4, 0x1bfe
    push16 r4
    ldi16 r4, 0x1d21
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
    ldi16 r4, %lo16(.Lpl_normal_data + 29)
    ldi8 r5, %hi8(.Lpl_normal_data + 29)
    ldi16 r0, 0xb4de
    ldi16 r1, 0xc636
    .byte 0xf0, 0x67, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_016_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_EQ_done
.Lldp24_016_EQ_true:
    pl_emit_char 'B'
.Lldp24_016_EQ_done:
    brne8 .Lldp24_016_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_NE_done
.Lldp24_016_NE_true:
    pl_emit_char 'B'
.Lldp24_016_NE_done:
    brult8 .Lldp24_016_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_ULT_done
.Lldp24_016_ULT_true:
    pl_emit_char 'B'
.Lldp24_016_ULT_done:
    bruge8 .Lldp24_016_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_UGE_done
.Lldp24_016_UGE_true:
    pl_emit_char 'B'
.Lldp24_016_UGE_done:
    brslt8 .Lldp24_016_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_SLT_done
.Lldp24_016_SLT_true:
    pl_emit_char 'B'
.Lldp24_016_SLT_done:
    brsge8 .Lldp24_016_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_016_SGE_done
.Lldp24_016_SGE_true:
    pl_emit_char 'B'
.Lldp24_016_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q1, q2, PSPEC=0x48.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x168c
    push16 r4
    ldi16 r4, 0x17af
    push16 r4
    ldi16 r4, 0x18d2
    push16 r4
    ldi16 r4, 0x19f5
    push16 r4
    ldi16 r4, 0x1b18
    push16 r4
    ldi16 r4, 0x1c3b
    push16 r4
    ldi16 r4, 0x1d5e
    push16 r4
    ldi16 r4, 0x1e81
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r4, %lo16(.Lpl_normal_data + 4)
    ldi8 r5, %hi8(.Lpl_normal_data + 4)
    ldi16 r2, 0xb50b
    ldi16 r3, 0xc667
    .byte 0xf0, 0x67, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_017_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_EQ_done
.Lldp24_017_EQ_true:
    pl_emit_char 'B'
.Lldp24_017_EQ_done:
    brne8 .Lldp24_017_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_NE_done
.Lldp24_017_NE_true:
    pl_emit_char 'B'
.Lldp24_017_NE_done:
    brult8 .Lldp24_017_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_ULT_done
.Lldp24_017_ULT_true:
    pl_emit_char 'B'
.Lldp24_017_ULT_done:
    bruge8 .Lldp24_017_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_UGE_done
.Lldp24_017_UGE_true:
    pl_emit_char 'B'
.Lldp24_017_UGE_done:
    brslt8 .Lldp24_017_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_SLT_done
.Lldp24_017_SLT_true:
    pl_emit_char 'B'
.Lldp24_017_SLT_done:
    brsge8 .Lldp24_017_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_017_SGE_done
.Lldp24_017_SGE_true:
    pl_emit_char 'B'
.Lldp24_017_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q3, q2, PSPEC=0xC8.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x16c9
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
    ldi16 r4, 0x1d9b
    push16 r4
    ldi16 r4, 0x1ebe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r4, %lo16(.Lpl_normal_data + 9)
    ldi8 r5, %hi8(.Lpl_normal_data + 9)
    ldi16 r6, 0xb538
    ldi16 r7, 0xc698
    .byte 0xf0, 0x67, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_018_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_EQ_done
.Lldp24_018_EQ_true:
    pl_emit_char 'B'
.Lldp24_018_EQ_done:
    brne8 .Lldp24_018_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_NE_done
.Lldp24_018_NE_true:
    pl_emit_char 'B'
.Lldp24_018_NE_done:
    brult8 .Lldp24_018_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_ULT_done
.Lldp24_018_ULT_true:
    pl_emit_char 'B'
.Lldp24_018_ULT_done:
    bruge8 .Lldp24_018_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_UGE_done
.Lldp24_018_UGE_true:
    pl_emit_char 'B'
.Lldp24_018_UGE_done:
    brslt8 .Lldp24_018_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_SLT_done
.Lldp24_018_SLT_true:
    pl_emit_char 'B'
.Lldp24_018_SLT_done:
    brsge8 .Lldp24_018_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_018_SGE_done
.Lldp24_018_SGE_true:
    pl_emit_char 'B'
.Lldp24_018_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q0, q3, PSPEC=0x0C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1706
    push16 r4
    ldi16 r4, 0x1829
    push16 r4
    ldi16 r4, 0x194c
    push16 r4
    ldi16 r4, 0x1a6f
    push16 r4
    ldi16 r4, 0x1b92
    push16 r4
    ldi16 r4, 0x1cb5
    push16 r4
    ldi16 r4, 0x1dd8
    push16 r4
    ldi16 r4, 0x1efb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 14)
    ldi8 r7, %hi8(.Lpl_normal_data + 14)
    ldi16 r0, 0xb565
    ldi16 r1, 0xc6c9
    .byte 0xf0, 0x67, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_019_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_EQ_done
.Lldp24_019_EQ_true:
    pl_emit_char 'B'
.Lldp24_019_EQ_done:
    brne8 .Lldp24_019_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_NE_done
.Lldp24_019_NE_true:
    pl_emit_char 'B'
.Lldp24_019_NE_done:
    brult8 .Lldp24_019_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_ULT_done
.Lldp24_019_ULT_true:
    pl_emit_char 'B'
.Lldp24_019_ULT_done:
    bruge8 .Lldp24_019_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_UGE_done
.Lldp24_019_UGE_true:
    pl_emit_char 'B'
.Lldp24_019_UGE_done:
    brslt8 .Lldp24_019_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_SLT_done
.Lldp24_019_SLT_true:
    pl_emit_char 'B'
.Lldp24_019_SLT_done:
    brsge8 .Lldp24_019_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_019_SGE_done
.Lldp24_019_SGE_true:
    pl_emit_char 'B'
.Lldp24_019_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q1, q3, PSPEC=0x4C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1743
    push16 r4
    ldi16 r4, 0x1866
    push16 r4
    ldi16 r4, 0x1989
    push16 r4
    ldi16 r4, 0x1aac
    push16 r4
    ldi16 r4, 0x1bcf
    push16 r4
    ldi16 r4, 0x1cf2
    push16 r4
    ldi16 r4, 0x1e15
    push16 r4
    ldi16 r4, 0x1f38
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 19)
    ldi8 r7, %hi8(.Lpl_normal_data + 19)
    ldi16 r2, 0xb592
    ldi16 r3, 0xc6fa
    .byte 0xf0, 0x67, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_01a_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_EQ_done
.Lldp24_01a_EQ_true:
    pl_emit_char 'B'
.Lldp24_01a_EQ_done:
    brne8 .Lldp24_01a_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_NE_done
.Lldp24_01a_NE_true:
    pl_emit_char 'B'
.Lldp24_01a_NE_done:
    brult8 .Lldp24_01a_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_ULT_done
.Lldp24_01a_ULT_true:
    pl_emit_char 'B'
.Lldp24_01a_ULT_done:
    bruge8 .Lldp24_01a_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_UGE_done
.Lldp24_01a_UGE_true:
    pl_emit_char 'B'
.Lldp24_01a_UGE_done:
    brslt8 .Lldp24_01a_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_SLT_done
.Lldp24_01a_SLT_true:
    pl_emit_char 'B'
.Lldp24_01a_SLT_done:
    brsge8 .Lldp24_01a_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01a_SGE_done
.Lldp24_01a_SGE_true:
    pl_emit_char 'B'
.Lldp24_01a_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement, q2, q3, PSPEC=0x8C.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1ae9
    push16 r4
    ldi16 r4, 0x1c0c
    push16 r4
    ldi16 r4, 0x1d2f
    push16 r4
    ldi16 r4, 0x1e52
    push16 r4
    ldi16 r4, 0x1f75
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 24)
    ldi8 r7, %hi8(.Lpl_normal_data + 24)
    ldi16 r4, 0xb5bf
    ldi16 r5, 0xc72b
    .byte 0xf0, 0x67, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_01b_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_EQ_done
.Lldp24_01b_EQ_true:
    pl_emit_char 'B'
.Lldp24_01b_EQ_done:
    brne8 .Lldp24_01b_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_NE_done
.Lldp24_01b_NE_true:
    pl_emit_char 'B'
.Lldp24_01b_NE_done:
    brult8 .Lldp24_01b_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_ULT_done
.Lldp24_01b_ULT_true:
    pl_emit_char 'B'
.Lldp24_01b_ULT_done:
    bruge8 .Lldp24_01b_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_UGE_done
.Lldp24_01b_UGE_true:
    pl_emit_char 'B'
.Lldp24_01b_UGE_done:
    brslt8 .Lldp24_01b_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_SLT_done
.Lldp24_01b_SLT_true:
    pl_emit_char 'B'
.Lldp24_01b_SLT_done:
    brsge8 .Lldp24_01b_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_01b_SGE_done
.Lldp24_01b_SGE_true:
    pl_emit_char 'B'
.Lldp24_01b_SGE_done:
    pl_emit_char '\n'

    ; ldp24: ordinary boundary load beginning at 0x00FFFF.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xda91
    push16 r4
    ldi16 r4, 0xdbb4
    push16 r4
    ldi16 r4, 0xdcd7
    push16 r4
    ldi16 r4, 0xddfa
    push16 r4
    ldi16 r4, 0xdf1d
    push16 r4
    ldi16 r4, 0xe040
    push16 r4
    ldi16 r4, 0xe163
    push16 r4
    ldi16 r4, 0xe286
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_boundary_data)
    ldi8 r7, %hi8(.Lpl_boundary_data)
    ldi16 r0, 0xa55a
    ldi16 r1, 0xc33c
    .byte 0xf0, 0x63, 0x0c ; TEST_BOUNDARY
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_boundary_0_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_EQ_done
.Lldp24_boundary_0_EQ_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_EQ_done:
    brne8 .Lldp24_boundary_0_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_NE_done
.Lldp24_boundary_0_NE_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_NE_done:
    brult8 .Lldp24_boundary_0_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_ULT_done
.Lldp24_boundary_0_ULT_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_ULT_done:
    bruge8 .Lldp24_boundary_0_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_UGE_done
.Lldp24_boundary_0_UGE_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_UGE_done:
    brslt8 .Lldp24_boundary_0_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_SLT_done
.Lldp24_boundary_0_SLT_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_SLT_done:
    brsge8 .Lldp24_boundary_0_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_0_SGE_done
.Lldp24_boundary_0_SGE_true:
    pl_emit_char 'B'
.Lldp24_boundary_0_SGE_done:
    pl_emit_char '\n'

    ; ldp24: postincrement boundary load beginning at 0x00FFFF.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdace
    push16 r4
    ldi16 r4, 0xdbf1
    push16 r4
    ldi16 r4, 0xdd14
    push16 r4
    ldi16 r4, 0xde37
    push16 r4
    ldi16 r4, 0xdf5a
    push16 r4
    ldi16 r4, 0xe07d
    push16 r4
    ldi16 r4, 0xe1a0
    push16 r4
    ldi16 r4, 0xe2c3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_boundary_data)
    ldi8 r7, %hi8(.Lpl_boundary_data)
    ldi16 r0, 0xa55a
    ldi16 r1, 0xc33c
    .byte 0xf0, 0x67, 0x0c ; TEST_BOUNDARY
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    pop16 r0
    call pl_print_r0_line
    breq8 .Lldp24_boundary_1_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_EQ_done
.Lldp24_boundary_1_EQ_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_EQ_done:
    brne8 .Lldp24_boundary_1_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_NE_done
.Lldp24_boundary_1_NE_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_NE_done:
    brult8 .Lldp24_boundary_1_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_ULT_done
.Lldp24_boundary_1_ULT_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_ULT_done:
    bruge8 .Lldp24_boundary_1_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_UGE_done
.Lldp24_boundary_1_UGE_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_UGE_done:
    brslt8 .Lldp24_boundary_1_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_SLT_done
.Lldp24_boundary_1_SLT_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_SLT_done:
    brsge8 .Lldp24_boundary_1_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp24_boundary_1_SGE_done
.Lldp24_boundary_1_SGE_true:
    pl_emit_char 'B'
.Lldp24_boundary_1_SGE_done:
    pl_emit_char '\n'

    sys debug_break

.section .avm.metadata,"",@progbits

ldp24_reserved_postincrement_overlap_encodings:
    .byte 0xf0, 0x67, 0x00
    .byte 0xf0, 0x67, 0x44
    .byte 0xf0, 0x67, 0x88
    .byte 0xf0, 0x67, 0xcc
