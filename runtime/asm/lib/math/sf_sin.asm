
math_sf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sin.c
00000000 l    d  .text.sinf	00000000 .text.sinf
00000000 l     F .text.avm_sin_reduced	00000318 avm_sin_reduced
00000000 l    d  .text.avm_sin_reduced	00000000 .text.avm_sin_reduced
00000000 g     F .text.sinf	000000d6 sinf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sinf:

<sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x47
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0xd1
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0xd1
 f0 04 e3 cb           ldi16	r0, 0xcbe3
 f0 05 16 40           ldi16	r1, 0x4016
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x8f
<L2>:
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 0c                 fadd	q3, q0
 f0 04 69 21           ldi16	r0, 0x2169
 f0 05 a2 b3           ldi16	r1, 0xb3a2
 ff 0c                 fadd	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f0 07 80 39           ldi16	r3, 0x3980
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x97
<L3>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0xb4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 ff 67                 fabs	q3
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_sin_reduced:

<avm_sin_reduced>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x2a
<L0>:
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x296
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0xe6
<L1>:
 f2 42                 sub	r2, r2
 f0 07 00 43           ldi16	r3, 0x4300
 f0 69 4c              cmp32	q1, q3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0xf1
<L2>:
 f0 06 83 f9           ldi16	r2, 0xf983
 f0 07 a2 3f           ldi16	r3, 0x3fa2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 2d                 fmul	q3, q1
 ff c3 63              ftou16	r6, q3
 f4 ae                 inc16	r6
 f4 8e                 lsr16.1	r6
 f4 4a                 stsp16	[sp+0x2], r6
 ff c1 63              u16tof	q3, r6
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 2d                 fmul	q3, q1
 f2 66                 mov32	q1, q2
 ff 07                 fadd	q1, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 67              fcmp	r6, q1, q3
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0xa7
<L3>:
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 9d                 lsr16i	r6, 0xd
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 17                 mov	r2, r7
 f1 1e                 mov	r3, r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 f2 66                 mov32	q1, q2
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 c2 03                 ldi8	r6, 0x3
 f4 0b                 ldsp16	r7, [sp+0x2]
 8e                    and	r7, r6
 aa                    xor	r6, r6
 2b                    sub	r6, r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 fd 37                 cmov.slt	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x296
 f0 16 00              leasp	r6, 0x0
 e3 00 00 00           callf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x296
 c4 83 f9              ldi16	r4, 0xf983
 c5 a2 3f              ldi16	r5, 0x3fa2
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 a0                    xor	r4, r4
 c5 80 44              ldi16	r5, 0x4480
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x178
<L4>:
 ff c3 51              ftou16	r5, q1
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 f4 8d                 lsr16.1	r5
 f4 49                 stsp16	[sp+0x2], r5
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 ff 1e                 fsub	q3, q2
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 ff 1e                 fsub	q3, q2
 c0 03                 ldi8	r4, 0x3
 f4 09                 ldsp16	r5, [sp+0x2]
 81                    and	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f2 67                 mov32	q1, q3
 c6 dc 0f              ldi16	r6, 0xfdc
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x26d
<L5>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x257
<L6>:
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 bf              ldi16	r5, 0xbfc9
 ff 06                 fadd	q1, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 06                 fadd	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x26b
 ff c7 09              ftou32	q2, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f7 81                 lsr32.1	q1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 ff c5 09              u32tof	q2, q1
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 22 aa              ldi16	r4, 0xaa22
 c5 fd b9              ldi16	r5, 0xb9fd
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 ff 29                 fmul	q2, q1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 2b                 fmul	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 0e                 fadd	q3, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 0e                 fadd	q3, q2
 f0 03 03              ldi8	r3, 0x3
 f0 34 12              ldsp16	r4, [sp+0x12]
 f9 70                 and	r3, r4
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 3f              ldi16	r5, 0x3f49
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x203
<L7>:
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 bf              ldi16	r5, 0xbfc9
 ff 0e                 fadd	q3, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 0e                 fadd	q3, q2
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 4e              fcmp	r4, q3, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x248
<L8>:
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x233
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 bf              ldi16	r5, 0xbf49
 ff c8 4e              fcmp	r4, q3, q2
 cc ff                 cmpi.s8	r4, -0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x226
<L9>:
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 0e                 fadd	q3, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 ff 0e                 fadd	q3, q2
 f4 b3                 dec16	r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 4e              fcmp	r4, q3, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x248
<L10>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3b 0a              stsp16	[sp+0xa], r3
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x27d
 f0 16 00              leasp	r6, 0x0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e3 00 00 00           callf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x296
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 06                 fadd	q1, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 ff 06                 fadd	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 b4                 dec16	r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 69 c4              cmp32	q3, q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 aa                    xor	r6, r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 2b                    sub	r6, r7
 fd 37                 cmov.slt	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c2 01                 ldi8	r6, 0x1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x2d7
<L11>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x301
<L12>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x301
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_FAR24	.text.avm_sin_reduced+0x2ec
<L13>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	avm_sin_reduced
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sin_reduced+0x301
 ff 2a                 fmul	q2, q2
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 c2 02                 ldi8	r6, 0x2
 f9 58                 and	r2, r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f4 a2                 tst8	r2
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
