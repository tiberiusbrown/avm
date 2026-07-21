
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/call_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 call_args.c
00000274 l     F .text	0000002e mix_arguments
00000100 l     O .data	00000004 call_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000005e avm_test_main
000002a2 g     F .text	00000002 avm_halt
000002a4 g     F .text	00000027 __avm_ashlsi3

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 8c 00              call16	avm_halt

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
 d6 f0                 adjsp	avm_test_main+8
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
 d6 10                 adjsp	avm_test_main+88
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
 b1                    push16	r1
 b0                    push16	r0
 12                    add	r4, r6
 17                    add	r5, r7
 f4 26                 ldsp16	r6, [sp+0x9]
 19                    add	r6, r5
 f4 1d                 ldsp16	r5, [sp+0x7]
 14                    add	r5, r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 11                    add	r4, r5
 a5                    xor	r5, r5
 f0 30 0f              ldsp16	r0, [sp+0xf]
 f0 31 11              ldsp16	r1, [sp+0x11]
 f7 62                 add32	q0, q2
 f4 34                 ldsp16	r4, [sp+0xd]
 12                    add	r4, r6
 a5                    xor	r5, r5
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 d5 11                 call8	__avm_ashlsi3
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f7 6b                 add32	q2, q3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashlsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f0 01 00              ldi8	r1, 0x0
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_ashlsi3+17
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 13                 jmp8	__avm_ashlsi3+36
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashlsi3+36
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashlsi3+28
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
