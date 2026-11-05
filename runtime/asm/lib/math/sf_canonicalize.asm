
math_sf_canonicalize.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_canonicalize.c
00000000 l    d  .text.canonicalizef	00000000 .text.canonicalizef
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.canonicalizef	00000034 canonicalizef

Disassembly of section .text.canonicalizef:

<canonicalizef>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 6a ca              ld32	q3, [r5]
 c1 40                 ldi8	r5, 0x40
 97                    or	r5, r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 fc 36                 cmov.ult	r6, r6
 fc 3d                 cmov.ult	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b c8              st32	[r4], q3
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
