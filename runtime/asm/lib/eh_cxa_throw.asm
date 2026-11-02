
eh_cxa_throw.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	00000037 __cxa_throw
00000000         *UND*	00000000 __avm_eh_throw

Disassembly of section .text:

<__cxa_throw>:
 c8 d5                 addi.s8	r4, -0x2b
 ee 18 25              st16	[r4+5], r0
 ee 38 27              st16	[r4+7], r1
 ee 58 29              st16	[r4+9], r2
 ee 78 2b              st16	[r4+11], r3
 ee d8 2f              st16	[r4+15], r6
 ee e8 31              st8	[r4+17], r7
 f0 30 03              ldsp16	r0, [sp+0x3]
 ee 18 32              st16	[r4+18], r0
 f0 18 05              ldsp8u	r0, [sp+0x5]
 ee 08 34              st8	[r4+20], r0
 f0 30 00              ldsp16	r0, [sp+0x0]
 ee 18 22              st16	[r4+2], r0
 f0 18 02              ldsp8u	r0, [sp+0x2]
 ee 08 24              st8	[r4+4], r0
 f1 80                 getsp	r0
 f0 08 03              addi.s8	r0, 0x3
 f5 50                 st16	[r4], r0
 e2 00 00 00           jmpf	__cxa_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_throw
