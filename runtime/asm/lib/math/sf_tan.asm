
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	00000419 tanf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.tanf:

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
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
		R_AVM_FAR24	.text.tanf+0xb3
<L1>:
 ff c2 62              ftos16	r6, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xb3
<L2>:
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x203
<L3>:
 f0 16 18              leasp	r6, 0x18
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 10                    add	r4, r4
 c1 02                 ldi8	r5, 0x2
 81                    and	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
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
		R_AVM_FAR24	.text.tanf+0x20b
<L4>:
 ff c2 51              ftos16	r5, q1
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x20b
<L5>:
 c0 02                 ldi8	r4, 0x2
 f4 11                 ldsp16	r5, [sp+0x4]
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
		R_AVM_FAR24	.text.tanf+0x24a
<L6>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 39                 fdiv	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 c6 3f a1              ldi16	r6, 0xa13f
 c7 2c 3f              ldi16	r7, 0x3f2c
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 52                 stsp16	[sp+0x4], r6
 c6 40 a1              ldi16	r6, 0xa140
 f0 69 4c              cmp32	q1, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xf3
<L7>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 88                    and	r6, r4
 8d                    and	r7, r5
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 c7 00 80              ldi16	r7, 0x8000
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 ff 11                 fsub	q0, q1
 c6 68 21              ldi16	r6, 0x2168
 c7 22 33              ldi16	r7, 0x3322
 ff 1e                 fsub	q3, q2
 ff 03                 fadd	q0, q3
 f2 68                 mov32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 ff 20                 fmul	q0, q0
 c4 84 53              ldi16	r4, 0x5384
 c5 d9 37              ldi16	r5, 0x37d9
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 7a c0              ldi16	r4, 0xc07a
 c5 95 38              ldi16	r5, 0x3895
 ff 06                 fadd	q1, q2
 c6 5f ae              ldi16	r6, 0xae5f
 c7 9b b7              ldi16	r7, 0xb79b
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 45 f4              ldi16	r6, 0xf445
 c7 a3 38              ldi16	r7, 0x38a3
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 c8 26              ldi16	r4, 0x26c8
 c5 1a 3a              ldi16	r5, 0x3a1a
 ff 0e                 fadd	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 b9 37           ldi16	r2, 0x37b9
 f0 07 81 39           ldi16	r3, 0x3981
 ff 09                 fadd	q2, q1
 c2 01                 ldi8	r6, 0x1
 f4 13                 ldsp16	r7, [sp+0x4]
 8e                    and	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 48 de              ldi16	r4, 0xde48
 c5 be 3a              ldi16	r5, 0x3abe
 ff 0e                 fadd	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 c6 16 69              ldi16	r6, 0x6916
 c7 6b 3b              ldi16	r7, 0x3b6b
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 a4 27              ldi16	r4, 0x27a4
 c5 b3 3c              ldi16	r5, 0x3cb3
 ff 0e                 fadd	q3, q2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c4 89 88              ldi16	r4, 0x8889
 c5 08 3e              ldi16	r5, 0x3e08
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2b                 fmul	q2, q3
 c6 1f 37              ldi16	r6, 0x371f
 c7 11 3c              ldi16	r7, 0x3c11
 ff 0b                 fadd	q2, q3
 ff 22                 fmul	q0, q2
 c4 d1 0d              ldi16	r4, 0xdd1
 c5 5d 3d              ldi16	r5, 0x3d5d
 ff 02                 fadd	q0, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 ff 06                 fadd	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 29                 fmul	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 0b                 fadd	q2, q3
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 ff 26                 fmul	q1, q2
 ff 07                 fadd	q1, q3
 ff 01                 fadd	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0c                 fadd	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x244
<L8>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 67                 mov32	q1, q3
 ff 06                 fadd	q1, q2
 ff 2f                 fmul	q3, q3
 ff 3d                 fdiv	q3, q1
 ff 1c                 fsub	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 13                 fsub	q0, q3
 ff 00                 fadd	q0, q0
 ff 18                 fsub	q2, q0
 f4 3b                 ldsp16	r7, [sp+0xe]
 0b                    mov	r6, r7
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3a1
 ff 1a                 fsub	q2, q2
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 40 a1              ldi16	r4, 0xa140
 f0 69 c8              cmp32	q3, q2
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x274
<L9>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x256
<L10>:
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x260
 f2 67                 mov32	q1, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 37                 fdiv	q1, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 63                 fneg	q3
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 ff 12                 fsub	q0, q2
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 ff 17                 fsub	q1, q3
 ff 04                 fadd	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 61                 mov32	q0, q1
 ff 20                 fmul	q0, q0
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 ff 20                 fmul	q0, q0
 c4 84 53              ldi16	r4, 0x5384
 c5 d9 37              ldi16	r5, 0x37d9
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 7a c0              ldi16	r4, 0xc07a
 c5 95 38              ldi16	r5, 0x3895
 ff 0e                 fadd	q3, q2
 f0 06 5f ae           ldi16	r2, 0xae5f
 f0 07 9b b7           ldi16	r3, 0xb79b
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 45 f4           ldi16	r2, 0xf445
 f0 07 a3 38           ldi16	r3, 0x38a3
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 c8 26              ldi16	r4, 0x26c8
 c5 1a 3a              ldi16	r5, 0x3a1a
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 b9 37              ldi16	r6, 0x37b9
 c7 81 39              ldi16	r7, 0x3981
 ff 0b                 fadd	q2, q3
 c2 01                 ldi8	r6, 0x1
 f0 37 14              ldsp16	r7, [sp+0x14]
 8e                    and	r7, r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 48 de              ldi16	r4, 0xde48
 c5 be 3a              ldi16	r5, 0x3abe
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 16 69           ldi16	r2, 0x6916
 f0 07 6b 3b           ldi16	r3, 0x3b6b
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 a4 27              ldi16	r4, 0x27a4
 c5 b3 3c              ldi16	r5, 0x3cb3
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3e           ldi16	r3, 0x3e08
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 1f 37              ldi16	r6, 0x371f
 c7 11 3c              ldi16	r7, 0x3c11
 ff 07                 fadd	q1, q3
 ff 21                 fmul	q0, q1
 c6 d1 0d              ldi16	r6, 0xdd1
 c7 5d 3d              ldi16	r7, 0x3d5d
 ff 03                 fadd	q0, q3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f2 67                 mov32	q1, q3
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 ff 24                 fmul	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 2e                 fmul	q3, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 09                 fadd	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fadd	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x3bd
<L11>:
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 24                    sub	r5, r4
 ff c0 51              s16tof	q1, r5
 f2 6a                 mov32	q3, q0
 ff 0d                 fadd	q3, q1
 ff 20                 fmul	q0, q0
 ff 33                 fdiv	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1c                 fsub	q3, q0
 ff 0f                 fadd	q3, q3
 ff 17                 fsub	q1, q3
 f0 37 22              ldsp16	r7, [sp+0x22]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9e                 lsr16i	r6, 0xe
 af                    xor	r7, r7
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c2 01                 ldi8	r6, 0x1
 f7 7c                 sub32	q3, q0
 ff c4 0f              s32tof	q3, q3
 ff 27                 fmul	q1, q3
 f2 69                 mov32	q2, q1
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x3cd
<L12>:
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 69                 mov32	q2, q1
 82                    and	r4, r6
 87                    and	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 6a                 mov32	q3, q0
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
 ff 13                 fsub	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 18                 fsub	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2b                 fmul	q2, q3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 02                 fadd	q0, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x3b4
