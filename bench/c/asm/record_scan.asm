
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/record_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 record_scan.c
00000100 l     O .data	00000120 records
00000220 l     O .data	00000002 record_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000dd avm_test_main
000003f3 g     F .text	00000002 avm_halt

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
 e1 dd 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 f0 07 e8 03           ldi16	r3, 0x3e8
 c5 02 01              ldi16	r5, 0x102
 f0 02 fa              ldi8	r2, 0xfa
 aa                    xor	r6, r6
 f0 00 fb              ldi8	r0, 0xfb
 f0 01 03              ldi8	r1, 0x3
 c0 4f                 ldi8	r4, 0x4f
 f4 40                 stsp16	[sp+0x0], r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 9a                 lsr16i	r6, 0xa
 c3 0d                 ldi8	r7, 0xd
 f3 1b                 mulu8.w	r6, r7
 f1 2e                 mov	r7, r2
 2e                    sub	r7, r6
 09                    mov	r6, r5
 ca fe                 addi.s8	r6, -0x2
 5b                    st8	[r6], r7
 c2 75                 ldi8	r6, 0x75
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 08                 ldsp16	r4, [sp+0x2]
 23                    sub	r4, r7
 c2 fe                 ldi8	r6, 0xfe
 88                    and	r6, r4
 fa 91                 lsr16i	r6, 0x1
 1b                    add	r6, r7
 fa 93                 lsr16i	r6, 0x3
 c0 0b                 ldi8	r4, 0xb
 f3 18                 mulu8.w	r6, r4
 f1 20                 mov	r4, r0
 22                    sub	r4, r6
 09                    mov	r6, r5
 f4 b6                 dec16	r6
 58                    st8	[r6], r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 01                    mov	r4, r5
 c8 02                 addi.s8	r4, 0x2
 f5 53                 st16	[r4], r3
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 f3 01                 st8	[r4], r1
 c0 5a                 ldi8	r4, 0x5a
 a2                    xor	r4, r6
 54                    st8	[r5], r4
 f0 09 07              addi.s8	r1, 0x7
 f4 a8                 inc16	r0
 f4 ae                 inc16	r6
 f4 aa                 inc16	r2
 c9 06                 addi.s8	r5, 0x6
 f0 0b 1d              addi.s8	r3, 0x1d
 c4 58 09              ldi16	r4, 0x958
 f5 1c                 cmp	r3, r4
 d1 a8                 brne8	avm_test_main+27
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 0c                    mov	r7, r4
 f1 14                 mov	r2, r4
 08                    mov	r6, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 30              ldi8	r1, 0x30
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 6c 60              ld8u	r3, [r0]
 f1 24                 mov	r5, r0
 f4 ad                 inc16	r5
 f5 36                 ld8u	r2, [r5]
 f1 24                 mov	r5, r0
 c9 02                 addi.s8	r5, 0x2
 45                    ld8u	r5, [r5]
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 06                 breq8	avm_test_main+161
 f1 20                 mov	r4, r0
 c8 03                 addi.s8	r4, 0x3
 40                    ld8u	r4, [r4]
 1c                    add	r7, r4
 07                    mov	r5, r7
 f6 43                 sext8	r3
 f2 2b                 add	r6, r3
 f6 42                 sext8	r2
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 22                 add	r4, r2
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 6c                    ld16	r7, [r4]
 f4 b7                 dec16	r7
 73                    st16	[r4], r7
 ad                    xor	r7, r5
 f0 08 06              addi.s8	r0, 0x6
 f4 b1                 dec16	r1
 f4 a1                 tst8	r1
 d1 c3                 brne8	avm_test_main+131
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 af                 brne8	avm_test_main+122
 f9 5a                 xor	r2, r6
 f9 5e                 xor	r2, r7
 f0 5a 20 02           stm16	[0x220], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+220
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
