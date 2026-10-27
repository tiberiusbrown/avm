
math_ef_asin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_asin.c
00000000 l    d  .text.asinf	00000000 .text.asinf
00000000 g     F .text.asinf	000000c8 asinf

Disassembly of section .text.asinf:

<asinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 c2 01                 ldi8	r6, 0x1
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinf
		R_AVM_FAR24	.text.asinf+0x21
<L0>:
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	asinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.asinf+0xc1
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinf
		R_AVM_FAR24	.text.asinf+0xc1
<L1>:
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 69 c0              cmp32	q3, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asinf
		R_AVM_FAR24	.text.asinf+0x6c
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 04 60 4f 3b 3d 30 ef 2b 3d 0b e4 99 3d 5c aa 2a 3e      fpoly	4, 0.0457299948, 0.0419761539, 0.0751419887, 0.166665494
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	asinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.asinf+0xb7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 ff 17                 fsqrt
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 04 60 4f 3b 3d 30 ef 2b 3d 0b e4 99 3d 5c aa 2a 3e      fpoly	4, 0.0457299948, 0.0419761539, 0.0751419887, 0.166665494
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
 f0 04 00 80           ldi16	r0, 0x8000
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 1c                 and	r0, r7
 f9 a1                 or	r5, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
