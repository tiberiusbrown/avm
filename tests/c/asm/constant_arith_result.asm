
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000012f avm_test_main
00000345 g     F .text	00000002 avm_halt

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
 e1 2f 01              call16	avm_halt

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
 aa                    xor	r6, r6
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 06                    mov	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 c4 00 01              ldi16	r4, 0x100
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 51                 stsp16	[sp+0x4], r5
 f7 21                 ld16	r1, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 f0 03 03              ldi8	r3, 0x3
 f1 21                 mov	r4, r1
 fe 23                 mul16	r4, r3
 12                    add	r4, r6
 c1 05                 ldi8	r5, 0x5
 f1 2d                 mov	r7, r1
 fe 3d                 mul16	r7, r5
 09                    mov	r6, r5
 ac                    xor	r7, r4
 f0 02 07              ldi8	r2, 0x7
 f1 21                 mov	r4, r1
 fe 22                 mul16	r4, r2
 13                    add	r4, r7
 c1 0a                 ldi8	r5, 0xa
 f1 11                 mov	r2, r1
 fe 15                 mul16	r2, r5
 f9 52                 xor	r2, r4
 f1 21                 mov	r4, r1
 ec 23                 udiv16	r4, r3
 c5 fd ff              ldi16	r5, 0xfffd
 0c                    mov	r7, r4
 fe 3d                 mul16	r7, r5
 f2 2d                 add	r7, r1
 1c                    add	r7, r4
 c0 1f                 ldi8	r4, 0x1f
 f1 25                 mov	r5, r1
 fe 2c                 mul16	r5, r4
 f2 26                 add	r5, r2
 f1 11                 mov	r2, r1
 fe 10                 mul16	r2, r0
 f9 56                 xor	r2, r5
 c1 01                 ldi8	r5, 0x1
 f9 a4                 and	r5, r1
 f1 21                 mov	r4, r1
 f4 8c                 lsr16.1	r4
 11                    add	r4, r5
 f2 22                 add	r4, r2
 a3                    xor	r4, r7
 f0 06 00 80           ldi16	r2, 0x8000
 f9 46                 xor	r2, r1
 f1 2e                 mov	r7, r2
 ec bb                 sdiv16	r7, r3
 06                    mov	r5, r6
 ec d5                 srem16	r2, r5
 f1 29                 mov	r6, r1
 ec 35                 udiv16	r6, r5
 f0 04 fb ff           ldi16	r0, 0xfffb
 06                    mov	r5, r6
 fe 28                 mul16	r5, r0
 f2 25                 add	r5, r1
 16                    add	r5, r6
 f1 01                 mov	r0, r1
 c2 0a                 ldi8	r6, 0xa
 ec 06                 udiv16	r0, r6
 f0 07 f6 ff           ldi16	r3, 0xfff6
 f1 28                 mov	r6, r0
 fe 33                 mul16	r6, r3
 f2 29                 add	r6, r1
 14                    add	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 28                 add	r6, r0
 f0 04 01 01           ldi16	r0, 0x101
 a9                    xor	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 1b                    add	r6, r7
 f9 ca                 xor	r6, r2
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 db 72 ff              brne16	avm_test_main+40
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 5f ff              brne16	avm_test_main+33
 02                    mov	r4, r6
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 f4 59                 stsp16	[sp+0x6], r5
 c1 a0                 ldi8	r5, 0xa0
 31                    cmp	r4, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 27                 cmov.ult	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 f0 01 0f              ldi8	r1, 0xf
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 c5 00 a0              ldi16	r5, 0xa000
 39                    cmp	r6, r5
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 f9 19                 or	r0, r6
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 20                 cmov.ult	r4, r0
 08                    mov	r6, r4
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
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
