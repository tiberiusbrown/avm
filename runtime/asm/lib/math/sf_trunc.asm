
math_sf_trunc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_trunc.c
00000000 l    d  .text.truncf	00000000 .text.truncf
00000000 g     F .text.truncf	0000006b truncf

Disassembly of section .text.truncf:

<truncf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 62                 mov32	q0, q2
 f1 29                 mov	r6, r1
 fa 87                 lsr16i	r5, 0x7
 f1 75                 zext8	r5
 cd 7f                 cmpi.s8	r5, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x1d
<L0>:
 c5 00 80              ldi16	r5, 0x8000
 89                    and	r6, r5
 af                    xor	r7, r7
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x4b
 0d                    mov	r7, r5
 cb 81                 addi.s8	r7, -0x7f
 c0 85                 ldi8	r4, 0x85
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x35
<L1>:
 c4 80 ff              ldi16	r4, 0xff80
 fa 23                 asr16v	r4, r7
 82                    and	r4, r6
 af                    xor	r7, r7
 08                    mov	r6, r4
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x4b
 c0 95                 ldi8	r4, 0x95
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x56
<L2>:
 c4 7a ff              ldi16	r4, 0xff7a
 14                    add	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 0c                    mov	r7, r4
 fa 1d                 lsr16v	r7, r5
 ac                    xor	r7, r4
 f9 e0                 and	r7, r0
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
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
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x4f
