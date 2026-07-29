
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 vsnprintf.c
00000c91 l     O .rodata	00000006 .L.avm.flashstr.0
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
00000c59 l     F .text	00000016 call_vsnprintf
00000112 l     O .data	00000010 .L.str.2
00000cb3 l     O .rodata	00000015 program_long
00000c6f l     F .text	00000020 call_vsnprintf_P
00000122 l     O .data	00000036 .L.str.4
00000158 l     O .data	0000002f .L.str.5
00000187 l     O .data	00000038 .L.str.7
000001cf l     O .data	00000007 .L.str.9
000001bf l     O .data	00000010 .L.str.8
000001d6 l     O .data	00000015 .L.str.11
000001eb l     O .data	0000000a .L.str.12
000001f5 l     O .data	00000008 .L.str.14
000001fd l     O .data	00000006 .L.str.15
00000203 l     O .data	00000008 .L.str.17
0000020b l     O .data	00000010 .L.str.19
0000021b l     O .data	00000008 .L.str.21
00000223 l     O .data	00000008 .L.str.22
0000022b l     O .data	00000003 .L.str.24
00000c97 l     O .rodata	0000001c program_format
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000943 avm_test_main
00000c8f g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 79 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 96                 adjsp	-0x6a
 d6 f3                 adjsp	-0xd
 c4 91 0c              ldi16	r4, 0xc91
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 00 01              ldi16	r4, 0x100
 f4 60                 stsp16	[sp+0x8], r4
 c0 5a                 ldi8	r4, 0x5a
 f4 58                 stsp16	[sp+0x6], r4
 c4 04 01              ldi16	r4, 0x104
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 27              leasp	r4, 0x27
 f4 40                 stsp16	[sp+0x0], r4
 e1 18 09              call16	call_vsnprintf
 d6 0d                 adjsp	0xd
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f0 01 30              ldi8	r1, 0x30
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 02 0f              ldi8	r2, 0xf
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 0d                    mov	r7, r5
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 f4 60                 stsp16	[sp+0x8], r4
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f4 28                 ldsp16	r4, [sp+0xa]
 f5 20                 cmp	r4, r0
 f4 20                 ldsp16	r4, [sp+0x8]
 fc 34                 cmov.ult	r6, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1f 1a              ldsp8u	r7, [sp+0x1a]
 f4 a7                 tst8	r7
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 d0 3d                 breq8	avm_test_main+227
 f2 30                 sub	r0, r0
 f0 16 1a              leasp	r6, 0x1a
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+172
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 0f                 cmpi.s8	r4, 0xf
 d1 29                 brne8	avm_test_main+240
 cf 41                 cmpi.s8	r7, 0x41
 d1 25                 brne8	avm_test_main+240
 c3 41                 ldi8	r7, 0x41
 c4 13 01              ldi16	r4, 0x113
 f0 15 1a              leasp	r5, 0x1a
 f4 a7                 tst8	r7
 d0 16                 breq8	avm_test_main+237
 f7 06                 ld8u	r6, [r4+]
 ed ea 21              ld8u	r7, [r5+1]
 f4 ad                 inc16	r5
 3e                    cmp	r7, r6
 d0 f2                 breq8	avm_test_main+211
 d4 0d                 jmp8	avm_test_main+240
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d4 03                 jmp8	avm_test_main+240
 f0 38 0c              stsp16	[sp+0xc], r0
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 b3 0c              ldi16	r4, 0xcb3
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 f0 14 2c              leasp	r4, 0x2c
 f4 40                 stsp16	[sp+0x0], r4
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 e1 3d 08              call16	call_vsnprintf_P
 d6 12                 adjsp	0x12
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 2a                 ldsp16	r6, [sp+0xa]
 38                    cmp	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 3c                 cmov.ult	r7, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 18 1a              ldsp8u	r0, [sp+0x1a]
 f4 a0                 tst8	r0
 d0 3d                 breq8	avm_test_main+456
 c2 31                 ldi8	r6, 0x31
 f0 17 1a              leasp	r7, 0x1a
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+402
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 35                 cmpi.s8	r4, 0x35
 d1 23                 brne8	avm_test_main+464
 f0 0c 31              cmpi.s8	r0, 0x31
 d1 1e                 brne8	avm_test_main+464
 c4 23 01              ldi16	r4, 0x123
 f0 15 1a              leasp	r5, 0x1a
 f4 a6                 tst8	r6
 d0 1b                 breq8	avm_test_main+471
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+440
 d4 08                 jmp8	avm_test_main+464
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 02                 ldi8	r4, 0x2
 f4 31                 ldsp16	r5, [sp+0xc]
 94                    or	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 d6 e4                 adjsp	-0x1c
 c4 fa ff              ldi16	r4, 0xfffa
 c5 bf fe              ldi16	r5, 0xfebf
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 eb 32              ldi16	r4, 0x32eb
 c5 a4 f8              ldi16	r5, 0xf8a4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 2e fb              ldi16	r4, 0xfb2e
 f0 3c 12              stsp16	[sp+0x12], r4
 a0                    xor	r4, r4
 c1 fe                 ldi8	r5, 0xfe
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 2a                 ldi8	r4, 0x2a
 c1 09                 ldi8	r5, 0x9
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 0c                 ldi8	r4, 0xc
 c1 07                 ldi8	r5, 0x7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 58 01              ldi16	r4, 0x158
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 36              leasp	r4, 0x36
 f4 40                 stsp16	[sp+0x0], r4
 e1 23 07              call16	call_vsnprintf
 d6 1c                 adjsp	0x1c
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 2a                 ldsp16	r6, [sp+0xa]
 38                    cmp	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 3c                 cmov.ult	r7, r4
 c0 49                 ldi8	r4, 0x49
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1f 1a              ldsp8u	r7, [sp+0x1a]
 f4 a7                 tst8	r7
 f0 00 04              ldi8	r0, 0x4
 d0 3b                 breq8	avm_test_main+717
 f0 16 1a              leasp	r6, 0x1a
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+662
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 37                 cmpi.s8	r4, 0x37
 d1 24                 brne8	avm_test_main+725
 cf 2b                 cmpi.s8	r7, 0x2b
 d1 20                 brne8	avm_test_main+725
 c3 2b                 ldi8	r7, 0x2b
 c4 88 01              ldi16	r4, 0x188
 f0 15 1a              leasp	r5, 0x1a
 f4 a7                 tst8	r7
 d0 1a                 breq8	avm_test_main+731
 f7 06                 ld8u	r6, [r4+]
 ed ea 21              ld8u	r7, [r5+1]
 f4 ad                 inc16	r5
 3e                    cmp	r7, r6
 d0 f2                 breq8	avm_test_main+701
 d4 08                 jmp8	avm_test_main+725
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 d6 eb                 adjsp	-0x15
 c4 b3 0c              ldi16	r4, 0xcb3
 c1 00                 ldi8	r5, 0x0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 2d 14              stsp8	[sp+0x14], r5
 f0 38 10              stsp16	[sp+0x10], r0
 c0 06                 ldi8	r4, 0x6
 c5 d6 ff              ldi16	r5, 0xffd6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 cf 01              ldi16	r4, 0x1cf
 f4 68                 stsp16	[sp+0xa], r4
 c4 f8 ff              ldi16	r4, 0xfff8
 c1 03                 ldi8	r5, 0x3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 bf 01              ldi16	r4, 0x1bf
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 2f              leasp	r4, 0x2f
 f4 40                 stsp16	[sp+0x0], r4
 e1 30 06              call16	call_vsnprintf
 d6 15                 adjsp	0x15
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 2a                 ldsp16	r6, [sp+0xa]
 38                    cmp	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 3c                 cmov.ult	r7, r4
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1f 1a              ldsp8u	r7, [sp+0x1a]
 f4 a7                 tst8	r7
 f0 00 08              ldi8	r0, 0x8
 d0 3b                 breq8	avm_test_main+960
 f0 16 1a              leasp	r6, 0x1a
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+905
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 14                 cmpi.s8	r4, 0x14
 d1 24                 brne8	avm_test_main+968
 cf 61                 cmpi.s8	r7, 0x61
 d1 20                 brne8	avm_test_main+968
 c3 61                 ldi8	r7, 0x61
 c4 d7 01              ldi16	r4, 0x1d7
 f0 15 1a              leasp	r5, 0x1a
 f4 a7                 tst8	r7
 d0 1a                 breq8	avm_test_main+974
 f7 06                 ld8u	r6, [r4+]
 ed ea 21              ld8u	r7, [r5+1]
 f4 ad                 inc16	r5
 3e                    cmp	r7, r6
 d0 f2                 breq8	avm_test_main+944
 d4 08                 jmp8	avm_test_main+968
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 5a a5              ldi16	r4, 0xa55a
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 69              ldi16	r5, 0x69a5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 d6 f8                 adjsp	-0x8
 c4 39 30              ldi16	r4, 0x3039
 f4 58                 stsp16	[sp+0x6], r4
 c4 eb 01              ldi16	r4, 0x1eb
 f4 50                 stsp16	[sp+0x4], r4
 f0 38 02              stsp16	[sp+0x2], r0
 f0 14 19              leasp	r4, 0x19
 f4 40                 stsp16	[sp+0x0], r4
 e1 40 05              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 2a                 ldsp16	r6, [sp+0xa]
 38                    cmp	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 3c                 cmov.ult	r7, r4
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 11              ldsp8u	r6, [sp+0x11]
 f4 a6                 tst8	r6
 d0 37                 breq8	avm_test_main+1193
 f0 17 12              leasp	r7, 0x12
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f7 1c                 ld8u	r4, [r7+]
 f4 a4                 tst8	r4
 d1 f6                 brne8	avm_test_main+1142
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 48                 brne8	avm_test_main+1238
 ce 61                 cmpi.s8	r6, 0x61
 d1 25                 brne8	avm_test_main+1207
 c3 61                 ldi8	r7, 0x61
 c5 f6 01              ldi16	r5, 0x1f6
 f0 16 12              leasp	r6, 0x12
 f4 a7                 tst8	r7
 f8 00                 cset.eq	r0
 d0 19                 breq8	avm_test_main+1209
 f7 0c                 ld8u	r4, [r5+]
 f7 17                 ld8u	r7, [r6+]
 3c                    cmp	r7, r4
 d0 f3                 breq8	avm_test_main+1178
 d4 10                 jmp8	avm_test_main+1209
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 1f                 brne8	avm_test_main+1238
 f2 30                 sub	r0, r0
 f0 1d 19              ldsp8u	r5, [sp+0x19]
 f0 1e 18              ldsp8u	r6, [sp+0x18]
 f0 1f 10              ldsp8u	r7, [sp+0x10]
 f4 a0                 tst8	r0
 d0 10                 breq8	avm_test_main+1238
 f1 77                 zext8	r7
 cf 5a                 cmpi.s8	r7, 0x5a
 d1 0a                 brne8	avm_test_main+1238
 f4 a6                 tst8	r6
 d1 06                 brne8	avm_test_main+1238
 f1 75                 zext8	r5
 cd 69                 cmpi.s8	r5, 0x69
 d0 07                 breq8	avm_test_main+1245
 c0 10                 ldi8	r4, 0x10
 f4 31                 ldsp16	r5, [sp+0xc]
 94                    or	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 78 79              ldi16	r4, 0x7978
 f4 78                 stsp16	[sp+0xe], r4
 d6 fa                 adjsp	-0x6
 c4 fd 01              ldi16	r4, 0x1fd
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 14              leasp	r4, 0x14
 f4 40                 stsp16	[sp+0x0], r4
 e1 4e 04              call16	call_vsnprintf
 d6 06                 adjsp	0x6
 04                    mov	r5, r4
 08                    mov	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 29                 ldsp16	r5, [sp+0xa]
 34                    cmp	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 34                 cmov.ult	r6, r4
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f3 7b                 ldsp8u	r7, [sp+0xe]
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+1396
 f0 16 0e              leasp	r6, 0xe
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1383
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 18 0f              ldsp8u	r0, [sp+0xf]
 d6 f8                 adjsp	-0x8
 c4 d2 04              ldi16	r4, 0x4d2
 f4 58                 stsp16	[sp+0x6], r4
 c4 03 02              ldi16	r4, 0x203
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 73                 stsp16	[sp+0xc], r7
 e1 ad 03              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 08                    mov	r6, r4
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f0 02 30              ldi8	r2, 0x30
 f9 a9                 or	r5, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 fa 98                 lsr16i	r6, 0x8
 c0 0f                 ldi8	r4, 0xf
 88                    and	r6, r4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 c9 37                 addi.s8	r5, 0x37
 f1 0b                 mov	r1, r3
 f0 07 00 a0           ldi16	r3, 0xa000
 f4 20                 ldsp16	r4, [sp+0x8]
 f5 23                 cmp	r4, r3
 f4 08                 ldsp16	r4, [sp+0x2]
 fc 2c                 cmov.ult	r5, r4
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 f4 58                 stsp16	[sp+0x6], r4
 c4 0b 02              ldi16	r4, 0x20b
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 22              leasp	r4, 0x22
 f4 40                 stsp16	[sp+0x0], r4
 e1 2e 03              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 c3 20                 ldi8	r7, 0x20
 f4 32                 ldsp16	r6, [sp+0xc]
 9e                    or	r7, r6
 f1 70                 zext8	r0
 f0 0c 79              cmpi.s8	r0, 0x79
 07                    mov	r5, r7
 fb 2e                 cmov.eq	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 f0 01 0f              ldi8	r1, 0xf
 0b                    mov	r6, r7
 fb 35                 cmov.eq	r6, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 cd 05                 cmpi.s8	r5, 0x5
 fb 3e                 cmov.eq	r7, r6
 f0 03 40              ldi8	r3, 0x40
 f9 7d                 or	r3, r7
 f4 21                 ldsp16	r5, [sp+0x8]
 cd 09                 cmpi.s8	r5, 0x9
 fb 1f                 cmov.eq	r3, r7
 08                    mov	r6, r4
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 5a                 stsp16	[sp+0x6], r6
 fa 9c                 lsr16i	r6, 0xc
 f4 72                 stsp16	[sp+0xc], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 1b                 ldsp16	r7, [sp+0x6]
 3c                    cmp	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fc 34                 cmov.ult	r6, r4
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 1a              ldsp8u	r6, [sp+0x1a]
 f4 a6                 tst8	r6
 d0 3b                 breq8	avm_test_main+1768
 f0 17 1a              leasp	r7, 0x1a
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1713
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 cc ff                 cmpi.s8	r4, -0x1
 d1 24                 brne8	avm_test_main+1776
 ce 62                 cmpi.s8	r6, 0x62
 d1 20                 brne8	avm_test_main+1776
 c2 62                 ldi8	r6, 0x62
 c4 1c 02              ldi16	r4, 0x21c
 f0 15 1a              leasp	r5, 0x1a
 f4 a6                 tst8	r6
 d0 18                 breq8	avm_test_main+1780
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+1752
 d4 08                 jmp8	avm_test_main+1776
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 80                 ldi8	r4, 0x80
 f9 71                 or	r3, r4
 c4 78 79              ldi16	r4, 0x7978
 f4 78                 stsp16	[sp+0xe], r4
 d6 f8                 adjsp	-0x8
 c4 23 02              ldi16	r4, 0x223
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 16              leasp	r4, 0x16
 f4 40                 stsp16	[sp+0x0], r4
 e1 35 02              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f4 33                 ldsp16	r7, [sp+0xc]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f4 58                 stsp16	[sp+0x6], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 31                 ldsp16	r5, [sp+0xc]
 34                    cmp	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 34                 cmov.ult	r6, r4
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 19 0e              ldsp8u	r1, [sp+0xe]
 f4 a1                 tst8	r1
 d0 12                 breq8	avm_test_main+1936
 f0 16 0e              leasp	r6, 0xe
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1923
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 18 0f              ldsp8u	r0, [sp+0xf]
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 c4 2b 02              ldi16	r4, 0x22b
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 22              leasp	r4, 0x22
 f4 40                 stsp16	[sp+0x0], r4
 f2 42                 sub	r2, r2
 e1 8e 01              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 1e 1b              ldsp8u	r6, [sp+0x1b]
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 cd 30                 cmpi.s8	r5, 0x30
 d1 64                 brne8	avm_test_main+2085
 f1 76                 zext8	r6
 ce 78                 cmpi.s8	r6, 0x78
 d1 5e                 brne8	avm_test_main+2085
 c7 00 01              ldi16	r7, 0x100
 c5 00 a0              ldi16	r5, 0xa000
 3d                    cmp	r7, r5
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 c2 30                 ldi8	r6, 0x30
 96                    or	r5, r6
 cb 57                 addi.s8	r7, 0x57
 fc 3d                 cmov.ult	r7, r5
 f0 1d 1c              ldsp8u	r5, [sp+0x1c]
 37                    cmp	r5, r7
 d1 47                 brne8	avm_test_main+2085
 c7 00 01              ldi16	r7, 0x100
 fa a8                 lsr16i	r7, 0x8
 c1 0f                 ldi8	r5, 0xf
 8d                    and	r7, r5
 07                    mov	r5, r7
 96                    or	r5, r6
 cf 0a                 cmpi.s8	r7, 0xa
 cb 57                 addi.s8	r7, 0x57
 fc 3d                 cmov.ult	r7, r5
 f0 1d 1d              ldsp8u	r5, [sp+0x1d]
 37                    cmp	r5, r7
 d1 31                 brne8	avm_test_main+2085
 c7 00 01              ldi16	r7, 0x100
 f1 77                 zext8	r7
 c1 a0                 ldi8	r5, 0xa0
 3d                    cmp	r7, r5
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 96                    or	r5, r6
 cb 57                 addi.s8	r7, 0x57
 fc 3d                 cmov.ult	r7, r5
 f0 1d 1e              ldsp8u	r5, [sp+0x1e]
 37                    cmp	r5, r7
 d1 1b                 brne8	avm_test_main+2085
 c7 00 01              ldi16	r7, 0x100
 c1 0f                 ldi8	r5, 0xf
 8d                    and	r7, r5
 07                    mov	r5, r7
 96                    or	r5, r6
 cf 0a                 cmpi.s8	r7, 0xa
 cb 57                 addi.s8	r7, 0x57
 fc 3d                 cmov.ult	r7, r5
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 37                    cmp	r5, r7
 d1 07                 brne8	avm_test_main+2085
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f4 a5                 tst8	r5
 f8 02                 cset.eq	r2
 c7 00 01              ldi16	r7, 0x100
 f9 ed                 or	r7, r3
 f1 70                 zext8	r0
 f0 0c 79              cmpi.s8	r0, 0x79
 07                    mov	r5, r7
 fb 2b                 cmov.eq	r5, r3
 f4 a1                 tst8	r1
 0b                    mov	r6, r7
 fb 35                 cmov.eq	r6, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 cd ff                 cmpi.s8	r5, -0x1
 fb 3e                 cmov.eq	r7, r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c2 a0                 ldi8	r6, 0xa0
 f1 0e                 mov	r1, r6
 09                    mov	r6, r5
 f5 29                 cmp	r6, r1
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f0 00 30              ldi8	r0, 0x30
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 c6 00 02              ldi16	r6, 0x200
 9b                    or	r6, r7
 cc 06                 cmpi.s8	r4, 0x6
 fb 37                 cmov.eq	r6, r7
 c5 00 04              ldi16	r5, 0x400
 96                    or	r5, r6
 f6 2a                 tst16	r2
 fb 35                 cmov.eq	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f1 76                 zext8	r6
 f5 29                 cmp	r6, r1
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 04                    mov	r5, r4
 08                    mov	r6, r4
 c3 0f                 ldi8	r7, 0xf
 f1 1f                 mov	r3, r7
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 25                 cmp	r5, r1
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 33                 ldsp16	r7, [sp+0xc]
 07                    mov	r5, r7
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 33                 ldsp16	r7, [sp+0xc]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f4 43                 stsp16	[sp+0x0], r7
 f4 33                 ldsp16	r7, [sp+0xc]
 f5 2d                 cmp	r7, r1
 f4 03                 ldsp16	r7, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 56                 ldi8	r4, 0x56
 d7 00                 sys	debug_putc
 f9 41                 or	r2, r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d6 6a                 adjsp	0x6a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_vsnprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 17 0d              leasp	r7, 0xd
 f4 43                 stsp16	[sp+0x0], r7
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

<call_vsnprintf_P>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 34                 ldsp16	r4, [sp+0xd]
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 10 10              leasp	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 c6 97 0c              ldi16	r6, 0xc97
 c3 00                 ldi8	r7, 0x0
 c1 50                 ldi8	r5, 0x50
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
