
dynamic_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 dynamic_stack.c
00000100 l     O .data	00000001 requested_length
000002ff l     F .text	0000003f local_buffer
00000101 l     O .data	00000002 result
00000000 l    df *ABS*	00000000 runtime.c
00000340 l       .init_array	00000000 .hidden __init_array_end
00000340 l       .init_array	00000000 .hidden __init_array_start
00000340 l       .fini_array	00000000 .hidden __fini_array_start
00000340 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000038 avm_test_main
0000033e g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 20 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 40 03              ldi16	r4, 0x340
 c1 00                 ldi8	r5, 0x0
 c6 40 03              ldi16	r6, 0x340
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 40 03           ldi16	r0, 0x340
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 40 03           ldi16	r2, 0x340
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
 c4 40 03              ldi16	r4, 0x340
 c1 00                 ldi8	r5, 0x0
 c6 40 03              ldi16	r6, 0x340
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 40 03           ldi16	r2, 0x340
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 40 03           ldi16	r0, 0x340
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
 f0 04 34 12           ldi16	r0, 0x1234
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 42 00 01           ldm8u	r2, [0x100]
 f0 03 07              ldi8	r3, 0x7
 f1 25                 mov	r5, r1
 f9 ac                 and	r5, r3
 f1 22                 mov	r4, r2
 21                    sub	r4, r5
 f1 74                 zext8	r4
 f1 24                 mov	r5, r0
 d5 18                 call8	local_buffer
 f9 12                 xor	r0, r4
 f4 a9                 inc16	r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 30                 cmpi.s8	r4, 0x30
 d1 e7                 brne8	avm_test_main+19
 f0 58 01 01           stm16	[0x101], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<local_buffer>:
 b3                    push16	r3
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 83                 getsp	r3
 f1 0d                 mov	r1, r5
 f1 80                 getsp	r0
 f2 34                 sub	r0, r4
 f1 88                 setsp	r0
 f4 a4                 tst8	r4
 d0 22                 breq8	local_buffer+53
 0c                    mov	r7, r4
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 f6 15                 st8	[r6+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f6                 brne8	local_buffer+24
 0c                    mov	r7, r4
 f1 24                 mov	r5, r0
 14                    add	r5, r4
 ed aa 1f              ld8u	r5, [r5-1]
 f4 81                 lsl16.1	r1
 f9 36                 xor	r1, r5
 f4 b4                 dec16	r4
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 d1 ee                 brne8	local_buffer+35
 f1 21                 mov	r4, r1
 f1 8b                 setsp	r3
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
