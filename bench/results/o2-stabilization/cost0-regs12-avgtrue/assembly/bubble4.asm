
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000006e avm_test_main
00000283 g     F .text	00000002 avm_halt
00000100 g     O .data	00000100 A

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
 d5 6e                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 c0 40                 ldi8	r4, 0x40
 c5 00 01              ldi16	r5, 0x100
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+11
 c2 40                 ldi8	r6, 0x40
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 07                 jmp8	avm_test_main+44
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 38                 brult8	avm_test_main+100
 0e                    mov	r7, r6
 f0 04 04 01           ldi16	r0, 0x104
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d4 0f                 jmp8	avm_test_main+71
 f0 08 04              addi.s8	r0, 0x4
 03                    mov	r4, r7
 f1 74                 zext8	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 31                    cmp	r4, r5
 d0 de                 breq8	avm_test_main+37
 f0 6a 40              ld32	q1, [r0]
 f1 20                 mov	r4, r0
 c8 fc                 addi.s8	r4, -0x4
 f0 6a 88              ld32	q2, [r4]
 f0 69 48              cmp32	q1, q2
 d9 e2                 brsge8	avm_test_main+56
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 48              st32	[r4], q1
 f1 29                 mov	r6, r1
 d4 d4                 jmp8	avm_test_main+56
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+109
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
