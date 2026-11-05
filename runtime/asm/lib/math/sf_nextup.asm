
math_sf_nextup.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_nextup.c
00000000 l    d  .text.nextupf	00000000 .text.nextupf
00000000 l    d  .text.nextdownf	00000000 .text.nextdownf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.nextupf	00000051 nextupf
00000000 g     F .text.nextdownf	0000005c nextdownf

Disassembly of section .text.nextupf:

<nextupf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextupf
		R_AVM_FAR24	.text.nextupf+0x21
<L0>:
 c2 40                 ldi8	r6, 0x40
 99                    or	r6, r5
 06                    mov	r5, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextupf
		R_AVM_FAR24	.text.nextupf+0x1e
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextupf
		R_AVM_FAR24	.text.nextupf+0x4b
<L2>:
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6b                 add32	q2, q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.nextdownf:

<nextdownf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextdownf
		R_AVM_FAR24	.text.nextdownf+0x21
<L0>:
 c2 40                 ldi8	r6, 0x40
 99                    or	r6, r5
 06                    mov	r5, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextdownf
		R_AVM_FAR24	.text.nextdownf+0x1e
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextdownf
		R_AVM_FAR24	.text.nextdownf+0x54
<L2>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f7 6b                 add32	q2, q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
