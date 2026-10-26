
math_sf_sincos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    d  .text.sincosf	00000000 .text.sincosf
00000000 g     F .text.sincosf	00000328 sincosf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sincosf:

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 ff 66                 fabs	q2
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x3c
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x53
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x1a6
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x59
<L2>:
 ff 1f                 fsub	q3, q3
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x1a6
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x156
 f0 04 e3 cb           ldi16	r0, 0xcbe3
 f0 05 16 40           ldi16	r1, 0x4016
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0xab
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 08                 fadd	q2, q0
 f0 04 69 21           ldi16	r0, 0x2169
 f0 05 a2 b3           ldi16	r1, 0xb3a2
 ff 08                 fadd	q2, q0
 f0 01 01              ldi8	r1, 0x1
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 69 c4              cmp32	q3, q1
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x156
 f0 04 00 50           ldi16	r0, 0x5000
 f0 05 c3 47           ldi16	r1, 0x47c3
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x149
<L4>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f2 30                 sub	r0, r0
 f0 05 00 43           ldi16	r1, 0x4300
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1b7
<L5>:
 f0 04 83 f9           ldi16	r0, 0xf983
 f0 05 a2 3f           ldi16	r1, 0x3fa2
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff c3 61              ftou16	r6, q1
 f4 ae                 inc16	r6
 f4 8e                 lsr16.1	r6
 f4 6a                 stsp16	[sp+0xa], r6
 ff c1 60              u16tof	q0, r6
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 21                 fmul	q0, q1
 f2 66                 mov32	q1, q2
 ff 04                 fadd	q1, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 64              fcmp	r6, q1, q0
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x12a
<L6>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 9d                 lsr16i	r6, 0xd
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 f2 66                 mov32	q1, q2
 f2 61                 mov32	q0, q1
 ff 60                 fneg	q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 c0 03                 ldi8	r4, 0x3
 f4 29                 ldsp16	r5, [sp+0xa]
 84                    and	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0xa2
 f0 10 04              leasp	r0, 0x4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 22                 fmul	q0, q2
 f2 69                 mov32	q2, q1
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f2 6b                 mov32	q3, q1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 ff 60                 fneg	q0
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 c0 02                 ldi8	r4, 0x2
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1a6
<L7>:
 ff 60                 fneg	q0
 ff 63                 fneg	q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b c8              st32	[r4], q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 6b 08              st32	[r4], q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x23e
<L8>:
 ff c3 70              ftou16	r7, q0
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 f4 8f                 lsr16.1	r7
 f4 6b                 stsp16	[sp+0xa], r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
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
		R_AVM_FAR24	.text.sincosf+0x309
<L9>:
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2f7
<L10>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 0b                 fadd	q2, q3
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x309
 ff c7 0c              ftou32	q3, q0
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f7 80                 lsr32.1	q0
 ff c5 0c              u32tof	q3, q0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 06 22 aa           ldi16	r2, 0xaa22
 f0 07 fd b9           ldi16	r3, 0xb9fd
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 67                 mov32	q1, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 27                 fmul	q1, q3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 42                 sub	r2, r2
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 ff 2d                 fmul	q3, q1
 ff 0b                 fadd	q2, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 0b                 fadd	q2, q3
 f0 01 03              ldi8	r1, 0x3
 f9 20                 and	r1, r0
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff c8 6b              fcmp	r6, q2, q3
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2bc
<L11>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 0b                 fadd	q2, q3
 f4 a9                 inc16	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x85
<L12>:
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x2ec
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 6b              fcmp	r6, q2, q3
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x2df
<L13>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 0b                 fadd	q2, q3
 f4 b1                 dec16	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x85
<L14>:
 f0 10 04              leasp	r0, 0x4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x14e
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 0b                 fadd	q2, q3
 f4 b2                 dec16	r2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
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
		R_AVM_FAR24	.text.sincosf+0xa0
