
math_sf_sincos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    d  .text.sincosf	00000000 .text.sincosf
00000000 g     F .text.sincosf	0000029e sincosf
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sincosf:

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f2 66                 mov32	q1, q2
 ff 09                 fabs	q1
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x35
<L0>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x4c
<L1>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x291
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x56
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x291
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 14              stsp16	[sp+0x14], r0
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x22b
 aa                    xor	r6, r6
 c7 00 43              ldi16	r7, 0x4300
 f0 69 c4              cmp32	q3, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 12              stsp16	[sp+0x12], r1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x6f
<L3>:
 ff 1d                 frempio2
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x229
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x115
<L4>:
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x120
<L5>:
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 48                 stsp16	[sp+0x2], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 0e                    mov	r7, r6
 09                    mov	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 6b                 add32	q2, q3
 f0 64 c8              ldp32	q3, [q2]
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 c2 03                 ldi8	r6, 0x3
 f4 0b                 ldsp16	r7, [sp+0x2]
 8b                    and	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x208
<L6>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1f2
<L7>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x206
 f0 16 00              leasp	r6, 0x0
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x22b
 ff 13                 ftou32
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f7 83                 lsr32.1	q3
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 11                 u32tof
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 ff 02                 fmul
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 00                 fadd
 f0 02 03              ldi8	r2, 0x3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 58                 and	r2, r6
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x192
<L8>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 aa                 inc16	r2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1e3
<L9>:
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x1c0
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1b4
<L10>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b2                 dec16	r2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x1e3
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x224
 f0 16 00              leasp	r6, 0x0
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x22b
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 b6                 dec16	r6
 f4 4a                 stsp16	[sp+0x2], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 2b                    sub	r6, r7
 fd 37                 cmov.slt	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f2 64                 mov32	q1, q0
 ff 05                 fneg	q1
 f4 a4                 tst8	r4
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f0 00 02              ldi8	r0, 0x2
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 06                 fneg	q2
 f4 a0                 tst8	r0
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f2 6b                 mov32	q3, q1
 ff 07                 fneg	q3
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 6b 82              st32	[r1], q2
 f0 6b c0              st32	[r0], q3
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
