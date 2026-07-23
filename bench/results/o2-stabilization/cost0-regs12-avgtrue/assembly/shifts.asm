
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 shifts.c
00000140 l     O .data	00000010 counts
00000120 l     O .data	00000020 signed_values16
00000100 l     O .data	00000020 values16
00000150 l     O .data	00000020 values32
00000170 l     O .data	00000004 shift_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000168 avm_test_main
0000037e g     F .text	00000002 avm_halt
00000380 g     F .text	00000024 __avm_ashlsi3
000003a4 g     F .text	00000024 __avm_lshrsi3

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
 e1 68 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	_start+12
 c4 40 01              ldi16	r4, 0x140
 c5 20 01              ldi16	r5, 0x120
 c6 00 01              ldi16	r6, 0x100
 c7 34 12              ldi16	r7, 0x1234
 f0 06 d0 8a           ldi16	r2, 0x8ad0
 f0 00 01              ldi8	r0, 0x1
 f0 05 11 01           ldi16	r1, 0x111
 f1 1a                 mov	r3, r2
 f7 57                 st16	[r6+], r7
 f2 2d                 add	r7, r1
 f0 06 db 02           ldi16	r2, 0x2db
 f2 13                 add	r2, r3
 f7 4b                 st16	[r5+], r3
 f6 00                 st8	[r4+], r0
 f4 a8                 inc16	r0
 f1 18                 mov	r3, r0
 f1 73                 zext8	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e5                 brne8	avm_test_main+29
 c4 33 22              ldi16	r4, 0x2233
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 a5 b5              ldi16	r4, 0xb5a5
 f0 5c 3e 01           stm16	[0x13e], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 4f 01           stm8	[0x14f], r4
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 76 54              ldi16	r4, 0x5476
 c5 32 90              ldi16	r5, 0x9032
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 45 67              ldi16	r4, 0x6745
 c5 01 a3              ldi16	r5, 0xa301
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 54 76              ldi16	r4, 0x7654
 c5 10 b2              ldi16	r5, 0xb210
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 23 01              ldi16	r4, 0x123
 c5 67 c5              ldi16	r5, 0xc567
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 32 10              ldi16	r4, 0x1032
 c5 76 d4              ldi16	r5, 0xd476
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 01 23              ldi16	r4, 0x2301
 c5 45 e7              ldi16	r5, 0xe745
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 10 32              ldi16	r4, 0x3210
 c5 54 f6              ldi16	r5, 0xf654
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c6 20 01              ldi16	r6, 0x120
 c7 40 01              ldi16	r7, 0x140
 c4 00 01              ldi16	r4, 0x100
 f0 02 10              ldi8	r2, 0x10
 f1 26                 mov	r5, r2
 f1 15                 mov	r2, r5
 f7 25                 ld16	r5, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 f7 1c                 ld8u	r4, [r7+]
 f4 73                 stsp16	[sp+0xc], r7
 f7 37                 ld16	r7, [r6+]
 f4 7a                 stsp16	[sp+0xe], r6
 fa 2c                 asr16v	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 c2 10                 ldi8	r6, 0x10
 28                    sub	r6, r4
 0d                    mov	r7, r5
 fa 0c                 shl16v	r7, r4
 01                    mov	r4, r5
 fa 12                 lsr16v	r4, r6
 93                    or	r4, r7
 09                    mov	r6, r5
 1a                    add	r6, r6
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 fa 83                 lsr16i	r5, 0x3
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f1 26                 mov	r5, r2
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 18                 ldsp16	r4, [sp+0x6]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 b7                 brne8	avm_test_main+195
 c7 40 01              ldi16	r7, 0x140
 c4 50 01              ldi16	r4, 0x150
 c2 08                 ldi8	r6, 0x8
 f4 6a                 stsp16	[sp+0xa], r6
 f4 70                 stsp16	[sp+0xc], r4
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 1e                 ld8u	r6, [r7+]
 f4 7b                 stsp16	[sp+0xe], r7
 af                    xor	r7, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 d5 40                 call8	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 d5 56                 call8	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c8 04                 addi.s8	r4, 0x4
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 c8                 brne8	avm_test_main+276
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 db 5b ff              brne16	avm_test_main+179
 c4 70 01              ldi16	r4, 0x170
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	__avm_ashlsi3+9
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
 d8 04                 bruge8	__avm_ashlsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_ashlsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashlsi3+33
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashlsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_lshrsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_lshrsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_lshrsi3+33
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_lshrsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
