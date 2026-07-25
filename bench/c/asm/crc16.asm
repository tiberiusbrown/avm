
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000190 l     O .data	00000200 .L.crctable
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
00000400 g     F .text	00000015 _start
00000415 g     F .text	00000054 avm_test_main
00000469 g     F .text	00000002 avm_halt

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
 d5 54                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 11                 ldi8	r5, 0x11
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 1d                 addi.s8	r5, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+11
 c7 ff ff              ldi16	r7, 0xffff
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 00 01           ldi16	r2, 0x100
 f0 07 90 01           ldi16	r3, 0x190
 f1 08                 mov	r1, r0
 f1 28                 mov	r6, r0
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 45                    ld8u	r5, [r5]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 a1                    xor	r4, r5
 10                    add	r4, r4
 f2 23                 add	r4, r3
 60                    ld16	r4, [r4]
 fa 68                 lsl16i	r7, 0x8
 ac                    xor	r7, r4
 f4 ae                 inc16	r6
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d1 ea                 brne8	avm_test_main+40
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 de                 brne8	avm_test_main+38
 f0 5f 80 01           stm16	[0x180], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
