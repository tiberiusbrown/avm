
math_sf_atan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_atan.c
00000000 l    d  .text.atanf	00000000 .text.atanf
00000000 g     F .text.atanf	000002bf atanf

Disassembly of section .text.atanf:

<atanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 aa                    xor	r6, r6
 c7 80 50              ldi16	r7, 0x5080
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x2b
<L0>:
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x73
<L1>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x2b8
 aa                    xor	r6, r6
 c7 e0 3e              ldi16	r7, 0x3ee0
 f0 69 0c              cmp32	q0, q3
 f8 12                 cset.ult	r2
 c6 ff ff              ldi16	r6, 0xffff
 c7 df 3e              ldi16	r7, 0x3edf
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x92
<L2>:
 aa                    xor	r6, r6
 c7 00 31              ldi16	r7, 0x3100
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x2b8
<L3>:
 f0 3a 04              stsp16	[sp+0x4], r2
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x172
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 69 48              cmp32	q1, q2
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x2b8
 c6 ff ff              ldi16	r6, 0xffff
 c7 97 3f              ldi16	r7, 0x3f97
 f0 69 c0              cmp32	q3, q0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 04              stsp16	[sp+0x4], r2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0xea
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 2f 3f              ldi16	r7, 0x3f2f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x127
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
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x178
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x156
<L6>:
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 23                 fmul	q0, q3
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 38                 fdiv	q2, q0
 c6 b4 0f              ldi16	r6, 0xfb4
 c7 14 33              ldi16	r7, 0x3314
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 5e 98              ldi16	r6, 0x985e
 c7 7b 3f              ldi16	r7, 0x3f7b
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x172
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
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x178
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 6a                 stsp16	[sp+0xa], r6
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 ff 20                 fmul	q0, q0
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 20                 fmul	q0, q0
 c6 d7 69              ldi16	r6, 0x69d7
 c7 85 3c              ldi16	r7, 0x3c85
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 59 da              ldi16	r6, 0xda59
 c7 4b 3d              ldi16	r7, 0x3d4b
 ff 0b                 fadd	q2, q3
 f0 06 21 a2           ldi16	r2, 0xa221
 f0 07 15 bd           ldi16	r3, 0xbd15
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 f0 06 6b f1           ldi16	r2, 0xf16b
 f0 07 6e bd           ldi16	r3, 0xbd6e
 ff 0d                 fadd	q3, q1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 95 87              ldi16	r6, 0x8795
 c7 9d bd              ldi16	r7, 0xbd9d
 ff 07                 fadd	q1, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 35 6b              ldi16	r4, 0x6b35
 c5 88 3d              ldi16	r5, 0x3d88
 ff 0e                 fadd	q3, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 6e 2e              ldi16	r6, 0x2e6e
 c7 ba 3d              ldi16	r7, 0x3dba
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 12 3e              ldi16	r5, 0x3e12
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 38 8e           ldi16	r2, 0x8e38
 f0 07 e3 bd           ldi16	r3, 0xbde3
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 23                 fmul	q0, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x23b
<L7>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x2b8
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 04 38 63           ldi16	r0, 0x6338
 f0 05 ed 3e           ldi16	r1, 0x3eed
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 a6                 tst8	r6
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 ff 1e                 fsub	q3, q2
 ff 13                 fsub	q0, q3
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 69                 mov32	q2, q1
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
