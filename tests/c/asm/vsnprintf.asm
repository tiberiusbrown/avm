
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 vsnprintf.c
00000fc0 l     O .rodata	00000006 .L.avm.flashstr.1
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
00000f85 l     F .text	00000016 call_vsnprintf
00000112 l     O .data	00000010 .L.str.2
00000fe2 l     O .rodata	00000015 program_long
00000fc6 l     O .rodata	0000001c program_format
00000f9b l     F .text	0000001b call_vsnprintf_P
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
00000fb8 l     O .rodata	00000008 .L.avm.flashstr.0
0000022e l     O .data	00000006 .L.str.27
00000234 l     O .data	00000006 .L.str.28
00000ff7 l     O .rodata	00000006 .L.avm.flashstr.2
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000c6f avm_test_main
00000fb6 g     F .text	00000002 avm_halt

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
 e1 a0 0c              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 90                 adjsp	-0x70
 d6 f3                 adjsp	-0xd
 c4 c0 0f              ldi16	r4, 0xfc0
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
 f0 14 2d              leasp	r4, 0x2d
 f4 40                 stsp16	[sp+0x0], r4
 e1 44 0c              call16	call_vsnprintf
 d6 0d                 adjsp	0xd
 08                    mov	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f1 74                 zext8	r4
 f0 00 30              ldi8	r0, 0x30
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 02 0f              ldi8	r2, 0xf
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 f5 23                 cmp	r4, r3
 f4 38                 ldsp16	r4, [sp+0xe]
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
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+184
 f0 17 20              leasp	r7, 0x20
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+171
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 01 01              ldi8	r1, 0x1
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 0f                 cmpi.s8	r4, 0xf
 d1 1f                 brne8	avm_test_main+233
 ce 41                 cmpi.s8	r6, 0x41
 d1 1b                 brne8	avm_test_main+233
 c3 41                 ldi8	r7, 0x41
 c4 13 01              ldi16	r4, 0x113
 f0 16 20              leasp	r6, 0x20
 f2 39                 sub	r1, r1
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+233
 f7 05                 ld8u	r5, [r4+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3d                    cmp	r7, r5
 d0 f2                 breq8	avm_test_main+216
 f0 01 01              ldi8	r1, 0x1
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 e2 0f              ldi16	r4, 0xfe2
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 c4 c6 0f              ldi16	r4, 0xfc6
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 32              leasp	r4, 0x32
 f4 40                 stsp16	[sp+0x0], r4
 e1 6b 0b              call16	call_vsnprintf_P
 d6 12                 adjsp	0x12
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 12              ldsp16	r4, [sp+0x12]
 f5 23                 cmp	r4, r3
 f4 38                 ldsp16	r4, [sp+0xe]
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+411
 f0 17 20              leasp	r7, 0x20
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+398
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 35                 cmpi.s8	r4, 0x35
 c0 31                 ldi8	r4, 0x31
 d1 18                 brne8	avm_test_main+452
 ce 31                 cmpi.s8	r6, 0x31
 d1 14                 brne8	avm_test_main+452
 c5 23 01              ldi16	r5, 0x123
 f0 16 20              leasp	r6, 0x20
 f4 a4                 tst8	r4
 d0 0e                 breq8	avm_test_main+456
 f7 0f                 ld8u	r7, [r5+]
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 33                    cmp	r4, r7
 d0 f2                 breq8	avm_test_main+438
 c0 02                 ldi8	r4, 0x2
 f9 31                 or	r1, r4
 f0 39 12              stsp16	[sp+0x12], r1
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
 f0 14 3c              leasp	r4, 0x3c
 f4 40                 stsp16	[sp+0x0], r4
 e1 5b 0a              call16	call_vsnprintf
 d6 1c                 adjsp	0x1c
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 23                 cmp	r4, r3
 f4 30                 ldsp16	r4, [sp+0xc]
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+659
 f0 17 20              leasp	r7, 0x20
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+646
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 37                 cmpi.s8	r4, 0x37
 f0 01 04              ldi8	r1, 0x4
 d1 1a                 brne8	avm_test_main+703
 ce 2b                 cmpi.s8	r6, 0x2b
 d1 16                 brne8	avm_test_main+703
 c3 2b                 ldi8	r7, 0x2b
 c5 88 01              ldi16	r5, 0x188
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+711
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+689
 f0 34 12              ldsp16	r4, [sp+0x12]
 f9 85                 or	r4, r1
 f0 3c 12              stsp16	[sp+0x12], r4
 d6 eb                 adjsp	-0x15
 c4 e2 0f              ldi16	r4, 0xfe2
 c1 00                 ldi8	r5, 0x0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 2d 14              stsp8	[sp+0x14], r5
 f0 39 10              stsp16	[sp+0x10], r1
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
 f0 14 35              leasp	r4, 0x35
 f4 40                 stsp16	[sp+0x0], r4
 e1 70 09              call16	call_vsnprintf
 d6 15                 adjsp	0x15
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 23                 cmp	r4, r3
 f4 30                 ldsp16	r4, [sp+0xc]
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+894
 f0 17 20              leasp	r7, 0x20
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+881
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 14                 cmpi.s8	r4, 0x14
 f0 02 08              ldi8	r2, 0x8
 f0 31 12              ldsp16	r1, [sp+0x12]
 d1 1a                 brne8	avm_test_main+941
 ce 61                 cmpi.s8	r6, 0x61
 d1 16                 brne8	avm_test_main+941
 c3 61                 ldi8	r7, 0x61
 c5 d7 01              ldi16	r5, 0x1d7
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 0f                 breq8	avm_test_main+946
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+927
 f9 29                 or	r1, r2
 f0 39 12              stsp16	[sp+0x12], r1
 f2 39                 sub	r1, r1
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 5a a5              ldi16	r4, 0xa55a
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 69              ldi16	r5, 0x69a5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 d6 f8                 adjsp	-0x8
 c4 39 30              ldi16	r4, 0x3039
 f4 58                 stsp16	[sp+0x6], r4
 c4 eb 01              ldi16	r4, 0x1eb
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 14 1f              leasp	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 e1 86 08              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 02 0f              ldi8	r2, 0xf
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 23                 cmp	r4, r3
 f4 30                 ldsp16	r4, [sp+0xc]
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 17              ldsp8u	r6, [sp+0x17]
 f4 a6                 tst8	r6
 d0 38                 breq8	avm_test_main+1170
 f0 17 18              leasp	r7, 0x18
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f7 1c                 ld8u	r4, [r7+]
 f4 a4                 tst8	r4
 d1 f6                 brne8	avm_test_main+1118
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 47                 brne8	avm_test_main+1214
 ce 61                 cmpi.s8	r6, 0x61
 d1 26                 brne8	avm_test_main+1185
 c2 61                 ldi8	r6, 0x61
 c4 f6 01              ldi16	r4, 0x1f6
 f0 15 18              leasp	r5, 0x18
 f4 a6                 tst8	r6
 f8 01                 cset.eq	r1
 d0 18                 breq8	avm_test_main+1185
 f7 07                 ld8u	r7, [r4+]
 f7 0e                 ld8u	r6, [r5+]
 3b                    cmp	r6, r7
 d0 f3                 breq8	avm_test_main+1155
 d4 0f                 jmp8	avm_test_main+1185
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 1d                 brne8	avm_test_main+1214
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 f0 1d 1e              ldsp8u	r5, [sp+0x1e]
 f0 1e 16              ldsp8u	r6, [sp+0x16]
 f4 a1                 tst8	r1
 d0 10                 breq8	avm_test_main+1214
 f1 76                 zext8	r6
 ce 5a                 cmpi.s8	r6, 0x5a
 d1 0a                 brne8	avm_test_main+1214
 f4 a5                 tst8	r5
 d1 06                 brne8	avm_test_main+1214
 f1 74                 zext8	r4
 cc 69                 cmpi.s8	r4, 0x69
 d0 09                 breq8	avm_test_main+1223
 c0 10                 ldi8	r4, 0x10
 f0 35 12              ldsp16	r5, [sp+0x12]
 94                    or	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 fa                 adjsp	-0x6
 c4 fd 01              ldi16	r4, 0x1fd
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 1a              leasp	r4, 0x1a
 f4 40                 stsp16	[sp+0x0], r4
 e1 8f 07              call16	call_vsnprintf
 d6 06                 adjsp	0x6
 04                    mov	r5, r4
 08                    mov	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 ca 37                 addi.s8	r6, 0x37
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 23                 cmp	r4, r3
 f4 30                 ldsp16	r4, [sp+0xc]
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
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 19 14              ldsp8u	r1, [sp+0x14]
 f4 a1                 tst8	r1
 d0 12                 breq8	avm_test_main+1377
 f0 16 14              leasp	r6, 0x14
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1364
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 1a 15              ldsp8u	r2, [sp+0x15]
 d6 f8                 adjsp	-0x8
 c4 d2 04              ldi16	r4, 0x4d2
 f4 58                 stsp16	[sp+0x6], r4
 c4 03 02              ldi16	r4, 0x203
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 ee 06              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 08                    mov	r6, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f0 00 30              ldi8	r0, 0x30
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f1 77                 zext8	r7
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 c9 37                 addi.s8	r5, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f4 30                 ldsp16	r4, [sp+0xc]
 f5 23                 cmp	r4, r3
 f4 28                 ldsp16	r4, [sp+0xa]
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
 f4 38                 ldsp16	r4, [sp+0xe]
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
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 e1 6e 06              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
 c3 20                 ldi8	r7, 0x20
 f0 36 12              ldsp16	r6, [sp+0x12]
 9e                    or	r7, r6
 f1 72                 zext8	r2
 f0 0e 79              cmpi.s8	r2, 0x79
 f0 02 0f              ldi8	r2, 0xf
 07                    mov	r5, r7
 fb 2e                 cmov.eq	r5, r6
 f4 a1                 tst8	r1
 0b                    mov	r6, r7
 fb 35                 cmov.eq	r6, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 cd 05                 cmpi.s8	r5, 0x5
 fb 3e                 cmov.eq	r7, r6
 f0 01 40              ldi8	r1, 0x40
 f9 3d                 or	r1, r7
 f4 31                 ldsp16	r5, [sp+0xc]
 cd 09                 cmpi.s8	r5, 0x9
 fb 0f                 cmov.eq	r1, r7
 04                    mov	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 0d                    mov	r7, r5
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 ca 37                 addi.s8	r6, 0x37
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 23                 cmp	r4, r3
 f0 34 12              ldsp16	r4, [sp+0x12]
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
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+1702
 f0 17 20              leasp	r7, 0x20
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1689
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 d1 1a                 brne8	avm_test_main+1742
 ce 62                 cmpi.s8	r6, 0x62
 d1 16                 brne8	avm_test_main+1742
 c2 62                 ldi8	r6, 0x62
 c4 1c 02              ldi16	r4, 0x21c
 f0 15 20              leasp	r5, 0x20
 f4 a6                 tst8	r6
 d0 0e                 breq8	avm_test_main+1746
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+1728
 c0 80                 ldi8	r4, 0x80
 f9 31                 or	r1, r4
 f0 39 0c              stsp16	[sp+0xc], r1
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 f8                 adjsp	-0x8
 c4 23 02              ldi16	r4, 0x223
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 1c              leasp	r4, 0x1c
 f4 40                 stsp16	[sp+0x0], r4
 e1 7f 05              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 0b                    mov	r6, r7
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 0b                    mov	r6, r7
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 7a                 stsp16	[sp+0xe], r6
 fa 9c                 lsr16i	r6, 0xc
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f9 81                 or	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 39                 ldsp16	r5, [sp+0xe]
 34                    cmp	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
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
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 f0 1f 14              ldsp8u	r7, [sp+0x14]
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+1912
 f0 16 14              leasp	r6, 0x14
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1899
 f4 6b                 stsp16	[sp+0xa], r7
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 f4 58                 stsp16	[sp+0x6], r4
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 c4 2b 02              ldi16	r4, 0x22b
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 f2 39                 sub	r1, r1
 e1 ce 04              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 08                    mov	r6, r4
 f0 1c 21              ldsp8u	r4, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 f1 19                 mov	r3, r1
 d1 70                 brne8	avm_test_main+2080
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 f1 19                 mov	r3, r1
 d1 68                 brne8	avm_test_main+2080
 c4 00 01              ldi16	r4, 0x100
 c5 00 a0              ldi16	r5, 0xa000
 31                    cmp	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 34                    cmp	r5, r4
 f1 19                 mov	r3, r1
 d1 50                 brne8	avm_test_main+2080
 c4 00 01              ldi16	r4, 0x100
 fa 78                 lsr16i	r4, 0x8
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 23              ldsp8u	r5, [sp+0x23]
 34                    cmp	r5, r4
 f1 19                 mov	r3, r1
 d1 37                 brne8	avm_test_main+2080
 c4 00 01              ldi16	r4, 0x100
 f1 74                 zext8	r4
 c1 a0                 ldi8	r5, 0xa0
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 24              ldsp8u	r5, [sp+0x24]
 34                    cmp	r5, r4
 f1 19                 mov	r3, r1
 d1 1e                 brne8	avm_test_main+2080
 c4 00 01              ldi16	r4, 0x100
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 25              ldsp8u	r5, [sp+0x25]
 34                    cmp	r5, r4
 f1 19                 mov	r3, r1
 d1 07                 brne8	avm_test_main+2080
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 f4 a4                 tst8	r4
 f8 03                 cset.eq	r3
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 c0 0f                 ldi8	r4, 0xf
 8c                    and	r7, r4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f1 10                 mov	r2, r0
 f1 01                 mov	r0, r1
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 f1 08                 mov	r1, r0
 f1 02                 mov	r0, r2
 fc 3c                 cmov.ult	r7, r4
 f4 62                 stsp16	[sp+0x8], r6
 fa 98                 lsr16i	r6, 0x8
 c0 0f                 ldi8	r4, 0xf
 88                    and	r6, r4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 56                 ldi8	r4, 0x56
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 3b 04              stsp16	[sp+0x4], r3
 f9 61                 or	r3, r0
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f5                 adjsp	-0xb
 c4 34 12              ldi16	r4, 0x1234
 f4 64                 stsp16	[sp+0x9], r4
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c4 2e 02              ldi16	r4, 0x22e
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 2b              leasp	r4, 0x2b
 f4 40                 stsp16	[sp+0x0], r4
 e1 a6 03              call16	call_vsnprintf
 d6 0b                 adjsp	0xb
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 1c 21              ldsp8u	r4, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 f1 11                 mov	r2, r1
 db c6 00              brne16	avm_test_main+2465
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 f1 11                 mov	r2, r1
 db bd 00              brne16	avm_test_main+2465
 c1 f0                 ldi8	r5, 0xf0
 c3 00                 ldi8	r7, 0x0
 8d                    and	r7, r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 38                    cmp	r6, r4
 f1 11                 mov	r2, r1
 db a2 00              brne16	avm_test_main+2465
 c1 00                 ldi8	r5, 0x0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 23              ldsp8u	r6, [sp+0x23]
 38                    cmp	r6, r4
 f1 11                 mov	r2, r1
 db 89 00              brne16	avm_test_main+2465
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 c6 00 a0              ldi16	r6, 0xa000
 32                    cmp	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 24              ldsp8u	r6, [sp+0x24]
 38                    cmp	r6, r4
 f1 11                 mov	r2, r1
 d1 6f                 brne8	avm_test_main+2465
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 fa 78                 lsr16i	r4, 0x8
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 25              ldsp8u	r6, [sp+0x25]
 38                    cmp	r6, r4
 f1 11                 mov	r2, r1
 d1 54                 brne8	avm_test_main+2465
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 f1 74                 zext8	r4
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 38                    cmp	r6, r4
 f1 11                 mov	r2, r1
 d1 39                 brne8	avm_test_main+2465
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 28              ldsp8u	r6, [sp+0x28]
 f0 1f 27              ldsp8u	r7, [sp+0x27]
 3c                    cmp	r7, r4
 f1 11                 mov	r2, r1
 d1 1d                 brne8	avm_test_main+2465
 f1 76                 zext8	r6
 ce 7c                 cmpi.s8	r6, 0x7c
 f1 11                 mov	r2, r1
 d1 15                 brne8	avm_test_main+2465
 c2 7c                 ldi8	r6, 0x7c
 c4 35 02              ldi16	r4, 0x235
 f0 15 29              leasp	r5, 0x29
 f4 a6                 tst8	r6
 f8 02                 cset.eq	r2
 d0 07                 breq8	avm_test_main+2465
 f7 07                 ld8u	r7, [r4+]
 f7 0e                 ld8u	r6, [r5+]
 3b                    cmp	r6, r7
 d0 f3                 breq8	avm_test_main+2452
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 32                    cmp	r4, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 26                 mov	r5, r2
 f9 a1                 or	r5, r0
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f6                 adjsp	-0xa
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 f4 5c                 stsp16	[sp+0x7], r4
 f1 55                 stsp8	[sp+0x9], r5
 c4 f7 0f              ldi16	r4, 0xff7
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 e1 42 02              call16	call_vsnprintf_P
 d6 0a                 adjsp	0xa
 f0 1e 21              ldsp8u	r6, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 db c1 00              brne16	avm_test_main+2839
 f1 76                 zext8	r6
 ce 78                 cmpi.s8	r6, 0x78
 f2 39                 sub	r1, r1
 db b2 00              brne16	avm_test_main+2833
 c1 f0                 ldi8	r5, 0xf0
 c3 00                 ldi8	r7, 0x0
 8d                    and	r7, r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 38                    cmp	r6, r4
 f0 07 00 a0           ldi16	r3, 0xa000
 db 95 00              brne16	avm_test_main+2833
 c1 00                 ldi8	r5, 0x0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 23              ldsp8u	r6, [sp+0x23]
 38                    cmp	r6, r4
 d1 7f                 brne8	avm_test_main+2833
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 f5 23                 cmp	r4, r3
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 24              ldsp8u	r6, [sp+0x24]
 38                    cmp	r6, r4
 d1 69                 brne8	avm_test_main+2833
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 fa 78                 lsr16i	r4, 0x8
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 25              ldsp8u	r6, [sp+0x25]
 38                    cmp	r6, r4
 d1 50                 brne8	avm_test_main+2833
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 f1 74                 zext8	r4
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 38                    cmp	r6, r4
 d1 37                 brne8	avm_test_main+2833
 c4 b8 0f              ldi16	r4, 0xfb8
 c1 00                 ldi8	r5, 0x0
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1b 29              ldsp8u	r3, [sp+0x29]
 f0 1f 28              ldsp8u	r7, [sp+0x28]
 f0 1e 27              ldsp8u	r6, [sp+0x27]
 38                    cmp	r6, r4
 d1 1a                 brne8	avm_test_main+2833
 f1 10                 mov	r2, r0
 f1 77                 zext8	r7
 cf 20                 cmpi.s8	r7, 0x20
 f4 19                 ldsp16	r5, [sp+0x6]
 d1 1c                 brne8	avm_test_main+2845
 f1 73                 zext8	r3
 f0 0f 20              cmpi.s8	r3, 0x20
 d1 15                 brne8	avm_test_main+2845
 f0 1c 2a              ldsp8u	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 f8 01                 cset.eq	r1
 d4 0c                 jmp8	avm_test_main+2845
 f1 10                 mov	r2, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 d4 06                 jmp8	avm_test_main+2845
 f1 10                 mov	r2, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 39                 sub	r1, r1
 c4 00 01              ldi16	r4, 0x100
 f4 32                 ldsp16	r6, [sp+0xc]
 92                    or	r4, r6
 f1 75                 zext8	r5
 cd 79                 cmpi.s8	r5, 0x79
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 cd ff                 cmpi.s8	r5, -0x1
 fb 26                 cmov.eq	r4, r6
 c5 00 02              ldi16	r5, 0x200
 94                    or	r5, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 06                 cmpi.s8	r6, 0x6
 fb 2c                 cmov.eq	r5, r4
 c4 00 04              ldi16	r4, 0x400
 91                    or	r4, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 fb 2c                 cmov.eq	r5, r4
 c4 00 08              ldi16	r4, 0x800
 91                    or	r4, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 ce 0d                 cmpi.s8	r6, 0xd
 fb 25                 cmov.eq	r4, r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 f1 77                 zext8	r7
 f0 03 a0              ldi8	r3, 0xa0
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f1 01                 mov	r0, r1
 f1 0a                 mov	r1, r2
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 c5 00 10              ldi16	r5, 0x1000
 94                    or	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 fb 6c                 cmov.ne	r5, r4
 c4 00 20              ldi16	r4, 0x2000
 91                    or	r4, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 ce 0a                 cmpi.s8	r6, 0xa
 fb 25                 cmov.eq	r4, r5
 c5 00 40              ldi16	r5, 0x4000
 94                    or	r5, r4
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 7b                 stsp16	[sp+0xe], r7
 06                    mov	r5, r6
 c3 0f                 ldi8	r7, 0xf
 f1 17                 mov	r2, r7
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 37 12              ldsp16	r7, [sp+0x12]
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f4 5b                 stsp16	[sp+0x6], r7
 f0 37 12              ldsp16	r7, [sp+0x12]
 f5 2f                 cmp	r7, r3
 f4 1b                 ldsp16	r7, [sp+0x6]
 fc 3c                 cmov.ult	r7, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 d7 00                 sys	debug_putc
 f9 05                 or	r0, r1
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
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
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d6 70                 adjsp	0x70
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
 f4 36                 ldsp16	r6, [sp+0xd]
 f3 7f                 ldsp8u	r7, [sp+0xf]
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 10 10              leasp	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 c1 50                 ldi8	r5, 0x50
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
