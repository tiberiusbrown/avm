
exception_base.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 exception_base.cpp
00000000 l    d  .text._ZNSt9exceptionD2Ev	00000000 .text._ZNSt9exceptionD2Ev
00000000 l    d  .text._ZNSt9exceptionD0Ev	00000000 .text._ZNSt9exceptionD0Ev
00000000 l    d  .text._ZNKSt9exception4whatEv	00000000 .text._ZNKSt9exception4whatEv
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt9exception
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt9exception
00000000 g     F .text._ZNSt9exceptionD2Ev	00000001 std::exception::~exception()
00000000 g     F .text._ZNSt9exceptionD0Ev	00000006 std::exception::~exception()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt9exception4whatEv	00000004 std::exception::what() const
00000000 g     O .rodata._ZTVSt9exception	0000000f vtable for std::exception
00000000 g     O .avm.rtti.type._ZTISt9exception	00000006 typeinfo for std::exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000 g     O .avm.rtti.name._ZTSSt9exception	0000000d typeinfo name for std::exception
00000000 g     F .text._ZNSt9exceptionD2Ev	00000001 std::exception::~exception()

Disassembly of section .text._ZNSt9exceptionD2Ev:

<std::exception::~exception()>:
 ef                    ret

Disassembly of section .text._ZNSt9exceptionD0Ev:

<std::exception::~exception()>:
 c1 03                 ldi8	r5, 0x3
 e2 00 00 00           jmpf	_ZNSt9exceptionD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt9exception4whatEv:

<std::exception::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret
