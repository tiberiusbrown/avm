
byte_comparisons.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 byte_comparisons.c
00000100 l     O .data	00000020 signed_a
00000120 l     O .data	00000020 signed_b
00000140 l     O .data	00000020 unsigned_a
00000160 l     O .data	00000020 unsigned_b
00000180 l     O .data	00000002 byte_comparisons_result
00000000 l    df *ABS*	00000000 runtime.c
0000061f l       .init_array	00000000 .hidden __init_array_end
0000061f l       .init_array	00000000 .hidden __init_array_start
0000061f l       .fini_array	00000000 .hidden __fini_array_start
0000061f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000356 avm_test_main
0000061d g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ff 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1f 06              ldi16	r4, 0x61f
 c1 00                 ldi8	r5, 0x0
 c6 1f 06              ldi16	r6, 0x61f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 1f 06           ldi16	r0, 0x61f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1f 06           ldi16	r2, 0x61f
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 1f 06              ldi16	r4, 0x61f
 c1 00                 ldi8	r5, 0x0
 c6 1f 06              ldi16	r6, 0x61f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 1f 06           ldi16	r2, 0x61f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1f 06           ldi16	r0, 0x61f
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 d6 fe                 adjsp	-0x2
 c0 80                 ldi8	r4, 0x80
 f0 4c 00 01           stm8	[0x100], r4
 c0 40                 ldi8	r4, 0x40
 f0 4c 20 01           stm8	[0x120], r4
 f2 42                 sub	r2, r2
 f0 4a 40 01           stm8	[0x140], r2
 f0 4a 60 01           stm8	[0x160], r2
 c0 91                 ldi8	r4, 0x91
 f0 4c 01 01           stm8	[0x101], r4
 c1 5d                 ldi8	r5, 0x5d
 f0 4d 21 01           stm8	[0x121], r5
 c2 11                 ldi8	r6, 0x11
 f0 4e 41 01           stm8	[0x141], r6
 c2 1d                 ldi8	r6, 0x1d
 f0 4e 61 01           stm8	[0x161], r6
 c2 a2                 ldi8	r6, 0xa2
 f0 4e 02 01           stm8	[0x102], r6
 c2 7a                 ldi8	r6, 0x7a
 f0 4e 22 01           stm8	[0x122], r6
 c3 22                 ldi8	r7, 0x22
 f0 4f 42 01           stm8	[0x142], r7
 c2 3a                 ldi8	r6, 0x3a
 f0 4e 62 01           stm8	[0x162], r6
 f0 00 b3              ldi8	r0, 0xb3
 f0 48 03 01           stm8	[0x103], r0
 c2 17                 ldi8	r6, 0x17
 f0 4e 23 01           stm8	[0x123], r6
 c2 33                 ldi8	r6, 0x33
 f0 4e 43 01           stm8	[0x143], r6
 c2 57                 ldi8	r6, 0x57
 f0 4e 63 01           stm8	[0x163], r6
 c2 c4                 ldi8	r6, 0xc4
 f0 4e 04 01           stm8	[0x104], r6
 c2 34                 ldi8	r6, 0x34
 f0 4e 24 01           stm8	[0x124], r6
 c2 44                 ldi8	r6, 0x44
 f0 4e 44 01           stm8	[0x144], r6
 c2 74                 ldi8	r6, 0x74
 f0 4e 64 01           stm8	[0x164], r6
 c2 d5                 ldi8	r6, 0xd5
 f0 4e 05 01           stm8	[0x105], r6
 c2 d1                 ldi8	r6, 0xd1
 f0 4e 25 01           stm8	[0x125], r6
 c2 55                 ldi8	r6, 0x55
 f0 4e 45 01           stm8	[0x145], r6
 f0 4c 65 01           stm8	[0x165], r4
 c0 e6                 ldi8	r4, 0xe6
 f0 4c 06 01           stm8	[0x106], r4
 c0 ee                 ldi8	r4, 0xee
 f0 4c 26 01           stm8	[0x126], r4
 c2 66                 ldi8	r6, 0x66
 f0 4e 46 01           stm8	[0x146], r6
 c2 ae                 ldi8	r6, 0xae
 f0 4e 66 01           stm8	[0x166], r6
 c2 f7                 ldi8	r6, 0xf7
 f0 4e 07 01           stm8	[0x107], r6
 c2 8b                 ldi8	r6, 0x8b
 f0 4e 27 01           stm8	[0x127], r6
 c2 77                 ldi8	r6, 0x77
 f0 4e 47 01           stm8	[0x147], r6
 c2 cb                 ldi8	r6, 0xcb
 f0 4e 67 01           stm8	[0x167], r6
 c2 08                 ldi8	r6, 0x8
 f0 4e 08 01           stm8	[0x108], r6
 c2 a8                 ldi8	r6, 0xa8
 f0 4e 28 01           stm8	[0x128], r6
 c2 88                 ldi8	r6, 0x88
 f0 4e 48 01           stm8	[0x148], r6
 c2 e8                 ldi8	r6, 0xe8
 f0 4e 68 01           stm8	[0x168], r6
 c2 19                 ldi8	r6, 0x19
 f0 4e 09 01           stm8	[0x109], r6
 c2 45                 ldi8	r6, 0x45
 f0 4e 29 01           stm8	[0x129], r6
 c2 99                 ldi8	r6, 0x99
 f0 4e 49 01           stm8	[0x149], r6
 c2 05                 ldi8	r6, 0x5
 f0 4e 69 01           stm8	[0x169], r6
 c2 2a                 ldi8	r6, 0x2a
 f0 4e 0a 01           stm8	[0x10a], r6
 c2 62                 ldi8	r6, 0x62
 f0 4e 2a 01           stm8	[0x12a], r6
 c2 aa                 ldi8	r6, 0xaa
 f0 4e 4a 01           stm8	[0x14a], r6
 f0 4f 6a 01           stm8	[0x16a], r7
 c2 3b                 ldi8	r6, 0x3b
 f0 4e 0b 01           stm8	[0x10b], r6
 c3 7f                 ldi8	r7, 0x7f
 f0 4f 2b 01           stm8	[0x12b], r7
 c2 bb                 ldi8	r6, 0xbb
 f0 4e 4b 01           stm8	[0x14b], r6
 c2 3f                 ldi8	r6, 0x3f
 f0 4e 6b 01           stm8	[0x16b], r6
 c2 4c                 ldi8	r6, 0x4c
 f0 4e 0c 01           stm8	[0x10c], r6
 c2 1c                 ldi8	r6, 0x1c
 f0 4e 2c 01           stm8	[0x12c], r6
 c2 cc                 ldi8	r6, 0xcc
 f0 4e 4c 01           stm8	[0x14c], r6
 f0 03 5c              ldi8	r3, 0x5c
 f0 4b 6c 01           stm8	[0x16c], r3
 f0 4d 0d 01           stm8	[0x10d], r5
 c1 39                 ldi8	r5, 0x39
 f0 4d 2d 01           stm8	[0x12d], r5
 c1 dd                 ldi8	r5, 0xdd
 f0 4d 4d 01           stm8	[0x14d], r5
 c1 79                 ldi8	r5, 0x79
 f0 4d 6d 01           stm8	[0x16d], r5
 c1 6e                 ldi8	r5, 0x6e
 f0 4d 0e 01           stm8	[0x10e], r5
 c1 d6                 ldi8	r5, 0xd6
 f0 4d 2e 01           stm8	[0x12e], r5
 f0 4c 4e 01           stm8	[0x14e], r4
 c0 96                 ldi8	r4, 0x96
 f0 4c 6e 01           stm8	[0x16e], r4
 f0 4f 0f 01           stm8	[0x10f], r7
 c0 f3                 ldi8	r4, 0xf3
 f0 4c 2f 01           stm8	[0x12f], r4
 c0 ff                 ldi8	r4, 0xff
 f0 4c 4f 01           stm8	[0x14f], r4
 f0 48 6f 01           stm8	[0x16f], r0
 c0 90                 ldi8	r4, 0x90
 f0 4c 10 01           stm8	[0x110], r4
 f0 4c 30 01           stm8	[0x130], r4
 c0 10                 ldi8	r4, 0x10
 f0 4c 50 01           stm8	[0x150], r4
 c0 d0                 ldi8	r4, 0xd0
 f0 4c 70 01           stm8	[0x170], r4
 c0 a1                 ldi8	r4, 0xa1
 f0 4c 11 01           stm8	[0x111], r4
 c0 ad                 ldi8	r4, 0xad
 f0 4c 31 01           stm8	[0x131], r4
 c3 21                 ldi8	r7, 0x21
 f0 4f 51 01           stm8	[0x151], r7
 c2 ed                 ldi8	r6, 0xed
 f0 4e 71 01           stm8	[0x171], r6
 c0 b2                 ldi8	r4, 0xb2
 f0 4c 12 01           stm8	[0x112], r4
 c1 4a                 ldi8	r5, 0x4a
 f0 4d 32 01           stm8	[0x132], r5
 c1 32                 ldi8	r5, 0x32
 f0 4d 52 01           stm8	[0x152], r5
 c1 0a                 ldi8	r5, 0xa
 f0 4d 72 01           stm8	[0x172], r5
 f0 01 c3              ldi8	r1, 0xc3
 f0 49 13 01           stm8	[0x113], r1
 c1 67                 ldi8	r5, 0x67
 f0 4d 33 01           stm8	[0x133], r5
 c1 43                 ldi8	r5, 0x43
 f0 4d 53 01           stm8	[0x153], r5
 c1 27                 ldi8	r5, 0x27
 f0 4d 73 01           stm8	[0x173], r5
 c1 d4                 ldi8	r5, 0xd4
 f0 4d 14 01           stm8	[0x114], r5
 c1 04                 ldi8	r5, 0x4
 f0 4d 34 01           stm8	[0x134], r5
 c1 54                 ldi8	r5, 0x54
 f0 4d 54 01           stm8	[0x154], r5
 c1 44                 ldi8	r5, 0x44
 f0 4d 74 01           stm8	[0x174], r5
 c1 e5                 ldi8	r5, 0xe5
 f0 4d 15 01           stm8	[0x115], r5
 f0 4f 35 01           stm8	[0x135], r7
 c1 65                 ldi8	r5, 0x65
 f0 4d 55 01           stm8	[0x155], r5
 c1 61                 ldi8	r5, 0x61
 f0 4d 75 01           stm8	[0x175], r5
 c1 f6                 ldi8	r5, 0xf6
 f0 4d 16 01           stm8	[0x116], r5
 c1 3e                 ldi8	r5, 0x3e
 f0 4d 36 01           stm8	[0x136], r5
 c1 76                 ldi8	r5, 0x76
 f0 4d 56 01           stm8	[0x156], r5
 f0 00 7e              ldi8	r0, 0x7e
 f0 48 76 01           stm8	[0x176], r0
 c1 07                 ldi8	r5, 0x7
 f0 4d 17 01           stm8	[0x117], r5
 c1 db                 ldi8	r5, 0xdb
 f0 4d 37 01           stm8	[0x137], r5
 c1 87                 ldi8	r5, 0x87
 f0 4d 57 01           stm8	[0x157], r5
 c1 9b                 ldi8	r5, 0x9b
 f0 4d 77 01           stm8	[0x177], r5
 c1 18                 ldi8	r5, 0x18
 f0 4d 18 01           stm8	[0x118], r5
 c1 f8                 ldi8	r5, 0xf8
 f0 4d 38 01           stm8	[0x138], r5
 c1 98                 ldi8	r5, 0x98
 f0 4d 58 01           stm8	[0x158], r5
 c1 b8                 ldi8	r5, 0xb8
 f0 4d 78 01           stm8	[0x178], r5
 c1 29                 ldi8	r5, 0x29
 f0 4d 19 01           stm8	[0x119], r5
 c1 95                 ldi8	r5, 0x95
 f0 4d 39 01           stm8	[0x139], r5
 c1 a9                 ldi8	r5, 0xa9
 f0 4d 59 01           stm8	[0x159], r5
 c1 d5                 ldi8	r5, 0xd5
 f0 4d 79 01           stm8	[0x179], r5
 c1 3a                 ldi8	r5, 0x3a
 f0 4d 1a 01           stm8	[0x11a], r5
 f0 4c 3a 01           stm8	[0x13a], r4
 c0 ba                 ldi8	r4, 0xba
 f0 4c 5a 01           stm8	[0x15a], r4
 c0 f2                 ldi8	r4, 0xf2
 f0 4c 7a 01           stm8	[0x17a], r4
 c0 4b                 ldi8	r4, 0x4b
 f0 4c 1b 01           stm8	[0x11b], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 4c 3b 01           stm8	[0x13b], r4
 c0 cb                 ldi8	r4, 0xcb
 f0 4c 5b 01           stm8	[0x15b], r4
 c0 0f                 ldi8	r4, 0xf
 f0 4c 7b 01           stm8	[0x17b], r4
 f0 4b 1c 01           stm8	[0x11c], r3
 c1 6c                 ldi8	r5, 0x6c
 f0 4d 3c 01           stm8	[0x13c], r5
 c1 dc                 ldi8	r5, 0xdc
 f0 4d 5c 01           stm8	[0x15c], r5
 c1 2c                 ldi8	r5, 0x2c
 f0 4d 7c 01           stm8	[0x17c], r5
 c1 6d                 ldi8	r5, 0x6d
 f0 4d 1d 01           stm8	[0x11d], r5
 c1 09                 ldi8	r5, 0x9
 f0 4d 3d 01           stm8	[0x13d], r5
 f0 4e 5d 01           stm8	[0x15d], r6
 c1 49                 ldi8	r5, 0x49
 f0 4d 7d 01           stm8	[0x17d], r5
 f0 48 1e 01           stm8	[0x11e], r0
 c1 26                 ldi8	r5, 0x26
 f0 4d 3e 01           stm8	[0x13e], r5
 c1 fe                 ldi8	r5, 0xfe
 f0 4d 5e 01           stm8	[0x15e], r5
 c1 66                 ldi8	r5, 0x66
 f0 4d 7e 01           stm8	[0x17e], r5
 c1 8f                 ldi8	r5, 0x8f
 f0 4d 1f 01           stm8	[0x11f], r5
 f0 49 3f 01           stm8	[0x13f], r1
 f0 4c 5f 01           stm8	[0x15f], r4
 c0 83                 ldi8	r4, 0x83
 f0 4c 7f 01           stm8	[0x17f], r4
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
 c7 20 01              ldi16	r7, 0x120
 f1 2a                 mov	r6, r2
 f0 3a 00              stsp16	[sp+0x0], r2
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 f2 27                 add	r5, r3
 f5 36                 ld8u	r2, [r5]
 f1 24                 mov	r5, r0
 17                    add	r5, r7
 45                    ld8u	r5, [r5]
 f6 45                 sext8	r5
 f1 0a                 mov	r1, r2
 f6 41                 sext8	r1
 f5 0d                 cmp	r1, r5
 f8 25                 cset.slt	r5
 f4 a2                 tst8	r2
 f8 2f                 cset.sge	r7
 1e                    add	r7, r6
 1d                    add	r7, r5
 f1 24                 mov	r5, r0
 c6 40 01              ldi16	r6, 0x140
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 f1 28                 mov	r6, r0
 c4 60 01              ldi16	r4, 0x160
 18                    add	r6, r4
 4a                    ld8u	r6, [r6]
 39                    cmp	r6, r5
 f8 1c                 cset.uge	r4
 13                    add	r4, r7
 c7 20 01              ldi16	r7, 0x120
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 14                    add	r5, r4
 f5 16                 cmp	r2, r6
 f8 0e                 cset.ne	r6
 19                    add	r6, r5
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 c1                 brne8	avm_test_main+764
 f0 32 00              ldsp16	r2, [sp+0x0]
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 af                 brne8	avm_test_main+759
 f0 5e 80 01           stm16	[0x180], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
