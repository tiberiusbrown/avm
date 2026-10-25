
math_ef_fmod.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_fmod.c
00000000 l    d  .text.fmodf	00000000 .text.fmodf
00000000 g     F .text.fmodf	00000339 fmodf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3

Disassembly of section .text.fmodf:

<fmodf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f2 67                 mov32	q1, q3
 ff 67                 fabs	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x61
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x61
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x61
<L2>:
 f2 66                 mov32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x69
<L3>:
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x332
 ff 29                 fmul	q2, q1
 ff 3a                 fdiv	q2, q2
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x332
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x93
<L4>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x330
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xdf
<L5>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f2 67                 mov32	q1, q3
 f7 64                 add32	q1, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xdf
<L6>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 1e                 fsub	q3, q2
 ff 67                 fabs	q3
 f2 67                 mov32	q1, q3
 ff 61                 fneg	q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x330
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 f0 06 81 ff           ldi16	r2, 0xff81
 f0 07 ff ff           ldi16	r3, 0xffff
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x12f
<L7>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f0 04 82 ff           ldi16	r0, 0xff82
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 f7 65                 add32	q1, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 c4              cmp32	q3, q1
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x116
<L8>:
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x138
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 06 82 ff           ldi16	r2, 0xff82
 f0 07 ff ff           ldi16	r3, 0xffff
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x17b
<L9>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 09                    mov	r6, r5
 fa 58                 lsl16i	r6, 0x8
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 f2 69                 mov32	q2, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 69                 add32	q2, q1
 f7 6f                 add32	q3, q3
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x16a
<L10>:
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x188
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 02                    mov	r4, r6
 a5                    xor	r5, r5
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 0c              cmp32	q0, q3
 f0 02 7f              ldi8	r2, 0x7f
 f0 03 80              ldi8	r3, 0x80
 d9 04                 brsge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1c8
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a8                 and	r5, r2
 f9 ad                 or	r5, r3
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1e7
<L12>:
 f7 7e                 sub32	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x1f2
 f7 7c                 sub32	q3, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1ba
<L13>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 c2 7f                 ldi8	r6, 0x7f
 89                    and	r6, r5
 c1 80                 ldi8	r5, 0x80
 99                    or	r6, r5
 06                    mov	r5, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x251
<L14>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 78                 sub32	q2, q0
 f0 69 8c              cmp32	q2, q3
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2bf
<L15>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2ce
<L16>:
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 6d                 add32	q3, q1
 f7 6a                 add32	q2, q2
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x240
<L17>:
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x2d2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x27c
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f7 65                 add32	q1, q1
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x205
<L18>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f2 69                 mov32	q2, q1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 78                 sub32	q2, q0
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x261
<L19>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 4c              cmp32	q1, q3
 f2 66                 mov32	q1, q2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x267
<L20>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x332
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x32c
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 04 82 ff           ldi16	r0, 0xff82
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x307
<L21>:
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 63                 add32	q0, q3
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 1f                 mov	r3, r7
 f9 65                 or	r3, r1
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f7 6b                 add32	q2, q3
 f9 ad                 or	r5, r3
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x332
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 73                 sub32	q0, q3
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
