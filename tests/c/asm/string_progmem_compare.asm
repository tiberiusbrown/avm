
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_compare.c
0000096f l     O .rodata	00000005 p_equal
00000100 l     O .data	00000005 avm_test_main.equal
00000974 l     O .rodata	00000005 p_high
00000105 l     O .data	00000005 avm_test_main.low
00000979 l     O .rodata	00000005 p_low
0000010a l     O .data	00000005 avm_test_main.high
0000097e l     O .rodata	00000005 p_late
0000010f l     O .data	00000005 avm_test_main.late
00000983 l     O .rodata	00000006 p_alpha
00000114 l     O .data	00000006 avm_test_main.alpha
00000989 l     O .rodata	00000006 p_alphz
0000011a l     O .data	00000006 avm_test_main.alphz
0000098f l     O .rodata	00000008 p_catalog
00000120 l     O .data	00000004 avm_test_main.cat
00000997 l     O .rodata	00000004 p_cat
00000124 l     O .data	00000008 avm_test_main.catalog
0000099b l     O .rodata	00000002 p_unsigned_lo
0000012c l     O .data	00000002 avm_test_main.unsigned_hi
0000099d l     O .rodata	00000001 p_empty
0000099e l     O .rodata	00000008 p_short
000009a6 l     O .rodata	00000105 p_long
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000229 g     F .text	00000744 avm_test_main
0000096d g     F .text	00000002 avm_halt
00000216 g     F .text	00000007 test_call_memcmp_P
0000021d g     F .text	00000005 test_call_strcmp_P
00000222 g     F .text	00000007 test_call_strlen_P

Disassembly of section .text:

<_start>:
 d5 27                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 57 07              call16	avm_halt

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
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 d7 15                 sys	strlen_p
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 f6                 adjsp	-0xa
 d6 fe                 adjsp	-0x2
 c0 05                 ldi8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 c6 6f 09              ldi16	r6, 0x96f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 d5 d1                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 86              stsp16	[sp+0x86], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 f0 03 30              ldi8	r3, 0x30
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 6a              stsp16	[sp+0x6a], r6
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 04 74 09           ldi16	r0, 0x974
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c4 05 01              ldi16	r4, 0x105
 f2 6a                 mov32	q3, q0
 d5 9f                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 84              stsp16	[sp+0x84], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 6c              stsp16	[sp+0x6c], r6
 d6 fe                 adjsp	-0x2
 c0 05                 ldi8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 c6 79 09              ldi16	r6, 0x979
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0a 01              ldi16	r4, 0x10a
 e1 75 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 82              stsp16	[sp+0x82], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 68              stsp16	[sp+0x68], r6
 d6 fe                 adjsp	-0x2
 c0 05                 ldi8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 c6 7e 09              ldi16	r6, 0x97e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0f 01              ldi16	r4, 0x10f
 e1 4b ff              call16	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 7c              stsp16	[sp+0x7c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 66              stsp16	[sp+0x66], r5
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f2 6a                 mov32	q3, q0
 e1 28 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 80              stsp16	[sp+0x80], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 04 83 09           ldi16	r0, 0x983
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c4 14 01              ldi16	r4, 0x114
 f2 6a                 mov32	q3, q0
 e1 08 ff              call16	test_call_strcmp_P
 f0 3c 7a              stsp16	[sp+0x7a], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 62              stsp16	[sp+0x62], r5
 c6 89 09              ldi16	r6, 0x989
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 14 01              ldi16	r4, 0x114
 e1 e7 fe              call16	test_call_strcmp_P
 f0 3c 76              stsp16	[sp+0x76], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 60              stsp16	[sp+0x60], r5
 c4 1a 01              ldi16	r4, 0x11a
 f2 6a                 mov32	q3, q0
 e1 cb fe              call16	test_call_strcmp_P
 f0 3c 74              stsp16	[sp+0x74], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 c6 8f 09              ldi16	r6, 0x98f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 20 01              ldi16	r4, 0x120
 e1 aa fe              call16	test_call_strcmp_P
 f0 3c 7e              stsp16	[sp+0x7e], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 c6 97 09              ldi16	r6, 0x997
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 24 01              ldi16	r4, 0x124
 e1 89 fe              call16	test_call_strcmp_P
 f0 3c 78              stsp16	[sp+0x78], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 c6 9b 09              ldi16	r6, 0x99b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 2c 01              ldi16	r4, 0x12c
 e1 68 fe              call16	test_call_strcmp_P
 f0 3c 88              stsp16	[sp+0x88], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 58              stsp16	[sp+0x58], r5
 c4 9d 09              ldi16	r4, 0x99d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 4f fe              call16	test_call_strlen_P
 f0 3c 70              stsp16	[sp+0x70], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 56              stsp16	[sp+0x56], r5
 c4 9e 09              ldi16	r4, 0x99e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 31 fe              call16	test_call_strlen_P
 f0 3c 6e              stsp16	[sp+0x6e], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 54              stsp16	[sp+0x54], r5
 c4 a6 09              ldi16	r4, 0x9a6
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 13 fe              call16	test_call_strlen_P
 f0 3c 72              stsp16	[sp+0x72], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 00 0f              ldi8	r0, 0xf
 f0 34 86              ldsp16	r4, [sp+0x86]
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4e              stsp16	[sp+0x4e], r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 84              ldsp16	r4, [sp+0x84]
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 50              stsp16	[sp+0x50], r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4c              stsp16	[sp+0x4c], r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 4a              stsp16	[sp+0x4a], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 36 80              ldsp16	r6, [sp+0x80]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 48              stsp16	[sp+0x48], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 42              stsp16	[sp+0x42], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 36 76              ldsp16	r6, [sp+0x76]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 37 74              ldsp16	r7, [sp+0x74]
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 34 78              ldsp16	r4, [sp+0x78]
 08                    mov	r6, r4
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 36 70              ldsp16	r6, [sp+0x70]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 34 88              ldsp16	r4, [sp+0x88]
 08                    mov	r6, r4
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 36 72              ldsp16	r6, [sp+0x72]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 08                    mov	r6, r4
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 86              ldsp16	r4, [sp+0x86]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 34 84              ldsp16	r4, [sp+0x84]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 82              ldsp16	r4, [sp+0x82]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 34 80              ldsp16	r4, [sp+0x80]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f0 34 76              ldsp16	r4, [sp+0x76]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 74              ldsp16	r4, [sp+0x74]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 34 78              ldsp16	r4, [sp+0x78]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 34 88              ldsp16	r4, [sp+0x88]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 34 70              ldsp16	r4, [sp+0x70]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 6e              ldsp16	r6, [sp+0x6e]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 75                 or	r3, r5
 c9 37                 addi.s8	r5, 0x37
 f5 20                 cmp	r4, r0
 fc 2b                 cmov.ult	r5, r3
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 86              ldsp16	r4, [sp+0x86]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f0 35 84              ldsp16	r5, [sp+0x84]
 cd ff                 cmpi.s8	r5, -0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 cd ff                 cmpi.s8	r5, -0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 76              ldsp16	r4, [sp+0x76]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 74              ldsp16	r5, [sp+0x74]
 cd 01                 cmpi.s8	r5, 0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 78              ldsp16	r5, [sp+0x78]
 cd 01                 cmpi.s8	r5, 0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 88              ldsp16	r4, [sp+0x88]
 cc 01                 cmpi.s8	r4, 0x1
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 ce 07                 cmpi.s8	r6, 0x7
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 c4 04 01              ldi16	r4, 0x104
 f0 35 72              ldsp16	r5, [sp+0x72]
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
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 7f                 adjsp	0x7f
 d6 0b                 adjsp	0xb
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
