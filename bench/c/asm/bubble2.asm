
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble2.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000054 avm_test_main
00000269 g     F .text	00000002 avm_halt
00000100 g     O .data	00000080 A

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
 d5 54                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 40                 ldi8	r4, 0x40
 c5 00 01              ldi16	r5, 0x100
 f7 4c                 st16	[r7+], r4
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+9
 c2 40                 ldi8	r6, 0x40
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 c7 02 01              ldi16	r7, 0x102
 f1 76                 zext8	r6
 f4 b6                 dec16	r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 08                    mov	r6, r4
 f5 4e                 ld16	r2, [r7]
 f1 1f                 mov	r3, r7
 f0 0b fe              addi.s8	r3, -0x2
 f0 6c 76              ld16	r3, [r3]
 f5 13                 cmp	r2, r3
 d9 09                 brsge8	avm_test_main+59
 f5 5f                 st16	[r7], r3
 0b                    mov	r6, r7
 ca fe                 addi.s8	r6, -0x2
 f5 5a                 st16	[r6], r2
 f1 29                 mov	r6, r1
 f4 a9                 inc16	r1
 cb 02                 addi.s8	r7, 0x2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 df                 brne8	avm_test_main+36
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d8 cc                 bruge8	avm_test_main+24
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
