
cxxabi.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cxxabi.cpp
00000000 l    d  .text.__cxa_pure_virtual	00000000 .text.__cxa_pure_virtual
00000000 l    d  .text.__cxa_deleted_virtual	00000000 .text.__cxa_deleted_virtual
00000000 l    d  .text._ZNSt9type_infoD2Ev	00000000 .text._ZNSt9type_infoD2Ev
00000000 l    d  .text._ZNSt9type_infoD0Ev	00000000 .text._ZNSt9type_infoD0Ev
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text.__cxa_pure_virtual	00000004 __cxa_pure_virtual
00000000         *UND*	00000000 avm_halt
00000000  w    F .text.__cxa_deleted_virtual	00000004 __cxa_deleted_virtual
00000000 g     F .text._ZNSt9type_infoD2Ev	00000001 std::type_info::~type_info()
00000000 g     F .text._ZNSt9type_infoD0Ev	00000006 std::type_info::~type_info()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
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

Disassembly of section .text._ZNSt9type_infoD2Ev:

<std::type_info::~type_info()>:
 ef                    ret

Disassembly of section .text._ZNSt9type_infoD0Ev:

<std::type_info::~type_info()>:
 c1 06                 ldi8	r5, 0x6
 e2 00 00 00           jmpf	_ZNSt9type_infoD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
