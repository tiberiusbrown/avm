
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strlen.elf:	file format elf32-avm

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
00000316 g     F .text	000000a2 avm_test_main
000003b8 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a2 00              call16	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 07 01              ldi16	r6, 0x107
 f0 6b 8c              st32	[r6], q2
 f0 06 03 01           ldi16	r2, 0x103
 f0 6b 84              st32	[r2], q2
 f0 04 64 64           ldi16	r0, 0x6464
 f0 05 64 64           ldi16	r1, 0x6464
 c4 28 01              ldi16	r4, 0x128
 f0 6b 08              st32	[r4], q0
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 c4 20 01              ldi16	r4, 0x120
 f0 6b 08              st32	[r4], q0
 c4 1c 01              ldi16	r4, 0x11c
 f0 6b 08              st32	[r4], q0
 c4 18 01              ldi16	r4, 0x118
 f0 6b 08              st32	[r4], q0
 c4 14 01              ldi16	r4, 0x114
 f0 6b 08              st32	[r4], q0
 c4 10 01              ldi16	r4, 0x110
 f0 6b 08              st32	[r4], q0
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 0c              st32	[r6], q0
 c0 62                 ldi8	r4, 0x62
 f0 5c 01 01           stm16	[0x101], r4
 f2 30                 sub	r0, r0
 f0 48 00 01           stm8	[0x100], r0
 f0 48 0b 01           stm8	[0x10b], r0
 f0 48 2c 01           stm8	[0x12c], r0
 c7 00 01              ldi16	r7, 0x100
 c5 2d 01              ldi16	r5, 0x12d
 c0 65                 ldi8	r4, 0x65
 f6 0c                 st8	[r5+], r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f8                 brne8	avm_test_main+106
 f0 48 2d 02           stm8	[0x22d], r0
 d7 01                 sys	debug_break
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 c4 01 01              ldi16	r4, 0x101
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1d                    add	r7, r5
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 17                    add	r5, r7
 02                    mov	r4, r6
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
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
