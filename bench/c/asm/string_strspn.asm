
string_strspn.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 string_strspn.c
0000011f l     O .data	00000002 string_bench_result
00000121 l     O .data	00000003 call
00000124 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 termination.c
000003e9 l       .init_array	00000000 .hidden __init_array_end
000003e9 l       .init_array	00000000 .hidden __init_array_start
000003e9 l       .fini_array	00000000 .hidden __fini_array_start
000003e9 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000f1 avm_test_main
00000384 g     F .text	00000065 __avm_terminate
00000358 g     F .text	00000002 avm_halt
0000035a g     F .text	0000002a strspn
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 6e 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 35 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e9 03              ldi16	r4, 0x3e9
 c1 00                 ldi8	r5, 0x0
 c6 e9 03              ldi16	r6, 0x3e9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e9 03           ldi16	r0, 0x3e9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e9 03           ldi16	r2, 0x3e9
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 21 01           ldi16	r2, 0x121
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 07 24 01           ldi16	r3, 0x124
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 03 01              ldi16	r5, 0x103
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 f0 07 1e 01           ldi16	r3, 0x11e
 f1 27                 mov	r5, r3
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 07 44 01           ldi16	r3, 0x144
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 03 01              ldi16	r5, 0x103
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 1e 01              ldi16	r5, 0x11e
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 07 64 01           ldi16	r3, 0x164
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 03 01              ldi16	r5, 0x103
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 1e 01              ldi16	r5, 0x11e
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 07 84 01           ldi16	r3, 0x184
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 03 01              ldi16	r5, 0x103
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f0 6c d5              ld16	r6, [r2+]
 ed e4 20              ld8u	r7, [r2+0]
 f1 23                 mov	r4, r3
 c5 1e 01              ldi16	r5, 0x11e
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 01                 add	r0, r1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 29 ff              brne16	-0xd7 <L0>
 f0 58 1f 01           stm16	[0x11f], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<strspn>:
 b1                    push16	r1
 b0                    push16	r0
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 f1 04                 mov	r0, r4
 d0 19                 breq8	0x19 <L3>
 f1 04                 mov	r0, r4
<L0>:
 09                    mov	r6, r5
<L1>:
 4e                    ld8u	r7, [r6]
 f5 2d                 cmp	r7, r1
 d0 08                 breq8	0x8 <L2>
 f4 ae                 inc16	r6
 f4 a7                 tst8	r7
 d1 f5                 brne8	-0xb <L1>
 d4 09                 jmp8	0x9 <L3>
<L2>:
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d1 e9                 brne8	-0x17 <L0>
<L3>:
 f2 34                 sub	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

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
 e1 67 fc              call16	-921 <__avm_run_local_dtors>
<L0>:
 c4 e9 03              ldi16	r4, 0x3e9
 c1 00                 ldi8	r5, 0x0
 c6 e9 03              ldi16	r6, 0x3e9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e9 03           ldi16	r2, 0x3e9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e9 03           ldi16	r0, 0x3e9
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
 e1 1e fc              call16	-994 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
