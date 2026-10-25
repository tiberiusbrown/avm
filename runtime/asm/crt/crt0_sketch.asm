
crt0_sketch.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_sketch.c
00000000 l    d  .text._start	00000000 .text._start
00000000 g     F .text._start	00000051 _start
00000000         *UND*	00000000 __init_array_end
00000000         *UND*	00000000 __init_array_start
00000000         *UND*	00000000 setup
00000000         *UND*	00000000 loop

Disassembly of section .text._start:

<_start>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__init_array_end
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__init_array_end
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__init_array_start
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__init_array_start
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_start
		R_AVM_FAR24	.text._start+0x45
<L0>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	__init_array_start
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	__init_array_start
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	__init_array_end
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	__init_array_end
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_start
		R_AVM_FAR24	.text._start+0x2e
<L1>:
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	setup
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	loop
 e2 00 00 00           jmpf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._start+0x49
