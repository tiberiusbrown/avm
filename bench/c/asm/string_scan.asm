
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000225 avm_test_main
0000053b g     F .text	00000002 avm_halt

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
 e1 25 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 06 00 01           ldi16	r2, 0x100
 c2 61                 ldi8	r6, 0x61
 f2 39                 sub	r1, r1
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f1 25                 mov	r5, r1
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 3c                 mul16	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f4 61                 stsp16	[sp+0x8], r5
 fa 45                 lsl16i	r5, 0x5
 c4 00 01              ldi16	r4, 0x100
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 33 00              ldsp16	r3, [sp+0x0]
 f1 2d                 mov	r7, r1
 f4 6a                 stsp16	[sp+0xa], r6
 f1 02                 mov	r0, r2
 c1 4f                 ldi8	r5, 0x4f
 03                    mov	r4, r7
 f3 11                 mulu8.w	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 c1 1a                 ldi8	r5, 0x1a
 f3 11                 mulu8.w	r4, r5
 07                    mov	r5, r7
 24                    sub	r5, r4
 27                    sub	r5, r7
 16                    add	r5, r6
 f0 6d a1              st8	[r0+], r5
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e4                 brne8	avm_test_main+50
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 af                    xor	r7, r7
 ee e8 28              st8	[r4+8], r7
 ee ea 3f              st8	[r5+31], r7
 f0 09 03              addi.s8	r1, 0x3
 f4 2a                 ldsp16	r6, [sp+0xa]
 ca 03                 addi.s8	r6, 0x3
 f0 0a 20              addi.s8	r2, 0x20
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 ac                 brne8	avm_test_main+24
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+115
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
 f0 06 20 01           ldi16	r2, 0x120
 f1 0f                 mov	r1, r7
 d4 0c                 jmp8	avm_test_main+151
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da 80 01              breq16	avm_test_main+535
 f4 6b                 stsp16	[sp+0xa], r7
 f4 b1                 dec16	r1
 f1 27                 mov	r5, r3
 f1 21                 mov	r4, r1
 f7 0f                 ld8u	r7, [r5+]
 f4 a9                 inc16	r1
 f4 a7                 tst8	r7
 d1 f6                 brne8	avm_test_main+157
 f1 2e                 mov	r7, r2
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	avm_test_main+169
 c7 40 01              ldi16	r7, 0x140
 01                    mov	r4, r5
 f7 1e                 ld8u	r6, [r7+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f7                 brne8	avm_test_main+181
 c7 60 01              ldi16	r7, 0x160
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	avm_test_main+193
 c7 80 01              ldi16	r7, 0x180
 01                    mov	r4, r5
 f7 1e                 ld8u	r6, [r7+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f7                 brne8	avm_test_main+205
 c7 a0 01              ldi16	r7, 0x1a0
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	avm_test_main+217
 c4 c0 01              ldi16	r4, 0x1c0
 f1 1d                 mov	r3, r5
 f7 06                 ld8u	r6, [r4+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f6                 brne8	avm_test_main+229
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 ab                 inc16	r3
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+242
 c0 80                 ldi8	r4, 0x80
 f0 05 00 02           ldi16	r1, 0x200
 ed a2 20              ld8u	r5, [r1+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	avm_test_main+273
 f4 a9                 inc16	r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f1                 brne8	avm_test_main+256
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 f6 29                 tst16	r1
 c5 00 02              ldi16	r5, 0x200
 f2 3d                 sub	r1, r5
 fb 0c                 cmov.eq	r1, r4
 c3 80                 ldi8	r7, 0x80
 49                    ld8u	r6, [r5]
 ce 21                 cmpi.s8	r6, 0x21
 d0 09                 breq8	avm_test_main+299
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+285
 04                    mov	r5, r4
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
 49                    ld8u	r6, [r5]
 ce 42                 cmpi.s8	r6, 0x42
 d0 09                 breq8	avm_test_main+326
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+312
 a5                    xor	r5, r5
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 06                    mov	r5, r6
 49                    ld8u	r6, [r5]
 ce 63                 cmpi.s8	r6, 0x63
 d0 09                 breq8	avm_test_main+354
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+340
 04                    mov	r5, r4
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
 49                    ld8u	r6, [r5]
 c3 84                 ldi8	r7, 0x84
 3b                    cmp	r6, r7
 d0 09                 breq8	avm_test_main+382
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	avm_test_main+367
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f6 2d                 tst16	r5
 c4 00 02              ldi16	r4, 0x200
 24                    sub	r5, r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 04                    mov	r5, r4
 49                    ld8u	r6, [r5]
 c0 a5                 ldi8	r4, 0xa5
 38                    cmp	r6, r4
 d0 0a                 breq8	avm_test_main+413
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	avm_test_main+397
 f1 24                 mov	r5, r0
 f6 2d                 tst16	r5
 c4 00 02              ldi16	r4, 0x200
 24                    sub	r5, r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c1 80                 ldi8	r5, 0x80
 48                    ld8u	r6, [r4]
 c3 c6                 ldi8	r7, 0xc6
 3b                    cmp	r6, r7
 d0 09                 breq8	avm_test_main+440
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	avm_test_main+425
 a0                    xor	r4, r4
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 c6 00 02              ldi16	r6, 0x200
 22                    sub	r4, r6
 fb 20                 cmov.eq	r4, r0
 f9 32                 xor	r1, r4
 c1 80                 ldi8	r5, 0x80
 02                    mov	r4, r6
 48                    ld8u	r6, [r4]
 c3 e7                 ldi8	r7, 0xe7
 3b                    cmp	r6, r7
 d0 0a                 breq8	avm_test_main+471
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	avm_test_main+455
 f1 20                 mov	r4, r0
 f6 2c                 tst16	r4
 c5 00 02              ldi16	r5, 0x200
 21                    sub	r4, r5
 fb 20                 cmov.eq	r4, r0
 f9 32                 xor	r1, r4
 f9 2e                 xor	r1, r3
 f1 2c                 mov	r7, r0
 f0 07 00 01           ldi16	r3, 0x100
 d4 0e                 jmp8	avm_test_main+505
 f1 20                 mov	r4, r0
 f2 0c                 add	r1, r4
 41                    ld8u	r4, [r5]
 f2 3c                 sub	r1, r4
 f4 af                 inc16	r7
 cf 07                 cmpi.s8	r7, 0x7
 da 92 fe              breq16	avm_test_main+139
 03                    mov	r4, r7
 fa 35                 lsl16i	r4, 0x5
 04                    mov	r5, r4
 f2 26                 add	r5, r2
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d0 e5                 breq8	avm_test_main+491
 49                    ld8u	r6, [r5]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 d1 e1                 brne8	avm_test_main+493
 ed 8a 01              ld8u	r4, [r5-31]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f1                 brne8	avm_test_main+518
 d4 d4                 jmp8	avm_test_main+491
 f0 59 80 02           stm16	[0x280], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
