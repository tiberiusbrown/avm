
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000007e avm_test_main
00000293 g     F .text	00000002 avm_halt
00000100 g     O .data	00000100 A

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
 d5 7e                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c0 40                 ldi8	r4, 0x40
 c5 00 01              ldi16	r5, 0x100
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+11
 f0 01 40              ldi8	r1, 0x40
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0b                 jmp8	avm_test_main+45
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 cd 02                 cmpi.s8	r5, 0x2
 d2 47                 brult8	avm_test_main+116
 c0 01                 ldi8	r4, 0x1
 f1 71                 zext8	r1
 f4 b1                 dec16	r1
 c5 04 01              ldi16	r5, 0x104
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 4a                 stsp16	[sp+0x2], r6
 d4 0a                 jmp8	avm_test_main+70
 f4 ac                 inc16	r4
 c9 04                 addi.s8	r5, 0x4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 dc                 breq8	avm_test_main+34
 f0 6a ca              ld32	q3, [r5]
 f1 05                 mov	r0, r5
 f0 08 fc              addi.s8	r0, -0x4
 f0 6a 40              ld32	q1, [r0]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 69 c4              cmp32	q3, q1
 d9 e2                 brsge8	avm_test_main+60
 f0 6b 4a              st32	[r5], q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 40              st32	[r0], q1
 f4 48                 stsp16	[sp+0x2], r4
 f4 ac                 inc16	r4
 c9 04                 addi.s8	r5, 0x4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 d4                 brne8	avm_test_main+70
 d4 ae                 jmp8	avm_test_main+34
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
