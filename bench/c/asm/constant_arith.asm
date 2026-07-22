
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000080 values
00000180 l     O .data	00000002 constant_arith_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000cc avm_test_main
000002e2 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 cc 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	_start+18
 c2 7b                 ldi8	r6, 0x7b
 c4 00 01              ldi16	r4, 0x100
 f0 07 01 01           ldi16	r3, 0x101
 c5 bb 40              ldi16	r5, 0x40bb
 0e                    mov	r7, r6
 f2 2f                 add	r7, r3
 f7 46                 st16	[r7+], r6
 3d                    cmp	r7, r5
 0b                    mov	r6, r7
 d1 f8                 brne8	avm_test_main+19
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 06                    mov	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 c4 00 01              ldi16	r4, 0x100
 f0 30 00              ldsp16	r0, [sp+0x0]
 f7 27                 ld16	r7, [r7+]
 f4 58                 stsp16	[sp+0x6], r4
 c1 03                 ldi8	r5, 0x3
 03                    mov	r4, r7
 fe 25                 mul16	r4, r5
 f1 15                 mov	r2, r5
 12                    add	r4, r6
 c2 05                 ldi8	r6, 0x5
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 a4                    xor	r5, r4
 c0 07                 ldi8	r4, 0x7
 0b                    mov	r6, r7
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 c0 0a                 ldi8	r4, 0xa
 07                    mov	r5, r7
 fe 2c                 mul16	r5, r4
 a6                    xor	r5, r6
 03                    mov	r4, r7
 ec 22                 udiv16	r4, r2
 f1 0a                 mov	r1, r2
 f0 06 fd ff           ldi16	r2, 0xfffd
 08                    mov	r6, r4
 fe 32                 mul16	r6, r2
 1b                    add	r6, r7
 18                    add	r6, r4
 f0 02 1f              ldi8	r2, 0x1f
 03                    mov	r4, r7
 fe 3a                 mul16	r7, r2
 1d                    add	r7, r5
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 fe 23                 mul16	r4, r3
 a3                    xor	r4, r7
 c3 01                 ldi8	r7, 0x1
 8d                    and	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 81                 lsr16i	r5, 0x1
 17                    add	r5, r7
 14                    add	r5, r4
 a6                    xor	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 f0 06 00 80           ldi16	r2, 0x8000
 f4 23                 ldsp16	r7, [sp+0x8]
 f9 5e                 xor	r2, r7
 f1 1a                 mov	r3, r2
 ec 99                 sdiv16	r3, r1
 c0 05                 ldi8	r4, 0x5
 ec d4                 srem16	r2, r4
 0b                    mov	r6, r7
 ec 34                 udiv16	r6, r4
 f0 05 fb ff           ldi16	r1, 0xfffb
 02                    mov	r4, r6
 fe 21                 mul16	r4, r1
 13                    add	r4, r7
 12                    add	r4, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 c2 0a                 ldi8	r6, 0xa
 ec 3e                 udiv16	r7, r6
 f0 05 f6 ff           ldi16	r1, 0xfff6
 0b                    mov	r6, r7
 fe 31                 mul16	r6, r1
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 1b                    add	r6, r7
 a8                    xor	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 2b                 add	r6, r3
 f0 07 01 01           ldi16	r3, 0x101
 f9 ca                 xor	r6, r2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 db 79 ff              brne16	avm_test_main+43
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 65 ff              brne16	avm_test_main+35
 f0 5e 80 01           stm16	[0x180], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	avm_halt+5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
