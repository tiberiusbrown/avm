
math_sf_fromfp.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fromfp.c
00000000 l    d  .text.fromfpf	00000000 .text.fromfpf
00000000 l    d  .text.ufromfpf	00000000 .text.ufromfpf
00000000 l    d  .text.fromfpxf	00000000 .text.fromfpxf
00000000 l    d  .text.ufromfpxf	00000000 .text.ufromfpxf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.fromfpf	00000118 fromfpf
00000000         *UND*	00000000 floorf
00000000         *UND*	00000000 ceilf
00000000         *UND*	00000000 truncf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.ufromfpf	00000114 ufromfpf
00000000 g     F .text.fromfpxf	00000118 fromfpxf
00000000 g     F .text.ufromfpxf	00000114 ufromfpxf

Disassembly of section .text.fromfpf:

<fromfpf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 ce 02                 cmpi.s8	r6, 0x2
 f4 43                 stsp16	[sp+0x0], r7
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0x32
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0x83
<L1>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0x50
<L2>:
 e3 00 00 00           callf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	floorf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L3>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xc6
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0x95
<L4>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0x50
<L5>:
 ff 1a                 fround
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L6>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xc6
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f1 29                 mov	r6, r1
 c7 00 4b              ldi16	r7, 0x4b00
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xa7
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L8>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xc6
 e3 00 00 00           callf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ceilf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L9>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xc6
 e3 00 00 00           callf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	truncf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L10>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xc6
 f0 06 00 80           ldi16	r2, 0x8000
 f9 54                 and	r2, r5
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a9                 or	r5, r2
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L11>:
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 7f 7f              ldi16	r7, 0x7f7f
 3e                    cmp	r7, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xe7
<L12>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c2 80                 ldi8	r6, 0x80
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xe0
<L13>:
 fa 67                 lsl16i	r7, 0x7
 c6 00 3f              ldi16	r6, 0x3f00
 1b                    add	r6, r7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f2 6a                 mov32	q3, q0
 ff 07                 fneg	q3
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xd6
<L14>:
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpf
		R_AVM_FAR24	.text.fromfpf+0xe0
<L15>:
 e2 00 00 00           jmpf	fromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpf+0xd6

Disassembly of section .text.ufromfpf:

<ufromfpf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 ce 02                 cmpi.s8	r6, 0x2
 f4 43                 stsp16	[sp+0x0], r7
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x32
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x83
<L1>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x50
<L2>:
 e3 00 00 00           callf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	floorf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L3>:
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpf+0xc6
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x95
<L4>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x50
<L5>:
 ff 1a                 fround
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L6>:
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpf+0xc6
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f1 29                 mov	r6, r1
 c7 00 4b              ldi16	r7, 0x4b00
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xa7
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L8>:
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpf+0xc6
 e3 00 00 00           callf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ceilf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L9>:
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpf+0xc6
 e3 00 00 00           callf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	truncf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L10>:
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpf+0xc6
 f0 06 00 80           ldi16	r2, 0x8000
 f9 54                 and	r2, r5
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a9                 or	r5, r2
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L11>:
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 7f 7f              ldi16	r7, 0x7f7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L12>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f2 62                 mov32	q0, q2
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0xff
<L13>:
 c2 7f                 ldi8	r6, 0x7f
 f4 03                 ldsp16	r7, [sp+0x0]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x10b
<L14>:
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1b                    add	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpf
		R_AVM_FAR24	.text.ufromfpf+0x10b
<L15>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f2 68                 mov32	q2, q0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.fromfpxf:

<fromfpxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 ce 02                 cmpi.s8	r6, 0x2
 f4 43                 stsp16	[sp+0x0], r7
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0x32
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0x83
<L1>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0x50
<L2>:
 e3 00 00 00           callf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	floorf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L3>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xc6
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0x95
<L4>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0x50
<L5>:
 ff 1a                 fround
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L6>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xc6
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f1 29                 mov	r6, r1
 c7 00 4b              ldi16	r7, 0x4b00
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xa7
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L8>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xc6
 e3 00 00 00           callf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ceilf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L9>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xc6
 e3 00 00 00           callf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	truncf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L10>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xc6
 f0 06 00 80           ldi16	r2, 0x8000
 f9 54                 and	r2, r5
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a9                 or	r5, r2
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L11>:
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 7f 7f              ldi16	r7, 0x7f7f
 3e                    cmp	r7, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xe7
<L12>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c2 80                 ldi8	r6, 0x80
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xe0
<L13>:
 fa 67                 lsl16i	r7, 0x7
 c6 00 3f              ldi16	r6, 0x3f00
 1b                    add	r6, r7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f2 6a                 mov32	q3, q0
 ff 07                 fneg	q3
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xd6
<L14>:
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_FAR24	.text.fromfpxf+0xe0
<L15>:
 e2 00 00 00           jmpf	fromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fromfpxf+0xd6

Disassembly of section .text.ufromfpxf:

<ufromfpxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 ce 02                 cmpi.s8	r6, 0x2
 f4 43                 stsp16	[sp+0x0], r7
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x32
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x83
<L1>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x50
<L2>:
 e3 00 00 00           callf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	floorf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L3>:
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpxf+0xc6
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x95
<L4>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x50
<L5>:
 ff 1a                 fround
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L6>:
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpxf+0xc6
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f1 29                 mov	r6, r1
 c7 00 4b              ldi16	r7, 0x4b00
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xa7
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L8>:
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpxf+0xc6
 e3 00 00 00           callf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ceilf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L9>:
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpxf+0xc6
 e3 00 00 00           callf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	truncf
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L10>:
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ufromfpxf+0xc6
 f0 06 00 80           ldi16	r2, 0x8000
 f9 54                 and	r2, r5
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a9                 or	r5, r2
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L11>:
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 7f 7f              ldi16	r7, 0x7f7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L12>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f2 62                 mov32	q0, q2
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0xff
<L13>:
 c2 7f                 ldi8	r6, 0x7f
 f4 03                 ldsp16	r7, [sp+0x0]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x10b
<L14>:
 fa 67                 lsl16i	r7, 0x7
 c6 80 3f              ldi16	r6, 0x3f80
 1b                    add	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ufromfpxf
		R_AVM_FAR24	.text.ufromfpxf+0x10b
<L15>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f2 68                 mov32	q2, q0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
