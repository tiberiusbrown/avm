
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000080 values
00000180 l     O .data	00000002 constant_arith_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000d3 avm_test_main
000002e9 g     F .text	00000002 avm_halt

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
 e1 d3 00              call16	avm_halt

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
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 f1 26                 mov	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c4 00 01              ldi16	r4, 0x100
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 51                 stsp16	[sp+0x4], r5
 f7 26                 ld16	r6, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 f0 03 03              ldi8	r3, 0x3
 02                    mov	r4, r6
 fe 23                 mul16	r4, r3
 f2 22                 add	r4, r2
 f0 02 05              ldi8	r2, 0x5
 06                    mov	r5, r6
 fe 2a                 mul16	r5, r2
 a4                    xor	r5, r4
 c0 07                 ldi8	r4, 0x7
 f1 0e                 mov	r1, r6
 fe 0c                 mul16	r1, r4
 f2 0d                 add	r1, r5
 c0 0a                 ldi8	r4, 0xa
 06                    mov	r5, r6
 fe 2c                 mul16	r5, r4
 f9 a6                 xor	r5, r1
 f1 0e                 mov	r1, r6
 ec 0b                 udiv16	r1, r3
 c7 fd ff              ldi16	r7, 0xfffd
 f1 21                 mov	r4, r1
 fe 27                 mul16	r4, r7
 12                    add	r4, r6
 f2 21                 add	r4, r1
 c3 1f                 ldi8	r7, 0x1f
 f1 0e                 mov	r1, r6
 fe 0f                 mul16	r1, r7
 f2 0d                 add	r1, r5
 06                    mov	r5, r6
 fe 28                 mul16	r5, r0
 f9 a6                 xor	r5, r1
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f1 0e                 mov	r1, r6
 f4 89                 lsr16.1	r1
 f2 0f                 add	r1, r7
 f2 0d                 add	r1, r5
 f9 32                 xor	r1, r4
 c4 00 80              ldi16	r4, 0x8000
 a2                    xor	r4, r6
 04                    mov	r5, r4
 ec ab                 sdiv16	r5, r3
 ec e2                 srem16	r4, r2
 0e                    mov	r7, r6
 ec 3a                 udiv16	r7, r2
 f0 06 fb ff           ldi16	r2, 0xfffb
 f1 1f                 mov	r3, r7
 fe 1a                 mul16	r3, r2
 f2 1e                 add	r3, r6
 f2 1f                 add	r3, r7
 0e                    mov	r7, r6
 f0 00 0a              ldi8	r0, 0xa
 ec 38                 udiv16	r7, r0
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f1 17                 mov	r2, r7
 fe 10                 mul16	r2, r0
 f0 04 01 01           ldi16	r0, 0x101
 f2 16                 add	r2, r6
 f2 19                 add	r3, r1
 f2 17                 add	r2, r7
 f9 4e                 xor	r2, r3
 f2 15                 add	r2, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f9 52                 xor	r2, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 db 73 ff              brne16	avm_test_main+44
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 60 ff              brne16	avm_test_main+37
 f0 5a 80 01           stm16	[0x180], r2
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
