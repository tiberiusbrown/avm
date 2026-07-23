
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000231 avm_test_main
00000547 g     F .text	00000002 avm_halt

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
 e1 31 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 c5 00 01              ldi16	r5, 0x100
 f0 01 61              ldi8	r1, 0x61
 f2 42                 sub	r2, r2
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f1 2a                 mov	r6, r2
 0e                    mov	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 3c                 mul16	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 f4 5a                 stsp16	[sp+0x6], r6
 02                    mov	r4, r6
 fa 35                 lsl16i	r4, 0x5
 f0 04 00 01           ldi16	r0, 0x100
 f2 04                 add	r0, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 2e                 mov	r7, r2
 f0 39 08              stsp16	[sp+0x8], r1
 f4 69                 stsp16	[sp+0xa], r5
 f1 1d                 mov	r3, r5
 c1 4f                 ldi8	r5, 0x4f
 03                    mov	r4, r7
 f3 11                 mulu8.w	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 c1 1a                 ldi8	r5, 0x1a
 f3 11                 mulu8.w	r4, r5
 07                    mov	r5, r7
 24                    sub	r5, r4
 27                    sub	r5, r7
 f2 25                 add	r5, r1
 f0 6d a7              st8	[r3+], r5
 f4 af                 inc16	r7
 f4 a9                 inc16	r1
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 e3                 brne8	avm_test_main+53
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 20                 add	r4, r0
 f2 4b                 sub	r3, r3
 ee 68 28              st8	[r4+8], r3
 ee 60 3f              st8	[r0+31], r3
 f0 0a 03              addi.s8	r2, 0x3
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 09 03              addi.s8	r1, 0x3
 f4 29                 ldsp16	r5, [sp+0xa]
 c9 20                 addi.s8	r5, 0x20
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 a5                 brne8	avm_test_main+24
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+122
 d7 01                 sys	debug_break
 f1 0b                 mov	r1, r3
 d4 0b                 jmp8	avm_test_main+149
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da 8e 01              breq16	avm_test_main+547
 c6 00 01              ldi16	r6, 0x100
 f4 b1                 dec16	r1
 f1 21                 mov	r4, r1
 f7 15                 ld8u	r5, [r6+]
 f4 a9                 inc16	r1
 f4 a5                 tst8	r5
 d1 f6                 brne8	avm_test_main+154
 c6 20 01              ldi16	r6, 0x120
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+167
 c6 40 01              ldi16	r6, 0x140
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+179
 c6 60 01              ldi16	r6, 0x160
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+191
 c6 80 01              ldi16	r6, 0x180
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+203
 c6 a0 01              ldi16	r6, 0x1a0
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+215
 c4 c0 01              ldi16	r4, 0x1c0
 f1 15                 mov	r2, r5
 f7 07                 ld8u	r7, [r4+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f6                 brne8	avm_test_main+227
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 aa                 inc16	r2
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+240
 c4 00 02              ldi16	r4, 0x200
 c1 80                 ldi8	r5, 0x80
 4c                    ld8u	r7, [r4]
 f4 a7                 tst8	r7
 d0 09                 breq8	avm_test_main+267
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f3                 brne8	avm_test_main+253
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
 d0 0a                 breq8	avm_test_main+297
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+282
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
 d0 09                 breq8	avm_test_main+324
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	avm_test_main+310
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
 d0 0a                 breq8	avm_test_main+354
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	avm_test_main+339
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
 d0 09                 breq8	avm_test_main+382
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	avm_test_main+367
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
 d0 0a                 breq8	avm_test_main+413
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	avm_test_main+397
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
 d0 09                 breq8	avm_test_main+441
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	avm_test_main+426
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
 d0 0a                 breq8	avm_test_main+472
 f4 af                 inc16	r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	avm_test_main+456
 f1 2c                 mov	r7, r0
 c4 00 02              ldi16	r4, 0x200
 07                    mov	r5, r7
 24                    sub	r5, r4
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 f9 2a                 xor	r1, r2
 f1 28                 mov	r6, r0
 d4 11                 jmp8	avm_test_main+506
 06                    mov	r5, r6
 f1 20                 mov	r4, r0
 f2 0c                 add	r1, r4
 41                    ld8u	r4, [r5]
 f2 3c                 sub	r1, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 ce 07                 cmpi.s8	r6, 0x7
 da 90 fe              breq16	avm_test_main+138
 f4 6a                 stsp16	[sp+0xa], r6
 fa 55                 lsl16i	r6, 0x5
 c5 20 01              ldi16	r5, 0x120
 16                    add	r5, r6
 c7 00 01              ldi16	r7, 0x100
 1e                    add	r7, r6
 43                    ld8u	r4, [r7]
 f4 a4                 tst8	r4
 d0 df                 breq8	avm_test_main+490
 49                    ld8u	r6, [r5]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 3e                    cmp	r7, r6
 d1 0d                 brne8	avm_test_main+543
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 ed 8a 01              ld8u	r4, [r5-31]
 f4 a4                 tst8	r4
 06                    mov	r5, r6
 d1 ee                 brne8	avm_test_main+523
 d4 ca                 jmp8	avm_test_main+489
 f1 74                 zext8	r4
 d4 c9                 jmp8	avm_test_main+492
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
