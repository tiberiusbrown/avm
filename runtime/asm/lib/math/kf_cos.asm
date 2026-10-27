
math_kf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_cos.c
00000000 l    d  .text.__kernel_cosf	00000000 .text.__kernel_cosf
00000000 g     F .text.__kernel_cosf	0000003a __kernel_cosf

Disassembly of section .text.__kernel_cosf:

<__kernel_cosf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_FAR24	.text.__kernel_cosf+0x20
<L0>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
