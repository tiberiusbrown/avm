
multiple_translation_units.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 multiple_translation_units.cpp
00000000 l    df *ABS*	00000000 multiple_translation_units_a.cpp
00000000 l    df *ABS*	00000000 multiple_translation_units_b.cpp
00000100 l     O .data	00000002 call_count
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
000003fd l       .init_array	00000000 .hidden __init_array_end
000003fd l       .init_array	00000000 .hidden __init_array_start
000003fd l       .fini_array	00000000 .hidden __fini_array_start
000003fd l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000061 avm_test_main
000003d7 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000338  w    F .text	00000017 MultiDerived::MultiDerived()
0000038b g     F .text	0000001b multi_dispatch(MultiBase*, int)
000003bf g     F .text	00000005 multi_call_count()
00000350  w    F .text	0000000b MultiDerived::~MultiDerived()
0000035c  w    F .text	00000011 MultiBase::MultiBase()
000003ee g     O .rodata	0000000f vtable for MultiDerived
0000036e g     F .text	00000007 MultiBase::~MultiBase()
000003df g     O .rodata	0000000f vtable for MultiBase
00000376 g     F .text	00000006 MultiBase::~MultiBase()
000003d9  w    F .text	00000002 abort
0000037c g     F .text	0000000f multi_helper(int)
000003db  w    F .text	00000002 __cxa_pure_virtual
0000036e g     F .text	00000007 MultiBase::~MultiBase()
000003a6 g     F .text	00000019 MultiDerived::step(int) const
000003c4  w    F .text	00000013 MultiDerived::~MultiDerived()
000003dd  w    F .text	00000002 operator delete(void*, unsigned int)

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
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
 e1 b9 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fd 03              ldi16	r4, 0x3fd
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fd 03              ldi16	r6, 0x3fd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 fd 03           ldi16	r0, 0x3fd
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fd 03           ldi16	r2, 0x3fd
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
 c4 fd 03              ldi16	r4, 0x3fd
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fd 03              ldi16	r6, 0x3fd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 fd 03           ldi16	r2, 0x3fd
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fd 03           ldi16	r0, 0x3fd
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

<avm_test_main>:
 d6 f3                 adjsp	-0xd
 f0 14 08              leasp	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 d5 58                 call8	_ZN12MultiDerivedC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 58                 stsp16	[sp+0x6], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 c1 04                 ldi8	r5, 0x4
 e1 a0 00              call16	_Z14multi_dispatchP9MultiBasei
 cc 0f                 cmpi.s8	r4, 0xf
 d0 0f                 breq8	avm_test_main+39
 d4 00                 jmp8	avm_test_main+26
 c0 01                 ldi8	r4, 0x1
 f4 6c                 stsp16	[sp+0xb], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 d4 30                 jmp8	avm_test_main+87
 f4 18                 ldsp16	r4, [sp+0x6]
 c1 07                 ldi8	r5, 0x7
 e1 86 00              call16	_Z14multi_dispatchP9MultiBasei
 cc 18                 cmpi.s8	r4, 0x18
 d0 0f                 breq8	avm_test_main+65
 d4 00                 jmp8	avm_test_main+52
 c0 02                 ldi8	r4, 0x2
 f4 6c                 stsp16	[sp+0xb], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 d4 16                 jmp8	avm_test_main+87
 e1 a4 00              call16	_Z16multi_call_countv
 08                    mov	r6, r4
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 ce 02                 cmpi.s8	r6, 0x2
 fb 25                 cmov.eq	r4, r5
 f4 6c                 stsp16	[sp+0xb], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 d4 00                 jmp8	avm_test_main+87
 f0 14 08              leasp	r4, 0x8
 d5 1d                 call8	_ZN12MultiDerivedD2Ev
 f4 2c                 ldsp16	r4, [sp+0xb]
 d6 0d                 adjsp	0xd
 ef                    ret

<MultiDerived::MultiDerived()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 1a                 call8	_ZN9MultiBaseC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 f4 03              ldi16	r6, 0x3f4
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 04                 adjsp	0x4
 ef                    ret
 00                    nop

<MultiDerived::~MultiDerived()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 16                 call8	_ZN9MultiBaseD2Ev
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<MultiBase::MultiBase()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 e5 03              ldi16	r6, 0x3e5
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<MultiBase::~MultiBase()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<MultiBase::~MultiBase()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d5 5d                 call8	abort

<multi_helper(int)>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 fe 25                 mul16	r4, r5
 f4 ac                 inc16	r4
 d6 02                 adjsp	0x2
 ef                    ret

<multi_dispatch(MultiBase*, int)>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 04                 mov	r0, r4
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f0 63 cc              ldp24	q3, [q3]
 eb                    callp	q3
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

<MultiDerived::step(int) const>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 c2                 call8	_Z12multi_helperi
 c8 02                 addi.s8	r4, 0x2
 d6 04                 adjsp	0x4
 ef                    ret

<multi_call_count()>:
 f0 54 00 01           ldm16	r4, [0x100]
 ef                    ret

<MultiDerived::~MultiDerived()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 82                 call8	_ZN12MultiDerivedD2Ev
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
