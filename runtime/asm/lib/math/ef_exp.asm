
math_ef_exp.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    d  .text.expf	00000000 .text.expf
00000000 g     F .text.expf	00000149 expf

Disassembly of section .text.expf:

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x49
<L0>:
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0xae
<L1>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f2 6a                 mov32	q3, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0xb2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x6f
<L2>:
 f0 04 17 72           ldi16	r0, 0x7217
 f0 05 b1 42           ldi16	r1, 0x42b1
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0xb2
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x95
<L4>:
 c6 b5 f1              ldi16	r6, 0xf1b5
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 c4              cmp32	q3, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0xb2
<L5>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 33              ldi16	r7, 0x33ff
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0xbb
<L6>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0xb0
 ff 0a                 fadd	q2, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x127
<L7>:
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 9f                 lsr16i	r6, 0xf
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f2 42                 sub	r2, r2
 f0 07 00 bf           ldi16	r3, 0xbf00
 f4 a6                 tst8	r6
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0c                 fadd	q3, q0
 ff c2 63              ftos16	r6, q3
 ff c0 60              s16tof	q0, r6
 ff 18                 fsub	q2, q0
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 ce 83                 cmpi.s8	r6, -0x7d
 d3 04                 brslt8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x13f
<L8>:
 fa 57                 lsl16i	r6, 0x7
 c7 00 32              ldi16	r7, 0x3200
 1e                    add	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0xb2
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 aa                    xor	r6, r6
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0xb2
