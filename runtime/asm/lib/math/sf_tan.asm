
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	00000357 tanf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.tanf:

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x3b
<L0>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 31              ldi16	r7, 0x317f
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xb1
<L1>:
 ff c2 62              ftos16	r6, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xb1
<L2>:
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x18f
<L3>:
 f0 16 16              leasp	r6, 0x16
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 10                    add	r4, r4
 c1 02                 ldi8	r5, 0x2
 81                    and	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 31           ldi16	r3, 0x317f
 f0 69 4c              cmp32	q1, q3
 f2 66                 mov32	q1, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x197
<L4>:
 ff c2 51              ftos16	r5, q1
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x197
<L5>:
 c0 02                 ldi8	r4, 0x2
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 06                    mov	r5, r6
 94                    or	r5, r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1ed
<L6>:
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 c6 3f a1              ldi16	r6, 0xa13f
 c7 2c 3f              ldi16	r7, 0x3f2c
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 62                 stsp16	[sp+0x8], r6
 c6 40 a1              ldi16	r6, 0xa140
 f0 69 4c              cmp32	q1, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xf1
<L7>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 82                    and	r4, r6
 87                    and	r5, r7
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 c5 00 80              ldi16	r5, 0x8000
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 ff 11                 fsub	q0, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 ff 1b                 fsub	q2, q3
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 c4 44 a2              ldi16	r4, 0xa244
 c5 d6 3b              ldi16	r5, 0x3bd6
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 15 4e              ldi16	r4, 0x4e15
 c5 ea 3b              ldi16	r5, 0x3bea
 ff 0e                 fadd	q3, q2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c4 2f b0              ldi16	r4, 0xb02f
 c5 b6 3c              ldi16	r5, 0x3cb6
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 c6 6f db              ldi16	r6, 0xdb6f
 c7 5c 3d              ldi16	r7, 0x3d5c
 ff 0b                 fadd	q2, q3
 c2 01                 ldi8	r6, 0x1
 f4 23                 ldsp16	r7, [sp+0x8]
 8e                    and	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 0b 89              ldi16	r4, 0x890b
 c5 08 3e              ldi16	r5, 0x3e08
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 28                 fmul	q2, q0
 f0 06 aa aa           ldi16	r2, 0xaaaa
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f2 67                 mov32	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 0b                 fadd	q2, q3
 ff 22                 fmul	q0, q2
 ff 03                 fadd	q0, q3
 ff 04                 fadd	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0d                 fadd	q3, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1dd
<L8>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 08                 fadd	q2, q0
 ff 2f                 fmul	q3, q3
 ff 3e                 fdiv	q3, q2
 ff 1d                 fsub	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1b                 fsub	q2, q3
 ff 0a                 fadd	q2, q2
 ff 12                 fsub	q0, q2
 f4 39                 ldsp16	r5, [sp+0xe]
 09                    mov	r6, r5
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2e2
 ff 1a                 fsub	q2, q2
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 15                 cset.ult	r5
 f0 06 40 a1           ldi16	r2, 0xa140
 f0 07 2c 3f           ldi16	r3, 0x3f2c
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1e3
<L9>:
 f0 3d 10              stsp16	[sp+0x10], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1f9
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x205
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x21a
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 33                 fdiv	q0, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 61                 fneg	q1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 ff 13                 fsub	q0, q3
 c6 68 21              ldi16	r6, 0x2168
 c7 22 33              ldi16	r7, 0x3322
 ff 1d                 fsub	q3, q1
 ff 0c                 fadd	q3, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 f0 04 44 a2           ldi16	r0, 0xa244
 f0 05 d6 3b           ldi16	r1, 0x3bd6
 f2 6b                 mov32	q3, q1
 ff 24                 fmul	q1, q0
 f0 04 15 4e           ldi16	r0, 0x4e15
 f0 05 ea 3b           ldi16	r1, 0x3bea
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 2f b0           ldi16	r2, 0xb02f
 f0 07 b6 3c           ldi16	r3, 0x3cb6
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 2c                 fmul	q3, q0
 f0 04 6f db           ldi16	r0, 0xdb6f
 f0 05 5c 3d           ldi16	r1, 0x3d5c
 ff 0c                 fadd	q3, q0
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 69                 mov32	q2, q1
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 0b 89              ldi16	r6, 0x890b
 c7 08 3e              ldi16	r7, 0x3e08
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2e                 fmul	q3, q2
 c4 aa aa              ldi16	r4, 0xaaaa
 c5 aa 3e              ldi16	r5, 0x3eaa
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 29                 fmul	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 66                 mov32	q1, q2
 ff 07                 fadd	q1, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 ff 2d                 fmul	q3, q1
 ff 0b                 fadd	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 07                 fadd	q1, q3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x2fb
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 c1 01                 ldi8	r5, 0x1
 24                    sub	r5, r4
 ff c0 50              s16tof	q0, r5
 f2 6b                 mov32	q3, q1
 ff 0c                 fadd	q3, q0
 ff 25                 fmul	q1, q1
 ff 37                 fdiv	q1, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 16                 fsub	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1d                 fsub	q3, q1
 ff 0f                 fadd	q3, q3
 ff 13                 fsub	q0, q3
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9e                 lsr16i	r6, 0xe
 af                    xor	r7, r7
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 82                    and	r4, r6
 c2 01                 ldi8	r6, 0x1
 f7 7e                 sub32	q3, q2
 ff c4 0f              s32tof	q3, q3
 ff 23                 fmul	q0, q3
 f2 68                 mov32	q2, q0
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x30b
<L12>:
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 68                 mov32	q2, q0
 82                    and	r4, r6
 87                    and	r5, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 17                 fsub	q1, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 19                 fsub	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2b                 fmul	q2, q3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 06                 fadd	q1, q2
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2f2
