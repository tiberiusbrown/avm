
math_ef_atanh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atanh.c
00000000 l    d  .text.atanhf	00000000 .text.atanhf
00000000 g     F .text.atanhf	000000bc atanhf
00000000         *UND*	00000000 log1pf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.atanhf:

<atanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x3e
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 16 05 3a 6b 32 3e 3a 32 07 3e 0e 60 4d 3e 16 aa aa 3e 00 00 80 3f  fpoly	5, 0.174237162, 0.132027537, 0.200561732, 0.333328903, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanhf+0x81
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x56
<L1>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanhf+0x81
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x86
<L2>:
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 e3 00 00 00           callf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 f0 04 00 80           ldi16	r0, 0x8000
 f9 04                 and	r0, r1
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f9 a1                 or	r5, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 02 21              ldi8	r2, 0x21
 f0 03 22              ldi8	r3, 0x22
 f0 69 c8              cmp32	q3, q2
 fb 13                 cmov.eq	r2, r3
 f0 5a 00 00           stm16	[0x0], r2
		R_AVM_DATA16	__avm_errno
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0xb4
<L3>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 f0 69 08              cmp32	q0, q2
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 e2 00 00 00           jmpf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanhf+0x81
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atanhf+0x81
