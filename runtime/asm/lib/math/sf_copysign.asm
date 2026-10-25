
math_sf_copysign.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_copysign.c
00000000 l    d  .text.copysignf	00000000 .text.copysignf
00000000 g     F .text.copysignf	00000022 copysignf

Disassembly of section .text.copysignf:

<copysignf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 3c                 and	r1, r7
 ff 66                 fabs	q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
