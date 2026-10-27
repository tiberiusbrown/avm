
math_sf_ilogb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_ilogb.c
00000000 l    d  .text.ilogbf	00000000 .text.ilogbf
00000000 g     F .text.ilogbf	000000d9 ilogbf

Disassembly of section .text.ilogbf:

<ilogbf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x36
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x3e
<L1>:
 c4 00 80              ldi16	r4, 0x8000
 c5 ff 7f              ldi16	r5, 0x7fff
 f0 69 c0              cmp32	q3, q0
 fb 25                 cmov.eq	r4, r5
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 fa 77                 lsr16i	r4, 0x7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x55
<L2>:
 c8 81                 addi.s8	r4, -0x7f
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x9c
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 f4 8c                 lsr16.1	r4
 92                    or	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c2 1f                 ldi8	r6, 0x1f
 89                    and	r6, r5
 c4 8a ff              ldi16	r4, 0xff8a
 e2 00 00 00           jmpf	ilogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ilogbf+0xd3
 02                    mov	r4, r6
 f4 8c                 lsr16.1	r4
 92                    or	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c2 1f                 ldi8	r6, 0x1f
 89                    and	r6, r5
 c4 7a ff              ldi16	r4, 0xff7a
 22                    sub	r4, r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
