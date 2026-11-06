
builtins_complex.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 complex.c
00000000 l    d  .text.__mulsc3	00000000 .text.__mulsc3
00000000 l    d  .text.__divsc3	00000000 .text.__divsc3
00000000 l    d  .text.__muldc3	00000000 .text.__muldc3
00000000 l    d  .text.__divdc3	00000000 .text.__divdc3
00000000 l    d  .text.__mulxc3	00000000 .text.__mulxc3
00000000 l    d  .text.__divxc3	00000000 .text.__divxc3
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__mulsc3	000003f9 __mulsc3
00000000 g     F .text.__divsc3	0000081d __divsc3
00000000 g     F .text.__muldc3	000003f9 __muldc3
00000000 g     F .text.__divdc3	0000081d __divdc3
00000000 g     F .text.__mulxc3	000003f9 __mulxc3
00000000 g     F .text.__divxc3	0000081d __divxc3

Disassembly of section .text.__mulsc3:

<__mulsc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c7 00 ff              ldi16	r7, 0xff00
 f0 36 18              ldsp16	r6, [sp+0x18]
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x28b
<L0>:
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x28b
<L1>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 94                    or	r5, r4
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x15e
<L2>:
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ff 0d                 u16tof
 aa                    xor	r6, r6
 f1 2d                 mov	r7, r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c7 00 80              ldi16	r7, 0x8000
 f9 7c                 and	r3, r7
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f5 1e                 cmp	r3, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0e                 mov	r1, r6
 f1 07                 mov	r0, r7
 c7 00 ff              ldi16	r7, 0xff00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 32                    cmp	r4, r6
 02                    mov	r4, r6
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 3e                    cmp	r7, r6
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x170
<L3>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulsc3+0x170
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 f1 0f                 mov	r1, r7
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f0 00 01              ldi8	r0, 0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x1b4
<L4>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x1b4
<L5>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x2aa
<L6>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulsc3+0x235
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 10                    add	r4, r4
 f9 86                 xor	r4, r1
 98                    or	r6, r4
 c4 00 80              ldi16	r4, 0x8000
 8c                    and	r7, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f9 80                 and	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 78                 and	r3, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 f5 1f                 cmp	r3, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0f                 mov	r1, r7
 f1 06                 mov	r0, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 82                    and	r4, r6
 33                    cmp	r4, r7
 03                    mov	r4, r7
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2f                 mov	r7, r3
 1f                    add	r7, r7
 9d                    or	r7, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x3d4
<L7>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 02                 fmul
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 8e              st32	[r7], q2
 cb 04                 addi.s8	r7, 0x4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 6b 8e              st32	[r7], q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f1 21                 mov	r4, r1
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f4 81                 lsl16.1	r1
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f1 0c                 mov	r1, r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1f                    add	r7, r7
 ac                    xor	r7, r4
 9b                    or	r6, r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 28                 tst16	r0
 c3 01                 ldi8	r7, 0x1
 f8 06                 cset.eq	r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f6 28                 tst16	r0
 f1 07                 mov	r0, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x319
<L8>:
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x319
<L9>:
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x319
<L10>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x28e
<L11>:
 f0 04 00 80           ldi16	r0, 0x8000
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f2 6b                 mov32	q3, q1
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 21                 mov	r4, r1
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 c4 00 80              ldi16	r4, 0x8000
 fb 6c                 cmov.ne	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f7 8d                 bool	r5
 03                    mov	r4, r7
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 a0                    xor	r4, r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 00 ff              ldi16	r5, 0xff00
 f0 34 22              ldsp16	r4, [sp+0x22]
 34                    cmp	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f1 22                 mov	r4, r2
 f7 8c                 bool	r4
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 fc 16                 cmov.ult	r2, r6
 fc 1f                 cmov.ult	r3, r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 15                 cmp	r2, r5
 fc 06                 cmov.ult	r0, r6
 fc 0c                 cmov.ult	r1, r4
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_FAR24	.text.__mulsc3+0x3e7
<L12>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulsc3+0x23b
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulsc3+0x235
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 a5                    xor	r5, r5
 f5 0d                 cmp	r1, r5
 fb 6c                 cmov.ne	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	__mulsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulsc3+0x3c6

Disassembly of section .text.__divsc3:

<__divsc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 35              ldsp16	r6, [sp+0x35]
 f0 37 37              ldsp16	r7, [sp+0x37]
 f0 32 31              ldsp16	r2, [sp+0x31]
 f0 33 33              ldsp16	r3, [sp+0x33]
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 c5 80 7f              ldi16	r5, 0x7f80
 03                    mov	r4, r7
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f1 27                 mov	r5, r3
 f2 67                 mov32	q1, q3
 c6 80 7f              ldi16	r6, 0x7f80
 86                    and	r5, r6
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 f8 04                 cset.eq	r4
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 e0                 and	r7, r0
 f5 2c                 cmp	r7, r0
 c2 01                 ldi8	r6, 0x1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x9a
<L0>:
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x9a
<L1>:
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x9a
<L2>:
 f4 10                 ldsp16	r4, [sp+0x4]
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x9a
<L3>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x266
<L4>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x266
<L5>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 06 00 ff           ldi16	r2, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f5 14                 cmp	r2, r4
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x804
<L6>:
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x804
<L7>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x17a
<L8>:
 f1 2e                 mov	r7, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f1 17                 mov	r2, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x17a
<L9>:
 08                    mov	r6, r4
 f7 8e                 bool	r6
 0d                    mov	r7, r5
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x433
<L10>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 8e                 bool	r6
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x433
<L11>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f6 2f                 tst16	r7
 f8 07                 cset.eq	r7
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 1d                 mov	r3, r5
 81                    and	r4, r5
 f5 23                 cmp	r4, r3
 f8 06                 cset.eq	r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 f9 8c                 and	r4, r3
 f5 23                 cmp	r4, r3
 f0 02 01              ldi8	r2, 0x1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x327
<L12>:
 f4 10                 ldsp16	r4, [sp+0x4]
 9c                    or	r7, r4
 f9 e8                 and	r7, r2
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x327
<L13>:
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x327
<L14>:
 f1 2e                 mov	r7, r2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f6 2a                 tst16	r2
 f8 06                 cset.eq	r6
 8b                    and	r6, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 42                 sub	r2, r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f5 1a                 cmp	r3, r2
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 f4 81                 lsl16.1	r1
 c4 00 ff              ldi16	r4, 0xff00
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f5 2a                 cmp	r6, r2
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x425
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 09                 fabs	q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0b                 fabs	q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 08                 fabs	q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 0a                 fabs	q2
 f0 69 4c              cmp32	q1, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 08              cmp32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f4 53                 stsp16	[sp+0x4], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x2ee
<L15>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x2ee
<L16>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 69 ff              ldi16	r5, 0xff69
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x45a
<L17>:
 f4 a6                 tst8	r6
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x460
<L18>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c7 69 ff              ldi16	r7, 0xff69
 1c                    add	r7, r4
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x460
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 c7 00 ff              ldi16	r7, 0xff00
 a3                    xor	r4, r7
 06                    mov	r5, r6
 94                    or	r5, r4
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 03                 cset.eq	r3
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 15                 mov	r2, r5
 81                    and	r4, r5
 f5 22                 cmp	r4, r2
 f8 07                 cset.eq	r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 f9 88                 and	r4, r2
 f5 22                 cmp	r4, r2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x804
<L19>:
 c0 01                 ldi8	r4, 0x1
 f1 14                 mov	r2, r4
 8c                    and	r7, r4
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x804
<L20>:
 f9 cd                 or	r6, r3
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x808
<L21>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f6 28                 tst16	r0
 f8 06                 cset.eq	r6
 f9 c8                 and	r6, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f0 37 16              ldsp16	r7, [sp+0x16]
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 cc                 and	r6, r3
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 72                 xor	r3, r4
 f9 4d                 or	r2, r3
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 66                 mov32	q1, q2
 ff 06                 fneg	q2
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x808
 f2 66                 mov32	q1, q2
 c4 00 80              ldi16	r4, 0x8000
 f0 37 16              ldsp16	r7, [sp+0x16]
 83                    and	r4, r7
 a5                    xor	r5, r5
 c6 80 ff              ldi16	r6, 0xff80
 31                    cmp	r4, r5
 c4 80 7f              ldi16	r4, 0x7f80
 fb 66                 cmov.ne	r4, r6
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x808
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 c3                 addi.s8	r4, -0x3d
 cc 87                 cmpi.s8	r4, -0x79
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x4f0
<L22>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 ca c3                 addi.s8	r6, -0x3d
 c7 86 ff              ldi16	r7, 0xff86
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x4f0
<L23>:
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 03                 fdiv
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x808
 af                    xor	r7, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 f0 06 7d 01           ldi16	r2, 0x17d
 d3 04                 brslt8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x54c
<L24>:
 f4 43                 stsp16	[sp+0x0], r7
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x511
<L25>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f0 02 fe              ldi8	r2, 0xfe
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x536
<L26>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x5a4
 ce 7f                 cmpi.s8	r6, 0x7f
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x5ae
<L27>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 03 7f              ldi8	r3, 0x7f
 f2 4e                 sub	r3, r6
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f1 23                 mov	r4, r3
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 7e                 addi.s8	r6, 0x7e
 f0 0b 81              addi.s8	r3, -0x7f
 f5 1a                 cmp	r3, r2
 f4 62                 stsp16	[sp+0x8], r6
 f1 1e                 mov	r3, r6
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x56c
<L28>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 2a                 cmp	r6, r2
 ca 7e                 addi.s8	r6, 0x7e
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x592
<L29>:
 f2 66                 mov32	q1, q2
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x5b3
 f2 66                 mov32	q1, q2
 c1 7f                 ldi8	r5, 0x7f
 26                    sub	r5, r6
 fa 67                 lsl16i	r7, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 1c                    add	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 fa 47                 lsl16i	r5, 0x7
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 0c                    mov	r7, r4
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 af                    xor	r7, r7
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 d3 04                 brslt8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x633
<L30>:
 f4 63                 stsp16	[sp+0x8], r7
 c3 7f                 ldi8	r7, 0x7f
 2e                    sub	r7, r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 04 7d 01           ldi16	r0, 0x17d
 f4 43                 stsp16	[sp+0x0], r7
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 03                 ldsp16	r7, [sp+0x0]
 f5 07                 cmp	r0, r7
 cb 81                 addi.s8	r7, -0x7f
 d9 04                 brsge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x5f2
<L31>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 07 00 7f           ldi16	r3, 0x7f00
 f0 00 fe              ldi8	r0, 0xfe
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x61d
<L32>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x68f
 ce 7f                 cmpi.s8	r6, 0x7f
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d9 04                 brsge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x695
<L33>:
 f4 63                 stsp16	[sp+0x8], r7
 f0 01 7f              ldi8	r1, 0x7f
 f2 3e                 sub	r1, r6
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f1 29                 mov	r6, r1
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 7e                 addi.s8	r6, 0x7e
 f0 09 81              addi.s8	r1, -0x7f
 f5 08                 cmp	r1, r0
 f4 42                 stsp16	[sp+0x0], r6
 f1 0e                 mov	r1, r6
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x655
<L34>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x67d
<L35>:
 f4 23                 ldsp16	r7, [sp+0x8]
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x6a0
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 37                 lsl16i	r4, 0x7
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 36 20              ldsp16	r6, [sp+0x20]
 f4 13                 ldsp16	r7, [sp+0x4]
 2e                    sub	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 12                 ldsp16	r6, [sp+0x4]
 f2 62                 mov32	q0, q2
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 f0 02 fe              ldi8	r2, 0xfe
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x736
<L36>:
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 14                 cmp	r2, r4
 c8 81                 addi.s8	r4, -0x7f
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x71e
<L37>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x762
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x760
<L38>:
 02                    mov	r4, r6
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f4 40                 stsp16	[sp+0x0], r4
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 22                 cmp	r4, r2
 c8 7e                 addi.s8	r4, 0x7e
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x748
<L39>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x762
 f4 42                 stsp16	[sp+0x0], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 47                 lsl16i	r5, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d9 04                 brsge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x7c8
<L40>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 00 fe              ldi8	r0, 0xfe
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x7b0
<L41>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x7f7
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x7f3
<L42>:
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divsc3
		R_AVM_FAR24	.text.__divsc3+0x7dd
<L43>:
 e2 00 00 00           jmpf	__divsc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divsc3+0x7f7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__muldc3:

<__muldc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c7 00 ff              ldi16	r7, 0xff00
 f0 36 18              ldsp16	r6, [sp+0x18]
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x28b
<L0>:
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x28b
<L1>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 94                    or	r5, r4
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x15e
<L2>:
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ff 0d                 u16tof
 aa                    xor	r6, r6
 f1 2d                 mov	r7, r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c7 00 80              ldi16	r7, 0x8000
 f9 7c                 and	r3, r7
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f5 1e                 cmp	r3, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0e                 mov	r1, r6
 f1 07                 mov	r0, r7
 c7 00 ff              ldi16	r7, 0xff00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 32                    cmp	r4, r6
 02                    mov	r4, r6
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 3e                    cmp	r7, r6
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x170
<L3>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	__muldc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__muldc3+0x170
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 f1 0f                 mov	r1, r7
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f0 00 01              ldi8	r0, 0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x1b4
<L4>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x1b4
<L5>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x2aa
<L6>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	__muldc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__muldc3+0x235
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 10                    add	r4, r4
 f9 86                 xor	r4, r1
 98                    or	r6, r4
 c4 00 80              ldi16	r4, 0x8000
 8c                    and	r7, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f9 80                 and	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 78                 and	r3, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 f5 1f                 cmp	r3, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0f                 mov	r1, r7
 f1 06                 mov	r0, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 82                    and	r4, r6
 33                    cmp	r4, r7
 03                    mov	r4, r7
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2f                 mov	r7, r3
 1f                    add	r7, r7
 9d                    or	r7, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x3d4
<L7>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 02                 fmul
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 8e              st32	[r7], q2
 cb 04                 addi.s8	r7, 0x4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 6b 8e              st32	[r7], q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f1 21                 mov	r4, r1
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f4 81                 lsl16.1	r1
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f1 0c                 mov	r1, r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1f                    add	r7, r7
 ac                    xor	r7, r4
 9b                    or	r6, r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 28                 tst16	r0
 c3 01                 ldi8	r7, 0x1
 f8 06                 cset.eq	r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f6 28                 tst16	r0
 f1 07                 mov	r0, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x319
<L8>:
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x319
<L9>:
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x319
<L10>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x28e
<L11>:
 f0 04 00 80           ldi16	r0, 0x8000
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f2 6b                 mov32	q3, q1
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 21                 mov	r4, r1
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 c4 00 80              ldi16	r4, 0x8000
 fb 6c                 cmov.ne	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f7 8d                 bool	r5
 03                    mov	r4, r7
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 a0                    xor	r4, r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 00 ff              ldi16	r5, 0xff00
 f0 34 22              ldsp16	r4, [sp+0x22]
 34                    cmp	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f1 22                 mov	r4, r2
 f7 8c                 bool	r4
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 fc 16                 cmov.ult	r2, r6
 fc 1f                 cmov.ult	r3, r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 15                 cmp	r2, r5
 fc 06                 cmov.ult	r0, r6
 fc 0c                 cmov.ult	r1, r4
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__muldc3
		R_AVM_FAR24	.text.__muldc3+0x3e7
<L12>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	__muldc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__muldc3+0x23b
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__muldc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__muldc3+0x235
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 a5                    xor	r5, r5
 f5 0d                 cmp	r1, r5
 fb 6c                 cmov.ne	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	__muldc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__muldc3+0x3c6

Disassembly of section .text.__divdc3:

<__divdc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 35              ldsp16	r6, [sp+0x35]
 f0 37 37              ldsp16	r7, [sp+0x37]
 f0 32 31              ldsp16	r2, [sp+0x31]
 f0 33 33              ldsp16	r3, [sp+0x33]
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 c5 80 7f              ldi16	r5, 0x7f80
 03                    mov	r4, r7
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f1 27                 mov	r5, r3
 f2 67                 mov32	q1, q3
 c6 80 7f              ldi16	r6, 0x7f80
 86                    and	r5, r6
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 f8 04                 cset.eq	r4
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 e0                 and	r7, r0
 f5 2c                 cmp	r7, r0
 c2 01                 ldi8	r6, 0x1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x9a
<L0>:
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x9a
<L1>:
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x9a
<L2>:
 f4 10                 ldsp16	r4, [sp+0x4]
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x9a
<L3>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x266
<L4>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x266
<L5>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 06 00 ff           ldi16	r2, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f5 14                 cmp	r2, r4
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x804
<L6>:
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x804
<L7>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x17a
<L8>:
 f1 2e                 mov	r7, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f1 17                 mov	r2, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x17a
<L9>:
 08                    mov	r6, r4
 f7 8e                 bool	r6
 0d                    mov	r7, r5
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x433
<L10>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 8e                 bool	r6
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x433
<L11>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f6 2f                 tst16	r7
 f8 07                 cset.eq	r7
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 1d                 mov	r3, r5
 81                    and	r4, r5
 f5 23                 cmp	r4, r3
 f8 06                 cset.eq	r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 f9 8c                 and	r4, r3
 f5 23                 cmp	r4, r3
 f0 02 01              ldi8	r2, 0x1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x327
<L12>:
 f4 10                 ldsp16	r4, [sp+0x4]
 9c                    or	r7, r4
 f9 e8                 and	r7, r2
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x327
<L13>:
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x327
<L14>:
 f1 2e                 mov	r7, r2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f6 2a                 tst16	r2
 f8 06                 cset.eq	r6
 8b                    and	r6, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 42                 sub	r2, r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f5 1a                 cmp	r3, r2
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 f4 81                 lsl16.1	r1
 c4 00 ff              ldi16	r4, 0xff00
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f5 2a                 cmp	r6, r2
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x425
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 09                 fabs	q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0b                 fabs	q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 08                 fabs	q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 0a                 fabs	q2
 f0 69 4c              cmp32	q1, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 08              cmp32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f4 53                 stsp16	[sp+0x4], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x2ee
<L15>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x2ee
<L16>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 69 ff              ldi16	r5, 0xff69
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x45a
<L17>:
 f4 a6                 tst8	r6
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x460
<L18>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c7 69 ff              ldi16	r7, 0xff69
 1c                    add	r7, r4
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x460
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 c7 00 ff              ldi16	r7, 0xff00
 a3                    xor	r4, r7
 06                    mov	r5, r6
 94                    or	r5, r4
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 03                 cset.eq	r3
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 15                 mov	r2, r5
 81                    and	r4, r5
 f5 22                 cmp	r4, r2
 f8 07                 cset.eq	r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 f9 88                 and	r4, r2
 f5 22                 cmp	r4, r2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x804
<L19>:
 c0 01                 ldi8	r4, 0x1
 f1 14                 mov	r2, r4
 8c                    and	r7, r4
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x804
<L20>:
 f9 cd                 or	r6, r3
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x808
<L21>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f6 28                 tst16	r0
 f8 06                 cset.eq	r6
 f9 c8                 and	r6, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f0 37 16              ldsp16	r7, [sp+0x16]
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 cc                 and	r6, r3
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 72                 xor	r3, r4
 f9 4d                 or	r2, r3
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 66                 mov32	q1, q2
 ff 06                 fneg	q2
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x808
 f2 66                 mov32	q1, q2
 c4 00 80              ldi16	r4, 0x8000
 f0 37 16              ldsp16	r7, [sp+0x16]
 83                    and	r4, r7
 a5                    xor	r5, r5
 c6 80 ff              ldi16	r6, 0xff80
 31                    cmp	r4, r5
 c4 80 7f              ldi16	r4, 0x7f80
 fb 66                 cmov.ne	r4, r6
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x808
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 c3                 addi.s8	r4, -0x3d
 cc 87                 cmpi.s8	r4, -0x79
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x4f0
<L22>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 ca c3                 addi.s8	r6, -0x3d
 c7 86 ff              ldi16	r7, 0xff86
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x4f0
<L23>:
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 03                 fdiv
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x808
 af                    xor	r7, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 f0 06 7d 01           ldi16	r2, 0x17d
 d3 04                 brslt8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x54c
<L24>:
 f4 43                 stsp16	[sp+0x0], r7
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x511
<L25>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f0 02 fe              ldi8	r2, 0xfe
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x536
<L26>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x5a4
 ce 7f                 cmpi.s8	r6, 0x7f
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x5ae
<L27>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 03 7f              ldi8	r3, 0x7f
 f2 4e                 sub	r3, r6
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f1 23                 mov	r4, r3
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 7e                 addi.s8	r6, 0x7e
 f0 0b 81              addi.s8	r3, -0x7f
 f5 1a                 cmp	r3, r2
 f4 62                 stsp16	[sp+0x8], r6
 f1 1e                 mov	r3, r6
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x56c
<L28>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 2a                 cmp	r6, r2
 ca 7e                 addi.s8	r6, 0x7e
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x592
<L29>:
 f2 66                 mov32	q1, q2
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x5b3
 f2 66                 mov32	q1, q2
 c1 7f                 ldi8	r5, 0x7f
 26                    sub	r5, r6
 fa 67                 lsl16i	r7, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 1c                    add	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 fa 47                 lsl16i	r5, 0x7
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 0c                    mov	r7, r4
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 af                    xor	r7, r7
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 d3 04                 brslt8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x633
<L30>:
 f4 63                 stsp16	[sp+0x8], r7
 c3 7f                 ldi8	r7, 0x7f
 2e                    sub	r7, r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 04 7d 01           ldi16	r0, 0x17d
 f4 43                 stsp16	[sp+0x0], r7
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 03                 ldsp16	r7, [sp+0x0]
 f5 07                 cmp	r0, r7
 cb 81                 addi.s8	r7, -0x7f
 d9 04                 brsge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x5f2
<L31>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 07 00 7f           ldi16	r3, 0x7f00
 f0 00 fe              ldi8	r0, 0xfe
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x61d
<L32>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x68f
 ce 7f                 cmpi.s8	r6, 0x7f
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d9 04                 brsge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x695
<L33>:
 f4 63                 stsp16	[sp+0x8], r7
 f0 01 7f              ldi8	r1, 0x7f
 f2 3e                 sub	r1, r6
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f1 29                 mov	r6, r1
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 7e                 addi.s8	r6, 0x7e
 f0 09 81              addi.s8	r1, -0x7f
 f5 08                 cmp	r1, r0
 f4 42                 stsp16	[sp+0x0], r6
 f1 0e                 mov	r1, r6
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x655
<L34>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x67d
<L35>:
 f4 23                 ldsp16	r7, [sp+0x8]
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x6a0
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 37                 lsl16i	r4, 0x7
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 36 20              ldsp16	r6, [sp+0x20]
 f4 13                 ldsp16	r7, [sp+0x4]
 2e                    sub	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 12                 ldsp16	r6, [sp+0x4]
 f2 62                 mov32	q0, q2
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 f0 02 fe              ldi8	r2, 0xfe
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x736
<L36>:
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 14                 cmp	r2, r4
 c8 81                 addi.s8	r4, -0x7f
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x71e
<L37>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x762
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x760
<L38>:
 02                    mov	r4, r6
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f4 40                 stsp16	[sp+0x0], r4
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 22                 cmp	r4, r2
 c8 7e                 addi.s8	r4, 0x7e
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x748
<L39>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x762
 f4 42                 stsp16	[sp+0x0], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 47                 lsl16i	r5, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d9 04                 brsge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x7c8
<L40>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 00 fe              ldi8	r0, 0xfe
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x7b0
<L41>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x7f7
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x7f3
<L42>:
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divdc3
		R_AVM_FAR24	.text.__divdc3+0x7dd
<L43>:
 e2 00 00 00           jmpf	__divdc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divdc3+0x7f7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__mulxc3:

<__mulxc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c7 00 ff              ldi16	r7, 0xff00
 f0 36 18              ldsp16	r6, [sp+0x18]
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x28b
<L0>:
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x28b
<L1>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 94                    or	r5, r4
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x15e
<L2>:
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ff 0d                 u16tof
 aa                    xor	r6, r6
 f1 2d                 mov	r7, r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c7 00 80              ldi16	r7, 0x8000
 f9 7c                 and	r3, r7
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f5 1e                 cmp	r3, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0e                 mov	r1, r6
 f1 07                 mov	r0, r7
 c7 00 ff              ldi16	r7, 0xff00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 32                    cmp	r4, r6
 02                    mov	r4, r6
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 3e                    cmp	r7, r6
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x170
<L3>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulxc3+0x170
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 f1 0f                 mov	r1, r7
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f0 00 01              ldi8	r0, 0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x1b4
<L4>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x1b4
<L5>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x2aa
<L6>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulxc3+0x235
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 10                    add	r4, r4
 f9 86                 xor	r4, r1
 98                    or	r6, r4
 c4 00 80              ldi16	r4, 0x8000
 8c                    and	r7, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f9 80                 and	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 78                 and	r3, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 f5 1f                 cmp	r3, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0f                 mov	r1, r7
 f1 06                 mov	r0, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 82                    and	r4, r6
 33                    cmp	r4, r7
 03                    mov	r4, r7
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2f                 mov	r7, r3
 1f                    add	r7, r7
 9d                    or	r7, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x3d4
<L7>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 02                 fmul
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 8e              st32	[r7], q2
 cb 04                 addi.s8	r7, 0x4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 6b 8e              st32	[r7], q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f1 21                 mov	r4, r1
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f4 81                 lsl16.1	r1
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f1 0c                 mov	r1, r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1f                    add	r7, r7
 ac                    xor	r7, r4
 9b                    or	r6, r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 28                 tst16	r0
 c3 01                 ldi8	r7, 0x1
 f8 06                 cset.eq	r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f6 28                 tst16	r0
 f1 07                 mov	r0, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x319
<L8>:
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x319
<L9>:
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x319
<L10>:
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x28e
<L11>:
 f0 04 00 80           ldi16	r0, 0x8000
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f2 6b                 mov32	q3, q1
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 21                 mov	r4, r1
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 c4 00 80              ldi16	r4, 0x8000
 fb 6c                 cmov.ne	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f7 8d                 bool	r5
 03                    mov	r4, r7
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 a0                    xor	r4, r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 00 ff              ldi16	r5, 0xff00
 f0 34 22              ldsp16	r4, [sp+0x22]
 34                    cmp	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f1 22                 mov	r4, r2
 f7 8c                 bool	r4
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 fc 16                 cmov.ult	r2, r6
 fc 1f                 cmov.ult	r3, r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 15                 cmp	r2, r5
 fc 06                 cmov.ult	r0, r6
 fc 0c                 cmov.ult	r1, r4
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_FAR24	.text.__mulxc3+0x3e7
<L12>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulxc3+0x23b
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulxc3+0x235
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 a5                    xor	r5, r5
 f5 0d                 cmp	r1, r5
 fb 6c                 cmov.ne	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	__mulxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__mulxc3+0x3c6

Disassembly of section .text.__divxc3:

<__divxc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 35              ldsp16	r6, [sp+0x35]
 f0 37 37              ldsp16	r7, [sp+0x37]
 f0 32 31              ldsp16	r2, [sp+0x31]
 f0 33 33              ldsp16	r3, [sp+0x33]
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 c5 80 7f              ldi16	r5, 0x7f80
 03                    mov	r4, r7
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f1 27                 mov	r5, r3
 f2 67                 mov32	q1, q3
 c6 80 7f              ldi16	r6, 0x7f80
 86                    and	r5, r6
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 f8 04                 cset.eq	r4
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 e0                 and	r7, r0
 f5 2c                 cmp	r7, r0
 c2 01                 ldi8	r6, 0x1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x9a
<L0>:
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x9a
<L1>:
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x9a
<L2>:
 f4 10                 ldsp16	r4, [sp+0x4]
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x9a
<L3>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x266
<L4>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x266
<L5>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 06 00 ff           ldi16	r2, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f5 14                 cmp	r2, r4
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x804
<L6>:
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x804
<L7>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x17a
<L8>:
 f1 2e                 mov	r7, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f1 17                 mov	r2, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x17a
<L9>:
 08                    mov	r6, r4
 f7 8e                 bool	r6
 0d                    mov	r7, r5
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x433
<L10>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 8e                 bool	r6
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x433
<L11>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 1a                    add	r6, r6
 f9 ca                 xor	r6, r2
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f6 2f                 tst16	r7
 f8 07                 cset.eq	r7
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 1d                 mov	r3, r5
 81                    and	r4, r5
 f5 23                 cmp	r4, r3
 f8 06                 cset.eq	r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 f9 8c                 and	r4, r3
 f5 23                 cmp	r4, r3
 f0 02 01              ldi8	r2, 0x1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x327
<L12>:
 f4 10                 ldsp16	r4, [sp+0x4]
 9c                    or	r7, r4
 f9 e8                 and	r7, r2
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x327
<L13>:
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x327
<L14>:
 f1 2e                 mov	r7, r2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f6 2a                 tst16	r2
 f8 06                 cset.eq	r6
 8b                    and	r6, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 42                 sub	r2, r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f5 1a                 cmp	r3, r2
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 f4 81                 lsl16.1	r1
 c4 00 ff              ldi16	r4, 0xff00
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f5 2a                 cmp	r6, r2
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x425
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 09                 fabs	q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0b                 fabs	q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 08                 fabs	q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 0a                 fabs	q2
 f0 69 4c              cmp32	q1, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 08              cmp32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f4 53                 stsp16	[sp+0x4], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x2ee
<L15>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x2ee
<L16>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 69 ff              ldi16	r5, 0xff69
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 0e                    mov	r7, r6
 cb 81                 addi.s8	r7, -0x7f
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x45a
<L17>:
 f4 a6                 tst8	r6
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x460
<L18>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c7 69 ff              ldi16	r7, 0xff69
 1c                    add	r7, r4
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x460
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 10                    add	r4, r4
 c7 00 ff              ldi16	r7, 0xff00
 a3                    xor	r4, r7
 06                    mov	r5, r6
 94                    or	r5, r4
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 03                 cset.eq	r3
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 f1 15                 mov	r2, r5
 81                    and	r4, r5
 f5 22                 cmp	r4, r2
 f8 07                 cset.eq	r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 f9 88                 and	r4, r2
 f5 22                 cmp	r4, r2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x804
<L19>:
 c0 01                 ldi8	r4, 0x1
 f1 14                 mov	r2, r4
 8c                    and	r7, r4
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x804
<L20>:
 f9 cd                 or	r6, r3
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x808
<L21>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f6 28                 tst16	r0
 f8 06                 cset.eq	r6
 f9 c8                 and	r6, r2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 02                    mov	r4, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 06                 fneg	q2
 f0 37 16              ldsp16	r7, [sp+0x16]
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 cc                 and	r6, r3
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 72                 xor	r3, r4
 f9 4d                 or	r2, r3
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 ff 0d                 u16tof
 f2 66                 mov32	q1, q2
 ff 06                 fneg	q2
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x808
 f2 66                 mov32	q1, q2
 c4 00 80              ldi16	r4, 0x8000
 f0 37 16              ldsp16	r7, [sp+0x16]
 83                    and	r4, r7
 a5                    xor	r5, r5
 c6 80 ff              ldi16	r6, 0xff80
 31                    cmp	r4, r5
 c4 80 7f              ldi16	r4, 0x7f80
 fb 66                 cmov.ne	r4, r6
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x808
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 c3                 addi.s8	r4, -0x3d
 cc 87                 cmpi.s8	r4, -0x79
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x4f0
<L22>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 ca c3                 addi.s8	r6, -0x3d
 c7 86 ff              ldi16	r7, 0xff86
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x4f0
<L23>:
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 03                 fdiv
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x808
 af                    xor	r7, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 f0 06 7d 01           ldi16	r2, 0x17d
 d3 04                 brslt8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x54c
<L24>:
 f4 43                 stsp16	[sp+0x0], r7
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x511
<L25>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 05 00 7f           ldi16	r1, 0x7f00
 f0 02 fe              ldi8	r2, 0xfe
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 16                 cmp	r2, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x536
<L26>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x5a4
 ce 7f                 cmpi.s8	r6, 0x7f
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x5ae
<L27>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 03 7f              ldi8	r3, 0x7f
 f2 4e                 sub	r3, r6
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f1 23                 mov	r4, r3
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 7e                 addi.s8	r6, 0x7e
 f0 0b 81              addi.s8	r3, -0x7f
 f5 1a                 cmp	r3, r2
 f4 62                 stsp16	[sp+0x8], r6
 f1 1e                 mov	r3, r6
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x56c
<L28>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 2a                 cmp	r6, r2
 ca 7e                 addi.s8	r6, 0x7e
 f4 42                 stsp16	[sp+0x0], r6
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x592
<L29>:
 f2 66                 mov32	q1, q2
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x5b3
 f2 66                 mov32	q1, q2
 c1 7f                 ldi8	r5, 0x7f
 26                    sub	r5, r6
 fa 67                 lsl16i	r7, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 1c                    add	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 fa 47                 lsl16i	r5, 0x7
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 0c                    mov	r7, r4
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 af                    xor	r7, r7
 2e                    sub	r7, r6
 ce 81                 cmpi.s8	r6, -0x7f
 d3 04                 brslt8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x633
<L30>:
 f4 63                 stsp16	[sp+0x8], r7
 c3 7f                 ldi8	r7, 0x7f
 2e                    sub	r7, r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 04 7d 01           ldi16	r0, 0x17d
 f4 43                 stsp16	[sp+0x0], r7
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 03                 ldsp16	r7, [sp+0x0]
 f5 07                 cmp	r0, r7
 cb 81                 addi.s8	r7, -0x7f
 d9 04                 brsge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x5f2
<L31>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 07 00 7f           ldi16	r3, 0x7f00
 f0 00 fe              ldi8	r0, 0xfe
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x61d
<L32>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x68f
 ce 7f                 cmpi.s8	r6, 0x7f
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d9 04                 brsge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x695
<L33>:
 f4 63                 stsp16	[sp+0x8], r7
 f0 01 7f              ldi8	r1, 0x7f
 f2 3e                 sub	r1, r6
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f1 29                 mov	r6, r1
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 7e                 addi.s8	r6, 0x7e
 f0 09 81              addi.s8	r1, -0x7f
 f5 08                 cmp	r1, r0
 f4 42                 stsp16	[sp+0x0], r6
 f1 0e                 mov	r1, r6
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x655
<L34>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 62                 stsp16	[sp+0x8], r6
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x67d
<L35>:
 f4 23                 ldsp16	r7, [sp+0x8]
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x6a0
 c0 7f                 ldi8	r4, 0x7f
 22                    sub	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 37                 lsl16i	r4, 0x7
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 36 20              ldsp16	r6, [sp+0x20]
 f4 13                 ldsp16	r7, [sp+0x4]
 2e                    sub	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 12                 ldsp16	r6, [sp+0x4]
 f2 62                 mov32	q0, q2
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 f0 02 fe              ldi8	r2, 0xfe
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x736
<L36>:
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 14                 cmp	r2, r4
 c8 81                 addi.s8	r4, -0x7f
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x71e
<L37>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x762
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x760
<L38>:
 02                    mov	r4, r6
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 06 04 ff           ldi16	r2, 0xff04
 f4 40                 stsp16	[sp+0x0], r4
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 22                 cmp	r4, r2
 c8 7e                 addi.s8	r4, 0x7e
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x748
<L39>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x762
 f4 42                 stsp16	[sp+0x0], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 47                 lsl16i	r5, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d9 04                 brsge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x7c8
<L40>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 00 fe              ldi8	r0, 0xfe
 aa                    xor	r6, r6
 c7 00 7f              ldi16	r7, 0x7f00
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 06                 cmp	r0, r6
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x7b0
<L41>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x7f7
 ce 82                 cmpi.s8	r6, -0x7e
 d3 04                 brslt8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x7f3
<L42>:
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 04 04 ff           ldi16	r0, 0xff04
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f5 28                 cmp	r6, r0
 ca 7e                 addi.s8	r6, 0x7e
 f4 52                 stsp16	[sp+0x4], r6
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__divxc3
		R_AVM_FAR24	.text.__divxc3+0x7dd
<L43>:
 e2 00 00 00           jmpf	__divxc3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__divxc3+0x7f7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1e                    add	r7, r6
 aa                    xor	r6, r6
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
