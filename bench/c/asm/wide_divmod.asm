
wide_divmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000038 __avm_run_constructors
00000000 l    df *ABS*	00000000 wide_divmod.c
00000100 l     O .data	00000008 result
00000108 l     O .data	00000020 unsigned_numerators
00000128 l     O .data	00000020 unsigned_denominators
00000148 l     O .data	00000020 signed_numerators
00000168 l     O .data	00000020 signed_denominators
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00000d53 l     F .text	0000010c open_section
00000e5f l     F .text	000000ff read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
000018e2 l       .init_array	00000000 .hidden __init_array_end
000018e2 l       .init_array	00000000 .hidden __init_array_start
000018e2 l       .fini_array	00000000 .hidden __fini_array_start
000018e2 l       .fini_array	00000000 .hidden __fini_array_end
00000188 l       *ABS*	00000000 .hidden __avm_heap_start
0000051a g     F .text	00000015 __avm_trap_entry
00000200 g     F .text	00000023 _start
0000025b g     F .text	00000258 avm_test_main
000004b5 g     F .text	00000065 __avm_terminate
000004b3 g     F .text	00000002 avm_halt
00001001 g     F .text	00000182 __avm_udivmoddi4
00001183 g     F .text	0000030b __avm_divmoddi4
00001541 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000664 g     F .text	000006ef __avm_trap_lookup
0000052f g     F .text	00000135 __avm_trap_report
00000f5e g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00000fa1 g     F .text	00000060 __avm_mulsi3
00000f63 g     F .text	0000003e __avm_umulhisi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	__avm_run_constructors
 d5 51                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 9f 02              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 90 02              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 e2 18              ldi16	r4, 0x18e2
 c1 00                 ldi8	r5, 0x0
 c6 e2 18              ldi16	r6, 0x18e2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 20                 breq8	0x20 <L1>
 f0 04 e2 18           ldi16	r0, 0x18e2
 f0 01 00              ldi8	r1, 0x0
 f0 06 e2 18           ldi16	r2, 0x18e2
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ee                 brne8	-0x12 <L0>
<L1>:
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
 d6 de                 adjsp	-0x22
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 c4 14 01              ldi16	r4, 0x114
 f0 6b c8              st32	[r4], q3
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 c6 10 01              ldi16	r6, 0x110
 f0 6b 0c              st32	[r6], q0
 c6 78 56              ldi16	r6, 0x5678
 c7 34 12              ldi16	r7, 0x1234
 c4 1c 01              ldi16	r4, 0x11c
 f0 6b c8              st32	[r4], q3
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 c4 24 01              ldi16	r4, 0x124
 f0 6b c8              st32	[r4], q3
 c4 20 01              ldi16	r4, 0x120
 f0 6b c8              st32	[r4], q3
 c4 89 67              ldi16	r4, 0x6789
 c5 45 23              ldi16	r5, 0x2345
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 2c 01              ldi16	r4, 0x12c
 f0 6b 08              st32	[r4], q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 34 01              ldi16	r4, 0x134
 f0 6b 48              st32	[r4], q1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 c4 30 01              ldi16	r4, 0x130
 f0 6b c8              st32	[r4], q3
 c4 3c 01              ldi16	r4, 0x13c
 f0 6b 08              st32	[r4], q0
 c4 38 01              ldi16	r4, 0x138
 f0 6b 08              st32	[r4], q0
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 44 01              ldi16	r4, 0x144
 f0 6b 48              st32	[r4], q1
 c4 b7 8f              ldi16	r4, 0x8fb7
 c5 ff ff              ldi16	r5, 0xffff
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 87 20              ldi16	r4, 0x2087
 c5 f2 79              ldi16	r5, 0x79f2
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 48 70              ldi16	r4, 0x7048
 a5                    xor	r5, r5
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 79 df              ldi16	r4, 0xdf79
 c5 0d 86              ldi16	r5, 0x860d
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 5c 01              ldi16	r4, 0x15c
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 6b c8              st32	[r4], q3
 c4 58 01              ldi16	r4, 0x158
 f0 6b 48              st32	[r4], q1
 c4 e9 ff              ldi16	r4, 0xffe9
 c5 ff ff              ldi16	r5, 0xffff
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 d3 1a              ldi16	r4, 0x1ad3
 c5 1f 01              ldi16	r5, 0x11f
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 87 d6              ldi16	r4, 0xd687
 c1 12                 ldi8	r5, 0x12
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 6c 01              ldi16	r4, 0x16c
 f0 6b 48              st32	[r4], q1
 c4 79 29              ldi16	r4, 0x2979
 c5 ed ff              ldi16	r5, 0xffed
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 74 01              ldi16	r4, 0x174
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 6b c8              st32	[r4], q3
 c4 78 01              ldi16	r4, 0x178
 f0 00 03              ldi8	r0, 0x3
 f0 6b 08              st32	[r4], q0
 c4 7c 01              ldi16	r4, 0x17c
 f0 6b 48              st32	[r4], q1
 c4 84 01              ldi16	r4, 0x184
 f0 6b c8              st32	[r4], q3
 c4 9b ff              ldi16	r4, 0xff9b
 c5 ff ff              ldi16	r5, 0xffff
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f2 61                 mov32	q0, q1
<L0>:
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 f4 41                 stsp16	[sp+0x0], r5
 d6 f6                 adjsp	-0xa
 f0 14 18              leasp	r4, 0x18
 f4 60                 stsp16	[sp+0x8], r4
 01                    mov	r4, r5
 c5 0c 01              ldi16	r5, 0x10c
 11                    add	r4, r5
 f0 6a c8              ld32	q3, [r4]
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 08 01              ldi16	r5, 0x108
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 07 2c 01           ldi16	r3, 0x12c
 f2 13                 add	r2, r3
 f0 6a 44              ld32	q1, [r2]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 07 28 01           ldi16	r3, 0x128
 f2 13                 add	r2, r3
 f0 6a 44              ld32	q1, [r2]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e1 1b 0c              call16	__avm_udivmoddi4
 d6 0a                 adjsp	0xa
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d6 f6                 adjsp	-0xa
 f0 14 24              leasp	r4, 0x24
 f4 60                 stsp16	[sp+0x8], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 4c 01              ldi16	r5, 0x14c
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 c5 48 01              ldi16	r5, 0x148
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 0a              ldsp16	r2, [sp+0xa]
 c4 6c 01              ldi16	r4, 0x16c
 f2 14                 add	r2, r4
 f0 6a 44              ld32	q1, [r2]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 c4 68 01              ldi16	r4, 0x168
 f2 14                 add	r2, r4
 f0 6a 44              ld32	q1, [r2]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 69                 add32	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f7 64                 add32	q1, q0
 f0 69 40              cmp32	q1, q0
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e1 16 0d              call16	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 63                 add32	q0, q3
 f2 6a                 mov32	q3, q0
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 62                 add32	q0, q2
 f0 69 08              cmp32	q0, q2
 f4 01                 ldsp16	r5, [sp+0x0]
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 c9 08                 addi.s8	r5, 0x8
 cd 20                 cmpi.s8	r5, 0x20
 db 02 ff              brne16	-0xfe <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 c4 04 01              ldi16	r4, 0x104
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 36 fb              call16	-1226 <__avm_run_local_dtors>
<L0>:
 c4 e2 18              ldi16	r4, 0x18e2
 c1 00                 ldi8	r5, 0x0
 c6 e2 18              ldi16	r6, 0x18e2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e2 18           ldi16	r2, 0x18e2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e2 18           ldi16	r0, 0x18e2
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 ed fa              call16	-1299 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_trap_entry>:
 c4 00 01              ldi16	r4, 0x100
 c5 00 09              ldi16	r5, 0x900
 c6 00 01              ldi16	r6, 0x100
 d7 0f                 sys	memcpy
 c7 00 0a              ldi16	r7, 0xa00
 f1 8f                 setsp	r7
 c4 00 02              ldi16	r4, 0x200
 d4 00                 jmp8	__avm_trap_report

<__avm_trap_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f1 04                 mov	r0, r4
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 05 20 02           ldi16	r1, 0x220
 f2 69                 mov32	q2, q1
 f1 29                 mov	r6, r1
 e1 1e 01              call16	__avm_trap_lookup
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e1 0e 0a              call16	memset
 c4 41 15              ldi16	r4, 0x1541
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 a0                    xor	r4, r4
 d7 32                 sys	set_text_mode
 ed 80 23              ld8u	r4, [r0+3]
 cc 01                 cmpi.s8	r4, 0x1
 d0 16                 breq8	0x16 <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d0 0b                 breq8	0xb <L0>
 cc 02                 cmpi.s8	r4, 0x2
 d1 15                 brne8	0x15 <L2>
 c6 12 15              ldi16	r6, 0x1512
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 22 15              ldi16	r6, 0x1522
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 03 15              ldi16	r6, 0x1503
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 34 15              ldi16	r6, 0x1534
 c3 00                 ldi8	r7, 0x0
<L3>:
 a0                    xor	r4, r4
 c1 05                 ldi8	r5, 0x5
 d7 34                 sys	draw_text_p
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ed 90 24              ld16	r4, [r0+4]
 f4 50                 stsp16	[sp+0x4], r4
 f0 13 00              leasp	r3, 0x0
 c6 8e 14              ldi16	r6, 0x148e
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 0b                 ldi8	r5, 0xb
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 10                 breq8	0x10 <L4>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 9f 14              ldi16	r6, 0x149f
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 a8 14              ldi16	r6, 0x14a8
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
<L5>:
 c6 23 02              ldi16	r6, 0x223
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 1d                 breq8	0x1d <L6>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c4 26 02              ldi16	r4, 0x226
 f0 6a 88              ld32	q2, [r4]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 55                 stsp16	[sp+0x5], r5
 f0 12 00              leasp	r2, 0x0
 c6 ad 14              ldi16	r6, 0x14ad
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 b7 14              ldi16	r6, 0x14b7
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 34                 sys	draw_text_p
<L7>:
 ed 90 28              ld16	r4, [r0+8]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2a              ld16	r4, [r0+10]
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 00              leasp	r2, 0x0
 c6 bb 14              ldi16	r6, 0x14bb
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 cb 14              ldi16	r6, 0x14cb
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 db 14              ldi16	r6, 0x14db
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 eb 14              ldi16	r6, 0x14eb
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 fb 14              ldi16	r6, 0x14fb
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 35                 ldi8	r5, 0x35
 d7 36                 sys	draw_textfv_p
 a0                    xor	r4, r4
 d7 1d                 sys	display
<L8>:
 d4 fe                 jmp8	-0x2 <L8>

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a2                 adjsp	-0x5e
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 cb 06                 addi.s8	r7, 0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 4e              st32	[r7], q1
 0e                    mov	r7, r6
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 0e                    mov	r7, r6
 cb 03                 addi.s8	r7, 0x3
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f0 63 80              ldp24	q2, [q0]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 02 2e              ldi8	r2, 0x2e
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 66                 add32	q1, q2
 f0 00 2f              ldi8	r0, 0x2f
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 40              cmp32	q1, q0
 d2 76                 brult8	0x76 <L0>
 f0 60 e8              ldp8u	r7, [q2]
 cf 41                 cmpi.s8	r7, 0x41
 d1 6f                 brne8	0x6f <L0>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d1 5f                 brne8	0x5f <L0>
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d1 51                 brne8	0x51 <L0>
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d1 41                 brne8	0x41 <L0>
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 05                 cmpi.s8	r7, 0x5
 d1 21                 brne8	0x21 <L0>
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d1 13                 brne8	0x13 <L0>
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 07                 breq8	0x7 <L1>
<L0>:
 d6 5e                 adjsp	0x5e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 d2 e9                 brult8	-0x17 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 72                 sub32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 d2 d1                 brult8	-0x2f <L0>
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f7 62                 add32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 a0                    xor	r4, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
<L2>:
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 62                 add32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 69                 mov32	q2, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f2 66                 mov32	q1, q2
 f0 63 80              ldp24	q2, [q0]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 60 88              ldp8u	r4, [q2]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 18              stsp16	[sp+0x18], r4
 3c                    cmp	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 db 67 ff              brne16	-0x99 <L0>
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 04              cmp32	q0, q1
 db 5b ff              brne16	-0xa5 <L0>
 d6 fa                 adjsp	-0x6
 f0 17 28              leasp	r7, 0x28
 f4 53                 stsp16	[sp+0x4], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e1 6f 05              call16	open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 da 2f ff              breq16	-0xd1 <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 05                 cmpi.s8	r4, 0x5
 db 65 ff              brne16	-0x9b <L2>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 db 15 ff              brne16	-0xeb <L0>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 08                    mov	r6, r4
 fa 96                 lsr16i	r6, 0x6
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4a                 lsl16i	r5, 0xa
 96                    or	r5, r6
 fa 76                 lsr16i	r4, 0x6
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 58              ldsp16	r6, [sp+0x58]
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db ed fe              brne16	-0x113 <L0>
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db dc fe              brne16	-0x124 <L0>
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 db ce fe              brne16	-0x132 <L0>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 db b5 fe              brne16	-0x14b <L0>
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 da fb 00              breq16	0xfb <L5>
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L3>:
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 7c                 sub32	q3, q0
 f7 83                 lsr32.1	q3
 f7 6c                 add32	q3, q0
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 64                 add32	q1, q0
 f0 63 44              ldp24	q1, [q1]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 69 c8              cmp32	q3, q2
 d2 b8                 brult8	-0x48 <L3>
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 c0              cmp32	q3, q0
 da 92 00              breq16	0x92 <L5>
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 70                 bruge8	0x70 <L5>
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6b                 mov32	q3, q1
 e1 31 05              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 2e                 breq8	0x2e <L4>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c0              cmp32	q3, q0
 d0 1f                 breq8	0x1f <L4>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 76                 sub32	q1, q2
 f0 69 c4              cmp32	q3, q1
 d8 12                 bruge8	0x12 <L4>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d1 09                 brne8	0x9 <L4>
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 62                 mov32	q0, q2
<L4>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
<L5>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 da aa fd              breq16	-0x256 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
<L6>:
 f2 68                 mov32	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 61                 mov32	q0, q1
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e1 0e 06              call16	__avm_mulsi3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 fc 19                 cmov.ult	r3, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f0 69 04              cmp32	q0, q1
 d2 c4                 brult8	-0x3c <L6>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 5c fd              breq16	-0x2a4 <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 d8 05              call16	__avm_mulsi3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 69 c0              cmp32	q3, q0
 dd 54 02              bruge16	0x254 <L17>
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 3c 32              stsp16	[sp+0x32], r4
 f2 39                 sub	r1, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 60                 stsp16	[sp+0x8], r4
 f4 a4                 tst8	r4
 de da 00              brslt16	0xda <L11>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da 8c fc              breq16	-0x374 <L0>
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c0 0f                 ldi8	r4, 0xf
 82                    and	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 fa 94                 lsr16i	r6, 0x4
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
<L8>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
<L9>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6e                 add32	q3, q2
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 c4              cmp32	q3, q1
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 dc 40 fc              brult16	-0x3c0 <L0>
<L10>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 ff              ldi8	r3, 0xff
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 76                 sub32	q1, q2
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 30              ldsp16	r1, [sp+0x30]
 f2 6a                 mov32	q3, q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 dd 1b fc              bruge16	-0x3e5 <L0>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 68                 add32	q2, q0
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 69 48              cmp32	q1, q2
 dc 8a 01              brult16	0x18a <L19>
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 dd 6a 01              bruge16	0x16a <L18>
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 68                 add32	q2, q0
 f0 02 40              ldi8	r2, 0x40
 f2 4b                 sub	r3, r3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 db f6 fe              brne16	-0x10a <L7>
 e0 be fb              jmp16	-1090 <L0>
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 80                 cmpi.s8	r4, -0x80
 d1 76                 brne8	0x76 <L12>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 e7 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 9c fb              breq16	-0x464 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 cb 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 80 fb              breq16	-0x480 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 69 08              cmp32	q0, q2
 dd 6b fb              bruge16	-0x495 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 9a 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 4f fb              breq16	-0x4b1 <L0>
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e0 e6 fe              jmp16	-282 <L9>
<L12>:
 c2 ff                 ldi8	r6, 0xff
 f4 20                 ldsp16	r4, [sp+0x8]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 93                 cmpi.s8	r6, -0x6d
 d2 23                 brult8	0x23 <L14>
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L13>:
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
 e0 d3 fe              jmp16	-301 <L10>
<L14>:
 c6 82 ff              ldi16	r6, 0xff82
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 d2 24                 brult8	0x24 <L15>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 3a 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da ef fa              breq16	-0x511 <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 82                 cmpi.s8	r4, -0x7e
 d0 c1                 breq8	-0x3f <L13>
 d4 0e                 jmp8	0xe <L16>
<L15>:
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L16>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da cd fa              breq16	-0x533 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 fc 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da b1 fa              breq16	-0x54f <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f1 28                 mov	r6, r0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f6 4e                 neg16	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 80                 lsr32.1	q0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 e0 2a fe              jmp16	-470 <L8>
<L17>:
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 da 87 fa              breq16	-0x579 <L0>
 d4 20                 jmp8	0x20 <L20>
<L18>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L19>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 da 65 fa              breq16	-0x59b <L0>
<L20>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 5b fa              bruge16	-0x5a5 <L0>
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e1 65 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L21>
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 16                 breq8	0x16 <L21>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d8 09                 bruge8	0x9 <L21>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 0d                 breq8	0xd <L22>
<L21>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e0 eb f9              jmp16	-1557 <L0>
<L22>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da d9 f9              breq16	-0x627 <L0>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 06                 addi.s8	r4, 0x6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 e0 ca f9              jmp16	-1590 <L0>

<open_section>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 32 15              ldsp16	r2, [sp+0x15]
 f0 33 17              ldsp16	r3, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d0 11                 breq8	0x11 <L0>
 cd 03                 cmpi.s8	r5, 0x3
 d1 1e                 brne8	0x1e <L2>
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 48                 bruge8	0x48 <L3>
 a0                    xor	r4, r4
 d4 6f                 jmp8	0x6f <L5>
<L0>:
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
<L1>:
 f0 6b c8              st32	[r4], q3
 d4 5c                 jmp8	0x5c <L4>
<L2>:
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 53                 brult8	0x53 <L5>
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d0 4d                 breq8	0x4d <L6>
 cd 01                 cmpi.s8	r5, 0x1
 d1 72                 brne8	0x72 <L7>
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 2c                 brne8	0x2c <L5>
 d4 7f                 jmp8	0x7f <L8>
<L3>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 63 8c              ldp24	q2, [q3]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 6b 84              st32	[r2], q2
 f7 63                 add32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 0c                 addi.s8	r5, 0xc
 f0 6b 0a              st32	[r5], q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 63                 add32	q0, q3
 c8 10                 addi.s8	r4, 0x10
 f0 6b 08              st32	[r4], q0
<L4>:
 c0 01                 ldi8	r4, 0x1
<L5>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 df                 brne8	-0x21 <L5>
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3c              st16	[r4+28], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e0 6d ff              jmp16	-147 <L1>
<L7>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e1 40 01              call16	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d1 b1                 brne8	-0x4f <L5>
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	0x11 <L9>
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3e              st16	[r4+30], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 04                 addi.s8	r4, 0x4
 e0 37 ff              jmp16	-201 <L1>
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e0 26 ff              jmp16	-218 <L1>

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 6a 0a              ld32	q0, [r5]
 f0 69 0c              cmp32	q0, q3
 d8 6f                 bruge8	0x6f <L3>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f4 69                 stsp16	[sp+0xa], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 c0              ldp8s	r6, [q0]
 c0 7f                 ldi8	r4, 0x7f
 06                    mov	r5, r6
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 a6                 tst8	r6
 d3 12                 brslt8	0x12 <L1>
 f4 29                 ldsp16	r5, [sp+0xa]
<L0>:
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d4 3c                 jmp8	0x3c <L3>
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 d8 32                 bruge8	0x32 <L2>
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 61 a4              ldp8s	r5, [q1]
 09                    mov	r6, r5
 fa 57                 lsl16i	r6, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 82                    and	r4, r6
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 0d                    mov	r7, r5
 f4 a7                 tst8	r7
 d3 17                 brslt8	0x17 <L4>
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f6 2f                 tst16	r7
 d1 b7                 brne8	-0x49 <L0>
 d4 01                 jmp8	0x1 <L3>
<L2>:
 a0                    xor	r4, r4
<L3>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d8 e9                 bruge8	-0x17 <L3>
 f0 60 e4              ldp8u	r7, [q1]
 07                    mov	r5, r7
 fa 4e                 lsl16i	r5, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 a9                 or	r5, r2
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 fa 92                 lsr16i	r6, 0x2
 f0 3d 0c              stsp16	[sp+0xc], r5
 f0 3e 0e              stsp16	[sp+0xe], r6
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a7                 tst8	r7
 d3 0b                 brslt8	0xb <L5>
 f6 47                 sext8	r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 2f                 tst16	r7
 db 73 ff              brne16	-0x8d <L0>
 d4 bd                 jmp8	-0x43 <L3>
<L5>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 f4 29                 ldsp16	r5, [sp+0xa]
 d8 b2                 bruge8	-0x4e <L3>
 f0 61 e4              ldp8s	r7, [q1]
 f4 a7                 tst8	r7
 d3 ab                 brslt8	-0x55 <L3>
 f4 53                 stsp16	[sp+0x4], r7
 f1 17                 mov	r2, r7
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 64                 mov32	q1, q0
 f6 2f                 tst16	r7
 db 39 ff              brne16	-0xc7 <L0>
 d4 83                 jmp8	-0x7d <L3>

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 3f              ldsp16	r4, [sp+0x3f]
 f0 35 41              ldsp16	r5, [sp+0x41]
 f0 36 43              ldsp16	r6, [sp+0x43]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 3b              ldsp16	r2, [sp+0x3b]
 f0 33 3d              ldsp16	r3, [sp+0x3d]
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 69 40              cmp32	q1, q0
 d1 12                 brne8	0x12 <L0>
 f0 69 80              cmp32	q2, q0
 d1 0d                 brne8	0xd <L0>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 64                 mov32	q1, q0
 e0 25 01              jmp16	293 <L7>
<L0>:
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 3d                 jmp8	0x3d <L4>
<L1>:
 f7 76                 sub32	q1, q2
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f7 7c                 sub32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 81                 or	r4, r0
 f0 3c 04              stsp16	[sp+0x4], r4
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L3>:
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 06                 mov	r0, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 40                 stsp16	[sp+0x0], r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 da ab 00              breq16	0xab <L6>
<L4>:
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 27                 mov	r5, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 49                 stsp16	[sp+0x2], r5
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 60                 add32	q0, q0
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 de 45 ff              brslt16	-0xbb <L1>
 f0 69 48              cmp32	q1, q2
 d8 09                 bruge8	0x9 <L5>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 e0 59 ff              jmp16	-167 <L2>
<L5>:
 f0 69 48              cmp32	q1, q2
 db 31 ff              brne16	-0xcf <L1>
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 dd 25 ff              bruge16	-0xdb <L1>
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e0 3e ff              jmp16	-194 <L3>
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L7>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_divmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 32 47              ldsp16	r2, [sp+0x47]
 f0 33 49              ldsp16	r3, [sp+0x49]
 f0 30 43              ldsp16	r0, [sp+0x43]
 f0 31 45              ldsp16	r1, [sp+0x45]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 34 4b              ldsp16	r4, [sp+0x4b]
 f0 3c 22              stsp16	[sp+0x22], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 04              cmp32	q0, q1
 d0 09                 breq8	0x9 <L0>
 f0 69 8c              cmp32	q2, q3
 d9 0f                 brsge8	0xf <L1>
 f2 63                 mov32	q0, q3
 d4 49                 jmp8	0x49 <L2>
<L0>:
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f2 63                 mov32	q0, q3
 e0 9c 02              jmp16	668 <L14>
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f1 1a                 mov	r3, r2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f7 73                 sub32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L2>:
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 69 8c              cmp32	q2, q3
 d9 08                 brsge8	0x8 <L3>
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d4 2d                 jmp8	0x2d <L4>
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7d                 sub32	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L4>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 4f                 brne8	0x4f <L6>
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
<L5>:
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 38                    cmp	r6, r4
 db 42 01              brne16	0x142 <L11>
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 e0 64 01              jmp16	356 <L12>
<L6>:
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 4c                 jmp8	0x4c <L9>
<L7>:
 f7 79                 sub32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
<L8>:
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 20              ldsp16	r1, [sp+0x20]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 6e ff              breq16	-0x92 <L5>
<L9>:
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 60                 add32	q0, q0
 f0 39 20              stsp16	[sp+0x20], r1
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 de 38 ff              brslt16	-0xc8 <L7>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d8 14                 bruge8	0x14 <L10>
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e0 50 ff              jmp16	-176 <L8>
<L10>:
 f0 69 84              cmp32	q2, q1
 db 15 ff              brne16	-0xeb <L7>
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 dd fd fe              bruge16	-0x103 <L7>
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e0 19 ff              jmp16	-231 <L8>
<L11>:
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f7 7d                 sub32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
<L12>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 14                 brne8	0x14 <L13>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d4 36                 jmp8	0x36 <L14>
<L13>:
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 04              cmp32	q0, q1
 f2 68                 mov32	q2, q0
 f2 61                 mov32	q0, q1
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f7 76                 sub32	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
<L14>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
