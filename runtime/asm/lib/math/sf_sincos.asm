
math_sf_sincos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    d  .text.sincosf	00000000 .text.sincosf
00000000 g     F .text.sincosf	000000cd sincosf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.sincosf:

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 06 d8 0f           ldi16	r2, 0xfd8
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x40
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 39           ldi16	r3, 0x3980
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x57
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0xbc
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x5c
<L2>:
 ff 10                 fsub	q0, q0
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0xba
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x6e
 f0 12 04              leasp	r2, 0x4
 f2 68                 mov32	q2, q0
 f1 2a                 mov	r6, r2
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 08                    mov	r6, r4
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 22                 fmul	q0, q2
 f2 69                 mov32	q2, q1
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f2 66                 mov32	q1, q2
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 ff 60                 fneg	q0
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0xba
<L3>:
 ff 60                 fneg	q0
 ff 61                 fneg	q1
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 4c              st32	[r6], q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
