
byte_comparisons.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 byte_comparisons.c
00000100 l     O .data	00000002 byte_comparisons_result
00000102 l     O .data	00000020 signed_a
00000122 l     O .data	00000020 signed_b
00000142 l     O .data	00000020 unsigned_a
00000162 l     O .data	00000020 unsigned_b
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000609 l       .init_array	00000000 .hidden __init_array_end
00000609 l       .init_array	00000000 .hidden __init_array_start
00000609 l       .fini_array	00000000 .hidden __fini_array_start
00000609 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000033b avm_test_main
000005a4 g     F .text	00000065 __avm_terminate
000005a2 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 8e 03              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 7f 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 09 06              ldi16	r4, 0x609
 c1 00                 ldi8	r5, 0x0
 c6 09 06              ldi16	r6, 0x609
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 09 06           ldi16	r0, 0x609
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 09 06           ldi16	r2, 0x609
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 f0 4c 02 01           stm8	[0x102], r4
 c0 40                 ldi8	r4, 0x40
 f0 4c 22 01           stm8	[0x122], r4
 f2 42                 sub	r2, r2
 f0 4a 42 01           stm8	[0x142], r2
 f0 4a 62 01           stm8	[0x162], r2
 c1 91                 ldi8	r5, 0x91
 f0 4d 03 01           stm8	[0x103], r5
 c2 5d                 ldi8	r6, 0x5d
 f0 4e 23 01           stm8	[0x123], r6
 c0 11                 ldi8	r4, 0x11
 f0 4c 43 01           stm8	[0x143], r4
 c0 1d                 ldi8	r4, 0x1d
 f0 4c 63 01           stm8	[0x163], r4
 c0 a2                 ldi8	r4, 0xa2
 f0 4c 04 01           stm8	[0x104], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 24 01           stm8	[0x124], r4
 c3 22                 ldi8	r7, 0x22
 f0 4f 44 01           stm8	[0x144], r7
 c0 3a                 ldi8	r4, 0x3a
 f0 4c 64 01           stm8	[0x164], r4
 f0 00 b3              ldi8	r0, 0xb3
 f0 48 05 01           stm8	[0x105], r0
 c0 17                 ldi8	r4, 0x17
 f0 4c 25 01           stm8	[0x125], r4
 c0 33                 ldi8	r4, 0x33
 f0 4c 45 01           stm8	[0x145], r4
 c0 57                 ldi8	r4, 0x57
 f0 4c 65 01           stm8	[0x165], r4
 c0 c4                 ldi8	r4, 0xc4
 f0 4c 06 01           stm8	[0x106], r4
 c0 34                 ldi8	r4, 0x34
 f0 4c 26 01           stm8	[0x126], r4
 f0 01 44              ldi8	r1, 0x44
 f0 49 46 01           stm8	[0x146], r1
 c0 74                 ldi8	r4, 0x74
 f0 4c 66 01           stm8	[0x166], r4
 c0 d5                 ldi8	r4, 0xd5
 f0 4c 07 01           stm8	[0x107], r4
 c0 d1                 ldi8	r4, 0xd1
 f0 4c 27 01           stm8	[0x127], r4
 c0 55                 ldi8	r4, 0x55
 f0 4c 47 01           stm8	[0x147], r4
 f0 4d 67 01           stm8	[0x167], r5
 c0 e6                 ldi8	r4, 0xe6
 f0 4c 08 01           stm8	[0x108], r4
 c1 ee                 ldi8	r5, 0xee
 f0 4d 28 01           stm8	[0x128], r5
 c0 66                 ldi8	r4, 0x66
 f0 4c 48 01           stm8	[0x148], r4
 c0 ae                 ldi8	r4, 0xae
 f0 4c 68 01           stm8	[0x168], r4
 c0 f7                 ldi8	r4, 0xf7
 f0 4c 09 01           stm8	[0x109], r4
 c0 8b                 ldi8	r4, 0x8b
 f0 4c 29 01           stm8	[0x129], r4
 c0 77                 ldi8	r4, 0x77
 f0 4c 49 01           stm8	[0x149], r4
 c0 cb                 ldi8	r4, 0xcb
 f0 4c 69 01           stm8	[0x169], r4
 c0 08                 ldi8	r4, 0x8
 f0 4c 0a 01           stm8	[0x10a], r4
 c0 a8                 ldi8	r4, 0xa8
 f0 4c 2a 01           stm8	[0x12a], r4
 c0 88                 ldi8	r4, 0x88
 f0 4c 4a 01           stm8	[0x14a], r4
 c0 e8                 ldi8	r4, 0xe8
 f0 4c 6a 01           stm8	[0x16a], r4
 c0 19                 ldi8	r4, 0x19
 f0 4c 0b 01           stm8	[0x10b], r4
 c0 45                 ldi8	r4, 0x45
 f0 4c 2b 01           stm8	[0x12b], r4
 c0 99                 ldi8	r4, 0x99
 f0 4c 4b 01           stm8	[0x14b], r4
 c0 05                 ldi8	r4, 0x5
 f0 4c 6b 01           stm8	[0x16b], r4
 c0 2a                 ldi8	r4, 0x2a
 f0 4c 0c 01           stm8	[0x10c], r4
 c0 62                 ldi8	r4, 0x62
 f0 4c 2c 01           stm8	[0x12c], r4
 c0 aa                 ldi8	r4, 0xaa
 f0 4c 4c 01           stm8	[0x14c], r4
 f0 4f 6c 01           stm8	[0x16c], r7
 c0 3b                 ldi8	r4, 0x3b
 f0 4c 0d 01           stm8	[0x10d], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 2d 01           stm8	[0x12d], r4
 c3 bb                 ldi8	r7, 0xbb
 f0 4f 4d 01           stm8	[0x14d], r7
 c3 3f                 ldi8	r7, 0x3f
 f0 4f 6d 01           stm8	[0x16d], r7
 c3 4c                 ldi8	r7, 0x4c
 f0 4f 0e 01           stm8	[0x10e], r7
 c3 1c                 ldi8	r7, 0x1c
 f0 4f 2e 01           stm8	[0x12e], r7
 c3 cc                 ldi8	r7, 0xcc
 f0 4f 4e 01           stm8	[0x14e], r7
 f0 03 5c              ldi8	r3, 0x5c
 f0 4b 6e 01           stm8	[0x16e], r3
 f0 4e 0f 01           stm8	[0x10f], r6
 c2 39                 ldi8	r6, 0x39
 f0 4e 2f 01           stm8	[0x12f], r6
 c2 dd                 ldi8	r6, 0xdd
 f0 4e 4f 01           stm8	[0x14f], r6
 c2 79                 ldi8	r6, 0x79
 f0 4e 6f 01           stm8	[0x16f], r6
 c2 6e                 ldi8	r6, 0x6e
 f0 4e 10 01           stm8	[0x110], r6
 c2 d6                 ldi8	r6, 0xd6
 f0 4e 30 01           stm8	[0x130], r6
 f0 4d 50 01           stm8	[0x150], r5
 c1 96                 ldi8	r5, 0x96
 f0 4d 70 01           stm8	[0x170], r5
 f0 4c 11 01           stm8	[0x111], r4
 c0 f3                 ldi8	r4, 0xf3
 f0 4c 31 01           stm8	[0x131], r4
 c0 ff                 ldi8	r4, 0xff
 f0 4c 51 01           stm8	[0x151], r4
 f0 48 71 01           stm8	[0x171], r0
 c0 90                 ldi8	r4, 0x90
 f0 4c 12 01           stm8	[0x112], r4
 f0 4c 32 01           stm8	[0x132], r4
 c0 10                 ldi8	r4, 0x10
 f0 4c 52 01           stm8	[0x152], r4
 c0 d0                 ldi8	r4, 0xd0
 f0 4c 72 01           stm8	[0x172], r4
 c0 a1                 ldi8	r4, 0xa1
 f0 4c 13 01           stm8	[0x113], r4
 c0 ad                 ldi8	r4, 0xad
 f0 4c 33 01           stm8	[0x133], r4
 c0 21                 ldi8	r4, 0x21
 f0 4c 53 01           stm8	[0x153], r4
 c2 ed                 ldi8	r6, 0xed
 f0 4e 73 01           stm8	[0x173], r6
 c1 b2                 ldi8	r5, 0xb2
 f0 4d 14 01           stm8	[0x114], r5
 c3 4a                 ldi8	r7, 0x4a
 f0 4f 34 01           stm8	[0x134], r7
 c3 32                 ldi8	r7, 0x32
 f0 4f 54 01           stm8	[0x154], r7
 c3 0a                 ldi8	r7, 0xa
 f0 4f 74 01           stm8	[0x174], r7
 f0 00 c3              ldi8	r0, 0xc3
 f0 48 15 01           stm8	[0x115], r0
 c3 67                 ldi8	r7, 0x67
 f0 4f 35 01           stm8	[0x135], r7
 c3 43                 ldi8	r7, 0x43
 f0 4f 55 01           stm8	[0x155], r7
 c3 27                 ldi8	r7, 0x27
 f0 4f 75 01           stm8	[0x175], r7
 c3 d4                 ldi8	r7, 0xd4
 f0 4f 16 01           stm8	[0x116], r7
 c3 04                 ldi8	r7, 0x4
 f0 4f 36 01           stm8	[0x136], r7
 c3 54                 ldi8	r7, 0x54
 f0 4f 56 01           stm8	[0x156], r7
 f0 49 76 01           stm8	[0x176], r1
 c3 e5                 ldi8	r7, 0xe5
 f0 4f 17 01           stm8	[0x117], r7
 f0 4c 37 01           stm8	[0x137], r4
 c0 65                 ldi8	r4, 0x65
 f0 4c 57 01           stm8	[0x157], r4
 c0 61                 ldi8	r4, 0x61
 f0 4c 77 01           stm8	[0x177], r4
 c0 f6                 ldi8	r4, 0xf6
 f0 4c 18 01           stm8	[0x118], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 4c 38 01           stm8	[0x138], r4
 c0 76                 ldi8	r4, 0x76
 f0 4c 58 01           stm8	[0x158], r4
 f0 01 7e              ldi8	r1, 0x7e
 f0 49 78 01           stm8	[0x178], r1
 c0 07                 ldi8	r4, 0x7
 f0 4c 19 01           stm8	[0x119], r4
 c0 db                 ldi8	r4, 0xdb
 f0 4c 39 01           stm8	[0x139], r4
 c0 87                 ldi8	r4, 0x87
 f0 4c 59 01           stm8	[0x159], r4
 c0 9b                 ldi8	r4, 0x9b
 f0 4c 79 01           stm8	[0x179], r4
 c0 18                 ldi8	r4, 0x18
 f0 4c 1a 01           stm8	[0x11a], r4
 c0 f8                 ldi8	r4, 0xf8
 f0 4c 3a 01           stm8	[0x13a], r4
 c0 98                 ldi8	r4, 0x98
 f0 4c 5a 01           stm8	[0x15a], r4
 c0 b8                 ldi8	r4, 0xb8
 f0 4c 7a 01           stm8	[0x17a], r4
 c0 29                 ldi8	r4, 0x29
 f0 4c 1b 01           stm8	[0x11b], r4
 c0 95                 ldi8	r4, 0x95
 f0 4c 3b 01           stm8	[0x13b], r4
 c0 a9                 ldi8	r4, 0xa9
 f0 4c 5b 01           stm8	[0x15b], r4
 c0 d5                 ldi8	r4, 0xd5
 f0 4c 7b 01           stm8	[0x17b], r4
 c0 3a                 ldi8	r4, 0x3a
 f0 4c 1c 01           stm8	[0x11c], r4
 f0 4d 3c 01           stm8	[0x13c], r5
 c0 ba                 ldi8	r4, 0xba
 f0 4c 5c 01           stm8	[0x15c], r4
 c0 f2                 ldi8	r4, 0xf2
 f0 4c 7c 01           stm8	[0x17c], r4
 c0 4b                 ldi8	r4, 0x4b
 f0 4c 1d 01           stm8	[0x11d], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 4c 3d 01           stm8	[0x13d], r4
 c0 cb                 ldi8	r4, 0xcb
 f0 4c 5d 01           stm8	[0x15d], r4
 c0 0f                 ldi8	r4, 0xf
 f0 4c 7d 01           stm8	[0x17d], r4
 f0 4b 1e 01           stm8	[0x11e], r3
 c1 6c                 ldi8	r5, 0x6c
 f0 4d 3e 01           stm8	[0x13e], r5
 c1 dc                 ldi8	r5, 0xdc
 f0 4d 5e 01           stm8	[0x15e], r5
 c1 2c                 ldi8	r5, 0x2c
 f0 4d 7e 01           stm8	[0x17e], r5
 c1 6d                 ldi8	r5, 0x6d
 f0 4d 1f 01           stm8	[0x11f], r5
 c1 09                 ldi8	r5, 0x9
 f0 4d 3f 01           stm8	[0x13f], r5
 f0 4e 5f 01           stm8	[0x15f], r6
 c1 49                 ldi8	r5, 0x49
 f0 4d 7f 01           stm8	[0x17f], r5
 f0 49 20 01           stm8	[0x120], r1
 c1 26                 ldi8	r5, 0x26
 f0 4d 40 01           stm8	[0x140], r5
 c1 fe                 ldi8	r5, 0xfe
 f0 4d 60 01           stm8	[0x160], r5
 c1 66                 ldi8	r5, 0x66
 f0 4d 80 01           stm8	[0x180], r5
 c1 8f                 ldi8	r5, 0x8f
 f0 4d 21 01           stm8	[0x121], r5
 f0 48 41 01           stm8	[0x141], r0
 f0 4c 61 01           stm8	[0x161], r4
 c0 83                 ldi8	r4, 0x83
 f0 4c 81 01           stm8	[0x181], r4
 d7 01                 sys	debug_break
 f0 05 02 01           ldi16	r1, 0x102
 f1 2e                 mov	r7, r2
 f1 02                 mov	r0, r2
<L0>:
 a5                    xor	r5, r5
<L1>:
 01                    mov	r4, r5
 f2 21                 add	r4, r1
 f5 32                 ld8u	r2, [r4]
 ed c8 40              ld8u	r6, [r4+32]
 f6 46                 sext8	r6
 f1 1a                 mov	r3, r2
 f6 43                 sext8	r3
 f5 1e                 cmp	r3, r6
 f8 23                 cset.slt	r3
 f4 a2                 tst8	r2
 f8 2e                 cset.sge	r6
 1b                    add	r6, r7
 f2 2b                 add	r6, r3
 ed 68 60              ld8u	r3, [r4+64]
 ed 88 80              ld8u	r4, [r4+96]
 f5 23                 cmp	r4, r3
 f8 1f                 cset.uge	r7
 1e                    add	r7, r6
 f5 1c                 cmp	r3, r4
 f8 06                 cset.eq	r6
 1b                    add	r6, r7
 f5 14                 cmp	r2, r4
 f8 0f                 cset.ne	r7
 1e                    add	r7, r6
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 cc                 brne8	-0x34 <L1>
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 c4                 brne8	-0x3c <L0>
 f0 5f 00 01           stm16	[0x100], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 47 fa              call16	-1465 <__avm_run_local_dtors>
<L0>:
 c4 09 06              ldi16	r4, 0x609
 c1 00                 ldi8	r5, 0x0
 c6 09 06              ldi16	r6, 0x609
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 09 06           ldi16	r2, 0x609
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 09 06           ldi16	r0, 0x609
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 fe f9              call16	-1538 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
