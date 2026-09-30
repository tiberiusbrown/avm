
codegen_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_integer.c
000003ad l     F .text	0000006d mix_u16
0000041a l     F .text	00000030 mix_s16
0000044a l     F .text	000000d6 mix_u32
00000520 l     F .text	000000ad comparison_mask
00000100 l     O .data	00000003 .L.str
000005cd l     F .text	0000001d test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
000005ea l     F .text	00000020 test_line32
00000109 l     O .data	00000003 .L.str.3
0000060a l     F .text	00000018 rotate_left16
00000622 l     F .text	0000004d rotate_left32
0000066f l     F .text	00000022 test_puts
00000691 l     F .text	0000000b test_putc
0000069c l     F .text	0000000f test_hex16
000006f0 l     F .text	00000011 test_hex32
000006ab l     F .text	00000019 test_hex8
000006c4 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
0000074b l       .init_array	00000000 .hidden __init_array_end
0000074b l       .init_array	00000000 .hidden __init_array_start
0000074b l       .fini_array	00000000 .hidden __fini_array_start
0000074b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000d6 avm_test_main
00000701 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000703 g     F .text	00000024 __avm_ashlsi3
00000727 g     F .text	00000024 __avm_lshrsi3

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
 e1 e3 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4b 07              ldi16	r4, 0x74b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 4b 07              ldi16	r6, 0x74b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 4b 07           ldi16	r0, 0x74b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4b 07           ldi16	r2, 0x74b
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
 c4 4b 07              ldi16	r4, 0x74b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 4b 07              ldi16	r6, 0x74b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 4b 07           ldi16	r2, 0x74b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4b 07           ldi16	r0, 0x74b
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
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 c4 e1 ac              ldi16	r4, 0xace1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c4 57 13              ldi16	r4, 0x1357
 f0 3c 18              stsp16	[sp+0x18], r4
 c4 60 a4              ldi16	r4, 0xa460
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 3d 01              ldi16	r4, 0x13d
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 18              ldsp16	r5, [sp+0x18]
 c2 0b                 ldi8	r6, 0xb
 e1 99 00              call16	mix_u16
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 14              ldsp16	r5, [sp+0x14]
 e1 fb 00              call16	mix_s16
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e1 1c 01              call16	mix_u32
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 85 ff              ldi16	r4, 0xff85
 c1 4d                 ldi8	r5, 0x4d
 c6 34 12              ldi16	r6, 0x1234
 c7 78 56              ldi16	r7, 0x5678
 e1 e0 01              call16	comparison_mask
 f4 48                 stsp16	[sp+0x2], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 c4 00 01              ldi16	r4, 0x100
 e1 83 02              call16	test_line16
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 03 01              ldi16	r4, 0x103
 e1 7b 02              call16	test_line16
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 c4 06 01              ldi16	r4, 0x106
 e1 8e 02              call16	test_line32
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 09 01              ldi16	r4, 0x109
 e1 69 02              call16	test_line16
 f4 29                 ldsp16	r5, [sp+0xa]
 c0 01                 ldi8	r4, 0x1
 c6 c6 84              ldi16	r6, 0x84c6
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 33                 brne8	avm_test_main+204
 d4 00                 jmp8	avm_test_main+155
 f4 21                 ldsp16	r5, [sp+0x8]
 c0 01                 ldi8	r4, 0x1
 c6 2e a9              ldi16	r6, 0xa92e
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 25                 brne8	avm_test_main+204
 d4 00                 jmp8	avm_test_main+169
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 c0 01                 ldi8	r4, 0x1
 f0 04 ed e0           ldi16	r0, 0xe0ed
 f0 05 ca b1           ldi16	r1, 0xb1ca
 f0 69 c0              cmp32	q3, q0
 f4 40                 stsp16	[sp+0x0], r4
 d1 0e                 brne8	avm_test_main+204
 d4 00                 jmp8	avm_test_main+192
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 6d 85              ldi16	r5, 0x856d
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+204
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<mix_u16>:
 d6 f3                 adjsp	-0xd
 f4 6c                 stsp16	[sp+0xb], r4
 f4 65                 stsp16	[sp+0x9], r5
 f1 52                 stsp8	[sp+0x8], r6
 a0                    xor	r4, r4
 f1 4c                 stsp8	[sp+0x7], r4
 d4 00                 jmp8	mix_u16+13
 f3 5c                 ldsp8u	r4, [sp+0x7]
 f3 61                 ldsp8u	r5, [sp+0x8]
 31                    cmp	r4, r5
 d9 51                 brsge8	mix_u16+101
 d4 00                 jmp8	mix_u16+22
 f4 24                 ldsp16	r4, [sp+0x9]
 c1 01                 ldi8	r5, 0x1
 91                    or	r4, r5
 f4 54                 stsp16	[sp+0x5], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 15                 ldsp16	r5, [sp+0x5]
 ec 25                 udiv16	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 15                 ldsp16	r5, [sp+0x5]
 ec 65                 urem16	r4, r5
 f4 44                 stsp16	[sp+0x1], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 c1 07                 ldi8	r5, 0x7
 ec 65                 urem16	r4, r5
 f4 ac                 inc16	r4
 f1 30                 stsp8	[sp+0x0], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f3 41                 ldsp8u	r5, [sp+0x0]
 e1 1f 02              call16	rotate_left16
 f4 0d                 ldsp16	r5, [sp+0x3]
 c2 11                 ldi8	r6, 0x11
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 05                 ldsp16	r5, [sp+0x1]
 c2 1f                 ldi8	r6, 0x1f
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 6c                 stsp16	[sp+0xb], r4
 f4 24                 ldsp16	r4, [sp+0x9]
 c1 05                 ldi8	r5, 0x5
 fe 25                 mul16	r4, r5
 c8 03                 addi.s8	r4, 0x3
 f4 2d                 ldsp16	r5, [sp+0xb]
 a1                    xor	r4, r5
 f4 64                 stsp16	[sp+0x9], r4
 d4 00                 jmp8	mix_u16+93
 f3 5c                 ldsp8u	r4, [sp+0x7]
 f4 ac                 inc16	r4
 f1 4c                 stsp8	[sp+0x7], r4
 d4 a8                 jmp8	mix_u16+13
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 25                 ldsp16	r5, [sp+0x9]
 a1                    xor	r4, r5
 d6 0d                 adjsp	0xd
 ef                    ret

<mix_s16>:
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 19                 ldsp16	r5, [sp+0x6]
 ec a5                 sdiv16	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 19                 ldsp16	r5, [sp+0x6]
 ec e5                 srem16	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fa b3                 asr16i	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c5 01 01              ldi16	r5, 0x101
 fe 25                 mul16	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 c2 11                 ldi8	r6, 0x11
 fe 2e                 mul16	r5, r6
 a1                    xor	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 a1                    xor	r4, r5
 d6 0a                 adjsp	0xa
 ef                    ret

<mix_u32>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ef                 adjsp	-0x11
 f4 74                 stsp16	[sp+0xd], r4
 f4 7d                 stsp16	[sp+0xf], r5
 f4 66                 stsp16	[sp+0x9], r6
 f4 6f                 stsp16	[sp+0xb], r7
 a0                    xor	r4, r4
 f1 50                 stsp8	[sp+0x8], r4
 d4 00                 jmp8	mix_u32+17
 f3 60                 ldsp8u	r4, [sp+0x8]
 cc 07                 cmpi.s8	r4, 0x7
 df af 00              brsge16	mix_u32+199
 d4 00                 jmp8	mix_u32+26
 f4 26                 ldsp16	r6, [sp+0x9]
 f4 2f                 ldsp16	r7, [sp+0xb]
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 3d                 ldsp16	r5, [sp+0xf]
 f7 6b                 add32	q2, q3
 f4 74                 stsp16	[sp+0xd], r4
 f4 7d                 stsp16	[sp+0xf], r5
 f0 30 0d              ldsp16	r0, [sp+0xd]
 f0 31 0f              ldsp16	r1, [sp+0xf]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f1 28                 mov	r6, r0
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 f1 01                 mov	r0, r1
 f2 39                 sub	r1, r1
 f1 2c                 mov	r7, r0
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 fa 55                 lsl16i	r6, 0x5
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 74                 stsp16	[sp+0xd], r4
 f4 7d                 stsp16	[sp+0xf], r5
 f4 36                 ldsp16	r6, [sp+0xd]
 f4 3f                 ldsp16	r7, [sp+0xf]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 06                    mov	r5, r6
 fa 87                 lsr16i	r5, 0x7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 08                    mov	r6, r4
 fa 59                 lsl16i	r6, 0x9
 96                    or	r5, r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 77                 lsr16i	r4, 0x7
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 74                 stsp16	[sp+0xd], r4
 f4 7d                 stsp16	[sp+0xf], r5
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 3d                 ldsp16	r5, [sp+0xf]
 c2 09                 ldi8	r6, 0x9
 e1 50 01              call16	rotate_left32
 f4 74                 stsp16	[sp+0xd], r4
 f4 7d                 stsp16	[sp+0xf], r5
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 2d                 ldsp16	r5, [sp+0xb]
 c6 b9 79              ldi16	r6, 0x79b9
 c7 37 9e              ldi16	r7, 0x9e37
 f7 6b                 add32	q2, q3
 f4 64                 stsp16	[sp+0x9], r4
 f4 6d                 stsp16	[sp+0xb], r5
 f4 36                 ldsp16	r6, [sp+0xd]
 f4 3f                 ldsp16	r7, [sp+0xf]
 06                    mov	r5, r6
 fa 83                 lsr16i	r5, 0x3
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 08                    mov	r6, r4
 fa 5d                 lsl16i	r6, 0xd
 96                    or	r5, r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 73                 lsr16i	r4, 0x3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 2d                 ldsp16	r5, [sp+0xb]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 64                 stsp16	[sp+0x9], r4
 f4 6d                 stsp16	[sp+0xb], r5
 d4 00                 jmp8	mix_u32+190
 f3 60                 ldsp8u	r4, [sp+0x8]
 f4 ac                 inc16	r4
 f1 50                 stsp8	[sp+0x8], r4
 e0 4a ff              jmp16	mix_u32+17
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 3d                 ldsp16	r5, [sp+0xf]
 f4 26                 ldsp16	r6, [sp+0x9]
 f4 2f                 ldsp16	r7, [sp+0xb]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 d6 11                 adjsp	0x11
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<comparison_mask>:
 d6 ee                 adjsp	-0x12
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 6b                 stsp16	[sp+0xa], r7
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 31                    cmp	r4, r5
 f8 25                 cset.slt	r5
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 31                    cmp	r4, r5
 f8 2d                 cset.sge	r5
 15                    add	r5, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 29                 ldsp16	r5, [sp+0xa]
 31                    cmp	r4, r5
 f8 15                 cset.ult	r5
 15                    add	r5, r5
 15                    add	r5, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 29                 ldsp16	r5, [sp+0xa]
 31                    cmp	r4, r5
 f8 1d                 cset.uge	r5
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 c5 34 12              ldi16	r5, 0x1234
 31                    cmp	r4, r5
 f8 05                 cset.eq	r5
 fa 44                 lsl16i	r5, 0x4
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 78 56              ldi16	r5, 0x5678
 31                    cmp	r4, r5
 f8 0d                 cset.ne	r5
 fa 45                 lsl16i	r5, 0x5
 f4 20                 ldsp16	r4, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 31                    cmp	r4, r5
 d9 09                 brsge8	comparison_mask+117
 d4 00                 jmp8	comparison_mask+110
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 48                 stsp16	[sp+0x2], r4
 d4 06                 jmp8	comparison_mask+123
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	comparison_mask+123
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 28                 ldsp16	r4, [sp+0xa]
 31                    cmp	r4, r5
 d8 08                 bruge8	comparison_mask+142
 d4 00                 jmp8	comparison_mask+136
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 40                 stsp16	[sp+0x0], r4
 d4 06                 jmp8	comparison_mask+148
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	comparison_mask+148
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 a1                    xor	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f3 51                 ldsp8u	r5, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 a1                    xor	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 d6 12                 adjsp	0x12
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 97 00              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 b4 00              call16	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 ba 00              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 e1 aa 00              call16	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<test_line32>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d5 79                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 96 00              call16	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 ee 00              call16	test_hex32
 c0 0a                 ldi8	r4, 0xa
 e1 8a 00              call16	test_putc
 d6 06                 adjsp	0x6
 ef                    ret

<rotate_left16>:
 d6 fd                 adjsp	-0x3
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f4 05                 ldsp16	r5, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 c2 10                 ldi8	r6, 0x10
 2b                    sub	r6, r7
 f1 76                 zext8	r6
 fa 16                 lsr16v	r5, r6
 91                    or	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<rotate_left32>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f1                 adjsp	-0xf
 f4 6c                 stsp16	[sp+0xb], r4
 f4 75                 stsp16	[sp+0xd], r5
 f1 5a                 stsp8	[sp+0xa], r6
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f3 6a                 ldsp8u	r6, [sp+0xa]
 f4 42                 stsp16	[sp+0x0], r6
 af                    xor	r7, r7
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 e1 bc 00              call16	__avm_ashlsi3
 f4 03                 ldsp16	r7, [sp+0x0]
 f2 66                 mov32	q1, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c2 20                 ldi8	r6, 0x20
 2b                    sub	r6, r7
 af                    xor	r7, r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 e1 c7 00              call16	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 92                    or	r4, r6
 97                    or	r5, r7
 d6 0f                 adjsp	0xf
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<test_hex32>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 a2                 call8	test_hex16
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 9e                 call8	test_hex16
 d6 04                 adjsp	0x4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashlsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_ashlsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_ashlsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashlsi3+33
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashlsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_lshrsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_lshrsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_lshrsi3+33
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_lshrsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
