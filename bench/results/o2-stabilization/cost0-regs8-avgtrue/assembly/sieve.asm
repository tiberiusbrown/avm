
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
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 53                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 05                 ldi8	r4, 0x5
 c5 04 01              ldi16	r5, 0x104
 c3 02                 ldi8	r7, 0x2
 d7 01                 sys	debug_break
 f1 07                 mov	r0, r7
 d4 0f                 jmp8	avm_test_main+31
 14                    add	r5, r4
 c8 02                 addi.s8	r4, 0x2
 f4 af                 inc16	r7
 f4 a8                 inc16	r0
 f1 28                 mov	r6, r0
 f1 76                 zext8	r6
 ce 1e                 cmpi.s8	r6, 0x1e
 d0 2d                 breq8	avm_test_main+76
 f0 05 00 01           ldi16	r1, 0x100
 f2 0f                 add	r1, r7
 0b                    mov	r6, r7
 f3 1a                 mulu8.w	r6, r6
 ed 22 20              ld8u	r1, [r1+0]
 f4 a1                 tst8	r1
 d1 e1                 brne8	avm_test_main+16
 f0 05 83 03           ldi16	r1, 0x383
 f5 0e                 cmp	r1, r6
 d2 d9                 brult8	avm_test_main+16
 f1 0d                 mov	r1, r5
 f0 02 01              ldi8	r2, 0x1
 ee 42 20              st8	[r1+0], r2
 1b                    add	r6, r7
 f2 0f                 add	r1, r7
 f0 06 84 03           ldi16	r2, 0x384
 f5 2a                 cmp	r6, r2
 d2 ef                 brult8	avm_test_main+57
 d4 c4                 jmp8	avm_test_main+16
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
