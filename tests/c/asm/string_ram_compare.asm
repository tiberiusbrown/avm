
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_ram_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_ram_compare.c
00000144 l     O .data	00000105 avm_test_main.long_text
00000100 l     O .data	00000005 avm_test_main.eq_a
00000105 l     O .data	00000005 avm_test_main.eq_b
0000010a l     O .data	00000005 avm_test_main.low
0000010f l     O .data	00000005 avm_test_main.high
00000114 l     O .data	00000005 avm_test_main.high2
00000119 l     O .data	00000005 avm_test_main.low2
0000011e l     O .data	00000005 avm_test_main.late_a
00000123 l     O .data	00000005 avm_test_main.late_b
00000128 l     O .data	00000006 avm_test_main.alpha
0000012e l     O .data	00000006 avm_test_main.alphz
00000134 l     O .data	00000004 avm_test_main.cat
00000138 l     O .data	00000008 avm_test_main.catalog
00000140 l     O .data	00000002 avm_test_main.unsigned_hi
00000142 l     O .data	00000002 avm_test_main.unsigned_lo
00000249 l     O .data	00000001 .L.str
0000024a l     O .data	00000005 .L.str.1
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
0000031f g     F .text	0000077f avm_test_main
00000a9e g     F .text	00000002 avm_halt
00000316 g     F .text	00000003 test_call_memcmp
00000319 g     F .text	00000003 test_call_strcmp
0000031c g     F .text	00000003 test_call_strlen

Disassembly of section .text:

<_start>:
 d5 1d                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 88 07              call16	avm_halt

<test_call_memcmp>:
 d7 18                 sys	memcmp
 ef                    ret

<test_call_strcmp>:
 d7 19                 sys	strcmp
 ef                    ret

<test_call_strlen>:
 d7 1a                 sys	strlen
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 ea                 adjsp	-0x16
 c4 04 01              ldi16	r4, 0x104
 c5 44 01              ldi16	r5, 0x144
 c2 78                 ldi8	r6, 0x78
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+16
 a0                    xor	r4, r4
 f0 4c 48 02           stm8	[0x248], r4
 c4 00 01              ldi16	r4, 0x100
 c5 05 01              ldi16	r5, 0x105
 f0 01 05              ldi8	r1, 0x5
 f1 29                 mov	r6, r1
 d5 cd                 call8	test_call_memcmp
 f0 3c 90              stsp16	[sp+0x90], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 f0 02 30              ldi8	r2, 0x30
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 72              stsp16	[sp+0x72], r6
 f0 04 0a 01           ldi16	r0, 0x10a
 c5 0f 01              ldi16	r5, 0x10f
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 d5 a5                 call8	test_call_memcmp
 f0 3c 8e              stsp16	[sp+0x8e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 76              stsp16	[sp+0x76], r6
 c4 14 01              ldi16	r4, 0x114
 c5 19 01              ldi16	r5, 0x119
 f1 29                 mov	r6, r1
 d5 86                 call8	test_call_memcmp
 f0 3c 80              stsp16	[sp+0x80], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 74              stsp16	[sp+0x74], r6
 c4 1e 01              ldi16	r4, 0x11e
 c5 23 01              ldi16	r5, 0x123
 f1 29                 mov	r6, r1
 e1 66 ff              call16	test_call_memcmp
 f0 3c 7c              stsp16	[sp+0x7c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 70              stsp16	[sp+0x70], r5
 f1 20                 mov	r4, r0
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 e1 49 ff              call16	test_call_memcmp
 f0 3c 7e              stsp16	[sp+0x7e], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 f0 04 28 01           ldi16	r0, 0x128
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 e1 2d ff              call16	test_call_strcmp
 f0 3c 94              stsp16	[sp+0x94], r4
 f0 05 2e 01           ldi16	r1, 0x12e
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 1f ff              call16	test_call_strcmp
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 35 94              ldsp16	r5, [sp+0x94]
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 66              stsp16	[sp+0x66], r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 f1 fe              call16	test_call_strcmp
 f0 3c 86              stsp16	[sp+0x86], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6a              stsp16	[sp+0x6a], r5
 f0 04 34 01           ldi16	r0, 0x134
 f0 05 38 01           ldi16	r1, 0x138
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 ce fe              call16	test_call_strcmp
 f0 3c 88              stsp16	[sp+0x88], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 68              stsp16	[sp+0x68], r5
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 b3 fe              call16	test_call_strcmp
 f0 3c 8a              stsp16	[sp+0x8a], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 04 40 01           ldi16	r0, 0x140
 f0 05 42 01           ldi16	r1, 0x142
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 90 fe              call16	test_call_strcmp
 f0 3c 8c              stsp16	[sp+0x8c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 62              stsp16	[sp+0x62], r5
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 75 fe              call16	test_call_strcmp
 f0 3c 92              stsp16	[sp+0x92], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 60              stsp16	[sp+0x60], r5
 c4 49 02              ldi16	r4, 0x249
 e1 5e fe              call16	test_call_strlen
 f0 3c 7a              stsp16	[sp+0x7a], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 c4 4a 02              ldi16	r4, 0x24a
 e1 44 fe              call16	test_call_strlen
 f0 3c 78              stsp16	[sp+0x78], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 c4 44 01              ldi16	r4, 0x144
 e1 2a fe              call16	test_call_strlen
 f0 3c 82              stsp16	[sp+0x82], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 c0 0f                 ldi8	r4, 0xf
 f0 36 90              ldsp16	r6, [sp+0x90]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 56              stsp16	[sp+0x56], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 46              stsp16	[sp+0x46], r7
 f0 36 8e              ldsp16	r6, [sp+0x8e]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 58              stsp16	[sp+0x58], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4e              stsp16	[sp+0x4e], r7
 f0 36 80              ldsp16	r6, [sp+0x80]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 54              stsp16	[sp+0x54], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4a              stsp16	[sp+0x4a], r7
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 52              stsp16	[sp+0x52], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 44              stsp16	[sp+0x44], r7
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 50              stsp16	[sp+0x50], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3e              stsp16	[sp+0x3e], r7
 f0 36 94              ldsp16	r6, [sp+0x94]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4c              stsp16	[sp+0x4c], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f0 36 84              ldsp16	r6, [sp+0x84]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 48              stsp16	[sp+0x48], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 34              stsp16	[sp+0x34], r7
 f0 36 86              ldsp16	r6, [sp+0x86]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 42              stsp16	[sp+0x42], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 30              stsp16	[sp+0x30], r7
 f0 36 88              ldsp16	r6, [sp+0x88]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3c              stsp16	[sp+0x3c], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 36 8a              ldsp16	r6, [sp+0x8a]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 38              stsp16	[sp+0x38], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 8c              ldsp16	r6, [sp+0x8c]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 32              stsp16	[sp+0x32], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 40              stsp16	[sp+0x40], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 36 92              ldsp16	r6, [sp+0x92]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 24              stsp16	[sp+0x24], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 37 82              ldsp16	r7, [sp+0x82]
 0b                    mov	r6, r7
 88                    and	r6, r4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 36              stsp16	[sp+0x36], r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 88                    and	r6, r4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 36 78              ldsp16	r6, [sp+0x78]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 22              stsp16	[sp+0x22], r7
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 84                    and	r5, r4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 90              ldsp16	r4, [sp+0x90]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f0 35 80              ldsp16	r5, [sp+0x80]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 94              ldsp16	r5, [sp+0x94]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 84              ldsp16	r5, [sp+0x84]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f0 35 86              ldsp16	r5, [sp+0x86]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 35 88              ldsp16	r5, [sp+0x88]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 35 92              ldsp16	r5, [sp+0x92]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 35 78              ldsp16	r5, [sp+0x78]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 f9 59                 or	r2, r6
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 32                 cmov.ult	r6, r2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 c4 02 ff              ldi16	r4, 0xff02
 f0 36 8e              ldsp16	r6, [sp+0x8e]
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 f0 36 90              ldsp16	r6, [sp+0x90]
 f6 2e                 tst16	r6
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 37 80              ldsp16	r7, [sp+0x80]
 3c                    cmp	r7, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 ce 05                 cmpi.s8	r6, 0x5
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 94              ldsp16	r6, [sp+0x94]
 f6 2e                 tst16	r6
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 84              ldsp16	r4, [sp+0x84]
 cc e7                 cmpi.s8	r4, -0x19
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 86              ldsp16	r6, [sp+0x86]
 ce 19                 cmpi.s8	r6, 0x19
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 88              ldsp16	r4, [sp+0x88]
 cc 9f                 cmpi.s8	r4, -0x61
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 8a              ldsp16	r6, [sp+0x8a]
 ce 61                 cmpi.s8	r6, 0x61
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 c0 e0                 ldi8	r4, 0xe0
 f0 37 8c              ldsp16	r7, [sp+0x8c]
 3c                    cmp	r7, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 c6 20 ff              ldi16	r6, 0xff20
 f0 37 92              ldsp16	r7, [sp+0x92]
 3e                    cmp	r7, r6
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f6 2c                 tst16	r4
 f8 0f                 cset.ne	r7
 9e                    or	r7, r6
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 cd 04                 cmpi.s8	r5, 0x4
 f8 0e                 cset.ne	r6
 9b                    or	r6, r7
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 c4 04 01              ldi16	r4, 0x104
 f0 35 82              ldsp16	r5, [sp+0x82]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 56                 ldi8	r4, 0x56
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 7f                 adjsp	0x7f
 d6 17                 adjsp	0x17
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
