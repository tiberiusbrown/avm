
codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
000003c0 l     F .text	0000002b hash_bytes
000003eb l     F .text	00000028 update_record
00000413 l     F .text	0000000a read_neighbors
0000041d l     F .text	00000031 walk_both_directions
00000107 l     O .data	00000003 .L.str
0000044e l     F .text	00000026 test_line16
0000010a l     O .data	00000003 .L.str.1
0000010d l     O .data	00000003 .L.str.2
00000110 l     O .data	00000003 .L.str.3
00000113 l     O .data	00000003 .L.str.4
00000474 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
0000049a l       .init_array	00000000 .hidden __init_array_end
0000049a l       .init_array	00000000 .hidden __init_array_start
0000049a l       .fini_array	00000000 .hidden __fini_array_start
0000049a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000e9 avm_test_main
00000498 g     F .text	00000002 avm_halt
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
 e1 7a 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9a 04              ldi16	r4, 0x49a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9a 04              ldi16	r6, 0x49a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9a 04           ldi16	r0, 0x49a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9a 04           ldi16	r2, 0x49a
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
 c4 9a 04              ldi16	r4, 0x49a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9a 04              ldi16	r6, 0x49a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9a 04           ldi16	r2, 0x49a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9a 04           ldi16	r0, 0x49a
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
 d6 c3                 adjsp	-0x3d
 f0 01 18              ldi8	r1, 0x18
 f0 10 25              leasp	r0, 0x25
 f1 20                 mov	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 c1 a5                 ldi8	r5, 0xa5
 c2 18                 ldi8	r6, 0x18
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 a5                    xor	r5, r5
 c2 07                 ldi8	r6, 0x7
 f6 29                 tst16	r1
 d0 13                 breq8	avm_test_main+50
 c3 fe                 ldi8	r7, 0xfe
 8d                    and	r7, r5
 fa a1                 lsr16i	r7, 0x1
 ae                    xor	r7, r6
 f0 6d e1              st8	[r0+], r7
 f4 b1                 dec16	r1
 ca 1d                 addi.s8	r6, 0x1d
 f4 ad                 inc16	r5
 f6 29                 tst16	r1
 d1 ed                 brne8	avm_test_main+31
 f0 11 25              leasp	r1, 0x25
 f0 10 0d              leasp	r0, 0xd
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 c2 18                 ldi8	r6, 0x18
 d7 0f                 sys	memcpy
 f0 14 10              leasp	r4, 0x10
 f1 24                 mov	r5, r0
 c2 0f                 ldi8	r6, 0xf
 d7 12                 sys	memmove
 f0 15 12              leasp	r5, 0x12
 f1 20                 mov	r4, r0
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 14 1f              leasp	r4, 0x1f
 c1 5c                 ldi8	r5, 0x5c
 c2 06                 ldi8	r6, 0x6
 d7 11                 sys	memset
 c5 00 01              ldi16	r5, 0x100
 f0 13 06              leasp	r3, 0x6
 f1 23                 mov	r4, r3
 c2 07                 ldi8	r6, 0x7
 d7 0f                 sys	memcpy
 f1 21                 mov	r4, r1
 d5 7e                 call8	hash_bytes
 f1 14                 mov	r2, r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f1 20                 mov	r4, r0
 d5 75                 call8	hash_bytes
 f4 40                 stsp16	[sp+0x0], r4
 f1 23                 mov	r4, r3
 e1 99 00              call16	update_record
 f1 04                 mov	r0, r4
 f0 14 14              leasp	r4, 0x14
 e1 b9 00              call16	read_neighbors
 f4 48                 stsp16	[sp+0x2], r4
 f1 21                 mov	r4, r1
 e1 bc 00              call16	walk_both_directions
 f1 1c                 mov	r3, r4
 c4 07 01              ldi16	r4, 0x107
 f1 26                 mov	r5, r2
 e1 e3 00              call16	test_line16
 c4 0a 01              ldi16	r4, 0x10a
 f0 32 00              ldsp16	r2, [sp+0x0]
 f1 26                 mov	r5, r2
 e1 d8 00              call16	test_line16
 c4 0d 01              ldi16	r4, 0x10d
 f1 24                 mov	r5, r0
 e1 d0 00              call16	test_line16
 c4 10 01              ldi16	r4, 0x110
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 25                 mov	r5, r1
 e1 c5 00              call16	test_line16
 c4 13 01              ldi16	r4, 0x113
 f1 27                 mov	r5, r3
 e1 bd 00              call16	test_line16
 c4 fa d5              ldi16	r4, 0xd5fa
 f4 11                 ldsp16	r5, [sp+0x4]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 cb d3              ldi16	r5, 0xd3cb
 f5 15                 cmp	r2, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 b8 d5              ldi16	r4, 0xd5b8
 f5 04                 cmp	r0, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 c5 b6 eb              ldi16	r5, 0xebb6
 f5 0d                 cmp	r1, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 1c 5d              ldi16	r4, 0x5d1c
 f5 1c                 cmp	r3, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 3d                 adjsp	0x3d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 c5 0f 1d              ldi16	r5, 0x1d0f
 f0 01 18              ldi8	r1, 0x18
 c7 01 01              ldi16	r7, 0x101
 f6 29                 tst16	r1
 d0 16                 breq8	hash_bytes+39
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f1 24                 mov	r5, r0
 fe 2f                 mul16	r5, r7
 16                    add	r5, r6
 f4 b1                 dec16	r1
 f4 a8                 inc16	r0
 f6 29                 tst16	r1
 d1 ea                 brne8	hash_bytes+17
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<update_record>:
 ed b8 21              ld16	r5, [r4+1]
 c6 21 02              ldi16	r6, 0x221
 19                    add	r6, r5
 ed b8 24              ld16	r5, [r4+4]
 a6                    xor	r5, r6
 ee d8 21              st16	[r4+1], r6
 ee b8 24              st16	[r4+4], r5
 16                    add	r5, r6
 ed c8 23              ld8u	r6, [r4+3]
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 fa 51                 lsl16i	r6, 0x1
 9b                    or	r6, r7
 ee c8 23              st8	[r4+3], r6
 f1 76                 zext8	r6
 19                    add	r6, r5
 44                    ld8u	r5, [r4]
 16                    add	r5, r6
 ed 88 26              ld8u	r4, [r4+6]
 11                    add	r4, r5
 ef                    ret

<read_neighbors>:
 ed a8 1d              ld8u	r5, [r4-3]
 ed 88 1f              ld8u	r4, [r4-1]
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 ef                    ret

<walk_both_directions>:
 b0                    push16	r0
 f2 30                 sub	r0, r0
 c1 18                 ldi8	r5, 0x18
 0c                    mov	r7, r4
 f6 2d                 tst16	r5
 d0 0a                 breq8	walk_both_directions+20
 f7 1e                 ld8u	r6, [r7+]
 f2 06                 add	r0, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	walk_both_directions+10
 a5                    xor	r5, r5
 c8 18                 addi.s8	r4, 0x18
 0d                    mov	r7, r5
 cf 18                 cmpi.s8	r7, 0x18
 d0 0a                 breq8	walk_both_directions+38
 f4 b4                 dec16	r4
 48                    ld8u	r6, [r4]
 16                    add	r5, r6
 f4 af                 inc16	r7
 cf 18                 cmpi.s8	r7, 0x18
 d1 f6                 brne8	walk_both_directions+28
 01                    mov	r4, r5
 fa 7d                 lsr16i	r4, 0xd
 fa 43                 lsl16i	r5, 0x3
 94                    or	r5, r4
 f9 a2                 xor	r5, r0
 01                    mov	r4, r5
 b8                    pop16	r0
 ef                    ret

<test_line16>:
 d6 fe                 adjsp	-0x2
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line16+14
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line16+3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 d5 0d                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 07                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
