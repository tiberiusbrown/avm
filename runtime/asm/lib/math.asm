
math.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 math.c
00000000 l    d  .text.log2f	00000000 .text.log2f
00000000 l    d  .text.fminf	00000000 .text.fminf
00000000 l    d  .text.fmaxf	00000000 .text.fmaxf
00000000 g     F .text.log2f	0000063d log2f
00000000 g     F .text.fminf	00000085 fminf
00000000 g     F .text.fmaxf	0000007b fmaxf

Disassembly of section .text.log2f:

<log2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x1b
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x41
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 66              fcmp	r6, q1, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x246
<L2>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x5e
<L3>:
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 ff 26                 fmul	q1, q2
 c4 68 ff              ldi16	r4, 0xff68
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x61
 c4 81 ff              ldi16	r4, 0xff81
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 c4 20 fb              ldi16	r4, 0xfb20
 c1 4a                 ldi8	r5, 0x4a
 f7 68                 add32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 80                 ldi8	r4, 0x80
 0d                    mov	r7, r5
 83                    and	r4, r7
 f9 85                 or	r4, r1
 f0 06 00 3f           ldi16	r2, 0x3f00
 f9 45                 or	r2, r1
 c5 80 3f              ldi16	r5, 0x3f80
 f9 a5                 or	r5, r1
 f1 28                 mov	r6, r0
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 1a                 mov	r3, r2
 f1 10                 mov	r2, r0
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f1 0c                 mov	r1, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c4 f3 04              ldi16	r4, 0x4f3
 c5 b5 3f              ldi16	r5, 0x3fb5
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 06 f0 ff           ldi16	r2, 0xfff0
 f0 03 7f              ldi8	r3, 0x7f
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c4 f3 04              ldi16	r4, 0x4f3
 c5 b5 3f              ldi16	r5, 0x3fb5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 80              cmp32	q2, q0
 f8 17                 cset.ult	r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 13                    add	r4, r7
 ff c0 41              s16tof	q1, r4
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x27f
<L4>:
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 3b                 fdiv	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 2a                 fmul	q2, q2
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 0d                 fadd	q3, q1
 f0 06 88 c2           ldi16	r2, 0xc288
 f0 03 35              ldi8	r3, 0x35
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 74                 sub32	q1, q0
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 06 30 5c           ldi16	r2, 0x5c30
 f0 07 cf ff           ldi16	r3, 0xffcf
 f7 64                 add32	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 25 49              ldi16	r6, 0x4925
 c7 92 3e              ldi16	r7, 0x3e92
 ff 03                 fadd	q0, q3
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c6 4f d0              ldi16	r6, 0xd04f
 c7 1c 3e              ldi16	r7, 0x3e1c
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 29 8e              ldi16	r6, 0x8e29
 c7 63 3e              ldi16	r7, 0x3e63
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3e           ldi16	r1, 0x3ecc
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 0b                 fadd	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 ff c0 42              s16tof	q2, r4
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x2b3
<L5>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x2ef
<L6>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 1d                 fsub	q3, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 1c                 fsub	q3, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 28                 fmul	q2, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x38a
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c4              cmp32	q3, q1
 d3 04                 brslt8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x30f
<L7>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x370
<L8>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x3a1
<L9>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 27                 fmul	q1, q3
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x3a4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff c8 6e              fcmp	r6, q3, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x319
<L10>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x390
<L11>:
 ff c0 62              s16tof	q2, r6
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x390
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x378
<L12>:
 f2 6b                 mov32	q3, q1
 ff 1c                 fsub	q3, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 27                 fmul	q1, q3
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 b7              ldi16	r7, 0xb717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 17                 fsub	q1, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 19                 fsub	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x38a
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x38a
 ff 15                 fsub	q1, q1
 ff 36                 fdiv	q1, q2
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x52e
<L13>:
 ff c0 40              s16tof	q0, r4
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 ff 21                 fmul	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 0c                 fadd	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 1c                 fsub	q3, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x390
 ff 05                 fadd	q1, q1
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 ff 09                 fadd	q2, q1
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 81 ff              ldi16	r6, 0xff81
 f4 42                 stsp16	[sp+0x0], r6
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f1 2d                 mov	r7, r1
 9c                    or	r7, r4
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 0f                 mov	r1, r7
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f2 64                 mov32	q1, q0
 f0 04 f0 ff           ldi16	r0, 0xfff0
 f0 01 7f              ldi8	r1, 0x7f
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 a0                    xor	r4, r4
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x538
<L14>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 3b                 fdiv	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 2a                 fmul	q2, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 0d                 fadd	q3, q1
 f0 06 88 c2           ldi16	r2, 0xc288
 f0 03 35              ldi8	r3, 0x35
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 74                 sub32	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 06 30 5c           ldi16	r2, 0x5c30
 f0 07 cf ff           ldi16	r3, 0xffcf
 f7 64                 add32	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 25 49              ldi16	r6, 0x4925
 c7 92 3e              ldi16	r7, 0x3e92
 ff 03                 fadd	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
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
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 0b                 fadd	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 ff c0 42              s16tof	q2, r4
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x568
<L15>:
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x5aa
<L16>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1d                 fsub	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 28                 fmul	q2, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x390
 ff c8 66              fcmp	r6, q1, q2
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x5ca
<L17>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x39a
<L18>:
 ff c0 62              s16tof	q2, r6
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x619
<L19>:
 f2 6b                 mov32	q3, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 1c                 fsub	q3, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 27                 fmul	q1, q3
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 b7              ldi16	r7, 0xb717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 17                 fsub	q1, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 19                 fsub	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f2 68                 mov32	q2, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x635
<L20>:
 ff c0 40              s16tof	q0, r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 ff 21                 fmul	q0, q1
 ff 0c                 fadd	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 18                 fsub	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a
 ff 17                 fsub	q1, q3
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x39a

Disassembly of section .text.fminf:

<fminf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x2f
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x46
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x7a
<L2>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff c8 4c              fcmp	r4, q3, q0
 cc ff                 cmpi.s8	r4, -0x1
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.fmaxf:

<fmaxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x74
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x44
<L1>:
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	fmaxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxf+0x74
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x70
<L2>:
 ff c8 43              fcmp	r4, q0, q3
 cc 01                 cmpi.s8	r4, 0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 e2 00 00 00           jmpf	fmaxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxf+0x74
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
