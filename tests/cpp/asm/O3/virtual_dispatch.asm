
virtual_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_dispatch.cpp
000002b2 l     F .text	00000008 call_base(Base*)
000002ba l     F .text	00000008 call_other(Other*)
000002c2 l     F .text	0000003f call_member(Base*, int (Base::*)())
00000301 l     F .text	00000008 call_root(Root*)
00000000 l    df *ABS*	00000000 runtime.c
00000353 l       .init_array	00000000 .hidden __init_array_end
00000353 l       .init_array	00000000 .hidden __init_array_start
00000353 l       .fini_array	00000000 .hidden __fini_array_start
00000353 l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001f7 g     F .text	000000bb avm_test_main
00000309 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	00000003 Base::value()
000001dc g     F .text	00000003 Other::other()
000001e0 g     F .text	00000003 Derived::value()
000001e4 g     F .text	00000003 Derived::other()
000001e8 g     F .text	00000003 non-virtual thunk to Derived::other()
000001ec g     F .text	00000003 Root::root()
000001f0 g     F .text	00000003 VirtualDerived::root()
000001f4 g     F .text	00000003 virtual thunk to VirtualDerived::root()
0000030b g     O .rodata	00000009 vtable for Base
00000314 g     O .rodata	00000009 vtable for Other
0000031d g     O .rodata	00000015 vtable for Derived
00000332 g     O .rodata	00000009 vtable for Root
0000033b g     O .rodata	00000018 vtable for VirtualDerived

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
 e1 eb 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 53 03              ldi16	r4, 0x353
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 53 03              ldi16	r6, 0x353
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 53 03           ldi16	r0, 0x353
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 53 03           ldi16	r2, 0x353
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
 c4 53 03              ldi16	r4, 0x353
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 53 03              ldi16	r6, 0x353
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 53 03           ldi16	r2, 0x353
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 53 03           ldi16	r0, 0x353
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
 d6 eb                 adjsp	-0x15
 c4 11 03              ldi16	r4, 0x311
 c1 00                 ldi8	r5, 0x0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 2d 14              stsp8	[sp+0x14], r5
 c4 1a 03              ldi16	r4, 0x31a
 c1 00                 ldi8	r5, 0x0
 f4 7c                 stsp16	[sp+0xf], r4
 f0 2d 11              stsp8	[sp+0x11], r5
 c4 2f 03              ldi16	r4, 0x32f
 c1 00                 ldi8	r5, 0x0
 f4 70                 stsp16	[sp+0xc], r4
 f1 69                 stsp8	[sp+0xe], r5
 c4 23 03              ldi16	r4, 0x323
 c1 00                 ldi8	r5, 0x0
 f4 64                 stsp16	[sp+0x9], r4
 f1 5d                 stsp8	[sp+0xb], r5
 c4 38 03              ldi16	r4, 0x338
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 f0 10 00              leasp	r0, 0x0
 c4 50 03              ldi16	r4, 0x350
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 c4 44 03              ldi16	r4, 0x344
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 14 12              leasp	r4, 0x12
 d5 6c                 call8	_ZL9call_baseP4Base
 f0 01 01              ldi8	r1, 0x1
 f0 12 0c              leasp	r2, 0xc
 cc 01                 cmpi.s8	r4, 0x1
 d1 5a                 brne8	avm_test_main+179
 f0 14 09              leasp	r4, 0x9
 d5 5d                 call8	_ZL9call_baseP4Base
 cc 02                 cmpi.s8	r4, 0x2
 d1 51                 brne8	avm_test_main+179
 f0 14 0f              leasp	r4, 0xf
 d5 5c                 call8	_ZL10call_otherP5Other
 f0 01 02              ldi8	r1, 0x2
 cc 03                 cmpi.s8	r4, 0x3
 d1 45                 brne8	avm_test_main+179
 f1 22                 mov	r4, r2
 d5 51                 call8	_ZL10call_otherP5Other
 cc 04                 cmpi.s8	r4, 0x4
 d1 3d                 brne8	avm_test_main+179
 d6 fe                 adjsp	-0x2
 f2 42                 sub	r2, r2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 14 0b              leasp	r4, 0xb
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d5 46                 call8	_ZL11call_memberP4BaseMS_FivE
 d6 02                 adjsp	0x2
 cc 02                 cmpi.s8	r4, 0x2
 d1 20                 brne8	avm_test_main+171
 f0 14 06              leasp	r4, 0x6
 d5 7a                 call8	_ZL9call_rootP4Root
 cc 05                 cmpi.s8	r4, 0x5
 d1 1c                 brne8	avm_test_main+176
 c4 3b 03              ldi16	r4, 0x33b
 c1 00                 ldi8	r5, 0x0
 f0 62 88              ldp16	r4, [q2]
 f2 04                 add	r0, r4
 f1 20                 mov	r4, r0
 d5 68                 call8	_ZL9call_rootP4Root
 f0 01 04              ldi8	r1, 0x4
 cc 06                 cmpi.s8	r4, 0x6
 fb 0a                 cmov.eq	r1, r2
 d4 08                 jmp8	avm_test_main+179
 f0 01 03              ldi8	r1, 0x3
 d4 03                 jmp8	avm_test_main+179
 f0 01 04              ldi8	r1, 0x4
 f1 21                 mov	r4, r1
 d6 15                 adjsp	0x15
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
 04                    mov	r5, r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 11                    add	r4, r5
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 0d                 brne8	_ZL11call_memberP4BaseMS_FivE+39
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 ff              ldi8	r1, 0xff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 d4 12                 jmp8	_ZL11call_memberP4BaseMS_FivE+57
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
