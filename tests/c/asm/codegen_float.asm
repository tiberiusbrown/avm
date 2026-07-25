
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_float.c
00000a96 l     F .text	00000009 arithmetic
00000a9f l     F .text	00000003 divide_exact
00000aa2 l     F .text	00000002 sqrt_exact
00000aa4 l     F .text	00000012 select_min
00000ab6 l     F .text	00000012 select_max
00000ac8 l     F .text	00000004 convert_signed
00000acc l     F .text	00000004 convert_unsigned
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 math.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000980 avm_test_main
00000ad0 g     F .text	00000002 avm_halt
00000ad2 g     F .text	00000003 sqrtf

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
 e1 ba 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 c8                 adjsp	-0x38
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c ac              stsp16	[sp+0xac], r4
 f0 3d ae              stsp16	[sp+0xae], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c a8              stsp16	[sp+0xa8], r4
 f0 3d aa              stsp16	[sp+0xaa], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c a4              stsp16	[sp+0xa4], r4
 f0 3d a6              stsp16	[sp+0xa6], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c a0              stsp16	[sp+0xa0], r4
 f0 3d a2              stsp16	[sp+0xa2], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 9c              stsp16	[sp+0x9c], r4
 f0 3d 9e              stsp16	[sp+0x9e], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 98              stsp16	[sp+0x98], r4
 f0 3d 9a              stsp16	[sp+0x9a], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 94              stsp16	[sp+0x94], r4
 f0 3d 96              stsp16	[sp+0x96], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 90              stsp16	[sp+0x90], r4
 f0 3d 92              stsp16	[sp+0x92], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 8c              stsp16	[sp+0x8c], r4
 f0 3d 8e              stsp16	[sp+0x8e], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 88              stsp16	[sp+0x88], r4
 f0 3d 8a              stsp16	[sp+0x8a], r5
 f0 34 ac              ldsp16	r4, [sp+0xac]
 f0 35 ae              ldsp16	r5, [sp+0xae]
 f0 36 a8              ldsp16	r6, [sp+0xa8]
 f0 37 aa              ldsp16	r7, [sp+0xaa]
 f0 30 a4              ldsp16	r0, [sp+0xa4]
 f0 31 a6              ldsp16	r1, [sp+0xa6]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 f5 08              call16	arithmetic
 d6 04                 adjsp	0x4
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 00 04              ldi8	r0, 0x4
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 34 a0              ldsp16	r4, [sp+0xa0]
 f0 35 a2              ldsp16	r5, [sp+0xa2]
 f0 36 9c              ldsp16	r6, [sp+0x9c]
 f0 37 9e              ldsp16	r7, [sp+0x9e]
 e1 ce 08              call16	divide_exact
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 f0 34 98              ldsp16	r4, [sp+0x98]
 f0 35 9a              ldsp16	r5, [sp+0x9a]
 e1 ac 08              call16	sqrt_exact
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 f0 34 94              ldsp16	r4, [sp+0x94]
 f0 35 96              ldsp16	r5, [sp+0x96]
 f0 36 90              ldsp16	r6, [sp+0x90]
 f0 37 92              ldsp16	r7, [sp+0x92]
 e1 83 08              call16	select_min
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 f0 34 94              ldsp16	r4, [sp+0x94]
 f0 35 96              ldsp16	r5, [sp+0x96]
 f0 36 90              ldsp16	r6, [sp+0x90]
 f0 37 92              ldsp16	r7, [sp+0x92]
 e1 6a 08              call16	select_max
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 34 88              ldsp16	r4, [sp+0x88]
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 15 b4              leasp	r5, 0xb4
 f0 14 b0              leasp	r4, 0xb0
 d7 0f                 sys	memcpy
 f0 02 30              ldi8	r2, 0x30
 f0 35 72              ldsp16	r5, [sp+0x72]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f2 39                 sub	r1, r1
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 35 66              ldsp16	r5, [sp+0x66]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 35 62              ldsp16	r5, [sp+0x62]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 3d 86              stsp16	[sp+0x86], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 37 86              ldsp16	r7, [sp+0x86]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 35 5e              ldsp16	r5, [sp+0x5e]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 78              ldsp16	r6, [sp+0x78]
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 3d 82              stsp16	[sp+0x82], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 80              ldsp16	r6, [sp+0x80]
 f0 37 82              ldsp16	r7, [sp+0x82]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 3d 56              stsp16	[sp+0x56], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 6c              stsp16	[sp+0x6c], r6
 f0 3f 6e              stsp16	[sp+0x6e], r7
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 03 0f              ldi8	r3, 0xf
 f0 34 70              ldsp16	r4, [sp+0x70]
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 32              stsp16	[sp+0x32], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 74              ldsp16	r4, [sp+0x74]
 0c                    mov	r7, r4
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 07                    mov	r5, r7
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 34 74              ldsp16	r4, [sp+0x74]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f9 ec                 and	r7, r3
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 f0                 ldi8	r6, 0xf0
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 82                    and	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 f0 3e 68              stsp16	[sp+0x68], r6
 c8 37                 addi.s8	r4, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 36 70              ldsp16	r6, [sp+0x70]
 f0 37 72              ldsp16	r7, [sp+0x72]
 f5 28                 cmp	r6, r0
 f0 36 68              ldsp16	r6, [sp+0x68]
 fc 26                 cmov.ult	r4, r6
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 34 70              ldsp16	r4, [sp+0x70]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 c9 37                 addi.s8	r5, 0x37
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 f1 04                 mov	r0, r4
 fc 2f                 cmov.ult	r5, r7
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 76              ldsp16	r5, [sp+0x76]
 f1 74                 zext8	r4
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 f5 28                 cmp	r6, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 36 64              ldsp16	r6, [sp+0x64]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 4e              stsp16	[sp+0x4e], r4
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f0 3f 4c              stsp16	[sp+0x4c], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 f9 cc                 and	r6, r3
 f1 03                 mov	r0, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4e              stsp16	[sp+0x4e], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f0 37 4c              ldsp16	r7, [sp+0x4c]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 74              stsp16	[sp+0x74], r4
 ca 37                 addi.s8	r6, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f0 34 64              ldsp16	r4, [sp+0x64]
 f0 35 66              ldsp16	r5, [sp+0x66]
 f5 21                 cmp	r4, r1
 f0 34 74              ldsp16	r4, [sp+0x74]
 fc 34                 cmov.ult	r6, r4
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f0 3f 4c              stsp16	[sp+0x4c], r7
 f0 34 64              ldsp16	r4, [sp+0x64]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 03 a0              ldi8	r3, 0xa0
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 f1 74                 zext8	r4
 f5 23                 cmp	r4, r3
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 7c              stsp16	[sp+0x7c], r6
 f0 3f 7e              stsp16	[sp+0x7e], r7
 f0 36 60              ldsp16	r6, [sp+0x60]
 06                    mov	r5, r6
 f1 18                 mov	r3, r0
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 84              ldsp16	r6, [sp+0x84]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 37 86              ldsp16	r7, [sp+0x86]
 fa 98                 lsr16i	r6, 0x8
 f0 3e 48              stsp16	[sp+0x48], r6
 06                    mov	r5, r6
 a0                    xor	r4, r4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 84              ldsp16	r4, [sp+0x84]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 35 48              ldsp16	r5, [sp+0x48]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 48              stsp16	[sp+0x48], r5
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 74              stsp16	[sp+0x74], r4
 ca 37                 addi.s8	r6, 0x37
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 f0 34 74              ldsp16	r4, [sp+0x74]
 fc 34                 cmov.ult	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 34 60              ldsp16	r4, [sp+0x60]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 84              stsp16	[sp+0x84], r6
 f0 3f 86              stsp16	[sp+0x86], r7
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 78              ldsp16	r6, [sp+0x78]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 3e 74              stsp16	[sp+0x74], r6
 f0 3f 76              stsp16	[sp+0x76], r7
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f0 36 78              ldsp16	r6, [sp+0x78]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 74              stsp16	[sp+0x74], r6
 f0 3f 76              stsp16	[sp+0x76], r7
 c5 00 a0              ldi16	r5, 0xa000
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 f0 37 5e              ldsp16	r7, [sp+0x5e]
 39                    cmp	r6, r5
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 fc 34                 cmov.ult	r6, r4
 f0 3e 74              stsp16	[sp+0x74], r6
 f0 3f 76              stsp16	[sp+0x76], r7
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 01 a0              ldi8	r1, 0xa0
 f1 29                 mov	r6, r1
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 78              stsp16	[sp+0x78], r6
 f0 3f 7a              stsp16	[sp+0x7a], r7
 f0 36 58              ldsp16	r6, [sp+0x58]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 80              ldsp16	r6, [sp+0x80]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 3f 6a              stsp16	[sp+0x6a], r7
 f1 06                 mov	r0, r6
 f9 0c                 and	r0, r3
 f1 24                 mov	r5, r0
 f9 a9                 or	r5, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 05                 cmov.ult	r0, r5
 f0 36 80              ldsp16	r6, [sp+0x80]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c0 f0                 ldi8	r4, 0xf0
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 3f 6a              stsp16	[sp+0x6a], r7
 c5 00 a0              ldi16	r5, 0xa000
 f0 36 58              ldsp16	r6, [sp+0x58]
 f0 37 5a              ldsp16	r7, [sp+0x5a]
 39                    cmp	r6, r5
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 fc 34                 cmov.ult	r6, r4
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 3f 6a              stsp16	[sp+0x6a], r7
 f0 34 58              ldsp16	r4, [sp+0x58]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 c2 a0                 ldi8	r6, 0xa0
 3e                    cmp	r7, r6
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f1 0e                 mov	r1, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 3d 82              stsp16	[sp+0x82], r5
 f0 34 54              ldsp16	r4, [sp+0x54]
 f0 35 56              ldsp16	r5, [sp+0x56]
 f1 74                 zext8	r4
 f5 21                 cmp	r4, r1
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f1 74                 zext8	r4
 f5 21                 cmp	r4, r1
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c1 46                 ldi8	r5, 0x46
 01                    mov	r4, r5
 09                    mov	r6, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 01 3d              ldi8	r1, 0x3d
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 03 0a              ldi8	r3, 0xa
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 76              ldsp16	r5, [sp+0x76]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 35 40              ldsp16	r5, [sp+0x40]
 e1 49 02              call16	convert_signed
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 e1 41 02              call16	convert_unsigned
 f0 3c 78              stsp16	[sp+0x78], r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c1 a0                 ldi8	r5, 0xa0
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 50              stsp16	[sp+0x50], r6
 f0 36 54              ldsp16	r6, [sp+0x54]
 06                    mov	r5, r6
 f0 03 0f              ldi8	r3, 0xf
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 74              stsp16	[sp+0x74], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 3d 86              stsp16	[sp+0x86], r5
 f1 04                 mov	r0, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 6c              stsp16	[sp+0x6c], r6
 f0 3f 6e              stsp16	[sp+0x6e], r7
 f0 35 80              ldsp16	r5, [sp+0x80]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 80              stsp16	[sp+0x80], r5
 c0 f0                 ldi8	r4, 0xf0
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 37 86              ldsp16	r7, [sp+0x86]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 84              stsp16	[sp+0x84], r6
 f0 3f 86              stsp16	[sp+0x86], r7
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 37 86              ldsp16	r7, [sp+0x86]
 fc 34                 cmov.ult	r6, r4
 f0 3e 84              stsp16	[sp+0x84], r6
 f0 3f 86              stsp16	[sp+0x86], r7
 f0 35 78              ldsp16	r5, [sp+0x78]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4e              stsp16	[sp+0x4e], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 0b                    mov	r6, r7
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 48              stsp16	[sp+0x48], r6
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 35 78              ldsp16	r5, [sp+0x78]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f5 25                 cmp	r5, r1
 fc 34                 cmov.ult	r6, r4
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 55                 or	r2, r5
 c9 37                 addi.s8	r5, 0x37
 f5 21                 cmp	r4, r1
 fc 2a                 cmov.ult	r5, r2
 f0 01 3d              ldi8	r1, 0x3d
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 c1 0a                 ldi8	r5, 0xa
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 36 84              ldsp16	r6, [sp+0x84]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 02 01              ldi8	r2, 0x1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 34 70              ldsp16	r4, [sp+0x70]
 f0 35 72              ldsp16	r5, [sp+0x72]
 f0 69 8c              cmp32	q2, q3
 d1 65                 brne8	avm_test_main+2421
 aa                    xor	r6, r6
 c7 40 40              ldi16	r7, 0x4040
 f0 34 64              ldsp16	r4, [sp+0x64]
 f0 35 66              ldsp16	r5, [sp+0x66]
 f0 69 8c              cmp32	q2, q3
 d1 56                 brne8	avm_test_main+2421
 aa                    xor	r6, r6
 c7 10 41              ldi16	r7, 0x4110
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f0 69 8c              cmp32	q2, q3
 d1 47                 brne8	avm_test_main+2421
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 f0 35 5e              ldsp16	r5, [sp+0x5e]
 f0 69 8c              cmp32	q2, q3
 d1 38                 brne8	avm_test_main+2421
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 34 58              ldsp16	r4, [sp+0x58]
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 f0 69 8c              cmp32	q2, q3
 d1 29                 brne8	avm_test_main+2421
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f0 34 78              ldsp16	r4, [sp+0x78]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 0c              cmp32	q0, q3
 d1 0f                 brne8	avm_test_main+2421
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 69 c8              cmp32	q3, q2
 f8 0a                 cset.ne	r2
 f1 22                 mov	r4, r2
 d6 7f                 adjsp	0x7f
 d6 39                 adjsp	0x39
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<arithmetic>:
 ff 2b                 fmul	q2, q3
 f4 0e                 ldsp16	r6, [sp+0x3]
 f4 17                 ldsp16	r7, [sp+0x5]
 ff 0b                 fadd	q2, q3
 ef                    ret

<divide_exact>:
 ff 3b                 fdiv	q2, q3
 ef                    ret

<sqrt_exact>:
 d4 2e                 jmp8	sqrtf

<select_min>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<select_max>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<convert_signed>:
 ff c2 42              ftos16	r4, q2
 ef                    ret

<convert_unsigned>:
 ff c3 42              ftou16	r4, q2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<sqrtf>:
 ff 6a                 fsqrt	q2
 ef                    ret
