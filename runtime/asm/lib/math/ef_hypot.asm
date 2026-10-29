
math_ef_hypot.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_hypot.c
00000000 l    d  .text.hypotf	00000000 .text.hypotf
00000000 l     F .text.avm_hypot_overflows	000002bd avm_hypot_overflows
00000000 l    d  .text.avm_hypot_overflows	00000000 .text.avm_hypot_overflows
00000000 g     F .text.hypotf	00000216 hypotf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.hypotf:

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 80 de              ldi16	r5, 0xde80
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 09                 fabs	q1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 66                 add32	q1, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 04              cmp32	q0, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 3b           ldi16	r3, 0x3bff
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x65
<L0>:
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x65
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L2>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L3>:
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xc2
<L4>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xc2
<L5>:
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xca
<L6>:
 f2 64                 mov32	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L7>:
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0xe1
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 f2 67                 mov32	q1, q3
 f2 68                 mov32	q2, q0
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L8>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f7 7c                 sub32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 06           ldi16	r1, 0x6ff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L9>:
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x17f
<L10>:
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
 c2 04                 ldi8	r6, 0x4
 c7 80 a2              ldi16	r7, 0xa280
 f7 6e                 add32	q3, q2
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1ba
<L11>:
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x208
<L12>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 5d              ldi16	r7, 0x5d7f
 f2 68                 mov32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1ba
<L13>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1dc
<L14>:
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 02                 fmul
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L15>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 02                 fmul
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e

Disassembly of section .text.avm_hypot_overflows:

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3d 16              stsp16	[sp+0x16], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 fa 77                 lsr16i	r4, 0x7
 c3 fe                 ldi8	r7, 0xfe
 2c                    sub	r7, r4
 cf 0c                 cmpi.s8	r7, 0xc
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0x291
<L0>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f3 12                 mulu8.w	r4, r6
 04                    mov	r5, r4
 08                    mov	r6, r4
 fa 87                 lsr16i	r5, 0x7
 f0 05 fe 01           ldi16	r1, 0x1fe
 f9 a4                 and	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 10                 mulu8.w	r4, r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 00 fd              ldi8	r0, 0xfd
 f0 3f 1e              stsp16	[sp+0x1e], r7
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 1d                    add	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 02 7f              ldi8	r2, 0x7f
 f9 88                 and	r4, r2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 88                 and	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 04                    mov	r5, r4
 f3 15                 mulu8.w	r5, r5
 f0 3d 22              stsp16	[sp+0x22], r5
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 69                 stsp16	[sp+0xa], r5
 c1 80                 ldi8	r5, 0x80
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 91                    or	r4, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 99                    or	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0e                    mov	r7, r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f3 1c                 mulu8.w	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 02                    mov	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 11                 mulu8.w	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 18                 mulu8.w	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 79                 stsp16	[sp+0xe], r5
 f3 15                 mulu8.w	r5, r5
 0d                    mov	r7, r5
 09                    mov	r6, r5
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 78                 lsr16i	r4, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 11                 mulu8.w	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f9 c0                 and	r6, r0
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 08                    mov	r6, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 1c                    add	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 30                 mul8	r4, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 10                 mulu8.w	r4, r4
 04                    mov	r5, r4
 f9 a0                 and	r5, r0
 f4 51                 stsp16	[sp+0x4], r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 10                    add	r4, r4
 f9 84                 and	r4, r1
 12                    add	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 fa 78                 lsr16i	r4, 0x8
 f0 35 20              ldsp16	r5, [sp+0x20]
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 87                 lsr16i	r5, 0x7
 f9 a4                 and	r5, r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 3a                 mul8	r6, r6
 19                    add	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1a                 mulu8.w	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 c6 00 07              ldi16	r6, 0x700
 04                    mov	r5, r4
 86                    and	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 16                    add	r5, r6
 f4 41                 stsp16	[sp+0x0], r5
 f1 74                 zext8	r4
 f0 05 00 3f           ldi16	r1, 0x3f00
 f9 a4                 and	r5, r1
 94                    or	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 12                    add	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f3 1a                 mulu8.w	r6, r6
 c7 00 07              ldi16	r7, 0x700
 8c                    and	r7, r4
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f9 3c                 and	r1, r7
 f1 74                 zext8	r4
 f9 85                 or	r4, r1
 15                    add	r5, r5
 15                    add	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 58                 lsl16i	r6, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 f1 77                 zext8	r7
 9e                    or	r7, r6
 fa 9e                 lsr16i	r6, 0xe
 99                    or	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 35 18              ldsp16	r5, [sp+0x18]
 fa 48                 lsl16i	r5, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 8e                 lsr16i	r5, 0xe
 97                    or	r5, r7
 f4 71                 stsp16	[sp+0xc], r5
 10                    add	r4, r4
 10                    add	r4, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 fa 48                 lsl16i	r5, 0x8
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f1 77                 zext8	r7
 9d                    or	r7, r5
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 38                 lsl16i	r4, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 09                    mov	r6, r5
 98                    or	r6, r4
 fa 7e                 lsr16i	r4, 0xe
 93                    or	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f4 03                 ldsp16	r7, [sp+0x0]
 fa ae                 lsr16i	r7, 0xe
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 7e                 lsr16i	r4, 0xe
 f4 68                 stsp16	[sp+0xa], r4
 ce 08                 cmpi.s8	r6, 0x8
 1a                    add	r6, r6
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0x1ee
<L1>:
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 ca f0                 addi.s8	r6, -0x10
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 18              stsp16	[sp+0x18], r4
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows+0x207
 f0 34 22              ldsp16	r4, [sp+0x22]
 f9 80                 and	r4, r0
 f0 35 18              ldsp16	r5, [sp+0x18]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 c1 0f                 ldi8	r5, 0xf
 84                    and	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 03                    mov	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 10                    add	r4, r4
 fa 01                 shl16v	r4, r5
 c1 0e                 ldi8	r5, 0xe
 86                    and	r5, r6
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 1d                 lsr16v	r7, r5
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 11                 lsr16v	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 10                    add	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 02                 shl16v	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 92                    or	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 fa 19                 lsr16v	r6, r5
 10                    add	r4, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 01                 shl16v	r4, r5
 92                    or	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 34                    cmp	r5, r4
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 14                 mov	r2, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 14                 lsr16v	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f1 05                 mov	r0, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 05                 add	r0, r5
 f0 0c 03              cmpi.s8	r0, 0x3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0x296
<L2>:
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0x2a2
<L3>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows+0x29b
 f0 0c 04              cmpi.s8	r0, 0x4
 f8 1c                 cset.uge	r4
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 00 fc              ldi16	r4, 0xfc00
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0x2b6
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows+0x29b
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows+0x29b
