.include "include/general_pointer_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; ld16_general: ordinary, data r0, pointer r0, spec=0x10.
    ldi16 r4, 0x0601
    ldi8 r5, 0x31
    st8 [r4], r5
    ldi16 r4, 0x0602
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0603
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x0604
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0602
    push16 r4
    ldi16 r4, 0x5b01
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
    .byte 0xf0, 0x6c, 0x10 ; TEST
    push16 r1
    push16 r0
    push16 r0
    ldi16 r4, 0x0601
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0603
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_000_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_EQ_done
.Lld16_general_000_EQ_true:
    gp_emit_char 'B'
.Lld16_general_000_EQ_done:
    brne8 .Lld16_general_000_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_NE_done
.Lld16_general_000_NE_true:
    gp_emit_char 'B'
.Lld16_general_000_NE_done:
    brult8 .Lld16_general_000_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_ULT_done
.Lld16_general_000_ULT_true:
    gp_emit_char 'B'
.Lld16_general_000_ULT_done:
    bruge8 .Lld16_general_000_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_UGE_done
.Lld16_general_000_UGE_true:
    gp_emit_char 'B'
.Lld16_general_000_UGE_done:
    brslt8 .Lld16_general_000_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_SLT_done
.Lld16_general_000_SLT_true:
    gp_emit_char 'B'
.Lld16_general_000_SLT_done:
    brsge8 .Lld16_general_000_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_000_SGE_done
.Lld16_general_000_SGE_true:
    gp_emit_char 'B'
.Lld16_general_000_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r0, spec=0x30.
    ldi16 r4, 0x0605
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x0606
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x0607
    ldi8 r5, 0x23
    st8 [r4], r5
    ldi16 r4, 0x0608
    ldi8 r5, 0xad
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0606
    push16 r4
    ldi16 r4, 0xc12e
    push16 r4
    ldi16 r4, 0x5c4b
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
    .byte 0xf0, 0x6c, 0x30 ; TEST
    push16 r2
    push16 r0
    push16 r1
    ldi16 r4, 0x0605
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0607
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_001_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_EQ_done
.Lld16_general_001_EQ_true:
    gp_emit_char 'B'
.Lld16_general_001_EQ_done:
    brne8 .Lld16_general_001_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_NE_done
.Lld16_general_001_NE_true:
    gp_emit_char 'B'
.Lld16_general_001_NE_done:
    brult8 .Lld16_general_001_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_ULT_done
.Lld16_general_001_ULT_true:
    gp_emit_char 'B'
.Lld16_general_001_ULT_done:
    bruge8 .Lld16_general_001_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_UGE_done
.Lld16_general_001_UGE_true:
    gp_emit_char 'B'
.Lld16_general_001_UGE_done:
    brslt8 .Lld16_general_001_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_SLT_done
.Lld16_general_001_SLT_true:
    gp_emit_char 'B'
.Lld16_general_001_SLT_done:
    brsge8 .Lld16_general_001_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_001_SGE_done
.Lld16_general_001_SGE_true:
    gp_emit_char 'B'
.Lld16_general_001_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r0, spec=0x50.
    ldi16 r4, 0x0609
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x060a
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x060b
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x060c
    ldi8 r5, 0xb3
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x060a
    push16 r4
    ldi16 r4, 0x12ae
    push16 r4
    ldi16 r4, 0xc25c
    push16 r4
    ldi16 r4, 0x5d95
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
    .byte 0xf0, 0x6c, 0x50 ; TEST
    push16 r3
    push16 r0
    push16 r2
    ldi16 r4, 0x0609
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x060b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_002_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_EQ_done
.Lld16_general_002_EQ_true:
    gp_emit_char 'B'
.Lld16_general_002_EQ_done:
    brne8 .Lld16_general_002_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_NE_done
.Lld16_general_002_NE_true:
    gp_emit_char 'B'
.Lld16_general_002_NE_done:
    brult8 .Lld16_general_002_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_ULT_done
.Lld16_general_002_ULT_true:
    gp_emit_char 'B'
.Lld16_general_002_ULT_done:
    bruge8 .Lld16_general_002_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_UGE_done
.Lld16_general_002_UGE_true:
    gp_emit_char 'B'
.Lld16_general_002_UGE_done:
    brslt8 .Lld16_general_002_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_SLT_done
.Lld16_general_002_SLT_true:
    gp_emit_char 'B'
.Lld16_general_002_SLT_done:
    brsge8 .Lld16_general_002_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_002_SGE_done
.Lld16_general_002_SGE_true:
    gp_emit_char 'B'
.Lld16_general_002_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r0, spec=0x70.
    ldi16 r4, 0x060d
    ldi8 r5, 0x3a
    st8 [r4], r5
    ldi16 r4, 0x060e
    ldi8 r5, 0xa9
    st8 [r4], r5
    ldi16 r4, 0x060f
    ldi8 r5, 0x45
    st8 [r4], r5
    ldi16 r4, 0x0610
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x060e
    push16 r4
    ldi16 r4, 0x12eb
    push16 r4
    ldi16 r4, 0x140e
    push16 r4
    ldi16 r4, 0xc38a
    push16 r4
    ldi16 r4, 0x5edf
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
    .byte 0xf0, 0x6c, 0x70 ; TEST
    push16 r4
    push16 r0
    push16 r3
    ldi16 r4, 0x060d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x060f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_003_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_EQ_done
.Lld16_general_003_EQ_true:
    gp_emit_char 'B'
.Lld16_general_003_EQ_done:
    brne8 .Lld16_general_003_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_NE_done
.Lld16_general_003_NE_true:
    gp_emit_char 'B'
.Lld16_general_003_NE_done:
    brult8 .Lld16_general_003_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_ULT_done
.Lld16_general_003_ULT_true:
    gp_emit_char 'B'
.Lld16_general_003_ULT_done:
    bruge8 .Lld16_general_003_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_UGE_done
.Lld16_general_003_UGE_true:
    gp_emit_char 'B'
.Lld16_general_003_UGE_done:
    brslt8 .Lld16_general_003_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_SLT_done
.Lld16_general_003_SLT_true:
    gp_emit_char 'B'
.Lld16_general_003_SLT_done:
    brsge8 .Lld16_general_003_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_003_SGE_done
.Lld16_general_003_SGE_true:
    gp_emit_char 'B'
.Lld16_general_003_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r0, spec=0x90.
    ldi16 r4, 0x0611
    ldi8 r5, 0x3d
    st8 [r4], r5
    ldi16 r4, 0x0612
    ldi8 r5, 0xe1
    st8 [r4], r5
    ldi16 r4, 0x0613
    ldi8 r5, 0x56
    st8 [r4], r5
    ldi16 r4, 0x0614
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0612
    push16 r4
    ldi16 r4, 0x1328
    push16 r4
    ldi16 r4, 0x144b
    push16 r4
    ldi16 r4, 0x156e
    push16 r4
    ldi16 r4, 0xc4b8
    push16 r4
    ldi16 r4, 0x6029
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
    .byte 0xf0, 0x6c, 0x90 ; TEST
    push16 r5
    push16 r0
    push16 r4
    ldi16 r4, 0x0611
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0613
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_004_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_EQ_done
.Lld16_general_004_EQ_true:
    gp_emit_char 'B'
.Lld16_general_004_EQ_done:
    brne8 .Lld16_general_004_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_NE_done
.Lld16_general_004_NE_true:
    gp_emit_char 'B'
.Lld16_general_004_NE_done:
    brult8 .Lld16_general_004_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_ULT_done
.Lld16_general_004_ULT_true:
    gp_emit_char 'B'
.Lld16_general_004_ULT_done:
    bruge8 .Lld16_general_004_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_UGE_done
.Lld16_general_004_UGE_true:
    gp_emit_char 'B'
.Lld16_general_004_UGE_done:
    brslt8 .Lld16_general_004_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_SLT_done
.Lld16_general_004_SLT_true:
    gp_emit_char 'B'
.Lld16_general_004_SLT_done:
    brsge8 .Lld16_general_004_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_004_SGE_done
.Lld16_general_004_SGE_true:
    gp_emit_char 'B'
.Lld16_general_004_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r0, spec=0xB0.
    ldi16 r4, 0x0615
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x0616
    ldi8 r5, 0x19
    st8 [r4], r5
    ldi16 r4, 0x0617
    ldi8 r5, 0x68
    st8 [r4], r5
    ldi16 r4, 0x0618
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0616
    push16 r4
    ldi16 r4, 0x1365
    push16 r4
    ldi16 r4, 0x1488
    push16 r4
    ldi16 r4, 0x15ab
    push16 r4
    ldi16 r4, 0x16ce
    push16 r4
    ldi16 r4, 0xc5e6
    push16 r4
    ldi16 r4, 0x6173
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
    .byte 0xf0, 0x6c, 0xb0 ; TEST
    push16 r6
    push16 r0
    push16 r5
    ldi16 r4, 0x0615
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0617
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_005_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_EQ_done
.Lld16_general_005_EQ_true:
    gp_emit_char 'B'
.Lld16_general_005_EQ_done:
    brne8 .Lld16_general_005_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_NE_done
.Lld16_general_005_NE_true:
    gp_emit_char 'B'
.Lld16_general_005_NE_done:
    brult8 .Lld16_general_005_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_ULT_done
.Lld16_general_005_ULT_true:
    gp_emit_char 'B'
.Lld16_general_005_ULT_done:
    bruge8 .Lld16_general_005_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_UGE_done
.Lld16_general_005_UGE_true:
    gp_emit_char 'B'
.Lld16_general_005_UGE_done:
    brslt8 .Lld16_general_005_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_SLT_done
.Lld16_general_005_SLT_true:
    gp_emit_char 'B'
.Lld16_general_005_SLT_done:
    brsge8 .Lld16_general_005_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_005_SGE_done
.Lld16_general_005_SGE_true:
    gp_emit_char 'B'
.Lld16_general_005_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r0, spec=0xD0.
    ldi16 r4, 0x0619
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x061a
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x061b
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x061c
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x061a
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
    ldi16 r4, 0xc714
    push16 r4
    ldi16 r4, 0x62bd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd0 ; TEST
    push16 r7
    push16 r0
    push16 r6
    ldi16 r4, 0x0619
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x061b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_006_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_EQ_done
.Lld16_general_006_EQ_true:
    gp_emit_char 'B'
.Lld16_general_006_EQ_done:
    brne8 .Lld16_general_006_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_NE_done
.Lld16_general_006_NE_true:
    gp_emit_char 'B'
.Lld16_general_006_NE_done:
    brult8 .Lld16_general_006_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_ULT_done
.Lld16_general_006_ULT_true:
    gp_emit_char 'B'
.Lld16_general_006_ULT_done:
    bruge8 .Lld16_general_006_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_UGE_done
.Lld16_general_006_UGE_true:
    gp_emit_char 'B'
.Lld16_general_006_UGE_done:
    brslt8 .Lld16_general_006_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_SLT_done
.Lld16_general_006_SLT_true:
    gp_emit_char 'B'
.Lld16_general_006_SLT_done:
    brsge8 .Lld16_general_006_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_006_SGE_done
.Lld16_general_006_SGE_true:
    gp_emit_char 'B'
.Lld16_general_006_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r0, spec=0xF0.
    ldi16 r4, 0x061d
    ldi8 r5, 0x46
    st8 [r4], r5
    ldi16 r4, 0x061e
    ldi8 r5, 0x89
    st8 [r4], r5
    ldi16 r4, 0x061f
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x0620
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x061e
    push16 r4
    ldi16 r4, 0x5d00
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
    ldi16 r4, 0xc842
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf0 ; TEST
    push16 r1
    push16 r0
    push16 r7
    ldi16 r4, 0x061d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x061f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_007_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_EQ_done
.Lld16_general_007_EQ_true:
    gp_emit_char 'B'
.Lld16_general_007_EQ_done:
    brne8 .Lld16_general_007_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_NE_done
.Lld16_general_007_NE_true:
    gp_emit_char 'B'
.Lld16_general_007_NE_done:
    brult8 .Lld16_general_007_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_ULT_done
.Lld16_general_007_ULT_true:
    gp_emit_char 'B'
.Lld16_general_007_ULT_done:
    bruge8 .Lld16_general_007_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_UGE_done
.Lld16_general_007_UGE_true:
    gp_emit_char 'B'
.Lld16_general_007_UGE_done:
    brslt8 .Lld16_general_007_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_SLT_done
.Lld16_general_007_SLT_true:
    gp_emit_char 'B'
.Lld16_general_007_SLT_done:
    brsge8 .Lld16_general_007_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_007_SGE_done
.Lld16_general_007_SGE_true:
    gp_emit_char 'B'
.Lld16_general_007_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r1, spec=0x12.
    ldi16 r4, 0x0621
    ldi8 r5, 0x4a
    st8 [r4], r5
    ldi16 r4, 0x0622
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x0623
    ldi8 r5, 0x1c
    st8 [r4], r5
    ldi16 r4, 0x0624
    ldi8 r5, 0xcf
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xc168
    push16 r4
    ldi16 r4, 0x0622
    push16 r4
    ldi16 r4, 0x5e4a
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
    .byte 0xf0, 0x6c, 0x12 ; TEST
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x0621
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0623
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_008_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_EQ_done
.Lld16_general_008_EQ_true:
    gp_emit_char 'B'
.Lld16_general_008_EQ_done:
    brne8 .Lld16_general_008_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_NE_done
.Lld16_general_008_NE_true:
    gp_emit_char 'B'
.Lld16_general_008_NE_done:
    brult8 .Lld16_general_008_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_ULT_done
.Lld16_general_008_ULT_true:
    gp_emit_char 'B'
.Lld16_general_008_ULT_done:
    bruge8 .Lld16_general_008_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_UGE_done
.Lld16_general_008_UGE_true:
    gp_emit_char 'B'
.Lld16_general_008_UGE_done:
    brslt8 .Lld16_general_008_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_SLT_done
.Lld16_general_008_SLT_true:
    gp_emit_char 'B'
.Lld16_general_008_SLT_done:
    brsge8 .Lld16_general_008_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_008_SGE_done
.Lld16_general_008_SGE_true:
    gp_emit_char 'B'
.Lld16_general_008_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r1, spec=0x32.
    ldi16 r4, 0x0625
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x0626
    ldi8 r5, 0x02
    st8 [r4], r5
    ldi16 r4, 0x0627
    ldi8 r5, 0x2e
    st8 [r4], r5
    ldi16 r4, 0x0628
    ldi8 r5, 0xd5
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1336
    push16 r4
    ldi16 r4, 0x0626
    push16 r4
    ldi16 r4, 0x5e93
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
    .byte 0xf0, 0x6c, 0x32 ; TEST
    push16 r2
    push16 r1
    push16 r1
    ldi16 r4, 0x0625
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0627
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_009_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_EQ_done
.Lld16_general_009_EQ_true:
    gp_emit_char 'B'
.Lld16_general_009_EQ_done:
    brne8 .Lld16_general_009_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_NE_done
.Lld16_general_009_NE_true:
    gp_emit_char 'B'
.Lld16_general_009_NE_done:
    brult8 .Lld16_general_009_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_ULT_done
.Lld16_general_009_ULT_true:
    gp_emit_char 'B'
.Lld16_general_009_ULT_done:
    bruge8 .Lld16_general_009_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_UGE_done
.Lld16_general_009_UGE_true:
    gp_emit_char 'B'
.Lld16_general_009_UGE_done:
    brslt8 .Lld16_general_009_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_SLT_done
.Lld16_general_009_SLT_true:
    gp_emit_char 'B'
.Lld16_general_009_SLT_done:
    brsge8 .Lld16_general_009_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_009_SGE_done
.Lld16_general_009_SGE_true:
    gp_emit_char 'B'
.Lld16_general_009_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r1, spec=0x52.
    ldi16 r4, 0x0629
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x062a
    ldi8 r5, 0x3a
    st8 [r4], r5
    ldi16 r4, 0x062b
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x062c
    ldi8 r5, 0xdb
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1373
    push16 r4
    ldi16 r4, 0x062a
    push16 r4
    ldi16 r4, 0xc3c4
    push16 r4
    ldi16 r4, 0x5fdd
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
    .byte 0xf0, 0x6c, 0x52 ; TEST
    push16 r3
    push16 r1
    push16 r2
    ldi16 r4, 0x0629
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x062b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_EQ_done
.Lld16_general_00a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00a_EQ_done:
    brne8 .Lld16_general_00a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_NE_done
.Lld16_general_00a_NE_true:
    gp_emit_char 'B'
.Lld16_general_00a_NE_done:
    brult8 .Lld16_general_00a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_ULT_done
.Lld16_general_00a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00a_ULT_done:
    bruge8 .Lld16_general_00a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_UGE_done
.Lld16_general_00a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00a_UGE_done:
    brslt8 .Lld16_general_00a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_SLT_done
.Lld16_general_00a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00a_SLT_done:
    brsge8 .Lld16_general_00a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00a_SGE_done
.Lld16_general_00a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r1, spec=0x72.
    ldi16 r4, 0x062d
    ldi8 r5, 0x53
    st8 [r4], r5
    ldi16 r4, 0x062e
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x062f
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x0630
    ldi8 r5, 0xe1
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x13b0
    push16 r4
    ldi16 r4, 0x062e
    push16 r4
    ldi16 r4, 0x15f6
    push16 r4
    ldi16 r4, 0xc4f2
    push16 r4
    ldi16 r4, 0x6127
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
    .byte 0xf0, 0x6c, 0x72 ; TEST
    push16 r4
    push16 r1
    push16 r3
    ldi16 r4, 0x062d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x062f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_EQ_done
.Lld16_general_00b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00b_EQ_done:
    brne8 .Lld16_general_00b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_NE_done
.Lld16_general_00b_NE_true:
    gp_emit_char 'B'
.Lld16_general_00b_NE_done:
    brult8 .Lld16_general_00b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_ULT_done
.Lld16_general_00b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00b_ULT_done:
    bruge8 .Lld16_general_00b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_UGE_done
.Lld16_general_00b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00b_UGE_done:
    brslt8 .Lld16_general_00b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_SLT_done
.Lld16_general_00b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00b_SLT_done:
    brsge8 .Lld16_general_00b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00b_SGE_done
.Lld16_general_00b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r1, spec=0x92.
    ldi16 r4, 0x0631
    ldi8 r5, 0x56
    st8 [r4], r5
    ldi16 r4, 0x0632
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x0633
    ldi8 r5, 0x61
    st8 [r4], r5
    ldi16 r4, 0x0634
    ldi8 r5, 0xe7
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x13ed
    push16 r4
    ldi16 r4, 0x0632
    push16 r4
    ldi16 r4, 0x1633
    push16 r4
    ldi16 r4, 0x1756
    push16 r4
    ldi16 r4, 0xc620
    push16 r4
    ldi16 r4, 0x6271
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
    .byte 0xf0, 0x6c, 0x92 ; TEST
    push16 r5
    push16 r1
    push16 r4
    ldi16 r4, 0x0631
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0633
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_EQ_done
.Lld16_general_00c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00c_EQ_done:
    brne8 .Lld16_general_00c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_NE_done
.Lld16_general_00c_NE_true:
    gp_emit_char 'B'
.Lld16_general_00c_NE_done:
    brult8 .Lld16_general_00c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_ULT_done
.Lld16_general_00c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00c_ULT_done:
    bruge8 .Lld16_general_00c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_UGE_done
.Lld16_general_00c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00c_UGE_done:
    brslt8 .Lld16_general_00c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_SLT_done
.Lld16_general_00c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00c_SLT_done:
    brsge8 .Lld16_general_00c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00c_SGE_done
.Lld16_general_00c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r1, spec=0xB2.
    ldi16 r4, 0x0635
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x0636
    ldi8 r5, 0xe2
    st8 [r4], r5
    ldi16 r4, 0x0637
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x0638
    ldi8 r5, 0xed
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x142a
    push16 r4
    ldi16 r4, 0x0636
    push16 r4
    ldi16 r4, 0x1670
    push16 r4
    ldi16 r4, 0x1793
    push16 r4
    ldi16 r4, 0x18b6
    push16 r4
    ldi16 r4, 0xc74e
    push16 r4
    ldi16 r4, 0x63bb
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
    .byte 0xf0, 0x6c, 0xb2 ; TEST
    push16 r6
    push16 r1
    push16 r5
    ldi16 r4, 0x0635
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0637
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_EQ_done
.Lld16_general_00d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00d_EQ_done:
    brne8 .Lld16_general_00d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_NE_done
.Lld16_general_00d_NE_true:
    gp_emit_char 'B'
.Lld16_general_00d_NE_done:
    brult8 .Lld16_general_00d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_ULT_done
.Lld16_general_00d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00d_ULT_done:
    bruge8 .Lld16_general_00d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_UGE_done
.Lld16_general_00d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00d_UGE_done:
    brslt8 .Lld16_general_00d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_SLT_done
.Lld16_general_00d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00d_SLT_done:
    brsge8 .Lld16_general_00d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00d_SGE_done
.Lld16_general_00d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r1, spec=0xD2.
    ldi16 r4, 0x0639
    ldi8 r5, 0x5c
    st8 [r4], r5
    ldi16 r4, 0x063a
    ldi8 r5, 0x1a
    st8 [r4], r5
    ldi16 r4, 0x063b
    ldi8 r5, 0x84
    st8 [r4], r5
    ldi16 r4, 0x063c
    ldi8 r5, 0xf3
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1467
    push16 r4
    ldi16 r4, 0x063a
    push16 r4
    ldi16 r4, 0x16ad
    push16 r4
    ldi16 r4, 0x17d0
    push16 r4
    ldi16 r4, 0x18f3
    push16 r4
    ldi16 r4, 0x1a16
    push16 r4
    ldi16 r4, 0xc87c
    push16 r4
    ldi16 r4, 0x6505
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd2 ; TEST
    push16 r7
    push16 r1
    push16 r6
    ldi16 r4, 0x0639
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x063b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_EQ_done
.Lld16_general_00e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00e_EQ_done:
    brne8 .Lld16_general_00e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_NE_done
.Lld16_general_00e_NE_true:
    gp_emit_char 'B'
.Lld16_general_00e_NE_done:
    brult8 .Lld16_general_00e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_ULT_done
.Lld16_general_00e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00e_ULT_done:
    bruge8 .Lld16_general_00e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_UGE_done
.Lld16_general_00e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00e_UGE_done:
    brslt8 .Lld16_general_00e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_SLT_done
.Lld16_general_00e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00e_SLT_done:
    brsge8 .Lld16_general_00e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00e_SGE_done
.Lld16_general_00e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r1, spec=0xF2.
    ldi16 r4, 0x063d
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x063e
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x063f
    ldi8 r5, 0x95
    st8 [r4], r5
    ldi16 r4, 0x0640
    ldi8 r5, 0xf9
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5e47
    push16 r4
    ldi16 r4, 0x063e
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
    ldi16 r4, 0xc9aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf2 ; TEST
    push16 r0
    push16 r1
    push16 r7
    ldi16 r4, 0x063d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x063f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_00f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_EQ_done
.Lld16_general_00f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_00f_EQ_done:
    brne8 .Lld16_general_00f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_NE_done
.Lld16_general_00f_NE_true:
    gp_emit_char 'B'
.Lld16_general_00f_NE_done:
    brult8 .Lld16_general_00f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_ULT_done
.Lld16_general_00f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_00f_ULT_done:
    bruge8 .Lld16_general_00f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_UGE_done
.Lld16_general_00f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_00f_UGE_done:
    brslt8 .Lld16_general_00f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_SLT_done
.Lld16_general_00f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_00f_SLT_done:
    brsge8 .Lld16_general_00f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_00f_SGE_done
.Lld16_general_00f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_00f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r2, spec=0x14.
    ldi16 r4, 0x0641
    ldi8 r5, 0x63
    st8 [r4], r5
    ldi16 r4, 0x0642
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x0643
    ldi8 r5, 0x27
    st8 [r4], r5
    ldi16 r4, 0x0644
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xc2d0
    push16 r4
    ldi16 r4, 0x5f91
    push16 r4
    ldi16 r4, 0x0642
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
    .byte 0xf0, 0x6c, 0x14 ; TEST
    push16 r1
    push16 r2
    push16 r0
    ldi16 r4, 0x0641
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0643
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_010_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_EQ_done
.Lld16_general_010_EQ_true:
    gp_emit_char 'B'
.Lld16_general_010_EQ_done:
    brne8 .Lld16_general_010_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_NE_done
.Lld16_general_010_NE_true:
    gp_emit_char 'B'
.Lld16_general_010_NE_done:
    brult8 .Lld16_general_010_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_ULT_done
.Lld16_general_010_ULT_true:
    gp_emit_char 'B'
.Lld16_general_010_ULT_done:
    bruge8 .Lld16_general_010_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_UGE_done
.Lld16_general_010_UGE_true:
    gp_emit_char 'B'
.Lld16_general_010_UGE_done:
    brslt8 .Lld16_general_010_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_SLT_done
.Lld16_general_010_SLT_true:
    gp_emit_char 'B'
.Lld16_general_010_SLT_done:
    brsge8 .Lld16_general_010_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_010_SGE_done
.Lld16_general_010_SGE_true:
    gp_emit_char 'B'
.Lld16_general_010_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r2, spec=0x34.
    ldi16 r4, 0x0645
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0646
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x0647
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x0648
    ldi8 r5, 0xfd
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x151e
    push16 r4
    ldi16 r4, 0xc3fe
    push16 r4
    ldi16 r4, 0x0646
    push16 r4
    ldi16 r4, 0x61dc
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
    .byte 0xf0, 0x6c, 0x34 ; TEST
    push16 r3
    push16 r2
    push16 r1
    ldi16 r4, 0x0645
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0647
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_011_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_EQ_done
.Lld16_general_011_EQ_true:
    gp_emit_char 'B'
.Lld16_general_011_EQ_done:
    brne8 .Lld16_general_011_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_NE_done
.Lld16_general_011_NE_true:
    gp_emit_char 'B'
.Lld16_general_011_NE_done:
    brult8 .Lld16_general_011_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_ULT_done
.Lld16_general_011_ULT_true:
    gp_emit_char 'B'
.Lld16_general_011_ULT_done:
    bruge8 .Lld16_general_011_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_UGE_done
.Lld16_general_011_UGE_true:
    gp_emit_char 'B'
.Lld16_general_011_UGE_done:
    brslt8 .Lld16_general_011_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_SLT_done
.Lld16_general_011_SLT_true:
    gp_emit_char 'B'
.Lld16_general_011_SLT_done:
    brsge8 .Lld16_general_011_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_011_SGE_done
.Lld16_general_011_SGE_true:
    gp_emit_char 'B'
.Lld16_general_011_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r2, spec=0x54.
    ldi16 r4, 0x0649
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x064a
    ldi8 r5, 0x03
    st8 [r4], r5
    ldi16 r4, 0x064b
    ldi8 r5, 0x4a
    st8 [r4], r5
    ldi16 r4, 0x064c
    ldi8 r5, 0x03
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x155b
    push16 r4
    ldi16 r4, 0x167e
    push16 r4
    ldi16 r4, 0x064a
    push16 r4
    ldi16 r4, 0x6225
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
    .byte 0xf0, 0x6c, 0x54 ; TEST
    push16 r3
    push16 r2
    push16 r2
    ldi16 r4, 0x0649
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x064b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_012_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_EQ_done
.Lld16_general_012_EQ_true:
    gp_emit_char 'B'
.Lld16_general_012_EQ_done:
    brne8 .Lld16_general_012_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_NE_done
.Lld16_general_012_NE_true:
    gp_emit_char 'B'
.Lld16_general_012_NE_done:
    brult8 .Lld16_general_012_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_ULT_done
.Lld16_general_012_ULT_true:
    gp_emit_char 'B'
.Lld16_general_012_ULT_done:
    bruge8 .Lld16_general_012_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_UGE_done
.Lld16_general_012_UGE_true:
    gp_emit_char 'B'
.Lld16_general_012_UGE_done:
    brslt8 .Lld16_general_012_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_SLT_done
.Lld16_general_012_SLT_true:
    gp_emit_char 'B'
.Lld16_general_012_SLT_done:
    brsge8 .Lld16_general_012_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_012_SGE_done
.Lld16_general_012_SGE_true:
    gp_emit_char 'B'
.Lld16_general_012_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r2, spec=0x74.
    ldi16 r4, 0x064d
    ldi8 r5, 0x6c
    st8 [r4], r5
    ldi16 r4, 0x064e
    ldi8 r5, 0x3b
    st8 [r4], r5
    ldi16 r4, 0x064f
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0650
    ldi8 r5, 0x09
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1598
    push16 r4
    ldi16 r4, 0x16bb
    push16 r4
    ldi16 r4, 0x064e
    push16 r4
    ldi16 r4, 0xc65a
    push16 r4
    ldi16 r4, 0x636f
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
    .byte 0xf0, 0x6c, 0x74 ; TEST
    push16 r4
    push16 r2
    push16 r3
    ldi16 r4, 0x064d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x064f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_013_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_EQ_done
.Lld16_general_013_EQ_true:
    gp_emit_char 'B'
.Lld16_general_013_EQ_done:
    brne8 .Lld16_general_013_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_NE_done
.Lld16_general_013_NE_true:
    gp_emit_char 'B'
.Lld16_general_013_NE_done:
    brult8 .Lld16_general_013_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_ULT_done
.Lld16_general_013_ULT_true:
    gp_emit_char 'B'
.Lld16_general_013_ULT_done:
    bruge8 .Lld16_general_013_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_UGE_done
.Lld16_general_013_UGE_true:
    gp_emit_char 'B'
.Lld16_general_013_UGE_done:
    brslt8 .Lld16_general_013_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_SLT_done
.Lld16_general_013_SLT_true:
    gp_emit_char 'B'
.Lld16_general_013_SLT_done:
    brsge8 .Lld16_general_013_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_013_SGE_done
.Lld16_general_013_SGE_true:
    gp_emit_char 'B'
.Lld16_general_013_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r2, spec=0x94.
    ldi16 r4, 0x0651
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x0652
    ldi8 r5, 0x73
    st8 [r4], r5
    ldi16 r4, 0x0653
    ldi8 r5, 0x6c
    st8 [r4], r5
    ldi16 r4, 0x0654
    ldi8 r5, 0x0f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x15d5
    push16 r4
    ldi16 r4, 0x16f8
    push16 r4
    ldi16 r4, 0x0652
    push16 r4
    ldi16 r4, 0x193e
    push16 r4
    ldi16 r4, 0xc788
    push16 r4
    ldi16 r4, 0x64b9
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
    .byte 0xf0, 0x6c, 0x94 ; TEST
    push16 r5
    push16 r2
    push16 r4
    ldi16 r4, 0x0651
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0653
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_014_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_EQ_done
.Lld16_general_014_EQ_true:
    gp_emit_char 'B'
.Lld16_general_014_EQ_done:
    brne8 .Lld16_general_014_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_NE_done
.Lld16_general_014_NE_true:
    gp_emit_char 'B'
.Lld16_general_014_NE_done:
    brult8 .Lld16_general_014_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_ULT_done
.Lld16_general_014_ULT_true:
    gp_emit_char 'B'
.Lld16_general_014_ULT_done:
    bruge8 .Lld16_general_014_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_UGE_done
.Lld16_general_014_UGE_true:
    gp_emit_char 'B'
.Lld16_general_014_UGE_done:
    brslt8 .Lld16_general_014_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_SLT_done
.Lld16_general_014_SLT_true:
    gp_emit_char 'B'
.Lld16_general_014_SLT_done:
    brsge8 .Lld16_general_014_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_014_SGE_done
.Lld16_general_014_SGE_true:
    gp_emit_char 'B'
.Lld16_general_014_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r2, spec=0xB4.
    ldi16 r4, 0x0655
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x0656
    ldi8 r5, 0xab
    st8 [r4], r5
    ldi16 r4, 0x0657
    ldi8 r5, 0x7d
    st8 [r4], r5
    ldi16 r4, 0x0658
    ldi8 r5, 0x15
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1612
    push16 r4
    ldi16 r4, 0x1735
    push16 r4
    ldi16 r4, 0x0656
    push16 r4
    ldi16 r4, 0x197b
    push16 r4
    ldi16 r4, 0x1a9e
    push16 r4
    ldi16 r4, 0xc8b6
    push16 r4
    ldi16 r4, 0x6603
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
    .byte 0xf0, 0x6c, 0xb4 ; TEST
    push16 r6
    push16 r2
    push16 r5
    ldi16 r4, 0x0655
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0657
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_015_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_EQ_done
.Lld16_general_015_EQ_true:
    gp_emit_char 'B'
.Lld16_general_015_EQ_done:
    brne8 .Lld16_general_015_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_NE_done
.Lld16_general_015_NE_true:
    gp_emit_char 'B'
.Lld16_general_015_NE_done:
    brult8 .Lld16_general_015_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_ULT_done
.Lld16_general_015_ULT_true:
    gp_emit_char 'B'
.Lld16_general_015_ULT_done:
    bruge8 .Lld16_general_015_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_UGE_done
.Lld16_general_015_UGE_true:
    gp_emit_char 'B'
.Lld16_general_015_UGE_done:
    brslt8 .Lld16_general_015_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_SLT_done
.Lld16_general_015_SLT_true:
    gp_emit_char 'B'
.Lld16_general_015_SLT_done:
    brsge8 .Lld16_general_015_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_015_SGE_done
.Lld16_general_015_SGE_true:
    gp_emit_char 'B'
.Lld16_general_015_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r2, spec=0xD4.
    ldi16 r4, 0x0659
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x065a
    ldi8 r5, 0xe3
    st8 [r4], r5
    ldi16 r4, 0x065b
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x065c
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x164f
    push16 r4
    ldi16 r4, 0x1772
    push16 r4
    ldi16 r4, 0x065a
    push16 r4
    ldi16 r4, 0x19b8
    push16 r4
    ldi16 r4, 0x1adb
    push16 r4
    ldi16 r4, 0x1bfe
    push16 r4
    ldi16 r4, 0xc9e4
    push16 r4
    ldi16 r4, 0x674d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd4 ; TEST
    push16 r7
    push16 r2
    push16 r6
    ldi16 r4, 0x0659
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x065b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_016_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_EQ_done
.Lld16_general_016_EQ_true:
    gp_emit_char 'B'
.Lld16_general_016_EQ_done:
    brne8 .Lld16_general_016_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_NE_done
.Lld16_general_016_NE_true:
    gp_emit_char 'B'
.Lld16_general_016_NE_done:
    brult8 .Lld16_general_016_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_ULT_done
.Lld16_general_016_ULT_true:
    gp_emit_char 'B'
.Lld16_general_016_ULT_done:
    bruge8 .Lld16_general_016_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_UGE_done
.Lld16_general_016_UGE_true:
    gp_emit_char 'B'
.Lld16_general_016_UGE_done:
    brslt8 .Lld16_general_016_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_SLT_done
.Lld16_general_016_SLT_true:
    gp_emit_char 'B'
.Lld16_general_016_SLT_done:
    brsge8 .Lld16_general_016_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_016_SGE_done
.Lld16_general_016_SGE_true:
    gp_emit_char 'B'
.Lld16_general_016_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r2, spec=0xF4.
    ldi16 r4, 0x065d
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x065e
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x065f
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0660
    ldi8 r5, 0x21
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x608f
    push16 r4
    ldi16 r4, 0x17af
    push16 r4
    ldi16 r4, 0x065e
    push16 r4
    ldi16 r4, 0x19f5
    push16 r4
    ldi16 r4, 0x1b18
    push16 r4
    ldi16 r4, 0x1c3b
    push16 r4
    ldi16 r4, 0x1d5e
    push16 r4
    ldi16 r4, 0xcb12
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf4 ; TEST
    push16 r0
    push16 r2
    push16 r7
    ldi16 r4, 0x065d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x065f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_017_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_EQ_done
.Lld16_general_017_EQ_true:
    gp_emit_char 'B'
.Lld16_general_017_EQ_done:
    brne8 .Lld16_general_017_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_NE_done
.Lld16_general_017_NE_true:
    gp_emit_char 'B'
.Lld16_general_017_NE_done:
    brult8 .Lld16_general_017_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_ULT_done
.Lld16_general_017_ULT_true:
    gp_emit_char 'B'
.Lld16_general_017_ULT_done:
    bruge8 .Lld16_general_017_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_UGE_done
.Lld16_general_017_UGE_true:
    gp_emit_char 'B'
.Lld16_general_017_UGE_done:
    brslt8 .Lld16_general_017_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_SLT_done
.Lld16_general_017_SLT_true:
    gp_emit_char 'B'
.Lld16_general_017_SLT_done:
    brsge8 .Lld16_general_017_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_017_SGE_done
.Lld16_general_017_SGE_true:
    gp_emit_char 'B'
.Lld16_general_017_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r3, spec=0x16.
    ldi16 r4, 0x0661
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x0662
    ldi8 r5, 0x5c
    st8 [r4], r5
    ldi16 r4, 0x0663
    ldi8 r5, 0x32
    st8 [r4], r5
    ldi16 r4, 0x0664
    ldi8 r5, 0x1f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xc438
    push16 r4
    ldi16 r4, 0x61d9
    push16 r4
    ldi16 r4, 0x190f
    push16 r4
    ldi16 r4, 0x0662
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
    .byte 0xf0, 0x6c, 0x16 ; TEST
    push16 r1
    push16 r3
    push16 r0
    ldi16 r4, 0x0661
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0663
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_018_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_EQ_done
.Lld16_general_018_EQ_true:
    gp_emit_char 'B'
.Lld16_general_018_EQ_done:
    brne8 .Lld16_general_018_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_NE_done
.Lld16_general_018_NE_true:
    gp_emit_char 'B'
.Lld16_general_018_NE_done:
    brult8 .Lld16_general_018_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_ULT_done
.Lld16_general_018_ULT_true:
    gp_emit_char 'B'
.Lld16_general_018_ULT_done:
    bruge8 .Lld16_general_018_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_UGE_done
.Lld16_general_018_UGE_true:
    gp_emit_char 'B'
.Lld16_general_018_UGE_done:
    brslt8 .Lld16_general_018_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_SLT_done
.Lld16_general_018_SLT_true:
    gp_emit_char 'B'
.Lld16_general_018_SLT_done:
    brsge8 .Lld16_general_018_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_018_SGE_done
.Lld16_general_018_SGE_true:
    gp_emit_char 'B'
.Lld16_general_018_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r3, spec=0x36.
    ldi16 r4, 0x0665
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0666
    ldi8 r5, 0x94
    st8 [r4], r5
    ldi16 r4, 0x0667
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x0668
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1706
    push16 r4
    ldi16 r4, 0xc566
    push16 r4
    ldi16 r4, 0x6323
    push16 r4
    ldi16 r4, 0x0666
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
    .byte 0xf0, 0x6c, 0x36 ; TEST
    push16 r2
    push16 r3
    push16 r1
    ldi16 r4, 0x0665
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0667
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_019_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_EQ_done
.Lld16_general_019_EQ_true:
    gp_emit_char 'B'
.Lld16_general_019_EQ_done:
    brne8 .Lld16_general_019_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_NE_done
.Lld16_general_019_NE_true:
    gp_emit_char 'B'
.Lld16_general_019_NE_done:
    brult8 .Lld16_general_019_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_ULT_done
.Lld16_general_019_ULT_true:
    gp_emit_char 'B'
.Lld16_general_019_ULT_done:
    bruge8 .Lld16_general_019_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_UGE_done
.Lld16_general_019_UGE_true:
    gp_emit_char 'B'
.Lld16_general_019_UGE_done:
    brslt8 .Lld16_general_019_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_SLT_done
.Lld16_general_019_SLT_true:
    gp_emit_char 'B'
.Lld16_general_019_SLT_done:
    brsge8 .Lld16_general_019_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_019_SGE_done
.Lld16_general_019_SGE_true:
    gp_emit_char 'B'
.Lld16_general_019_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r3, spec=0x56.
    ldi16 r4, 0x0669
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x066a
    ldi8 r5, 0xcc
    st8 [r4], r5
    ldi16 r4, 0x066b
    ldi8 r5, 0x54
    st8 [r4], r5
    ldi16 r4, 0x066c
    ldi8 r5, 0x2b
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1743
    push16 r4
    ldi16 r4, 0x1866
    push16 r4
    ldi16 r4, 0xc694
    push16 r4
    ldi16 r4, 0x066a
    push16 r4
    ldi16 r4, 0x656e
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
    .byte 0xf0, 0x6c, 0x56 ; TEST
    push16 r4
    push16 r3
    push16 r2
    ldi16 r4, 0x0669
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x066b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_EQ_done
.Lld16_general_01a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01a_EQ_done:
    brne8 .Lld16_general_01a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_NE_done
.Lld16_general_01a_NE_true:
    gp_emit_char 'B'
.Lld16_general_01a_NE_done:
    brult8 .Lld16_general_01a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_ULT_done
.Lld16_general_01a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01a_ULT_done:
    bruge8 .Lld16_general_01a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_UGE_done
.Lld16_general_01a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01a_UGE_done:
    brslt8 .Lld16_general_01a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_SLT_done
.Lld16_general_01a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01a_SLT_done:
    brsge8 .Lld16_general_01a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01a_SGE_done
.Lld16_general_01a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r3, spec=0x76.
    ldi16 r4, 0x066d
    ldi8 r5, 0x85
    st8 [r4], r5
    ldi16 r4, 0x066e
    ldi8 r5, 0x04
    st8 [r4], r5
    ldi16 r4, 0x066f
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0670
    ldi8 r5, 0x31
    st8 [r4], r5
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
    ldi16 r4, 0x066e
    push16 r4
    ldi16 r4, 0x65b7
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
    .byte 0xf0, 0x6c, 0x76 ; TEST
    push16 r4
    push16 r3
    push16 r3
    ldi16 r4, 0x066d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x066f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_EQ_done
.Lld16_general_01b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01b_EQ_done:
    brne8 .Lld16_general_01b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_NE_done
.Lld16_general_01b_NE_true:
    gp_emit_char 'B'
.Lld16_general_01b_NE_done:
    brult8 .Lld16_general_01b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_ULT_done
.Lld16_general_01b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01b_ULT_done:
    bruge8 .Lld16_general_01b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_UGE_done
.Lld16_general_01b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01b_UGE_done:
    brslt8 .Lld16_general_01b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_SLT_done
.Lld16_general_01b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01b_SLT_done:
    brsge8 .Lld16_general_01b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01b_SGE_done
.Lld16_general_01b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r3, spec=0x96.
    ldi16 r4, 0x0671
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0672
    ldi8 r5, 0x3c
    st8 [r4], r5
    ldi16 r4, 0x0673
    ldi8 r5, 0x77
    st8 [r4], r5
    ldi16 r4, 0x0674
    ldi8 r5, 0x37
    st8 [r4], r5
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
    ldi16 r4, 0x0672
    push16 r4
    ldi16 r4, 0xc8f0
    push16 r4
    ldi16 r4, 0x6701
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
    .byte 0xf0, 0x6c, 0x96 ; TEST
    push16 r5
    push16 r3
    push16 r4
    ldi16 r4, 0x0671
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0673
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_EQ_done
.Lld16_general_01c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01c_EQ_done:
    brne8 .Lld16_general_01c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_NE_done
.Lld16_general_01c_NE_true:
    gp_emit_char 'B'
.Lld16_general_01c_NE_done:
    brult8 .Lld16_general_01c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_ULT_done
.Lld16_general_01c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01c_ULT_done:
    bruge8 .Lld16_general_01c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_UGE_done
.Lld16_general_01c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01c_UGE_done:
    brslt8 .Lld16_general_01c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_SLT_done
.Lld16_general_01c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01c_SLT_done:
    brsge8 .Lld16_general_01c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01c_SGE_done
.Lld16_general_01c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r3, spec=0xB6.
    ldi16 r4, 0x0675
    ldi8 r5, 0x8b
    st8 [r4], r5
    ldi16 r4, 0x0676
    ldi8 r5, 0x74
    st8 [r4], r5
    ldi16 r4, 0x0677
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0678
    ldi8 r5, 0x3d
    st8 [r4], r5
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
    ldi16 r4, 0x0676
    push16 r4
    ldi16 r4, 0x1c86
    push16 r4
    ldi16 r4, 0xca1e
    push16 r4
    ldi16 r4, 0x684b
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
    .byte 0xf0, 0x6c, 0xb6 ; TEST
    push16 r6
    push16 r3
    push16 r5
    ldi16 r4, 0x0675
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0677
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_EQ_done
.Lld16_general_01d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01d_EQ_done:
    brne8 .Lld16_general_01d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_NE_done
.Lld16_general_01d_NE_true:
    gp_emit_char 'B'
.Lld16_general_01d_NE_done:
    brult8 .Lld16_general_01d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_ULT_done
.Lld16_general_01d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01d_ULT_done:
    bruge8 .Lld16_general_01d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_UGE_done
.Lld16_general_01d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01d_UGE_done:
    brslt8 .Lld16_general_01d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_SLT_done
.Lld16_general_01d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01d_SLT_done:
    brsge8 .Lld16_general_01d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01d_SGE_done
.Lld16_general_01d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r3, spec=0xD6.
    ldi16 r4, 0x0679
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x067a
    ldi8 r5, 0xac
    st8 [r4], r5
    ldi16 r4, 0x067b
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x067c
    ldi8 r5, 0x43
    st8 [r4], r5
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
    ldi16 r4, 0x067a
    push16 r4
    ldi16 r4, 0x1cc3
    push16 r4
    ldi16 r4, 0x1de6
    push16 r4
    ldi16 r4, 0xcb4c
    push16 r4
    ldi16 r4, 0x6995
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd6 ; TEST
    push16 r7
    push16 r3
    push16 r6
    ldi16 r4, 0x0679
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x067b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_EQ_done
.Lld16_general_01e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01e_EQ_done:
    brne8 .Lld16_general_01e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_NE_done
.Lld16_general_01e_NE_true:
    gp_emit_char 'B'
.Lld16_general_01e_NE_done:
    brult8 .Lld16_general_01e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_ULT_done
.Lld16_general_01e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01e_ULT_done:
    bruge8 .Lld16_general_01e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_UGE_done
.Lld16_general_01e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01e_UGE_done:
    brslt8 .Lld16_general_01e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_SLT_done
.Lld16_general_01e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01e_SLT_done:
    brsge8 .Lld16_general_01e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01e_SGE_done
.Lld16_general_01e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r3, spec=0xF6.
    ldi16 r4, 0x067d
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x067e
    ldi8 r5, 0xe4
    st8 [r4], r5
    ldi16 r4, 0x067f
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x0680
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x62d7
    push16 r4
    ldi16 r4, 0x1997
    push16 r4
    ldi16 r4, 0x1aba
    push16 r4
    ldi16 r4, 0x067e
    push16 r4
    ldi16 r4, 0x1d00
    push16 r4
    ldi16 r4, 0x1e23
    push16 r4
    ldi16 r4, 0x1f46
    push16 r4
    ldi16 r4, 0xcc7a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf6 ; TEST
    push16 r0
    push16 r3
    push16 r7
    ldi16 r4, 0x067d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x067f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_01f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_EQ_done
.Lld16_general_01f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_01f_EQ_done:
    brne8 .Lld16_general_01f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_NE_done
.Lld16_general_01f_NE_true:
    gp_emit_char 'B'
.Lld16_general_01f_NE_done:
    brult8 .Lld16_general_01f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_ULT_done
.Lld16_general_01f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_01f_ULT_done:
    bruge8 .Lld16_general_01f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_UGE_done
.Lld16_general_01f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_01f_UGE_done:
    brslt8 .Lld16_general_01f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_SLT_done
.Lld16_general_01f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_01f_SLT_done:
    brsge8 .Lld16_general_01f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_01f_SGE_done
.Lld16_general_01f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_01f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r4, spec=0x18.
    ldi16 r4, 0x0681
    ldi8 r5, 0x95
    st8 [r4], r5
    ldi16 r4, 0x0682
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x0683
    ldi8 r5, 0x3d
    st8 [r4], r5
    ldi16 r4, 0x0684
    ldi8 r5, 0x47
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xc5a0
    push16 r4
    ldi16 r4, 0x6421
    push16 r4
    ldi16 r4, 0x1af7
    push16 r4
    ldi16 r4, 0x1c1a
    push16 r4
    ldi16 r4, 0x0682
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
    .byte 0xf0, 0x6c, 0x18 ; TEST
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x0681
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0683
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_020_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_EQ_done
.Lld16_general_020_EQ_true:
    gp_emit_char 'B'
.Lld16_general_020_EQ_done:
    brne8 .Lld16_general_020_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_NE_done
.Lld16_general_020_NE_true:
    gp_emit_char 'B'
.Lld16_general_020_NE_done:
    brult8 .Lld16_general_020_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_ULT_done
.Lld16_general_020_ULT_true:
    gp_emit_char 'B'
.Lld16_general_020_ULT_done:
    bruge8 .Lld16_general_020_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_UGE_done
.Lld16_general_020_UGE_true:
    gp_emit_char 'B'
.Lld16_general_020_UGE_done:
    brslt8 .Lld16_general_020_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_SLT_done
.Lld16_general_020_SLT_true:
    gp_emit_char 'B'
.Lld16_general_020_SLT_done:
    brsge8 .Lld16_general_020_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_020_SGE_done
.Lld16_general_020_SGE_true:
    gp_emit_char 'B'
.Lld16_general_020_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r4, spec=0x38.
    ldi16 r4, 0x0685
    ldi8 r5, 0x98
    st8 [r4], r5
    ldi16 r4, 0x0686
    ldi8 r5, 0x5d
    st8 [r4], r5
    ldi16 r4, 0x0687
    ldi8 r5, 0x4e
    st8 [r4], r5
    ldi16 r4, 0x0688
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x18ee
    push16 r4
    ldi16 r4, 0xc6ce
    push16 r4
    ldi16 r4, 0x656b
    push16 r4
    ldi16 r4, 0x1c57
    push16 r4
    ldi16 r4, 0x0686
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
    .byte 0xf0, 0x6c, 0x38 ; TEST
    push16 r2
    push16 r4
    push16 r1
    ldi16 r4, 0x0685
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0687
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_021_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_EQ_done
.Lld16_general_021_EQ_true:
    gp_emit_char 'B'
.Lld16_general_021_EQ_done:
    brne8 .Lld16_general_021_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_NE_done
.Lld16_general_021_NE_true:
    gp_emit_char 'B'
.Lld16_general_021_NE_done:
    brult8 .Lld16_general_021_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_ULT_done
.Lld16_general_021_ULT_true:
    gp_emit_char 'B'
.Lld16_general_021_ULT_done:
    bruge8 .Lld16_general_021_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_UGE_done
.Lld16_general_021_UGE_true:
    gp_emit_char 'B'
.Lld16_general_021_UGE_done:
    brslt8 .Lld16_general_021_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_SLT_done
.Lld16_general_021_SLT_true:
    gp_emit_char 'B'
.Lld16_general_021_SLT_done:
    brsge8 .Lld16_general_021_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_021_SGE_done
.Lld16_general_021_SGE_true:
    gp_emit_char 'B'
.Lld16_general_021_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r4, spec=0x58.
    ldi16 r4, 0x0689
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x068a
    ldi8 r5, 0x95
    st8 [r4], r5
    ldi16 r4, 0x068b
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x068c
    ldi8 r5, 0x53
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x192b
    push16 r4
    ldi16 r4, 0x1a4e
    push16 r4
    ldi16 r4, 0xc7fc
    push16 r4
    ldi16 r4, 0x66b5
    push16 r4
    ldi16 r4, 0x068a
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
    .byte 0xf0, 0x6c, 0x58 ; TEST
    push16 r3
    push16 r4
    push16 r2
    ldi16 r4, 0x0689
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x068b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_022_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_EQ_done
.Lld16_general_022_EQ_true:
    gp_emit_char 'B'
.Lld16_general_022_EQ_done:
    brne8 .Lld16_general_022_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_NE_done
.Lld16_general_022_NE_true:
    gp_emit_char 'B'
.Lld16_general_022_NE_done:
    brult8 .Lld16_general_022_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_ULT_done
.Lld16_general_022_ULT_true:
    gp_emit_char 'B'
.Lld16_general_022_ULT_done:
    bruge8 .Lld16_general_022_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_UGE_done
.Lld16_general_022_UGE_true:
    gp_emit_char 'B'
.Lld16_general_022_UGE_done:
    brslt8 .Lld16_general_022_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_SLT_done
.Lld16_general_022_SLT_true:
    gp_emit_char 'B'
.Lld16_general_022_SLT_done:
    brsge8 .Lld16_general_022_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_022_SGE_done
.Lld16_general_022_SGE_true:
    gp_emit_char 'B'
.Lld16_general_022_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r4, spec=0x78.
    ldi16 r4, 0x068d
    ldi8 r5, 0x9e
    st8 [r4], r5
    ldi16 r4, 0x068e
    ldi8 r5, 0xcd
    st8 [r4], r5
    ldi16 r4, 0x068f
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x0690
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1968
    push16 r4
    ldi16 r4, 0x1a8b
    push16 r4
    ldi16 r4, 0x1bae
    push16 r4
    ldi16 r4, 0xc92a
    push16 r4
    ldi16 r4, 0x068e
    push16 r4
    ldi16 r4, 0x6900
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
    .byte 0xf0, 0x6c, 0x78 ; TEST
    push16 r5
    push16 r4
    push16 r3
    ldi16 r4, 0x068d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x068f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_023_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_EQ_done
.Lld16_general_023_EQ_true:
    gp_emit_char 'B'
.Lld16_general_023_EQ_done:
    brne8 .Lld16_general_023_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_NE_done
.Lld16_general_023_NE_true:
    gp_emit_char 'B'
.Lld16_general_023_NE_done:
    brult8 .Lld16_general_023_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_ULT_done
.Lld16_general_023_ULT_true:
    gp_emit_char 'B'
.Lld16_general_023_ULT_done:
    bruge8 .Lld16_general_023_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_UGE_done
.Lld16_general_023_UGE_true:
    gp_emit_char 'B'
.Lld16_general_023_UGE_done:
    brslt8 .Lld16_general_023_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_SLT_done
.Lld16_general_023_SLT_true:
    gp_emit_char 'B'
.Lld16_general_023_SLT_done:
    brsge8 .Lld16_general_023_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_023_SGE_done
.Lld16_general_023_SGE_true:
    gp_emit_char 'B'
.Lld16_general_023_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r4, spec=0x98.
    ldi16 r4, 0x0691
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x0692
    ldi8 r5, 0x05
    st8 [r4], r5
    ldi16 r4, 0x0693
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x0694
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x19a5
    push16 r4
    ldi16 r4, 0x1ac8
    push16 r4
    ldi16 r4, 0x1beb
    push16 r4
    ldi16 r4, 0x1d0e
    push16 r4
    ldi16 r4, 0x0692
    push16 r4
    ldi16 r4, 0x6949
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
    .byte 0xf0, 0x6c, 0x98 ; TEST
    push16 r5
    push16 r4
    push16 r4
    ldi16 r4, 0x0691
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0693
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_024_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_EQ_done
.Lld16_general_024_EQ_true:
    gp_emit_char 'B'
.Lld16_general_024_EQ_done:
    brne8 .Lld16_general_024_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_NE_done
.Lld16_general_024_NE_true:
    gp_emit_char 'B'
.Lld16_general_024_NE_done:
    brult8 .Lld16_general_024_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_ULT_done
.Lld16_general_024_ULT_true:
    gp_emit_char 'B'
.Lld16_general_024_ULT_done:
    bruge8 .Lld16_general_024_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_UGE_done
.Lld16_general_024_UGE_true:
    gp_emit_char 'B'
.Lld16_general_024_UGE_done:
    brslt8 .Lld16_general_024_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_SLT_done
.Lld16_general_024_SLT_true:
    gp_emit_char 'B'
.Lld16_general_024_SLT_done:
    brsge8 .Lld16_general_024_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_024_SGE_done
.Lld16_general_024_SGE_true:
    gp_emit_char 'B'
.Lld16_general_024_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r4, spec=0xB8.
    ldi16 r4, 0x0695
    ldi8 r5, 0xa4
    st8 [r4], r5
    ldi16 r4, 0x0696
    ldi8 r5, 0x3d
    st8 [r4], r5
    ldi16 r4, 0x0697
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x0698
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x19e2
    push16 r4
    ldi16 r4, 0x1b05
    push16 r4
    ldi16 r4, 0x1c28
    push16 r4
    ldi16 r4, 0x1d4b
    push16 r4
    ldi16 r4, 0x0696
    push16 r4
    ldi16 r4, 0xcb86
    push16 r4
    ldi16 r4, 0x6a93
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
    .byte 0xf0, 0x6c, 0xb8 ; TEST
    push16 r6
    push16 r4
    push16 r5
    ldi16 r4, 0x0695
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0697
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_025_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_EQ_done
.Lld16_general_025_EQ_true:
    gp_emit_char 'B'
.Lld16_general_025_EQ_done:
    brne8 .Lld16_general_025_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_NE_done
.Lld16_general_025_NE_true:
    gp_emit_char 'B'
.Lld16_general_025_NE_done:
    brult8 .Lld16_general_025_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_ULT_done
.Lld16_general_025_ULT_true:
    gp_emit_char 'B'
.Lld16_general_025_ULT_done:
    bruge8 .Lld16_general_025_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_UGE_done
.Lld16_general_025_UGE_true:
    gp_emit_char 'B'
.Lld16_general_025_UGE_done:
    brslt8 .Lld16_general_025_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_SLT_done
.Lld16_general_025_SLT_true:
    gp_emit_char 'B'
.Lld16_general_025_SLT_done:
    brsge8 .Lld16_general_025_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_025_SGE_done
.Lld16_general_025_SGE_true:
    gp_emit_char 'B'
.Lld16_general_025_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r4, spec=0xD8.
    ldi16 r4, 0x0699
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x069a
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x069b
    ldi8 r5, 0xa4
    st8 [r4], r5
    ldi16 r4, 0x069c
    ldi8 r5, 0x6b
    st8 [r4], r5
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
    ldi16 r4, 0x069a
    push16 r4
    ldi16 r4, 0x1fce
    push16 r4
    ldi16 r4, 0xccb4
    push16 r4
    ldi16 r4, 0x6bdd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd8 ; TEST
    push16 r7
    push16 r4
    push16 r6
    ldi16 r4, 0x0699
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x069b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_026_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_EQ_done
.Lld16_general_026_EQ_true:
    gp_emit_char 'B'
.Lld16_general_026_EQ_done:
    brne8 .Lld16_general_026_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_NE_done
.Lld16_general_026_NE_true:
    gp_emit_char 'B'
.Lld16_general_026_NE_done:
    brult8 .Lld16_general_026_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_ULT_done
.Lld16_general_026_ULT_true:
    gp_emit_char 'B'
.Lld16_general_026_ULT_done:
    bruge8 .Lld16_general_026_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_UGE_done
.Lld16_general_026_UGE_true:
    gp_emit_char 'B'
.Lld16_general_026_UGE_done:
    brslt8 .Lld16_general_026_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_SLT_done
.Lld16_general_026_SLT_true:
    gp_emit_char 'B'
.Lld16_general_026_SLT_done:
    brsge8 .Lld16_general_026_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_026_SGE_done
.Lld16_general_026_SGE_true:
    gp_emit_char 'B'
.Lld16_general_026_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r4, spec=0xF8.
    ldi16 r4, 0x069d
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x069e
    ldi8 r5, 0xad
    st8 [r4], r5
    ldi16 r4, 0x069f
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x06a0
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x651f
    push16 r4
    ldi16 r4, 0x1b7f
    push16 r4
    ldi16 r4, 0x1ca2
    push16 r4
    ldi16 r4, 0x1dc5
    push16 r4
    ldi16 r4, 0x069e
    push16 r4
    ldi16 r4, 0x200b
    push16 r4
    ldi16 r4, 0x212e
    push16 r4
    ldi16 r4, 0xcde2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf8 ; TEST
    push16 r0
    push16 r4
    push16 r7
    ldi16 r4, 0x069d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x069f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_027_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_EQ_done
.Lld16_general_027_EQ_true:
    gp_emit_char 'B'
.Lld16_general_027_EQ_done:
    brne8 .Lld16_general_027_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_NE_done
.Lld16_general_027_NE_true:
    gp_emit_char 'B'
.Lld16_general_027_NE_done:
    brult8 .Lld16_general_027_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_ULT_done
.Lld16_general_027_ULT_true:
    gp_emit_char 'B'
.Lld16_general_027_ULT_done:
    bruge8 .Lld16_general_027_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_UGE_done
.Lld16_general_027_UGE_true:
    gp_emit_char 'B'
.Lld16_general_027_UGE_done:
    brslt8 .Lld16_general_027_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_SLT_done
.Lld16_general_027_SLT_true:
    gp_emit_char 'B'
.Lld16_general_027_SLT_done:
    brsge8 .Lld16_general_027_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_027_SGE_done
.Lld16_general_027_SGE_true:
    gp_emit_char 'B'
.Lld16_general_027_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r5, spec=0x1A.
    ldi16 r4, 0x06a1
    ldi8 r5, 0xae
    st8 [r4], r5
    ldi16 r4, 0x06a2
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x06a3
    ldi8 r5, 0x47
    st8 [r4], r5
    ldi16 r4, 0x06a4
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xc708
    push16 r4
    ldi16 r4, 0x6669
    push16 r4
    ldi16 r4, 0x1cdf
    push16 r4
    ldi16 r4, 0x1e02
    push16 r4
    ldi16 r4, 0x1f25
    push16 r4
    ldi16 r4, 0x06a2
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
    .byte 0xf0, 0x6c, 0x1a ; TEST
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x06a1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06a3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_028_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_EQ_done
.Lld16_general_028_EQ_true:
    gp_emit_char 'B'
.Lld16_general_028_EQ_done:
    brne8 .Lld16_general_028_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_NE_done
.Lld16_general_028_NE_true:
    gp_emit_char 'B'
.Lld16_general_028_NE_done:
    brult8 .Lld16_general_028_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_ULT_done
.Lld16_general_028_ULT_true:
    gp_emit_char 'B'
.Lld16_general_028_ULT_done:
    bruge8 .Lld16_general_028_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_UGE_done
.Lld16_general_028_UGE_true:
    gp_emit_char 'B'
.Lld16_general_028_UGE_done:
    brslt8 .Lld16_general_028_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_SLT_done
.Lld16_general_028_SLT_true:
    gp_emit_char 'B'
.Lld16_general_028_SLT_done:
    brsge8 .Lld16_general_028_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_028_SGE_done
.Lld16_general_028_SGE_true:
    gp_emit_char 'B'
.Lld16_general_028_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r5, spec=0x3A.
    ldi16 r4, 0x06a5
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x06a6
    ldi8 r5, 0x26
    st8 [r4], r5
    ldi16 r4, 0x06a7
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x06a8
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1ad6
    push16 r4
    ldi16 r4, 0xc836
    push16 r4
    ldi16 r4, 0x67b3
    push16 r4
    ldi16 r4, 0x1e3f
    push16 r4
    ldi16 r4, 0x1f62
    push16 r4
    ldi16 r4, 0x06a6
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
    .byte 0xf0, 0x6c, 0x3a ; TEST
    push16 r2
    push16 r5
    push16 r1
    ldi16 r4, 0x06a5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06a7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_029_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_EQ_done
.Lld16_general_029_EQ_true:
    gp_emit_char 'B'
.Lld16_general_029_EQ_done:
    brne8 .Lld16_general_029_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_NE_done
.Lld16_general_029_NE_true:
    gp_emit_char 'B'
.Lld16_general_029_NE_done:
    brult8 .Lld16_general_029_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_ULT_done
.Lld16_general_029_ULT_true:
    gp_emit_char 'B'
.Lld16_general_029_ULT_done:
    bruge8 .Lld16_general_029_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_UGE_done
.Lld16_general_029_UGE_true:
    gp_emit_char 'B'
.Lld16_general_029_UGE_done:
    brslt8 .Lld16_general_029_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_SLT_done
.Lld16_general_029_SLT_true:
    gp_emit_char 'B'
.Lld16_general_029_SLT_done:
    brsge8 .Lld16_general_029_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_029_SGE_done
.Lld16_general_029_SGE_true:
    gp_emit_char 'B'
.Lld16_general_029_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r5, spec=0x5A.
    ldi16 r4, 0x06a9
    ldi8 r5, 0xb4
    st8 [r4], r5
    ldi16 r4, 0x06aa
    ldi8 r5, 0x5e
    st8 [r4], r5
    ldi16 r4, 0x06ab
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x06ac
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1b13
    push16 r4
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0xc964
    push16 r4
    ldi16 r4, 0x68fd
    push16 r4
    ldi16 r4, 0x1f9f
    push16 r4
    ldi16 r4, 0x06aa
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
    .byte 0xf0, 0x6c, 0x5a ; TEST
    push16 r3
    push16 r5
    push16 r2
    ldi16 r4, 0x06a9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06ab
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_EQ_done
.Lld16_general_02a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02a_EQ_done:
    brne8 .Lld16_general_02a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_NE_done
.Lld16_general_02a_NE_true:
    gp_emit_char 'B'
.Lld16_general_02a_NE_done:
    brult8 .Lld16_general_02a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_ULT_done
.Lld16_general_02a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02a_ULT_done:
    bruge8 .Lld16_general_02a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_UGE_done
.Lld16_general_02a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02a_UGE_done:
    brslt8 .Lld16_general_02a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_SLT_done
.Lld16_general_02a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02a_SLT_done:
    brsge8 .Lld16_general_02a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02a_SGE_done
.Lld16_general_02a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r5, spec=0x7A.
    ldi16 r4, 0x06ad
    ldi8 r5, 0xb7
    st8 [r4], r5
    ldi16 r4, 0x06ae
    ldi8 r5, 0x96
    st8 [r4], r5
    ldi16 r4, 0x06af
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x06b0
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1b50
    push16 r4
    ldi16 r4, 0x1c73
    push16 r4
    ldi16 r4, 0x1d96
    push16 r4
    ldi16 r4, 0xca92
    push16 r4
    ldi16 r4, 0x6a47
    push16 r4
    ldi16 r4, 0x06ae
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
    .byte 0xf0, 0x6c, 0x7a ; TEST
    push16 r4
    push16 r5
    push16 r3
    ldi16 r4, 0x06ad
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06af
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_EQ_done
.Lld16_general_02b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02b_EQ_done:
    brne8 .Lld16_general_02b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_NE_done
.Lld16_general_02b_NE_true:
    gp_emit_char 'B'
.Lld16_general_02b_NE_done:
    brult8 .Lld16_general_02b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_ULT_done
.Lld16_general_02b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02b_ULT_done:
    bruge8 .Lld16_general_02b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_UGE_done
.Lld16_general_02b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02b_UGE_done:
    brslt8 .Lld16_general_02b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_SLT_done
.Lld16_general_02b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02b_SLT_done:
    brsge8 .Lld16_general_02b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02b_SGE_done
.Lld16_general_02b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r5, spec=0x9A.
    ldi16 r4, 0x06b1
    ldi8 r5, 0xba
    st8 [r4], r5
    ldi16 r4, 0x06b2
    ldi8 r5, 0xce
    st8 [r4], r5
    ldi16 r4, 0x06b3
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x06b4
    ldi8 r5, 0x87
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1b8d
    push16 r4
    ldi16 r4, 0x1cb0
    push16 r4
    ldi16 r4, 0x1dd3
    push16 r4
    ldi16 r4, 0x1ef6
    push16 r4
    ldi16 r4, 0xcbc0
    push16 r4
    ldi16 r4, 0x06b2
    push16 r4
    ldi16 r4, 0x6c92
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
    .byte 0xf0, 0x6c, 0x9a ; TEST
    push16 r6
    push16 r5
    push16 r4
    ldi16 r4, 0x06b1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06b3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_EQ_done
.Lld16_general_02c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02c_EQ_done:
    brne8 .Lld16_general_02c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_NE_done
.Lld16_general_02c_NE_true:
    gp_emit_char 'B'
.Lld16_general_02c_NE_done:
    brult8 .Lld16_general_02c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_ULT_done
.Lld16_general_02c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02c_ULT_done:
    bruge8 .Lld16_general_02c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_UGE_done
.Lld16_general_02c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02c_UGE_done:
    brslt8 .Lld16_general_02c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_SLT_done
.Lld16_general_02c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02c_SLT_done:
    brsge8 .Lld16_general_02c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02c_SGE_done
.Lld16_general_02c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r5, spec=0xBA.
    ldi16 r4, 0x06b5
    ldi8 r5, 0xbd
    st8 [r4], r5
    ldi16 r4, 0x06b6
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x06b7
    ldi8 r5, 0x9e
    st8 [r4], r5
    ldi16 r4, 0x06b8
    ldi8 r5, 0x8d
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
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
    ldi16 r4, 0x06b6
    push16 r4
    ldi16 r4, 0x6cdb
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
    .byte 0xf0, 0x6c, 0xba ; TEST
    push16 r6
    push16 r5
    push16 r5
    ldi16 r4, 0x06b5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06b7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_EQ_done
.Lld16_general_02d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02d_EQ_done:
    brne8 .Lld16_general_02d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_NE_done
.Lld16_general_02d_NE_true:
    gp_emit_char 'B'
.Lld16_general_02d_NE_done:
    brult8 .Lld16_general_02d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_ULT_done
.Lld16_general_02d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02d_ULT_done:
    bruge8 .Lld16_general_02d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_UGE_done
.Lld16_general_02d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02d_UGE_done:
    brslt8 .Lld16_general_02d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_SLT_done
.Lld16_general_02d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02d_SLT_done:
    brsge8 .Lld16_general_02d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02d_SGE_done
.Lld16_general_02d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r5, spec=0xDA.
    ldi16 r4, 0x06b9
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x06ba
    ldi8 r5, 0x3e
    st8 [r4], r5
    ldi16 r4, 0x06bb
    ldi8 r5, 0xaf
    st8 [r4], r5
    ldi16 r4, 0x06bc
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r4, 0x06ba
    push16 r4
    ldi16 r4, 0xce1c
    push16 r4
    ldi16 r4, 0x6e25
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xda ; TEST
    push16 r7
    push16 r5
    push16 r6
    ldi16 r4, 0x06b9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06bb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_EQ_done
.Lld16_general_02e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02e_EQ_done:
    brne8 .Lld16_general_02e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_NE_done
.Lld16_general_02e_NE_true:
    gp_emit_char 'B'
.Lld16_general_02e_NE_done:
    brult8 .Lld16_general_02e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_ULT_done
.Lld16_general_02e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02e_ULT_done:
    bruge8 .Lld16_general_02e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_UGE_done
.Lld16_general_02e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02e_UGE_done:
    brslt8 .Lld16_general_02e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_SLT_done
.Lld16_general_02e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02e_SLT_done:
    brsge8 .Lld16_general_02e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02e_SGE_done
.Lld16_general_02e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r5, spec=0xFA.
    ldi16 r4, 0x06bd
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x06be
    ldi8 r5, 0x76
    st8 [r4], r5
    ldi16 r4, 0x06bf
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x06c0
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6767
    push16 r4
    ldi16 r4, 0x1d67
    push16 r4
    ldi16 r4, 0x1e8a
    push16 r4
    ldi16 r4, 0x1fad
    push16 r4
    ldi16 r4, 0x20d0
    push16 r4
    ldi16 r4, 0x06be
    push16 r4
    ldi16 r4, 0x2316
    push16 r4
    ldi16 r4, 0xcf4a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xfa ; TEST
    push16 r0
    push16 r5
    push16 r7
    ldi16 r4, 0x06bd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06bf
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_02f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_EQ_done
.Lld16_general_02f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_02f_EQ_done:
    brne8 .Lld16_general_02f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_NE_done
.Lld16_general_02f_NE_true:
    gp_emit_char 'B'
.Lld16_general_02f_NE_done:
    brult8 .Lld16_general_02f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_ULT_done
.Lld16_general_02f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_02f_ULT_done:
    bruge8 .Lld16_general_02f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_UGE_done
.Lld16_general_02f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_02f_UGE_done:
    brslt8 .Lld16_general_02f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_SLT_done
.Lld16_general_02f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_02f_SLT_done:
    brsge8 .Lld16_general_02f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_02f_SGE_done
.Lld16_general_02f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_02f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r6, spec=0x1C.
    ldi16 r4, 0x06c1
    ldi8 r5, 0xc7
    st8 [r4], r5
    ldi16 r4, 0x06c2
    ldi8 r5, 0xb7
    st8 [r4], r5
    ldi16 r4, 0x06c3
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x06c4
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xc870
    push16 r4
    ldi16 r4, 0x68b1
    push16 r4
    ldi16 r4, 0x1ec7
    push16 r4
    ldi16 r4, 0x1fea
    push16 r4
    ldi16 r4, 0x210d
    push16 r4
    ldi16 r4, 0x2230
    push16 r4
    ldi16 r4, 0x06c2
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
    .byte 0xf0, 0x6c, 0x1c ; TEST
    push16 r1
    push16 r6
    push16 r0
    ldi16 r4, 0x06c1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06c3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_030_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_EQ_done
.Lld16_general_030_EQ_true:
    gp_emit_char 'B'
.Lld16_general_030_EQ_done:
    brne8 .Lld16_general_030_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_NE_done
.Lld16_general_030_NE_true:
    gp_emit_char 'B'
.Lld16_general_030_NE_done:
    brult8 .Lld16_general_030_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_ULT_done
.Lld16_general_030_ULT_true:
    gp_emit_char 'B'
.Lld16_general_030_ULT_done:
    bruge8 .Lld16_general_030_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_UGE_done
.Lld16_general_030_UGE_true:
    gp_emit_char 'B'
.Lld16_general_030_UGE_done:
    brslt8 .Lld16_general_030_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_SLT_done
.Lld16_general_030_SLT_true:
    gp_emit_char 'B'
.Lld16_general_030_SLT_done:
    brsge8 .Lld16_general_030_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_030_SGE_done
.Lld16_general_030_SGE_true:
    gp_emit_char 'B'
.Lld16_general_030_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r6, spec=0x3C.
    ldi16 r4, 0x06c5
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x06c6
    ldi8 r5, 0xef
    st8 [r4], r5
    ldi16 r4, 0x06c7
    ldi8 r5, 0x63
    st8 [r4], r5
    ldi16 r4, 0x06c8
    ldi8 r5, 0x9d
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1cbe
    push16 r4
    ldi16 r4, 0xc99e
    push16 r4
    ldi16 r4, 0x69fb
    push16 r4
    ldi16 r4, 0x2027
    push16 r4
    ldi16 r4, 0x214a
    push16 r4
    ldi16 r4, 0x226d
    push16 r4
    ldi16 r4, 0x06c6
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
    .byte 0xf0, 0x6c, 0x3c ; TEST
    push16 r2
    push16 r6
    push16 r1
    ldi16 r4, 0x06c5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06c7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_031_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_EQ_done
.Lld16_general_031_EQ_true:
    gp_emit_char 'B'
.Lld16_general_031_EQ_done:
    brne8 .Lld16_general_031_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_NE_done
.Lld16_general_031_NE_true:
    gp_emit_char 'B'
.Lld16_general_031_NE_done:
    brult8 .Lld16_general_031_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_ULT_done
.Lld16_general_031_ULT_true:
    gp_emit_char 'B'
.Lld16_general_031_ULT_done:
    bruge8 .Lld16_general_031_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_UGE_done
.Lld16_general_031_UGE_true:
    gp_emit_char 'B'
.Lld16_general_031_UGE_done:
    brslt8 .Lld16_general_031_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_SLT_done
.Lld16_general_031_SLT_true:
    gp_emit_char 'B'
.Lld16_general_031_SLT_done:
    brsge8 .Lld16_general_031_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_031_SGE_done
.Lld16_general_031_SGE_true:
    gp_emit_char 'B'
.Lld16_general_031_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r6, spec=0x5C.
    ldi16 r4, 0x06c9
    ldi8 r5, 0xcd
    st8 [r4], r5
    ldi16 r4, 0x06ca
    ldi8 r5, 0x27
    st8 [r4], r5
    ldi16 r4, 0x06cb
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x06cc
    ldi8 r5, 0xa3
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1cfb
    push16 r4
    ldi16 r4, 0x1e1e
    push16 r4
    ldi16 r4, 0xcacc
    push16 r4
    ldi16 r4, 0x6b45
    push16 r4
    ldi16 r4, 0x2187
    push16 r4
    ldi16 r4, 0x22aa
    push16 r4
    ldi16 r4, 0x06ca
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
    .byte 0xf0, 0x6c, 0x5c ; TEST
    push16 r3
    push16 r6
    push16 r2
    ldi16 r4, 0x06c9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06cb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_032_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_EQ_done
.Lld16_general_032_EQ_true:
    gp_emit_char 'B'
.Lld16_general_032_EQ_done:
    brne8 .Lld16_general_032_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_NE_done
.Lld16_general_032_NE_true:
    gp_emit_char 'B'
.Lld16_general_032_NE_done:
    brult8 .Lld16_general_032_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_ULT_done
.Lld16_general_032_ULT_true:
    gp_emit_char 'B'
.Lld16_general_032_ULT_done:
    bruge8 .Lld16_general_032_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_UGE_done
.Lld16_general_032_UGE_true:
    gp_emit_char 'B'
.Lld16_general_032_UGE_done:
    brslt8 .Lld16_general_032_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_SLT_done
.Lld16_general_032_SLT_true:
    gp_emit_char 'B'
.Lld16_general_032_SLT_done:
    brsge8 .Lld16_general_032_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_032_SGE_done
.Lld16_general_032_SGE_true:
    gp_emit_char 'B'
.Lld16_general_032_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r6, spec=0x7C.
    ldi16 r4, 0x06cd
    ldi8 r5, 0xd0
    st8 [r4], r5
    ldi16 r4, 0x06ce
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x06cf
    ldi8 r5, 0x86
    st8 [r4], r5
    ldi16 r4, 0x06d0
    ldi8 r5, 0xa9
    st8 [r4], r5
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
    ldi16 r4, 0xcbfa
    push16 r4
    ldi16 r4, 0x6c8f
    push16 r4
    ldi16 r4, 0x22e7
    push16 r4
    ldi16 r4, 0x06ce
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
    .byte 0xf0, 0x6c, 0x7c ; TEST
    push16 r4
    push16 r6
    push16 r3
    ldi16 r4, 0x06cd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06cf
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_033_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_EQ_done
.Lld16_general_033_EQ_true:
    gp_emit_char 'B'
.Lld16_general_033_EQ_done:
    brne8 .Lld16_general_033_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_NE_done
.Lld16_general_033_NE_true:
    gp_emit_char 'B'
.Lld16_general_033_NE_done:
    brult8 .Lld16_general_033_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_ULT_done
.Lld16_general_033_ULT_true:
    gp_emit_char 'B'
.Lld16_general_033_ULT_done:
    bruge8 .Lld16_general_033_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_UGE_done
.Lld16_general_033_UGE_true:
    gp_emit_char 'B'
.Lld16_general_033_UGE_done:
    brslt8 .Lld16_general_033_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_SLT_done
.Lld16_general_033_SLT_true:
    gp_emit_char 'B'
.Lld16_general_033_SLT_done:
    brsge8 .Lld16_general_033_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_033_SGE_done
.Lld16_general_033_SGE_true:
    gp_emit_char 'B'
.Lld16_general_033_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r6, spec=0x9C.
    ldi16 r4, 0x06d1
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x06d2
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x06d3
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x06d4
    ldi8 r5, 0xaf
    st8 [r4], r5
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
    ldi16 r4, 0xcd28
    push16 r4
    ldi16 r4, 0x6dd9
    push16 r4
    ldi16 r4, 0x06d2
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
    .byte 0xf0, 0x6c, 0x9c ; TEST
    push16 r5
    push16 r6
    push16 r4
    ldi16 r4, 0x06d1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06d3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_034_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_EQ_done
.Lld16_general_034_EQ_true:
    gp_emit_char 'B'
.Lld16_general_034_EQ_done:
    brne8 .Lld16_general_034_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_NE_done
.Lld16_general_034_NE_true:
    gp_emit_char 'B'
.Lld16_general_034_NE_done:
    brult8 .Lld16_general_034_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_ULT_done
.Lld16_general_034_ULT_true:
    gp_emit_char 'B'
.Lld16_general_034_ULT_done:
    bruge8 .Lld16_general_034_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_UGE_done
.Lld16_general_034_UGE_true:
    gp_emit_char 'B'
.Lld16_general_034_UGE_done:
    brslt8 .Lld16_general_034_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_SLT_done
.Lld16_general_034_SLT_true:
    gp_emit_char 'B'
.Lld16_general_034_SLT_done:
    brsge8 .Lld16_general_034_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_034_SGE_done
.Lld16_general_034_SGE_true:
    gp_emit_char 'B'
.Lld16_general_034_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r6, spec=0xBC.
    ldi16 r4, 0x06d5
    ldi8 r5, 0xd6
    st8 [r4], r5
    ldi16 r4, 0x06d6
    ldi8 r5, 0xcf
    st8 [r4], r5
    ldi16 r4, 0x06d7
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x06d8
    ldi8 r5, 0xb5
    st8 [r4], r5
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
    ldi16 r4, 0xce56
    push16 r4
    ldi16 r4, 0x06d6
    push16 r4
    ldi16 r4, 0x7024
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xbc ; TEST
    push16 r7
    push16 r6
    push16 r5
    ldi16 r4, 0x06d5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06d7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_035_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_EQ_done
.Lld16_general_035_EQ_true:
    gp_emit_char 'B'
.Lld16_general_035_EQ_done:
    brne8 .Lld16_general_035_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_NE_done
.Lld16_general_035_NE_true:
    gp_emit_char 'B'
.Lld16_general_035_NE_done:
    brult8 .Lld16_general_035_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_ULT_done
.Lld16_general_035_ULT_true:
    gp_emit_char 'B'
.Lld16_general_035_ULT_done:
    bruge8 .Lld16_general_035_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_UGE_done
.Lld16_general_035_UGE_true:
    gp_emit_char 'B'
.Lld16_general_035_UGE_done:
    brslt8 .Lld16_general_035_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_SLT_done
.Lld16_general_035_SLT_true:
    gp_emit_char 'B'
.Lld16_general_035_SLT_done:
    brsge8 .Lld16_general_035_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_035_SGE_done
.Lld16_general_035_SGE_true:
    gp_emit_char 'B'
.Lld16_general_035_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r6, spec=0xDC.
    ldi16 r4, 0x06d9
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x06da
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x06db
    ldi8 r5, 0xba
    st8 [r4], r5
    ldi16 r4, 0x06dc
    ldi8 r5, 0xbb
    st8 [r4], r5
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
    ldi16 r4, 0x06da
    push16 r4
    ldi16 r4, 0x706d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xdc ; TEST
    push16 r7
    push16 r6
    push16 r6
    ldi16 r4, 0x06d9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06db
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_036_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_EQ_done
.Lld16_general_036_EQ_true:
    gp_emit_char 'B'
.Lld16_general_036_EQ_done:
    brne8 .Lld16_general_036_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_NE_done
.Lld16_general_036_NE_true:
    gp_emit_char 'B'
.Lld16_general_036_NE_done:
    brult8 .Lld16_general_036_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_ULT_done
.Lld16_general_036_ULT_true:
    gp_emit_char 'B'
.Lld16_general_036_ULT_done:
    bruge8 .Lld16_general_036_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_UGE_done
.Lld16_general_036_UGE_true:
    gp_emit_char 'B'
.Lld16_general_036_UGE_done:
    brslt8 .Lld16_general_036_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_SLT_done
.Lld16_general_036_SLT_true:
    gp_emit_char 'B'
.Lld16_general_036_SLT_done:
    brsge8 .Lld16_general_036_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_036_SGE_done
.Lld16_general_036_SGE_true:
    gp_emit_char 'B'
.Lld16_general_036_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r6, spec=0xFC.
    ldi16 r4, 0x06dd
    ldi8 r5, 0xdc
    st8 [r4], r5
    ldi16 r4, 0x06de
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x06df
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x06e0
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x69af
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
    ldi16 r4, 0x06de
    push16 r4
    ldi16 r4, 0xd0b2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xfc ; TEST
    push16 r0
    push16 r6
    push16 r7
    ldi16 r4, 0x06dd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06df
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_037_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_EQ_done
.Lld16_general_037_EQ_true:
    gp_emit_char 'B'
.Lld16_general_037_EQ_done:
    brne8 .Lld16_general_037_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_NE_done
.Lld16_general_037_NE_true:
    gp_emit_char 'B'
.Lld16_general_037_NE_done:
    brult8 .Lld16_general_037_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_ULT_done
.Lld16_general_037_ULT_true:
    gp_emit_char 'B'
.Lld16_general_037_ULT_done:
    bruge8 .Lld16_general_037_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_UGE_done
.Lld16_general_037_UGE_true:
    gp_emit_char 'B'
.Lld16_general_037_UGE_done:
    brslt8 .Lld16_general_037_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_SLT_done
.Lld16_general_037_SLT_true:
    gp_emit_char 'B'
.Lld16_general_037_SLT_done:
    brsge8 .Lld16_general_037_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_037_SGE_done
.Lld16_general_037_SGE_true:
    gp_emit_char 'B'
.Lld16_general_037_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r0, pointer r7, spec=0x1E.
    ldi16 r4, 0x06e1
    ldi8 r5, 0xe0
    st8 [r4], r5
    ldi16 r4, 0x06e2
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x06e3
    ldi8 r5, 0x5d
    st8 [r4], r5
    ldi16 r4, 0x06e4
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xc9d8
    push16 r4
    ldi16 r4, 0x6af9
    push16 r4
    ldi16 r4, 0x20af
    push16 r4
    ldi16 r4, 0x21d2
    push16 r4
    ldi16 r4, 0x22f5
    push16 r4
    ldi16 r4, 0x2418
    push16 r4
    ldi16 r4, 0x253b
    push16 r4
    ldi16 r4, 0x06e2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x1e ; TEST
    push16 r1
    push16 r7
    push16 r0
    ldi16 r4, 0x06e1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06e3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_038_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_EQ_done
.Lld16_general_038_EQ_true:
    gp_emit_char 'B'
.Lld16_general_038_EQ_done:
    brne8 .Lld16_general_038_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_NE_done
.Lld16_general_038_NE_true:
    gp_emit_char 'B'
.Lld16_general_038_NE_done:
    brult8 .Lld16_general_038_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_ULT_done
.Lld16_general_038_ULT_true:
    gp_emit_char 'B'
.Lld16_general_038_ULT_done:
    bruge8 .Lld16_general_038_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_UGE_done
.Lld16_general_038_UGE_true:
    gp_emit_char 'B'
.Lld16_general_038_UGE_done:
    brslt8 .Lld16_general_038_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_SLT_done
.Lld16_general_038_SLT_true:
    gp_emit_char 'B'
.Lld16_general_038_SLT_done:
    brsge8 .Lld16_general_038_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_038_SGE_done
.Lld16_general_038_SGE_true:
    gp_emit_char 'B'
.Lld16_general_038_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r1, pointer r7, spec=0x3E.
    ldi16 r4, 0x06e5
    ldi8 r5, 0xe3
    st8 [r4], r5
    ldi16 r4, 0x06e6
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x06e7
    ldi8 r5, 0x6e
    st8 [r4], r5
    ldi16 r4, 0x06e8
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1ea6
    push16 r4
    ldi16 r4, 0xcb06
    push16 r4
    ldi16 r4, 0x6c43
    push16 r4
    ldi16 r4, 0x220f
    push16 r4
    ldi16 r4, 0x2332
    push16 r4
    ldi16 r4, 0x2455
    push16 r4
    ldi16 r4, 0x2578
    push16 r4
    ldi16 r4, 0x06e6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x3e ; TEST
    push16 r2
    push16 r7
    push16 r1
    ldi16 r4, 0x06e5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06e7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_039_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_EQ_done
.Lld16_general_039_EQ_true:
    gp_emit_char 'B'
.Lld16_general_039_EQ_done:
    brne8 .Lld16_general_039_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_NE_done
.Lld16_general_039_NE_true:
    gp_emit_char 'B'
.Lld16_general_039_NE_done:
    brult8 .Lld16_general_039_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_ULT_done
.Lld16_general_039_ULT_true:
    gp_emit_char 'B'
.Lld16_general_039_ULT_done:
    bruge8 .Lld16_general_039_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_UGE_done
.Lld16_general_039_UGE_true:
    gp_emit_char 'B'
.Lld16_general_039_UGE_done:
    brslt8 .Lld16_general_039_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_SLT_done
.Lld16_general_039_SLT_true:
    gp_emit_char 'B'
.Lld16_general_039_SLT_done:
    brsge8 .Lld16_general_039_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_039_SGE_done
.Lld16_general_039_SGE_true:
    gp_emit_char 'B'
.Lld16_general_039_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r2, pointer r7, spec=0x5E.
    ldi16 r4, 0x06e9
    ldi8 r5, 0xe6
    st8 [r4], r5
    ldi16 r4, 0x06ea
    ldi8 r5, 0xf0
    st8 [r4], r5
    ldi16 r4, 0x06eb
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x06ec
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1ee3
    push16 r4
    ldi16 r4, 0x2006
    push16 r4
    ldi16 r4, 0xcc34
    push16 r4
    ldi16 r4, 0x6d8d
    push16 r4
    ldi16 r4, 0x236f
    push16 r4
    ldi16 r4, 0x2492
    push16 r4
    ldi16 r4, 0x25b5
    push16 r4
    ldi16 r4, 0x06ea
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x5e ; TEST
    push16 r3
    push16 r7
    push16 r2
    ldi16 r4, 0x06e9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06eb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_EQ_done
.Lld16_general_03a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03a_EQ_done:
    brne8 .Lld16_general_03a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_NE_done
.Lld16_general_03a_NE_true:
    gp_emit_char 'B'
.Lld16_general_03a_NE_done:
    brult8 .Lld16_general_03a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_ULT_done
.Lld16_general_03a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03a_ULT_done:
    bruge8 .Lld16_general_03a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_UGE_done
.Lld16_general_03a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03a_UGE_done:
    brslt8 .Lld16_general_03a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_SLT_done
.Lld16_general_03a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03a_SLT_done:
    brsge8 .Lld16_general_03a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03a_SGE_done
.Lld16_general_03a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r3, pointer r7, spec=0x7E.
    ldi16 r4, 0x06ed
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x06ee
    ldi8 r5, 0x28
    st8 [r4], r5
    ldi16 r4, 0x06ef
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x06f0
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1f20
    push16 r4
    ldi16 r4, 0x2043
    push16 r4
    ldi16 r4, 0x2166
    push16 r4
    ldi16 r4, 0xcd62
    push16 r4
    ldi16 r4, 0x6ed7
    push16 r4
    ldi16 r4, 0x24cf
    push16 r4
    ldi16 r4, 0x25f2
    push16 r4
    ldi16 r4, 0x06ee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x7e ; TEST
    push16 r4
    push16 r7
    push16 r3
    ldi16 r4, 0x06ed
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06ef
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_EQ_done
.Lld16_general_03b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03b_EQ_done:
    brne8 .Lld16_general_03b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_NE_done
.Lld16_general_03b_NE_true:
    gp_emit_char 'B'
.Lld16_general_03b_NE_done:
    brult8 .Lld16_general_03b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_ULT_done
.Lld16_general_03b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03b_ULT_done:
    bruge8 .Lld16_general_03b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_UGE_done
.Lld16_general_03b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03b_UGE_done:
    brslt8 .Lld16_general_03b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_SLT_done
.Lld16_general_03b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03b_SLT_done:
    brsge8 .Lld16_general_03b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03b_SGE_done
.Lld16_general_03b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r4, pointer r7, spec=0x9E.
    ldi16 r4, 0x06f1
    ldi8 r5, 0xec
    st8 [r4], r5
    ldi16 r4, 0x06f2
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x06f3
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x06f4
    ldi8 r5, 0xd7
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1f5d
    push16 r4
    ldi16 r4, 0x2080
    push16 r4
    ldi16 r4, 0x21a3
    push16 r4
    ldi16 r4, 0x22c6
    push16 r4
    ldi16 r4, 0xce90
    push16 r4
    ldi16 r4, 0x7021
    push16 r4
    ldi16 r4, 0x262f
    push16 r4
    ldi16 r4, 0x06f2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x9e ; TEST
    push16 r5
    push16 r7
    push16 r4
    ldi16 r4, 0x06f1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06f3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_EQ_done
.Lld16_general_03c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03c_EQ_done:
    brne8 .Lld16_general_03c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_NE_done
.Lld16_general_03c_NE_true:
    gp_emit_char 'B'
.Lld16_general_03c_NE_done:
    brult8 .Lld16_general_03c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_ULT_done
.Lld16_general_03c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03c_ULT_done:
    bruge8 .Lld16_general_03c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_UGE_done
.Lld16_general_03c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03c_UGE_done:
    brslt8 .Lld16_general_03c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_SLT_done
.Lld16_general_03c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03c_SLT_done:
    brsge8 .Lld16_general_03c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03c_SGE_done
.Lld16_general_03c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r5, pointer r7, spec=0xBE.
    ldi16 r4, 0x06f5
    ldi8 r5, 0xef
    st8 [r4], r5
    ldi16 r4, 0x06f6
    ldi8 r5, 0x98
    st8 [r4], r5
    ldi16 r4, 0x06f7
    ldi8 r5, 0xb3
    st8 [r4], r5
    ldi16 r4, 0x06f8
    ldi8 r5, 0xdd
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
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
    ldi16 r4, 0xcfbe
    push16 r4
    ldi16 r4, 0x716b
    push16 r4
    ldi16 r4, 0x06f6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xbe ; TEST
    push16 r6
    push16 r7
    push16 r5
    ldi16 r4, 0x06f5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06f7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_EQ_done
.Lld16_general_03d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03d_EQ_done:
    brne8 .Lld16_general_03d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_NE_done
.Lld16_general_03d_NE_true:
    gp_emit_char 'B'
.Lld16_general_03d_NE_done:
    brult8 .Lld16_general_03d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_ULT_done
.Lld16_general_03d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03d_ULT_done:
    bruge8 .Lld16_general_03d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_UGE_done
.Lld16_general_03d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03d_UGE_done:
    brslt8 .Lld16_general_03d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_SLT_done
.Lld16_general_03d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03d_SLT_done:
    brsge8 .Lld16_general_03d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03d_SGE_done
.Lld16_general_03d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r6, pointer r7, spec=0xDE.
    ldi16 r4, 0x06f9
    ldi8 r5, 0xf2
    st8 [r4], r5
    ldi16 r4, 0x06fa
    ldi8 r5, 0xd0
    st8 [r4], r5
    ldi16 r4, 0x06fb
    ldi8 r5, 0xc4
    st8 [r4], r5
    ldi16 r4, 0x06fc
    ldi8 r5, 0xe3
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6bae
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
    ldi16 r4, 0xd0ec
    push16 r4
    ldi16 r4, 0x06fa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xde ; TEST
    push16 r0
    push16 r7
    push16 r6
    ldi16 r4, 0x06f9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06fb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_EQ_done
.Lld16_general_03e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03e_EQ_done:
    brne8 .Lld16_general_03e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_NE_done
.Lld16_general_03e_NE_true:
    gp_emit_char 'B'
.Lld16_general_03e_NE_done:
    brult8 .Lld16_general_03e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_ULT_done
.Lld16_general_03e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03e_ULT_done:
    bruge8 .Lld16_general_03e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_UGE_done
.Lld16_general_03e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03e_UGE_done:
    brslt8 .Lld16_general_03e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_SLT_done
.Lld16_general_03e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03e_SLT_done:
    brsge8 .Lld16_general_03e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03e_SGE_done
.Lld16_general_03e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: ordinary, data r7, pointer r7, spec=0xFE.
    ldi16 r4, 0x06fd
    ldi8 r5, 0xf5
    st8 [r4], r5
    ldi16 r4, 0x06fe
    ldi8 r5, 0x08
    st8 [r4], r5
    ldi16 r4, 0x06ff
    ldi8 r5, 0xd6
    st8 [r4], r5
    ldi16 r4, 0x0700
    ldi8 r5, 0xe9
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6bf7
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
    ldi16 r4, 0x26e6
    push16 r4
    ldi16 r4, 0x06fe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xfe ; TEST
    push16 r0
    push16 r7
    push16 r7
    ldi16 r4, 0x06fd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x06ff
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_03f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_EQ_done
.Lld16_general_03f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_03f_EQ_done:
    brne8 .Lld16_general_03f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_NE_done
.Lld16_general_03f_NE_true:
    gp_emit_char 'B'
.Lld16_general_03f_NE_done:
    brult8 .Lld16_general_03f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_ULT_done
.Lld16_general_03f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_03f_ULT_done:
    bruge8 .Lld16_general_03f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_UGE_done
.Lld16_general_03f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_03f_UGE_done:
    brslt8 .Lld16_general_03f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_SLT_done
.Lld16_general_03f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_03f_SLT_done:
    brsge8 .Lld16_general_03f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_03f_SGE_done
.Lld16_general_03f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_03f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r0, spec=0x31.
    ldi16 r4, 0x0701
    ldi8 r5, 0xf1
    st8 [r4], r5
    ldi16 r4, 0x0702
    ldi8 r5, 0xc2
    st8 [r4], r5
    ldi16 r4, 0x0703
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x0704
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0702
    push16 r4
    ldi16 r4, 0xcc41
    push16 r4
    ldi16 r4, 0x6e42
    push16 r4
    ldi16 r4, 0x23ba
    push16 r4
    ldi16 r4, 0x24dd
    push16 r4
    ldi16 r4, 0x2600
    push16 r4
    ldi16 r4, 0x2723
    push16 r4
    ldi16 r4, 0x2846
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x31 ; TEST
    push16 r2
    push16 r0
    push16 r1
    ldi16 r4, 0x0701
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0703
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_040_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_EQ_done
.Lld16_general_040_EQ_true:
    gp_emit_char 'B'
.Lld16_general_040_EQ_done:
    brne8 .Lld16_general_040_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_NE_done
.Lld16_general_040_NE_true:
    gp_emit_char 'B'
.Lld16_general_040_NE_done:
    brult8 .Lld16_general_040_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_ULT_done
.Lld16_general_040_ULT_true:
    gp_emit_char 'B'
.Lld16_general_040_ULT_done:
    bruge8 .Lld16_general_040_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_UGE_done
.Lld16_general_040_UGE_true:
    gp_emit_char 'B'
.Lld16_general_040_UGE_done:
    brslt8 .Lld16_general_040_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_SLT_done
.Lld16_general_040_SLT_true:
    gp_emit_char 'B'
.Lld16_general_040_SLT_done:
    brsge8 .Lld16_general_040_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_040_SGE_done
.Lld16_general_040_SGE_true:
    gp_emit_char 'B'
.Lld16_general_040_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r0, spec=0x51.
    ldi16 r4, 0x0705
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x0706
    ldi8 r5, 0xfa
    st8 [r4], r5
    ldi16 r4, 0x0707
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0708
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0706
    push16 r4
    ldi16 r4, 0x21b1
    push16 r4
    ldi16 r4, 0xcd6f
    push16 r4
    ldi16 r4, 0x6f8c
    push16 r4
    ldi16 r4, 0x251a
    push16 r4
    ldi16 r4, 0x263d
    push16 r4
    ldi16 r4, 0x2760
    push16 r4
    ldi16 r4, 0x2883
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x51 ; TEST
    push16 r3
    push16 r0
    push16 r2
    ldi16 r4, 0x0705
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0707
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_041_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_EQ_done
.Lld16_general_041_EQ_true:
    gp_emit_char 'B'
.Lld16_general_041_EQ_done:
    brne8 .Lld16_general_041_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_NE_done
.Lld16_general_041_NE_true:
    gp_emit_char 'B'
.Lld16_general_041_NE_done:
    brult8 .Lld16_general_041_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_ULT_done
.Lld16_general_041_ULT_true:
    gp_emit_char 'B'
.Lld16_general_041_ULT_done:
    bruge8 .Lld16_general_041_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_UGE_done
.Lld16_general_041_UGE_true:
    gp_emit_char 'B'
.Lld16_general_041_UGE_done:
    brslt8 .Lld16_general_041_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_SLT_done
.Lld16_general_041_SLT_true:
    gp_emit_char 'B'
.Lld16_general_041_SLT_done:
    brsge8 .Lld16_general_041_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_041_SGE_done
.Lld16_general_041_SGE_true:
    gp_emit_char 'B'
.Lld16_general_041_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r0, spec=0x71.
    ldi16 r4, 0x0709
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x070a
    ldi8 r5, 0x32
    st8 [r4], r5
    ldi16 r4, 0x070b
    ldi8 r5, 0x92
    st8 [r4], r5
    ldi16 r4, 0x070c
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x070a
    push16 r4
    ldi16 r4, 0x21ee
    push16 r4
    ldi16 r4, 0x2311
    push16 r4
    ldi16 r4, 0xce9d
    push16 r4
    ldi16 r4, 0x70d6
    push16 r4
    ldi16 r4, 0x267a
    push16 r4
    ldi16 r4, 0x279d
    push16 r4
    ldi16 r4, 0x28c0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x71 ; TEST
    push16 r4
    push16 r0
    push16 r3
    ldi16 r4, 0x0709
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x070b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_042_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_EQ_done
.Lld16_general_042_EQ_true:
    gp_emit_char 'B'
.Lld16_general_042_EQ_done:
    brne8 .Lld16_general_042_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_NE_done
.Lld16_general_042_NE_true:
    gp_emit_char 'B'
.Lld16_general_042_NE_done:
    brult8 .Lld16_general_042_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_ULT_done
.Lld16_general_042_ULT_true:
    gp_emit_char 'B'
.Lld16_general_042_ULT_done:
    bruge8 .Lld16_general_042_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_UGE_done
.Lld16_general_042_UGE_true:
    gp_emit_char 'B'
.Lld16_general_042_UGE_done:
    brslt8 .Lld16_general_042_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_SLT_done
.Lld16_general_042_SLT_true:
    gp_emit_char 'B'
.Lld16_general_042_SLT_done:
    brsge8 .Lld16_general_042_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_042_SGE_done
.Lld16_general_042_SGE_true:
    gp_emit_char 'B'
.Lld16_general_042_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r0, spec=0x91.
    ldi16 r4, 0x070d
    ldi8 r5, 0xfa
    st8 [r4], r5
    ldi16 r4, 0x070e
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x070f
    ldi8 r5, 0xa3
    st8 [r4], r5
    ldi16 r4, 0x0710
    ldi8 r5, 0xfa
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x070e
    push16 r4
    ldi16 r4, 0x222b
    push16 r4
    ldi16 r4, 0x234e
    push16 r4
    ldi16 r4, 0x2471
    push16 r4
    ldi16 r4, 0xcfcb
    push16 r4
    ldi16 r4, 0x7220
    push16 r4
    ldi16 r4, 0x27da
    push16 r4
    ldi16 r4, 0x28fd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x91 ; TEST
    push16 r5
    push16 r0
    push16 r4
    ldi16 r4, 0x070d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x070f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_043_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_EQ_done
.Lld16_general_043_EQ_true:
    gp_emit_char 'B'
.Lld16_general_043_EQ_done:
    brne8 .Lld16_general_043_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_NE_done
.Lld16_general_043_NE_true:
    gp_emit_char 'B'
.Lld16_general_043_NE_done:
    brult8 .Lld16_general_043_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_ULT_done
.Lld16_general_043_ULT_true:
    gp_emit_char 'B'
.Lld16_general_043_ULT_done:
    bruge8 .Lld16_general_043_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_UGE_done
.Lld16_general_043_UGE_true:
    gp_emit_char 'B'
.Lld16_general_043_UGE_done:
    brslt8 .Lld16_general_043_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_SLT_done
.Lld16_general_043_SLT_true:
    gp_emit_char 'B'
.Lld16_general_043_SLT_done:
    brsge8 .Lld16_general_043_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_043_SGE_done
.Lld16_general_043_SGE_true:
    gp_emit_char 'B'
.Lld16_general_043_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r0, spec=0xB1.
    ldi16 r4, 0x0711
    ldi8 r5, 0xfd
    st8 [r4], r5
    ldi16 r4, 0x0712
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x0713
    ldi8 r5, 0xb4
    st8 [r4], r5
    ldi16 r4, 0x0714
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0712
    push16 r4
    ldi16 r4, 0x2268
    push16 r4
    ldi16 r4, 0x238b
    push16 r4
    ldi16 r4, 0x24ae
    push16 r4
    ldi16 r4, 0x25d1
    push16 r4
    ldi16 r4, 0xd0f9
    push16 r4
    ldi16 r4, 0x736a
    push16 r4
    ldi16 r4, 0x293a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xb1 ; TEST
    push16 r6
    push16 r0
    push16 r5
    ldi16 r4, 0x0711
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0713
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_044_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_EQ_done
.Lld16_general_044_EQ_true:
    gp_emit_char 'B'
.Lld16_general_044_EQ_done:
    brne8 .Lld16_general_044_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_NE_done
.Lld16_general_044_NE_true:
    gp_emit_char 'B'
.Lld16_general_044_NE_done:
    brult8 .Lld16_general_044_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_ULT_done
.Lld16_general_044_ULT_true:
    gp_emit_char 'B'
.Lld16_general_044_ULT_done:
    bruge8 .Lld16_general_044_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_UGE_done
.Lld16_general_044_UGE_true:
    gp_emit_char 'B'
.Lld16_general_044_UGE_done:
    brslt8 .Lld16_general_044_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_SLT_done
.Lld16_general_044_SLT_true:
    gp_emit_char 'B'
.Lld16_general_044_SLT_done:
    brsge8 .Lld16_general_044_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_044_SGE_done
.Lld16_general_044_SGE_true:
    gp_emit_char 'B'
.Lld16_general_044_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r0, spec=0xD1.
    ldi16 r4, 0x0715
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0716
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x0717
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x0718
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0716
    push16 r4
    ldi16 r4, 0x22a5
    push16 r4
    ldi16 r4, 0x23c8
    push16 r4
    ldi16 r4, 0x24eb
    push16 r4
    ldi16 r4, 0x260e
    push16 r4
    ldi16 r4, 0x2731
    push16 r4
    ldi16 r4, 0xd227
    push16 r4
    ldi16 r4, 0x74b4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd1 ; TEST
    push16 r7
    push16 r0
    push16 r6
    ldi16 r4, 0x0715
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0717
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_045_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_EQ_done
.Lld16_general_045_EQ_true:
    gp_emit_char 'B'
.Lld16_general_045_EQ_done:
    brne8 .Lld16_general_045_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_NE_done
.Lld16_general_045_NE_true:
    gp_emit_char 'B'
.Lld16_general_045_NE_done:
    brult8 .Lld16_general_045_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_ULT_done
.Lld16_general_045_ULT_true:
    gp_emit_char 'B'
.Lld16_general_045_ULT_done:
    bruge8 .Lld16_general_045_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_UGE_done
.Lld16_general_045_UGE_true:
    gp_emit_char 'B'
.Lld16_general_045_UGE_done:
    brslt8 .Lld16_general_045_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_SLT_done
.Lld16_general_045_SLT_true:
    gp_emit_char 'B'
.Lld16_general_045_SLT_done:
    brsge8 .Lld16_general_045_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_045_SGE_done
.Lld16_general_045_SGE_true:
    gp_emit_char 'B'
.Lld16_general_045_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r0, spec=0xF1.
    ldi16 r4, 0x0719
    ldi8 r5, 0x03
    st8 [r4], r5
    ldi16 r4, 0x071a
    ldi8 r5, 0x12
    st8 [r4], r5
    ldi16 r4, 0x071b
    ldi8 r5, 0xd7
    st8 [r4], r5
    ldi16 r4, 0x071c
    ldi8 r5, 0x0c
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x071a
    push16 r4
    ldi16 r4, 0x6ef7
    push16 r4
    ldi16 r4, 0x2405
    push16 r4
    ldi16 r4, 0x2528
    push16 r4
    ldi16 r4, 0x264b
    push16 r4
    ldi16 r4, 0x276e
    push16 r4
    ldi16 r4, 0x2891
    push16 r4
    ldi16 r4, 0xd355
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf1 ; TEST
    push16 r1
    push16 r0
    push16 r7
    ldi16 r4, 0x0719
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x071b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_046_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_EQ_done
.Lld16_general_046_EQ_true:
    gp_emit_char 'B'
.Lld16_general_046_EQ_done:
    brne8 .Lld16_general_046_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_NE_done
.Lld16_general_046_NE_true:
    gp_emit_char 'B'
.Lld16_general_046_NE_done:
    brult8 .Lld16_general_046_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_ULT_done
.Lld16_general_046_ULT_true:
    gp_emit_char 'B'
.Lld16_general_046_ULT_done:
    bruge8 .Lld16_general_046_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_UGE_done
.Lld16_general_046_UGE_true:
    gp_emit_char 'B'
.Lld16_general_046_UGE_done:
    brslt8 .Lld16_general_046_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_SLT_done
.Lld16_general_046_SLT_true:
    gp_emit_char 'B'
.Lld16_general_046_SLT_done:
    brsge8 .Lld16_general_046_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_046_SGE_done
.Lld16_general_046_SGE_true:
    gp_emit_char 'B'
.Lld16_general_046_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r1, spec=0x13.
    ldi16 r4, 0x071d
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x071e
    ldi8 r5, 0x53
    st8 [r4], r5
    ldi16 r4, 0x071f
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x0720
    ldi8 r5, 0x0a
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xcc7b
    push16 r4
    ldi16 r4, 0x071e
    push16 r4
    ldi16 r4, 0x7041
    push16 r4
    ldi16 r4, 0x2565
    push16 r4
    ldi16 r4, 0x2688
    push16 r4
    ldi16 r4, 0x27ab
    push16 r4
    ldi16 r4, 0x28ce
    push16 r4
    ldi16 r4, 0x29f1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x13 ; TEST
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x071d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x071f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_047_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_EQ_done
.Lld16_general_047_EQ_true:
    gp_emit_char 'B'
.Lld16_general_047_EQ_done:
    brne8 .Lld16_general_047_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_NE_done
.Lld16_general_047_NE_true:
    gp_emit_char 'B'
.Lld16_general_047_NE_done:
    brult8 .Lld16_general_047_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_ULT_done
.Lld16_general_047_ULT_true:
    gp_emit_char 'B'
.Lld16_general_047_ULT_done:
    bruge8 .Lld16_general_047_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_UGE_done
.Lld16_general_047_UGE_true:
    gp_emit_char 'B'
.Lld16_general_047_UGE_done:
    brslt8 .Lld16_general_047_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_SLT_done
.Lld16_general_047_SLT_true:
    gp_emit_char 'B'
.Lld16_general_047_SLT_done:
    brsge8 .Lld16_general_047_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_047_SGE_done
.Lld16_general_047_SGE_true:
    gp_emit_char 'B'
.Lld16_general_047_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r1, spec=0x53.
    ldi16 r4, 0x0721
    ldi8 r5, 0x0a
    st8 [r4], r5
    ldi16 r4, 0x0722
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x0723
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x0724
    ldi8 r5, 0x11
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2239
    push16 r4
    ldi16 r4, 0x0722
    push16 r4
    ldi16 r4, 0xceaa
    push16 r4
    ldi16 r4, 0x718b
    push16 r4
    ldi16 r4, 0x26c5
    push16 r4
    ldi16 r4, 0x27e8
    push16 r4
    ldi16 r4, 0x290b
    push16 r4
    ldi16 r4, 0x2a2e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x53 ; TEST
    push16 r3
    push16 r1
    push16 r2
    ldi16 r4, 0x0721
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0723
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_048_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_EQ_done
.Lld16_general_048_EQ_true:
    gp_emit_char 'B'
.Lld16_general_048_EQ_done:
    brne8 .Lld16_general_048_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_NE_done
.Lld16_general_048_NE_true:
    gp_emit_char 'B'
.Lld16_general_048_NE_done:
    brult8 .Lld16_general_048_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_ULT_done
.Lld16_general_048_ULT_true:
    gp_emit_char 'B'
.Lld16_general_048_ULT_done:
    bruge8 .Lld16_general_048_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_UGE_done
.Lld16_general_048_UGE_true:
    gp_emit_char 'B'
.Lld16_general_048_UGE_done:
    brslt8 .Lld16_general_048_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_SLT_done
.Lld16_general_048_SLT_true:
    gp_emit_char 'B'
.Lld16_general_048_SLT_done:
    brsge8 .Lld16_general_048_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_048_SGE_done
.Lld16_general_048_SGE_true:
    gp_emit_char 'B'
.Lld16_general_048_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r1, spec=0x73.
    ldi16 r4, 0x0725
    ldi8 r5, 0x0d
    st8 [r4], r5
    ldi16 r4, 0x0726
    ldi8 r5, 0xc4
    st8 [r4], r5
    ldi16 r4, 0x0727
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x0728
    ldi8 r5, 0x17
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2276
    push16 r4
    ldi16 r4, 0x0726
    push16 r4
    ldi16 r4, 0x70d3
    push16 r4
    ldi16 r4, 0xcfd8
    push16 r4
    ldi16 r4, 0x2702
    push16 r4
    ldi16 r4, 0x2825
    push16 r4
    ldi16 r4, 0x2948
    push16 r4
    ldi16 r4, 0x2a6b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x73 ; TEST
    push16 r2
    push16 r1
    push16 r3
    ldi16 r4, 0x0725
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0727
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_049_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_EQ_done
.Lld16_general_049_EQ_true:
    gp_emit_char 'B'
.Lld16_general_049_EQ_done:
    brne8 .Lld16_general_049_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_NE_done
.Lld16_general_049_NE_true:
    gp_emit_char 'B'
.Lld16_general_049_NE_done:
    brult8 .Lld16_general_049_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_ULT_done
.Lld16_general_049_ULT_true:
    gp_emit_char 'B'
.Lld16_general_049_ULT_done:
    bruge8 .Lld16_general_049_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_UGE_done
.Lld16_general_049_UGE_true:
    gp_emit_char 'B'
.Lld16_general_049_UGE_done:
    brslt8 .Lld16_general_049_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_SLT_done
.Lld16_general_049_SLT_true:
    gp_emit_char 'B'
.Lld16_general_049_SLT_done:
    brsge8 .Lld16_general_049_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_049_SGE_done
.Lld16_general_049_SGE_true:
    gp_emit_char 'B'
.Lld16_general_049_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r1, spec=0x93.
    ldi16 r4, 0x0729
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x072a
    ldi8 r5, 0xfc
    st8 [r4], r5
    ldi16 r4, 0x072b
    ldi8 r5, 0xac
    st8 [r4], r5
    ldi16 r4, 0x072c
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x22b3
    push16 r4
    ldi16 r4, 0x072a
    push16 r4
    ldi16 r4, 0x24f9
    push16 r4
    ldi16 r4, 0x721d
    push16 r4
    ldi16 r4, 0xd106
    push16 r4
    ldi16 r4, 0x2862
    push16 r4
    ldi16 r4, 0x2985
    push16 r4
    ldi16 r4, 0x2aa8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x93 ; TEST
    push16 r3
    push16 r1
    push16 r4
    ldi16 r4, 0x0729
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x072b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_EQ_done
.Lld16_general_04a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04a_EQ_done:
    brne8 .Lld16_general_04a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_NE_done
.Lld16_general_04a_NE_true:
    gp_emit_char 'B'
.Lld16_general_04a_NE_done:
    brult8 .Lld16_general_04a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_ULT_done
.Lld16_general_04a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04a_ULT_done:
    bruge8 .Lld16_general_04a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_UGE_done
.Lld16_general_04a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04a_UGE_done:
    brslt8 .Lld16_general_04a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_SLT_done
.Lld16_general_04a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04a_SLT_done:
    brsge8 .Lld16_general_04a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04a_SGE_done
.Lld16_general_04a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r1, spec=0xB3.
    ldi16 r4, 0x072d
    ldi8 r5, 0x13
    st8 [r4], r5
    ldi16 r4, 0x072e
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x072f
    ldi8 r5, 0xbe
    st8 [r4], r5
    ldi16 r4, 0x0730
    ldi8 r5, 0x23
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x22f0
    push16 r4
    ldi16 r4, 0x072e
    push16 r4
    ldi16 r4, 0x2536
    push16 r4
    ldi16 r4, 0x2659
    push16 r4
    ldi16 r4, 0x7367
    push16 r4
    ldi16 r4, 0xd234
    push16 r4
    ldi16 r4, 0x29c2
    push16 r4
    ldi16 r4, 0x2ae5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xb3 ; TEST
    push16 r4
    push16 r1
    push16 r5
    ldi16 r4, 0x072d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x072f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_EQ_done
.Lld16_general_04b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04b_EQ_done:
    brne8 .Lld16_general_04b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_NE_done
.Lld16_general_04b_NE_true:
    gp_emit_char 'B'
.Lld16_general_04b_NE_done:
    brult8 .Lld16_general_04b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_ULT_done
.Lld16_general_04b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04b_ULT_done:
    bruge8 .Lld16_general_04b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_UGE_done
.Lld16_general_04b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04b_UGE_done:
    brslt8 .Lld16_general_04b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_SLT_done
.Lld16_general_04b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04b_SLT_done:
    brsge8 .Lld16_general_04b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04b_SGE_done
.Lld16_general_04b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r1, spec=0xD3.
    ldi16 r4, 0x0731
    ldi8 r5, 0x16
    st8 [r4], r5
    ldi16 r4, 0x0732
    ldi8 r5, 0x6c
    st8 [r4], r5
    ldi16 r4, 0x0733
    ldi8 r5, 0xcf
    st8 [r4], r5
    ldi16 r4, 0x0734
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x232d
    push16 r4
    ldi16 r4, 0x0732
    push16 r4
    ldi16 r4, 0x2573
    push16 r4
    ldi16 r4, 0x2696
    push16 r4
    ldi16 r4, 0x27b9
    push16 r4
    ldi16 r4, 0x74b1
    push16 r4
    ldi16 r4, 0xd362
    push16 r4
    ldi16 r4, 0x2b22
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd3 ; TEST
    push16 r5
    push16 r1
    push16 r6
    ldi16 r4, 0x0731
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0733
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_EQ_done
.Lld16_general_04c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04c_EQ_done:
    brne8 .Lld16_general_04c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_NE_done
.Lld16_general_04c_NE_true:
    gp_emit_char 'B'
.Lld16_general_04c_NE_done:
    brult8 .Lld16_general_04c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_ULT_done
.Lld16_general_04c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04c_ULT_done:
    bruge8 .Lld16_general_04c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_UGE_done
.Lld16_general_04c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04c_UGE_done:
    brslt8 .Lld16_general_04c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_SLT_done
.Lld16_general_04c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04c_SLT_done:
    brsge8 .Lld16_general_04c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04c_SGE_done
.Lld16_general_04c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r1, spec=0xF3.
    ldi16 r4, 0x0735
    ldi8 r5, 0x19
    st8 [r4], r5
    ldi16 r4, 0x0736
    ldi8 r5, 0xa4
    st8 [r4], r5
    ldi16 r4, 0x0737
    ldi8 r5, 0xe0
    st8 [r4], r5
    ldi16 r4, 0x0738
    ldi8 r5, 0x2f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x236a
    push16 r4
    ldi16 r4, 0x0736
    push16 r4
    ldi16 r4, 0x25b0
    push16 r4
    ldi16 r4, 0x26d3
    push16 r4
    ldi16 r4, 0x27f6
    push16 r4
    ldi16 r4, 0x2919
    push16 r4
    ldi16 r4, 0x75fb
    push16 r4
    ldi16 r4, 0xd490
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf3 ; TEST
    push16 r6
    push16 r1
    push16 r7
    ldi16 r4, 0x0735
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0737
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_EQ_done
.Lld16_general_04d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04d_EQ_done:
    brne8 .Lld16_general_04d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_NE_done
.Lld16_general_04d_NE_true:
    gp_emit_char 'B'
.Lld16_general_04d_NE_done:
    brult8 .Lld16_general_04d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_ULT_done
.Lld16_general_04d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04d_ULT_done:
    bruge8 .Lld16_general_04d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_UGE_done
.Lld16_general_04d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04d_UGE_done:
    brslt8 .Lld16_general_04d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_SLT_done
.Lld16_general_04d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04d_SLT_done:
    brsge8 .Lld16_general_04d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04d_SGE_done
.Lld16_general_04d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r2, spec=0x15.
    ldi16 r4, 0x0739
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x073a
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x073b
    ldi8 r5, 0x72
    st8 [r4], r5
    ldi16 r4, 0x073c
    ldi8 r5, 0x2d
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xcdb6
    push16 r4
    ldi16 r4, 0x24ca
    push16 r4
    ldi16 r4, 0x073a
    push16 r4
    ldi16 r4, 0x2710
    push16 r4
    ldi16 r4, 0x2833
    push16 r4
    ldi16 r4, 0x2956
    push16 r4
    ldi16 r4, 0x2a79
    push16 r4
    ldi16 r4, 0x7745
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x15 ; TEST
    push16 r7
    push16 r2
    push16 r0
    ldi16 r4, 0x0739
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x073b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_EQ_done
.Lld16_general_04e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04e_EQ_done:
    brne8 .Lld16_general_04e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_NE_done
.Lld16_general_04e_NE_true:
    gp_emit_char 'B'
.Lld16_general_04e_NE_done:
    brult8 .Lld16_general_04e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_ULT_done
.Lld16_general_04e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04e_ULT_done:
    bruge8 .Lld16_general_04e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_UGE_done
.Lld16_general_04e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04e_UGE_done:
    brslt8 .Lld16_general_04e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_SLT_done
.Lld16_general_04e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04e_SLT_done:
    brsge8 .Lld16_general_04e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04e_SGE_done
.Lld16_general_04e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r2, spec=0x35.
    ldi16 r4, 0x073d
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x073e
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x073f
    ldi8 r5, 0x84
    st8 [r4], r5
    ldi16 r4, 0x0740
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7087
    push16 r4
    ldi16 r4, 0xcee4
    push16 r4
    ldi16 r4, 0x073e
    push16 r4
    ldi16 r4, 0x274d
    push16 r4
    ldi16 r4, 0x2870
    push16 r4
    ldi16 r4, 0x2993
    push16 r4
    ldi16 r4, 0x2ab6
    push16 r4
    ldi16 r4, 0x2bd9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x35 ; TEST
    push16 r0
    push16 r2
    push16 r1
    ldi16 r4, 0x073d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x073f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_04f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_EQ_done
.Lld16_general_04f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_04f_EQ_done:
    brne8 .Lld16_general_04f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_NE_done
.Lld16_general_04f_NE_true:
    gp_emit_char 'B'
.Lld16_general_04f_NE_done:
    brult8 .Lld16_general_04f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_ULT_done
.Lld16_general_04f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_04f_ULT_done:
    bruge8 .Lld16_general_04f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_UGE_done
.Lld16_general_04f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_04f_UGE_done:
    brslt8 .Lld16_general_04f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_SLT_done
.Lld16_general_04f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_04f_SLT_done:
    brsge8 .Lld16_general_04f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_04f_SGE_done
.Lld16_general_04f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_04f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r2, spec=0x75.
    ldi16 r4, 0x0741
    ldi8 r5, 0x23
    st8 [r4], r5
    ldi16 r4, 0x0742
    ldi8 r5, 0x56
    st8 [r4], r5
    ldi16 r4, 0x0743
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0744
    ldi8 r5, 0x3a
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2421
    push16 r4
    ldi16 r4, 0x71d1
    push16 r4
    ldi16 r4, 0x0742
    push16 r4
    ldi16 r4, 0xd113
    push16 r4
    ldi16 r4, 0x28ad
    push16 r4
    ldi16 r4, 0x29d0
    push16 r4
    ldi16 r4, 0x2af3
    push16 r4
    ldi16 r4, 0x2c16
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x75 ; TEST
    push16 r1
    push16 r2
    push16 r3
    ldi16 r4, 0x0741
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0743
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_050_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_EQ_done
.Lld16_general_050_EQ_true:
    gp_emit_char 'B'
.Lld16_general_050_EQ_done:
    brne8 .Lld16_general_050_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_NE_done
.Lld16_general_050_NE_true:
    gp_emit_char 'B'
.Lld16_general_050_NE_done:
    brult8 .Lld16_general_050_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_ULT_done
.Lld16_general_050_ULT_true:
    gp_emit_char 'B'
.Lld16_general_050_ULT_done:
    bruge8 .Lld16_general_050_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_UGE_done
.Lld16_general_050_UGE_true:
    gp_emit_char 'B'
.Lld16_general_050_UGE_done:
    brslt8 .Lld16_general_050_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_SLT_done
.Lld16_general_050_SLT_true:
    gp_emit_char 'B'
.Lld16_general_050_SLT_done:
    brsge8 .Lld16_general_050_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_050_SGE_done
.Lld16_general_050_SGE_true:
    gp_emit_char 'B'
.Lld16_general_050_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r2, spec=0x95.
    ldi16 r4, 0x0745
    ldi8 r5, 0x26
    st8 [r4], r5
    ldi16 r4, 0x0746
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x0747
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x0748
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x245e
    push16 r4
    ldi16 r4, 0x2581
    push16 r4
    ldi16 r4, 0x0746
    push16 r4
    ldi16 r4, 0x741c
    push16 r4
    ldi16 r4, 0xd241
    push16 r4
    ldi16 r4, 0x2a0d
    push16 r4
    ldi16 r4, 0x2b30
    push16 r4
    ldi16 r4, 0x2c53
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x95 ; TEST
    push16 r3
    push16 r2
    push16 r4
    ldi16 r4, 0x0745
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0747
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_051_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_EQ_done
.Lld16_general_051_EQ_true:
    gp_emit_char 'B'
.Lld16_general_051_EQ_done:
    brne8 .Lld16_general_051_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_NE_done
.Lld16_general_051_NE_true:
    gp_emit_char 'B'
.Lld16_general_051_NE_done:
    brult8 .Lld16_general_051_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_ULT_done
.Lld16_general_051_ULT_true:
    gp_emit_char 'B'
.Lld16_general_051_ULT_done:
    bruge8 .Lld16_general_051_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_UGE_done
.Lld16_general_051_UGE_true:
    gp_emit_char 'B'
.Lld16_general_051_UGE_done:
    brslt8 .Lld16_general_051_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_SLT_done
.Lld16_general_051_SLT_true:
    gp_emit_char 'B'
.Lld16_general_051_SLT_done:
    brsge8 .Lld16_general_051_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_051_SGE_done
.Lld16_general_051_SGE_true:
    gp_emit_char 'B'
.Lld16_general_051_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r2, spec=0xB5.
    ldi16 r4, 0x0749
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x074a
    ldi8 r5, 0xc6
    st8 [r4], r5
    ldi16 r4, 0x074b
    ldi8 r5, 0xc7
    st8 [r4], r5
    ldi16 r4, 0x074c
    ldi8 r5, 0x46
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x249b
    push16 r4
    ldi16 r4, 0x25be
    push16 r4
    ldi16 r4, 0x074a
    push16 r4
    ldi16 r4, 0x7465
    push16 r4
    ldi16 r4, 0x2927
    push16 r4
    ldi16 r4, 0xd36f
    push16 r4
    ldi16 r4, 0x2b6d
    push16 r4
    ldi16 r4, 0x2c90
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xb5 ; TEST
    push16 r3
    push16 r2
    push16 r5
    ldi16 r4, 0x0749
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x074b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_052_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_EQ_done
.Lld16_general_052_EQ_true:
    gp_emit_char 'B'
.Lld16_general_052_EQ_done:
    brne8 .Lld16_general_052_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_NE_done
.Lld16_general_052_NE_true:
    gp_emit_char 'B'
.Lld16_general_052_NE_done:
    brult8 .Lld16_general_052_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_ULT_done
.Lld16_general_052_ULT_true:
    gp_emit_char 'B'
.Lld16_general_052_ULT_done:
    bruge8 .Lld16_general_052_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_UGE_done
.Lld16_general_052_UGE_true:
    gp_emit_char 'B'
.Lld16_general_052_UGE_done:
    brslt8 .Lld16_general_052_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_SLT_done
.Lld16_general_052_SLT_true:
    gp_emit_char 'B'
.Lld16_general_052_SLT_done:
    brsge8 .Lld16_general_052_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_052_SGE_done
.Lld16_general_052_SGE_true:
    gp_emit_char 'B'
.Lld16_general_052_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r2, spec=0xD5.
    ldi16 r4, 0x074d
    ldi8 r5, 0x2c
    st8 [r4], r5
    ldi16 r4, 0x074e
    ldi8 r5, 0xfe
    st8 [r4], r5
    ldi16 r4, 0x074f
    ldi8 r5, 0xd8
    st8 [r4], r5
    ldi16 r4, 0x0750
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x24d8
    push16 r4
    ldi16 r4, 0x25fb
    push16 r4
    ldi16 r4, 0x074e
    push16 r4
    ldi16 r4, 0x2841
    push16 r4
    ldi16 r4, 0x75af
    push16 r4
    ldi16 r4, 0x2a87
    push16 r4
    ldi16 r4, 0xd49d
    push16 r4
    ldi16 r4, 0x2ccd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd5 ; TEST
    push16 r4
    push16 r2
    push16 r6
    ldi16 r4, 0x074d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x074f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_053_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_EQ_done
.Lld16_general_053_EQ_true:
    gp_emit_char 'B'
.Lld16_general_053_EQ_done:
    brne8 .Lld16_general_053_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_NE_done
.Lld16_general_053_NE_true:
    gp_emit_char 'B'
.Lld16_general_053_NE_done:
    brult8 .Lld16_general_053_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_ULT_done
.Lld16_general_053_ULT_true:
    gp_emit_char 'B'
.Lld16_general_053_ULT_done:
    bruge8 .Lld16_general_053_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_UGE_done
.Lld16_general_053_UGE_true:
    gp_emit_char 'B'
.Lld16_general_053_UGE_done:
    brslt8 .Lld16_general_053_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_SLT_done
.Lld16_general_053_SLT_true:
    gp_emit_char 'B'
.Lld16_general_053_SLT_done:
    brsge8 .Lld16_general_053_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_053_SGE_done
.Lld16_general_053_SGE_true:
    gp_emit_char 'B'
.Lld16_general_053_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r2, spec=0xF5.
    ldi16 r4, 0x0751
    ldi8 r5, 0x2f
    st8 [r4], r5
    ldi16 r4, 0x0752
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x0753
    ldi8 r5, 0xea
    st8 [r4], r5
    ldi16 r4, 0x0754
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2515
    push16 r4
    ldi16 r4, 0x2638
    push16 r4
    ldi16 r4, 0x0752
    push16 r4
    ldi16 r4, 0x287e
    push16 r4
    ldi16 r4, 0x29a1
    push16 r4
    ldi16 r4, 0x76f9
    push16 r4
    ldi16 r4, 0x2be7
    push16 r4
    ldi16 r4, 0xd5cb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf5 ; TEST
    push16 r5
    push16 r2
    push16 r7
    ldi16 r4, 0x0751
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0753
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_054_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_EQ_done
.Lld16_general_054_EQ_true:
    gp_emit_char 'B'
.Lld16_general_054_EQ_done:
    brne8 .Lld16_general_054_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_NE_done
.Lld16_general_054_NE_true:
    gp_emit_char 'B'
.Lld16_general_054_NE_done:
    brult8 .Lld16_general_054_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_ULT_done
.Lld16_general_054_ULT_true:
    gp_emit_char 'B'
.Lld16_general_054_ULT_done:
    bruge8 .Lld16_general_054_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_UGE_done
.Lld16_general_054_UGE_true:
    gp_emit_char 'B'
.Lld16_general_054_UGE_done:
    brslt8 .Lld16_general_054_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_SLT_done
.Lld16_general_054_SLT_true:
    gp_emit_char 'B'
.Lld16_general_054_SLT_done:
    brsge8 .Lld16_general_054_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_054_SGE_done
.Lld16_general_054_SGE_true:
    gp_emit_char 'B'
.Lld16_general_054_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r3, spec=0x17.
    ldi16 r4, 0x0755
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x0756
    ldi8 r5, 0x77
    st8 [r4], r5
    ldi16 r4, 0x0757
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x0758
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xcef1
    push16 r4
    ldi16 r4, 0x2675
    push16 r4
    ldi16 r4, 0x2798
    push16 r4
    ldi16 r4, 0x0756
    push16 r4
    ldi16 r4, 0x29de
    push16 r4
    ldi16 r4, 0x2b01
    push16 r4
    ldi16 r4, 0x7843
    push16 r4
    ldi16 r4, 0x2d47
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x17 ; TEST
    push16 r6
    push16 r3
    push16 r0
    ldi16 r4, 0x0755
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0757
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_055_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_EQ_done
.Lld16_general_055_EQ_true:
    gp_emit_char 'B'
.Lld16_general_055_EQ_done:
    brne8 .Lld16_general_055_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_NE_done
.Lld16_general_055_NE_true:
    gp_emit_char 'B'
.Lld16_general_055_NE_done:
    brult8 .Lld16_general_055_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_ULT_done
.Lld16_general_055_ULT_true:
    gp_emit_char 'B'
.Lld16_general_055_ULT_done:
    bruge8 .Lld16_general_055_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_UGE_done
.Lld16_general_055_UGE_true:
    gp_emit_char 'B'
.Lld16_general_055_UGE_done:
    brslt8 .Lld16_general_055_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_SLT_done
.Lld16_general_055_SLT_true:
    gp_emit_char 'B'
.Lld16_general_055_SLT_done:
    brsge8 .Lld16_general_055_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_055_SGE_done
.Lld16_general_055_SGE_true:
    gp_emit_char 'B'
.Lld16_general_055_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r3, spec=0x37.
    ldi16 r4, 0x0759
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x075a
    ldi8 r5, 0xaf
    st8 [r4], r5
    ldi16 r4, 0x075b
    ldi8 r5, 0x8d
    st8 [r4], r5
    ldi16 r4, 0x075c
    ldi8 r5, 0x56
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x258f
    push16 r4
    ldi16 r4, 0xd01f
    push16 r4
    ldi16 r4, 0x27d5
    push16 r4
    ldi16 r4, 0x075a
    push16 r4
    ldi16 r4, 0x2a1b
    push16 r4
    ldi16 r4, 0x2b3e
    push16 r4
    ldi16 r4, 0x2c61
    push16 r4
    ldi16 r4, 0x798d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x37 ; TEST
    push16 r7
    push16 r3
    push16 r1
    ldi16 r4, 0x0759
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x075b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_056_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_EQ_done
.Lld16_general_056_EQ_true:
    gp_emit_char 'B'
.Lld16_general_056_EQ_done:
    brne8 .Lld16_general_056_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_NE_done
.Lld16_general_056_NE_true:
    gp_emit_char 'B'
.Lld16_general_056_NE_done:
    brult8 .Lld16_general_056_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_ULT_done
.Lld16_general_056_ULT_true:
    gp_emit_char 'B'
.Lld16_general_056_ULT_done:
    bruge8 .Lld16_general_056_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_UGE_done
.Lld16_general_056_UGE_true:
    gp_emit_char 'B'
.Lld16_general_056_UGE_done:
    brslt8 .Lld16_general_056_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_SLT_done
.Lld16_general_056_SLT_true:
    gp_emit_char 'B'
.Lld16_general_056_SLT_done:
    brsge8 .Lld16_general_056_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_056_SGE_done
.Lld16_general_056_SGE_true:
    gp_emit_char 'B'
.Lld16_general_056_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r3, spec=0x57.
    ldi16 r4, 0x075d
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x075e
    ldi8 r5, 0xe7
    st8 [r4], r5
    ldi16 r4, 0x075f
    ldi8 r5, 0x9e
    st8 [r4], r5
    ldi16 r4, 0x0760
    ldi8 r5, 0x5c
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x72cf
    push16 r4
    ldi16 r4, 0x26ef
    push16 r4
    ldi16 r4, 0xd14d
    push16 r4
    ldi16 r4, 0x075e
    push16 r4
    ldi16 r4, 0x2a58
    push16 r4
    ldi16 r4, 0x2b7b
    push16 r4
    ldi16 r4, 0x2c9e
    push16 r4
    ldi16 r4, 0x2dc1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x57 ; TEST
    push16 r0
    push16 r3
    push16 r2
    ldi16 r4, 0x075d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x075f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_057_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_EQ_done
.Lld16_general_057_EQ_true:
    gp_emit_char 'B'
.Lld16_general_057_EQ_done:
    brne8 .Lld16_general_057_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_NE_done
.Lld16_general_057_NE_true:
    gp_emit_char 'B'
.Lld16_general_057_NE_done:
    brult8 .Lld16_general_057_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_ULT_done
.Lld16_general_057_ULT_true:
    gp_emit_char 'B'
.Lld16_general_057_ULT_done:
    bruge8 .Lld16_general_057_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_UGE_done
.Lld16_general_057_UGE_true:
    gp_emit_char 'B'
.Lld16_general_057_UGE_done:
    brslt8 .Lld16_general_057_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_SLT_done
.Lld16_general_057_SLT_true:
    gp_emit_char 'B'
.Lld16_general_057_SLT_done:
    brsge8 .Lld16_general_057_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_057_SGE_done
.Lld16_general_057_SGE_true:
    gp_emit_char 'B'
.Lld16_general_057_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r3, spec=0x97.
    ldi16 r4, 0x0761
    ldi8 r5, 0x3c
    st8 [r4], r5
    ldi16 r4, 0x0762
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0763
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x0764
    ldi8 r5, 0x63
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2609
    push16 r4
    ldi16 r4, 0x7419
    push16 r4
    ldi16 r4, 0x284f
    push16 r4
    ldi16 r4, 0x0762
    push16 r4
    ldi16 r4, 0xd37c
    push16 r4
    ldi16 r4, 0x2bb8
    push16 r4
    ldi16 r4, 0x2cdb
    push16 r4
    ldi16 r4, 0x2dfe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x97 ; TEST
    push16 r1
    push16 r3
    push16 r4
    ldi16 r4, 0x0761
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0763
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_058_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_EQ_done
.Lld16_general_058_EQ_true:
    gp_emit_char 'B'
.Lld16_general_058_EQ_done:
    brne8 .Lld16_general_058_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_NE_done
.Lld16_general_058_NE_true:
    gp_emit_char 'B'
.Lld16_general_058_NE_done:
    brult8 .Lld16_general_058_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_ULT_done
.Lld16_general_058_ULT_true:
    gp_emit_char 'B'
.Lld16_general_058_ULT_done:
    bruge8 .Lld16_general_058_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_UGE_done
.Lld16_general_058_UGE_true:
    gp_emit_char 'B'
.Lld16_general_058_UGE_done:
    brslt8 .Lld16_general_058_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_SLT_done
.Lld16_general_058_SLT_true:
    gp_emit_char 'B'
.Lld16_general_058_SLT_done:
    brsge8 .Lld16_general_058_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_058_SGE_done
.Lld16_general_058_SGE_true:
    gp_emit_char 'B'
.Lld16_general_058_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r3, spec=0xB7.
    ldi16 r4, 0x0765
    ldi8 r5, 0x3f
    st8 [r4], r5
    ldi16 r4, 0x0766
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0767
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0768
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2646
    push16 r4
    ldi16 r4, 0x2769
    push16 r4
    ldi16 r4, 0x7563
    push16 r4
    ldi16 r4, 0x0766
    push16 r4
    ldi16 r4, 0x2ad2
    push16 r4
    ldi16 r4, 0xd4aa
    push16 r4
    ldi16 r4, 0x2d18
    push16 r4
    ldi16 r4, 0x2e3b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xb7 ; TEST
    push16 r2
    push16 r3
    push16 r5
    ldi16 r4, 0x0765
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0767
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_059_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_EQ_done
.Lld16_general_059_EQ_true:
    gp_emit_char 'B'
.Lld16_general_059_EQ_done:
    brne8 .Lld16_general_059_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_NE_done
.Lld16_general_059_NE_true:
    gp_emit_char 'B'
.Lld16_general_059_NE_done:
    brult8 .Lld16_general_059_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_ULT_done
.Lld16_general_059_ULT_true:
    gp_emit_char 'B'
.Lld16_general_059_ULT_done:
    bruge8 .Lld16_general_059_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_UGE_done
.Lld16_general_059_UGE_true:
    gp_emit_char 'B'
.Lld16_general_059_UGE_done:
    brslt8 .Lld16_general_059_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_SLT_done
.Lld16_general_059_SLT_true:
    gp_emit_char 'B'
.Lld16_general_059_SLT_done:
    brsge8 .Lld16_general_059_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_059_SGE_done
.Lld16_general_059_SGE_true:
    gp_emit_char 'B'
.Lld16_general_059_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r3, spec=0xD7.
    ldi16 r4, 0x0769
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x076a
    ldi8 r5, 0x90
    st8 [r4], r5
    ldi16 r4, 0x076b
    ldi8 r5, 0xe2
    st8 [r4], r5
    ldi16 r4, 0x076c
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2683
    push16 r4
    ldi16 r4, 0x27a6
    push16 r4
    ldi16 r4, 0x28c9
    push16 r4
    ldi16 r4, 0x076a
    push16 r4
    ldi16 r4, 0x77ae
    push16 r4
    ldi16 r4, 0x2c32
    push16 r4
    ldi16 r4, 0xd5d8
    push16 r4
    ldi16 r4, 0x2e78
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd7 ; TEST
    push16 r4
    push16 r3
    push16 r6
    ldi16 r4, 0x0769
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x076b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_EQ_done
.Lld16_general_05a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05a_EQ_done:
    brne8 .Lld16_general_05a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_NE_done
.Lld16_general_05a_NE_true:
    gp_emit_char 'B'
.Lld16_general_05a_NE_done:
    brult8 .Lld16_general_05a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_ULT_done
.Lld16_general_05a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05a_ULT_done:
    bruge8 .Lld16_general_05a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_UGE_done
.Lld16_general_05a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05a_UGE_done:
    brslt8 .Lld16_general_05a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_SLT_done
.Lld16_general_05a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05a_SLT_done:
    brsge8 .Lld16_general_05a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05a_SGE_done
.Lld16_general_05a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r3, spec=0xF7.
    ldi16 r4, 0x076d
    ldi8 r5, 0x45
    st8 [r4], r5
    ldi16 r4, 0x076e
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x076f
    ldi8 r5, 0xf3
    st8 [r4], r5
    ldi16 r4, 0x0770
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x26c0
    push16 r4
    ldi16 r4, 0x27e3
    push16 r4
    ldi16 r4, 0x2906
    push16 r4
    ldi16 r4, 0x076e
    push16 r4
    ldi16 r4, 0x77f7
    push16 r4
    ldi16 r4, 0x2c6f
    push16 r4
    ldi16 r4, 0x2d92
    push16 r4
    ldi16 r4, 0xd706
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf7 ; TEST
    push16 r4
    push16 r3
    push16 r7
    ldi16 r4, 0x076d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x076f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_EQ_done
.Lld16_general_05b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05b_EQ_done:
    brne8 .Lld16_general_05b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_NE_done
.Lld16_general_05b_NE_true:
    gp_emit_char 'B'
.Lld16_general_05b_NE_done:
    brult8 .Lld16_general_05b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_ULT_done
.Lld16_general_05b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05b_ULT_done:
    bruge8 .Lld16_general_05b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_UGE_done
.Lld16_general_05b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05b_UGE_done:
    brslt8 .Lld16_general_05b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_SLT_done
.Lld16_general_05b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05b_SLT_done:
    brsge8 .Lld16_general_05b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05b_SGE_done
.Lld16_general_05b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r4, spec=0x19.
    ldi16 r4, 0x0771
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x0772
    ldi8 r5, 0x09
    st8 [r4], r5
    ldi16 r4, 0x0773
    ldi8 r5, 0x86
    st8 [r4], r5
    ldi16 r4, 0x0774
    ldi8 r5, 0x73
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xd02c
    push16 r4
    ldi16 r4, 0x2820
    push16 r4
    ldi16 r4, 0x2943
    push16 r4
    ldi16 r4, 0x2a66
    push16 r4
    ldi16 r4, 0x0772
    push16 r4
    ldi16 r4, 0x7941
    push16 r4
    ldi16 r4, 0x2dcf
    push16 r4
    ldi16 r4, 0x2ef2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x19 ; TEST
    push16 r5
    push16 r4
    push16 r0
    ldi16 r4, 0x0771
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0773
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_EQ_done
.Lld16_general_05c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05c_EQ_done:
    brne8 .Lld16_general_05c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_NE_done
.Lld16_general_05c_NE_true:
    gp_emit_char 'B'
.Lld16_general_05c_NE_done:
    brult8 .Lld16_general_05c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_ULT_done
.Lld16_general_05c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05c_ULT_done:
    bruge8 .Lld16_general_05c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_UGE_done
.Lld16_general_05c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05c_UGE_done:
    brslt8 .Lld16_general_05c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_SLT_done
.Lld16_general_05c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05c_SLT_done:
    brsge8 .Lld16_general_05c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05c_SGE_done
.Lld16_general_05c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r4, spec=0x39.
    ldi16 r4, 0x0775
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0776
    ldi8 r5, 0x41
    st8 [r4], r5
    ldi16 r4, 0x0777
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x0778
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x273a
    push16 r4
    ldi16 r4, 0xd15a
    push16 r4
    ldi16 r4, 0x2980
    push16 r4
    ldi16 r4, 0x2aa3
    push16 r4
    ldi16 r4, 0x0776
    push16 r4
    ldi16 r4, 0x2ce9
    push16 r4
    ldi16 r4, 0x7a8b
    push16 r4
    ldi16 r4, 0x2f2f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x39 ; TEST
    push16 r6
    push16 r4
    push16 r1
    ldi16 r4, 0x0775
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0777
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_EQ_done
.Lld16_general_05d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05d_EQ_done:
    brne8 .Lld16_general_05d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_NE_done
.Lld16_general_05d_NE_true:
    gp_emit_char 'B'
.Lld16_general_05d_NE_done:
    brult8 .Lld16_general_05d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_ULT_done
.Lld16_general_05d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05d_ULT_done:
    bruge8 .Lld16_general_05d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_UGE_done
.Lld16_general_05d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05d_UGE_done:
    brslt8 .Lld16_general_05d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_SLT_done
.Lld16_general_05d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05d_SLT_done:
    brsge8 .Lld16_general_05d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05d_SGE_done
.Lld16_general_05d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r4, spec=0x59.
    ldi16 r4, 0x0779
    ldi8 r5, 0x4f
    st8 [r4], r5
    ldi16 r4, 0x077a
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x077b
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x077c
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2777
    push16 r4
    ldi16 r4, 0x289a
    push16 r4
    ldi16 r4, 0xd288
    push16 r4
    ldi16 r4, 0x2ae0
    push16 r4
    ldi16 r4, 0x077a
    push16 r4
    ldi16 r4, 0x2d26
    push16 r4
    ldi16 r4, 0x2e49
    push16 r4
    ldi16 r4, 0x7bd5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x59 ; TEST
    push16 r7
    push16 r4
    push16 r2
    ldi16 r4, 0x0779
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x077b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_EQ_done
.Lld16_general_05e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05e_EQ_done:
    brne8 .Lld16_general_05e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_NE_done
.Lld16_general_05e_NE_true:
    gp_emit_char 'B'
.Lld16_general_05e_NE_done:
    brult8 .Lld16_general_05e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_ULT_done
.Lld16_general_05e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05e_ULT_done:
    bruge8 .Lld16_general_05e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_UGE_done
.Lld16_general_05e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05e_UGE_done:
    brslt8 .Lld16_general_05e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_SLT_done
.Lld16_general_05e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05e_SLT_done:
    brsge8 .Lld16_general_05e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05e_SGE_done
.Lld16_general_05e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r4, spec=0x79.
    ldi16 r4, 0x077d
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x077e
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x077f
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0780
    ldi8 r5, 0x85
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7517
    push16 r4
    ldi16 r4, 0x28d7
    push16 r4
    ldi16 r4, 0x29fa
    push16 r4
    ldi16 r4, 0xd3b6
    push16 r4
    ldi16 r4, 0x077e
    push16 r4
    ldi16 r4, 0x2d63
    push16 r4
    ldi16 r4, 0x2e86
    push16 r4
    ldi16 r4, 0x2fa9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x79 ; TEST
    push16 r0
    push16 r4
    push16 r3
    ldi16 r4, 0x077d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x077f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_05f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_EQ_done
.Lld16_general_05f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_05f_EQ_done:
    brne8 .Lld16_general_05f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_NE_done
.Lld16_general_05f_NE_true:
    gp_emit_char 'B'
.Lld16_general_05f_NE_done:
    brult8 .Lld16_general_05f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_ULT_done
.Lld16_general_05f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_05f_ULT_done:
    bruge8 .Lld16_general_05f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_UGE_done
.Lld16_general_05f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_05f_UGE_done:
    brslt8 .Lld16_general_05f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_SLT_done
.Lld16_general_05f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_05f_SLT_done:
    brsge8 .Lld16_general_05f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_05f_SGE_done
.Lld16_general_05f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_05f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r4, spec=0xB9.
    ldi16 r4, 0x0781
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x0782
    ldi8 r5, 0xea
    st8 [r4], r5
    ldi16 r4, 0x0783
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x0784
    ldi8 r5, 0x8c
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x27f1
    push16 r4
    ldi16 r4, 0x7661
    push16 r4
    ldi16 r4, 0x2a37
    push16 r4
    ldi16 r4, 0x2b5a
    push16 r4
    ldi16 r4, 0x0782
    push16 r4
    ldi16 r4, 0xd5e5
    push16 r4
    ldi16 r4, 0x2ec3
    push16 r4
    ldi16 r4, 0x2fe6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xb9 ; TEST
    push16 r1
    push16 r4
    push16 r5
    ldi16 r4, 0x0781
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0783
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_060_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_EQ_done
.Lld16_general_060_EQ_true:
    gp_emit_char 'B'
.Lld16_general_060_EQ_done:
    brne8 .Lld16_general_060_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_NE_done
.Lld16_general_060_NE_true:
    gp_emit_char 'B'
.Lld16_general_060_NE_done:
    brult8 .Lld16_general_060_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_ULT_done
.Lld16_general_060_ULT_true:
    gp_emit_char 'B'
.Lld16_general_060_ULT_done:
    bruge8 .Lld16_general_060_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_UGE_done
.Lld16_general_060_UGE_true:
    gp_emit_char 'B'
.Lld16_general_060_UGE_done:
    brslt8 .Lld16_general_060_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_SLT_done
.Lld16_general_060_SLT_true:
    gp_emit_char 'B'
.Lld16_general_060_SLT_done:
    brsge8 .Lld16_general_060_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_060_SGE_done
.Lld16_general_060_SGE_true:
    gp_emit_char 'B'
.Lld16_general_060_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r4, spec=0xD9.
    ldi16 r4, 0x0785
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x0786
    ldi8 r5, 0x22
    st8 [r4], r5
    ldi16 r4, 0x0787
    ldi8 r5, 0xec
    st8 [r4], r5
    ldi16 r4, 0x0788
    ldi8 r5, 0x92
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x282e
    push16 r4
    ldi16 r4, 0x2951
    push16 r4
    ldi16 r4, 0x77ab
    push16 r4
    ldi16 r4, 0x2b97
    push16 r4
    ldi16 r4, 0x0786
    push16 r4
    ldi16 r4, 0x2ddd
    push16 r4
    ldi16 r4, 0xd713
    push16 r4
    ldi16 r4, 0x3023
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xd9 ; TEST
    push16 r2
    push16 r4
    push16 r6
    ldi16 r4, 0x0785
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0787
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_061_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_EQ_done
.Lld16_general_061_EQ_true:
    gp_emit_char 'B'
.Lld16_general_061_EQ_done:
    brne8 .Lld16_general_061_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_NE_done
.Lld16_general_061_NE_true:
    gp_emit_char 'B'
.Lld16_general_061_NE_done:
    brult8 .Lld16_general_061_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_ULT_done
.Lld16_general_061_ULT_true:
    gp_emit_char 'B'
.Lld16_general_061_ULT_done:
    bruge8 .Lld16_general_061_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_UGE_done
.Lld16_general_061_UGE_true:
    gp_emit_char 'B'
.Lld16_general_061_UGE_done:
    brslt8 .Lld16_general_061_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_SLT_done
.Lld16_general_061_SLT_true:
    gp_emit_char 'B'
.Lld16_general_061_SLT_done:
    brsge8 .Lld16_general_061_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_061_SGE_done
.Lld16_general_061_SGE_true:
    gp_emit_char 'B'
.Lld16_general_061_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r4, spec=0xF9.
    ldi16 r4, 0x0789
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x078a
    ldi8 r5, 0x5a
    st8 [r4], r5
    ldi16 r4, 0x078b
    ldi8 r5, 0xfd
    st8 [r4], r5
    ldi16 r4, 0x078c
    ldi8 r5, 0x98
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x286b
    push16 r4
    ldi16 r4, 0x298e
    push16 r4
    ldi16 r4, 0x2ab1
    push16 r4
    ldi16 r4, 0x78f5
    push16 r4
    ldi16 r4, 0x078a
    push16 r4
    ldi16 r4, 0x2e1a
    push16 r4
    ldi16 r4, 0x2f3d
    push16 r4
    ldi16 r4, 0xd841
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xf9 ; TEST
    push16 r3
    push16 r4
    push16 r7
    ldi16 r4, 0x0789
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x078b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_062_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_EQ_done
.Lld16_general_062_EQ_true:
    gp_emit_char 'B'
.Lld16_general_062_EQ_done:
    brne8 .Lld16_general_062_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_NE_done
.Lld16_general_062_NE_true:
    gp_emit_char 'B'
.Lld16_general_062_NE_done:
    brult8 .Lld16_general_062_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_ULT_done
.Lld16_general_062_ULT_true:
    gp_emit_char 'B'
.Lld16_general_062_ULT_done:
    bruge8 .Lld16_general_062_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_UGE_done
.Lld16_general_062_UGE_true:
    gp_emit_char 'B'
.Lld16_general_062_UGE_done:
    brslt8 .Lld16_general_062_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_SLT_done
.Lld16_general_062_SLT_true:
    gp_emit_char 'B'
.Lld16_general_062_SLT_done:
    brsge8 .Lld16_general_062_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_062_SGE_done
.Lld16_general_062_SGE_true:
    gp_emit_char 'B'
.Lld16_general_062_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r5, spec=0x1B.
    ldi16 r4, 0x078d
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x078e
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x078f
    ldi8 r5, 0x8f
    st8 [r4], r5
    ldi16 r4, 0x0790
    ldi8 r5, 0x96
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xd167
    push16 r4
    ldi16 r4, 0x29cb
    push16 r4
    ldi16 r4, 0x2aee
    push16 r4
    ldi16 r4, 0x2c11
    push16 r4
    ldi16 r4, 0x7a3f
    push16 r4
    ldi16 r4, 0x078e
    push16 r4
    ldi16 r4, 0x2f7a
    push16 r4
    ldi16 r4, 0x309d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x1b ; TEST
    push16 r4
    push16 r5
    push16 r0
    ldi16 r4, 0x078d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x078f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_063_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_EQ_done
.Lld16_general_063_EQ_true:
    gp_emit_char 'B'
.Lld16_general_063_EQ_done:
    brne8 .Lld16_general_063_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_NE_done
.Lld16_general_063_NE_true:
    gp_emit_char 'B'
.Lld16_general_063_NE_done:
    brult8 .Lld16_general_063_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_ULT_done
.Lld16_general_063_ULT_true:
    gp_emit_char 'B'
.Lld16_general_063_ULT_done:
    bruge8 .Lld16_general_063_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_UGE_done
.Lld16_general_063_UGE_true:
    gp_emit_char 'B'
.Lld16_general_063_UGE_done:
    brslt8 .Lld16_general_063_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_SLT_done
.Lld16_general_063_SLT_true:
    gp_emit_char 'B'
.Lld16_general_063_SLT_done:
    brsge8 .Lld16_general_063_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_063_SGE_done
.Lld16_general_063_SGE_true:
    gp_emit_char 'B'
.Lld16_general_063_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r5, spec=0x3B.
    ldi16 r4, 0x0791
    ldi8 r5, 0x62
    st8 [r4], r5
    ldi16 r4, 0x0792
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x0793
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0794
    ldi8 r5, 0x9c
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x28e5
    push16 r4
    ldi16 r4, 0xd295
    push16 r4
    ldi16 r4, 0x2b2b
    push16 r4
    ldi16 r4, 0x2c4e
    push16 r4
    ldi16 r4, 0x2d71
    push16 r4
    ldi16 r4, 0x0792
    push16 r4
    ldi16 r4, 0x7c8a
    push16 r4
    ldi16 r4, 0x30da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x3b ; TEST
    push16 r6
    push16 r5
    push16 r1
    ldi16 r4, 0x0791
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0793
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_064_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_EQ_done
.Lld16_general_064_EQ_true:
    gp_emit_char 'B'
.Lld16_general_064_EQ_done:
    brne8 .Lld16_general_064_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_NE_done
.Lld16_general_064_NE_true:
    gp_emit_char 'B'
.Lld16_general_064_NE_done:
    brult8 .Lld16_general_064_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_ULT_done
.Lld16_general_064_ULT_true:
    gp_emit_char 'B'
.Lld16_general_064_ULT_done:
    bruge8 .Lld16_general_064_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_UGE_done
.Lld16_general_064_UGE_true:
    gp_emit_char 'B'
.Lld16_general_064_UGE_done:
    brslt8 .Lld16_general_064_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_SLT_done
.Lld16_general_064_SLT_true:
    gp_emit_char 'B'
.Lld16_general_064_SLT_done:
    brsge8 .Lld16_general_064_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_064_SGE_done
.Lld16_general_064_SGE_true:
    gp_emit_char 'B'
.Lld16_general_064_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r5, spec=0x5B.
    ldi16 r4, 0x0795
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0796
    ldi8 r5, 0x0b
    st8 [r4], r5
    ldi16 r4, 0x0797
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x0798
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2922
    push16 r4
    ldi16 r4, 0x2a45
    push16 r4
    ldi16 r4, 0xd3c3
    push16 r4
    ldi16 r4, 0x2c8b
    push16 r4
    ldi16 r4, 0x2dae
    push16 r4
    ldi16 r4, 0x0796
    push16 r4
    ldi16 r4, 0x7cd3
    push16 r4
    ldi16 r4, 0x3117
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x5b ; TEST
    push16 r6
    push16 r5
    push16 r2
    ldi16 r4, 0x0795
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x0797
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_065_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_EQ_done
.Lld16_general_065_EQ_true:
    gp_emit_char 'B'
.Lld16_general_065_EQ_done:
    brne8 .Lld16_general_065_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_NE_done
.Lld16_general_065_NE_true:
    gp_emit_char 'B'
.Lld16_general_065_NE_done:
    brult8 .Lld16_general_065_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_ULT_done
.Lld16_general_065_ULT_true:
    gp_emit_char 'B'
.Lld16_general_065_ULT_done:
    bruge8 .Lld16_general_065_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_UGE_done
.Lld16_general_065_UGE_true:
    gp_emit_char 'B'
.Lld16_general_065_UGE_done:
    brslt8 .Lld16_general_065_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_SLT_done
.Lld16_general_065_SLT_true:
    gp_emit_char 'B'
.Lld16_general_065_SLT_done:
    brsge8 .Lld16_general_065_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_065_SGE_done
.Lld16_general_065_SGE_true:
    gp_emit_char 'B'
.Lld16_general_065_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r5, spec=0x7B.
    ldi16 r4, 0x0799
    ldi8 r5, 0x68
    st8 [r4], r5
    ldi16 r4, 0x079a
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x079b
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x079c
    ldi8 r5, 0xa8
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x295f
    push16 r4
    ldi16 r4, 0x2a82
    push16 r4
    ldi16 r4, 0x2ba5
    push16 r4
    ldi16 r4, 0xd4f1
    push16 r4
    ldi16 r4, 0x2deb
    push16 r4
    ldi16 r4, 0x079a
    push16 r4
    ldi16 r4, 0x3031
    push16 r4
    ldi16 r4, 0x7e1d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x7b ; TEST
    push16 r7
    push16 r5
    push16 r3
    ldi16 r4, 0x0799
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x079b
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_066_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_EQ_done
.Lld16_general_066_EQ_true:
    gp_emit_char 'B'
.Lld16_general_066_EQ_done:
    brne8 .Lld16_general_066_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_NE_done
.Lld16_general_066_NE_true:
    gp_emit_char 'B'
.Lld16_general_066_NE_done:
    brult8 .Lld16_general_066_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_ULT_done
.Lld16_general_066_ULT_true:
    gp_emit_char 'B'
.Lld16_general_066_ULT_done:
    bruge8 .Lld16_general_066_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_UGE_done
.Lld16_general_066_UGE_true:
    gp_emit_char 'B'
.Lld16_general_066_UGE_done:
    brslt8 .Lld16_general_066_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_SLT_done
.Lld16_general_066_SLT_true:
    gp_emit_char 'B'
.Lld16_general_066_SLT_done:
    brsge8 .Lld16_general_066_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_066_SGE_done
.Lld16_general_066_SGE_true:
    gp_emit_char 'B'
.Lld16_general_066_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r5, spec=0x9B.
    ldi16 r4, 0x079d
    ldi8 r5, 0x6b
    st8 [r4], r5
    ldi16 r4, 0x079e
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x079f
    ldi8 r5, 0xd4
    st8 [r4], r5
    ldi16 r4, 0x07a0
    ldi8 r5, 0xae
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x775f
    push16 r4
    ldi16 r4, 0x2abf
    push16 r4
    ldi16 r4, 0x2be2
    push16 r4
    ldi16 r4, 0x2d05
    push16 r4
    ldi16 r4, 0xd61f
    push16 r4
    ldi16 r4, 0x079e
    push16 r4
    ldi16 r4, 0x306e
    push16 r4
    ldi16 r4, 0x3191
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x9b ; TEST
    push16 r0
    push16 r5
    push16 r4
    ldi16 r4, 0x079d
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x079f
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_067_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_EQ_done
.Lld16_general_067_EQ_true:
    gp_emit_char 'B'
.Lld16_general_067_EQ_done:
    brne8 .Lld16_general_067_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_NE_done
.Lld16_general_067_NE_true:
    gp_emit_char 'B'
.Lld16_general_067_NE_done:
    brult8 .Lld16_general_067_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_ULT_done
.Lld16_general_067_ULT_true:
    gp_emit_char 'B'
.Lld16_general_067_ULT_done:
    bruge8 .Lld16_general_067_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_UGE_done
.Lld16_general_067_UGE_true:
    gp_emit_char 'B'
.Lld16_general_067_UGE_done:
    brslt8 .Lld16_general_067_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_SLT_done
.Lld16_general_067_SLT_true:
    gp_emit_char 'B'
.Lld16_general_067_SLT_done:
    brsge8 .Lld16_general_067_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_067_SGE_done
.Lld16_general_067_SGE_true:
    gp_emit_char 'B'
.Lld16_general_067_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r5, spec=0xDB.
    ldi16 r4, 0x07a1
    ldi8 r5, 0x6e
    st8 [r4], r5
    ldi16 r4, 0x07a2
    ldi8 r5, 0xb4
    st8 [r4], r5
    ldi16 r4, 0x07a3
    ldi8 r5, 0xf5
    st8 [r4], r5
    ldi16 r4, 0x07a4
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x29d9
    push16 r4
    ldi16 r4, 0x78a9
    push16 r4
    ldi16 r4, 0x2c1f
    push16 r4
    ldi16 r4, 0x2d42
    push16 r4
    ldi16 r4, 0x2e65
    push16 r4
    ldi16 r4, 0x07a2
    push16 r4
    ldi16 r4, 0xd84e
    push16 r4
    ldi16 r4, 0x31ce
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xdb ; TEST
    push16 r1
    push16 r5
    push16 r6
    ldi16 r4, 0x07a1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07a3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_068_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_EQ_done
.Lld16_general_068_EQ_true:
    gp_emit_char 'B'
.Lld16_general_068_EQ_done:
    brne8 .Lld16_general_068_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_NE_done
.Lld16_general_068_NE_true:
    gp_emit_char 'B'
.Lld16_general_068_NE_done:
    brult8 .Lld16_general_068_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_ULT_done
.Lld16_general_068_ULT_true:
    gp_emit_char 'B'
.Lld16_general_068_ULT_done:
    bruge8 .Lld16_general_068_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_UGE_done
.Lld16_general_068_UGE_true:
    gp_emit_char 'B'
.Lld16_general_068_UGE_done:
    brslt8 .Lld16_general_068_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_SLT_done
.Lld16_general_068_SLT_true:
    gp_emit_char 'B'
.Lld16_general_068_SLT_done:
    brsge8 .Lld16_general_068_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_068_SGE_done
.Lld16_general_068_SGE_true:
    gp_emit_char 'B'
.Lld16_general_068_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r5, spec=0xFB.
    ldi16 r4, 0x07a5
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x07a6
    ldi8 r5, 0xec
    st8 [r4], r5
    ldi16 r4, 0x07a7
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x07a8
    ldi8 r5, 0xbb
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2a16
    push16 r4
    ldi16 r4, 0x2b39
    push16 r4
    ldi16 r4, 0x79f3
    push16 r4
    ldi16 r4, 0x2d7f
    push16 r4
    ldi16 r4, 0x2ea2
    push16 r4
    ldi16 r4, 0x07a6
    push16 r4
    ldi16 r4, 0x30e8
    push16 r4
    ldi16 r4, 0xd97c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xfb ; TEST
    push16 r2
    push16 r5
    push16 r7
    ldi16 r4, 0x07a5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07a7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_069_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_EQ_done
.Lld16_general_069_EQ_true:
    gp_emit_char 'B'
.Lld16_general_069_EQ_done:
    brne8 .Lld16_general_069_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_NE_done
.Lld16_general_069_NE_true:
    gp_emit_char 'B'
.Lld16_general_069_NE_done:
    brult8 .Lld16_general_069_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_ULT_done
.Lld16_general_069_ULT_true:
    gp_emit_char 'B'
.Lld16_general_069_ULT_done:
    bruge8 .Lld16_general_069_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_UGE_done
.Lld16_general_069_UGE_true:
    gp_emit_char 'B'
.Lld16_general_069_UGE_done:
    brslt8 .Lld16_general_069_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_SLT_done
.Lld16_general_069_SLT_true:
    gp_emit_char 'B'
.Lld16_general_069_SLT_done:
    brsge8 .Lld16_general_069_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_069_SGE_done
.Lld16_general_069_SGE_true:
    gp_emit_char 'B'
.Lld16_general_069_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r6, spec=0x1D.
    ldi16 r4, 0x07a9
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x07aa
    ldi8 r5, 0x2d
    st8 [r4], r5
    ldi16 r4, 0x07ab
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x07ac
    ldi8 r5, 0xb9
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xd2a2
    push16 r4
    ldi16 r4, 0x2b76
    push16 r4
    ldi16 r4, 0x2c99
    push16 r4
    ldi16 r4, 0x7b3d
    push16 r4
    ldi16 r4, 0x2edf
    push16 r4
    ldi16 r4, 0x3002
    push16 r4
    ldi16 r4, 0x07aa
    push16 r4
    ldi16 r4, 0x3248
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x1d ; TEST
    push16 r3
    push16 r6
    push16 r0
    ldi16 r4, 0x07a9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07ab
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06a_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_EQ_done
.Lld16_general_06a_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06a_EQ_done:
    brne8 .Lld16_general_06a_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_NE_done
.Lld16_general_06a_NE_true:
    gp_emit_char 'B'
.Lld16_general_06a_NE_done:
    brult8 .Lld16_general_06a_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_ULT_done
.Lld16_general_06a_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06a_ULT_done:
    bruge8 .Lld16_general_06a_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_UGE_done
.Lld16_general_06a_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06a_UGE_done:
    brslt8 .Lld16_general_06a_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_SLT_done
.Lld16_general_06a_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06a_SLT_done:
    brsge8 .Lld16_general_06a_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06a_SGE_done
.Lld16_general_06a_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06a_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r6, spec=0x3D.
    ldi16 r4, 0x07ad
    ldi8 r5, 0x78
    st8 [r4], r5
    ldi16 r4, 0x07ae
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x07af
    ldi8 r5, 0xaa
    st8 [r4], r5
    ldi16 r4, 0x07b0
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2a90
    push16 r4
    ldi16 r4, 0xd3d0
    push16 r4
    ldi16 r4, 0x2cd6
    push16 r4
    ldi16 r4, 0x2df9
    push16 r4
    ldi16 r4, 0x7c87
    push16 r4
    ldi16 r4, 0x303f
    push16 r4
    ldi16 r4, 0x07ae
    push16 r4
    ldi16 r4, 0x3285
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x3d ; TEST
    push16 r4
    push16 r6
    push16 r1
    ldi16 r4, 0x07ad
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07af
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06b_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_EQ_done
.Lld16_general_06b_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06b_EQ_done:
    brne8 .Lld16_general_06b_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_NE_done
.Lld16_general_06b_NE_true:
    gp_emit_char 'B'
.Lld16_general_06b_NE_done:
    brult8 .Lld16_general_06b_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_ULT_done
.Lld16_general_06b_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06b_ULT_done:
    bruge8 .Lld16_general_06b_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_UGE_done
.Lld16_general_06b_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06b_UGE_done:
    brslt8 .Lld16_general_06b_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_SLT_done
.Lld16_general_06b_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06b_SLT_done:
    brsge8 .Lld16_general_06b_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06b_SGE_done
.Lld16_general_06b_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06b_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r6, spec=0x5D.
    ldi16 r4, 0x07b1
    ldi8 r5, 0x7b
    st8 [r4], r5
    ldi16 r4, 0x07b2
    ldi8 r5, 0x9d
    st8 [r4], r5
    ldi16 r4, 0x07b3
    ldi8 r5, 0xbb
    st8 [r4], r5
    ldi16 r4, 0x07b4
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2acd
    push16 r4
    ldi16 r4, 0x2bf0
    push16 r4
    ldi16 r4, 0xd4fe
    push16 r4
    ldi16 r4, 0x2e36
    push16 r4
    ldi16 r4, 0x2f59
    push16 r4
    ldi16 r4, 0x7dd1
    push16 r4
    ldi16 r4, 0x07b2
    push16 r4
    ldi16 r4, 0x32c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x5d ; TEST
    push16 r5
    push16 r6
    push16 r2
    ldi16 r4, 0x07b1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07b3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06c_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_EQ_done
.Lld16_general_06c_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06c_EQ_done:
    brne8 .Lld16_general_06c_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_NE_done
.Lld16_general_06c_NE_true:
    gp_emit_char 'B'
.Lld16_general_06c_NE_done:
    brult8 .Lld16_general_06c_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_ULT_done
.Lld16_general_06c_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06c_ULT_done:
    bruge8 .Lld16_general_06c_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_UGE_done
.Lld16_general_06c_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06c_UGE_done:
    brslt8 .Lld16_general_06c_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_SLT_done
.Lld16_general_06c_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06c_SLT_done:
    brsge8 .Lld16_general_06c_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06c_SGE_done
.Lld16_general_06c_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06c_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r6, spec=0x7D.
    ldi16 r4, 0x07b5
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x07b6
    ldi8 r5, 0xd5
    st8 [r4], r5
    ldi16 r4, 0x07b7
    ldi8 r5, 0xcc
    st8 [r4], r5
    ldi16 r4, 0x07b8
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2b0a
    push16 r4
    ldi16 r4, 0x2c2d
    push16 r4
    ldi16 r4, 0x2d50
    push16 r4
    ldi16 r4, 0xd62c
    push16 r4
    ldi16 r4, 0x2f96
    push16 r4
    ldi16 r4, 0x30b9
    push16 r4
    ldi16 r4, 0x07b6
    push16 r4
    ldi16 r4, 0x801c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x7d ; TEST
    push16 r7
    push16 r6
    push16 r3
    ldi16 r4, 0x07b5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07b7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06d_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_EQ_done
.Lld16_general_06d_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06d_EQ_done:
    brne8 .Lld16_general_06d_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_NE_done
.Lld16_general_06d_NE_true:
    gp_emit_char 'B'
.Lld16_general_06d_NE_done:
    brult8 .Lld16_general_06d_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_ULT_done
.Lld16_general_06d_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06d_ULT_done:
    bruge8 .Lld16_general_06d_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_UGE_done
.Lld16_general_06d_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06d_UGE_done:
    brslt8 .Lld16_general_06d_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_SLT_done
.Lld16_general_06d_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06d_SLT_done:
    brsge8 .Lld16_general_06d_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06d_SGE_done
.Lld16_general_06d_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06d_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r6, spec=0x9D.
    ldi16 r4, 0x07b9
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x07ba
    ldi8 r5, 0x0d
    st8 [r4], r5
    ldi16 r4, 0x07bb
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x07bc
    ldi8 r5, 0xd1
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2b47
    push16 r4
    ldi16 r4, 0x2c6a
    push16 r4
    ldi16 r4, 0x2d8d
    push16 r4
    ldi16 r4, 0x2eb0
    push16 r4
    ldi16 r4, 0xd75a
    push16 r4
    ldi16 r4, 0x30f6
    push16 r4
    ldi16 r4, 0x07ba
    push16 r4
    ldi16 r4, 0x8065
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x9d ; TEST
    push16 r7
    push16 r6
    push16 r4
    ldi16 r4, 0x07b9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07bb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06e_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_EQ_done
.Lld16_general_06e_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06e_EQ_done:
    brne8 .Lld16_general_06e_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_NE_done
.Lld16_general_06e_NE_true:
    gp_emit_char 'B'
.Lld16_general_06e_NE_done:
    brult8 .Lld16_general_06e_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_ULT_done
.Lld16_general_06e_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06e_ULT_done:
    bruge8 .Lld16_general_06e_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_UGE_done
.Lld16_general_06e_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06e_UGE_done:
    brslt8 .Lld16_general_06e_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_SLT_done
.Lld16_general_06e_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06e_SLT_done:
    brsge8 .Lld16_general_06e_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06e_SGE_done
.Lld16_general_06e_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06e_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r6, spec=0xBD.
    ldi16 r4, 0x07bd
    ldi8 r5, 0x84
    st8 [r4], r5
    ldi16 r4, 0x07be
    ldi8 r5, 0x45
    st8 [r4], r5
    ldi16 r4, 0x07bf
    ldi8 r5, 0xef
    st8 [r4], r5
    ldi16 r4, 0x07c0
    ldi8 r5, 0xd7
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x79a7
    push16 r4
    ldi16 r4, 0x2ca7
    push16 r4
    ldi16 r4, 0x2dca
    push16 r4
    ldi16 r4, 0x2eed
    push16 r4
    ldi16 r4, 0x3010
    push16 r4
    ldi16 r4, 0xd888
    push16 r4
    ldi16 r4, 0x07be
    push16 r4
    ldi16 r4, 0x3379
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xbd ; TEST
    push16 r0
    push16 r6
    push16 r5
    ldi16 r4, 0x07bd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07bf
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_06f_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_EQ_done
.Lld16_general_06f_EQ_true:
    gp_emit_char 'B'
.Lld16_general_06f_EQ_done:
    brne8 .Lld16_general_06f_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_NE_done
.Lld16_general_06f_NE_true:
    gp_emit_char 'B'
.Lld16_general_06f_NE_done:
    brult8 .Lld16_general_06f_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_ULT_done
.Lld16_general_06f_ULT_true:
    gp_emit_char 'B'
.Lld16_general_06f_ULT_done:
    bruge8 .Lld16_general_06f_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_UGE_done
.Lld16_general_06f_UGE_true:
    gp_emit_char 'B'
.Lld16_general_06f_UGE_done:
    brslt8 .Lld16_general_06f_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_SLT_done
.Lld16_general_06f_SLT_true:
    gp_emit_char 'B'
.Lld16_general_06f_SLT_done:
    brsge8 .Lld16_general_06f_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_06f_SGE_done
.Lld16_general_06f_SGE_true:
    gp_emit_char 'B'
.Lld16_general_06f_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r7, pointer r6, spec=0xFD.
    ldi16 r4, 0x07c1
    ldi8 r5, 0x87
    st8 [r4], r5
    ldi16 r4, 0x07c2
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x07c3
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x07c4
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2bc1
    push16 r4
    ldi16 r4, 0x7af1
    push16 r4
    ldi16 r4, 0x2e07
    push16 r4
    ldi16 r4, 0x2f2a
    push16 r4
    ldi16 r4, 0x304d
    push16 r4
    ldi16 r4, 0x3170
    push16 r4
    ldi16 r4, 0x07c2
    push16 r4
    ldi16 r4, 0xdab7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xfd ; TEST
    push16 r1
    push16 r6
    push16 r7
    ldi16 r4, 0x07c1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07c3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_070_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_EQ_done
.Lld16_general_070_EQ_true:
    gp_emit_char 'B'
.Lld16_general_070_EQ_done:
    brne8 .Lld16_general_070_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_NE_done
.Lld16_general_070_NE_true:
    gp_emit_char 'B'
.Lld16_general_070_NE_done:
    brult8 .Lld16_general_070_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_ULT_done
.Lld16_general_070_ULT_true:
    gp_emit_char 'B'
.Lld16_general_070_ULT_done:
    bruge8 .Lld16_general_070_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_UGE_done
.Lld16_general_070_UGE_true:
    gp_emit_char 'B'
.Lld16_general_070_UGE_done:
    brslt8 .Lld16_general_070_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_SLT_done
.Lld16_general_070_SLT_true:
    gp_emit_char 'B'
.Lld16_general_070_SLT_done:
    brsge8 .Lld16_general_070_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_070_SGE_done
.Lld16_general_070_SGE_true:
    gp_emit_char 'B'
.Lld16_general_070_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r0, pointer r7, spec=0x1F.
    ldi16 r4, 0x07c5
    ldi8 r5, 0x8b
    st8 [r4], r5
    ldi16 r4, 0x07c6
    ldi8 r5, 0xbf
    st8 [r4], r5
    ldi16 r4, 0x07c7
    ldi8 r5, 0xa2
    st8 [r4], r5
    ldi16 r4, 0x07c8
    ldi8 r5, 0xdc
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xd3dd
    push16 r4
    ldi16 r4, 0x2d21
    push16 r4
    ldi16 r4, 0x7c3b
    push16 r4
    ldi16 r4, 0x2f67
    push16 r4
    ldi16 r4, 0x308a
    push16 r4
    ldi16 r4, 0x31ad
    push16 r4
    ldi16 r4, 0x32d0
    push16 r4
    ldi16 r4, 0x07c6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x1f ; TEST
    push16 r2
    push16 r7
    push16 r0
    ldi16 r4, 0x07c5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07c7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_071_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_EQ_done
.Lld16_general_071_EQ_true:
    gp_emit_char 'B'
.Lld16_general_071_EQ_done:
    brne8 .Lld16_general_071_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_NE_done
.Lld16_general_071_NE_true:
    gp_emit_char 'B'
.Lld16_general_071_NE_done:
    brult8 .Lld16_general_071_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_ULT_done
.Lld16_general_071_ULT_true:
    gp_emit_char 'B'
.Lld16_general_071_ULT_done:
    bruge8 .Lld16_general_071_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_UGE_done
.Lld16_general_071_UGE_true:
    gp_emit_char 'B'
.Lld16_general_071_UGE_done:
    brslt8 .Lld16_general_071_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_SLT_done
.Lld16_general_071_SLT_true:
    gp_emit_char 'B'
.Lld16_general_071_SLT_done:
    brsge8 .Lld16_general_071_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_071_SGE_done
.Lld16_general_071_SGE_true:
    gp_emit_char 'B'
.Lld16_general_071_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r1, pointer r7, spec=0x3F.
    ldi16 r4, 0x07c9
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x07ca
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x07cb
    ldi8 r5, 0xb3
    st8 [r4], r5
    ldi16 r4, 0x07cc
    ldi8 r5, 0xe2
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2c3b
    push16 r4
    ldi16 r4, 0xd50b
    push16 r4
    ldi16 r4, 0x2e81
    push16 r4
    ldi16 r4, 0x7d85
    push16 r4
    ldi16 r4, 0x30c7
    push16 r4
    ldi16 r4, 0x31ea
    push16 r4
    ldi16 r4, 0x330d
    push16 r4
    ldi16 r4, 0x07ca
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x3f ; TEST
    push16 r3
    push16 r7
    push16 r1
    ldi16 r4, 0x07c9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07cb
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_072_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_EQ_done
.Lld16_general_072_EQ_true:
    gp_emit_char 'B'
.Lld16_general_072_EQ_done:
    brne8 .Lld16_general_072_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_NE_done
.Lld16_general_072_NE_true:
    gp_emit_char 'B'
.Lld16_general_072_NE_done:
    brult8 .Lld16_general_072_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_ULT_done
.Lld16_general_072_ULT_true:
    gp_emit_char 'B'
.Lld16_general_072_ULT_done:
    bruge8 .Lld16_general_072_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_UGE_done
.Lld16_general_072_UGE_true:
    gp_emit_char 'B'
.Lld16_general_072_UGE_done:
    brslt8 .Lld16_general_072_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_SLT_done
.Lld16_general_072_SLT_true:
    gp_emit_char 'B'
.Lld16_general_072_SLT_done:
    brsge8 .Lld16_general_072_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_072_SGE_done
.Lld16_general_072_SGE_true:
    gp_emit_char 'B'
.Lld16_general_072_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r2, pointer r7, spec=0x5F.
    ldi16 r4, 0x07cd
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x07ce
    ldi8 r5, 0x2f
    st8 [r4], r5
    ldi16 r4, 0x07cf
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x07d0
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2c78
    push16 r4
    ldi16 r4, 0x2d9b
    push16 r4
    ldi16 r4, 0xd639
    push16 r4
    ldi16 r4, 0x2fe1
    push16 r4
    ldi16 r4, 0x7ecf
    push16 r4
    ldi16 r4, 0x3227
    push16 r4
    ldi16 r4, 0x334a
    push16 r4
    ldi16 r4, 0x07ce
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x5f ; TEST
    push16 r4
    push16 r7
    push16 r2
    ldi16 r4, 0x07cd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07cf
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_073_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_EQ_done
.Lld16_general_073_EQ_true:
    gp_emit_char 'B'
.Lld16_general_073_EQ_done:
    brne8 .Lld16_general_073_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_NE_done
.Lld16_general_073_NE_true:
    gp_emit_char 'B'
.Lld16_general_073_NE_done:
    brult8 .Lld16_general_073_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_ULT_done
.Lld16_general_073_ULT_true:
    gp_emit_char 'B'
.Lld16_general_073_ULT_done:
    bruge8 .Lld16_general_073_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_UGE_done
.Lld16_general_073_UGE_true:
    gp_emit_char 'B'
.Lld16_general_073_UGE_done:
    brslt8 .Lld16_general_073_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_SLT_done
.Lld16_general_073_SLT_true:
    gp_emit_char 'B'
.Lld16_general_073_SLT_done:
    brsge8 .Lld16_general_073_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_073_SGE_done
.Lld16_general_073_SGE_true:
    gp_emit_char 'B'
.Lld16_general_073_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r3, pointer r7, spec=0x7F.
    ldi16 r4, 0x07d1
    ldi8 r5, 0x94
    st8 [r4], r5
    ldi16 r4, 0x07d2
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x07d3
    ldi8 r5, 0xd6
    st8 [r4], r5
    ldi16 r4, 0x07d4
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2cb5
    push16 r4
    ldi16 r4, 0x2dd8
    push16 r4
    ldi16 r4, 0x2efb
    push16 r4
    ldi16 r4, 0xd767
    push16 r4
    ldi16 r4, 0x3141
    push16 r4
    ldi16 r4, 0x8019
    push16 r4
    ldi16 r4, 0x3387
    push16 r4
    ldi16 r4, 0x07d2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x7f ; TEST
    push16 r5
    push16 r7
    push16 r3
    ldi16 r4, 0x07d1
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07d3
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_074_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_EQ_done
.Lld16_general_074_EQ_true:
    gp_emit_char 'B'
.Lld16_general_074_EQ_done:
    brne8 .Lld16_general_074_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_NE_done
.Lld16_general_074_NE_true:
    gp_emit_char 'B'
.Lld16_general_074_NE_done:
    brult8 .Lld16_general_074_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_ULT_done
.Lld16_general_074_ULT_true:
    gp_emit_char 'B'
.Lld16_general_074_ULT_done:
    bruge8 .Lld16_general_074_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_UGE_done
.Lld16_general_074_UGE_true:
    gp_emit_char 'B'
.Lld16_general_074_UGE_done:
    brslt8 .Lld16_general_074_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_SLT_done
.Lld16_general_074_SLT_true:
    gp_emit_char 'B'
.Lld16_general_074_SLT_done:
    brsge8 .Lld16_general_074_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_074_SGE_done
.Lld16_general_074_SGE_true:
    gp_emit_char 'B'
.Lld16_general_074_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r4, pointer r7, spec=0x9F.
    ldi16 r4, 0x07d5
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x07d6
    ldi8 r5, 0x9f
    st8 [r4], r5
    ldi16 r4, 0x07d7
    ldi8 r5, 0xe7
    st8 [r4], r5
    ldi16 r4, 0x07d8
    ldi8 r5, 0xf4
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x2cf2
    push16 r4
    ldi16 r4, 0x2e15
    push16 r4
    ldi16 r4, 0x2f38
    push16 r4
    ldi16 r4, 0x305b
    push16 r4
    ldi16 r4, 0xd895
    push16 r4
    ldi16 r4, 0x32a1
    push16 r4
    ldi16 r4, 0x8163
    push16 r4
    ldi16 r4, 0x07d6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0x9f ; TEST
    push16 r6
    push16 r7
    push16 r4
    ldi16 r4, 0x07d5
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07d7
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_075_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_EQ_done
.Lld16_general_075_EQ_true:
    gp_emit_char 'B'
.Lld16_general_075_EQ_done:
    brne8 .Lld16_general_075_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_NE_done
.Lld16_general_075_NE_true:
    gp_emit_char 'B'
.Lld16_general_075_NE_done:
    brult8 .Lld16_general_075_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_ULT_done
.Lld16_general_075_ULT_true:
    gp_emit_char 'B'
.Lld16_general_075_ULT_done:
    bruge8 .Lld16_general_075_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_UGE_done
.Lld16_general_075_UGE_true:
    gp_emit_char 'B'
.Lld16_general_075_UGE_done:
    brslt8 .Lld16_general_075_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_SLT_done
.Lld16_general_075_SLT_true:
    gp_emit_char 'B'
.Lld16_general_075_SLT_done:
    brsge8 .Lld16_general_075_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_075_SGE_done
.Lld16_general_075_SGE_true:
    gp_emit_char 'B'
.Lld16_general_075_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r5, pointer r7, spec=0xBF.
    ldi16 r4, 0x07d9
    ldi8 r5, 0x9a
    st8 [r4], r5
    ldi16 r4, 0x07da
    ldi8 r5, 0xd7
    st8 [r4], r5
    ldi16 r4, 0x07db
    ldi8 r5, 0xf8
    st8 [r4], r5
    ldi16 r4, 0x07dc
    ldi8 r5, 0xfa
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7ba6
    push16 r4
    ldi16 r4, 0x2e52
    push16 r4
    ldi16 r4, 0x2f75
    push16 r4
    ldi16 r4, 0x3098
    push16 r4
    ldi16 r4, 0x31bb
    push16 r4
    ldi16 r4, 0xd9c3
    push16 r4
    ldi16 r4, 0x3401
    push16 r4
    ldi16 r4, 0x07da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xbf ; TEST
    push16 r0
    push16 r7
    push16 r5
    ldi16 r4, 0x07d9
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07db
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_076_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_EQ_done
.Lld16_general_076_EQ_true:
    gp_emit_char 'B'
.Lld16_general_076_EQ_done:
    brne8 .Lld16_general_076_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_NE_done
.Lld16_general_076_NE_true:
    gp_emit_char 'B'
.Lld16_general_076_NE_done:
    brult8 .Lld16_general_076_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_ULT_done
.Lld16_general_076_ULT_true:
    gp_emit_char 'B'
.Lld16_general_076_ULT_done:
    bruge8 .Lld16_general_076_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_UGE_done
.Lld16_general_076_UGE_true:
    gp_emit_char 'B'
.Lld16_general_076_UGE_done:
    brslt8 .Lld16_general_076_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_SLT_done
.Lld16_general_076_SLT_true:
    gp_emit_char 'B'
.Lld16_general_076_SLT_done:
    brsge8 .Lld16_general_076_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_076_SGE_done
.Lld16_general_076_SGE_true:
    gp_emit_char 'B'
.Lld16_general_076_SGE_done:
    gp_emit_char '\n'

    ; ld16_general: postincrement, data r6, pointer r7, spec=0xDF.
    ldi16 r4, 0x07dd
    ldi8 r5, 0x9d
    st8 [r4], r5
    ldi16 r4, 0x07de
    ldi8 r5, 0x0f
    st8 [r4], r5
    ldi16 r4, 0x07df
    ldi8 r5, 0x0a
    st8 [r4], r5
    ldi16 r4, 0x07e0
    ldi8 r5, 0x00
    st8 [r4], r5
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x7bef
    push16 r4
    ldi16 r4, 0x2e8f
    push16 r4
    ldi16 r4, 0x2fb2
    push16 r4
    ldi16 r4, 0x30d5
    push16 r4
    ldi16 r4, 0x31f8
    push16 r4
    ldi16 r4, 0x331b
    push16 r4
    ldi16 r4, 0xdaf1
    push16 r4
    ldi16 r4, 0x07de
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x6c, 0xdf ; TEST
    push16 r0
    push16 r7
    push16 r6
    ldi16 r4, 0x07dd
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    ldi16 r4, 0x07df
    ld16 r5, [r4]
    mov r0, r5
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    pop16 r0
    call gp_print_r0_line
    breq8 .Lld16_general_077_EQ_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_EQ_done
.Lld16_general_077_EQ_true:
    gp_emit_char 'B'
.Lld16_general_077_EQ_done:
    brne8 .Lld16_general_077_NE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_NE_done
.Lld16_general_077_NE_true:
    gp_emit_char 'B'
.Lld16_general_077_NE_done:
    brult8 .Lld16_general_077_ULT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_ULT_done
.Lld16_general_077_ULT_true:
    gp_emit_char 'B'
.Lld16_general_077_ULT_done:
    bruge8 .Lld16_general_077_UGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_UGE_done
.Lld16_general_077_UGE_true:
    gp_emit_char 'B'
.Lld16_general_077_UGE_done:
    brslt8 .Lld16_general_077_SLT_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_SLT_done
.Lld16_general_077_SLT_true:
    gp_emit_char 'B'
.Lld16_general_077_SLT_done:
    brsge8 .Lld16_general_077_SGE_true
    gp_emit_char 'A'
    jmp8 .Lld16_general_077_SGE_done
.Lld16_general_077_SGE_true:
    gp_emit_char 'B'
.Lld16_general_077_SGE_done:
    gp_emit_char '\n'

    sys debug_break

.section .rodata,"a",@progbits

.p2align 0
ld16_general_reserved_postincrement_self_aliases:
    .byte 0xf0, 0x6c, 0x11
    .byte 0xf0, 0x6c, 0x33
    .byte 0xf0, 0x6c, 0x55
    .byte 0xf0, 0x6c, 0x77
    .byte 0xf0, 0x6c, 0x99
    .byte 0xf0, 0x6c, 0xbb
    .byte 0xf0, 0x6c, 0xdd
    .byte 0xf0, 0x6c, 0xff
