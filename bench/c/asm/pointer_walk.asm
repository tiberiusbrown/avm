
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/pointer_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 pointer_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 pointer_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	0000004c avm_test_main
00000361 g     F .text	00000002 avm_halt

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
 d5 4c                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 07                 ldi8	r5, 0x7
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+10
 f0 02 5a              ldi8	r2, 0x5a
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 c7 80 01              ldi16	r7, 0x180
 c1 80                 ldi8	r5, 0x80
 c6 00 01              ldi16	r6, 0x100
 f7 14                 ld8u	r4, [r6+]
 f2 14                 add	r2, r4
 f9 8a                 xor	r4, r2
 f6 1c                 st8	[r7+], r4
 f1 74                 zext8	r4
 f2 0c                 add	r1, r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 ee                 brne8	avm_test_main+37
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 dc                 brne8	avm_test_main+29
 f0 59 00 02           stm16	[0x200], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
