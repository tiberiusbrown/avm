
math_ef_log.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    d  .text.logf	00000000 .text.logf
00000000 g     F .text.logf	000000da logf

Disassembly of section .text.logf:

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x2e
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0xbd
<L1>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xb6
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x4d
<L2>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x50
 c6 81 ff              ldi16	r6, 0xff81
 f4 52                 stsp16	[sp+0x4], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 80                 ldi8	r6, 0x80
 8b                    and	r6, r7
 f9 79                 or	r3, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 28                 fmul	q2, q0
 ff c0 63              s16tof	q3, r6
 ff 0b                 fadd	q2, q3
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0xd2
<L3>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xb6
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xb6
