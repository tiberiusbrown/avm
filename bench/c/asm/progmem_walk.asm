
progmem_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 progmem_walk.c
00000344 l     O .rodata	00000080 program_bytes
00000100 l     O .data	00000002 progmem_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003c4 l       .init_array	00000000 .hidden __init_array_end
000003c4 l       .init_array	00000000 .hidden __init_array_start
000003c4 l       .fini_array	00000000 .hidden __fini_array_start
000003c4 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000076 avm_test_main
000002df g     F .text	00000065 __avm_terminate
000002dd g     F .text	00000002 avm_halt
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
 e1 c9 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ba 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c4 03              ldi16	r4, 0x3c4
 c1 00                 ldi8	r5, 0x0
 c6 c4 03              ldi16	r6, 0x3c4
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 c4 03           ldi16	r0, 0x3c4
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c4 03           ldi16	r2, 0x3c4
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
 d6 fc                 adjsp	-0x4
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 04 44 03           ldi16	r0, 0x344
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
<L1>:
 f0 68 c4              ldp32	q3, [q1+]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 08 02              addi.s8	r0, 0x2
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 e1                 brne8	-0x1f <L1>
 f2 42                 sub	r2, r2
 f1 1a                 mov	r3, r2
 0c                    mov	r7, r4
 f0 04 44 03           ldi16	r0, 0x344
 f0 01 00              ldi8	r1, 0x0
<L2>:
 f2 2f                 add	r7, r3
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 c1 07                 ldi8	r5, 0x7
 f9 a8                 and	r5, r2
 f0 60 ec              ldp8u	r7, [q3]
 0b                    mov	r6, r7
 fa 09                 shl16v	r6, r5
 a2                    xor	r4, r6
 f0 0b 0d              addi.s8	r3, 0xd
 f4 aa                 inc16	r2
 c1 80                 ldi8	r5, 0x80
 f5 15                 cmp	r2, r5
 d1 e2                 brne8	-0x1e <L2>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 a9                 brne8	-0x57 <L0>
 f0 5c 00 01           stm16	[0x100], r4
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
 e1 0c fd              call16	-756 <__avm_run_local_dtors>
<L0>:
 c4 c4 03              ldi16	r4, 0x3c4
 c1 00                 ldi8	r5, 0x0
 c6 c4 03              ldi16	r6, 0x3c4
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 c4 03           ldi16	r2, 0x3c4
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c4 03           ldi16	r0, 0x3c4
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
 e1 c3 fc              call16	-829 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
