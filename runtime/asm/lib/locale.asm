
locale.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 locale.c
00000000 l    d  .text.setlocale	00000000 .text.setlocale
00000000 l     O .data.c_locale_name	00000002 c_locale_name
00000000 l    d  .text.localeconv	00000000 .text.localeconv
00000000 l     O .data.c_locale	00000022 c_locale
00000000 l    d  .data.c_locale_name	00000000 .data.c_locale_name
00000000 l    d  .data.c_locale	00000000 .data.c_locale
00000000 l     O .data.c_decimal_point	00000002 c_decimal_point
00000000 l    d  .data.c_decimal_point	00000000 .data.c_decimal_point
00000000 g     F .text.setlocale	00000033 setlocale
00000000 g     F .text.localeconv	00000004 localeconv

Disassembly of section .text.setlocale:

<setlocale>:
 aa                    xor	r6, r6
 cc 06                 cmpi.s8	r4, 0x6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setlocale
		R_AVM_FAR24	.text.setlocale+0xb
<L0>:
 02                    mov	r4, r6
 ef                    ret
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.data.c_locale_name
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setlocale
		R_AVM_FAR24	.text.setlocale+0x32
<L1>:
 4d                    ld8u	r7, [r5]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setlocale
		R_AVM_FAR24	.text.setlocale+0x32
<L2>:
 cf 43                 cmpi.s8	r7, 0x43
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setlocale
		R_AVM_FAR24	.text.setlocale+0x9
<L3>:
 ed aa 21              ld8u	r5, [r5+1]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setlocale
		R_AVM_FAR24	.text.setlocale+0x9
<L4>:
 ef                    ret

Disassembly of section .text.localeconv:

<localeconv>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.data.c_locale
 ef                    ret
