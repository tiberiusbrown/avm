
libcxx_functional.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 libcxx_functional.cpp
00000000 l    d  .text._ZNSt3__117bad_function_callD2Ev	00000000 .text._ZNSt3__117bad_function_callD2Ev
00000000 l    d  .text._ZNSt3__117bad_function_callD0Ev	00000000 .text._ZNSt3__117bad_function_callD0Ev
00000000 l    d  .text._ZNKSt3__117bad_function_call4whatEv	00000000 .text._ZNKSt3__117bad_function_call4whatEv
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTINSt3__117bad_function_callE
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSNSt3__117bad_function_callE
00000000 g     F .text._ZNSt3__117bad_function_callD2Ev	00000004 std::__1::bad_function_call::~bad_function_call()
00000000         *UND*	00000000 std::exception::~exception()
00000000 g     F .text._ZNSt3__117bad_function_callD0Ev	00000010 std::__1::bad_function_call::~bad_function_call()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt3__117bad_function_call4whatEv	00000004 std::__1::bad_function_call::what() const
00000000 g     O .rodata._ZTVNSt3__117bad_function_callE	0000000f vtable for std::__1::bad_function_call
00000000 g     O .avm.rtti.type._ZTINSt3__117bad_function_callE	00000009 typeinfo for std::__1::bad_function_call
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .avm.rtti.name._ZTSNSt3__117bad_function_callE	0000001c typeinfo name for std::__1::bad_function_call
00000000         *UND*	00000000 typeinfo for std::exception
00000000 g     F .text._ZNSt3__117bad_function_callD2Ev	00000004 std::__1::bad_function_call::~bad_function_call()

Disassembly of section .text._ZNSt3__117bad_function_callD2Ev:

<std::__1::bad_function_call::~bad_function_call()>:
 e2 00 00 00           jmpf	_ZNSt3__117bad_function_callD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()

Disassembly of section .text._ZNSt3__117bad_function_callD0Ev:

<std::__1::bad_function_call::~bad_function_call()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt3__117bad_function_callD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt3__117bad_function_callD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt3__117bad_function_call4whatEv:

<std::__1::bad_function_call::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret
