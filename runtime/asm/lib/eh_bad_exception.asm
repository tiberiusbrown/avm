
eh_bad_exception.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_bad_exception.cpp
00000000 l    d  .text._ZNSt13bad_exceptionD2Ev	00000000 .text._ZNSt13bad_exceptionD2Ev
00000000 l    d  .text._ZNSt13bad_exceptionD0Ev	00000000 .text._ZNSt13bad_exceptionD0Ev
00000000 l    d  .text._ZNKSt13bad_exception4whatEv	00000000 .text._ZNKSt13bad_exception4whatEv
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt13bad_exception
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt13bad_exception
00000000 g     F .text._ZNSt13bad_exceptionD2Ev	00000004 std::bad_exception::~bad_exception()
00000000         *UND*	00000000 std::exception::~exception()
00000000 g     F .text._ZNSt13bad_exceptionD0Ev	00000010 std::bad_exception::~bad_exception()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt13bad_exception4whatEv	00000004 std::bad_exception::what() const
00000000 g     O .rodata._ZTVSt13bad_exception	0000000f vtable for std::bad_exception
00000000 g     O .avm.rtti.type._ZTISt13bad_exception	00000009 typeinfo for std::bad_exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .avm.rtti.name._ZTSSt13bad_exception	00000012 typeinfo name for std::bad_exception
00000000         *UND*	00000000 typeinfo for std::exception
00000000 g     F .text._ZNSt13bad_exceptionD2Ev	00000004 std::bad_exception::~bad_exception()

Disassembly of section .text._ZNSt13bad_exceptionD2Ev:

<std::bad_exception::~bad_exception()>:
 e2 00 00 00           jmpf	_ZNSt13bad_exceptionD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()

Disassembly of section .text._ZNSt13bad_exceptionD0Ev:

<std::bad_exception::~bad_exception()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt13bad_exceptionD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt13bad_exceptionD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt13bad_exception4whatEv:

<std::bad_exception::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret
