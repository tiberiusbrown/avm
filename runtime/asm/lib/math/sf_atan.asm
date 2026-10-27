
math_sf_atan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_atan.c
00000000 l    d  .text.atanf	00000000 .text.atanf
00000000 g     F .text.atanf	000001bf atanf

Disassembly of section .text.atanf:

<atanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 09                 fabs	q1
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x22
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x197
 a0                    xor	r4, r4
 c5 80 39              ldi16	r5, 0x3980
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x35
<L1>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x197
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x86
<L2>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0xbf
<L3>:
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x119
<L4>:
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 16 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x17e
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0xec
<L5>:
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x13c
<L6>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 16 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x188
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x15f
<L7>:
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x17e
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanf
		R_AVM_FAR24	.text.atanf+0x19c
<L8>:
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x188
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x17e
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x188
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 16 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 e2 00 00 00           jmpf	atanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanf+0x188
