
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_float.c
00000ae2 l     F .text	00000009 arithmetic
00000aeb l     F .text	00000003 divide_exact
00000aee l     F .text	00000002 sqrt_exact
00000af0 l     F .text	0000000f select_min
00000aff l     F .text	0000000f select_max
00000b0e l     F .text	00000004 convert_signed
00000b12 l     F .text	00000004 convert_unsigned
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 math.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000009cc avm_test_main
00000b16 g     F .text	00000002 avm_halt
00000b18 g     F .text	00000003 sqrtf

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
 e1 00 0a              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 c6                 adjsp	-0x3a
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c ae              stsp16	[sp+0xae], r4
 f0 3d b0              stsp16	[sp+0xb0], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c aa              stsp16	[sp+0xaa], r4
 f0 3d ac              stsp16	[sp+0xac], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c a6              stsp16	[sp+0xa6], r4
 f0 3d a8              stsp16	[sp+0xa8], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c a2              stsp16	[sp+0xa2], r4
 f0 3d a4              stsp16	[sp+0xa4], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 9e              stsp16	[sp+0x9e], r4
 f0 3d a0              stsp16	[sp+0xa0], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 9a              stsp16	[sp+0x9a], r4
 f0 3d 9c              stsp16	[sp+0x9c], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 96              stsp16	[sp+0x96], r4
 f0 3d 98              stsp16	[sp+0x98], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 92              stsp16	[sp+0x92], r4
 f0 3d 94              stsp16	[sp+0x94], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 8e              stsp16	[sp+0x8e], r4
 f0 3d 90              stsp16	[sp+0x90], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 8a              stsp16	[sp+0x8a], r4
 f0 3d 8c              stsp16	[sp+0x8c], r5
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 36 aa              ldsp16	r6, [sp+0xaa]
 f0 37 ac              ldsp16	r7, [sp+0xac]
 f0 30 a6              ldsp16	r0, [sp+0xa6]
 f0 31 a8              ldsp16	r1, [sp+0xa8]
 d6 fc                 adjsp	avm_test_main+126
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 41 09              call16	arithmetic
 d6 04                 adjsp	avm_test_main+145
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 c2 04                 ldi8	r6, 0x4
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 f0 3e 82              stsp16	[sp+0x82], r6
 d7 0f                 sys	memcpy
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 86              stsp16	[sp+0x86], r4
 f0 3d 88              stsp16	[sp+0x88], r5
 f0 34 a2              ldsp16	r4, [sp+0xa2]
 f0 35 a4              ldsp16	r5, [sp+0xa4]
 f0 36 9e              ldsp16	r6, [sp+0x9e]
 f0 37 a0              ldsp16	r7, [sp+0xa0]
 e1 1a 09              call16	divide_exact
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 f0 36 82              ldsp16	r6, [sp+0x82]
 d7 0f                 sys	memcpy
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 76              stsp16	[sp+0x76], r4
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 34 9a              ldsp16	r4, [sp+0x9a]
 f0 35 9c              ldsp16	r5, [sp+0x9c]
 e1 f7 08              call16	sqrt_exact
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 f0 36 82              ldsp16	r6, [sp+0x82]
 d7 0f                 sys	memcpy
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 72              stsp16	[sp+0x72], r4
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 34 96              ldsp16	r4, [sp+0x96]
 f0 35 98              ldsp16	r5, [sp+0x98]
 f0 36 92              ldsp16	r6, [sp+0x92]
 f0 37 94              ldsp16	r7, [sp+0x94]
 e1 cd 08              call16	select_min
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 f0 36 82              ldsp16	r6, [sp+0x82]
 d7 0f                 sys	memcpy
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 6e              stsp16	[sp+0x6e], r4
 f0 3d 70              stsp16	[sp+0x70], r5
 f0 34 96              ldsp16	r4, [sp+0x96]
 f0 35 98              ldsp16	r5, [sp+0x98]
 f0 36 92              ldsp16	r6, [sp+0x92]
 f0 37 94              ldsp16	r7, [sp+0x94]
 e1 b0 08              call16	select_max
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 f0 36 82              ldsp16	r6, [sp+0x82]
 d7 0f                 sys	memcpy
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 6a              stsp16	[sp+0x6a], r4
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 f0 35 90              ldsp16	r5, [sp+0x90]
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 f0 15 b6              leasp	r5, 0xb6
 f0 14 b2              leasp	r4, 0xb2
 d7 0f                 sys	memcpy
 f0 02 30              ldi8	r2, 0x30
 f0 35 88              ldsp16	r5, [sp+0x88]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f0 3f 60              stsp16	[sp+0x60], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 35 78              ldsp16	r5, [sp+0x78]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 35 74              ldsp16	r5, [sp+0x74]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 62              stsp16	[sp+0x62], r6
 f0 3f 64              stsp16	[sp+0x64], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 35 70              ldsp16	r5, [sp+0x70]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 7e              stsp16	[sp+0x7e], r6
 f0 3f 80              stsp16	[sp+0x80], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 3f 84              stsp16	[sp+0x84], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 f0 34 b2              ldsp16	r4, [sp+0xb2]
 f0 35 b4              ldsp16	r5, [sp+0xb4]
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 56              stsp16	[sp+0x56], r6
 f0 3f 58              stsp16	[sp+0x58], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 03 0f              ldi8	r3, 0xf
 f0 34 86              ldsp16	r4, [sp+0x86]
 f0 35 88              ldsp16	r5, [sp+0x88]
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 34 86              ldsp16	r4, [sp+0x86]
 f0 35 88              ldsp16	r5, [sp+0x88]
 fa 78                 lsr16i	r4, 0x8
 f0 36 5e              ldsp16	r6, [sp+0x5e]
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
 f0 3e 7a              stsp16	[sp+0x7a], r6
 f0 3f 7c              stsp16	[sp+0x7c], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 f1 05                 mov	r0, r5
 f9 09                 or	r0, r2
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 30                 cmov.ult	r6, r0
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f0 37 60              ldsp16	r7, [sp+0x60]
 f9 cc                 and	r6, r3
 0e                    mov	r7, r6
 f9 e9                 or	r7, r2
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2f                 cmov.ult	r5, r7
 f0 3d 38              stsp16	[sp+0x38], r5
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 36              stsp16	[sp+0x36], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 52              stsp16	[sp+0x52], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 7a              stsp16	[sp+0x7a], r6
 f0 3f 7c              stsp16	[sp+0x7c], r7
 c4 00 a0              ldi16	r4, 0xa000
 f0 36 86              ldsp16	r6, [sp+0x86]
 f0 37 88              ldsp16	r7, [sp+0x88]
 38                    cmp	r6, r4
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 f0 36 52              ldsp16	r6, [sp+0x52]
 fc 26                 cmov.ult	r4, r6
 f0 3c 7a              stsp16	[sp+0x7a], r4
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 34 86              ldsp16	r4, [sp+0x86]
 f0 35 88              ldsp16	r5, [sp+0x88]
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 fc 3d                 cmov.ult	r7, r5
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f0 37 60              ldsp16	r7, [sp+0x60]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 34 76              ldsp16	r4, [sp+0x76]
 f0 35 78              ldsp16	r5, [sp+0x78]
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 34 76              ldsp16	r4, [sp+0x76]
 f0 35 78              ldsp16	r5, [sp+0x78]
 fa 78                 lsr16i	r4, 0x8
 f0 36 66              ldsp16	r6, [sp+0x66]
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
 f0 3e 52              stsp16	[sp+0x52], r6
 f0 3f 54              stsp16	[sp+0x54], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 36 66              ldsp16	r6, [sp+0x66]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 36 52              ldsp16	r6, [sp+0x52]
 f0 37 54              ldsp16	r7, [sp+0x54]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 5e              stsp16	[sp+0x5e], r4
 ca 37                 addi.s8	r6, 0x37
 f0 34 76              ldsp16	r4, [sp+0x76]
 f0 35 78              ldsp16	r5, [sp+0x78]
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 fc 34                 cmov.ult	r6, r4
 f0 3e 52              stsp16	[sp+0x52], r6
 f0 3f 54              stsp16	[sp+0x54], r7
 f0 34 76              ldsp16	r4, [sp+0x76]
 f0 35 78              ldsp16	r5, [sp+0x78]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 36 66              ldsp16	r6, [sp+0x66]
 f0 37 68              ldsp16	r7, [sp+0x68]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 34 72              ldsp16	r4, [sp+0x72]
 f0 35 74              ldsp16	r5, [sp+0x74]
 fa 78                 lsr16i	r4, 0x8
 f0 36 62              ldsp16	r6, [sp+0x62]
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
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 36 62              ldsp16	r6, [sp+0x62]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 36 66              ldsp16	r6, [sp+0x66]
 f0 37 68              ldsp16	r7, [sp+0x68]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 5e              stsp16	[sp+0x5e], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 f0 34 66              ldsp16	r4, [sp+0x66]
 f0 35 68              ldsp16	r5, [sp+0x68]
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 fc 26                 cmov.ult	r4, r6
 f0 3c 66              stsp16	[sp+0x66], r4
 f0 3d 68              stsp16	[sp+0x68], r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 f0 35 74              ldsp16	r5, [sp+0x74]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 36 62              ldsp16	r6, [sp+0x62]
 f0 37 64              ldsp16	r7, [sp+0x64]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 f0 35 70              ldsp16	r5, [sp+0x70]
 fa 78                 lsr16i	r4, 0x8
 f0 36 7e              ldsp16	r6, [sp+0x7e]
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
 f0 3e 62              stsp16	[sp+0x62], r6
 f0 3f 64              stsp16	[sp+0x64], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 36 62              ldsp16	r6, [sp+0x62]
 f0 37 64              ldsp16	r7, [sp+0x64]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 5e              stsp16	[sp+0x5e], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 62              stsp16	[sp+0x62], r6
 f0 3f 64              stsp16	[sp+0x64], r7
 f0 36 6e              ldsp16	r6, [sp+0x6e]
 f0 37 70              ldsp16	r7, [sp+0x70]
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 f0 34 62              ldsp16	r4, [sp+0x62]
 f0 35 64              ldsp16	r5, [sp+0x64]
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 fc 26                 cmov.ult	r4, r6
 f0 3c 62              stsp16	[sp+0x62], r4
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 f0 35 70              ldsp16	r5, [sp+0x70]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 f0 37 80              ldsp16	r7, [sp+0x80]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 fa 78                 lsr16i	r4, 0x8
 f0 36 82              ldsp16	r6, [sp+0x82]
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
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f0 3f 60              stsp16	[sp+0x60], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 f1 05                 mov	r0, r5
 f0 08 37              addi.s8	r0, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 06                 cmov.ult	r0, r6
 f0 36 82              ldsp16	r6, [sp+0x82]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f0 37 60              ldsp16	r7, [sp+0x60]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 7e              stsp16	[sp+0x7e], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f0 3f 60              stsp16	[sp+0x60], r7
 f0 36 6a              ldsp16	r6, [sp+0x6a]
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 c5 00 a0              ldi16	r5, 0xa000
 39                    cmp	r6, r5
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 f0 35 60              ldsp16	r5, [sp+0x60]
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 fc 26                 cmov.ult	r4, r6
 f0 3c 5e              stsp16	[sp+0x5e], r4
 f0 3d 60              stsp16	[sp+0x60], r5
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 25                 cmp	r5, r1
 fc 26                 cmov.ult	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 f0 35 84              ldsp16	r5, [sp+0x84]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 0e                    mov	r7, r6
 f9 e9                 or	r7, r2
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 37                 cmov.ult	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f0 36 5a              ldsp16	r6, [sp+0x5a]
 f0 37 5c              ldsp16	r7, [sp+0x5c]
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 27                 cmov.ult	r4, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 36 56              ldsp16	r6, [sp+0x56]
 f0 37 58              ldsp16	r7, [sp+0x58]
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 27                 cmov.ult	r4, r7
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c2 46                 ldi8	r6, 0x46
 02                    mov	r4, r6
 f0 3c 82              stsp16	[sp+0x82], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 7e              stsp16	[sp+0x7e], r4
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 7a              stsp16	[sp+0x7a], r4
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 f0 35 54              ldsp16	r5, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 f0 35 68              ldsp16	r5, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 f0 35 64              ldsp16	r5, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 f0 35 60              ldsp16	r5, [sp+0x60]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 e1 5f 02              call16	convert_signed
 f0 3c 62              stsp16	[sp+0x62], r4
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 f0 35 4e              ldsp16	r5, [sp+0x4e]
 e1 57 02              call16	convert_unsigned
 f0 3c 5e              stsp16	[sp+0x5e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 4c              stsp16	[sp+0x4c], r6
 f0 34 62              ldsp16	r4, [sp+0x62]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 fa 78                 lsr16i	r4, 0x8
 f0 36 56              ldsp16	r6, [sp+0x56]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 46              stsp16	[sp+0x46], r4
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 66              stsp16	[sp+0x66], r4
 f0 3d 68              stsp16	[sp+0x68], r5
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 f1 05                 mov	r0, r5
 f0 08 37              addi.s8	r0, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 06                 cmov.ult	r0, r6
 f0 36 56              ldsp16	r6, [sp+0x56]
 f0 37 58              ldsp16	r7, [sp+0x58]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 56              stsp16	[sp+0x56], r4
 f0 36 46              ldsp16	r6, [sp+0x46]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 46              stsp16	[sp+0x46], r4
 c0 f0                 ldi8	r4, 0xf0
 f0 36 66              ldsp16	r6, [sp+0x66]
 f0 37 68              ldsp16	r7, [sp+0x68]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 36 5a              ldsp16	r6, [sp+0x5a]
 f0 37 5c              ldsp16	r7, [sp+0x5c]
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 f0 36 66              ldsp16	r6, [sp+0x66]
 f0 37 68              ldsp16	r7, [sp+0x68]
 fc 34                 cmov.ult	r6, r4
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 02                    mov	r4, r6
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 44              stsp16	[sp+0x44], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 36 62              ldsp16	r6, [sp+0x62]
 02                    mov	r4, r6
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 40              stsp16	[sp+0x40], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 37                 cmov.ult	r6, r7
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 c9 37                 addi.s8	r5, 0x37
 f5 21                 cmp	r4, r1
 fc 2f                 cmov.ult	r5, r7
 f0 34 62              ldsp16	r4, [sp+0x62]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 f9 5d                 or	r2, r7
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3a                 cmov.ult	r7, r2
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 f0 35 68              ldsp16	r5, [sp+0x68]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 34 86              ldsp16	r4, [sp+0x86]
 f0 35 88              ldsp16	r5, [sp+0x88]
 f0 69 8c              cmp32	q2, q3
 d1 5c                 brne8	avm_test_main+2487
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 f0 36 76              ldsp16	r6, [sp+0x76]
 f0 37 78              ldsp16	r7, [sp+0x78]
 f0 69 c0              cmp32	q3, q0
 d1 5b                 brne8	avm_test_main+2503
 f2 30                 sub	r0, r0
 f0 05 10 41           ldi16	r1, 0x4110
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 f0 69 c0              cmp32	q3, q0
 d1 45                 brne8	avm_test_main+2498
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 f0 35 70              ldsp16	r5, [sp+0x70]
 f0 69 8c              cmp32	q2, q3
 f0 00 01              ldi8	r0, 0x1
 d1 28                 brne8	avm_test_main+2487
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 f0 69 8c              cmp32	q2, q3
 d1 19                 brne8	avm_test_main+2487
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 4c              cmp32	q1, q3
 d1 0f                 brne8	avm_test_main+2487
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 36 5a              ldsp16	r6, [sp+0x5a]
 f0 37 5c              ldsp16	r7, [sp+0x5c]
 f0 69 c8              cmp32	q3, q2
 f8 08                 cset.ne	r0
 f1 20                 mov	r4, r0
 d6 7f                 adjsp	sqrtf+56
 d6 3b                 adjsp	convert_signed
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 00 01              ldi8	r0, 0x1
 d4 f0                 jmp8	avm_test_main+2487
 f0 00 01              ldi8	r0, 0x1
 d4 eb                 jmp8	avm_test_main+2487

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
 d4 28                 jmp8	sqrtf

<select_min>:
 b0                    push16	r0
 ff c8 0b              fcmp	r0, q2, q3
 f0 0c ff              cmpi.s8	r0, -0x1
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 ef                    ret

<select_max>:
 b0                    push16	r0
 ff c8 0b              fcmp	r0, q2, q3
 f0 0c 01              cmpi.s8	r0, 0x1
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
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
