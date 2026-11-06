
new.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 new.cpp
00000000 l    d  .text._Znwj	00000000 .text._Znwj
00000000 l    d  .text._ZnwjRKSt9nothrow_t	00000000 .text._ZnwjRKSt9nothrow_t
00000000 l    d  .text.__clang_call_terminate	00000000 .text.__clang_call_terminate
00000000 l    d  .text._Znaj	00000000 .text._Znaj
00000000 l    d  .text._ZnajRKSt9nothrow_t	00000000 .text._ZnajRKSt9nothrow_t
00000000 l    d  .text._ZnwjSt11align_val_t	00000000 .text._ZnwjSt11align_val_t
00000000 l    d  .text._ZnwjSt11align_val_tRKSt9nothrow_t	00000000 .text._ZnwjSt11align_val_tRKSt9nothrow_t
00000000 l    d  .text._ZnajSt11align_val_t	00000000 .text._ZnajSt11align_val_t
00000000 l    d  .text._ZnajSt11align_val_tRKSt9nothrow_t	00000000 .text._ZnajSt11align_val_tRKSt9nothrow_t
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text._Znwj	00000064 operator new(unsigned int)
00000000         *UND*	00000000 malloc
00000000         *UND*	00000000 std::get_new_handler()
00000000         *UND*	00000000 __cxa_allocate_exception
00000000         *UND*	00000000 std::bad_alloc::bad_alloc()
00000000         *UND*	00000000 std::bad_alloc::~bad_alloc()
00000000  w    O .rodata._ZTISt9bad_alloc	00000009 typeinfo for std::bad_alloc
00000000         *UND*	00000000 __cxa_throw
00000000  w    F .text._ZnwjRKSt9nothrow_t	00000013 operator new(unsigned int, std::nothrow_t const&)
00000000         *UND*	00000000 __cxa_begin_catch
00000000         *UND*	00000000 __cxa_end_catch
00000000  w    F .text.__clang_call_terminate	00000008 .hidden __clang_call_terminate
00000000         *UND*	00000000 std::terminate()
00000000  w    F .text._Znaj	00000004 operator new[](unsigned int)
00000000  w    F .text._ZnajRKSt9nothrow_t	00000013 operator new[](unsigned int, std::nothrow_t const&)
00000000  w    F .text._ZnwjSt11align_val_t	000000e2 operator new(unsigned int, std::align_val_t)
00000000  w    F .text._ZnwjSt11align_val_tRKSt9nothrow_t	00000013 operator new(unsigned int, std::align_val_t, std::nothrow_t const&)
00000000  w    F .text._ZnajSt11align_val_t	00000004 operator new[](unsigned int, std::align_val_t)
00000000  w    F .text._ZnajSt11align_val_tRKSt9nothrow_t	00000013 operator new[](unsigned int, std::align_val_t, std::nothrow_t const&)
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000  w    O .rodata._ZTSSt9bad_alloc	0000000d typeinfo name for std::bad_alloc
00000000  w    O .rodata._ZTISt9exception	00000006 typeinfo for std::exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000  w    O .rodata._ZTSSt9exception	0000000d typeinfo name for std::exception

Disassembly of section .text._Znwj:

<operator new(unsigned int)>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f0 00 01              ldi8	r0, 0x1
 cc 02                 cmpi.s8	r4, 0x2
 fc 44                 cmov.uge	r0, r4
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_Znwj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Znwj
		R_AVM_FAR24	.text._Znwj+0x3c
<L0>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e3 00 00 00           callf	_Znwj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::get_new_handler()
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Znwj
		R_AVM_FAR24	.text._Znwj+0x40
<L1>:
 ea                    callp	q2
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_Znwj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Znwj
		R_AVM_FAR24	.text._Znwj+0x1c
<L2>:
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 03                 ldi8	r4, 0x3
 e3 00 00 00           callf	_Znwj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_allocate_exception
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_Znwj
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
 e3 00 00 00           callf	_Znwj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_throw
 d6 03                 adjsp	0x3

Disassembly of section .text._ZnwjRKSt9nothrow_t:

<operator new(unsigned int, std::nothrow_t const&)>:
 e3 00 00 00           callf	_ZnwjRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)
 ef                    ret
 e3 00 00 00           callf	_ZnwjRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_begin_catch
 e3 00 00 00           callf	_ZnwjRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_end_catch
 a0                    xor	r4, r4
 ef                    ret
 e3 00 00 00           callf	_ZnwjRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__clang_call_terminate

Disassembly of section .text.__clang_call_terminate:

<__clang_call_terminate>:
 e3 00 00 00           callf	__clang_call_terminate
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_begin_catch
 e3 00 00 00           callf	__clang_call_terminate
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::terminate()

Disassembly of section .text._Znaj:

<operator new[](unsigned int)>:
 e2 00 00 00           jmpf	_Znaj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)

Disassembly of section .text._ZnajRKSt9nothrow_t:

<operator new[](unsigned int, std::nothrow_t const&)>:
 e3 00 00 00           callf	_ZnajRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new[](unsigned int)
 ef                    ret
 e3 00 00 00           callf	_ZnajRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_begin_catch
 e3 00 00 00           callf	_ZnajRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_end_catch
 a0                    xor	r4, r4
 ef                    ret
 e3 00 00 00           callf	_ZnajRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__clang_call_terminate

Disassembly of section .text._ZnwjSt11align_val_t:

<operator new(unsigned int, std::align_val_t)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 0c 02              cmpi.s8	r0, 0x2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0xa2
<L0>:
 f4 b5                 dec16	r5
 f9 a0                 and	r5, r0
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x7e
<L1>:
 f0 01 01              ldi8	r1, 0x1
 cc 02                 cmpi.s8	r4, 0x2
 fc 4c                 cmov.uge	r1, r4
 c4 fe ff              ldi16	r4, 0xfffe
 f2 50                 sub	r4, r0
 f5 21                 cmp	r4, r1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x7e
<L2>:
 f1 20                 mov	r4, r0
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 f2 0c                 add	r1, r4
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x6b
<L3>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::get_new_handler()
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x7e
<L4>:
 ea                    callp	q2
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x4b
<L5>:
 a5                    xor	r5, r5
 f2 54                 sub	r5, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 18                    add	r6, r4
 89                    and	r6, r5
 ee 9c 1e              st16	[r6-2], r4
 02                    mov	r4, r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0xdb
<L6>:
 c0 03                 ldi8	r4, 0x3
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_allocate_exception
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZnwjSt11align_val_t
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
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_throw
 d6 03                 adjsp	0x3
 f0 00 01              ldi8	r0, 0x1
 cc 02                 cmpi.s8	r4, 0x2
 fc 44                 cmov.uge	r0, r4
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0xdb
<L7>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::get_new_handler()
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0x7e
<L8>:
 ea                    callp	q2
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZnwjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZnwjSt11align_val_t
		R_AVM_FAR24	.text._ZnwjSt11align_val_t+0xbb
<L9>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text._ZnwjSt11align_val_tRKSt9nothrow_t:

<operator new(unsigned int, std::align_val_t, std::nothrow_t const&)>:
 e3 00 00 00           callf	_ZnwjSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int, std::align_val_t)
 ef                    ret
 e3 00 00 00           callf	_ZnwjSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_begin_catch
 e3 00 00 00           callf	_ZnwjSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_end_catch
 a0                    xor	r4, r4
 ef                    ret
 e3 00 00 00           callf	_ZnwjSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__clang_call_terminate

Disassembly of section .text._ZnajSt11align_val_t:

<operator new[](unsigned int, std::align_val_t)>:
 e2 00 00 00           jmpf	_ZnajSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int, std::align_val_t)

Disassembly of section .text._ZnajSt11align_val_tRKSt9nothrow_t:

<operator new[](unsigned int, std::align_val_t, std::nothrow_t const&)>:
 e3 00 00 00           callf	_ZnajSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new[](unsigned int, std::align_val_t)
 ef                    ret
 e3 00 00 00           callf	_ZnajSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_begin_catch
 e3 00 00 00           callf	_ZnajSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_end_catch
 a0                    xor	r4, r4
 ef                    ret
 e3 00 00 00           callf	_ZnajSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__clang_call_terminate
