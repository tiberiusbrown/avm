
C:/tmp/avm-original-o2-root/build/bench/c/crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000190 l     O .data	00000200 .L.crctable
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
00000400 g     F .text	00000015 _start
00000415 g     F .text	00000053 avm_test_main
00000468 g     F .text	00000002 avm_halt

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
 d5 53                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 11                 ldi8	r5, 0x11
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 1d                 addi.s8	r5, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+9
 c5 ff ff              ldi16	r5, 0xffff
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f1 29                 mov	r6, r1
 f1 2d                 mov	r7, r1
 f0 04 00 01           ldi16	r0, 0x100
 f2 07                 add	r0, r7
 ed 00 20              ld8u	r0, [r0+0]
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 82                 xor	r4, r0
 10                    add	r4, r4
 f0 04 90 01           ldi16	r0, 0x190
 f2 04                 add	r0, r4
 ed 90 20              ld16	r4, [r0+0]
 fa 48                 lsl16i	r5, 0x8
 a4                    xor	r5, r4
 f4 af                 inc16	r7
 c0 80                 ldi8	r4, 0x80
 3c                    cmp	r7, r4
 d1 de                 brne8	avm_test_main+30
 f4 ae                 inc16	r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 cf 08                 cmpi.s8	r7, 0x8
 d1 d3                 brne8	avm_test_main+28
 f0 5d 80 01           stm16	[0x180], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
