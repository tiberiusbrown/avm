
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble2.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000061 avm_test_main
00000276 g     F .text	00000002 avm_halt
00000100 g     O .data	00000080 A

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
 d5 61                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 40                 ldi8	r4, 0x40
 c5 00 01              ldi16	r5, 0x100
 f7 4c                 st16	[r5+], r4
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+9
 f0 03 40              ldi8	r3, 0x40
 d7 01                 sys	debug_break
 f2 39                 sub	r1, r1
 f0 02 01              ldi8	r2, 0x1
 d4 08                 jmp8	avm_test_main+37
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 34                 brult8	avm_test_main+89
 f1 73                 zext8	r3
 f4 b3                 dec16	r3
 f1 2f                 mov	r7, r3
 f1 22                 mov	r4, r2
 c6 02 01              ldi16	r6, 0x102
 f1 19                 mov	r3, r1
 d4 0a                 jmp8	avm_test_main+62
 f4 ac                 inc16	r4
 ca 02                 addi.s8	r6, 0x2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 df                 breq8	avm_test_main+29
 66                    ld16	r5, [r6]
 ed 1c 1e              ld16	r0, [r6-2]
 f5 24                 cmp	r5, r0
 d9 ee                 brsge8	avm_test_main+52
 f5 58                 st16	[r6], r0
 ee bc 1e              st16	[r6-2], r5
 f1 1c                 mov	r3, r4
 f4 ac                 inc16	r4
 ca 02                 addi.s8	r6, 0x2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e7                 brne8	avm_test_main+62
 d4 c4                 jmp8	avm_test_main+29
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
