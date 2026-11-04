
uchar.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 uchar.c
00000000 l    d  .text.mbrtoc8	00000000 .text.mbrtoc8
00000000 l     O .data.mbrtoc8_state	00000001 mbrtoc8_state
00000000 l    d  .text.c8rtomb	00000000 .text.c8rtomb
00000000 l     O .data.c8rtomb_state	00000001 c8rtomb_state
00000000 l    d  .text.mbrtoc16	00000000 .text.mbrtoc16
00000000 l    d  .text.c16rtomb	00000000 .text.c16rtomb
00000000 l     O .data.c16rtomb_state	00000001 c16rtomb_state
00000000 l    d  .text.mbrtoc32	00000000 .text.mbrtoc32
00000000 l    d  .text.c32rtomb	00000000 .text.c32rtomb
00000000 l    d  .data.mbrtoc8_state	00000000 .data.mbrtoc8_state
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .data.c8rtomb_state	00000000 .data.c8rtomb_state
00000000 l    d  .data.c16rtomb_state	00000000 .data.c16rtomb_state
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.mbrtoc8	0000008b mbrtoc8
00000000 g     F .text.c8rtomb	00000077 c8rtomb
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.mbrtoc16	00000032 mbrtoc16
00000000 g     F .text.c16rtomb	0000005d c16rtomb
00000000 g     F .text.mbrtoc32	0000003f mbrtoc32
00000000 g     F .text.c32rtomb	00000034 c32rtomb

Disassembly of section .text.mbrtoc8:

<mbrtoc8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 42                 sub	r2, r2
 f6 2d                 tst16	r5
 f1 02                 mov	r0, r2
 fb 44                 cmov.ne	r0, r4
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	.flash.str1.1
 fb 4d                 cmov.ne	r1, r5
 f0 07 00 00           ldi16	r3, 0x0
		R_AVM_DATA16	.data.mbrtoc8_state
 f6 2f                 tst16	r7
 fb 3b                 cmov.eq	r7, r3
 f5 3f                 ld8u	r3, [r7]
 f4 a3                 tst8	r3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x37
<L0>:
 f3 0e                 st8	[r7], r2
 c5 fd ff              ldi16	r5, 0xfffd
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x85
<L1>:
 f3 03                 st8	[r4], r3
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbrtoc8+0x85
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x4e
<L2>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x4e
<L3>:
 c5 fe ff              ldi16	r5, 0xfffe
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbrtoc8+0x85
 ed c2 20              ld8u	r6, [r1+0]
 f6 46                 sext8	r6
 f4 a6                 tst8	r6
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x6c
<L4>:
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x64
<L5>:
 52                    st8	[r4], r6
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbrtoc8+0x85
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc8
		R_AVM_FAR24	.text.mbrtoc8+0x7f
<L6>:
 f0 00 c0              ldi8	r0, 0xc0
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 fa 86                 lsr16i	r5, 0x6
 f9 a1                 or	r5, r0
 51                    st8	[r4], r5
 c0 bf                 ldi8	r4, 0xbf
 88                    and	r6, r4
 5e                    st8	[r7], r6
 c1 01                 ldi8	r5, 0x1
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.c8rtomb:

<c8rtomb>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.data.c8rtomb_state
 f6 2e                 tst16	r6
 fb 34                 cmov.eq	r6, r4
 46                    ld8u	r5, [r6]
 a0                    xor	r4, r4
 58                    st8	[r6], r4
 f6 28                 tst16	r0
 f1 2d                 mov	r7, r1
 fb 3c                 cmov.eq	r7, r4
 f6 47                 sext8	r7
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x41
<L0>:
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x6b
<L1>:
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x74
<L2>:
 c2 3f                 ldi8	r6, 0x3f
 f9 38                 and	r1, r6
 fa 46                 lsl16i	r5, 0x6
 f9 a5                 or	r5, r1
 ee a0 20              st8	[r0+0], r5
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c8rtomb+0x74
 f6 2f                 tst16	r7
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x5a
<L3>:
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x74
<L4>:
 ee 20 20              st8	[r0+0], r1
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c8rtomb+0x74
 c5 fe ff              ldi16	r5, 0xfffe
 87                    and	r5, r7
 cd c2                 cmpi.s8	r5, -0x3e
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_FAR24	.text.c8rtomb+0x6b
<L5>:
 5b                    st8	[r6], r7
 e2 00 00 00           jmpf	c8rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c8rtomb+0x74
 c0 54                 ldi8	r4, 0x54
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.mbrtoc16:

<mbrtoc16>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc16
		R_AVM_FAR24	.text.mbrtoc16+0x14
<L0>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc16
		R_AVM_FAR24	.text.mbrtoc16+0x14
<L1>:
 c4 fe ff              ldi16	r4, 0xfffe
 ef                    ret
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.flash.str1.1
 f6 2d                 tst16	r5
 fb 75                 cmov.ne	r6, r5
 4a                    ld8u	r6, [r6]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc16
		R_AVM_FAR24	.text.mbrtoc16+0x2d
<L2>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc16
		R_AVM_FAR24	.text.mbrtoc16+0x2d
<L3>:
 72                    st16	[r4], r6
 f4 a6                 tst8	r6
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.c16rtomb:

<c16rtomb>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 28                 tst16	r0
 f1 15                 mov	r2, r5
 fb 14                 cmov.eq	r2, r4
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	.data.c16rtomb_state
 f6 2e                 tst16	r6
 fb 31                 cmov.eq	r6, r1
 4e                    ld8u	r7, [r6]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_FAR24	.text.c16rtomb+0x2b
<L0>:
 58                    st8	[r6], r4
 c0 54                 ldi8	r4, 0x54
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 c3 ff                 ldi8	r7, 0xff
 f5 2e                 cmp	r7, r2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_FAR24	.text.c16rtomb+0x46
<L1>:
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_FAR24	.text.c16rtomb+0x27
<L2>:
 ee a0 20              st8	[r0+0], r5
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c16rtomb+0x27
 c5 00 fc              ldi16	r5, 0xfc00
 f9 54                 and	r2, r5
 c5 00 d8              ldi16	r5, 0xd800
 f5 15                 cmp	r2, r5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_FAR24	.text.c16rtomb+0x1e
<L3>:
 c1 01                 ldi8	r5, 0x1
 59                    st8	[r6], r5
 e2 00 00 00           jmpf	c16rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c16rtomb+0x27

Disassembly of section .text.mbrtoc32:

<mbrtoc32>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc32
		R_AVM_FAR24	.text.mbrtoc32+0x19
<L0>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc32
		R_AVM_FAR24	.text.mbrtoc32+0x19
<L1>:
 c4 fe ff              ldi16	r4, 0xfffe
 e2 00 00 00           jmpf	mbrtoc32
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbrtoc32+0x3c
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.flash.str1.1
 f6 2d                 tst16	r5
 fb 75                 cmov.ne	r6, r5
 4a                    ld8u	r6, [r6]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc32
		R_AVM_FAR24	.text.mbrtoc32+0x38
<L2>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtoc32
		R_AVM_FAR24	.text.mbrtoc32+0x38
<L3>:
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 6b 08              st32	[r4], q0
 f4 a6                 tst8	r6
 f8 0c                 cset.ne	r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.c32rtomb:

<c32rtomb>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c32rtomb
		R_AVM_FAR24	.text.c32rtomb+0x25
<L0>:
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c32rtomb
		R_AVM_FAR24	.text.c32rtomb+0x25
<L1>:
 c0 54                 ldi8	r4, 0x54
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	c32rtomb
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.c32rtomb+0x30
 c1 01                 ldi8	r5, 0x1
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	c32rtomb
		R_AVM_FAR24	.text.c32rtomb+0x30
<L2>:
 52                    st8	[r4], r6
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
