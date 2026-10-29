
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 g     F .text.atan2f	00000265 atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x73
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x73
<L1>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x7d
<L2>:
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xa4
<L3>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xba
<L4>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20f
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23d
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 49 40              ldi16	r7, 0x4049
 f0 05 49 c0           ldi16	r1, 0xc049
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 c6 db 0f              ldi16	r6, 0xfdb
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23d
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23d
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x20f
<L5>:
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x112
<L6>:
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x150
<L7>:
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1a6
<L8>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x205
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x17b
<L9>:
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1c7
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20f
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1e8
<L11>:
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x205
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x244
<L12>:
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20f
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x205
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20f
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f0 04 00 80           ldi16	r0, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fabs	q2
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20f
