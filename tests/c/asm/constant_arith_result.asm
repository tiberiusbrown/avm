
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000139 avm_test_main
0000034f g     F .text	00000002 avm_halt

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
 e1 39 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 c5 00 01              ldi16	r5, 0x100
 f0 05 01 01           ldi16	r1, 0x101
 c6 bb 40              ldi16	r6, 0x40bb
 f7 4c                 st16	[r5+], r4
 f2 21                 add	r4, r1
 32                    cmp	r4, r6
 d1 f9                 brne8	avm_test_main+18
 aa                    xor	r6, r6
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 06                    mov	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f4 59                 stsp16	[sp+0x6], r5
 f7 22                 ld16	r2, [r4+]
 f4 50                 stsp16	[sp+0x4], r4
 c1 03                 ldi8	r5, 0x3
 f1 22                 mov	r4, r2
 fe 25                 mul16	r4, r5
 12                    add	r4, r6
 c2 05                 ldi8	r6, 0x5
 f1 2e                 mov	r7, r2
 fe 3e                 mul16	r7, r6
 ac                    xor	r7, r4
 f0 00 07              ldi8	r0, 0x7
 f1 22                 mov	r4, r2
 fe 20                 mul16	r4, r0
 13                    add	r4, r7
 c3 0a                 ldi8	r7, 0xa
 f1 02                 mov	r0, r2
 fe 07                 mul16	r0, r7
 f9 12                 xor	r0, r4
 f1 2e                 mov	r7, r2
 ec 3d                 udiv16	r7, r5
 f0 07 fd ff           ldi16	r3, 0xfffd
 03                    mov	r4, r7
 fe 23                 mul16	r4, r3
 f2 22                 add	r4, r2
 13                    add	r4, r7
 f0 03 1f              ldi8	r3, 0x1f
 f1 2e                 mov	r7, r2
 fe 3b                 mul16	r7, r3
 f2 2c                 add	r7, r0
 f1 1a                 mov	r3, r2
 fe 19                 mul16	r3, r1
 f9 7e                 xor	r3, r7
 c3 01                 ldi8	r7, 0x1
 f9 e8                 and	r7, r2
 f1 02                 mov	r0, r2
 f4 88                 lsr16.1	r0
 f2 07                 add	r0, r7
 f2 03                 add	r0, r3
 f9 12                 xor	r0, r4
 f0 07 00 80           ldi16	r3, 0x8000
 f9 6a                 xor	r3, r2
 f1 23                 mov	r4, r3
 ec a5                 sdiv16	r4, r5
 ec de                 srem16	r3, r6
 f1 2e                 mov	r7, r2
 ec 3e                 udiv16	r7, r6
 c6 fb ff              ldi16	r6, 0xfffb
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 f2 26                 add	r5, r2
 17                    add	r5, r7
 f1 2e                 mov	r7, r2
 c2 0a                 ldi8	r6, 0xa
 ec 3e                 udiv16	r7, r6
 f0 05 f6 ff           ldi16	r1, 0xfff6
 0b                    mov	r6, r7
 fe 31                 mul16	r6, r1
 f0 05 01 01           ldi16	r1, 0x101
 f2 2a                 add	r6, r2
 f2 24                 add	r5, r0
 1b                    add	r6, r7
 a9                    xor	r6, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 ce                 xor	r6, r3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 db 73 ff              brne16	avm_test_main+38
 c3 0a                 ldi8	r7, 0xa
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 5e ff              brne16	avm_test_main+31
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 49                 stsp16	[sp+0x2], r5
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 f4 51                 stsp16	[sp+0x4], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 c9 37                 addi.s8	r5, 0x37
 f4 59                 stsp16	[sp+0x6], r5
 c1 a0                 ldi8	r5, 0xa0
 f4 08                 ldsp16	r4, [sp+0x2]
 31                    cmp	r4, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 01 0f              ldi8	r1, 0xf
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 c5 00 a0              ldi16	r5, 0xa000
 39                    cmp	r6, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 fc 25                 cmov.ult	r4, r5
 04                    mov	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
