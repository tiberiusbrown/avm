
math_sf_atan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_atan.c
00000000 l    d  .text.atanf	00000000 .text.atanf
00000000 g     F .text.atanf	000001e3 atanf

Disassembly of section .text.atanf:

<atanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 aa                    xor	r6, r6
 c7 80 50              ldi16	r7, 0x5080
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x2b
<L0>:
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x74
<L1>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x1dc
 c6 ff ff              ldi16	r6, 0xffff
 c7 df 3e              ldi16	r7, 0x3edf
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x91
<L2>:
 aa                    xor	r6, r6
 c7 00 31              ldi16	r7, 0x3100
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x1dc
<L3>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x1dc
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 bf              ldi16	r5, 0xbfc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f0 69 c0              cmp32	q3, q0
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x1dc
 c6 ff ff              ldi16	r6, 0xffff
 c7 97 3f              ldi16	r7, 0x3f97
 f0 69 c4              cmp32	q3, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0xfb
<L4>:
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x132
<L5>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x1bd
 c6 ff ff              ldi16	r6, 0xffff
 c7 1b 40              ldi16	r7, 0x401b
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x17a
<L6>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 3d                 fdiv	q3, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x190
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x1bd
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3d                 fdiv	q3, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 67                 mov32	q1, q3
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 11                 fsub	q0, q1
 ff 1c                 fsub	q3, q0
 ff 0b                 fadd	q2, q3
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
