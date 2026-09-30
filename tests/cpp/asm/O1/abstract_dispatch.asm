
abstract_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 abstract_dispatch.cpp
00000100 l     O .data	00000002 constructed
0000030d l     F .text	00000008 dispatch(interface*)
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
0000034e l       .init_array	00000000 .hidden __init_array_end
0000034e l       .init_array	00000000 .hidden __init_array_start
0000034e l       .fini_array	00000000 .hidden __fini_array_start
0000034e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002ee g     F .text	0000001f avm_test_main
00000328 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	00000013 interface::interface()
00000330 g     O .rodata	0000000f vtable for interface
000002ec g     F .text	00000002 interface::~interface()
0000032a  w    F .text	00000002 abort
0000033f  w    O .rodata	0000000f vtable for implementation
00000316 g     F .text	00000001 interface::~interface()
00000318  w    F .text	0000000c implementation::value() const
00000324  w    F .text	00000004 implementation::~implementation()
0000032e  w    F .text	00000002 operator delete(void*, unsigned int)
0000032c  w    F .text	00000002 __cxa_pure_virtual
00000316 g     F .text	00000001 interface::~interface()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 e8 00              call16	avm_test_main
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
 e1 0a 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4e 03              ldi16	r4, 0x34e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 4e 03              ldi16	r6, 0x34e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 4e 03           ldi16	r0, 0x34e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4e 03           ldi16	r2, 0x34e
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
 c4 4e 03              ldi16	r4, 0x34e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 4e 03              ldi16	r6, 0x34e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 4e 03           ldi16	r2, 0x34e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4e 03           ldi16	r0, 0x34e
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
 c6 36 03              ldi16	r6, 0x336
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 ef                    ret
 00                    nop

<interface::~interface()>:
 d5 3c                 call8	abort

<avm_test_main>:
 b0                    push16	r0
 d6 fd                 adjsp	-0x3
 f0 10 00              leasp	r0, 0x0
 f1 20                 mov	r4, r0
 d5 e0                 call8	_ZN9interfaceC2Ev
 c4 45 03              ldi16	r4, 0x345
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f1 20                 mov	r4, r0
 d5 08                 call8	_ZL8dispatchP9interface
 cc 11                 cmpi.s8	r4, 0x11
 f8 0c                 cset.ne	r4
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 ef                    ret

<dispatch(interface*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3
 00                    nop

<interface::~interface()>:
 ef                    ret
 00                    nop

<implementation::value() const>:
 f0 55 00 01           ldm16	r5, [0x100]
 a0                    xor	r4, r4
 c2 11                 ldi8	r6, 0x11
 cd 01                 cmpi.s8	r5, 0x1
 fb 26                 cmov.eq	r4, r6
 ef                    ret

<implementation::~implementation()>:
 c1 03                 ldi8	r5, 0x3
 d4 06                 jmp8	_ZdlPvj

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<abort>:
 d5 fc                 call8	avm_halt

<__cxa_pure_virtual>:
 d5 fa                 call8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 f8                 call8	avm_halt
