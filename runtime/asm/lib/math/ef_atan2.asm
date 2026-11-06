
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.atan2f	00000273 atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 67                 mov32	q1, q3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x267
<L0>:
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x5c
<L1>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 09                 fabs	q1
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x7e
<L2>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x96
<L3>:
 f0 39 02              stsp16	[sp+0x2], r1
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 48              cmp32	q1, q2
 fb 37                 cmov.eq	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20e
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 49 40              ldi16	r6, 0x4049
 c7 49 c0              ldi16	r7, 0xc049
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23b
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23b
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xa8
<L4>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20e
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xf3
<L5>:
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x137
<L6>:
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x197
<L7>:
 f0 39 02              stsp16	[sp+0x2], r1
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x202
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x167
<L8>:
 f0 39 02              stsp16	[sp+0x2], r1
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1bd
<L9>:
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20c
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1e0
<L10>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x202
 f0 39 02              stsp16	[sp+0x2], r1
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x244
<L11>:
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20c
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x202
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20c
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 c4 00 80              ldi16	r4, 0x8000
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 84                 and	r4, r1
 ff 0b                 fabs	q3
 f2 63                 mov32	q0, q3
 ff 04                 fneg	q0
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x20c
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x23b
