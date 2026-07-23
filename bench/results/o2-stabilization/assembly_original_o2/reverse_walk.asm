
C:/tmp/avm-original-o2-root/build/bench/c/reverse_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 reverse_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 reverse_walk_result
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
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 09                 ldi8	r5, 0x9
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 17                 addi.s8	r5, 0x17
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+9
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 c6 80 01              ldi16	r6, 0x180
 c7 00 02              ldi16	r7, 0x200
 f4 b6                 dec16	r6
 f5 38                 ld8u	r0, [r6]
 f1 0d                 mov	r1, r5
 f2 08                 add	r1, r0
 f9 16                 xor	r0, r5
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 f2 25                 add	r5, r1
 f4 b7                 dec16	r7
 f3 0c                 st8	[r7], r0
 f0 04 00 01           ldi16	r0, 0x100
 f5 28                 cmp	r6, r0
 d1 e4                 brne8	avm_test_main+29
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 20                 cmpi.s8	r6, 0x20
 d1 d5                 brne8	avm_test_main+23
 f0 5d 00 02           stm16	[0x200], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
