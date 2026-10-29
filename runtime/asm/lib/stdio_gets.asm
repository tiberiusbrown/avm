
stdio_gets.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_gets.c
00000000 l    d  .text.gets	00000000 .text.gets
00000000 g     F .text.gets	00000046 gets
00000000         *UND*	00000000 __avm_stdin
00000000         *UND*	00000000 fgetc

Disassembly of section .text.gets:

<gets>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f2 4b                 sub	r3, r3
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_stdin
 f1 10                 mov	r2, r0
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	gets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fgetc
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	gets
		R_AVM_FAR24	.text.gets+0x2d
<L0>:
 cc 0a                 cmpi.s8	r4, 0xa
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	gets
		R_AVM_FAR24	.text.gets+0x35
<L1>:
 f0 6d 85              st8	[r2+], r4
 f4 b3                 dec16	r3
 e2 00 00 00           jmpf	gets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.gets+0xe
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	gets
		R_AVM_FAR24	.text.gets+0x40
<L2>:
 a0                    xor	r4, r4
 ee 84 20              st8	[r2+0], r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	gets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.gets+0x39
