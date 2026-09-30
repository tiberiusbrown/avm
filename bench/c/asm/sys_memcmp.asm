
sys_memcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sys_memcmp.c
00000100 l     O .data	00000040 lhs
00000140 l     O .data	00000040 equal
00000180 l     O .data	00000040 first_diff
000001c0 l     O .data	00000040 last_diff
00000200 l     O .data	00000002 n0
00000202 l     O .data	00000002 n1
00000204 l     O .data	00000002 n64
00000206 l     O .data	00000002 n16
00000208 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000476 l       .init_array	00000000 .hidden __init_array_end
00000476 l       .init_array	00000000 .hidden __init_array_start
00000476 l       .fini_array	00000000 .hidden __fini_array_start
00000476 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	0000009d avm_test_main
00000474 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 56 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 76 04              ldi16	r4, 0x476
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 76 04              ldi16	r6, 0x476
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 76 04           ldi16	r0, 0x476
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 76 04           ldi16	r2, 0x476
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
 e1 81 fc              call16	-895
 c4 76 04              ldi16	r4, 0x476
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 76 04              ldi16	r6, 0x476
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 76 04           ldi16	r2, 0x476
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 76 04           ldi16	r0, 0x476
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
 e1 30 fc              call16	-976
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
 aa                    xor	r6, r6
 c0 07                 ldi8	r4, 0x7
 f0 05 00 01           ldi16	r1, 0x100
 c7 40 01              ldi16	r7, 0x140
 f0 06 80 01           ldi16	r2, 0x180
 f0 04 c0 01           ldi16	r0, 0x1c0
 06                    mov	r5, r6
 f2 25                 add	r5, r1
 54                    st8	[r5], r4
 06                    mov	r5, r6
 17                    add	r5, r7
 54                    st8	[r5], r4
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 54                    st8	[r5], r4
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 54                    st8	[r5], r4
 c8 0d                 addi.s8	r4, 0xd
 f4 ae                 inc16	r6
 ce 40                 cmpi.s8	r6, 0x40
 d1 e9                 brne8	avm_test_main+24
 c0 80                 ldi8	r4, 0x80
 f0 45 80 01           ldm8u	r5, [0x180]
 a4                    xor	r5, r4
 f0 4d 80 01           stm8	[0x180], r5
 c0 01                 ldi8	r4, 0x1
 f0 45 ff 01           ldm8u	r5, [0x1ff]
 a4                    xor	r5, r4
 f0 4d ff 01           stm8	[0x1ff], r5
 d7 01                 sys	debug_break
 f0 56 00 02           ldm16	r6, [0x200]
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 d7 18                 sys	memcmp
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 02 02           ldm16	r6, [0x202]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 0c                    mov	r7, r4
 f0 56 04 02           ldm16	r6, [0x204]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 f1 1c                 mov	r3, r4
 f0 54 04 02           ldm16	r4, [0x204]
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 18                 sys	memcmp
 f1 14                 mov	r2, r4
 f0 54 04 02           ldm16	r4, [0x204]
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 18                 sys	memcmp
 f1 04                 mov	r0, r4
 f0 56 06 02           ldm16	r6, [0x206]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 f4 01                 ldsp16	r5, [sp+0x0]
 1d                    add	r7, r5
 f2 2f                 add	r7, r3
 f2 2e                 add	r7, r2
 f2 2c                 add	r7, r0
 1c                    add	r7, r4
 f0 5f 08 02           stm16	[0x208], r7
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
