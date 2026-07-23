
C:/tmp/avm-original-o2-root/build/bench/c/call_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 call_args.c
00000274 l     F .text	00000053 mix_arguments
00000100 l     O .data	00000004 call_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000005e avm_test_main
000002c7 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 b1 00              call16	avm_halt

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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	mix_arguments+1
 f1 04                 mov	r0, r4
 17                    add	r5, r7
 f4 3f                 ldsp16	r7, [sp+0xf]
 1d                    add	r7, r5
 f0 34 13              ldsp16	r4, [sp+0x13]
 13                    add	r4, r7
 f2 06                 add	r0, r6
 af                    xor	r7, r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 96                    or	r5, r6
 f4 37                 ldsp16	r7, [sp+0xd]
 f2 2c                 add	r7, r0
 f0 32 11              ldsp16	r2, [sp+0x11]
 f2 17                 add	r2, r7
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 fa 38                 lsl16i	r4, 0x8
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 36 19              ldsp16	r6, [sp+0x19]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 f7 6c                 add32	q3, q0
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f7 68                 add32	q2, q0
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 d6 04                 adjsp	avm_halt
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
