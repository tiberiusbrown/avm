
math_sf_lround.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_lround.c
00000000 l    d  .text.lroundf	00000000 .text.lroundf
00000000 g     F .text.lroundf	0000003e lroundf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.lroundf:

<lroundf>:
 b1                    push16	r1
 b0                    push16	r0
 ff 1b                 fround
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 00 4f           ldi16	r1, 0x4f00
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lroundf
		R_AVM_FAR24	.text.lroundf+0x20
<L0>:
 ff 12                 ftos32
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f2 30                 sub	r0, r0
 f0 05 00 cf           ldi16	r1, 0xcf00
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lroundf
		R_AVM_FAR24	.text.lroundf+0x1d
<L1>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
