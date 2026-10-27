
math_kf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_sin.c
00000000 l    d  .text.__kernel_sinf	00000000 .text.__kernel_sinf
00000000 g     F .text.__kernel_sinf	00000020 __kernel_sinf

Disassembly of section .text.__kernel_sinf:

<__kernel_sinf>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
