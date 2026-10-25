
math_ef_fmod.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_fmod.c
00000000 l    d  .text.fmodf	00000000 .text.fmodf
00000000 g     F .text.fmodf	0000039c fmodf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3

Disassembly of section .text.fmodf:

<fmodf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 62                 mov32	q0, q2
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x5d
<L0>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 64                 mov32	q1, q0
 ff 65                 fabs	q1
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 84              cmp32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x5d
<L1>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x5d
<L2>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x6a
<L3>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 ff 23                 fmul	q0, q3
 f2 68                 mov32	q2, q0
 ff 3a                 fdiv	q2, q2
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 6b                 mov32	q3, q1
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x8e
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f0 69 c8              cmp32	q3, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xd5
<L5>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f7 69                 add32	q2, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xd5
<L6>:
 ff 13                 fsub	q0, q3
 ff 64                 fabs	q0
 f2 68                 mov32	q2, q0
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x12e
<L7>:
 f1 21                 mov	r4, r1
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x13d
<L8>:
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 72                 lsr16i	r4, 0x2
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 94                    or	r5, r4
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 99                    or	r6, r5
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c6 8a ff              ldi16	r6, 0xff8a
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x17c
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x181
 f1 20                 mov	r4, r0
 f4 8c                 lsr16.1	r4
 f9 81                 or	r4, r0
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c6 7a ff              ldi16	r6, 0xff7a
 28                    sub	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1d7
<L9>:
 03                    mov	r4, r7
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1e5
<L10>:
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 72                 lsr16i	r4, 0x2
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 94                    or	r5, r4
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 99                    or	r6, r5
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c6 8a ff              ldi16	r6, 0xff8a
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x21c
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x227
 02                    mov	r4, r6
 f4 8c                 lsr16.1	r4
 92                    or	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c6 7a ff              ldi16	r6, 0xff7a
 28                    sub	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 32                 ldsp16	r6, [sp+0xc]
 02                    mov	r4, r6
 f4 79                 stsp16	[sp+0xe], r5
 ce 82                 cmpi.s8	r6, -0x7e
 c5 82 ff              ldi16	r5, 0xff82
 c3 7f                 ldi8	r7, 0x7f
 d9 04                 brsge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x261
<L11>:
 f9 3c                 and	r1, r7
 c0 80                 ldi8	r4, 0x80
 f9 31                 or	r1, r4
 f1 10                 mov	r2, r0
 f1 19                 mov	r3, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x27c
<L12>:
 c4 82 ff              ldi16	r4, 0xff82
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x28b
 09                    mov	r6, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 28                    sub	r6, r4
 f2 68                 mov32	q2, q0
 af                    xor	r7, r7
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f2 66                 mov32	q1, q2
 c0 80                 ldi8	r4, 0x80
 ce 82                 cmpi.s8	r6, -0x7e
 d9 04                 brsge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x24d
<L13>:
 f1 04                 mov	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c3 7f                 ldi8	r7, 0x7f
 8d                    and	r7, r5
 f9 e1                 or	r7, r0
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 20                 ldsp16	r4, [sp+0x8]
 32                    cmp	r4, r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2dc
<L14>:
 f2 69                 mov32	q2, q1
 f7 78                 sub32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x330
<L15>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x347
<L16>:
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f2 67                 mov32	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 b6                 dec16	r6
 f7 6a                 add32	q2, q2
 f0 69 84              cmp32	q2, q1
 d9 04                 brsge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2c3
<L17>:
 ce 82                 cmpi.s8	r6, -0x7e
 d9 04                 brsge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x371
<L18>:
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x351
 22                    sub	r4, r6
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x2f5
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f7 65                 add32	q1, q1
 f4 ac                 inc16	r4
 f6 2c                 tst16	r4
 f8 05                 cset.eq	r5
 cd 01                 cmpi.s8	r5, 0x1
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x296
<L19>:
 f4 40                 stsp16	[sp+0x0], r4
 f2 6b                 mov32	q3, q1
 f7 7c                 sub32	q3, q0
 f2 68                 mov32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2e1
<L20>:
 f0 69 48              cmp32	q1, q2
 f2 67                 mov32	q1, q3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2e5
<L21>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 69 80              cmp32	q2, q0
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 82                 cmpi.s8	r6, -0x7e
 d9 04                 brsge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x371
<L22>:
 fa 57                 lsl16i	r6, 0x7
 f0 06 80 3f           ldi16	r2, 0x3f80
 f2 16                 add	r2, r6
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f7 68                 add32	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f1 2d                 mov	r7, r1
 9d                    or	r7, r5
 f9 e9                 or	r7, r2
 07                    mov	r5, r7
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
 c7 82 ff              ldi16	r7, 0xff82
 2e                    sub	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f2 64                 mov32	q1, q0
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
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 04              cmp32	q0, q1
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x63
