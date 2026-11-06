
libcxx_expected.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 expected.cpp
00000000 l    d  .text._ZNKSt3__119bad_expected_accessIvE4whatEv	00000000 .text._ZNKSt3__119bad_expected_accessIvE4whatEv
00000000 l    d  .text._ZNSt3__119bad_expected_accessIvED0Ev	00000000 .text._ZNSt3__119bad_expected_accessIvED0Ev
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNKSt3__119bad_expected_accessIvE4whatEv	00000004 std::__1::bad_expected_access<void>::what() const
00000000  w    F .text._ZNSt3__119bad_expected_accessIvED0Ev	00000010 std::__1::bad_expected_access<void>::~bad_expected_access()
00000000         *UND*	00000000 std::exception::~exception()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     O .rodata._ZTVNSt3__119bad_expected_accessIvEE	0000000f vtable for std::__1::bad_expected_access<void>

Disassembly of section .text._ZNKSt3__119bad_expected_accessIvE4whatEv:

<std::__1::bad_expected_access<void>::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text._ZNSt3__119bad_expected_accessIvED0Ev:

<std::__1::bad_expected_access<void>::~bad_expected_access()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt3__119bad_expected_accessIvED0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt3__119bad_expected_accessIvED0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
