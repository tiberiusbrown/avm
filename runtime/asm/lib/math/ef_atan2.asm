
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 g     F .text.atan2f	000007c8 atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x82
<L0>:
 f2 68                 mov32	q2, q0
 ff 66                 fabs	q2
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x82
<L1>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x91
<L2>:
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x10e
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 21                 mov	r4, r1
 fa 7e                 lsr16i	r4, 0xe
 f0 00 02              ldi8	r0, 0x2
 f9 10                 and	r0, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f9 81                 or	r4, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x13f
<L4>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1be
<L5>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xe4
<L6>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x26e
<L7>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
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
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f2 67                 mov32	q1, q3
 f0 69 48              cmp32	q1, q2
 f8 10                 cset.ult	r0
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x161
<L8>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1e3
<L9>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x88
<L10>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x46d
<L11>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 c0           ldi16	r1, 0xc049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 00              stsp16	[sp+0x0], r0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x211
<L12>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x294
<L13>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 16              stsp16	[sp+0x16], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2f9
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x256
<L14>:
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x451
<L15>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4d1
<L16>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 3f           ldi16	r1, 0x3f49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 38 00              stsp16	[sp+0x0], r0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3c 14              stsp16	[sp+0x14], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2f9
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x2d0
<L17>:
 f2 42                 sub	r2, r2
 f0 07 c0 bf           ldi16	r3, 0xbfc0
 f2 63                 mov32	q0, q3
 f2 68                 mov32	q2, q0
 ff 09                 fadd	q2, q1
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 23                 fmul	q0, q3
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 38                 fdiv	q2, q0
 c6 b4 0f              ldi16	r6, 0xfb4
 c7 14 33              ldi16	r7, 0x3314
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 5e 98              ldi16	r6, 0x985e
 c7 7b 3f              ldi16	r7, 0x3f7b
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2ef
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x465
<L18>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4dd
<L19>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f7 71                 sub32	q0, q1
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f1 21                 mov	r4, r1
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x479
<L20>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x765
 f2 63                 mov32	q0, q3
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 ff 32                 fdiv	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 14              stsp16	[sp+0x14], r4
 a0                    xor	r4, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2f9
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 3b                 fdiv	q2, q3
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 aa                    xor	r6, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2f                 fmul	q3, q3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 2f                 fmul	q3, q3
 c4 d7 69              ldi16	r4, 0x69d7
 c5 85 3c              ldi16	r5, 0x3c85
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 59 da              ldi16	r4, 0xda59
 c5 4b 3d              ldi16	r5, 0x3d4b
 ff 02                 fadd	q0, q2
 f0 06 21 a2           ldi16	r2, 0xa221
 f0 07 15 bd           ldi16	r3, 0xbd15
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 f0 06 6b f1           ldi16	r2, 0xf16b
 f0 07 6e bd           ldi16	r3, 0xbd6e
 ff 09                 fadd	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 95 87              ldi16	r4, 0x8795
 c5 9d bd              ldi16	r5, 0xbd9d
 ff 06                 fadd	q1, q2
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 06 35 6b           ldi16	r2, 0x6b35
 f0 07 88 3d           ldi16	r3, 0x3d88
 ff 09                 fadd	q2, q1
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 06 6e 2e           ldi16	r2, 0x2e6e
 f0 07 ba 3d           ldi16	r3, 0x3dba
 ff 09                 fadd	q2, q1
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 12 3e              ldi16	r5, 0x3e12
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 29                 fmul	q2, q1
 f0 06 38 8e           ldi16	r2, 0x8e38
 f0 07 e3 bd           ldi16	r3, 0xbde3
 ff 09                 fadd	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 06                 fadd	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 2c                 fmul	q3, q0
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 ff 0d                 fadd	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3ce
<L21>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0b                 fadd	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 a6                 tst8	r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f2 63                 mov32	q0, q3
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 c6 38 63              ldi16	r6, 0x6338
 c7 ed 3e              ldi16	r7, 0x3eed
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 a6                 tst8	r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0b                 fadd	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1e                 fsub	q3, q2
 ff 13                 fsub	q0, q3
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4e7
<L22>:
 f0 04 e4 cb           ldi16	r0, 0xcbe4
 f0 05 16 40           ldi16	r1, 0x4016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x155
<L23>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x496
<L24>:
 cc c4                 cmpi.s8	r4, -0x3c
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x765
<L25>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 33                 fdiv	q0, q3
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 f2 6a                 mov32	q3, q0
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4f3
<L26>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x765
<L27>:
 ff 0a                 fadd	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x765
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 bf           ldi16	r1, 0xbf49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 04 e4 cb           ldi16	r0, 0xcbe4
 f0 05 16 c0           ldi16	r1, 0xc016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 c8              cmp32	q3, q2
 f8 10                 cset.ult	r0
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x538
<L28>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 f2 67                 mov32	q1, q3
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x28a
<L29>:
 f0 38 00              stsp16	[sp+0x0], r0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x620
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 00              stsp16	[sp+0x0], r0
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x58d
<L30>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x5cd
<L31>:
 f2 67                 mov32	q1, q3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 c2 01                 ldi8	r6, 0x1
 f0 3e 16              stsp16	[sp+0x16], r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x626
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 f2 63                 mov32	q0, q3
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x601
<L32>:
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f2 64                 mov32	q1, q0
 ff 07                 fadd	q1, q3
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 23                 fmul	q0, q3
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 34                 fdiv	q1, q0
 c6 b4 0f              ldi16	r6, 0xfb4
 c7 14 33              ldi16	r7, 0x3314
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 5e 98              ldi16	r6, 0x985e
 c7 7b 3f              ldi16	r7, 0x3f7b
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x620
 f2 67                 mov32	q1, q3
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 14              stsp16	[sp+0x14], r6
 aa                    xor	r6, r6
 f0 3e 16              stsp16	[sp+0x16], r6
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x626
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 25                 fmul	q1, q1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 25                 fmul	q1, q1
 c4 d7 69              ldi16	r4, 0x69d7
 c5 85 3c              ldi16	r5, 0x3c85
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 59 da              ldi16	r4, 0xda59
 c5 4b 3d              ldi16	r5, 0x3d4b
 ff 02                 fadd	q0, q2
 c4 21 a2              ldi16	r4, 0xa221
 c5 15 bd              ldi16	r5, 0xbd15
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 6b f1              ldi16	r4, 0xf16b
 c5 6e bd              ldi16	r5, 0xbd6e
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 95 87              ldi16	r6, 0x8795
 c7 9d bd              ldi16	r7, 0xbd9d
 ff 0b                 fadd	q2, q3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 35 6b           ldi16	r0, 0x6b35
 f0 05 88 3d           ldi16	r1, 0x3d88
 ff 0c                 fadd	q3, q0
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 6e 2e              ldi16	r6, 0x2e6e
 c7 ba 3d              ldi16	r7, 0x3dba
 ff 0b                 fadd	q2, q3
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 12 3e              ldi16	r5, 0x3e12
 ff 02                 fadd	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 2b                 fmul	q2, q3
 c6 38 8e              ldi16	r6, 0x8e38
 c7 e3 bd              ldi16	r7, 0xbde3
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 24                 fmul	q1, q0
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x6ef
<L33>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x75f
 f0 04 68 21           ldi16	r0, 0x2168
 f0 05 22 33           ldi16	r1, 0x3322
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 a6                 tst8	r6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 06 38 63           ldi16	r2, 0x6338
 f0 07 ed 3e           ldi16	r3, 0x3eed
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 a6                 tst8	r6
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 1e                 fsub	q3, q2
 ff 17                 fsub	q1, q3
 ff 01                 fadd	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x782
<L34>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x7a4
<L35>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x7b0
<L36>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 ff 13                 fsub	q0, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 60                 fneg	q0
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x88
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 02                 fadd	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x86
