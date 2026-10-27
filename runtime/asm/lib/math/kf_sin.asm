
math_kf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_sin.c
00000000 l    d  .text.__kernel_sinf	00000000 .text.__kernel_sinf
00000000 g     F .text.__kernel_sinf	0000003d __kernel_sinf

Disassembly of section .text.__kernel_sinf:

<__kernel_sinf>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_FAR24	.text.__kernel_sinf+0x38
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
