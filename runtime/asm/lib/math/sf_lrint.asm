
math_sf_lrint.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_lrint.c
00000000 l    d  .text.lrintf	00000000 .text.lrintf
00000000 g     F .text.lrintf	00000081 lrintf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.lrintf:

<lrintf>:
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
 e2 00 00 00           jmpf	lrintf
		R_AVM_FAR24	.text.lrintf+0x2d
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f0 69 40              cmp32	q1, q0
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 e2 00 00 00           jmpf	lrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lrintf+0x44
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
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f0 05 00 4f           ldi16	r1, 0x4f00
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lrintf
		R_AVM_FAR24	.text.lrintf+0x64
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 12                 ftos32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f2 30                 sub	r0, r0
 f0 05 00 cf           ldi16	r1, 0xcf00
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lrintf
		R_AVM_FAR24	.text.lrintf+0x5f
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	lrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lrintf+0x5f
