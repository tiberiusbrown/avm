
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strlen_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strlen_p.c
00000253 l     O .rodata	00000001 length0
00000254 l     O .rodata	00000002 length1
00000256 l     O .rodata	00000009 length8
0000025f l     O .rodata	00000021 length32
00000280 l     O .rodata	00000101 length256
00000100 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000003c avm_test_main
00000251 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 3c                 call8	avm_halt

<avm_test_main>:
 b0                    push16	r0
 d7 01                 sys	debug_break
 c6 53 02              ldi16	r6, 0x253
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 f1 04                 mov	r0, r4
 c6 54 02              ldi16	r6, 0x254
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 f2 24                 add	r5, r0
 c6 56 02              ldi16	r6, 0x256
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 f1 04                 mov	r0, r4
 f2 05                 add	r0, r5
 c6 5f 02              ldi16	r6, 0x25f
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 f2 24                 add	r5, r0
 c6 80 02              ldi16	r6, 0x280
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
