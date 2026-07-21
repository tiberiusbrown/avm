
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/pointer_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 pointer_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 pointer_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	0000004b avm_test_main
00000360 g     F .text	00000002 avm_halt

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
 d5 4b                 call8	avm_halt

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
 c0 5a                 ldi8	r4, 0x5a
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 09                    mov	r6, r5
 c7 80 01              ldi16	r7, 0x180
 f0 00 80              ldi8	r0, 0x80
 f0 05 00 01           ldi16	r1, 0x100
 f0 6c 43              ld8u	r2, [r1+]
 f2 22                 add	r4, r2
 f9 52                 xor	r2, r4
 f6 1a                 st8	[r7+], r2
 f1 72                 zext8	r2
 f2 2a                 add	r6, r2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 ed                 brne8	avm_test_main+36
 f4 ad                 inc16	r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 cf 10                 cmpi.s8	r7, 0x10
 d1 da                 brne8	avm_test_main+26
 f0 5e 00 02           stm16	[0x200], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
