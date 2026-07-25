
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	0000004f avm_test_main
00000564 g     F .text	00000002 avm_halt
00000100 g     O .data	00000384 A

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
 d5 4f                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c3 02                 ldi8	r7, 0x2
 f0 02 05              ldi8	r2, 0x5
 f0 05 04 01           ldi16	r1, 0x104
 d7 01                 sys	debug_break
 f0 04 00 01           ldi16	r0, 0x100
 d4 0b                 jmp8	avm_test_main+31
 f2 0a                 add	r1, r2
 f0 0a 02              addi.s8	r2, 0x2
 f4 af                 inc16	r7
 cf 1e                 cmpi.s8	r7, 0x1e
 d0 29                 breq8	avm_test_main+72
 03                    mov	r4, r7
 f2 20                 add	r4, r0
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d1 ed                 brne8	avm_test_main+20
 03                    mov	r4, r7
 f3 10                 mulu8.w	r4, r4
 c6 83 03              ldi16	r6, 0x383
 38                    cmp	r6, r4
 d2 e4                 brult8	avm_test_main+20
 f1 29                 mov	r6, r1
 c1 01                 ldi8	r5, 0x1
 59                    st8	[r6], r5
 13                    add	r4, r7
 1b                    add	r6, r7
 c5 84 03              ldi16	r5, 0x384
 31                    cmp	r4, r5
 d2 f5                 brult8	avm_test_main+50
 f2 0a                 add	r1, r2
 f0 0a 02              addi.s8	r2, 0x2
 f4 af                 inc16	r7
 cf 1e                 cmpi.s8	r7, 0x1e
 d1 d7                 brne8	avm_test_main+31
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
