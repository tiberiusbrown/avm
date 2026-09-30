
virtual_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_dispatch.cpp
000003dd l     F .text	00000011 call_base(Base*)
000003ee l     F .text	00000011 call_other(Other*)
000003ff l     F .text	00000071 call_member(Base*, int (Base::*)())
00000470 l     F .text	00000011 call_root(Root*)
00000000 l    df *ABS*	00000000 runtime.c
000004cb l       .init_array	00000000 .hidden __init_array_end
000004cb l       .init_array	00000000 .hidden __init_array_start
000004cb l       .fini_array	00000000 .hidden __fini_array_start
000004cb l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
00000243 g     F .text	00000115 avm_test_main
00000481 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	00000009 Base::value()
000001e2 g     F .text	00000009 Other::other()
000001ec g     F .text	00000009 Derived::value()
000001f6 g     F .text	00000009 Derived::other()
00000200 g     F .text	0000000d non-virtual thunk to Derived::other()
0000020e g     F .text	00000009 Root::root()
00000218 g     F .text	00000009 VirtualDerived::root()
00000222 g     F .text	00000021 virtual thunk to VirtualDerived::root()
00000358  w    F .text	00000011 Base::Base()
0000036a  w    F .text	00000011 Other::Other()
0000037c  w    F .text	00000029 Derived::Derived()
000003a6  w    F .text	00000011 Root::Root()
000003b8  w    F .text	00000025 VirtualDerived::VirtualDerived()
00000483 g     O .rodata	00000009 vtable for Base
0000048c g     O .rodata	00000009 vtable for Other
00000495 g     O .rodata	00000015 vtable for Derived
000004aa g     O .rodata	00000009 vtable for Root
000004b3 g     O .rodata	00000018 vtable for VirtualDerived

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 3d 01              call16	avm_test_main
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
 e1 63 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cb 04              ldi16	r4, 0x4cb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cb 04              ldi16	r6, 0x4cb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 cb 04           ldi16	r0, 0x4cb
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cb 04           ldi16	r2, 0x4cb
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
 c4 cb 04              ldi16	r4, 0x4cb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cb 04              ldi16	r6, 0x4cb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 cb 04           ldi16	r2, 0x4cb
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cb 04           ldi16	r0, 0x4cb
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
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Other::other()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 03                 ldi8	r4, 0x3
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::value()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 02                 ldi8	r4, 0x2
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Derived::other()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 04                 ldi8	r4, 0x4
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<non-virtual thunk to Derived::other()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fd                 addi.s8	r4, -0x3
 d5 ec                 call8	_ZN7Derived5otherEv
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Root::root()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 05                 ldi8	r4, 0x5
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<VirtualDerived::root()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 06                 ldi8	r4, 0x6
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<virtual thunk to VirtualDerived::root()>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 62 ac              ldp16	r5, [q3]
 11                    add	r4, r5
 d5 da                 call8	_ZN14VirtualDerived4rootEv
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_test_main>:
 d6 ce                 adjsp	-0x32
 f0 14 2d              leasp	r4, 0x2d
 e1 0d 01              call16	_ZN4BaseC2Ev
 f0 14 2a              leasp	r4, 0x2a
 e1 19 01              call16	_ZN5OtherC2Ev
 f0 14 24              leasp	r4, 0x24
 f4 48                 stsp16	[sp+0x2], r4
 e1 23 01              call16	_ZN7DerivedC2Ev
 f0 14 21              leasp	r4, 0x21
 e1 47 01              call16	_ZN4RootC2Ev
 f0 14 1b              leasp	r4, 0x1b
 e1 53 01              call16	_ZN14VirtualDerivedC1Ev
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3d 19              stsp16	[sp+0x19], r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 09                 breq8	avm_test_main+55
 d4 00                 jmp8	avm_test_main+48
 f0 14 27              leasp	r4, 0x27
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+55
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 3c 17              stsp16	[sp+0x17], r4
 a0                    xor	r4, r4
 f0 15 1b              leasp	r5, 0x1b
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 1b                 breq8	avm_test_main+97
 d4 00                 jmp8	avm_test_main+72
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f0 1d 1d              ldsp8u	r5, [sp+0x1d]
 c6 f7 ff              ldi16	r6, 0xfff7
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 62 a8              ldp16	r5, [q2]
 f0 14 1b              leasp	r4, 0x1b
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+97
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3c 15              stsp16	[sp+0x15], r4
 a0                    xor	r4, r4
 f0 3c 13              stsp16	[sp+0x13], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 2d 12              stsp8	[sp+0x12], r5
 f0 14 2d              leasp	r4, 0x2d
 e1 21 01              call16	_ZL9call_baseP4Base
 cc 01                 cmpi.s8	r4, 0x1
 d1 0e                 brne8	avm_test_main+139
 d4 00                 jmp8	avm_test_main+127
 f0 34 19              ldsp16	r4, [sp+0x19]
 e1 15 01              call16	_ZL9call_baseP4Base
 cc 02                 cmpi.s8	r4, 0x2
 d0 09                 breq8	avm_test_main+146
 d4 00                 jmp8	avm_test_main+139
 c0 01                 ldi8	r4, 0x1
 f0 3c 30              stsp16	[sp+0x30], r4
 d4 7d                 jmp8	avm_test_main+271
 f0 14 2a              leasp	r4, 0x2a
 e1 13 01              call16	_ZL10call_otherP5Other
 cc 03                 cmpi.s8	r4, 0x3
 d1 0e                 brne8	avm_test_main+170
 d4 00                 jmp8	avm_test_main+158
 f0 34 17              ldsp16	r4, [sp+0x17]
 e1 07 01              call16	_ZL10call_otherP5Other
 cc 04                 cmpi.s8	r4, 0x4
 d0 09                 breq8	avm_test_main+177
 d4 00                 jmp8	avm_test_main+170
 c0 02                 ldi8	r4, 0x2
 f0 3c 30              stsp16	[sp+0x30], r4
 d4 5e                 jmp8	avm_test_main+271
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 1f 12              ldsp8u	r7, [sp+0x12]
 f0 35 13              ldsp16	r5, [sp+0x13]
 f4 79                 stsp16	[sp+0xe], r5
 f4 6e                 stsp16	[sp+0xb], r6
 f1 67                 stsp8	[sp+0xd], r7
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f1 59                 stsp8	[sp+0xa], r5
 f3 79                 ldsp8u	r5, [sp+0xe]
 f1 55                 stsp8	[sp+0x9], r5
 f3 75                 ldsp8u	r5, [sp+0xd]
 f1 51                 stsp8	[sp+0x8], r5
 f3 71                 ldsp8u	r5, [sp+0xc]
 f1 4d                 stsp8	[sp+0x7], r5
 f3 6d                 ldsp8u	r5, [sp+0xb]
 f1 49                 stsp8	[sp+0x6], r5
 f0 15 06              leasp	r5, 0x6
 e1 df 00              call16	_ZL11call_memberP4BaseMS_FivE
 cc 02                 cmpi.s8	r4, 0x2
 d0 09                 breq8	avm_test_main+234
 d4 00                 jmp8	avm_test_main+227
 c0 03                 ldi8	r4, 0x3
 f0 3c 30              stsp16	[sp+0x30], r4
 d4 25                 jmp8	avm_test_main+271
 f0 14 21              leasp	r4, 0x21
 e1 3d 01              call16	_ZL9call_rootP4Root
 cc 05                 cmpi.s8	r4, 0x5
 d1 0e                 brne8	avm_test_main+258
 d4 00                 jmp8	avm_test_main+246
 f0 34 15              ldsp16	r4, [sp+0x15]
 e1 31 01              call16	_ZL9call_rootP4Root
 cc 06                 cmpi.s8	r4, 0x6
 d0 09                 breq8	avm_test_main+265
 d4 00                 jmp8	avm_test_main+258
 c0 04                 ldi8	r4, 0x4
 f0 3c 30              stsp16	[sp+0x30], r4
 d4 06                 jmp8	avm_test_main+271
 a0                    xor	r4, r4
 f0 3c 30              stsp16	[sp+0x30], r4
 d4 00                 jmp8	avm_test_main+271
 f0 34 30              ldsp16	r4, [sp+0x30]
 d6 32                 adjsp	0x32
 ef                    ret

<Base::Base()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 89 04              ldi16	r6, 0x489
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Other::Other()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 92 04              ldi16	r6, 0x492
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
 d5 d2                 call8	_ZN4BaseC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d5 dc                 call8	_ZN5OtherC2Ev
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 c6 9b 04              ldi16	r6, 0x49b
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 a7 04              ldi16	r6, 0x4a7
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 06                 adjsp	0x6
 ef                    ret
 00                    nop

<Root::Root()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 b0 04              ldi16	r6, 0x4b0
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<VirtualDerived::VirtualDerived()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d5 e0                 call8	_ZN4RootC2Ev
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 c6 bc 04              ldi16	r6, 0x4bc
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 c8 04              ldi16	r6, 0x4c8
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 06                 adjsp	0x6
 ef                    ret

<call_base(Base*)>:
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

<call_other(Other*)>:
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

<call_member(Base*, int (Base::*)())>:
 b0                    push16	r0
 d6 ef                 adjsp	-0x11
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f1 06                 mov	r0, r6
 f0 6c 91              ld16	r4, [r0+]
 ed a0 20              ld8u	r5, [r0+0]
 ed dc 23              ld16	r6, [r6+3]
 f4 7f                 stsp16	[sp+0xf], r7
 f4 76                 stsp16	[sp+0xd], r6
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 f4 3e                 ldsp16	r6, [sp+0xf]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 71                 ldsp8u	r5, [sp+0xc]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 37                 ldsp16	r7, [sp+0xd]
 1b                    add	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 22                 breq8	_ZL11call_memberP4BaseMS_FivE+85
 d4 00                 jmp8	_ZL11call_memberP4BaseMS_FivE+53
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 11                 jmp8	_ZL11call_memberP4BaseMS_FivE+102
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 00                 jmp8	_ZL11call_memberP4BaseMS_FivE+102
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 eb                    callp	q3
 d6 11                 adjsp	0x11
 b8                    pop16	r0
 ef                    ret

<call_root(Root*)>:
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
