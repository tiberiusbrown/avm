
math_sf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_cos.c
00000000 l    d  .text.cosf	00000000 .text.cosf
00000000 g     F .text.cosf	000003e6 cosf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.cosf:

<cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c6 d8 0f              ldi16	r6, 0xfd8
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x38
<L0>:
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0xd0
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x12a
<L2>:
 f0 16 10              leasp	r6, 0x10
 e3 00 00 00           callf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 c2 03                 ldi8	r6, 0x3
 88                    and	r6, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 ce 02                 cmpi.s8	r6, 0x2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x130
<L3>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1b4
<L4>:
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x30
<L5>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 06 4e d7 47 ad f6 74 0f 31 7c f2 93 b4 01 0d d0 37 61 0b b6 ba ab aa 2a 3d      fpoly	6, -1.13596476E-11, 2.08757234E-9, -2.75573143E-7, 2.48015876E-5, -0.00138888892, 0.0416666679
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x32a
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 28                 fmul	q2, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x118
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 06 4e d7 47 ad f6 74 0f 31 7c f2 93 b4 01 0d d0 37 61 0b b6 ba ab aa 2a 3d      fpoly	6, -1.13596476E-11, 2.08757234E-9, -2.75573143E-7, 2.48015876E-5, -0.00138888892, 0.0416666679
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x155
<L7>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 29                 fmul	q2, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 ff 19                 fsub	q2, q1
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ab
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x23e
<L8>:
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x2c4
<L9>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 62                 fneg	q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c5 90 3e              ldi16	r5, 0x3e90
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 84              cmp32	q2, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 29                 fmul	q2, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 ff 19                 fsub	q2, q1
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 2c                 fmul	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 ff 0e                 fadd	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 ff 1b                 fsub	q2, q3
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x238
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d3 c9 2e 2f 34 2f d7 b2 1b ef 38 36 01 0d 50 b9 89 88 08 3c  fpoly	5, 1.58969102E-10, -2.50507597E-8, 2.75573143E-6, -1.98412701E-4, 0.00833333377
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 21                 fmul	q0, q1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 11                 fsub	q0, q1
 ff 2c                 fmul	q3, q0
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 1d                 fsub	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3e           ldi16	r3, 0x3e2a
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 21                 fmul	q0, q1
 ff 0c                 fadd	q3, q0
 ff 1b                 fsub	q2, q3
 ff 62                 fneg	q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1ad
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d3 c9 2e 2f 34 2f d7 b2 1b ef 38 36 01 0d 50 b9 89 88 08 3c  fpoly	5, 1.58969102E-10, -2.50507597E-8, 2.75573143E-6, -1.98412701E-4, 0.00833333377
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 21                 fmul	q0, q1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 11                 fsub	q0, q1
 ff 2c                 fmul	q3, q0
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 1d                 fsub	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3e           ldi16	r3, 0x3e2a
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 21                 fmul	q0, q1
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ab
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 06 4e d7 47 ad f6 74 0f 31 7c f2 93 b4 01 0d d0 37 61 0b b6 ba ab aa 2a 3d      fpoly	6, -1.13596476E-11, 2.08757234E-9, -2.75573143E-7, 2.48015876E-5, -0.00138888892, 0.0416666679
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x381
<L12>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 28                 fmul	q2, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 ff 18                 fsub	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 ff 62                 fneg	q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 90 3e              ldi16	r5, 0x3e90
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 80              cmp32	q2, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 28                 fmul	q2, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 ff 18                 fsub	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 2c                 fmul	q3, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1a1
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 90 3e              ldi16	r5, 0x3e90
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 80              cmp32	q2, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 28                 fmul	q2, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 ff 18                 fsub	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 2c                 fmul	q3, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 1c                 fsub	q3, q0
 ff 0e                 fadd	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 ff 1b                 fsub	q2, q3
 ff 62                 fneg	q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1ad
