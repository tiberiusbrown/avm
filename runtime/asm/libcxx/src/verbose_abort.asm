
libcxx_verbose_abort.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 verbose_abort.cpp
00000000 l    d  .text._ZNSt3__122__libcpp_verbose_abortEPKcz	00000000 .text._ZNSt3__122__libcpp_verbose_abortEPKcz
00000000 l    d  .text.__clang_call_terminate	00000000 .text.__clang_call_terminate
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text._ZNSt3__122__libcpp_verbose_abortEPKcz	00000018 std::__1::__libcpp_verbose_abort(char const*, ...)
00000000         *UND*	00000000 __avm_stderr
00000000         *UND*	00000000 vfprintf
00000000         *UND*	00000000 abort
00000000  w    F .text.__clang_call_terminate	00000008 .hidden __clang_call_terminate
00000000         *UND*	00000000 __cxa_begin_catch
00000000         *UND*	00000000 std::terminate()

Disassembly of section .text._ZNSt3__122__libcpp_verbose_abortEPKcz:

<std::__1::__libcpp_verbose_abort(char const*, ...)>:
 d6 fe                 adjsp	-0x2
 f4 15                 ldsp16	r5, [sp+0x5]
 f0 16 07              leasp	r6, 0x7
 f4 42                 stsp16	[sp+0x0], r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stderr
 e3 00 00 00           callf	_ZNSt3__122__libcpp_verbose_abortEPKcz
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	vfprintf
 e3 00 00 00           callf	_ZNSt3__122__libcpp_verbose_abortEPKcz
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 e3 00 00 00           callf	_ZNSt3__122__libcpp_verbose_abortEPKcz
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
