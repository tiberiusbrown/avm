
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/loop_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 loop_control.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000002 loop_control_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000009c avm_test_main
000002b2 g     F .text	00000002 avm_halt

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
 e1 9c 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 8d 92              ldi16	r4, 0x928d
 c5 97 9c              ldi16	r5, 0x9c97
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 79 7e              ldi16	r4, 0x7e79
 c5 83 88              ldi16	r5, 0x8883
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 65 6a              ldi16	r4, 0x6a65
 c5 6f 74              ldi16	r5, 0x746f
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 51 56              ldi16	r4, 0x5651
 c5 5b 60              ldi16	r5, 0x605b
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 3d 42              ldi16	r4, 0x423d
 c5 47 4c              ldi16	r5, 0x4c47
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 29 2e              ldi16	r4, 0x2e29
 c5 33 38              ldi16	r5, 0x3833
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 15 1a              ldi16	r4, 0x1a15
 c5 1f 24              ldi16	r5, 0x241f
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 01 06              ldi16	r4, 0x601
 c5 0b 10              ldi16	r5, 0x100b
 f0 07 00 01           ldi16	r3, 0x100
 f0 6b 86              st32	[r3], q2
 c5 34 12              ldi16	r5, 0x1234
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 05 00 03           ldi16	r1, 0x300
 c2 1f                 ldi8	r6, 0x1f
 c7 00 01              ldi16	r7, 0x100
 c9 18                 addi.s8	r5, 0x18
 f9 a6                 xor	r5, r1
 f2 30                 sub	r0, r0
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 14                    add	r5, r4
 f4 a8                 inc16	r0
 f5 07                 cmp	r0, r7
 d1 f3                 brne8	avm_test_main+123
 f4 aa                 inc16	r2
 c0 80                 ldi8	r4, 0x80
 f5 14                 cmp	r2, r4
 d1 e5                 brne8	avm_test_main+117
 f0 5d 20 01           stm16	[0x120], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
