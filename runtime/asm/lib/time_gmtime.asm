
time_gmtime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_gmtime.c
00000000 l    d  .text.gmtime	00000000 .text.gmtime
00000000 l     O .data.gmtime.result	00000012 gmtime.result
00000000 l    d  .data.gmtime.result	00000000 .data.gmtime.result
00000000 g     F .text.gmtime	00000027 gmtime
00000000         *UND*	00000000 __avm_time_split

Disassembly of section .text.gmtime:

<gmtime>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 6a 08              ld32	q0, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a c8              ld32	q3, [r4]
 d6 fe                 adjsp	-0x2
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	.data.gmtime.result
 f0 3a 00              stsp16	[sp+0x0], r2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	gmtime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_split
 d6 02                 adjsp	0x2
 a5                    xor	r5, r5
 f6 2c                 tst16	r4
 fb 15                 cmov.eq	r2, r5
 f1 22                 mov	r4, r2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
