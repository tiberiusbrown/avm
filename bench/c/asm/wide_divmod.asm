
wide_divmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 wide_divmod.c
00000100 l     O .data	00000020 unsigned_numerators
00000120 l     O .data	00000020 unsigned_denominators
00000140 l     O .data	00000020 signed_numerators
00000160 l     O .data	00000020 signed_denominators
00000180 l     O .data	00000008 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
00000b20 l       .init_array	00000000 .hidden __init_array_end
00000b20 l       .init_array	00000000 .hidden __init_array_start
00000b20 l       .fini_array	00000000 .hidden __fini_array_start
00000b20 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000309 avm_test_main
000005d0 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000680 g     F .text	00000195 __avm_udivdi3
000005d2 g     F .text	000000ae __avm_muldi3
00000815 g     F .text	0000025f __avm_divdi3
00000a74 g     F .text	000000ac __avm_mulsi3

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
 e1 b2 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 20 0b              ldi16	r4, 0xb20
 c1 00                 ldi8	r5, 0x0
 c6 20 0b              ldi16	r6, 0xb20
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 20 0b           ldi16	r0, 0xb20
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 20 0b           ldi16	r2, 0xb20
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
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 20 0b              ldi16	r4, 0xb20
 c1 00                 ldi8	r5, 0x0
 c6 20 0b              ldi16	r6, 0xb20
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 20 0b           ldi16	r2, 0xb20
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 20 0b           ldi16	r0, 0xb20
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d6 d2                 adjsp	-0x2e
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 c4 0c 01              ldi16	r4, 0x10c
 f0 6b c8              st32	[r4], q3
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 c4 08 01              ldi16	r4, 0x108
 f0 6b 48              st32	[r4], q1
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 89 67              ldi16	r6, 0x6789
 c7 45 23              ldi16	r7, 0x2345
 c4 20 01              ldi16	r4, 0x120
 f0 6b c8              st32	[r4], q3
 c4 24 01              ldi16	r4, 0x124
 f0 6b 48              st32	[r4], q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 0c              st32	[r6], q0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c6 34 01              ldi16	r6, 0x134
 f0 6b 4c              st32	[r6], q1
 c6 30 01              ldi16	r6, 0x130
 f0 6b 4c              st32	[r6], q1
 c2 01                 ldi8	r6, 0x1
 c7 00 80              ldi16	r7, 0x8000
 c4 38 01              ldi16	r4, 0x138
 f0 6b c8              st32	[r4], q3
 c4 3c 01              ldi16	r4, 0x13c
 f0 6b 08              st32	[r4], q0
 c4 b7 8f              ldi16	r4, 0x8fb7
 c5 ff ff              ldi16	r5, 0xffff
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 87 20              ldi16	r4, 0x2087
 c5 f2 79              ldi16	r5, 0x79f2
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 48 70              ldi16	r4, 0x7048
 a5                    xor	r5, r5
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 79 df              ldi16	r4, 0xdf79
 c5 0d 86              ldi16	r5, 0x860d
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 54 01              ldi16	r4, 0x154
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 6b c8              st32	[r4], q3
 c4 50 01              ldi16	r4, 0x150
 f0 6b 08              st32	[r4], q0
 c4 e9 ff              ldi16	r4, 0xffe9
 c5 ff ff              ldi16	r5, 0xffff
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 d3 1a              ldi16	r4, 0x1ad3
 c5 1f 01              ldi16	r5, 0x11f
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 87 d6              ldi16	r4, 0xd687
 c1 12                 ldi8	r5, 0x12
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 64 01              ldi16	r4, 0x164
 f0 6b 08              st32	[r4], q0
 c4 79 29              ldi16	r4, 0x2979
 c5 ed ff              ldi16	r5, 0xffed
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 6c 01              ldi16	r4, 0x16c
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 6b c8              st32	[r4], q3
 c4 70 01              ldi16	r4, 0x170
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f0 6b 48              st32	[r4], q1
 c4 74 01              ldi16	r4, 0x174
 f0 6b 08              st32	[r4], q0
 c4 7c 01              ldi16	r4, 0x17c
 f0 6b c8              st32	[r4], q3
 c4 9b ff              ldi16	r4, 0xff9b
 c5 ff ff              ldi16	r5, 0xffff
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a c8              ld32	q3, [r4]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 24 01              ldi16	r5, 0x124
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 20 01              ldi16	r5, 0x120
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e1 2d 02              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 d6 f8                 adjsp	-0x8
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 e1 51 01              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 77                 sub32	q1, q3
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 44 01              ldi16	r5, 0x144
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 40 01              ldi16	r5, 0x140
 11                    add	r4, r5
 f0 6a c8              ld32	q3, [r4]
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 64 01              ldi16	r5, 0x164
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 60 01              ldi16	r5, 0x160
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 2b 03              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 d6 f8                 adjsp	-0x8
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f7 62                 add32	q0, q2
 f0 32 32              ldsp16	r2, [sp+0x32]
 f0 33 34              ldsp16	r3, [sp+0x34]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 7e                 sub32	q3, q2
 f7 6d                 add32	q3, q1
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 d5 76                 call8	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 73                 sub32	q0, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 c8              cmp32	q3, q2
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 73                 sub32	q0, q3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f7 64                 add32	q1, q0
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 7e                 sub32	q3, q2
 f7 6c                 add32	q3, q0
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f7 61                 add32	q0, q1
 c8 08                 addi.s8	r4, 0x8
 cc 20                 cmpi.s8	r4, 0x20
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 db 57 fe              brne16	-0x1a9 <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b c8              st32	[r4], q3
 c4 84 01              ldi16	r4, 0x184
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f0 30 35              ldsp16	r0, [sp+0x35]
 f0 31 37              ldsp16	r1, [sp+0x37]
 f0 32 39              ldsp16	r2, [sp+0x39]
 f0 33 3b              ldsp16	r3, [sp+0x3b]
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 a0                    xor	r4, r4
 f0 00 04              ldi8	r0, 0x4
 f0 12 0a              leasp	r2, 0xa
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 10                    add	r4, r4
 f0 15 16              leasp	r5, 0x16
 14                    add	r5, r4
 f0 11 22              leasp	r1, 0x22
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 38 20              stsp16	[sp+0x20], r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L1>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 6c 93              ld16	r4, [r1+]
 a5                    xor	r5, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 3d 04              call16	__avm_mulsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 ed d4 20              ld16	r6, [r2+0]
 af                    xor	r7, r7
 f1 22                 mov	r4, r2
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f7 6d                 add32	q3, q1
 f1 14                 mov	r2, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 f0 6d 95              st16	[r2+], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 c9                 brne8	-0x37 <L1>
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 0a 02              addi.s8	r2, 0x2
 f0 30 20              ldsp16	r0, [sp+0x20]
 f4 b0                 dec16	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 9e                 brne8	-0x62 <L0>
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d6 2a                 adjsp	0x2a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 35              ldsp16	r2, [sp+0x35]
 f0 33 37              ldsp16	r3, [sp+0x37]
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 69 48              cmp32	q1, q2
 d1 26                 brne8	0x26 <L1>
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 48              cmp32	q1, q2
 d1 1b                 brne8	0x1b <L1>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
<L0>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 d6 2a                 adjsp	0x2a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 00 40              ldi8	r0, 0x40
 f2 66                 mov32	q1, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 5e                 jmp8	0x5e <L4>
<L2>:
 f7 7e                 sub32	q3, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 76                 sub32	q1, q2
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
<L3>:
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 92                    or	r4, r6
 97                    or	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 80                 breq8	-0x80 <L0>
<L4>:
 f0 38 24              stsp16	[sp+0x24], r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f7 65                 add32	q1, q1
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 65                 add32	q1, q1
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c0              cmp32	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 6f                 add32	q3, q3
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6a                 add32	q2, q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 de 0e ff              brslt16	-0xf2 <L2>
 f0 69 c8              cmp32	q3, q2
 d8 0d                 bruge8	0xd <L5>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 e0 31 ff              jmp16	-207 <L3>
<L5>:
 f0 69 c8              cmp32	q3, q2
 db f6 fe              brne16	-0x10a <L2>
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 69 84              cmp32	q2, q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 dd e0 fe              bruge16	-0x120 <L2>
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 08 ff              jmp16	-248 <L3>

<__avm_divdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f2 63                 mov32	q0, q3
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 1c                 breq8	0x1c <L0>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 d9 0f                 brsge8	0xf <L1>
 f2 68                 mov32	q2, q0
 d4 4f                 jmp8	0x4f <L2>
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 06 02              jmp16	518 <L12>
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 80              cmp32	q2, q0
 f2 68                 mov32	q2, q0
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f7 78                 sub32	q2, q0
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 72                 sub32	q0, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
<L2>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 69 4c              cmp32	q1, q3
 d9 08                 brsge8	0x8 <L3>
 f2 63                 mov32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d4 29                 jmp8	0x29 <L4>
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f7 73                 sub32	q0, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f7 7b                 sub32	q2, q3
<L4>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 d1 1b                 brne8	0x1b <L6>
<L5>:
 f0 35 10              ldsp16	r5, [sp+0x10]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 38                    cmp	r6, r4
 db 28 01              brne16	0x128 <L11>
 f2 6b                 mov32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e0 4a 01              jmp16	330 <L12>
<L6>:
 c2 40                 ldi8	r6, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d4 58                 jmp8	0x58 <L9>
<L7>:
 f7 7b                 sub32	q2, q3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 04              cmp32	q0, q1
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 7b                 sub32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 92                    or	r4, r6
 97                    or	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f7 71                 sub32	q0, q1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
<L8>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 77 ff              breq16	-0x89 <L5>
<L9>:
 f4 72                 stsp16	[sp+0xc], r6
 f7 65                 add32	q1, q1
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6a                 add32	q2, q2
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 fa 9f                 lsr16i	r6, 0xf
 af                    xor	r7, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 f7 6a                 add32	q2, q2
 92                    or	r4, r6
 97                    or	r5, r7
 f7 60                 add32	q0, q0
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 af                    xor	r7, r7
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6f                 add32	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f7 65                 add32	q1, q1
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 de 26 ff              brslt16	-0xda <L7>
 f0 69 8c              cmp32	q2, q3
 d8 07                 bruge8	0x7 <L10>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 49 ff              jmp16	-183 <L8>
<L10>:
 f0 69 8c              cmp32	q2, q3
 db 14 ff              brne16	-0xec <L7>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 0c              cmp32	q0, q3
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 dd fe fe              bruge16	-0x102 <L7>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 e0 26 ff              jmp16	-218 <L8>
<L11>:
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 f2 6b                 mov32	q3, q1
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 30              ldsp16	r1, [sp+0x30]
 f7 7c                 sub32	q3, q0
 f7 76                 sub32	q1, q2
 f2 69                 mov32	q2, q1
<L12>:
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fe 26                 mul16	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 1a                 ldsp16	r6, [sp+0x6]
 fe 34                 mul16	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 3b                 mulsu8.w	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 2e                 muls8.w	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 1b                    add	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 18                    add	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 03                 ldsp16	r7, [sp+0x0]
 1e                    add	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 48                 lsl16i	r5, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 16                    add	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
