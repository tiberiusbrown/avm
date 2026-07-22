
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble1.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble1.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000054 avm_test_main
00000269 g     F .text	00000002 avm_halt
00000100 g     O .data	00000040 A

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
 d5 54                 call8	avm_halt

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
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 c7 01 01              ldi16	r7, 0x101
 f1 76                 zext8	r6
 f4 b6                 dec16	r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 08                    mov	r6, r4
 f5 3e                 ld8u	r2, [r7]
 f6 42                 sext8	r2
 ed 6e 1f              ld8u	r3, [r7-1]
 f6 43                 sext8	r3
 f5 13                 cmp	r2, r3
 d9 07                 brsge8	avm_test_main+59
 f3 0f                 st8	[r7], r3
 ee 4e 1f              st8	[r7-1], r2
 f1 29                 mov	r6, r1
 f4 a9                 inc16	r1
 f4 af                 inc16	r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e2                 brne8	avm_test_main+39
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d8 cf                 bruge8	avm_test_main+27
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
