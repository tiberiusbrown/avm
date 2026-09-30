
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
00000364 l       .init_array	00000000 .hidden __init_array_end
00000364 l       .init_array	00000000 .hidden __init_array_start
00000364 l       .fini_array	00000000 .hidden __fini_array_start
00000364 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000041 avm_test_main
00000351 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000355 g     O .rodata	0000000f vtable for MultiDerived
00000320 g     F .text	0000000e multi_dispatch(MultiBase*, int)
0000033e g     F .text	00000005 multi_call_count()
00000318 g     F .text	00000001 MultiBase::~MultiBase()
00000319 g     F .text	00000007 multi_helper(int)
00000318 g     F .text	00000001 MultiBase::~MultiBase()
0000032e g     F .text	00000010 MultiDerived::step(int) const
00000344  w    F .text	0000000d MultiDerived::~MultiDerived()
00000353  w    F .text	00000002 operator delete(void*, unsigned int)

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
 e1 33 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 64 03              ldi16	r4, 0x364
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 64 03              ldi16	r6, 0x364
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 64 03           ldi16	r0, 0x364
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 64 03           ldi16	r2, 0x364
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
 c4 64 03              ldi16	r4, 0x364
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 64 03              ldi16	r6, 0x364
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 64 03           ldi16	r2, 0x364
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 64 03           ldi16	r0, 0x364
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
 b0                    push16	r0
 d6 fd                 adjsp	-0x3
 c4 5b 03              ldi16	r4, 0x35b
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 14 00              leasp	r4, 0x0
 c1 04                 ldi8	r5, 0x4
 d5 36                 call8	_Z14multi_dispatchP9MultiBasei
 cc 0f                 cmpi.s8	r4, 0xf
 d1 17                 brne8	avm_test_main+46
 f0 14 00              leasp	r4, 0x0
 c1 07                 ldi8	r5, 0x7
 d5 2b                 call8	_Z14multi_dispatchP9MultiBasei
 cc 18                 cmpi.s8	r4, 0x18
 d1 11                 brne8	avm_test_main+51
 d5 43                 call8	_Z16multi_call_countv
 f0 00 03              ldi8	r0, 0x3
 a5                    xor	r5, r5
 cc 02                 cmpi.s8	r4, 0x2
 fb 05                 cmov.eq	r0, r5
 d4 08                 jmp8	avm_test_main+54
 f0 00 01              ldi8	r0, 0x1
 d4 03                 jmp8	avm_test_main+54
 f0 00 02              ldi8	r0, 0x2
 f0 14 00              leasp	r4, 0x0
 d5 06                 call8	_ZN9MultiBaseD2Ev
 f1 20                 mov	r4, r0
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 ef                    ret

<MultiBase::~MultiBase()>:
 ef                    ret

<multi_helper(int)>:
 c1 03                 ldi8	r5, 0x3
 fe 25                 mul16	r4, r5
 f4 ac                 inc16	r4
 ef                    ret

<multi_dispatch(MultiBase*, int)>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 f0 63 c0              ldp24	q3, [q0]
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<MultiDerived::step(int) const>:
 01                    mov	r4, r5
 f0 55 00 01           ldm16	r5, [0x100]
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 d5 de                 call8	_Z12multi_helperi
 c8 02                 addi.s8	r4, 0x2
 ef                    ret

<multi_call_count()>:
 f0 54 00 01           ldm16	r4, [0x100]
 ef                    ret
 00                    nop

<MultiDerived::~MultiDerived()>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 d5 cf                 call8	_ZN9MultiBaseD2Ev
 c1 03                 ldi8	r5, 0x3
 f1 20                 mov	r4, r0
 d5 04                 call8	_ZdlPvj
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 fc                 call8	avm_halt
