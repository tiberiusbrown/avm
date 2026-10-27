
math_kf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_cos.c
00000000 l    d  .text.__kernel_cosf	00000000 .text.__kernel_cosf
00000000 g     F .text.__kernel_cosf	00000018 __kernel_cosf

Disassembly of section .text.__kernel_cosf:

<__kernel_cosf>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 ef                    ret
