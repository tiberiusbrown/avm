
virtual_destructors.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_destructors.cpp
000002ed l     F .text	00000019 record(char)
00000100 l     O .data	00000002 destruction_count
00000102 l     O .data	00000004 destruction_order
0000046b l     F .text	00000011 destroy_second(Second*)
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
000004d3 l       .init_array	00000000 .hidden __init_array_end
000004d3 l       .init_array	00000000 .hidden __init_array_start
000004d3 l       .fini_array	00000000 .hidden __fini_array_start
000004d3 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000003b3 g     F .text	0000008f avm_test_main
0000049f g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	00000015 First::~First()
000004a3 g     O .rodata	0000000c vtable for First
00000306 g     F .text	00000014 First::~First()
000002d8 g     F .text	00000015 First::~First()
000004a1  w    F .text	00000002 operator delete(void*, unsigned int)
0000031a g     F .text	00000015 Second::~Second()
000004af g     O .rodata	0000000c vtable for Second
00000330 g     F .text	00000014 Second::~Second()
0000031a g     F .text	00000015 Second::~Second()
00000344 g     F .text	0000000b Member::~Member()
00000350 g     F .text	00000034 Derived::~Derived()
000004bb g     O .rodata	00000018 vtable for Derived
00000344 g     F .text	0000000b Member::~Member()
00000384 g     F .text	0000000d non-virtual thunk to Derived::~Derived()
00000350 g     F .text	00000034 Derived::~Derived()
00000392 g     F .text	00000014 Derived::~Derived()
000003a6 g     F .text	0000000d non-virtual thunk to Derived::~Derived()
00000442  w    F .text	00000029 Derived::Derived()
0000047c  w    F .text	00000011 First::First()
0000048e  w    F .text	00000011 Second::Second()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 ad 01              call16	avm_test_main
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
 e1 81 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d3 04              ldi16	r4, 0x4d3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d3 04              ldi16	r6, 0x4d3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 d3 04           ldi16	r0, 0x4d3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d3 04           ldi16	r2, 0x4d3
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
 c4 d3 04              ldi16	r4, 0x4d3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d3 04              ldi16	r6, 0x4d3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 d3 04           ldi16	r2, 0x4d3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d3 04           ldi16	r0, 0x4d3
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

<First::~First()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 a9 04              ldi16	r6, 0x4a9
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c0 46                 ldi8	r4, 0x46
 d5 03                 call8	_ZL6recordc
 d6 02                 adjsp	0x2
 ef                    ret

<record(char)>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 41                 ldsp8u	r5, [sp+0x0]
 f0 54 00 01           ldm16	r4, [0x100]
 08                    mov	r6, r4
 f4 ae                 inc16	r6
 f0 5e 00 01           stm16	[0x100], r6
 c6 02 01              ldi16	r6, 0x102
 12                    add	r4, r6
 51                    st8	[r4], r5
 d6 01                 adjsp	0x1
 ef                    ret

<First::~First()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 c8                 call8	_ZN5FirstD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 e1 8a 01              call16	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<Second::~Second()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 b5 04              ldi16	r6, 0x4b5
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c0 53                 ldi8	r4, 0x53
 d5 c1                 call8	_ZL6recordc
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Second::~Second()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 e0                 call8	_ZN6SecondD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 e1 60 01              call16	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<Member::~Member()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 4d                 ldi8	r4, 0x4d
 d5 a1                 call8	_ZL6recordc
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::~Derived()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 48                 stsp16	[sp+0x2], r4
 c6 c1 04              ldi16	r6, 0x4c1
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c8 03                 addi.s8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 cd 04              ldi16	r6, 0x4cd
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c0 44                 ldi8	r4, 0x44
 e1 7b ff              call16	_ZL6recordc
 f4 08                 ldsp16	r4, [sp+0x2]
 c8 06                 addi.s8	r4, 0x6
 d5 cc                 call8	_ZN6MemberD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 9e                 call8	_ZN6SecondD2Ev
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 57 ff              call16	_ZN5FirstD2Ev
 d6 06                 adjsp	0x6
 ef                    ret

<non-virtual thunk to Derived::~Derived()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fd                 addi.s8	r4, -0x3
 d5 c2                 call8	_ZN7DerivedD2Ev
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::~Derived()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 b4                 call8	_ZN7DerivedD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 07                 ldi8	r5, 0x7
 e1 fe 00              call16	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<non-virtual thunk to Derived::~Derived()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fd                 addi.s8	r4, -0x3
 d5 e2                 call8	_ZN7DerivedD0Ev
 d6 02                 adjsp	0x2
 ef                    ret

<avm_test_main>:
 d6 ed                 adjsp	-0x13
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 e1 85 00              call16	_ZN7DerivedC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 60                 stsp16	[sp+0x8], r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 0a                 breq8	avm_test_main+35
 d4 00                 jmp8	avm_test_main+27
 f4 08                 ldsp16	r4, [sp+0x2]
 c8 03                 addi.s8	r4, 0x3
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+35
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 31                    cmp	r4, r5
 d1 09                 brne8	avm_test_main+55
 d4 00                 jmp8	avm_test_main+48
 c0 01                 ldi8	r4, 0x1
 f0 3c 11              stsp16	[sp+0x11], r4
 d4 52                 jmp8	avm_test_main+137
 f4 18                 ldsp16	r4, [sp+0x6]
 d5 7d                 call8	_ZL14destroy_secondP6Second
 f0 54 00 01           ldm16	r4, [0x100]
 cc 04                 cmpi.s8	r4, 0x4
 d0 09                 breq8	avm_test_main+76
 d4 00                 jmp8	avm_test_main+69
 c0 02                 ldi8	r4, 0x2
 f0 3c 11              stsp16	[sp+0x11], r4
 d4 3d                 jmp8	avm_test_main+137
 f0 44 02 01           ldm8u	r4, [0x102]
 f6 44                 sext8	r4
 cc 44                 cmpi.s8	r4, 0x44
 d1 26                 brne8	avm_test_main+124
 d4 00                 jmp8	avm_test_main+88
 f0 44 03 01           ldm8u	r4, [0x103]
 f6 44                 sext8	r4
 cc 4d                 cmpi.s8	r4, 0x4d
 d1 1a                 brne8	avm_test_main+124
 d4 00                 jmp8	avm_test_main+100
 f0 44 04 01           ldm8u	r4, [0x104]
 f6 44                 sext8	r4
 cc 53                 cmpi.s8	r4, 0x53
 d1 0e                 brne8	avm_test_main+124
 d4 00                 jmp8	avm_test_main+112
 f0 44 05 01           ldm8u	r4, [0x105]
 f6 44                 sext8	r4
 cc 46                 cmpi.s8	r4, 0x46
 d0 09                 breq8	avm_test_main+131
 d4 00                 jmp8	avm_test_main+124
 c0 03                 ldi8	r4, 0x3
 f0 3c 11              stsp16	[sp+0x11], r4
 d4 06                 jmp8	avm_test_main+137
 a0                    xor	r4, r4
 f0 3c 11              stsp16	[sp+0x11], r4
 d4 00                 jmp8	avm_test_main+137
 f0 34 11              ldsp16	r4, [sp+0x11]
 d6 13                 adjsp	0x13
 ef                    ret

<Derived::Derived()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 d5 30                 call8	_ZN5FirstC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d5 3a                 call8	_ZN6SecondC2Ev
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 c6 c1 04              ldi16	r6, 0x4c1
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 cd 04              ldi16	r6, 0x4cd
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 06                 adjsp	0x6
 ef                    ret

<destroy_second(Second*)>:
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

<First::First()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 a9 04              ldi16	r6, 0x4a9
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Second::Second()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 b5 04              ldi16	r6, 0x4b5
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 fc                 call8	avm_halt
