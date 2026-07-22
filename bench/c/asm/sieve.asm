
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	00000045 avm_test_main
0000055a g     F .text	00000002 avm_halt
00000100 g     O .data	00000384 A

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
 d5 45                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 02                 ldi8	r4, 0x2
 c1 05                 ldi8	r5, 0x5
 c6 04 01              ldi16	r6, 0x104
 d7 01                 sys	debug_break
 f0 04 00 01           ldi16	r0, 0x100
 f2 04                 add	r0, r4
 0c                    mov	r7, r4
 f3 1f                 mulu8.w	r7, r7
 ed 00 20              ld8u	r0, [r0+0]
 f4 a0                 tst8	r0
 d1 1b                 brne8	avm_test_main+54
 f0 04 83 03           ldi16	r0, 0x383
 f5 07                 cmp	r0, r7
 d2 13                 brult8	avm_test_main+54
 f1 06                 mov	r0, r6
 f0 01 01              ldi8	r1, 0x1
 ee 20 20              st8	[r0+0], r1
 1c                    add	r7, r4
 f2 04                 add	r0, r4
 f0 05 84 03           ldi16	r1, 0x384
 f5 2d                 cmp	r7, r1
 d2 ef                 brult8	avm_test_main+37
 19                    add	r6, r5
 c9 02                 addi.s8	r5, 0x2
 f4 ac                 inc16	r4
 cc 1e                 cmpi.s8	r4, 0x1e
 d1 cc                 brne8	avm_test_main+11
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
