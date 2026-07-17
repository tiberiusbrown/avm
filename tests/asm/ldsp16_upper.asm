.include "include/compact_stack_relative_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Entry 0x00: ldsp16 c0, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0xa0
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi16 c1, 0x0000
    st16 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x50
    st8 [c0], c1
    ldi16 c0, 0x1d41
    ldi16 c1, 0x4042
    ldi16 c2, 0x6343
    ldi16 c3, 0x8644
    ldsp16 c0, [sp+0]
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

    ; Entry 0x01: ldsp16 c0, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0xa4
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi16 c1, 0x1110
    st16 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x55
    st8 [c0], c1
    ldi16 c0, 0x1d72
    ldi16 c1, 0x4077
    ldi16 c2, 0x637c
    ldi16 c3, 0x8681
    ldsp16 c0, [sp+1]
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

    ; Entry 0x02: ldsp16 c0, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0xa8
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi16 c1, 0x22dd
    st16 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x5a
    st8 [c0], c1
    ldi16 c0, 0x1da3
    ldi16 c1, 0x40ac
    ldi16 c2, 0x63b5
    ldi16 c3, 0x86be
    ldsp16 c0, [sp+2]
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

    ; Entry 0x03: ldsp16 c0, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0xac
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi16 c1, 0x3233
    st16 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x5f
    st8 [c0], c1
    ldi16 c0, 0x1dd4
    ldi16 c1, 0x40e1
    ldi16 c2, 0x63ee
    ldi16 c3, 0x86fb
    ldsp16 c0, [sp+3]
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

    ; Entry 0x04: ldsp16 c0, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi16 c1, 0x3bbb
    st16 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x1e05
    ldi16 c1, 0x4116
    ldi16 c2, 0x6427
    ldi16 c3, 0x8738
    ldsp16 c0, [sp+4]
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

    ; Entry 0x05: ldsp16 c0, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0xb4
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi16 c1, 0xd555
    st16 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x69
    st8 [c0], c1
    ldi16 c0, 0x1e36
    ldi16 c1, 0x414b
    ldi16 c2, 0x6460
    ldi16 c3, 0x8775
    ldsp16 c0, [sp+5]
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

    ; Entry 0x06: ldsp16 c0, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0xb8
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi16 c1, 0x9999
    st16 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x6e
    st8 [c0], c1
    ldi16 c0, 0x1e67
    ldi16 c1, 0x4180
    ldi16 c2, 0x6499
    ldi16 c3, 0x87b2
    ldsp16 c0, [sp+6]
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

    ; Entry 0x07: ldsp16 c0, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0xbc
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi16 c1, 0xd22d
    st16 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x73
    st8 [c0], c1
    ldi16 c0, 0x1e98
    ldi16 c1, 0x41b5
    ldi16 c2, 0x64d2
    ldi16 c3, 0x87ef
    ldsp16 c0, [sp+7]
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

    ; Entry 0x08: ldsp16 c0, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0xc0
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi16 c1, 0x8888
    st16 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x78
    st8 [c0], c1
    ldi16 c0, 0x1ec9
    ldi16 c1, 0x41ea
    ldi16 c2, 0x650b
    ldi16 c3, 0x882c
    ldsp16 c0, [sp+8]
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

    ; Entry 0x09: ldsp16 c0, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0xc4
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi16 c1, 0x9998
    st16 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x7d
    st8 [c0], c1
    ldi16 c0, 0x1efa
    ldi16 c1, 0x421f
    ldi16 c2, 0x6544
    ldi16 c3, 0x8869
    ldsp16 c0, [sp+9]
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

    ; Entry 0x0A: ldsp16 c0, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0xc8
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi16 c1, 0xaa55
    st16 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x82
    st8 [c0], c1
    ldi16 c0, 0x1f2b
    ldi16 c1, 0x4254
    ldi16 c2, 0x657d
    ldi16 c3, 0x88a6
    ldsp16 c0, [sp+10]
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

    ; Entry 0x0B: ldsp16 c0, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0xcc
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi16 c1, 0xbabb
    st16 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x87
    st8 [c0], c1
    ldi16 c0, 0x1f5c
    ldi16 c1, 0x4289
    ldi16 c2, 0x65b6
    ldi16 c3, 0x88e3
    ldsp16 c0, [sp+11]
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

    ; Entry 0x0C: ldsp16 c0, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi16 c1, 0xb333
    st16 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x8c
    st8 [c0], c1
    ldi16 c0, 0x1f8d
    ldi16 c1, 0x42be
    ldi16 c2, 0x65ef
    ldi16 c3, 0x8920
    ldsp16 c0, [sp+12]
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

    ; Entry 0x0D: ldsp16 c0, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0xd4
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi16 c1, 0x5ddd
    st16 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x91
    st8 [c0], c1
    ldi16 c0, 0x1fbe
    ldi16 c1, 0x42f3
    ldi16 c2, 0x6628
    ldi16 c3, 0x895d
    ldsp16 c0, [sp+13]
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

    ; Entry 0x0E: ldsp16 c0, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi16 c1, 0x1111
    st16 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x96
    st8 [c0], c1
    ldi16 c0, 0x1fef
    ldi16 c1, 0x4328
    ldi16 c2, 0x6661
    ldi16 c3, 0x899a
    ldsp16 c0, [sp+14]
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

    ; Entry 0x0F: ldsp16 c0, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0xdc
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi16 c1, 0x5aa5
    st16 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x9b
    st8 [c0], c1
    ldi16 c0, 0x2020
    ldi16 c1, 0x435d
    ldi16 c2, 0x669a
    ldi16 c3, 0x89d7
    ldsp16 c0, [sp+15]
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

    ; Entry 0x10: ldsp16 c1, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0xd0
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi16 c1, 0x0001
    st16 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xa1
    st8 [c0], c1
    ldi16 c0, 0x2051
    ldi16 c1, 0x4392
    ldi16 c2, 0x66d3
    ldi16 c3, 0x8a14
    ldsp16 c1, [sp+0]
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

    ; Entry 0x11: ldsp16 c1, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0xd4
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi16 c1, 0x11ee
    st16 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xa6
    st8 [c0], c1
    ldi16 c0, 0x2082
    ldi16 c1, 0x43c7
    ldi16 c2, 0x670c
    ldi16 c3, 0x8a51
    ldsp16 c1, [sp+1]
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

    ; Entry 0x12: ldsp16 c1, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi16 c1, 0x2322
    st16 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xab
    st8 [c0], c1
    ldi16 c0, 0x20b3
    ldi16 c1, 0x43fc
    ldi16 c2, 0x6745
    ldi16 c3, 0x8a8e
    ldsp16 c1, [sp+2]
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

    ; Entry 0x13: ldsp16 c1, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0xdc
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi16 c1, 0x4ccc
    st16 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0xb0
    st8 [c0], c1
    ldi16 c0, 0x20e4
    ldi16 c1, 0x4431
    ldi16 c2, 0x677e
    ldi16 c3, 0x8acb
    ldsp16 c1, [sp+3]
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

    ; Entry 0x14: ldsp16 c1, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0xe0
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi16 c1, 0xc444
    st16 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0xb5
    st8 [c0], c1
    ldi16 c0, 0x2115
    ldi16 c1, 0x4466
    ldi16 c2, 0x67b7
    ldi16 c3, 0x8b08
    ldsp16 c1, [sp+4]
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

    ; Entry 0x15: ldsp16 c1, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0xe4
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi16 c1, 0xaaaa
    st16 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0xba
    st8 [c0], c1
    ldi16 c0, 0x2146
    ldi16 c1, 0x449b
    ldi16 c2, 0x67f0
    ldi16 c3, 0x8b45
    ldsp16 c1, [sp+5]
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

    ; Entry 0x16: ldsp16 c1, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0xe8
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi16 c1, 0xc33c
    st16 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0xbf
    st8 [c0], c1
    ldi16 c0, 0x2177
    ldi16 c1, 0x44d0
    ldi16 c2, 0x6829
    ldi16 c3, 0x8b82
    ldsp16 c1, [sp+6]
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

    ; Entry 0x17: ldsp16 c1, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0xec
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi16 c1, 0x7777
    st16 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0xc4
    st8 [c0], c1
    ldi16 c0, 0x21a8
    ldi16 c1, 0x4505
    ldi16 c2, 0x6862
    ldi16 c3, 0x8bbf
    ldsp16 c1, [sp+7]
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

    ; Entry 0x18: ldsp16 c1, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0xf0
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi16 c1, 0x8889
    st16 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0xc9
    st8 [c0], c1
    ldi16 c0, 0x21d9
    ldi16 c1, 0x453a
    ldi16 c2, 0x689b
    ldi16 c3, 0x8bfc
    ldsp16 c1, [sp+8]
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

    ; Entry 0x19: ldsp16 c1, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0xf4
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi16 c1, 0x9966
    st16 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0xce
    st8 [c0], c1
    ldi16 c0, 0x220a
    ldi16 c1, 0x456f
    ldi16 c2, 0x68d4
    ldi16 c3, 0x8c39
    ldsp16 c1, [sp+9]
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

    ; Entry 0x1A: ldsp16 c1, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0xf8
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi16 c1, 0xabaa
    st16 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0xd3
    st8 [c0], c1
    ldi16 c0, 0x223b
    ldi16 c1, 0x45a4
    ldi16 c2, 0x690d
    ldi16 c3, 0x8c76
    ldsp16 c1, [sp+10]
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

    ; Entry 0x1B: ldsp16 c1, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0xfc
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi16 c1, 0xc444
    st16 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0xd8
    st8 [c0], c1
    ldi16 c0, 0x226c
    ldi16 c1, 0x45d9
    ldi16 c2, 0x6946
    ldi16 c3, 0x8cb3
    ldsp16 c1, [sp+11]
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

    ; Entry 0x1C: ldsp16 c1, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi16 c1, 0x4ccc
    st16 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0xdd
    st8 [c0], c1
    ldi16 c0, 0x229d
    ldi16 c1, 0x460e
    ldi16 c2, 0x697f
    ldi16 c3, 0x8cf0
    ldsp16 c1, [sp+12]
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

    ; Entry 0x1D: ldsp16 c1, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0x04
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi16 c1, 0x2222
    st16 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0xe2
    st8 [c0], c1
    ldi16 c0, 0x22ce
    ldi16 c1, 0x4643
    ldi16 c2, 0x69b8
    ldi16 c3, 0x8d2d
    ldsp16 c1, [sp+13]
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

    ; Entry 0x1E: ldsp16 c1, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi16 c1, 0x4bb4
    st16 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0xe7
    st8 [c0], c1
    ldi16 c0, 0x22ff
    ldi16 c1, 0x4678
    ldi16 c2, 0x69f1
    ldi16 c3, 0x8d6a
    ldsp16 c1, [sp+14]
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

    ; Entry 0x1F: ldsp16 c1, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0x0c
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi16 c1, 0xffff
    st16 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0xec
    st8 [c0], c1
    ldi16 c0, 0x2330
    ldi16 c1, 0x46ad
    ldi16 c2, 0x6a2a
    ldi16 c3, 0x8da7
    ldsp16 c1, [sp+15]
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

    ; Entry 0x20: ldsp16 c2, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0x00
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi16 c1, 0x00ff
    st16 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0xf2
    st8 [c0], c1
    ldi16 c0, 0x2361
    ldi16 c1, 0x46e2
    ldi16 c2, 0x6a63
    ldi16 c3, 0x8de4
    ldsp16 c2, [sp+0]
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

    ; Entry 0x21: ldsp16 c2, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0x04
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi16 c1, 0x1011
    st16 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0xf7
    st8 [c0], c1
    ldi16 c0, 0x2392
    ldi16 c1, 0x4717
    ldi16 c2, 0x6a9c
    ldi16 c3, 0x8e21
    ldsp16 c2, [sp+1]
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

    ; Entry 0x22: ldsp16 c2, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0x08
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi16 c1, 0x5ddd
    st16 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0xfc
    st8 [c0], c1
    ldi16 c0, 0x23c3
    ldi16 c1, 0x474c
    ldi16 c2, 0x6ad5
    ldi16 c3, 0x8e5e
    ldsp16 c2, [sp+2]
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

    ; Entry 0x23: ldsp16 c2, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0x0c
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi16 c1, 0xb333
    st16 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x01
    st8 [c0], c1
    ldi16 c0, 0x23f4
    ldi16 c1, 0x4781
    ldi16 c2, 0x6b0e
    ldi16 c3, 0x8e9b
    ldsp16 c2, [sp+3]
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

    ; Entry 0x24: ldsp16 c2, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi16 c1, 0xbbbb
    st16 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x06
    st8 [c0], c1
    ldi16 c0, 0x2425
    ldi16 c1, 0x47b6
    ldi16 c2, 0x6b47
    ldi16 c3, 0x8ed8
    ldsp16 c2, [sp+4]
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

    ; Entry 0x25: ldsp16 c2, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0x14
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi16 c1, 0xf00f
    st16 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x0b
    st8 [c0], c1
    ldi16 c0, 0x2456
    ldi16 c1, 0x47eb
    ldi16 c2, 0x6b80
    ldi16 c3, 0x8f15
    ldsp16 c2, [sp+5]
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

    ; Entry 0x26: ldsp16 c2, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0x18
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi16 c1, 0x6666
    st16 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x10
    st8 [c0], c1
    ldi16 c0, 0x2487
    ldi16 c1, 0x4820
    ldi16 c2, 0x6bb9
    ldi16 c3, 0x8f52
    ldsp16 c2, [sp+6]
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

    ; Entry 0x27: ldsp16 c2, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0x1c
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi16 c1, 0x7776
    st16 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x15
    st8 [c0], c1
    ldi16 c0, 0x24b8
    ldi16 c1, 0x4855
    ldi16 c2, 0x6bf2
    ldi16 c3, 0x8f8f
    ldsp16 c2, [sp+7]
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

    ; Entry 0x28: ldsp16 c2, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0x20
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi16 c1, 0x8877
    st16 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x1a
    st8 [c0], c1
    ldi16 c0, 0x24e9
    ldi16 c1, 0x488a
    ldi16 c2, 0x6c2b
    ldi16 c3, 0x8fcc
    ldsp16 c2, [sp+8]
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

    ; Entry 0x29: ldsp16 c2, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0x24
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi16 c1, 0x9899
    st16 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x1f
    st8 [c0], c1
    ldi16 c0, 0x251a
    ldi16 c1, 0x48bf
    ldi16 c2, 0x6c64
    ldi16 c3, 0x9009
    ldsp16 c2, [sp+9]
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

    ; Entry 0x2A: ldsp16 c2, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0x28
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi16 c1, 0xd555
    st16 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x24
    st8 [c0], c1
    ldi16 c0, 0x254b
    ldi16 c1, 0x48f4
    ldi16 c2, 0x6c9d
    ldi16 c3, 0x9046
    ldsp16 c2, [sp+10]
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

    ; Entry 0x2B: ldsp16 c2, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0x2c
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi16 c1, 0x3bbb
    st16 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x29
    st8 [c0], c1
    ldi16 c0, 0x257c
    ldi16 c1, 0x4929
    ldi16 c2, 0x6cd6
    ldi16 c3, 0x9083
    ldsp16 c2, [sp+11]
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

    ; Entry 0x2C: ldsp16 c2, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi16 c1, 0x3333
    st16 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x2e
    st8 [c0], c1
    ldi16 c0, 0x25ad
    ldi16 c1, 0x495e
    ldi16 c2, 0x6d0f
    ldi16 c3, 0x90c0
    ldsp16 c2, [sp+12]
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

    ; Entry 0x2D: ldsp16 c2, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi16 c1, 0x7887
    st16 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x33
    st8 [c0], c1
    ldi16 c0, 0x25de
    ldi16 c1, 0x4993
    ldi16 c2, 0x6d48
    ldi16 c3, 0x90fd
    ldsp16 c2, [sp+13]
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

    ; Entry 0x2E: ldsp16 c2, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi16 c1, 0xeeee
    st16 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x260f
    ldi16 c1, 0x49c8
    ldi16 c2, 0x6d81
    ldi16 c3, 0x913a
    ldsp16 c2, [sp+14]
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

    ; Entry 0x2F: ldsp16 c2, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0x3c
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi16 c1, 0xfffe
    st16 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x3d
    st8 [c0], c1
    ldi16 c0, 0x2640
    ldi16 c1, 0x49fd
    ldi16 c2, 0x6dba
    ldi16 c3, 0x9177
    ldsp16 c2, [sp+15]
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

    ; Entry 0x30: ldsp16 c3, [sp+0]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x06ff
    ldi8 c1, 0x30
    st8 [c0], c1
    ldi16 c0, 0x0700
    ldi16 c1, 0x0100
    st16 [c0], c1
    ldi16 c0, 0x0702
    ldi8 c1, 0x43
    st8 [c0], c1
    ldi16 c0, 0x2671
    ldi16 c1, 0x4a32
    ldi16 c2, 0x6df3
    ldi16 c3, 0x91b4
    ldsp16 c3, [sp+0]
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

    ; Entry 0x31: ldsp16 c3, [sp+1]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0700
    ldi8 c1, 0x34
    st8 [c0], c1
    ldi16 c0, 0x0701
    ldi16 c1, 0x6eee
    st16 [c0], c1
    ldi16 c0, 0x0703
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x26a2
    ldi16 c1, 0x4a67
    ldi16 c2, 0x6e2c
    ldi16 c3, 0x91f1
    ldsp16 c3, [sp+1]
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

    ; Entry 0x32: ldsp16 c3, [sp+2]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0701
    ldi8 c1, 0x38
    st8 [c0], c1
    ldi16 c0, 0x0702
    ldi16 c1, 0xa222
    st16 [c0], c1
    ldi16 c0, 0x0704
    ldi8 c1, 0x4d
    st8 [c0], c1
    ldi16 c0, 0x26d3
    ldi16 c1, 0x4a9c
    ldi16 c2, 0x6e65
    ldi16 c3, 0x922e
    ldsp16 c3, [sp+2]
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

    ; Entry 0x33: ldsp16 c3, [sp+3]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0702
    ldi8 c1, 0x3c
    st8 [c0], c1
    ldi16 c0, 0x0703
    ldi16 c1, 0xcccc
    st16 [c0], c1
    ldi16 c0, 0x0705
    ldi8 c1, 0x52
    st8 [c0], c1
    ldi16 c0, 0x2704
    ldi16 c1, 0x4ad1
    ldi16 c2, 0x6e9e
    ldi16 c3, 0x926b
    ldsp16 c3, [sp+3]
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

    ; Entry 0x34: ldsp16 c3, [sp+4]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0703
    ldi8 c1, 0x40
    st8 [c0], c1
    ldi16 c0, 0x0704
    ldi16 c1, 0xe11e
    st16 [c0], c1
    ldi16 c0, 0x0706
    ldi8 c1, 0x57
    st8 [c0], c1
    ldi16 c0, 0x2735
    ldi16 c1, 0x4b06
    ldi16 c2, 0x6ed7
    ldi16 c3, 0x92a8
    ldsp16 c3, [sp+4]
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

    ; Entry 0x35: ldsp16 c3, [sp+5]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0704
    ldi8 c1, 0x44
    st8 [c0], c1
    ldi16 c0, 0x0705
    ldi16 c1, 0x5555
    st16 [c0], c1
    ldi16 c0, 0x0707
    ldi8 c1, 0x5c
    st8 [c0], c1
    ldi16 c0, 0x2766
    ldi16 c1, 0x4b3b
    ldi16 c2, 0x6f10
    ldi16 c3, 0x92e5
    ldsp16 c3, [sp+5]
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

    ; Entry 0x36: ldsp16 c3, [sp+6]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0705
    ldi8 c1, 0x48
    st8 [c0], c1
    ldi16 c0, 0x0706
    ldi16 c1, 0x6667
    st16 [c0], c1
    ldi16 c0, 0x0708
    ldi8 c1, 0x61
    st8 [c0], c1
    ldi16 c0, 0x2797
    ldi16 c1, 0x4b70
    ldi16 c2, 0x6f49
    ldi16 c3, 0x9322
    ldsp16 c3, [sp+6]
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

    ; Entry 0x37: ldsp16 c3, [sp+7]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0706
    ldi8 c1, 0x4c
    st8 [c0], c1
    ldi16 c0, 0x0707
    ldi16 c1, 0x7788
    st16 [c0], c1
    ldi16 c0, 0x0709
    ldi8 c1, 0x66
    st8 [c0], c1
    ldi16 c0, 0x27c8
    ldi16 c1, 0x4ba5
    ldi16 c2, 0x6f82
    ldi16 c3, 0x935f
    ldsp16 c3, [sp+7]
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

    ; Entry 0x38: ldsp16 c3, [sp+8]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0707
    ldi8 c1, 0x50
    st8 [c0], c1
    ldi16 c0, 0x0708
    ldi16 c1, 0x8988
    st16 [c0], c1
    ldi16 c0, 0x070a
    ldi8 c1, 0x6b
    st8 [c0], c1
    ldi16 c0, 0x27f9
    ldi16 c1, 0x4bda
    ldi16 c2, 0x6fbb
    ldi16 c3, 0x939c
    ldsp16 c3, [sp+8]
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

    ; Entry 0x39: ldsp16 c3, [sp+9]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0708
    ldi8 c1, 0x54
    st8 [c0], c1
    ldi16 c0, 0x0709
    ldi16 c1, 0xe666
    st16 [c0], c1
    ldi16 c0, 0x070b
    ldi8 c1, 0x70
    st8 [c0], c1
    ldi16 c0, 0x282a
    ldi16 c1, 0x4c0f
    ldi16 c2, 0x6ff4
    ldi16 c3, 0x93d9
    ldsp16 c3, [sp+9]
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

    ; Entry 0x3A: ldsp16 c3, [sp+10]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x0709
    ldi8 c1, 0x58
    st8 [c0], c1
    ldi16 c0, 0x070a
    ldi16 c1, 0x2aaa
    st16 [c0], c1
    ldi16 c0, 0x070c
    ldi8 c1, 0x75
    st8 [c0], c1
    ldi16 c0, 0x285b
    ldi16 c1, 0x4c44
    ldi16 c2, 0x702d
    ldi16 c3, 0x9416
    ldsp16 c3, [sp+10]
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

    ; Entry 0x3B: ldsp16 c3, [sp+11]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070a
    ldi8 c1, 0x5c
    st8 [c0], c1
    ldi16 c0, 0x070b
    ldi16 c1, 0x4444
    st16 [c0], c1
    ldi16 c0, 0x070d
    ldi8 c1, 0x7a
    st8 [c0], c1
    ldi16 c0, 0x288c
    ldi16 c1, 0x4c79
    ldi16 c2, 0x7066
    ldi16 c3, 0x9453
    ldsp16 c3, [sp+11]
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

    ; Entry 0x3C: ldsp16 c3, [sp+12]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070b
    ldi8 c1, 0x60
    st8 [c0], c1
    ldi16 c0, 0x070c
    ldi16 c1, 0x6996
    st16 [c0], c1
    ldi16 c0, 0x070e
    ldi8 c1, 0x7f
    st8 [c0], c1
    ldi16 c0, 0x28bd
    ldi16 c1, 0x4cae
    ldi16 c2, 0x709f
    ldi16 c3, 0x9490
    ldsp16 c3, [sp+12]
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

    ; Entry 0x3D: ldsp16 c3, [sp+13]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070c
    ldi8 c1, 0x64
    st8 [c0], c1
    ldi16 c0, 0x070d
    ldi16 c1, 0xdddd
    st16 [c0], c1
    ldi16 c0, 0x070f
    ldi8 c1, 0x84
    st8 [c0], c1
    ldi16 c0, 0x28ee
    ldi16 c1, 0x4ce3
    ldi16 c2, 0x70d8
    ldi16 c3, 0x94cd
    ldsp16 c3, [sp+13]
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

    ; Entry 0x3E: ldsp16 c3, [sp+14]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070d
    ldi8 c1, 0x68
    st8 [c0], c1
    ldi16 c0, 0x070e
    ldi16 c1, 0xeeef
    st16 [c0], c1
    ldi16 c0, 0x0710
    ldi8 c1, 0x89
    st8 [c0], c1
    ldi16 c0, 0x291f
    ldi16 c1, 0x4d18
    ldi16 c2, 0x7111
    ldi16 c3, 0x950a
    ldsp16 c3, [sp+14]
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

    ; Entry 0x3F: ldsp16 c3, [sp+15]
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x070e
    ldi8 c1, 0x6c
    st8 [c0], c1
    ldi16 c0, 0x070f
    ldi16 c1, 0xff00
    st16 [c0], c1
    ldi16 c0, 0x0711
    ldi8 c1, 0x8e
    st8 [c0], c1
    ldi16 c0, 0x2950
    ldi16 c1, 0x4d4d
    ldi16 c2, 0x714a
    ldi16 c3, 0x9547
    ldsp16 c3, [sp+15]
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
