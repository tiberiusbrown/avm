
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble2.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000057 avm_test_main
0000026c g     F .text	00000002 avm_halt
00000100 g     O .data	00000080 A

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
 d5 57                 call8	avm_halt

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
 f0 02 40              ldi8	r2, 0x40
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 f0 01 01              ldi8	r1, 0x1
 d4 08                 jmp8	avm_test_main+37
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 2a                 brult8	avm_test_main+79
 c7 02 01              ldi16	r7, 0x102
 f1 72                 zext8	r2
 f4 b2                 dec16	r2
 f1 2a                 mov	r6, r2
 f1 21                 mov	r4, r1
 f1 10                 mov	r2, r0
 d4 0a                 jmp8	avm_test_main+62
 f4 ac                 inc16	r4
 cb 02                 addi.s8	r7, 0x2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 df                 breq8	avm_test_main+29
 f5 4f                 ld16	r3, [r7]
 ed be 1e              ld16	r5, [r7-2]
 f5 1d                 cmp	r3, r5
 d9 ed                 brsge8	avm_test_main+52
 7d                    st16	[r7], r5
 ee 7e 1e              st16	[r7-2], r3
 f1 14                 mov	r2, r4
 d4 e5                 jmp8	avm_test_main+52
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
