
diamond_inheritance.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 diamond_inheritance.cpp
000003d3 l     F .text	00000011 root_value(Root*)
000003e4 l     F .text	00000011 right_value(Right*)
00000000 l    df *ABS*	00000000 runtime.c
00000505 l       .init_array	00000000 .hidden __init_array_end
00000505 l       .init_array	00000000 .hidden __init_array_start
00000505 l       .fini_array	00000000 .hidden __fini_array_start
00000505 l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
00000273 g     F .text	0000010f avm_test_main
0000048b g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	0000000c Root::value() const
000001e4 g     F .text	0000000c Left::left_value() const
000001f0 g     F .text	0000000c Right::right_value() const
000001fc g     F .text	0000002b Diamond::value() const
00000228 g     F .text	00000021 virtual thunk to Diamond::value() const
0000024a g     F .text	0000000e Diamond::left_value() const
00000258 g     F .text	0000000e Diamond::right_value() const
00000266 g     F .text	0000000d non-virtual thunk to Diamond::right_value() const
00000382  w    F .text	00000051 Diamond::Diamond()
000003f6  w    F .text	00000011 Root::Root()
000004c0 g     O .rodata	00000015 VTT for Diamond
00000408  w    F .text	00000041 Left::Left()
0000044a  w    F .text	00000041 Right::Right()
00000496 g     O .rodata	0000002a vtable for Diamond
0000048d g     O .rodata	00000009 vtable for Root
000004d5 g     O .rodata	00000018 construction vtable for Left-in-Diamond
000004ed g     O .rodata	00000018 construction vtable for Right-in-Diamond

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 6d 01              call16	avm_test_main
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
 e1 6d 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 05 05              ldi16	r4, 0x505
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 05 05              ldi16	r6, 0x505
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 05 05           ldi16	r0, 0x505
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 05 05           ldi16	r2, 0x505
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
 c4 05 05              ldi16	r4, 0x505
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 05 05              ldi16	r6, 0x505
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 05 05           ldi16	r2, 0x505
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 05 05           ldi16	r0, 0x505
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

<Root::value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 23              ld16	r4, [r4+3]
 d6 02                 adjsp	0x2
 ef                    ret

<Left::left_value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 23              ld16	r4, [r4+3]
 d6 02                 adjsp	0x2
 ef                    ret

<Right::right_value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 23              ld16	r4, [r4+3]
 d6 02                 adjsp	0x2
 ef                    ret

<Diamond::value() const>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 01                    mov	r4, r5
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 01                    mov	r4, r5
 12                    add	r4, r6
 ed 98 23              ld16	r4, [r4+3]
 ed da 23              ld16	r6, [r5+3]
 12                    add	r4, r6
 ed ba 28              ld16	r5, [r5+8]
 11                    add	r4, r5
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 00                    nop

<virtual thunk to Diamond::value() const>:
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
 d5 b8                 call8	_ZNK7Diamond5valueEv
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 00                    nop

<Diamond::left_value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 23              ld16	r4, [r4+3]
 f4 ac                 inc16	r4
 d6 02                 adjsp	0x2
 ef                    ret

<Diamond::right_value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 28              ld16	r4, [r4+8]
 c8 02                 addi.s8	r4, 0x2
 d6 02                 adjsp	0x2
 ef                    ret

<non-virtual thunk to Diamond::right_value() const>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fb                 addi.s8	r4, -0x5
 d5 e8                 call8	_ZNK7Diamond11right_valueEv
 d6 02                 adjsp	0x2
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 db                 adjsp	-0x25
 f0 14 14              leasp	r4, 0x14
 f4 60                 stsp16	[sp+0x8], r4
 e1 03 01              call16	_ZN7DiamondC1Ev
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 1f 16              ldsp8u	r7, [sp+0x16]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 01                    mov	r4, r5
 12                    add	r4, r6
 c2 07                 ldi8	r6, 0x7
 ee d8 23              st16	[r4+3], r6
 c0 0b                 ldi8	r4, 0xb
 f0 3c 17              stsp16	[sp+0x17], r4
 c0 0d                 ldi8	r4, 0xd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 68                 stsp16	[sp+0xa], r4
 d0 09                 breq8	avm_test_main+69
 d4 00                 jmp8	avm_test_main+62
 f0 14 19              leasp	r4, 0x19
 f4 68                 stsp16	[sp+0xa], r4
 d4 00                 jmp8	avm_test_main+69
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 58                 stsp16	[sp+0x6], r4
 d0 1a                 breq8	avm_test_main+112
 d4 00                 jmp8	avm_test_main+88
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 62 ac              ldp16	r5, [q3]
 11                    add	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+112
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 78                 stsp16	[sp+0xe], r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 48                 stsp16	[sp+0x2], r4
 d0 1a                 breq8	avm_test_main+154
 d4 00                 jmp8	avm_test_main+130
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 62 ac              ldp16	r5, [q3]
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+154
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 70                 stsp16	[sp+0xc], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 31                 ldsp16	r5, [sp+0xc]
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+174
 d4 00                 jmp8	avm_test_main+167
 c0 01                 ldi8	r4, 0x1
 f0 3c 23              stsp16	[sp+0x23], r4
 d4 59                 jmp8	avm_test_main+263
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 ad 00              call16	_ZL10root_valueP4Root
 cc 1f                 cmpi.s8	r4, 0x1f
 d1 0d                 brne8	avm_test_main+196
 d4 00                 jmp8	avm_test_main+185
 f4 30                 ldsp16	r4, [sp+0xc]
 e1 a2 00              call16	_ZL10root_valueP4Root
 cc 1f                 cmpi.s8	r4, 0x1f
 d0 09                 breq8	avm_test_main+203
 d4 00                 jmp8	avm_test_main+196
 c0 02                 ldi8	r4, 0x2
 f0 3c 23              stsp16	[sp+0x23], r4
 d4 3c                 jmp8	avm_test_main+263
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 eb                    callp	q3
 cc 0c                 cmpi.s8	r4, 0xc
 d1 0e                 brne8	avm_test_main+232
 d4 00                 jmp8	avm_test_main+220
 f0 34 10              ldsp16	r4, [sp+0x10]
 e1 8f 00              call16	_ZL11right_valueP5Right
 cc 0f                 cmpi.s8	r4, 0xf
 d0 09                 breq8	avm_test_main+239
 d4 00                 jmp8	avm_test_main+232
 c0 03                 ldi8	r4, 0x3
 f0 3c 23              stsp16	[sp+0x23], r4
 d4 18                 jmp8	avm_test_main+263
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 98 23              ld16	r4, [r4+3]
 cc 07                 cmpi.s8	r4, 0x7
 d0 09                 breq8	avm_test_main+257
 d4 00                 jmp8	avm_test_main+250
 c0 04                 ldi8	r4, 0x4
 f0 3c 23              stsp16	[sp+0x23], r4
 d4 06                 jmp8	avm_test_main+263
 a0                    xor	r4, r4
 f0 3c 23              stsp16	[sp+0x23], r4
 d4 00                 jmp8	avm_test_main+263
 f0 34 23              ldsp16	r4, [sp+0x23]
 d6 25                 adjsp	0x25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<Diamond::Diamond()>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 c8 0a                 addi.s8	r4, 0xa
 f4 48                 stsp16	[sp+0x2], r4
 d5 64                 call8	_ZN4RootC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 c3 04              ldi16	r6, 0x4c3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d5 6b                 call8	_ZN4LeftC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 05                 addi.s8	r4, 0x5
 f4 50                 stsp16	[sp+0x4], r4
 c6 c9 04              ldi16	r6, 0x4c9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 9d 00              call16	_ZN5RightC2Ev
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 04 9f 04           ldi16	r0, 0x49f
 f0 01 00              ldi8	r1, 0x0
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c6 bd 04              ldi16	r6, 0x4bd
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 b1 04              ldi16	r6, 0x4b1
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<root_value(Root*)>:
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

<right_value(Right*)>:
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
 00                    nop

<Root::Root()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 93 04              ldi16	r6, 0x493
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Left::Left()>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fb                 adjsp	-0x5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f0 63 0c              ldp24	q0, [q3]
 04                    mov	r5, r4
 f7 48                 st16	[r5+], r0
 f3 05                 st8	[r5], r1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 f0 06 f7 ff           ldi16	r2, 0xfff7
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 61                 add32	q0, q1
 f0 62 a0              ldp16	r5, [q0]
 11                    add	r4, r5
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 05                 adjsp	0x5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 00                    nop

<Right::Right()>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fb                 adjsp	-0x5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f0 63 0c              ldp24	q0, [q3]
 04                    mov	r5, r4
 f7 48                 st16	[r5+], r0
 f3 05                 st8	[r5], r1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 f0 06 f7 ff           ldi16	r2, 0xfff7
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 61                 add32	q0, q1
 f0 62 a0              ldp16	r5, [q0]
 11                    add	r4, r5
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 05                 adjsp	0x5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
