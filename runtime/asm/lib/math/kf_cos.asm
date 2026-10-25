
math_kf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_cos.c
00000000 l    d  .text.__kernel_cosf	00000000 .text.__kernel_cosf
00000000 g     F .text.__kernel_cosf	0000011c __kernel_cosf

Disassembly of section .text.__kernel_cosf:

<__kernel_cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 30                 sub	r0, r0
 f0 05 00 32           ldi16	r1, 0x3200
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_FAR24	.text.__kernel_cosf+0x29
<L0>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_cosf+0x115
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 c6 4e d7              ldi16	r6, 0xd74e
 c7 47 ad              ldi16	r7, 0xad47
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 06 f6 74           ldi16	r2, 0x74f6
 f0 07 0f 31           ldi16	r3, 0x310f
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 7c f2           ldi16	r0, 0xf27c
 f0 05 93 b4           ldi16	r1, 0xb493
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 01 0d           ldi16	r2, 0xd01
 f0 07 d0 37           ldi16	r3, 0x37d0
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 61 0b           ldi16	r0, 0xb61
 f0 05 b6 ba           ldi16	r1, 0xbab6
 ff 04                 fadd	q1, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3d           ldi16	r1, 0x3d2a
 ff 0c                 fadd	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 99 99              ldi16	r6, 0x9999
 c7 99 3e              ldi16	r7, 0x3e99
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_FAR24	.text.__kernel_cosf+0xc7
<L1>:
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 26                 fmul	q1, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 ff 16                 fsub	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 ff 0d                 fadd	q3, q1
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_cosf+0x113
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 a0                    xor	r4, r4
 c5 90 3e              ldi16	r5, 0x3e90
 f0 69 c4              cmp32	q3, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 26                 fmul	q1, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 ff 16                 fsub	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 2e                 fmul	q3, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 1c                 fsub	q3, q0
 ff 0d                 fadd	q3, q1
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 ff 1b                 fsub	q2, q3
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
