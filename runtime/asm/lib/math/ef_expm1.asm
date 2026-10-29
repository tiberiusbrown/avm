
math_ef_expm1.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_expm1.c
00000000 l    d  .text.expm1f	00000000 .text.expm1f
00000000 g     F .text.expm1f	00000084 expm1f
00000000         *UND*	00000000 __avm_expf_noerrno
00000000         *UND*	00000000 expf
00000000         *UND*	00000000 __avm_errno

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
		R_AVM_FAR24	.text.expm1f+0x4e
<L0>:
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c3 7f                 ldi8	r7, 0x7f
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x71
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 06 7c 63 b5 3a 0a 0f 0d 3c e6 d0 2a 3d bc 94 2a 3e a4 fe ff 3e 00 00 80 3f      fpoly	6, 0.00138388528, 0.00860954262, 0.0417031273, 0.166583002, 0.499989629, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c2 01                 ldi8	r6, 0x1
 c7 00 80              ldi16	r7, 0x8000
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x64
<L2>:
 e3 00 00 00           callf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 e2 00 00 00           jmpf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expm1f+0x68
 e3 00 00 00           callf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expm1f
		R_AVM_FAR24	.text.expm1f+0x26
<L3>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	expm1f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expm1f+0x26
