
constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000002 constant_arith_result
00000102 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
0000040f l       .init_array	00000000 .hidden __init_array_end
0000040f l       .init_array	00000000 .hidden __init_array_start
0000040f l       .fini_array	00000000 .hidden __fini_array_start
0000040f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000c6 avm_test_main
0000038d g     F .text	00000002 avm_halt
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
 e1 6f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0f 04              ldi16	r4, 0x40f
 c1 00                 ldi8	r5, 0x0
 c6 0f 04              ldi16	r6, 0x40f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 0f 04           ldi16	r0, 0x40f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0f 04           ldi16	r2, 0x40f
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
 c4 0f 04              ldi16	r4, 0x40f
 c1 00                 ldi8	r5, 0x0
 c6 0f 04              ldi16	r6, 0x40f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 0f 04           ldi16	r2, 0x40f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0f 04           ldi16	r0, 0x40f
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
 d6 f2                 adjsp	-0xe
 c4 02 01              ldi16	r4, 0x102
 c6 8f 03              ldi16	r6, 0x38f
 c3 00                 ldi8	r7, 0x0
 c1 80                 ldi8	r5, 0x80
 d7 10                 sys	memcpy_p
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 f0 03 07              ldi8	r3, 0x7
 f0 00 0a              ldi8	r0, 0xa
 01                    mov	r4, r5
 f0 3b 04              stsp16	[sp+0x4], r3
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 f0 32 00              ldsp16	r2, [sp+0x0]
 c4 02 01              ldi16	r4, 0x102
<L1>:
 f7 26                 ld16	r6, [r4+]
 f4 70                 stsp16	[sp+0xc], r4
 02                    mov	r4, r6
 10                    add	r4, r4
 12                    add	r4, r6
 11                    add	r4, r5
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 16                    add	r5, r6
 a4                    xor	r5, r4
 02                    mov	r4, r6
 fe 23                 mul16	r4, r3
 11                    add	r4, r5
 06                    mov	r5, r6
 fe 28                 mul16	r5, r0
 a4                    xor	r5, r4
 c3 1f                 ldi8	r7, 0x1f
 02                    mov	r4, r6
 fe 27                 mul16	r4, r7
 11                    add	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 06                    mov	r5, r6
 ec 28                 udiv16	r5, r0
 c4 f6 ff              ldi16	r4, 0xfff6
 0d                    mov	r7, r5
 fe 3c                 mul16	r7, r4
 1e                    add	r7, r6
 1d                    add	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 f0 03 05              ldi8	r3, 0x5
 06                    mov	r5, r6
 ec 2b                 udiv16	r5, r3
 c4 fb ff              ldi16	r4, 0xfffb
 0d                    mov	r7, r5
 fe 3c                 mul16	r7, r4
 1e                    add	r7, r6
 1d                    add	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 c0 03                 ldi8	r4, 0x3
 06                    mov	r5, r6
 ec 2c                 udiv16	r5, r4
 f0 04 fd ff           ldi16	r0, 0xfffd
 01                    mov	r4, r5
 fe 20                 mul16	r4, r0
 12                    add	r4, r6
 11                    add	r4, r5
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 16                    add	r5, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 a7                    xor	r5, r7
 f0 04 00 80           ldi16	r0, 0x8000
 f9 1a                 xor	r0, r6
 f1 08                 mov	r1, r0
 ec cb                 srem16	r1, r3
 c3 03                 ldi8	r7, 0x3
 ec 87                 sdiv16	r0, r7
 f0 03 01              ldi8	r3, 0x1
 f9 78                 and	r3, r6
 f4 8e                 lsr16.1	r6
 f2 2b                 add	r6, r3
 19                    add	r6, r5
 a8                    xor	r6, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 f0 33 04              ldsp16	r3, [sp+0x4]
 f4 29                 ldsp16	r5, [sp+0xa]
 a9                    xor	r6, r5
 f2 28                 add	r6, r0
 c3 0a                 ldi8	r7, 0xa
 f1 07                 mov	r0, r7
 f9 c6                 xor	r6, r1
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 06                    mov	r5, r6
 db 7d ff              brne16	-0x83 <L1>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 06                    mov	r5, r6
 db 6b ff              brne16	-0x95 <L0>
 f0 5e 00 01           stm16	[0x100], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
