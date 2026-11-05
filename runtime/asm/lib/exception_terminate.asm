
exception_terminate.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 exception_terminate.cpp
00000000 l    d  .text._ZSt13get_terminatev	00000000 .text._ZSt13get_terminatev
00000000 l     F .text._ZN12_GLOBAL__N_125default_terminate_handlerEv	00000004 (anonymous namespace)::default_terminate_handler()
00000000 l    d  .text._ZN12_GLOBAL__N_125default_terminate_handlerEv	00000000 .text._ZN12_GLOBAL__N_125default_terminate_handlerEv
00000000 l    d  .text._ZSt13set_terminatePFvvE	00000000 .text._ZSt13set_terminatePFvvE
00000000 l    d  .text._ZSt9terminatev	00000000 .text._ZSt9terminatev
00000000 l    d  .text.__clang_call_terminate	00000000 .text.__clang_call_terminate
00000000 l    d  .text._ZSt19uncaught_exceptionsv	00000000 .text._ZSt19uncaught_exceptionsv
00000000 l    d  .data..L_MergedGlobals	00000000 .data..L_MergedGlobals
00000000 l     O .data..L_MergedGlobals	00000001 (anonymous namespace)::terminating
00000001 l     O .data..L_MergedGlobals	00000003 (anonymous namespace)::installed_handler
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZSt13get_terminatev	0000001d std::get_terminate()
00000000         *UND*	00000000 abort
00000000 g     F .text._ZSt13set_terminatePFvvE	00000024 std::set_terminate(void (*)())
00000000 g     F .text._ZSt9terminatev	00000033 std::terminate()
00000000  w    F .text.__clang_call_terminate	00000008 .hidden __clang_call_terminate
00000000         *UND*	00000000 __cxa_begin_catch
00000000 g     F .text._ZSt19uncaught_exceptionsv	00000004 std::uncaught_exceptions()
00000000         *UND*	00000000 __cxa_uncaught_exceptions

Disassembly of section .text._ZSt13get_terminatev:

<std::get_terminate()>:
 b1                    push16	r1
 b0                    push16	r0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 69 8c              cmp32	q2, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text._ZN12_GLOBAL__N_125default_terminate_handlerEv:

<(anonymous namespace)::default_terminate_handler()>:
 e3 00 00 00           callf	_ZN12_GLOBAL__N_125default_terminate_handlerEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text._ZSt13set_terminatePFvvE:

<std::set_terminate(void (*)())>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 0e                    mov	r7, r6
 f7 3c                 ld16	r4, [r7+]
 47                    ld8u	r5, [r7]
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 69 8c              cmp32	q2, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text._ZSt9terminatev:

<std::terminate()>:
 b1                    push16	r1
 b0                    push16	r0
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZSt9terminatev
		R_AVM_FAR24	.text._ZSt9terminatev+0x2b
<L0>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text._ZN12_GLOBAL__N_125default_terminate_handlerEv
 f0 69 8c              cmp32	q2, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 c2 01                 ldi8	r6, 0x1
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	.data..L_MergedGlobals
 ea                    callp	q2
 e3 00 00 00           callf	_ZSt9terminatev
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 e3 00 00 00           callf	_ZSt9terminatev
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

Disassembly of section .text._ZSt19uncaught_exceptionsv:

<std::uncaught_exceptions()>:
 e2 00 00 00           jmpf	_ZSt19uncaught_exceptionsv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__cxa_uncaught_exceptions
