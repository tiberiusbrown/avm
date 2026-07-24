
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000143 avm_test_main
00000359 g     F .text	00000002 avm_halt

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
 e1 43 01              call16	avm_halt

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
 a5                    xor	r5, r5
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 09                    mov	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 c4 00 01              ldi16	r4, 0x100
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 52                 stsp16	[sp+0x4], r6
 f7 21                 ld16	r1, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 c2 03                 ldi8	r6, 0x3
 f1 21                 mov	r4, r1
 fe 26                 mul16	r4, r6
 f1 16                 mov	r2, r6
 11                    add	r4, r5
 c1 05                 ldi8	r5, 0x5
 f1 29                 mov	r6, r1
 fe 35                 mul16	r6, r5
 a8                    xor	r6, r4
 c0 07                 ldi8	r4, 0x7
 f1 2d                 mov	r7, r1
 fe 3c                 mul16	r7, r4
 1e                    add	r7, r6
 c2 0a                 ldi8	r6, 0xa
 f1 21                 mov	r4, r1
 fe 26                 mul16	r4, r6
 a3                    xor	r4, r7
 f1 2d                 mov	r7, r1
 ec 3a                 udiv16	r7, r2
 f0 06 fd ff           ldi16	r2, 0xfffd
 f1 1f                 mov	r3, r7
 fe 1a                 mul16	r3, r2
 f2 19                 add	r3, r1
 f2 1f                 add	r3, r7
 f0 02 1f              ldi8	r2, 0x1f
 f1 2d                 mov	r7, r1
 fe 3a                 mul16	r7, r2
 1c                    add	r7, r4
 f1 29                 mov	r6, r1
 fe 30                 mul16	r6, r0
 ab                    xor	r6, r7
 c3 01                 ldi8	r7, 0x1
 f9 e4                 and	r7, r1
 f1 21                 mov	r4, r1
 f4 8c                 lsr16.1	r4
 13                    add	r4, r7
 12                    add	r4, r6
 f9 8e                 xor	r4, r3
 f0 06 00 80           ldi16	r2, 0x8000
 f9 46                 xor	r2, r1
 f1 1a                 mov	r3, r2
 c2 03                 ldi8	r6, 0x3
 ec 9e                 sdiv16	r3, r6
 ec d5                 srem16	r2, r5
 f1 2d                 mov	r7, r1
 ec 3d                 udiv16	r7, r5
 c5 fb ff              ldi16	r5, 0xfffb
 0b                    mov	r6, r7
 fe 35                 mul16	r6, r5
 f2 29                 add	r6, r1
 1b                    add	r6, r7
 f1 2d                 mov	r7, r1
 c1 0a                 ldi8	r5, 0xa
 ec 3d                 udiv16	r7, r5
 f0 04 f6 ff           ldi16	r0, 0xfff6
 07                    mov	r5, r7
 fe 28                 mul16	r5, r0
 f0 04 01 01           ldi16	r0, 0x101
 f2 25                 add	r5, r1
 18                    add	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 17                    add	r5, r7
 a6                    xor	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f2 27                 add	r5, r3
 f9 aa                 xor	r5, r2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 db 73 ff              brne16	avm_test_main+40
 c3 0a                 ldi8	r7, 0xa
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 5e ff              brne16	avm_test_main+33
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f4 4a                 stsp16	[sp+0x2], r6
 fa 94                 lsr16i	r6, 0x4
 f0 00 30              ldi8	r0, 0x30
 f4 52                 stsp16	[sp+0x4], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 ca 37                 addi.s8	r6, 0x37
 f4 5a                 stsp16	[sp+0x6], r6
 c2 a0                 ldi8	r6, 0xa0
 f4 08                 ldsp16	r4, [sp+0x2]
 32                    cmp	r4, r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 01 0f              ldi8	r1, 0xf
 09                    mov	r6, r5
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 f4 12                 ldsp16	r6, [sp+0x4]
 fc 26                 cmov.ult	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f4 52                 stsp16	[sp+0x4], r6
 c6 00 a0              ldi16	r6, 0xa000
 36                    cmp	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 f9 15                 or	r0, r5
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 30                 cmov.ult	r6, r0
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
