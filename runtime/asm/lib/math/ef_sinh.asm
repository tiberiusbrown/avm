
math_ef_sinh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sinh.c
00000000 l    d  .text.sinhf	00000000 .text.sinhf
00000000 g     F .text.sinhf	000000c8 sinhf
00000000         *UND*	00000000 expf

Disassembly of section .text.sinhf:

<sinhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 0a                 fabs	q2
 f1 15                 mov	r2, r5
 c6 7f 3f              ldi16	r6, 0x3f7f
 f5 2a                 cmp	r6, r2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinhf
		R_AVM_FAR24	.text.sinhf+0x38
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 16 04 08 6e 54 39 f2 81 08 3c b1 aa 2a 3e 00 00 80 3f      fpoly	4, 2.02588853E-4, 0.00833176262, 0.166666761, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinhf+0xc3
 c6 80 7f              ldi16	r6, 0x7f80
 f5 16                 cmp	r2, r6
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinhf
		R_AVM_FAR24	.text.sinhf+0x4d
<L1>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinhf+0xc3
 c7 0f 41              ldi16	r7, 0x410f
 f5 2e                 cmp	r7, r2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinhf
		R_AVM_FAR24	.text.sinhf+0x76
<L2>:
 e3 00 00 00           callf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 e2 00 00 00           jmpf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinhf+0xbd
 f0 06 fd d4           ldi16	r2, 0xd4fd
 f0 07 b2 42           ldi16	r3, 0x42b2
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinhf
		R_AVM_FAR24	.text.sinhf+0x9d
<L3>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 a5                    xor	r5, r5
 c7 80 ff              ldi16	r7, 0xff80
 f0 69 08              cmp32	q0, q2
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 e2 00 00 00           jmpf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinhf+0xc3
 c6 18 72              ldi16	r6, 0x7218
 c7 31 bf              ldi16	r7, 0xbf31
 ff 00                 fadd
 e3 00 00 00           callf	sinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 14                 fcmp
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f6 2e                 tst16	r6
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
