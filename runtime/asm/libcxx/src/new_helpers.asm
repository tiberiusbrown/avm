
libcxx_new_helpers.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 new_helpers.cpp
00000000 l    d  .text.unlikely._ZSt17__throw_bad_allocv	00000000 .text.unlikely._ZSt17__throw_bad_allocv
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.unlikely._ZSt17__throw_bad_allocv	00000025 std::__throw_bad_alloc()
00000000         *UND*	00000000 __cxa_allocate_exception
00000000         *UND*	00000000 std::bad_alloc::bad_alloc()
00000000         *UND*	00000000 std::bad_alloc::~bad_alloc()
00000000  w    O .rodata._ZTISt9bad_alloc	00000009 typeinfo for std::bad_alloc
00000000         *UND*	00000000 __cxa_throw
00000000 g     O .flash._ZSt7nothrow	00000001 std::nothrow
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000  w    O .rodata._ZTSSt9bad_alloc	0000000d typeinfo name for std::bad_alloc
00000000  w    O .rodata._ZTISt9exception	00000006 typeinfo for std::exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000  w    O .rodata._ZTSSt9exception	0000000d typeinfo name for std::exception

Disassembly of section .text.unlikely._ZSt17__throw_bad_allocv:

<std::__throw_bad_alloc()>:
 b0                    push16	r0
 c0 03                 ldi8	r4, 0x3
 e3 00 00 00           callf	_ZSt17__throw_bad_allocv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_allocate_exception
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZSt17__throw_bad_allocv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::bad_alloc::bad_alloc()
 d6 fd                 adjsp	-0x3
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	std::bad_alloc::~bad_alloc()
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	std::bad_alloc::~bad_alloc()
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	typeinfo for std::bad_alloc
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	typeinfo for std::bad_alloc
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZSt17__throw_bad_allocv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_throw
 d6 03                 adjsp	0x3
