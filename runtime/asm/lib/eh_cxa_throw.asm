
eh_cxa_throw.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	00000038 __cxa_throw
00000000         *UND*	00000000 __avm_eh_throw

Disassembly of section .text:

<__cxa_throw>:
 c8 cb                 addi.s8	r4, -0x35
 ee 18 24              st16	[r4+4], r0
 ee 38 26              st16	[r4+6], r1
 ee 58 28              st16	[r4+8], r2
 ee 78 2a              st16	[r4+10], r3
 ee d8 2c              st16	[r4+12], r6
 ee e8 2e              st8	[r4+14], r7
 f0 30 03              ldsp16	r0, [sp+0x3]
 ee 18 2f              st16	[r4+15], r0
 f0 18 05              ldsp8u	r0, [sp+0x5]
 ee 08 31              st8	[r4+17], r0
 f0 30 00              ldsp16	r0, [sp+0x0]
 ee 18 21              st16	[r4+1], r0
 f0 18 02              ldsp8u	r0, [sp+0x2]
 ee 08 23              st8	[r4+3], r0
 f1 80                 getsp	r0
 c5 fd 09              ldi16	r5, 0x9fd
 f2 54                 sub	r5, r0
 51                    st8	[r4], r5
 e2 00 00 00           jmpf	__cxa_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_throw
