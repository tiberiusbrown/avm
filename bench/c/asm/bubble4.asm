
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000065 avm_test_main
0000027a g     F .text	00000002 avm_halt
00000100 g     O .data	00000100 A

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
 d5 65                 call8	avm_halt

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
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 c7 04 01              ldi16	r7, 0x104
 f1 76                 zext8	r6
 f4 b6                 dec16	r6
 f1 06                 mov	r0, r6
 f0 31 00              ldsp16	r1, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f0 6a 4e              ld32	q1, [r7]
 03                    mov	r4, r7
 c8 fc                 addi.s8	r4, -0x4
 f0 6a 88              ld32	q2, [r4]
 f0 69 48              cmp32	q1, q2
 d9 0b                 brsge8	avm_test_main+74
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 48              st32	[r4], q1
 f1 29                 mov	r6, r1
 f4 a9                 inc16	r1
 cb 04                 addi.s8	r7, 0x4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 dd                 brne8	avm_test_main+49
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d8 c8                 bruge8	avm_test_main+35
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+100
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
