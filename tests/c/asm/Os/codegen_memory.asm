
codegen_memory.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_memory.c
00000100 l     O .data	00000007 .L__const.avm_test_main.value
000005ab l     F .text	00000027 hash_bytes
000005d2 l     F .text	00000028 update_record
000005fa l     F .text	0000000a read_neighbors
00000604 l     F .text	00000029 walk_both_directions
00000000 l    df *ABS*	00000000 runtime.c
0000062f l       .init_array	00000000 .hidden __init_array_end
0000062f l       .init_array	00000000 .hidden __init_array_start
0000062f l       .fini_array	00000000 .hidden __fini_array_start
0000062f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002d4 avm_test_main
0000062d g     F .text	00000002 avm_halt
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
 e1 0f 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2f 06              ldi16	r4, 0x62f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2f 06              ldi16	r6, 0x62f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 2f 06           ldi16	r0, 0x62f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2f 06           ldi16	r2, 0x62f
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
 c4 2f 06              ldi16	r4, 0x62f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2f 06              ldi16	r6, 0x62f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 2f 06           ldi16	r2, 0x62f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2f 06           ldi16	r0, 0x62f
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
 d6 99                 adjsp	-0x67
 f0 02 18              ldi8	r2, 0x18
 f0 11 4f              leasp	r1, 0x4f
 f1 21                 mov	r4, r1
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c1 a5                 ldi8	r5, 0xa5
 c2 18                 ldi8	r6, 0x18
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 11                 sys	memset
 af                    xor	r7, r7
 c2 07                 ldi8	r6, 0x7
 f0 00 fe              ldi8	r0, 0xfe
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 fa 81                 lsr16i	r5, 0x1
 a6                    xor	r5, r6
 f0 6d a3              st8	[r1+], r5
 ca 1d                 addi.s8	r6, 0x1d
 f4 af                 inc16	r7
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ed                 brne8	avm_test_main+32
 f0 17 4f              leasp	r7, 0x4f
 f0 11 37              leasp	r1, 0x37
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 f0 3f 2e              stsp16	[sp+0x2e], r7
 c2 18                 ldi8	r6, 0x18
 d7 0f                 sys	memcpy
 f0 14 3a              leasp	r4, 0x3a
 f1 25                 mov	r5, r1
 c2 0f                 ldi8	r6, 0xf
 d7 12                 sys	memmove
 f0 15 3c              leasp	r5, 0x3c
 f1 21                 mov	r4, r1
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 14 49              leasp	r4, 0x49
 c1 5c                 ldi8	r5, 0x5c
 c2 06                 ldi8	r6, 0x6
 d7 11                 sys	memset
 c5 00 01              ldi16	r5, 0x100
 f0 12 30              leasp	r2, 0x30
 f1 22                 mov	r4, r2
 c2 07                 ldi8	r6, 0x7
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 e1 66 02              call16	hash_bytes
 f0 3c 2c              stsp16	[sp+0x2c], r4
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
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f1 21                 mov	r4, r1
 e1 46 02              call16	hash_bytes
 f0 3c 26              stsp16	[sp+0x26], r4
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
 f1 22                 mov	r4, r2
 e1 53 02              call16	update_record
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
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 14 3e              leasp	r4, 0x3e
 e1 60 02              call16	read_neighbors
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
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 e1 4f 02              call16	walk_both_directions
 f0 3c 2e              stsp16	[sp+0x2e], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 09                    mov	r6, r5
 c3 0f                 ldi8	r7, 0xf
 8b                    and	r6, r7
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 8b                    and	r6, r7
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 35 26              ldsp16	r5, [sp+0x26]
 09                    mov	r6, r5
 8b                    and	r6, r7
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 8b                    and	r6, r7
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 35 28              ldsp16	r5, [sp+0x28]
 09                    mov	r6, r5
 8b                    and	r6, r7
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 07                    mov	r5, r7
 89                    and	r6, r5
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 0e                    mov	r7, r6
 8d                    and	r7, r5
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 14              stsp16	[sp+0x14], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8d                    and	r7, r5
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 89                    and	r6, r5
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 89                    and	r6, r5
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 0d                    mov	r7, r5
 f9 ed                 or	r7, r3
 c9 37                 addi.s8	r5, 0x37
 f5 20                 cmp	r4, r0
 fc 2f                 cmov.ult	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 f9 71                 or	r3, r4
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 23                 cmov.ult	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 c4 fa d5              ldi16	r4, 0xd5fa
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 3c                    cmp	r7, r4
 f8 08                 cset.ne	r0
 c4 cb d3              ldi16	r4, 0xd3cb
 f0 37 26              ldsp16	r7, [sp+0x26]
 3c                    cmp	r7, r4
 f8 0f                 cset.ne	r7
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 f9 e1                 or	r7, r0
 c4 b8 d5              ldi16	r4, 0xd5b8
 f0 35 28              ldsp16	r5, [sp+0x28]
 34                    cmp	r5, r4
 f8 08                 cset.ne	r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f9 1d                 or	r0, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c4 b6 eb              ldi16	r4, 0xebb6
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 38                    cmp	r6, r4
 f8 0e                 cset.ne	r6
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f9 c1                 or	r6, r0
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c4 1c 5d              ldi16	r4, 0x5d1c
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 3c                    cmp	r7, r4
 f8 08                 cset.ne	r0
 f9 19                 or	r0, r6
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
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
 fa 43                 lsl16i	r5, 0x3
 94                    or	r5, r4
 f9 a2                 xor	r5, r0
 01                    mov	r4, r5
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
