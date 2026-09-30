
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/call_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 call_args.c
00000335 l     F .text	0000003f mix_arguments
00000100 l     O .data	00000004 call_result
00000000 l    df *ABS*	00000000 runtime.c
00000376 l       .init_array	00000000 .hidden __init_array_end
00000376 l       .init_array	00000000 .hidden __init_array_start
00000376 l       .fini_array	00000000 .hidden __fini_array_start
00000376 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000005e avm_test_main
00000374 g     F .text	00000002 avm_halt
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
 c4 76 03              ldi16	r4, 0x376
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 76 03              ldi16	r6, 0x376
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 76 03           ldi16	r0, 0x376
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 76 03           ldi16	r2, 0x376
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
 c4 76 03              ldi16	r4, 0x376
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 76 03              ldi16	r6, 0x376
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 76 03           ldi16	r2, 0x376
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 76 03           ldi16	r0, 0x376
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
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 c6 df 9b              ldi16	r6, 0x9bdf
 c7 57 13              ldi16	r7, 0x1357
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 06 e0 ac           ldi16	r2, 0xace0
 f0 07 68 24           ldi16	r3, 0x2468
 f1 04                 mov	r0, r4
 d6 f0                 adjsp	-0x10
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 04                    mov	r5, r4
 c9 07                 addi.s8	r5, 0x7
 f4 59                 stsp16	[sp+0x6], r5
 04                    mov	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f4 51                 stsp16	[sp+0x4], r5
 04                    mov	r5, r4
 c9 05                 addi.s8	r5, 0x5
 f4 49                 stsp16	[sp+0x2], r5
 04                    mov	r5, r4
 c9 04                 addi.s8	r5, 0x4
 f4 41                 stsp16	[sp+0x0], r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 a8                 inc16	r0
 08                    mov	r6, r4
 ca 02                 addi.s8	r6, 0x2
 0c                    mov	r7, r4
 cb 03                 addi.s8	r7, 0x3
 f1 24                 mov	r5, r0
 d5 18                 call8	mix_arguments
 d6 10                 adjsp	0x10
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0c 60              cmpi.s8	r0, 0x60
 f1 20                 mov	r4, r0
 d1 c5                 brne8	avm_test_main+22
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_arguments>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 17                    add	r5, r7
 f4 37                 ldsp16	r7, [sp+0xd]
 1d                    add	r7, r5
 f0 35 11              ldsp16	r5, [sp+0x11]
 17                    add	r5, r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 fa 48                 lsl16i	r5, 0x8
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f7 61                 add32	q0, q1
 12                    add	r4, r6
 f4 2d                 ldsp16	r5, [sp+0xb]
 14                    add	r5, r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 11                    add	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 35 15              ldsp16	r5, [sp+0x15]
 f7 6b                 add32	q2, q3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
