
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	00000229 tanf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f
00000000         *UND*	00000000 avm_rem_pio2f_medium

Disassembly of section .text.tanf:

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x4b
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1e6
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 27                 fmul	q1, q3
 ff 24                 fmul	q1, q0
 ff 09                 fadd	q2, q1
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e6
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xad
<L2>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x15d
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xa3
<L4>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff 26                 fmul	q1, q2
 ff 01                 fadd	q0, q1
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e6
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xc3
<L5>:
 aa                    xor	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1a3
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x191
<L6>:
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x19c
<L7>:
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c3 61              ftou16	r6, q1
 f4 ae                 inc16	r6
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f4 8e                 lsr16.1	r6
 f4 42                 stsp16	[sp+0x0], r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 13                 fsub	q0, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 13                 fsub	q0, q3
 c2 03                 ldi8	r6, 0x3
 f4 03                 ldsp16	r7, [sp+0x0]
 8b                    and	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x203
<L8>:
 f0 69 c0              cmp32	q3, q0
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1ed
<L9>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x201
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x187
<L10>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff 26                 fmul	q1, q2
 ff 01                 fadd	q0, q1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e6
 f0 16 02              leasp	r6, 0x2
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1a3
 f0 16 02              leasp	r6, 0x2
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_rem_pio2f_medium
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 0a                 ldsp16	r6, [sp+0x2]
 88                    and	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1d8
<L11>:
 f2 61                 mov32	q0, q1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x220
<L12>:
 ff 39                 fdiv	q2, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f2 64                 mov32	q1, q0
 ff 61                 fneg	q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1a5
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
