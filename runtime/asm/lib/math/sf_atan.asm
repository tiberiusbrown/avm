
math_sf_atan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_atan.c
00000000 l    d  .text.atanf	00000000 .text.atanf
00000000 g     F .text.atanf	0000024a atanf

Disassembly of section .text.atanf:

<atanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 63                 mov32	q0, q3
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x2d
<L0>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x73
<L1>:
 ff 0f                 fadd	q3, q3
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x241
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 08              cmp32	q0, q2
 f8 12                 cset.ult	r2
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x90
<L2>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x241
<L3>:
 f0 3a 04              stsp16	[sp+0x4], r2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x11e
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 63                 mov32	q0, q3
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f0 69 80              cmp32	q2, q0
 fd 32                 cmov.slt	r6, r2
 fd 3b                 cmov.slt	r7, r3
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x241
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 80              cmp32	q2, q0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 3a 04              stsp16	[sp+0x4], r2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0xe6
<L4>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x128
<L5>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x177
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x156
<L6>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 02                 fadd	q0, q2
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f2 63                 mov32	q0, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 68                 stsp16	[sp+0xa], r4
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x177
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x177
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 6a                 stsp16	[sp+0xa], r6
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 e1 fe              ldi16	r4, 0xfee1
 c5 11 3e              ldi16	r5, 0x3e11
 ff 0e                 fadd	q3, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 aa aa              ldi16	r4, 0xaaaa
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x1d0
<L7>:
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x241
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 38 63              ldi16	r6, 0x6338
 c7 ed 3e              ldi16	r7, 0x3eed
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 a4                 tst8	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
