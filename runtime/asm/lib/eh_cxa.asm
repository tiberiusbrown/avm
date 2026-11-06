
eh_cxa.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_cxa.c
00000000 l    d  .text.__cxa_allocate_exception	00000000 .text.__cxa_allocate_exception
00000000 l    d  .text.__cxa_free_exception	00000000 .text.__cxa_free_exception
00000000 l    d  .text.__cxa_init_primary_exception	00000000 .text.__cxa_init_primary_exception
00000000 l    d  .text.__avm_eh_throw	00000000 .text.__avm_eh_throw
00000000 l    d  .text.__avm_eh_rethrow_header	00000000 .text.__avm_eh_rethrow_header
00000000 l    d  .text.__avm_eh_rethrow	00000000 .text.__avm_eh_rethrow
00000000 l    d  .text.__avm_eh_rethrow_primary	00000000 .text.__avm_eh_rethrow_primary
00000000 l    d  .text._Unwind_Resume	00000000 .text._Unwind_Resume
00000000 l    d  .text.__cxa_begin_catch	00000000 .text.__cxa_begin_catch
00000000 l     F .text.catch_object	000000e9 catch_object
00000000 l    d  .text.catch_object	00000000 .text.catch_object
00000000 l    d  .text.__cxa_get_exception_ptr	00000000 .text.__cxa_get_exception_ptr
00000000 l    d  .text.__cxa_end_catch	00000000 .text.__cxa_end_catch
00000000 l    d  .text.__cxa_current_primary_exception	00000000 .text.__cxa_current_primary_exception
00000000 l    d  .text.__cxa_increment_exception_refcount	00000000 .text.__cxa_increment_exception_refcount
00000000 l    d  .text.__cxa_decrement_exception_refcount	00000000 .text.__cxa_decrement_exception_refcount
00000000 l    d  .text.__cxa_uncaught_exceptions	00000000 .text.__cxa_uncaught_exceptions
00000000 l    d  .text.__gxx_personality_v0	00000000 .text.__gxx_personality_v0
00000000 l    d  .data..L_MergedGlobals	00000000 .data..L_MergedGlobals
00000000 l     O .data..L_MergedGlobals	00000002 active_exception
00000002 l     O .data..L_MergedGlobals	00000002 caught_exceptions
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__cxa_allocate_exception	0000005b __cxa_allocate_exception
00000000         *UND*	00000000 malloc
00000000         *UND*	00000000 memset
00000000         *UND*	00000000 abort
00000000 g     F .text.__cxa_free_exception	00000006 __cxa_free_exception
00000000         *UND*	00000000 free
00000000 g     F .text.__cxa_init_primary_exception	00000037 __cxa_init_primary_exception
00000000 g     F .text.__avm_eh_throw	000000d2 __avm_eh_throw
00000000         *UND*	00000000 avm_eh_open_exception
00000000         *UND*	00000000 avm_eh_find_handler
00000000         *UND*	00000000 __avm_eh_install_context
00000000         *UND*	00000000 avm_eh_prepare_next
00000000 g     F .text.__avm_eh_rethrow_header	0000001c __avm_eh_rethrow_header
00000000 g     F .text.__avm_eh_rethrow	000000c7 __avm_eh_rethrow
00000000 g     F .text.__avm_eh_rethrow_primary	00000032 __avm_eh_rethrow_primary
00000000 g     F .text._Unwind_Resume	00000074 _Unwind_Resume
00000000 g     F .text.__cxa_begin_catch	0000003b __cxa_begin_catch
00000000 g     F .text.__cxa_get_exception_ptr	0000001e __cxa_get_exception_ptr
00000000 g     F .text.__cxa_end_catch	00000099 __cxa_end_catch
00000000 g     F .text.__cxa_current_primary_exception	00000030 __cxa_current_primary_exception
00000000 g     F .text.__cxa_increment_exception_refcount	0000001d __cxa_increment_exception_refcount
00000000 g     F .text.__cxa_decrement_exception_refcount	00000056 __cxa_decrement_exception_refcount
00000000 g     F .text.__cxa_uncaught_exceptions	00000009 __cxa_uncaught_exceptions
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
 f0 0c c5              cmpi.s8	r0, -0x3b
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x57
<L0>:
 f1 20                 mov	r4, r0
 c8 3b                 addi.s8	r4, 0x3b
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x57
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
 c8 37                 addi.s8	r4, 0x37
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 f1 21                 mov	r4, r1
 c8 27                 addi.s8	r4, 0x27
 f0 6b c8              st32	[r4], q3
 f1 21                 mov	r4, r1
 c8 12                 addi.s8	r4, 0x12
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ee 42 56              st8	[r1+54], r2
 ee 42 37              st8	[r1+23], r2
 ee 12 35              st16	[r1+21], r0
 f0 09 3b              addi.s8	r1, 0x3b
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
 c8 c5                 addi.s8	r4, -0x3b
 e2 00 00 00           jmpf	__cxa_free_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free

Disassembly of section .text.__cxa_init_primary_exception:

<__cxa_init_primary_exception>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 08 fc              addi.s8	r0, -0x4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 40              st32	[r0], q1
 f1 04                 mov	r0, r4
 f0 08 d7              addi.s8	r0, -0x29
 f0 6d d1              st16	[r0+], r6
 ee e0 20              st8	[r0+0], r7
 08                    mov	r6, r4
 ca dc                 addi.s8	r6, -0x24
 af                    xor	r7, r7
 5b                    st8	[r6], r7
 08                    mov	r6, r4
 ca d6                 addi.s8	r6, -0x2a
 5b                    st8	[r6], r7
 08                    mov	r6, r4
 ca d4                 addi.s8	r6, -0x2c
 59                    st8	[r6], r5
 c6 00 fa              ldi16	r6, 0xfa00
 19                    add	r6, r5
 fa 98                 lsr16i	r6, 0x8
 04                    mov	r5, r4
 c9 d5                 addi.s8	r5, -0x2b
 56                    st8	[r5], r6
 c8 c5                 addi.s8	r4, -0x3b
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_eh_throw:

<__avm_eh_throw>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x59
<L0>:
 a5                    xor	r5, r5
 ee a8 56              st8	[r4+54], r5
 f0 01 01              ldi8	r1, 0x1
 ee 28 37              st8	[r4+23], r1
 ee 98 2d              st16	[r4+13], r4
 ed b8 59              ld16	r5, [r4+57]
 cd ff                 cmpi.s8	r5, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x59
<L1>:
 f4 ad                 inc16	r5
 ee b8 59              st16	[r4+57], r5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_open_exception
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x59
<L2>:
 f1 2c                 mov	r7, r0
 f1 17                 mov	r2, r7
 f0 0a 18              addi.s8	r2, 0x18
 f1 22                 mov	r4, r2
 07                    mov	r5, r7
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_find_handler
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x5d
<L3>:
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 f1 2c                 mov	r7, r0
 ed ae 37              ld8u	r5, [r7+23]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x81
<L4>:
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 c1 04                 ldi8	r5, 0x4
 ee ae 37              st8	[r7+23], r5
 ee fe 2d              st16	[r7+13], r7
 ed be 47              ld16	r5, [r7+39]
 03                    mov	r4, r7
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 ee 2e 37              st8	[r7+23], r1
 f1 22                 mov	r4, r2
 07                    mov	r5, r7
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_prepare_next
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0xb5
<L5>:
 cc 01                 cmpi.s8	r4, 0x1
 f1 20                 mov	r4, r0
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x59
<L6>:
 ed a8 37              ld8u	r5, [r4+23]
 c2 80                 ldi8	r6, 0x80
 89                    and	r6, r5
 c1 03                 ldi8	r5, 0x3
 96                    or	r5, r6
 ee a8 37              st8	[r4+23], r5
 a5                    xor	r5, r5
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 f1 20                 mov	r4, r0
 ed b8 47              ld16	r5, [r4+39]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x59
<L7>:
 ed c8 37              ld8u	r6, [r4+23]
 c3 80                 ldi8	r7, 0x80
 8e                    and	r7, r6
 c2 04                 ldi8	r6, 0x4
 9b                    or	r6, r7
 ee c8 37              st8	[r4+23], r6
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text.__avm_eh_rethrow_header:

<__avm_eh_rethrow_header>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
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
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L0>:
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L1>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 ed c8 37              ld8u	r6, [r4+23]
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L2>:
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L3>:
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
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals
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
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L4>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_rethrow
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_find_handler
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L5>:
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
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xa6
<L6>:
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb1
<L7>:
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
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow
		R_AVM_FAR24	.text.__avm_eh_rethrow+0xb5
<L8>:
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

Disassembly of section .text.__avm_eh_rethrow_primary:

<__avm_eh_rethrow_primary>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_primary
		R_AVM_FAR24	.text.__avm_eh_rethrow_primary+0xc
<L0>:
 e3 00 00 00           callf	__avm_eh_rethrow_primary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 ed a8 37              ld8u	r5, [r4+23]
 cd 02                 cmpi.s8	r5, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_primary
		R_AVM_FAR24	.text.__avm_eh_rethrow_primary+0x26
<L1>:
 32                    cmp	r4, r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_primary
		R_AVM_FAR24	.text.__avm_eh_rethrow_primary+0x26
<L2>:
 e3 00 00 00           callf	__avm_eh_rethrow_primary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_rethrow
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_rethrow_primary
		R_AVM_FAR24	.text.__avm_eh_rethrow_primary+0x8
<L3>:
 e3 00 00 00           callf	__avm_eh_rethrow_primary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_throw

Disassembly of section .text._Unwind_Resume:

<_Unwind_Resume>:
 b0                    push16	r0
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x60
<L0>:
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
		R_AVM_DATA16	.data..L_MergedGlobals
 f5 04                 cmp	r0, r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x37
<L0>:
 ed 80 37              ld8u	r4, [r0+23]
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x37
<L1>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__cxa_begin_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object
 c1 02                 ldi8	r5, 0x2
 ee a0 37              st8	[r0+23], r5
 a5                    xor	r5, r5
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	.data..L_MergedGlobals
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 ee b0 57              st16	[r0+55], r5
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
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
 d6 f8                 adjsp	-0x8
 04                    mov	r5, r4
 ed ea 56              ld8u	r7, [r5+54]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x3f
<L0>:
 f1 05                 mov	r0, r5
 f0 08 33              addi.s8	r0, 0x33
 09                    mov	r6, r5
 ca 3b                 addi.s8	r6, 0x3b
 cf 01                 cmpi.s8	r7, 0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x89
<L1>:
 cf 02                 cmpi.s8	r7, 0x2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x68
<L2>:
 cf 03                 cmpi.s8	r7, 0x3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L3>:
 a5                    xor	r5, r5
 c2 03                 ldi8	r6, 0x3
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xdc
 ed 9a 49              ld16	r4, [r5+41]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0x54
<L4>:
 ed da 35              ld16	r6, [r5+21]
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L5>:
 14                    add	r5, r4
 c9 3b                 addi.s8	r5, 0x3b
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L6>:
 f1 05                 mov	r0, r5
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xdc
 ed fa 35              ld16	r7, [r5+21]
 cf 03                 cmpi.s8	r7, 0x3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L7>:
 ed ba 49              ld16	r5, [r5+41]
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L8>:
 f1 20                 mov	r4, r0
 06                    mov	r5, r6
 c2 03                 ldi8	r6, 0x3
 d7 0f                 sys	memcpy
 e2 00 00 00           jmpf	catch_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catch_object+0xdc
 ed fa 35              ld16	r7, [r5+21]
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L9>:
 a0                    xor	r4, r4
 f5 49                 ld16	r1, [r6]
 f6 29                 tst16	r1
 08                    mov	r6, r4
 0c                    mov	r7, r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xd3
<L10>:
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 ed da 49              ld16	r6, [r5+41]
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6d                 add32	q3, q1
 f2 42                 sub	r2, r2
 f0 03 01              ldi8	r3, 0x1
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catch_object
		R_AVM_FAR24	.text.catch_object+0xe5
<L11>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 92                    or	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 0c                    mov	r7, r4
 a0                    xor	r4, r4
 ee 8a 55              st8	[r5+53], r4
 ee ea 54              st8	[r5+52], r7
 ee ca 53              st8	[r5+51], r6
 f1 20                 mov	r4, r0
 d6 08                 adjsp	0x8
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
		R_AVM_DATA16	.data..L_MergedGlobals
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
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x95
<L0>:
 ed 80 37              ld8u	r4, [r0+23]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x4a
<L1>:
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x95
<L2>:
 ed 90 59              ld16	r4, [r0+57]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x95
<L3>:
 ed b0 57              ld16	r5, [r0+55]
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 a5                    xor	r5, r5
 ee b0 57              st16	[r0+55], r5
 f4 b4                 dec16	r4
 ee 90 59              st16	[r0+57], r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x76
<L4>:
 ee a0 37              st8	[r0+23], r5
 b8                    pop16	r0
 ef                    ret
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f5 05                 cmp	r0, r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x95
<L5>:
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 04                    mov	r5, r4
 c9 fd                 addi.s8	r5, -0x3
 f1 75                 zext8	r5
 cd 02                 cmpi.s8	r5, 0x2
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x95
<L6>:
 ed b0 57              ld16	r5, [r0+55]
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 ee 80 37              st8	[r0+23], r4
 a0                    xor	r4, r4
 ee 90 57              st16	[r0+55], r4
 b8                    pop16	r0
 ef                    ret
 f1 20                 mov	r4, r0
 c8 12                 addi.s8	r4, 0x12
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x8d
<L7>:
 f1 20                 mov	r4, r0
 c8 3b                 addi.s8	r4, 0x3b
 eb                    callp	q3
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free
 b8                    pop16	r0
 ef                    ret
 e3 00 00 00           callf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_current_primary_exception:

<__cxa_current_primary_exception>:
 a0                    xor	r4, r4
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_current_primary_exception
		R_AVM_FAR24	.text.__cxa_current_primary_exception+0x2b
<L0>:
 ed ca 37              ld8u	r6, [r5+23]
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_current_primary_exception
		R_AVM_FAR24	.text.__cxa_current_primary_exception+0x2b
<L1>:
 ed 9a 59              ld16	r4, [r5+57]
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_current_primary_exception
		R_AVM_FAR24	.text.__cxa_current_primary_exception+0x2c
<L2>:
 f4 ac                 inc16	r4
 ee 9a 59              st16	[r5+57], r4
 c9 3b                 addi.s8	r5, 0x3b
 01                    mov	r4, r5
 ef                    ret
 e3 00 00 00           callf	__cxa_current_primary_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_increment_exception_refcount:

<__cxa_increment_exception_refcount>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_increment_exception_refcount
		R_AVM_FAR24	.text.__cxa_increment_exception_refcount+0x18
<L0>:
 ed b8 1e              ld16	r5, [r4-2]
 cd ff                 cmpi.s8	r5, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_increment_exception_refcount
		R_AVM_FAR24	.text.__cxa_increment_exception_refcount+0x19
<L1>:
 f4 ad                 inc16	r5
 ee b8 1e              st16	[r4-2], r5
 ef                    ret
 e3 00 00 00           callf	__cxa_increment_exception_refcount
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_decrement_exception_refcount:

<__cxa_decrement_exception_refcount>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_decrement_exception_refcount
		R_AVM_FAR24	.text.__cxa_decrement_exception_refcount+0x4e
<L0>:
 ed b8 1e              ld16	r5, [r4-2]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_decrement_exception_refcount
		R_AVM_FAR24	.text.__cxa_decrement_exception_refcount+0x52
<L1>:
 f4 b5                 dec16	r5
 ee b8 1e              st16	[r4-2], r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_decrement_exception_refcount
		R_AVM_FAR24	.text.__cxa_decrement_exception_refcount+0x4e
<L2>:
 04                    mov	r5, r4
 c9 dc                 addi.s8	r5, -0x24
 45                    ld8u	r5, [r5]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_decrement_exception_refcount
		R_AVM_FAR24	.text.__cxa_decrement_exception_refcount+0x52
<L3>:
 f1 04                 mov	r0, r4
 f0 08 c5              addi.s8	r0, -0x3b
 04                    mov	r5, r4
 c9 d7                 addi.s8	r5, -0x29
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_decrement_exception_refcount
		R_AVM_FAR24	.text.__cxa_decrement_exception_refcount+0x48
<L4>:
 eb                    callp	q3
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__cxa_decrement_exception_refcount
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	__cxa_decrement_exception_refcount
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_uncaught_exceptions:

<__cxa_uncaught_exceptions>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.__gxx_personality_v0:

<__gxx_personality_v0>:
 e3 00 00 00           callf	__gxx_personality_v0
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
