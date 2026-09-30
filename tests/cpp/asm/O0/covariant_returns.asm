
covariant_returns.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 covariant_returns.cpp
00000325 l     F .text	00000011 call_self(Base*)
00000336 l     F .text	0000001c call_value(Base*)
00000000 l    df *ABS*	00000000 runtime.c
00000395 l       .init_array	00000000 .hidden __init_array_end
00000395 l       .init_array	00000000 .hidden __init_array_start
00000395 l       .fini_array	00000000 .hidden __fini_array_start
00000395 l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
00000241 g     F .text	000000a8 avm_test_main
00000363 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	0000000c Prefix::prefix() const
000001e4 g     F .text	00000009 Base::self()
000001ee g     F .text	00000009 Base::value() const
000001f8 g     F .text	00000009 Derived::self()
00000202 g     F .text	00000025 covariant return thunk to Derived::self()
00000228 g     F .text	0000000c Derived::value() const
00000234 g     F .text	0000000d non-virtual thunk to Derived::value() const
000002ea  w    F .text	00000011 Base::Base()
000002fc  w    F .text	00000029 Derived::Derived()
0000036e g     O .rodata	0000000c vtable for Base
00000352  w    F .text	00000011 Prefix::Prefix()
0000037a g     O .rodata	0000001b vtable for Derived
00000365 g     O .rodata	00000009 vtable for Prefix

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 3b 01              call16	avm_test_main
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
 e1 45 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 95 03              ldi16	r4, 0x395
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 95 03              ldi16	r6, 0x395
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 95 03           ldi16	r0, 0x395
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 95 03           ldi16	r2, 0x395
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
 e1 81 fe              call16	-383
 c4 95 03              ldi16	r4, 0x395
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 95 03              ldi16	r6, 0x395
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 95 03           ldi16	r2, 0x395
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 95 03           ldi16	r0, 0x395
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
 e1 30 fe              call16	-464
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 00                    nop

<Prefix::prefix() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 23              ld16	r4, [r4+3]
 d6 02                 adjsp	0x2
 ef                    ret

<Base::self()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Base::value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::self()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<covariant return thunk to Derived::self()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 fb                 addi.s8	r4, -0x5
 d5 ec                 call8	_ZN7Derived4selfEv
 04                    mov	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 2c                 tst16	r4
 d0 0a                 breq8	_ZTchn5_h5_N7Derived4selfEv+27
 d4 00                 jmp8	_ZTchn5_h5_N7Derived4selfEv+19
 f4 08                 ldsp16	r4, [sp+0x2]
 c8 05                 addi.s8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	_ZTchn5_h5_N7Derived4selfEv+32
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	_ZTchn5_h5_N7Derived4selfEv+32
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 06                 adjsp	0x6
 ef                    ret
 00                    nop

<Derived::value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 28              ld16	r4, [r4+8]
 d6 02                 adjsp	0x2
 ef                    ret

<non-virtual thunk to Derived::value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fb                 addi.s8	r4, -0x5
 d5 ea                 call8	_ZNK7Derived5valueEv
 d6 02                 adjsp	0x2
 ef                    ret

<avm_test_main>:
 d6 e7                 adjsp	-0x19
 f0 14 14              leasp	r4, 0x14
 e1 a1 00              call16	_ZN4BaseC2Ev
 f0 14 0a              leasp	r4, 0xa
 f4 50                 stsp16	[sp+0x4], r4
 e1 ab 00              call16	_ZN7DerivedC2Ev
 f4 11                 ldsp16	r5, [sp+0x4]
 c0 09                 ldi8	r4, 0x9
 f4 74                 stsp16	[sp+0xd], r4
 c0 2a                 ldi8	r4, 0x2a
 f0 3c 12              stsp16	[sp+0x12], r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 58                 stsp16	[sp+0x6], r4
 d0 09                 breq8	avm_test_main+43
 d4 00                 jmp8	avm_test_main+36
 f0 14 0f              leasp	r4, 0xf
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+43
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 15 0a              leasp	r5, 0xa
 31                    cmp	r4, r5
 d1 09                 brne8	avm_test_main+64
 d4 00                 jmp8	avm_test_main+57
 c0 01                 ldi8	r4, 0x1
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 62                 jmp8	avm_test_main+162
 f0 14 14              leasp	r4, 0x14
 f4 48                 stsp16	[sp+0x2], r4
 e1 9c 00              call16	_ZL9call_selfP4Base
 f4 09                 ldsp16	r5, [sp+0x2]
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+86
 d4 00                 jmp8	avm_test_main+79
 c0 02                 ldi8	r4, 0x2
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 4c                 jmp8	avm_test_main+162
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 89 00              call16	_ZL9call_selfP4Base
 f4 21                 ldsp16	r5, [sp+0x8]
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+105
 d4 00                 jmp8	avm_test_main+98
 c0 03                 ldi8	r4, 0x3
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 39                 jmp8	avm_test_main+162
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 e1 46 ff              call16	_ZN7Derived4selfEv
 f4 01                 ldsp16	r5, [sp+0x0]
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+127
 d4 00                 jmp8	avm_test_main+120
 c0 04                 ldi8	r4, 0x4
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 23                 jmp8	avm_test_main+162
 f4 20                 ldsp16	r4, [sp+0x8]
 d5 72                 call8	_ZL10call_valueP4Base
 cc 2a                 cmpi.s8	r4, 0x2a
 d1 0e                 brne8	avm_test_main+149
 d4 00                 jmp8	avm_test_main+137
 f0 14 0a              leasp	r4, 0xa
 e1 08 ff              call16	_ZNK6Prefix6prefixEv
 cc 09                 cmpi.s8	r4, 0x9
 d0 09                 breq8	avm_test_main+156
 d4 00                 jmp8	avm_test_main+149
 c0 05                 ldi8	r4, 0x5
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 06                 jmp8	avm_test_main+162
 a0                    xor	r4, r4
 f0 3c 17              stsp16	[sp+0x17], r4
 d4 00                 jmp8	avm_test_main+162
 f0 34 17              ldsp16	r4, [sp+0x17]
 d6 19                 adjsp	0x19
 ef                    ret
 00                    nop

<Base::Base()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 74 03              ldi16	r6, 0x374
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::Derived()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 d5 4c                 call8	_ZN6PrefixC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 05                 addi.s8	r4, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 d5 dc                 call8	_ZN4BaseC2Ev
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 c6 80 03              ldi16	r6, 0x380
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 8f 03              ldi16	r6, 0x38f
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 06                 adjsp	0x6
 ef                    ret

<call_self(Base*)>:
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

<call_value(Base*)>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 eb                    callp	q3
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<Prefix::Prefix()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 6b 03              ldi16	r6, 0x36b
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
