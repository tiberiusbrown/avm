
data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 data_model.c
000005f7 l     F .text	0000001f is_binary32_one
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
0000061d l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000620 l       .init_array	00000000 .hidden __init_array_end
00000620 l       .init_array	00000000 .hidden __init_array_start
00000620 l       .fini_array	00000000 .hidden __fini_array_start
00000620 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000320 avm_test_main
00000616 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000618 g     F .text	00000005 memcpy

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 f8 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 20 06              ldi16	r4, 0x620
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 06              ldi16	r6, 0x620
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 20 06           ldi16	r0, 0x620
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 20 06           ldi16	r2, 0x620
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 20 06              ldi16	r4, 0x620
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 06              ldi16	r6, 0x620
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 20 06           ldi16	r2, 0x620
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 20 06           ldi16	r0, 0x620
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a8                 adjsp	-0x58
 f0 00 9b              ldi8	r0, 0x9b
 f0 28 57              stsp8	[sp+0x57], r0
 c3 f1                 ldi8	r7, 0xf1
 f0 2f 56              stsp8	[sp+0x56], r7
 c6 60 a4              ldi16	r6, 0xa460
 f0 3e 54              stsp16	[sp+0x54], r6
 f0 06 eb 32           ldi16	r2, 0x32eb
 f0 07 a4 f8           ldi16	r3, 0xf8a4
 f0 3a 50              stsp16	[sp+0x50], r2
 f0 3b 52              stsp16	[sp+0x52], r3
 c4 a9 cb              ldi16	r4, 0xcba9
 c5 ed ff              ldi16	r5, 0xffed
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 c4 22 43              ldi16	r4, 0x4322
 c5 65 87              ldi16	r5, 0x8765
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 3d 46              stsp16	[sp+0x46], r5
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 f5 20                 cmp	r4, r0
 d1 0b                 brne8	avm_test_main+103
 f0 24 57              ldsp8s	r4, [sp+0x57]
 f4 a4                 tst8	r4
 d3 0d                 brslt8	avm_test_main+112
 c0 5d                 ldi8	r4, 0x5d
 d4 02                 jmp8	avm_test_main+105
 c0 5c                 ldi8	r4, 0x5c
 d6 58                 adjsp	0x58
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 33                    cmp	r4, r7
 d1 6e                 brne8	avm_test_main+228
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 c1 c9                 ldi8	r5, 0xc9
 31                    cmp	r4, r5
 d2 6a                 brult8	avm_test_main+232
 f0 34 54              ldsp16	r4, [sp+0x54]
 32                    cmp	r4, r6
 d1 69                 brne8	avm_test_main+237
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 f0 69 84              cmp32	q2, q1
 d1 63                 brne8	avm_test_main+242
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 f0 35 4e              ldsp16	r5, [sp+0x4e]
 c6 a9 cb              ldi16	r6, 0xcba9
 c7 ed ff              ldi16	r7, 0xffed
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 f0 04 22 43           ldi16	r0, 0x4322
 f0 05 65 87           ldi16	r1, 0x8765
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 98                    or	r6, r4
 9d                    or	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 3d                 brne8	avm_test_main+247
 c4 56 34              ldi16	r4, 0x3456
 c1 12                 ldi8	r5, 0x12
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 de bc              ldi16	r4, 0xbcde
 c5 9a 78              ldi16	r5, 0x789a
 f0 32 48              ldsp16	r2, [sp+0x48]
 f0 33 4a              ldsp16	r3, [sp+0x4a]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 69 40              cmp32	q1, q0
 d1 1c                 brne8	avm_test_main+252
 c0 63                 ldi8	r4, 0x63
 d4 85                 jmp8	avm_test_main+105
 c0 5e                 ldi8	r4, 0x5e
 d4 81                 jmp8	avm_test_main+105
 c0 5f                 ldi8	r4, 0x5f
 e0 7c ff              jmp16	avm_test_main+105
 c0 60                 ldi8	r4, 0x60
 e0 77 ff              jmp16	avm_test_main+105
 c0 61                 ldi8	r4, 0x61
 e0 72 ff              jmp16	avm_test_main+105
 c0 62                 ldi8	r4, 0x62
 e0 6d ff              jmp16	avm_test_main+105
 f0 34 44              ldsp16	r4, [sp+0x44]
 f0 35 46              ldsp16	r5, [sp+0x46]
 c6 98 ba              ldi16	r6, 0xba98
 c7 dc fe              ldi16	r7, 0xfedc
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 37 42              ldsp16	r7, [sp+0x42]
 f0 06 10 32           ldi16	r2, 0x3210
 f0 07 54 76           ldi16	r3, 0x7654
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 69 c0              cmp32	q3, q0
 d1 2c                 brne8	avm_test_main+335
 c4 67 45              ldi16	r4, 0x4567
 c5 23 01              ldi16	r5, 0x123
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 f0 32 40              ldsp16	r2, [sp+0x40]
 f0 33 42              ldsp16	r3, [sp+0x42]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 69 40              cmp32	q1, q0
 d1 0a                 brne8	avm_test_main+340
 c0 65                 ldi8	r4, 0x65
 e0 1a ff              jmp16	avm_test_main+105
 c0 64                 ldi8	r4, 0x64
 e0 15 ff              jmp16	avm_test_main+105
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 3a 3c              stsp16	[sp+0x3c], r2
 f0 3b 3e              stsp16	[sp+0x3e], r3
 f0 3a 38              stsp16	[sp+0x38], r2
 f0 3b 3a              stsp16	[sp+0x3a], r3
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 ff c8 4d              fcmp	r4, q3, q1
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f6 2c                 tst16	r4
 d1 54                 brne8	avm_test_main+491
 ff c8 41              fcmp	r4, q0, q1
 f6 2c                 tst16	r4
 d1 52                 brne8	avm_test_main+496
 ff c8 4d              fcmp	r4, q3, q1
 f6 2c                 tst16	r4
 d1 50                 brne8	avm_test_main+501
 f0 14 30              leasp	r4, 0x30
 e1 75 01              call16	is_binary32_one
 f4 a4                 tst8	r4
 d0 4b                 breq8	avm_test_main+506
 f0 14 2c              leasp	r4, 0x2c
 e1 6b 01              call16	is_binary32_one
 f4 a4                 tst8	r4
 d0 46                 breq8	avm_test_main+511
 f0 14 28              leasp	r4, 0x28
 e1 61 01              call16	is_binary32_one
 f4 a4                 tst8	r4
 d0 41                 breq8	avm_test_main+516
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 3e 25              stsp16	[sp+0x25], r6
 f0 2f 27              stsp8	[sp+0x27], r7
 f0 14 25              leasp	r4, 0x25
 f0 3c 23              stsp16	[sp+0x23], r4
 c6 1d 06              ldi16	r6, 0x61d
 c3 00                 ldi8	r7, 0x0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 2f 22              stsp8	[sp+0x22], r7
 f0 35 23              ldsp16	r5, [sp+0x23]
 34                    cmp	r5, r4
 d0 23                 breq8	avm_test_main+521
 c0 78                 ldi8	r4, 0x78
 e0 7e fe              jmp16	avm_test_main+105
 c0 6e                 ldi8	r4, 0x6e
 e0 79 fe              jmp16	avm_test_main+105
 c0 6f                 ldi8	r4, 0x6f
 e0 74 fe              jmp16	avm_test_main+105
 c0 70                 ldi8	r4, 0x70
 e0 6f fe              jmp16	avm_test_main+105
 c0 71                 ldi8	r4, 0x71
 e0 6a fe              jmp16	avm_test_main+105
 c0 72                 ldi8	r4, 0x72
 e0 65 fe              jmp16	avm_test_main+105
 c0 73                 ldi8	r4, 0x73
 e0 60 fe              jmp16	avm_test_main+105
 f0 34 23              ldsp16	r4, [sp+0x23]
 ed 88 22              ld8u	r4, [r4+2]
 cc 65                 cmpi.s8	r4, 0x65
 d1 17                 brne8	avm_test_main+554
 c4 1d 06              ldi16	r4, 0x61d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 1f 22              ldsp8u	r7, [sp+0x22]
 f0 69 c8              cmp32	q3, q2
 d0 0a                 breq8	avm_test_main+559
 c0 7a                 ldi8	r4, 0x7a
 e0 3f fe              jmp16	avm_test_main+105
 c0 79                 ldi8	r4, 0x79
 e0 3a fe              jmp16	avm_test_main+105
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 1f 22              ldsp8u	r7, [sp+0x22]
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 cc 34                 cmpi.s8	r4, 0x34
 db ca 00              brne16	avm_test_main+780
 f0 44 03 01           ldm8u	r4, [0x103]
 f0 2c 1f              stsp8	[sp+0x1f], r4
 f0 44 04 01           ldm8u	r4, [0x104]
 f0 2c 1e              stsp8	[sp+0x1e], r4
 f0 44 05 01           ldm8u	r4, [0x105]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 f0 44 06 01           ldm8u	r4, [0x106]
 f0 2c 1c              stsp8	[sp+0x1c], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f0 44 08 01           ldm8u	r4, [0x108]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f0 54 09 01           ldm16	r4, [0x109]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f0 2c 17              stsp8	[sp+0x17], r4
 f0 14 08              leasp	r4, 0x8
 c5 0c 01              ldi16	r5, 0x10c
 c2 09                 ldi8	r6, 0x9
 e1 bc 00              call16	memcpy
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 cc 11                 cmpi.s8	r4, 0x11
 db 84 00              brne16	avm_test_main+785
 c0 83                 ldi8	r4, 0x83
 f0 1d 1e              ldsp8u	r5, [sp+0x1e]
 cd 33                 cmpi.s8	r5, 0x33
 db d2 fd              brne16	avm_test_main+105
 f0 1d 1d              ldsp8u	r5, [sp+0x1d]
 cd 22                 cmpi.s8	r5, 0x22
 db ca fd              brne16	avm_test_main+105
 c0 84                 ldi8	r4, 0x84
 f0 1d 1c              ldsp8u	r5, [sp+0x1c]
 cd 55                 cmpi.s8	r5, 0x55
 db c0 fd              brne16	avm_test_main+105
 f0 1d 1b              ldsp8u	r5, [sp+0x1b]
 cd 44                 cmpi.s8	r5, 0x44
 db b8 fd              brne16	avm_test_main+105
 c0 85                 ldi8	r4, 0x85
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 c2 99                 ldi8	r6, 0x99
 36                    cmp	r5, r6
 db ad fd              brne16	avm_test_main+105
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 cd 66                 cmpi.s8	r5, 0x66
 db a5 fd              brne16	avm_test_main+105
 c4 34 12              ldi16	r4, 0x1234
 f4 58                 stsp16	[sp+0x6], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 d1 48                 brne8	avm_test_main+790
 f0 54 15 01           ldm16	r4, [0x115]
 f4 50                 stsp16	[sp+0x4], r4
 c0 07                 ldi8	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 c0 91                 ldi8	r4, 0x91
 cd 05                 cmpi.s8	r5, 0x5
 db 89 fd              brne16	avm_test_main+105
 c1 f8                 ldi8	r5, 0xf8
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c1 88                 ldi8	r5, 0x88
 39                    cmp	r6, r5
 db 7e fd              brne16	avm_test_main+105
 c5 00 ff              ldi16	r5, 0xff00
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c5 00 a5              ldi16	r5, 0xa500
 39                    cmp	r6, r5
 db 71 fd              brne16	avm_test_main+105
 f3 50                 ldsp8u	r4, [sp+0x4]
 c1 8d                 ldi8	r5, 0x8d
 31                    cmp	r4, r5
 d1 1c                 brne8	avm_test_main+795
 c1 a5                 ldi8	r5, 0xa5
 f3 56                 ldsp8u	r6, [sp+0x5]
 c0 93                 ldi8	r4, 0x93
 af                    xor	r7, r7
 39                    cmp	r6, r5
 fb 27                 cmov.eq	r4, r7
 e0 5d fd              jmp16	avm_test_main+105
 c0 7b                 ldi8	r4, 0x7b
 e0 58 fd              jmp16	avm_test_main+105
 c0 82                 ldi8	r4, 0x82
 e0 53 fd              jmp16	avm_test_main+105
 c0 8b                 ldi8	r4, 0x8b
 e0 4e fd              jmp16	avm_test_main+105
 c0 92                 ldi8	r4, 0x92
 e0 49 fd              jmp16	avm_test_main+105

<is_binary32_one>:
 04                    mov	r5, r4
 a0                    xor	r4, r4
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d0 01                 breq8	is_binary32_one+8
 ef                    ret
 ed ca 21              ld8u	r6, [r5+1]
 f4 a6                 tst8	r6
 d1 f8                 brne8	is_binary32_one+7
 ed ca 22              ld8u	r6, [r5+2]
 c3 80                 ldi8	r7, 0x80
 3b                    cmp	r6, r7
 d1 f0                 brne8	is_binary32_one+7
 ed 8a 23              ld8u	r4, [r5+3]
 cc 3f                 cmpi.s8	r4, 0x3f
 f8 04                 cset.eq	r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<memcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret
