
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000237 avm_test_main
0000054d g     F .text	00000002 avm_halt

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
 e1 37 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 f0 06 00 01           ldi16	r2, 0x100
 c2 61                 ldi8	r6, 0x61
 af                    xor	r7, r7
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 07                    mov	r5, r7
 f1 07                 mov	r0, r7
 f1 08                 mov	r1, r0
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 0c                 mul16	r1, r4
 fa 45                 lsl16i	r5, 0x5
 c4 00 01              ldi16	r4, 0x100
 11                    add	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 33 00              ldsp16	r3, [sp+0x0]
 f0 3a 0a              stsp16	[sp+0xa], r2
 c0 4f                 ldi8	r4, 0x4f
 07                    mov	r5, r7
 f3 14                 mulu8.w	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 c0 1a                 ldi8	r4, 0x1a
 f3 14                 mulu8.w	r5, r4
 03                    mov	r4, r7
 21                    sub	r4, r5
 23                    sub	r4, r7
 12                    add	r4, r6
 f0 6d 85              st8	[r2+], r4
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b3                 dec16	r3
 f4 a3                 tst8	r3
 d1 e4                 brne8	avm_test_main+48
 f1 71                 zext8	r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 0c                 add	r1, r4
 f2 4b                 sub	r3, r3
 ee 62 28              st8	[r1+8], r3
 ee 68 3f              st8	[r4+31], r3
 f4 1b                 ldsp16	r7, [sp+0x6]
 cb 03                 addi.s8	r7, 0x3
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 03                 addi.s8	r6, 0x3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 0a 20              addi.s8	r2, 0x20
 f4 a8                 inc16	r0
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 a6                 brne8	avm_test_main+24
 c4 00 02              ldi16	r4, 0x200
 c1 80                 ldi8	r5, 0x80
 c2 07                 ldi8	r6, 0x7
 f6 06                 st8	[r4+], r6
 ca 0b                 addi.s8	r6, 0xb
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 f6                 brne8	avm_test_main+121
 d7 01                 sys	debug_break
 f1 0b                 mov	r1, r3
 d4 0b                 jmp8	avm_test_main+148
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da 95 01              breq16	avm_test_main+553
 c6 00 01              ldi16	r6, 0x100
 f4 b1                 dec16	r1
 f1 21                 mov	r4, r1
 f7 15                 ld8u	r5, [r6+]
 f4 a9                 inc16	r1
 f4 a5                 tst8	r5
 d1 f6                 brne8	avm_test_main+153
 c6 20 01              ldi16	r6, 0x120
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+166
 c6 40 01              ldi16	r6, 0x140
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+178
 c6 60 01              ldi16	r6, 0x160
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+190
 c6 80 01              ldi16	r6, 0x180
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+202
 c6 a0 01              ldi16	r6, 0x1a0
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+214
 c4 c0 01              ldi16	r4, 0x1c0
 f1 15                 mov	r2, r5
 f7 07                 ld8u	r7, [r4+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f6                 brne8	avm_test_main+226
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 aa                 inc16	r2
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+239
 c4 00 02              ldi16	r4, 0x200
 c1 80                 ldi8	r5, 0x80
 4c                    ld8u	r7, [r4]
 f4 a7                 tst8	r7
 d0 09                 breq8	avm_test_main+266
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f3                 brne8	avm_test_main+252
 a0                    xor	r4, r4
 c7 00 02              ldi16	r7, 0x200
 f1 0c                 mov	r1, r4
 f2 3f                 sub	r1, r7
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 fb 08                 cmov.eq	r1, r0
 c0 80                 ldi8	r4, 0x80
 47                    ld8u	r5, [r7]
 cd 21                 cmpi.s8	r5, 0x21
 d0 0a                 breq8	avm_test_main+296
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+281
 f1 2c                 mov	r7, r0
 c4 00 02              ldi16	r4, 0x200
 07                    mov	r5, r7
 24                    sub	r5, r4
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 44                    ld8u	r5, [r4]
 cd 42                 cmpi.s8	r5, 0x42
 d0 09                 breq8	avm_test_main+323
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+309
 a0                    xor	r4, r4
 c7 00 02              ldi16	r7, 0x200
 04                    mov	r5, r4
 27                    sub	r5, r7
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 47                    ld8u	r5, [r7]
 cd 63                 cmpi.s8	r5, 0x63
 d0 0a                 breq8	avm_test_main+353
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+338
 f1 2c                 mov	r7, r0
 c4 00 02              ldi16	r4, 0x200
 07                    mov	r5, r7
 24                    sub	r5, r4
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 44                    ld8u	r5, [r4]
 c2 84                 ldi8	r6, 0x84
 36                    cmp	r5, r6
 d0 09                 breq8	avm_test_main+381
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	avm_test_main+366
 a0                    xor	r4, r4
 c7 00 02              ldi16	r7, 0x200
 04                    mov	r5, r4
 27                    sub	r5, r7
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 47                    ld8u	r5, [r7]
 c2 a5                 ldi8	r6, 0xa5
 36                    cmp	r5, r6
 d0 0a                 breq8	avm_test_main+412
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	avm_test_main+396
 f1 2c                 mov	r7, r0
 c4 00 02              ldi16	r4, 0x200
 07                    mov	r5, r7
 24                    sub	r5, r4
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 44                    ld8u	r5, [r4]
 c2 c6                 ldi8	r6, 0xc6
 36                    cmp	r5, r6
 d0 09                 breq8	avm_test_main+440
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	avm_test_main+425
 a0                    xor	r4, r4
 c7 00 02              ldi16	r7, 0x200
 04                    mov	r5, r4
 27                    sub	r5, r7
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 47                    ld8u	r5, [r7]
 c2 e7                 ldi8	r6, 0xe7
 36                    cmp	r5, r6
 d0 0a                 breq8	avm_test_main+471
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	avm_test_main+455
 f1 2c                 mov	r7, r0
 c4 00 02              ldi16	r4, 0x200
 07                    mov	r5, r7
 24                    sub	r5, r4
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 f9 2a                 xor	r1, r2
 f1 24                 mov	r5, r0
 d4 14                 jmp8	avm_test_main+508
 06                    mov	r5, r6
 f1 20                 mov	r4, r0
 f2 0c                 add	r1, r4
 41                    ld8u	r4, [r5]
 f2 3c                 sub	r1, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 07                 cmpi.s8	r4, 0x7
 da 8d fe              breq16	avm_test_main+137
 f4 69                 stsp16	[sp+0xa], r5
 fa 45                 lsl16i	r5, 0x5
 c6 e0 1f              ldi16	r6, 0x1fe0
 89                    and	r6, r5
 c5 20 01              ldi16	r5, 0x120
 16                    add	r5, r6
 c7 00 01              ldi16	r7, 0x100
 1e                    add	r7, r6
 43                    ld8u	r4, [r7]
 f4 a4                 tst8	r4
 d0 d8                 breq8	avm_test_main+489
 49                    ld8u	r6, [r5]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 3e                    cmp	r7, r6
 d1 0d                 brne8	avm_test_main+549
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 ed 8a 01              ld8u	r4, [r5-31]
 f4 a4                 tst8	r4
 06                    mov	r5, r6
 d1 ee                 brne8	avm_test_main+529
 d4 c3                 jmp8	avm_test_main+488
 f1 74                 zext8	r4
 d4 c2                 jmp8	avm_test_main+491
 f0 59 80 02           stm16	[0x280], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	avm_halt+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
