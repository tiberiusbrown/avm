
cxxabi.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cxxabi.cpp
00000000 l    d  .text.__cxa_pure_virtual	00000000 .text.__cxa_pure_virtual
00000000 l    d  .text.__cxa_deleted_virtual	00000000 .text.__cxa_deleted_virtual
00000000 l    d  .text._ZdlPv	00000000 .text._ZdlPv
00000000 l    d  .text._ZdaPv	00000000 .text._ZdaPv
00000000 l    d  .text._ZdlPvj	00000000 .text._ZdlPvj
00000000 l    d  .text._ZdaPvj	00000000 .text._ZdaPvj
00000000 l    d  .text._ZSt9terminatev	00000000 .text._ZSt9terminatev
00000000 l    d  .text._ZNSt9type_infoD2Ev	00000000 .text._ZNSt9type_infoD2Ev
00000000 l    d  .text._ZNSt9type_infoD0Ev	00000000 .text._ZNSt9type_infoD0Ev
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text.__cxa_pure_virtual	00000004 __cxa_pure_virtual
00000000         *UND*	00000000 avm_halt
00000000  w    F .text.__cxa_deleted_virtual	00000004 __cxa_deleted_virtual
00000000  w    F .text._ZdlPv	00000004 operator delete(void*)
00000000  w    F .text._ZdaPv	00000004 operator delete[](void*)
00000000  w    F .text._ZdlPvj	00000004 operator delete(void*, unsigned int)
00000000  w    F .text._ZdaPvj	00000004 operator delete[](void*, unsigned int)
00000000 g     F .text._ZSt9terminatev	00000004 std::terminate()
00000000         *UND*	00000000 abort
00000000 g     F .text._ZNSt9type_infoD2Ev	00000001 std::type_info::~type_info()
00000000 g     F .text._ZNSt9type_infoD0Ev	00000006 std::type_info::~type_info()
00000000 g     O .rodata._ZTVSt9type_info	0000000c vtable for std::type_info
00000000 g     F .text._ZNSt9type_infoD2Ev	00000001 std::type_info::~type_info()

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

Disassembly of section .text._ZSt9terminatev:

<std::terminate()>:
 e3 00 00 00           callf	_ZSt9terminatev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text._ZNSt9type_infoD2Ev:

<std::type_info::~type_info()>:
 ef                    ret

Disassembly of section .text._ZNSt9type_infoD0Ev:

<std::type_info::~type_info()>:
 c1 06                 ldi8	r5, 0x6
 e2 00 00 00           jmpf	_ZNSt9type_infoD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
