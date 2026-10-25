
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
000009a6 l       .init_array	00000000 .hidden __init_array_end
000009a6 l       .init_array	00000000 .hidden __init_array_start
000009a6 l       .fini_array	00000000 .hidden __fini_array_start
000009a6 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000243 avm_test_main
0000050a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000050c g     F .text	00000190 __avm_udivmoddi4
0000069c g     F .text	0000030a __avm_divmoddi4

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
 e1 ec 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a6 09              ldi16	r4, 0x9a6
 c1 00                 ldi8	r5, 0x0
 c6 a6 09              ldi16	r6, 0x9a6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 a6 09           ldi16	r0, 0x9a6
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a6 09           ldi16	r2, 0x9a6
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
 c4 a6 09              ldi16	r4, 0x9a6
 c1 00                 ldi8	r5, 0x0
 c6 a6 09              ldi16	r6, 0x9a6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 a6 09           ldi16	r2, 0x9a6
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a6 09           ldi16	r0, 0x9a6
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
 d6 e2                 adjsp	-0x1e
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
 f0 6b 48              st32	[r4], q1
 c4 74 01              ldi16	r4, 0x174
 f0 6b 08              st32	[r4], q0
 c4 7c 01              ldi16	r4, 0x17c
 f0 6b c8              st32	[r4], q3
 c4 9b ff              ldi16	r4, 0xff9b
 c5 ff ff              ldi16	r5, 0xffff
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 f2 6a                 mov32	q3, q0
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
<L0>:
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 00              stsp16	[sp+0x0], r2
 d6 f6                 adjsp	-0xa
 f0 14 18              leasp	r4, 0x18
 f4 60                 stsp16	[sp+0x8], r4
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a c8              ld32	q3, [r4]
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 07 24 01           ldi16	r3, 0x124
 f2 13                 add	r2, r3
 f0 6a 44              ld32	q1, [r2]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 07 20 01           ldi16	r3, 0x120
 f2 13                 add	r2, r3
 f0 6a 44              ld32	q1, [r2]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e1 bc 00              call16	__avm_udivmoddi4
 d6 0a                 adjsp	0xa
 f2 66                 mov32	q1, q2
 d6 f6                 adjsp	-0xa
 f0 14 20              leasp	r4, 0x20
 f4 60                 stsp16	[sp+0x8], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 44 01              ldi16	r5, 0x144
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 40 01              ldi16	r5, 0x140
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 64 01              ldi16	r5, 0x164
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 60 01              ldi16	r5, 0x160
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 6b                 add32	q2, q3
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 61                 add32	q0, q1
 f0 69 04              cmp32	q0, q1
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 d7 01              call16	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f7 67                 add32	q1, q3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f7 62                 add32	q0, q2
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 0a 08              addi.s8	r2, 0x8
 f0 0e 20              cmpi.s8	r2, 0x20
 db 15 ff              brne16	-0xeb <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 c4 84 01              ldi16	r4, 0x184
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_udivmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 3f              ldsp16	r4, [sp+0x3f]
 f0 35 41              ldsp16	r5, [sp+0x41]
 f0 36 43              ldsp16	r6, [sp+0x43]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 3b              ldsp16	r2, [sp+0x3b]
 f0 33 3d              ldsp16	r3, [sp+0x3d]
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 69 40              cmp32	q1, q0
 d1 12                 brne8	0x12 <L0>
 f0 69 80              cmp32	q2, q0
 d1 0d                 brne8	0xd <L0>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 64                 mov32	q1, q0
 e0 33 01              jmp16	307 <L7>
<L0>:
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 45                 jmp8	0x45 <L4>
<L1>:
 f7 76                 sub32	q1, q2
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f7 7c                 sub32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 81                 or	r4, r0
 f1 04                 mov	r0, r4
 f0 38 04              stsp16	[sp+0x4], r0
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L3>:
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 06                 mov	r0, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 da b1 00              breq16	0xb1 <L6>
<L4>:
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 02                    mov	r4, r6
 f1 27                 mov	r5, r3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 60                 add32	q0, q0
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 de 37 ff              brslt16	-0xc9 <L1>
 f0 69 48              cmp32	q1, q2
 d8 09                 bruge8	0x9 <L5>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 e0 50 ff              jmp16	-176 <L2>
<L5>:
 f0 69 48              cmp32	q1, q2
 db 23 ff              brne16	-0xdd <L1>
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 dd 17 ff              bruge16	-0xe9 <L1>
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e0 35 ff              jmp16	-203 <L3>
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L7>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_divmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 32 47              ldsp16	r2, [sp+0x47]
 f0 33 49              ldsp16	r3, [sp+0x49]
 f0 30 43              ldsp16	r0, [sp+0x43]
 f0 31 45              ldsp16	r1, [sp+0x45]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 34 4b              ldsp16	r4, [sp+0x4b]
 f0 3c 22              stsp16	[sp+0x22], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 0f                 breq8	0xf <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d9 1d                 brsge8	0x1d <L1>
 f2 63                 mov32	q0, q3
 d4 57                 jmp8	0x57 <L2>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 63                 mov32	q0, q3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 e0 91 02              jmp16	657 <L14>
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f1 1a                 mov	r3, r2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f7 73                 sub32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L2>:
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 69 8c              cmp32	q2, q3
 d9 08                 brsge8	0x8 <L3>
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d4 2d                 jmp8	0x2d <L4>
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7d                 sub32	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L4>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 4f                 brne8	0x4f <L6>
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
<L5>:
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 38                    cmp	r6, r4
 db 4d 01              brne16	0x14d <L11>
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 e0 6f 01              jmp16	367 <L12>
<L6>:
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 4e                 jmp8	0x4e <L9>
<L7>:
 f7 79                 sub32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f1 04                 mov	r0, r4
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
<L8>:
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 6c ff              breq16	-0x94 <L5>
<L9>:
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6f                 add32	q3, q3
 f1 0f                 mov	r1, r7
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 92                    or	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 de 2d ff              brslt16	-0xd3 <L7>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d8 14                 bruge8	0x14 <L10>
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e0 47 ff              jmp16	-185 <L8>
<L10>:
 f0 69 84              cmp32	q2, q1
 db 0a ff              brne16	-0xf6 <L7>
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 dd f2 fe              bruge16	-0x10e <L7>
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e0 10 ff              jmp16	-240 <L8>
<L11>:
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 69 c4              cmp32	q3, q1
 f2 69                 mov32	q2, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f7 77                 sub32	q1, q3
<L12>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 0e                 brne8	0xe <L13>
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d4 26                 jmp8	0x26 <L14>
<L13>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 7b                 sub32	q2, q3
<L14>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f2 69                 mov32	q2, q1
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
