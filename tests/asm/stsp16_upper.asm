.include "include/upper_stack_relative_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Entry 0x00: stsp16 [sp+0], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0x20
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0x90
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x0000
    ldi16 c1, 0x4d82
    ldi16 c2, 0x7183
    ldi16 c3, 0x9584
    stsp16 [sp+0], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x06ff
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x01: stsp16 [sp+1], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0x2b
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0x68
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x95
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xd4
    st8 [c0], c1
    ldi16 c0, 0x04de
    ldi16 c1, 0x4db7
    ldi16 c2, 0x71bc
    ldi16 c3, 0x95c1
    stsp16 [sp+1], c0
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
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x02: stsp16 [sp+2], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0x36
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x70
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x9a
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x77bd
    ldi16 c1, 0x4dec
    ldi16 c2, 0x71f5
    ldi16 c3, 0x95fe
    stsp16 [sp+2], c0
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
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x03: stsp16 [sp+3], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0x41
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x9f
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xdc
    st8 [c0], c1
    ldi16 c0, 0xf39c
    ldi16 c1, 0x4e21
    ldi16 c2, 0x722e
    ldi16 c3, 0x963b
    stsp16 [sp+3], c0
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
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x04: stsp16 [sp+4], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0x4c
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xa4
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0xe0
    st8 [c0], c1
    ldi16 c0, 0x1084
    ldi16 c1, 0x4e56
    ldi16 c2, 0x7267
    ldi16 c3, 0x9678
    stsp16 [sp+4], c0
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
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x05: stsp16 [sp+5], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0x57
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x88
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0xa9
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xe4
    st8 [c0], c1
    ldi16 c0, 0x145a
    ldi16 c1, 0x4e8b
    ldi16 c2, 0x72a0
    ldi16 c3, 0x96b5
    stsp16 [sp+5], c0
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
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x06: stsp16 [sp+6], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0x62
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x90
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xae
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xe8
    st8 [c0], c1
    ldi16 c0, 0x6739
    ldi16 c1, 0x4ec0
    ldi16 c2, 0x72d9
    ldi16 c3, 0x96f2
    stsp16 [sp+6], c0
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
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x07: stsp16 [sp+7], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0x6d
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x98
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xb3
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xec
    st8 [c0], c1
    ldi16 c0, 0xe318
    ldi16 c1, 0x4ef5
    ldi16 c2, 0x7312
    ldi16 c3, 0x972f
    stsp16 [sp+7], c0
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
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x08: stsp16 [sp+8], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xa0
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xb8
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x2108
    ldi16 c1, 0x4f2a
    ldi16 c2, 0x734b
    ldi16 c3, 0x976c
    stsp16 [sp+8], c0
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
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x09: stsp16 [sp+9], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0x83
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xa8
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0xbd
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0xf4
    st8 [c0], c1
    ldi16 c0, 0x25d6
    ldi16 c1, 0x4f5f
    ldi16 c2, 0x7384
    ldi16 c3, 0x97a9
    stsp16 [sp+9], c0
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
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0A: stsp16 [sp+10], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0x8e
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0xc2
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xf8
    st8 [c0], c1
    ldi16 c0, 0x56b5
    ldi16 c1, 0x4f94
    ldi16 c2, 0x73bd
    ldi16 c3, 0x97e6
    stsp16 [sp+10], c0
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
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0B: stsp16 [sp+11], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0x99
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0xb8
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xc7
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xfc
    st8 [c0], c1
    ldi16 c0, 0xd294
    ldi16 c1, 0x4fc9
    ldi16 c2, 0x73f6
    ldi16 c3, 0x9823
    stsp16 [sp+11], c0
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
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0C: stsp16 [sp+12], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0xa4
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xc0
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xcc
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x318c
    ldi16 c1, 0x4ffe
    ldi16 c2, 0x742f
    ldi16 c3, 0x9860
    stsp16 [sp+12], c0
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
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0D: stsp16 [sp+13], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0xaf
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xc8
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0xd1
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x04
    st8 [c0], c1
    ldi16 c0, 0x3552
    ldi16 c1, 0x5033
    ldi16 c2, 0x7468
    ldi16 c3, 0x989d
    stsp16 [sp+13], c0
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
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0E: stsp16 [sp+14], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0xba
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0xd6
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x4631
    ldi16 c1, 0x5068
    ldi16 c2, 0x74a1
    ldi16 c3, 0x98da
    stsp16 [sp+14], c0
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
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x0F: stsp16 [sp+15], c0
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0xc5
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0xdb
    st8 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x0c
    st8 [c0], c1
    ldi16 c0, 0xc210
    ldi16 c1, 0x509d
    ldi16 c2, 0x74da
    ldi16 c3, 0x9917
    stsp16 [sp+15], c0
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
    ldi16 c0, 0x0710
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x10: stsp16 [sp+0], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0xd1
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0xe1
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x2c91
    ldi16 c1, 0x4211
    ldi16 c2, 0x7513
    ldi16 c3, 0x9954
    stsp16 [sp+0], c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x06ff
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x11: stsp16 [sp+1], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0xdc
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xe6
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x04
    st8 [c0], c1
    ldi16 c0, 0x2cc2
    ldi16 c1, 0x4731
    ldi16 c2, 0x754c
    ldi16 c3, 0x9991
    stsp16 [sp+1], c1
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
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x12: stsp16 [sp+2], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0xe7
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xe0
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xeb
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x2cf3
    ldi16 c1, 0xca52
    ldi16 c2, 0x7585
    ldi16 c3, 0x99ce
    stsp16 [sp+2], c1
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
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x13: stsp16 [sp+3], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0xf2
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xe8
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x0c
    st8 [c0], c1
    ldi16 c0, 0x2d24
    ldi16 c1, 0xeb29
    ldi16 c2, 0x75be
    ldi16 c3, 0x9a0b
    stsp16 [sp+3], c1
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
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x14: stsp16 [sp+4], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0xfd
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xf5
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x2d55
    ldi16 c1, 0x5295
    ldi16 c2, 0x75f7
    ldi16 c3, 0x9a48
    stsp16 [sp+4], c1
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
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x15: stsp16 [sp+5], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xf8
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0xfa
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x14
    st8 [c0], c1
    ldi16 c0, 0x2d86
    ldi16 c1, 0x57b5
    ldi16 c2, 0x7630
    ldi16 c3, 0x9a85
    stsp16 [sp+5], c1
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
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x16: stsp16 [sp+6], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0x13
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xff
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x18
    st8 [c0], c1
    ldi16 c0, 0x2db7
    ldi16 c1, 0xdad6
    ldi16 c2, 0x7669
    ldi16 c3, 0x9ac2
    stsp16 [sp+6], c1
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
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x17: stsp16 [sp+7], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0x1e
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x04
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x1c
    st8 [c0], c1
    ldi16 c0, 0x2de8
    ldi16 c1, 0xfbad
    ldi16 c2, 0x76a2
    ldi16 c3, 0x9aff
    stsp16 [sp+7], c1
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
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x18: stsp16 [sp+8], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0x29
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x09
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x20
    st8 [c0], c1
    ldi16 c0, 0x2e19
    ldi16 c1, 0x6319
    ldi16 c2, 0x76db
    ldi16 c3, 0x9b3c
    stsp16 [sp+8], c1
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
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x19: stsp16 [sp+9], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x18
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x0e
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x24
    st8 [c0], c1
    ldi16 c0, 0x2e4a
    ldi16 c1, 0x6639
    ldi16 c2, 0x7714
    ldi16 c3, 0x9b79
    stsp16 [sp+9], c1
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
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1A: stsp16 [sp+10], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0x3f
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x20
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x13
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x28
    st8 [c0], c1
    ldi16 c0, 0x2e7b
    ldi16 c1, 0xeb5a
    ldi16 c2, 0x774d
    ldi16 c3, 0x9bb6
    stsp16 [sp+10], c1
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
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1B: stsp16 [sp+11], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0x4a
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x28
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x18
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x2c
    st8 [c0], c1
    ldi16 c0, 0x2eac
    ldi16 c1, 0xca21
    ldi16 c2, 0x7786
    ldi16 c3, 0x9bf3
    stsp16 [sp+11], c1
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
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1C: stsp16 [sp+12], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x1d
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x2edd
    ldi16 c1, 0x739d
    ldi16 c2, 0x77bf
    ldi16 c3, 0x9c30
    stsp16 [sp+12], c1
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
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1D: stsp16 [sp+13], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x22
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x2f0e
    ldi16 c1, 0x76bd
    ldi16 c2, 0x77f8
    ldi16 c3, 0x9c6d
    stsp16 [sp+13], c1
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
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1E: stsp16 [sp+14], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0x6b
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x40
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x27
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x2f3f
    ldi16 c1, 0xfbde
    ldi16 c2, 0x7831
    ldi16 c3, 0x9caa
    stsp16 [sp+14], c1
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
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x1F: stsp16 [sp+15], c1
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0x76
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x2c
    st8 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x3c
    st8 [c0], c1
    ldi16 c0, 0x2f70
    ldi16 c1, 0xdaa5
    ldi16 c2, 0x786a
    ldi16 c3, 0x9ce7
    stsp16 [sp+15], c1
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
    ldi16 c0, 0x0710
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x20: stsp16 [sp+0], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0x82
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi8 c1, 0x40
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0x32
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x2fa1
    ldi16 c1, 0x5422
    ldi16 c2, 0x84df
    ldi16 c3, 0x9d24
    stsp16 [sp+0], c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x06ff
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x21: stsp16 [sp+1], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0x8d
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x37
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x2fd2
    ldi16 c1, 0x5457
    ldi16 c2, 0xf7be
    ldi16 c3, 0x9d61
    stsp16 [sp+1], c2
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
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x22: stsp16 [sp+2], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0x98
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x50
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x3c
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x3003
    ldi16 c1, 0x548c
    ldi16 c2, 0x739d
    ldi16 c3, 0x9d9e
    stsp16 [sp+2], c2
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
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x23: stsp16 [sp+3], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0xa3
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x58
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x41
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x3c
    st8 [c0], c1
    ldi16 c0, 0x3034
    ldi16 c1, 0x54c1
    ldi16 c2, 0x9083
    ldi16 c3, 0x9ddb
    stsp16 [sp+3], c2
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
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x24: stsp16 [sp+4], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0xae
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x46
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x40
    st8 [c0], c1
    ldi16 c0, 0x3065
    ldi16 c1, 0x54f6
    ldi16 c2, 0x945b
    ldi16 c3, 0x9e18
    stsp16 [sp+4], c2
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
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x25: stsp16 [sp+5], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0xb9
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x68
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x4b
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x44
    st8 [c0], c1
    ldi16 c0, 0x3096
    ldi16 c1, 0x552b
    ldi16 c2, 0xe73a
    ldi16 c3, 0x9e55
    stsp16 [sp+5], c2
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
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x26: stsp16 [sp+6], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0xc4
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x70
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x50
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x30c7
    ldi16 c1, 0x5560
    ldi16 c2, 0x6319
    ldi16 c3, 0x9e92
    stsp16 [sp+6], c2
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
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x27: stsp16 [sp+7], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0xcf
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x4c
    st8 [c0], c1
    ldi16 c0, 0x30f8
    ldi16 c1, 0x5595
    ldi16 c2, 0xa107
    ldi16 c3, 0x9ecf
    stsp16 [sp+7], c2
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
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x28: stsp16 [sp+8], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0xda
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x5a
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x50
    st8 [c0], c1
    ldi16 c0, 0x3129
    ldi16 c1, 0x55ca
    ldi16 c2, 0xa5d7
    ldi16 c3, 0x9f0c
    stsp16 [sp+8], c2
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
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x29: stsp16 [sp+9], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0xe5
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x88
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x5f
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x54
    st8 [c0], c1
    ldi16 c0, 0x315a
    ldi16 c1, 0x55ff
    ldi16 c2, 0xd6b6
    ldi16 c3, 0x9f49
    stsp16 [sp+9], c2
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
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2A: stsp16 [sp+10], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x90
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x58
    st8 [c0], c1
    ldi16 c0, 0x318b
    ldi16 c1, 0x5634
    ldi16 c2, 0x5295
    ldi16 c3, 0x9f86
    stsp16 [sp+10], c2
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
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2B: stsp16 [sp+11], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0xfb
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x98
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x69
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x5c
    st8 [c0], c1
    ldi16 c0, 0x31bc
    ldi16 c1, 0x5669
    ldi16 c2, 0xb18b
    ldi16 c3, 0x9fc3
    stsp16 [sp+11], c2
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
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2C: stsp16 [sp+12], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0x06
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xa0
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x6e
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x31ed
    ldi16 c1, 0x569e
    ldi16 c2, 0xb553
    ldi16 c3, 0xa000
    stsp16 [sp+12], c2
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
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2D: stsp16 [sp+13], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0x11
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xa8
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x73
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x321e
    ldi16 c1, 0x56d3
    ldi16 c2, 0xc632
    ldi16 c3, 0xa03d
    stsp16 [sp+13], c2
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
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2E: stsp16 [sp+14], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0x1c
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x68
    st8 [c0], c1
    ldi16 c0, 0x324f
    ldi16 c1, 0x5708
    ldi16 c2, 0x4211
    ldi16 c3, 0xa07a
    stsp16 [sp+14], c2
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
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x2F: stsp16 [sp+15], c2
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0x27
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0xb8
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x7d
    st8 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x6c
    st8 [c0], c1
    ldi16 c0, 0x3280
    ldi16 c1, 0x573d
    ldi16 c2, 0xc20f
    ldi16 c3, 0xa0b7
    stsp16 [sp+15], c2
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
    ldi16 c0, 0x0710
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x30: stsp16 [sp+0], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0x33
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0x83
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x32b1
    ldi16 c1, 0x5772
    ldi16 c2, 0x7c33
    ldi16 c3, 0xc730
    stsp16 [sp+0], c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    csr_print_r0_r3
    getsp r0
    csr_print_r0_line
    ldi16 c0, 0x06ff
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line
    ldi16 c0, 0x0701
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x31: stsp16 [sp+1], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0x3e
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi8 c1, 0xb8
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x88
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x32e2
    ldi16 c1, 0x57a7
    ldi16 c2, 0x7c6c
    ldi16 c3, 0x4a51
    stsp16 [sp+1], c3
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
    ldi16 c0, 0x0702
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x32: stsp16 [sp+2], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0x49
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xc0
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x8d
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x68
    st8 [c0], c1
    ldi16 c0, 0x3313
    ldi16 c1, 0x57dc
    ldi16 c2, 0x7ca5
    ldi16 c3, 0x6b28
    stsp16 [sp+2], c3
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
    ldi16 c0, 0x0703
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x33: stsp16 [sp+3], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0x54
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xc8
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x92
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x6c
    st8 [c0], c1
    ldi16 c0, 0x3344
    ldi16 c1, 0x5811
    ldi16 c2, 0x7cde
    ldi16 c3, 0xd292
    stsp16 [sp+3], c3
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
    ldi16 c0, 0x0704
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x34: stsp16 [sp+4], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0x5f
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x97
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x70
    st8 [c0], c1
    ldi16 c0, 0x3375
    ldi16 c1, 0x5846
    ldi16 c2, 0x7d17
    ldi16 c3, 0xd7b4
    stsp16 [sp+4], c3
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
    ldi16 c0, 0x0705
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x35: stsp16 [sp+5], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0x6a
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x9c
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x74
    st8 [c0], c1
    ldi16 c0, 0x33a6
    ldi16 c1, 0x587b
    ldi16 c2, 0x7d50
    ldi16 c3, 0x5ad5
    stsp16 [sp+5], c3
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
    ldi16 c0, 0x0706
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x36: stsp16 [sp+6], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0x75
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0xe0
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xa1
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x33d7
    ldi16 c1, 0x58b0
    ldi16 c2, 0x7d89
    ldi16 c3, 0x7bac
    stsp16 [sp+6], c3
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
    ldi16 c0, 0x0707
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x37: stsp16 [sp+7], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xe8
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xa6
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x7c
    st8 [c0], c1
    ldi16 c0, 0x3408
    ldi16 c1, 0x58e5
    ldi16 c2, 0x7dc2
    ldi16 c3, 0xe316
    stsp16 [sp+7], c3
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
    ldi16 c0, 0x0708
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x38: stsp16 [sp+8], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0x8b
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xab
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x80
    st8 [c0], c1
    ldi16 c0, 0x3439
    ldi16 c1, 0x591a
    ldi16 c2, 0x7dfb
    ldi16 c3, 0xe638
    stsp16 [sp+8], c3
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
    ldi16 c0, 0x0709
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x39: stsp16 [sp+9], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0x96
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xf8
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x84
    st8 [c0], c1
    ldi16 c0, 0x346a
    ldi16 c1, 0x594f
    ldi16 c2, 0x7e34
    ldi16 c3, 0x6b59
    stsp16 [sp+9], c3
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
    ldi16 c0, 0x070a
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3A: stsp16 [sp+10], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0xa1
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0xb5
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x88
    st8 [c0], c1
    ldi16 c0, 0x349b
    ldi16 c1, 0x5984
    ldi16 c2, 0x7e6d
    ldi16 c3, 0x4a20
    stsp16 [sp+10], c3
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
    ldi16 c0, 0x070b
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3B: stsp16 [sp+11], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0xac
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xba
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x8c
    st8 [c0], c1
    ldi16 c0, 0x34cc
    ldi16 c1, 0x59b9
    ldi16 c2, 0x7ea6
    ldi16 c3, 0xf39a
    stsp16 [sp+11], c3
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
    ldi16 c0, 0x070c
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3C: stsp16 [sp+12], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0xb7
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xbf
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x90
    st8 [c0], c1
    ldi16 c0, 0x34fd
    ldi16 c1, 0x59ee
    ldi16 c2, 0x7edf
    ldi16 c3, 0xf6bc
    stsp16 [sp+12], c3
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
    ldi16 c0, 0x070d
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3D: stsp16 [sp+13], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0xc2
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x18
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0xc4
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x94
    st8 [c0], c1
    ldi16 c0, 0x352e
    ldi16 c1, 0x5a23
    ldi16 c2, 0x7f18
    ldi16 c3, 0x7bdd
    stsp16 [sp+13], c3
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
    ldi16 c0, 0x070e
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3E: stsp16 [sp+14], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0xcd
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x20
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0xc9
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x98
    st8 [c0], c1
    ldi16 c0, 0x355f
    ldi16 c1, 0x5a58
    ldi16 c2, 0x7f51
    ldi16 c3, 0x5aa4
    stsp16 [sp+14], c3
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
    ldi16 c0, 0x070f
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    ; Entry 0x3F: stsp16 [sp+15], c3
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x28
    st8 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0xce
    st8 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x9c
    st8 [c0], c1
    ldi16 c0, 0x3590
    ldi16 c1, 0x5a8d
    ldi16 c2, 0x7f8a
    ldi16 c3, 0x041e
    stsp16 [sp+15], c3
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
    ldi16 c0, 0x0710
    ld16 c1, [c0]
    mov r0, r5
    csr_print_r0_line

    sys debug_break
