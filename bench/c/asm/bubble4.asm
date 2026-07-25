
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000072 avm_test_main
00000287 g     F .text	00000002 avm_halt
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
 d5 72                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
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
 f4 40                 stsp16	[sp+0x0], r4
 d4 09                 jmp8	avm_test_main+42
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 02                 cmpi.s8	r5, 0x2
 d2 3e                 brult8	avm_test_main+104
 c3 01                 ldi8	r7, 0x1
 f1 76                 zext8	r6
 f4 b6                 dec16	r6
 c4 04 01              ldi16	r4, 0x104
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 49                 stsp16	[sp+0x2], r5
 d4 0a                 jmp8	avm_test_main+67
 f4 af                 inc16	r7
 c8 04                 addi.s8	r4, 0x4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 de                 breq8	avm_test_main+33
 f0 6a 48              ld32	q1, [r4]
 04                    mov	r5, r4
 c9 fc                 addi.s8	r5, -0x4
 f0 6a 0a              ld32	q0, [r5]
 f0 69 40              cmp32	q1, q0
 d9 e8                 brsge8	avm_test_main+57
 f0 6b 08              st32	[r4], q0
 04                    mov	r5, r4
 c9 fc                 addi.s8	r5, -0x4
 f0 6b 4a              st32	[r5], q1
 f4 4b                 stsp16	[sp+0x2], r7
 f4 af                 inc16	r7
 c8 04                 addi.s8	r4, 0x4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 dd                 brne8	avm_test_main+67
 d4 b9                 jmp8	avm_test_main+33
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
