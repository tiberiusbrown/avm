
member_pointers.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 member_pointers.cpp
0000010e l     O .data	00000002 member_pointers_result
00000000 l    df *ABS*	00000000 runtime.c
00000349 l       .init_array	00000000 .hidden __init_array_end
00000349 l       .init_array	00000000 .hidden __init_array_start
00000349 l       .fini_array	00000000 .hidden __fini_array_start
00000349 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000006b avm_test_main
00000347 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000332  w    F .text	00000008 Accumulator::add(unsigned int)
0000033a  w    F .text	0000000d Accumulator::mix(unsigned int)

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
 e1 29 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 49 03              ldi16	r4, 0x349
 c1 00                 ldi8	r5, 0x0
 c6 49 03              ldi16	r6, 0x349
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 49 03           ldi16	r0, 0x349
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 49 03           ldi16	r2, 0x349
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
 c4 49 03              ldi16	r4, 0x349
 c1 00                 ldi8	r5, 0x0
 c6 49 03              ldi16	r6, 0x349
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 49 03           ldi16	r2, 0x349
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 49 03           ldi16	r0, 0x349
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
 d6 f4                 adjsp	-0xc
 c4 34 12              ldi16	r4, 0x1234
 c5 78 56              ldi16	r5, 0x5678
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 c0 05                 ldi8	r4, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 c4 00 01              ldi16	r4, 0x100
 f4 40                 stsp16	[sp+0x0], r4
 f1 13                 mov	r2, r3
 f1 03                 mov	r0, r3
 f1 26                 mov	r5, r2
 f9 a2                 xor	r5, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 84                    and	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 11 08              leasp	r1, 0x8
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
 eb                    callp	q3
 f9 8a                 xor	r4, r2
 f4 1a                 ldsp16	r6, [sp+0x6]
 1a                    add	r6, r6
 c5 0a 01              ldi16	r5, 0x10a
 19                    add	r6, r5
 66                    ld16	r5, [r6]
 f2 25                 add	r5, r1
 f5 46                 ld16	r2, [r5]
 f2 14                 add	r2, r4
 f0 0b 13              addi.s8	r3, 0x13
 f4 a8                 inc16	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 04                 cmp	r0, r4
 d1 c8                 brne8	avm_test_main+37
 f0 5a 0e 01           stm16	[0x10e], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<Accumulator::add(unsigned int)>:
 68                    ld16	r6, [r4]
 19                    add	r6, r5
 72                    st16	[r4], r6
 ed 98 22              ld16	r4, [r4+2]
 a2                    xor	r4, r6
 ef                    ret

<Accumulator::mix(unsigned int)>:
 ed d8 22              ld16	r6, [r4+2]
 a9                    xor	r6, r5
 fa 82                 lsr16i	r5, 0x2
 19                    add	r6, r5
 ee d8 22              st16	[r4+2], r6
 60                    ld16	r4, [r4]
 12                    add	r4, r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
