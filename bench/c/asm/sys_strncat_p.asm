
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncat_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strncat_p.c
0000034e l     O .rodata	00000004 source_short
00000100 l     O .data	00000010 destination_n0
00000110 l     O .data	00000002 n0
00000352 l     O .rodata	00000001 source_empty
00000112 l     O .data	00000008 destination_empty_empty
0000011a l     O .data	00000002 n8
0000011c l     O .data	00000010 destination_empty_short
0000012c l     O .data	00000018 destination_short_short
00000353 l     O .rodata	00000021 source_long
00000144 l     O .data	00000018 destination_truncate
0000015c l     O .data	00000002 n4
0000015e l     O .data	00000030 destination_long_scan
0000018e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000374 l       .init_array	00000000 .hidden __init_array_end
00000374 l       .init_array	00000000 .hidden __init_array_start
00000374 l       .fini_array	00000000 .hidden __fini_array_start
00000374 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000075 avm_test_main
0000034c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
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
 e1 2e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 74 03              ldi16	r4, 0x374
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 74 03              ldi16	r6, 0x374
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 74 03           ldi16	r0, 0x374
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 74 03           ldi16	r2, 0x374
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
 c4 74 03              ldi16	r4, 0x374
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 74 03              ldi16	r6, 0x374
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 74 03           ldi16	r2, 0x374
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 74 03           ldi16	r0, 0x374
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

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 4e 03           ldi16	r0, 0x34e
 f0 01 00              ldi8	r1, 0x0
 c4 00 01              ldi16	r4, 0x100
 f0 55 10 01           ldm16	r5, [0x110]
 f2 6a                 mov32	q3, q0
 d7 17                 sys	strncat_p
 c6 52 03              ldi16	r6, 0x352
 c3 00                 ldi8	r7, 0x0
 c4 12 01              ldi16	r4, 0x112
 f0 55 1a 01           ldm16	r5, [0x11a]
 d7 17                 sys	strncat_p
 c4 1c 01              ldi16	r4, 0x11c
 f0 56 1a 01           ldm16	r6, [0x11a]
 f2 6a                 mov32	q3, q0
 d7 17                 sys	strncat_p
 f0 06 2c 01           ldi16	r2, 0x12c
 f0 54 1a 01           ldm16	r4, [0x11a]
 f1 22                 mov	r4, r2
 d7 17                 sys	strncat_p
 c6 53 03              ldi16	r6, 0x353
 c3 00                 ldi8	r7, 0x0
 c4 44 01              ldi16	r4, 0x144
 f0 55 5c 01           ldm16	r5, [0x15c]
 d7 17                 sys	strncat_p
 c4 5e 01              ldi16	r4, 0x15e
 f0 55 1a 01           ldm16	r5, [0x11a]
 f2 6a                 mov32	q3, q0
 d7 17                 sys	strncat_p
 f0 44 36 01           ldm8u	r4, [0x136]
 f0 45 1e 01           ldm8u	r5, [0x11e]
 14                    add	r5, r4
 f0 44 4f 01           ldm8u	r4, [0x14f]
 11                    add	r4, r5
 f0 45 80 01           ldm8u	r5, [0x180]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 8e 01           stm16	[0x18e], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
