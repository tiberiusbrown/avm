
complex_hyperbolic.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 hyperbolic.c
00000000 l    d  .text.csinhf	00000000 .text.csinhf
00000000 l    d  .text.ccoshf	00000000 .text.ccoshf
00000000 l    d  .text.ctanhf	00000000 .text.ctanhf
00000000 g     F .text.csinhf	000001d4 csinhf
00000000         *UND*	00000000 sinhf
00000000         *UND*	00000000 sincosf
00000000         *UND*	00000000 fabsf
00000000         *UND*	00000000 copysignf
00000000         *UND*	00000000 expf
00000000         *UND*	00000000 coshf
00000000 g     F .text.ccoshf	00000242 ccoshf
00000000 g     F .text.ctanhf	00000193 ctanhf
00000000         *UND*	00000000 tanhf
00000000         *UND*	00000000 sinf
00000000         *UND*	00000000 cosf

Disassembly of section .text.csinhf:

<csinhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 0c                    mov	r7, r4
 0b                    mov	r6, r7
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f0 6a 0a              ld32	q0, [r5]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x32
<L0>:
 f2 68                 mov32	q2, q0
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinhf
 f1 2d                 mov	r7, r1
 f1 28                 mov	r6, r0
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x15c
 c4 80 7f              ldi16	r4, 0x7f80
 f1 27                 mov	r5, r3
 84                    and	r5, r4
 34                    cmp	r5, r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x6a
<L1>:
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 f9 a1                 or	r5, r0
 f2 42                 sub	r2, r2
 f0 07 c0 7f           ldi16	r3, 0x7fc0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x15c
<L2>:
 f4 81                 lsl16.1	r1
 c5 00 ff              ldi16	r5, 0xff00
 f9 a6                 xor	r5, r1
 f9 15                 or	r0, r5
 c5 c0 7f              ldi16	r5, 0x7fc0
 f6 28                 tst16	r0
 fb 2c                 cmov.eq	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x15c
 f4 43                 stsp16	[sp+0x0], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 08              leasp	r6, 0x8
 f0 17 04              leasp	r7, 0x4
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 ff 14                 fcmp
 f2 68                 mov32	q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x10d
<L3>:
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 18 72              ldi16	r6, 0x7218
 c7 31 bf              ldi16	r7, 0xbf31
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 f9 c1                 or	r6, r0
 f6 2e                 tst16	r6
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x13f
<L4>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x12d
<L5>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x12d
<L6>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x137
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinhf
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	coshf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x158
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x16c
<L7>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 6b 0e              st32	[r7], q0
 cb 04                 addi.s8	r7, 0x4
 f0 6b 4e              st32	[r7], q1
 02                    mov	r4, r6
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x1c4
<L8>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csinhf
		R_AVM_FAR24	.text.csinhf+0x1c4
<L9>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x158
 e3 00 00 00           callf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	csinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csinhf+0x158

Disassembly of section .text.ccoshf:

<ccoshf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f1 0c                 mov	r1, r4
 f1 01                 mov	r0, r1
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f0 6a 8a              ld32	q2, [r5]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x7e
<L0>:
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 12              stsp16	[sp+0x12], r0
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 f9 19                 or	r0, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	coshf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 00 ff              ldi16	r4, 0xff00
 f5 20                 cmp	r4, r0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x236
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinhf
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0xaa
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0xae
 c7 80 7f              ldi16	r7, 0x7f80
 f1 2b                 mov	r6, r3
 8b                    and	r6, r7
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0xce
<L3>:
 15                    add	r5, r5
 f1 17                 mov	r2, r7
 c7 00 ff              ldi16	r7, 0xff00
 ad                    xor	r7, r5
 9c                    or	r7, r4
 c6 c0 7f              ldi16	r6, 0x7fc0
 f6 2f                 tst16	r7
 0e                    mov	r7, r6
 fb 3a                 cmov.eq	r7, r2
 94                    or	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 fb 34                 cmov.eq	r6, r4
 06                    mov	r5, r6
 f1 1f                 mov	r3, r7
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0xbc
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 42              st32	[r1], q1
 f0 09 04              addi.s8	r1, 0x4
 f0 6b 82              st32	[r1], q2
 f1 20                 mov	r4, r0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 14 0c              leasp	r4, 0xc
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 08              leasp	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 13                 ldsp16	r7, [sp+0x4]
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x173
<L4>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 18 72              ldi16	r6, 0x7218
 c7 31 bf              ldi16	r7, 0xbf31
 ff 00                 fadd
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f6 2e                 tst16	r6
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x1a3
<L5>:
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x193
<L6>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x193
<L7>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0x19b
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	coshf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinhf
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0xbc
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 f9 c1                 or	r6, r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x228
<L8>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x218
<L9>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ccoshf
		R_AVM_FAR24	.text.ccoshf+0x218
<L10>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0x220
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0xbc
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 e2 00 00 00           jmpf	ccoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ccoshf+0xb0

Disassembly of section .text.ctanhf:

<ctanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 0c                    mov	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f0 6a 0a              ld32	q0, [r5]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x2f
<L0>:
 f2 68                 mov32	q2, q0
 f1 07                 mov	r0, r7
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	tanhf
 f1 2c                 mov	r7, r0
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ctanhf+0x8a
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a4                    xor	r5, r4
 f1 20                 mov	r4, r0
 91                    or	r4, r5
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x9c
<L1>:
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 c4 80 7f              ldi16	r4, 0x7f80
 f1 27                 mov	r5, r3
 84                    and	r5, r4
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x7e
<L2>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinf
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	cosf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 c8 04                 addi.s8	r4, 0x4
 f0 6b 48              st32	[r4], q1
 03                    mov	r4, r7
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c5 80 7f              ldi16	r5, 0x7f80
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f1 29                 mov	r6, r1
 89                    and	r6, r5
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x11c
<L3>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x11c
<L4>:
 f4 4b                 stsp16	[sp+0x2], r7
 f0 16 10              leasp	r6, 0x10
 f0 17 0c              leasp	r7, 0xc
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 20 41              ldi16	r7, 0x4120
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctanhf
		R_AVM_FAR24	.text.ctanhf+0x135
<L5>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 61                 mov32	q0, q1
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 00 c0              ldi16	r7, 0xc000
 ff 02                 fmul
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 e2 00 00 00           jmpf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ctanhf+0x86
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f2 42                 sub	r2, r2
 f0 07 c0 7f           ldi16	r3, 0x7fc0
 f6 2c                 tst16	r4
 f2 69                 mov32	q2, q1
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ctanhf+0x8a
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sinhf
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	coshf
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 03                 fdiv
 e2 00 00 00           jmpf	ctanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ctanhf+0x86
