
rotate32.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 rotate32.c
00000100 l     O .data	00000040 values
00000140 l     O .data	00000010 counts
00000150 l     O .data	00000004 rotate32_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
000004c3 l       .init_array	00000000 .hidden __init_array_end
000004c3 l       .init_array	00000000 .hidden __init_array_start
000004c3 l       .fini_array	00000000 .hidden __fini_array_start
000004c3 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000133 avm_test_main
000003fa g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000444 g     F .text	0000007f __avm_mulsi3
000003fc g     F .text	00000024 __avm_ashlsi3
00000420 g     F .text	00000024 __avm_lshrsi3

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
 e1 dc 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c3 04              ldi16	r4, 0x4c3
 c1 00                 ldi8	r5, 0x0
 c6 c3 04              ldi16	r6, 0x4c3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 c3 04           ldi16	r0, 0x4c3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c3 04           ldi16	r2, 0x4c3
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
 c4 c3 04              ldi16	r4, 0x4c3
 c1 00                 ldi8	r5, 0x0
 c6 c3 04              ldi16	r6, 0x4c3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 c3 04           ldi16	r2, 0x4c3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c3 04           ldi16	r0, 0x4c3
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
 d6 e6                 adjsp	-0x1a
 f0 00 01              ldi8	r0, 0x1
 a0                    xor	r4, r4
 f0 05 00 01           ldi16	r1, 0x100
 f0 06 40 01           ldi16	r2, 0x140
 c1 09                 ldi8	r5, 0x9
 f4 71                 stsp16	[sp+0xc], r5
 c1 fe                 ldi8	r5, 0xfe
 f4 79                 stsp16	[sp+0xe], r5
 f1 1c                 mov	r3, r4
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 28                    sub	r6, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 89                    and	r6, r5
 f4 8e                 lsr16.1	r6
 18                    add	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 c6 04 03              ldi16	r6, 0x304
 c7 02 01              ldi16	r7, 0x102
 e1 42 01              call16	__avm_mulsi3
 c6 78 56              ldi16	r6, 0x5678
 c7 34 12              ldi16	r7, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 6b c2              st32	[r1], q3
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 84                 lsr16i	r5, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 14                 mulu8.w	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 21                    sub	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 21                    sub	r4, r5
 f2 20                 add	r4, r0
 f0 6d 85              st8	[r2+], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 09 04              addi.s8	r1, 0x4
 c8 07                 addi.s8	r4, 0x7
 f0 08 07              addi.s8	r0, 0x7
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 b2                 brne8	-0x4e <L0>
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
<L1>:
 f0 3d 14              stsp16	[sp+0x14], r5
 c1 10                 ldi8	r5, 0x10
 c4 40 01              ldi16	r4, 0x140
 f4 70                 stsp16	[sp+0xc], r4
 c4 00 01              ldi16	r4, 0x100
<L2>:
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 6a 88              ld32	q2, [r4]
 f4 32                 ldsp16	r6, [sp+0xc]
 f7 17                 ld8u	r7, [r6+]
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 72                 stsp16	[sp+0xc], r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 62                 stsp16	[sp+0x8], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 fa 58                 lsl16i	r6, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 9b                    or	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 f2 6b                 mov32	q3, q1
 e1 81 00              call16	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 c0 20                 ldi8	r4, 0x20
 f0 35 10              ldsp16	r5, [sp+0x10]
 21                    sub	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 94 00              call16	__avm_lshrsi3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 58                 lsl16i	r6, 0x8
 f1 16                 mov	r2, r6
 f1 2b                 mov	r6, r3
 f4 2b                 ldsp16	r7, [sp+0xa]
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 98                 lsr16i	r6, 0x8
 af                    xor	r7, r7
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 6d                 add32	q3, q1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f7 6e                 add32	q3, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 39                 ldsp16	r5, [sp+0xe]
 c8 04                 addi.s8	r4, 0x4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f2 63                 mov32	q0, q3
 db 6a ff              brne16	-0x96 <L2>
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 f2 63                 mov32	q0, q3
 db 4e ff              brne16	-0xb2 <L1>
 c4 50 01              ldi16	r4, 0x150
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashlsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	0x11 <L2>
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	0x8 <L2>
<L1>:
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	-0x8 <L1>
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	0x11 <L2>
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	0x8 <L2>
<L1>:
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	-0x8 <L1>
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

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
