
string_strtok_r.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strtok_r.c
00000106 l     O .data	00000002 string_bench_result
00000108 l     O .data	00000003 call
0000010b l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
0000043b l       .init_array	00000000 .hidden __init_array_end
0000043b l       .init_array	00000000 .hidden __init_array_start
0000043b l       .fini_array	00000000 .hidden __fini_array_start
0000043b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000010c avm_test_main
000003d3 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003d5 g     F .text	00000066 strtok_r

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
 e1 b5 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3b 04              ldi16	r4, 0x43b
 c1 00                 ldi8	r5, 0x0
 c6 3b 04              ldi16	r6, 0x43b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 3b 04           ldi16	r0, 0x43b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3b 04           ldi16	r2, 0x43b
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
 c4 3b 04              ldi16	r4, 0x43b
 c1 00                 ldi8	r5, 0x0
 c6 3b 04              ldi16	r6, 0x43b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 3b 04           ldi16	r2, 0x43b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3b 04           ldi16	r0, 0x43b
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
 d6 da                 adjsp	-0x26
 a5                    xor	r5, r5
 f4 51                 stsp16	[sp+0x4], r5
 d7 01                 sys	debug_break
 f0 04 08 01           ldi16	r0, 0x108
 f1 1d                 mov	r3, r5
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f0 17 06              leasp	r7, 0x6
 03                    mov	r4, r7
 c5 0b 01              ldi16	r5, 0x10b
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 f1 10                 mov	r2, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 c5 00 01              ldi16	r5, 0x100
 e8                    callp	q0
 f1 02                 mov	r0, r2
 f6 2c                 tst16	r4
 d0 1a                 breq8	0x1a <L2>
<L1>:
 f5 32                 ld8u	r2, [r4]
 f1 20                 mov	r4, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 03 01              ldi16	r5, 0x103
 e8                    callp	q0
 f0 04 08 01           ldi16	r0, 0x108
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e6                 brne8	-0x1a <L1>
<L2>:
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 c5 2b 01              ldi16	r5, 0x12b
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 03                    mov	r4, r7
 c5 00 01              ldi16	r5, 0x100
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 17                 breq8	0x17 <L4>
<L3>:
 f5 32                 ld8u	r2, [r4]
 c4 08 01              ldi16	r4, 0x108
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 03 01              ldi16	r5, 0x103
 e8                    callp	q0
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L3>
<L4>:
 f0 17 06              leasp	r7, 0x6
 03                    mov	r4, r7
 c5 4b 01              ldi16	r5, 0x14b
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 08 01              ldi16	r4, 0x108
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 c5 00 01              ldi16	r5, 0x100
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 17                 breq8	0x17 <L6>
<L5>:
 f5 32                 ld8u	r2, [r4]
 c4 08 01              ldi16	r4, 0x108
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 03 01              ldi16	r5, 0x103
 e8                    callp	q0
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L5>
<L6>:
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 c5 6b 01              ldi16	r5, 0x16b
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 08 01              ldi16	r4, 0x108
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 03                    mov	r4, r7
 c5 00 01              ldi16	r5, 0x100
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 1a                 breq8	0x1a <L8>
 c5 03 01              ldi16	r5, 0x103
<L7>:
 f5 32                 ld8u	r2, [r4]
 c4 08 01              ldi16	r4, 0x108
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 e8                    callp	q0
 c5 03 01              ldi16	r5, 0x103
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L7>
<L8>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 f0 04 08 01           ldi16	r0, 0x108
 db 13 ff              brne16	-0xed <L0>
 f0 5b 06 01           stm16	[0x106], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<strtok_r>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 05                 brne8	0x5 <L0>
 62                    ld16	r4, [r6]
 f6 2c                 tst16	r4
 d0 57                 breq8	0x57 <L11>
<L0>:
 f5 30                 ld8u	r0, [r4]
 f4 a0                 tst8	r0
 d0 18                 breq8	0x18 <L4>
<L1>:
 0d                    mov	r7, r5
<L2>:
 f5 3d                 ld8u	r1, [r7]
 f5 08                 cmp	r1, r0
 d0 08                 breq8	0x8 <L3>
 f4 af                 inc16	r7
 f4 a1                 tst8	r1
 d1 f4                 brne8	-0xc <L2>
 d4 09                 jmp8	0x9 <L4>
<L3>:
 ed 08 21              ld8u	r0, [r4+1]
 f4 ac                 inc16	r4
 f4 a0                 tst8	r0
 d1 e8                 brne8	-0x18 <L1>
<L4>:
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 d0 29                 breq8	0x29 <L8>
 f1 04                 mov	r0, r4
<L5>:
 0d                    mov	r7, r5
<L6>:
 f5 3e                 ld8u	r2, [r7]
 f5 11                 cmp	r2, r1
 d0 0f                 breq8	0xf <L7>
 f4 af                 inc16	r7
 f4 a2                 tst8	r2
 d1 f4                 brne8	-0xc <L6>
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d1 ea                 brne8	-0x16 <L5>
<L7>:
 f2 34                 sub	r0, r4
 f2 04                 add	r0, r4
 ed a0 20              ld8u	r5, [r0+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L9>
 a5                    xor	r5, r5
 f0 6d a1              st8	[r0+], r5
 d4 04                 jmp8	0x4 <L9>
<L8>:
 a5                    xor	r5, r5
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
<L9>:
 f5 58                 st16	[r6], r0
<L10>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L11>:
 a0                    xor	r4, r4
 d4 f9                 jmp8	-0x7 <L10>
