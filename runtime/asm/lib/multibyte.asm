
multibyte.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 multibyte.c
00000000 l    d  .text.mbtowc	00000000 .text.mbtowc
00000000 l    d  .text.mblen	00000000 .text.mblen
00000000 l    d  .text.wctomb	00000000 .text.wctomb
00000000 l    d  .text.mbstowcs	00000000 .text.mbstowcs
00000000 l    d  .text.wcstombs	00000000 .text.wcstombs
00000000 g     F .text.mbtowc	00000025 mbtowc
00000000 g     F .text.mblen	0000001c mblen
00000000 g     F .text.wctomb	0000000e wctomb
00000000 g     F .text.mbstowcs	00000028 mbstowcs
00000000 g     F .text.wcstombs	00000028 wcstombs

Disassembly of section .text.mbtowc:

<mbtowc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbtowc
		R_AVM_FAR24	.text.mbtowc+0x1f
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbtowc
		R_AVM_FAR24	.text.mbtowc+0x21
<L1>:
 45                    ld8u	r5, [r5]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbtowc
		R_AVM_FAR24	.text.mbtowc+0x1a
<L2>:
 51                    st8	[r4], r5
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.mblen:

<mblen>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mblen
		R_AVM_FAR24	.text.mblen+0x16
<L0>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mblen
		R_AVM_FAR24	.text.mblen+0x18
<L1>:
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.wctomb:

<wctomb>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wctomb
		R_AVM_FAR24	.text.wctomb+0xc
<L0>:
 51                    st8	[r4], r5
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.mbstowcs:

<mbstowcs>:
 b1                    push16	r1
 b0                    push16	r0
 af                    xor	r7, r7
 f1 07                 mov	r0, r7
 f5 28                 cmp	r6, r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x21
<L0>:
 f7 09                 ld8u	r1, [r5+]
 f6 01                 st8	[r4+], r1
 f1 2c                 mov	r7, r0
 f4 af                 inc16	r7
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x3
<L1>:
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbstowcs+0x23
 f1 06                 mov	r0, r6
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.wcstombs:

<wcstombs>:
 b1                    push16	r1
 b0                    push16	r0
 af                    xor	r7, r7
 f1 07                 mov	r0, r7
 f5 28                 cmp	r6, r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x21
<L0>:
 f7 09                 ld8u	r1, [r5+]
 f6 01                 st8	[r4+], r1
 f1 2c                 mov	r7, r0
 f4 af                 inc16	r7
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x3
<L1>:
 e2 00 00 00           jmpf	wcstombs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcstombs+0x23
 f1 06                 mov	r0, r6
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
