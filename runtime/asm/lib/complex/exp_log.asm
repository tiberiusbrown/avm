
complex_exp_log.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 exp_log.c
00000000 l    d  .text.cexpf	00000000 .text.cexpf
00000000 l    d  .text.clogf	00000000 .text.clogf
00000000 g     F .text.cexpf	00000178 cexpf
00000000         *UND*	00000000 expf
00000000         *UND*	00000000 copysignf
00000000         *UND*	00000000 sincosf
00000000 g     F .text.clogf	00000155 clogf
00000000         *UND*	00000000 fabsf
00000000         *UND*	00000000 log1pf
00000000         *UND*	00000000 logf
00000000         *UND*	00000000 atan2f

Disassembly of section .text.cexpf:

<cexpf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 50                 stsp16	[sp+0x4], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 08              ld32	q0, [r4]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f0 6a 4a              ld32	q1, [r5]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x37
<L0>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f4 13                 ldsp16	r7, [sp+0x4]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 80 7f              ldi16	r4, 0x7f80
 f1 25                 mov	r5, r1
 84                    and	r5, r4
 34                    cmp	r5, r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x68
<L1>:
 c5 80 ff              ldi16	r5, 0xff80
 f9 ae                 xor	r5, r3
 f1 2a                 mov	r6, r2
 99                    or	r6, r5
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0xd1
<L2>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0x24
 f0 16 0a              leasp	r6, 0xa
 f0 17 06              leasp	r7, 0x6
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0xf9
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0xeb
<L4>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0xeb
<L5>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
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
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0xf7
 f9 8e                 xor	r4, r3
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x16e
<L6>:
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0x24
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 f9 c1                 or	r6, r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x24
<L7>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x158
<L8>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cexpf
		R_AVM_FAR24	.text.cexpf+0x158
<L9>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e3 00 00 00           callf	cexpf
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
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0x162
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0x24
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	cexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cexpf+0x24

Disassembly of section .text.clogf:

<clogf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 68                 stsp16	[sp+0xa], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 08              ld32	q0, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f2 66                 mov32	q1, q2
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 c4 00 ff              ldi16	r4, 0xff00
 a4                    xor	r5, r4
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 a8                    xor	r6, r4
 f1 2e                 mov	r7, r2
 9e                    or	r7, r6
 f1 28                 mov	r6, r0
 99                    or	r6, r5
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0x132
<L0>:
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0x132
<L1>:
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 00 ff              ldi16	r4, 0xff00
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0x132
<L2>:
 f1 24                 mov	r5, r0
 f7 8d                 bool	r5
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 99                    or	r6, r5
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0x132
<L3>:
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0xf7
<L4>:
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0xf7
<L5>:
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0xf7
<L6>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 e2 00 00 00           jmpf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.clogf+0x12e
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clogf
		R_AVM_FAR24	.text.clogf+0x132
<L7>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e3 00 00 00           callf	clogf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
