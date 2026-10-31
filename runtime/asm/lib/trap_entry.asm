
trap_entry.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text.__avm_trap_entry	00000017 __avm_trap_entry
00000000         *UND*	00000000 __avm_trap_report

Disassembly of section .text.__avm_trap_entry:

<__avm_trap_entry>:
 c4 00 01              ldi16	r4, 0x100
 c5 00 09              ldi16	r5, 0x900
 c6 00 01              ldi16	r6, 0x100
 d7 0f                 sys	memcpy
 c7 00 0a              ldi16	r7, 0xa00
 f1 8f                 setsp	r7
 c4 00 02              ldi16	r4, 0x200
 e2 00 00 00           jmpf	__avm_trap_entry
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_trap_report
