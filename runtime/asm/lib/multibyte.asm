
multibyte.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 multibyte.c
00000000 l    d  .text.mbtowc	00000000 .text.mbtowc
00000000 l    d  .text.mblen	00000000 .text.mblen
00000000 l    d  .text.wctomb	00000000 .text.wctomb
00000000 l    d  .text.btowc	00000000 .text.btowc
00000000 l    d  .text.wctob	00000000 .text.wctob
00000000 l    d  .text.mbsinit	00000000 .text.mbsinit
00000000 l    d  .text.mbrtowc	00000000 .text.mbrtowc
00000000 l    d  .text.mbrlen	00000000 .text.mbrlen
00000000 l    d  .text.wcrtomb	00000000 .text.wcrtomb
00000000 l    d  .text.mbsrtowcs	00000000 .text.mbsrtowcs
00000000 l    d  .text.wcsrtombs	00000000 .text.wcsrtombs
00000000 l    d  .text.mbstowcs	00000000 .text.mbstowcs
00000000 l    d  .text.wcstombs	00000000 .text.wcstombs
00000000 g     F .text.mbtowc	00000025 mbtowc
00000000 g     F .text.mblen	0000001c mblen
00000000 g     F .text.wctomb	0000000e wctomb
00000000 g     F .text.btowc	0000000b btowc
00000000 g     F .text.wctob	0000000b wctob
00000000 g     F .text.mbsinit	00000003 mbsinit
00000000 g     F .text.mbrtowc	00000025 mbrtowc
00000000 g     F .text.mbrlen	0000001c mbrlen
00000000 g     F .text.wcrtomb	0000000c wcrtomb
00000000 g     F .text.mbsrtowcs	0000006b mbsrtowcs
00000000 g     F .text.wcsrtombs	0000006b wcsrtombs
00000000 g     F .text.mbstowcs	0000004d mbstowcs
00000000 g     F .text.wcstombs	0000004d wcstombs

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

Disassembly of section .text.btowc:

<btowc>:
 c6 00 01              ldi16	r6, 0x100
 c5 ff ff              ldi16	r5, 0xffff
 32                    cmp	r4, r6
 fc 2c                 cmov.ult	r5, r4
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.wctob:

<wctob>:
 c6 00 01              ldi16	r6, 0x100
 c5 ff ff              ldi16	r5, 0xffff
 32                    cmp	r4, r6
 fc 2c                 cmov.ult	r5, r4
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.mbsinit:

<mbsinit>:
 c0 01                 ldi8	r4, 0x1
 ef                    ret

Disassembly of section .text.mbrtowc:

<mbrtowc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtowc
		R_AVM_FAR24	.text.mbrtowc+0x1f
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtowc
		R_AVM_FAR24	.text.mbrtowc+0x21
<L1>:
 45                    ld8u	r5, [r5]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrtowc
		R_AVM_FAR24	.text.mbrtowc+0x1a
<L2>:
 51                    st8	[r4], r5
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret
 c4 fe ff              ldi16	r4, 0xfffe
 ef                    ret

Disassembly of section .text.mbrlen:

<mbrlen>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrlen
		R_AVM_FAR24	.text.mbrlen+0x16
<L0>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbrlen
		R_AVM_FAR24	.text.mbrlen+0x18
<L1>:
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret
 c4 fe ff              ldi16	r4, 0xfffe
 ef                    ret

Disassembly of section .text.wcrtomb:

<wcrtomb>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcrtomb
		R_AVM_FAR24	.text.wcrtomb+0x9
<L0>:
 51                    st8	[r4], r5
 c0 01                 ldi8	r4, 0x1
 ef                    ret

Disassembly of section .text.mbsrtowcs:

<mbsrtowcs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f5 46                 ld16	r2, [r5]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x3e
<L0>:
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x62
<L1>:
 f2 39                 sub	r1, r1
 f1 29                 mov	r6, r1
 f1 2e                 mov	r7, r2
 f5 3f                 ld8u	r3, [r7]
 f3 03                 st8	[r4], r3
 f4 a3                 tst8	r3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x5e
<L2>:
 f4 ac                 inc16	r4
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f5 06                 cmp	r0, r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x1e
<L3>:
 f2 16                 add	r2, r6
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbsrtowcs+0x62
 ed 84 20              ld8u	r4, [r2+0]
 f2 30                 sub	r0, r0
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x64
<L4>:
 f4 a8                 inc16	r0
 ed 84 21              ld8u	r4, [r2+1]
 f4 aa                 inc16	r2
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_FAR24	.text.mbsrtowcs+0x4b
<L5>:
 e2 00 00 00           jmpf	mbsrtowcs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mbsrtowcs+0x64
 f1 11                 mov	r2, r1
 f1 06                 mov	r0, r6
 f5 56                 st16	[r5], r2
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.wcsrtombs:

<wcsrtombs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f5 46                 ld16	r2, [r5]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x3e
<L0>:
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x62
<L1>:
 f2 39                 sub	r1, r1
 f1 29                 mov	r6, r1
 f1 2e                 mov	r7, r2
 f5 3f                 ld8u	r3, [r7]
 f3 03                 st8	[r4], r3
 f4 a3                 tst8	r3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x5e
<L2>:
 f4 ac                 inc16	r4
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f5 06                 cmp	r0, r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x1e
<L3>:
 f2 16                 add	r2, r6
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcsrtombs+0x62
 ed 84 20              ld8u	r4, [r2+0]
 f2 30                 sub	r0, r0
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x64
<L4>:
 f4 a8                 inc16	r0
 ed 84 21              ld8u	r4, [r2+1]
 f4 aa                 inc16	r2
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_FAR24	.text.wcsrtombs+0x4b
<L5>:
 e2 00 00 00           jmpf	wcsrtombs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcsrtombs+0x64
 f1 11                 mov	r2, r1
 f1 06                 mov	r0, r6
 f5 56                 st16	[r5], r2
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.mbstowcs:

<mbstowcs>:
 b0                    push16	r0
 0c                    mov	r7, r4
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x2f
<L0>:
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x48
<L1>:
 f5 34                 ld8u	r0, [r5]
 f3 0c                 st8	[r7], r0
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x48
<L2>:
 f4 af                 inc16	r7
 f4 ad                 inc16	r5
 f4 ac                 inc16	r4
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x13
<L3>:
 02                    mov	r4, r6
 b8                    pop16	r0
 ef                    ret
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x4a
<L4>:
 a0                    xor	r4, r4
 f4 ac                 inc16	r4
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mbstowcs
		R_AVM_FAR24	.text.mbstowcs+0x39
<L5>:
 b8                    pop16	r0
 ef                    ret
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstombs:

<wcstombs>:
 b0                    push16	r0
 0c                    mov	r7, r4
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x2f
<L0>:
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x48
<L1>:
 f5 34                 ld8u	r0, [r5]
 f3 0c                 st8	[r7], r0
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x48
<L2>:
 f4 af                 inc16	r7
 f4 ad                 inc16	r5
 f4 ac                 inc16	r4
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x13
<L3>:
 02                    mov	r4, r6
 b8                    pop16	r0
 ef                    ret
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x4a
<L4>:
 a0                    xor	r4, r4
 f4 ac                 inc16	r4
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstombs
		R_AVM_FAR24	.text.wcstombs+0x39
<L5>:
 b8                    pop16	r0
 ef                    ret
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret
