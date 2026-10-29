
math_kf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_sin.c
00000000 l    d  .text.__kernel_sinf	00000000 .text.__kernel_sinf
00000000 g     F .text.__kernel_sinf	00000016 __kernel_sinf

Disassembly of section .text.__kernel_sinf:

<__kernel_sinf>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 02                 fmul
 ef                    ret
