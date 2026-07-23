
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
 d6 f8                 adjsp	_start+19
 c0 40                 ldi8	r4, 0x40
 c5 00 01              ldi16	r5, 0x100
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+11
 c1 40                 ldi8	r5, 0x40
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 09                 jmp8	avm_test_main+46
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 36                 brult8	avm_test_main+100
 f4 59                 stsp16	[sp+0x6], r5
 c5 04 01              ldi16	r5, 0x104
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 d4 0e                 jmp8	avm_test_main+73
 c9 04                 addi.s8	r5, 0x4
 f4 18                 ldsp16	r4, [sp+0x6]
 f1 74                 zext8	r4
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 32                    cmp	r4, r6
 d0 dc                 breq8	avm_test_main+37
 f0 6a 4a              ld32	q1, [r5]
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6a 08              ld32	q0, [r4]
 f0 69 40              cmp32	q1, q0
 d9 e4                 brsge8	avm_test_main+59
 f0 6b 0a              st32	[r5], q0
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 48              st32	[r4], q1
 f4 53                 stsp16	[sp+0x4], r7
 d4 d7                 jmp8	avm_test_main+59
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
