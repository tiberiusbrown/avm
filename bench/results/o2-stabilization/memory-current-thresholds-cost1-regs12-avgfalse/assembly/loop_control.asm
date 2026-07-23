
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/loop_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 loop_control.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000002 loop_control_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000004d avm_test_main
00000262 g     F .text	00000002 avm_halt

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
 d5 4d                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 01                 ldi8	r4, 0x1
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 f6 0c                 st8	[r5+], r4
 c8 05                 addi.s8	r4, 0x5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+9
 c4 34 12              ldi16	r4, 0x1234
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 c8 18                 addi.s8	r4, 0x18
 f1 2c                 mov	r7, r0
 a3                    xor	r4, r7
 cb 11                 addi.s8	r7, 0x11
 c5 20 02              ldi16	r5, 0x220
 3d                    cmp	r7, r5
 d1 f7                 brne8	avm_test_main+32
 af                    xor	r7, r7
 c1 1f                 ldi8	r5, 0x1f
 87                    and	r5, r7
 c6 00 01              ldi16	r6, 0x100
 19                    add	r6, r5
 46                    ld8u	r5, [r6]
 11                    add	r4, r5
 f4 af                 inc16	r7
 c5 00 01              ldi16	r5, 0x100
 3d                    cmp	r7, r5
 d1 ef                 brne8	avm_test_main+42
 f4 a9                 inc16	r1
 c1 80                 ldi8	r5, 0x80
 f5 0d                 cmp	r1, r5
 d1 d9                 brne8	avm_test_main+28
 f0 5c 20 01           stm16	[0x120], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
