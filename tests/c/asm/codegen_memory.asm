
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
00000524 l     F .text	00000027 hash_bytes
0000054b l     F .text	00000027 update_record
00000572 l     F .text	0000000a read_neighbors
0000057c l     F .text	000000ee walk_both_directions
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000030e avm_test_main
0000066a g     F .text	00000002 avm_halt

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
 e1 54 04              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 99                 adjsp	-0x67
 f0 10 4f              leasp	r0, 0x4f
 f1 20                 mov	r4, r0
 c2 18                 ldi8	r6, 0x18
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c4 41 62              ldi16	r4, 0x6241
 c5 8e a9              ldi16	r5, 0xa98e
 f0 3c 63              stsp16	[sp+0x63], r4
 f0 3d 65              stsp16	[sp+0x65], r5
 c4 df fc              ldi16	r4, 0xfcdf
 c5 18 27              ldi16	r5, 0x2718
 f0 3c 5f              stsp16	[sp+0x5f], r4
 f0 3d 61              stsp16	[sp+0x61], r5
 c4 65 86              ldi16	r4, 0x8665
 c5 9a bd              ldi16	r5, 0xbd9a
 f0 3c 5b              stsp16	[sp+0x5b], r4
 f0 3d 5d              stsp16	[sp+0x5d], r5
 c4 eb 08              ldi16	r4, 0x8eb
 c5 2c 43              ldi16	r5, 0x432c
 f0 3c 57              stsp16	[sp+0x57], r4
 f0 3d 59              stsp16	[sp+0x59], r5
 c4 79 9a              ldi16	r4, 0x9a79
 c5 b6 d1              ldi16	r5, 0xd1b6
 f0 3c 53              stsp16	[sp+0x53], r4
 f0 3d 55              stsp16	[sp+0x55], r5
 c4 07 24              ldi16	r4, 0x2407
 c5 40 5f              ldi16	r5, 0x5f40
 f0 3c 4f              stsp16	[sp+0x4f], r4
 f0 3d 51              stsp16	[sp+0x51], r5
 f0 11 37              leasp	r1, 0x37
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 0f                 sys	memcpy
 c2 0f                 ldi8	r6, 0xf
 f0 14 3a              leasp	r4, 0x3a
 f1 25                 mov	r5, r1
 d7 12                 sys	memmove
 f0 15 3c              leasp	r5, 0x3c
 f1 21                 mov	r4, r1
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 14 49              leasp	r4, 0x49
 c1 5c                 ldi8	r5, 0x5c
 c2 06                 ldi8	r6, 0x6
 d7 11                 sys	memset
 c4 04 01              ldi16	r4, 0x104
 f0 6c d9              ld16	r6, [r4+]
 ed e8 20              ld8u	r7, [r4+0]
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 2f 36              stsp8	[sp+0x36], r7
 c4 00 01              ldi16	r4, 0x100
 f0 6a 88              ld32	q2, [r4]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f1 20                 mov	r4, r0
 e1 71 02              call16	hash_bytes
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 02 30              ldi8	r2, 0x30
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f1 21                 mov	r4, r1
 e1 51 02              call16	hash_bytes
 f0 3c 26              stsp16	[sp+0x26], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 14 30              leasp	r4, 0x30
 e1 5d 02              call16	update_record
 f0 3c 28              stsp16	[sp+0x28], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 14 3e              leasp	r4, 0x3e
 e1 69 02              call16	read_neighbors
 f0 3c 2a              stsp16	[sp+0x2a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f1 20                 mov	r4, r0
 e1 59 02              call16	walk_both_directions
 f0 3c 2c              stsp16	[sp+0x2c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 06                    mov	r5, r6
 f0 00 0f              ldi8	r0, 0xf
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 37 26              ldsp16	r7, [sp+0x26]
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f1 28                 mov	r6, r0
 86                    and	r5, r6
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 35 28              ldsp16	r5, [sp+0x28]
 01                    mov	r4, r5
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2c                 cmp	r7, r0
 fc 26                 cmov.ult	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 0e                    mov	r7, r6
 f9 e9                 or	r7, r2
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 37                 cmov.ult	r6, r7
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 c9 37                 addi.s8	r5, 0x37
 f5 20                 cmp	r4, r0
 fc 2f                 cmov.ult	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cb 37                 addi.s8	r7, 0x37
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 c7 fa d5              ldi16	r7, 0xd5fa
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 33                    cmp	r4, r7
 f8 0b                 cset.ne	r3
 c7 cb d3              ldi16	r7, 0xd3cb
 f0 34 26              ldsp16	r4, [sp+0x26]
 33                    cmp	r4, r7
 f8 08                 cset.ne	r0
 f0 01 4d              ldi8	r1, 0x4d
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f9 0d                 or	r0, r3
 c4 b8 d5              ldi16	r4, 0xd5b8
 f0 35 28              ldsp16	r5, [sp+0x28]
 34                    cmp	r5, r4
 f8 0b                 cset.ne	r3
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f9 61                 or	r3, r0
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c4 b6 eb              ldi16	r4, 0xebb6
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 34                    cmp	r5, r4
 f8 0f                 cset.ne	r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f9 ed                 or	r7, r3
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c4 1c 5d              ldi16	r4, 0x5d1c
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 34                    cmp	r5, r4
 f8 08                 cset.ne	r0
 f9 1d                 or	r0, r7
 c3 0a                 ldi8	r7, 0xa
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 67                 adjsp	0x67
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
