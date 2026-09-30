
struct_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 struct_copy.c
00000100 l     O .data	000000c0 input_particles
000001c0 l     O .data	00000004 struct_result
00000000 l    df *ABS*	00000000 runtime.c
00000567 l       .init_array	00000000 .hidden __init_array_end
00000567 l       .init_array	00000000 .hidden __init_array_start
00000567 l       .fini_array	00000000 .hidden __fini_array_start
00000567 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000028e avm_test_main
00000565 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 47 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 67 05              ldi16	r4, 0x567
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 67 05              ldi16	r6, 0x567
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 67 05           ldi16	r0, 0x567
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 67 05           ldi16	r2, 0x567
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 67 05              ldi16	r4, 0x567
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 67 05              ldi16	r6, 0x567
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 67 05           ldi16	r2, 0x567
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 67 05           ldi16	r0, 0x567
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
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
 d6 fa                 adjsp	-0x6
 c4 94 06              ldi16	r4, 0x694
 c5 4d 0b              ldi16	r5, 0xb4d
 c6 bc 01              ldi16	r6, 0x1bc
 f0 6b 8c              st32	[r6], q2
 c4 45 2e              ldi16	r4, 0x2e45
 c1 18                 ldi8	r5, 0x18
 c6 b8 01              ldi16	r6, 0x1b8
 f0 6b 8c              st32	[r6], q2
 c4 4b 06              ldi16	r4, 0x64b
 c5 4c 0a              ldi16	r5, 0xa4c
 c6 b4 01              ldi16	r6, 0x1b4
 f0 6b 8c              st32	[r6], q2
 c4 42 2c              ldi16	r4, 0x2c42
 c1 17                 ldi8	r5, 0x17
 c6 b0 01              ldi16	r6, 0x1b0
 f0 6b 8c              st32	[r6], q2
 c4 02 06              ldi16	r4, 0x602
 c5 4f 09              ldi16	r5, 0x94f
 c6 ac 01              ldi16	r6, 0x1ac
 f0 6b 8c              st32	[r6], q2
 c4 3f 2a              ldi16	r4, 0x2a3f
 c1 16                 ldi8	r5, 0x16
 c6 a8 01              ldi16	r6, 0x1a8
 f0 6b 8c              st32	[r6], q2
 c4 b9 05              ldi16	r4, 0x5b9
 c5 4e 08              ldi16	r5, 0x84e
 c6 a4 01              ldi16	r6, 0x1a4
 f0 6b 8c              st32	[r6], q2
 c4 3c 28              ldi16	r4, 0x283c
 c1 15                 ldi8	r5, 0x15
 c6 a0 01              ldi16	r6, 0x1a0
 f0 6b 8c              st32	[r6], q2
 c4 70 05              ldi16	r4, 0x570
 c5 49 07              ldi16	r5, 0x749
 c6 9c 01              ldi16	r6, 0x19c
 f0 6b 8c              st32	[r6], q2
 c4 39 26              ldi16	r4, 0x2639
 c1 14                 ldi8	r5, 0x14
 c6 98 01              ldi16	r6, 0x198
 f0 6b 8c              st32	[r6], q2
 c4 27 05              ldi16	r4, 0x527
 c5 48 06              ldi16	r5, 0x648
 c6 94 01              ldi16	r6, 0x194
 f0 6b 8c              st32	[r6], q2
 c4 36 24              ldi16	r4, 0x2436
 c1 13                 ldi8	r5, 0x13
 c6 90 01              ldi16	r6, 0x190
 f0 6b 8c              st32	[r6], q2
 c4 de 04              ldi16	r4, 0x4de
 c5 4b 05              ldi16	r5, 0x54b
 c6 8c 01              ldi16	r6, 0x18c
 f0 6b 8c              st32	[r6], q2
 c4 33 22              ldi16	r4, 0x2233
 c1 12                 ldi8	r5, 0x12
 c6 88 01              ldi16	r6, 0x188
 f0 6b 8c              st32	[r6], q2
 c4 95 04              ldi16	r4, 0x495
 c5 4a 04              ldi16	r5, 0x44a
 c6 84 01              ldi16	r6, 0x184
 f0 6b 8c              st32	[r6], q2
 c4 30 20              ldi16	r4, 0x2030
 c1 11                 ldi8	r5, 0x11
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 c4 4c 04              ldi16	r4, 0x44c
 c5 55 03              ldi16	r5, 0x355
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 2d 1e              ldi16	r4, 0x1e2d
 c1 10                 ldi8	r5, 0x10
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 03 04              ldi16	r4, 0x403
 c5 54 02              ldi16	r5, 0x254
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 2a 1c              ldi16	r4, 0x1c2a
 c1 0f                 ldi8	r5, 0xf
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 ba 03              ldi16	r4, 0x3ba
 c5 57 01              ldi16	r5, 0x157
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 27 1a              ldi16	r4, 0x1a27
 c1 0e                 ldi8	r5, 0xe
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 71 03              ldi16	r4, 0x371
 c1 56                 ldi8	r5, 0x56
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 24 18              ldi16	r4, 0x1824
 c1 0d                 ldi8	r5, 0xd
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 28 03              ldi16	r4, 0x328
 c5 51 ff              ldi16	r5, 0xff51
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 21 16              ldi16	r4, 0x1621
 c1 0c                 ldi8	r5, 0xc
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 df 02              ldi16	r4, 0x2df
 c5 50 fe              ldi16	r5, 0xfe50
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 1e 14              ldi16	r4, 0x141e
 c1 0b                 ldi8	r5, 0xb
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 96 02              ldi16	r4, 0x296
 c5 53 fd              ldi16	r5, 0xfd53
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 1b 12              ldi16	r4, 0x121b
 c1 0a                 ldi8	r5, 0xa
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 4d 02              ldi16	r4, 0x24d
 c5 52 fc              ldi16	r5, 0xfc52
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 18 10              ldi16	r4, 0x1018
 c1 09                 ldi8	r5, 0x9
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 04 02              ldi16	r4, 0x204
 c5 5d fb              ldi16	r5, 0xfb5d
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 15 0e              ldi16	r4, 0xe15
 c1 08                 ldi8	r5, 0x8
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 bb 01              ldi16	r4, 0x1bb
 c5 5c fa              ldi16	r5, 0xfa5c
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 12 0c              ldi16	r4, 0xc12
 c1 07                 ldi8	r5, 0x7
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 72 01              ldi16	r4, 0x172
 c5 5f f9              ldi16	r5, 0xf95f
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 0f 0a              ldi16	r4, 0xa0f
 c1 06                 ldi8	r5, 0x6
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 29 01              ldi16	r4, 0x129
 c5 5e f8              ldi16	r5, 0xf85e
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 0c 08              ldi16	r4, 0x80c
 c1 05                 ldi8	r5, 0x5
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c0 e0                 ldi8	r4, 0xe0
 c5 59 f7              ldi16	r5, 0xf759
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 09 06              ldi16	r4, 0x609
 c1 04                 ldi8	r5, 0x4
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c0 97                 ldi8	r4, 0x97
 c5 58 f6              ldi16	r5, 0xf658
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 06 04              ldi16	r4, 0x406
 c1 03                 ldi8	r5, 0x3
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 4e                 ldi8	r4, 0x4e
 c5 5b f5              ldi16	r5, 0xf55b
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 03 02              ldi16	r4, 0x203
 c1 02                 ldi8	r5, 0x2
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 05                 ldi8	r4, 0x5
 c5 5a f4              ldi16	r5, 0xf45a
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c0 18                 ldi8	r4, 0x18
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 07 01              ldi16	r5, 0x107
 f4 50                 stsp16	[sp+0x4], r4
 41                    ld8u	r4, [r5]
 f6 44                 sext8	r4
 ed da 1d              ld16	r6, [r5-3]
 12                    add	r4, r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 09                    mov	r6, r5
 ca f9                 addi.s8	r6, -0x7
 f0 6a cc              ld32	q3, [r6]
 f7 6d                 add32	q3, q1
 f7 63                 add32	q0, q3
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 ed 8a 1f              ld8u	r4, [r5-1]
 a2                    xor	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f7 61                 add32	q0, q1
 c9 08                 addi.s8	r5, 0x8
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 c6                 brne8	avm_test_main+569
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 b4                 brne8	avm_test_main+562
 c4 c0 01              ldi16	r4, 0x1c0
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
