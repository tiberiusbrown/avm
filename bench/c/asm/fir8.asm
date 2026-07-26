
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fir8.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fir8.c
00000100 l     O .data	00000060 samples
00000160 l     O .data	00000010 coefficients
00000170 l     O .data	00000002 fir_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000231 avm_test_main
00000447 g     F .text	00000002 avm_halt

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
 e1 31 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 c4 00 01              ldi16	r4, 0x100
 c3 07                 ldi8	r7, 0x7
 c2 60                 ldi8	r6, 0x60
 f0 00 7f              ldi8	r0, 0x7f
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 c9 c0                 addi.s8	r5, -0x40
 f6 05                 st8	[r4+], r5
 cb 13                 addi.s8	r7, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f1                 brne8	avm_test_main+16
 c4 29 32              ldi16	r4, 0x3229
 c5 3b 44              ldi16	r5, 0x443b
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 05 0e              ldi16	r4, 0xe05
 c5 17 20              ldi16	r5, 0x2017
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 e1 ea              ldi16	r4, 0xeae1
 c5 f3 fc              ldi16	r5, 0xfcf3
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 bd c6              ldi16	r4, 0xc6bd
 c5 cf d8              ldi16	r5, 0xd8cf
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 45 6f 01           ldm8u	r5, [0x16f]
 f6 45                 sext8	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 41 6e 01           ldm8u	r1, [0x16e]
 f6 41                 sext8	r1
 f0 46 6d 01           ldm8u	r6, [0x16d]
 f6 46                 sext8	r6
 f0 45 6c 01           ldm8u	r5, [0x16c]
 f6 45                 sext8	r5
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 45 6b 01           ldm8u	r5, [0x16b]
 f6 45                 sext8	r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 45 6a 01           ldm8u	r5, [0x16a]
 f6 45                 sext8	r5
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 45 69 01           ldm8u	r5, [0x169]
 f6 45                 sext8	r5
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 45 68 01           ldm8u	r5, [0x168]
 f6 45                 sext8	r5
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 45 67 01           ldm8u	r5, [0x167]
 f6 45                 sext8	r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 47 66 01           ldm8u	r7, [0x166]
 f6 47                 sext8	r7
 f0 40 65 01           ldm8u	r0, [0x165]
 f6 40                 sext8	r0
 f0 45 64 01           ldm8u	r5, [0x164]
 f6 45                 sext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f0 45 63 01           ldm8u	r5, [0x163]
 f6 45                 sext8	r5
 f4 61                 stsp16	[sp+0x8], r5
 f0 45 62 01           ldm8u	r5, [0x162]
 f6 45                 sext8	r5
 f4 59                 stsp16	[sp+0x6], r5
 f0 45 61 01           ldm8u	r5, [0x161]
 f6 45                 sext8	r5
 f4 51                 stsp16	[sp+0x4], r5
 f0 45 60 01           ldm8u	r5, [0x160]
 f6 45                 sext8	r5
 f1 14                 mov	r2, r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 38 0c              stsp16	[sp+0xc], r0
 f4 49                 stsp16	[sp+0x2], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f2 42                 sub	r2, r2
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 0e                    mov	r7, r6
 f0 33 20              ldsp16	r3, [sp+0x20]
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 fe 2c                 mul16	r5, r4
 f1 22                 mov	r4, r2
 c6 01 01              ldi16	r6, 0x101
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 12                 ldsp16	r6, [sp+0x4]
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 02 01              ldi16	r5, 0x102
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f1 22                 mov	r4, r2
 c6 03 01              ldi16	r6, 0x103
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f1 22                 mov	r4, r2
 c6 05 01              ldi16	r6, 0x105
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f1 28                 mov	r6, r0
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 06 01              ldi16	r5, 0x106
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 30 0e              ldsp16	r0, [sp+0xe]
 fe 04                 mul16	r0, r4
 f2 06                 add	r0, r6
 f1 22                 mov	r4, r2
 c5 0f 01              ldi16	r5, 0x10f
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 1c                 mul16	r3, r4
 f0 3b 2a              stsp16	[sp+0x2a], r3
 f1 22                 mov	r4, r2
 c5 0e 01              ldi16	r5, 0x10e
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 0c                 mul16	r1, r4
 f0 39 28              stsp16	[sp+0x28], r1
 f1 22                 mov	r4, r2
 c5 0d 01              ldi16	r5, 0x10d
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 3c                 mul16	r7, r4
 f0 3f 26              stsp16	[sp+0x26], r7
 f1 22                 mov	r4, r2
 c5 0c 01              ldi16	r5, 0x10c
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fe 2c                 mul16	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f1 22                 mov	r4, r2
 c5 0b 01              ldi16	r5, 0x10b
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 fe 2c                 mul16	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f1 22                 mov	r4, r2
 c5 0a 01              ldi16	r5, 0x10a
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 31 16              ldsp16	r1, [sp+0x16]
 fe 0c                 mul16	r1, r4
 f1 22                 mov	r4, r2
 c5 09 01              ldi16	r5, 0x109
 11                    add	r4, r5
 f5 33                 ld8u	r3, [r4]
 f6 43                 sext8	r3
 f0 35 14              ldsp16	r5, [sp+0x14]
 fe 2b                 mul16	r5, r3
 f1 2a                 mov	r6, r2
 c4 08 01              ldi16	r4, 0x108
 18                    add	r6, r4
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 fe 26                 mul16	r4, r6
 f1 2a                 mov	r6, r2
 c7 07 01              ldi16	r7, 0x107
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 f0 33 10              ldsp16	r3, [sp+0x10]
 fe 1e                 mul16	r3, r6
 f2 18                 add	r3, r0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f2 1c                 add	r3, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f2 1d                 add	r3, r5
 f2 19                 add	r3, r1
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f2 1e                 add	r3, r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 f2 1e                 add	r3, r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 f2 1e                 add	r3, r6
 f0 36 28              ldsp16	r6, [sp+0x28]
 f2 1e                 add	r3, r6
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f2 1e                 add	r3, r6
 f2 23                 add	r4, r3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 db da fe              brne16	avm_test_main+233
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 32 00              ldsp16	r2, [sp+0x0]
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db c1 fe              brne16	avm_test_main+225
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 5c 70 01           stm16	[0x170], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
