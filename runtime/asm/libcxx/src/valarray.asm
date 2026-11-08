
libcxx_valarray.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 valarray.cpp
00000000 l       .group	00000000 std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000 l    d  .text._ZNSt3__18valarrayIjEC2Ej	00000000 .text._ZNSt3__18valarrayIjEC2Ej
00000000 l       .group	00000000 std::__1::valarray<unsigned int>::~valarray()
00000000 l    d  .text._ZNSt3__18valarrayIjED2Ev	00000000 .text._ZNSt3__18valarrayIjED2Ev
00000000 l    d  .text._ZNSt3__18valarrayIjE6resizeEjj	00000000 .text._ZNSt3__18valarrayIjE6resizeEjj
00000000 l    d  .text._ZNSt3__16gslice6__initEj	00000000 .text._ZNSt3__16gslice6__initEj
00000000 l    d  .text._ZNSt3__16gslice18__avm_init_indicesEj	00000000 .text._ZNSt3__16gslice18__avm_init_indicesEj
00000000 l    d  .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v	00000000 .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text._ZNSt3__18valarrayIjEC2Ej	0000003c std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000         *UND*	00000000 operator new(unsigned int)
00000000  w    F .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v	00000025 std::__throw_bad_array_new_length[abi:n240000ie23]()
00000000  w    F .text._ZNSt3__18valarrayIjED2Ev	00000032 std::__1::valarray<unsigned int>::~valarray()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000  w    F .text._ZNSt3__18valarrayIjE6resizeEjj	0000006c std::__1::valarray<unsigned int>::resize(unsigned int, unsigned int)
00000000 g     F .text._ZNSt3__16gslice6__initEj	0000009f std::__1::gslice::__init(unsigned int)
00000000 g     F .text._ZNSt3__16gslice18__avm_init_indicesEj	00000083 std::__1::gslice::__avm_init_indices(unsigned int)
00000000         *UND*	00000000 __cxa_allocate_exception
00000000         *UND*	00000000 std::bad_array_new_length::bad_array_new_length()
00000000         *UND*	00000000 std::bad_array_new_length::~bad_array_new_length()
00000000  w    O .rodata._ZTISt20bad_array_new_length	00000009 typeinfo for std::bad_array_new_length
00000000         *UND*	00000000 __cxa_throw
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000  w    O .rodata._ZTSSt20bad_array_new_length	00000019 typeinfo name for std::bad_array_new_length
00000000  w    O .rodata._ZTISt9bad_alloc	00000009 typeinfo for std::bad_alloc
00000000  w    O .rodata._ZTSSt9bad_alloc	0000000d typeinfo name for std::bad_alloc
00000000  w    O .rodata._ZTISt9exception	00000006 typeinfo for std::exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000  w    O .rodata._ZTSSt9exception	0000000d typeinfo name for std::exception
00000000  w    F .text._ZNSt3__18valarrayIjEC2Ej	0000003c std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000  w    F .text._ZNSt3__18valarrayIjED2Ev	00000032 std::__1::valarray<unsigned int>::~valarray()

Disassembly of section .text._ZNSt3__18valarrayIjEC2Ej:

<std::__1::valarray<unsigned int>::valarray(unsigned int)>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 6b 80              st32	[r0], q2
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjEC2Ej
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjEC2Ej+0x35
<L0>:
 f6 29                 tst16	r1
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjEC2Ej
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjEC2Ej+0x38
<L1>:
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 e3 00 00 00           callf	_ZNSt3__18valarrayIjEC2Ej
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)
 ee 90 20              st16	[r0+0], r4
 a5                    xor	r5, r5
 f7 45                 st16	[r4+], r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjEC2Ej
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjEC2Ej+0x26
<L2>:
 ee 90 22              st16	[r0+2], r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 e3 00 00 00           callf	_ZNSt3__18valarrayIjEC2Ej
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__throw_bad_array_new_length[abi:n240000ie23]()

Disassembly of section .text._ZNSt3__18valarrayIjED2Ev:

<std::__1::valarray<unsigned int>::~valarray()>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 ed 12 22              ld16	r0, [r1+2]
 ed 92 20              ld16	r4, [r1+0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjED2Ev
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjED2Ev+0x2f
<L0>:
 f1 24                 mov	r5, r0
 24                    sub	r5, r4
 f5 04                 cmp	r0, r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjED2Ev
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjED2Ev+0x2b
<L1>:
 0c                    mov	r7, r4
 f2 5c                 sub	r7, r0
 f4 af                 inc16	r7
 c6 fe ff              ldi16	r6, 0xfffe
 8b                    and	r6, r7
 f2 28                 add	r6, r0
 ee d2 22              st16	[r1+2], r6
 e3 00 00 00           callf	_ZNSt3__18valarrayIjED2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text._ZNSt3__18valarrayIjE6resizeEjj:

<std::__1::valarray<unsigned int>::resize(unsigned int, unsigned int)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f1 15                 mov	r2, r5
 f1 0c                 mov	r1, r4
 ed 72 22              ld16	r3, [r1+2]
 ed 92 20              ld16	r4, [r1+0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjE6resizeEjj+0x3a
<L0>:
 f1 27                 mov	r5, r3
 24                    sub	r5, r4
 f5 1c                 cmp	r3, r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjE6resizeEjj+0x31
<L1>:
 0c                    mov	r7, r4
 f2 5f                 sub	r7, r3
 f4 af                 inc16	r7
 c6 fe ff              ldi16	r6, 0xfffe
 8b                    and	r6, r7
 f2 2b                 add	r6, r3
 ee d2 22              st16	[r1+2], r6
 e3 00 00 00           callf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 6b 82              st32	[r1], q2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjE6resizeEjj+0x63
<L2>:
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjE6resizeEjj+0x68
<L3>:
 f1 22                 mov	r4, r2
 10                    add	r4, r4
 e3 00 00 00           callf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)
 ee 92 20              st16	[r1+0], r4
 f7 40                 st16	[r4+], r0
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_FAR24	.text._ZNSt3__18valarrayIjE6resizeEjj+0x54
<L4>:
 ee 92 22              st16	[r1+2], r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	_ZNSt3__18valarrayIjE6resizeEjj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__throw_bad_array_new_length[abi:n240000ie23]()

Disassembly of section .text._ZNSt3__16gslice6__initEj:

<std::__1::gslice::__init(unsigned int)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 ed 92 20              ld16	r4, [r1+0]
 ed b2 22              ld16	r5, [r1+2]
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x2f
<L0>:
 24                    sub	r5, r4
 f0 02 01              ldi8	r2, 0x1
 f4 95                 asr16.1	r5
 f1 2a                 mov	r6, r2
 f7 22                 ld16	r2, [r4+]
 fe 16                 mul16	r2, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x1b
<L1>:
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x31
 f2 42                 sub	r2, r2
 ed 72 2a              ld16	r3, [r1+10]
 ed 92 28              ld16	r4, [r1+8]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x65
<L2>:
 f1 27                 mov	r5, r3
 24                    sub	r5, r4
 f5 1c                 cmp	r3, r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x58
<L3>:
 0c                    mov	r7, r4
 f2 5f                 sub	r7, r3
 f4 af                 inc16	r7
 c6 fe ff              ldi16	r6, 0xfffe
 8b                    and	r6, r7
 f2 2b                 add	r6, r3
 ee d2 2a              st16	[r1+10], r6
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
 f1 21                 mov	r4, r1
 c8 08                 addi.s8	r4, 0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x8f
<L4>:
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x9b
<L5>:
 f1 22                 mov	r4, r2
 10                    add	r4, r4
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)
 ee 92 28              st16	[r1+8], r4
 a5                    xor	r5, r5
 f7 45                 st16	[r4+], r5
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x80
<L6>:
 ee 92 2a              st16	[r1+10], r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__1::gslice::__avm_init_indices(unsigned int)
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__throw_bad_array_new_length[abi:n240000ie23]()

Disassembly of section .text._ZNSt3__16gslice18__avm_init_indicesEj:

<std::__1::gslice::__avm_init_indices(unsigned int)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 59                 stsp16	[sp+0x6], r5
 ed b8 28              ld16	r5, [r4+8]
 ed f8 2a              ld16	r7, [r4+10]
 f4 61                 stsp16	[sp+0x8], r5
 0b                    mov	r6, r7
 3d                    cmp	r7, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice18__avm_init_indicesEj
		R_AVM_FAR24	.text._ZNSt3__16gslice18__avm_init_indicesEj+0x7c
<L0>:
 f4 21                 ldsp16	r5, [sp+0x8]
 29                    sub	r6, r5
 f4 96                 asr16.1	r6
 f4 52                 stsp16	[sp+0x4], r6
 f2 42                 sub	r2, r2
 ed 38 24              ld16	r1, [r4+4]
 6c                    ld16	r7, [r4]
 ed 98 22              ld16	r4, [r4+2]
 f4 48                 stsp16	[sp+0x2], r4
 23                    sub	r4, r7
 f4 94                 asr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 73                 stsp16	[sp+0xc], r7
 f4 08                 ldsp16	r4, [sp+0x2]
 33                    cmp	r4, r7
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 33 00              ldsp16	r3, [sp+0x0]
 f0 3a 0a              stsp16	[sp+0xa], r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice18__avm_init_indicesEj
		R_AVM_FAR24	.text._ZNSt3__16gslice18__avm_init_indicesEj+0x66
<L1>:
 f4 b3                 dec16	r3
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 0b                    mov	r6, r7
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 f1 2e                 mov	r7, r2
 ec 3e                 udiv16	r7, r6
 f1 07                 mov	r0, r7
 fe 06                 mul16	r0, r6
 f2 40                 sub	r2, r0
 f2 21                 add	r4, r1
 60                    ld16	r4, [r4]
 fe 22                 mul16	r4, r2
 14                    add	r5, r4
 f6 2b                 tst16	r3
 f1 17                 mov	r2, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice18__avm_init_indicesEj
		R_AVM_FAR24	.text._ZNSt3__16gslice18__avm_init_indicesEj+0x42
<L2>:
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 22                 mov	r4, r2
 10                    add	r4, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 71                    st16	[r4], r5
 f4 aa                 inc16	r2
 f4 10                 ldsp16	r4, [sp+0x4]
 f5 14                 cmp	r2, r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice18__avm_init_indicesEj
		R_AVM_FAR24	.text._ZNSt3__16gslice18__avm_init_indicesEj+0x31
<L3>:
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v:

<std::__throw_bad_array_new_length[abi:n240000ie23]()>:
 b0                    push16	r0
 c0 03                 ldi8	r4, 0x3
 e3 00 00 00           callf	_ZSt28__throw_bad_array_new_lengthB11n240000ie23v
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_allocate_exception
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZSt28__throw_bad_array_new_lengthB11n240000ie23v
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::bad_array_new_length::bad_array_new_length()
 d6 fd                 adjsp	-0x3
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	std::bad_array_new_length::~bad_array_new_length()
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	std::bad_array_new_length::~bad_array_new_length()
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	typeinfo for std::bad_array_new_length
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	typeinfo for std::bad_array_new_length
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZSt28__throw_bad_array_new_lengthB11n240000ie23v
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_throw
 d6 03                 adjsp	0x3
