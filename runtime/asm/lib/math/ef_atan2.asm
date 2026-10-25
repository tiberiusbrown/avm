
math_ef_atan2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    d  .text.atan2f	00000000 .text.atan2f
00000000 g     F .text.atan2f	0000066d atan2f

Disassembly of section .text.atan2f:

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x8e
<L0>:
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x8e
<L1>:
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x9b
<L2>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x128
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 80              cmp32	q2, q0
 fd 16                 cmov.slt	r2, r6
 fd 1f                 cmov.slt	r3, r7
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
 f2 69                 mov32	q2, q1
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 03                    mov	r4, r7
 fa 7e                 lsr16i	r4, 0xe
 c1 02                 ldi8	r5, 0x2
 84                    and	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f1 23                 mov	r4, r3
 fa 7f                 lsr16i	r4, 0xf
 f4 11                 ldsp16	r5, [sp+0x4]
 91                    or	r4, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x14e
<L4>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x1d8
<L5>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0xfe
<L6>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 69 84              cmp32	q2, q1
 f2 66                 mov32	q1, q2
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x28d
<L7>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
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
 f2 67                 mov32	q1, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x170
<L8>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x209
<L9>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 cc 02                 cmpi.s8	r4, 0x2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x92
<L10>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x389
<L11>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 c0           ldi16	r3, 0xc049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x23a
<L12>:
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x2bb
<L13>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x34a
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x273
<L14>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x36d
<L15>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3f3
<L16>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 f2 62                 mov32	q0, q2
 ff 2c                 fmul	q3, q0
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x305
<L17>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 3d                 fdiv	q3, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x31d
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x381
<L18>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3ff
<L19>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f2 69                 mov32	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 78                 sub32	q2, q0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x395
<L20>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3d1
<L21>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x3bf
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x34a
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3d                 fdiv	q3, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 67                 mov32	q1, q3
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 11                 fsub	q0, q1
 ff 1c                 fsub	q3, q0
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x409
<L22>:
 f0 06 e4 cb           ldi16	r2, 0xcbe4
 f0 07 16 40           ldi16	r3, 0x4016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x164
<L23>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 40           ldi16	r3, 0x4049
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x415
<L24>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 cc c4                 cmpi.s8	r4, -0x3c
 f4 20                 ldsp16	r4, [sp+0x8]
 d3 04                 brslt8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x415
<L25>:
 cc 02                 cmpi.s8	r4, 0x2
 d3 04                 brslt8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x3d1
<L26>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x43f
<L27>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x44b
<L28>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 40           ldi16	r3, 0x4049
 ff 17                 fsub	q1, q3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 bf           ldi16	r3, 0xbf49
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f0 06 e4 cb           ldi16	r2, 0xcbe4
 f0 07 16 c0           ldi16	r3, 0xc016
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 f8 10                 cset.ult	r0
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x465
<L29>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 3e                 fdiv	q3, q2
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x49e
<L30>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x47e
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 61                 fneg	q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 06                 fadd	q1, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 ff 06                 fadd	q1, q2
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x92
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 3b                 fdiv	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x49e
<L31>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x4ed
<L32>:
 ff 05                 fadd	q1, q1
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x663
<L33>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x64f
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x505
<L34>:
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x643
<L35>:
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x663
<L36>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x64f
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x663
<L37>:
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x64f
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 84              cmp32	q2, q1
 f0 38 0c              stsp16	[sp+0xc], r0
 d8 04                 bruge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x566
<L38>:
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x5a1
<L39>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f0 04 69 37           ldi16	r0, 0x3769
 f0 05 ac 31           ldi16	r1, 0x31ac
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x5dd
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x5f5
<L40>:
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 61                 mov32	q0, q1
 ff 02                 fadd	q0, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 31                 fdiv	q0, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 06 5e 98           ldi16	r2, 0x985e
 f0 07 7b 3f           ldi16	r3, 0x3f7b
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x611
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f0 04 68 21           ldi16	r0, 0x2168
 f0 05 22 33           ldi16	r1, 0x3322
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x63a
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atan2f
		R_AVM_FAR24	.text.atan2f+0x663
<L41>:
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 06                 fadd	q1, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 19                 fsub	q2, q1
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2a9
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	atan2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atan2f+0x2ad
