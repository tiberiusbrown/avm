
codegen_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_integer.c
00000577 l     F .text	00000085 mix_u16
00000616 l     F .text	000000dd mix_u32
00000100 l     O .data	00000003 .L.str
00000103 l     O .data	00000003 .L.str.1
000005fc l     F .text	0000001a mix_s16
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
00000000 l    df *ABS*	00000000 runtime.c
000006f5 l       .init_array	00000000 .hidden __init_array_end
000006f5 l       .init_array	00000000 .hidden __init_array_start
000006f5 l       .fini_array	00000000 .hidden __fini_array_start
000006f5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002a0 avm_test_main
000006f3 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 d5 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f5 06              ldi16	r4, 0x6f5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 06              ldi16	r6, 0x6f5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f5 06           ldi16	r0, 0x6f5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f5 06           ldi16	r2, 0x6f5
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
 c4 f5 06              ldi16	r4, 0x6f5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 06              ldi16	r6, 0x6f5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f5 06           ldi16	r2, 0x6f5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f5 06           ldi16	r0, 0x6f5
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
 d6 da                 adjsp	-0x26
 c4 e1 ac              ldi16	r4, 0xace1
 f0 3c 24              stsp16	[sp+0x24], r4
 c4 57 13              ldi16	r4, 0x1357
 f0 3c 22              stsp16	[sp+0x22], r4
 c4 60 a4              ldi16	r4, 0xa460
 f0 3c 20              stsp16	[sp+0x20], r4
 c4 3d 01              ldi16	r4, 0x13d
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 22              ldsp16	r5, [sp+0x22]
 e1 61 02              call16	mix_u16
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 70                 stsp16	[sp+0xc], r4
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 e1 e7 02              call16	mix_u32
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 49                 ldi8	r4, 0x49
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+98
 f4 22                 ldsp16	r6, [sp+0x8]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 02 30              ldi8	r2, 0x30
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f5 23                 cmp	r4, r3
 fc 3d                 cmov.ult	r7, r5
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 03 0f              ldi8	r3, 0xf
 06                    mov	r5, r6
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 49                 ldi8	r4, 0x49
 c7 04 01              ldi16	r7, 0x104
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+206
 f4 30                 ldsp16	r4, [sp+0xc]
 f1 25                 mov	r5, r1
 e1 45 02              call16	mix_s16
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 08                    mov	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 fa 9c                 lsr16i	r6, 0xc
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f9 89                 or	r4, r2
 f0 3c 12              stsp16	[sp+0x12], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 49                 ldi8	r4, 0x49
 c7 07 01              ldi16	r7, 0x107
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+327
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 31                 ldsp16	r5, [sp+0xc]
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 f4 68                 stsp16	[sp+0xa], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 29                 ldsp16	r5, [sp+0xa]
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c2 f0                 ldi8	r6, 0xf0
 f9 c0                 and	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 ac                 and	r5, r3
 f9 55                 or	r2, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2a                 cmov.ult	r5, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 49                 ldi8	r4, 0x49
 c7 0a 01              ldi16	r7, 0x10a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+594
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c4 2e a9              ldi16	r4, 0xa92e
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 c6 84              ldi16	r5, 0x84c6
 f4 22                 ldsp16	r6, [sp+0x8]
 39                    cmp	r6, r5
 f8 08                 cset.ne	r0
 f9 11                 or	r0, r4
 c6 ed e0              ldi16	r6, 0xe0ed
 c7 ca b1              ldi16	r7, 0xb1ca
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 f9 81                 or	r4, r0
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_u16>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 af                    xor	r7, r7
 f0 00 0b              ldi8	r0, 0xb
 c2 25                 ldi8	r6, 0x25
 f4 42                 stsp16	[sp+0x0], r6
 f0 01 fe              ldi8	r1, 0xfe
 f0 02 01              ldi8	r2, 0x1
 0b                    mov	r6, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f4 2b                 ldsp16	r7, [sp+0xa]
 2e                    sub	r7, r6
 f9 e4                 and	r7, r1
 f4 8f                 lsr16.1	r7
 1e                    add	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 0d                    mov	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f9 e9                 or	r7, r2
 08                    mov	r6, r4
 ec 37                 udiv16	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 fe 37                 mul16	r6, r7
 04                    mov	r5, r4
 26                    sub	r5, r6
 c2 1f                 ldi8	r6, 0x1f
 fe 2e                 mul16	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 c2 05                 ldi8	r6, 0x5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 82                 lsr16i	r5, 0x2
 c2 07                 ldi8	r6, 0x7
 f3 16                 mulu8.w	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 c2 11                 ldi8	r6, 0x11
 f4 19                 ldsp16	r5, [sp+0x6]
 fe 2e                 mul16	r5, r6
 f4 59                 stsp16	[sp+0x6], r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 11                 ldsp16	r5, [sp+0x4]
 2d                    sub	r7, r5
 c1 0f                 ldi8	r5, 0xf
 a7                    xor	r5, r7
 f4 af                 inc16	r7
 f1 77                 zext8	r7
 08                    mov	r6, r4
 fa 0b                 shl16v	r6, r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 75                 zext8	r5
 fa 11                 lsr16v	r4, r5
 92                    or	r4, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 af                 inc16	r7
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 03                 addi.s8	r6, 0x3
 04                    mov	r5, r4
 a6                    xor	r5, r6
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 95                 brne8	mix_u16+19
 02                    mov	r4, r6
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<mix_s16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 0c                    mov	r7, r4
 ec b8                 sdiv16	r7, r0
 c6 01 01              ldi16	r6, 0x101
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 08                    mov	r6, r4
 fa d3                 asr16i	r6, 0x3
 a9                    xor	r6, r5
 fe 38                 mul16	r7, r0
 23                    sub	r4, r7
 c1 11                 ldi8	r5, 0x11
 fe 25                 mul16	r4, r5
 a2                    xor	r4, r6
 b8                    pop16	r0
 ef                    ret

<mix_u32>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 67                 mov32	q1, q3
 c2 07                 ldi8	r6, 0x7
 f0 04 b9 79           ldi16	r0, 0x79b9
 f0 05 37 9e           ldi16	r1, 0x9e37
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 62                 stsp16	[sp+0x8], r6
 f7 69                 add32	q2, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 55                 lsl16i	r6, 0x5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 fa 7b                 lsr16i	r4, 0xb
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 92                    or	r4, r6
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 fa 55                 lsl16i	r6, 0x5
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 64                 add32	q1, q0
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 39                 lsl16i	r4, 0x9
 f4 11                 ldsp16	r5, [sp+0x4]
 91                    or	r4, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 77                 lsr16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 fa 97                 lsr16i	r6, 0x7
 f4 52                 stsp16	[sp+0x4], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 0e                    mov	r7, r6
 fa 69                 lsl16i	r7, 0x9
 f4 12                 ldsp16	r6, [sp+0x4]
 9e                    or	r7, r6
 aa                    xor	r6, r6
 fa 39                 lsl16i	r4, 0x9
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 77                 lsr16i	r4, 0x7
 a5                    xor	r5, r5
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 fa 93                 lsr16i	r6, 0x3
 f4 52                 stsp16	[sp+0x4], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 5d                 lsl16i	r6, 0xd
 f4 13                 ldsp16	r7, [sp+0x4]
 9b                    or	r6, r7
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 93                 lsr16i	r6, 0x3
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 db 48 ff              brne16	mix_u32+24
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f2 69                 mov32	q2, q1
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
