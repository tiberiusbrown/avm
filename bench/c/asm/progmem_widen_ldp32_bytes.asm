
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_widen_ldp32_bytes.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_widen_ldp32_bytes.c
000003a7 l     O .rodata	000000a0 program_bytes
0000030d l     F .text	00000098 sum_bytes
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
00000447 l       .init_array	00000000 .hidden __init_array_end
00000447 l       .init_array	00000000 .hidden __init_array_start
00000447 l       .fini_array	00000000 .hidden __fini_array_start
00000447 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000036 avm_test_main
000003a5 g     F .text	00000002 avm_halt
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
 e1 87 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 47 04              ldi16	r4, 0x447
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 47 04              ldi16	r6, 0x447
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 47 04           ldi16	r0, 0x447
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 47 04           ldi16	r2, 0x447
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
 e1 81 fd              call16	-639
 c4 47 04              ldi16	r4, 0x447
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 47 04              ldi16	r6, 0x447
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 47 04           ldi16	r2, 0x447
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 47 04           ldi16	r0, 0x447
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
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 a7 03           ldi16	r0, 0x3a7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c2 80                 ldi8	r6, 0x80
 f2 68                 mov32	q2, q0
 d5 23                 call8	sum_bytes
 f0 5c 00 01           stm16	[0x100], r4
 c2 82                 ldi8	r6, 0x82
 f2 68                 mov32	q2, q0
 d5 19                 call8	sum_bytes
 f0 5c 02 01           stm16	[0x102], r4
 c4 a8 03              ldi16	r4, 0x3a8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 7f                 ldi8	r6, 0x7f
 d5 0a                 call8	sum_bytes
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 c3 01                 ldi8	r7, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 8e                    and	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 02                 ldi8	r6, 0x2
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 d4 00                 jmp8	sum_bytes+25
 f4 72                 stsp16	[sp+0xc], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 d1 0b                 brne8	sum_bytes+44
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 d4 0f                 jmp8	sum_bytes+59
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 65 c0              ldp8u	r6, [q0+]
 12                    add	r4, r6
 f0 33 08              ldsp16	r3, [sp+0x8]
 f4 b3                 dec16	r3
 f1 2b                 mov	r6, r3
 ca fe                 addi.s8	r6, -0x2
 0e                    mov	r7, r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 e8                 and	r7, r2
 f4 a7                 tst8	r7
 d1 19                 brne8	sum_bytes+98
 f0 66 e0              ldp16	r7, [q0+]
 f4 6b                 stsp16	[sp+0xa], r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 77                 zext8	r7
 13                    add	r4, r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 0b fe              addi.s8	r3, -0x2
 03                    mov	r4, r7
 ce 02                 cmpi.s8	r6, 0x2
 d8 07                 bruge8	sum_bytes+103
 d4 21                 jmp8	sum_bytes+131
 0c                    mov	r7, r4
 ce 02                 cmpi.s8	r6, 0x2
 d2 1c                 brult8	sum_bytes+131
 f0 68 80              ldp32	q2, [q0+]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 01                    mov	r4, r5
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 0b fc              addi.s8	r3, -0x4
 f6 2b                 tst16	r3
 0c                    mov	r7, r4
 d1 e4                 brne8	sum_bytes+103
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 10                    add	r4, r4
 92                    or	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 a2                    xor	r4, r6
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 88                 brne8	sum_bytes+25
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
