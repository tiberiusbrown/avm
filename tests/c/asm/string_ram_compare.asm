
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
0000031f g     F .text	00000814 avm_test_main
00000b33 g     F .text	00000002 avm_halt
00000316 g     F .text	00000003 test_call_memcmp
00000319 g     F .text	00000003 test_call_strcmp
0000031c g     F .text	00000003 test_call_strlen

Disassembly of section .text:

<_start>:
 d5 1d                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 1d 08              call16	avm_halt

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
 d6 ea                 adjsp	_start+17
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
 c2 05                 ldi8	r6, 0x5
 d5 d0                 call8	test_call_memcmp
 f0 3c 90              stsp16	[sp+0x90], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 01 30              ldi8	r1, 0x30
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 72              stsp16	[sp+0x72], r7
 f0 06 0a 01           ldi16	r2, 0x10a
 f0 07 0f 01           ldi16	r3, 0x10f
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 c2 05                 ldi8	r6, 0x5
 d5 a6                 call8	test_call_memcmp
 f0 3c 8e              stsp16	[sp+0x8e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 76              stsp16	[sp+0x76], r6
 c4 14 01              ldi16	r4, 0x114
 c5 19 01              ldi16	r5, 0x119
 c2 05                 ldi8	r6, 0x5
 d5 87                 call8	test_call_memcmp
 f0 3c 80              stsp16	[sp+0x80], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 74              stsp16	[sp+0x74], r6
 c4 1e 01              ldi16	r4, 0x11e
 c5 23 01              ldi16	r5, 0x123
 c2 05                 ldi8	r6, 0x5
 e1 67 ff              call16	test_call_memcmp
 f0 3c 7c              stsp16	[sp+0x7c], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 70              stsp16	[sp+0x70], r6
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 aa                    xor	r6, r6
 e1 4a ff              call16	test_call_memcmp
 f0 3c 7e              stsp16	[sp+0x7e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 f1 11                 mov	r2, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 f1 18                 mov	r3, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 6e              stsp16	[sp+0x6e], r6
 f0 04 28 01           ldi16	r0, 0x128
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 e1 29 ff              call16	test_call_strcmp
 f0 3c 94              stsp16	[sp+0x94], r4
 f0 05 2e 01           ldi16	r1, 0x12e
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 1b ff              call16	test_call_strcmp
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 37 94              ldsp16	r7, [sp+0x94]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 6a              stsp16	[sp+0x6a], r6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 6c              stsp16	[sp+0x6c], r6
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 eb fe              call16	test_call_strcmp
 f0 3c 86              stsp16	[sp+0x86], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 04 34 01           ldi16	r0, 0x134
 f0 05 38 01           ldi16	r1, 0x138
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 c7 fe              call16	test_call_strcmp
 f0 3c 88              stsp16	[sp+0x88], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 66              stsp16	[sp+0x66], r6
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 ab fe              call16	test_call_strcmp
 f0 3c 8a              stsp16	[sp+0x8a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 04 40 01           ldi16	r0, 0x140
 f0 05 42 01           ldi16	r1, 0x142
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 87 fe              call16	test_call_strcmp
 f0 3c 8c              stsp16	[sp+0x8c], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 62              stsp16	[sp+0x62], r6
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 6b fe              call16	test_call_strcmp
 f0 3c 78              stsp16	[sp+0x78], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f1 0a                 mov	r1, r2
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f1 03                 mov	r0, r3
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 60              stsp16	[sp+0x60], r6
 c4 49 02              ldi16	r4, 0x249
 e1 4f fe              call16	test_call_strlen
 f0 3c 7a              stsp16	[sp+0x7a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5e              stsp16	[sp+0x5e], r6
 c4 4a 02              ldi16	r4, 0x24a
 e1 34 fe              call16	test_call_strlen
 f0 3c 92              stsp16	[sp+0x92], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5c              stsp16	[sp+0x5c], r6
 c4 44 01              ldi16	r4, 0x144
 e1 19 fe              call16	test_call_strlen
 f0 3c 82              stsp16	[sp+0x82], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5a              stsp16	[sp+0x5a], r6
 f0 00 0f              ldi8	r0, 0xf
 f0 37 90              ldsp16	r7, [sp+0x90]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 56              stsp16	[sp+0x56], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 37 8e              ldsp16	r7, [sp+0x8e]
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 58              stsp16	[sp+0x58], r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 37 80              ldsp16	r7, [sp+0x80]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 54              stsp16	[sp+0x54], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 52              stsp16	[sp+0x52], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 46              stsp16	[sp+0x46], r5
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4e              stsp16	[sp+0x4e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 37 94              ldsp16	r7, [sp+0x94]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 48              stsp16	[sp+0x48], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 37 84              ldsp16	r7, [sp+0x84]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 44              stsp16	[sp+0x44], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 37 86              ldsp16	r7, [sp+0x86]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3e              stsp16	[sp+0x3e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 37 88              ldsp16	r7, [sp+0x88]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3c              stsp16	[sp+0x3c], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 37 8a              ldsp16	r7, [sp+0x8a]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 36              stsp16	[sp+0x36], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 37 8c              ldsp16	r7, [sp+0x8c]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 32              stsp16	[sp+0x32], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 38              stsp16	[sp+0x38], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 37 78              ldsp16	r7, [sp+0x78]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 24              stsp16	[sp+0x24], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 37 82              ldsp16	r7, [sp+0x82]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2e              stsp16	[sp+0x2e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 37 92              ldsp16	r7, [sp+0x92]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 22              stsp16	[sp+0x22], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 35 90              ldsp16	r5, [sp+0x90]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 c8 37                 addi.s8	r4, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 f0 35 80              ldsp16	r5, [sp+0x80]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 50                 stsp16	[sp+0x4], r4
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 94              ldsp16	r5, [sp+0x94]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 84              ldsp16	r5, [sp+0x84]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 70                 stsp16	[sp+0xc], r4
 f0 35 86              ldsp16	r5, [sp+0x86]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 f0 35 88              ldsp16	r5, [sp+0x88]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 36 78              ldsp16	r6, [sp+0x78]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 35 92              ldsp16	r5, [sp+0x92]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 37 82              ldsp16	r7, [sp+0x82]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2c                 cmp	r7, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c4 02 ff              ldi16	r4, 0xff02
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 f0 35 90              ldsp16	r5, [sp+0x90]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 9c                    or	r7, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 35 80              ldsp16	r5, [sp+0x80]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 cd 05                 cmpi.s8	r5, 0x5
 f8 0f                 cset.ne	r7
 9c                    or	r7, r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 f0 35 94              ldsp16	r5, [sp+0x94]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 9c                    or	r7, r4
 f0 34 84              ldsp16	r4, [sp+0x84]
 cc e7                 cmpi.s8	r4, -0x19
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 f0 35 86              ldsp16	r5, [sp+0x86]
 cd 19                 cmpi.s8	r5, 0x19
 f8 0f                 cset.ne	r7
 9c                    or	r7, r4
 f0 34 88              ldsp16	r4, [sp+0x88]
 cc 9f                 cmpi.s8	r4, -0x61
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 cd 61                 cmpi.s8	r5, 0x61
 f8 0f                 cset.ne	r7
 9c                    or	r7, r4
 c0 e0                 ldi8	r4, 0xe0
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 c7 20 ff              ldi16	r7, 0xff20
 3b                    cmp	r6, r7
 f8 08                 cset.ne	r0
 f9 11                 or	r0, r4
 c0 4d                 ldi8	r4, 0x4d
 f0 3c 90              stsp16	[sp+0x90], r4
 d7 00                 sys	debug_putc
 c3 45                 ldi8	r7, 0x45
 03                    mov	r4, r7
 f0 3c 8c              stsp16	[sp+0x8c], r4
 d7 00                 sys	debug_putc
 c3 3d                 ldi8	r7, 0x3d
 03                    mov	r4, r7
 f0 3c 94              stsp16	[sp+0x94], r4
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 cc 04                 cmpi.s8	r4, 0x4
 f8 0f                 cset.ne	r7
 9d                    or	r7, r5
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 c4 04 01              ldi16	r4, 0x104
 f0 35 82              ldsp16	r5, [sp+0x82]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 93                    or	r4, r7
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 c0 0a                 ldi8	r4, 0xa
 f0 3c 92              stsp16	[sp+0x92], r4
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 f0 3c 8e              stsp16	[sp+0x8e], r4
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 f0 3c 8a              stsp16	[sp+0x8a], r4
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 f0 3c 90              stsp16	[sp+0x90], r4
 d7 00                 sys	debug_putc
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 90              ldsp16	r4, [sp+0x90]
 d7 00                 sys	debug_putc
 c0 56                 ldi8	r4, 0x56
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 7f                 adjsp	avm_halt+120
 d6 17                 adjsp	avm_halt+18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
