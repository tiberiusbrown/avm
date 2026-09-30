
scoped_lifetime.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 scoped_lifetime.cpp
00000100 l     O .data	00000002 lifetime_result
00000000 l    df *ABS*	00000000 runtime.c
0000032f l       .init_array	00000000 .hidden __init_array_end
0000032f l       .init_array	00000000 .hidden __init_array_start
0000032f l       .fini_array	00000000 .hidden __fini_array_start
0000032f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000005c avm_test_main
0000032d g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000324  w    F .text	00000009 Scope::update(unsigned int)

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 0f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2f 03              ldi16	r4, 0x32f
 c1 00                 ldi8	r5, 0x0
 c6 2f 03              ldi16	r6, 0x32f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 2f 03           ldi16	r0, 0x32f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2f 03           ldi16	r2, 0x32f
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 2f 03              ldi16	r4, 0x32f
 c1 00                 ldi8	r5, 0x0
 c6 2f 03              ldi16	r6, 0x32f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 2f 03           ldi16	r2, 0x32f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2f 03           ldi16	r0, 0x32f
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f2 39                 sub	r1, r1
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 f0 02 03              ldi8	r2, 0x3
 f0 07 80 01           ldi16	r3, 0x180
 c4 aa 55              ldi16	r4, 0x55aa
 f4 40                 stsp16	[sp+0x0], r4
 f1 01                 mov	r0, r1
 d4 00                 jmp8	avm_test_main+30
 c4 00 01              ldi16	r4, 0x100
 f4 48                 stsp16	[sp+0x2], r4
 f1 20                 mov	r4, r0
 c8 07                 addi.s8	r4, 0x7
 f4 50                 stsp16	[sp+0x4], r4
 f0 14 02              leasp	r4, 0x2
 f1 25                 mov	r5, r1
 d5 2d                 call8	_ZN5Scope6updateEj
 f1 20                 mov	r4, r0
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d0 0a                 breq8	avm_test_main+66
 f1 24                 mov	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 a4                    xor	r5, r4
 f0 14 02              leasp	r4, 0x2
 d5 1b                 call8	_ZN5Scope6updateEj
 f4 08                 ldsp16	r4, [sp+0x2]
 64                    ld16	r5, [r4]
 f4 12                 ldsp16	r6, [sp+0x4]
 19                    add	r6, r5
 72                    st16	[r4], r6
 f0 09 0d              addi.s8	r1, 0xd
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 cc                 brne8	avm_test_main+30
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 00                    nop

<Scope::update(unsigned int)>:
 ed d8 22              ld16	r6, [r4+2]
 1a                    add	r6, r6
 a9                    xor	r6, r5
 ee d8 22              st16	[r4+2], r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
