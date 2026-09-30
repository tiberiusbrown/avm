
virtual_destructors.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_destructors.cpp
00000100 l     O .data	00000002 destruction_count
00000102 l     O .data	00000004 destruction_order
000004a6 l     F .text	00000008 destroy_second(Second*)
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
000004e2 l       .init_array	00000000 .hidden __init_array_end
000004e2 l       .init_array	00000000 .hidden __init_array_start
000004e2 l       .fini_array	00000000 .hidden __fini_array_start
000004e2 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
00000452 g     F .text	00000054 avm_test_main
000004ae g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	0000001b First::~First()
000004b2 g     O .rodata	0000000c vtable for First
000002f4 g     F .text	00000020 First::~First()
000004b0  w    F .text	00000002 operator delete(void*, unsigned int)
00000314 g     F .text	0000001b Second::~Second()
000004be g     O .rodata	0000000c vtable for Second
00000330 g     F .text	00000020 Second::~Second()
00000350 g     F .text	0000003c Derived::~Derived()
0000038c g     F .text	0000003c non-virtual thunk to Derived::~Derived()
000003c8 g     F .text	00000045 Derived::~Derived()
0000040e g     F .text	00000044 non-virtual thunk to Derived::~Derived()
000004ca g     O .rodata	00000018 vtable for Derived
000002d8 g     F .text	0000001b First::~First()
00000314 g     F .text	0000001b Second::~Second()
00000350 g     F .text	0000003c Derived::~Derived()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 4c 02              call16	avm_test_main
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
 e1 90 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e2 04              ldi16	r4, 0x4e2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e2 04              ldi16	r6, 0x4e2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 e2 04           ldi16	r0, 0x4e2
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e2 04           ldi16	r2, 0x4e2
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
 c4 e2 04              ldi16	r4, 0x4e2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e2 04              ldi16	r6, 0x4e2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 e2 04           ldi16	r2, 0x4e2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e2 04           ldi16	r0, 0x4e2
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
 c6 b8 04              ldi16	r6, 0x4b8
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 c5 02 01              ldi16	r5, 0x102
 14                    add	r5, r4
 c0 46                 ldi8	r4, 0x46
 54                    st8	[r5], r4
 ef                    ret
 00                    nop

<First::~First()>:
 c6 b8 04              ldi16	r6, 0x4b8
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 f0 55 00 01           ldm16	r5, [0x100]
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 f0 5e 00 01           stm16	[0x100], r6
 c6 02 01              ldi16	r6, 0x102
 19                    add	r6, r5
 c1 46                 ldi8	r5, 0x46
 59                    st8	[r6], r5
 c1 03                 ldi8	r5, 0x3
 e0 9c 01              jmp16	_ZdlPvj

<Second::~Second()>:
 c6 c4 04              ldi16	r6, 0x4c4
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 c5 02 01              ldi16	r5, 0x102
 14                    add	r5, r4
 c0 53                 ldi8	r4, 0x53
 54                    st8	[r5], r4
 ef                    ret
 00                    nop

<Second::~Second()>:
 c6 c4 04              ldi16	r6, 0x4c4
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 f0 55 00 01           ldm16	r5, [0x100]
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 f0 5e 00 01           stm16	[0x100], r6
 c6 02 01              ldi16	r6, 0x102
 19                    add	r6, r5
 c1 53                 ldi8	r5, 0x53
 59                    st8	[r6], r5
 c1 03                 ldi8	r5, 0x3
 e0 60 01              jmp16	_ZdlPvj

<Derived::~Derived()>:
 b1                    push16	r1
 b0                    push16	r0
 c6 02 01              ldi16	r6, 0x102
 f0 55 00 01           ldm16	r5, [0x100]
 19                    add	r6, r5
 c7 44 4d              ldi16	r7, 0x4d44
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 ca 03                 addi.s8	r6, 0x3
 f0 04 c4 04           ldi16	r0, 0x4c4
 f0 01 00              ldi8	r1, 0x0
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c6 04 01              ldi16	r6, 0x104
 19                    add	r6, r5
 c3 53                 ldi8	r7, 0x53
 5b                    st8	[r6], r7
 c6 b8 04              ldi16	r6, 0x4b8
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 5c 00 01           stm16	[0x100], r4
 c4 05 01              ldi16	r4, 0x105
 11                    add	r4, r5
 c1 46                 ldi8	r5, 0x46
 51                    st8	[r4], r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<non-virtual thunk to Derived::~Derived()>:
 b1                    push16	r1
 b0                    push16	r0
 c6 02 01              ldi16	r6, 0x102
 f0 55 00 01           ldm16	r5, [0x100]
 19                    add	r6, r5
 c7 44 4d              ldi16	r7, 0x4d44
 7b                    st16	[r6], r7
 f0 04 c4 04           ldi16	r0, 0x4c4
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c6 04 01              ldi16	r6, 0x104
 19                    add	r6, r5
 c3 53                 ldi8	r7, 0x53
 5b                    st8	[r6], r7
 c8 fd                 addi.s8	r4, -0x3
 c6 b8 04              ldi16	r6, 0x4b8
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 5c 00 01           stm16	[0x100], r4
 c4 05 01              ldi16	r4, 0x105
 11                    add	r4, r5
 c1 46                 ldi8	r5, 0x46
 51                    st8	[r4], r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<Derived::~Derived()>:
 b1                    push16	r1
 b0                    push16	r0
 c6 02 01              ldi16	r6, 0x102
 f0 55 00 01           ldm16	r5, [0x100]
 19                    add	r6, r5
 c7 44 4d              ldi16	r7, 0x4d44
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 ca 03                 addi.s8	r6, 0x3
 f0 04 c4 04           ldi16	r0, 0x4c4
 f0 01 00              ldi8	r1, 0x0
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c6 04 01              ldi16	r6, 0x104
 19                    add	r6, r5
 c3 53                 ldi8	r7, 0x53
 5b                    st8	[r6], r7
 f0 04 b8 04           ldi16	r0, 0x4b8
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 5e 00 01           stm16	[0x100], r6
 c6 05 01              ldi16	r6, 0x105
 19                    add	r6, r5
 c1 46                 ldi8	r5, 0x46
 59                    st8	[r6], r5
 c1 07                 ldi8	r5, 0x7
 e1 a6 00              call16	_ZdlPvj
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 00                    nop

<non-virtual thunk to Derived::~Derived()>:
 b1                    push16	r1
 b0                    push16	r0
 c6 02 01              ldi16	r6, 0x102
 f0 55 00 01           ldm16	r5, [0x100]
 19                    add	r6, r5
 c7 44 4d              ldi16	r7, 0x4d44
 7b                    st16	[r6], r7
 f0 04 c4 04           ldi16	r0, 0x4c4
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c6 04 01              ldi16	r6, 0x104
 19                    add	r6, r5
 c3 53                 ldi8	r7, 0x53
 5b                    st8	[r6], r7
 c8 fd                 addi.s8	r4, -0x3
 f0 04 b8 04           ldi16	r0, 0x4b8
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 5e 00 01           stm16	[0x100], r6
 c6 05 01              ldi16	r6, 0x105
 19                    add	r6, r5
 c1 46                 ldi8	r5, 0x46
 59                    st8	[r6], r5
 c1 07                 ldi8	r5, 0x7
 d5 61                 call8	_ZdlPvj
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_test_main>:
 d6 f9                 adjsp	-0x7
 c4 dc 04              ldi16	r4, 0x4dc
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 c4 d0 04              ldi16	r4, 0x4d0
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 14 03              leasp	r4, 0x3
 d5 3b                 call8	_ZL14destroy_secondP6Second
 f0 54 00 01           ldm16	r4, [0x100]
 cc 04                 cmpi.s8	r4, 0x4
 d1 2e                 brne8	avm_test_main+79
 f0 45 05 01           ldm8u	r5, [0x105]
 f1 75                 zext8	r5
 c0 03                 ldi8	r4, 0x3
 aa                    xor	r6, r6
 cd 46                 cmpi.s8	r5, 0x46
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f0 46 04 01           ldm8u	r6, [0x104]
 f1 76                 zext8	r6
 ce 53                 cmpi.s8	r6, 0x53
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f0 45 03 01           ldm8u	r5, [0x103]
 f1 75                 zext8	r5
 cd 4d                 cmpi.s8	r5, 0x4d
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f0 46 02 01           ldm8u	r6, [0x102]
 ce 44                 cmpi.s8	r6, 0x44
 fb 25                 cmov.eq	r4, r5
 d4 02                 jmp8	avm_test_main+81
 c0 02                 ldi8	r4, 0x2
 d6 07                 adjsp	0x7
 ef                    ret

<destroy_second(Second*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 fc                 call8	avm_halt
