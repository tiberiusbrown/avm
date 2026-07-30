
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_float.c
00000a94 l     F .text	00000009 arithmetic
00000a9d l     F .text	00000003 divide_exact
00000aa0 l     F .text	00000002 sqrt_exact
00000aa2 l     F .text	00000012 select_min
00000ab4 l     F .text	00000012 select_max
00000ac6 l     F .text	00000004 convert_signed
00000aca l     F .text	00000004 convert_unsigned
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000097e avm_test_main
00000ad1 g     F .text	00000002 avm_halt
00000ace g     F .text	00000003 sqrtf

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
 e1 bb 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 ca                 adjsp	-0x36
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c aa              stsp16	[sp+0xaa], r4
 f0 3d ac              stsp16	[sp+0xac], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c a6              stsp16	[sp+0xa6], r4
 f0 3d a8              stsp16	[sp+0xa8], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c a2              stsp16	[sp+0xa2], r4
 f0 3d a4              stsp16	[sp+0xa4], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c 9e              stsp16	[sp+0x9e], r4
 f0 3d a0              stsp16	[sp+0xa0], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 9a              stsp16	[sp+0x9a], r4
 f0 3d 9c              stsp16	[sp+0x9c], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 96              stsp16	[sp+0x96], r4
 f0 3d 98              stsp16	[sp+0x98], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 92              stsp16	[sp+0x92], r4
 f0 3d 94              stsp16	[sp+0x94], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 8e              stsp16	[sp+0x8e], r4
 f0 3d 90              stsp16	[sp+0x90], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 8a              stsp16	[sp+0x8a], r4
 f0 3d 8c              stsp16	[sp+0x8c], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 86              stsp16	[sp+0x86], r4
 f0 3d 88              stsp16	[sp+0x88], r5
 f0 34 aa              ldsp16	r4, [sp+0xaa]
 f0 35 ac              ldsp16	r5, [sp+0xac]
 f0 36 a6              ldsp16	r6, [sp+0xa6]
 f0 37 a8              ldsp16	r7, [sp+0xa8]
 f0 30 a2              ldsp16	r0, [sp+0xa2]
 f0 31 a4              ldsp16	r1, [sp+0xa4]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 f3 08              call16	arithmetic
 d6 04                 adjsp	0x4
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 6e              stsp16	[sp+0x6e], r4
 f0 3d 70              stsp16	[sp+0x70], r5
 f0 34 9e              ldsp16	r4, [sp+0x9e]
 f0 35 a0              ldsp16	r5, [sp+0xa0]
 f0 36 9a              ldsp16	r6, [sp+0x9a]
 f0 37 9c              ldsp16	r7, [sp+0x9c]
 e1 cf 08              call16	divide_exact
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 62              stsp16	[sp+0x62], r4
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 34 96              ldsp16	r4, [sp+0x96]
 f0 35 98              ldsp16	r5, [sp+0x98]
 e1 ad 08              call16	sqrt_exact
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 5e              stsp16	[sp+0x5e], r4
 f0 3d 60              stsp16	[sp+0x60], r5
 f0 34 92              ldsp16	r4, [sp+0x92]
 f0 35 94              ldsp16	r5, [sp+0x94]
 f0 36 8e              ldsp16	r6, [sp+0x8e]
 f0 37 90              ldsp16	r7, [sp+0x90]
 e1 84 08              call16	select_min
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 34 92              ldsp16	r4, [sp+0x92]
 f0 35 94              ldsp16	r5, [sp+0x94]
 f0 36 8e              ldsp16	r6, [sp+0x8e]
 f0 37 90              ldsp16	r7, [sp+0x90]
 e1 6b 08              call16	select_max
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 56              stsp16	[sp+0x56], r4
 f0 3d 58              stsp16	[sp+0x58], r5
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 34 86              ldsp16	r4, [sp+0x86]
 f0 35 88              ldsp16	r5, [sp+0x88]
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 f0 15 b2              leasp	r5, 0xb2
 f0 14 ae              leasp	r4, 0xae
 d7 0f                 sys	memcpy
 f0 02 30              ldi8	r2, 0x30
 f0 35 70              ldsp16	r5, [sp+0x70]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 72              stsp16	[sp+0x72], r4
 f0 3d 74              stsp16	[sp+0x74], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f2 39                 sub	r1, r1
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 35 64              ldsp16	r5, [sp+0x64]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 7a              stsp16	[sp+0x7a], r4
 f0 3d 7c              stsp16	[sp+0x7c], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 35 60              ldsp16	r5, [sp+0x60]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 82              stsp16	[sp+0x82], r4
 f0 3d 84              stsp16	[sp+0x84], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 82              ldsp16	r6, [sp+0x82]
 f0 37 84              ldsp16	r7, [sp+0x84]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 76              stsp16	[sp+0x76], r4
 f0 3d 78              stsp16	[sp+0x78], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 76              ldsp16	r6, [sp+0x76]
 f0 37 78              ldsp16	r7, [sp+0x78]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 35 58              ldsp16	r5, [sp+0x58]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 7e              stsp16	[sp+0x7e], r4
 f0 3d 80              stsp16	[sp+0x80], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 f0 37 80              ldsp16	r7, [sp+0x80]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 34 ae              ldsp16	r4, [sp+0xae]
 f0 35 b0              ldsp16	r5, [sp+0xb0]
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 3d 54              stsp16	[sp+0x54], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 6a              stsp16	[sp+0x6a], r6
 f0 3f 6c              stsp16	[sp+0x6c], r7
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 6a              ldsp16	r6, [sp+0x6a]
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 f0 69 c0              cmp32	q3, q0
 fc 25                 cmov.ult	r4, r5
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 03 0f              ldi8	r3, 0xf
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 72              ldsp16	r4, [sp+0x72]
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
 f0 3c 4e              stsp16	[sp+0x4e], r4
 f0 3d 50              stsp16	[sp+0x50], r5
 04                    mov	r5, r4
 f1 03                 mov	r0, r3
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 04                    mov	r5, r4
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 28              stsp16	[sp+0x28], r5
 f9 e0                 and	r7, r0
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 26              stsp16	[sp+0x26], r7
 c2 f0                 ldi8	r6, 0xf0
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 f0 35 50              ldsp16	r5, [sp+0x50]
 82                    and	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 f0 3e 66              stsp16	[sp+0x66], r6
 c8 37                 addi.s8	r4, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f0 36 6e              ldsp16	r6, [sp+0x6e]
 f0 37 70              ldsp16	r7, [sp+0x70]
 f5 2b                 cmp	r6, r3
 f0 36 66              ldsp16	r6, [sp+0x66]
 fc 26                 cmov.ult	r4, r6
 f0 3c 4e              stsp16	[sp+0x4e], r4
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 c9 37                 addi.s8	r5, 0x37
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 f1 0c                 mov	r1, r4
 fc 2f                 cmov.ult	r5, r7
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 72              ldsp16	r4, [sp+0x72]
 f0 35 74              ldsp16	r5, [sp+0x74]
 f1 74                 zext8	r4
 f0 3c 72              stsp16	[sp+0x72], r4
 f0 3d 74              stsp16	[sp+0x74], r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 36 62              ldsp16	r6, [sp+0x62]
 06                    mov	r5, r6
 f1 18                 mov	r3, r0
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 4c              stsp16	[sp+0x4c], r4
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 3f 4a              stsp16	[sp+0x4a], r7
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f9 cc                 and	r6, r3
 f1 0b                 mov	r1, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4c              stsp16	[sp+0x4c], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 72              stsp16	[sp+0x72], r4
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 34 62              ldsp16	r4, [sp+0x62]
 f0 35 64              ldsp16	r5, [sp+0x64]
 f5 20                 cmp	r4, r0
 f0 34 72              ldsp16	r4, [sp+0x72]
 fc 34                 cmov.ult	r6, r4
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 3f 4a              stsp16	[sp+0x4a], r7
 f0 34 62              ldsp16	r4, [sp+0x62]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 03 a0              ldi8	r3, 0xa0
 f1 2b                 mov	r6, r3
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 7a              stsp16	[sp+0x7a], r6
 f0 3f 7c              stsp16	[sp+0x7c], r7
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 06                    mov	r5, r6
 f1 19                 mov	r3, r1
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 82              ldsp16	r6, [sp+0x82]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 36 82              ldsp16	r6, [sp+0x82]
 f0 37 84              ldsp16	r7, [sp+0x84]
 fa 98                 lsr16i	r6, 0x8
 f0 3e 46              stsp16	[sp+0x46], r6
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
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 82              ldsp16	r4, [sp+0x82]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 35 46              ldsp16	r5, [sp+0x46]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 3f 44              stsp16	[sp+0x44], r7
 c5 00 a0              ldi16	r5, 0xa000
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f0 37 60              ldsp16	r7, [sp+0x60]
 39                    cmp	r6, r5
 f0 36 42              ldsp16	r6, [sp+0x42]
 f0 37 44              ldsp16	r7, [sp+0x44]
 fc 34                 cmov.ult	r6, r4
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 3f 44              stsp16	[sp+0x44], r7
 f0 34 5e              ldsp16	r4, [sp+0x5e]
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
 f0 34 82              ldsp16	r4, [sp+0x82]
 f0 35 84              ldsp16	r5, [sp+0x84]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 3f 84              stsp16	[sp+0x84], r7
 f0 36 5a              ldsp16	r6, [sp+0x5a]
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
 f0 36 76              ldsp16	r6, [sp+0x76]
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
 f0 3e 72              stsp16	[sp+0x72], r6
 f0 3f 74              stsp16	[sp+0x74], r7
 f1 1e                 mov	r3, r6
 f0 01 0f              ldi8	r1, 0xf
 f9 64                 and	r3, r1
 f1 27                 mov	r5, r3
 f9 a9                 or	r5, r2
 f0 0f 0a              cmpi.s8	r3, 0xa
 f0 0b 37              addi.s8	r3, 0x37
 fc 1d                 cmov.ult	r3, r5
 f0 36 76              ldsp16	r6, [sp+0x76]
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 72              stsp16	[sp+0x72], r6
 f0 3f 74              stsp16	[sp+0x74], r7
 c5 00 a0              ldi16	r5, 0xa000
 f0 36 5a              ldsp16	r6, [sp+0x5a]
 f0 37 5c              ldsp16	r7, [sp+0x5c]
 39                    cmp	r6, r5
 f0 36 72              ldsp16	r6, [sp+0x72]
 f0 37 74              ldsp16	r7, [sp+0x74]
 fc 34                 cmov.ult	r6, r4
 f0 3e 72              stsp16	[sp+0x72], r6
 f0 3f 74              stsp16	[sp+0x74], r7
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 76              ldsp16	r4, [sp+0x76]
 f0 35 78              ldsp16	r5, [sp+0x78]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 76              stsp16	[sp+0x76], r6
 f0 3f 78              stsp16	[sp+0x78], r7
 f0 36 56              ldsp16	r6, [sp+0x56]
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f1 0e                 mov	r1, r6
 f0 00 0f              ldi8	r0, 0xf
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 89                 or	r4, r2
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 f0 37 80              ldsp16	r7, [sp+0x80]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c0 f0                 ldi8	r4, 0xf0
 f0 36 66              ldsp16	r6, [sp+0x66]
 f0 37 68              ldsp16	r7, [sp+0x68]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 16              stsp16	[sp+0x16], r4
 ca 37                 addi.s8	r6, 0x37
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 36 56              ldsp16	r6, [sp+0x56]
 f0 37 58              ldsp16	r7, [sp+0x58]
 c5 00 a0              ldi16	r5, 0xa000
 39                    cmp	r6, r5
 f0 34 66              ldsp16	r4, [sp+0x66]
 f0 35 68              ldsp16	r5, [sp+0x68]
 f0 36 16              ldsp16	r6, [sp+0x16]
 fc 26                 cmov.ult	r4, r6
 f0 3c 66              stsp16	[sp+0x66], r4
 f0 3d 68              stsp16	[sp+0x68], r5
 f0 34 56              ldsp16	r4, [sp+0x56]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 f0 37 80              ldsp16	r7, [sp+0x80]
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 7e              stsp16	[sp+0x7e], r6
 f0 3f 80              stsp16	[sp+0x80], r7
 f0 36 52              ldsp16	r6, [sp+0x52]
 f0 37 54              ldsp16	r7, [sp+0x54]
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 36 6a              ldsp16	r6, [sp+0x6a]
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 36 48              ldsp16	r6, [sp+0x48]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 36 82              ldsp16	r6, [sp+0x82]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 36 42              ldsp16	r6, [sp+0x42]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 36 76              ldsp16	r6, [sp+0x76]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 36 72              ldsp16	r6, [sp+0x72]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 36 66              ldsp16	r6, [sp+0x66]
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 e1 50 02              call16	convert_signed
 f0 3c 7a              stsp16	[sp+0x7a], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 e1 48 02              call16	convert_unsigned
 f0 3c 76              stsp16	[sp+0x76], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 66              stsp16	[sp+0x66], r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 36 52              ldsp16	r6, [sp+0x52]
 06                    mov	r5, r6
 f0 01 0f              ldi8	r1, 0xf
 f1 19                 mov	r3, r1
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 72              stsp16	[sp+0x72], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 6a              ldsp16	r6, [sp+0x6a]
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 3c 7e              stsp16	[sp+0x7e], r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 3c 82              stsp16	[sp+0x82], r4
 f0 3d 84              stsp16	[sp+0x84], r5
 f1 04                 mov	r0, r4
 f1 0b                 mov	r1, r3
 f9 04                 and	r0, r1
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 6a              stsp16	[sp+0x6a], r6
 f0 3f 6c              stsp16	[sp+0x6c], r7
 f0 36 7e              ldsp16	r6, [sp+0x7e]
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 7e              stsp16	[sp+0x7e], r6
 c0 f0                 ldi8	r4, 0xf0
 f0 36 82              ldsp16	r6, [sp+0x82]
 f0 37 84              ldsp16	r7, [sp+0x84]
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 3f 84              stsp16	[sp+0x84], r7
 f0 36 52              ldsp16	r6, [sp+0x52]
 f0 37 54              ldsp16	r7, [sp+0x54]
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 f0 36 82              ldsp16	r6, [sp+0x82]
 f0 37 84              ldsp16	r7, [sp+0x84]
 fc 34                 cmov.ult	r6, r4
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 3f 84              stsp16	[sp+0x84], r7
 f0 35 76              ldsp16	r5, [sp+0x76]
 0d                    mov	r7, r5
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 4c              stsp16	[sp+0x4c], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 48              stsp16	[sp+0x48], r7
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 0b                    mov	r6, r7
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 46              stsp16	[sp+0x46], r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 0d                    mov	r7, r5
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 f9 5d                 or	r2, r7
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3a                 cmov.ult	r7, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 f0 35 84              ldsp16	r5, [sp+0x84]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 02 01              ldi8	r2, 0x1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 f0 35 70              ldsp16	r5, [sp+0x70]
 f0 69 8c              cmp32	q2, q3
 d1 69                 brne8	avm_test_main+2419
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 f0 36 62              ldsp16	r6, [sp+0x62]
 f0 37 64              ldsp16	r7, [sp+0x64]
 f0 69 c0              cmp32	q3, q0
 d1 58                 brne8	avm_test_main+2419
 f2 30                 sub	r0, r0
 f0 05 10 41           ldi16	r1, 0x4110
 f0 36 5e              ldsp16	r6, [sp+0x5e]
 f0 37 60              ldsp16	r7, [sp+0x60]
 f0 69 c0              cmp32	q3, q0
 d1 47                 brne8	avm_test_main+2419
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 f0 69 8c              cmp32	q2, q3
 d1 38                 brne8	avm_test_main+2419
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 69 8c              cmp32	q2, q3
 d1 29                 brne8	avm_test_main+2419
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f0 34 76              ldsp16	r4, [sp+0x76]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 0c              cmp32	q0, q3
 d1 0f                 brne8	avm_test_main+2419
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 36 52              ldsp16	r6, [sp+0x52]
 f0 37 54              ldsp16	r7, [sp+0x54]
 f0 69 c8              cmp32	q3, q2
 f8 0a                 cset.ne	r2
 f1 22                 mov	r4, r2
 d6 7f                 adjsp	0x7f
 d6 37                 adjsp	0x37
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
 d4 2c                 jmp8	sqrtf

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

<sqrtf>:
 ff 6a                 fsqrt	q2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
