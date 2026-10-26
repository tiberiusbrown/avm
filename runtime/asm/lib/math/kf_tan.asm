
math_kf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_tan.c
00000000 l    d  .text.__kernel_tanf	00000000 .text.__kernel_tanf
00000000 g     F .text.__kernel_tanf	00000054 __kernel_tanf

Disassembly of section .text.__kernel_tanf:

<__kernel_tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x36
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 ff 22                 fmul	q0, q2
 ff 04                 fadd	q1, q0
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x4b
<L1>:
 ff 39                 fdiv	q2, q1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 69                 mov32	q2, q1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
