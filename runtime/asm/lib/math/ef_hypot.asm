
math_ef_hypot.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_hypot.c
00000000 l    d  .text.hypotf	00000000 .text.hypotf
00000000 l     F .text.avm_hypot_overflows	00000107 avm_hypot_overflows
00000000 l    d  .text.avm_hypot_overflows	00000000 .text.avm_hypot_overflows
00000000 g     F .text.hypotf	000001d4 hypotf
00000000         *UND*	00000000 sqrtf
00000000         *UND*	00000000 __avm_muldi3
00000000         *UND*	00000000 __avm_lshrdi3

Disassembly of section .text.hypotf:

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 67                 mov32	q1, q3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 65                 fabs	q1
 f2 30                 sub	r0, r0
 f0 05 80 de           ldi16	r1, 0xde80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 67                 fabs	q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 0c              cmp32	q0, q3
 f2 6b                 mov32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x65
<L0>:
 f7 6b                 add32	q2, q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 3b           ldi16	r3, 0x3bff
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x65
<L1>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2f                 fmul	q3, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2a                 fmul	q2, q2
 ff 0b                 fadd	q2, q3
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L2>:
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L3>:
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xbe
<L4>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xbe
<L5>:
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xc6
<L6>:
 f2 61                 mov32	q0, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L7>:
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0xdf
 ff 07                 fadd	q1, q3
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 f2 63                 mov32	q0, q3
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L8>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 6a                 mov32	q3, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 7d                 sub32	q3, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 06           ldi16	r3, 0x6ff
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L9>:
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x173
<L10>:
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 62                 mov32	q0, q2
 c0 04                 ldi8	r4, 0x4
 c5 80 a2              ldi16	r5, 0xa280
 f7 68                 add32	q2, q0
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1a4
<L11>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_hypot_overflows
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x5e
<L12>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 5d              ldi16	r5, 0x5d7f
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1a4
<L13>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1b0
<L14>:
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 a0                    xor	r4, r4
 c5 80 61              ldi16	r5, 0x6180
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x5e

Disassembly of section .text.avm_hypot_overflows:

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f2 63                 mov32	q0, q3
 c2 7f                 ldi8	r6, 0x7f
 86                    and	r5, r6
 c2 80                 ldi8	r6, 0x80
 96                    or	r5, r6
 d6 f8                 adjsp	-0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e3 00 00 00           callf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 0c                    mov	r7, r4
 fa ae                 lsr16i	r7, 0xe
 9e                    or	r7, r6
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f1 21                 mov	r4, r1
 fa 76                 lsr16i	r4, 0x6
 c5 fe 01              ldi16	r5, 0x1fe
 84                    and	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 02                    mov	r4, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 c4 fc 01              ldi16	r4, 0x1fc
 21                    sub	r4, r5
 cc 40                 cmpi.s8	r4, 0x40
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_hypot_overflows
		R_AVM_FAR24	.text.avm_hypot_overflows+0xe8
<L0>:
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f4 60                 stsp16	[sp+0x8], r4
 c0 7f                 ldi8	r4, 0x7f
 f9 8c                 and	r4, r3
 c1 80                 ldi8	r5, 0x80
 91                    or	r4, r5
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 d6 f8                 adjsp	-0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 e3 00 00 00           callf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 fe                 adjsp	-0x2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 96                    or	r5, r6
 f1 05                 mov	r0, r5
 f1 0f                 mov	r1, r7
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 96                    or	r5, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_hypot_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 6c                 add32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 62                 add32	q0, q2
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 a0                    xor	r4, r4
 c5 00 fc              ldi16	r5, 0xfc00
 f0 69 80              cmp32	q2, q0
 f8 15                 cset.ult	r5
 c6 ff ff              ldi16	r6, 0xffff
 c3 03                 ldi8	r7, 0x3
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 f0 69 4c              cmp32	q1, q3
 fb 25                 cmov.eq	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
