
math_sf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sin.c
00000000 l    d  .text.sinf	00000000 .text.sinf
00000000 g     F .text.sinf	00000152 sinf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.sinf:

<sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 06 d8 0f           ldi16	r2, 0xfd8
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x55
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x14b
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x14b
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0xb5
<L2>:
 f0 16 00              leasp	r6, 0x0
 e3 00 00 00           callf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c3 03                 ldi8	r7, 0x3
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0xbb
<L3>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0xf1
<L4>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x14b
<L5>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x14b
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x14b
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x106
<L6>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x149
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x149
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x11b
<L8>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x14b
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x134
<L9>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x149
 ff 2a                 fmul	q2, q2
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x14b
 ff 2a                 fmul	q2, q2
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 ff 62                 fneg	q2
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
