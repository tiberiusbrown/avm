
math_kf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_tan.c
00000000 l    d  .text.__kernel_tanf	00000000 .text.__kernel_tanf
00000000 g     F .text.__kernel_tanf	00000063 __kernel_tanf

Disassembly of section .text.__kernel_tanf:

<__kernel_tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 08              fcmp	r0, q2, q0
 f0 31 11              ldsp16	r1, [sp+0x11]
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x1e
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x4f
 f0 39 00              stsp16	[sp+0x0], r1
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 ff 24                 fmul	q1, q0
 f0 31 00              ldsp16	r1, [sp+0x0]
 ff 26                 fmul	q1, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 09                 fadd	q2, q1
 ff 0e                 fadd	q3, q2
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 3b                 fdiv	q2, q3
 f0 0d 01              cmpi.s8	r1, 0x1
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
