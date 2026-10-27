
math_sf_nearbyint.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_nearbyint.c
00000000 l    d  .text.nearbyintf	00000000 .text.nearbyintf
00000000 g     F .text.nearbyintf	0000004b nearbyintf

Disassembly of section .text.nearbyintf:

<nearbyintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 63                 mov32	q0, q3
 ff 08                 fabs	q0
 f1 21                 mov	r4, r1
 c5 00 4b              ldi16	r5, 0x4b00
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nearbyintf
		R_AVM_FAR24	.text.nearbyintf+0x2d
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f0 69 40              cmp32	q1, q0
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 e2 00 00 00           jmpf	nearbyintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nearbyintf+0x44
 f0 06 00 80           ldi16	r2, 0x8000
 f9 5c                 and	r2, r7
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
