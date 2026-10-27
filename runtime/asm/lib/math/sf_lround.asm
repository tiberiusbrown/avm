
math_sf_lround.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_lround.c
00000000 l    d  .text.lroundf	00000000 .text.lroundf
00000000 g     F .text.lroundf	0000002a lroundf

Disassembly of section .text.lroundf:

<lroundf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 ff 1b                 fround
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 ff 12                 ftos32
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 4e           ldi16	r1, 0x4eff
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 f0 69 0c              cmp32	q0, q3
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
