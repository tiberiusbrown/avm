
crt0_test.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    d  .text._start	00000000 .text._start
00000000 l     F .text.avm_run_constructors	0000004c avm_run_constructors
00000000 l     F .text.avm_run_destructors	00000077 avm_run_destructors
00000000 l    d  .text.avm_run_constructors	00000000 .text.avm_run_constructors
00000000 l    d  .text.avm_run_destructors	00000000 .text.avm_run_destructors
00000000 g     F .text._start	00000024 _start
00000000         *UND*	00000000 avm_test_main
00000000         *UND*	00000000 avm_halt
00000000         *UND*	00000000 __init_array_end
00000000         *UND*	00000000 __init_array_start
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000000         *UND*	00000000 __fini_array_start
00000000         *UND*	00000000 __fini_array_end

Disassembly of section .text._start:

<_start>:
 b0                    push16	r0
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_run_constructors
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e3 00 00 00           callf	_start
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.avm_run_constructors:

<avm_run_constructors>:
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
 e2 00 00 00           jmpf	avm_run_constructors
		R_AVM_FAR24	.text.avm_run_constructors+0x45
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
 e2 00 00 00           jmpf	avm_run_constructors
		R_AVM_FAR24	.text.avm_run_constructors+0x2e
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_run_destructors:

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__avm_run_local_dtors
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__avm_run_local_dtors
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_run_destructors
		R_AVM_FAR24	.text.avm_run_destructors+0x1a
<L0>:
 e3 00 00 00           callf	avm_run_destructors
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_run_local_dtors
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__fini_array_start
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__fini_array_end
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__fini_array_end
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_run_destructors
		R_AVM_FAR24	.text.avm_run_destructors+0x5c
<L1>:
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	__fini_array_end
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	__fini_array_end
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	__fini_array_start
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_run_destructors
		R_AVM_FAR24	.text.avm_run_destructors+0x45
<L2>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__avm_run_local_dtors
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__avm_run_local_dtors
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_run_destructors
		R_AVM_FAR24	.text.avm_run_destructors+0x70
<L3>:
 e3 00 00 00           callf	avm_run_destructors
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_run_local_dtors
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
