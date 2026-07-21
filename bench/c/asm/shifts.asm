
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 shifts.c
00000100 l     O .data	00000020 values16
00000120 l     O .data	00000020 signed_values16
00000140 l     O .data	00000010 counts
00000150 l     O .data	00000020 values32
00000170 l     O .data	00000004 shift_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000128 avm_test_main
0000033e g     F .text	00000002 avm_halt
0000038e g     F .text	000000cf __avm_mulsi3
00000340 g     F .text	00000027 __avm_ashlsi3
00000367 g     F .text	00000027 __avm_lshrsi3

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
 e1 28 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	_start+12
 f0 06 d0 8a           ldi16	r2, 0x8ad0
 f0 07 34 12           ldi16	r3, 0x1234
 c4 00 01              ldi16	r4, 0x100
 c5 20 01              ldi16	r5, 0x120
 c6 40 01              ldi16	r6, 0x140
 f0 01 01              ldi8	r1, 0x1
 c7 33 22              ldi16	r7, 0x2233
 f4 7b                 stsp16	[sp+0xe], r7
 f1 02                 mov	r0, r2
 f1 2f                 mov	r7, r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f5 2e                 cmp	r7, r2
 f1 11                 mov	r2, r1
 f0 03 01              ldi8	r3, 0x1
 fb 13                 cmov.eq	r2, r3
 f7 47                 st16	[r7+], r7
 f7 48                 st16	[r7+], r0
 f6 12                 st8	[r6+], r2
 f0 06 db 02           ldi16	r2, 0x2db
 f2 10                 add	r2, r0
 f0 07 11 01           ldi16	r3, 0x111
 f2 1f                 add	r3, r7
 f4 a9                 inc16	r1
 c7 44 23              ldi16	r7, 0x2344
 f5 1f                 cmp	r3, r7
 d1 d5                 brne8	avm_test_main+31
 f0 00 00              ldi8	r0, 0x0
 f0 05 50 01           ldi16	r1, 0x150
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 11 11              ldi16	r6, 0x1111
 c7 11 11              ldi16	r7, 0x1111
 e1 1b 01              call16	__avm_mulsi3
 c6 67 45              ldi16	r6, 0x4567
 c7 23 81              ldi16	r7, 0x8123
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 6b c2              st32	[r1], q3
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d1 df                 brne8	avm_test_main+81
 a5                    xor	r5, r5
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c4 00 01              ldi16	r4, 0x100
 c6 40 01              ldi16	r6, 0x140
 f0 07 20 01           ldi16	r3, 0x120
 f0 02 10              ldi8	r2, 0x10
 f7 25                 ld16	r5, [r7+]
 f4 78                 stsp16	[sp+0xe], r4
 f7 14                 ld8u	r4, [r6+]
 f4 72                 stsp16	[sp+0xc], r6
 f0 6c d7              ld16	r6, [r3+]
 fa 28                 asr16v	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 c2 10                 ldi8	r6, 0x10
 28                    sub	r6, r4
 0d                    mov	r7, r5
 fa 0c                 shl16v	r7, r4
 01                    mov	r4, r5
 fa 12                 lsr16v	r4, r6
 93                    or	r4, r7
 09                    mov	r6, r5
 fa 51                 lsl16i	r6, 0x1
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 fa 83                 lsr16i	r5, 0x3
 f1 05                 mov	r0, r5
 f0 01 00              ldi8	r1, 0x0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 07                 mov	r0, r7
 f0 01 00              ldi8	r1, 0x0
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 be                 brne8	avm_test_main+138
 c4 50 01              ldi16	r4, 0x150
 c7 40 01              ldi16	r7, 0x140
 c2 08                 ldi8	r6, 0x8
 f4 6a                 stsp16	[sp+0xa], r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 1e                 ld8u	r6, [r7+]
 f4 73                 stsp16	[sp+0xc], r7
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
 d5 59                 call8	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 62                 mov32	q0, q2
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 38                 ldsp16	r4, [sp+0xe]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c8 04                 addi.s8	r4, 0x4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 c8                 brne8	avm_test_main+212
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 db 63 ff              brne16	avm_test_main+123
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

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f0 01 00              ldi8	r1, 0x0
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_lshrsi3+17
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 13                 jmp8	__avm_lshrsi3+36
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_lshrsi3+36
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_lshrsi3+28
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	__avm_lshrsi3+25
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f1 05                 mov	r0, r5
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f1 07                 mov	r0, r7
 f0 01 00              ldi8	r1, 0x0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 fe 34                 mul16	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 22                 ldsp16	r6, [sp+0x8]
 fe 34                 mul16	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 74                 zext8	r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 12                 mulu8.w	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f3 3d                 mulsu8.w	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f3 2e                 muls8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 32                 mulsu8.w	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa b8                 asr16i	r4, 0x8
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 f4 61                 stsp16	[sp+0x8], r5
 f4 69                 stsp16	[sp+0xa], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 2b                 ldsp16	r7, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 36                    cmp	r5, r6
 f8 10                 cset.ult	r0
 f2 04                 add	r0, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 07                 add	r0, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 13                    add	r4, r7
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 13                    add	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 38                    cmp	r6, r4
 f8 17                 cset.ult	r7
 f2 2c                 add	r7, r0
 0b                    mov	r6, r7
 af                    xor	r7, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	__avm_mulsi3+222
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
