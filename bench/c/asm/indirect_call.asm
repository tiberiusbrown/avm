
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/indirect_call.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 indirect_call.c
0000025c l     F .text	00000002 operation_add
00000100 l     O .data	00000001 operation_selector
00000267 l     F .text	00000002 operation_sub
0000025e l     F .text	00000009 operation_mix
00000101 l     O .data	00000002 indirect_call_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000047 avm_test_main
00000269 g     F .text	00000002 avm_halt

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
 d5 54                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 06 5c 02           ldi16	r2, 0x25c
 f0 03 00              ldi8	r3, 0x0
 d7 01                 sys	debug_break
 f0 44 00 01           ldm8u	r4, [0x100]
 f4 a4                 tst8	r4
 d0 12                 breq8	avm_test_main+39
 f0 06 67 02           ldi16	r2, 0x267
 f0 03 00              ldi8	r3, 0x0
 c6 5e 02              ldi16	r6, 0x25e
 c3 00                 ldi8	r7, 0x0
 cc 01                 cmpi.s8	r4, 0x1
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 c4 34 12              ldi16	r4, 0x1234
 f0 00 03              ldi8	r0, 0x3
 f0 05 83 08           ldi16	r1, 0x883
 f1 24                 mov	r5, r0
 e9                    callp	q1
 f0 08 11              addi.s8	r0, 0x11
 f5 01                 cmp	r0, r1
 d1 f6                 brne8	avm_test_main+49
 f0 5c 01 01           stm16	[0x101], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<operation_add>:
 11                    add	r4, r5
 ef                    ret

<operation_mix>:
 09                    mov	r6, r5
 a8                    xor	r6, r4
 fa 73                 lsr16i	r4, 0x3
 12                    add	r4, r6
 fa 42                 lsl16i	r5, 0x2
 11                    add	r4, r5
 ef                    ret

<operation_sub>:
 21                    sub	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
