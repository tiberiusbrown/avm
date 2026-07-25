
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000080 values
00000180 l     O .data	00000002 constant_arith_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000d2 avm_test_main
000002e8 g     F .text	00000002 avm_halt

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
 e1 d2 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c0 7b                 ldi8	r4, 0x7b
 c5 00 01              ldi16	r5, 0x100
 f0 04 01 01           ldi16	r0, 0x101
 c6 bb 40              ldi16	r6, 0x40bb
 f7 4c                 st16	[r5+], r4
 f2 20                 add	r4, r0
 32                    cmp	r4, r6
 d1 f9                 brne8	avm_test_main+18
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c5 00 01              ldi16	r5, 0x100
 f4 49                 stsp16	[sp+0x2], r5
 c1 40                 ldi8	r5, 0x40
 f4 41                 stsp16	[sp+0x0], r5
 08                    mov	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 61                 stsp16	[sp+0x8], r5
 f7 32                 ld16	r2, [r6+]
 f4 5a                 stsp16	[sp+0x6], r6
 f0 01 03              ldi8	r1, 0x3
 f1 26                 mov	r5, r2
 fe 29                 mul16	r5, r1
 14                    add	r5, r4
 c2 05                 ldi8	r6, 0x5
 f1 2e                 mov	r7, r2
 fe 3e                 mul16	r7, r6
 ad                    xor	r7, r5
 f0 03 07              ldi8	r3, 0x7
 f1 26                 mov	r5, r2
 fe 2b                 mul16	r5, r3
 17                    add	r5, r7
 c0 0a                 ldi8	r4, 0xa
 f1 1a                 mov	r3, r2
 fe 1c                 mul16	r3, r4
 f9 76                 xor	r3, r5
 f1 2e                 mov	r7, r2
 ec 39                 udiv16	r7, r1
 c4 fd ff              ldi16	r4, 0xfffd
 07                    mov	r5, r7
 fe 2c                 mul16	r5, r4
 f2 26                 add	r5, r2
 17                    add	r5, r7
 c0 1f                 ldi8	r4, 0x1f
 f1 2e                 mov	r7, r2
 fe 3c                 mul16	r7, r4
 f2 2f                 add	r7, r3
 f1 22                 mov	r4, r2
 fe 20                 mul16	r4, r0
 a3                    xor	r4, r7
 f0 03 01              ldi8	r3, 0x1
 f9 68                 and	r3, r2
 f1 2e                 mov	r7, r2
 f4 8f                 lsr16.1	r7
 f2 2f                 add	r7, r3
 1c                    add	r7, r4
 ad                    xor	r7, r5
 f0 07 00 80           ldi16	r3, 0x8000
 f9 6a                 xor	r3, r2
 f1 27                 mov	r5, r3
 ec a9                 sdiv16	r5, r1
 ec de                 srem16	r3, r6
 f1 22                 mov	r4, r2
 ec 26                 udiv16	r4, r6
 f0 05 fb ff           ldi16	r1, 0xfffb
 08                    mov	r6, r4
 fe 31                 mul16	r6, r1
 f2 2a                 add	r6, r2
 18                    add	r6, r4
 f1 0a                 mov	r1, r2
 c0 0a                 ldi8	r4, 0xa
 ec 0c                 udiv16	r1, r4
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f1 21                 mov	r4, r1
 fe 20                 mul16	r4, r0
 f0 04 01 01           ldi16	r0, 0x101
 f2 22                 add	r4, r2
 1b                    add	r6, r7
 f2 21                 add	r4, r1
 a2                    xor	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 11                    add	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 8e                 xor	r4, r3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 db 74 ff              brne16	avm_test_main+44
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 db 62 ff              brne16	avm_test_main+38
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
