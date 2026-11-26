
template_specialization.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c4 34 12              ldi16	r4, 0x1234
 f0 f0 02              stm16	[0x102], r4
 c4 e1 18              ldi16	r4, 0x18e1
 f0 f0 04              stm16	[0x104], r4
 c4 8e 1f              ldi16	r4, 0x1f8e
 f0 f0 06              stm16	[0x106], r4
 c4 3b 26              ldi16	r4, 0x263b
 f0 f0 08              stm16	[0x108], r4
 c4 e8 2c              ldi16	r4, 0x2ce8
 f0 f0 0a              stm16	[0x10a], r4
 c4 95 33              ldi16	r4, 0x3395
 f0 f0 0c              stm16	[0x10c], r4
 c4 42 3a              ldi16	r4, 0x3a42
 f0 f0 0e              stm16	[0x10e], r4
 c4 ef 40              ldi16	r4, 0x40ef
 f0 f0 10              stm16	[0x110], r4
 c4 9c 47              ldi16	r4, 0x479c
 f0 f0 12              stm16	[0x112], r4
 c4 49 4e              ldi16	r4, 0x4e49
 f0 f0 14              stm16	[0x114], r4
 c4 f6 54              ldi16	r4, 0x54f6
 f0 f0 16              stm16	[0x116], r4
 c4 a3 5b              ldi16	r4, 0x5ba3
 f0 f0 18              stm16	[0x118], r4
 c4 50 62              ldi16	r4, 0x6250
 f0 f0 1a              stm16	[0x11a], r4
 c4 fd 68              ldi16	r4, 0x68fd
 f0 f0 1c              stm16	[0x11c], r4
 c4 aa 6f              ldi16	r4, 0x6faa
 f0 f0 1e              stm16	[0x11e], r4
 c4 57 76              ldi16	r4, 0x7657
 f0 f0 20              stm16	[0x120], r4
 c4 04 7d              ldi16	r4, 0x7d04
 f0 f0 22              stm16	[0x122], r4
 c4 b1 83              ldi16	r4, 0x83b1
 f0 f0 24              stm16	[0x124], r4
 c4 5e 8a              ldi16	r4, 0x8a5e
 f0 f0 26              stm16	[0x126], r4
 c4 0b 91              ldi16	r4, 0x910b
 f0 f0 28              stm16	[0x128], r4
 c4 b8 97              ldi16	r4, 0x97b8
 f0 f0 2a              stm16	[0x12a], r4
 c4 65 9e              ldi16	r4, 0x9e65
 f0 f0 2c              stm16	[0x12c], r4
 c4 12 a5              ldi16	r4, 0xa512
 f0 f0 2e              stm16	[0x12e], r4
 c4 bf ab              ldi16	r4, 0xabbf
 f0 f0 30              stm16	[0x130], r4
 c4 6c b2              ldi16	r4, 0xb26c
 f0 f0 32              stm16	[0x132], r4
 c4 19 b9              ldi16	r4, 0xb919
 f0 f0 34              stm16	[0x134], r4
 c4 c6 bf              ldi16	r4, 0xbfc6
 f0 f0 36              stm16	[0x136], r4
 c4 73 c6              ldi16	r4, 0xc673
 f0 f0 38              stm16	[0x138], r4
 c4 20 cd              ldi16	r4, 0xcd20
 f0 f0 3a              stm16	[0x13a], r4
 c4 cd d3              ldi16	r4, 0xd3cd
 f0 f0 3c              stm16	[0x13c], r4
 c4 7a da              ldi16	r4, 0xda7a
 f0 f0 3e              stm16	[0x13e], r4
 c4 27 e1              ldi16	r4, 0xe127
 f0 f0 40              stm16	[0x140], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 05                 mov	r0, r5
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 20                 ldi8	r5, 0x20
 c4 02 01              ldi16	r4, 0x102
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 f7 21                 ld16	r1, [r4+]
 f4 48                 stsp16	[sp+0x2], r4
 f1 21                 mov	r4, r1
 f2 20                 add	r4, r0
 d5 37                 call8	_ZL9transformILj3EEjj
 f1 14                 mov	r2, r4
 f9 42                 xor	r2, r0
 f1 22                 mov	r4, r2
 f9 86                 xor	r4, r1
 d5 3b                 call8	_ZL9transformILj7EEjj
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 f2 3b                 sub	r1, r3
 f1 21                 mov	r4, r1
 d5 3e                 call8	_ZL9transformILj11EEjj
 f4 11                 ldsp16	r5, [sp+0x4]
 f1 04                 mov	r0, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f9 0e                 xor	r0, r3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 d2                 brne8	-0x2e <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 18                 cmpi.s8	r5, 0x18
 d1 c3                 brne8	-0x3d <L0>
 f0 e0 00              stm16	[0x100], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<unsigned int transform<3u>(unsigned int)>:
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 99                    or	r6, r5
 c5 33 33              ldi16	r5, 0x3333
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<unsigned int transform<7u>(unsigned int)>:
 04                    mov	r5, r4
 fa 89                 lsr16i	r5, 0x9
 08                    mov	r6, r4
 fa 57                 lsl16i	r6, 0x7
 99                    or	r6, r5
 c5 77 77              ldi16	r5, 0x7777
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<unsigned int transform<11u>(unsigned int)>:
 04                    mov	r5, r4
 fa 85                 lsr16i	r5, 0x5
 08                    mov	r6, r4
 fa 5b                 lsl16i	r6, 0xb
 99                    or	r6, r5
 c5 bb bb              ldi16	r5, 0xbbbb
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
