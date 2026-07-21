
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	00000053 avm_test_main
00000568 g     F .text	00000002 avm_halt
00000100 g     O .data	00000384 A

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 53                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 02                 ldi8	r4, 0x2
 f0 01 05              ldi8	r1, 0x5
 c2 04                 ldi8	r6, 0x4
 c7 04 01              ldi16	r7, 0x104
 d7 01                 sys	debug_break
 f0 04 00 01           ldi16	r0, 0x100
 f2 04                 add	r0, r4
 04                    mov	r5, r4
 f3 15                 mulu8.w	r5, r5
 f0 6c 00              ld8u	r0, [r0]
 f4 a0                 tst8	r0
 d1 20                 brne8	avm_test_main+63
 f0 04 83 03           ldi16	r0, 0x383
 f5 05                 cmp	r0, r5
 d2 18                 brult8	avm_test_main+63
 f0 00 00              ldi8	r0, 0x0
 07                    mov	r5, r7
 f2 24                 add	r5, r0
 f0 02 01              ldi8	r2, 0x1
 f3 06                 st8	[r5], r2
 f2 04                 add	r0, r4
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 f0 06 84 03           ldi16	r2, 0x384
 f5 26                 cmp	r5, r2
 d2 eb                 brult8	avm_test_main+42
 f2 2d                 add	r7, r1
 f2 29                 add	r6, r1
 f0 09 02              addi.s8	r1, 0x2
 f4 ac                 inc16	r4
 cc 1e                 cmpi.s8	r4, 0x1e
 d1 c3                 brne8	avm_test_main+15
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
