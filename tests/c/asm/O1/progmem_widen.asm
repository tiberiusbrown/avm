
progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_widen.c
000006e8 l     O .rodata	00000060 program_bytes
00000636 l     F .text	00000016 sum_bytes
0000064c l     F .text	0000001e sum_signed_bytes
0000066a l     F .text	00000047 mix_bytes
000006b1 l     F .text	0000001f sum_byte_pairs
00000748 l     O .rodata	00000050 program_words
000006d0 l     F .text	00000016 sum_words
00000100 l     O .data	00000003 .L.str
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000112 l     O .data	00000003 .L.str.6
00000000 l    df *ABS*	00000000 runtime.c
00000798 l       .init_array	00000000 .hidden __init_array_end
00000798 l       .init_array	00000000 .hidden __init_array_start
00000798 l       .fini_array	00000000 .hidden __fini_array_start
00000798 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000035f avm_test_main
000006e6 g     F .text	00000002 avm_halt
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
 e1 c8 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 98 07              ldi16	r4, 0x798
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 98 07              ldi16	r6, 0x798
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 98 07           ldi16	r0, 0x798
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 98 07           ldi16	r2, 0x798
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
 c4 98 07              ldi16	r4, 0x798
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 98 07              ldi16	r6, 0x798
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 98 07           ldi16	r2, 0x798
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 98 07           ldi16	r0, 0x798
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
 d6 e2                 adjsp	-0x1e
 c0 41                 ldi8	r4, 0x41
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c0 25                 ldi8	r4, 0x25
 f0 3c 18              stsp16	[sp+0x18], r4
 c0 29                 ldi8	r4, 0x29
 f0 3c 16              stsp16	[sp+0x16], r4
 c0 17                 ldi8	r4, 0x17
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 21                 ldi8	r4, 0x21
 f0 3c 12              stsp16	[sp+0x12], r4
 c0 11                 ldi8	r4, 0x11
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 e1 29 03              call16	sum_bytes
 f4 70                 stsp16	[sp+0xc], r4
 c4 e9 06              ldi16	r4, 0x6e9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 e1 1a 03              call16	sum_bytes
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 e1 28 03              call16	sum_signed_bytes
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 e1 3e 03              call16	mix_bytes
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 e1 7d 03              call16	sum_byte_pairs
 f4 58                 stsp16	[sp+0x6], r4
 c4 48 07              ldi16	r4, 0x748
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 e1 8d 03              call16	sum_words
 f4 48                 stsp16	[sp+0x2], r4
 c4 4a 07              ldi16	r4, 0x74a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 e1 7e 03              call16	sum_words
 f4 78                 stsp16	[sp+0xe], r4
 c0 42                 ldi8	r4, 0x42
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+130
 f4 33                 ldsp16	r7, [sp+0xc]
 03                    mov	r4, r7
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 f0 03 30              ldi8	r3, 0x30
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 0f              ldi8	r2, 0xf
 07                    mov	r5, r7
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 c7 04 01              ldi16	r7, 0x104
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+236
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 c7 07 01              ldi16	r7, 0x107
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+328
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 c7 0a 01              ldi16	r7, 0x10a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+420
 f4 2a                 ldsp16	r6, [sp+0xa]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 c7 0d 01              ldi16	r7, 0x10d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+512
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 c7 10 01              ldi16	r7, 0x110
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+604
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 c7 13 01              ldi16	r7, 0x113
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+696
 f4 38                 ldsp16	r4, [sp+0xe]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 cb 37                 addi.s8	r7, 0x37
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 20                 cmp	r4, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f9 50                 and	r2, r4
 f9 69                 or	r3, r2
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 13                 cmov.ult	r2, r3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c4 1e 1f              ldi16	r4, 0x1f1e
 f4 11                 ldsp16	r5, [sp+0x4]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 ab 20              ldi16	r5, 0x20ab
 f4 32                 ldsp16	r6, [sp+0xc]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 63 ff              ldi16	r4, 0xff63
 f4 22                 ldsp16	r6, [sp+0x8]
 38                    cmp	r6, r4
 f8 0e                 cset.ne	r6
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 99                    or	r6, r5
 c4 d2 59              ldi16	r4, 0x59d2
 f4 29                 ldsp16	r5, [sp+0xa]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 96                    or	r5, r6
 c4 31 4a              ldi16	r4, 0x4a31
 f4 1a                 ldsp16	r6, [sp+0x6]
 38                    cmp	r6, r4
 f8 0e                 cset.ne	r6
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 99                    or	r6, r5
 c4 6d d4              ldi16	r4, 0xd46d
 f4 09                 ldsp16	r5, [sp+0x2]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 c5 65 58              ldi16	r5, 0x5865
 f4 3a                 ldsp16	r6, [sp+0xe]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 0a                 breq8	sum_bytes+19
 f0 65 a0              ldp8u	r5, [q0+]
 11                    add	r4, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	sum_bytes+9
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_signed_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d0 13                 breq8	sum_signed_bytes+27
 f0 04 eb 06           ldi16	r0, 0x6eb
 f0 01 00              ldi8	r1, 0x0
 f0 65 c0              ldp8u	r6, [q0+]
 f6 46                 sext8	r6
 12                    add	r4, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f4                 brne8	sum_signed_bytes+15
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<mix_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 36                 breq8	mix_bytes+62
 f0 04 ea 06           ldi16	r0, 0x6ea
 f0 01 00              ldi8	r1, 0x0
 f2 4b                 sub	r3, r3
 c7 2b 6d              ldi16	r7, 0x6d2b
 f0 02 0e              ldi8	r2, 0xe
 f0 65 c0              ldp8u	r6, [q0+]
 c5 01 01              ldi16	r5, 0x101
 fe 35                 mul16	r6, r5
 07                    mov	r5, r7
 fa 8f                 lsr16i	r5, 0xf
 1f                    add	r7, r7
 9d                    or	r7, r5
 07                    mov	r5, r7
 a6                    xor	r5, r6
 f0 0a ef              addi.s8	r2, -0x11
 c2 11                 ldi8	r6, 0x11
 f1 2f                 mov	r7, r3
 fe 3e                 mul16	r7, r6
 f4 ab                 inc16	r3
 1d                    add	r7, r5
 cb 03                 addi.s8	r7, 0x3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 dd                 brne8	mix_bytes+23
 f2 56                 sub	r5, r2
 d4 03                 jmp8	mix_bytes+65
 c5 2b 6d              ldi16	r5, 0x6d2b
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_byte_pairs>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 f6 2d                 tst16	r5
 d0 14                 breq8	sum_byte_pairs+27
 f0 04 e9 06           ldi16	r0, 0x6e9
 f0 01 00              ldi8	r1, 0x0
 a0                    xor	r4, r4
 f0 66 c0              ldp16	r6, [q0+]
 12                    add	r4, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	sum_byte_pairs+15
 d4 01                 jmp8	sum_byte_pairs+28
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_words>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 0a                 breq8	sum_words+19
 f0 66 a0              ldp16	r5, [q0+]
 11                    add	r4, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	sum_words+9
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
