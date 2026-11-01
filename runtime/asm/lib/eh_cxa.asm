
eh_cxa.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_cxa.c
00000000 l    d  .text.__cxa_allocate_exception	00000000 .text.__cxa_allocate_exception
00000000 l    d  .text.__cxa_free_exception	00000000 .text.__cxa_free_exception
00000000 l    d  .text.__avm_eh_throw	00000000 .text.__avm_eh_throw
00000000 l     O .data.active_exception	00000002 active_exception
00000000 l    d  .text._Unwind_Resume	00000000 .text._Unwind_Resume
00000000 l    d  .text.__cxa_begin_catch	00000000 .text.__cxa_begin_catch
00000000 l    d  .text.__cxa_end_catch	00000000 .text.__cxa_end_catch
00000000 l    d  .text.__gxx_personality_v0	00000000 .text.__gxx_personality_v0
00000000 l    d  .data.active_exception	00000000 .data.active_exception
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__cxa_allocate_exception	0000004a __cxa_allocate_exception
00000000         *UND*	00000000 malloc
00000000         *UND*	00000000 memset
00000000         *UND*	00000000 abort
00000000 g     F .text.__cxa_free_exception	00000006 __cxa_free_exception
00000000         *UND*	00000000 free
00000000 g     F .text.__avm_eh_throw	00000074 __avm_eh_throw
00000000         *UND*	00000000 avm_eh_find_handler
00000000         *UND*	00000000 avm_eh_prepare_next
00000000         *UND*	00000000 __avm_eh_install_context
00000000 g     F .text._Unwind_Resume	00000059 _Unwind_Resume
00000000 g     F .text.__cxa_begin_catch	00000022 __cxa_begin_catch
00000000 g     F .text.__cxa_end_catch	0000003f __cxa_end_catch
00000000 g     F .text.__gxx_personality_v0	00000004 __gxx_personality_v0
00000000 g     O .rodata._ZTVN10__cxxabiv123__fundamental_type_infoE	00000009 vtable for __cxxabiv1::__fundamental_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv117__class_type_infoE	00000009 vtable for __cxxabiv1::__class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv120__si_class_type_infoE	00000009 vtable for __cxxabiv1::__si_class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv121__vmi_class_type_infoE	00000009 vtable for __cxxabiv1::__vmi_class_type_info
00000000 g     O .rodata._ZTVN10__cxxabiv119__pointer_type_infoE	00000009 vtable for __cxxabiv1::__pointer_type_info

Disassembly of section .text.__cxa_allocate_exception:

<__cxa_allocate_exception>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 0c d9              cmpi.s8	r0, -0x27
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x46
<L0>:
 f1 20                 mov	r4, r0
 c8 27                 addi.s8	r4, 0x27
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	malloc
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_allocate_exception
		R_AVM_FAR24	.text.__cxa_allocate_exception+0x46
<L1>:
 04                    mov	r5, r4
 c9 0f                 addi.s8	r5, 0xf
 f2 39                 sub	r1, r1
 c2 03                 ldi8	r6, 0x3
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 f1 22                 mov	r4, r2
 c8 12                 addi.s8	r4, 0x12
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ee 24 37              st8	[r2+23], r1
 ee 14 35              st16	[r2+21], r0
 f0 0a 27              addi.s8	r2, 0x27
 f1 22                 mov	r4, r2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 e3 00 00 00           callf	__cxa_allocate_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__cxa_free_exception:

<__cxa_free_exception>:
 c8 d9                 addi.s8	r4, -0x27
 e2 00 00 00           jmpf	__cxa_free_exception
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free

Disassembly of section .text.__avm_eh_throw:

<__avm_eh_throw>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.active_exception
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x63
<L0>:
 c0 01                 ldi8	r4, 0x1
 ee 80 37              st8	[r0+23], r4
 ee 10 2d              st16	[r0+13], r0
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.active_exception
 f1 08                 mov	r1, r0
 f0 09 18              addi.s8	r1, 0x18
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_find_handler
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x63
<L1>:
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 c2 0f                 ldi8	r6, 0xf
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_eh_prepare_next
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x67
<L2>:
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_eh_throw
		R_AVM_FAR24	.text.__avm_eh_throw+0x63
<L3>:
 c0 03                 ldi8	r4, 0x3
 ee 80 37              st8	[r0+23], r4
 a5                    xor	r5, r5
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 c0 04                 ldi8	r4, 0x4
 ee 80 37              st8	[r0+23], r4
 c1 01                 ldi8	r5, 0x1
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_eh_throw
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text._Unwind_Resume:

<_Unwind_Resume>:
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x48
<L0>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.active_exception
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x48
<L1>:
 ed a8 37              ld8u	r5, [r4+23]
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x48
<L2>:
 c1 01                 ldi8	r5, 0x1
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
		R_AVM_FAR24	.text._Unwind_Resume+0x4c
<L3>:
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_Unwind_Resume
		R_AVM_FAR24	.text._Unwind_Resume+0x48
<L4>:
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 ee a8 37              st8	[r4+23], r5
 a5                    xor	r5, r5
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 c1 04                 ldi8	r5, 0x4
 f1 20                 mov	r4, r0
 ee a8 37              st8	[r4+23], r5
 c1 01                 ldi8	r5, 0x1
 e3 00 00 00           callf	_Unwind_Resume
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_eh_install_context

Disassembly of section .text.__cxa_begin_catch:

<__cxa_begin_catch>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.active_exception
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x1e
<L0>:
 ed a8 37              ld8u	r5, [r4+23]
 cd 04                 cmpi.s8	r5, 0x4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_begin_catch
		R_AVM_FAR24	.text.__cxa_begin_catch+0x1e
<L1>:
 c1 02                 ldi8	r5, 0x2
 ee a8 37              st8	[r4+23], r5
 c8 27                 addi.s8	r4, 0x27
 ef                    ret
 e3 00 00 00           callf	__cxa_begin_catch
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
		R_AVM_FAR24	.text.__cxa_end_catch+0x3b
<L0>:
 ed 80 37              ld8u	r4, [r0+23]
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x3b
<L1>:
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
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_FAR24	.text.__cxa_end_catch+0x34
<L2>:
 f1 20                 mov	r4, r0
 c8 27                 addi.s8	r4, 0x27
 eb                    callp	q3
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free
 e3 00 00 00           callf	__cxa_end_catch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.__gxx_personality_v0:

<__gxx_personality_v0>:
 e3 00 00 00           callf	__gxx_personality_v0
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
