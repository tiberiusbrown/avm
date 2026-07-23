
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble1.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble1.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005c avm_test_main
00000271 g     F .text	00000002 avm_halt
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
 d5 5c                 call8	avm_halt

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
 f0 02 40              ldi8	r2, 0x40
 d7 01                 sys	debug_break
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 d4 08                 jmp8	avm_test_main+40
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 2c                 brult8	avm_test_main+84
 f1 1a                 mov	r3, r2
 c4 01 01              ldi16	r4, 0x101
 f1 11                 mov	r2, r1
 f1 28                 mov	r6, r0
 d4 0e                 jmp8	avm_test_main+65
 f4 ac                 inc16	r4
 f1 27                 mov	r5, r3
 f1 75                 zext8	r5
 f4 ae                 inc16	r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 37                    cmp	r5, r7
 d0 df                 breq8	avm_test_main+32
 44                    ld8u	r5, [r4]
 f6 45                 sext8	r5
 ed e8 1f              ld8u	r7, [r4-1]
 f6 47                 sext8	r7
 37                    cmp	r5, r7
 d9 e7                 brsge8	avm_test_main+51
 53                    st8	[r4], r7
 ee a8 1f              st8	[r4-1], r5
 f1 16                 mov	r2, r6
 d4 df                 jmp8	avm_test_main+51
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
