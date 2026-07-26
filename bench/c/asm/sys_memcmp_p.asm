
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_memcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_memcmp_p.c
00000100 l     O .data	00000040 lhs
00000354 l     O .rodata	00000040 equal
00000140 l     O .data	00000002 n0
00000142 l     O .data	00000002 n1
00000144 l     O .data	00000002 n64
00000394 l     O .rodata	00000040 first_diff
000003d4 l     O .rodata	00000040 last_diff
00000146 l     O .data	00000002 n16
00000148 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000013c avm_test_main
00000352 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 3c 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c4 13 20              ldi16	r4, 0x2013
 c5 2d 3a              ldi16	r5, 0x3a2d
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 df ec              ldi16	r4, 0xecdf
 c5 f9 06              ldi16	r5, 0x6f9
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 ab b8              ldi16	r4, 0xb8ab
 c5 c5 d2              ldi16	r5, 0xd2c5
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 77 84              ldi16	r4, 0x8477
 c5 91 9e              ldi16	r5, 0x9e91
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 43 50              ldi16	r4, 0x5043
 c5 5d 6a              ldi16	r5, 0x6a5d
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 0f 1c              ldi16	r4, 0x1c0f
 c5 29 36              ldi16	r5, 0x3629
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 db e8              ldi16	r4, 0xe8db
 c5 f5 02              ldi16	r5, 0x2f5
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 a7 b4              ldi16	r4, 0xb4a7
 c5 c1 ce              ldi16	r5, 0xcec1
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 73 80              ldi16	r4, 0x8073
 c5 8d 9a              ldi16	r5, 0x9a8d
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 3f 4c              ldi16	r4, 0x4c3f
 c5 59 66              ldi16	r5, 0x6659
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 0b 18              ldi16	r4, 0x180b
 c5 25 32              ldi16	r5, 0x3225
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 d7 e4              ldi16	r4, 0xe4d7
 c5 f1 fe              ldi16	r5, 0xfef1
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 a3 b0              ldi16	r4, 0xb0a3
 c5 bd ca              ldi16	r5, 0xcabd
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 6f 7c              ldi16	r4, 0x7c6f
 c5 89 96              ldi16	r5, 0x9689
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 3b 48              ldi16	r4, 0x483b
 c5 55 62              ldi16	r5, 0x6255
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 07 14              ldi16	r4, 0x1407
 c5 21 2e              ldi16	r5, 0x2e21
 f0 07 00 01           ldi16	r3, 0x100
 f0 6b 86              st32	[r3], q2
 d7 01                 sys	debug_break
 c6 54 03              ldi16	r6, 0x354
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 55 40 01           ldm16	r5, [0x140]
 f1 23                 mov	r4, r3
 d7 13                 sys	memcmp_p
 f4 48                 stsp16	[sp+0x2], r4
 f0 55 42 01           ldm16	r5, [0x142]
 f1 23                 mov	r4, r3
 d7 13                 sys	memcmp_p
 f1 0c                 mov	r1, r4
 f0 55 44 01           ldm16	r5, [0x144]
 f4 51                 stsp16	[sp+0x4], r5
 f1 23                 mov	r4, r3
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 13                 sys	memcmp_p
 f4 40                 stsp16	[sp+0x0], r4
 c6 94 03              ldi16	r6, 0x394
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 54 44 01           ldm16	r4, [0x144]
 f1 23                 mov	r4, r3
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 13                 sys	memcmp_p
 f1 14                 mov	r2, r4
 c6 d4 03              ldi16	r6, 0x3d4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 54 44 01           ldm16	r4, [0x144]
 f1 23                 mov	r4, r3
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 13                 sys	memcmp_p
 f1 04                 mov	r0, r4
 f0 55 46 01           ldm16	r5, [0x146]
 f1 23                 mov	r4, r3
 d7 13                 sys	memcmp_p
 f4 0a                 ldsp16	r6, [sp+0x2]
 f2 0e                 add	r1, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 0d                 add	r1, r5
 f2 0a                 add	r1, r2
 f2 08                 add	r1, r0
 f2 0c                 add	r1, r4
 f0 59 48 01           stm16	[0x148], r1
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
