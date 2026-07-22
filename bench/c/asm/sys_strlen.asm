
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strlen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strlen.c
00000101 l     O .data	00000002 length1
00000100 l     O .data	00000001 length0
00000103 l     O .data	00000009 length8
0000010c l     O .data	00000021 length32
0000012d l     O .data	00000101 length256
0000022e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	00000074 avm_test_main
00000389 g     F .text	00000002 avm_halt

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
 d5 74                 call8	avm_halt

<avm_test_main>:
 b0                    push16	r0
 c0 62                 ldi8	r4, 0x62
 f0 5c 01 01           stm16	[0x101], r4
 f2 30                 sub	r0, r0
 f0 48 00 01           stm8	[0x100], r0
 c1 08                 ldi8	r5, 0x8
 c6 03 01              ldi16	r6, 0x103
 c3 63                 ldi8	r7, 0x63
 f6 17                 st8	[r6+], r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+20
 f0 48 0b 01           stm8	[0x10b], r0
 c1 20                 ldi8	r5, 0x20
 c6 0c 01              ldi16	r6, 0x10c
 c3 64                 ldi8	r7, 0x64
 f6 17                 st8	[r6+], r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+39
 f0 48 2c 01           stm8	[0x12c], r0
 c5 00 01              ldi16	r5, 0x100
 c6 2d 01              ldi16	r6, 0x12d
 c3 65                 ldi8	r7, 0x65
 f6 17                 st8	[r6+], r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+59
 f0 48 2d 02           stm8	[0x22d], r0
 d7 01                 sys	debug_break
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 c4 01 01              ldi16	r4, 0x101
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 19                    add	r6, r5
 c4 03 01              ldi16	r4, 0x103
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 16                    add	r5, r6
 c4 0c 01              ldi16	r4, 0x10c
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 19                    add	r6, r5
 c4 2d 01              ldi16	r4, 0x12d
 d7 1a                 sys	strlen
 12                    add	r4, r6
 f0 5c 2e 02           stm16	[0x22e], r4
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
