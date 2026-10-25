
wide_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 wide_compare.c
00000100 l     O .data	00000002 wide_compare_result
00000102 l     O .data	00000040 unsigned_values
00000142 l     O .data	00000040 signed_values
00000000 l    df *ABS*	00000000 runtime.c
00000509 l       .init_array	00000000 .hidden __init_array_end
00000509 l       .init_array	00000000 .hidden __init_array_start
00000509 l       .fini_array	00000000 .hidden __fini_array_start
00000509 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000240 avm_test_main
00000507 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e9 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 09 05              ldi16	r4, 0x509
 c1 00                 ldi8	r5, 0x0
 c6 09 05              ldi16	r6, 0x509
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 09 05           ldi16	r0, 0x509
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 09 05           ldi16	r2, 0x509
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 09 05              ldi16	r4, 0x509
 c1 00                 ldi8	r5, 0x0
 c6 09 05              ldi16	r6, 0x509
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 09 05           ldi16	r2, 0x509
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 09 05           ldi16	r0, 0x509
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d6 e8                 adjsp	-0x18
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 c7 02 01              ldi16	r7, 0x102
 f0 6b 8e              st32	[r7], q2
 f0 06 98 ba           ldi16	r2, 0xba98
 f0 07 dc fe           ldi16	r3, 0xfedc
 c4 06 01              ldi16	r4, 0x106
 f0 6b 48              st32	[r4], q1
 c4 ea 72              ldi16	r4, 0x72ea
 c5 fb ff              ldi16	r5, 0xfffb
 c6 46 01              ldi16	r6, 0x146
 f0 6b 8c              st32	[r6], q2
 c4 cc 50              ldi16	r4, 0x50cc
 c5 d9 61              ldi16	r5, 0x61d9
 c6 42 01              ldi16	r6, 0x142
 f0 6b 8c              st32	[r6], q2
 c4 30 32              ldi16	r4, 0x3230
 c5 54 76              ldi16	r5, 0x7654
 c6 0a 01              ldi16	r6, 0x10a
 f0 6b 8c              st32	[r6], q2
 c4 0e 01              ldi16	r4, 0x10e
 f0 6b 48              st32	[r4], q1
 c4 2f 96              ldi16	r4, 0x962f
 c5 fc ff              ldi16	r5, 0xfffc
 c6 4e 01              ldi16	r6, 0x14e
 f0 6b 8c              st32	[r6], q2
 c4 99 fc              ldi16	r4, 0xfc99
 c5 62 c9              ldi16	r5, 0xc962
 c6 4a 01              ldi16	r6, 0x14a
 f0 6b 8c              st32	[r6], q2
 c4 90 32              ldi16	r4, 0x3290
 c5 54 76              ldi16	r5, 0x7654
 c6 12 01              ldi16	r6, 0x112
 f0 6b 8c              st32	[r6], q2
 c4 16 01              ldi16	r4, 0x116
 f0 6b 48              st32	[r4], q1
 c4 75 b9              ldi16	r4, 0xb975
 c5 fd ff              ldi16	r5, 0xfffd
 c6 56 01              ldi16	r6, 0x156
 f0 6b 8c              st32	[r6], q2
 c4 66 a8              ldi16	r4, 0xa866
 c5 ec 30              ldi16	r5, 0x30ec
 c6 52 01              ldi16	r6, 0x152
 f0 6b 8c              st32	[r6], q2
 c4 90 33              ldi16	r4, 0x3390
 c5 54 76              ldi16	r5, 0x7654
 c6 1a 01              ldi16	r6, 0x11a
 f0 6b 8c              st32	[r6], q2
 c4 1e 01              ldi16	r4, 0x11e
 f0 6b 48              st32	[r4], q1
 c4 ba dc              ldi16	r4, 0xdcba
 c5 fe ff              ldi16	r5, 0xfffe
 c6 5e 01              ldi16	r6, 0x15e
 f0 6b 8c              st32	[r6], q2
 c4 33 54              ldi16	r4, 0x5433
 c5 76 98              ldi16	r5, 0x9876
 c6 5a 01              ldi16	r6, 0x15a
 f0 6b 8c              st32	[r6], q2
 c4 10 36              ldi16	r4, 0x3610
 c5 54 76              ldi16	r5, 0x7654
 c6 22 01              ldi16	r6, 0x122
 f0 6b 8c              st32	[r6], q2
 c4 26 01              ldi16	r4, 0x126
 f0 6b 48              st32	[r4], q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 66 01              ldi16	r4, 0x166
 f0 6b 08              st32	[r4], q0
 c4 62 01              ldi16	r4, 0x162
 f0 6b 08              st32	[r4], q0
 c4 10 38              ldi16	r4, 0x3810
 c6 2a 01              ldi16	r6, 0x12a
 f0 6b 8c              st32	[r6], q2
 c4 2e 01              ldi16	r4, 0x12e
 f0 6b 48              st32	[r4], q1
 c4 45 23              ldi16	r4, 0x2345
 c1 01                 ldi8	r5, 0x1
 c6 6e 01              ldi16	r6, 0x16e
 f0 6b 8c              st32	[r6], q2
 c4 cd ab              ldi16	r4, 0xabcd
 c5 89 67              ldi16	r5, 0x6789
 c6 6a 01              ldi16	r6, 0x16a
 f0 6b 8c              st32	[r6], q2
 c4 10 2a              ldi16	r4, 0x2a10
 c5 54 76              ldi16	r5, 0x7654
 c6 32 01              ldi16	r6, 0x132
 f0 6b 8c              st32	[r6], q2
 c4 36 01              ldi16	r4, 0x136
 f0 6b 48              st32	[r4], q1
 c4 8a 46              ldi16	r4, 0x468a
 c1 02                 ldi8	r5, 0x2
 c6 76 01              ldi16	r6, 0x176
 f0 6b 8c              st32	[r6], q2
 c4 9a 57              ldi16	r4, 0x579a
 c5 13 cf              ldi16	r5, 0xcf13
 c6 72 01              ldi16	r6, 0x172
 f0 6b 8c              st32	[r6], q2
 c4 3e 01              ldi16	r4, 0x13e
 f0 6b 48              st32	[r4], q1
 c4 10 0a              ldi16	r4, 0xa10
 c5 54 76              ldi16	r5, 0x7654
 c6 3a 01              ldi16	r6, 0x13a
 f0 6b 8c              st32	[r6], q2
 c4 d0 69              ldi16	r4, 0x69d0
 c1 03                 ldi8	r5, 0x3
 c6 7e 01              ldi16	r6, 0x17e
 f0 6b 8c              st32	[r6], q2
 c4 67 03              ldi16	r4, 0x367
 c5 9d 36              ldi16	r5, 0x369d
 c6 7a 01              ldi16	r6, 0x17a
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 03                 ldi8	r4, 0x3
 f0 3c 14              stsp16	[sp+0x14], r4
 09                    mov	r6, r5
<L0>:
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 42 01              ldi16	r4, 0x142
 f4 48                 stsp16	[sp+0x2], r4
 f1 07                 mov	r0, r7
 f0 31 14              ldsp16	r1, [sp+0x14]
<L1>:
 f4 5a                 stsp16	[sp+0x6], r6
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 16              stsp16	[sp+0x16], r0
 f1 21                 mov	r4, r1
 c8 06                 addi.s8	r4, 0x6
 c1 07                 ldi8	r5, 0x7
 84                    and	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 13                    add	r4, r7
 f1 28                 mov	r6, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 6a c0              ld32	q3, [r0]
 f0 6a 08              ld32	q0, [r4]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 c6 06 01              ldi16	r6, 0x106
 16                    add	r5, r6
 f0 6a ca              ld32	q3, [r5]
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 fb 2c                 cmov.eq	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 c1 38                 ldi8	r5, 0x38
 84                    and	r5, r4
 01                    mov	r4, r5
 c6 46 01              ldi16	r6, 0x146
 12                    add	r4, r6
 c6 42 01              ldi16	r6, 0x142
 16                    add	r5, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6a 0c              ld32	q0, [r6]
 f0 6a ce              ld32	q3, [r7]
 f0 6a 4a              ld32	q1, [r5]
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 6a 48              ld32	q1, [r4]
 f0 69 40              cmp32	q1, q0
 f8 24                 cset.slt	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f0 69 04              cmp32	q0, q1
 f4 01                 ldsp16	r5, [sp+0x0]
 fb 2c                 cmov.eq	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 30 16              ldsp16	r0, [sp+0x16]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 c7 02 01              ldi16	r7, 0x102
 f8 06                 cset.eq	r6
 18                    add	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 c8 08                 addi.s8	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f0 08 08              addi.s8	r0, 0x8
 f4 a9                 inc16	r1
 f0 0d 0b              cmpi.s8	r1, 0xb
 db 3e ff              brne16	-0xc2 <L1>
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 db 27 ff              brne16	-0xd9 <L0>
 f0 5e 00 01           stm16	[0x100], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
