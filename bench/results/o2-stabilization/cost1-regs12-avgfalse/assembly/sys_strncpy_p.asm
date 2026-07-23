
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncpy_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strncpy_p.c
0000029e l     O .rodata	00000021 source32
00000100 l     O .data	00000001 destination0
00000101 l     O .data	00000002 n0
00000103 l     O .data	00000002 destination1
00000105 l     O .data	00000002 n1
000002bf l     O .rodata	00000004 source3
00000107 l     O .data	00000008 destination_pad8
0000010f l     O .data	00000002 n8
000002c3 l     O .rodata	00000009 source8
00000111 l     O .data	00000008 destination_exact8
00000119 l     O .data	00000008 destination_trunc8
00000121 l     O .data	00000020 destination_pad32
00000141 l     O .data	00000002 n32
00000143 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000086 avm_test_main
0000029c g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 86 00              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	_start+18
 d7 01                 sys	debug_break
 c6 9e 02              ldi16	r6, 0x29e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 f0 55 01 01           ldm16	r5, [0x101]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 d7 16                 sys	strncpy_p
 c4 03 01              ldi16	r4, 0x103
 f0 55 05 01           ldm16	r5, [0x105]
 d7 16                 sys	strncpy_p
 f0 04 bf 02           ldi16	r0, 0x2bf
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c4 07 01              ldi16	r4, 0x107
 f0 55 0f 01           ldm16	r5, [0x10f]
 f2 6a                 mov32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d7 16                 sys	strncpy_p
 c6 c3 02              ldi16	r6, 0x2c3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 11 01              ldi16	r4, 0x111
 f0 55 0f 01           ldm16	r5, [0x10f]
 d7 16                 sys	strncpy_p
 c4 19 01              ldi16	r4, 0x119
 f0 55 0f 01           ldm16	r5, [0x10f]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 16                 sys	strncpy_p
 c4 21 01              ldi16	r4, 0x121
 f0 55 41 01           ldm16	r5, [0x141]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 16                 sys	strncpy_p
 f0 44 0e 01           ldm8u	r4, [0x10e]
 f0 45 03 01           ldm8u	r5, [0x103]
 14                    add	r5, r4
 f0 44 20 01           ldm8u	r4, [0x120]
 11                    add	r4, r5
 f0 45 40 01           ldm8u	r5, [0x140]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 43 01           stm16	[0x143], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
