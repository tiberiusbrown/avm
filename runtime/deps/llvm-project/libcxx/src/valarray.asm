
libcxx_valarray.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 valarray.cpp
00000000 l       .group	00000000 std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000 l    d  .text._ZNSt3__18valarrayIjEC2Ej	00000000 .text._ZNSt3__18valarrayIjEC2Ej
00000000 l       .group	00000000 std::__1::valarray<unsigned int>::~valarray()
00000000 l    d  .text._ZNSt3__18valarrayIjED2Ev	00000000 .text._ZNSt3__18valarrayIjED2Ev
00000000 l    d  .text._ZNSt3__18valarrayIjE6resizeEjj	00000000 .text._ZNSt3__18valarrayIjE6resizeEjj
00000000 l    d  .text._ZNSt3__16gslice6__initEj	00000000 .text._ZNSt3__16gslice6__initEj
00000000 l    d  .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v	00000000 .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text._ZNSt3__18valarrayIjEC2Ej	0000003c std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000         *UND*	00000000 operator new(unsigned int)
00000000  w    F .text._ZSt28__throw_bad_array_new_lengthB11n240000ie23v	00000025 std::__throw_bad_array_new_length[abi:n240000ie23]()
00000000  w    F .text._ZNSt3__18valarrayIjED2Ev	00000032 std::__1::valarray<unsigned int>::~valarray()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000  w    F .text._ZNSt3__18valarrayIjE6resizeEjj	0000006c std::__1::valarray<unsigned int>::resize(unsigned int, unsigned int)
00000000 g     F .text._ZNSt3__16gslice6__initEj	000001a7 std::__1::gslice::__init(unsigned int)
00000000  w    F .text._ZNSt3__18valarrayIjEC2Ej	0000003c std::__1::valarray<unsigned int>::valarray(unsigned int)
00000000  w    F .text._ZNSt3__18valarrayIjED2Ev	00000032 std::__1::valarray<unsigned int>::~valarray()
00000000         *UND*	00000000 _Unwind_Resume
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
 d6 e8                 adjsp	-0x18
 f1 0d                 mov	r1, r5
 f1 1c                 mov	r3, r4
 ed 96 20              ld16	r4, [r3+0]
 ed b6 22              ld16	r5, [r3+2]
 24                    sub	r5, r4
 f4 95                 asr16.1	r5
 f0 14 14              leasp	r4, 0x14
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__1::valarray<unsigned int>::valarray(unsigned int)
 ed 96 20              ld16	r4, [r3+0]
 ed d6 22              ld16	r6, [r3+2]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x47
<L0>:
 28                    sub	r6, r4
 f4 96                 asr16.1	r6
 f0 02 01              ldi8	r2, 0x1
 ce 02                 cmpi.s8	r6, 0x2
 f1 26                 mov	r5, r2
 fc 6e                 cmov.uge	r5, r6
 f1 2a                 mov	r6, r2
 f7 22                 ld16	r2, [r4+]
 fe 16                 mul16	r2, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x33
<L1>:
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x49
 f2 42                 sub	r2, r2
 ed 16 2a              ld16	r0, [r3+10]
 ed 96 28              ld16	r4, [r3+8]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x7d
<L2>:
 f1 24                 mov	r5, r0
 24                    sub	r5, r4
 f5 04                 cmp	r0, r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x70
<L3>:
 0c                    mov	r7, r4
 f2 5c                 sub	r7, r0
 f4 af                 inc16	r7
 c6 fe ff              ldi16	r6, 0xfffe
 8b                    and	r6, r7
 f2 28                 add	r6, r0
 ee d6 2a              st16	[r3+10], r6
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)
 f1 23                 mov	r4, r3
 c8 08                 addi.s8	r4, 0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x186
<L4>:
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x194
<L5>:
 f1 22                 mov	r4, r2
 10                    add	r4, r4
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator new(unsigned int)
 ee 96 28              st16	[r3+8], r4
 af                    xor	r7, r7
 04                    mov	r5, r4
 f7 4f                 st16	[r5+], r7
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x99
<L6>:
 ee b6 2a              st16	[r3+10], r5
 f5 51                 st16	[r4], r1
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 40                 stsp16	[sp+0x0], r4
 ed 16 20              ld16	r0, [r3+0]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f1 25                 mov	r5, r1
 f2 56                 sub	r5, r2
 01                    mov	r4, r5
 f4 94                 asr16.1	r4
 08                    mov	r6, r4
 f4 b6                 dec16	r6
 f4 52                 stsp16	[sp+0x4], r6
 1a                    add	r6, r6
 f2 16                 add	r2, r6
 f0 3a 06              stsp16	[sp+0x6], r2
 f2 28                 add	r6, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f0 38 10              stsp16	[sp+0x10], r0
 f2 24                 add	r5, r0
 f0 09 fc              addi.s8	r1, -0x4
 f0 39 0e              stsp16	[sp+0xe], r1
 c9 fc                 addi.s8	r5, -0x4
 f4 61                 stsp16	[sp+0x8], r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 69                    ld16	r6, [r5]
 f4 ae                 inc16	r6
 76                    st16	[r5], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 65                    ld16	r5, [r5]
 39                    cmp	r6, r5
 f1 0c                 mov	r1, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f1 1c                 mov	r3, r4
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x131
<L7>:
 f1 17                 mov	r2, r7
 f0 31 04              ldsp16	r1, [sp+0x4]
 f6 29                 tst16	r1
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 21                 ldsp16	r5, [sp+0x8]
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x186
<L8>:
 aa                    xor	r6, r6
 ee d8 22              st16	[r4+2], r6
 68                    ld16	r6, [r4]
 f4 ae                 inc16	r6
 72                    st16	[r4], r6
 6d                    ld16	r7, [r5]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x12b
<L9>:
 c8 fe                 addi.s8	r4, -0x2
 c9 fe                 addi.s8	r5, -0x2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x109
<L10>:
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x186
 f1 25                 mov	r5, r1
 f4 b5                 dec16	r5
 f1 2e                 mov	r7, r2
 0b                    mov	r6, r7
 1a                    add	r6, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 15                    add	r5, r5
 ed 50 24              ld16	r2, [r0+4]
 f2 26                 add	r5, r2
 f1 23                 mov	r4, r3
 f5 47                 ld16	r3, [r5]
 f2 1e                 add	r3, r6
 f4 af                 inc16	r7
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 05                 add	r0, r5
 ee 70 20              st16	[r0+0], r3
 f5 21                 cmp	r4, r1
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0xdf
<L11>:
 f4 6b                 stsp16	[sp+0xa], r7
 08                    mov	r6, r4
 f2 59                 sub	r6, r1
 f4 81                 lsl16.1	r1
 f0 37 10              ldsp16	r7, [sp+0x10]
 f2 2d                 add	r7, r1
 f2 11                 add	r2, r1
 f7 3d                 ld16	r5, [r7+]
 f4 b5                 dec16	r5
 f0 6c 95              ld16	r4, [r2+]
 fe 2c                 mul16	r5, r4
 f2 4d                 sub	r3, r5
 ee 70 20              st16	[r0+0], r3
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0x166
<L12>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 e2 00 00 00           jmpf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__16gslice6__initEj+0xdf
 f0 14 14              leasp	r4, 0x14
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__1::valarray<unsigned int>::~valarray()
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__throw_bad_array_new_length[abi:n240000ie23]()
 f1 04                 mov	r0, r4
 f0 14 14              leasp	r4, 0x14
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::__1::valarray<unsigned int>::~valarray()
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZNSt3__16gslice6__initEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	_Unwind_Resume

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
