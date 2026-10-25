
math_ef_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    d  .text.__ieee754_rem_pio2f	00000000 .text.__ieee754_rem_pio2f
00000000 g     F .text.__ieee754_rem_pio2f	000002b3 __ieee754_rem_pio2f
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.__ieee754_rem_pio2f:

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f1 06                 mov	r0, r6
 f2 66                 mov32	q1, q2
 ff 66                 fabs	q2
 c6 d8 0f              ldi16	r6, 0xfd8
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2a
<L0>:
 f0 6b 40              st32	[r0], q1
 f0 08 04              addi.s8	r0, 0x4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 6b 80              st32	[r0], q2
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2ac
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x76
<L1>:
 c6 f0 ff              ldi16	r6, 0xfff0
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1e1
<L2>:
 c4 80 0f              ldi16	r4, 0xf80
 c5 c9 bf              ldi16	r5, 0xbfc9
 ff 06                 fadd	q1, q2
 c4 d0 0f              ldi16	r4, 0xfd0
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x207
<L3>:
 c4 00 44              ldi16	r4, 0x4400
 c5 35 b7              ldi16	r5, 0xb735
 ff 06                 fadd	q1, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 ae              ldi16	r5, 0xae85
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x20d
 c6 80 0f              ldi16	r6, 0xf80
 c7 49 43              ldi16	r7, 0x4349
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1c6
<L4>:
 c6 84 f9              ldi16	r6, 0xf984
 c7 22 3f              ldi16	r7, 0x3f22
 f0 38 0c              stsp16	[sp+0xc], r0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 03                 fadd	q0, q3
 ff c6 00              ftos32	q0, q0
 f1 28                 mov	r6, r0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 ff c0 03              s16tof	q3, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 04 80 0f           ldi16	r0, 0xf80
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 2c                 fmul	q3, q0
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c6 43 44              ldi16	r6, 0x4443
 c7 35 37              ldi16	r7, 0x3735
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 2c                 fmul	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 ff 13                 fsub	q0, q3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 ff                 ldi8	r6, 0xff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 0f                 mov	r1, r7
 f9 18                 and	r0, r6
 f0 38 04              stsp16	[sp+0x4], r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 6b 0c              st32	[r6], q0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 cc 09                 cmpi.s8	r4, 0x9
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x260
<L5>:
 c6 00 44              ldi16	r6, 0x4400
 c7 35 37              ldi16	r7, 0x3735
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 2b                 fmul	q2, q3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 13                 fsub	q0, q3
 ff 12                 fsub	q0, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 2e              ldi16	r5, 0x2e85
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 ff 18                 fsub	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 ff 12                 fsub	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 c0 ff                 ldi8	r4, 0xff
 88                    and	r6, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 7b                 sub32	q2, q3
 cc 1a                 cmpi.s8	r4, 0x1a
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x252
<L6>:
 c6 00 a3              ldi16	r6, 0xa300
 c7 85 2e              ldi16	r7, 0x2e85
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 2b                 fmul	q2, q3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 13                 fsub	q0, q3
 ff 12                 fsub	q0, q2
 c4 32 31              ldi16	r4, 0x3132
 c5 8d 24              ldi16	r5, 0x248d
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x265
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x224
<L7>:
 f2 69                 mov32	q2, q1
 f1 28                 mov	r6, r0
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 c4 80 0f              ldi16	r4, 0xf80
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 06                 fadd	q1, q2
 c4 d0 0f              ldi16	r4, 0xfd0
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x234
<L8>:
 c4 00 44              ldi16	r4, 0x4400
 c5 35 37              ldi16	r5, 0x3735
 ff 06                 fadd	q1, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 2e              ldi16	r5, 0x2e85
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x23a
 c4 43 44              ldi16	r4, 0x4443
 c5 35 b7              ldi16	r5, 0xb735
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f0 6b c0              st32	[r0], q3
 ff 17                 fsub	q1, q3
 ff 06                 fadd	q1, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2ac
 ff 15                 fsub	q1, q1
 f0 6b 40              st32	[r0], q1
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2ac
 c4 43 44              ldi16	r4, 0x4443
 c5 35 37              ldi16	r5, 0x3735
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f0 6b c0              st32	[r0], q3
 ff 17                 fsub	q1, q3
 ff 06                 fadd	q1, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2ac
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1c                 fsub	q3, q0
 ff 1e                 fsub	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 04                 addi.s8	r4, 0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 6b c8              st32	[r4], q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x294
<L9>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x2ac
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 63                 fneg	q3
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 ff 60                 fneg	q0
 f0 6b 0a              st32	[r5], q0
 a0                    xor	r4, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 22                    sub	r4, r6
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
