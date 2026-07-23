
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	00000041 avm_test_main
00000556 g     F .text	00000002 avm_halt
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
 d5 41                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 02                 ldi8	r4, 0x2
 f0 01 05              ldi8	r1, 0x5
 f0 04 04 01           ldi16	r0, 0x104
 d7 01                 sys	debug_break
 d4 0b                 jmp8	avm_test_main+26
 f2 01                 add	r0, r1
 f0 09 02              addi.s8	r1, 0x2
 f4 ac                 inc16	r4
 cc 1e                 cmpi.s8	r4, 0x1e
 d0 21                 breq8	avm_test_main+59
 c6 00 01              ldi16	r6, 0x100
 18                    add	r6, r4
 0c                    mov	r7, r4
 f3 1f                 mulu8.w	r7, r7
 4a                    ld8u	r6, [r6]
 f4 a6                 tst8	r6
 d1 e9                 brne8	avm_test_main+15
 c6 83 03              ldi16	r6, 0x383
 3b                    cmp	r6, r7
 d2 e3                 brult8	avm_test_main+15
 f1 28                 mov	r6, r0
 c1 01                 ldi8	r5, 0x1
 59                    st8	[r6], r5
 1c                    add	r7, r4
 18                    add	r6, r4
 c5 84 03              ldi16	r5, 0x384
 3d                    cmp	r7, r5
 d2 f5                 brult8	avm_test_main+46
 d4 d4                 jmp8	avm_test_main+15
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
