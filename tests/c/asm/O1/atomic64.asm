
atomic64.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 atomic64.c
00000343 l     F .text	0000007a check_store_load
000003bd l     F .text	00000094 check_add
00000451 l     F .text	0000009f check_sub
000004f0 l     F .text	0000008e check_and
0000057e l     F .text	0000008b check_or
00000609 l     F .text	0000008b check_xor
00000694 l     F .text	00000084 check_nand
00000718 l     F .text	000000b9 check_compare_exchange
000007d1 l     F .text	0000007c check_exchange
0000084d l     F .text	00000077 check_aligned
00000100 l     O .data	00000008 value
00000108 l     O .data	00000008 aligned_value
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 atomic.c
00000c01 l       .init_array	00000000 .hidden __init_array_end
00000c01 l       .init_array	00000000 .hidden __init_array_start
00000c01 l       .fini_array	00000000 .hidden __fini_array_start
00000c01 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000006c avm_test_main
000008c4 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000008d5 g     F .text	0000000f __atomic_store
000008c6 g     F .text	0000000f __atomic_load
00000908 g     F .text	00000053 __atomic_compare_exchange
000008e4 g     F .text	00000024 __atomic_exchange
00000a33 g     F .text	00000065 __atomic_store_8
00000a98 g     F .text	00000169 __atomic_fetch_add_8
0000095b g     F .text	000000d8 __atomic_load_8

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
 e1 a6 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 01 0c              ldi16	r4, 0xc01
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 01 0c              ldi16	r6, 0xc01
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 01 0c           ldi16	r0, 0xc01
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 01 0c           ldi16	r2, 0xc01
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
 c4 01 0c              ldi16	r4, 0xc01
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 01 0c              ldi16	r6, 0xc01
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 01 0c           ldi16	r2, 0xc01
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 01 0c           ldi16	r0, 0xc01
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
 d5 6a                 call8	check_store_load
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+9
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 e1 da 00              call16	check_add
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+19
 c0 02                 ldi8	r4, 0x2
 ef                    ret
 e1 64 01              call16	check_sub
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+29
 c0 03                 ldi8	r4, 0x3
 ef                    ret
 e1 f9 01              call16	check_and
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+39
 c0 04                 ldi8	r4, 0x4
 ef                    ret
 e1 7d 02              call16	check_or
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+49
 c0 05                 ldi8	r4, 0x5
 ef                    ret
 e1 fe 02              call16	check_xor
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+59
 c0 06                 ldi8	r4, 0x6
 ef                    ret
 e1 7f 03              call16	check_nand
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+69
 c0 07                 ldi8	r4, 0x7
 ef                    ret
 e1 f9 03              call16	check_compare_exchange
 04                    mov	r5, r4
 f4 a5                 tst8	r5
 d0 09                 breq8	avm_test_main+86
 c0 09                 ldi8	r4, 0x9
 c2 08                 ldi8	r6, 0x8
 cd 01                 cmpi.s8	r5, 0x1
 fb 26                 cmov.eq	r4, r6
 ef                    ret
 e1 a1 04              call16	check_exchange
 f4 a4                 tst8	r4
 d0 03                 breq8	avm_test_main+96
 c0 0a                 ldi8	r4, 0xa
 ef                    ret
 e1 13 05              call16	check_aligned
 04                    mov	r5, r4
 c0 0b                 ldi8	r4, 0xb
 aa                    xor	r6, r6
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 ef                    ret

<check_store_load>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 fc                 adjsp	-0x4
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 00 08              ldi8	r0, 0x8
 f0 05 00 01           ldi16	r1, 0x100
 f0 16 04              leasp	r6, 0x4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 5a 05              call16	__atomic_store
 d6 04                 adjsp	0x4
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 16 04              leasp	r6, 0x4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 37 05              call16	__atomic_load
 d6 04                 adjsp	0x4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 78 56              ldi16	r6, 0x5678
 c7 34 12              ldi16	r7, 0x1234
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 04 f0 de           ldi16	r0, 0xdef0
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 98                    or	r6, r4
 9d                    or	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_add>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 c4 00 01              ldi16	r4, 0x100
 f0 6a 48              ld32	q1, [r4]
 c0 20                 ldi8	r4, 0x20
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f2 69                 mov32	q2, q1
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 68                 add32	q2, q0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 16              leasp	r6, 0x16
 f0 17 0e              leasp	r7, 0xe
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 00 01              ldi16	r5, 0x100
 e1 ed 04              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f4 a4                 tst8	r4
 d0 ad                 breq8	check_add+29
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_sub>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 c4 00 01              ldi16	r4, 0x100
 f0 6a 48              ld32	q1, [r4]
 c4 f0 ff              ldi16	r4, 0xfff0
 c5 ff ff              ldi16	r5, 0xffff
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f2 69                 mov32	q2, q1
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 68                 add32	q2, q0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6e                 add32	q3, q2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 16              leasp	r6, 0x16
 f0 17 0e              leasp	r7, 0xe
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 00 01              ldi16	r5, 0x100
 e1 4e 04              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f4 a4                 tst8	r4
 d0 a5                 breq8	check_sub+32
 c4 10 df              ldi16	r4, 0xdf10
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_and>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 f0 04 00 01           ldi16	r0, 0x100
 f0 6a 40              ld32	q1, [r0]
 c4 f0 ff              ldi16	r4, 0xfff0
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 01 08              ldi8	r1, 0x8
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 14              leasp	r6, 0x14
 f0 17 0c              leasp	r7, 0xc
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 c0 03              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 a4                 tst8	r4
 d0 b6                 breq8	check_and+32
 c4 00 df              ldi16	r4, 0xdf00
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_or>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 f0 04 00 01           ldi16	r0, 0x100
 f0 6a 40              ld32	q1, [r0]
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 01 08              ldi8	r1, 0x8
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 14              leasp	r6, 0x14
 f0 17 0c              leasp	r7, 0xc
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 35 03              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 a4                 tst8	r4
 d0 b6                 breq8	check_or+29
 c4 00 df              ldi16	r4, 0xdf00
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_xor>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 f0 04 00 01           ldi16	r0, 0x100
 f0 6a 40              ld32	q1, [r0]
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 01 08              ldi8	r1, 0x8
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 14              leasp	r6, 0x14
 f0 17 0c              leasp	r7, 0xc
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 aa 02              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f4 a4                 tst8	r4
 d0 b6                 breq8	check_xor+29
 c4 03 df              ldi16	r4, 0xdf03
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_nand>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c4 04 01              ldi16	r4, 0x104
 f0 6a c8              ld32	q3, [r4]
 f0 04 00 01           ldi16	r0, 0x100
 f0 6a 40              ld32	q1, [r0]
 f0 01 08              ldi8	r1, 0x8
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 16 10              leasp	r6, 0x10
 f0 17 08              leasp	r7, 0x8
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 24 02              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f4 a4                 tst8	r4
 d0 b6                 breq8	check_nand+22
 c4 02 df              ldi16	r4, 0xdf02
 c5 bc 9a              ldi16	r5, 0x9abc
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_compare_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c4 87 a9              ldi16	r4, 0xa987
 c5 cb ed              ldi16	r5, 0xedcb
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 fd 20              ldi16	r4, 0x20fd
 c5 43 65              ldi16	r5, 0x6543
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 f8                 adjsp	-0x8
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c0 08                 ldi8	r4, 0x8
 c5 00 01              ldi16	r5, 0x100
 f0 16 10              leasp	r6, 0x10
 f0 17 08              leasp	r7, 0x8
 e1 a4 01              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f4 a4                 tst8	r4
 d0 5e                 breq8	check_compare_exchange+176
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c0 08                 ldi8	r4, 0x8
 c5 00 01              ldi16	r5, 0x100
 f0 16 10              leasp	r6, 0x10
 f0 17 08              leasp	r7, 0x8
 e1 68 01              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 02 07              ldi8	r2, 0x7
 f2 4b                 sub	r3, r3
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 a0                    xor	r4, r4
 c2 02                 ldi8	r6, 0x2
 f0 69 40              cmp32	q1, q0
 fb 66                 cmov.ne	r4, r6
 f4 a5                 tst8	r5
 fb 66                 cmov.ne	r4, r6
 d4 02                 jmp8	check_compare_exchange+178
 c0 01                 ldi8	r4, 0x1
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 d6 fc                 adjsp	-0x4
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c0 08                 ldi8	r4, 0x8
 c5 00 01              ldi16	r5, 0x100
 f0 16 0c              leasp	r6, 0xc
 f0 17 04              leasp	r7, 0x4
 e1 e1 00              call16	__atomic_exchange
 d6 04                 adjsp	0x4
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 80              cmp32	q2, q0
 d1 2b                 brne8	check_exchange+115
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c0 08                 ldi8	r4, 0x8
 c5 00 01              ldi16	r5, 0x100
 f0 16 0c              leasp	r6, 0xc
 e1 9a 00              call16	__atomic_load
 d6 04                 adjsp	0x4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 c2 0b                 ldi8	r6, 0xb
 af                    xor	r7, r7
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 69 c0              cmp32	q3, q0
 f8 0c                 cset.ne	r4
 d4 02                 jmp8	check_exchange+117
 c0 01                 ldi8	r4, 0x1
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_aligned>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c4 08 01              ldi16	r4, 0x108
 e1 bf 01              call16	__atomic_store_8
 d6 0c                 adjsp	0xc
 d6 f4                 adjsp	-0xc
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c4 08 01              ldi16	r4, 0x108
 e1 07 02              call16	__atomic_fetch_add_8
 d6 0c                 adjsp	0xc
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f2 64                 mov32	q1, q0
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 1d                 brne8	check_aligned+112
 c4 08 01              ldi16	r4, 0x108
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 e1 b2 00              call16	__atomic_load_8
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 69 04              cmp32	q0, q1
 f8 0c                 cset.ne	r4
 d4 02                 jmp8	check_aligned+114
 c0 01                 ldi8	r4, 0x1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__atomic_load>:
 f6 2c                 tst16	r4
 d0 0a                 breq8	__atomic_load+14
 f7 0f                 ld8u	r7, [r5+]
 f6 17                 st8	[r6+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_load+4
 ef                    ret

<__atomic_store>:
 f6 2c                 tst16	r4
 d0 0a                 breq8	__atomic_store+14
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_store+4
 ef                    ret

<__atomic_exchange>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 19                 breq8	__atomic_exchange+32
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f0 6c 41              ld8u	r2, [r0+]
 f6 1a                 st8	[r7+], r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f5                 brne8	__atomic_exchange+11
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_exchange+22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<__atomic_compare_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d0 3e                 breq8	__atomic_compare_exchange+76
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f1 16                 mov	r2, r6
 f1 18                 mov	r3, r0
 41                    ld8u	r4, [r5]
 f4 50                 stsp16	[sp+0x4], r4
 ed 84 20              ld8u	r4, [r2+0]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f5 0c                 cmp	r1, r4
 d1 1a                 brne8	__atomic_compare_exchange+61
 f4 aa                 inc16	r2
 f4 ad                 inc16	r5
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e9                 brne8	__atomic_compare_exchange+22
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 1c                 ld8u	r4, [r7+]
 f6 0c                 st8	[r5+], r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f6                 brne8	__atomic_compare_exchange+47
 c0 01                 ldi8	r4, 0x1
 d4 0f                 jmp8	__atomic_compare_exchange+76
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f6                 brne8	__atomic_compare_exchange+66
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__atomic_load_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 44                    ld8u	r5, [r4]
 f4 69                 stsp16	[sp+0xa], r5
 f0 2d 15              stsp8	[sp+0x15], r5
 f2 39                 sub	r1, r1
 ed a8 21              ld8u	r5, [r4+1]
 af                    xor	r7, r7
 f9 e4                 and	r7, r1
 f0 2d 14              stsp8	[sp+0x14], r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 ed a8 22              ld8u	r5, [r4+2]
 f0 2d 13              stsp8	[sp+0x13], r5
 ed c8 23              ld8u	r6, [r4+3]
 f0 2e 12              stsp8	[sp+0x12], r6
 f1 05                 mov	r0, r5
 f0 02 ff              ldi8	r2, 0xff
 f9 08                 and	r0, r2
 f1 08                 mov	r1, r0
 f2 30                 sub	r0, r0
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 ed 48 24              ld8u	r2, [r4+4]
 f0 2a 11              stsp8	[sp+0x11], r2
 ed a8 25              ld8u	r5, [r4+5]
 f4 40                 stsp16	[sp+0x0], r4
 af                    xor	r7, r7
 f2 39                 sub	r1, r1
 f9 e4                 and	r7, r1
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 2d 10              stsp8	[sp+0x10], r5
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 ed a8 26              ld8u	r5, [r4+6]
 f1 6d                 stsp8	[sp+0xf], r5
 09                    mov	r6, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f9 c8                 and	r6, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 88 27              ld8u	r4, [r4+7]
 f1 68                 stsp8	[sp+0xe], r4
 f1 1e                 mov	r3, r6
 f2 42                 sub	r2, r2
 fa 38                 lsl16i	r4, 0x8
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 98                    or	r6, r4
 9d                    or	r7, r5
 f2 68                 mov32	q2, q0
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__atomic_store_8>:
 d6 f0                 adjsp	-0x10
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 6e                 stsp8	[sp+0xf], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f1 69                 stsp8	[sp+0xe], r5
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 5e                 stsp8	[sp+0xb], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f1 59                 stsp8	[sp+0xa], r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f1 65                 stsp8	[sp+0xd], r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f1 61                 stsp8	[sp+0xc], r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f1 55                 stsp8	[sp+0x9], r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f1 51                 stsp8	[sp+0x8], r5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 51                    st8	[r4], r5
 f3 79                 ldsp8u	r5, [sp+0xe]
 ee a8 21              st8	[r4+1], r5
 f3 75                 ldsp8u	r5, [sp+0xd]
 ee a8 22              st8	[r4+2], r5
 f3 71                 ldsp8u	r5, [sp+0xc]
 ee a8 23              st8	[r4+3], r5
 f3 6d                 ldsp8u	r5, [sp+0xb]
 ee a8 24              st8	[r4+4], r5
 f3 69                 ldsp8u	r5, [sp+0xa]
 ee a8 25              st8	[r4+5], r5
 f3 65                 ldsp8u	r5, [sp+0x9]
 ee a8 26              st8	[r4+6], r5
 f3 61                 ldsp8u	r5, [sp+0x8]
 ee a8 27              st8	[r4+7], r5
 d6 10                 adjsp	0x10
 ef                    ret

<__atomic_fetch_add_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 36 33              ldsp16	r6, [sp+0x33]
 f0 37 35              ldsp16	r7, [sp+0x35]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 f0 37 31              ldsp16	r7, [sp+0x31]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 44                    ld8u	r5, [r4]
 f4 59                 stsp16	[sp+0x6], r5
 f0 2d 23              stsp8	[sp+0x23], r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 ed a8 21              ld8u	r5, [r4+1]
 f2 39                 sub	r1, r1
 f9 3c                 and	r1, r7
 f2 67                 mov32	q1, q3
 f0 2d 22              stsp8	[sp+0x22], r5
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 ed a8 22              ld8u	r5, [r4+2]
 f0 2d 21              stsp8	[sp+0x21], r5
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 ed a8 23              ld8u	r5, [r4+3]
 f0 2d 20              stsp8	[sp+0x20], r5
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 1d                 mov	r3, r5
 f2 42                 sub	r2, r2
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 ed 08 24              ld8u	r0, [r4+4]
 f0 28 1f              stsp8	[sp+0x1f], r0
 ed a8 25              ld8u	r5, [r4+5]
 f4 68                 stsp16	[sp+0xa], r4
 af                    xor	r7, r7
 f2 4b                 sub	r3, r3
 f9 ec                 and	r7, r3
 f0 2d 1e              stsp8	[sp+0x1e], r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 ed 88 26              ld8u	r4, [r4+6]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 08                    mov	r6, r4
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f9 c0                 and	r6, r0
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 ed cc 27              ld8u	r6, [r6+7]
 f4 52                 stsp16	[sp+0x4], r6
 fa 58                 lsl16i	r6, 0x8
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 69                 add32	q2, q1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 1c              stsp8	[sp+0x1c], r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 2e 1b              stsp8	[sp+0x1b], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 1a              stsp8	[sp+0x1a], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f0 2e 19              stsp8	[sp+0x19], r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 18              stsp8	[sp+0x18], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 2e 17              stsp8	[sp+0x17], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 16              stsp8	[sp+0x16], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f0 2e 15              stsp8	[sp+0x15], r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 14              stsp8	[sp+0x14], r4
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f4 29                 ldsp16	r5, [sp+0xa]
 54                    st8	[r5], r4
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 ee 8a 21              st8	[r5+1], r4
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 ee 8a 22              st8	[r5+2], r4
 f0 1c 18              ldsp8u	r4, [sp+0x18]
 ee 8a 23              st8	[r5+3], r4
 f0 1c 17              ldsp8u	r4, [sp+0x17]
 ee 8a 24              st8	[r5+4], r4
 f0 1c 16              ldsp8u	r4, [sp+0x16]
 ee 8a 25              st8	[r5+5], r4
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 ee 8a 26              st8	[r5+6], r4
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 ee 8a 27              st8	[r5+7], r4
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
