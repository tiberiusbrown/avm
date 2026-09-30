
abstract_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 abstract_dispatch.cpp
00000100 l     O .data	00000002 constructed
0000033b l     F .text	00000011 dispatch(interface*)
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
000003a3 l       .init_array	00000000 .hidden __init_array_end
000003a3 l       .init_array	00000000 .hidden __init_array_start
000003a3 l       .fini_array	00000000 .hidden __fini_array_start
000003a3 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
00000302 g     F .text	00000021 avm_test_main
0000037d g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	0000001b interface::interface()
00000385 g     O .rodata	0000000f vtable for interface
000002f4 g     F .text	00000007 interface::~interface()
000002fc g     F .text	00000006 interface::~interface()
0000037f  w    F .text	00000002 abort
00000324  w    F .text	00000017 implementation::implementation()
0000034c  w    F .text	0000000b implementation::~implementation()
00000394  w    O .rodata	0000000f vtable for implementation
00000358  w    F .text	00000012 implementation::value() const
0000036a  w    F .text	00000013 implementation::~implementation()
00000383  w    F .text	00000002 operator delete(void*, unsigned int)
00000381  w    F .text	00000002 __cxa_pure_virtual
000002f4 g     F .text	00000007 interface::~interface()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 fc 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 5f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a3 03              ldi16	r4, 0x3a3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a3 03              ldi16	r6, 0x3a3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 a3 03           ldi16	r0, 0x3a3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a3 03           ldi16	r2, 0x3a3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 a3 03              ldi16	r4, 0x3a3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a3 03              ldi16	r6, 0x3a3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 a3 03           ldi16	r2, 0x3a3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a3 03           ldi16	r0, 0x3a3
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 00                    nop

<interface::interface()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 8b 03              ldi16	r6, 0x38b
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<interface::~interface()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<interface::~interface()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d5 7d                 call8	abort

<avm_test_main>:
 d6 f7                 adjsp	-0x9
 f0 14 06              leasp	r4, 0x6
 f4 40                 stsp16	[sp+0x0], r4
 d5 19                 call8	_ZN14implementationC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d5 28                 call8	_ZL8dispatchP9interface
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cd 11                 cmpi.s8	r5, 0x11
 f8 0d                 cset.ne	r5
 f4 49                 stsp16	[sp+0x2], r5
 d5 2e                 call8	_ZN14implementationD2Ev
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 09                 adjsp	0x9
 ef                    ret
 00                    nop

<implementation::implementation()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 aa                 call8	_ZN9interfaceC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 9a 03              ldi16	r6, 0x39a
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 04                 adjsp	0x4
 ef                    ret

<dispatch(interface*)>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 eb                    callp	q3
 d6 02                 adjsp	0x2
 ef                    ret

<implementation::~implementation()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 a0                 call8	_ZN9interfaceD2Ev
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<implementation::value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 00 01           ldm16	r6, [0x100]
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 ce 01                 cmpi.s8	r6, 0x1
 fb 25                 cmov.eq	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<implementation::~implementation()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 d8                 call8	_ZN14implementationD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 d5 09                 call8	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<abort>:
 d5 fc                 call8	avm_halt

<__cxa_pure_virtual>:
 d5 fa                 call8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 f8                 call8	avm_halt
