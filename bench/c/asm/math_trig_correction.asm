
math_trig_correction.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_trig_correction.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000490 l       .init_array	00000000 .hidden __init_array_end
00000490 l       .init_array	00000000 .hidden __init_array_start
00000490 l       .fini_array	00000000 .hidden __fini_array_start
00000490 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001c7 avm_test_main
0000048e g     F .text	00000002 avm_halt
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
 e1 70 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 90 04              ldi16	r4, 0x490
 c1 00                 ldi8	r5, 0x0
 c6 90 04              ldi16	r6, 0x490
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 90 04           ldi16	r0, 0x490
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 90 04           ldi16	r2, 0x490
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
 c4 90 04              ldi16	r4, 0x490
 c1 00                 ldi8	r5, 0x0
 c6 90 04              ldi16	r6, 0x490
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 90 04           ldi16	r2, 0x490
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 90 04           ldi16	r0, 0x490
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
 d6 fc                 adjsp	-0x4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c5 70 bf              ldi16	r5, 0xbf70
 c7 08 01              ldi16	r7, 0x108
 f0 6b 8e              st32	[r7], q2
 c5 60 bf              ldi16	r5, 0xbf60
 c7 0c 01              ldi16	r7, 0x10c
 f0 6b 8e              st32	[r7], q2
 c5 50 bf              ldi16	r5, 0xbf50
 c7 10 01              ldi16	r7, 0x110
 f0 6b 8e              st32	[r7], q2
 c5 40 bf              ldi16	r5, 0xbf40
 c7 14 01              ldi16	r7, 0x114
 f0 6b 8e              st32	[r7], q2
 c5 30 bf              ldi16	r5, 0xbf30
 c7 18 01              ldi16	r7, 0x118
 f0 6b 8e              st32	[r7], q2
 c5 20 bf              ldi16	r5, 0xbf20
 c7 1c 01              ldi16	r7, 0x11c
 f0 6b 8e              st32	[r7], q2
 c5 10 bf              ldi16	r5, 0xbf10
 c7 20 01              ldi16	r7, 0x120
 f0 6b 8e              st32	[r7], q2
 c5 00 bf              ldi16	r5, 0xbf00
 c7 24 01              ldi16	r7, 0x124
 f0 6b 8e              st32	[r7], q2
 c5 e0 be              ldi16	r5, 0xbee0
 c7 28 01              ldi16	r7, 0x128
 f0 6b 8e              st32	[r7], q2
 c5 c0 be              ldi16	r5, 0xbec0
 c7 2c 01              ldi16	r7, 0x12c
 f0 6b 8e              st32	[r7], q2
 c5 a0 be              ldi16	r5, 0xbea0
 c7 30 01              ldi16	r7, 0x130
 f0 6b 8e              st32	[r7], q2
 c5 80 be              ldi16	r5, 0xbe80
 c7 34 01              ldi16	r7, 0x134
 f0 6b 8e              st32	[r7], q2
 c5 40 be              ldi16	r5, 0xbe40
 c7 38 01              ldi16	r7, 0x138
 f0 6b 8e              st32	[r7], q2
 c5 00 be              ldi16	r5, 0xbe00
 c7 3c 01              ldi16	r7, 0x13c
 f0 6b 8e              st32	[r7], q2
 c5 80 bd              ldi16	r5, 0xbd80
 c7 40 01              ldi16	r7, 0x140
 f0 6b 8e              st32	[r7], q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 44 01              ldi16	r4, 0x144
 f0 6b 08              st32	[r4], q0
 a0                    xor	r4, r4
 c5 80 3d              ldi16	r5, 0x3d80
 c7 48 01              ldi16	r7, 0x148
 f0 6b 8e              st32	[r7], q2
 c5 00 3e              ldi16	r5, 0x3e00
 c7 4c 01              ldi16	r7, 0x14c
 f0 6b 8e              st32	[r7], q2
 c5 40 3e              ldi16	r5, 0x3e40
 c7 50 01              ldi16	r7, 0x150
 f0 6b 8e              st32	[r7], q2
 c5 80 3e              ldi16	r5, 0x3e80
 c7 54 01              ldi16	r7, 0x154
 f0 6b 8e              st32	[r7], q2
 c5 a0 3e              ldi16	r5, 0x3ea0
 c7 58 01              ldi16	r7, 0x158
 f0 6b 8e              st32	[r7], q2
 c5 c0 3e              ldi16	r5, 0x3ec0
 c7 5c 01              ldi16	r7, 0x15c
 f0 6b 8e              st32	[r7], q2
 c5 e0 3e              ldi16	r5, 0x3ee0
 c7 60 01              ldi16	r7, 0x160
 f0 6b 8e              st32	[r7], q2
 c5 00 3f              ldi16	r5, 0x3f00
 c7 64 01              ldi16	r7, 0x164
 f0 6b 8e              st32	[r7], q2
 c5 10 3f              ldi16	r5, 0x3f10
 c7 68 01              ldi16	r7, 0x168
 f0 6b 8e              st32	[r7], q2
 c5 20 3f              ldi16	r5, 0x3f20
 c7 6c 01              ldi16	r7, 0x16c
 f0 6b 8e              st32	[r7], q2
 c5 30 3f              ldi16	r5, 0x3f30
 c7 70 01              ldi16	r7, 0x170
 f0 6b 8e              st32	[r7], q2
 c5 40 3f              ldi16	r5, 0x3f40
 c7 74 01              ldi16	r7, 0x174
 f0 6b 8e              st32	[r7], q2
 c5 50 3f              ldi16	r5, 0x3f50
 c7 78 01              ldi16	r7, 0x178
 f0 6b 8e              st32	[r7], q2
 c5 60 3f              ldi16	r5, 0x3f60
 c7 7c 01              ldi16	r7, 0x17c
 f0 6b 8e              st32	[r7], q2
 c5 70 3f              ldi16	r5, 0x3f70
 c7 80 01              ldi16	r7, 0x180
 f0 6b 8e              st32	[r7], q2
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 3f              ldi16	r5, 0x3f49
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 25                 jmp8	0x25 <L1>
<L0>:
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 09                 fadd	q2, q1
 f0 06 69 21           ldi16	r2, 0x2169
 f0 07 a2 b3           ldi16	r3, 0xb3a2
 ff 09                 fadd	q2, q1
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 09                 fadd	q2, q1
 ff 02                 fadd	q0, q2
 cb 04                 addi.s8	r7, 0x4
 c0 80                 ldi8	r4, 0x80
 3c                    cmp	r7, r4
 d0 5a                 breq8	0x5a <L3>
<L1>:
 03                    mov	r4, r7
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff c8 69              fcmp	r6, q2, q1
 ce 01                 cmpi.s8	r6, 0x1
 d0 c6                 breq8	-0x3a <L0>
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 bf           ldi16	r3, 0xbf49
 ff c8 69              fcmp	r6, q2, q1
 ce ff                 cmpi.s8	r6, -0x1
 d1 27                 brne8	0x27 <L2>
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 ff 09                 fadd	q2, q1
 f0 06 69 21           ldi16	r2, 0x2169
 f0 07 a2 33           ldi16	r3, 0x33a2
 ff 09                 fadd	q2, q1
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 09                 fadd	q2, q1
 ff 02                 fadd	q0, q2
 cb 04                 addi.s8	r7, 0x4
 c0 80                 ldi8	r4, 0x80
 3c                    cmp	r7, r4
 d1 b7                 brne8	-0x49 <L1>
 d4 0f                 jmp8	0xf <L3>
<L2>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 ff 09                 fadd	q2, q1
 ff 02                 fadd	q0, q2
 cb 04                 addi.s8	r7, 0x4
 c0 80                 ldi8	r4, 0x80
 3c                    cmp	r7, r4
 d1 a6                 brne8	-0x5a <L1>
<L3>:
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
