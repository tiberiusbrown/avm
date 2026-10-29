
math_ef_tanh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_tanh.c
00000000 l    d  .text.tanhf	00000000 .text.tanhf
00000000 g     F .text.tanhf	000000a1 tanhf
00000000         *UND*	00000000 __avm_expf_noerrno

Disassembly of section .text.tanhf:

<tanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f1 29                 mov	r6, r1
 c7 7f 3f              ldi16	r7, 0x3f7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanhf
		R_AVM_FAR24	.text.tanhf+0x41
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 06 af 50 6f bb 68 99 94 3c 85 13 58 bd 57 62 08 3e 4a aa aa be 00 00 80 3f      fpoly	6, -0.0036516597, 0.0181395561, -0.0527529903, 0.133187637, -0.333330452, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	tanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanhf+0x9a
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanhf
		R_AVM_FAR24	.text.tanhf+0x59
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	tanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanhf+0x9a
 c4 17 41              ldi16	r4, 0x4117
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanhf
		R_AVM_FAR24	.text.tanhf+0x6b
<L2>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	tanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanhf+0x93
 aa                    xor	r6, r6
 c7 00 c0              ldi16	r7, 0xc000
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 e3 00 00 00           callf	tanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 93                    or	r4, r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
