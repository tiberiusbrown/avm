
diamond_inheritance.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 diamond_inheritance.cpp
00000303 l     F .text	00000008 root_value(Root*)
0000030b l     F .text	00000008 right_value(Right*)
00000000 l    df *ABS*	00000000 runtime.c
0000036f l       .init_array	00000000 .hidden __init_array_end
0000036f l       .init_array	00000000 .hidden __init_array_start
0000036f l       .fini_array	00000000 .hidden __fini_array_start
0000036f l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
00000244 g     F .text	000000bf avm_test_main
00000313 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000001d8 g     F .text	00000004 Root::value() const
000001dc g     F .text	00000004 Left::left_value() const
000001e0 g     F .text	00000004 Right::right_value() const
000001e4 g     F .text	00000022 Diamond::value() const
00000206 g     F .text	0000002c virtual thunk to Diamond::value() const
00000232 g     F .text	00000006 Diamond::left_value() const
00000238 g     F .text	00000006 Diamond::right_value() const
0000023e g     F .text	00000006 non-virtual thunk to Diamond::right_value() const
0000033f g     O .rodata	00000018 construction vtable for Left-in-Diamond
00000357 g     O .rodata	00000018 construction vtable for Right-in-Diamond
00000315 g     O .rodata	0000002a vtable for Diamond

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 3e 01              call16	avm_test_main
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
 e1 f5 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6f 03              ldi16	r4, 0x36f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6f 03              ldi16	r6, 0x36f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 6f 03           ldi16	r0, 0x36f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6f 03           ldi16	r2, 0x36f
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
 c4 6f 03              ldi16	r4, 0x36f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6f 03              ldi16	r6, 0x36f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 6f 03           ldi16	r2, 0x36f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6f 03           ldi16	r0, 0x36f
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
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

<Left::left_value() const>:
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

<Right::right_value() const>:
 ed 98 23              ld16	r4, [r4+3]
 ef                    ret

<Diamond::value() const>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 04 f7 ff           ldi16	r0, 0xfff7
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 63                 add32	q0, q3
 f0 62 a0              ldp16	r5, [q0]
 14                    add	r5, r4
 ed ba 23              ld16	r5, [r5+3]
 ed d8 23              ld16	r6, [r4+3]
 19                    add	r6, r5
 ed 98 28              ld16	r4, [r4+8]
 12                    add	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<virtual thunk to Diamond::value() const>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 c6 f7 ff              ldi16	r6, 0xfff7
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 f0 62 a0              ldp16	r5, [q0]
 14                    add	r5, r4
 01                    mov	r4, r5
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f7 63                 add32	q0, q3
 f0 62 80              ldp16	r4, [q0]
 11                    add	r4, r5
 ed 98 23              ld16	r4, [r4+3]
 ed da 23              ld16	r6, [r5+3]
 18                    add	r6, r4
 ed 9a 28              ld16	r4, [r5+8]
 12                    add	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<Diamond::left_value() const>:
 ed 98 23              ld16	r4, [r4+3]
 f4 ac                 inc16	r4
 ef                    ret

<Diamond::right_value() const>:
 ed 98 28              ld16	r4, [r4+8]
 c8 02                 addi.s8	r4, 0x2
 ef                    ret

<non-virtual thunk to Diamond::right_value() const>:
 ed 98 23              ld16	r4, [r4+3]
 c8 02                 addi.s8	r4, 0x2
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f1                 adjsp	-0xf
 c4 3f 03              ldi16	r4, 0x33f
 c1 00                 ldi8	r5, 0x0
 f0 62 88              ldp16	r4, [q2]
 f0 10 00              leasp	r0, 0x0
 f2 20                 add	r4, r0
 c6 54 03              ldi16	r6, 0x354
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c4 57 03              ldi16	r4, 0x357
 c1 00                 ldi8	r5, 0x0
 f0 62 88              ldp16	r4, [q2]
 f0 11 05              leasp	r1, 0x5
 f2 21                 add	r4, r1
 c6 6c 03              ldi16	r6, 0x36c
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c4 3c 03              ldi16	r4, 0x33c
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 1e 03              ldi16	r4, 0x31e
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c4 30 03              ldi16	r4, 0x330
 c1 00                 ldi8	r5, 0x0
 f4 54                 stsp16	[sp+0x5], r4
 f1 4d                 stsp8	[sp+0x7], r5
 c4 15 03              ldi16	r4, 0x315
 c1 00                 ldi8	r5, 0x0
 f0 62 88              ldp16	r4, [q2]
 f2 04                 add	r0, r4
 c1 07                 ldi8	r5, 0x7
 ee b0 23              st16	[r0+3], r5
 c1 0d                 ldi8	r5, 0xd
 f4 61                 stsp16	[sp+0x8], r5
 c1 0b                 ldi8	r5, 0xb
 f4 4d                 stsp16	[sp+0x3], r5
 c6 27 03              ldi16	r6, 0x327
 c3 00                 ldi8	r7, 0x0
 f0 62 4c              ldp16	r2, [q3]
 f1 26                 mov	r5, r2
 c9 05                 addi.s8	r5, 0x5
 31                    cmp	r4, r5
 d1 45                 brne8	avm_test_main+182
 f1 20                 mov	r4, r0
 d5 4a                 call8	_ZL10root_valueP4Root
 04                    mov	r5, r4
 c0 02                 ldi8	r4, 0x2
 cd 1f                 cmpi.s8	r5, 0x1f
 d1 3c                 brne8	avm_test_main+184
 f2 11                 add	r2, r1
 f1 1c                 mov	r3, r4
 f1 22                 mov	r4, r2
 d5 3b                 call8	_ZL10root_valueP4Root
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 cd 1f                 cmpi.s8	r5, 0x1f
 d1 2d                 brne8	avm_test_main+184
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 49                 ldsp8u	r5, [sp+0x2]
 f0 63 c8              ldp24	q3, [q2]
 f0 14 00              leasp	r4, 0x0
 eb                    callp	q3
 04                    mov	r5, r4
 c0 03                 ldi8	r4, 0x3
 cd 0c                 cmpi.s8	r5, 0xc
 d1 1b                 brne8	avm_test_main+184
 f1 14                 mov	r2, r4
 f1 21                 mov	r4, r1
 d5 24                 call8	_ZL11right_valueP5Right
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 cd 0f                 cmpi.s8	r5, 0xf
 d1 0e                 brne8	avm_test_main+184
 ed b0 23              ld16	r5, [r0+3]
 c0 04                 ldi8	r4, 0x4
 aa                    xor	r6, r6
 cd 07                 cmpi.s8	r5, 0x7
 fb 26                 cmov.eq	r4, r6
 d4 02                 jmp8	avm_test_main+184
 c0 01                 ldi8	r4, 0x1
 d6 0f                 adjsp	0xf
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<root_value(Root*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<right_value(Right*)>:
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 e7                    jmpp	q3

<avm_halt>:
 d4 fe                 jmp8	avm_halt
