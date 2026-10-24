
string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
000005e7 l       .init_array	00000000 .hidden __init_array_end
000005e7 l       .init_array	00000000 .hidden __init_array_start
000005e7 l       .fini_array	00000000 .hidden __fini_array_start
000005e7 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000021e avm_test_main
000005e5 g     F .text	00000002 avm_halt
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
 e1 c7 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e7 05              ldi16	r4, 0x5e7
 c1 00                 ldi8	r5, 0x0
 c6 e7 05              ldi16	r6, 0x5e7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e7 05           ldi16	r0, 0x5e7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e7 05           ldi16	r2, 0x5e7
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
 c4 e7 05              ldi16	r4, 0x5e7
 c1 00                 ldi8	r5, 0x0
 c6 e7 05              ldi16	r6, 0x5e7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e7 05           ldi16	r2, 0x5e7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e7 05           ldi16	r0, 0x5e7
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
 d6 f6                 adjsp	-0xa
 f0 05 00 01           ldi16	r1, 0x100
 c2 61                 ldi8	r6, 0x61
 f2 42                 sub	r2, r2
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f1 26                 mov	r5, r2
<L0>:
 0d                    mov	r7, r5
 fa 65                 lsl16i	r7, 0x5
 c4 00 01              ldi16	r4, 0x100
 1c                    add	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 01                    mov	r4, r5
 10                    add	r4, r4
 f4 59                 stsp16	[sp+0x6], r5
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f0 33 00              ldsp16	r3, [sp+0x0]
 f1 2e                 mov	r7, r2
 f4 62                 stsp16	[sp+0x8], r6
 f1 01                 mov	r0, r1
<L1>:
 c1 4f                 ldi8	r5, 0x4f
 03                    mov	r4, r7
 f3 11                 mulu8.w	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 c1 1a                 ldi8	r5, 0x1a
 f3 11                 mulu8.w	r4, r5
 07                    mov	r5, r7
 24                    sub	r5, r4
 27                    sub	r5, r7
 16                    add	r5, r6
 f0 6d a1              st8	[r0+], r5
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e4                 brne8	-0x1c <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 af                    xor	r7, r7
 ee ea 28              st8	[r5+8], r7
 ee e8 3f              st8	[r4+31], r7
 f0 0a 03              addi.s8	r2, 0x3
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 03                 addi.s8	r6, 0x3
 f0 09 20              addi.s8	r1, 0x20
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 ad                 brne8	-0x53 <L0>
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
<L2>:
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	-0xa <L2>
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
 f0 06 20 01           ldi16	r2, 0x120
 f1 0f                 mov	r1, r7
 d4 0c                 jmp8	0xc <L4>
<L3>:
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da 7e 01              breq16	0x17e <L33>
<L4>:
 f4 63                 stsp16	[sp+0x8], r7
 f4 b1                 dec16	r1
 f1 27                 mov	r5, r3
<L5>:
 f1 21                 mov	r4, r1
 f7 0f                 ld8u	r7, [r5+]
 f4 a9                 inc16	r1
 f4 a7                 tst8	r7
 d1 f6                 brne8	-0xa <L5>
 f1 2e                 mov	r7, r2
<L6>:
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	-0x9 <L6>
 c7 40 01              ldi16	r7, 0x140
<L7>:
 01                    mov	r4, r5
 f7 1e                 ld8u	r6, [r7+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f7                 brne8	-0x9 <L7>
 c7 60 01              ldi16	r7, 0x160
<L8>:
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	-0x9 <L8>
 c7 80 01              ldi16	r7, 0x180
<L9>:
 01                    mov	r4, r5
 f7 1e                 ld8u	r6, [r7+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f7                 brne8	-0x9 <L9>
 c7 a0 01              ldi16	r7, 0x1a0
<L10>:
 04                    mov	r5, r4
 f7 1e                 ld8u	r6, [r7+]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 f7                 brne8	-0x9 <L10>
 c4 c0 01              ldi16	r4, 0x1c0
<L11>:
 f1 1d                 mov	r3, r5
 f7 06                 ld8u	r6, [r4+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f6                 brne8	-0xa <L11>
 c4 e0 01              ldi16	r4, 0x1e0
<L12>:
 f7 05                 ld8u	r5, [r4+]
 f4 ab                 inc16	r3
 f4 a5                 tst8	r5
 d1 f8                 brne8	-0x8 <L12>
 c0 80                 ldi8	r4, 0x80
 f0 05 00 02           ldi16	r1, 0x200
<L13>:
 ed a2 20              ld8u	r5, [r1+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L14>
 f4 a9                 inc16	r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f1                 brne8	-0xf <L13>
 f2 39                 sub	r1, r1
<L14>:
 a0                    xor	r4, r4
 f6 29                 tst16	r1
 c5 00 02              ldi16	r5, 0x200
 f2 3d                 sub	r1, r5
 fb 0c                 cmov.eq	r1, r4
 c3 80                 ldi8	r7, 0x80
<L15>:
 49                    ld8u	r6, [r5]
 ce 21                 cmpi.s8	r6, 0x21
 d0 09                 breq8	0x9 <L16>
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	-0xd <L15>
 04                    mov	r5, r4
<L16>:
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
<L17>:
 49                    ld8u	r6, [r5]
 ce 42                 cmpi.s8	r6, 0x42
 d0 09                 breq8	0x9 <L18>
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	-0xd <L17>
 a5                    xor	r5, r5
<L18>:
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 06                    mov	r5, r6
<L19>:
 49                    ld8u	r6, [r5]
 ce 63                 cmpi.s8	r6, 0x63
 d0 09                 breq8	0x9 <L20>
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f3                 brne8	-0xd <L19>
 04                    mov	r5, r4
<L20>:
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
<L21>:
 49                    ld8u	r6, [r5]
 c3 84                 ldi8	r7, 0x84
 3b                    cmp	r6, r7
 d0 09                 breq8	0x9 <L22>
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	-0xe <L21>
 a5                    xor	r5, r5
<L22>:
 f2 30                 sub	r0, r0
 f6 2d                 tst16	r5
 c4 00 02              ldi16	r4, 0x200
 24                    sub	r5, r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c3 80                 ldi8	r7, 0x80
 04                    mov	r5, r4
<L23>:
 49                    ld8u	r6, [r5]
 c0 a5                 ldi8	r4, 0xa5
 38                    cmp	r6, r4
 d0 0a                 breq8	0xa <L24>
 f4 ad                 inc16	r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f2                 brne8	-0xe <L23>
 f1 24                 mov	r5, r0
<L24>:
 f6 2d                 tst16	r5
 c6 00 02              ldi16	r6, 0x200
 26                    sub	r5, r6
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
<L25>:
 49                    ld8u	r6, [r5]
 c3 c6                 ldi8	r7, 0xc6
 3b                    cmp	r6, r7
 d0 09                 breq8	0x9 <L26>
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	-0xe <L25>
 a5                    xor	r5, r5
<L26>:
 f2 30                 sub	r0, r0
 f6 2d                 tst16	r5
 c4 00 02              ldi16	r4, 0x200
 24                    sub	r5, r4
 fb 28                 cmov.eq	r5, r0
 f9 36                 xor	r1, r5
 c1 80                 ldi8	r5, 0x80
<L27>:
 48                    ld8u	r6, [r4]
 c3 e7                 ldi8	r7, 0xe7
 3b                    cmp	r6, r7
 d0 0a                 breq8	0xa <L28>
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	-0xe <L27>
 f1 20                 mov	r4, r0
<L28>:
 f6 2c                 tst16	r4
 c5 00 02              ldi16	r5, 0x200
 21                    sub	r4, r5
 fb 20                 cmov.eq	r4, r0
 f9 32                 xor	r1, r4
 f9 2e                 xor	r1, r3
 f1 2c                 mov	r7, r0
 f0 07 00 01           ldi16	r3, 0x100
 d4 0e                 jmp8	0xe <L31>
<L29>:
 f1 20                 mov	r4, r0
<L30>:
 f2 0c                 add	r1, r4
 41                    ld8u	r4, [r5]
 f2 3c                 sub	r1, r4
 f4 af                 inc16	r7
 cf 07                 cmpi.s8	r7, 0x7
 da 92 fe              breq16	-0x16e <L3>
<L31>:
 03                    mov	r4, r7
 fa 35                 lsl16i	r4, 0x5
 04                    mov	r5, r4
 f2 26                 add	r5, r2
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d0 e5                 breq8	-0x1b <L29>
<L32>:
 49                    ld8u	r6, [r5]
 32                    cmp	r4, r6
 d1 e3                 brne8	-0x1d <L30>
 ed 8a 01              ld8u	r4, [r5-31]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	-0xd <L32>
 d4 d6                 jmp8	-0x2a <L29>
<L33>:
 f0 59 80 02           stm16	[0x280], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
