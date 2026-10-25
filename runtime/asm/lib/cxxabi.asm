
cxxabi.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cxxabi.cpp
00000000 l    d  .text.abort	00000000 .text.abort
00000000 l    d  .text.__cxa_pure_virtual	00000000 .text.__cxa_pure_virtual
00000000 l    d  .text.__cxa_deleted_virtual	00000000 .text.__cxa_deleted_virtual
00000000 l    d  .text._ZdlPv	00000000 .text._ZdlPv
00000000 l    d  .text._ZdaPv	00000000 .text._ZdaPv
00000000 l    d  .text._ZdlPvj	00000000 .text._ZdlPvj
00000000 l    d  .text._ZdaPvj	00000000 .text._ZdaPvj
00000000  w    F .text.abort	00000004 abort
00000000         *UND*	00000000 avm_halt
00000000  w    F .text.__cxa_pure_virtual	00000004 __cxa_pure_virtual
00000000  w    F .text.__cxa_deleted_virtual	00000004 __cxa_deleted_virtual
00000000  w    F .text._ZdlPv	00000004 operator delete(void*)
00000000  w    F .text._ZdaPv	00000004 operator delete[](void*)
00000000  w    F .text._ZdlPvj	00000004 operator delete(void*, unsigned int)
00000000  w    F .text._ZdaPvj	00000004 operator delete[](void*, unsigned int)

Disassembly of section .text.abort:

<abort>:
 e3 00 00 00           callf	abort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__cxa_pure_virtual:

<__cxa_pure_virtual>:
 e3 00 00 00           callf	__cxa_pure_virtual
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__cxa_deleted_virtual:

<__cxa_deleted_virtual>:
 e3 00 00 00           callf	__cxa_deleted_virtual
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text._ZdlPv:

<operator delete(void*)>:
 e3 00 00 00           callf	_ZdlPv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text._ZdaPv:

<operator delete[](void*)>:
 e3 00 00 00           callf	_ZdaPv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text._ZdlPvj:

<operator delete(void*, unsigned int)>:
 e3 00 00 00           callf	_ZdlPvj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text._ZdaPvj:

<operator delete[](void*, unsigned int)>:
 e3 00 00 00           callf	_ZdaPvj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
