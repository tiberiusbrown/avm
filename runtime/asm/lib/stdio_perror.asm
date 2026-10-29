
stdio_perror.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_perror.c
00000000 l    d  .text.perror	00000000 .text.perror
00000000 g     F .text.perror	0000005b perror
00000000         *UND*	00000000 __avm_errno
00000000         *UND*	00000000 strerror
00000000         *UND*	00000000 __avm_stderr
00000000         *UND*	00000000 fputs
00000000         *UND*	00000000 fputc

Disassembly of section .text.perror:

<perror>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	__avm_errno
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strerror
 f1 25                 mov	r5, r1
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	perror
		R_AVM_FAR24	.text.perror+0x41
<L0>:
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	perror
		R_AVM_FAR24	.text.perror+0x41
<L1>:
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_stderr
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputs
 c0 3a                 ldi8	r4, 0x3a
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputc
 c0 20                 ldi8	r4, 0x20
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputc
 f1 22                 mov	r4, r2
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_stderr
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputs
 c0 0a                 ldi8	r4, 0xa
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	perror
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputc
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
