
math_sf_round.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_round.c
00000000 l    d  .text.roundf	00000000 .text.roundf
00000000 g     F .text.roundf	000000aa roundf

Disassembly of section .text.roundf:

<roundf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 66                 mov32	q1, q2
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 04                    mov	r5, r4
 c9 81                 addi.s8	r5, -0x7f
 cc 7f                 cmpi.s8	r4, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x2c
<L0>:
 c4 00 80              ldi16	r4, 0x8000
 88                    and	r6, r4
 c4 80 3f              ldi16	r4, 0x3f80
 92                    or	r4, r6
 cd ff                 cmpi.s8	r5, -0x1
 fb 34                 cmov.eq	r6, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x8e
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 85                 ldi8	r6, 0x85
 38                    cmp	r6, r4
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x5c
<L1>:
 c0 7f                 ldi8	r4, 0x7f
 fa 11                 lsr16v	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 82                    and	r4, r6
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x92
<L2>:
 c4 80 ff              ldi16	r4, 0xff80
 fa 21                 asr16v	r4, r5
 0d                    mov	r7, r5
 c1 40                 ldi8	r5, 0x40
 fa 17                 lsr16v	r5, r7
 16                    add	r5, r6
 84                    and	r5, r4
 a0                    xor	r4, r4
 09                    mov	r6, r5
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x8e
 c2 95                 ldi8	r6, 0x95
 38                    cmp	r6, r4
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x9b
<L3>:
 c6 7a ff              ldi16	r6, 0xff7a
 12                    add	r4, r6
 c6 ff ff              ldi16	r6, 0xffff
 fa 18                 lsr16v	r6, r4
 06                    mov	r5, r6
 f9 c8                 and	r6, r2
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x92
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 a6                    xor	r5, r6
 c7 00 80              ldi16	r7, 0x8000
 fa 1c                 lsr16v	r7, r4
 0b                    mov	r6, r7
 f2 2a                 add	r6, r2
 86                    and	r5, r6
 3b                    cmp	r6, r7
 f8 14                 cset.ult	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 08                    mov	r6, r4
 01                    mov	r4, r5
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 61                 mov32	q0, q1
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 36                    cmp	r5, r6
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x92
