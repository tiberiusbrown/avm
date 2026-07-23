
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tail_calls.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tail_calls.c
00000100 l     O .data	00000002 tail_seed
0000023b l     F .text	00000004 tail_direct
0000023f l     F .text	0000000b tail_with_saved
0000024a l     F .text	00000004 tail_indirect
00000102 l     O .data	00000002 tail_calls_result
0000024e l     F .text	00000007 tail_leaf
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000026 avm_test_main
00000255 g     F .text	00000002 avm_halt

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
 d5 40                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 f0 05 00 01           ldi16	r1, 0x100
 d7 01                 sys	debug_break
 f0 54 00 01           ldm16	r4, [0x100]
 d5 18                 call8	tail_direct
 f1 04                 mov	r0, r4
 d5 18                 call8	tail_with_saved
 f9 82                 xor	r4, r0
 d5 1f                 call8	tail_indirect
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f0                 brne8	avm_test_main+12
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<tail_direct>:
 c8 07                 addi.s8	r4, 0x7
 d4 0f                 jmp8	tail_leaf

<tail_with_saved>:
 c5 aa 55              ldi16	r5, 0x55aa
 a4                    xor	r5, r4
 11                    add	r4, r5
 c5 34 12              ldi16	r5, 0x1234
 11                    add	r4, r5
 d4 04                 jmp8	tail_leaf

<tail_indirect>:
 c8 0b                 addi.s8	r4, 0xb
 d4 00                 jmp8	tail_leaf

<tail_leaf>:
 c1 03                 ldi8	r5, 0x3
 fe 25                 mul16	r4, r5
 f4 ac                 inc16	r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
