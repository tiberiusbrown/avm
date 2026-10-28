
time_ctime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_ctime.c
00000000 l    d  .text.ctime	00000000 .text.ctime
00000000 g     F .text.ctime	00000012 ctime
00000000         *UND*	00000000 localtime
00000000         *UND*	00000000 asctime

Disassembly of section .text.ctime:

<ctime>:
 e3 00 00 00           callf	ctime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	localtime
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ctime
		R_AVM_FAR24	.text.ctime+0x10
<L0>:
 e2 00 00 00           jmpf	ctime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	asctime
 a0                    xor	r4, r4
 ef                    ret
