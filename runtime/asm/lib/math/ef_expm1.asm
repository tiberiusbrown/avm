
math_ef_expm1.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_expm1.c
00000000 l    d  .text.expm1f	00000000 .text.expm1f
00000000 g     F .text.expm1f	00000066 expm1f
00000000         *UND*	00000000 expf

Disassembly of section .text.expm1f:

<expm1f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 80 33           ldi16	r1, 0x3380
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x61
<L0>:
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x57
<L1>:
 f2 62                 mov32	q0, q2
 ff 16 05 61 0b b6 3a 89 88 08 3c ab aa 2a 3d ab aa 2a 3e 00 00 00 3f  fpoly	5, 0.00138888892, 0.00833333377, 0.0416666679, 0.166666672, 0.5
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expm1f+0x5f
 e3 00 00 00           callf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
