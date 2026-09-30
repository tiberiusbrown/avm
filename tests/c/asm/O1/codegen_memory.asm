
codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
00000579 l     F .text	00000027 hash_bytes
000005a0 l     F .text	00000027 update_record
000005c7 l     F .text	0000000a read_neighbors
000005d1 l     F .text	0000002a walk_both_directions
00000107 l     O .data	00000003 .L.str
0000010a l     O .data	00000003 .L.str.1
0000010d l     O .data	00000003 .L.str.2
00000110 l     O .data	00000003 .L.str.3
00000113 l     O .data	00000003 .L.str.4
00000000 l    df *ABS*	00000000 runtime.c
000005fd l       .init_array	00000000 .hidden __init_array_end
000005fd l       .init_array	00000000 .hidden __init_array_start
000005fd l       .fini_array	00000000 .hidden __fini_array_start
000005fd l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002a2 avm_test_main
000005fb g     F .text	00000002 avm_halt
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
 e1 dd 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fd 05              ldi16	r4, 0x5fd
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fd 05              ldi16	r6, 0x5fd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 fd 05           ldi16	r0, 0x5fd
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fd 05           ldi16	r2, 0x5fd
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
 c4 fd 05              ldi16	r4, 0x5fd
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fd 05              ldi16	r6, 0x5fd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 fd 05           ldi16	r2, 0x5fd
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fd 05           ldi16	r0, 0x5fd
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
 d6 bd                 adjsp	-0x43
 f0 02 18              ldi8	r2, 0x18
 f0 11 2b              leasp	r1, 0x2b
 f1 21                 mov	r4, r1
 f4 68                 stsp16	[sp+0xa], r4
 c1 a5                 ldi8	r5, 0xa5
 c2 18                 ldi8	r6, 0x18
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 11                 sys	memset
 c1 07                 ldi8	r5, 0x7
 af                    xor	r7, r7
 f0 00 fe              ldi8	r0, 0xfe
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 f4 8e                 lsr16.1	r6
 a9                    xor	r6, r5
 f0 6d c3              st8	[r1+], r6
 f4 af                 inc16	r7
 c9 1d                 addi.s8	r5, 0x1d
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ed                 brne8	avm_test_main+30
 f0 10 2b              leasp	r0, 0x2b
 f0 11 13              leasp	r1, 0x13
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 c2 18                 ldi8	r6, 0x18
 d7 0f                 sys	memcpy
 f0 02 0f              ldi8	r2, 0xf
 f0 14 16              leasp	r4, 0x16
 f1 25                 mov	r5, r1
 c2 0f                 ldi8	r6, 0xf
 d7 12                 sys	memmove
 f0 15 18              leasp	r5, 0x18
 f1 21                 mov	r4, r1
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 14 25              leasp	r4, 0x25
 c1 5c                 ldi8	r5, 0x5c
 c2 06                 ldi8	r6, 0x6
 d7 11                 sys	memset
 c4 04 01              ldi16	r4, 0x104
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 2f 12              stsp8	[sp+0x12], r7
 c4 00 01              ldi16	r4, 0x100
 f0 6a 88              ld32	q2, [r4]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f1 20                 mov	r4, r0
 e1 2a 02              call16	hash_bytes
 f4 68                 stsp16	[sp+0xa], r4
 f1 21                 mov	r4, r1
 e1 23 02              call16	hash_bytes
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 0c              leasp	r4, 0xc
 e1 42 02              call16	update_record
 f4 50                 stsp16	[sp+0x4], r4
 f0 14 1a              leasp	r4, 0x1a
 e1 61 02              call16	read_neighbors
 f4 60                 stsp16	[sp+0x8], r4
 f1 20                 mov	r4, r0
 e1 64 02              call16	walk_both_directions
 f4 58                 stsp16	[sp+0x6], r4
 c0 4d                 ldi8	r4, 0x4d
 c7 08 01              ldi16	r7, 0x108
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+157
 f4 2b                 ldsp16	r7, [sp+0xa]
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
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 2c                 cmp	r7, r0
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 0b 01              ldi16	r7, 0x10b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+260
 f4 09                 ldsp16	r5, [sp+0x2]
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2d                 cmp	r7, r1
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 0e 01              ldi16	r7, 0x10e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+352
 f4 11                 ldsp16	r5, [sp+0x4]
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2d                 cmp	r7, r1
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 11 01              ldi16	r7, 0x111
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+444
 f4 21                 ldsp16	r5, [sp+0x8]
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2d                 cmp	r7, r1
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 14 01              ldi16	r7, 0x114
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+536
 f4 19                 ldsp16	r5, [sp+0x6]
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2d                 cmp	r7, r1
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 01                    mov	r4, r5
 fa 8c                 lsr16i	r5, 0xc
 f9 75                 or	r3, r5
 c9 37                 addi.s8	r5, 0x37
 f5 20                 cmp	r4, r0
 fc 2b                 cmov.ult	r5, r3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c4 cb d3              ldi16	r4, 0xd3cb
 f4 09                 ldsp16	r5, [sp+0x2]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 fa d5              ldi16	r5, 0xd5fa
 f4 2a                 ldsp16	r6, [sp+0xa]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 b8 d5              ldi16	r4, 0xd5b8
 f4 12                 ldsp16	r6, [sp+0x4]
 38                    cmp	r6, r4
 f8 0e                 cset.ne	r6
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 99                    or	r6, r5
 c4 b6 eb              ldi16	r4, 0xebb6
 f4 21                 ldsp16	r5, [sp+0x8]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 96                    or	r5, r6
 c4 1c 5d              ldi16	r4, 0x5d1c
 f4 1a                 ldsp16	r6, [sp+0x6]
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 43                 adjsp	0x43
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 c4 0f 1d              ldi16	r4, 0x1d0f
 c6 ff fe              ldi16	r6, 0xfeff
 f0 04 01 01           ldi16	r0, 0x101
 f0 05 17 17           ldi16	r1, 0x1717
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 f7 0f                 ld8u	r7, [r5+]
 ac                    xor	r7, r4
 f2 28                 add	r6, r0
 02                    mov	r4, r6
 13                    add	r4, r7
 f5 29                 cmp	r6, r1
 d1 ef                 brne8	hash_bytes+17
 1b                    add	r6, r7
 02                    mov	r4, r6
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
 1a                    add	r6, r6
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
 f7 1e                 ld8u	r6, [r7+]
 f2 06                 add	r0, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	walk_both_directions+6
 a5                    xor	r5, r5
 c8 18                 addi.s8	r4, 0x18
 0d                    mov	r7, r5
 f4 b4                 dec16	r4
 48                    ld8u	r6, [r4]
 16                    add	r5, r6
 f4 af                 inc16	r7
 cf 18                 cmpi.s8	r7, 0x18
 d1 f6                 brne8	walk_both_directions+20
 01                    mov	r4, r5
 fa 7d                 lsr16i	r4, 0xd
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 94                    or	r5, r4
 f9 a2                 xor	r5, r0
 01                    mov	r4, r5
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
