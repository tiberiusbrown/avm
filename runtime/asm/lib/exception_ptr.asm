
exception_ptr.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 exception_ptr.cpp
00000000 l    d  .text._ZNSt13exception_ptrC2ERKS_	00000000 .text._ZNSt13exception_ptrC2ERKS_
00000000 l    d  .text._ZNSt13exception_ptraSERKS_	00000000 .text._ZNSt13exception_ptraSERKS_
00000000 l    d  .text._ZNSt13exception_ptrD2Ev	00000000 .text._ZNSt13exception_ptrD2Ev
00000000 l    d  .text._ZNSt13exception_ptr31__from_native_exception_pointerEPv	00000000 .text._ZNSt13exception_ptr31__from_native_exception_pointerEPv
00000000 l    d  .text._ZSt17current_exceptionv	00000000 .text._ZSt17current_exceptionv
00000000 l    d  .text._ZSt17rethrow_exceptionSt13exception_ptr	00000000 .text._ZSt17rethrow_exceptionSt13exception_ptr
00000000 l    d  .text._ZNSt16nested_exceptionC2Ev	00000000 .text._ZNSt16nested_exceptionC2Ev
00000000 l    d  .text._ZNSt16nested_exceptionD2Ev	00000000 .text._ZNSt16nested_exceptionD2Ev
00000000 l    d  .text._ZNSt16nested_exceptionD0Ev	00000000 .text._ZNSt16nested_exceptionD0Ev
00000000 l    d  .text._ZNKSt16nested_exception14rethrow_nestedEv	00000000 .text._ZNKSt16nested_exception14rethrow_nestedEv
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTISt16nested_exception
00000000  w      *UND*	00000000 __avm_rtti_alias._ZTSSt16nested_exception
00000000 g     F .text._ZNSt13exception_ptrC2ERKS_	00000007 std::exception_ptr::exception_ptr(std::exception_ptr const&)
00000000         *UND*	00000000 __cxa_increment_exception_refcount
00000000 g     F .text._ZNSt13exception_ptraSERKS_	00000029 std::exception_ptr::operator=(std::exception_ptr const&)
00000000         *UND*	00000000 __cxa_decrement_exception_refcount
00000000 g     F .text._ZNSt13exception_ptrD2Ev	00000005 std::exception_ptr::~exception_ptr()
00000000 g     F .text._ZNSt13exception_ptr31__from_native_exception_pointerEPv	0000000f std::exception_ptr::__from_native_exception_pointer(void*)
00000000 g     F .text._ZSt17current_exceptionv	0000000e std::current_exception()
00000000         *UND*	00000000 __cxa_current_primary_exception
00000000 g     F .text._ZSt17rethrow_exceptionSt13exception_ptr	00000010 std::rethrow_exception(std::exception_ptr)
00000000         *UND*	00000000 std::terminate()
00000000         *UND*	00000000 __avm_rethrow_primary_exception
00000000 g     F .text._ZNSt16nested_exceptionC2Ev	00000016 std::nested_exception::nested_exception()
00000000 g     O .rodata._ZTVSt16nested_exception	0000000c vtable for std::nested_exception
00000000 g     F .text._ZNSt16nested_exceptionD2Ev	00000010 std::nested_exception::~nested_exception()
00000000 g     F .text._ZNSt16nested_exceptionD0Ev	0000001d std::nested_exception::~nested_exception()
00000000         *UND*	00000000 operator delete(void*, unsigned int)
00000000 g     F .text._ZNKSt16nested_exception14rethrow_nestedEv	00000035 std::nested_exception::rethrow_nested() const
00000000         *UND*	00000000 _Unwind_Resume
00000000 g     O .avm.rtti.type._ZTISt16nested_exception	00000006 typeinfo for std::nested_exception
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000 g     O .avm.rtti.name._ZTSSt16nested_exception	00000015 typeinfo name for std::nested_exception
00000000 g     F .text._ZNSt13exception_ptrC2ERKS_	00000007 std::exception_ptr::exception_ptr(std::exception_ptr const&)
00000000 g     F .text._ZNSt13exception_ptrD2Ev	00000005 std::exception_ptr::~exception_ptr()
00000000 g     F .text._ZNSt16nested_exceptionC2Ev	00000016 std::nested_exception::nested_exception()
00000000 g     F .text._ZNSt16nested_exceptionD2Ev	00000010 std::nested_exception::~nested_exception()

Disassembly of section .text._ZNSt13exception_ptrC2ERKS_:

<std::exception_ptr::exception_ptr(std::exception_ptr const&)>:
 65                    ld16	r5, [r5]
 71                    st16	[r4], r5
 01                    mov	r4, r5
 e2 00 00 00           jmpf	_ZNSt13exception_ptrC2ERKS_
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_increment_exception_refcount

Disassembly of section .text._ZNSt13exception_ptraSERKS_:

<std::exception_ptr::operator=(std::exception_ptr const&)>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 ed 92 20              ld16	r4, [r1+0]
 ed b0 20              ld16	r5, [r0+0]
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt13exception_ptraSERKS_
		R_AVM_FAR24	.text._ZNSt13exception_ptraSERKS_+0x24
<L0>:
 e3 00 00 00           callf	_ZNSt13exception_ptraSERKS_
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_increment_exception_refcount
 ed 90 20              ld16	r4, [r0+0]
 e3 00 00 00           callf	_ZNSt13exception_ptraSERKS_
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount
 ed 92 20              ld16	r4, [r1+0]
 ee 90 20              st16	[r0+0], r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text._ZNSt13exception_ptrD2Ev:

<std::exception_ptr::~exception_ptr()>:
 60                    ld16	r4, [r4]
 e2 00 00 00           jmpf	_ZNSt13exception_ptrD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount

Disassembly of section .text._ZNSt13exception_ptr31__from_native_exception_pointerEPv:

<std::exception_ptr::__from_native_exception_pointer(void*)>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ee b0 20              st16	[r0+0], r5
 01                    mov	r4, r5
 e3 00 00 00           callf	_ZNSt13exception_ptr31__from_native_exception_pointerEPv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_increment_exception_refcount
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text._ZSt17current_exceptionv:

<std::current_exception()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZSt17current_exceptionv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_current_primary_exception
 ee 90 20              st16	[r0+0], r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text._ZSt17rethrow_exceptionSt13exception_ptr:

<std::rethrow_exception(std::exception_ptr)>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZSt17rethrow_exceptionSt13exception_ptr
		R_AVM_FAR24	.text._ZSt17rethrow_exceptionSt13exception_ptr+0xc
<L0>:
 e3 00 00 00           callf	_ZSt17rethrow_exceptionSt13exception_ptr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::terminate()
 e3 00 00 00           callf	_ZSt17rethrow_exceptionSt13exception_ptr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_rethrow_primary_exception

Disassembly of section .text._ZNSt16nested_exceptionC2Ev:

<std::nested_exception::nested_exception()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for std::nested_exception+0x6
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for std::nested_exception+0x6
 f1 28                 mov	r6, r0
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 e3 00 00 00           callf	_ZNSt16nested_exceptionC2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_current_primary_exception
 ee 90 23              st16	[r0+3], r4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text._ZNSt16nested_exceptionD2Ev:

<std::nested_exception::~nested_exception()>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for std::nested_exception+0x6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for std::nested_exception+0x6
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 ed 98 23              ld16	r4, [r4+3]
 e2 00 00 00           jmpf	_ZNSt16nested_exceptionD2Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount

Disassembly of section .text._ZNSt16nested_exceptionD0Ev:

<std::nested_exception::~nested_exception()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for std::nested_exception+0x6
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for std::nested_exception+0x6
 f1 28                 mov	r6, r0
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 ed 90 23              ld16	r4, [r0+3]
 e3 00 00 00           callf	_ZNSt16nested_exceptionD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount
 c1 05                 ldi8	r5, 0x5
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	_ZNSt16nested_exceptionD0Ev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, unsigned int)

Disassembly of section .text._ZNKSt16nested_exception14rethrow_nestedEv:

<std::nested_exception::rethrow_nested() const>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 30 23              ld16	r1, [r0+3]
 a0                    xor	r4, r4
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_FAR24	.text._ZNKSt16nested_exception14rethrow_nestedEv+0x18
<L0>:
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::terminate()
 ed 10 23              ld16	r0, [r0+3]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_increment_exception_refcount
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	std::rethrow_exception(std::exception_ptr)
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_decrement_exception_refcount
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	_ZNKSt16nested_exception14rethrow_nestedEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	_Unwind_Resume
