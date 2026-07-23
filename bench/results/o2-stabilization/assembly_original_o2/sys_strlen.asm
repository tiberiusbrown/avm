
C:/tmp/avm-original-o2-root/build/bench/c/sys_strlen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strlen.c
00000103 l     O .data	00000009 length8
0000010c l     O .data	00000021 length32
00000101 l     O .data	00000002 length1
00000100 l     O .data	00000001 length0
0000012d l     O .data	00000101 length256
0000022e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	0000009a avm_test_main
000003b0 g     F .text	00000002 avm_halt

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
 e1 9a 00              call16	avm_halt

<avm_test_main>:
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 07 01              ldi16	r6, 0x107
 f0 6b 8c              st32	[r6], q2
 c6 03 01              ldi16	r6, 0x103
 f0 6b 8c              st32	[r6], q2
 c4 64 64              ldi16	r4, 0x6464
 c5 64 64              ldi16	r5, 0x6464
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c0 62                 ldi8	r4, 0x62
 f0 5c 01 01           stm16	[0x101], r4
 af                    xor	r7, r7
 f0 4f 00 01           stm8	[0x100], r7
 f0 4f 0b 01           stm8	[0x10b], r7
 f0 4f 2c 01           stm8	[0x12c], r7
 c5 00 01              ldi16	r5, 0x100
 c6 2d 01              ldi16	r6, 0x12d
 c0 65                 ldi8	r4, 0x65
 f6 14                 st8	[r6+], r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+99
 f0 4f 2d 02           stm8	[0x22d], r7
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
 03                    mov	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
