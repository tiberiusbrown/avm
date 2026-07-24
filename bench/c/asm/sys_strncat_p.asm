
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncat_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strncat_p.c
00000295 l     O .rodata	00000004 source_short
00000100 l     O .data	00000010 destination_n0
00000110 l     O .data	00000002 n0
00000299 l     O .rodata	00000001 source_empty
00000112 l     O .data	00000008 destination_empty_empty
0000011a l     O .data	00000002 n8
0000011c l     O .data	00000010 destination_empty_short
0000012c l     O .data	00000018 destination_short_short
0000029a l     O .rodata	00000021 source_long
00000144 l     O .data	00000018 destination_truncate
0000015c l     O .data	00000002 n4
0000015e l     O .data	00000030 destination_long_scan
0000018e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000007e avm_test_main
00000293 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7e                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 d7 01                 sys	debug_break
 f0 04 95 02           ldi16	r0, 0x295
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c4 00 01              ldi16	r4, 0x100
 f4 40                 stsp16	[sp+0x0], r4
 f0 55 10 01           ldm16	r5, [0x110]
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 17                 sys	strncat_p
 c6 99 02              ldi16	r6, 0x299
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 12 01              ldi16	r4, 0x112
 f0 55 1a 01           ldm16	r5, [0x11a]
 d7 17                 sys	strncat_p
 c4 1c 01              ldi16	r4, 0x11c
 f0 55 1a 01           ldm16	r5, [0x11a]
 f2 6a                 mov32	q3, q0
 d7 17                 sys	strncat_p
 c4 2c 01              ldi16	r4, 0x12c
 f0 55 1a 01           ldm16	r5, [0x11a]
 d7 17                 sys	strncat_p
 c6 9a 02              ldi16	r6, 0x29a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
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
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
