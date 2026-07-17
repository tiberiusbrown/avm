.include "include/upper_stack_relative_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Entry 0x00: ldsp8u c0, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi16 c1, 0x4000
    st16 [c0], c1
    ldi16 c0, 0x1101
    ldi16 c1, 0x3302
    ldi16 c2, 0x5503
    ldi16 c3, 0x7704
    ldsp8u c0, [sp+0]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0700
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x01: ldsp8u c0, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi16 c1, 0x487f
    st16 [c0], c1
    ldi16 c0, 0x1132
    ldi16 c1, 0x3337
    ldi16 c2, 0x553c
    ldi16 c3, 0x7741
    ldsp8u c0, [sp+1]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x02: ldsp8u c0, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi16 c1, 0x50ff
    st16 [c0], c1
    ldi16 c0, 0x1163
    ldi16 c1, 0x336c
    ldi16 c2, 0x5575
    ldi16 c3, 0x777e
    ldsp8u c0, [sp+2]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x03: ldsp8u c0, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi16 c1, 0x58aa
    st16 [c0], c1
    ldi16 c0, 0x1194
    ldi16 c1, 0x33a1
    ldi16 c2, 0x55ae
    ldi16 c3, 0x77bb
    ldsp8u c0, [sp+3]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x04: ldsp8u c0, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi16 c1, 0x6000
    st16 [c0], c1
    ldi16 c0, 0x11c5
    ldi16 c1, 0x33d6
    ldi16 c2, 0x55e7
    ldi16 c3, 0x77f8
    ldsp8u c0, [sp+4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x05: ldsp8u c0, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi16 c1, 0x687f
    st16 [c0], c1
    ldi16 c0, 0x11f6
    ldi16 c1, 0x340b
    ldi16 c2, 0x5620
    ldi16 c3, 0x7835
    ldsp8u c0, [sp+5]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x06: ldsp8u c0, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi16 c1, 0x70ff
    st16 [c0], c1
    ldi16 c0, 0x1227
    ldi16 c1, 0x3440
    ldi16 c2, 0x5659
    ldi16 c3, 0x7872
    ldsp8u c0, [sp+6]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x07: ldsp8u c0, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi16 c1, 0x78aa
    st16 [c0], c1
    ldi16 c0, 0x1258
    ldi16 c1, 0x3475
    ldi16 c2, 0x5692
    ldi16 c3, 0x78af
    ldsp8u c0, [sp+7]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x08: ldsp8u c0, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi16 c1, 0x8000
    st16 [c0], c1
    ldi16 c0, 0x1289
    ldi16 c1, 0x34aa
    ldi16 c2, 0x56cb
    ldi16 c3, 0x78ec
    ldsp8u c0, [sp+8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x09: ldsp8u c0, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi16 c1, 0x887f
    st16 [c0], c1
    ldi16 c0, 0x12ba
    ldi16 c1, 0x34df
    ldi16 c2, 0x5704
    ldi16 c3, 0x7929
    ldsp8u c0, [sp+9]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0A: ldsp8u c0, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi16 c1, 0x90ff
    st16 [c0], c1
    ldi16 c0, 0x12eb
    ldi16 c1, 0x3514
    ldi16 c2, 0x573d
    ldi16 c3, 0x7966
    ldsp8u c0, [sp+10]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0B: ldsp8u c0, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi16 c1, 0x98aa
    st16 [c0], c1
    ldi16 c0, 0x131c
    ldi16 c1, 0x3549
    ldi16 c2, 0x5776
    ldi16 c3, 0x79a3
    ldsp8u c0, [sp+11]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0C: ldsp8u c0, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi16 c1, 0xa000
    st16 [c0], c1
    ldi16 c0, 0x134d
    ldi16 c1, 0x357e
    ldi16 c2, 0x57af
    ldi16 c3, 0x79e0
    ldsp8u c0, [sp+12]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0D: ldsp8u c0, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi16 c1, 0xa87f
    st16 [c0], c1
    ldi16 c0, 0x137e
    ldi16 c1, 0x35b3
    ldi16 c2, 0x57e8
    ldi16 c3, 0x7a1d
    ldsp8u c0, [sp+13]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0E: ldsp8u c0, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi16 c1, 0xb0ff
    st16 [c0], c1
    ldi16 c0, 0x13af
    ldi16 c1, 0x35e8
    ldi16 c2, 0x5821
    ldi16 c3, 0x7a5a
    ldsp8u c0, [sp+14]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0F: ldsp8u c0, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070f
    ldi16 c1, 0xb8aa
    st16 [c0], c1
    ldi16 c0, 0x13e0
    ldi16 c1, 0x361d
    ldi16 c2, 0x585a
    ldi16 c3, 0x7a97
    ldsp8u c0, [sp+15]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x10: ldsp8u c1, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi16 c1, 0xb001
    st16 [c0], c1
    ldi16 c0, 0x1411
    ldi16 c1, 0x3652
    ldi16 c2, 0x5893
    ldi16 c3, 0x7ad4
    ldsp8u c1, [sp+0]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0700
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x11: ldsp8u c1, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi16 c1, 0xb880
    st16 [c0], c1
    ldi16 c0, 0x1442
    ldi16 c1, 0x3687
    ldi16 c2, 0x58cc
    ldi16 c3, 0x7b11
    ldsp8u c1, [sp+1]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x12: ldsp8u c1, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi16 c1, 0xc055
    st16 [c0], c1
    ldi16 c0, 0x1473
    ldi16 c1, 0x36bc
    ldi16 c2, 0x5905
    ldi16 c3, 0x7b4e
    ldsp8u c1, [sp+2]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x13: ldsp8u c1, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi16 c1, 0xc8c3
    st16 [c0], c1
    ldi16 c0, 0x14a4
    ldi16 c1, 0x36f1
    ldi16 c2, 0x593e
    ldi16 c3, 0x7b8b
    ldsp8u c1, [sp+3]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x14: ldsp8u c1, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi16 c1, 0xd001
    st16 [c0], c1
    ldi16 c0, 0x14d5
    ldi16 c1, 0x3726
    ldi16 c2, 0x5977
    ldi16 c3, 0x7bc8
    ldsp8u c1, [sp+4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x15: ldsp8u c1, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi16 c1, 0xd880
    st16 [c0], c1
    ldi16 c0, 0x1506
    ldi16 c1, 0x375b
    ldi16 c2, 0x59b0
    ldi16 c3, 0x7c05
    ldsp8u c1, [sp+5]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x16: ldsp8u c1, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi16 c1, 0xe055
    st16 [c0], c1
    ldi16 c0, 0x1537
    ldi16 c1, 0x3790
    ldi16 c2, 0x59e9
    ldi16 c3, 0x7c42
    ldsp8u c1, [sp+6]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x17: ldsp8u c1, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi16 c1, 0xe8c3
    st16 [c0], c1
    ldi16 c0, 0x1568
    ldi16 c1, 0x37c5
    ldi16 c2, 0x5a22
    ldi16 c3, 0x7c7f
    ldsp8u c1, [sp+7]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x18: ldsp8u c1, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi16 c1, 0xf001
    st16 [c0], c1
    ldi16 c0, 0x1599
    ldi16 c1, 0x37fa
    ldi16 c2, 0x5a5b
    ldi16 c3, 0x7cbc
    ldsp8u c1, [sp+8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x19: ldsp8u c1, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi16 c1, 0xf880
    st16 [c0], c1
    ldi16 c0, 0x15ca
    ldi16 c1, 0x382f
    ldi16 c2, 0x5a94
    ldi16 c3, 0x7cf9
    ldsp8u c1, [sp+9]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1A: ldsp8u c1, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi16 c1, 0x0055
    st16 [c0], c1
    ldi16 c0, 0x15fb
    ldi16 c1, 0x3864
    ldi16 c2, 0x5acd
    ldi16 c3, 0x7d36
    ldsp8u c1, [sp+10]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1B: ldsp8u c1, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi16 c1, 0x08c3
    st16 [c0], c1
    ldi16 c0, 0x162c
    ldi16 c1, 0x3899
    ldi16 c2, 0x5b06
    ldi16 c3, 0x7d73
    ldsp8u c1, [sp+11]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1C: ldsp8u c1, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi16 c1, 0x1001
    st16 [c0], c1
    ldi16 c0, 0x165d
    ldi16 c1, 0x38ce
    ldi16 c2, 0x5b3f
    ldi16 c3, 0x7db0
    ldsp8u c1, [sp+12]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1D: ldsp8u c1, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi16 c1, 0x1880
    st16 [c0], c1
    ldi16 c0, 0x168e
    ldi16 c1, 0x3903
    ldi16 c2, 0x5b78
    ldi16 c3, 0x7ded
    ldsp8u c1, [sp+13]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1E: ldsp8u c1, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi16 c1, 0x2055
    st16 [c0], c1
    ldi16 c0, 0x16bf
    ldi16 c1, 0x3938
    ldi16 c2, 0x5bb1
    ldi16 c3, 0x7e2a
    ldsp8u c1, [sp+14]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1F: ldsp8u c1, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070f
    ldi16 c1, 0x28c3
    st16 [c0], c1
    ldi16 c0, 0x16f0
    ldi16 c1, 0x396d
    ldi16 c2, 0x5bea
    ldi16 c3, 0x7e67
    ldsp8u c1, [sp+15]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x20: ldsp8u c2, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi16 c1, 0x207f
    st16 [c0], c1
    ldi16 c0, 0x1721
    ldi16 c1, 0x39a2
    ldi16 c2, 0x5c23
    ldi16 c3, 0x7ea4
    ldsp8u c2, [sp+0]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0700
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x21: ldsp8u c2, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi16 c1, 0x28ff
    st16 [c0], c1
    ldi16 c0, 0x1752
    ldi16 c1, 0x39d7
    ldi16 c2, 0x5c5c
    ldi16 c3, 0x7ee1
    ldsp8u c2, [sp+1]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x22: ldsp8u c2, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi16 c1, 0x30aa
    st16 [c0], c1
    ldi16 c0, 0x1783
    ldi16 c1, 0x3a0c
    ldi16 c2, 0x5c95
    ldi16 c3, 0x7f1e
    ldsp8u c2, [sp+2]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x23: ldsp8u c2, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi16 c1, 0x3800
    st16 [c0], c1
    ldi16 c0, 0x17b4
    ldi16 c1, 0x3a41
    ldi16 c2, 0x5cce
    ldi16 c3, 0x7f5b
    ldsp8u c2, [sp+3]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x24: ldsp8u c2, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi16 c1, 0x407f
    st16 [c0], c1
    ldi16 c0, 0x17e5
    ldi16 c1, 0x3a76
    ldi16 c2, 0x5d07
    ldi16 c3, 0x7f98
    ldsp8u c2, [sp+4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x25: ldsp8u c2, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi16 c1, 0x48ff
    st16 [c0], c1
    ldi16 c0, 0x1816
    ldi16 c1, 0x3aab
    ldi16 c2, 0x5d40
    ldi16 c3, 0x7fd5
    ldsp8u c2, [sp+5]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x26: ldsp8u c2, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi16 c1, 0x50aa
    st16 [c0], c1
    ldi16 c0, 0x1847
    ldi16 c1, 0x3ae0
    ldi16 c2, 0x5d79
    ldi16 c3, 0x8012
    ldsp8u c2, [sp+6]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x27: ldsp8u c2, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi16 c1, 0x5800
    st16 [c0], c1
    ldi16 c0, 0x1878
    ldi16 c1, 0x3b15
    ldi16 c2, 0x5db2
    ldi16 c3, 0x804f
    ldsp8u c2, [sp+7]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x28: ldsp8u c2, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi16 c1, 0x607f
    st16 [c0], c1
    ldi16 c0, 0x18a9
    ldi16 c1, 0x3b4a
    ldi16 c2, 0x5deb
    ldi16 c3, 0x808c
    ldsp8u c2, [sp+8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x29: ldsp8u c2, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi16 c1, 0x68ff
    st16 [c0], c1
    ldi16 c0, 0x18da
    ldi16 c1, 0x3b7f
    ldi16 c2, 0x5e24
    ldi16 c3, 0x80c9
    ldsp8u c2, [sp+9]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2A: ldsp8u c2, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi16 c1, 0x70aa
    st16 [c0], c1
    ldi16 c0, 0x190b
    ldi16 c1, 0x3bb4
    ldi16 c2, 0x5e5d
    ldi16 c3, 0x8106
    ldsp8u c2, [sp+10]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2B: ldsp8u c2, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi16 c1, 0x7800
    st16 [c0], c1
    ldi16 c0, 0x193c
    ldi16 c1, 0x3be9
    ldi16 c2, 0x5e96
    ldi16 c3, 0x8143
    ldsp8u c2, [sp+11]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2C: ldsp8u c2, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi16 c1, 0x807f
    st16 [c0], c1
    ldi16 c0, 0x196d
    ldi16 c1, 0x3c1e
    ldi16 c2, 0x5ecf
    ldi16 c3, 0x8180
    ldsp8u c2, [sp+12]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2D: ldsp8u c2, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi16 c1, 0x88ff
    st16 [c0], c1
    ldi16 c0, 0x199e
    ldi16 c1, 0x3c53
    ldi16 c2, 0x5f08
    ldi16 c3, 0x81bd
    ldsp8u c2, [sp+13]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2E: ldsp8u c2, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi16 c1, 0x90aa
    st16 [c0], c1
    ldi16 c0, 0x19cf
    ldi16 c1, 0x3c88
    ldi16 c2, 0x5f41
    ldi16 c3, 0x81fa
    ldsp8u c2, [sp+14]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2F: ldsp8u c2, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070f
    ldi16 c1, 0x9800
    st16 [c0], c1
    ldi16 c0, 0x1a00
    ldi16 c1, 0x3cbd
    ldi16 c2, 0x5f7a
    ldi16 c3, 0x8237
    ldsp8u c2, [sp+15]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x30: ldsp8u c3, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi16 c1, 0x9080
    st16 [c0], c1
    ldi16 c0, 0x1a31
    ldi16 c1, 0x3cf2
    ldi16 c2, 0x5fb3
    ldi16 c3, 0x8274
    ldsp8u c3, [sp+0]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0700
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x31: ldsp8u c3, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi16 c1, 0x9855
    st16 [c0], c1
    ldi16 c0, 0x1a62
    ldi16 c1, 0x3d27
    ldi16 c2, 0x5fec
    ldi16 c3, 0x82b1
    ldsp8u c3, [sp+1]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x32: ldsp8u c3, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi16 c1, 0xa0c3
    st16 [c0], c1
    ldi16 c0, 0x1a93
    ldi16 c1, 0x3d5c
    ldi16 c2, 0x6025
    ldi16 c3, 0x82ee
    ldsp8u c3, [sp+2]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x33: ldsp8u c3, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi16 c1, 0xa801
    st16 [c0], c1
    ldi16 c0, 0x1ac4
    ldi16 c1, 0x3d91
    ldi16 c2, 0x605e
    ldi16 c3, 0x832b
    ldsp8u c3, [sp+3]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x34: ldsp8u c3, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi16 c1, 0xb080
    st16 [c0], c1
    ldi16 c0, 0x1af5
    ldi16 c1, 0x3dc6
    ldi16 c2, 0x6097
    ldi16 c3, 0x8368
    ldsp8u c3, [sp+4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x35: ldsp8u c3, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi16 c1, 0xb855
    st16 [c0], c1
    ldi16 c0, 0x1b26
    ldi16 c1, 0x3dfb
    ldi16 c2, 0x60d0
    ldi16 c3, 0x83a5
    ldsp8u c3, [sp+5]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x36: ldsp8u c3, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi16 c1, 0xc0c3
    st16 [c0], c1
    ldi16 c0, 0x1b57
    ldi16 c1, 0x3e30
    ldi16 c2, 0x6109
    ldi16 c3, 0x83e2
    ldsp8u c3, [sp+6]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x37: ldsp8u c3, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi16 c1, 0xc801
    st16 [c0], c1
    ldi16 c0, 0x1b88
    ldi16 c1, 0x3e65
    ldi16 c2, 0x6142
    ldi16 c3, 0x841f
    ldsp8u c3, [sp+7]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x38: ldsp8u c3, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi16 c1, 0xd080
    st16 [c0], c1
    ldi16 c0, 0x1bb9
    ldi16 c1, 0x3e9a
    ldi16 c2, 0x617b
    ldi16 c3, 0x845c
    ldsp8u c3, [sp+8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x39: ldsp8u c3, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi16 c1, 0xd855
    st16 [c0], c1
    ldi16 c0, 0x1bea
    ldi16 c1, 0x3ecf
    ldi16 c2, 0x61b4
    ldi16 c3, 0x8499
    ldsp8u c3, [sp+9]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3A: ldsp8u c3, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi16 c1, 0xe0c3
    st16 [c0], c1
    ldi16 c0, 0x1c1b
    ldi16 c1, 0x3f04
    ldi16 c2, 0x61ed
    ldi16 c3, 0x84d6
    ldsp8u c3, [sp+10]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3B: ldsp8u c3, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi16 c1, 0xe801
    st16 [c0], c1
    ldi16 c0, 0x1c4c
    ldi16 c1, 0x3f39
    ldi16 c2, 0x6226
    ldi16 c3, 0x8513
    ldsp8u c3, [sp+11]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3C: ldsp8u c3, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi16 c1, 0xf080
    st16 [c0], c1
    ldi16 c0, 0x1c7d
    ldi16 c1, 0x3f6e
    ldi16 c2, 0x625f
    ldi16 c3, 0x8550
    ldsp8u c3, [sp+12]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3D: ldsp8u c3, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi16 c1, 0xf855
    st16 [c0], c1
    ldi16 c0, 0x1cae
    ldi16 c1, 0x3fa3
    ldi16 c2, 0x6298
    ldi16 c3, 0x858d
    ldsp8u c3, [sp+13]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3E: ldsp8u c3, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi16 c1, 0x00c3
    st16 [c0], c1
    ldi16 c0, 0x1cdf
    ldi16 c1, 0x3fd8
    ldi16 c2, 0x62d1
    ldi16 c3, 0x85ca
    ldsp8u c3, [sp+14]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3F: ldsp8u c3, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070f
    ldi16 c1, 0x0801
    st16 [c0], c1
    ldi16 c0, 0x1d10
    ldi16 c1, 0x400d
    ldi16 c2, 0x630a
    ldi16 c3, 0x8607
    ldsp8u c3, [sp+15]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    sys debug_break
