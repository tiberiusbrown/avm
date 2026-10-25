
math_ef_log10.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log10.c
00000000 l    d  .text.log10f	00000000 .text.log10f
00000000 g     F .text.log10f	0000038d log10f

Disassembly of section .text.log10f:

<log10f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x24
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 ff           ldi16	r3, 0xff80
 f2 69                 mov32	q2, q1
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x5d
<L1>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x67
<L2>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x6d
<L3>:
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 ff 26                 fmul	q1, q2
 c4 68 ff              ldi16	r4, 0xff68
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x70
 ff 15                 fsub	q1, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff 36                 fdiv	q1, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1b
 ff 05                 fadd	q1, q1
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1b
 c4 81 ff              ldi16	r4, 0xff81
 f4 60                 stsp16	[sp+0x8], r4
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f1 25                 mov	r5, r1
 94                    or	r5, r4
 f1 20                 mov	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 fa b7                 asr16i	r4, 0x7
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 14                    add	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 c6 f0 ff              ldi16	r6, 0xfff0
 c3 7f                 ldi8	r7, 0x7f
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 ff c0 41              s16tof	q1, r4
 c4 db 27              ldi16	r4, 0x27db
 c5 54 35              ldi16	r5, 0x3554
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x234
<L4>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 33                 fdiv	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 ff 20                 fmul	q0, q0
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 ff 20                 fmul	q0, q0
 c6 97 88              ldi16	r6, 0x8897
 c7 17 3e              ldi16	r7, 0x3e17
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 25 33              ldi16	r6, 0x3325
 c7 3a 3e              ldi16	r7, 0x3e3a
 ff 0b                 fadd	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 88 c2              ldi16	r4, 0xc288
 c1 35                 ldi8	r5, 0x35
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c6 30 5c              ldi16	r6, 0x5c30
 c7 cf ff              ldi16	r7, 0xffcf
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2e                 fmul	q3, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 92 3e              ldi16	r5, 0x3e92
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 4f d0              ldi16	r6, 0xd04f
 c7 1c 3e              ldi16	r7, 0x3e1c
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 29 8e              ldi16	r6, 0x8e29
 c7 63 3e              ldi16	r7, 0x3e63
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3e              ldi16	r5, 0x3ecc
 ff 0e                 fadd	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 92                    or	r4, r6
 97                    or	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2e                 fmul	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 22                 fmul	q0, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3f              ldi16	r5, 0x3f2a
 ff 02                 fadd	q0, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 28                 fmul	q2, q0
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 ff c0 43              s16tof	q3, r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x285
<L5>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 ff 2b                 fmul	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x2cc
<L6>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 0c                 fadd	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 23                 fmul	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 23                 fmul	q0, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 03                 fadd	q0, q3
 ff 18                 fsub	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1b                 fsub	q2, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x36f
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x2ea
<L7>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x375
<L8>:
 ff c0 43              s16tof	q3, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 37              ldi16	r5, 0x3717
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2e                 fmul	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 0e                 fadd	q3, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x375
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x359
<L9>:
 f2 68                 mov32	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 22                 fmul	q0, q2
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 b7              ldi16	r5, 0xb717
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 2e                 fmul	q3, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x36d
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 0c                 fadd	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 23                 fmul	q0, q3
 ff 12                 fsub	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x36f
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x351
<L10>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 ff c0 40              s16tof	q0, r4
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 22                 fmul	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 b7              ldi16	r5, 0xb717
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1e                 fsub	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x36f
 f2 6a                 mov32	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 c4 80 20              ldi16	r4, 0x2080
 c5 9a 3e              ldi16	r5, 0x3e9a
 ff 26                 fmul	q1, q2
 c4 d9 5b              ldi16	r4, 0x5bd9
 c5 de 3e              ldi16	r5, 0x3ede
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 ff 04                 fadd	q1, q0
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1b
