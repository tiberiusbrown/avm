
math_sf_round.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_round.c
00000000 l    d  .text.roundf	00000000 .text.roundf
00000000 g     F .text.roundf	000000a1 roundf

Disassembly of section .text.roundf:

<roundf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 04                    mov	r5, r4
 fa 87                 lsr16i	r5, 0x7
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 cb 81                 addi.s8	r7, -0x7f
 cd 7f                 cmpi.s8	r5, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x29
<L0>:
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 c5 80 3f              ldi16	r5, 0x3f80
 94                    or	r5, r4
 cf ff                 cmpi.s8	r7, -0x1
 fb 25                 cmov.eq	r4, r5
 af                    xor	r7, r7
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x81
 c2 85                 ldi8	r6, 0x85
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x52
<L1>:
 c1 7f                 ldi8	r5, 0x7f
 fa 17                 lsr16v	r5, r7
 84                    and	r5, r4
 f9 a1                 or	r5, r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x85
<L2>:
 c5 80 ff              ldi16	r5, 0xff80
 fa 27                 asr16v	r5, r7
 c2 40                 ldi8	r6, 0x40
 fa 1b                 lsr16v	r6, r7
 18                    add	r6, r4
 89                    and	r6, r5
 af                    xor	r7, r7
 02                    mov	r4, r6
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x81
 c2 95                 ldi8	r6, 0x95
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x8c
<L3>:
 c6 7a ff              ldi16	r6, 0xff7a
 16                    add	r5, r6
 c7 ff ff              ldi16	r7, 0xffff
 fa 1d                 lsr16v	r7, r5
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x85
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 ae                    xor	r7, r6
 c6 00 80              ldi16	r6, 0x8000
 fa 19                 lsr16v	r6, r5
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 8d                    and	r7, r5
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 01                    mov	r4, r5
 f1 07                 mov	r0, r7
 f1 0c                 mov	r1, r4
 f2 68                 mov32	q2, q0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f2 68                 mov32	q2, q0
 f4 43                 stsp16	[sp+0x0], r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c2 80                 ldi8	r6, 0x80
 f4 03                 ldsp16	r7, [sp+0x0]
 3e                    cmp	r7, r6
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x85
