
math_sf_ceil.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_ceil.c
00000000 l    d  .text.ceilf	00000000 .text.ceilf
00000000 g     F .text.ceilf	000000e2 ceilf

Disassembly of section .text.ceilf:

<ceilf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f1 77                 zext8	r7
 cf 7f                 cmpi.s8	r7, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x38
<L0>:
 c7 00 80              ldi16	r7, 0x8000
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x32
<L1>:
 c5 80 3f              ldi16	r5, 0x3f80
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xcd
<L2>:
 f6 2c                 tst16	r4
 aa                    xor	r6, r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xdc
<L3>:
 aa                    xor	r6, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xdc
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 0b                    mov	r6, r7
 ca 81                 addi.s8	r6, -0x7f
 f4 5a                 stsp16	[sp+0x6], r6
 c2 85                 ldi8	r6, 0x85
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0x81
<L4>:
 c3 7f                 ldi8	r7, 0x7f
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 1e                 lsr16v	r7, r6
 f2 62                 mov32	q0, q2
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 82                    and	r4, r6
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f2 68                 mov32	q2, q0
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc8
<L5>:
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 aa                    xor	r6, r6
 f0 69 80              cmp32	q2, q0
 fd 3e                 cmov.slt	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 c5 80 ff              ldi16	r5, 0xff80
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 24                 asr16v	r5, r4
 87                    and	r5, r7
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xdc
 c2 95                 ldi8	r6, 0x95
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xbb
<L6>:
 c6 7a ff              ldi16	r6, 0xff7a
 1e                    add	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 fa 1b                 lsr16v	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xc8
<L7>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ceilf
		R_AVM_FAR24	.text.ceilf+0xd2
<L8>:
 f4 19                 ldsp16	r5, [sp+0x6]
 94                    or	r5, r4
 f4 ad                 inc16	r5
 f6 2d                 tst16	r5
 01                    mov	r4, r5
 f8 05                 cset.eq	r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 08                    mov	r6, r4
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xdc
 f2 62                 mov32	q0, q2
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 f4 1b                 ldsp16	r7, [sp+0x6]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	ceilf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ceilf+0xdc
 f4 1a                 ldsp16	r6, [sp+0x6]
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 88                    and	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
