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

    ; ldp16: ordinary, r0, q0, PSPEC=0x00.
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
    ldi16 r0, %lo16(.Lpl_normal_data + 6)
    ldi8 r1, %hi8(.Lpl_normal_data + 6)
    .byte 0xf0, 0x62, 0x00 ; TEST
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
    breq8 .Lldp16_000_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_EQ_done
.Lldp16_000_EQ_true:
    pl_emit_char 'B'
.Lldp16_000_EQ_done:
    brne8 .Lldp16_000_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_NE_done
.Lldp16_000_NE_true:
    pl_emit_char 'B'
.Lldp16_000_NE_done:
    brult8 .Lldp16_000_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_ULT_done
.Lldp16_000_ULT_true:
    pl_emit_char 'B'
.Lldp16_000_ULT_done:
    bruge8 .Lldp16_000_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_UGE_done
.Lldp16_000_UGE_true:
    pl_emit_char 'B'
.Lldp16_000_UGE_done:
    brslt8 .Lldp16_000_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_SLT_done
.Lldp16_000_SLT_true:
    pl_emit_char 'B'
.Lldp16_000_SLT_done:
    brsge8 .Lldp16_000_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_000_SGE_done
.Lldp16_000_SGE_true:
    pl_emit_char 'B'
.Lldp16_000_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r1, q0, PSPEC=0x20.
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
    ldi16 r0, %lo16(.Lpl_normal_data + 11)
    ldi8 r1, %hi8(.Lpl_normal_data + 11)
    .byte 0xf0, 0x62, 0x20 ; TEST
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
    breq8 .Lldp16_001_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_EQ_done
.Lldp16_001_EQ_true:
    pl_emit_char 'B'
.Lldp16_001_EQ_done:
    brne8 .Lldp16_001_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_NE_done
.Lldp16_001_NE_true:
    pl_emit_char 'B'
.Lldp16_001_NE_done:
    brult8 .Lldp16_001_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_ULT_done
.Lldp16_001_ULT_true:
    pl_emit_char 'B'
.Lldp16_001_ULT_done:
    bruge8 .Lldp16_001_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_UGE_done
.Lldp16_001_UGE_true:
    pl_emit_char 'B'
.Lldp16_001_UGE_done:
    brslt8 .Lldp16_001_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_SLT_done
.Lldp16_001_SLT_true:
    pl_emit_char 'B'
.Lldp16_001_SLT_done:
    brsge8 .Lldp16_001_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_001_SGE_done
.Lldp16_001_SGE_true:
    pl_emit_char 'B'
.Lldp16_001_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r2, q0, PSPEC=0x40.
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
    ldi16 r0, %lo16(.Lpl_normal_data + 16)
    ldi8 r1, %hi8(.Lpl_normal_data + 16)
    .byte 0xf0, 0x62, 0x40 ; TEST
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
    breq8 .Lldp16_002_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_EQ_done
.Lldp16_002_EQ_true:
    pl_emit_char 'B'
.Lldp16_002_EQ_done:
    brne8 .Lldp16_002_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_NE_done
.Lldp16_002_NE_true:
    pl_emit_char 'B'
.Lldp16_002_NE_done:
    brult8 .Lldp16_002_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_ULT_done
.Lldp16_002_ULT_true:
    pl_emit_char 'B'
.Lldp16_002_ULT_done:
    bruge8 .Lldp16_002_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_UGE_done
.Lldp16_002_UGE_true:
    pl_emit_char 'B'
.Lldp16_002_UGE_done:
    brslt8 .Lldp16_002_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_SLT_done
.Lldp16_002_SLT_true:
    pl_emit_char 'B'
.Lldp16_002_SLT_done:
    brsge8 .Lldp16_002_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_002_SGE_done
.Lldp16_002_SGE_true:
    pl_emit_char 'B'
.Lldp16_002_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r3, q0, PSPEC=0x60.
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
    ldi16 r0, %lo16(.Lpl_normal_data + 21)
    ldi8 r1, %hi8(.Lpl_normal_data + 21)
    .byte 0xf0, 0x62, 0x60 ; TEST
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
    breq8 .Lldp16_003_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_EQ_done
.Lldp16_003_EQ_true:
    pl_emit_char 'B'
.Lldp16_003_EQ_done:
    brne8 .Lldp16_003_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_NE_done
.Lldp16_003_NE_true:
    pl_emit_char 'B'
.Lldp16_003_NE_done:
    brult8 .Lldp16_003_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_ULT_done
.Lldp16_003_ULT_true:
    pl_emit_char 'B'
.Lldp16_003_ULT_done:
    bruge8 .Lldp16_003_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_UGE_done
.Lldp16_003_UGE_true:
    pl_emit_char 'B'
.Lldp16_003_UGE_done:
    brslt8 .Lldp16_003_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_SLT_done
.Lldp16_003_SLT_true:
    pl_emit_char 'B'
.Lldp16_003_SLT_done:
    brsge8 .Lldp16_003_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_003_SGE_done
.Lldp16_003_SGE_true:
    pl_emit_char 'B'
.Lldp16_003_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r4, q0, PSPEC=0x80.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
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
    ldi16 r0, %lo16(.Lpl_normal_data + 26)
    ldi8 r1, %hi8(.Lpl_normal_data + 26)
    .byte 0xf0, 0x62, 0x80 ; TEST
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
    breq8 .Lldp16_004_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_EQ_done
.Lldp16_004_EQ_true:
    pl_emit_char 'B'
.Lldp16_004_EQ_done:
    brne8 .Lldp16_004_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_NE_done
.Lldp16_004_NE_true:
    pl_emit_char 'B'
.Lldp16_004_NE_done:
    brult8 .Lldp16_004_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_ULT_done
.Lldp16_004_ULT_true:
    pl_emit_char 'B'
.Lldp16_004_ULT_done:
    bruge8 .Lldp16_004_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_UGE_done
.Lldp16_004_UGE_true:
    pl_emit_char 'B'
.Lldp16_004_UGE_done:
    brslt8 .Lldp16_004_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_SLT_done
.Lldp16_004_SLT_true:
    pl_emit_char 'B'
.Lldp16_004_SLT_done:
    brsge8 .Lldp16_004_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_004_SGE_done
.Lldp16_004_SGE_true:
    pl_emit_char 'B'
.Lldp16_004_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r5, q0, PSPEC=0xA0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
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
    ldi16 r0, %lo16(.Lpl_normal_data)
    ldi8 r1, %hi8(.Lpl_normal_data)
    .byte 0xf0, 0x62, 0xa0 ; TEST
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
    breq8 .Lldp16_005_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_EQ_done
.Lldp16_005_EQ_true:
    pl_emit_char 'B'
.Lldp16_005_EQ_done:
    brne8 .Lldp16_005_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_NE_done
.Lldp16_005_NE_true:
    pl_emit_char 'B'
.Lldp16_005_NE_done:
    brult8 .Lldp16_005_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_ULT_done
.Lldp16_005_ULT_true:
    pl_emit_char 'B'
.Lldp16_005_ULT_done:
    bruge8 .Lldp16_005_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_UGE_done
.Lldp16_005_UGE_true:
    pl_emit_char 'B'
.Lldp16_005_UGE_done:
    brslt8 .Lldp16_005_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_SLT_done
.Lldp16_005_SLT_true:
    pl_emit_char 'B'
.Lldp16_005_SLT_done:
    brsge8 .Lldp16_005_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_005_SGE_done
.Lldp16_005_SGE_true:
    pl_emit_char 'B'
.Lldp16_005_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r6, q0, PSPEC=0xC0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
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
    ldi16 r0, %lo16(.Lpl_normal_data + 5)
    ldi8 r1, %hi8(.Lpl_normal_data + 5)
    .byte 0xf0, 0x62, 0xc0 ; TEST
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
    breq8 .Lldp16_006_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_EQ_done
.Lldp16_006_EQ_true:
    pl_emit_char 'B'
.Lldp16_006_EQ_done:
    brne8 .Lldp16_006_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_NE_done
.Lldp16_006_NE_true:
    pl_emit_char 'B'
.Lldp16_006_NE_done:
    brult8 .Lldp16_006_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_ULT_done
.Lldp16_006_ULT_true:
    pl_emit_char 'B'
.Lldp16_006_ULT_done:
    bruge8 .Lldp16_006_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_UGE_done
.Lldp16_006_UGE_true:
    pl_emit_char 'B'
.Lldp16_006_UGE_done:
    brslt8 .Lldp16_006_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_SLT_done
.Lldp16_006_SLT_true:
    pl_emit_char 'B'
.Lldp16_006_SLT_done:
    brsge8 .Lldp16_006_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_006_SGE_done
.Lldp16_006_SGE_true:
    pl_emit_char 'B'
.Lldp16_006_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r7, q0, PSPEC=0xE0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
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
    ldi16 r0, %lo16(.Lpl_normal_data + 10)
    ldi8 r1, %hi8(.Lpl_normal_data + 10)
    .byte 0xf0, 0x62, 0xe0 ; TEST
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
    breq8 .Lldp16_007_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_EQ_done
.Lldp16_007_EQ_true:
    pl_emit_char 'B'
.Lldp16_007_EQ_done:
    brne8 .Lldp16_007_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_NE_done
.Lldp16_007_NE_true:
    pl_emit_char 'B'
.Lldp16_007_NE_done:
    brult8 .Lldp16_007_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_ULT_done
.Lldp16_007_ULT_true:
    pl_emit_char 'B'
.Lldp16_007_ULT_done:
    bruge8 .Lldp16_007_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_UGE_done
.Lldp16_007_UGE_true:
    pl_emit_char 'B'
.Lldp16_007_UGE_done:
    brslt8 .Lldp16_007_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_SLT_done
.Lldp16_007_SLT_true:
    pl_emit_char 'B'
.Lldp16_007_SLT_done:
    brsge8 .Lldp16_007_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_007_SGE_done
.Lldp16_007_SGE_true:
    pl_emit_char 'B'
.Lldp16_007_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r0, q1, PSPEC=0x04.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r2, %lo16(.Lpl_normal_data + 15)
    ldi8 r3, %hi8(.Lpl_normal_data + 15)
    .byte 0xf0, 0x62, 0x04 ; TEST
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
    breq8 .Lldp16_008_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_EQ_done
.Lldp16_008_EQ_true:
    pl_emit_char 'B'
.Lldp16_008_EQ_done:
    brne8 .Lldp16_008_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_NE_done
.Lldp16_008_NE_true:
    pl_emit_char 'B'
.Lldp16_008_NE_done:
    brult8 .Lldp16_008_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_ULT_done
.Lldp16_008_ULT_true:
    pl_emit_char 'B'
.Lldp16_008_ULT_done:
    bruge8 .Lldp16_008_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_UGE_done
.Lldp16_008_UGE_true:
    pl_emit_char 'B'
.Lldp16_008_UGE_done:
    brslt8 .Lldp16_008_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_SLT_done
.Lldp16_008_SLT_true:
    pl_emit_char 'B'
.Lldp16_008_SLT_done:
    brsge8 .Lldp16_008_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_008_SGE_done
.Lldp16_008_SGE_true:
    pl_emit_char 'B'
.Lldp16_008_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r1, q1, PSPEC=0x24.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r2, %lo16(.Lpl_normal_data + 20)
    ldi8 r3, %hi8(.Lpl_normal_data + 20)
    .byte 0xf0, 0x62, 0x24 ; TEST
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
    breq8 .Lldp16_009_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_EQ_done
.Lldp16_009_EQ_true:
    pl_emit_char 'B'
.Lldp16_009_EQ_done:
    brne8 .Lldp16_009_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_NE_done
.Lldp16_009_NE_true:
    pl_emit_char 'B'
.Lldp16_009_NE_done:
    brult8 .Lldp16_009_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_ULT_done
.Lldp16_009_ULT_true:
    pl_emit_char 'B'
.Lldp16_009_ULT_done:
    bruge8 .Lldp16_009_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_UGE_done
.Lldp16_009_UGE_true:
    pl_emit_char 'B'
.Lldp16_009_UGE_done:
    brslt8 .Lldp16_009_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_SLT_done
.Lldp16_009_SLT_true:
    pl_emit_char 'B'
.Lldp16_009_SLT_done:
    brsge8 .Lldp16_009_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_009_SGE_done
.Lldp16_009_SGE_true:
    pl_emit_char 'B'
.Lldp16_009_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r2, q1, PSPEC=0x44.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r2, %lo16(.Lpl_normal_data + 25)
    ldi8 r3, %hi8(.Lpl_normal_data + 25)
    .byte 0xf0, 0x62, 0x44 ; TEST
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
    breq8 .Lldp16_00a_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_EQ_done
.Lldp16_00a_EQ_true:
    pl_emit_char 'B'
.Lldp16_00a_EQ_done:
    brne8 .Lldp16_00a_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_NE_done
.Lldp16_00a_NE_true:
    pl_emit_char 'B'
.Lldp16_00a_NE_done:
    brult8 .Lldp16_00a_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_ULT_done
.Lldp16_00a_ULT_true:
    pl_emit_char 'B'
.Lldp16_00a_ULT_done:
    bruge8 .Lldp16_00a_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_UGE_done
.Lldp16_00a_UGE_true:
    pl_emit_char 'B'
.Lldp16_00a_UGE_done:
    brslt8 .Lldp16_00a_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_SLT_done
.Lldp16_00a_SLT_true:
    pl_emit_char 'B'
.Lldp16_00a_SLT_done:
    brsge8 .Lldp16_00a_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00a_SGE_done
.Lldp16_00a_SGE_true:
    pl_emit_char 'B'
.Lldp16_00a_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r3, q1, PSPEC=0x64.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r2, %lo16(.Lpl_normal_data + 30)
    ldi8 r3, %hi8(.Lpl_normal_data + 30)
    .byte 0xf0, 0x62, 0x64 ; TEST
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
    breq8 .Lldp16_00b_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_EQ_done
.Lldp16_00b_EQ_true:
    pl_emit_char 'B'
.Lldp16_00b_EQ_done:
    brne8 .Lldp16_00b_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_NE_done
.Lldp16_00b_NE_true:
    pl_emit_char 'B'
.Lldp16_00b_NE_done:
    brult8 .Lldp16_00b_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_ULT_done
.Lldp16_00b_ULT_true:
    pl_emit_char 'B'
.Lldp16_00b_ULT_done:
    bruge8 .Lldp16_00b_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_UGE_done
.Lldp16_00b_UGE_true:
    pl_emit_char 'B'
.Lldp16_00b_UGE_done:
    brslt8 .Lldp16_00b_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_SLT_done
.Lldp16_00b_SLT_true:
    pl_emit_char 'B'
.Lldp16_00b_SLT_done:
    brsge8 .Lldp16_00b_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00b_SGE_done
.Lldp16_00b_SGE_true:
    pl_emit_char 'B'
.Lldp16_00b_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r4, q1, PSPEC=0x84.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r2, %lo16(.Lpl_normal_data + 4)
    ldi8 r3, %hi8(.Lpl_normal_data + 4)
    .byte 0xf0, 0x62, 0x84 ; TEST
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
    breq8 .Lldp16_00c_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_EQ_done
.Lldp16_00c_EQ_true:
    pl_emit_char 'B'
.Lldp16_00c_EQ_done:
    brne8 .Lldp16_00c_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_NE_done
.Lldp16_00c_NE_true:
    pl_emit_char 'B'
.Lldp16_00c_NE_done:
    brult8 .Lldp16_00c_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_ULT_done
.Lldp16_00c_ULT_true:
    pl_emit_char 'B'
.Lldp16_00c_ULT_done:
    bruge8 .Lldp16_00c_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_UGE_done
.Lldp16_00c_UGE_true:
    pl_emit_char 'B'
.Lldp16_00c_UGE_done:
    brslt8 .Lldp16_00c_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_SLT_done
.Lldp16_00c_SLT_true:
    pl_emit_char 'B'
.Lldp16_00c_SLT_done:
    brsge8 .Lldp16_00c_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00c_SGE_done
.Lldp16_00c_SGE_true:
    pl_emit_char 'B'
.Lldp16_00c_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r5, q1, PSPEC=0xA4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r2, %lo16(.Lpl_normal_data + 9)
    ldi8 r3, %hi8(.Lpl_normal_data + 9)
    .byte 0xf0, 0x62, 0xa4 ; TEST
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
    breq8 .Lldp16_00d_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_EQ_done
.Lldp16_00d_EQ_true:
    pl_emit_char 'B'
.Lldp16_00d_EQ_done:
    brne8 .Lldp16_00d_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_NE_done
.Lldp16_00d_NE_true:
    pl_emit_char 'B'
.Lldp16_00d_NE_done:
    brult8 .Lldp16_00d_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_ULT_done
.Lldp16_00d_ULT_true:
    pl_emit_char 'B'
.Lldp16_00d_ULT_done:
    bruge8 .Lldp16_00d_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_UGE_done
.Lldp16_00d_UGE_true:
    pl_emit_char 'B'
.Lldp16_00d_UGE_done:
    brslt8 .Lldp16_00d_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_SLT_done
.Lldp16_00d_SLT_true:
    pl_emit_char 'B'
.Lldp16_00d_SLT_done:
    brsge8 .Lldp16_00d_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00d_SGE_done
.Lldp16_00d_SGE_true:
    pl_emit_char 'B'
.Lldp16_00d_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r6, q1, PSPEC=0xC4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r2, %lo16(.Lpl_normal_data + 14)
    ldi8 r3, %hi8(.Lpl_normal_data + 14)
    .byte 0xf0, 0x62, 0xc4 ; TEST
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
    breq8 .Lldp16_00e_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_EQ_done
.Lldp16_00e_EQ_true:
    pl_emit_char 'B'
.Lldp16_00e_EQ_done:
    brne8 .Lldp16_00e_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_NE_done
.Lldp16_00e_NE_true:
    pl_emit_char 'B'
.Lldp16_00e_NE_done:
    brult8 .Lldp16_00e_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_ULT_done
.Lldp16_00e_ULT_true:
    pl_emit_char 'B'
.Lldp16_00e_ULT_done:
    bruge8 .Lldp16_00e_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_UGE_done
.Lldp16_00e_UGE_true:
    pl_emit_char 'B'
.Lldp16_00e_UGE_done:
    brslt8 .Lldp16_00e_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_SLT_done
.Lldp16_00e_SLT_true:
    pl_emit_char 'B'
.Lldp16_00e_SLT_done:
    brsge8 .Lldp16_00e_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00e_SGE_done
.Lldp16_00e_SGE_true:
    pl_emit_char 'B'
.Lldp16_00e_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r7, q1, PSPEC=0xE4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r2, %lo16(.Lpl_normal_data + 19)
    ldi8 r3, %hi8(.Lpl_normal_data + 19)
    .byte 0xf0, 0x62, 0xe4 ; TEST
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
    breq8 .Lldp16_00f_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_EQ_done
.Lldp16_00f_EQ_true:
    pl_emit_char 'B'
.Lldp16_00f_EQ_done:
    brne8 .Lldp16_00f_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_NE_done
.Lldp16_00f_NE_true:
    pl_emit_char 'B'
.Lldp16_00f_NE_done:
    brult8 .Lldp16_00f_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_ULT_done
.Lldp16_00f_ULT_true:
    pl_emit_char 'B'
.Lldp16_00f_ULT_done:
    bruge8 .Lldp16_00f_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_UGE_done
.Lldp16_00f_UGE_true:
    pl_emit_char 'B'
.Lldp16_00f_UGE_done:
    brslt8 .Lldp16_00f_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_SLT_done
.Lldp16_00f_SLT_true:
    pl_emit_char 'B'
.Lldp16_00f_SLT_done:
    brsge8 .Lldp16_00f_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_00f_SGE_done
.Lldp16_00f_SGE_true:
    pl_emit_char 'B'
.Lldp16_00f_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r0, q2, PSPEC=0x08.
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
    ldi16 r4, %lo16(.Lpl_normal_data + 24)
    ldi8 r5, %hi8(.Lpl_normal_data + 24)
    .byte 0xf0, 0x62, 0x08 ; TEST
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
    breq8 .Lldp16_010_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_EQ_done
.Lldp16_010_EQ_true:
    pl_emit_char 'B'
.Lldp16_010_EQ_done:
    brne8 .Lldp16_010_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_NE_done
.Lldp16_010_NE_true:
    pl_emit_char 'B'
.Lldp16_010_NE_done:
    brult8 .Lldp16_010_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_ULT_done
.Lldp16_010_ULT_true:
    pl_emit_char 'B'
.Lldp16_010_ULT_done:
    bruge8 .Lldp16_010_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_UGE_done
.Lldp16_010_UGE_true:
    pl_emit_char 'B'
.Lldp16_010_UGE_done:
    brslt8 .Lldp16_010_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_SLT_done
.Lldp16_010_SLT_true:
    pl_emit_char 'B'
.Lldp16_010_SLT_done:
    brsge8 .Lldp16_010_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_010_SGE_done
.Lldp16_010_SGE_true:
    pl_emit_char 'B'
.Lldp16_010_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r1, q2, PSPEC=0x28.
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
    ldi16 r4, %lo16(.Lpl_normal_data + 29)
    ldi8 r5, %hi8(.Lpl_normal_data + 29)
    .byte 0xf0, 0x62, 0x28 ; TEST
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
    breq8 .Lldp16_011_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_EQ_done
.Lldp16_011_EQ_true:
    pl_emit_char 'B'
.Lldp16_011_EQ_done:
    brne8 .Lldp16_011_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_NE_done
.Lldp16_011_NE_true:
    pl_emit_char 'B'
.Lldp16_011_NE_done:
    brult8 .Lldp16_011_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_ULT_done
.Lldp16_011_ULT_true:
    pl_emit_char 'B'
.Lldp16_011_ULT_done:
    bruge8 .Lldp16_011_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_UGE_done
.Lldp16_011_UGE_true:
    pl_emit_char 'B'
.Lldp16_011_UGE_done:
    brslt8 .Lldp16_011_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_SLT_done
.Lldp16_011_SLT_true:
    pl_emit_char 'B'
.Lldp16_011_SLT_done:
    brsge8 .Lldp16_011_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_011_SGE_done
.Lldp16_011_SGE_true:
    pl_emit_char 'B'
.Lldp16_011_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r2, q2, PSPEC=0x48.
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
    ldi16 r4, %lo16(.Lpl_normal_data + 3)
    ldi8 r5, %hi8(.Lpl_normal_data + 3)
    .byte 0xf0, 0x62, 0x48 ; TEST
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
    breq8 .Lldp16_012_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_EQ_done
.Lldp16_012_EQ_true:
    pl_emit_char 'B'
.Lldp16_012_EQ_done:
    brne8 .Lldp16_012_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_NE_done
.Lldp16_012_NE_true:
    pl_emit_char 'B'
.Lldp16_012_NE_done:
    brult8 .Lldp16_012_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_ULT_done
.Lldp16_012_ULT_true:
    pl_emit_char 'B'
.Lldp16_012_ULT_done:
    bruge8 .Lldp16_012_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_UGE_done
.Lldp16_012_UGE_true:
    pl_emit_char 'B'
.Lldp16_012_UGE_done:
    brslt8 .Lldp16_012_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_SLT_done
.Lldp16_012_SLT_true:
    pl_emit_char 'B'
.Lldp16_012_SLT_done:
    brsge8 .Lldp16_012_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_012_SGE_done
.Lldp16_012_SGE_true:
    pl_emit_char 'B'
.Lldp16_012_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r3, q2, PSPEC=0x68.
    ldi16 r4, 0x0900
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
    ldi16 r4, %lo16(.Lpl_normal_data + 8)
    ldi8 r5, %hi8(.Lpl_normal_data + 8)
    .byte 0xf0, 0x62, 0x68 ; TEST
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
    breq8 .Lldp16_013_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_EQ_done
.Lldp16_013_EQ_true:
    pl_emit_char 'B'
.Lldp16_013_EQ_done:
    brne8 .Lldp16_013_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_NE_done
.Lldp16_013_NE_true:
    pl_emit_char 'B'
.Lldp16_013_NE_done:
    brult8 .Lldp16_013_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_ULT_done
.Lldp16_013_ULT_true:
    pl_emit_char 'B'
.Lldp16_013_ULT_done:
    bruge8 .Lldp16_013_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_UGE_done
.Lldp16_013_UGE_true:
    pl_emit_char 'B'
.Lldp16_013_UGE_done:
    brslt8 .Lldp16_013_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_SLT_done
.Lldp16_013_SLT_true:
    pl_emit_char 'B'
.Lldp16_013_SLT_done:
    brsge8 .Lldp16_013_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_013_SGE_done
.Lldp16_013_SGE_true:
    pl_emit_char 'B'
.Lldp16_013_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r4, q2, PSPEC=0x88.
    ldi16 r4, 0x0900
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
    ldi16 r4, %lo16(.Lpl_normal_data + 13)
    ldi8 r5, %hi8(.Lpl_normal_data + 13)
    .byte 0xf0, 0x62, 0x88 ; TEST
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
    breq8 .Lldp16_014_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_EQ_done
.Lldp16_014_EQ_true:
    pl_emit_char 'B'
.Lldp16_014_EQ_done:
    brne8 .Lldp16_014_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_NE_done
.Lldp16_014_NE_true:
    pl_emit_char 'B'
.Lldp16_014_NE_done:
    brult8 .Lldp16_014_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_ULT_done
.Lldp16_014_ULT_true:
    pl_emit_char 'B'
.Lldp16_014_ULT_done:
    bruge8 .Lldp16_014_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_UGE_done
.Lldp16_014_UGE_true:
    pl_emit_char 'B'
.Lldp16_014_UGE_done:
    brslt8 .Lldp16_014_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_SLT_done
.Lldp16_014_SLT_true:
    pl_emit_char 'B'
.Lldp16_014_SLT_done:
    brsge8 .Lldp16_014_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_014_SGE_done
.Lldp16_014_SGE_true:
    pl_emit_char 'B'
.Lldp16_014_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r5, q2, PSPEC=0xA8.
    ldi16 r4, 0x0900
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
    ldi16 r4, %lo16(.Lpl_normal_data + 18)
    ldi8 r5, %hi8(.Lpl_normal_data + 18)
    .byte 0xf0, 0x62, 0xa8 ; TEST
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
    breq8 .Lldp16_015_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_EQ_done
.Lldp16_015_EQ_true:
    pl_emit_char 'B'
.Lldp16_015_EQ_done:
    brne8 .Lldp16_015_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_NE_done
.Lldp16_015_NE_true:
    pl_emit_char 'B'
.Lldp16_015_NE_done:
    brult8 .Lldp16_015_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_ULT_done
.Lldp16_015_ULT_true:
    pl_emit_char 'B'
.Lldp16_015_ULT_done:
    bruge8 .Lldp16_015_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_UGE_done
.Lldp16_015_UGE_true:
    pl_emit_char 'B'
.Lldp16_015_UGE_done:
    brslt8 .Lldp16_015_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_SLT_done
.Lldp16_015_SLT_true:
    pl_emit_char 'B'
.Lldp16_015_SLT_done:
    brsge8 .Lldp16_015_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_015_SGE_done
.Lldp16_015_SGE_true:
    pl_emit_char 'B'
.Lldp16_015_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r6, q2, PSPEC=0xC8.
    ldi16 r4, 0x0900
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
    ldi16 r4, %lo16(.Lpl_normal_data + 23)
    ldi8 r5, %hi8(.Lpl_normal_data + 23)
    .byte 0xf0, 0x62, 0xc8 ; TEST
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
    breq8 .Lldp16_016_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_EQ_done
.Lldp16_016_EQ_true:
    pl_emit_char 'B'
.Lldp16_016_EQ_done:
    brne8 .Lldp16_016_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_NE_done
.Lldp16_016_NE_true:
    pl_emit_char 'B'
.Lldp16_016_NE_done:
    brult8 .Lldp16_016_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_ULT_done
.Lldp16_016_ULT_true:
    pl_emit_char 'B'
.Lldp16_016_ULT_done:
    bruge8 .Lldp16_016_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_UGE_done
.Lldp16_016_UGE_true:
    pl_emit_char 'B'
.Lldp16_016_UGE_done:
    brslt8 .Lldp16_016_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_SLT_done
.Lldp16_016_SLT_true:
    pl_emit_char 'B'
.Lldp16_016_SLT_done:
    brsge8 .Lldp16_016_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_016_SGE_done
.Lldp16_016_SGE_true:
    pl_emit_char 'B'
.Lldp16_016_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r7, q2, PSPEC=0xE8.
    ldi16 r4, 0x0900
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
    ldi16 r4, %lo16(.Lpl_normal_data + 28)
    ldi8 r5, %hi8(.Lpl_normal_data + 28)
    .byte 0xf0, 0x62, 0xe8 ; TEST
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
    breq8 .Lldp16_017_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_EQ_done
.Lldp16_017_EQ_true:
    pl_emit_char 'B'
.Lldp16_017_EQ_done:
    brne8 .Lldp16_017_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_NE_done
.Lldp16_017_NE_true:
    pl_emit_char 'B'
.Lldp16_017_NE_done:
    brult8 .Lldp16_017_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_ULT_done
.Lldp16_017_ULT_true:
    pl_emit_char 'B'
.Lldp16_017_ULT_done:
    bruge8 .Lldp16_017_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_UGE_done
.Lldp16_017_UGE_true:
    pl_emit_char 'B'
.Lldp16_017_UGE_done:
    brslt8 .Lldp16_017_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_SLT_done
.Lldp16_017_SLT_true:
    pl_emit_char 'B'
.Lldp16_017_SLT_done:
    brsge8 .Lldp16_017_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_017_SGE_done
.Lldp16_017_SGE_true:
    pl_emit_char 'B'
.Lldp16_017_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r0, q3, PSPEC=0x0C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r6, %lo16(.Lpl_normal_data + 2)
    ldi8 r7, %hi8(.Lpl_normal_data + 2)
    .byte 0xf0, 0x62, 0x0c ; TEST
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
    breq8 .Lldp16_018_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_EQ_done
.Lldp16_018_EQ_true:
    pl_emit_char 'B'
.Lldp16_018_EQ_done:
    brne8 .Lldp16_018_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_NE_done
.Lldp16_018_NE_true:
    pl_emit_char 'B'
.Lldp16_018_NE_done:
    brult8 .Lldp16_018_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_ULT_done
.Lldp16_018_ULT_true:
    pl_emit_char 'B'
.Lldp16_018_ULT_done:
    bruge8 .Lldp16_018_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_UGE_done
.Lldp16_018_UGE_true:
    pl_emit_char 'B'
.Lldp16_018_UGE_done:
    brslt8 .Lldp16_018_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_SLT_done
.Lldp16_018_SLT_true:
    pl_emit_char 'B'
.Lldp16_018_SLT_done:
    brsge8 .Lldp16_018_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_018_SGE_done
.Lldp16_018_SGE_true:
    pl_emit_char 'B'
.Lldp16_018_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r1, q3, PSPEC=0x2C.
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
    ldi16 r6, %lo16(.Lpl_normal_data + 7)
    ldi8 r7, %hi8(.Lpl_normal_data + 7)
    .byte 0xf0, 0x62, 0x2c ; TEST
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
    breq8 .Lldp16_019_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_EQ_done
.Lldp16_019_EQ_true:
    pl_emit_char 'B'
.Lldp16_019_EQ_done:
    brne8 .Lldp16_019_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_NE_done
.Lldp16_019_NE_true:
    pl_emit_char 'B'
.Lldp16_019_NE_done:
    brult8 .Lldp16_019_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_ULT_done
.Lldp16_019_ULT_true:
    pl_emit_char 'B'
.Lldp16_019_ULT_done:
    bruge8 .Lldp16_019_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_UGE_done
.Lldp16_019_UGE_true:
    pl_emit_char 'B'
.Lldp16_019_UGE_done:
    brslt8 .Lldp16_019_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_SLT_done
.Lldp16_019_SLT_true:
    pl_emit_char 'B'
.Lldp16_019_SLT_done:
    brsge8 .Lldp16_019_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_019_SGE_done
.Lldp16_019_SGE_true:
    pl_emit_char 'B'
.Lldp16_019_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r2, q3, PSPEC=0x4C.
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
    ldi16 r6, %lo16(.Lpl_normal_data + 12)
    ldi8 r7, %hi8(.Lpl_normal_data + 12)
    .byte 0xf0, 0x62, 0x4c ; TEST
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
    breq8 .Lldp16_01a_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_EQ_done
.Lldp16_01a_EQ_true:
    pl_emit_char 'B'
.Lldp16_01a_EQ_done:
    brne8 .Lldp16_01a_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_NE_done
.Lldp16_01a_NE_true:
    pl_emit_char 'B'
.Lldp16_01a_NE_done:
    brult8 .Lldp16_01a_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_ULT_done
.Lldp16_01a_ULT_true:
    pl_emit_char 'B'
.Lldp16_01a_ULT_done:
    bruge8 .Lldp16_01a_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_UGE_done
.Lldp16_01a_UGE_true:
    pl_emit_char 'B'
.Lldp16_01a_UGE_done:
    brslt8 .Lldp16_01a_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_SLT_done
.Lldp16_01a_SLT_true:
    pl_emit_char 'B'
.Lldp16_01a_SLT_done:
    brsge8 .Lldp16_01a_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01a_SGE_done
.Lldp16_01a_SGE_true:
    pl_emit_char 'B'
.Lldp16_01a_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r3, q3, PSPEC=0x6C.
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
    ldi16 r6, %lo16(.Lpl_normal_data + 17)
    ldi8 r7, %hi8(.Lpl_normal_data + 17)
    .byte 0xf0, 0x62, 0x6c ; TEST
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
    breq8 .Lldp16_01b_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_EQ_done
.Lldp16_01b_EQ_true:
    pl_emit_char 'B'
.Lldp16_01b_EQ_done:
    brne8 .Lldp16_01b_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_NE_done
.Lldp16_01b_NE_true:
    pl_emit_char 'B'
.Lldp16_01b_NE_done:
    brult8 .Lldp16_01b_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_ULT_done
.Lldp16_01b_ULT_true:
    pl_emit_char 'B'
.Lldp16_01b_ULT_done:
    bruge8 .Lldp16_01b_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_UGE_done
.Lldp16_01b_UGE_true:
    pl_emit_char 'B'
.Lldp16_01b_UGE_done:
    brslt8 .Lldp16_01b_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_SLT_done
.Lldp16_01b_SLT_true:
    pl_emit_char 'B'
.Lldp16_01b_SLT_done:
    brsge8 .Lldp16_01b_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01b_SGE_done
.Lldp16_01b_SGE_true:
    pl_emit_char 'B'
.Lldp16_01b_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r4, q3, PSPEC=0x8C.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1c49
    push16 r4
    ldi16 r4, 0x1d6c
    push16 r4
    ldi16 r4, 0x1e8f
    push16 r4
    ldi16 r4, 0x1fb2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 22)
    ldi8 r7, %hi8(.Lpl_normal_data + 22)
    .byte 0xf0, 0x62, 0x8c ; TEST
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
    breq8 .Lldp16_01c_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_EQ_done
.Lldp16_01c_EQ_true:
    pl_emit_char 'B'
.Lldp16_01c_EQ_done:
    brne8 .Lldp16_01c_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_NE_done
.Lldp16_01c_NE_true:
    pl_emit_char 'B'
.Lldp16_01c_NE_done:
    brult8 .Lldp16_01c_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_ULT_done
.Lldp16_01c_ULT_true:
    pl_emit_char 'B'
.Lldp16_01c_ULT_done:
    bruge8 .Lldp16_01c_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_UGE_done
.Lldp16_01c_UGE_true:
    pl_emit_char 'B'
.Lldp16_01c_UGE_done:
    brslt8 .Lldp16_01c_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_SLT_done
.Lldp16_01c_SLT_true:
    pl_emit_char 'B'
.Lldp16_01c_SLT_done:
    brsge8 .Lldp16_01c_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01c_SGE_done
.Lldp16_01c_SGE_true:
    pl_emit_char 'B'
.Lldp16_01c_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r5, q3, PSPEC=0xAC.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1da9
    push16 r4
    ldi16 r4, 0x1ecc
    push16 r4
    ldi16 r4, 0x1fef
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 27)
    ldi8 r7, %hi8(.Lpl_normal_data + 27)
    .byte 0xf0, 0x62, 0xac ; TEST
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
    breq8 .Lldp16_01d_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_EQ_done
.Lldp16_01d_EQ_true:
    pl_emit_char 'B'
.Lldp16_01d_EQ_done:
    brne8 .Lldp16_01d_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_NE_done
.Lldp16_01d_NE_true:
    pl_emit_char 'B'
.Lldp16_01d_NE_done:
    brult8 .Lldp16_01d_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_ULT_done
.Lldp16_01d_ULT_true:
    pl_emit_char 'B'
.Lldp16_01d_ULT_done:
    bruge8 .Lldp16_01d_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_UGE_done
.Lldp16_01d_UGE_true:
    pl_emit_char 'B'
.Lldp16_01d_UGE_done:
    brslt8 .Lldp16_01d_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_SLT_done
.Lldp16_01d_SLT_true:
    pl_emit_char 'B'
.Lldp16_01d_SLT_done:
    brsge8 .Lldp16_01d_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01d_SGE_done
.Lldp16_01d_SGE_true:
    pl_emit_char 'B'
.Lldp16_01d_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r6, q3, PSPEC=0xCC.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1f09
    push16 r4
    ldi16 r4, 0x202c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 1)
    ldi8 r7, %hi8(.Lpl_normal_data + 1)
    .byte 0xf0, 0x62, 0xcc ; TEST
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
    breq8 .Lldp16_01e_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_EQ_done
.Lldp16_01e_EQ_true:
    pl_emit_char 'B'
.Lldp16_01e_EQ_done:
    brne8 .Lldp16_01e_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_NE_done
.Lldp16_01e_NE_true:
    pl_emit_char 'B'
.Lldp16_01e_NE_done:
    brult8 .Lldp16_01e_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_ULT_done
.Lldp16_01e_ULT_true:
    pl_emit_char 'B'
.Lldp16_01e_ULT_done:
    bruge8 .Lldp16_01e_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_UGE_done
.Lldp16_01e_UGE_true:
    pl_emit_char 'B'
.Lldp16_01e_UGE_done:
    brslt8 .Lldp16_01e_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_SLT_done
.Lldp16_01e_SLT_true:
    pl_emit_char 'B'
.Lldp16_01e_SLT_done:
    brsge8 .Lldp16_01e_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01e_SGE_done
.Lldp16_01e_SGE_true:
    pl_emit_char 'B'
.Lldp16_01e_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary, r7, q3, PSPEC=0xEC.
    ldi16 r4, 0x0900
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
    ldi16 r4, 0x1f46
    push16 r4
    ldi16 r4, 0x2069
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 6)
    ldi8 r7, %hi8(.Lpl_normal_data + 6)
    .byte 0xf0, 0x62, 0xec ; TEST
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
    breq8 .Lldp16_01f_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_EQ_done
.Lldp16_01f_EQ_true:
    pl_emit_char 'B'
.Lldp16_01f_EQ_done:
    brne8 .Lldp16_01f_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_NE_done
.Lldp16_01f_NE_true:
    pl_emit_char 'B'
.Lldp16_01f_NE_done:
    brult8 .Lldp16_01f_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_ULT_done
.Lldp16_01f_ULT_true:
    pl_emit_char 'B'
.Lldp16_01f_ULT_done:
    bruge8 .Lldp16_01f_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_UGE_done
.Lldp16_01f_UGE_true:
    pl_emit_char 'B'
.Lldp16_01f_UGE_done:
    brslt8 .Lldp16_01f_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_SLT_done
.Lldp16_01f_SLT_true:
    pl_emit_char 'B'
.Lldp16_01f_SLT_done:
    brsge8 .Lldp16_01f_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_01f_SGE_done
.Lldp16_01f_SGE_true:
    pl_emit_char 'B'
.Lldp16_01f_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r2, q0, PSPEC=0x40.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x18b1
    push16 r4
    ldi16 r4, 0x19d4
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
    ldi16 r0, %lo16(.Lpl_normal_data + 11)
    ldi8 r1, %hi8(.Lpl_normal_data + 11)
    .byte 0xf0, 0x66, 0x40 ; TEST
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
    breq8 .Lldp16_020_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_EQ_done
.Lldp16_020_EQ_true:
    pl_emit_char 'B'
.Lldp16_020_EQ_done:
    brne8 .Lldp16_020_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_NE_done
.Lldp16_020_NE_true:
    pl_emit_char 'B'
.Lldp16_020_NE_done:
    brult8 .Lldp16_020_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_ULT_done
.Lldp16_020_ULT_true:
    pl_emit_char 'B'
.Lldp16_020_ULT_done:
    bruge8 .Lldp16_020_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_UGE_done
.Lldp16_020_UGE_true:
    pl_emit_char 'B'
.Lldp16_020_UGE_done:
    brslt8 .Lldp16_020_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_SLT_done
.Lldp16_020_SLT_true:
    pl_emit_char 'B'
.Lldp16_020_SLT_done:
    brsge8 .Lldp16_020_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_020_SGE_done
.Lldp16_020_SGE_true:
    pl_emit_char 'B'
.Lldp16_020_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r3, q0, PSPEC=0x60.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x18ee
    push16 r4
    ldi16 r4, 0x1a11
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
    ldi16 r0, %lo16(.Lpl_normal_data + 16)
    ldi8 r1, %hi8(.Lpl_normal_data + 16)
    .byte 0xf0, 0x66, 0x60 ; TEST
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
    breq8 .Lldp16_021_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_EQ_done
.Lldp16_021_EQ_true:
    pl_emit_char 'B'
.Lldp16_021_EQ_done:
    brne8 .Lldp16_021_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_NE_done
.Lldp16_021_NE_true:
    pl_emit_char 'B'
.Lldp16_021_NE_done:
    brult8 .Lldp16_021_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_ULT_done
.Lldp16_021_ULT_true:
    pl_emit_char 'B'
.Lldp16_021_ULT_done:
    bruge8 .Lldp16_021_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_UGE_done
.Lldp16_021_UGE_true:
    pl_emit_char 'B'
.Lldp16_021_UGE_done:
    brslt8 .Lldp16_021_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_SLT_done
.Lldp16_021_SLT_true:
    pl_emit_char 'B'
.Lldp16_021_SLT_done:
    brsge8 .Lldp16_021_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_021_SGE_done
.Lldp16_021_SGE_true:
    pl_emit_char 'B'
.Lldp16_021_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r4, q0, PSPEC=0x80.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x192b
    push16 r4
    ldi16 r4, 0x1a4e
    push16 r4
    ldi16 r4, 0x1b71
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
    ldi16 r0, %lo16(.Lpl_normal_data + 21)
    ldi8 r1, %hi8(.Lpl_normal_data + 21)
    .byte 0xf0, 0x66, 0x80 ; TEST
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
    breq8 .Lldp16_022_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_EQ_done
.Lldp16_022_EQ_true:
    pl_emit_char 'B'
.Lldp16_022_EQ_done:
    brne8 .Lldp16_022_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_NE_done
.Lldp16_022_NE_true:
    pl_emit_char 'B'
.Lldp16_022_NE_done:
    brult8 .Lldp16_022_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_ULT_done
.Lldp16_022_ULT_true:
    pl_emit_char 'B'
.Lldp16_022_ULT_done:
    bruge8 .Lldp16_022_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_UGE_done
.Lldp16_022_UGE_true:
    pl_emit_char 'B'
.Lldp16_022_UGE_done:
    brslt8 .Lldp16_022_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_SLT_done
.Lldp16_022_SLT_true:
    pl_emit_char 'B'
.Lldp16_022_SLT_done:
    brsge8 .Lldp16_022_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_022_SGE_done
.Lldp16_022_SGE_true:
    pl_emit_char 'B'
.Lldp16_022_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r5, q0, PSPEC=0xA0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1968
    push16 r4
    ldi16 r4, 0x1a8b
    push16 r4
    ldi16 r4, 0x1bae
    push16 r4
    ldi16 r4, 0x1cd1
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
    ldi16 r0, %lo16(.Lpl_normal_data + 26)
    ldi8 r1, %hi8(.Lpl_normal_data + 26)
    .byte 0xf0, 0x66, 0xa0 ; TEST
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
    breq8 .Lldp16_023_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_EQ_done
.Lldp16_023_EQ_true:
    pl_emit_char 'B'
.Lldp16_023_EQ_done:
    brne8 .Lldp16_023_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_NE_done
.Lldp16_023_NE_true:
    pl_emit_char 'B'
.Lldp16_023_NE_done:
    brult8 .Lldp16_023_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_ULT_done
.Lldp16_023_ULT_true:
    pl_emit_char 'B'
.Lldp16_023_ULT_done:
    bruge8 .Lldp16_023_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_UGE_done
.Lldp16_023_UGE_true:
    pl_emit_char 'B'
.Lldp16_023_UGE_done:
    brslt8 .Lldp16_023_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_SLT_done
.Lldp16_023_SLT_true:
    pl_emit_char 'B'
.Lldp16_023_SLT_done:
    brsge8 .Lldp16_023_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_023_SGE_done
.Lldp16_023_SGE_true:
    pl_emit_char 'B'
.Lldp16_023_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r6, q0, PSPEC=0xC0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x19a5
    push16 r4
    ldi16 r4, 0x1ac8
    push16 r4
    ldi16 r4, 0x1beb
    push16 r4
    ldi16 r4, 0x1d0e
    push16 r4
    ldi16 r4, 0x1e31
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
    ldi16 r0, %lo16(.Lpl_normal_data)
    ldi8 r1, %hi8(.Lpl_normal_data)
    .byte 0xf0, 0x66, 0xc0 ; TEST
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
    breq8 .Lldp16_024_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_EQ_done
.Lldp16_024_EQ_true:
    pl_emit_char 'B'
.Lldp16_024_EQ_done:
    brne8 .Lldp16_024_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_NE_done
.Lldp16_024_NE_true:
    pl_emit_char 'B'
.Lldp16_024_NE_done:
    brult8 .Lldp16_024_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_ULT_done
.Lldp16_024_ULT_true:
    pl_emit_char 'B'
.Lldp16_024_ULT_done:
    bruge8 .Lldp16_024_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_UGE_done
.Lldp16_024_UGE_true:
    pl_emit_char 'B'
.Lldp16_024_UGE_done:
    brslt8 .Lldp16_024_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_SLT_done
.Lldp16_024_SLT_true:
    pl_emit_char 'B'
.Lldp16_024_SLT_done:
    brsge8 .Lldp16_024_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_024_SGE_done
.Lldp16_024_SGE_true:
    pl_emit_char 'B'
.Lldp16_024_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r7, q0, PSPEC=0xE0.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x19e2
    push16 r4
    ldi16 r4, 0x1b05
    push16 r4
    ldi16 r4, 0x1c28
    push16 r4
    ldi16 r4, 0x1d4b
    push16 r4
    ldi16 r4, 0x1e6e
    push16 r4
    ldi16 r4, 0x1f91
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
    ldi16 r0, %lo16(.Lpl_normal_data + 5)
    ldi8 r1, %hi8(.Lpl_normal_data + 5)
    .byte 0xf0, 0x66, 0xe0 ; TEST
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
    breq8 .Lldp16_025_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_EQ_done
.Lldp16_025_EQ_true:
    pl_emit_char 'B'
.Lldp16_025_EQ_done:
    brne8 .Lldp16_025_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_NE_done
.Lldp16_025_NE_true:
    pl_emit_char 'B'
.Lldp16_025_NE_done:
    brult8 .Lldp16_025_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_ULT_done
.Lldp16_025_ULT_true:
    pl_emit_char 'B'
.Lldp16_025_ULT_done:
    bruge8 .Lldp16_025_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_UGE_done
.Lldp16_025_UGE_true:
    pl_emit_char 'B'
.Lldp16_025_UGE_done:
    brslt8 .Lldp16_025_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_SLT_done
.Lldp16_025_SLT_true:
    pl_emit_char 'B'
.Lldp16_025_SLT_done:
    brsge8 .Lldp16_025_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_025_SGE_done
.Lldp16_025_SGE_true:
    pl_emit_char 'B'
.Lldp16_025_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r0, q1, PSPEC=0x04.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1a1f
    push16 r4
    ldi16 r4, 0x1b42
    push16 r4
    ldi16 r4, 0x1c65
    push16 r4
    ldi16 r4, 0x1d88
    push16 r4
    ldi16 r4, 0x1eab
    push16 r4
    ldi16 r4, 0x1fce
    push16 r4
    ldi16 r4, 0x20f1
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
    ldi16 r2, %lo16(.Lpl_normal_data + 10)
    ldi8 r3, %hi8(.Lpl_normal_data + 10)
    .byte 0xf0, 0x66, 0x04 ; TEST
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
    breq8 .Lldp16_026_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_EQ_done
.Lldp16_026_EQ_true:
    pl_emit_char 'B'
.Lldp16_026_EQ_done:
    brne8 .Lldp16_026_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_NE_done
.Lldp16_026_NE_true:
    pl_emit_char 'B'
.Lldp16_026_NE_done:
    brult8 .Lldp16_026_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_ULT_done
.Lldp16_026_ULT_true:
    pl_emit_char 'B'
.Lldp16_026_ULT_done:
    bruge8 .Lldp16_026_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_UGE_done
.Lldp16_026_UGE_true:
    pl_emit_char 'B'
.Lldp16_026_UGE_done:
    brslt8 .Lldp16_026_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_SLT_done
.Lldp16_026_SLT_true:
    pl_emit_char 'B'
.Lldp16_026_SLT_done:
    brsge8 .Lldp16_026_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_026_SGE_done
.Lldp16_026_SGE_true:
    pl_emit_char 'B'
.Lldp16_026_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r1, q1, PSPEC=0x24.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1a5c
    push16 r4
    ldi16 r4, 0x1b7f
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
    ldi16 r4, 0x2251
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r2, %lo16(.Lpl_normal_data + 15)
    ldi8 r3, %hi8(.Lpl_normal_data + 15)
    .byte 0xf0, 0x66, 0x24 ; TEST
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
    breq8 .Lldp16_027_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_EQ_done
.Lldp16_027_EQ_true:
    pl_emit_char 'B'
.Lldp16_027_EQ_done:
    brne8 .Lldp16_027_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_NE_done
.Lldp16_027_NE_true:
    pl_emit_char 'B'
.Lldp16_027_NE_done:
    brult8 .Lldp16_027_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_ULT_done
.Lldp16_027_ULT_true:
    pl_emit_char 'B'
.Lldp16_027_ULT_done:
    bruge8 .Lldp16_027_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_UGE_done
.Lldp16_027_UGE_true:
    pl_emit_char 'B'
.Lldp16_027_UGE_done:
    brslt8 .Lldp16_027_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_SLT_done
.Lldp16_027_SLT_true:
    pl_emit_char 'B'
.Lldp16_027_SLT_done:
    brsge8 .Lldp16_027_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_027_SGE_done
.Lldp16_027_SGE_true:
    pl_emit_char 'B'
.Lldp16_027_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r4, q1, PSPEC=0x84.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1a99
    push16 r4
    ldi16 r4, 0x1bbc
    push16 r4
    ldi16 r4, 0x1cdf
    push16 r4
    ldi16 r4, 0x1e02
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
    ldi16 r2, %lo16(.Lpl_normal_data + 20)
    ldi8 r3, %hi8(.Lpl_normal_data + 20)
    .byte 0xf0, 0x66, 0x84 ; TEST
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
    breq8 .Lldp16_028_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_EQ_done
.Lldp16_028_EQ_true:
    pl_emit_char 'B'
.Lldp16_028_EQ_done:
    brne8 .Lldp16_028_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_NE_done
.Lldp16_028_NE_true:
    pl_emit_char 'B'
.Lldp16_028_NE_done:
    brult8 .Lldp16_028_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_ULT_done
.Lldp16_028_ULT_true:
    pl_emit_char 'B'
.Lldp16_028_ULT_done:
    bruge8 .Lldp16_028_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_UGE_done
.Lldp16_028_UGE_true:
    pl_emit_char 'B'
.Lldp16_028_UGE_done:
    brslt8 .Lldp16_028_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_SLT_done
.Lldp16_028_SLT_true:
    pl_emit_char 'B'
.Lldp16_028_SLT_done:
    brsge8 .Lldp16_028_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_028_SGE_done
.Lldp16_028_SGE_true:
    pl_emit_char 'B'
.Lldp16_028_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r5, q1, PSPEC=0xA4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1ad6
    push16 r4
    ldi16 r4, 0x1bf9
    push16 r4
    ldi16 r4, 0x1d1c
    push16 r4
    ldi16 r4, 0x1e3f
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
    ldi16 r2, %lo16(.Lpl_normal_data + 25)
    ldi8 r3, %hi8(.Lpl_normal_data + 25)
    .byte 0xf0, 0x66, 0xa4 ; TEST
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
    breq8 .Lldp16_029_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_EQ_done
.Lldp16_029_EQ_true:
    pl_emit_char 'B'
.Lldp16_029_EQ_done:
    brne8 .Lldp16_029_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_NE_done
.Lldp16_029_NE_true:
    pl_emit_char 'B'
.Lldp16_029_NE_done:
    brult8 .Lldp16_029_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_ULT_done
.Lldp16_029_ULT_true:
    pl_emit_char 'B'
.Lldp16_029_ULT_done:
    bruge8 .Lldp16_029_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_UGE_done
.Lldp16_029_UGE_true:
    pl_emit_char 'B'
.Lldp16_029_UGE_done:
    brslt8 .Lldp16_029_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_SLT_done
.Lldp16_029_SLT_true:
    pl_emit_char 'B'
.Lldp16_029_SLT_done:
    brsge8 .Lldp16_029_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_029_SGE_done
.Lldp16_029_SGE_true:
    pl_emit_char 'B'
.Lldp16_029_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r6, q1, PSPEC=0xC4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1b13
    push16 r4
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0x1d59
    push16 r4
    ldi16 r4, 0x1e7c
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
    ldi16 r2, %lo16(.Lpl_normal_data + 30)
    ldi8 r3, %hi8(.Lpl_normal_data + 30)
    .byte 0xf0, 0x66, 0xc4 ; TEST
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
    breq8 .Lldp16_02a_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_EQ_done
.Lldp16_02a_EQ_true:
    pl_emit_char 'B'
.Lldp16_02a_EQ_done:
    brne8 .Lldp16_02a_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_NE_done
.Lldp16_02a_NE_true:
    pl_emit_char 'B'
.Lldp16_02a_NE_done:
    brult8 .Lldp16_02a_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_ULT_done
.Lldp16_02a_ULT_true:
    pl_emit_char 'B'
.Lldp16_02a_ULT_done:
    bruge8 .Lldp16_02a_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_UGE_done
.Lldp16_02a_UGE_true:
    pl_emit_char 'B'
.Lldp16_02a_UGE_done:
    brslt8 .Lldp16_02a_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_SLT_done
.Lldp16_02a_SLT_true:
    pl_emit_char 'B'
.Lldp16_02a_SLT_done:
    brsge8 .Lldp16_02a_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02a_SGE_done
.Lldp16_02a_SGE_true:
    pl_emit_char 'B'
.Lldp16_02a_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r7, q1, PSPEC=0xE4.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1b50
    push16 r4
    ldi16 r4, 0x1c73
    push16 r4
    ldi16 r4, 0x1d96
    push16 r4
    ldi16 r4, 0x1eb9
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
    ldi16 r2, %lo16(.Lpl_normal_data + 4)
    ldi8 r3, %hi8(.Lpl_normal_data + 4)
    .byte 0xf0, 0x66, 0xe4 ; TEST
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
    breq8 .Lldp16_02b_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_EQ_done
.Lldp16_02b_EQ_true:
    pl_emit_char 'B'
.Lldp16_02b_EQ_done:
    brne8 .Lldp16_02b_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_NE_done
.Lldp16_02b_NE_true:
    pl_emit_char 'B'
.Lldp16_02b_NE_done:
    brult8 .Lldp16_02b_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_ULT_done
.Lldp16_02b_ULT_true:
    pl_emit_char 'B'
.Lldp16_02b_ULT_done:
    bruge8 .Lldp16_02b_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_UGE_done
.Lldp16_02b_UGE_true:
    pl_emit_char 'B'
.Lldp16_02b_UGE_done:
    brslt8 .Lldp16_02b_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_SLT_done
.Lldp16_02b_SLT_true:
    pl_emit_char 'B'
.Lldp16_02b_SLT_done:
    brsge8 .Lldp16_02b_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02b_SGE_done
.Lldp16_02b_SGE_true:
    pl_emit_char 'B'
.Lldp16_02b_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r0, q2, PSPEC=0x08.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1b8d
    push16 r4
    ldi16 r4, 0x1cb0
    push16 r4
    ldi16 r4, 0x1dd3
    push16 r4
    ldi16 r4, 0x1ef6
    push16 r4
    ldi16 r4, 0x2019
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
    ldi16 r4, %lo16(.Lpl_normal_data + 9)
    ldi8 r5, %hi8(.Lpl_normal_data + 9)
    .byte 0xf0, 0x66, 0x08 ; TEST
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
    breq8 .Lldp16_02c_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_EQ_done
.Lldp16_02c_EQ_true:
    pl_emit_char 'B'
.Lldp16_02c_EQ_done:
    brne8 .Lldp16_02c_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_NE_done
.Lldp16_02c_NE_true:
    pl_emit_char 'B'
.Lldp16_02c_NE_done:
    brult8 .Lldp16_02c_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_ULT_done
.Lldp16_02c_ULT_true:
    pl_emit_char 'B'
.Lldp16_02c_ULT_done:
    bruge8 .Lldp16_02c_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_UGE_done
.Lldp16_02c_UGE_true:
    pl_emit_char 'B'
.Lldp16_02c_UGE_done:
    brslt8 .Lldp16_02c_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_SLT_done
.Lldp16_02c_SLT_true:
    pl_emit_char 'B'
.Lldp16_02c_SLT_done:
    brsge8 .Lldp16_02c_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02c_SGE_done
.Lldp16_02c_SGE_true:
    pl_emit_char 'B'
.Lldp16_02c_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r1, q2, PSPEC=0x28.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1bca
    push16 r4
    ldi16 r4, 0x1ced
    push16 r4
    ldi16 r4, 0x1e10
    push16 r4
    ldi16 r4, 0x1f33
    push16 r4
    ldi16 r4, 0x2056
    push16 r4
    ldi16 r4, 0x2179
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
    ldi16 r4, %lo16(.Lpl_normal_data + 14)
    ldi8 r5, %hi8(.Lpl_normal_data + 14)
    .byte 0xf0, 0x66, 0x28 ; TEST
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
    breq8 .Lldp16_02d_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_EQ_done
.Lldp16_02d_EQ_true:
    pl_emit_char 'B'
.Lldp16_02d_EQ_done:
    brne8 .Lldp16_02d_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_NE_done
.Lldp16_02d_NE_true:
    pl_emit_char 'B'
.Lldp16_02d_NE_done:
    brult8 .Lldp16_02d_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_ULT_done
.Lldp16_02d_ULT_true:
    pl_emit_char 'B'
.Lldp16_02d_ULT_done:
    bruge8 .Lldp16_02d_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_UGE_done
.Lldp16_02d_UGE_true:
    pl_emit_char 'B'
.Lldp16_02d_UGE_done:
    brslt8 .Lldp16_02d_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_SLT_done
.Lldp16_02d_SLT_true:
    pl_emit_char 'B'
.Lldp16_02d_SLT_done:
    brsge8 .Lldp16_02d_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02d_SGE_done
.Lldp16_02d_SGE_true:
    pl_emit_char 'B'
.Lldp16_02d_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r2, q2, PSPEC=0x48.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1c07
    push16 r4
    ldi16 r4, 0x1d2a
    push16 r4
    ldi16 r4, 0x1e4d
    push16 r4
    ldi16 r4, 0x1f70
    push16 r4
    ldi16 r4, 0x2093
    push16 r4
    ldi16 r4, 0x21b6
    push16 r4
    ldi16 r4, 0x22d9
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
    ldi16 r4, %lo16(.Lpl_normal_data + 19)
    ldi8 r5, %hi8(.Lpl_normal_data + 19)
    .byte 0xf0, 0x66, 0x48 ; TEST
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
    breq8 .Lldp16_02e_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_EQ_done
.Lldp16_02e_EQ_true:
    pl_emit_char 'B'
.Lldp16_02e_EQ_done:
    brne8 .Lldp16_02e_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_NE_done
.Lldp16_02e_NE_true:
    pl_emit_char 'B'
.Lldp16_02e_NE_done:
    brult8 .Lldp16_02e_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_ULT_done
.Lldp16_02e_ULT_true:
    pl_emit_char 'B'
.Lldp16_02e_ULT_done:
    bruge8 .Lldp16_02e_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_UGE_done
.Lldp16_02e_UGE_true:
    pl_emit_char 'B'
.Lldp16_02e_UGE_done:
    brslt8 .Lldp16_02e_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_SLT_done
.Lldp16_02e_SLT_true:
    pl_emit_char 'B'
.Lldp16_02e_SLT_done:
    brsge8 .Lldp16_02e_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02e_SGE_done
.Lldp16_02e_SGE_true:
    pl_emit_char 'B'
.Lldp16_02e_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r3, q2, PSPEC=0x68.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1c44
    push16 r4
    ldi16 r4, 0x1d67
    push16 r4
    ldi16 r4, 0x1e8a
    push16 r4
    ldi16 r4, 0x1fad
    push16 r4
    ldi16 r4, 0x20d0
    push16 r4
    ldi16 r4, 0x21f3
    push16 r4
    ldi16 r4, 0x2316
    push16 r4
    ldi16 r4, 0x2439
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
    .byte 0xf0, 0x66, 0x68 ; TEST
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
    breq8 .Lldp16_02f_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_EQ_done
.Lldp16_02f_EQ_true:
    pl_emit_char 'B'
.Lldp16_02f_EQ_done:
    brne8 .Lldp16_02f_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_NE_done
.Lldp16_02f_NE_true:
    pl_emit_char 'B'
.Lldp16_02f_NE_done:
    brult8 .Lldp16_02f_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_ULT_done
.Lldp16_02f_ULT_true:
    pl_emit_char 'B'
.Lldp16_02f_ULT_done:
    bruge8 .Lldp16_02f_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_UGE_done
.Lldp16_02f_UGE_true:
    pl_emit_char 'B'
.Lldp16_02f_UGE_done:
    brslt8 .Lldp16_02f_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_SLT_done
.Lldp16_02f_SLT_true:
    pl_emit_char 'B'
.Lldp16_02f_SLT_done:
    brsge8 .Lldp16_02f_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_02f_SGE_done
.Lldp16_02f_SGE_true:
    pl_emit_char 'B'
.Lldp16_02f_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r6, q2, PSPEC=0xC8.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1c81
    push16 r4
    ldi16 r4, 0x1da4
    push16 r4
    ldi16 r4, 0x1ec7
    push16 r4
    ldi16 r4, 0x1fea
    push16 r4
    ldi16 r4, 0x210d
    push16 r4
    ldi16 r4, 0x2230
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
    ldi16 r4, %lo16(.Lpl_normal_data + 29)
    ldi8 r5, %hi8(.Lpl_normal_data + 29)
    .byte 0xf0, 0x66, 0xc8 ; TEST
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
    breq8 .Lldp16_030_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_EQ_done
.Lldp16_030_EQ_true:
    pl_emit_char 'B'
.Lldp16_030_EQ_done:
    brne8 .Lldp16_030_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_NE_done
.Lldp16_030_NE_true:
    pl_emit_char 'B'
.Lldp16_030_NE_done:
    brult8 .Lldp16_030_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_ULT_done
.Lldp16_030_ULT_true:
    pl_emit_char 'B'
.Lldp16_030_ULT_done:
    bruge8 .Lldp16_030_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_UGE_done
.Lldp16_030_UGE_true:
    pl_emit_char 'B'
.Lldp16_030_UGE_done:
    brslt8 .Lldp16_030_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_SLT_done
.Lldp16_030_SLT_true:
    pl_emit_char 'B'
.Lldp16_030_SLT_done:
    brsge8 .Lldp16_030_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_030_SGE_done
.Lldp16_030_SGE_true:
    pl_emit_char 'B'
.Lldp16_030_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r7, q2, PSPEC=0xE8.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1cbe
    push16 r4
    ldi16 r4, 0x1de1
    push16 r4
    ldi16 r4, 0x1f04
    push16 r4
    ldi16 r4, 0x2027
    push16 r4
    ldi16 r4, 0x214a
    push16 r4
    ldi16 r4, 0x226d
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
    ldi16 r4, %lo16(.Lpl_normal_data + 3)
    ldi8 r5, %hi8(.Lpl_normal_data + 3)
    .byte 0xf0, 0x66, 0xe8 ; TEST
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
    breq8 .Lldp16_031_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_EQ_done
.Lldp16_031_EQ_true:
    pl_emit_char 'B'
.Lldp16_031_EQ_done:
    brne8 .Lldp16_031_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_NE_done
.Lldp16_031_NE_true:
    pl_emit_char 'B'
.Lldp16_031_NE_done:
    brult8 .Lldp16_031_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_ULT_done
.Lldp16_031_ULT_true:
    pl_emit_char 'B'
.Lldp16_031_ULT_done:
    bruge8 .Lldp16_031_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_UGE_done
.Lldp16_031_UGE_true:
    pl_emit_char 'B'
.Lldp16_031_UGE_done:
    brslt8 .Lldp16_031_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_SLT_done
.Lldp16_031_SLT_true:
    pl_emit_char 'B'
.Lldp16_031_SLT_done:
    brsge8 .Lldp16_031_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_031_SGE_done
.Lldp16_031_SGE_true:
    pl_emit_char 'B'
.Lldp16_031_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r0, q3, PSPEC=0x0C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1cfb
    push16 r4
    ldi16 r4, 0x1e1e
    push16 r4
    ldi16 r4, 0x1f41
    push16 r4
    ldi16 r4, 0x2064
    push16 r4
    ldi16 r4, 0x2187
    push16 r4
    ldi16 r4, 0x22aa
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
    ldi16 r6, %lo16(.Lpl_normal_data + 8)
    ldi8 r7, %hi8(.Lpl_normal_data + 8)
    .byte 0xf0, 0x66, 0x0c ; TEST
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
    breq8 .Lldp16_032_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_EQ_done
.Lldp16_032_EQ_true:
    pl_emit_char 'B'
.Lldp16_032_EQ_done:
    brne8 .Lldp16_032_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_NE_done
.Lldp16_032_NE_true:
    pl_emit_char 'B'
.Lldp16_032_NE_done:
    brult8 .Lldp16_032_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_ULT_done
.Lldp16_032_ULT_true:
    pl_emit_char 'B'
.Lldp16_032_ULT_done:
    bruge8 .Lldp16_032_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_UGE_done
.Lldp16_032_UGE_true:
    pl_emit_char 'B'
.Lldp16_032_UGE_done:
    brslt8 .Lldp16_032_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_SLT_done
.Lldp16_032_SLT_true:
    pl_emit_char 'B'
.Lldp16_032_SLT_done:
    brsge8 .Lldp16_032_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_032_SGE_done
.Lldp16_032_SGE_true:
    pl_emit_char 'B'
.Lldp16_032_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r1, q3, PSPEC=0x2C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1d38
    push16 r4
    ldi16 r4, 0x1e5b
    push16 r4
    ldi16 r4, 0x1f7e
    push16 r4
    ldi16 r4, 0x20a1
    push16 r4
    ldi16 r4, 0x21c4
    push16 r4
    ldi16 r4, 0x22e7
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
    ldi16 r6, %lo16(.Lpl_normal_data + 13)
    ldi8 r7, %hi8(.Lpl_normal_data + 13)
    .byte 0xf0, 0x66, 0x2c ; TEST
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
    breq8 .Lldp16_033_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_EQ_done
.Lldp16_033_EQ_true:
    pl_emit_char 'B'
.Lldp16_033_EQ_done:
    brne8 .Lldp16_033_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_NE_done
.Lldp16_033_NE_true:
    pl_emit_char 'B'
.Lldp16_033_NE_done:
    brult8 .Lldp16_033_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_ULT_done
.Lldp16_033_ULT_true:
    pl_emit_char 'B'
.Lldp16_033_ULT_done:
    bruge8 .Lldp16_033_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_UGE_done
.Lldp16_033_UGE_true:
    pl_emit_char 'B'
.Lldp16_033_UGE_done:
    brslt8 .Lldp16_033_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_SLT_done
.Lldp16_033_SLT_true:
    pl_emit_char 'B'
.Lldp16_033_SLT_done:
    brsge8 .Lldp16_033_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_033_SGE_done
.Lldp16_033_SGE_true:
    pl_emit_char 'B'
.Lldp16_033_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r2, q3, PSPEC=0x4C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1d75
    push16 r4
    ldi16 r4, 0x1e98
    push16 r4
    ldi16 r4, 0x1fbb
    push16 r4
    ldi16 r4, 0x20de
    push16 r4
    ldi16 r4, 0x2201
    push16 r4
    ldi16 r4, 0x2324
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
    ldi16 r6, %lo16(.Lpl_normal_data + 18)
    ldi8 r7, %hi8(.Lpl_normal_data + 18)
    .byte 0xf0, 0x66, 0x4c ; TEST
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
    breq8 .Lldp16_034_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_EQ_done
.Lldp16_034_EQ_true:
    pl_emit_char 'B'
.Lldp16_034_EQ_done:
    brne8 .Lldp16_034_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_NE_done
.Lldp16_034_NE_true:
    pl_emit_char 'B'
.Lldp16_034_NE_done:
    brult8 .Lldp16_034_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_ULT_done
.Lldp16_034_ULT_true:
    pl_emit_char 'B'
.Lldp16_034_ULT_done:
    bruge8 .Lldp16_034_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_UGE_done
.Lldp16_034_UGE_true:
    pl_emit_char 'B'
.Lldp16_034_UGE_done:
    brslt8 .Lldp16_034_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_SLT_done
.Lldp16_034_SLT_true:
    pl_emit_char 'B'
.Lldp16_034_SLT_done:
    brsge8 .Lldp16_034_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_034_SGE_done
.Lldp16_034_SGE_true:
    pl_emit_char 'B'
.Lldp16_034_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r3, q3, PSPEC=0x6C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1db2
    push16 r4
    ldi16 r4, 0x1ed5
    push16 r4
    ldi16 r4, 0x1ff8
    push16 r4
    ldi16 r4, 0x211b
    push16 r4
    ldi16 r4, 0x223e
    push16 r4
    ldi16 r4, 0x2361
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
    ldi16 r6, %lo16(.Lpl_normal_data + 23)
    ldi8 r7, %hi8(.Lpl_normal_data + 23)
    .byte 0xf0, 0x66, 0x6c ; TEST
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
    breq8 .Lldp16_035_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_EQ_done
.Lldp16_035_EQ_true:
    pl_emit_char 'B'
.Lldp16_035_EQ_done:
    brne8 .Lldp16_035_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_NE_done
.Lldp16_035_NE_true:
    pl_emit_char 'B'
.Lldp16_035_NE_done:
    brult8 .Lldp16_035_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_ULT_done
.Lldp16_035_ULT_true:
    pl_emit_char 'B'
.Lldp16_035_ULT_done:
    bruge8 .Lldp16_035_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_UGE_done
.Lldp16_035_UGE_true:
    pl_emit_char 'B'
.Lldp16_035_UGE_done:
    brslt8 .Lldp16_035_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_SLT_done
.Lldp16_035_SLT_true:
    pl_emit_char 'B'
.Lldp16_035_SLT_done:
    brsge8 .Lldp16_035_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_035_SGE_done
.Lldp16_035_SGE_true:
    pl_emit_char 'B'
.Lldp16_035_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r4, q3, PSPEC=0x8C.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1def
    push16 r4
    ldi16 r4, 0x1f12
    push16 r4
    ldi16 r4, 0x2035
    push16 r4
    ldi16 r4, 0x2158
    push16 r4
    ldi16 r4, 0x227b
    push16 r4
    ldi16 r4, 0x239e
    push16 r4
    ldi16 r4, 0x24c1
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
    ldi16 r6, %lo16(.Lpl_normal_data + 28)
    ldi8 r7, %hi8(.Lpl_normal_data + 28)
    .byte 0xf0, 0x66, 0x8c ; TEST
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
    breq8 .Lldp16_036_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_EQ_done
.Lldp16_036_EQ_true:
    pl_emit_char 'B'
.Lldp16_036_EQ_done:
    brne8 .Lldp16_036_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_NE_done
.Lldp16_036_NE_true:
    pl_emit_char 'B'
.Lldp16_036_NE_done:
    brult8 .Lldp16_036_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_ULT_done
.Lldp16_036_ULT_true:
    pl_emit_char 'B'
.Lldp16_036_ULT_done:
    bruge8 .Lldp16_036_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_UGE_done
.Lldp16_036_UGE_true:
    pl_emit_char 'B'
.Lldp16_036_UGE_done:
    brslt8 .Lldp16_036_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_SLT_done
.Lldp16_036_SLT_true:
    pl_emit_char 'B'
.Lldp16_036_SLT_done:
    brsge8 .Lldp16_036_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_036_SGE_done
.Lldp16_036_SGE_true:
    pl_emit_char 'B'
.Lldp16_036_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement, r5, q3, PSPEC=0xAC.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1e2c
    push16 r4
    ldi16 r4, 0x1f4f
    push16 r4
    ldi16 r4, 0x2072
    push16 r4
    ldi16 r4, 0x2195
    push16 r4
    ldi16 r4, 0x22b8
    push16 r4
    ldi16 r4, 0x23db
    push16 r4
    ldi16 r4, 0x24fe
    push16 r4
    ldi16 r4, 0x2621
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r6, %lo16(.Lpl_normal_data + 2)
    ldi8 r7, %hi8(.Lpl_normal_data + 2)
    .byte 0xf0, 0x66, 0xac ; TEST
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
    breq8 .Lldp16_037_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_EQ_done
.Lldp16_037_EQ_true:
    pl_emit_char 'B'
.Lldp16_037_EQ_done:
    brne8 .Lldp16_037_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_NE_done
.Lldp16_037_NE_true:
    pl_emit_char 'B'
.Lldp16_037_NE_done:
    brult8 .Lldp16_037_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_ULT_done
.Lldp16_037_ULT_true:
    pl_emit_char 'B'
.Lldp16_037_ULT_done:
    bruge8 .Lldp16_037_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_UGE_done
.Lldp16_037_UGE_true:
    pl_emit_char 'B'
.Lldp16_037_UGE_done:
    brslt8 .Lldp16_037_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_SLT_done
.Lldp16_037_SLT_true:
    pl_emit_char 'B'
.Lldp16_037_SLT_done:
    brsge8 .Lldp16_037_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_037_SGE_done
.Lldp16_037_SGE_true:
    pl_emit_char 'B'
.Lldp16_037_SGE_done:
    pl_emit_char '\n'

    ; ldp16: ordinary boundary load beginning at 0x00FFFF.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xcb51
    push16 r4
    ldi16 r4, 0xcc74
    push16 r4
    ldi16 r4, 0xcd97
    push16 r4
    ldi16 r4, 0xceba
    push16 r4
    ldi16 r4, 0xcfdd
    push16 r4
    ldi16 r4, 0xd100
    push16 r4
    ldi16 r4, 0xd223
    push16 r4
    ldi16 r4, 0xd346
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
    .byte 0xf0, 0x62, 0x0c ; TEST_BOUNDARY
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
    breq8 .Lldp16_boundary_0_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_EQ_done
.Lldp16_boundary_0_EQ_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_EQ_done:
    brne8 .Lldp16_boundary_0_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_NE_done
.Lldp16_boundary_0_NE_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_NE_done:
    brult8 .Lldp16_boundary_0_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_ULT_done
.Lldp16_boundary_0_ULT_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_ULT_done:
    bruge8 .Lldp16_boundary_0_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_UGE_done
.Lldp16_boundary_0_UGE_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_UGE_done:
    brslt8 .Lldp16_boundary_0_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_SLT_done
.Lldp16_boundary_0_SLT_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_SLT_done:
    brsge8 .Lldp16_boundary_0_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_0_SGE_done
.Lldp16_boundary_0_SGE_true:
    pl_emit_char 'B'
.Lldp16_boundary_0_SGE_done:
    pl_emit_char '\n'

    ; ldp16: postincrement boundary load beginning at 0x00FFFF.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xcb8e
    push16 r4
    ldi16 r4, 0xccb1
    push16 r4
    ldi16 r4, 0xcdd4
    push16 r4
    ldi16 r4, 0xcef7
    push16 r4
    ldi16 r4, 0xd01a
    push16 r4
    ldi16 r4, 0xd13d
    push16 r4
    ldi16 r4, 0xd260
    push16 r4
    ldi16 r4, 0xd383
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
    .byte 0xf0, 0x66, 0x0c ; TEST_BOUNDARY
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
    breq8 .Lldp16_boundary_1_EQ_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_EQ_done
.Lldp16_boundary_1_EQ_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_EQ_done:
    brne8 .Lldp16_boundary_1_NE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_NE_done
.Lldp16_boundary_1_NE_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_NE_done:
    brult8 .Lldp16_boundary_1_ULT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_ULT_done
.Lldp16_boundary_1_ULT_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_ULT_done:
    bruge8 .Lldp16_boundary_1_UGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_UGE_done
.Lldp16_boundary_1_UGE_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_UGE_done:
    brslt8 .Lldp16_boundary_1_SLT_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_SLT_done
.Lldp16_boundary_1_SLT_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_SLT_done:
    brsge8 .Lldp16_boundary_1_SGE_true
    pl_emit_char 'A'
    jmp8 .Lldp16_boundary_1_SGE_done
.Lldp16_boundary_1_SGE_true:
    pl_emit_char 'B'
.Lldp16_boundary_1_SGE_done:
    pl_emit_char '\n'

    sys debug_break

.section .avm.metadata,"",@progbits

ldp16_reserved_postincrement_overlap_encodings:
    .byte 0xf0, 0x66, 0x00
    .byte 0xf0, 0x66, 0x20
    .byte 0xf0, 0x66, 0x44
    .byte 0xf0, 0x66, 0x64
    .byte 0xf0, 0x66, 0x88
    .byte 0xf0, 0x66, 0xa8
    .byte 0xf0, 0x66, 0xcc
    .byte 0xf0, 0x66, 0xec
