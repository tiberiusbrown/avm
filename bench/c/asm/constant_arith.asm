
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
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
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
 d6 f4                 adjsp	_start+16
 c2 7b                 ldi8	r6, 0x7b
 c4 00 01              ldi16	r4, 0x100
 f0 04 01 01           ldi16	r0, 0x101
 c5 bb 40              ldi16	r5, 0x40bb
 0e                    mov	r7, r6
 f2 2c                 add	r7, r0
 f7 46                 st16	[r7+], r6
 3d                    cmp	r7, r5
 0b                    mov	r6, r7
 d1 f8                 brne8	avm_test_main+19
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 09                    mov	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 c4 00 01              ldi16	r4, 0x100
 f0 31 00              ldsp16	r1, [sp+0x0]
 f7 27                 ld16	r7, [r7+]
 f4 60                 stsp16	[sp+0x8], r4
 c2 03                 ldi8	r6, 0x3
 03                    mov	r4, r7
 fe 26                 mul16	r4, r6
 f1 16                 mov	r2, r6
 11                    add	r4, r5
 c2 05                 ldi8	r6, 0x5
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 f1 1e                 mov	r3, r6
 a4                    xor	r5, r4
 c0 07                 ldi8	r4, 0x7
 0b                    mov	r6, r7
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 c0 0a                 ldi8	r4, 0xa
 07                    mov	r5, r7
 fe 2c                 mul16	r5, r4
 a6                    xor	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 0b                    mov	r6, r7
 ec 32                 udiv16	r6, r2
 02                    mov	r4, r6
 fe 22                 mul16	r4, r2
 f4 58                 stsp16	[sp+0x6], r4
 f4 6b                 stsp16	[sp+0xa], r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 19                 ldsp16	r5, [sp+0x6]
 21                    sub	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 12                    add	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 c0 1f                 ldi8	r4, 0x1f
 0b                    mov	r6, r7
 fe 34                 mul16	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 07                    mov	r5, r7
 fe 28                 mul16	r5, r0
 a6                    xor	r5, r6
 c0 01                 ldi8	r4, 0x1
 83                    and	r4, r7
 0b                    mov	r6, r7
 fa 91                 lsr16i	r6, 0x1
 18                    add	r6, r4
 19                    add	r6, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 a8                    xor	r6, r4
 f0 04 00 80           ldi16	r0, 0x8000
 f9 1e                 xor	r0, r7
 f1 10                 mov	r2, r0
 c0 03                 ldi8	r4, 0x3
 ec 94                 sdiv16	r2, r4
 ec c3                 srem16	r0, r3
 07                    mov	r5, r7
 ec 2b                 udiv16	r5, r3
 f4 69                 stsp16	[sp+0xa], r5
 fe 2b                 mul16	r5, r3
 03                    mov	r4, r7
 21                    sub	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 07                    mov	r5, r7
 f0 03 0a              ldi8	r3, 0xa
 ec 2b                 udiv16	r5, r3
 f4 69                 stsp16	[sp+0xa], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 2b                 mul16	r5, r3
 2d                    sub	r7, r5
 12                    add	r4, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 1d                    add	r7, r5
 ac                    xor	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f2 2e                 add	r7, r2
 f9 e2                 xor	r7, r0
 f0 04 01 01           ldi16	r0, 0x101
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 07                    mov	r5, r7
 db 73 ff              brne16	avm_test_main+43
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 07                    mov	r5, r7
 db 5e ff              brne16	avm_test_main+35
 f0 5f 80 01           stm16	[0x180], r7
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
