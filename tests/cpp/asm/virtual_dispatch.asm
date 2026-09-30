
C:/Users/Brown/Documents/GitHub/avm/build/tests/cpp/virtual_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_dispatch.cpp
000002c7 l     F .text	00000008 call_base(Base*)
000002cf l     F .text	00000008 call_other(Other*)
000002d7 l     F .text	00000036 call_member(Base*, int (Base::*)())
0000030d l     F .text	00000008 call_root(Root*)
00000000 l    df *ABS*	00000000 runtime.c
0000035f l       .init_array	00000000 .hidden __init_array_end
0000035f l       .init_array	00000000 .hidden __init_array_start
0000035f l       .fini_array	00000000 .hidden __fini_array_start
0000035f l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001f7 g     F .text	000000d0 avm_test_main
00000315 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	00000003 Base::value()
000001dc g     F .text	00000003 Other::other()
000001e0 g     F .text	00000003 Derived::value()
000001e4 g     F .text	00000003 Derived::other()
000001e8 g     F .text	00000003 non-virtual thunk to Derived::other()
000001ec g     F .text	00000003 Root::root()
000001f0 g     F .text	00000003 VirtualDerived::root()
000001f4 g     F .text	00000003 virtual thunk to VirtualDerived::root()
00000317 g     O .rodata	00000009 vtable for Base
00000320 g     O .rodata	00000009 vtable for Other
00000329 g     O .rodata	00000015 vtable for Derived
0000033e g     O .rodata	00000009 vtable for Root
00000347 g     O .rodata	00000018 vtable for VirtualDerived

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 f1 00              call16	avm_test_main
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
 e1 f7 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5f 03              ldi16	r4, 0x35f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 5f 03              ldi16	r6, 0x35f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 5f 03           ldi16	r0, 0x35f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5f 03           ldi16	r2, 0x35f
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
 c4 5f 03              ldi16	r4, 0x35f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 5f 03              ldi16	r6, 0x35f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 5f 03           ldi16	r2, 0x35f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5f 03           ldi16	r0, 0x35f
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

<Base::value()>:
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 00                    nop

<Other::other()>:
 c0 03                 ldi8	r4, 0x3
 ef                    ret
 00                    nop

<Derived::value()>:
 c0 02                 ldi8	r4, 0x2
 ef                    ret
 00                    nop

<Derived::other()>:
 c0 04                 ldi8	r4, 0x4
 ef                    ret
 00                    nop

<non-virtual thunk to Derived::other()>:
 c0 04                 ldi8	r4, 0x4
 ef                    ret
 00                    nop

<Root::root()>:
 c0 05                 ldi8	r4, 0x5
 ef                    ret
 00                    nop

<VirtualDerived::root()>:
 c0 06                 ldi8	r4, 0x6
 ef                    ret
 00                    nop

<virtual thunk to VirtualDerived::root()>:
 c0 06                 ldi8	r4, 0x6
 ef                    ret

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e1                 adjsp	-0x1f
 c4 1d 03              ldi16	r4, 0x31d
 c1 00                 ldi8	r5, 0x0
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 2d 1e              stsp8	[sp+0x1e], r5
 c4 26 03              ldi16	r4, 0x326
 c1 00                 ldi8	r5, 0x0
 f0 3c 19              stsp16	[sp+0x19], r4
 f0 2d 1b              stsp8	[sp+0x1b], r5
 c4 3b 03              ldi16	r4, 0x33b
 c1 00                 ldi8	r5, 0x0
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 2d 18              stsp8	[sp+0x18], r5
 c4 2f 03              ldi16	r4, 0x32f
 c1 00                 ldi8	r5, 0x0
 f0 3c 13              stsp16	[sp+0x13], r4
 f0 2d 15              stsp8	[sp+0x15], r5
 c4 44 03              ldi16	r4, 0x344
 c1 00                 ldi8	r5, 0x0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 2d 12              stsp8	[sp+0x12], r5
 f0 10 0a              leasp	r0, 0xa
 c4 5c 03              ldi16	r4, 0x35c
 c1 00                 ldi8	r5, 0x0
 f4 74                 stsp16	[sp+0xd], r4
 f1 6d                 stsp8	[sp+0xf], r5
 c4 50 03              ldi16	r4, 0x350
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 f0 14 1c              leasp	r4, 0x1c
 d5 7a                 call8	_ZL9call_baseP4Base
 f0 01 01              ldi8	r1, 0x1
 f0 12 16              leasp	r2, 0x16
 cc 01                 cmpi.s8	r4, 0x1
 d1 68                 brne8	avm_test_main+200
 f0 14 13              leasp	r4, 0x13
 d5 6b                 call8	_ZL9call_baseP4Base
 cc 02                 cmpi.s8	r4, 0x2
 d1 5f                 brne8	avm_test_main+200
 f0 14 19              leasp	r4, 0x19
 d5 6a                 call8	_ZL10call_otherP5Other
 f0 01 02              ldi8	r1, 0x2
 cc 03                 cmpi.s8	r4, 0x3
 d1 53                 brne8	avm_test_main+200
 f1 22                 mov	r4, r2
 d5 5f                 call8	_ZL10call_otherP5Other
 cc 04                 cmpi.s8	r4, 0x4
 d1 4b                 brne8	avm_test_main+200
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 54                 stsp16	[sp+0x5], r4
 f1 4d                 stsp8	[sp+0x7], r5
 c0 01                 ldi8	r4, 0x1
 f1 30                 stsp8	[sp+0x0], r4
 f2 42                 sub	r2, r2
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3a 03              stsp16	[sp+0x3], r2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 44                 stsp16	[sp+0x1], r4
 f0 14 13              leasp	r4, 0x13
 f0 15 00              leasp	r5, 0x0
 d5 44                 call8	_ZL11call_memberP4BaseMS_FivE
 cc 02                 cmpi.s8	r4, 0x2
 d1 20                 brne8	avm_test_main+192
 f0 14 10              leasp	r4, 0x10
 d5 71                 call8	_ZL9call_rootP4Root
 cc 05                 cmpi.s8	r4, 0x5
 d1 1c                 brne8	avm_test_main+197
 c4 47 03              ldi16	r4, 0x347
 c1 00                 ldi8	r5, 0x0
 f0 62 88              ldp16	r4, [q2]
 f2 04                 add	r0, r4
 f1 20                 mov	r4, r0
 d5 5f                 call8	_ZL9call_rootP4Root
 f0 01 04              ldi8	r1, 0x4
 cc 06                 cmpi.s8	r4, 0x6
 fb 0a                 cmov.eq	r1, r2
 d4 08                 jmp8	avm_test_main+200
 f0 01 03              ldi8	r1, 0x3
 d4 03                 jmp8	avm_test_main+200
 f0 01 04              ldi8	r1, 0x4
 f1 21                 mov	r4, r1
 d6 1f                 adjsp	0x1f
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<call_base(Base*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<call_other(Other*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<call_member(Base*, int (Base::*)())>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 ed 9a 23              ld16	r4, [r5+3]
 12                    add	r4, r6
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 12                 breq8	_ZL11call_memberP4BaseMS_FivE+48
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 f7 63                 add32	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_root(Root*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<avm_halt>:
 d4 fe                 jmp8	avm_halt
