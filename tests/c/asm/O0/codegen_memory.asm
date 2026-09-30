
codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
00000438 l     F .text	00000048 hash_bytes
00000480 l     F .text	00000040 update_record
000004c0 l     F .text	00000012 read_neighbors
000004d2 l     F .text	00000075 walk_both_directions
00000107 l     O .data	00000003 .L.str
00000547 l     F .text	00000019 test_line16
0000010a l     O .data	00000003 .L.str.1
0000010d l     O .data	00000003 .L.str.2
00000110 l     O .data	00000003 .L.str.3
00000113 l     O .data	00000003 .L.str.4
00000560 l     F .text	00000018 rotate_left
00000578 l     F .text	00000022 test_puts
0000059a l     F .text	0000000b test_putc
000005a5 l     F .text	0000000f test_hex16
000005b4 l     F .text	00000019 test_hex8
000005cd l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
000005fb l       .init_array	00000000 .hidden __init_array_end
000005fb l       .init_array	00000000 .hidden __init_array_start
000005fb l       .fini_array	00000000 .hidden __fini_array_start
000005fb l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000161 avm_test_main
000005f9 g     F .text	00000002 avm_halt
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
 e1 db 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fb 05              ldi16	r4, 0x5fb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fb 05              ldi16	r6, 0x5fb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 fb 05           ldi16	r0, 0x5fb
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fb 05           ldi16	r2, 0x5fb
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
 c4 fb 05              ldi16	r4, 0x5fb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fb 05              ldi16	r6, 0x5fb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 fb 05           ldi16	r2, 0x5fb
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fb 05           ldi16	r0, 0x5fb
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
 b0                    push16	r0
 d6 b6                 adjsp	-0x4a
 c2 18                 ldi8	r6, 0x18
 c1 a5                 ldi8	r5, 0xa5
 f0 14 32              leasp	r4, 0x32
 d7 11                 sys	memset
 a0                    xor	r4, r4
 f0 2c 19              stsp8	[sp+0x19], r4
 d4 00                 jmp8	avm_test_main+18
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 cc 18                 cmpi.s8	r4, 0x18
 d8 21                 bruge8	avm_test_main+58
 d4 00                 jmp8	avm_test_main+27
 f0 1e 19              ldsp8u	r6, [sp+0x19]
 c0 1d                 ldi8	r4, 0x1d
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 c9 07                 addi.s8	r5, 0x7
 02                    mov	r4, r6
 f4 8c                 lsr16.1	r4
 a4                    xor	r5, r4
 f0 14 32              leasp	r4, 0x32
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	avm_test_main+48
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 ac                 inc16	r4
 f0 2c 19              stsp8	[sp+0x19], r4
 d4 d8                 jmp8	avm_test_main+18
 c1 18                 ldi8	r5, 0x18
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 32              leasp	r4, 0x32
 f4 50                 stsp16	[sp+0x4], r4
 f0 16 1a              leasp	r6, 0x1a
 f4 42                 stsp16	[sp+0x0], r6
 0e                    mov	r7, r6
 b4                    push16	r4
 b5                    push16	r5
 b6                    push16	r6
 09                    mov	r6, r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 d7 0f                 sys	memcpy
 0c                    mov	r7, r4
 be                    pop16	r6
 bd                    pop16	r5
 bc                    pop16	r4
 f0 17 1d              leasp	r7, 0x1d
 f0 00 0f              ldi8	r0, 0xf
 b4                    push16	r4
 b5                    push16	r5
 b6                    push16	r6
 03                    mov	r4, r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 d7 12                 sys	memmove
 0c                    mov	r7, r4
 be                    pop16	r6
 bd                    pop16	r5
 bc                    pop16	r4
 f0 17 1f              leasp	r7, 0x1f
 f0 00 0c              ldi8	r0, 0xc
 b4                    push16	r4
 b5                    push16	r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 12                 sys	memmove
 08                    mov	r6, r4
 bd                    pop16	r5
 bc                    pop16	r4
 f0 16 2c              leasp	r6, 0x2c
 f0 00 06              ldi8	r0, 0x6
 c3 5c                 ldi8	r7, 0x5c
 b4                    push16	r4
 b5                    push16	r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 08                    mov	r6, r4
 f0 46 06 01           ldm8u	r6, [0x106]
 bd                    pop16	r5
 bc                    pop16	r4
 f0 2e 18              stsp8	[sp+0x18], r6
 f0 46 05 01           ldm8u	r6, [0x105]
 f0 2e 17              stsp8	[sp+0x17], r6
 f0 46 04 01           ldm8u	r6, [0x104]
 f0 2e 16              stsp8	[sp+0x16], r6
 f0 46 03 01           ldm8u	r6, [0x103]
 f0 2e 15              stsp8	[sp+0x15], r6
 f0 46 02 01           ldm8u	r6, [0x102]
 f0 2e 14              stsp8	[sp+0x14], r6
 f0 46 01 01           ldm8u	r6, [0x101]
 f0 2e 13              stsp8	[sp+0x13], r6
 f0 46 00 01           ldm8u	r6, [0x100]
 f0 2e 12              stsp8	[sp+0x12], r6
 e1 a1 00              call16	hash_bytes
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3e 10              stsp16	[sp+0x10], r6
 e1 96 00              call16	hash_bytes
 f4 78                 stsp16	[sp+0xe], r4
 f0 14 12              leasp	r4, 0x12
 c5 21 02              ldi16	r5, 0x221
 e1 d3 00              call16	update_record
 f4 70                 stsp16	[sp+0xc], r4
 f0 14 21              leasp	r4, 0x21
 e1 0b 01              call16	read_neighbors
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 e1 13 01              call16	walk_both_directions
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 c4 07 01              ldi16	r4, 0x107
 e1 7d 01              call16	test_line16
 f4 39                 ldsp16	r5, [sp+0xe]
 c4 0a 01              ldi16	r4, 0x10a
 e1 75 01              call16	test_line16
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 0d 01              ldi16	r4, 0x10d
 e1 6d 01              call16	test_line16
 f4 29                 ldsp16	r5, [sp+0xa]
 c4 10 01              ldi16	r4, 0x110
 e1 65 01              call16	test_line16
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 13 01              ldi16	r4, 0x113
 e1 5d 01              call16	test_line16
 f0 35 10              ldsp16	r5, [sp+0x10]
 c0 01                 ldi8	r4, 0x1
 c6 fa d5              ldi16	r6, 0xd5fa
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 38                 brne8	avm_test_main+344
 d4 00                 jmp8	avm_test_main+290
 f4 39                 ldsp16	r5, [sp+0xe]
 c0 01                 ldi8	r4, 0x1
 c6 cb d3              ldi16	r6, 0xd3cb
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 2a                 brne8	avm_test_main+344
 d4 00                 jmp8	avm_test_main+304
 f4 31                 ldsp16	r5, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 c6 b8 d5              ldi16	r6, 0xd5b8
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 1c                 brne8	avm_test_main+344
 d4 00                 jmp8	avm_test_main+318
 f4 29                 ldsp16	r5, [sp+0xa]
 c0 01                 ldi8	r4, 0x1
 c6 b6 eb              ldi16	r6, 0xebb6
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 0e                 brne8	avm_test_main+344
 d4 00                 jmp8	avm_test_main+332
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 1c 5d              ldi16	r5, 0x5d1c
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+344
 f4 18                 ldsp16	r4, [sp+0x6]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 4a                 adjsp	0x4a
 b8                    pop16	r0
 ef                    ret

<hash_bytes>:
 d6 f8                 adjsp	-0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 51                 stsp16	[sp+0x4], r5
 c4 0f 1d              ldi16	r4, 0x1d0f
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	hash_bytes+16
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 31                    cmp	r4, r5
 d8 2c                 bruge8	hash_bytes+67
 d4 00                 jmp8	hash_bytes+25
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 05                 ldi8	r5, 0x5
 e1 08 01              call16	rotate_left
 f4 48                 stsp16	[sp+0x2], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 08                 ldsp16	r4, [sp+0x2]
 a1                    xor	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 c6 01 01              ldi16	r6, 0x101
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	hash_bytes+59
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 cd                 jmp8	hash_bytes+16
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 08                 adjsp	0x8
 ef                    ret

<update_record>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 ed b8 21              ld16	r5, [r4+1]
 f4 02                 ldsp16	r6, [sp+0x0]
 16                    add	r5, r6
 ee b8 21              st16	[r4+1], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 ed d8 21              ld16	r6, [r4+1]
 ed b8 24              ld16	r5, [r4+4]
 a6                    xor	r5, r6
 ee b8 24              st16	[r4+4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 ed c8 23              ld8u	r6, [r4+3]
 06                    mov	r5, r6
 15                    add	r5, r5
 fa 97                 lsr16i	r6, 0x7
 96                    or	r5, r6
 ee a8 23              st8	[r4+3], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 41                    ld8u	r4, [r5]
 ed da 21              ld16	r6, [r5+1]
 12                    add	r4, r6
 ed ca 23              ld8u	r6, [r5+3]
 12                    add	r4, r6
 ed da 24              ld16	r6, [r5+4]
 12                    add	r4, r6
 ed aa 26              ld8u	r5, [r5+6]
 11                    add	r4, r5
 d6 04                 adjsp	0x4
 ef                    ret

<read_neighbors>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 ed 8a 1d              ld8u	r4, [r5-3]
 ed aa 1f              ld8u	r5, [r5-1]
 fa 48                 lsl16i	r5, 0x8
 91                    or	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<walk_both_directions>:
 d6 ee                 adjsp	-0x12
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 61                 stsp16	[sp+0x8], r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 3a                 ldsp16	r6, [sp+0xe]
 16                    add	r5, r6
 f4 59                 stsp16	[sp+0x6], r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	walk_both_directions+29
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 31                    cmp	r4, r5
 d8 19                 bruge8	walk_both_directions+61
 d4 00                 jmp8	walk_both_directions+38
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 21                 ldsp16	r5, [sp+0x8]
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 f4 62                 stsp16	[sp+0x8], r6
 45                    ld8u	r5, [r5]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 d4 00                 jmp8	walk_both_directions+53
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 e0                 jmp8	walk_both_directions+29
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	walk_both_directions+66
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 39                 ldsp16	r5, [sp+0xe]
 31                    cmp	r4, r5
 d8 1b                 bruge8	walk_both_directions+100
 d4 00                 jmp8	walk_both_directions+75
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 f4 b6                 dec16	r6
 f4 5a                 stsp16	[sp+0x6], r6
 ed aa 1f              ld8u	r5, [r5-1]
 11                    add	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 d4 00                 jmp8	walk_both_directions+92
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 de                 jmp8	walk_both_directions+66
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 40                 stsp16	[sp+0x0], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 c1 03                 ldi8	r5, 0x3
 d5 20                 call8	rotate_left
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 d6 12                 adjsp	0x12
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 27                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 45                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 4c                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 3d                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<rotate_left>:
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
