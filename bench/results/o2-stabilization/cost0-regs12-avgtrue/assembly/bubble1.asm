
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble1.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble1.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005e avm_test_main
00000273 g     F .text	00000002 avm_halt
00000100 g     O .data	00000040 A

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
 d5 5e                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 00 01              ldi16	r4, 0x100
 c1 40                 ldi8	r5, 0x40
 09                    mov	r6, r5
 f6 06                 st8	[r4+], r6
 f4 b6                 dec16	r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	avm_test_main+10
 c2 40                 ldi8	r6, 0x40
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 d4 07                 jmp8	avm_test_main+36
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d2 32                 brult8	avm_test_main+86
 0e                    mov	r7, r6
 f0 04 01 01           ldi16	r0, 0x101
 09                    mov	r6, r5
 f1 0c                 mov	r1, r4
 d4 10                 jmp8	avm_test_main+62
 f4 a8                 inc16	r0
 f1 17                 mov	r2, r7
 f1 72                 zext8	r2
 f4 a9                 inc16	r1
 f1 19                 mov	r3, r1
 f1 73                 zext8	r3
 f5 13                 cmp	r2, r3
 d0 df                 breq8	avm_test_main+29
 ed 40 20              ld8u	r2, [r0+0]
 f6 42                 sext8	r2
 ed 60 1f              ld8u	r3, [r0-1]
 f6 43                 sext8	r3
 f5 13                 cmp	r2, r3
 d9 e2                 brsge8	avm_test_main+46
 ee 60 20              st8	[r0+0], r3
 ee 40 1f              st8	[r0-1], r2
 f1 29                 mov	r6, r1
 d4 d8                 jmp8	avm_test_main+46
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
