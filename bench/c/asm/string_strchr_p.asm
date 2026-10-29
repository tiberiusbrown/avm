
string_strchr_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 string_strchr_p.c
000003b9 l     O .rodata	00000080 string_bench_flash
00000100 l     O .data	00000003 call
00000103 l     O .data	00000002 string_bench_result
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000439 l       .init_array	00000000 .hidden __init_array_end
00000439 l       .init_array	00000000 .hidden __init_array_start
00000439 l       .fini_array	00000000 .hidden __fini_array_start
00000439 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000cf avm_test_main
00000354 g     F .text	00000065 __avm_terminate
00000352 g     F .text	00000002 avm_halt
00000336 g     F .text	0000001c strchr_P
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
 e1 3e 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 2f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 39 04              ldi16	r4, 0x439
 c1 00                 ldi8	r5, 0x0
 c6 39 04              ldi16	r6, 0x439
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 39 04           ldi16	r0, 0x439
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 39 04           ldi16	r2, 0x439
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
 d6 ee                 adjsp	-0x12
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c6 b9 03              ldi16	r6, 0x3b9
 c3 00                 ldi8	r7, 0x0
 f0 07 00 01           ldi16	r3, 0x100
 f1 15                 mov	r2, r5
 f1 0d                 mov	r1, r5
<L0>:
 f0 39 10              stsp16	[sp+0x10], r1
<L1>:
 f0 3a 0e              stsp16	[sp+0xe], r2
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 23                 mov	r4, r3
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 67                 mov32	q1, q3
 f1 73                 zext8	r3
 c2 61                 ldi8	r6, 0x61
 f2 69                 mov32	q2, q1
 e8                    callp	q0
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c2 7a                 ldi8	r6, 0x7a
 f2 69                 mov32	q2, q1
 e8                    callp	q0
 f2 62                 mov32	q0, q2
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f1 1f                 mov	r3, r7
 e9                    callp	q1
 f4 12                 ldsp16	r6, [sp+0x4]
 0c                    mov	r7, r4
 2e                    sub	r7, r6
 f4 af                 inc16	r7
 f1 75                 zext8	r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 a0                    xor	r4, r4
 fb 3c                 cmov.eq	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f1 24                 mov	r5, r0
 26                    sub	r5, r6
 f4 ad                 inc16	r5
 f1 71                 zext8	r1
 f0 69 04              cmp32	q0, q1
 f0 04 00 01           ldi16	r0, 0x100
 f1 18                 mov	r3, r0
 fb 2c                 cmov.eq	r5, r4
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f1 20                 mov	r4, r0
 22                    sub	r4, r6
 f4 ac                 inc16	r4
 f1 71                 zext8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fb 22                 cmov.eq	r4, r2
 f4 3b                 ldsp16	r7, [sp+0xe]
 13                    add	r4, r7
 11                    add	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 c6 b9 03              ldi16	r6, 0x3b9
 c3 00                 ldi8	r7, 0x0
 f4 ad                 inc16	r5
 cd 04                 cmpi.s8	r5, 0x4
 f1 14                 mov	r2, r4
 db 66 ff              brne16	-0x9a <L1>
 f0 31 10              ldsp16	r1, [sp+0x10]
 f4 a9                 inc16	r1
 f0 0d 20              cmpi.s8	r1, 0x20
 f1 14                 mov	r2, r4
 a5                    xor	r5, r5
 db 55 ff              brne16	-0xab <L0>
 f0 5c 03 01           stm16	[0x103], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strchr_P>:
 b1                    push16	r1
 b0                    push16	r0
 f1 76                 zext8	r6
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
<L0>:
 f0 60 e8              ldp8u	r7, [q2]
 3e                    cmp	r7, r6
 d0 08                 breq8	0x8 <L1>
 f7 68                 add32	q2, q0
 f4 a7                 tst8	r7
 d1 f4                 brne8	-0xc <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L1>:
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
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
 e1 97 fc              call16	-873 <__avm_run_local_dtors>
<L0>:
 c4 39 04              ldi16	r4, 0x439
 c1 00                 ldi8	r5, 0x0
 c6 39 04              ldi16	r6, 0x439
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 39 04           ldi16	r2, 0x439
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 39 04           ldi16	r0, 0x439
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
 e1 4e fc              call16	-946 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
