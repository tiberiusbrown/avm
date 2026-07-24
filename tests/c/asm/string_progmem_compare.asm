
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_compare.c
00000a2d l     O .rodata	00000005 p_equal
00000100 l     O .data	00000005 avm_test_main.equal
00000a32 l     O .rodata	00000005 p_high
00000105 l     O .data	00000005 avm_test_main.low
00000a37 l     O .rodata	00000005 p_low
0000010a l     O .data	00000005 avm_test_main.high
00000a3c l     O .rodata	00000005 p_late
0000010f l     O .data	00000005 avm_test_main.late
00000a41 l     O .rodata	00000006 p_alpha
00000114 l     O .data	00000006 avm_test_main.alpha
00000a47 l     O .rodata	00000006 p_alphz
0000011a l     O .data	00000006 avm_test_main.alphz
00000a4d l     O .rodata	00000008 p_catalog
00000120 l     O .data	00000004 avm_test_main.cat
00000a55 l     O .rodata	00000004 p_cat
00000124 l     O .data	00000008 avm_test_main.catalog
00000a59 l     O .rodata	00000002 p_unsigned_lo
0000012c l     O .data	00000002 avm_test_main.unsigned_hi
00000a5b l     O .rodata	00000001 p_empty
00000a5c l     O .rodata	00000008 p_short
00000a64 l     O .rodata	00000105 p_long
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000229 g     F .text	00000802 avm_test_main
00000a2b g     F .text	00000002 avm_halt
00000216 g     F .text	00000007 test_call_memcmp_P
0000021d g     F .text	00000005 test_call_strcmp_P
00000222 g     F .text	00000007 test_call_strlen_P

Disassembly of section .text:

<_start>:
 d5 27                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 15 08              call16	avm_halt

<test_call_memcmp_P>:
 f1 77                 zext8	r7
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 13                 sys	memcmp_p
 ef                    ret

<test_call_strcmp_P>:
 f1 77                 zext8	r7
 d7 14                 sys	strcmp_p
 ef                    ret

<test_call_strlen_P>:
 f1 75                 zext8	r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 f6                 adjsp	test_call_strlen_P+5
 d6 fe                 adjsp	avm_test_main+8
 c0 05                 ldi8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 c6 2d 0a              ldi16	r6, 0xa2d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 d5 d1                 call8	test_call_memcmp_P
 d6 02                 adjsp	avm_test_main+32
 f0 3c 82              stsp16	[sp+0x82], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 f0 03 30              ldi8	r3, 0x30
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 6a              stsp16	[sp+0x6a], r6
 d6 fe                 adjsp	avm_test_main+55
 f0 38 00              stsp16	[sp+0x0], r0
 f1 10                 mov	r2, r0
 f0 04 32 0a           ldi16	r0, 0xa32
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c4 05 01              ldi16	r4, 0x105
 f0 3c 8a              stsp16	[sp+0x8a], r4
 f2 6a                 mov32	q3, q0
 d5 9c                 call8	test_call_memcmp_P
 d6 02                 adjsp	avm_test_main+85
 f0 3c 80              stsp16	[sp+0x80], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 6c              stsp16	[sp+0x6c], r6
 d6 fe                 adjsp	avm_test_main+105
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 37 0a              ldi16	r6, 0xa37
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0a 01              ldi16	r4, 0x10a
 e1 72 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	avm_test_main+127
 f0 3c 7e              stsp16	[sp+0x7e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 68              stsp16	[sp+0x68], r6
 d6 fe                 adjsp	avm_test_main+147
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 3c 0a              ldi16	r6, 0xa3c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0f 01              ldi16	r4, 0x10f
 e1 48 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	avm_test_main+169
 f0 3c 78              stsp16	[sp+0x78], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 66              stsp16	[sp+0x66], r6
 d6 fe                 adjsp	avm_test_main+191
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 f2 6a                 mov32	q3, q0
 e1 21 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	avm_test_main+208
 f0 3c 7c              stsp16	[sp+0x7c], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 04 41 0a           ldi16	r0, 0xa41
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f0 06 14 01           ldi16	r2, 0x114
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e1 fd fe              call16	test_call_strcmp_P
 f0 3c 76              stsp16	[sp+0x76], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 62              stsp16	[sp+0x62], r6
 c6 47 0a              ldi16	r6, 0xa47
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 db fe              call16	test_call_strcmp_P
 f0 3c 88              stsp16	[sp+0x88], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 60              stsp16	[sp+0x60], r6
 c4 1a 01              ldi16	r4, 0x11a
 f2 6a                 mov32	q3, q0
 e1 bb fe              call16	test_call_strcmp_P
 f0 3c 72              stsp16	[sp+0x72], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f1 02                 mov	r0, r2
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5e              stsp16	[sp+0x5e], r6
 c6 4d 0a              ldi16	r6, 0xa4d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 20 01              ldi16	r4, 0x120
 e1 97 fe              call16	test_call_strcmp_P
 f0 3c 7a              stsp16	[sp+0x7a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5c              stsp16	[sp+0x5c], r6
 c6 55 0a              ldi16	r6, 0xa55
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 24 01              ldi16	r4, 0x124
 e1 75 fe              call16	test_call_strcmp_P
 f0 3c 74              stsp16	[sp+0x74], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5a              stsp16	[sp+0x5a], r6
 c6 59 0a              ldi16	r6, 0xa59
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 2c 01              ldi16	r4, 0x12c
 e1 53 fe              call16	test_call_strcmp_P
 f0 3c 84              stsp16	[sp+0x84], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 58              stsp16	[sp+0x58], r6
 c4 5b 0a              ldi16	r4, 0xa5b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 39 fe              call16	test_call_strlen_P
 f0 3c 70              stsp16	[sp+0x70], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 56              stsp16	[sp+0x56], r6
 c4 5c 0a              ldi16	r4, 0xa5c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 1a fe              call16	test_call_strlen_P
 f0 3c 86              stsp16	[sp+0x86], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 54              stsp16	[sp+0x54], r6
 c4 64 0a              ldi16	r4, 0xa64
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 fb fd              call16	test_call_strlen_P
 f0 3c 6e              stsp16	[sp+0x6e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 52              stsp16	[sp+0x52], r6
 f0 00 0f              ldi8	r0, 0xf
 f0 37 82              ldsp16	r7, [sp+0x82]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4e              stsp16	[sp+0x4e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 37 80              ldsp16	r7, [sp+0x80]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 50              stsp16	[sp+0x50], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 4c              stsp16	[sp+0x4c], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 37 78              ldsp16	r7, [sp+0x78]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 46              stsp16	[sp+0x46], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 42              stsp16	[sp+0x42], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 37 76              ldsp16	r7, [sp+0x76]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3e              stsp16	[sp+0x3e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 34 88              ldsp16	r4, [sp+0x88]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 37 72              ldsp16	r7, [sp+0x72]
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 38              stsp16	[sp+0x38], r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 0b                    mov	r6, r7
 f9 cd                 or	r6, r3
 07                    mov	r5, r7
 c9 37                 addi.s8	r5, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 34 88              ldsp16	r4, [sp+0x88]
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 32              stsp16	[sp+0x32], r7
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 37 74              ldsp16	r7, [sp+0x74]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2e              stsp16	[sp+0x2e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 35 70              ldsp16	r5, [sp+0x70]
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 37 84              ldsp16	r7, [sp+0x84]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 22              stsp16	[sp+0x22], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 37 86              ldsp16	r7, [sp+0x86]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 34 82              ldsp16	r4, [sp+0x82]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 36 80              ldsp16	r6, [sp+0x80]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 36 78              ldsp16	r6, [sp+0x78]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 36 76              ldsp16	r6, [sp+0x76]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 36 88              ldsp16	r6, [sp+0x88]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 72              ldsp16	r6, [sp+0x72]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 74              ldsp16	r6, [sp+0x74]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 36 84              ldsp16	r6, [sp+0x84]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 36 70              ldsp16	r6, [sp+0x70]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 36 86              ldsp16	r6, [sp+0x86]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f0 36 6e              ldsp16	r6, [sp+0x6e]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 f6 2c                 tst16	r4
 f8 08                 cset.ne	r0
 f0 34 80              ldsp16	r4, [sp+0x80]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 cc 01                 cmpi.s8	r4, 0x1
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 34 78              ldsp16	r4, [sp+0x78]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f6 2c                 tst16	r4
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 34 76              ldsp16	r4, [sp+0x76]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 88              ldsp16	r4, [sp+0x88]
 cc ff                 cmpi.s8	r4, -0x1
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 cc ff                 cmpi.s8	r4, -0x1
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 34 74              ldsp16	r4, [sp+0x74]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 84              ldsp16	r4, [sp+0x84]
 cc 01                 cmpi.s8	r4, 0x1
 f8 09                 cset.ne	r1
 f9 35                 or	r1, r5
 f0 00 4d              ldi8	r0, 0x4d
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f9 85                 or	r4, r1
 f0 35 48              ldsp16	r5, [sp+0x48]
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 f0 35 86              ldsp16	r5, [sp+0x86]
 cd 07                 cmpi.s8	r5, 0x7
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 c4 04 01              ldi16	r4, 0x104
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 01 01              ldi8	r1, 0x1
 f9 30                 and	r1, r4
 c0 0a                 ldi8	r4, 0xa
 f0 3c 88              stsp16	[sp+0x88], r4
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 f0 3c 84              stsp16	[sp+0x84], r4
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 f0 3c 82              stsp16	[sp+0x82], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f0 3c 86              stsp16	[sp+0x86], r4
 d7 00                 sys	debug_putc
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 50              ldsp16	r5, [sp+0x50]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 47                 ldi8	r5, 0x47
 01                    mov	r4, r5
 f0 3c 80              stsp16	[sp+0x80], r4
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 44              ldsp16	r5, [sp+0x44]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 68              ldsp16	r5, [sp+0x68]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 54                 ldi8	r5, 0x54
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 35 14              ldsp16	r5, [sp+0x14]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 40              ldsp16	r5, [sp+0x40]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 66              ldsp16	r5, [sp+0x66]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 46              ldsp16	r5, [sp+0x46]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 5a                 ldi8	r5, 0x5a
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 64              ldsp16	r5, [sp+0x64]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 42              ldsp16	r5, [sp+0x42]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 c1 53                 ldi8	r5, 0x53
 01                    mov	r4, r5
 f0 3c 84              stsp16	[sp+0x84], r4
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 35 18              ldsp16	r5, [sp+0x18]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 62              ldsp16	r5, [sp+0x62]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 35 10              ldsp16	r5, [sp+0x10]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 36              ldsp16	r5, [sp+0x36]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 60              ldsp16	r5, [sp+0x60]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 30              ldsp16	r5, [sp+0x30]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 34              ldsp16	r5, [sp+0x34]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 5e              ldsp16	r5, [sp+0x5e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 38              ldsp16	r5, [sp+0x38]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 50                 ldi8	r5, 0x50
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 32              ldsp16	r5, [sp+0x32]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 52                 ldi8	r5, 0x52
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 28              ldsp16	r5, [sp+0x28]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 c1 55                 ldi8	r5, 0x55
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 58              ldsp16	r5, [sp+0x58]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 22              ldsp16	r5, [sp+0x22]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 26              ldsp16	r5, [sp+0x26]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 56              ldsp16	r5, [sp+0x56]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c1 31                 ldi8	r5, 0x31
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 54              ldsp16	r5, [sp+0x54]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d6 7f                 adjsp	avm_halt+120
 d6 0b                 adjsp	avm_halt+6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
