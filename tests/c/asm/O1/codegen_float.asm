
codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_float.c
00000c2d l     F .text	00000009 arithmetic
00000c36 l     F .text	00000003 divide_exact
00000c39 l     F .text	00000002 sqrt_exact
00000c3b l     F .text	00000012 select_min
00000c4d l     F .text	00000012 select_max
00000100 l     O .data	00000003 .L.str
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000c5f l     F .text	00000004 convert_signed
00000c63 l     F .text	00000004 convert_unsigned
00000112 l     O .data	00000003 .L.str.6
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
00000c6c l       .init_array	00000000 .hidden __init_array_end
00000c6c l       .init_array	00000000 .hidden __init_array_start
00000c6c l       .fini_array	00000000 .hidden __fini_array_start
00000c6c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000956 avm_test_main
00000c6a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000c67 g     F .text	00000003 sqrtf

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
 e1 4c 0a              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6c 0c              ldi16	r4, 0xc6c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6c 0c              ldi16	r6, 0xc6c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 6c 0c           ldi16	r0, 0xc6c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6c 0c           ldi16	r2, 0xc6c
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
 c4 6c 0c              ldi16	r4, 0xc6c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6c 0c              ldi16	r6, 0xc6c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 6c 0c           ldi16	r2, 0xc6c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6c 0c           ldi16	r0, 0xc6c
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
 d6 a2                 adjsp	-0x5e
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 3d 54              stsp16	[sp+0x54], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c 4e              stsp16	[sp+0x4e], r4
 f0 3d 50              stsp16	[sp+0x50], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 f0 35 54              ldsp16	r5, [sp+0x54]
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 f0 37 50              ldsp16	r7, [sp+0x50]
 f0 30 4a              ldsp16	r0, [sp+0x4a]
 f0 31 4c              ldsp16	r1, [sp+0x4c]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 cd 08              call16	arithmetic
 d6 04                 adjsp	0x4
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 34 46              ldsp16	r4, [sp+0x46]
 f0 35 48              ldsp16	r5, [sp+0x48]
 f0 36 42              ldsp16	r6, [sp+0x42]
 f0 37 44              ldsp16	r7, [sp+0x44]
 e1 a9 08              call16	divide_exact
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 35 40              ldsp16	r5, [sp+0x40]
 e1 87 08              call16	sqrt_exact
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 e1 5e 08              call16	select_min
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 e1 45 08              call16	select_max
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 15 5a              leasp	r5, 0x5a
 f0 14 56              leasp	r4, 0x56
 d7 0f                 sys	memcpy
 c2 46                 ldi8	r6, 0x46
 c7 01 01              ldi16	r7, 0x101
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f7 1d                 ld8u	r5, [r7+]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 09                    mov	r6, r5
 d1 f4                 brne8	avm_test_main+388
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 02 30              ldi8	r2, 0x30
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fa 78                 lsr16i	r4, 0x8
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 98                 lsr16i	r6, 0x8
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c0 f0                 ldi8	r4, 0xf0
 f1 2c                 mov	r7, r0
 8c                    and	r7, r4
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 cb 37                 addi.s8	r7, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f5 23                 cmp	r4, r3
 f4 08                 ldsp16	r4, [sp+0x2]
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f0 03 0f              ldi8	r3, 0xf
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 0c                    mov	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 e9                 or	r7, r2
 f0 3f 12              stsp16	[sp+0x12], r7
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 f0 37 12              ldsp16	r7, [sp+0x12]
 fc 27                 cmov.ult	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 04 01              ldi16	r7, 0x104
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+674
 f0 34 26              ldsp16	r4, [sp+0x26]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 04                    mov	r5, r4
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 c3 30                 ldi8	r7, 0x30
 93                    or	r4, r7
 f1 07                 mov	r0, r7
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 37 28              ldsp16	r7, [sp+0x28]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f1 28                 mov	r6, r0
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 26              ldsp16	r4, [sp+0x26]
 0c                    mov	r7, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 07 01              ldi16	r7, 0x107
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+952
 f0 34 22              ldsp16	r4, [sp+0x22]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 04                    mov	r5, r4
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 37 24              ldsp16	r7, [sp+0x24]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f1 28                 mov	r6, r0
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 0c                    mov	r7, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 0a 01              ldi16	r7, 0x10a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1230
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 04                    mov	r5, r4
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f1 28                 mov	r6, r0
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 0c                    mov	r7, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 0d 01              ldi16	r7, 0x10d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1508
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 04                    mov	r5, r4
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c8 37                 addi.s8	r4, 0x37
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f1 28                 mov	r6, r0
 c0 f0                 ldi8	r4, 0xf0
 88                    and	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 0c                    mov	r7, r4
 f0 03 0f              ldi8	r3, 0xf
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 10 01              ldi16	r7, 0x110
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1786
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 7c 02              call16	convert_signed
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 76 02              call16	convert_unsigned
 04                    mov	r5, r4
 09                    mov	r6, r5
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 f1 04                 mov	r0, r4
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 01 30              ldi8	r1, 0x30
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f5 2c                 cmp	r7, r0
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 0d                    mov	r7, r5
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 07                    mov	r5, r7
 f4 5b                 stsp16	[sp+0x6], r7
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f1 07                 mov	r0, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f5 2c                 cmp	r7, r0
 fc 34                 cmov.ult	r6, r4
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 40                 stsp16	[sp+0x0], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 20                 cmp	r4, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 13 01              ldi16	r7, 0x113
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2001
 f0 35 18              ldsp16	r5, [sp+0x18]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f0 02 30              ldi8	r2, 0x30
 f9 a9                 or	r5, r2
 f4 61                 stsp16	[sp+0x8], r5
 c8 37                 addi.s8	r4, 0x37
 f4 70                 stsp16	[sp+0xc], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 31                 ldsp16	r5, [sp+0xc]
 fc 2c                 cmov.ult	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 04                    mov	r5, r4
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 02                    mov	r4, r6
 f9 8c                 and	r4, r3
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 27                 cmov.ult	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 97                    or	r5, r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c1 f0                 ldi8	r5, 0xf0
 f9 a0                 and	r5, r0
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 c9 37                 addi.s8	r5, 0x37
 f4 61                 stsp16	[sp+0x8], r5
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 33                    cmp	r4, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f9 0c                 and	r0, r3
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f9 78                 and	r3, r6
 f9 4d                 or	r2, r3
 f0 0f 0a              cmpi.s8	r3, 0xa
 f0 0b 37              addi.s8	r3, 0x37
 fc 1a                 cmov.ult	r3, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 02 01              ldi8	r2, 0x1
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f0 69 c0              cmp32	q3, q0
 d1 68                 brne8	avm_test_main+2381
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 d1 57                 brne8	avm_test_main+2381
 f2 30                 sub	r0, r0
 f0 05 10 41           ldi16	r1, 0x4110
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 69 c0              cmp32	q3, q0
 d1 46                 brne8	avm_test_main+2381
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 8c              cmp32	q2, q3
 d1 37                 brne8	avm_test_main+2381
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 8c              cmp32	q2, q3
 d1 28                 brne8	avm_test_main+2381
 f4 18                 ldsp16	r4, [sp+0x6]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 0c              cmp32	q0, q3
 d1 0f                 brne8	avm_test_main+2381
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 f8 0a                 cset.ne	r2
 f1 22                 mov	r4, r2
 d6 5e                 adjsp	0x5e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<arithmetic>:
 ff 2b                 fmul	q2, q3
 f4 0e                 ldsp16	r6, [sp+0x3]
 f4 17                 ldsp16	r7, [sp+0x5]
 ff 0b                 fadd	q2, q3
 ef                    ret

<divide_exact>:
 ff 3b                 fdiv	q2, q3
 ef                    ret

<sqrt_exact>:
 d4 2c                 jmp8	sqrtf

<select_min>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<select_max>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<convert_signed>:
 ff c2 42              ftos16	r4, q2
 ef                    ret

<convert_unsigned>:
 ff c3 42              ftou16	r4, q2
 ef                    ret

<sqrtf>:
 ff 6a                 fsqrt	q2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
