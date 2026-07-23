
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_memcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_memcmp_p.c
00000100 l     O .data	00000040 lhs
000002a1 l     O .rodata	00000040 equal
00000140 l     O .data	00000002 n0
00000142 l     O .data	00000002 n1
00000144 l     O .data	00000002 n64
000002e1 l     O .rodata	00000040 first_diff
00000321 l     O .rodata	00000040 last_diff
00000146 l     O .data	00000002 n16
00000148 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000089 avm_test_main
0000029f g     F .text	00000002 avm_halt

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
 e1 89 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 c4 00 01              ldi16	r4, 0x100
 c1 07                 ldi8	r5, 0x7
 c2 40                 ldi8	r6, 0x40
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 d7 01                 sys	debug_break
 c6 a1 02              ldi16	r6, 0x2a1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 f0 55 40 01           ldm16	r5, [0x140]
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 f4 40                 stsp16	[sp+0x0], r4
 f0 54 42 01           ldm16	r4, [0x142]
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 f1 1c                 mov	r3, r4
 f0 55 44 01           ldm16	r5, [0x144]
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 f1 14                 mov	r2, r4
 c6 e1 02              ldi16	r6, 0x2e1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 55 44 01           ldm16	r5, [0x144]
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 f1 0c                 mov	r1, r4
 c6 21 03              ldi16	r6, 0x321
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 55 44 01           ldm16	r5, [0x144]
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 f1 04                 mov	r0, r4
 f0 55 46 01           ldm16	r5, [0x146]
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 1c                 add	r3, r4
 f2 1a                 add	r3, r2
 f2 19                 add	r3, r1
 f2 18                 add	r3, r0
 f2 1d                 add	r3, r5
 f0 5b 48 01           stm16	[0x148], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+136
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
