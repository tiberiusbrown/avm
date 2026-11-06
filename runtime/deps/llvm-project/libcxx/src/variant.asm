
libcxx_variant.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 variant.cpp
00000000 l    d  .text._ZNKSt18bad_variant_access4whatEv	00000000 .text._ZNKSt18bad_variant_access4whatEv
00000000 l    d  .text._ZNKSt29__bad_variant_access_with_msg4whatEv	00000000 .text._ZNKSt29__bad_variant_access_with_msg4whatEv
00000000 l    d  .text._ZNSt18bad_variant_accessD0Ev	00000000 .text._ZNSt18bad_variant_accessD0Ev
00000000 l    d  .text._ZNSt29__bad_variant_access_with_msgD0Ev	00000000 .text._ZNSt29__bad_variant_access_with_msgD0Ev
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNKSt18bad_variant_access4whatEv	00000004 std::bad_variant_access::what() const
00000000 g     F .text._ZNKSt29__bad_variant_access_with_msg4whatEv	00000004 std::__bad_variant_access_with_msg::what() const
00000000  w    F .text._ZNSt18bad_variant_accessD0Ev	00000010 std::bad_variant_access::~bad_variant_access()
00000000         *UND*	00000000 std::exception::~exception()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000  w    F .text._ZNSt29__bad_variant_access_with_msgD0Ev	00000010 std::__bad_variant_access_with_msg::~__bad_variant_access_with_msg()
00000000 g     O .rodata._ZTVSt18bad_variant_access	0000000f vtable for std::bad_variant_access
00000000 g     O .rodata._ZTVSt29__bad_variant_access_with_msg	0000000f vtable for std::__bad_variant_access_with_msg

Disassembly of section .text._ZNKSt18bad_variant_access4whatEv:

<std::bad_variant_access::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text._ZNKSt29__bad_variant_access_with_msg4whatEv:

<std::__bad_variant_access_with_msg::what() const>:
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

Disassembly of section .text._ZNSt18bad_variant_accessD0Ev:

<std::bad_variant_access::~bad_variant_access()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt18bad_variant_accessD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt18bad_variant_accessD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNSt29__bad_variant_access_with_msgD0Ev:

<std::__bad_variant_access_with_msg::~__bad_variant_access_with_msg()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt29__bad_variant_access_with_msgD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::exception::~exception()
 c1 05                 ldi8	r5, 0x5
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt29__bad_variant_access_with_msgD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
