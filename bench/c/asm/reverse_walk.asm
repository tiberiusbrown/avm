
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/reverse_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 reverse_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 reverse_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	00000051 avm_test_main
00000366 g     F .text	00000002 avm_halt

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
 d5 51                 call8	avm_halt

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
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 7f                 ldi8	r5, 0x7f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 80 01           ldi16	r0, 0x180
 f2 07                 add	r0, r7
 f0 05 00 01           ldi16	r1, 0x100
 f2 0f                 add	r1, r7
 f0 6c 22              ld8u	r1, [r1]
 f1 11                 mov	r2, r1
 f9 5a                 xor	r2, r6
 f0 6d 40              st8	[r0], r2
 f2 29                 add	r6, r1
 f1 72                 zext8	r2
 f2 2a                 add	r6, r2
 f4 b7                 dec16	r7
 cf ff                 cmpi.s8	r7, -0x1
 d1 de                 brne8	avm_test_main+27
 f4 ac                 inc16	r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 cf 20                 cmpi.s8	r7, 0x20
 d1 d4                 brne8	avm_test_main+26
 f0 5e 00 02           stm16	[0x200], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
