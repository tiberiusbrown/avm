
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000076 avm_test_main
0000028b g     F .text	00000002 avm_halt
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
 d5 76                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	avm_test_main
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
 d4 09                 jmp8	avm_test_main+46
 f4 12                 ldsp16	r6, [sp+0x4]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 3e                 brult8	avm_test_main+108
 c5 04 01              ldi16	r5, 0x104
 f1 76                 zext8	r6
 f4 b6                 dec16	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 53                 stsp16	[sp+0x4], r7
 d4 0a                 jmp8	avm_test_main+71
 f4 ac                 inc16	r4
 c9 04                 addi.s8	r5, 0x4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 de                 breq8	avm_test_main+37
 f0 6a 4a              ld32	q1, [r5]
 0d                    mov	r7, r5
 cb fc                 addi.s8	r7, -0x4
 f0 6a 0e              ld32	q0, [r7]
 f0 69 40              cmp32	q1, q0
 d9 e8                 brsge8	avm_test_main+61
 f0 6b 0a              st32	[r5], q0
 0d                    mov	r7, r5
 cb fc                 addi.s8	r7, -0x4
 f0 6b 4e              st32	[r7], q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 ac                 inc16	r4
 c9 04                 addi.s8	r5, 0x4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 dd                 brne8	avm_test_main+71
 d4 b9                 jmp8	avm_test_main+37
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	avm_halt+1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
