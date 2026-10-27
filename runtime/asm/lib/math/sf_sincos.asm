
math_sf_sincos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    d  .text.sincosf	00000000 .text.sincosf
00000000 g     F .text.sincosf	00000306 sincosf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sincosf:

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f2 66                 mov32	q1, q2
 ff 09                 fabs	q1
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x37
<L0>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x138
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x192
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x4e
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x192
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x9c
<L3>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f0 01 01              ldi8	r1, 0x1
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x13a
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x131
<L4>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1a3
<L5>:
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 f4 8c                 lsr16.1	r4
 f4 68                 stsp16	[sp+0xa], r4
 ff 0d                 u16tof
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x110
<L6>:
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7d                 lsr16i	r4, 0xd
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 68                 add32	q2, q0
 f0 64 c8              ldp32	q3, [q2]
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 c0 03                 ldi8	r4, 0x3
 f4 29                 ldsp16	r5, [sp+0xa]
 84                    and	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x93
 f0 16 04              leasp	r6, 0x4
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 f2 62                 mov32	q0, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 13                 ldsp16	r7, [sp+0x4]
 83                    and	r4, r7
 f4 a4                 tst8	r4
 f2 69                 mov32	q2, q1
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 ff 04                 fneg	q0
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 c2 02                 ldi8	r6, 0x2
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x192
<L7>:
 ff 04                 fneg	q0
 ff 06                 fneg	q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 6b 08              st32	[r4], q0
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x226
<L8>:
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 68                 stsp16	[sp+0xa], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 68                 add32	q2, q0
 f0 64 c8              ldp32	q3, [q2]
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f0 02 03              ldi8	r2, 0x3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f9 58                 and	r2, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 04 dc 0f           ldi16	r0, 0xfdc
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 c0              cmp32	q3, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2e7
<L9>:
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2d5
<L10>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x2e7
 ff 13                 ftou32
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f7 83                 lsr32.1	q3
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 11                 u32tof
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 ff 02                 fmul
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 ff 00                 fadd
 f0 01 03              ldi8	r1, 0x3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f9 38                 and	r1, r6
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x29c
<L11>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a9                 inc16	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x76
<L12>:
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x2ca
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2be
<L13>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b1                 dec16	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x76
<L14>:
 f0 16 04              leasp	r6, 0x4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x134
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b2                 dec16	r2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x91
