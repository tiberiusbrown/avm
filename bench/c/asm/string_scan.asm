
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	0000022c avm_test_main
00000542 g     F .text	00000002 avm_halt

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
 e1 2c 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 07 00 01           ldi16	r3, 0x100
 c1 61                 ldi8	r5, 0x61
 f2 39                 sub	r1, r1
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f1 29                 mov	r6, r1
 0e                    mov	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 3c                 mul16	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f4 62                 stsp16	[sp+0x8], r6
 fa 55                 lsl16i	r6, 0x5
 c4 00 01              ldi16	r4, 0x100
 18                    add	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f1 29                 mov	r6, r1
 f4 69                 stsp16	[sp+0xa], r5
 f1 13                 mov	r2, r3
 c3 4f                 ldi8	r7, 0x4f
 02                    mov	r4, r6
 f3 13                 mulu8.w	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 c3 1a                 ldi8	r7, 0x1a
 f3 13                 mulu8.w	r4, r7
 0e                    mov	r7, r6
 2c                    sub	r7, r4
 2e                    sub	r7, r6
 1d                    add	r7, r5
 f0 6d e5              st8	[r2+], r7
 f4 ae                 inc16	r6
 f4 ad                 inc16	r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e4                 brne8	avm_test_main+50
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 af                    xor	r7, r7
 ee e8 28              st8	[r4+8], r7
 ee ea 3f              st8	[r5+31], r7
 f0 09 03              addi.s8	r1, 0x3
 f4 29                 ldsp16	r5, [sp+0xa]
 c9 03                 addi.s8	r5, 0x3
 f0 0b 20              addi.s8	r3, 0x20
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
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
 f0 05 00 01           ldi16	r1, 0x100
 f0 07 20 01           ldi16	r3, 0x120
 f1 17                 mov	r2, r7
 d4 0c                 jmp8	avm_test_main+151
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 af                 inc16	r7
 07                    mov	r5, r7
 f1 75                 zext8	r5
 cd 40                 cmpi.s8	r5, 0x40
 da 87 01              breq16	avm_test_main+542
 f4 6b                 stsp16	[sp+0xa], r7
 f4 b2                 dec16	r2
 f1 29                 mov	r6, r1
 f1 26                 mov	r5, r2
 f7 17                 ld8u	r7, [r6+]
 f4 aa                 inc16	r2
 f4 a7                 tst8	r7
 d1 f6                 brne8	avm_test_main+157
 f1 2b                 mov	r6, r3
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+169
 c6 40 01              ldi16	r6, 0x140
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+181
 c6 60 01              ldi16	r6, 0x160
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+193
 c6 80 01              ldi16	r6, 0x180
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+205
 c6 a0 01              ldi16	r6, 0x1a0
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+217
 c5 c0 01              ldi16	r5, 0x1c0
 f1 1c                 mov	r3, r4
 f7 0e                 ld8u	r6, [r5+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f6                 brne8	avm_test_main+229
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 ab                 inc16	r3
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+242
 c1 80                 ldi8	r5, 0x80
 c6 00 02              ldi16	r6, 0x200
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 0c                 breq8	avm_test_main+272
 f2 42                 sub	r2, r2
 f4 ae                 inc16	r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f1                 brne8	avm_test_main+255
 d4 02                 jmp8	avm_test_main+274
 f1 16                 mov	r2, r6
 f2 30                 sub	r0, r0
 f6 2a                 tst16	r2
 c4 00 02              ldi16	r4, 0x200
 f2 44                 sub	r2, r4
 fb 10                 cmov.eq	r2, r0
 c3 80                 ldi8	r7, 0x80
 08                    mov	r6, r4
 46                    ld8u	r5, [r6]
 cd 21                 cmpi.s8	r5, 0x21
 d0 0a                 breq8	avm_test_main+303
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+288
 f1 28                 mov	r6, r0
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 30                 cmov.eq	r6, r0
 f9 5a                 xor	r2, r6
 c1 80                 ldi8	r5, 0x80
 0c                    mov	r7, r4
 4b                    ld8u	r6, [r7]
 ce 42                 cmpi.s8	r6, 0x42
 d0 0b                 breq8	avm_test_main+329
 aa                    xor	r6, r6
 f4 af                 inc16	r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	avm_test_main+313
 d4 01                 jmp8	avm_test_main+330
 0b                    mov	r6, r7
 f2 30                 sub	r0, r0
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 30                 cmov.eq	r6, r0
 f9 5a                 xor	r2, r6
 c3 80                 ldi8	r7, 0x80
 08                    mov	r6, r4
 46                    ld8u	r5, [r6]
 cd 63                 cmpi.s8	r5, 0x63
 d0 0a                 breq8	avm_test_main+357
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+342
 f1 28                 mov	r6, r0
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 30                 cmov.eq	r6, r0
 f9 5a                 xor	r2, r6
 c1 80                 ldi8	r5, 0x80
 0c                    mov	r7, r4
 f5 3c                 ld8u	r0, [r7]
 c2 84                 ldi8	r6, 0x84
 f5 06                 cmp	r0, r6
 d0 0b                 breq8	avm_test_main+386
 aa                    xor	r6, r6
 f4 af                 inc16	r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 ef                 brne8	avm_test_main+367
 d4 01                 jmp8	avm_test_main+387
 0b                    mov	r6, r7
 f2 39                 sub	r1, r1
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 31                 cmov.eq	r6, r1
 f9 5a                 xor	r2, r6
 c3 80                 ldi8	r7, 0x80
 08                    mov	r6, r4
 46                    ld8u	r5, [r6]
 f0 00 a5              ldi8	r0, 0xa5
 f5 24                 cmp	r5, r0
 d0 0a                 breq8	avm_test_main+417
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f0                 brne8	avm_test_main+399
 f1 29                 mov	r6, r1
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 31                 cmov.eq	r6, r1
 f9 5a                 xor	r2, r6
 c1 80                 ldi8	r5, 0x80
 0c                    mov	r7, r4
 f5 3c                 ld8u	r0, [r7]
 c2 c6                 ldi8	r6, 0xc6
 f5 06                 cmp	r0, r6
 d0 0b                 breq8	avm_test_main+446
 aa                    xor	r6, r6
 f4 af                 inc16	r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 ef                 brne8	avm_test_main+427
 d4 01                 jmp8	avm_test_main+447
 0b                    mov	r6, r7
 f2 30                 sub	r0, r0
 f6 2e                 tst16	r6
 28                    sub	r6, r4
 fb 30                 cmov.eq	r6, r0
 f9 5a                 xor	r2, r6
 c2 80                 ldi8	r6, 0x80
 04                    mov	r5, r4
 4d                    ld8u	r7, [r5]
 f0 01 e7              ldi8	r1, 0xe7
 f5 2d                 cmp	r7, r1
 d0 0a                 breq8	avm_test_main+477
 f4 ad                 inc16	r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f0                 brne8	avm_test_main+459
 f1 24                 mov	r5, r0
 f6 2d                 tst16	r5
 24                    sub	r5, r4
 fb 28                 cmov.eq	r5, r0
 f9 56                 xor	r2, r5
 f9 4e                 xor	r2, r3
 f1 2c                 mov	r7, r0
 f0 05 00 01           ldi16	r1, 0x100
 f0 07 20 01           ldi16	r3, 0x120
 d4 0e                 jmp8	avm_test_main+512
 f1 28                 mov	r6, r0
 f2 16                 add	r2, r6
 41                    ld8u	r4, [r5]
 f2 44                 sub	r2, r4
 f4 af                 inc16	r7
 cf 07                 cmpi.s8	r7, 0x7
 da 8b fe              breq16	avm_test_main+139
 0b                    mov	r6, r7
 fa 55                 lsl16i	r6, 0x5
 06                    mov	r5, r6
 f2 27                 add	r5, r3
 f2 29                 add	r6, r1
 4a                    ld8u	r6, [r6]
 f4 a6                 tst8	r6
 d0 e5                 breq8	avm_test_main+498
 41                    ld8u	r4, [r5]
 f1 76                 zext8	r6
 38                    cmp	r6, r4
 d1 e1                 brne8	avm_test_main+500
 ed ca 01              ld8u	r6, [r5-31]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f1                 brne8	avm_test_main+525
 d4 d4                 jmp8	avm_test_main+498
 f0 5a 80 02           stm16	[0x280], r2
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
