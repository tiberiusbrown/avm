
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	0000004b avm_test_main
00000560 g     F .text	00000002 avm_halt
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
 d5 4b                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 01 05              ldi8	r1, 0x5
 f0 04 04 01           ldi16	r0, 0x104
 c3 02                 ldi8	r7, 0x2
 d7 01                 sys	debug_break
 f1 17                 mov	r2, r7
 d4 11                 jmp8	avm_test_main+35
 f2 01                 add	r0, r1
 f0 09 02              addi.s8	r1, 0x2
 f4 af                 inc16	r7
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 1e                 cmpi.s8	r4, 0x1e
 d0 21                 breq8	avm_test_main+68
 c4 00 01              ldi16	r4, 0x100
 13                    add	r4, r7
 0b                    mov	r6, r7
 f3 1a                 mulu8.w	r6, r6
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d1 e3                 brne8	avm_test_main+18
 c4 83 03              ldi16	r4, 0x383
 32                    cmp	r4, r6
 d2 dd                 brult8	avm_test_main+18
 f1 20                 mov	r4, r0
 c1 01                 ldi8	r5, 0x1
 51                    st8	[r4], r5
 1b                    add	r6, r7
 13                    add	r4, r7
 c5 84 03              ldi16	r5, 0x384
 39                    cmp	r6, r5
 d2 f5                 brult8	avm_test_main+55
 d4 ce                 jmp8	avm_test_main+18
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
