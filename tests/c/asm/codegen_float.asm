
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_float.c
00000afc l     F .text	00000009 arithmetic
00000b05 l     F .text	00000003 divide_exact
00000b08 l     F .text	00000002 sqrt_exact
00000b0a l     F .text	00000012 select_min
00000b1c l     F .text	00000012 select_max
00000b2e l     F .text	00000004 convert_signed
00000b32 l     F .text	00000004 convert_unsigned
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 math.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000009e6 avm_test_main
00000b36 g     F .text	00000002 avm_halt
00000b38 g     F .text	00000003 sqrtf

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
 e1 20 0a              call16	avm_halt

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
 d6 fc                 adjsp	avm_test_main+126
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 5b 09              call16	arithmetic
 d6 04                 adjsp	avm_test_main+145
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 00 04              ldi8	r0, 0x4
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 28                 mov	r6, r0
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 3d 86              stsp16	[sp+0x86], r5
 f0 34 a0              ldsp16	r4, [sp+0xa0]
 f0 35 a2              ldsp16	r5, [sp+0xa2]
 f0 36 9c              ldsp16	r6, [sp+0x9c]
 f0 37 9e              ldsp16	r7, [sp+0x9e]
 e1 2f 09              call16	divide_exact
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 28                 mov	r6, r0
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 3d 82              stsp16	[sp+0x82], r5
 f0 34 98              ldsp16	r4, [sp+0x98]
 f0 35 9a              ldsp16	r5, [sp+0x9a]
 e1 08 09              call16	sqrt_exact
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 28                 mov	r6, r0
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 34 94              ldsp16	r4, [sp+0x94]
 f0 35 96              ldsp16	r5, [sp+0x96]
 f0 36 90              ldsp16	r6, [sp+0x90]
 f0 37 92              ldsp16	r7, [sp+0x92]
 e1 da 08              call16	select_min
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 28                 mov	r6, r0
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 f0 34 94              ldsp16	r4, [sp+0x94]
 f0 35 96              ldsp16	r5, [sp+0x96]
 f0 36 90              ldsp16	r6, [sp+0x90]
 f0 37 92              ldsp16	r7, [sp+0x92]
 e1 bc 08              call16	select_max
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 28                 mov	r6, r0
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 0f                 sys	memcpy
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 34 88              ldsp16	r4, [sp+0x88]
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c b4              stsp16	[sp+0xb4], r4
 f0 3d b6              stsp16	[sp+0xb6], r5
 f0 14 b4              leasp	r4, 0xb4
 f0 15 b0              leasp	r5, 0xb0
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 0f                 sys	memcpy
 f0 02 30              ldi8	r2, 0x30
 f0 35 86              ldsp16	r5, [sp+0x86]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 58              stsp16	[sp+0x58], r6
 f0 3f 5a              stsp16	[sp+0x5a], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 35 82              ldsp16	r5, [sp+0x82]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 3f 6a              stsp16	[sp+0x6a], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 3f 66              stsp16	[sp+0x66], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 60              stsp16	[sp+0x60], r6
 f0 3f 62              stsp16	[sp+0x62], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 35 76              ldsp16	r5, [sp+0x76]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 6c              stsp16	[sp+0x6c], r6
 f0 3f 6e              stsp16	[sp+0x6e], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 34 b0              ldsp16	r4, [sp+0xb0]
 f0 35 b2              ldsp16	r5, [sp+0xb2]
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 54              stsp16	[sp+0x54], r6
 f0 3f 56              stsp16	[sp+0x56], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 03 0f              ldi8	r3, 0xf
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
 fa 78                 lsr16i	r4, 0x8
 f0 36 58              ldsp16	r6, [sp+0x58]
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
 f0 3e 70              stsp16	[sp+0x70], r6
 f0 3f 72              stsp16	[sp+0x72], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 f1 05                 mov	r0, r5
 f9 09                 or	r0, r2
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 30                 cmov.ult	r6, r0
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 36 58              ldsp16	r6, [sp+0x58]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 36              stsp16	[sp+0x36], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 34              stsp16	[sp+0x34], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 70              ldsp16	r6, [sp+0x70]
 f0 37 72              ldsp16	r7, [sp+0x72]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 50              stsp16	[sp+0x50], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 70              stsp16	[sp+0x70], r6
 f0 3f 72              stsp16	[sp+0x72], r7
 c4 00 a0              ldi16	r4, 0xa000
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 37 86              ldsp16	r7, [sp+0x86]
 38                    cmp	r6, r4
 f0 34 70              ldsp16	r4, [sp+0x70]
 f0 35 72              ldsp16	r5, [sp+0x72]
 f0 36 50              ldsp16	r6, [sp+0x50]
 fc 26                 cmov.ult	r4, r6
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
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
 f0 36 58              ldsp16	r6, [sp+0x58]
 f0 37 5a              ldsp16	r7, [sp+0x5a]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
 fa 78                 lsr16i	r4, 0x8
 f0 36 68              ldsp16	r6, [sp+0x68]
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
 f0 3e 50              stsp16	[sp+0x50], r6
 f0 3f 52              stsp16	[sp+0x52], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 36 68              ldsp16	r6, [sp+0x68]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 36 50              ldsp16	r6, [sp+0x50]
 f0 37 52              ldsp16	r7, [sp+0x52]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 58              stsp16	[sp+0x58], r4
 ca 37                 addi.s8	r6, 0x37
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 f0 34 58              ldsp16	r4, [sp+0x58]
 fc 34                 cmov.ult	r6, r4
 f0 3e 50              stsp16	[sp+0x50], r6
 f0 3f 52              stsp16	[sp+0x52], r7
 f0 34 80              ldsp16	r4, [sp+0x80]
 f0 35 82              ldsp16	r5, [sp+0x82]
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
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 fa 78                 lsr16i	r4, 0x8
 f0 36 64              ldsp16	r6, [sp+0x64]
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
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 36 64              ldsp16	r6, [sp+0x64]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 58              stsp16	[sp+0x58], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 68              stsp16	[sp+0x68], r6
 f0 3f 6a              stsp16	[sp+0x6a], r7
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 36 58              ldsp16	r6, [sp+0x58]
 fc 26                 cmov.ult	r4, r6
 f0 3c 68              stsp16	[sp+0x68], r4
 f0 3d 6a              stsp16	[sp+0x6a], r5
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 35 7e              ldsp16	r5, [sp+0x7e]
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
 f0 36 64              ldsp16	r6, [sp+0x64]
 f0 37 66              ldsp16	r7, [sp+0x66]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 78              ldsp16	r4, [sp+0x78]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 fa 78                 lsr16i	r4, 0x8
 f0 36 60              ldsp16	r6, [sp+0x60]
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
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 3f 66              stsp16	[sp+0x66], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 36 60              ldsp16	r6, [sp+0x60]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 64              ldsp16	r6, [sp+0x64]
 f0 37 66              ldsp16	r7, [sp+0x66]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 58              stsp16	[sp+0x58], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 3f 66              stsp16	[sp+0x66], r7
 f0 36 78              ldsp16	r6, [sp+0x78]
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 f0 34 64              ldsp16	r4, [sp+0x64]
 f0 35 66              ldsp16	r5, [sp+0x66]
 f0 36 58              ldsp16	r6, [sp+0x58]
 fc 26                 cmov.ult	r4, r6
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
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
 f0 36 60              ldsp16	r6, [sp+0x60]
 f0 37 62              ldsp16	r7, [sp+0x62]
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 74              ldsp16	r4, [sp+0x74]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 76              ldsp16	r5, [sp+0x76]
 fa 78                 lsr16i	r4, 0x8
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 f1 0f                 mov	r1, r7
 f9 29                 or	r1, r2
 f1 07                 mov	r0, r7
 f0 08 37              addi.s8	r0, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 01                 cmov.ult	r0, r1
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 07                    mov	r5, r7
 c9 37                 addi.s8	r5, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 f0                 ldi8	r4, 0xf0
 f0 36 60              ldsp16	r6, [sp+0x60]
 f0 37 62              ldsp16	r7, [sp+0x62]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 58              stsp16	[sp+0x58], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 60              stsp16	[sp+0x60], r6
 f0 3f 62              stsp16	[sp+0x62], r7
 f0 36 74              ldsp16	r6, [sp+0x74]
 f0 37 76              ldsp16	r7, [sp+0x76]
 c5 00 a0              ldi16	r5, 0xa000
 39                    cmp	r6, r5
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f0 36 58              ldsp16	r6, [sp+0x58]
 fc 26                 cmov.ult	r4, r6
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 76              ldsp16	r5, [sp+0x76]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f1 74                 zext8	r4
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 0d                    mov	r7, r5
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 25                 cmp	r5, r1
 fc 26                 cmov.ult	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 54              ldsp16	r4, [sp+0x54]
 f0 35 56              ldsp16	r5, [sp+0x56]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 c0 46                 ldi8	r4, 0x46
 f0 3c 6c              stsp16	[sp+0x6c], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 58              stsp16	[sp+0x58], r4
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 70              stsp16	[sp+0x70], r4
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 f0 35 48              ldsp16	r5, [sp+0x48]
 e1 6c 02              call16	convert_signed
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 e1 64 02              call16	convert_unsigned
 f0 3c 68              stsp16	[sp+0x68], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 58              stsp16	[sp+0x58], r6
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 f0 35 5e              ldsp16	r5, [sp+0x5e]
 fa 78                 lsr16i	r4, 0x8
 f0 36 54              ldsp16	r6, [sp+0x54]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 50              stsp16	[sp+0x50], r4
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 f1 05                 mov	r0, r5
 f0 08 37              addi.s8	r0, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 06                 cmov.ult	r0, r6
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 36 50              ldsp16	r6, [sp+0x50]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 50              stsp16	[sp+0x50], r4
 c0 f0                 ldi8	r4, 0xf0
 f0 36 70              ldsp16	r6, [sp+0x70]
 f0 37 72              ldsp16	r7, [sp+0x72]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 70              stsp16	[sp+0x70], r6
 f0 3f 72              stsp16	[sp+0x72], r7
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 f0 37 5e              ldsp16	r7, [sp+0x5e]
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 f0 36 70              ldsp16	r6, [sp+0x70]
 f0 37 72              ldsp16	r7, [sp+0x72]
 fc 34                 cmov.ult	r6, r4
 f0 3e 70              stsp16	[sp+0x70], r6
 f0 3f 72              stsp16	[sp+0x72], r7
 f0 36 68              ldsp16	r6, [sp+0x68]
 02                    mov	r4, r6
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 4a              stsp16	[sp+0x4a], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 46              stsp16	[sp+0x46], r6
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 03                    mov	r4, r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 44              stsp16	[sp+0x44], r6
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 37                 cmov.ult	r6, r7
 f0 35 68              ldsp16	r5, [sp+0x68]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 25                 cmp	r5, r1
 fc 27                 cmov.ult	r4, r7
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 f9 5d                 or	r2, r7
 cb 37                 addi.s8	r7, 0x37
 f5 25                 cmp	r5, r1
 fc 3a                 cmov.ult	r7, r2
 f0 01 3d              ldi8	r1, 0x3d
 b4                    push16	r4
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 35 58              ldsp16	r5, [sp+0x58]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 44              ldsp16	r5, [sp+0x44]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 36 68              ldsp16	r6, [sp+0x68]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c1 46                 ldi8	r5, 0x46
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c1 36                 ldi8	r5, 0x36
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 35 4e              ldsp16	r5, [sp+0x4e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 50              ldsp16	r5, [sp+0x50]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 18              ldsp16	r5, [sp+0x18]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 54              ldsp16	r5, [sp+0x54]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 36 70              ldsp16	r6, [sp+0x70]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 60              ldsp16	r5, [sp+0x60]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 d7 00                 sys	debug_putc
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 35 86              ldsp16	r5, [sp+0x86]
 f0 69 8c              cmp32	q2, q3
 d1 5c                 brne8	avm_test_main+2513
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 f0 36 80              ldsp16	r6, [sp+0x80]
 f0 37 82              ldsp16	r7, [sp+0x82]
 f0 69 c0              cmp32	q3, q0
 d1 5b                 brne8	avm_test_main+2529
 f2 30                 sub	r0, r0
 f0 05 10 41           ldi16	r1, 0x4110
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 69 c0              cmp32	q3, q0
 d1 45                 brne8	avm_test_main+2524
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 69 8c              cmp32	q2, q3
 f0 00 01              ldi8	r0, 0x1
 d1 28                 brne8	avm_test_main+2513
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 76              ldsp16	r5, [sp+0x76]
 f0 69 8c              cmp32	q2, q3
 d1 19                 brne8	avm_test_main+2513
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 4c              cmp32	q1, q3
 d1 0f                 brne8	avm_test_main+2513
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 f0 37 5e              ldsp16	r7, [sp+0x5e]
 f0 69 c8              cmp32	q3, q2
 f8 08                 cset.ne	r0
 f1 20                 mov	r4, r0
 d6 7f                 adjsp	sqrtf+50
 d6 39                 adjsp	select_max+10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 00 01              ldi8	r0, 0x1
 d4 f0                 jmp8	avm_test_main+2513
 f0 00 01              ldi8	r0, 0x1
 d4 eb                 jmp8	avm_test_main+2513

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
