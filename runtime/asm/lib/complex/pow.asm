
complex_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 pow.c
00000000 l    d  .text.cpowf	00000000 .text.cpowf
00000000 l     F .text.cx_pow_zero	0000027a cx_pow_zero
00000000 l    d  .text.cx_pow_zero	00000000 .text.cx_pow_zero
00000000 g     F .text.cpowf	0000032c cpowf
00000000         *UND*	00000000 clogf
00000000         *UND*	00000000 __mulsc3
00000000         *UND*	00000000 expf
00000000         *UND*	00000000 copysignf
00000000         *UND*	00000000 sincosf
00000000         *UND*	00000000 atan2f
00000000         *UND*	00000000 fabsf
00000000         *UND*	00000000 fmodf

Disassembly of section .text.cpowf:

<cpowf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f4 48                 stsp16	[sp+0x2], r4
 f0 6a 0c              ld32	q0, [r6]
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f9 e1                 or	r7, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 6a 0c              ld32	q0, [r6]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 6a 0a              ld32	q0, [r5]
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x4e
<L0>:
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 f9 a9                 or	r5, r2
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x4e
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 32 02              ldsp16	r2, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x310
 f4 40                 stsp16	[sp+0x0], r4
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0xbe
<L2>:
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0xbe
<L3>:
 c5 80 7f              ldi16	r5, 0x7f80
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f1 29                 mov	r6, r1
 89                    and	r6, r5
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x1bc
<L4>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x1ad
<L5>:
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f2 42                 sub	r2, r2
 f5 1a                 cmp	r3, r2
 fb 54                 cmov.ne	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f1 2e                 mov	r7, r2
 aa                    xor	r6, r6
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x310
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f1 21                 mov	r4, r1
 81                    and	r4, r5
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x133
<L6>:
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x133
<L7>:
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x133
<L8>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x133
<L9>:
 d6 f8                 adjsp	-0x8
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 34              leasp	r4, 0x34
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero
 d6 08                 adjsp	0x8
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x1a4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 14 24              leasp	r4, 0x24
 f0 15 14              leasp	r5, 0x14
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	clogf
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d6 f4                 adjsp	-0xc
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 28              leasp	r4, 0x28
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__mulsc3
 d6 0c                 adjsp	0xc
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f9 19                 or	r0, r6
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x1cd
<L10>:
 f2 63                 mov32	q0, q3
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x310
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x310
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x310
 f1 07                 mov	r0, r7
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x200
<L11>:
 f0 04 80 ff           ldi16	r0, 0xff80
 f9 16                 xor	r0, r5
 f1 0c                 mov	r1, r4
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 f0 32 02              ldsp16	r2, [sp+0x2]
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x26e
<L12>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x30c
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 16 08              leasp	r6, 0x8
 f0 17 38              leasp	r7, 0x38
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f0 32 02              ldsp16	r2, [sp+0x2]
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x295
<L13>:
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x289
<L14>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x289
<L15>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
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
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x28d
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x320
<L16>:
 aa                    xor	r6, r6
 c7 c0 7f              ldi16	r7, 0x7fc0
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x30e
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x310
<L17>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x300
<L18>:
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cpowf
		R_AVM_FAR24	.text.cpowf+0x300
<L19>:
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
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
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x30a
 e3 00 00 00           callf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 04              st32	[r2], q0
 f0 0a 04              addi.s8	r2, 0x4
 f0 6b c4              st32	[r2], q3
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	cpowf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cpowf+0x30e

Disassembly of section .text.cx_pow_zero:

<cx_pow_zero>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f4 60                 stsp16	[sp+0x8], r4
 f0 32 25              ldsp16	r2, [sp+0x25]
 f0 33 27              ldsp16	r3, [sp+0x27]
 f0 34 21              ldsp16	r4, [sp+0x21]
 f0 35 23              ldsp16	r5, [sp+0x23]
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x4a
<L0>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x130
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0xd2
<L1>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmodf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0xf1
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 a0                    xor	r4, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 23                    sub	r4, r7
 ce ff                 cmpi.s8	r6, -0x1
 fb 3c                 cmov.eq	r7, r4
 c2 03                 ldi8	r6, 0x3
 8b                    and	r6, r7
 c1 01                 ldi8	r5, 0x1
 8d                    and	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x10d
<L3>:
 f4 a6                 tst8	r6
 fb 25                 cmov.eq	r4, r5
 ff 0c                 s16tof
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 07                 fneg	q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x136
 f2 6b                 mov32	q3, q1
 ff 07                 fneg	q3
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x130
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 16 0e              leasp	r6, 0xe
 f0 17 12              leasp	r7, 0x12
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sincosf
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x136
 ce 01                 cmpi.s8	r6, 0x1
 fb 25                 cmov.eq	r4, r5
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 02                 mov	r0, r2
 f9 11                 or	r0, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f0 05 80 7f           ldi16	r1, 0x7f80
 ce 01                 cmpi.s8	r6, 0x1
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fb 25                 cmov.eq	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x193
<L4>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x193
<L5>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 05 80 7f           ldi16	r1, 0x7f80
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x1d5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 f9 86                 xor	r4, r1
 06                    mov	r5, r6
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x1cf
<L6>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x1cf
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x1d5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f6 2d                 tst16	r5
 f8 04                 cset.eq	r4
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x220
<L8>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x220
<L9>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x24f
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 36                 xor	r1, r5
 f9 85                 or	r4, r1
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x25b
<L10>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_FAR24	.text.cx_pow_zero+0x25b
<L11>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e3 00 00 00           callf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	cx_pow_zero
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_pow_zero+0x261
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
