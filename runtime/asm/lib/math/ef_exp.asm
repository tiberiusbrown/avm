
math_ef_exp.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    d  .text.expf	00000000 .text.expf
00000000 g     F .text.expf	0000020e expf

Disassembly of section .text.expf:

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x28
<L0>:
 ff 0a                 fadd	q2, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x4a
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 f0 06 17 72           ldi16	r2, 0x7217
 f0 07 b1 42           ldi16	r3, 0x42b1
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x205
<L2>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x81
<L3>:
 f0 06 b5 f1           ldi16	r2, 0xf1b5
 f0 07 cf 42           ldi16	r3, 0x42cf
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x81
<L4>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 f0 06 19 72           ldi16	r2, 0x7219
 f0 07 b1 3e           ldi16	r3, 0x3eb1
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0xf2
<L5>:
 f0 06 91 15           ldi16	r2, 0x1591
 f0 07 85 3f           ldi16	r3, 0x3f85
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x10d
<L6>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 c6 80 71              ldi16	r6, 0x7180
 c7 31 bf              ldi16	r7, 0xbf31
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x162
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 33              ldi16	r7, 0x33ff
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x176
<L7>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c7 00 3f              ldi16	r7, 0x3f00
 f2 42                 sub	r2, r2
 f0 07 00 bf           ldi16	r3, 0xbf00
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 1e                 mov	r3, r6
 f0 69 04              cmp32	q0, q1
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 04 3b aa           ldi16	r0, 0xaa3b
 f0 05 b8 3f           ldi16	r1, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff c2 61              ftos16	r6, q1
 f4 62                 stsp16	[sp+0x8], r6
 ff c0 63              s16tof	q3, r6
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 2c                 fmul	q3, q0
 ff 1b                 fsub	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 1d                 fsub	q3, q1
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x17f
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 05 4c bb 31 33 0e ea dd b5 55 b3 8a 38 61 0b 36 bb ab aa 2a 3e  fpoly	5, 4.13813694E-8, -1.6533902E-6, 6.61375597E-5, -0.00277777785, 0.166666672
 ff 22                 fmul	q0, q2
 f2 67                 mov32	q1, q3
 ff 14                 fsub	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x1dd
<L8>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 1d                 fsub	q3, q1
 ff 33                 fdiv	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1c                 fsub	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 23                 ldsp16	r7, [sp+0x8]
 cf 83                 cmpi.s8	r7, -0x7d
 d9 04                 brsge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	expf
		R_AVM_FAR24	.text.expf+0x1f5
<L9>:
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 f2 68                 mov32	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 ff 04                 fadd	q1, q0
 ff 39                 fdiv	q2, q1
 ff 1e                 fsub	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 0e                 fadd	q3, q2
 e2 00 00 00           jmpf	expf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.expf+0x205
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
