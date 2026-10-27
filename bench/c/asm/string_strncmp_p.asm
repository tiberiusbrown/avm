
string_strncmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strncmp_p.c
000004c5 l     O .rodata	00000080 string_bench_flash
00000100 l     O .data	00000002 string_bench_result
00000102 l     O .data	00000003 call
00000105 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
00000545 l       .init_array	00000000 .hidden __init_array_end
00000545 l       .init_array	00000000 .hidden __init_array_start
00000545 l       .fini_array	00000000 .hidden __fini_array_start
00000545 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001c3 avm_test_main
000004b0 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000048a g     F .text	00000026 strncmp_P

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
 e1 92 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 45 05              ldi16	r4, 0x545
 c1 00                 ldi8	r5, 0x0
 c6 45 05              ldi16	r6, 0x545
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 45 05           ldi16	r0, 0x545
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 45 05           ldi16	r2, 0x545
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
 c4 45 05              ldi16	r4, 0x545
 c1 00                 ldi8	r5, 0x0
 c6 45 05              ldi16	r6, 0x545
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 45 05           ldi16	r2, 0x545
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 45 05           ldi16	r0, 0x545
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
 d6 d8                 adjsp	-0x28
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 e5 04              ldi16	r6, 0x4e5
 c3 00                 ldi8	r7, 0x0
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 c5 04              ldi16	r6, 0x4c5
 c3 00                 ldi8	r7, 0x0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c6 b2 04              ldi16	r6, 0x4b2
 c3 00                 ldi8	r7, 0x0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 05 05              ldi16	r6, 0x505
 c3 00                 ldi8	r7, 0x0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 25 05              ldi16	r6, 0x525
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
<L0>:
 f0 3c 26              stsp16	[sp+0x26], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f1 1c                 mov	r3, r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 24              stsp16	[sp+0x24], r4
 c5 02 01              ldi16	r5, 0x102
 01                    mov	r4, r5
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 22              stsp16	[sp+0x22], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 20              stsp16	[sp+0x20], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 18              stsp16	[sp+0x18], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 65 01              ldi16	r4, 0x165
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 65 01              ldi16	r4, 0x165
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 c5 02 01              ldi16	r5, 0x102
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 d6 fe                 adjsp	-0x2
 c1 20                 ldi8	r5, 0x20
 f4 41                 stsp16	[sp+0x0], r5
 f2 1a                 add	r3, r2
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 1d                 add	r3, r5
 f0 35 24              ldsp16	r5, [sp+0x24]
 f2 1d                 add	r3, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 1d                 add	r3, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f2 1d                 add	r3, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 1d                 add	r3, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 1d                 add	r3, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f2 1d                 add	r3, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 f2 1d                 add	r3, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 1d                 add	r3, r5
 f2 1c                 add	r3, r4
 c4 65 01              ldi16	r4, 0x165
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f1 14                 mov	r2, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 f2 13                 add	r2, r3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 86 fe              brne16	-0x17a <L0>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strncmp_P>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f4 25                 ldsp16	r5, [sp+0x9]
 f2 30                 sub	r0, r0
<L0>:
 f6 2d                 tst16	r5
 d0 13                 breq8	0x13 <L2>
 f0 65 4c              ldp8u	r2, [q3+]
 f7 01                 ld8u	r1, [r4+]
 f4 b5                 dec16	r5
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L1>
 f5 0a                 cmp	r1, r2
 d0 ed                 breq8	-0x13 <L0>
<L1>:
 f2 3a                 sub	r1, r2
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f1 08                 mov	r1, r0
<L3>:
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
