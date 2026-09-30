
codegen_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_integer.c
00000377 l     F .text	00000064 mix_u16
000003db l     F .text	0000001a mix_s16
000003f5 l     F .text	000000d4 mix_u32
00000100 l     O .data	00000003 .L.str
000004c9 l     F .text	00000013 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
000004dc l     F .text	0000000d test_puts
000004e9 l     F .text	00000011 test_hex16
00000109 l     O .data	00000003 .L.str.3
000004fa l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000520 l       .init_array	00000000 .hidden __init_array_end
00000520 l       .init_array	00000000 .hidden __init_array_start
00000520 l       .fini_array	00000000 .hidden __fini_array_start
00000520 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000a0 avm_test_main
0000051e g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 00 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 20 05              ldi16	r4, 0x520
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 05              ldi16	r6, 0x520
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 20 05           ldi16	r0, 0x520
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 20 05           ldi16	r2, 0x520
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 20 05              ldi16	r4, 0x520
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 05              ldi16	r6, 0x520
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 20 05           ldi16	r2, 0x520
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 20 05           ldi16	r0, 0x520
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c4 e1 ac              ldi16	r4, 0xace1
 f4 78                 stsp16	[sp+0xe], r4
 c4 57 13              ldi16	r4, 0x1357
 f4 70                 stsp16	[sp+0xc], r4
 c4 60 a4              ldi16	r4, 0xa460
 f4 68                 stsp16	[sp+0xa], r4
 c4 3d 01              ldi16	r4, 0x13d
 f4 60                 stsp16	[sp+0x8], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 31                 ldsp16	r5, [sp+0xc]
 d5 6c                 call8	mix_u16
 f1 04                 mov	r0, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 c7 00              call16	mix_s16
 f1 0c                 mov	r1, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 d4 00              call16	mix_u32
 f2 66                 mov32	q1, q2
 c4 00 01              ldi16	r4, 0x100
 f1 24                 mov	r5, r0
 e1 9e 01              call16	test_line16
 c4 03 01              ldi16	r4, 0x103
 f1 25                 mov	r5, r1
 e1 96 01              call16	test_line16
 c4 06 01              ldi16	r4, 0x106
 e1 a3 01              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 e1 a6 01              call16	test_hex16
 f1 22                 mov	r4, r2
 e1 a1 01              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c4 09 01              ldi16	r4, 0x109
 c5 6d 85              ldi16	r5, 0x856d
 e1 74 01              call16	test_line16
 c4 c6 84              ldi16	r4, 0x84c6
 f5 04                 cmp	r0, r4
 f8 0c                 cset.ne	r4
 c5 2e a9              ldi16	r5, 0xa92e
 f5 0d                 cmp	r1, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c6 ed e0              ldi16	r6, 0xe0ed
 c7 ca b1              ldi16	r7, 0xb1ca
 f0 69 4c              cmp32	q1, q3
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_u16>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 15                 mov	r2, r5
 f2 39                 sub	r1, r1
 f0 00 0b              ldi8	r0, 0xb
 f0 03 11              ldi8	r3, 0x11
 f4 a0                 tst8	r0
 d0 47                 breq8	mix_u16+91
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f1 2d                 mov	r7, r1
 cb f9                 addi.s8	r7, -0x7
 cd 07                 cmpi.s8	r5, 0x7
 fc 39                 cmov.ult	r7, r1
 c2 0f                 ldi8	r6, 0xf
 2b                    sub	r6, r7
 f4 af                 inc16	r7
 f1 77                 zext8	r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 07                 shl16v	r5, r7
 f1 76                 zext8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 12                 lsr16v	r4, r6
 91                    or	r4, r5
 c1 01                 ldi8	r5, 0x1
 f9 a9                 or	r5, r2
 f4 02                 ldsp16	r6, [sp+0x0]
 ec 35                 udiv16	r6, r5
 0e                    mov	r7, r6
 fe 3b                 mul16	r7, r3
 1c                    add	r7, r4
 fe 35                 mul16	r6, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 22                    sub	r4, r6
 c1 1f                 ldi8	r5, 0x1f
 fe 25                 mul16	r4, r5
 c1 05                 ldi8	r5, 0x5
 fe 15                 mul16	r2, r5
 13                    add	r4, r7
 f4 b0                 dec16	r0
 f4 a9                 inc16	r1
 f0 0a 03              addi.s8	r2, 0x3
 f9 52                 xor	r2, r4
 f4 a0                 tst8	r0
 d1 b9                 brne8	mix_u16+20
 f9 8a                 xor	r4, r2
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_s16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 0c                    mov	r7, r4
 ec b8                 sdiv16	r7, r0
 c6 01 01              ldi16	r6, 0x101
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 08                    mov	r6, r4
 fa d3                 asr16i	r6, 0x3
 a9                    xor	r6, r5
 fe 38                 mul16	r7, r0
 23                    sub	r4, r7
 c1 11                 ldi8	r5, 0x11
 fe 25                 mul16	r4, r5
 a2                    xor	r4, r6
 b8                    pop16	r0
 ef                    ret

<mix_u32>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f2 63                 mov32	q0, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 07                 ldi8	r4, 0x7
 f4 60                 stsp16	[sp+0x8], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 da ac 00              breq16	mix_u32+195
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 68                 add32	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 55                 lsl16i	r6, 0x5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 08                    mov	r6, r4
 fa 9b                 lsr16i	r6, 0xb
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 98                    or	r6, r4
 f1 1e                 mov	r3, r6
 f2 42                 sub	r2, r2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 fa 55                 lsl16i	r6, 0x5
 af                    xor	r7, r7
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f0 06 b9 79           ldi16	r2, 0x79b9
 f0 07 37 9e           ldi16	r3, 0x9e37
 f7 64                 add32	q1, q0
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 60                 stsp16	[sp+0x8], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 39                 lsl16i	r4, 0x9
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 77                 lsr16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 fa 97                 lsr16i	r6, 0x7
 f4 42                 stsp16	[sp+0x0], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 fa 69                 lsl16i	r7, 0x9
 f4 02                 ldsp16	r6, [sp+0x0]
 9e                    or	r7, r6
 aa                    xor	r6, r6
 fa 39                 lsl16i	r4, 0x9
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 77                 lsr16i	r4, 0x7
 a5                    xor	r5, r5
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 08                    mov	r6, r4
 fa 5d                 lsl16i	r6, 0xd
 9b                    or	r6, r7
 af                    xor	r7, r7
 fa 73                 lsr16i	r4, 0x3
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 20                 ldsp16	r4, [sp+0x8]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f4 b4                 dec16	r4
 e0 4b ff              jmp16	mix_u32+14
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f2 68                 mov32	q2, q0
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_line16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 d5 0e                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d5 13                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<test_puts>:
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_puts+12
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_puts+1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 fa 78                 lsr16i	r4, 0x8
 d5 09                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
