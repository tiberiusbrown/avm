
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/pointer_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 pointer_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 pointer_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	00000050 avm_test_main
00000365 g     F .text	00000002 avm_halt

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
 d5 50                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
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
 d1 f6                 brne8	avm_test_main+11
 c0 5a                 ldi8	r4, 0x5a
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 05 00 01           ldi16	r1, 0x100
 f1 1a                 mov	r3, r2
 c3 80                 ldi8	r7, 0x80
 f1 29                 mov	r6, r1
 c5 80 01              ldi16	r5, 0x180
 f7 10                 ld8u	r0, [r6+]
 f2 20                 add	r4, r0
 f9 12                 xor	r0, r4
 f6 08                 st8	[r5+], r0
 f1 70                 zext8	r0
 f2 18                 add	r3, r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ee                 brne8	avm_test_main+40
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 dd                 brne8	avm_test_main+33
 f0 5b 00 02           stm16	[0x200], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
