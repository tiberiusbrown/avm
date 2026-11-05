
time_gmtime_r.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_gmtime_r.c
00000000 l    d  .text.gmtime_r	00000000 .text.gmtime_r
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.gmtime_r	00000025 gmtime_r
00000000         *UND*	00000000 __avm_time_split

Disassembly of section .text.gmtime_r:

<gmtime_r>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f0 6a 48              ld32	q1, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a c8              ld32	q3, [r4]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	gmtime_r
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_split
 d6 02                 adjsp	0x2
 a5                    xor	r5, r5
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
