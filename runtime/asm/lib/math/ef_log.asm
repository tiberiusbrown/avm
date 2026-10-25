
math_ef_log.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    d  .text.logf	00000000 .text.logf
00000000 g     F .text.logf	00000302 logf

Disassembly of section .text.logf:

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 66              fcmp	r6, q1, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x24
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 ff           ldi16	r3, 0xff80
 f2 69                 mov32	q2, q1
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c4              cmp32	q3, q1
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x5d
<L1>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x67
<L2>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x6d
<L3>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 27                 fmul	q1, q3
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x70
 ff 15                 fsub	q1, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 37                 fdiv	q1, q3
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 ff 05                 fadd	q1, q1
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 c6 81 ff              ldi16	r6, 0xff81
 f4 62                 stsp16	[sp+0x8], r6
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f1 2d                 mov	r7, r1
 9c                    or	r7, r4
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f1 28                 mov	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 23                 mov	r4, r3
 fa b7                 asr16i	r4, 0x7
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 c4 f0 ff              ldi16	r4, 0xfff0
 c1 7f                 ldi8	r5, 0x7f
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x207
<L4>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 3b                 fdiv	q2, q3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 ff 2a                 fmul	q2, q2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 0d                 fadd	q3, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 04 88 c2           ldi16	r0, 0xc288
 f0 01 35              ldi8	r1, 0x35
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f7 71                 sub32	q0, q1
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 06 30 5c           ldi16	r2, 0x5c30
 f0 07 cf ff           ldi16	r3, 0xffcf
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 64                 add32	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 c6 25 49              ldi16	r6, 0x4925
 c7 92 3e              ldi16	r7, 0x3e92
 ff 07                 fadd	q1, q3
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 04 4f d0           ldi16	r0, 0xd04f
 f0 05 1c 3e           ldi16	r1, 0x3e1c
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 f0 04 29 8e           ldi16	r0, 0x8e29
 f0 05 63 3e           ldi16	r1, 0x3e63
 ff 0c                 fadd	q3, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 cd cc              ldi16	r6, 0xcccd
 c7 cc 3e              ldi16	r7, 0x3ecc
 ff 03                 fadd	q0, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f4 02                 ldsp16	r6, [sp+0x0]
 ff c0 61              s16tof	q1, r6
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x23b
<L5>:
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x27b
<L6>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 08                 fadd	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 22                 fmul	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 37              ldi16	r5, 0x3717
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fadd	q0, q2
 ff 1c                 fsub	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1e                 fsub	q3, q2
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 26                 fmul	q1, q2
 ff 17                 fsub	q1, q3
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 ff c8 43              fcmp	r4, q0, q3
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x29b
<L7>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x1b
<L8>:
 ff c0 41              s16tof	q1, r4
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 37              ldi16	r5, 0x3717
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 26                 fmul	q1, q2
 ff 07                 fadd	q1, q3
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x2e8
<L9>:
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 1b                 fsub	q2, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 22                 fmul	q0, q2
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 b7              ldi16	r5, 0xb717
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 12                 fsub	q0, q2
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 26                 fmul	q1, q2
 ff 14                 fsub	q1, q0
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 08                 fadd	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 22                 fmul	q0, q2
 ff 13                 fsub	q0, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 04                 fadd	q1, q0
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f2 64                 mov32	q1, q0
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x2fc
<L10>:
 ff c0 42              s16tof	q2, r4
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 b7           ldi16	r1, 0xb717
 ff 28                 fmul	q2, q0
 ff 0e                 fadd	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1e                 fsub	q3, q2
 ff 17                 fsub	q1, q3
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
 f2 64                 mov32	q1, q0
 f2 69                 mov32	q2, q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 1b                 fsub	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2e                 fmul	q3, q2
 ff 17                 fsub	q1, q3
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x1b
