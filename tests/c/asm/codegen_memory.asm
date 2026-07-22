
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
0000052b l     F .text	0000002e hash_bytes
00000559 l     F .text	00000028 update_record
00000581 l     F .text	0000000a read_neighbors
0000058b l     F .text	00000029 walk_both_directions
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000315 avm_test_main
000005b4 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9e 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 97                 adjsp	-0x69
 f0 02 18              ldi8	r2, 0x18
 c1 a5                 ldi8	r5, 0xa5
 f0 14 51              leasp	r4, 0x51
 f0 3c 30              stsp16	[sp+0x30], r4
 f1 2a                 mov	r6, r2
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 11                 sys	memset
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 04                    mov	r5, r4
 f2 39                 sub	r1, r1
 c3 07                 ldi8	r7, 0x7
 f0 00 fe              ldi8	r0, 0xfe
 f1 29                 mov	r6, r1
 f9 c0                 and	r6, r0
 fa 91                 lsr16i	r6, 0x1
 ab                    xor	r6, r7
 f6 0e                 st8	[r5+], r6
 cb 1d                 addi.s8	r7, 0x1d
 f4 a9                 inc16	r1
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ed                 brne8	avm_test_main+38
 f0 00 18              ldi8	r0, 0x18
 f0 17 51              leasp	r7, 0x51
 f0 14 39              leasp	r4, 0x39
 f0 3c 30              stsp16	[sp+0x30], r4
 07                    mov	r5, r7
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f1 28                 mov	r6, r0
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 0f                 sys	memcpy
 f1 0c                 mov	r1, r4
 c2 0f                 ldi8	r6, 0xf
 f0 14 3c              leasp	r4, 0x3c
 f1 25                 mov	r5, r1
 d7 12                 sys	memmove
 c0 0c                 ldi8	r4, 0xc
 f0 15 3e              leasp	r5, 0x3e
 08                    mov	r6, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 12                 sys	memmove
 c2 06                 ldi8	r6, 0x6
 c1 5c                 ldi8	r5, 0x5c
 f0 14 4b              leasp	r4, 0x4b
 d7 11                 sys	memset
 c2 07                 ldi8	r6, 0x7
 c5 00 01              ldi16	r5, 0x100
 f0 14 32              leasp	r4, 0x32
 d7 0f                 sys	memcpy
 f1 14                 mov	r2, r4
 03                    mov	r4, r7
 e1 96 02              call16	hash_bytes
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 03 30              ldi8	r3, 0x30
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 f1 21                 mov	r4, r1
 e1 76 02              call16	hash_bytes
 f0 3c 2e              stsp16	[sp+0x2e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f1 22                 mov	r4, r2
 e1 8a 02              call16	update_record
 f0 3c 28              stsp16	[sp+0x28], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 14 40              leasp	r4, 0x40
 e1 97 02              call16	read_neighbors
 f0 3c 2c              stsp16	[sp+0x2c], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 e1 86 02              call16	walk_both_directions
 f0 3c 2a              stsp16	[sp+0x2a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 36 30              ldsp16	r6, [sp+0x30]
 02                    mov	r4, r6
 f0 00 0f              ldi8	r0, 0xf
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1a              stsp16	[sp+0x1a], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1c              stsp16	[sp+0x1c], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 28                 mov	r6, r0
 82                    and	r4, r6
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 07                    mov	r5, r7
 86                    and	r5, r6
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 30              ldsp16	r4, [sp+0x30]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f0 36 28              ldsp16	r6, [sp+0x28]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 27                 cmov.ult	r4, r7
 f4 50                 stsp16	[sp+0x4], r4
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 c7 fa d5              ldi16	r7, 0xd5fa
 f0 34 30              ldsp16	r4, [sp+0x30]
 33                    cmp	r4, r7
 f8 0f                 cset.ne	r7
 f0 04 cb d3           ldi16	r0, 0xd3cb
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f5 20                 cmp	r4, r0
 f8 08                 cset.ne	r0
 f0 01 4d              ldi8	r1, 0x4d
 f1 21                 mov	r4, r1
 f0 3c 30              stsp16	[sp+0x30], r4
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f9 1d                 or	r0, r7
 c4 b8 d5              ldi16	r4, 0xd5b8
 38                    cmp	r6, r4
 f8 09                 cset.ne	r1
 c3 3d                 ldi8	r7, 0x3d
 03                    mov	r4, r7
 f0 3c 2e              stsp16	[sp+0x2e], r4
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f9 21                 or	r1, r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c4 b6 eb              ldi16	r4, 0xebb6
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 38                    cmp	r6, r4
 f8 0f                 cset.ne	r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f9 e5                 or	r7, r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c4 1c 5d              ldi16	r4, 0x5d1c
 34                    cmp	r5, r4
 f8 08                 cset.ne	r0
 f9 1d                 or	r0, r7
 c0 0a                 ldi8	r4, 0xa
 f0 3c 2c              stsp16	[sp+0x2c], r4
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 69                 adjsp	walk_both_directions+4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 c4 0f 1d              ldi16	r4, 0x1d0f
 f0 04 ff fe           ldi16	r0, 0xfeff
 f0 06 01 01           ldi16	r2, 0x101
 c7 17 17              ldi16	r7, 0x1717
 08                    mov	r6, r4
 fa 9b                 lsr16i	r6, 0xb
 fa 35                 lsl16i	r4, 0x5
 92                    or	r4, r6
 f7 09                 ld8u	r1, [r5+]
 f9 32                 xor	r1, r4
 f2 02                 add	r0, r2
 f1 20                 mov	r4, r0
 f2 21                 add	r4, r1
 f5 07                 cmp	r0, r7
 d1 ec                 brne8	hash_bytes+18
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
 aa                    xor	r6, r6
 c1 18                 ldi8	r5, 0x18
 0c                    mov	r7, r4
 f7 18                 ld8u	r0, [r7+]
 f2 28                 add	r6, r0
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	walk_both_directions+5
 a5                    xor	r5, r5
 c8 18                 addi.s8	r4, 0x18
 0d                    mov	r7, r5
 f4 b4                 dec16	r4
 f5 30                 ld8u	r0, [r4]
 f2 24                 add	r5, r0
 f4 af                 inc16	r7
 cf 18                 cmpi.s8	r7, 0x18
 d1 f4                 brne8	walk_both_directions+19
 01                    mov	r4, r5
 fa 7d                 lsr16i	r4, 0xd
 fa 43                 lsl16i	r5, 0x3
 94                    or	r5, r4
 a6                    xor	r5, r6
 01                    mov	r4, r5
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
