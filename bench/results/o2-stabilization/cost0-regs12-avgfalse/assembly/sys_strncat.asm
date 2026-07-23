
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncat.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strncat.c
00000110 l     O .data	00000004 source_short
00000100 l     O .data	00000010 destination_n0
00000114 l     O .data	00000002 n0
0000011e l     O .data	00000001 source_empty
00000116 l     O .data	00000008 destination_empty_empty
0000011f l     O .data	00000002 n8
00000121 l     O .data	00000010 destination_empty_short
00000131 l     O .data	00000018 destination_short_short
00000161 l     O .data	00000021 source_long
00000149 l     O .data	00000018 destination_truncate
00000182 l     O .data	00000002 n4
00000184 l     O .data	00000030 destination_long_scan
000001b4 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000072 avm_test_main
00000287 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 72                 call8	avm_halt

<avm_test_main>:
 d6 fc                 adjsp	_start+19
 d7 01                 sys	debug_break
 c5 10 01              ldi16	r5, 0x110
 c4 00 01              ldi16	r4, 0x100
 f0 56 14 01           ldm16	r6, [0x114]
 f4 49                 stsp16	[sp+0x2], r5
 d7 1c                 sys	strncat
 c5 1e 01              ldi16	r5, 0x11e
 c4 16 01              ldi16	r4, 0x116
 f0 57 1f 01           ldm16	r7, [0x11f]
 f4 41                 stsp16	[sp+0x0], r5
 0b                    mov	r6, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1c                 sys	strncat
 c4 21 01              ldi16	r4, 0x121
 f0 56 1f 01           ldm16	r6, [0x11f]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 1c                 sys	strncat
 c4 31 01              ldi16	r4, 0x131
 f0 56 1f 01           ldm16	r6, [0x11f]
 d7 1c                 sys	strncat
 c5 61 01              ldi16	r5, 0x161
 c4 49 01              ldi16	r4, 0x149
 f0 57 82 01           ldm16	r7, [0x182]
 f4 41                 stsp16	[sp+0x0], r5
 0b                    mov	r6, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1c                 sys	strncat
 c4 84 01              ldi16	r4, 0x184
 f0 56 1f 01           ldm16	r6, [0x11f]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 1c                 sys	strncat
 f0 44 3b 01           ldm8u	r4, [0x13b]
 f0 45 23 01           ldm8u	r5, [0x123]
 14                    add	r5, r4
 f0 44 54 01           ldm8u	r4, [0x154]
 11                    add	r4, r5
 f0 45 a6 01           ldm8u	r5, [0x1a6]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d b4 01           stm16	[0x1b4], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_halt+3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
