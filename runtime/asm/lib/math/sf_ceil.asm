
math_sf_ceil.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_ceil.c
00000000 l    d  .text.ceilf	00000000 .text.ceilf
00000000 g     F .text.ceilf	000000d0 ceilf

Disassembly of section .text.ceilf:

<ceilf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 66                 mov32	q1, q2
 f1 2b                 mov	r6, r3
 fa 87                 lsr16i	r5, 0x7
 f1 75                 zext8	r5
 cd 7f                 cmpi.s8	r5, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x3c
<L0>:
 c5 00 80              ldi16	r5, 0x8000
 86                    and	r5, r6
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x36
<L1>:
 c7 80 3f              ldi16	r7, 0x3f80
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc3
<L2>:
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc3
<L3>:
 a0                    xor	r4, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xc3
 0d                    mov	r7, r5
 cb 81                 addi.s8	r7, -0x7f
 c0 85                 ldi8	r4, 0x85
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x70
<L4>:
 c1 7f                 ldi8	r5, 0x7f
 fa 17                 lsr16v	r5, r7
 01                    mov	r4, r5
 82                    and	r4, r6
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc7
<L5>:
 f4 ad                 inc16	r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 f0 69 40              cmp32	q1, q0
 fd 2c                 cmov.slt	r5, r4
 16                    add	r5, r6
 0b                    mov	r6, r7
 c7 80 ff              ldi16	r7, 0xff80
 fa 2e                 asr16v	r7, r6
 8d                    and	r7, r5
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xc3
 c0 95                 ldi8	r4, 0x95
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xa6
<L6>:
 c4 7a ff              ldi16	r4, 0xff7a
 14                    add	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 fa 11                 lsr16v	r4, r5
 0c                    mov	r7, r4
 f9 88                 and	r4, r2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc7
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xbb
<L8>:
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 f4 ac                 inc16	r4
 f6 2c                 tst16	r4
 f8 07                 cset.eq	r7
 1e                    add	r7, r6
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xc3
 f2 69                 mov32	q2, q1
 f4 43                 stsp16	[sp+0x0], r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c2 80                 ldi8	r6, 0x80
 f4 03                 ldsp16	r7, [sp+0x0]
 3e                    cmp	r7, r6
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xc7
 03                    mov	r4, r7
 c5 ff ff              ldi16	r5, 0xffff
 a1                    xor	r4, r5
 f9 88                 and	r4, r2
 0e                    mov	r7, r6
 f1 14                 mov	r2, r4
 f1 1f                 mov	r3, r7
 f2 69                 mov32	q2, q1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
