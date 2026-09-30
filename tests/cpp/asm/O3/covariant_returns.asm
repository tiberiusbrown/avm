
covariant_returns.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 covariant_returns.cpp
00000256 l     F .text	00000008 call_self(Base*)
0000025e l     F .text	00000014 call_value(Base*)
00000000 l    df *ABS*	00000000 runtime.c
0000029b l       .init_array	00000000 .hidden __init_array_end
0000029b l       .init_array	00000000 .hidden __init_array_start
0000029b l       .fini_array	00000000 .hidden __fini_array_start
0000029b l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001ee g     F .text	00000068 avm_test_main
00000272 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	00000004 Prefix::prefix() const
000001dc g     F .text	00000001 Base::self()
000001de g     F .text	00000003 Base::value() const
000001e2 g     F .text	00000001 Derived::self()
000001e4 g     F .text	00000001 covariant return thunk to Derived::self()
000001e6 g     F .text	00000004 Derived::value() const
000001ea g     F .text	00000004 non-virtual thunk to Derived::value() const
00000274 g     O .rodata	0000000c vtable for Base
00000280 g     O .rodata	0000001b vtable for Derived

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
 e1 54 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9b 02              ldi16	r4, 0x29b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9b 02              ldi16	r6, 0x29b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9b 02           ldi16	r0, 0x29b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9b 02           ldi16	r2, 0x29b
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
 c4 9b 02              ldi16	r4, 0x29b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9b 02              ldi16	r6, 0x29b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9b 02           ldi16	r2, 0x29b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9b 02           ldi16	r0, 0x29b
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
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

<Base::self()>:
 ef                    ret
 00                    nop

<Base::value() const>:
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 00                    nop

<Derived::self()>:
 ef                    ret
 00                    nop

<covariant return thunk to Derived::self()>:
 ef                    ret
 00                    nop

<Derived::value() const>:
 ed 98 28              ld16	r4, [r4+8]
 ef                    ret

<non-virtual thunk to Derived::value() const>:
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f3                 adjsp	-0xd
 c4 7a 02              ldi16	r4, 0x27a
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 95 02              ldi16	r4, 0x295
 c1 00                 ldi8	r5, 0x0
 f4 54                 stsp16	[sp+0x5], r4
 f1 4d                 stsp8	[sp+0x7], r5
 c4 86 02              ldi16	r4, 0x286
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 2a                 ldi8	r4, 0x2a
 f4 60                 stsp16	[sp+0x8], r4
 c0 09                 ldi8	r4, 0x9
 f4 4c                 stsp16	[sp+0x3], r4
 f0 11 0a              leasp	r1, 0xa
 f1 21                 mov	r4, r1
 d5 3a                 call8	_ZL9call_selfP4Base
 f0 10 05              leasp	r0, 0x5
 f5 21                 cmp	r4, r1
 d0 07                 breq8	avm_test_main+60
 c0 02                 ldi8	r4, 0x2
 d6 0d                 adjsp	0xd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f1 20                 mov	r4, r0
 d5 28                 call8	_ZL9call_selfP4Base
 f5 20                 cmp	r4, r0
 d0 07                 breq8	avm_test_main+75
 c0 03                 ldi8	r4, 0x3
 d6 0d                 adjsp	0xd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f1 20                 mov	r4, r0
 d5 21                 call8	_ZL10call_valueP4Base
 cc 2a                 cmpi.s8	r4, 0x2a
 d1 0e                 brne8	avm_test_main+97
 f4 0d                 ldsp16	r5, [sp+0x3]
 c0 05                 ldi8	r4, 0x5
 aa                    xor	r6, r6
 cd 09                 cmpi.s8	r5, 0x9
 fb 26                 cmov.eq	r4, r6
 d6 0d                 adjsp	0xd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 05                 ldi8	r4, 0x5
 d6 0d                 adjsp	0xd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<call_self(Base*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<call_value(Base*)>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 63 c0              ldp24	q3, [q0]
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
