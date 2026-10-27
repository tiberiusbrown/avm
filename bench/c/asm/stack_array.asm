
stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
00000335 l     F .text	000001c4 stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000560 l       .init_array	00000000 .hidden __init_array_end
00000560 l       .init_array	00000000 .hidden __init_array_start
00000560 l       .fini_array	00000000 .hidden __fini_array_start
00000560 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000ce avm_test_main
000004fb g     F .text	00000065 __avm_terminate
000004f9 g     F .text	00000002 avm_halt
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
 e1 e5 02              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 d6 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 60 05              ldi16	r4, 0x560
 c1 00                 ldi8	r5, 0x0
 c6 60 05              ldi16	r6, 0x560
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 60 05           ldi16	r0, 0x560
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 60 05           ldi16	r2, 0x560
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
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 54 00 01           ldm16	r4, [0x100]
 e1 c3 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 e1 b8 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 02                 addi.s8	r4, 0x2
 e1 ab 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 03                 addi.s8	r4, 0x3
 e1 9e 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 04                 addi.s8	r4, 0x4
 e1 91 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 05                 addi.s8	r4, 0x5
 e1 84 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 06                 addi.s8	r4, 0x6
 d5 78                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 07                 addi.s8	r4, 0x7
 d5 6c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 08                 addi.s8	r4, 0x8
 d5 60                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 09                 addi.s8	r4, 0x9
 d5 54                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0a                 addi.s8	r4, 0xa
 d5 48                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0b                 addi.s8	r4, 0xb
 d5 3c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0c                 addi.s8	r4, 0xc
 d5 30                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0d                 addi.s8	r4, 0xd
 d5 24                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0e                 addi.s8	r4, 0xe
 d5 18                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0f                 addi.s8	r4, 0xf
 d5 0c                 call8	stack_kernel
 f9 82                 xor	r4, r0
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_kernel>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 0c                    mov	r7, r4
 c2 94                 ldi8	r6, 0x94
 1b                    add	r6, r7
 f1 0f                 mov	r1, r7
 f0 09 25              addi.s8	r1, 0x25
 f9 c6                 xor	r6, r1
 f1 17                 mov	r2, r7
 f0 0a 4a              addi.s8	r2, 0x4a
 f9 46                 xor	r2, r1
 f1 26                 mov	r5, r2
 a7                    xor	r5, r7
 a9                    xor	r6, r5
 f1 1e                 mov	r3, r6
 f1 05                 mov	r0, r5
 f0 38 06              stsp16	[sp+0x6], r0
 0b                    mov	r6, r7
 ca 6f                 addi.s8	r6, 0x6f
 ab                    xor	r6, r7
 f9 c6                 xor	r6, r1
 c1 01                 ldi8	r5, 0x1
 f9 aa                 xor	r5, r2
 a9                    xor	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f1 15                 mov	r2, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 ab                    xor	r6, r7
 c1 02                 ldi8	r5, 0x2
 a6                    xor	r5, r6
 f9 76                 xor	r3, r5
 f0 3b 0a              stsp16	[sp+0xa], r3
 01                    mov	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c1 de                 ldi8	r5, 0xde
 17                    add	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a4                    xor	r5, r4
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 c0 b9                 ldi8	r4, 0xb9
 13                    add	r4, r7
 a3                    xor	r4, r7
 f9 86                 xor	r4, r1
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 8a                 xor	r4, r2
 f1 03                 mov	r0, r3
 f9 1e                 xor	r0, r7
 c2 03                 ldi8	r6, 0x3
 f9 c2                 xor	r6, r0
 a2                    xor	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 13                    add	r4, r7
 11                    add	r4, r5
 c5 03 01              ldi16	r5, 0x103
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f1 1a                 mov	r3, r2
 f9 ae                 xor	r5, r3
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 28 01              ldi16	r4, 0x128
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 32 08              ldsp16	r2, [sp+0x8]
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 4d 01              ldi16	r5, 0x14d
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 72 01              ldi16	r4, 0x172
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 30 08              ldsp16	r0, [sp+0x8]
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 97 01              ldi16	r5, 0x197
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 33 04              ldsp16	r3, [sp+0x4]
 f9 ae                 xor	r5, r3
 a7                    xor	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 a6                    xor	r5, r6
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 bc 01              ldi16	r4, 0x1bc
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 e1 01              ldi16	r5, 0x1e1
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 ae                 xor	r5, r3
 a7                    xor	r5, r7
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 ae                 xor	r5, r3
 f1 02                 mov	r0, r2
 f9 a2                 xor	r5, r0
 14                    add	r5, r4
 c4 06 02              ldi16	r4, 0x206
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f0 32 06              ldsp16	r2, [sp+0x6]
 f9 8a                 xor	r4, r2
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 2b 02              ldi16	r5, 0x22b
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 a6                    xor	r5, r6
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f9 a2                 xor	r5, r0
 14                    add	r5, r4
 c4 50 02              ldi16	r4, 0x250
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f9 8a                 xor	r4, r2
 f1 1a                 mov	r3, r2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 75 02              ldi16	r5, 0x275
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 a6                    xor	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 9a 02              ldi16	r4, 0x29a
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f9 8e                 xor	r4, r3
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f9 8a                 xor	r4, r2
 11                    add	r4, r5
 c5 bf 02              ldi16	r5, 0x2bf
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 ae                 xor	r5, r3
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 e4 02              ldi16	r4, 0x2e4
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 30 08              ldsp16	r0, [sp+0x8]
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f9 8a                 xor	r4, r2
 11                    add	r4, r5
 c5 09 03              ldi16	r5, 0x309
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 a6                    xor	r5, r6
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 2e 03              ldi16	r4, 0x32e
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 8e                 xor	r4, r3
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 f0 04 53 03           ldi16	r0, 0x353
 f2 07                 add	r0, r7
 07                    mov	r5, r7
 f9 a2                 xor	r5, r0
 f9 36                 xor	r1, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f9 3a                 xor	r1, r6
 f9 3e                 xor	r1, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 3a                 xor	r1, r6
 f9 2a                 xor	r1, r2
 f2 0c                 add	r1, r4
 f1 23                 mov	r4, r3
 a1                    xor	r4, r5
 f0 33 08              ldsp16	r3, [sp+0x8]
 f9 8e                 xor	r4, r3
 ac                    xor	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 ac                    xor	r7, r4
 f2 2d                 add	r7, r1
 a9                    xor	r6, r5
 f9 ca                 xor	r6, r2
 1e                    add	r7, r6
 a4                    xor	r5, r4
 1d                    add	r7, r5
 f2 2c                 add	r7, r0
 03                    mov	r4, r7
 d6 0c                 adjsp	0xc
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
 e1 f0 fa              call16	-1296 <__avm_run_local_dtors>
<L0>:
 c4 60 05              ldi16	r4, 0x560
 c1 00                 ldi8	r5, 0x0
 c6 60 05              ldi16	r6, 0x560
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 60 05           ldi16	r2, 0x560
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 60 05           ldi16	r0, 0x560
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
 e1 a7 fa              call16	-1369 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
