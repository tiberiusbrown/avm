
eh_cxa.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_cxa.c
00000000 l    d  .text.__cxa_allocate_exception	00000000 .text.__cxa_allocate_exception
00000000 l    d  .text.__cxa_free_exception	00000000 .text.__cxa_free_exception
00000000 l    d  .text.__avm_eh_throw	00000000 .text.__avm_eh_throw
00000000 l     O .data.active_exception	00000002 active_exception
00000000 l    d  .text.__avm_eh_rethrow_header	00000000 .text.__avm_eh_rethrow_header
00000000 l    d  .text.__avm_eh_rethrow	00000000 .text.__avm_eh_rethrow
00000000 l    d  .text._Unwind_Resume	00000000 .text._Unwind_Resume
00000000 l    d  .text.__cxa_begin_catch	00000000 .text.__cxa_begin_catch
00000000 l     F .text.catch_object	000000ed catch_object
00000000 l    d  .text.catch_object	00000000 .text.catch_object
00000000 l    d  .text.__cxa_get_exception_ptr	00000000 .text.__cxa_get_exception_ptr
00000000 l    d  .text.__cxa_end_catch	00000000 .text.__cxa_end_catch
00000000 l    d  .text.__gxx_personality_v0	00000000 .text.__gxx_personality_v0
00000000 l    d  .data.active_exception	00000000 .data.active_exception
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__cxa_allocate_exception	00000054 __cxa_allocate_exception
00000000         *UND*	00000000 malloc
00000000         *UND*	00000000 memset
00000000         *UND*	00000000 abort
00000000 g     F .text.__cxa_free_exception	00000006 __cxa_free_exception
00000000         *UND*	00000000 free
00000000 g     F .text.__avm_eh_throw	000000c6 __avm_eh_throw
00000000         *UND*	00000000 avm_eh_open_exception
00000000         *UND*	00000000 avm_eh_find_handler
00000000         *UND*	00000000 __avm_eh_install_context
00000000         *UND*	00000000 avm_eh_prepare_next
00000000 g     F .text.__avm_eh_rethrow_header	0000001c __avm_eh_rethrow_header
00000000 g     F .text.__avm_eh_rethrow	000000b7 __avm_eh_rethrow
00000000 g     F .text._Unwind_Resume	00000074 _Unwind_Resume
00000000 g     F .text.__cxa_begin_catch	0000002b __cxa_begin_catch
00000000 g     F .text.__cxa_get_exception_ptr	0000001e __cxa_get_exception_ptr
00000000 g     F .text.__cxa_end_catch	0000005f __cxa_end_catch
00000000 g     F .text.__gxx_personality_v0	00000004 __gxx_personality_v0
00000000 g     O .rodata._ZTVN10__cxxabiv123__fundamental_type_infoE	00000009 vtable for __cxxabiv1::__fundamental_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv117__class_type_infoE	00000009 vtable for __cxxabiv1::__class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv120__si_class_type_infoE	00000009 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv121__vmi_class_type_infoE	00000009 vtable for __cxxabiv1::__vmi_class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv119__pointer_type_infoE	00000009 vtable for __cxxabiv1::__pointer_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv116__enum_type_infoE	00000009 vtable for __cxxabiv1::__enum_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv120__function_type_infoE	00000009 vtable for __cxxabiv1::__function_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv129__pointer_to_member_type_infoE	00000009 vtable for __cxxabiv1::__pointer_to_member_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv117__array_type_infoE	00000009 vtable for __cxxabiv1::__array_type_info
00000000 g     O .rodata.__avm_eh_exact_pointer_ref_type_info	00000009 __avm_eh_exact_pointer_ref_type_info

Disassembly of section .text.__cxa_allocate_exception:

<__cxa_allocate_exception>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 0c c9              cmpi.s8	r0, -0x37
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x50
<L0>:
 f1 20                 mov	r4, r0
 c8 37                 addi.s8	r4, 0x37
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x50
<L1>:
 04                    mov	r5, r4
 c9 0f                 addi.s8	r5, 0xf
 f2 42                 sub	r2, r2
 c2 03                 ldi8	r6, 0x3
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 f1 21                 mov	r4, r1
 c8 27                 addi.s8	r4, 0x27
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 f1 21                 mov	r4, r1
 c8 12                 addi.s8	r4, 0x12
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ee 42 56              st8	[r1+54], r2
 ee 42 37              st8	[r1+23], r2
 ee 12 35              st16	[r1+21], r0
 f0 09 37              addi.s8	r1, 0x37
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_free_exception:

<__cxa_free_exception>:
 c8 c9                 addi.s8	r4, -0x37
 e2 00 00 00           jmpf	__cxa_free_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free

Disassembly of section .text.__avm_eh_throw:

<__avm_eh_throw>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.active_exception
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x4b
<L0>:
 a0                    xor	r4, r4
 ee 80 56              st8	[r0+54], r4
 f0 01 01              ldi8	r1, 0x1
 ee 20 37              st8	[r0+23], r1
 ee 10 2d              st16	[r0+13], r0
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.active_exception
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_open_exception
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x4b
<L1>:
 f1 10                 mov	r2, r0
 f0 0a 18              addi.s8	r2, 0x18
 f1 22                 mov	r4, r2
 f1 24                 mov	r5, r0
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_find_handler
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x4f
<L2>:
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 ed 80 37              ld8u	r4, [r0+23]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x73
<L3>:
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 c0 04                 ldi8	r4, 0x4
 ee 80 37              st8	[r0+23], r4
 ee 10 2d              st16	[r0+13], r0
 ed b0 47              ld16	r5, [r0+39]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 ee 20 37              st8	[r0+23], r1
 f1 22                 mov	r4, r2
 f1 24                 mov	r5, r0
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_prepare_next
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0xa9
<L4>:
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x4b
<L5>:
 ed 80 37              ld8u	r4, [r0+23]
 c1 80                 ldi8	r5, 0x80
 84                    and	r5, r4
 c0 03                 ldi8	r4, 0x3
 91                    or	r4, r5
 ee 80 37              st8	[r0+23], r4
 a5                    xor	r5, r5
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 ed b0 47              ld16	r5, [r0+39]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x4b
<L6>:
 ed 80 37              ld8u	r4, [r0+23]
 c2 80                 ldi8	r6, 0x80
 88                    and	r6, r4
 c0 04                 ldi8	r4, 0x4
 92                    or	r4, r6
 ee 80 37              st8	[r0+23], r4
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text.__avm_eh_rethrow_header:

<__avm_eh_rethrow_header>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.active_exception
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_header
		R_AVM_FAR24	.text.__avm_eh_rethrow_header+0x18
<L0>:
 ed a8 37              ld8u	r5, [r4+23]
 cd 02                 cmpi.s8	r5, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_header
		R_AVM_FAR24	.text.__avm_eh_rethrow_header+0x18
<L1>:
 ef                    ret
 e3 00 00 00           callf	__avm_eh_rethrow_header
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__avm_eh_rethrow:

<__avm_eh_rethrow>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L0>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.active_exception
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L1>:
 ed a8 37              ld8u	r5, [r4+23]
 cd 02                 cmpi.s8	r5, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L2>:
 04                    mov	r5, r4
 c9 27                 addi.s8	r5, 0x27
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b ca              st32	[r5], q3
 a5                    xor	r5, r5
 ee a8 56              st8	[r4+54], r5
 f0 01 81              ldi8	r1, 0x81
 ee 28 37              st8	[r4+23], r1
 ee 98 2d              st16	[r4+13], r4
 f1 14                 mov	r2, r4
 f0 0a 18              addi.s8	r2, 0x18
 0c                    mov	r7, r4
 f1 22                 mov	r4, r2
 07                    mov	r5, r7
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 f1 07                 mov	r0, r7
 03                    mov	r4, r7
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_open_exception
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L3>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_find_handler
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L4>:
 f1 2c                 mov	r7, r0
 ee 2e 37              st8	[r7+23], r1
 f1 22                 mov	r4, r2
 07                    mov	r5, r7
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_prepare_next
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0x96
<L5>:
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa1
<L6>:
 ed a0 37              ld8u	r5, [r0+23]
 c2 80                 ldi8	r6, 0x80
 89                    and	r6, r5
 c1 03                 ldi8	r5, 0x3
 96                    or	r5, r6
 ee a0 37              st8	[r0+23], r5
 a5                    xor	r5, r5
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 ed b0 47              ld16	r5, [r0+39]
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa5
<L7>:
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 ed c0 37              ld8u	r6, [r0+23]
 c3 80                 ldi8	r7, 0x80
 8e                    and	r7, r6
 c2 04                 ldi8	r6, 0x4
 9b                    or	r6, r7
 ee c0 37              st8	[r0+23], r6
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text._Unwind_Resume:

<_Unwind_Resume>:
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x60
<L0>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.active_exception
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x60
<L1>:
 ed a8 37              ld8u	r5, [r4+23]
 c2 7f                 ldi8	r6, 0x7f
 89                    and	r6, r5
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x60
<L2>:
 c2 81                 ldi8	r6, 0x81
 86                    and	r5, r6
 ee a8 37              st8	[r4+23], r5
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_prepare_next
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x53
<L3>:
 cc 01                 cmpi.s8	r4, 0x1
 f1 20                 mov	r4, r0
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x60
<L4>:
 ed a8 37              ld8u	r5, [r4+23]
 c2 80                 ldi8	r6, 0x80
 89                    and	r6, r5
 c1 03                 ldi8	r5, 0x3
 96                    or	r5, r6
 ee a8 37              st8	[r4+23], r5
 a5                    xor	r5, r5
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 f1 20                 mov	r4, r0
 ed b8 47              ld16	r5, [r4+39]
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x64
<L5>:
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 ed c8 37              ld8u	r6, [r4+23]
 c3 80                 ldi8	r7, 0x80
 8e                    and	r7, r6
 c2 04                 ldi8	r6, 0x4
 9b                    or	r6, r7
 ee c8 37              st8	[r4+23], r6
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text.__cxa_begin_catch:

<__cxa_begin_catch>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.active_exception
 f5 04                 cmp	r0, r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x27
<L0>:
 ed 80 37              ld8u	r4, [r0+23]
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x27
<L1>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__cxa_begin_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object
 c1 02                 ldi8	r5, 0x2
 ee a0 37              st8	[r0+23], r5
 b8                    pop16	r0
 ef                    ret
 e3 00 00 00           callf	__cxa_begin_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.catch_object:

<catch_object>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f1 1c                 mov	r3, r4
 ed c6 56              ld8u	r6, [r3+54]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x3d
<L0>:
 f1 13                 mov	r2, r3
 f0 0a 33              addi.s8	r2, 0x33
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x92
<L1>:
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x6d
<L2>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L3>:
 a5                    xor	r5, r5
 c2 03                 ldi8	r6, 0x3
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xe0
 ed 96 49              ld16	r4, [r3+41]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x52
<L4>:
 ed d6 35              ld16	r6, [r3+21]
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L5>:
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 0b 37              addi.s8	r3, 0x37
 f1 13                 mov	r2, r3
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L6>:
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xe0
 ed d6 35              ld16	r6, [r3+21]
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L7>:
 ed d6 49              ld16	r6, [r3+41]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L8>:
 f0 0b 37              addi.s8	r3, 0x37
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 c2 03                 ldi8	r6, 0x3
 d7 0f                 sys	memcpy
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xe0
 ed d6 35              ld16	r6, [r3+21]
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L9>:
 f2 30                 sub	r0, r0
 ed d6 57              ld16	r6, [r3+55]
 af                    xor	r7, r7
 f6 2e                 tst16	r6
 f1 08                 mov	r1, r0
 f1 20                 mov	r4, r0
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xd7
<L10>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ed d6 49              ld16	r6, [r3+41]
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe9
<L11>:
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9c                    or	r7, r4
 03                    mov	r4, r7
 f1 0e                 mov	r1, r6
 ee 06 55              st8	[r3+53], r0
 ee 86 54              st8	[r3+52], r4
 ee 26 53              st8	[r3+51], r1
 f1 22                 mov	r4, r2
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_get_exception_ptr:

<__cxa_get_exception_ptr>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.active_exception
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_get_exception_ptr
		R_AVM_FAR24	.text.__cxa_get_exception_ptr+0x1a
<L0>:
 ed a8 37              ld8u	r5, [r4+23]
 cd 04                 cmpi.s8	r5, 0x4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_get_exception_ptr
		R_AVM_FAR24	.text.__cxa_get_exception_ptr+0x1a
<L1>:
 e2 00 00 00           jmpf	__cxa_get_exception_ptr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object
 e3 00 00 00           callf	__cxa_get_exception_ptr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_end_catch:

<__cxa_end_catch>:
 b0                    push16	r0
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.active_exception
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x5b
<L0>:
 ed 80 37              ld8u	r4, [r0+23]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x46
<L1>:
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x5b
<L2>:
 a0                    xor	r4, r4
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.active_exception
 f1 20                 mov	r4, r0
 c8 12                 addi.s8	r4, 0x12
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x3e
<L3>:
 f1 20                 mov	r4, r0
 c8 37                 addi.s8	r4, 0x37
 eb                    callp	q3
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free
 b8                    pop16	r0
 ef                    ret
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 04                    mov	r5, r4
 c9 fd                 addi.s8	r5, -0x3
 f1 75                 zext8	r5
 cd 02                 cmpi.s8	r5, 0x2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x5b
<L4>:
 ee 80 37              st8	[r0+23], r4
 b8                    pop16	r0
 ef                    ret
 e3 00 00 00           callf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__gxx_personality_v0:

<__gxx_personality_v0>:
 e3 00 00 00           callf	__gxx_personality_v0
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
