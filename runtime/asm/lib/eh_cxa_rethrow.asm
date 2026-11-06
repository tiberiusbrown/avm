
eh_cxa_rethrow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	00000028 __cxa_rethrow
00000000         *UND*	00000000 __avm_eh_rethrow_header
00000000         *UND*	00000000 __avm_eh_rethrow

Disassembly of section .text:

<__cxa_rethrow>:
 e3 00 00 00           callf	__cxa_rethrow
		R_AVM_FAR24	__avm_eh_rethrow_header
 ee 18 24              st16	[r4+4], r0
 ee 38 26              st16	[r4+6], r1
 ee 58 28              st16	[r4+8], r2
 ee 78 2a              st16	[r4+10], r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 ee 18 21              st16	[r4+1], r0
 f0 18 02              ldsp8u	r0, [sp+0x2]
 ee 08 23              st8	[r4+3], r0
 f1 80                 getsp	r0
 c5 fd 09              ldi16	r5, 0x9fd
 f2 54                 sub	r5, r0
 51                    st8	[r4], r5
 e2 00 00 00           jmpf	__cxa_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_rethrow
