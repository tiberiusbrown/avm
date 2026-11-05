
eh_cxa_rethrow_primary.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	00000025 __avm_rethrow_primary_exception
00000000         *UND*	00000000 __avm_eh_rethrow_primary

Disassembly of section .text:

<__avm_rethrow_primary_exception>:
 c8 c5                 addi.s8	r4, -0x3b
 ee 18 25              st16	[r4+5], r0
 ee 38 27              st16	[r4+7], r1
 ee 58 29              st16	[r4+9], r2
 ee 78 2b              st16	[r4+11], r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 ee 18 22              st16	[r4+2], r0
 f0 18 02              ldsp8u	r0, [sp+0x2]
 ee 08 24              st8	[r4+4], r0
 f1 80                 getsp	r0
 f0 08 03              addi.s8	r0, 0x3
 f5 50                 st16	[r4], r0
 e2 00 00 00           jmpf	__avm_rethrow_primary_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_rethrow_primary
