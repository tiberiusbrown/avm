
mixed_width.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 mixed_width.c
00000140 l     O .data	00000040 signed_words
00000180 l     O .data	00000080 wide_values
00000100 l     O .data	00000020 signed_bytes
00000120 l     O .data	00000020 unsigned_bytes
00000200 l     O .data	00000004 mixed_width_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
0000054b l       .init_array	00000000 .hidden __init_array_end
0000054b l       .init_array	00000000 .hidden __init_array_start
0000054b l       .fini_array	00000000 .hidden __fini_array_start
0000054b l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	00000103 avm_test_main
000004ca g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004cc g     F .text	0000007f __avm_mulsi3

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
 e1 ac 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4b 05              ldi16	r4, 0x54b
 c1 00                 ldi8	r5, 0x0
 c6 4b 05              ldi16	r6, 0x54b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 4b 05           ldi16	r0, 0x54b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4b 05           ldi16	r2, 0x54b
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 4b 05              ldi16	r4, 0x54b
 c1 00                 ldi8	r5, 0x0
 c6 4b 05              ldi16	r6, 0x54b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 4b 05           ldi16	r2, 0x54b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4b 05           ldi16	r0, 0x54b
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
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
 d6 f2                 adjsp	-0xe
 f2 30                 sub	r0, r0
 c3 f0                 ldi8	r7, 0xf0
 c5 60 f0              ldi16	r5, 0xf060
 f0 05 40 01           ldi16	r1, 0x140
 c4 80 01              ldi16	r4, 0x180
 f0 06 00 01           ldi16	r2, 0x100
 f1 28                 mov	r6, r0
<L0>:
 f4 73                 stsp16	[sp+0xc], r7
 f1 1d                 mov	r3, r5
 f1 24                 mov	r5, r0
 f2 26                 add	r5, r2
 57                    st8	[r5], r7
 f1 24                 mov	r5, r0
 c7 20 01              ldi16	r7, 0x120
 17                    add	r5, r7
 56                    st8	[r5], r6
 f0 6d 73              st16	[r1+], r3
 f0 39 08              stsp16	[sp+0x8], r1
 c1 fb                 ldi8	r5, 0xfb
 f2 27                 add	r5, r3
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f1 2c                 mov	r7, r0
 f0 04 ec ff           ldi16	r0, 0xffec
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 61                 add32	q0, q1
 f0 06 00 01           ldi16	r2, 0x100
 f0 6b 08              st32	[r4], q0
 f1 07                 mov	r0, r7
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 33                 ldsp16	r7, [sp+0xc]
 c8 04                 addi.s8	r4, 0x4
 f4 af                 inc16	r7
 ca 05                 addi.s8	r6, 0x5
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 bb                 brne8	-0x45 <L0>
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 05 80 01           ldi16	r1, 0x180
 c4 40 01              ldi16	r4, 0x140
 f1 1c                 mov	r3, r4
 f2 30                 sub	r0, r0
<L2>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f1 20                 mov	r4, r0
 f2 22                 add	r4, r2
 40                    ld8u	r4, [r4]
 f4 31                 ldsp16	r5, [sp+0xc]
 c6 20 01              ldi16	r6, 0x120
 16                    add	r5, r6
 f5 34                 ld8u	r0, [r5]
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 d5 71                 call8	__avm_mulsi3
 ed d6 20              ld16	r6, [r3+0]
 f4 4a                 stsp16	[sp+0x2], r6
 f0 6c 57              ld16	r2, [r3+]
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 39                 sub	r1, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 63                 add32	q0, q3
 f7 62                 add32	q0, q2
 f2 4b                 sub	r3, r3
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 69                 add32	q2, q1
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 06 00 01           ldi16	r2, 0x100
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 6a c2              ld32	q3, [r1]
 f6 46                 sext8	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 6a 82              ld32	q2, [r1]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 93                 brne8	-0x6d <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 7a ff              brne16	-0x86 <L1>
 c4 00 02              ldi16	r4, 0x200
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 69                 stsp16	[sp+0xa], r5
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 2e                 mul16	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 0b                    mov	r6, r7
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
