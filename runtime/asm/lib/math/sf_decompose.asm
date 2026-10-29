
math_sf_decompose.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_decompose.c
00000000 l    d  .text.ldexpf	00000000 .text.ldexpf
00000000 l    d  .text.frexpf	00000000 .text.frexpf
00000000 l    d  .text.modff	00000000 .text.modff
00000000 l    d  .text.nextafterf	00000000 .text.nextafterf
00000000 l    d  .text.nexttowardf	00000000 .text.nexttowardf
00000000 g     F .text.ldexpf	00000004 ldexpf
00000000         *UND*	00000000 scalbnf
00000000 g     F .text.frexpf	0000011d frexpf
00000000 g     F .text.modff	000000d3 modff
00000000 g     F .text.nextafterf	000000be nextafterf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.nexttowardf	000000ba nexttowardf

Disassembly of section .text.ldexpf:

<ldexpf>:
 e2 00 00 00           jmpf	ldexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	scalbnf

Disassembly of section .text.frexpf:

<frexpf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 af                    xor	r7, r7
 f4 62                 stsp16	[sp+0x8], r6
 7b                    st16	[r6], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 42                 sub	r2, r2
 f0 07 80 80           ldi16	r3, 0x8080
 f7 67                 add32	q1, q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 80           ldi16	r1, 0x8080
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0xa6
<L0>:
 f1 0d                 mov	r1, r5
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0x92
<L1>:
 f0 06 00 01           ldi16	r2, 0x100
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 c5 f1 ff              ldi16	r5, 0xfff1
 f0 69 c4              cmp32	q3, q1
 fc 25                 cmov.ult	r4, r5
 f1 1e                 mov	r3, r6
 f2 42                 sub	r2, r2
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f0 06 ff ff           ldi16	r2, 0xffff
 f2 4b                 sub	r3, r3
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0xad
<L2>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 0f              ldi8	r3, 0xf
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0xce
<L3>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 3f              ldi8	r3, 0x3f
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0xf9
<L4>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0x92
<L5>:
 f4 b4                 dec16	r4
 f7 6f                 add32	q3, q3
 c8 82                 addi.s8	r4, -0x7e
 f4 21                 ldsp16	r5, [sp+0x8]
 74                    st16	[r5], r4
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c5 00 80              ldi16	r5, 0x8000
 f9 a4                 and	r5, r1
 94                    or	r5, r4
 c4 00 3f              ldi16	r4, 0x3f00
 91                    or	r4, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9c                    or	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 58                 lsl16i	r6, 0x8
 c8 f8                 addi.s8	r4, -0x8
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 0f              ldi8	r3, 0xf
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0x6e
<L6>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 54                 lsl16i	r6, 0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 54                 lsl16i	r6, 0x4
 0d                    mov	r7, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 3f              ldi8	r3, 0x3f
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0x7e
<L7>:
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 c8 fe                 addi.s8	r4, -0x2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	frexpf
		R_AVM_FAR24	.text.frexpf+0x92
<L8>:
 e2 00 00 00           jmpf	frexpf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.frexpf+0x8e

Disassembly of section .text.modff:

<modff>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 72                 stsp16	[sp+0xc], r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 f9 74                 and	r3, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 ce 7f                 cmpi.s8	r6, 0x7f
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	modff
		R_AVM_FAR24	.text.modff+0x31
<L0>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 4c              st32	[r6], q1
 e2 00 00 00           jmpf	modff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.modff+0xcc
 c3 96                 ldi8	r7, 0x96
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	modff
		R_AVM_FAR24	.text.modff+0x5c
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	modff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.modff+0xcc
 c3 85                 ldi8	r7, 0x85
 3e                    cmp	r7, r6
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	modff
		R_AVM_FAR24	.text.modff+0x78
<L2>:
 ca 81                 addi.s8	r6, -0x7f
 c3 7f                 ldi8	r7, 0x7f
 fa 1e                 lsr16v	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 e2 00 00 00           jmpf	modff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.modff+0x83
 c7 7a ff              ldi16	r7, 0xff7a
 1b                    add	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 6b c0              st32	[r0], q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	modff
		R_AVM_FAR24	.text.modff+0xc8
<L3>:
 ff 01                 fsub
 e2 00 00 00           jmpf	modff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.modff+0xcc
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.nextafterf:

<nextafterf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x3d
<L0>:
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x4a
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 67                 mov32	q1, q3
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x60
<L2>:
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	nextafterf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nextafterf+0x43
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x8c
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 f8 27                 cset.slt	r7
 ce ff                 cmpi.s8	r6, -0x1
 f8 06                 cset.eq	r6
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x9a
<L4>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 e2 00 00 00           jmpf	nextafterf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nextafterf+0xa0
 c4 00 80              ldi16	r4, 0x8000
 f9 8c                 and	r4, r3
 c1 01                 ldi8	r5, 0x1
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 e2 00 00 00           jmpf	nextafterf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nextafterf+0xa2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nextafterf
		R_AVM_FAR24	.text.nextafterf+0x43
<L5>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	nextafterf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nextafterf+0x43

Disassembly of section .text.nexttowardf:

<nexttowardf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0x41
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0xa9
<L1>:
 c7 80 ff              ldi16	r7, 0xff80
 f0 04 80 7f           ldi16	r0, 0x7f80
 ce ff                 cmpi.s8	r6, -0x1
 fb 38                 cmov.eq	r7, r0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0x49
<L2>:
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nexttowardf+0xa7
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0xa9
<L3>:
 f1 06                 mov	r0, r6
 f2 6b                 mov32	q3, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0x7e
<L4>:
 f0 69 84              cmp32	q2, q1
 f8 27                 cset.slt	r7
 f0 0c ff              cmpi.s8	r0, -0x1
 f8 06                 cset.eq	r6
 3e                    cmp	r7, r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0x8c
<L5>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nexttowardf+0x92
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 c1 01                 ldi8	r5, 0x1
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nexttowardf+0x94
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_FAR24	.text.nexttowardf+0xb0
<L6>:
 f2 62                 mov32	q0, q2
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	nexttowardf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.nexttowardf+0xa7
