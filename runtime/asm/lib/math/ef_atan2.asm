
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 g     F .text.atan2f	00000273 atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x69
<L0>:
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x69
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x75
<L2>:
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xa3
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xc0
<L4>:
 f2 66                 mov32	q1, q2
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x209
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x249
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 06 49 40           ldi16	r2, 0x4049
 f0 07 49 c0           ldi16	r3, 0xc049
 f0 69 80              cmp32	q2, q0
 fb 53                 cmov.ne	r2, r3
 c4 db 0f              ldi16	r4, 0xfdb
 f1 26                 mov	r5, r2
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x249
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 88                    and	r6, r4
 8d                    and	r7, r5
 a5                    xor	r5, r5
 f0 04 c9 3f           ldi16	r0, 0x3fc9
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 f0 69 c8              cmp32	q3, q2
 fb 41                 cmov.ne	r0, r1
 c4 db 0f              ldi16	r4, 0xfdb
 f1 24                 mov	r5, r0
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x249
 f0 69 08              cmp32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x209
<L5>:
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x109
<L6>:
 ff 31                 fdiv	q0, q1
 f1 21                 mov	r4, r1
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x140
<L7>:
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x19a
<L8>:
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 ff ca 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 ff 22                 fmul	q0, q2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x201
 ff 34                 fdiv	q1, q0
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x16d
<L9>:
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1bd
<L10>:
 f2 69                 mov32	q2, q1
 ff 2a                 fmul	q2, q2
 ff ca 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x209
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1e0
<L11>:
 a0                    xor	r4, r4
 c5 20 bf              ldi16	r5, 0xbf20
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x1ff
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x250
<L12>:
 a0                    xor	r4, r4
 c5 20 bf              ldi16	r5, 0xbf20
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x209
 a0                    xor	r4, r4
 c5 c0 be              ldi16	r5, 0xbec0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x1ff
 a0                    xor	r4, r4
 c5 c0 be              ldi16	r5, 0xbec0
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x209
 a0                    xor	r4, r4
 c5 60 bf              ldi16	r5, 0xbf60
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 18                 fsub	q2, q0
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 ff 12                 fsub	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 f2 64                 mov32	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 ff 66                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 f0 69 c4              cmp32	q3, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 c5 60 bf              ldi16	r5, 0xbf60
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x209
