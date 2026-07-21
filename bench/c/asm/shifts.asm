
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 shifts.c
00000140 l     O .data	00000010 counts
00000100 l     O .data	00000020 values16
00000120 l     O .data	00000020 signed_values16
00000150 l     O .data	00000020 values32
00000170 l     O .data	00000004 shift_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000134 avm_test_main
0000034a g     F .text	00000002 avm_halt
000003a6 g     F .text	000000ea __avm_mulsi3
0000034c g     F .text	0000002d __avm_ashlsi3
00000379 g     F .text	0000002d __avm_lshrsi3

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
 e1 34 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	_start+12
 c4 d0 8a              ldi16	r4, 0x8ad0
 c5 34 12              ldi16	r5, 0x1234
 aa                    xor	r6, r6
 c7 40 01              ldi16	r7, 0x140
 f0 00 01              ldi8	r0, 0x1
 f0 05 11 01           ldi16	r1, 0x111
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 06 db 02           ldi16	r2, 0x2db
 f1 18                 mov	r3, r0
 f0 05 00 01           ldi16	r1, 0x100
 f2 0e                 add	r1, r6
 f0 6d b2              st16	[r1], r5
 f0 05 20 01           ldi16	r1, 0x120
 f2 0e                 add	r1, r6
 f0 6d 92              st16	[r1], r4
 ce 1e                 cmpi.s8	r6, 0x1e
 f1 0b                 mov	r1, r3
 fb 08                 cmov.eq	r1, r0
 f6 19                 st8	[r7+], r1
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f2 25                 add	r5, r1
 f2 22                 add	r4, r2
 f4 ab                 inc16	r3
 ca 02                 addi.s8	r6, 0x2
 ce 20                 cmpi.s8	r6, 0x20
 d1 d7                 brne8	avm_test_main+32
 f0 00 00              ldi8	r0, 0x0
 f0 05 50 01           ldi16	r1, 0x150
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 11 11              ldi16	r6, 0x1111
 c7 11 11              ldi16	r7, 0x1111
 e1 34 01              call16	__avm_mulsi3
 c6 67 45              ldi16	r6, 0x4567
 c7 23 81              ldi16	r7, 0x8123
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 6b c2              st32	[r1], q3
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d1 df                 brne8	avm_test_main+80
 a0                    xor	r4, r4
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 d7 01                 sys	debug_break
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 40 01           ldi16	r2, 0x140
 f0 33 00              ldsp16	r3, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f2 23                 add	r4, r3
 60                    ld16	r4, [r4]
 c5 20 01              ldi16	r5, 0x120
 f2 27                 add	r5, r3
 f0 6c c5              ld8u	r6, [r2+]
 f4 52                 stsp16	[sp+0x4], r6
 65                    ld16	r5, [r5]
 fa 26                 asr16v	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 c1 10                 ldi8	r5, 0x10
 26                    sub	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 fa 51                 lsl16i	r6, 0x1
 0a                    mov	r6, r6
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 04                    mov	r5, r4
 fa 83                 lsr16i	r5, 0x3
 f1 05                 mov	r0, r5
 f0 01 00              ldi8	r1, 0x0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 04                    mov	r5, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 06                 shl16v	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 12                 lsr16v	r4, r6
 91                    or	r4, r5
 00                    nop
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 06                 mov	r0, r6
 f0 01 00              ldi8	r1, 0x0
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 0b 02              addi.s8	r3, 0x2
 f0 0f 20              cmpi.s8	r3, 0x20
 d1 b2                 brne8	avm_test_main+134
 f0 02 00              ldi8	r2, 0x0
 f0 07 50 01           ldi16	r3, 0x150
 c6 40 01              ldi16	r6, 0x140
 f2 2a                 add	r6, r2
 f0 6a 86              ld32	q2, [r3]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 4a                    ld8u	r6, [r6]
 0a                    mov	r6, r6
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d5 42                 call8	__avm_ashlsi3
 f7 68                 add32	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d5 5f                 call8	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 0b 04              addi.s8	r3, 0x4
 f4 aa                 inc16	r2
 f0 0e 08              cmpi.s8	r2, 0x8
 d1 c3                 brne8	avm_test_main+219
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 db 59 ff              brne16	avm_test_main+125
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 02 1f              ldi8	r2, 0x1f
 f0 03 00              ldi8	r3, 0x0
 f0 69 4c              cmp32	q1, q3
 d2 15                 brult8	__avm_ashlsi3+40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 0c                 breq8	__avm_ashlsi3+38
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	__avm_ashlsi3+40
 d4 f6                 jmp8	__avm_ashlsi3+28
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 02 1f              ldi8	r2, 0x1f
 f0 03 00              ldi8	r3, 0x0
 f0 69 4c              cmp32	q1, q3
 d2 15                 brult8	__avm_lshrsi3+40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 0c                 breq8	__avm_lshrsi3+38
 f2 68                 mov32	q2, q0
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	__avm_lshrsi3+40
 d4 f6                 jmp8	__avm_lshrsi3+28
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	__avm_lshrsi3+29
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 00 10              ldi8	r0, 0x10
 f0 01 00              ldi8	r1, 0x0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 d5 b2                 call8	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 6a                 mov32	q3, q0
 d5 a7                 call8	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 7f                 lsr16i	r4, 0xf
 f2 22                 add	r4, r2
 0c                    mov	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fe 34                 mul16	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fe 3c                 mul16	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fa 78                 lsr16i	r4, 0x8
 f4 60                 stsp16	[sp+0x8], r4
 f1 76                 zext8	r6
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 74                 zext8	r4
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 34                 mulsu8.w	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f3 2e                 muls8.w	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f3 32                 mulsu8.w	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 18                    add	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa b8                 asr16i	r4, 0x8
 12                    add	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 0e                    mov	r7, r6
 fa 68                 lsl16i	r7, 0x8
 0b                    mov	r6, r7
 f4 31                 ldsp16	r5, [sp+0xc]
 19                    add	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 3b                    cmp	r6, r7
 f8 17                 cset.ult	r7
 1c                    add	r7, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 2a                 ldsp16	r6, [sp+0xa]
 12                    add	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 00                    nop
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e1 cd fe              call16	__avm_ashlsi3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 0a                    mov	r6, r6
 af                    xor	r7, r7
 92                    or	r4, r6
 97                    or	r5, r7
 d6 16                 adjsp	__avm_mulsi3+251
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
