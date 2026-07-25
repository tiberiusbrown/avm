
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/reverse_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 reverse_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 reverse_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	0000004e avm_test_main
00000363 g     F .text	00000002 avm_halt

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
 d5 4e                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 09                 ldi8	r5, 0x9
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 17                 addi.s8	r5, 0x17
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+10
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 04 80 01           ldi16	r0, 0x180
 f1 29                 mov	r6, r1
 f0 06 00 02           ldi16	r2, 0x200
 f1 24                 mov	r5, r0
 f4 b5                 dec16	r5
 41                    ld8u	r4, [r5]
 0e                    mov	r7, r6
 1c                    add	r7, r4
 a2                    xor	r4, r6
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 f4 b2                 dec16	r2
 ee 84 20              st8	[r2+0], r4
 c4 00 01              ldi16	r4, 0x100
 34                    cmp	r5, r4
 d1 eb                 brne8	avm_test_main+36
 f4 a9                 inc16	r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 db                 brne8	avm_test_main+30
 f0 5e 00 02           stm16	[0x200], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
