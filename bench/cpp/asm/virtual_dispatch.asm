
virtual_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 virtual_dispatch.cpp
00000325 l     F .text	0000000e invoke(Operation const*, unsigned int)
00000100 l     O .data	00000002 virtual_dispatch_result
00000000 l    df *ABS*	00000000 runtime.c
00000356 l       .init_array	00000000 .hidden __init_array_end
00000356 l       .init_array	00000000 .hidden __init_array_start
00000356 l       .fini_array	00000000 .hidden __fini_array_start
00000356 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000005e avm_test_main
00000342 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000344  w    O .rodata	00000009 vtable for Add
0000034d  w    O .rodata	00000009 vtable for Mix
00000334  w    F .text	00000005 Add::apply(unsigned int) const
0000033a  w    F .text	00000008 Mix::apply(unsigned int) const

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
 e1 24 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 56 03              ldi16	r4, 0x356
 c1 00                 ldi8	r5, 0x0
 c6 56 03              ldi16	r6, 0x356
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 56 03           ldi16	r0, 0x356
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 56 03           ldi16	r2, 0x356
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
 c4 56 03              ldi16	r4, 0x356
 c1 00                 ldi8	r5, 0x0
 c6 56 03              ldi16	r6, 0x356
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 56 03           ldi16	r2, 0x356
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 56 03           ldi16	r0, 0x356
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 c0 25                 ldi8	r4, 0x25
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 4a 03              ldi16	r4, 0x34a
 c1 00                 ldi8	r5, 0x0
 f4 74                 stsp16	[sp+0xd], r4
 f1 6d                 stsp8	[sp+0xf], r5
 c4 aa 55              ldi16	r4, 0x55aa
 f4 6c                 stsp16	[sp+0xb], r4
 c4 53 03              ldi16	r4, 0x353
 c1 00                 ldi8	r5, 0x0
 f4 60                 stsp16	[sp+0x8], r4
 f1 59                 stsp8	[sp+0xa], r5
 f0 14 08              leasp	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 0d              leasp	r4, 0xd
 f4 50                 stsp16	[sp+0x4], r4
 f4 40                 stsp16	[sp+0x0], r4
 c5 34 12              ldi16	r5, 0x1234
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 01 03              ldi8	r1, 0x3
 f0 06 00 02           ldi16	r2, 0x200
 f1 20                 mov	r4, r0
 a1                    xor	r4, r5
 f9 84                 and	r4, r1
 10                    add	r4, r4
 f0 16 00              leasp	r6, 0x0
 18                    add	r6, r4
 62                    ld16	r4, [r6]
 d5 14                 call8	_ZL6invokePK9Operationj
 04                    mov	r5, r4
 f4 a8                 inc16	r0
 f5 02                 cmp	r0, r2
 d1 ec                 brne8	avm_test_main+61
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<invoke(Operation const*, unsigned int)>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 f0 63 c0              ldp24	q3, [q0]
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 00                    nop

<Add::apply(unsigned int) const>:
 ed 98 23              ld16	r4, [r4+3]
 11                    add	r4, r5
 ef                    ret
 00                    nop

<Mix::apply(unsigned int) const>:
 ed 98 23              ld16	r4, [r4+3]
 a1                    xor	r4, r5
 fa 83                 lsr16i	r5, 0x3
 11                    add	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
