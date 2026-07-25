
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	0000022b avm_test_main
00000541 g     F .text	00000002 avm_halt

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
 e1 2b 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f0 06 00 01           ldi16	r2, 0x100
 c2 61                 ldi8	r6, 0x61
 f2 39                 sub	r1, r1
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f1 25                 mov	r5, r1
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 3c                 mul16	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 f4 69                 stsp16	[sp+0xa], r5
 fa 45                 lsl16i	r5, 0x5
 f4 10                 ldsp16	r4, [sp+0x4]
 14                    add	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f1 2d                 mov	r7, r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 1a                 mov	r3, r2
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
 f0 6d a7              st8	[r3+], r5
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e4                 brne8	avm_test_main+52
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 af                    xor	r7, r7
 ee e8 28              st8	[r4+8], r7
 ee ea 3f              st8	[r5+31], r7
 f0 09 03              addi.s8	r1, 0x3
 f4 32                 ldsp16	r6, [sp+0xc]
 ca 03                 addi.s8	r6, 0x3
 f0 0a 20              addi.s8	r2, 0x20
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 ad                 brne8	avm_test_main+27
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+117
 d7 01                 sys	debug_break
 c4 00 01              ldi16	r4, 0x100
 f4 68                 stsp16	[sp+0xa], r4
 f1 1f                 mov	r3, r7
 d4 0c                 jmp8	avm_test_main+150
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da 87 01              breq16	avm_test_main+541
 f4 73                 stsp16	[sp+0xc], r7
 f4 b3                 dec16	r3
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 23                 mov	r4, r3
 f7 0f                 ld8u	r7, [r5+]
 f4 ab                 inc16	r3
 f4 a7                 tst8	r7
 d1 f6                 brne8	avm_test_main+156
 c6 20 01              ldi16	r6, 0x120
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+169
 c6 40 01              ldi16	r6, 0x140
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+181
 c6 60 01              ldi16	r6, 0x160
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+193
 c6 80 01              ldi16	r6, 0x180
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+205
 c6 a0 01              ldi16	r6, 0x1a0
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+217
 c4 c0 01              ldi16	r4, 0x1c0
 f1 15                 mov	r2, r5
 f7 06                 ld8u	r6, [r4+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f6                 brne8	avm_test_main+229
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 aa                 inc16	r2
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+242
 f0 07 00 02           ldi16	r3, 0x200
 c0 80                 ldi8	r4, 0x80
 ed a6 20              ld8u	r5, [r3+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	avm_test_main+273
 f4 ab                 inc16	r3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f1                 brne8	avm_test_main+256
 f2 4b                 sub	r3, r3
 c5 00 02              ldi16	r5, 0x200
 f2 39                 sub	r1, r1
 f6 2b                 tst16	r3
 f2 4d                 sub	r3, r5
 fb 19                 cmov.eq	r3, r1
 c0 80                 ldi8	r4, 0x80
 4d                    ld8u	r7, [r5]
 cf 21                 cmpi.s8	r7, 0x21
 d0 0a                 breq8	avm_test_main+301
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+286
 f1 25                 mov	r5, r1
 c4 00 02              ldi16	r4, 0x200
 f6 2d                 tst16	r5
 24                    sub	r5, r4
 fb 29                 cmov.eq	r5, r1
 f9 76                 xor	r3, r5
 c1 80                 ldi8	r5, 0x80
 4c                    ld8u	r7, [r4]
 cf 42                 cmpi.s8	r7, 0x42
 d0 09                 breq8	avm_test_main+327
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f3                 brne8	avm_test_main+313
 a0                    xor	r4, r4
 c5 00 02              ldi16	r5, 0x200
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 21                    sub	r4, r5
 fb 21                 cmov.eq	r4, r1
 f9 72                 xor	r3, r4
 c0 80                 ldi8	r4, 0x80
 4d                    ld8u	r7, [r5]
 cf 63                 cmpi.s8	r7, 0x63
 d0 0a                 breq8	avm_test_main+356
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+341
 f1 25                 mov	r5, r1
 c4 00 02              ldi16	r4, 0x200
 f6 2d                 tst16	r5
 24                    sub	r5, r4
 fb 29                 cmov.eq	r5, r1
 f9 76                 xor	r3, r5
 c1 80                 ldi8	r5, 0x80
 f5 31                 ld8u	r1, [r4]
 c3 84                 ldi8	r7, 0x84
 f5 0f                 cmp	r1, r7
 d0 09                 breq8	avm_test_main+385
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f0                 brne8	avm_test_main+368
 a0                    xor	r4, r4
 c5 00 02              ldi16	r5, 0x200
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 21                    sub	r4, r5
 fb 21                 cmov.eq	r4, r1
 f9 72                 xor	r3, r4
 c0 80                 ldi8	r4, 0x80
 4d                    ld8u	r7, [r5]
 f0 00 a5              ldi8	r0, 0xa5
 f5 2c                 cmp	r7, r0
 d0 0a                 breq8	avm_test_main+417
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+399
 f1 25                 mov	r5, r1
 c4 00 02              ldi16	r4, 0x200
 f6 2d                 tst16	r5
 24                    sub	r5, r4
 fb 29                 cmov.eq	r5, r1
 f9 76                 xor	r3, r5
 c1 80                 ldi8	r5, 0x80
 f5 30                 ld8u	r0, [r4]
 c3 c6                 ldi8	r7, 0xc6
 f5 07                 cmp	r0, r7
 d0 09                 breq8	avm_test_main+446
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f0                 brne8	avm_test_main+429
 a0                    xor	r4, r4
 c5 00 02              ldi16	r5, 0x200
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 21                    sub	r4, r5
 fb 21                 cmov.eq	r4, r1
 f9 72                 xor	r3, r4
 c0 80                 ldi8	r4, 0x80
 f5 34                 ld8u	r0, [r5]
 c3 e7                 ldi8	r7, 0xe7
 f5 07                 cmp	r0, r7
 d0 0a                 breq8	avm_test_main+478
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+460
 f1 25                 mov	r5, r1
 c4 00 02              ldi16	r4, 0x200
 f6 2d                 tst16	r5
 24                    sub	r5, r4
 fb 29                 cmov.eq	r5, r1
 f9 76                 xor	r3, r5
 f9 6a                 xor	r3, r2
 f1 21                 mov	r4, r1
 d4 0e                 jmp8	avm_test_main+508
 f1 25                 mov	r5, r1
 f2 1d                 add	r3, r5
 47                    ld8u	r5, [r7]
 f2 4d                 sub	r3, r5
 f4 ac                 inc16	r4
 cc 07                 cmpi.s8	r4, 0x7
 da 8e fe              breq16	avm_test_main+138
 04                    mov	r5, r4
 fa 45                 lsl16i	r5, 0x5
 c7 20 01              ldi16	r7, 0x120
 1d                    add	r7, r5
 c6 00 01              ldi16	r6, 0x100
 19                    add	r6, r5
 46                    ld8u	r5, [r6]
 f4 a5                 tst8	r5
 d0 e2                 breq8	avm_test_main+494
 4b                    ld8u	r6, [r7]
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d1 de                 brne8	avm_test_main+496
 ed ae 01              ld8u	r5, [r7-31]
 f4 af                 inc16	r7
 f4 a5                 tst8	r5
 d1 f1                 brne8	avm_test_main+524
 d4 d1                 jmp8	avm_test_main+494
 f0 5b 80 02           stm16	[0x280], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
