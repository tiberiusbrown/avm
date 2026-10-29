
stdio_error.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_error.c
00000000 l    d  .text.clearerr	00000000 .text.clearerr
00000000 l    d  .text.feof	00000000 .text.feof
00000000 l    d  .text.ferror	00000000 .text.ferror
00000000 g     F .text.clearerr	0000000e clearerr
00000000 g     F .text.feof	00000011 feof
00000000 g     F .text.ferror	00000011 ferror

Disassembly of section .text.clearerr:

<clearerr>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	clearerr
		R_AVM_FAR24	.text.clearerr+0xd
<L0>:
 44                    ld8u	r5, [r4]
 c2 f3                 ldi8	r6, 0xf3
 89                    and	r6, r5
 52                    st8	[r4], r6
 ef                    ret

Disassembly of section .text.feof:

<feof>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	feof
		R_AVM_FAR24	.text.feof+0xf
<L0>:
 44                    ld8u	r5, [r4]
 fa 82                 lsr16i	r5, 0x2
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.ferror:

<ferror>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ferror
		R_AVM_FAR24	.text.ferror+0xf
<L0>:
 44                    ld8u	r5, [r4]
 fa 83                 lsr16i	r5, 0x3
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 ef                    ret
 a0                    xor	r4, r4
 ef                    ret
