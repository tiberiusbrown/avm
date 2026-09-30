
codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
000005cb l     F .text	00000147 hash_bytes
00000712 l     F .text	00000027 update_record
0000073d l     F .text	000000ee walk_both_directions
00000739 l     F .text	00000004 read_neighbors
00000000 l    df *ABS*	00000000 runtime.c
0000082d l       .init_array	00000000 .hidden __init_array_end
0000082d l       .init_array	00000000 .hidden __init_array_start
0000082d l       .fini_array	00000000 .hidden __fini_array_start
0000082d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002f4 avm_test_main
0000082b g     F .text	00000002 avm_halt
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
 e1 0d 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2d 08              ldi16	r4, 0x82d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2d 08              ldi16	r6, 0x82d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 2d 08           ldi16	r0, 0x82d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2d 08           ldi16	r2, 0x82d
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
 c4 2d 08              ldi16	r4, 0x82d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2d 08              ldi16	r6, 0x82d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 2d 08           ldi16	r2, 0x82d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2d 08           ldi16	r0, 0x82d
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
 d6 ad                 adjsp	-0x53
 f0 10 3b              leasp	r0, 0x3b
 f1 20                 mov	r4, r0
 c2 18                 ldi8	r6, 0x18
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c4 41 62              ldi16	r4, 0x6241
 c5 8e a9              ldi16	r5, 0xa98e
 f0 3c 4f              stsp16	[sp+0x4f], r4
 f0 3d 51              stsp16	[sp+0x51], r5
 c4 df fc              ldi16	r4, 0xfcdf
 c5 18 27              ldi16	r5, 0x2718
 f0 3c 4b              stsp16	[sp+0x4b], r4
 f0 3d 4d              stsp16	[sp+0x4d], r5
 c4 65 86              ldi16	r4, 0x8665
 c5 9a bd              ldi16	r5, 0xbd9a
 f0 3c 47              stsp16	[sp+0x47], r4
 f0 3d 49              stsp16	[sp+0x49], r5
 c4 eb 08              ldi16	r4, 0x8eb
 c5 2c 43              ldi16	r5, 0x432c
 f0 3c 43              stsp16	[sp+0x43], r4
 f0 3d 45              stsp16	[sp+0x45], r5
 c4 79 9a              ldi16	r4, 0x9a79
 c5 b6 d1              ldi16	r5, 0xd1b6
 f0 3c 3f              stsp16	[sp+0x3f], r4
 f0 3d 41              stsp16	[sp+0x41], r5
 c4 07 24              ldi16	r4, 0x2407
 c5 40 5f              ldi16	r5, 0x5f40
 f0 3c 3b              stsp16	[sp+0x3b], r4
 f0 3d 3d              stsp16	[sp+0x3d], r5
 f0 11 23              leasp	r1, 0x23
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 f0 38 12              stsp16	[sp+0x12], r0
 d7 0f                 sys	memcpy
 f0 02 0f              ldi8	r2, 0xf
 f0 14 26              leasp	r4, 0x26
 f1 25                 mov	r5, r1
 c2 0f                 ldi8	r6, 0xf
 d7 12                 sys	memmove
 f0 15 28              leasp	r5, 0x28
 f1 21                 mov	r4, r1
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 14 35              leasp	r4, 0x35
 c1 5c                 ldi8	r5, 0x5c
 c2 06                 ldi8	r6, 0x6
 d7 11                 sys	memset
 c4 04 01              ldi16	r4, 0x104
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 2f 22              stsp8	[sp+0x22], r7
 c4 00 01              ldi16	r4, 0x100
 f0 6a 88              ld32	q2, [r4]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f1 20                 mov	r4, r0
 e1 54 02              call16	hash_bytes
 f0 03 30              ldi8	r3, 0x30
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1a              stsp16	[sp+0x1a], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 fc 3d                 cmov.ult	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f1 21                 mov	r4, r1
 e1 15 02              call16	hash_bytes
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f0 14 1c              leasp	r4, 0x1c
 e1 22 03              call16	update_record
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f0 19 29              ldsp8u	r1, [sp+0x29]
 f0 1a 27              ldsp8u	r2, [sp+0x27]
 f0 34 12              ldsp16	r4, [sp+0x12]
 e1 fa 02              call16	walk_both_directions
 f0 3c 12              stsp16	[sp+0x12], r4
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 35 16              ldsp16	r5, [sp+0x16]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 37 14              ldsp16	r7, [sp+0x14]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2c                 cmp	r7, r0
 fc 2c                 cmov.ult	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e1 66 02              call16	read_neighbors
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c1 a0                 ldi8	r5, 0xa0
 3d                    cmp	r7, r5
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f1 77                 zext8	r7
 3d                    cmp	r7, r5
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 0e                    mov	r7, r6
 c1 0f                 ldi8	r5, 0xf
 8d                    and	r7, r5
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 7b                 stsp16	[sp+0xe], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8d                    and	r7, r5
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 03                    mov	r4, r7
 81                    and	r4, r5
 f1 0d                 mov	r1, r5
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 f5 2c                 cmp	r7, r0
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 f9 7d                 or	r3, r7
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3b                 cmov.ult	r7, r3
 c4 fa d5              ldi16	r4, 0xd5fa
 f0 36 18              ldsp16	r6, [sp+0x18]
 38                    cmp	r6, r4
 f8 08                 cset.ne	r0
 c4 cb d3              ldi16	r4, 0xd3cb
 f0 36 16              ldsp16	r6, [sp+0x16]
 38                    cmp	r6, r4
 f8 0a                 cset.ne	r2
 f9 41                 or	r2, r0
 c6 b8 d5              ldi16	r6, 0xd5b8
 f0 34 14              ldsp16	r4, [sp+0x14]
 32                    cmp	r4, r6
 f8 09                 cset.ne	r1
 f9 29                 or	r1, r2
 c4 1c 5d              ldi16	r4, 0x5d1c
 f0 36 12              ldsp16	r6, [sp+0x12]
 38                    cmp	r6, r4
 f8 08                 cset.ne	r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c4 b6 eb              ldi16	r4, 0xebb6
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f9 a5                 or	r5, r1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 f9 a1                 or	r5, r0
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d6 53                 adjsp	0x53
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 44                    ld8u	r5, [r4]
 c6 e3 01              ldi16	r6, 0x1e3
 a9                    xor	r6, r5
 fa 55                 lsl16i	r6, 0x5
 c1 14                 ldi8	r5, 0x14
 96                    or	r5, r6
 ed c8 21              ld8u	r6, [r4+1]
 a9                    xor	r6, r5
 c5 01 01              ldi16	r5, 0x101
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 22              ld8u	r6, [r4+2]
 a9                    xor	r6, r5
 c5 02 02              ldi16	r5, 0x202
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 23              ld8u	r6, [r4+3]
 a9                    xor	r6, r5
 c5 03 03              ldi16	r5, 0x303
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 24              ld8u	r6, [r4+4]
 a9                    xor	r6, r5
 c5 04 04              ldi16	r5, 0x404
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 25              ld8u	r6, [r4+5]
 a9                    xor	r6, r5
 c5 05 05              ldi16	r5, 0x505
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 26              ld8u	r6, [r4+6]
 a9                    xor	r6, r5
 c5 06 06              ldi16	r5, 0x606
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 27              ld8u	r6, [r4+7]
 a9                    xor	r6, r5
 c5 07 07              ldi16	r5, 0x707
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 28              ld8u	r6, [r4+8]
 a9                    xor	r6, r5
 c5 08 08              ldi16	r5, 0x808
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 29              ld8u	r6, [r4+9]
 a9                    xor	r6, r5
 c5 09 09              ldi16	r5, 0x909
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2a              ld8u	r6, [r4+10]
 a9                    xor	r6, r5
 c5 0a 0a              ldi16	r5, 0xa0a
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2b              ld8u	r6, [r4+11]
 a9                    xor	r6, r5
 c5 0b 0b              ldi16	r5, 0xb0b
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2c              ld8u	r6, [r4+12]
 a9                    xor	r6, r5
 c5 0c 0c              ldi16	r5, 0xc0c
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2d              ld8u	r6, [r4+13]
 a9                    xor	r6, r5
 c5 0d 0d              ldi16	r5, 0xd0d
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2e              ld8u	r6, [r4+14]
 a9                    xor	r6, r5
 c5 0e 0e              ldi16	r5, 0xe0e
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 2f              ld8u	r6, [r4+15]
 a9                    xor	r6, r5
 c5 0f 0f              ldi16	r5, 0xf0f
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 30              ld8u	r6, [r4+16]
 a9                    xor	r6, r5
 c5 10 10              ldi16	r5, 0x1010
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 31              ld8u	r6, [r4+17]
 a9                    xor	r6, r5
 c5 11 11              ldi16	r5, 0x1111
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 32              ld8u	r6, [r4+18]
 a9                    xor	r6, r5
 c5 12 12              ldi16	r5, 0x1212
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 33              ld8u	r6, [r4+19]
 a9                    xor	r6, r5
 c5 13 13              ldi16	r5, 0x1313
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 34              ld8u	r6, [r4+20]
 a9                    xor	r6, r5
 c5 14 14              ldi16	r5, 0x1414
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 35              ld8u	r6, [r4+21]
 a9                    xor	r6, r5
 c5 15 15              ldi16	r5, 0x1515
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 36              ld8u	r6, [r4+22]
 a9                    xor	r6, r5
 c5 16 16              ldi16	r5, 0x1616
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 ed c8 37              ld8u	r6, [r4+23]
 a9                    xor	r6, r5
 c4 17 17              ldi16	r4, 0x1717
 12                    add	r4, r6
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
 fa 48                 lsl16i	r5, 0x8
 91                    or	r4, r5
 ef                    ret

<walk_both_directions>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 04                    mov	r5, r4
 ed 8a 36              ld8u	r4, [r5+22]
 f0 3c 20              stsp16	[sp+0x20], r4
 ed ca 37              ld8u	r6, [r5+23]
 f0 3e 22              stsp16	[sp+0x22], r6
 18                    add	r6, r4
 ed 8a 35              ld8u	r4, [r5+21]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 18                    add	r6, r4
 ed 8a 34              ld8u	r4, [r5+20]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 18                    add	r6, r4
 ed 8a 33              ld8u	r4, [r5+19]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 18                    add	r6, r4
 ed 8a 32              ld8u	r4, [r5+18]
 f0 3c 18              stsp16	[sp+0x18], r4
 18                    add	r6, r4
 ed 8a 31              ld8u	r4, [r5+17]
 f0 3c 14              stsp16	[sp+0x14], r4
 18                    add	r6, r4
 ed 8a 30              ld8u	r4, [r5+16]
 f0 3c 10              stsp16	[sp+0x10], r4
 18                    add	r6, r4
 ed 8a 2f              ld8u	r4, [r5+15]
 f4 70                 stsp16	[sp+0xc], r4
 18                    add	r6, r4
 ed ea 21              ld8u	r7, [r5+1]
 f0 3f 12              stsp16	[sp+0x12], r7
 41                    ld8u	r4, [r5]
 f0 3c 16              stsp16	[sp+0x16], r4
 13                    add	r4, r7
 ed ea 22              ld8u	r7, [r5+2]
 f4 7b                 stsp16	[sp+0xe], r7
 13                    add	r4, r7
 ed ea 23              ld8u	r7, [r5+3]
 f4 6b                 stsp16	[sp+0xa], r7
 13                    add	r4, r7
 ed ea 24              ld8u	r7, [r5+4]
 f4 63                 stsp16	[sp+0x8], r7
 13                    add	r4, r7
 ed ea 25              ld8u	r7, [r5+5]
 f4 53                 stsp16	[sp+0x4], r7
 13                    add	r4, r7
 ed ea 2e              ld8u	r7, [r5+14]
 f4 5b                 stsp16	[sp+0x6], r7
 1b                    add	r6, r7
 ed ea 2d              ld8u	r7, [r5+13]
 f4 4b                 stsp16	[sp+0x2], r7
 1b                    add	r6, r7
 ed 6a 2c              ld8u	r3, [r5+12]
 f2 2b                 add	r6, r3
 ed 2a 2b              ld8u	r1, [r5+11]
 f2 29                 add	r6, r1
 ed ea 26              ld8u	r7, [r5+6]
 f4 43                 stsp16	[sp+0x0], r7
 13                    add	r4, r7
 ed ea 2a              ld8u	r7, [r5+10]
 ed 0a 29              ld8u	r0, [r5+9]
 ed 4a 28              ld8u	r2, [r5+8]
 ed aa 27              ld8u	r5, [r5+7]
 11                    add	r4, r5
 f2 22                 add	r4, r2
 f2 20                 add	r4, r0
 13                    add	r4, r7
 f2 21                 add	r4, r1
 f2 23                 add	r4, r3
 1b                    add	r6, r7
 f2 28                 add	r6, r0
 f2 2a                 add	r6, r2
 19                    add	r6, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 19                    add	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 19                    add	r6, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 19                    add	r6, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 19                    add	r6, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 19                    add	r6, r5
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 99                    or	r6, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 11                    add	r4, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 11                    add	r4, r5
 a2                    xor	r4, r6
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
