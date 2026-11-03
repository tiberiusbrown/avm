
eh_bad_typeid.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_bad_typeid.cpp
00000000 l    d  .text._ZNSt10bad_typeidC2Ev	00000000 .text._ZNSt10bad_typeidC2Ev
00000000 l    d  .text._ZNSt10bad_typeidD2Ev	00000000 .text._ZNSt10bad_typeidD2Ev
00000000 l    d  .text._ZNSt10bad_typeidD0Ev	00000000 .text._ZNSt10bad_typeidD0Ev
00000000 l    d  .text._ZNKSt10bad_typeid4whatEv	00000000 .text._ZNKSt10bad_typeid4whatEv
00000000 l    d  .text.unlikely.__cxa_bad_typeid	00000000 .text.unlikely.__cxa_bad_typeid
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt10bad_typeid
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt10bad_typeid
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt9exception
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt9exception
00000000 g     F .text._ZNSt10bad_typeidC2Ev	00000009 std::bad_typeid::bad_typeid()
00000000 g     O .rodata._ZTVSt10bad_typeid	0000000f vtable for std::bad_typeid
00000000 g     F .text._ZNSt10bad_typeidD2Ev	00000004 std::bad_typeid::~bad_typeid()
00000000         *UND*	00000000 std::exception::~exception()
00000000 g     F .text._ZNSt10bad_typeidD0Ev	00000010 std::bad_typeid::~bad_typeid()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt10bad_typeid4whatEv	00000004 std::bad_typeid::what() const
00000000 g     F .text.unlikely.__cxa_bad_typeid	00000025 __cxa_bad_typeid
00000000         *UND*	00000000 __cxa_allocate_exception
00000000 g     O .avm.rtti.type._ZTISt10bad_typeid	00000009 typeinfo for std::bad_typeid
00000000         *UND*	00000000 __cxa_throw
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .avm.rtti.name._ZTSSt10bad_typeid	0000000f typeinfo name for std::bad_typeid
00000000         *UND*	00000000 typeinfo for std::exception
00000000 g     F .text._ZNSt10bad_typeidC2Ev	00000009 std::bad_typeid::bad_typeid()
00000000 g     F .text._ZNSt10bad_typeidD2Ev	00000004 std::bad_typeid::~bad_typeid()

Disassembly of section .text._ZNSt10bad_typeidC2Ev:

<std::bad_typeid::bad_typeid()>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for std::bad_typeid+0x6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for std::bad_typeid+0x6
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ef                    ret

Disassembly of section .text._ZNSt10bad_typeidD2Ev:

<std::bad_typeid::~bad_typeid()>:
 e2 00 00 00           jmpf	_ZNSt10bad_typeidD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()

Disassembly of section .text._ZNSt10bad_typeidD0Ev:

<std::bad_typeid::~bad_typeid()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt10bad_typeidD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt10bad_typeidD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt10bad_typeid4whatEv:

<std::bad_typeid::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text.unlikely.__cxa_bad_typeid:

<__cxa_bad_typeid>:
 c0 03                 ldi8	r4, 0x3
 e3 00 00 00           callf	__cxa_bad_typeid
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_allocate_exception
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for std::bad_typeid+0x6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for std::bad_typeid+0x6
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 d6 fd                 adjsp	-0x3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	std::bad_typeid::~bad_typeid()
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	std::bad_typeid::~bad_typeid()
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	typeinfo for std::bad_typeid
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	typeinfo for std::bad_typeid
 e3 00 00 00           callf	__cxa_bad_typeid
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_throw
 d6 03                 adjsp	0x3
