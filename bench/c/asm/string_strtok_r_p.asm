
string_strtok_r_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strtok_r_p.c
00000100 l     O .data	00000002 string_bench_result
00000102 l     O .data	00000003 call
00000105 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
000004cc l       .init_array	00000000 .hidden __init_array_end
000004cc l       .init_array	00000000 .hidden __init_array_start
000004cc l       .fini_array	00000000 .hidden __fini_array_start
000004cc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000165 avm_test_main
000004c4 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000042c g     F .text	00000098 strtok_rP

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
 e1 a6 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cc 04              ldi16	r4, 0x4cc
 c1 00                 ldi8	r5, 0x0
 c6 cc 04              ldi16	r6, 0x4cc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 cc 04           ldi16	r0, 0x4cc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cc 04           ldi16	r2, 0x4cc
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
 c4 cc 04              ldi16	r4, 0x4cc
 c1 00                 ldi8	r5, 0x0
 c6 cc 04              ldi16	r6, 0x4cc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 cc 04           ldi16	r2, 0x4cc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cc 04           ldi16	r0, 0x4cc
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
 d6 cc                 adjsp	-0x34
 a5                    xor	r5, r5
 f0 3d 12              stsp16	[sp+0x12], r5
 d7 01                 sys	debug_break
 f0 06 02 01           ldi16	r2, 0x102
 c6 c6 04              ldi16	r6, 0x4c6
 c3 00                 ldi8	r7, 0x0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 c9 04              ldi16	r6, 0x4c9
 c3 00                 ldi8	r7, 0x0
 f1 05                 mov	r0, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
<L0>:
 f4 71                 stsp16	[sp+0xc], r5
 f0 11 14              leasp	r1, 0x14
 f1 21                 mov	r4, r1
 c5 05 01              ldi16	r5, 0x105
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 d6 fe                 adjsp	-0x2
 f0 14 14              leasp	r4, 0x14
 f4 58                 stsp16	[sp+0x6], r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 39 0c              stsp16	[sp+0xc], r1
 f1 21                 mov	r4, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 0a                 mov	r1, r2
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 e9                    callp	q1
 f1 11                 mov	r2, r1
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d0 20                 breq8	0x20 <L2>
<L1>:
 f5 31                 ld8u	r1, [r4]
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e9                    callp	q1
 f0 06 02 01           ldi16	r2, 0x102
 d6 02                 adjsp	0x2
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 e0                 brne8	-0x20 <L1>
<L2>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 c5 25 01              ldi16	r5, 0x125
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d0 1e                 breq8	0x1e <L4>
<L3>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f0 14 14              leasp	r4, 0x14
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 e2                 brne8	-0x1e <L3>
<L4>:
 f0 17 14              leasp	r7, 0x14
 03                    mov	r4, r7
 c5 45 01              ldi16	r5, 0x145
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f0 14 14              leasp	r4, 0x14
 f4 70                 stsp16	[sp+0xc], r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 5b                 stsp16	[sp+0x6], r7
 03                    mov	r4, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d0 1e                 breq8	0x1e <L6>
<L5>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f0 14 14              leasp	r4, 0x14
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 e2                 brne8	-0x1e <L5>
<L6>:
 f4 13                 ldsp16	r7, [sp+0x4]
 03                    mov	r4, r7
 c5 65 01              ldi16	r5, 0x165
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d0 1e                 breq8	0x1e <L8>
<L7>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 d6 fe                 adjsp	-0x2
 f0 14 14              leasp	r4, 0x14
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e9                    callp	q1
 d6 02                 adjsp	0x2
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 e2                 brne8	-0x1e <L7>
<L8>:
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 f0 06 02 01           ldi16	r2, 0x102
 db cd fe              brne16	-0x133 <L0>
 f0 58 00 01           stm16	[0x100], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 34                 adjsp	0x34
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strtok_rP>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 35 13              ldsp16	r5, [sp+0x13]
 f6 2c                 tst16	r4
 d1 05                 brne8	0x5 <L0>
 61                    ld16	r4, [r5]
 f6 2c                 tst16	r4
 d0 7f                 breq8	0x7f <L13>
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f5 32                 ld8u	r2, [r4]
 f4 a2                 tst8	r2
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 d0 27                 breq8	0x27 <L4>
<L1>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L2>:
 f0 60 ac              ldp8u	r5, [q3]
 f5 26                 cmp	r5, r2
 d0 08                 breq8	0x8 <L3>
 f7 6c                 add32	q3, q0
 f4 a5                 tst8	r5
 d1 f3                 brne8	-0xd <L2>
 d4 14                 jmp8	0x14 <L4>
<L3>:
 f1 77                 zext8	r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 09                 breq8	0x9 <L4>
 ed 48 21              ld8u	r2, [r4+1]
 f4 ac                 inc16	r4
 f4 a2                 tst8	r2
 d1 d9                 brne8	-0x27 <L1>
<L4>:
 f5 32                 ld8u	r2, [r4]
 f4 a2                 tst8	r2
 d0 39                 breq8	0x39 <L10>
 f4 40                 stsp16	[sp+0x0], r4
 d4 14                 jmp8	0x14 <L7>
<L5>:
 f1 77                 zext8	r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 1c                 brne8	0x1c <L9>
<L6>:
 ed 48 21              ld8u	r2, [r4+1]
 f4 ac                 inc16	r4
 f4 a2                 tst8	r2
 d0 13                 breq8	0x13 <L9>
<L7>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L8>:
 f0 60 ac              ldp8u	r5, [q3]
 f5 26                 cmp	r5, r2
 d0 e1                 breq8	-0x1f <L5>
 f7 6c                 add32	q3, q0
 f4 a5                 tst8	r5
 d1 f3                 brne8	-0xd <L8>
 d4 e4                 jmp8	-0x1c <L6>
<L9>:
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 12                    add	r4, r6
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d0 06                 breq8	0x6 <L11>
 a5                    xor	r5, r5
 f6 05                 st8	[r4+], r5
 d4 01                 jmp8	0x1 <L11>
<L10>:
 aa                    xor	r6, r6
<L11>:
 f4 09                 ldsp16	r5, [sp+0x2]
 74                    st16	[r5], r4
<L12>:
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 aa                    xor	r6, r6
 d4 f5                 jmp8	-0xb <L12>

<avm_halt>:
 d4 fe                 jmp8	avm_halt
