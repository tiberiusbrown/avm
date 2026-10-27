
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	0000027c tanf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f
00000000         *UND*	00000000 avm_rem_pio2f_medium

Disassembly of section .text.tanf:

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x2d
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x93
<L1>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x234
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x7b
<L2>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x15a
<L3>:
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1a6
<L4>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x234
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xbe
<L5>:
 aa                    xor	r6, r6
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e0
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x234
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x19b
<L6>:
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1d9
<L7>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f0 02 03              ldi8	r2, 0x3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 58                 and	r2, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 04 dc 0f           ldi16	r0, 0xfdc
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 c0              cmp32	q3, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x24d
<L8>:
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x23b
<L9>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x24d
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x18f
<L10>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x234
 f0 16 06              leasp	r6, 0x6
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e0
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 03                 fdiv
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x234
 f0 16 06              leasp	r6, 0x6
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_rem_pio2f_medium
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f0 32 06              ldsp16	r2, [sp+0x6]
 f9 50                 and	r2, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x224
<L11>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f2 6a                 mov32	q3, q0
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x273
<L12>:
 ff 03                 fdiv
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b2                 dec16	r2
 f0 3a 00              stsp16	[sp+0x0], r2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1e2
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
