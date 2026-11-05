
eh_bad_alloc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_bad_alloc.cpp
00000000 l    d  .text._ZNSt9bad_allocC2Ev	00000000 .text._ZNSt9bad_allocC2Ev
00000000 l    d  .text._ZNSt9bad_allocD2Ev	00000000 .text._ZNSt9bad_allocD2Ev
00000000 l    d  .text._ZNSt9bad_allocD0Ev	00000000 .text._ZNSt9bad_allocD0Ev
00000000 l    d  .text._ZNKSt9bad_alloc4whatEv	00000000 .text._ZNKSt9bad_alloc4whatEv
00000000 l    d  .text._ZNSt20bad_array_new_lengthC2Ev	00000000 .text._ZNSt20bad_array_new_lengthC2Ev
00000000 l    d  .text._ZNSt20bad_array_new_lengthD0Ev	00000000 .text._ZNSt20bad_array_new_lengthD0Ev
00000000 l    d  .text._ZNKSt20bad_array_new_length4whatEv	00000000 .text._ZNKSt20bad_array_new_length4whatEv
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt20bad_array_new_length
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt20bad_array_new_length
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt9bad_alloc
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt9bad_alloc
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt9exception
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt9exception
00000000 g     F .text._ZNSt9bad_allocC2Ev	00000009 std::bad_alloc::bad_alloc()
00000000 g     O .rodata._ZTVSt9bad_alloc	0000000f vtable for std::bad_alloc
00000000 g     F .text._ZNSt9bad_allocD2Ev	00000004 std::bad_alloc::~bad_alloc()
00000000         *UND*	00000000 std::exception::~exception()
00000000 g     F .text._ZNSt9bad_allocD0Ev	00000010 std::bad_alloc::~bad_alloc()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt9bad_alloc4whatEv	00000004 std::bad_alloc::what() const
00000000 g     F .text._ZNSt20bad_array_new_lengthC2Ev	00000009 std::bad_array_new_length::bad_array_new_length()
00000000 g     O .rodata._ZTVSt20bad_array_new_length	0000000f vtable for std::bad_array_new_length
00000000 g     F .text._ZNSt20bad_array_new_lengthD0Ev	00000010 std::bad_array_new_length::~bad_array_new_length()
00000000 g     F .text._ZNKSt20bad_array_new_length4whatEv	00000004 std::bad_array_new_length::what() const
00000000 g     O .avm.rtti.type._ZTISt9bad_alloc	00000009 typeinfo for std::bad_alloc
00000000 g     O .avm.rtti.type._ZTISt20bad_array_new_length	00000009 typeinfo for std::bad_array_new_length
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .avm.rtti.name._ZTSSt20bad_array_new_length	00000019 typeinfo name for std::bad_array_new_length
00000000 g     O .avm.rtti.name._ZTSSt9bad_alloc	0000000d typeinfo name for std::bad_alloc
00000000         *UND*	00000000 typeinfo for std::exception
00000000 g     F .text._ZNSt9bad_allocC2Ev	00000009 std::bad_alloc::bad_alloc()
00000000 g     F .text._ZNSt9bad_allocD2Ev	00000004 std::bad_alloc::~bad_alloc()
00000000 g     F .text._ZNSt20bad_array_new_lengthC2Ev	00000009 std::bad_array_new_length::bad_array_new_length()
00000000 g     F .text._ZNSt9bad_allocD2Ev	00000004 std::bad_array_new_length::~bad_array_new_length()
00000000 g     F .text._ZNSt9bad_allocD2Ev	00000004 std::bad_array_new_length::~bad_array_new_length()

Disassembly of section .text._ZNSt9bad_allocC2Ev:

<std::bad_alloc::bad_alloc()>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for std::bad_alloc+0x6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for std::bad_alloc+0x6
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ef                    ret

Disassembly of section .text._ZNSt9bad_allocD2Ev:

<std::bad_alloc::~bad_alloc()>:
 e2 00 00 00           jmpf	_ZNSt9bad_allocD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()

Disassembly of section .text._ZNSt9bad_allocD0Ev:

<std::bad_alloc::~bad_alloc()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt9bad_allocD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt9bad_allocD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt9bad_alloc4whatEv:

<std::bad_alloc::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text._ZNSt20bad_array_new_lengthC2Ev:

<std::bad_array_new_length::bad_array_new_length()>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for std::bad_array_new_length+0x6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for std::bad_array_new_length+0x6
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ef                    ret

Disassembly of section .text._ZNSt20bad_array_new_lengthD0Ev:

<std::bad_array_new_length::~bad_array_new_length()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt20bad_array_new_lengthD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt20bad_array_new_lengthD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt20bad_array_new_length4whatEv:

<std::bad_array_new_length::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1+0xf
 ef                    ret
