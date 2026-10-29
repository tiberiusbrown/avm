
math_ef_asinh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_asinh.c
00000000 l    d  .text.asinhf	00000000 .text.asinhf
00000000 g     F .text.asinhf	00000094 asinhf
00000000         *UND*	00000000 logf

Disassembly of section .text.asinhf:

<asinhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 09                 fabs	q1
 f1 23                 mov	r4, r3
 c5 7f 3f              ldi16	r5, 0x3f7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinhf
		R_AVM_FAR24	.text.asinhf+0x41
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 15 06 2c 50 a4 bb 7f fe a2 3c 0b f0 29 bd 6e da 98 3d c9 a8 2a be 00 00 80 3f      fpoly	6, -0.00501444004, 0.0198967438, -0.0414886884, 0.0746353716, -0.166659489, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	asinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.asinhf+0x8f
 c5 80 7f              ldi16	r5, 0x7f80
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinhf
		R_AVM_FAR24	.text.asinhf+0x55
<L1>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	asinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.asinhf+0x8f
 c5 80 45              ldi16	r5, 0x4580
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinhf
		R_AVM_FAR24	.text.asinhf+0x71
<L2>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	asinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 00                 fadd
 e2 00 00 00           jmpf	asinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.asinhf+0x89
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 ff 16                 fsqrt
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 e3 00 00 00           callf	asinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
