
math_ef_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    d  .text.powf	00000000 .text.powf
00000000 l     F .text.avm_pow_boundary	00000787 avm_pow_boundary
00000000 l    d  .text.avm_pow_boundary	00000000 .text.avm_pow_boundary
00000000 g     F .text.powf	00000648 powf
00000000         *UND*	00000000 sqrtf

Disassembly of section .text.powf:

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f2 67                 mov32	q1, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 66                 fabs	q2
 ff 67                 fabs	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x8e
<L0>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f8 10                 cset.ult	r0
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xc3
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xc3
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x105
<L3>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xb9
<L4>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 f2 62                 mov32	q0, q2
 f8 25                 cset.slt	r5
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xfc
<L5>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xb9
<L6>:
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xb9
<L7>:
 ff 0d                 fadd	q3, q1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfa
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xf4
<L8>:
 c6 ff ff              ldi16	r6, 0xffff
 f9 1a                 xor	r0, r6
 c3 40                 ldi8	r7, 0x40
 f4 19                 ldsp16	r5, [sp+0x6]
 8d                    and	r7, r5
 0b                    mov	r6, r7
 fa 96                 lsr16i	r6, 0x6
 f9 c1                 or	r6, r0
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xfc
<L9>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f2 67                 mov32	q1, q3
 f2 69                 mov32	q2, q1
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 3f           ldi16	r1, 0x3f7f
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 d9 04                 brsge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x159
<L10>:
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 f0 69 40              cmp32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1c6
<L11>:
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x183
<L12>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d8
<L13>:
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 40              cmp32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d2
<L14>:
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x183
<L15>:
 ff 2a                 fmul	q2, q2
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1e0
<L16>:
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 63                 add32	q0, q3
 f2 42                 sub	r2, r2
 f0 07 80 01           ldi16	r3, 0x180
 f0 69 40              cmp32	q1, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1e4
<L17>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2cd
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 36                 fdiv	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 02 01              ldi8	r2, 0x1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 4b           ldi16	r1, 0x4b7f
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x206
<L18>:
 f1 1a                 mov	r3, r2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2cd
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x288
<L19>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 77                 lsr16i	r4, 0x7
 c3 86                 ldi8	r7, 0x86
 3c                    cmp	r7, r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x292
<L20>:
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f2 4b                 sub	r3, r3
 f6 2e                 tst16	r6
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2c2
<L21>:
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 2e                    sub	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 00 7f              ldi8	r0, 0x7f
 f0 36 16              ldsp16	r6, [sp+0x16]
 f9 18                 and	r0, r6
 c2 80                 ldi8	r6, 0x80
 f9 c1                 or	r6, r0
 f0 3e 16              stsp16	[sp+0x16], r6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c7 ff ff              ldi16	r7, 0xffff
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 fa 0e                 shl16v	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 ae                    xor	r7, r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2c2
<L22>:
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 fa 1b                 lsr16v	r6, r7
 f0 03 01              ldi8	r3, 0x1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2bd
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2cd
 c3 96                 ldi8	r7, 0x96
 2c                    sub	r7, r4
 c5 ff ff              ldi16	r5, 0xffff
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 a1                    xor	r4, r5
 82                    and	r4, r6
 f2 4b                 sub	r3, r3
 f6 2c                 tst16	r4
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2c2
<L23>:
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 1b                 lsr16v	r6, r7
 f0 03 01              ldi8	r3, 0x1
 f9 cc                 and	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 14              ldsp16	r7, [sp+0x14]
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f8 02                 cset.eq	r2
 f0 3a 10              stsp16	[sp+0x10], r2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ec
<L24>:
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x314
<L25>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 37                 fdiv	q1, q3
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 f2 64                 mov32	q1, q0
 ff 61                 fneg	q1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 f8 26                 cset.slt	r6
 f1 13                 mov	r2, r3
 f9 cd                 or	r6, r3
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x355
<L26>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x35f
<L27>:
 c4 80 bf              ldi16	r4, 0xbf80
 c5 80 3f              ldi16	r5, 0x3f80
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 f1 1c                 mov	r3, r4
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 ff 1a                 fsub	q2, q2
 ff 3a                 fdiv	q2, q2
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 c0 01                 ldi8	r4, 0x1
 c5 80 41              ldi16	r5, 0x4180
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f9 50                 and	r2, r4
 f0 0e 01              cmpi.s8	r2, 0x1
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x3ec
<L28>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 00 7e              ldi16	r7, 0x7e00
 f0 69 c8              cmp32	q3, q2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x3ec
<L29>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 f2 64                 mov32	q1, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff c3 62              ftou16	r6, q2
 c1 01                 ldi8	r5, 0x1
 02                    mov	r4, r6
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f2 61                 mov32	q0, q1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f4 8e                 lsr16.1	r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x454
<L30>:
 f2 69                 mov32	q2, q1
 c3 01                 ldi8	r7, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 8b                    and	r6, r7
 ff 20                 fmul	q0, q0
 ff 28                 fmul	q2, q0
 f4 a6                 tst8	r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f4 8e                 lsr16.1	r6
 f6 2e                 tst16	r6
 f2 66                 mov32	q1, q2
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x3cd
<L31>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x617
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x439
<L32>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 ff ca 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 ff 26                 fmul	q1, q2
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 b8 3f              ldi16	r5, 0x3fb8
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x4fd
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x45a
<L33>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 23                 fmul	q0, q3
 c7 68 ff              ldi16	r7, 0xff68
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x45d
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x617
 c7 81 ff              ldi16	r7, 0xff81
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 62                 add32	q0, q2
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 13                    add	r4, r7
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff c0 40              s16tof	q0, r4
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4d0
<L34>:
 f2 69                 mov32	q2, q1
 ff ca 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x4f1
 f2 69                 mov32	q2, q1
 ff ca 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 26                 fmul	q1, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 c6 00 04              ldi16	r6, 0x400
 c7 00 bd              ldi16	r7, 0xbd00
 f7 6e                 add32	q3, q2
 f0 04 01 06           ldi16	r0, 0x601
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 30                 sub	r0, r0
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5a2
<L35>:
 c6 00 02              ldi16	r6, 0x200
 c7 ea bc              ldi16	r7, 0xbcea
 f7 6b                 add32	q2, q3
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5a2
<L36>:
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 ff c8 46              fcmp	r4, q1, q2
 cc 02                 cmpi.s8	r4, 0x2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x637
<L37>:
 a0                    xor	r4, r4
 c5 16 c3              ldi16	r5, 0xc316
 ff c8 46              fcmp	r4, q1, q2
 cc 01                 cmpi.s8	r4, 0x1
 f2 6a                 mov32	q3, q0
 d9 04                 brsge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x637
<L38>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 c5 00 3f              ldi16	r5, 0x3f00
 c6 00 bf              ldi16	r6, 0xbf00
 cc ff                 cmpi.s8	r4, -0x1
 fb 2e                 cmov.eq	r5, r6
 a0                    xor	r4, r4
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff c2 63              ftos16	r6, q3
 ff c0 62              s16tof	q2, r6
 ff 16                 fsub	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 ce 83                 cmpi.s8	r6, -0x7d
 d9 04                 brsge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x628
<L39>:
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x637
 d6 f8                 adjsp	-0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 24              leasp	r4, 0x24
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary
 d6 08                 adjsp	0x8
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5f9
<L40>:
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 38 b3              ldi16	r5, 0xb338
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c8 6e              fcmp	r6, q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x617
 a0                    xor	r4, r4
 c5 16 c3              ldi16	r5, 0xc316
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x537
<L41>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f8 04                 cset.eq	r4
 f2 66                 mov32	q1, q2
 ff 61                 fneg	q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc
 fa 57                 lsl16i	r6, 0x7
 c7 00 32              ldi16	r7, 0x3200
 1e                    add	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
 f2 67                 mov32	q1, q3
 ff 61                 fneg	q1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xfc

Disassembly of section .text.avm_pow_boundary:

<avm_pow_boundary>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c6                 adjsp	-0x3a
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 34 49              ldsp16	r4, [sp+0x49]
 f0 35 4b              ldsp16	r5, [sp+0x4b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 34 45              ldsp16	r4, [sp+0x45]
 f0 35 47              ldsp16	r5, [sp+0x47]
 f2 62                 mov32	q0, q2
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 69 84              cmp32	q2, q1
 f2 4b                 sub	r3, r3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x102
<L0>:
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x102
<L1>:
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff c0 43              s16tof	q3, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 87                    and	r5, r7
 f2 39                 sub	r1, r1
 f0 04 00 80           ldi16	r0, 0x8000
 f0 69 84              cmp32	q2, q1
 fb 48                 cmov.ne	r1, r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 66                 mov32	q1, q2
 ff 18                 fsub	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 27                 fmul	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 1d                 fsub	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 2c                 fmul	q3, q0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 ff 21                 fmul	q0, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 13                 fsub	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 03                 fadd	q0, q3
 f2 66                 mov32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 26                 fmul	q1, q2
 ff 04                 fadd	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 ff 09                 fadd	q2, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0c                 fadd	q3, q0
 ff 0e                 fadd	q3, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 6b 80              st32	[r0], q2
 ff 19                 fsub	q2, q1
 ff 1e                 fsub	q3, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b c0              st32	[r0], q3
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary+0x780
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x12a
<L2>:
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 22                 fmul	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 f4 40                 stsp16	[sp+0x0], r4
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary+0x132
 c6 81 ff              ldi16	r6, 0xff81
 f4 42                 stsp16	[sp+0x0], r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 c1 80                 ldi8	r5, 0x80
 87                    and	r5, r7
 f9 35                 or	r1, r5
 f1 10                 mov	r2, r0
 f1 19                 mov	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f2 69                 mov32	q2, q1
 ff 08                 fadd	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 19                 fsub	q2, q1
 ff 12                 fsub	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 18                 fsub	q2, q0
 ff 09                 fadd	q2, q1
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 04                 fadd	q1, q0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f4 03                 ldsp16	r7, [sp+0x0]
 1b                    add	r6, r7
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 06                 fadd	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 01                 fadd	q0, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 6a                 mov32	q3, q0
 f2 66                 mov32	q1, q2
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 38                 fdiv	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 62                 mov32	q0, q2
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 26                 fmul	q1, q2
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 ff 2c                 fmul	q3, q0
 ff 1d                 fsub	q3, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1d                 fsub	q3, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 19                 fsub	q2, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 06                 fadd	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 22                 fmul	q0, q2
 ff 03                 fadd	q0, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 2b                 fmul	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 ff 0c                 fadd	q3, q0
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f2 62                 mov32	q0, q2
 ff 11                 fsub	q0, q1
 ff 13                 fsub	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 1e                 fsub	q3, q2
 ff 0c                 fadd	q3, q0
 f2 63                 mov32	q0, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2a                 fmul	q2, q2
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 ff 1e                 fsub	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 29                 fmul	q2, q1
 ff 0e                 fadd	q3, q2
 ff 0b                 fadd	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 33                 fdiv	q0, q3
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 25                 fmul	q1, q1
 ff 06                 fadd	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 28                 fmul	q2, q0
 ff 0a                 fadd	q2, q2
 ff 06                 fadd	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 0d                 fadd	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 ff 2b                 fmul	q2, q3
 f0 06 cd cc           ldi16	r2, 0xcccd
 f0 07 4c be           ldi16	r3, 0xbe4c
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 14                 fsub	q1, q0
 ff 13                 fsub	q0, q3
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c 3e              ldi16	r5, 0x3e4c
 ff 02                 fadd	q0, q2
 ff 04                 fadd	q1, q0
 c5 4c b1              ldi16	r5, 0xb14c
 ff 06                 fadd	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f2 63                 mov32	q0, q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 ff 2e                 fmul	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 28                 fmul	q2, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 27                 fmul	q1, q3
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 32              stsp16	[sp+0x32], r3
 ff 19                 fsub	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 19                 fsub	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0e                 fadd	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 29                 fmul	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2b                 fmul	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0e                 fadd	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f2 69                 mov32	q2, q1
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 0b                 fadd	q2, q3
 ff 16                 fsub	q1, q2
 ff 0d                 fadd	q3, q1
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 ff 2d                 fmul	q3, q1
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 ff 0d                 fadd	q3, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 66                 mov32	q1, q2
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 ff 2c                 fmul	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 ff 21                 fmul	q0, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 ff 13                 fsub	q0, q3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 03                 fadd	q0, q3
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 ff 2d                 fmul	q3, q1
 ff 0c                 fadd	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 23                 fmul	q0, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 ff 26                 fmul	q1, q2
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 ff 0b                 fadd	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 ff 18                 fsub	q2, q0
 ff 1e                 fsub	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 06                 fadd	q1, q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0d                 fadd	q3, q1
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f2 6b                 mov32	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 04                 fadd	q1, q0
 f2 61                 mov32	q0, q1
 ff 13                 fsub	q0, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 ff 0c                 fadd	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a b2           ldi16	r1, 0xb22a
 ff 0c                 fadd	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 18                 fsub	q2, q0
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 16                 fsub	q1, q2
 ff 07                 fadd	q1, q3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 01                 fadd	q0, q1
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f2 6a                 mov32	q3, q0
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 28                 fmul	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 ff 27                 fmul	q1, q3
 ff 16                 fsub	q1, q2
 f2 68                 mov32	q2, q0
 ff 1b                 fsub	q2, q3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 2c                 fmul	q3, q0
 ff 0d                 fadd	q3, q1
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 ff 29                 fmul	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 ff 24                 fmul	q1, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 14                 fsub	q1, q0
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 03                 fadd	q0, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 24                 fmul	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0d                 fadd	q3, q1
 ff 0e                 fadd	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 0b                 fadd	q2, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 1d                 fsub	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 14                 fsub	q1, q0
 f2 62                 mov32	q0, q2
 ff 13                 fsub	q0, q3
 ff 01                 fadd	q0, q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0c                 fadd	q3, q0
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 ff 18                 fsub	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 08                 fadd	q2, q0
 f2 66                 mov32	q1, q2
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 f2 62                 mov32	q0, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 23                 fmul	q0, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f2 6b                 mov32	q3, q1
 f0 06 00 a0           ldi16	r2, 0xa000
 f0 07 38 40           ldi16	r3, 0x4038
 ff 2d                 fmul	q3, q1
 ff 1c                 fsub	q3, q0
 f0 06 00 b0           ldi16	r2, 0xb000
 f0 07 23 3a           ldi16	r3, 0x3a23
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 1d                 fsub	q3, q1
 f0 06 00 a0           ldi16	r2, 0xa000
 f0 07 38 40           ldi16	r3, 0x4038
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 08                 fadd	q2, q0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 04 00 b0           ldi16	r0, 0xb000
 f0 05 23 3a           ldi16	r1, 0x3a23
 ff 2c                 fmul	q3, q0
 c4 60 70              ldi16	r4, 0x7060
 c5 25 33              ldi16	r5, 0x3325
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 62                 mov32	q0, q2
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 21                 fmul	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 0c                 fadd	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 38 40              ldi16	r5, 0x4038
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 34 36              ldsp16	r4, [sp+0x36]
 ff c0 43              s16tof	q3, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 08                 fadd	q2, q0
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 13                 fsub	q0, q3
 f2 64                 mov32	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 17                 fsub	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 07                 fadd	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1c                 fsub	q3, q0
 ff 0d                 fadd	q3, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 18                 fsub	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 12                 fsub	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0c                 fadd	q3, q0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 ff 2b                 fmul	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2d                 fmul	q3, q1
 ff 1e                 fsub	q3, q2
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1d                 fsub	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 22                 fmul	q0, q2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff 26                 fmul	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1e                 fsub	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fadd	q0, q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0e                 fadd	q3, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 ff 04                 fadd	q1, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 68                 mov32	q2, q0
 ff 09                 fadd	q2, q1
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 6b 8c              st32	[r6], q2
 ff 18                 fsub	q2, q0
 ff 16                 fsub	q1, q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 4c              st32	[r6], q1
 d6 3a                 adjsp	0x3a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
