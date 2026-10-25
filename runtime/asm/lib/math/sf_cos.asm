
math_sf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_cos.c
00000000 l    d  .text.cosf	00000000 .text.cosf
00000000 g     F .text.cosf	000004e2 cosf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.cosf:

<cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 66                 mov32	q1, q2
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 c6 d8 0f              ldi16	r6, 0xfd8
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x36
<L0>:
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x124
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1aa
<L2>:
 f0 16 14              leasp	r6, 0x14
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 c2 03                 ldi8	r6, 0x3
 88                    and	r6, r4
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 ce 02                 cmpi.s8	r6, 0x2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1b2
<L3>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x233
<L4>:
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 a0                    xor	r4, r4
 c5 00 32              ldi16	r5, 0x3200
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x2e
<L5>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 ff 20                 fmul	q0, q0
 c4 4e d7              ldi16	r4, 0xd74e
 c5 47 ad              ldi16	r5, 0xad47
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 f6 74              ldi16	r4, 0x74f6
 c5 0f 31              ldi16	r5, 0x310f
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 7c f2           ldi16	r2, 0xf27c
 f0 07 93 b4           ldi16	r3, 0xb493
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 d0 37              ldi16	r5, 0x37d0
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 61 0b           ldi16	r2, 0xb61
 f0 07 b6 ba           ldi16	r3, 0xbab6
 ff 09                 fadd	q2, q1
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3d              ldi16	r5, 0x3d2a
 ff 0e                 fadd	q3, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x42d
<L6>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 4e d7              ldi16	r4, 0xd74e
 c5 47 ad              ldi16	r5, 0xad47
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 f6 74              ldi16	r4, 0x74f6
 c5 0f 31              ldi16	r5, 0x310f
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 7c f2              ldi16	r6, 0xf27c
 c7 93 b4              ldi16	r7, 0xb493
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 d0 37              ldi16	r5, 0x37d0
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 b6 ba              ldi16	r7, 0xbab6
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 22                 fmul	q0, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3d              ldi16	r5, 0x3d2a
 ff 02                 fadd	q0, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 2c                 fmul	q3, q0
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1e1
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 26                 fmul	q1, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 22                 fmul	q0, q2
 ff 01                 fadd	q0, q1
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 f2 68                 mov32	q2, q0
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x24c
<L8>:
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 a0                    xor	r4, r4
 c5 00 32              ldi16	r5, 0x3200
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x265
<L9>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4d9
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 f2 30                 sub	r0, r0
 f0 05 90 3e           ldi16	r1, 0x3e90
 f0 69 84              cmp32	q2, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 26                 fmul	q1, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 22                 fmul	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 13                 fsub	q0, q3
 ff 01                 fadd	q0, q1
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 a0                    xor	r4, r4
 c5 00 32              ldi16	r5, 0x3200
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x2fb
<L10>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4d9
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 a0                    xor	r4, r4
 c5 00 32              ldi16	r5, 0x3200
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x393
<L11>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 ff 20                 fmul	q0, q0
 c4 4e d7              ldi16	r4, 0xd74e
 c5 47 ad              ldi16	r5, 0xad47
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 f6 74              ldi16	r4, 0x74f6
 c5 0f 31              ldi16	r5, 0x310f
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 7c f2           ldi16	r2, 0xf27c
 f0 07 93 b4           ldi16	r3, 0xb493
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 d0 37              ldi16	r5, 0x37d0
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 61 0b           ldi16	r2, 0xb61
 f0 07 b6 ba           ldi16	r3, 0xbab6
 ff 09                 fadd	q2, q1
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3d              ldi16	r5, 0x3d2a
 ff 0e                 fadd	q3, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x485
<L12>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4d7
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 c4 d3 c9              ldi16	r4, 0xc9d3
 c5 2e 2f              ldi16	r5, 0x2f2e
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 34 2f              ldi16	r4, 0x2f34
 c5 d7 b2              ldi16	r5, 0xb2d7
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 04 1b ef           ldi16	r0, 0xef1b
 f0 05 38 36           ldi16	r1, 0x3638
 ff 08                 fadd	q2, q0
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 50 b9              ldi16	r5, 0xb950
 ff 06                 fadd	q1, q2
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 c4 89 88              ldi16	r4, 0x8889
 c5 08 3c              ldi16	r5, 0x3c08
 ff 02                 fadd	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3e              ldi16	r5, 0x3e2a
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 28                 fmul	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 26                 fmul	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1e                 fsub	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4d7
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 c4 d3 c9              ldi16	r4, 0xc9d3
 c5 2e 2f              ldi16	r5, 0x2f2e
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 34 2f              ldi16	r4, 0x2f34
 c5 d7 b2              ldi16	r5, 0xb2d7
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 04 1b ef           ldi16	r0, 0xef1b
 f0 05 38 36           ldi16	r1, 0x3638
 ff 08                 fadd	q2, q0
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 50 b9              ldi16	r5, 0xb950
 ff 06                 fadd	q1, q2
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 c4 89 88              ldi16	r4, 0x8889
 c5 08 3c              ldi16	r5, 0x3c08
 ff 02                 fadd	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3e              ldi16	r5, 0x3e2a
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 28                 fmul	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 26                 fmul	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1e                 fsub	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 aa                    xor	r6, r6
 c7 90 3e              ldi16	r7, 0x3e90
 f0 69 80              cmp32	q2, q0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 1d                 fsub	q3, q1
 ff 0c                 fadd	q3, q0
 c5 80 3f              ldi16	r5, 0x3f80
 ff 19                 fsub	q2, q1
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x4db
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c5 48 3f              ldi16	r5, 0x3f48
 aa                    xor	r6, r6
 c7 90 3e              ldi16	r7, 0x3e90
 f0 69 80              cmp32	q2, q0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 1d                 fsub	q3, q1
 ff 0c                 fadd	q3, q0
 c5 80 3f              ldi16	r5, 0x3f80
 ff 19                 fsub	q2, q1
 ff 1b                 fsub	q2, q3
 ff 62                 fneg	q2
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
