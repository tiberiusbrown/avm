
math_sf_copysign.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_copysign.c
00000000 l    d  .text.copysignf	00000000 .text.copysignf
00000000 g     F .text.copysignf	00000015 copysignf

Disassembly of section .text.copysignf:

<copysignf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 00 80              ldi16	r6, 0x8000
 8b                    and	r6, r7
 ff 0a                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
