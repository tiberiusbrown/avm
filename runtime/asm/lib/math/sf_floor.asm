
math_sf_floor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_floor.c
00000000 l    d  .text.floorf	00000000 .text.floorf
00000000 g     F .text.floorf	000000ca floorf

Disassembly of section .text.floorf:

<floorf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 62                 mov32	q0, q2
 f1 11                 mov	r2, r1
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 a8                 and	r5, r2
 c4 7f 3f              ldi16	r4, 0x3f7f
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x30
<L0>:
 f9 a1                 or	r5, r0
 c4 00 80              ldi16	r4, 0x8000
 f9 50                 and	r2, r4
 c6 80 bf              ldi16	r6, 0xbf80
 f6 2d                 tst16	r5
 fb 32                 cmov.eq	r6, r2
 f6 2a                 tst16	r2
 fb 32                 cmov.eq	r6, r2
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xbd
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 0b                    mov	r6, r7
 ca 81                 addi.s8	r6, -0x7f
 c4 ff 42              ldi16	r4, 0x42ff
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x65
<L1>:
 c1 7f                 ldi8	r5, 0x7f
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 f9 88                 and	r4, r2
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xc1
<L2>:
 c4 80 ff              ldi16	r4, 0xff80
 fa 22                 asr16v	r4, r6
 f4 ad                 inc16	r5
 f1 29                 mov	r6, r1
 fa df                 asr16i	r6, 0xf
 89                    and	r6, r5
 f2 2a                 add	r6, r2
 88                    and	r6, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xbd
 c4 ff 4a              ldi16	r4, 0x4aff
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x9f
<L3>:
 c4 7a ff              ldi16	r4, 0xff7a
 1c                    add	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 06                    mov	r5, r6
 fa 17                 lsr16v	r5, r7
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xc1
<L4>:
 f1 22                 mov	r4, r2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xb4
<L5>:
 a6                    xor	r5, r6
 f9 a0                 and	r5, r0
 08                    mov	r6, r4
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xbd
 f2 68                 mov32	q2, q0
 f4 42                 stsp16	[sp+0x0], r6
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c2 80                 ldi8	r6, 0x80
 f4 03                 ldsp16	r7, [sp+0x0]
 3e                    cmp	r7, r6
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xc1
 f9 a1                 or	r5, r0
 f4 ad                 inc16	r5
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 18                    add	r6, r4
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f2 68                 mov32	q2, q0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
