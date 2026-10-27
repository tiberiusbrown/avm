
math_ef_expm1.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_expm1.c
00000000 l    d  .text.expm1f	00000000 .text.expm1f
00000000 g     F .text.expm1f	0000004e expm1f
00000000         *UND*	00000000 expf

Disassembly of section .text.expm1f:

<expm1f>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x41
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 06 7c 63 b5 3a 0a 0f 0d 3c e6 d0 2a 3d bc 94 2a 3e a4 fe ff 3e 00 00 80 3f      fpoly	6, 0.00138388528, 0.00860954262, 0.0417031273, 0.166583002, 0.499989629, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 e3 00 00 00           callf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
