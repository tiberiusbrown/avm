
libcxx_any.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 any.cpp
00000000 l    d  .text._ZNKSt12bad_any_cast4whatEv	00000000 .text._ZNKSt12bad_any_cast4whatEv
00000000 l    d  .text._ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv	00000000 .text._ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv
00000000 l    d  .text._ZNSt12bad_any_castD0Ev	00000000 .text._ZNSt12bad_any_castD0Ev
00000000 l    d  .text._ZNSt12experimental15fundamentals_v112bad_any_castD0Ev	00000000 .text._ZNSt12experimental15fundamentals_v112bad_any_castD0Ev
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNKSt12bad_any_cast4whatEv	00000004 std::bad_any_cast::what() const
00000000 g     F .text._ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv	00000004 std::experimental::fundamentals_v1::bad_any_cast::what() const
00000000  w    F .text._ZNSt12bad_any_castD0Ev	00000010 std::bad_any_cast::~bad_any_cast()
00000000         *UND*	00000000 std::bad_cast::~bad_cast()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000  w    F .text._ZNSt12experimental15fundamentals_v112bad_any_castD0Ev	00000010 std::experimental::fundamentals_v1::bad_any_cast::~bad_any_cast()
00000000 g     O .rodata._ZTVSt12bad_any_cast	0000000f vtable for std::bad_any_cast
00000000 g     O .rodata._ZTVNSt12experimental15fundamentals_v112bad_any_castE	0000000f vtable for std::experimental::fundamentals_v1::bad_any_cast

Disassembly of section .text._ZNKSt12bad_any_cast4whatEv:

<std::bad_any_cast::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text._ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv:

<std::experimental::fundamentals_v1::bad_any_cast::what() const>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.flash.str1.1
 ef                    ret

Disassembly of section .text._ZNSt12bad_any_castD0Ev:

<std::bad_any_cast::~bad_any_cast()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt12bad_any_castD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::bad_cast::~bad_cast()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt12bad_any_castD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNSt12experimental15fundamentals_v112bad_any_castD0Ev:

<std::experimental::fundamentals_v1::bad_any_cast::~bad_any_cast()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt12experimental15fundamentals_v112bad_any_castD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::bad_cast::~bad_cast()
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt12experimental15fundamentals_v112bad_any_castD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
