
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000080 values
00000180 l     O .data	00000002 constant_arith_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000d0 avm_test_main
000002e6 g     F .text	00000002 avm_halt

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
 e1 d0 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	_start+20
 c2 7b                 ldi8	r6, 0x7b
 c4 00 01              ldi16	r4, 0x100
 f0 04 01 01           ldi16	r0, 0x101
 c5 bb 40              ldi16	r5, 0x40bb
 0e                    mov	r7, r6
 f2 2c                 add	r7, r0
 f7 46                 st16	[r4+], r6
 3d                    cmp	r7, r5
 0b                    mov	r6, r7
 d1 f8                 brne8	avm_test_main+19
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 40                 ldi8	r5, 0x40
 f4 41                 stsp16	[sp+0x0], r5
 08                    mov	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 c5 00 01              ldi16	r5, 0x100
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 52                 stsp16	[sp+0x4], r6
 f7 29                 ld16	r1, [r5+]
 f4 59                 stsp16	[sp+0x6], r5
 f0 03 03              ldi8	r3, 0x3
 f1 29                 mov	r6, r1
 fe 33                 mul16	r6, r3
 18                    add	r6, r4
 c1 05                 ldi8	r5, 0x5
 f1 2d                 mov	r7, r1
 fe 3d                 mul16	r7, r5
 ae                    xor	r7, r6
 f0 02 07              ldi8	r2, 0x7
 f1 29                 mov	r6, r1
 fe 32                 mul16	r6, r2
 1b                    add	r6, r7
 c0 0a                 ldi8	r4, 0xa
 f1 11                 mov	r2, r1
 fe 14                 mul16	r2, r4
 f9 5a                 xor	r2, r6
 f1 29                 mov	r6, r1
 ec 33                 udiv16	r6, r3
 c4 fd ff              ldi16	r4, 0xfffd
 0e                    mov	r7, r6
 fe 3c                 mul16	r7, r4
 f2 2d                 add	r7, r1
 1e                    add	r7, r6
 c0 1f                 ldi8	r4, 0x1f
 f1 29                 mov	r6, r1
 fe 34                 mul16	r6, r4
 f2 2a                 add	r6, r2
 f1 21                 mov	r4, r1
 fe 20                 mul16	r4, r0
 a2                    xor	r4, r6
 f0 02 01              ldi8	r2, 0x1
 f9 44                 and	r2, r1
 f1 29                 mov	r6, r1
 f4 8e                 lsr16.1	r6
 f2 2a                 add	r6, r2
 18                    add	r6, r4
 ab                    xor	r6, r7
 f0 06 00 80           ldi16	r2, 0x8000
 f9 46                 xor	r2, r1
 f1 2e                 mov	r7, r2
 ec bb                 sdiv16	r7, r3
 ec d5                 srem16	r2, r5
 f1 21                 mov	r4, r1
 ec 25                 udiv16	r4, r5
 f0 04 fb ff           ldi16	r0, 0xfffb
 04                    mov	r5, r4
 fe 28                 mul16	r5, r0
 f2 25                 add	r5, r1
 14                    add	r5, r4
 f1 01                 mov	r0, r1
 c0 0a                 ldi8	r4, 0xa
 ec 04                 udiv16	r0, r4
 f0 07 f6 ff           ldi16	r3, 0xfff6
 f1 20                 mov	r4, r0
 fe 23                 mul16	r4, r3
 f2 21                 add	r4, r1
 16                    add	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f2 20                 add	r4, r0
 f0 04 01 01           ldi16	r0, 0x101
 a1                    xor	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 13                    add	r4, r7
 f9 8a                 xor	r4, r2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 db 74 ff              brne16	avm_test_main+42
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 db 61 ff              brne16	avm_test_main+35
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
