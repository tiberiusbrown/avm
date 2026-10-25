
fir8.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 fir8.c
00000100 l     O .data	00000002 fir_result
00000102 l     O .data	00000010 coefficients
00000112 l     O .data	00000060 samples
00000000 l    df *ABS*	00000000 runtime.c
00000445 l       .init_array	00000000 .hidden __init_array_end
00000445 l       .init_array	00000000 .hidden __init_array_start
00000445 l       .fini_array	00000000 .hidden __fini_array_start
00000445 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000016c avm_test_main
00000433 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 15 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 45 04              ldi16	r4, 0x445
 c1 00                 ldi8	r5, 0x0
 c6 45 04              ldi16	r6, 0x445
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 45 04           ldi16	r0, 0x445
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 45 04           ldi16	r2, 0x445
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
 c4 45 04              ldi16	r4, 0x445
 c1 00                 ldi8	r5, 0x0
 c6 45 04              ldi16	r6, 0x445
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 45 04           ldi16	r2, 0x445
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 45 04           ldi16	r0, 0x445
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
 d6 e0                 adjsp	-0x20
 c4 12 01              ldi16	r4, 0x112
 c3 07                 ldi8	r7, 0x7
 c2 60                 ldi8	r6, 0x60
 f0 00 7f              ldi8	r0, 0x7f
<L0>:
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 c9 c0                 addi.s8	r5, -0x40
 f6 05                 st8	[r4+], r5
 cb 13                 addi.s8	r7, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f1                 brne8	-0xf <L0>
 c4 02 01              ldi16	r4, 0x102
 c6 35 04              ldi16	r6, 0x435
 c3 00                 ldi8	r7, 0x0
 c1 10                 ldi8	r5, 0x10
 d7 10                 sys	memcpy_p
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 f0 47 11 01           ldm8u	r7, [0x111]
 f6 47                 sext8	r7
 f0 44 10 01           ldm8u	r4, [0x110]
 f6 44                 sext8	r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 44 0f 01           ldm8u	r4, [0x10f]
 f6 44                 sext8	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 44 0e 01           ldm8u	r4, [0x10e]
 f6 44                 sext8	r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 44 0d 01           ldm8u	r4, [0x10d]
 f6 44                 sext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 44 0c 01           ldm8u	r4, [0x10c]
 f6 44                 sext8	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f6 44                 sext8	r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 44 0a 01           ldm8u	r4, [0x10a]
 f6 44                 sext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 44 09 01           ldm8u	r4, [0x109]
 f6 44                 sext8	r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 44 08 01           ldm8u	r4, [0x108]
 f6 44                 sext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f6 44                 sext8	r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 44 06 01           ldm8u	r4, [0x106]
 f6 44                 sext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 44 05 01           ldm8u	r4, [0x105]
 f6 44                 sext8	r4
 f4 58                 stsp16	[sp+0x6], r4
 f0 44 04 01           ldm8u	r4, [0x104]
 f6 44                 sext8	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 44 03 01           ldm8u	r4, [0x103]
 f6 44                 sext8	r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 44 02 01           ldm8u	r4, [0x102]
 f6 44                 sext8	r4
 f0 05 12 01           ldi16	r1, 0x112
 f1 13                 mov	r2, r3
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 40                 stsp16	[sp+0x0], r4
<L1>:
 f2 30                 sub	r0, r0
<L2>:
 f1 28                 mov	r6, r0
 f2 29                 add	r6, r1
 42                    ld8u	r4, [r6]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 24                 muls8.w	r5, r4
 ed 8c 21              ld8u	r4, [r6+1]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 22              ld8u	r4, [r6+2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 23              ld8u	r4, [r6+3]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 24              ld8u	r4, [r6+4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 25              ld8u	r4, [r6+5]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 26              ld8u	r4, [r6+6]
 f4 31                 ldsp16	r5, [sp+0xc]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 27              ld8u	r4, [r6+7]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 28              ld8u	r4, [r6+8]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 29              ld8u	r4, [r6+9]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2a              ld8u	r4, [r6+10]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 2b              ld8u	r4, [r6+11]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2c              ld8u	r4, [r6+12]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 2d              ld8u	r4, [r6+13]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2e              ld8u	r4, [r6+14]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ed 8c 2f              ld8u	r4, [r6+15]
 0b                    mov	r6, r7
 f3 28                 muls8.w	r6, r4
 19                    add	r6, r5
 f2 1e                 add	r3, r6
 f4 a8                 inc16	r0
 f0 0c 40              cmpi.s8	r0, 0x40
 db 6c ff              brne16	-0x94 <L2>
 f4 aa                 inc16	r2
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 db 5f ff              brne16	-0xa1 <L1>
 f0 5b 00 01           stm16	[0x100], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
