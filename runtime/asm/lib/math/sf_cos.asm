
math_sf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_cos.c
00000000 l    d  .text.cosf	00000000 .text.cosf
00000000 g     F .text.cosf	0000005f cosf

Disassembly of section .text.cosf:

<cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 ff 1d                 frempio2
 f1 06                 mov	r0, r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 01 01              ldi8	r1, 0x1
 f9 20                 and	r1, r0
 ff 02                 fmul
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x30
<L0>:
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x47
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 a8                 inc16	r0
 f0 01 02              ldi8	r1, 0x2
 f9 20                 and	r1, r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f4 a1                 tst8	r1
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
