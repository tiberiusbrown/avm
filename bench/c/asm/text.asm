
text.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000123 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 text.c
00000000 l    df *ABS*	00000000 font_5x7.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000006f3 l       .init_array	00000000 .hidden __init_array_end
000006f3 l       .init_array	00000000 .hidden __init_array_start
000006f3 l       .fini_array	00000000 .hidden __fini_array_start
000006f3 l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	00000023 _start
00000167 g     F .text	00000042 avm_test_main
000001ab g     F .text	00000065 __avm_terminate
000001a9 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
0000027c g     O .rodata	00000477 _avm_font_5x7_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 95 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 86 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f3 06              ldi16	r4, 0x6f3
 c1 00                 ldi8	r5, 0x0
 c6 f3 06              ldi16	r6, 0x6f3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 f3 06           ldi16	r0, 0x6f3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f3 06           ldi16	r2, 0x6f3
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 d7 01                 sys	debug_break
 c4 7c 02              ldi16	r4, 0x27c
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 c5 e8 03              ldi16	r5, 0x3e8
 d7 02                 sys	millis
 ec 25                 udiv16	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 12 00              leasp	r2, 0x0
 c6 10 02              ldi16	r6, 0x210
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 a0                    xor	r4, r4
 c1 08                 ldi8	r5, 0x8
 d7 36                 sys	draw_textfv_p
 c6 24 02              ldi16	r6, 0x224
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
 c6 50 02              ldi16	r6, 0x250
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2c                 ldi8	r5, 0x2c
 d7 34                 sys	draw_text_p
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
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
 d0 03                 breq8	0x3 <L0>
 e1 40 fe              call16	-448 <__avm_run_local_dtors>
<L0>:
 c4 f3 06              ldi16	r4, 0x6f3
 c1 00                 ldi8	r5, 0x0
 c6 f3 06              ldi16	r6, 0x6f3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 f3 06           ldi16	r2, 0x6f3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f3 06           ldi16	r0, 0x6f3
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 f7 fd              call16	-521 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
