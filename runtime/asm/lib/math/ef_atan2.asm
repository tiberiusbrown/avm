
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 g     F .text.atan2f	000006e3 atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x78
<L0>:
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x78
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x82
<L2>:
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xec
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 98                    or	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x133
<L4>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1a6
<L5>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xbf
<L6>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x224
<L7>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 f0 69 48              cmp32	q1, q2
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 08              cmp32	q0, q2
 f8 12                 cset.ult	r2
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x151
<L8>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 08              cmp32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xe5
<L9>:
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x298
 ce 02                 cmpi.s8	r6, 0x2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xe5
<L10>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x39a
<L11>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 80              cmp32	q2, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1c9
<L12>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x24c
<L13>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 16              stsp16	[sp+0x16], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2a0
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x20e
<L14>:
 ce 02                 cmpi.s8	r6, 0x2
 d3 04                 brslt8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x380
<L15>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3f0
<L16>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 3f              ldi16	r5, 0x3f49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x27b
<L17>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 ff 01                 fadd	q0, q1
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f2 63                 mov32	q0, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3c 10              stsp16	[sp+0x10], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2a0
 ce 02                 cmpi.s8	r6, 0x2
 d3 04                 brslt8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x392
<L18>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3fa
<L19>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f7 79                 sub32	q2, q1
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3a4
<L20>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x687
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 ff 32                 fdiv	q0, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 a0                    xor	r4, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2a0
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 10              stsp16	[sp+0x10], r6
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 07                 fadd	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 e1 fe           ldi16	r2, 0xfee1
 f0 07 11 3e           ldi16	r3, 0x3e11
 ff 0d                 fadd	q3, q1
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 aa aa              ldi16	r4, 0xaaaa
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x30f
<L21>:
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2b                 fmul	q2, q3
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 a4                 tst8	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2b                 fmul	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x402
<L22>:
 c4 e4 cb              ldi16	r4, 0xcbe4
 c5 16 40              ldi16	r5, 0x4016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x147
<L23>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3c8
<L24>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc c4                 cmpi.s8	r4, -0x3c
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x687
<L25>:
 f0 69 40              cmp32	q1, q0
 f8 10                 cset.ult	r0
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x40c
<L26>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 3e                 fdiv	q3, q2
 ff 67                 fabs	q3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x447
<L27>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x427
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 bf              ldi16	r5, 0xbf49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 c4 e4 cb              ldi16	r4, 0xcbe4
 c5 16 c0              ldi16	r5, 0xc016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 3b                 fdiv	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x447
<L28>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x490
<L29>:
 ff 0f                 fadd	q3, q3
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x683
<L30>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x66f
 f0 02 01              ldi8	r2, 0x1
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 c8              cmp32	q3, q2
 f8 11                 cset.ult	r1
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4a6
<L31>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x663
<L32>:
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 0c              stsp16	[sp+0xc], r0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x594
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x683
<L33>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x66f
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 12              stsp16	[sp+0x12], r1
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x500
<L34>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x53e
<L35>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 f2 6a                 mov32	q3, q0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x59a
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x575
<L36>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 02                 fadd	q0, q2
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x594
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 ff 3e                 fdiv	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3a 10              stsp16	[sp+0x10], r2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x59a
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3e                 fdiv	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 e1 fe           ldi16	r0, 0xfee1
 f0 05 11 3e           ldi16	r1, 0x3e11
 ff 0c                 fadd	q3, q0
 f0 35 12              ldsp16	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 aa aa           ldi16	r0, 0xaaaa
 f0 05 aa 3e           ldi16	r1, 0x3eaa
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x5fa
<L37>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x65e
 c6 68 21              ldi16	r6, 0x2168
 c7 22 33              ldi16	r7, 0x3322
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f0 04 38 63           ldi16	r0, 0x6338
 f0 05 ed 3e           ldi16	r1, 0x3eed
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 a6                 tst8	r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 1d                 fsub	q3, q1
 ff 13                 fsub	q0, q3
 ff 08                 fadd	q2, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x683
<L38>:
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 0e                 fadd	q3, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x244
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x6a1
<L39>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x6c1
<L40>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x6cb
<L41>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0e                 fadd	q3, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 62                 fneg	q2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe5
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0e                 fadd	q3, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 ff 0e                 fadd	q3, q2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0xe3
