
math_sf_trunc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_trunc.c
00000000 l    d  .text.truncf	00000000 .text.truncf
00000000 g     F .text.truncf	0000006d truncf

Disassembly of section .text.truncf:

<truncf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f1 77                 zext8	r7
 cf 7f                 cmpi.s8	r7, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x1b
<L0>:
 c4 00 80              ldi16	r4, 0x8000
 88                    and	r6, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x54
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 0b                    mov	r6, r7
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 c2 85                 ldi8	r6, 0x85
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x3d
<L1>:
 c4 80 ff              ldi16	r4, 0xff80
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 21                 asr16v	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 82                    and	r4, r6
 a5                    xor	r5, r5
 08                    mov	r6, r4
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x54
 c2 95                 ldi8	r6, 0x95
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x5b
<L2>:
 c5 7a ff              ldi16	r5, 0xff7a
 1d                    add	r7, r5
 c6 ff ff              ldi16	r6, 0xffff
 06                    mov	r5, r6
 fa 17                 lsr16v	r5, r7
 a6                    xor	r5, r6
 84                    and	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 01                    mov	r4, r5
 06                    mov	r5, r6
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f2 62                 mov32	q0, q2
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 f4 03                 ldsp16	r7, [sp+0x0]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
