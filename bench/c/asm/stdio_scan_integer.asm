
stdio_scan_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000112 l     O .data	00000004 result_sink
00000100 l     O .data	00000003 call
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdio_scan_string.c
000002ad l     F .text	00000010 string_read
000002bd l     F .text	00000006 string_unread
00000000 l    df *ABS*	00000000 stdio_scan_core.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000000 l    df *ABS*	00000000 stdio_scan_float.c
00001e21 l     O .rodata	00000028 __avm_scan_float.threshold
00000000 l    df *ABS*	00000000 strtof_internal.c
00001e49 l     O .rodata	00000018 __avm_decimal_value.powers
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00001e61 l       .init_array	00000000 .hidden __init_array_end
00001e61 l       .init_array	00000000 .hidden __init_array_start
00001e61 l       .fini_array	00000000 .hidden __fini_array_start
00001e61 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000044 avm_test_main
00001bfb g     F .text	00000065 __avm_terminate
000002ab g     F .text	00000002 avm_halt
000002c3 g     F .text	0000004d sscanf
000009ea g     F .text	00000011 isalnum
000009fb g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000310 g     F .text	00000022 __avm_scan_peek
00000332 g     F .text	0000003b __avm_scan_take
0000036d g     F .text	0000067d __avm_vscan
00000a07 g     F .text	00000059 __avm_scan_count
00000a60 g     F .text	00000662 __avm_scan_integer
000010c2 g     F .text	000007ff __avm_scan_float
00001cb8 g     F .text	00000068 __avm_mulsi3
00001d92 g     F .text	00000013 __avm_udivsi3
00001da5 g     F .text	0000007c __avm_lshrdi3
00001b0b g     F .text	000000f0 __avm_decimal_value
000018c1 g     F .text	0000024a __avm_hex_value
00000000  w      *UND*	00000000 __avm_errno
00001c60 g     F .text	0000002c __avm_ashlsi3
00001c8c g     F .text	0000002c __avm_lshrsi3
00001d20 g     F .text	00000072 __avm_udivmodsi4

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 e5 19              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 88 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 61 1e              ldi16	r4, 0x1e61
 c1 00                 ldi8	r5, 0x0
 c6 61 1e              ldi16	r6, 0x1e61
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 61 1e           ldi16	r0, 0x1e61
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 61 1e           ldi16	r2, 0x1e61
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 00 20              ldi8	r0, 0x20
 d7 01                 sys	debug_break
 f0 06 0e 01           ldi16	r2, 0x10e
 f0 07 03 01           ldi16	r3, 0x103
 f0 05 12 01           ldi16	r1, 0x112
<L0>:
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 d6 fa                 adjsp	-0x6
 f0 14 06              leasp	r4, 0x6
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 00              stsp16	[sp+0x0], r3
 eb                    callp	q3
 d6 06                 adjsp	0x6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 82              st32	[r1], q2
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 dd                 brne8	-0x23 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<string_read>:
 64                    ld16	r5, [r4]
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d0 06                 breq8	0x6 <L0>
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 72                    st16	[r4], r6
 41                    ld8u	r4, [r5]
 ef                    ret
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

<string_unread>:
 68                    ld16	r6, [r4]
 f4 b6                 dec16	r6
 72                    st16	[r4], r6
 01                    mov	r4, r5
 ef                    ret

<sscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f0 16 1f              leasp	r6, 0x1f
 f4 62                 stsp16	[sp+0x8], r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 ad 02           ldi16	r0, 0x2ad
 f0 01 00              ldi8	r1, 0x0
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 29 10              stsp8	[sp+0x10], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 bd 02           ldi16	r0, 0x2bd
 f0 01 00              ldi8	r1, 0x0
 f0 38 11              stsp16	[sp+0x11], r0
 f0 29 13              stsp8	[sp+0x13], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 d5 62                 call8	__avm_vscan
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_scan_peek>:
 b0                    push16	r0
 ed a8 30              ld8u	r5, [r4+16]
 f4 a5                 tst8	r5
 d0 05                 breq8	0x5 <L0>
 ed 98 2e              ld16	r4, [r4+14]
 b8                    pop16	r0
 ef                    ret
<L0>:
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 64                    ld16	r5, [r4]
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 ee a0 30              st8	[r0+16], r5
 ee 90 2e              st16	[r0+14], r4
 b8                    pop16	r0
 ef                    ret

<__avm_scan_take>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 80 30              ld8u	r4, [r0+16]
 f4 a4                 tst8	r4
 d0 05                 breq8	0x5 <L0>
 ed 90 2e              ld16	r4, [r0+14]
 d4 0e                 jmp8	0xe <L1>
<L0>:
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 ed 90 20              ld16	r4, [r0+0]
 eb                    callp	q3
 ee 90 2e              st16	[r0+14], r4
<L1>:
 a5                    xor	r5, r5
 ee a0 30              st8	[r0+16], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 10                 breq8	0x10 <L2>
 f0 08 08              addi.s8	r0, 0x8
 f0 6a c0              ld32	q3, [r0]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 6b 40              st32	[r0], q1
<L2>:
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_vscan>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f1 05                 mov	r0, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 6a 48              ld32	q1, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 a0                    xor	r4, r4
 f0 2c 10              stsp8	[sp+0x10], r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3e 22              stsp16	[sp+0x22], r6
 c0 01                 ldi8	r4, 0x1
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 d1 31                 brne8	0x31 <L3>
 f1 0c                 mov	r1, r4
 e0 f3 05              jmp16	1523 <L83>
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 f5 21                 cmp	r4, r1
 db 09 06              brne16	0x609 <L86>
<L1>:
 a0                    xor	r4, r4
 f0 2c 10              stsp8	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L2>:
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 da c4 05              breq16	0x5c4 <L82>
<L3>:
 f1 10                 mov	r2, r0
 f4 aa                 inc16	r2
 f1 21                 mov	r4, r1
 e1 1e 06              call16	isspace
 f6 2c                 tst16	r4
 d0 1b                 breq8	0x1b <L5>
<L4>:
 ed 80 21              ld8u	r4, [r0+1]
 f4 a8                 inc16	r0
 e1 12 06              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L4>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 19                 breq8	0x19 <L6>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 d0 d2                 breq8	-0x2e <L2>
 d4 23                 jmp8	0x23 <L7>
<L5>:
 f0 0d 25              cmpi.s8	r1, 0x25
 d1 34                 brne8	0x34 <L8>
 ed 84 20              ld8u	r4, [r2+0]
 cc 25                 cmpi.s8	r4, 0x25
 d1 4a                 brne8	0x4a <L10>
 f0 08 02              addi.s8	r0, 0x2
 d4 2a                 jmp8	0x2a <L9>
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d0 ad                 breq8	-0x53 <L2>
<L7>:
 f1 74                 zext8	r4
 e1 d7 05              call16	isspace
 f6 2c                 tst16	r4
 d0 a4                 breq8	-0x5c <L2>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 da cb 00              breq16	0xcb <L14>
 f4 38                 ldsp16	r4, [sp+0xe]
 e0 cf 00              jmp16	207 <L15>
<L8>:
 f1 02                 mov	r0, r2
<L9>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 da 69 ff              breq16	-0x97 <L0>
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 21                 cmp	r4, r1
 da 75 ff              breq16	-0x8b <L1>
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 e0 50 05              jmp16	1360 <L84>
<L10>:
 a0                    xor	r4, r4
 f0 3c 19              stsp16	[sp+0x19], r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 ed 84 20              ld8u	r4, [r2+0]
 cc 2a                 cmpi.s8	r4, 0x2a
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d1 0d                 brne8	0xd <L11>
 c0 01                 ldi8	r4, 0x1
 f0 2c 19              stsp8	[sp+0x19], r4
 ed 80 22              ld8u	r4, [r0+2]
 f0 08 02              addi.s8	r0, 0x2
 f1 10                 mov	r2, r0
<L11>:
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 cd 0a                 cmpi.s8	r5, 0xa
 dd ec 00              bruge16	0xec <L22>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 84 20              ld8u	r4, [r2+0]
 d4 2b                 jmp8	0x2b <L13>
<L12>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 1b 18              call16	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f0 34 11              ldsp16	r4, [sp+0x11]
 f0 35 13              ldsp16	r5, [sp+0x13]
 f7 62                 add32	q0, q2
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 84 20              ld8u	r4, [r2+0]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 dd aa 00              bruge16	0xaa <L21>
<L13>:
 c8 d0                 addi.s8	r4, -0x30
 a5                    xor	r5, r5
 f0 3c 11              stsp16	[sp+0x11], r4
 f0 3d 13              stsp16	[sp+0x13], r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 c1 18              call16	__avm_udivsi3
 f4 aa                 inc16	r2
 f0 69 80              cmp32	q2, q0
 d8 bd                 bruge8	-0x43 <L12>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 ed 84 20              ld8u	r4, [r2+0]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f2 63                 mov32	q0, q3
 d2 ce                 brult8	-0x32 <L13>
 c2 01                 ldi8	r6, 0x1
 cc 6c                 cmpi.s8	r4, 0x6c
 df 90 00              brsge16	0x90 <L24>
 d4 7d                 jmp8	0x7d <L23>
<L14>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L15>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 d0 0a                 breq8	0xa <L16>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
<L16>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 d4 07                 jmp8	0x7 <L18>
<L17>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
<L18>:
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 da 94 fe              breq16	-0x16c <L2>
 f1 74                 zext8	r4
 e1 be 04              call16	isspace
 f6 2c                 tst16	r4
 da 8a fe              breq16	-0x176 <L2>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L19>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L20>
<L19>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L20>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 c9                 breq8	-0x37 <L17>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 bd                 jmp8	-0x43 <L17>
<L21>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 da 5d 04              breq16	0x45d <L87>
<L22>:
 c2 01                 ldi8	r6, 0x1
 cc 6c                 cmpi.s8	r4, 0x6c
 d9 11                 brsge8	0x11 <L24>
<L23>:
 cc 4c                 cmpi.s8	r4, 0x4c
 d0 1e                 breq8	0x1e <L25>
 cc 68                 cmpi.s8	r4, 0x68
 d0 31                 breq8	0x31 <L27>
 cc 6a                 cmpi.s8	r4, 0x6a
 db ea 00              brne16	0xea <L38>
 c0 05                 ldi8	r4, 0x5
 d4 3b                 jmp8	0x3b <L29>
<L24>:
 cc 6c                 cmpi.s8	r4, 0x6c
 d0 11                 breq8	0x11 <L26>
 cc 74                 cmpi.s8	r4, 0x74
 d0 31                 breq8	0x31 <L28>
 cc 7a                 cmpi.s8	r4, 0x7a
 db dd 00              brne16	0xdd <L39>
 c0 06                 ldi8	r4, 0x6
 d4 2a                 jmp8	0x2a <L29>
<L25>:
 c0 08                 ldi8	r4, 0x8
 d4 26                 jmp8	0x26 <L29>
<L26>:
 c0 03                 ldi8	r4, 0x3
 f0 2c 1a              stsp8	[sp+0x1a], r4
 ed a4 21              ld8u	r5, [r2+1]
 cd 6c                 cmpi.s8	r5, 0x6c
 db ba 00              brne16	0xba <L37>
 c0 04                 ldi8	r4, 0x4
 c2 02                 ldi8	r6, 0x2
 d4 13                 jmp8	0x13 <L29>
<L27>:
 c2 02                 ldi8	r6, 0x2
 f0 2e 1a              stsp8	[sp+0x1a], r6
 ed a4 21              ld8u	r5, [r2+1]
 cd 68                 cmpi.s8	r5, 0x68
 db b9 00              brne16	0xb9 <L40>
 c0 01                 ldi8	r4, 0x1
 d4 02                 jmp8	0x2 <L29>
<L28>:
 c0 07                 ldi8	r4, 0x7
<L29>:
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f2 16                 add	r2, r6
<L30>:
 ed a4 20              ld8u	r5, [r2+0]
 f4 a5                 tst8	r5
 da fe 03              breq16	0x3fe <L87>
<L31>:
 f0 2d 1b              stsp8	[sp+0x1b], r5
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 cd 5b                 cmpi.s8	r5, 0x5b
 d1 37                 brne8	0x37 <L33>
 ed c4 21              ld8u	r6, [r2+1]
 f1 2e                 mov	r7, r2
 cb 02                 addi.s8	r7, 0x2
 ce 5e                 cmpi.s8	r6, 0x5e
 f0 38 2c              stsp16	[sp+0x2c], r0
 f1 28                 mov	r6, r0
 fb 37                 cmov.eq	r6, r7
 f0 01 01              ldi8	r1, 0x1
 f0 00 02              ldi8	r0, 0x2
 f1 2d                 mov	r7, r1
 fb 38                 cmov.eq	r7, r0
 f2 2e                 add	r7, r2
 4f                    ld8u	r7, [r7]
 cf 5d                 cmpi.s8	r7, 0x5d
 f8 02                 cset.eq	r2
 f2 16                 add	r2, r6
<L32>:
 ed c4 20              ld8u	r6, [r2+0]
 f4 a6                 tst8	r6
 da 94 03              breq16	0x394 <L83>
 ce 5d                 cmpi.s8	r6, 0x5d
 f1 2a                 mov	r6, r2
 f4 ae                 inc16	r6
 d0 19                 breq8	0x19 <L34>
 f1 16                 mov	r2, r6
 d4 ec                 jmp8	-0x14 <L32>
<L33>:
 aa                    xor	r6, r6
 f1 16                 mov	r2, r6
 f0 3a 2c              stsp16	[sp+0x2c], r2
 cd 5b                 cmpi.s8	r5, 0x5b
 d1 14                 brne8	0x14 <L35>
 09                    mov	r6, r5
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 dc 28 01              brult16	0x128 <L54>
 e0 f9 00              jmp16	249 <L52>
<L34>:
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 cd 5b                 cmpi.s8	r5, 0x5b
 da e9 00              breq16	0xe9 <L51>
<L35>:
 cd 63                 cmpi.s8	r5, 0x63
 da e4 00              breq16	0xe4 <L51>
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 1b                 brne8	0x1b <L36>
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 cd 2a                 cmpi.s8	r5, 0x2a
 da 5e 01              breq16	0x15e <L58>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d6 fe                 adjsp	-0x2
 f0 15 24              leasp	r5, 0x24
 f4 41                 stsp16	[sp+0x0], r5
 e1 b7 03              call16	__avm_scan_count
 d6 02                 adjsp	0x2
 e0 4b 01              jmp16	331 <L58>
<L36>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 26                 breq8	0x26 <L41>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 da b4 00              breq16	0xb4 <L50>
 d4 30                 jmp8	0x30 <L42>
<L37>:
 f4 aa                 inc16	r2
 f4 a5                 tst8	r5
 db 65 ff              brne16	-0x9b <L31>
 e0 60 03              jmp16	864 <L87>
<L38>:
 a0                    xor	r4, r4
 e0 56 ff              jmp16	-170 <L30>
<L39>:
 a0                    xor	r4, r4
 e0 52 ff              jmp16	-174 <L30>
<L40>:
 f4 aa                 inc16	r2
 02                    mov	r4, r6
 f4 a5                 tst8	r5
 db 52 ff              brne16	-0xae <L31>
 e0 4d 03              jmp16	845 <L87>
<L41>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 da 82 00              breq16	0x82 <L50>
<L42>:
 f1 74                 zext8	r4
 e1 61 03              call16	isspace
 f6 2c                 tst16	r4
 d0 79                 breq8	0x79 <L50>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L43>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L44>
<L43>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L44>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 0d                 breq8	0xd <L45>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L45>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 d4 07                 jmp8	0x7 <L47>
<L46>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
<L47>:
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d0 34                 breq8	0x34 <L50>
 f1 74                 zext8	r4
 e1 13 03              call16	isspace
 f6 2c                 tst16	r4
 d0 2b                 breq8	0x2b <L50>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L48>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L49>
<L48>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L49>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 cb                 breq8	-0x35 <L46>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 d4 bc                 jmp8	-0x44 <L46>
<L50>:
 f0 1d 1b              ldsp8u	r5, [sp+0x1b]
<L51>:
 09                    mov	r6, r5
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 d2 2c                 brult8	0x2c <L54>
<L52>:
 01                    mov	r4, r5
 c8 97                 addi.s8	r4, -0x69
 cc 10                 cmpi.s8	r4, 0x10
 d8 10                 bruge8	0x10 <L53>
 c2 01                 ldi8	r6, 0x1
 fa 08                 shl16v	r6, r4
 c7 c1 90              ldi16	r7, 0x90c1
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 d1 35                 brne8	0x35 <L55>
 cc 0a                 cmpi.s8	r4, 0xa
 d0 76                 breq8	0x76 <L59>
<L53>:
 c9 bf                 addi.s8	r5, -0x41
 cd 07                 cmpi.s8	r5, 0x7
 dd a3 02              bruge16	0x2a3 <L91>
 c0 01                 ldi8	r4, 0x1
 fa 01                 shl16v	r4, r5
 c1 71                 ldi8	r5, 0x71
 84                    and	r5, r4
 f4 a5                 tst8	r5
 da 9b 02              breq16	0x29b <L92>
 d4 32                 jmp8	0x32 <L56>
<L54>:
 c0 01                 ldi8	r4, 0x1
 fa 02                 shl16v	r4, r6
 c6 00 e2              ldi16	r6, 0xe200
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d1 26                 brne8	0x26 <L56>
 c6 08 08              ldi16	r6, 0x808
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d1 4d                 brne8	0x4d <L59>
 c6 01 10              ldi16	r6, 0x1001
 82                    and	r4, r6
 f6 2c                 tst16	r4
 d0 b8                 breq8	-0x48 <L52>
<L55>:
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 22              leasp	r6, 0x22
 e1 eb 02              call16	__avm_scan_integer
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 db 1e 02              brne16	0x21e <L83>
 d4 14                 jmp8	0x14 <L57>
<L56>:
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 22              leasp	r6, 0x22
 e1 37 09              call16	__avm_scan_float
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 db 08 02              brne16	0x208 <L83>
<L57>:
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 d1 06                 brne8	0x6 <L58>
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 ac                 inc16	r4
 f4 70                 stsp16	[sp+0xc], r4
<L58>:
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 db 2c fc              brne16	-0x3d4 <L3>
 f0 01 01              ldi8	r1, 0x1
 e0 ed 01              jmp16	493 <L83>
<L59>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 cc 0a                 cmpi.s8	r4, 0xa
 d2 15                 brult8	0x15 <L60>
 cd 63                 cmpi.s8	r5, 0x63
 d1 11                 brne8	0x11 <L60>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3c 15              stsp16	[sp+0x15], r4
 f0 3d 17              stsp16	[sp+0x17], r5
 d4 0c                 jmp8	0xc <L61>
<L60>:
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
<L61>:
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3c 20              stsp16	[sp+0x20], r4
 d1 1b                 brne8	0x1b <L62>
 f0 34 22              ldsp16	r4, [sp+0x22]
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f0 3d 22              stsp16	[sp+0x22], r5
 68                    ld16	r6, [r4]
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 cc 03                 cmpi.s8	r4, 0x3
 a0                    xor	r4, r4
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 fb 34                 cmov.eq	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
<L62>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 c8              cmp32	q3, q2
 da c7 01              breq16	0x1c7 <L88>
 c0 01                 ldi8	r4, 0x1
 f0 3c 28              stsp16	[sp+0x28], r4
 f2 4b                 sub	r3, r3
 f0 3b 11              stsp16	[sp+0x11], r3
 d4 19                 jmp8	0x19 <L64>
<L63>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 11              stsp16	[sp+0x11], r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 8c              cmp32	q2, q3
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 39 26              stsp16	[sp+0x26], r1
 da 4a 01              breq16	0x14a <L79>
<L64>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 05                 breq8	0x5 <L65>
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d4 11                 jmp8	0x11 <L66>
<L65>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 c0 01                 ldi8	r4, 0x1
 f0 2c 10              stsp8	[sp+0x10], r4
 f0 39 0e              stsp16	[sp+0xe], r1
<L66>:
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f0 0d ff              cmpi.s8	r1, -0x1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 da fd 00              breq16	0xfd <L77>
 cc 73                 cmpi.s8	r4, 0x73
 d1 15                 brne8	0x15 <L67>
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 e1 92 01              call16	isspace
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f6 2c                 tst16	r4
 db fb 00              brne16	0xfb <L78>
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
<L67>:
 cc 5b                 cmpi.s8	r4, 0x5b
 d1 73                 brne8	0x73 <L72>
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 ed 86 20              ld8u	r4, [r3+0]
 cc 5e                 cmpi.s8	r4, 0x5e
 f8 05                 cset.eq	r5
 f2 1d                 add	r3, r5
 f5 1a                 cmp	r3, r2
 d0 5e                 breq8	0x5e <L71>
 f0 3d 2a              stsp16	[sp+0x2a], r5
 aa                    xor	r6, r6
 f1 2f                 mov	r7, r3
 d4 0e                 jmp8	0xe <L69>
<L68>:
 f5 0c                 cmp	r1, r4
 f8 04                 cset.eq	r4
 f1 1f                 mov	r3, r7
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d0 39                 breq8	0x39 <L70>
<L69>:
 f7 1c                 ld8u	r4, [r7+]
 f1 27                 mov	r5, r3
 c9 02                 addi.s8	r5, 0x2
 f5 26                 cmp	r5, r2
 d8 e8                 bruge8	-0x18 <L68>
 f0 3b 11              stsp16	[sp+0x11], r3
 f1 1a                 mov	r3, r2
 f1 11                 mov	r2, r1
 f5 3d                 ld8u	r1, [r7]
 f0 0d 2d              cmpi.s8	r1, 0x2d
 f1 0a                 mov	r1, r2
 f1 13                 mov	r2, r3
 f0 33 11              ldsp16	r3, [sp+0x11]
 d1 d3                 brne8	-0x2d <L68>
 45                    ld8u	r5, [r5]
 34                    cmp	r5, r4
 d2 cf                 brult8	-0x31 <L68>
 f5 25                 cmp	r5, r1
 f8 2d                 cset.sge	r5
 f5 0c                 cmp	r1, r4
 f8 2c                 cset.sge	r4
 81                    and	r4, r5
 f0 0b 03              addi.s8	r3, 0x3
 f1 2f                 mov	r7, r3
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d1 c7                 brne8	-0x39 <L69>
<L70>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 38                    cmp	r6, r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 da 88 00              breq16	0x88 <L78>
 d4 05                 jmp8	0x5 <L72>
<L71>:
 cc 5e                 cmpi.s8	r4, 0x5e
 db 81 00              brne16	0x81 <L78>
<L72>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L73>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 0f                 jmp8	0xf <L74>
<L73>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 78                 stsp16	[sp+0xe], r4
<L74>:
 f0 39 11              stsp16	[sp+0x11], r1
 a5                    xor	r5, r5
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 13                 breq8	0x13 <L75>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
<L75>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 6b                 add32	q2, q3
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f6 2c                 tst16	r4
 f2 39                 sub	r1, r1
 d0 07                 breq8	0x7 <L76>
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 0c                 mov	r1, r4
<L76>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f2 4b                 sub	r3, r3
 da c8 fe              breq16	-0x138 <L63>
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 1c                 mov	r3, r4
 e0 be fe              jmp16	-322 <L63>
<L77>:
 cc 63                 cmpi.s8	r4, 0x63
 f8 0c                 cset.ne	r4
 f0 35 11              ldsp16	r5, [sp+0x11]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 33 20              ldsp16	r3, [sp+0x20]
 d0 6b                 breq8	0x6b <L89>
 d4 15                 jmp8	0x15 <L80>
<L78>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 a4                 tst8	r4
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 31 26              ldsp16	r1, [sp+0x26]
 d1 62                 brne8	0x62 <L90>
<L79>:
 f0 1e 1b              ldsp8u	r6, [sp+0x1b]
 ce 63                 cmpi.s8	r6, 0x63
 da 0f fe              breq16	-0x1f1 <L57>
<L80>:
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L81>
 aa                    xor	r6, r6
 ee c2 20              st8	[r1+0], r6
<L81>:
 f6 2b                 tst16	r3
 da 02 fe              breq16	-0x1fe <L57>
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e0 fb fd              jmp16	-517 <L57>
<L82>:
 f0 01 01              ldi8	r1, 0x1
<L83>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 0d                 breq8	0xd <L85>
<L84>:
 f4 39                 ldsp16	r5, [sp+0xe]
 cd ff                 cmpi.s8	r5, -0x1
 d0 07                 breq8	0x7 <L85>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 16                 ldsp16	r6, [sp+0x5]
 f3 5f                 ldsp8u	r7, [sp+0x7]
 eb                    callp	q3
<L85>:
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 ff ff              ldi16	r4, 0xffff
 f6 2d                 tst16	r5
 fb 65                 cmov.ne	r4, r5
 f0 0d ff              cmpi.s8	r1, -0x1
 fb 65                 cmov.ne	r4, r5
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L86>:
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 d4 d3                 jmp8	-0x2d <L84>
<L87>:
 f0 01 01              ldi8	r1, 0x1
 d4 c7                 jmp8	-0x39 <L83>
<L88>:
 f2 39                 sub	r1, r1
 d4 c3                 jmp8	-0x3d <L83>
<L89>:
 f0 05 ff ff           ldi16	r1, 0xffff
 d4 bd                 jmp8	-0x43 <L83>
<L90>:
 f2 39                 sub	r1, r1
 d4 b9                 jmp8	-0x47 <L83>
<L91>:
 f2 39                 sub	r1, r1
 d4 b5                 jmp8	-0x4b <L83>
<L92>:
 f2 39                 sub	r1, r1
 d4 b1                 jmp8	-0x4f <L83>

<isalnum>:
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 cd 1a                 cmpi.s8	r5, 0x1a
 f8 15                 cset.ult	r5
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

<__avm_scan_count>:
 b0                    push16	r0
 f4 15                 ldsp16	r5, [sp+0x5]
 cc 04                 cmpi.s8	r4, 0x4
 d9 18                 brsge8	0x18 <L0>
 cc 01                 cmpi.s8	r4, 0x1
 d0 41                 breq8	0x41 <L4>
 cc 02                 cmpi.s8	r4, 0x2
 d0 1a                 breq8	0x1a <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d1 16                 brne8	0x16 <L1>
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 d4 28                 jmp8	0x28 <L3>
<L0>:
 cc 04                 cmpi.s8	r4, 0x4
 d0 13                 breq8	0x13 <L2>
 cc 05                 cmpi.s8	r4, 0x5
 d0 0f                 breq8	0xf <L2>
 cc 07                 cmpi.s8	r4, 0x7
<L1>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 72                    st16	[r4], r6
 b8                    pop16	r0
 ef                    ret
<L2>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L3>:
 f0 6b c8              st32	[r4], q3
 b8                    pop16	r0
 ef                    ret
<L4>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 52                    st8	[r4], r6
 b8                    pop16	r0
 ef                    ret

<__avm_scan_integer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ca                 adjsp	-0x36
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f1 05                 mov	r0, r5
 f0 6a c0              ld32	q3, [r0]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 60                 stsp16	[sp+0x8], r4
 e1 97 f8              call16	__avm_scan_peek
 ed a0 26              ld8u	r5, [r0+6]
 cd 69                 cmpi.s8	r5, 0x69
 f8 01                 cset.eq	r1
 cd 64                 cmpi.s8	r5, 0x64
 f8 03                 cset.eq	r3
 f2 42                 sub	r2, r2
 c2 08                 ldi8	r6, 0x8
 cd 6f                 cmpi.s8	r5, 0x6f
 d3 13                 brslt8	0x13 <L0>
 cd 6f                 cmpi.s8	r5, 0x6f
 f1 2e                 mov	r7, r2
 f0 3e 26              stsp16	[sp+0x26], r6
 d0 2a                 breq8	0x2a <L4>
 cd 70                 cmpi.s8	r5, 0x70
 d0 1b                 breq8	0x1b <L1>
 cd 78                 cmpi.s8	r5, 0x78
 d1 1b                 brne8	0x1b <L2>
 d4 15                 jmp8	0x15 <L1>
<L0>:
 cd 58                 cmpi.s8	r5, 0x58
 d0 11                 breq8	0x11 <L1>
 cd 69                 cmpi.s8	r5, 0x69
 d1 11                 brne8	0x11 <L2>
 af                    xor	r7, r7
 f0 3f 26              stsp16	[sp+0x26], r7
 c3 01                 ldi8	r7, 0x1
 cc ff                 cmpi.s8	r4, -0x1
 da 4a 05              breq16	0x54a <L46>
 d4 10                 jmp8	0x10 <L5>
<L1>:
 c2 10                 ldi8	r6, 0x10
 d4 02                 jmp8	0x2 <L3>
<L2>:
 c2 0a                 ldi8	r6, 0xa
<L3>:
 f1 2e                 mov	r7, r2
 f0 3e 26              stsp16	[sp+0x26], r6
<L4>:
 cc ff                 cmpi.s8	r4, -0x1
 da 38 05              breq16	0x538 <L46>
<L5>:
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3d 2e              stsp16	[sp+0x2e], r5
 cc 2d                 cmpi.s8	r4, 0x2d
 f0 38 34              stsp16	[sp+0x34], r0
 f4 52                 stsp16	[sp+0x4], r6
 d0 04                 breq8	0x4 <L6>
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 23                 brne8	0x23 <L7>
<L6>:
 f1 04                 mov	r0, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 54 f8              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 0c 2d              cmpi.s8	r0, 0x2d
 f0 30 34              ldsp16	r0, [sp+0x34]
 f8 02                 cset.eq	r2
<L7>:
 f9 65                 or	r3, r1
 ed 80 25              ld8u	r4, [r0+5]
 cc 04                 cmpi.s8	r4, 0x4
 f0 00 01              ldi8	r0, 0x1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 d9 24                 brsge8	0x24 <L8>
 cc 01                 cmpi.s8	r4, 0x1
 d0 4c                 breq8	0x4c <L9>
 cc 02                 cmpi.s8	r4, 0x2
 d0 5e                 breq8	0x5e <L10>
 cc 03                 cmpi.s8	r4, 0x3
 d1 72                 brne8	0x72 <L11>
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a4                 tst8	r4
 c6 ff ff              ldi16	r6, 0xffff
 02                    mov	r4, r6
 fb 67                 cmov.ne	r4, r7
 0c                    mov	r7, r4
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 70                 jmp8	0x70 <L12>
<L8>:
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 d8 54                 bruge8	0x54 <L11>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 a4                 tst8	r4
 f0 04 ff ff           ldi16	r0, 0xffff
 f1 20                 mov	r4, r0
 fb 61                 cmov.ne	r4, r1
 f1 27                 mov	r5, r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 3c 02              stsp16	[sp+0x2], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 4a                 jmp8	0x4a <L13>
<L9>:
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c3 ff                 ldi8	r7, 0xff
 c2 7f                 ldi8	r6, 0x7f
 f4 a4                 tst8	r4
 fb 7e                 cmov.ne	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 2e                 jmp8	0x2e <L12>
<L10>:
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 16                 jmp8	0x16 <L12>
<L11>:
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
<L12>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
<L13>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f6 2c                 tst16	r4
 f8 0b                 cset.ne	r3
 f4 69                 stsp16	[sp+0xa], r5
 f9 74                 and	r3, r5
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 80              cmp32	q2, q0
 f0 32 04              ldsp16	r2, [sp+0x4]
 d0 73                 breq8	0x73 <L16>
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 31 f7              call16	__avm_scan_peek
 cc 30                 cmpi.s8	r4, 0x30
 d1 6a                 brne8	0x6a <L16>
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 4a f7              call16	__avm_scan_take
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 0d 01              breq16	0x10d <L23>
 f0 0e 10              cmpi.s8	r2, 0x10
 f0 03 01              ldi8	r3, 0x1
 d0 05                 breq8	0x5 <L14>
 f0 0e 08              cmpi.s8	r2, 0x8
 d1 52                 brne8	0x52 <L17>
<L14>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 ed 88 26              ld8u	r4, [r4+6]
 cc 6f                 cmpi.s8	r4, 0x6f
 d0 48                 breq8	0x48 <L17>
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 f4 f6              call16	__avm_scan_peek
 cc 78                 cmpi.s8	r4, 0x78
 d0 09                 breq8	0x9 <L15>
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 eb f6              call16	__avm_scan_peek
 cc 58                 cmpi.s8	r4, 0x58
 d1 36                 brne8	0x36 <L17>
<L15>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 04 f7              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 02 10              ldi8	r2, 0x10
 f2 4b                 sub	r3, r3
 e0 d3 00              jmp16	211 <L26>
<L16>:
 f2 4b                 sub	r3, r3
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 a4                 tst8	r4
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 32 26              ldsp16	r2, [sp+0x26]
 d1 12                 brne8	0x12 <L19>
<L17>:
 f0 0e 08              cmpi.s8	r2, 0x8
 da b3 00              breq16	0xb3 <L24>
<L18>:
 f0 0e 0a              cmpi.s8	r2, 0xa
 db 92 00              brne16	0x92 <L21>
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
<L19>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 ed 88 25              ld8u	r4, [r4+5]
 cc 04                 cmpi.s8	r4, 0x4
 d9 3d                 brsge8	0x3d <L20>
 cc 01                 cmpi.s8	r4, 0x1
 f0 30 0a              ldsp16	r0, [sp+0xa]
 da ce 00              breq16	0xce <L27>
 cc 02                 cmpi.s8	r4, 0x2
 d0 7a                 breq8	0x7a <L22>
 cc 03                 cmpi.s8	r4, 0x3
 d1 76                 brne8	0x76 <L22>
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f1 27                 mov	r5, r3
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f1 1d                 mov	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 e0 b4 00              jmp16	180 <L29>
<L20>:
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 d8 40                 bruge8	0x40 <L22>
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c6 99 99              ldi16	r6, 0x9999
 c7 99 19              ldi16	r7, 0x1999
 f1 0b                 mov	r1, r3
 f0 06 cc cc           ldi16	r2, 0xcccc
 f0 07 cc 0c           ldi16	r3, 0xccc
 f4 a4                 tst8	r4
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 99           ldi16	r3, 0x9999
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f1 19                 mov	r3, r1
 d4 6f                 jmp8	0x6f <L29>
<L21>:
 c0 04                 ldi8	r4, 0x4
 d4 19                 jmp8	0x19 <L25>
<L22>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c5 99 19              ldi16	r5, 0x1999
 c6 cc 0c              ldi16	r6, 0xccc
 d4 4c                 jmp8	0x4c <L28>
<L23>:
 f2 62                 mov32	q0, q2
 f0 03 01              ldi8	r3, 0x1
 f0 0e 08              cmpi.s8	r2, 0x8
 db 4d ff              brne16	-0xb3 <L18>
<L24>:
 c0 03                 ldi8	r4, 0x3
<L25>:
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
<L26>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e1 70 10              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f1 22                 mov	r4, r2
 f4 b4                 dec16	r4
 f9 80                 and	r4, r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 d4 35                 jmp8	0x35 <L30>
<L27>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c1 19                 ldi8	r5, 0x19
 c2 0c                 ldi8	r6, 0xc
<L28>:
 f4 a4                 tst8	r4
 fb 6e                 cmov.ne	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
<L29>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 24              stsp16	[sp+0x24], r4
 f9 10                 and	r0, r4
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f1 21                 mov	r4, r1
 c8 07                 addi.s8	r4, 0x7
 c1 05                 ldi8	r5, 0x5
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 02 0a              ldi8	r2, 0xa
<L30>:
 f4 a3                 tst8	r3
 f8 01                 cset.eq	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 8c              cmp32	q2, q3
 da 03 02              breq16	0x203 <L42>
 f2 30                 sub	r0, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 26              stsp16	[sp+0x26], r2
 d4 27                 jmp8	0x27 <L34>
<L31>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 06                 mov	r0, r6
<L32>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L33>:
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 48              cmp32	q1, q2
 f0 32 26              ldsp16	r2, [sp+0x26]
 da d5 01              breq16	0x1d5 <L43>
<L34>:
 f0 38 20              stsp16	[sp+0x20], r0
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 3a f5              call16	__avm_scan_peek
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d2 10                 brult8	0x10 <L35>
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 cd 06                 cmpi.s8	r5, 0x6
 f0 04 ff ff           ldi16	r0, 0xffff
 fc 04                 cmov.ult	r0, r4
<L35>:
 f6 28                 tst16	r0
 de db 01              brslt16	0x1db <L44>
 f5 02                 cmp	r0, r2
 df d6 01              brsge16	0x1d6 <L44>
 f0 38 28              stsp16	[sp+0x28], r0
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 30 f5              call16	__avm_scan_take
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 08              cmp32	q0, q2
 f8 17                 cset.ult	r7
 f0 69 80              cmp32	q2, q0
 fb 3e                 cmov.eq	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f7 67                 add32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 c2 01                 ldi8	r6, 0x1
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 a7                 tst8	r7
 db 64 ff              brne16	-0x9c <L31>
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0d                 cset.ne	r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 32 28              ldsp16	r2, [sp+0x28]
 f5 22                 cmp	r4, r2
 f8 1e                 cset.uge	r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 db 99 00              brne16	0x99 <L37>
 96                    or	r5, r6
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 7b                 breq8	0x7b <L36>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 a4                 tst8	r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 03                    mov	r4, r7
 a5                    xor	r5, r5
 da 99 00              breq16	0x99 <L38>
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6a                 mov32	q3, q0
 e1 1c 0e              call16	__avm_mulsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 9f                 lsr16i	r6, 0xf
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 f4 6a                 stsp16	[sp+0xa], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 2b                 ldsp16	r7, [sp+0xa]
 9e                    or	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 e1 d8 0d              call16	__avm_mulsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f7 61                 add32	q0, q1
 f0 32 28              ldsp16	r2, [sp+0x28]
 e0 8a 00              jmp16	138 <L41>
<L36>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 00 01              ldi8	r0, 0x1
 e0 b2 fe              jmp16	-334 <L33>
<L37>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 00 01              ldi8	r0, 0x1
 e0 9c fe              jmp16	-356 <L33>
<L38>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 cc 08                 cmpi.s8	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 a5                    xor	r5, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 3d 22              stsp16	[sp+0x22], r5
 d1 26                 brne8	0x26 <L39>
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 7d                 lsr16i	r4, 0xd
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 9c                    or	r7, r4
 fa 9d                 lsr16i	r6, 0xd
 f0 34 20              ldsp16	r4, [sp+0x20]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 92                    or	r4, r6
 f1 07                 mov	r0, r7
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 d4 20                 jmp8	0x20 <L40>
<L39>:
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 7c                 lsr16i	r4, 0xc
 0e                    mov	r7, r6
 fa 64                 lsl16i	r7, 0x4
 9c                    or	r7, r4
 fa 9c                 lsr16i	r6, 0xc
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 34                 lsl16i	r4, 0x4
 92                    or	r4, r6
 f1 07                 mov	r0, r7
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 34                 lsl16i	r4, 0x4
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 9c                    or	r7, r4
 fa 54                 lsl16i	r6, 0x4
<L40>:
 02                    mov	r4, r6
 07                    mov	r5, r7
<L41>:
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 e0 1e fe              jmp16	-482 <L32>
<L42>:
 f4 a3                 tst8	r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d0 58                 breq8	0x58 <L45>
<L43>:
 c0 01                 ldi8	r4, 0x1
 f0 30 34              ldsp16	r0, [sp+0x34]
 ed a0 24              ld8u	r5, [r0+4]
 f4 a5                 tst8	r5
 d1 4d                 brne8	0x4d <L46>
 ed a0 26              ld8u	r5, [r0+6]
 cd 70                 cmpi.s8	r5, 0x70
 d1 4d                 brne8	0x4d <L47>
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 aa                    xor	r6, r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f2 58                 sub	r6, r0
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f6 2f                 tst16	r7
 fb 46                 cmov.ne	r0, r6
 65                    ld16	r5, [r5]
 f5 54                 st16	[r5], r0
 d4 2c                 jmp8	0x2c <L46>
<L44>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f4 a1                 tst8	r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d0 a8                 breq8	-0x58 <L43>
<L45>:
 a0                    xor	r4, r4
<L46>:
 d6 36                 adjsp	0x36
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L47>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 74                 sub32	q1, q0
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f6 2d                 tst16	r5
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f2 61                 mov32	q0, q1
 f8 0d                 cset.ne	r5
 f1 15                 mov	r2, r5
 f7 67                 add32	q1, q3
 f7 71                 sub32	q0, q1
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f6 2d                 tst16	r5
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f0 35 34              ldsp16	r5, [sp+0x34]
 ed aa 25              ld8u	r5, [r5+5]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 ce 69                 cmpi.s8	r6, 0x69
 d0 04                 breq8	0x4 <L48>
 ce 64                 cmpi.s8	r6, 0x64
 d1 13                 brne8	0x13 <L49>
<L48>:
 cd 04                 cmpi.s8	r5, 0x4
 d3 13                 brslt8	0x13 <L50>
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d0 4a                 breq8	0x4a <L53>
 cd 05                 cmpi.s8	r5, 0x5
 d0 46                 breq8	0x46 <L53>
 cd 07                 cmpi.s8	r5, 0x7
 d4 32                 jmp8	0x32 <L52>
<L49>:
 cd 04                 cmpi.s8	r5, 0x4
 d9 21                 brsge8	0x21 <L51>
<L50>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d0 4e                 breq8	0x4e <L54>
 cd 02                 cmpi.s8	r5, 0x2
 d0 23                 breq8	0x23 <L52>
 cd 03                 cmpi.s8	r5, 0x3
 d1 1f                 brne8	0x1f <L52>
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b ca              st32	[r5], q3
 e0 7b ff              jmp16	-133 <L46>
<L51>:
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d0 16                 breq8	0x16 <L53>
 cd 05                 cmpi.s8	r5, 0x5
 d0 12                 breq8	0x12 <L53>
 cd 06                 cmpi.s8	r5, 0x6
<L52>:
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 76                    st16	[r5], r6
 e0 5e ff              jmp16	-162 <L46>
<L53>:
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f0 6b 0a              st32	[r5], q0
 e0 47 ff              jmp16	-185 <L46>
<L54>:
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 56                    st8	[r5], r6
 e0 3a ff              jmp16	-198 <L46>

<__avm_scan_float>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f1 1e                 mov	r3, r6
 f1 15                 mov	r2, r5
 f0 6a 04              ld32	q0, [r2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 54                 breq8	0x54 <L1>
 f4 68                 stsp16	[sp+0xa], r4
 e1 35 f2              call16	__avm_scan_peek
 cc ff                 cmpi.s8	r4, -0x1
 da 24 06              breq16	0x624 <L52>
 cc 2b                 cmpi.s8	r4, 0x2b
 c1 01                 ldi8	r5, 0x1
 f0 3d 14              stsp16	[sp+0x14], r5
 af                    xor	r7, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 d0 08                 breq8	0x8 <L0>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 3f                 brne8	0x3f <L2>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
<L0>:
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 32 f2              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 29                 brne8	0x29 <L3>
 f0 3b 2e              stsp16	[sp+0x2e], r3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c2 01                 ldi8	r6, 0x1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 30 0a              ldsp16	r0, [sp+0xa]
 aa                    xor	r6, r6
 e0 48 01              jmp16	328 <L12>
<L1>:
 c4 ff ff              ldi16	r4, 0xffff
 e0 d4 05              jmp16	1492 <L52>
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
<L3>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f1 20                 mov	r4, r0
 e1 ca f1              call16	__avm_scan_peek
 f1 14                 mov	r2, r4
 c0 20                 ldi8	r4, 0x20
 f9 51                 or	r2, r4
 f1 20                 mov	r4, r0
 e1 bf f1              call16	__avm_scan_peek
 f0 0e 6e              cmpi.s8	r2, 0x6e
 d0 2a                 breq8	0x2a <L4>
 f0 0e 69              cmpi.s8	r2, 0x69
 d1 4a                 brne8	0x4a <L5>
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 49                 cmpi.s8	r5, 0x49
 db 9c 05              brne16	0x59c <L52>
 f1 10                 mov	r2, r0
 f1 22                 mov	r4, r2
 e1 c3 f1              call16	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 db 9f 00              brne16	0x9f <L7>
 a0                    xor	r4, r4
 e0 84 05              jmp16	1412 <L52>
<L4>:
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 4e                 cmpi.s8	r5, 0x4e
 db 77 05              brne16	0x577 <L52>
 f1 10                 mov	r2, r0
 f1 22                 mov	r4, r2
 e1 9e f1              call16	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 db 9c 00              brne16	0x9c <L8>
 a0                    xor	r4, r4
 e0 5f 05              jmp16	1375 <L52>
<L5>:
 f0 3b 2e              stsp16	[sp+0x2e], r3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c2 01                 ldi8	r6, 0x1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 cc 30                 cmpi.s8	r4, 0x30
 d1 55                 brne8	0x55 <L6>
 f1 20                 mov	r4, r0
 e1 72 f1              call16	__avm_scan_take
 f1 10                 mov	r2, r0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 87 00              breq16	0x87 <L9>
 f1 22                 mov	r4, r2
 e1 33 f1              call16	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 84                    and	r5, r4
 cd 58                 cmpi.s8	r5, 0x58
 db 80 00              brne16	0x80 <L10>
 f1 22                 mov	r4, r2
 e1 47 f1              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 c2 04                 ldi8	r6, 0x4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 02                 mov	r0, r2
 aa                    xor	r6, r6
 d4 62                 jmp8	0x62 <L12>
<L6>:
 c0 01                 ldi8	r4, 0x1
 f4 60                 stsp16	[sp+0x8], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 d4 57                 jmp8	0x57 <L12>
<L7>:
 f1 22                 mov	r4, r2
 e1 f0 f0              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 db e4 04              brne16	0x4e4 <L53>
 f1 22                 mov	r4, r2
 e1 06 f1              call16	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 db db 04              brne16	0x4db <L56>
 a0                    xor	r4, r4
 e0 c7 04              jmp16	1223 <L52>
<L8>:
 f1 22                 mov	r4, r2
 e1 ce f0              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 41                 cmpi.s8	r4, 0x41
 db c5 04              brne16	0x4c5 <L54>
 f1 22                 mov	r4, r2
 e1 e4 f0              call16	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 db 0f 05              brne16	0x50f <L57>
 a0                    xor	r4, r4
 e0 a5 04              jmp16	1189 <L52>
<L9>:
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 aa                    xor	r6, r6
 d4 07                 jmp8	0x7 <L11>
<L10>:
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 aa                    xor	r6, r6
<L11>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f1 02                 mov	r0, r2
<L12>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3e 22              stsp16	[sp+0x22], r6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 54                 breq8	0x54 <L15>
<L13>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 f1 0e                 mov	r1, r6
 e1 6e f0              call16	__avm_scan_peek
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 d1 2a                 brne8	0x2a <L14>
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 26                 brne8	0x26 <L14>
 f1 20                 mov	r4, r0
 e1 81 f0              call16	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 2b                 breq8	0x2b <L16>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 e1 43 f0              call16	__avm_scan_peek
 f0 01 01              ldi8	r1, 0x1
 f1 2d                 mov	r7, r1
<L14>:
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 36 14              ldsp16	r6, [sp+0x14]
 d8 23                 bruge8	0x23 <L18>
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 f6 28                 tst16	r0
 de 6a 02              brslt16	0x26a <L38>
 d4 31                 jmp8	0x31 <L19>
<L15>:
 f1 0e                 mov	r1, r6
 d4 03                 jmp8	0x3 <L17>
<L16>:
 f0 01 01              ldi8	r1, 0x1
<L17>:
 c4 ff ff              ldi16	r4, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 f0 36 14              ldsp16	r6, [sp+0x14]
<L18>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 04                 cmov.ult	r0, r4
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 f6 28                 tst16	r0
 de 37 02              brslt16	0x237 <L38>
<L19>:
 f4 21                 ldsp16	r5, [sp+0x8]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 db 2f 02              brne16	0x22f <L38>
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 0f                 mov	r1, r7
 e1 04 f0              call16	__avm_scan_take
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 a1                 tst8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 77                 sub32	q1, q3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 db f4 00              brne16	0xf4 <L26>
 f6 28                 tst16	r0
 db ef 00              brne16	0xef <L26>
<L20>:
 f0 69 84              cmp32	q2, q1
 d0 5b                 breq8	0x5b <L22>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f1 20                 mov	r4, r0
 e1 82 ef              call16	__avm_scan_peek
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 d1 2f                 brne8	0x2f <L21>
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 2b                 brne8	0x2b <L21>
 f1 20                 mov	r4, r0
 e1 92 ef              call16	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d0 28                 breq8	0x28 <L23>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 e1 4f ef              call16	__avm_scan_peek
 f0 01 01              ldi8	r1, 0x1
 f1 2d                 mov	r7, r1
<L21>:
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d8 1d                 bruge8	0x1d <L24>
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 de 70 01              brslt16	0x170 <L36>
 d4 2b                 jmp8	0x2b <L25>
<L22>:
 f0 31 1e              ldsp16	r1, [sp+0x1e]
<L23>:
 c4 ff ff              ldi16	r4, 0xffff
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
<L24>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 04                 cmov.ult	r0, r4
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 de 43 01              brslt16	0x143 <L36>
<L25>:
 f4 21                 ldsp16	r5, [sp+0x8]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 db 37 01              brne16	0x137 <L35>
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3f 10              stsp16	[sp+0x10], r7
 e1 17 ef              call16	__avm_scan_take
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 00 36              ldi16	r6, 0x3600
 c7 65 c4              ldi16	r7, 0xc465
 f0 69 c8              cmp32	q3, q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 14              stsp16	[sp+0x14], r0
 f2 61                 mov32	q0, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f2 6b                 mov32	q3, q1
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f7 7b                 sub32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f6 28                 tst16	r0
 da 1f ff              breq16	-0xe1 <L20>
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f2 67                 mov32	q1, q3
 d4 06                 jmp8	0x6 <L27>
<L26>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L27>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 d0 33                 breq8	0x33 <L28>
 c0 09                 ldi8	r4, 0x9
 f0 35 18              ldsp16	r5, [sp+0x18]
 cd 27                 cmpi.s8	r5, 0x27
 d8 4b                 bruge8	0x4b <L32>
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 a5                 tst8	r5
 d1 3c                 brne8	0x3c <L31>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 06 21 1e           ldi16	r2, 0x1e21
 f0 03 00              ldi8	r3, 0x0
 f7 6d                 add32	q3, q1
 f0 61 ac              ldp8s	r5, [q3]
 c9 d0                 addi.s8	r5, -0x30
 f5 05                 cmp	r0, r5
 d1 0a                 brne8	0xa <L29>
 a5                    xor	r5, r5
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 10                 jmp8	0x10 <L30>
<L28>:
 c0 08                 ldi8	r4, 0x8
 d4 1d                 jmp8	0x1d <L32>
<L29>:
 c7 ff ff              ldi16	r7, 0xffff
 c2 01                 ldi8	r6, 0x1
 f5 24                 cmp	r5, r0
 fd 3e                 cmov.slt	r7, r6
 f0 3f 22              stsp16	[sp+0x22], r7
<L30>:
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L31>:
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 ad                 inc16	r5
 f0 3d 18              stsp16	[sp+0x18], r5
<L32>:
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 34                    cmp	r5, r4
 d2 3e                 brult8	0x3e <L34>
 c4 00 ca              ldi16	r4, 0xca00
 c5 9a 3b              ldi16	r5, 0x3b9a
 f1 2c                 mov	r7, r0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 48              cmp32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f7 61                 add32	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 16              ldsp16	r4, [sp+0x16]
 93                    or	r4, r7
 f0 3c 16              stsp16	[sp+0x16], r4
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
<L33>:
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db 83 fd              brne16	-0x27d <L13>
 e0 d4 fd              jmp16	-556 <L15>
<L34>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 e1 92 07              call16	__avm_mulsi3
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 ac                 inc16	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d4 bc                 jmp8	-0x44 <L33>
<L35>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 02                 jmp8	0x2 <L37>
<L36>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L37>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
<L38>:
 f0 01 01              ldi8	r1, 0x1
 a0                    xor	r4, r4
 f4 a6                 tst8	r6
 db a8 01              brne16	0x1a8 <L52>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 da ee 00              breq16	0xee <L44>
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 00 70              ldi8	r0, 0x70
 c0 65                 ldi8	r4, 0x65
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 a5                 tst8	r5
 fb 44                 cmov.ne	r0, r4
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 22                 mov	r4, r2
 e1 8d ed              call16	__avm_scan_peek
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f5 20                 cmp	r4, r0
 db cd 00              brne16	0xcd <L44>
 f0 39 14              stsp16	[sp+0x14], r1
 f1 22                 mov	r4, r2
 e1 9f ed              call16	__avm_scan_take
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 68 01              breq16	0x168 <L55>
 f1 22                 mov	r4, r2
 e1 62 ed              call16	__avm_scan_peek
 f1 1c                 mov	r3, r4
 f0 0f 2d              cmpi.s8	r3, 0x2d
 d0 05                 breq8	0x5 <L39>
 f0 0f 2b              cmpi.s8	r3, 0x2b
 d1 23                 brne8	0x23 <L40>
<L39>:
 f1 22                 mov	r4, r2
 e1 73 ed              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 62                 add32	q0, q2
 f0 0f 2d              cmpi.s8	r3, 0x2d
 f8 0c                 cset.ne	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da b5 01              breq16	0x1b5 <L59>
<L40>:
 f1 22                 mov	r4, r2
 e1 2e ed              call16	__avm_scan_peek
 04                    mov	r5, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 a0                    xor	r4, r4
 dd 19 01              bruge16	0x119 <L52>
<L41>:
 f1 15                 mov	r2, r5
 c4 ff e0              ldi16	r4, 0xe0ff
 c5 f5 05              ldi16	r5, 0x5f5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 d3 19                 brslt8	0x19 <L42>
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 b2 06              call16	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 c4 d0 ff              ldi16	r4, 0xffd0
 c5 ff ff              ldi16	r5, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
<L42>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 14                 mov	r2, r4
 e1 12 ed              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 0c                 breq8	0xc <L43>
 f1 22                 mov	r4, r2
 e1 dc ec              call16	__avm_scan_peek
 04                    mov	r5, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 d2 b0                 brult8	-0x50 <L41>
<L43>:
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 77                 sub32	q1, q3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 66                 add32	q1, q2
 d4 06                 jmp8	0x6 <L45>
<L44>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L45>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 27                 cmpi.s8	r4, 0x27
 f8 1d                 cset.uge	r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 0c              cmp32	q0, q3
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 d0 27                 breq8	0x27 <L46>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 d0 27                 breq8	0x27 <L47>
 91                    or	r4, r5
 d6 fc                 adjsp	-0x4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 41                 stsp16	[sp+0x0], r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 f4 a5                 tst8	r5
 f8 2d                 cset.sge	r5
 84                    and	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6b                 mov32	q3, q1
 e1 69 04              call16	__avm_decimal_value
 d6 04                 adjsp	0x4
 d4 1a                 jmp8	0x1a <L48>
<L46>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f1 18                 mov	r3, r0
 d4 3a                 jmp8	0x3a <L50>
<L47>:
 d6 fe                 adjsp	-0x2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f2 6b                 mov32	q3, q1
 e1 03 02              call16	__avm_hex_value
 d6 02                 adjsp	0x2
<L48>:
 c6 00 00              ldi16	r6, 0x0
 f6 2e                 tst16	r6
 f1 18                 mov	r3, r0
 d0 1d                 breq8	0x1d <L50>
 f1 11                 mov	r2, r1
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d2 06                 brult8	0x6 <L49>
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
<L49>:
 f1 0a                 mov	r1, r2
<L50>:
 f0 00 01              ldi8	r0, 0x1
 ed e2 24              ld8u	r7, [r1+4]
 f4 a7                 tst8	r7
 d1 12                 brne8	0x12 <L51>
 ed d6 20              ld16	r6, [r3+0]
 0e                    mov	r7, r6
 cb 02                 addi.s8	r7, 0x2
 ee f6 20              st16	[r3+0], r7
 f0 33 26              ldsp16	r3, [sp+0x26]
 f9 ad                 or	r5, r3
 6a                    ld16	r6, [r6]
 f0 6b 8c              st32	[r6], q2
<L51>:
 f1 20                 mov	r4, r0
<L52>:
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L53>:
 a0                    xor	r4, r4
 d4 f6                 jmp8	-0xa <L52>
<L54>:
 a0                    xor	r4, r4
 d4 f3                 jmp8	-0xd <L52>
<L55>:
 a0                    xor	r4, r4
 d4 f0                 jmp8	-0x10 <L52>
<L56>:
 f1 22                 mov	r4, r2
 e1 f7 eb              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 46                 cmpi.s8	r4, 0x46
 d1 77                 brne8	0x77 <L60>
 f1 22                 mov	r4, r2
 e1 0e ec              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d0 56                 breq8	0x56 <L58>
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f1 22                 mov	r4, r2
 e1 d2 eb              call16	__avm_scan_peek
 f0 04 df ff           ldi16	r0, 0xffdf
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 db c9 00              brne16	0xc9 <L65>
 f1 22                 mov	r4, r2
 e1 c2 eb              call16	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 db d3 00              brne16	0xd3 <L68>
 f1 22                 mov	r4, r2
 e1 d8 eb              call16	__avm_scan_take
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 db c9 00              brne16	0xc9 <L70>
 a0                    xor	r4, r4
 d4 9a                 jmp8	-0x66 <L52>
<L57>:
 f1 22                 mov	r4, r2
 e1 a1 eb              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 d1 25                 brne8	0x25 <L61>
 f1 22                 mov	r4, r2
 e1 b8 eb              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d1 12                 brne8	0x12 <L62>
<L58>:
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e0 54 ff              jmp16	-172 <L50>
<L59>:
 a0                    xor	r4, r4
 e0 6e ff              jmp16	-146 <L52>
<L60>:
 a0                    xor	r4, r4
 e0 6a ff              jmp16	-150 <L52>
<L61>:
 a0                    xor	r4, r4
 e0 66 ff              jmp16	-154 <L52>
<L62>:
 f1 22                 mov	r4, r2
 e1 6d eb              call16	__avm_scan_peek
 cc 28                 cmpi.s8	r4, 0x28
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 d1 75                 brne8	0x75 <L67>
 f1 22                 mov	r4, r2
 e1 83 eb              call16	__avm_scan_take
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 68                 breq8	0x68 <L69>
 f0 32 0a              ldsp16	r2, [sp+0xa]
 d4 17                 jmp8	0x17 <L64>
<L63>:
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 22                 mov	r4, r2
 e1 61 eb              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 74                 breq8	0x74 <L72>
<L64>:
 f1 22                 mov	r4, r2
 e1 2b eb              call16	__avm_scan_peek
 f1 14                 mov	r2, r4
 f0 0e ff              cmpi.s8	r2, -0x1
 d0 64                 breq8	0x64 <L71>
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 e1 f7 f1              call16	isalnum
 f0 0e 5f              cmpi.s8	r2, 0x5f
 d0 d1                 breq8	-0x2f <L63>
 f6 2c                 tst16	r4
 d1 cd                 brne8	-0x33 <L63>
 f0 0e 29              cmpi.s8	r2, 0x29
 a0                    xor	r4, r4
 db 01 ff              brne16	-0xff <L52>
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 2a eb              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e0 d4 fe              jmp16	-300 <L50>
<L65>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
<L66>:
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e0 c7 fe              jmp16	-313 <L50>
<L67>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f1 0e                 mov	r1, r6
 e0 be fe              jmp16	-322 <L50>
<L68>:
 a0                    xor	r4, r4
 e0 d8 fe              jmp16	-296 <L52>
<L69>:
 a0                    xor	r4, r4
 e0 d4 fe              jmp16	-300 <L52>
<L70>:
 f1 22                 mov	r4, r2
 e1 db ea              call16	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 4e                 cmpi.s8	r4, 0x4e
 d1 1d                 brne8	0x1d <L73>
 f1 22                 mov	r4, r2
 e1 f2 ea              call16	__avm_scan_take
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 10                 brne8	0x10 <L74>
 a0                    xor	r4, r4
 e0 b4 fe              jmp16	-332 <L52>
<L71>:
 a0                    xor	r4, r4
 e0 b0 fe              jmp16	-336 <L52>
<L72>:
 a0                    xor	r4, r4
 e0 ac fe              jmp16	-340 <L52>
<L73>:
 a0                    xor	r4, r4
 e0 a8 fe              jmp16	-344 <L52>
<L74>:
 f1 22                 mov	r4, r2
 e1 af ea              call16	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 d1 15                 brne8	0x15 <L75>
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 c6 ea              call16	__avm_scan_take
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 08                 brne8	0x8 <L76>
 a0                    xor	r4, r4
 e0 88 fe              jmp16	-376 <L52>
<L75>:
 a0                    xor	r4, r4
 e0 84 fe              jmp16	-380 <L52>
<L76>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 8b ea              call16	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 81                    and	r4, r5
 cc 54                 cmpi.s8	r4, 0x54
 d1 15                 brne8	0x15 <L77>
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 a0 ea              call16	__avm_scan_take
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 08                 brne8	0x8 <L78>
 a0                    xor	r4, r4
 e0 62 fe              jmp16	-414 <L52>
<L77>:
 a0                    xor	r4, r4
 e0 5e fe              jmp16	-418 <L52>
<L78>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 65 ea              call16	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 81                    and	r4, r5
 cc 59                 cmpi.s8	r4, 0x59
 a0                    xor	r4, r4
 db 4f fe              brne16	-0x1b1 <L52>
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 78 ea              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 55 ff              jmp16	-171 <L66>

<__avm_hex_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f0 00 10              ldi8	r0, 0x10
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 f2 39                 sub	r1, r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 fc 37                 cmov.ult	r6, r7
 fc 39                 cmov.ult	r7, r1
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 69 c0              cmp32	q3, q0
 d2 14                 brult8	0x14 <L0>
 c0 08                 ldi8	r4, 0x8
 f9 51                 or	r2, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 09                    mov	r6, r5
 0c                    mov	r7, r4
<L0>:
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 13                 brult8	0x13 <L1>
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4c                 lsl16i	r5, 0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 74                 lsr16i	r4, 0x4
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 04              addi.s8	r2, 0x4
<L1>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 13                 brult8	0x13 <L2>
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 72                 lsr16i	r4, 0x2
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 02              addi.s8	r2, 0x2
<L2>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 f8 10                 cset.ult	r0
 f2 02                 add	r0, r2
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 6d                 add32	q3, q1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 7f                 ldi8	r4, 0x7f
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 de 2a 01              brslt16	0x12a <L13>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 6a ff              ldi16	r6, 0xff6a
 c7 ff ff              ldi16	r7, 0xffff
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d9 05                 brsge8	0x5 <L4>
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 0e 01              jmp16	270 <L12>
<L4>:
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 d3 2f                 brslt8	0x2f <L5>
 f0 07 6b ff           ldi16	r3, 0xff6b
 f2 4a                 sub	r3, r2
 f0 0f 01              cmpi.s8	r3, 0x1
 de a1 00              brslt16	0xa1 <L8>
 f0 0f 21              cmpi.s8	r3, 0x21
 d8 db                 bruge8	-0x25 <L3>
 c4 4b ff              ldi16	r4, 0xff4b
 f4 22                 ldsp16	r6, [sp+0x8]
 38                    cmp	r6, r4
 02                    mov	r4, r6
 db f3 00              brne16	0xf3 <L14>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 8c              cmp32	q2, q3
 dd 30 01              bruge16	0x130 <L16>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e0 d0 00              jmp16	208 <L12>
<L5>:
 f0 0c 18              cmpi.s8	r0, 0x18
 d8 2e                 bruge8	0x2e <L6>
 f0 01 17              ldi8	r1, 0x17
 f2 38                 sub	r1, r0
 c3 0f                 ldi8	r7, 0xf
 f1 21                 mov	r4, r1
 83                    and	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 ac                    xor	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 fa 1b                 lsr16v	r6, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 fa 07                 shl16v	r5, r7
 96                    or	r5, r6
 c2 10                 ldi8	r6, 0x10
 f9 38                 and	r1, r6
 fa 03                 shl16v	r4, r7
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 d4 71                 jmp8	0x71 <L10>
<L6>:
 f1 20                 mov	r4, r0
 c8 e8                 addi.s8	r4, -0x18
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 63 02              call16	__avm_ashlsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 57 02              call16	__avm_ashlsi3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 66                 add32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 08 e9              addi.s8	r0, -0x17
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e1 68 02              call16	__avm_lshrsi3
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d8 17                 bruge8	0x17 <L9>
<L7>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 d4 26                 jmp8	0x26 <L10>
<L8>:
 c0 95                 ldi8	r4, 0x95
 f2 14                 add	r2, r4
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 1a 02              call16	__avm_ashlsi3
 d4 42                 jmp8	0x42 <L12>
<L9>:
 f0 69 c8              cmp32	q3, q2
 d1 11                 brne8	0x11 <L10>
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 dd                 brne8	-0x23 <L7>
 f2 61                 mov32	q0, q1
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 d3                 brne8	-0x2d <L7>
<L10>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f0 69 40              cmp32	q1, q0
 f8 06                 cset.eq	r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c0 7f                 ldi8	r4, 0x7f
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d3 14                 brslt8	0x14 <L13>
 c0 7f                 ldi8	r4, 0x7f
 f9 8c                 and	r4, r3
 fa 57                 lsl16i	r6, 0x7
 98                    or	r6, r4
 0e                    mov	r7, r6
 f1 2a                 mov	r6, r2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
<L11>:
 f7 6b                 add32	q2, q3
<L12>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
<L13>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L14>:
 08                    mov	r6, r4
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 b6 01              call16	__avm_ashlsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 aa 01              call16	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 e1 be 01              call16	__avm_lshrsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 d8 19                 bruge8	0x19 <L17>
<L15>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d4 a4                 jmp8	-0x5c <L11>
<L16>:
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 d4 96                 jmp8	-0x6a <L12>
<L17>:
 f0 69 08              cmp32	q0, q2
 d1 95                 brne8	-0x6b <L13>
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 db                 brne8	-0x25 <L15>
 f4 02                 ldsp16	r6, [sp+0x0]
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d0 85                 breq8	-0x7b <L13>
 d4 d0                 jmp8	-0x30 <L15>

<__avm_decimal_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 19              ldsp16	r4, [sp+0x19]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 36 1b              ldsp16	r6, [sp+0x1b]
 f0 00 27              ldi8	r0, 0x27
 f2 39                 sub	r1, r1
 f0 69 08              cmp32	q0, q2
 de bd 00              brslt16	0xbd <L7>
 f6 2e                 tst16	r6
 d0 06                 breq8	0x6 <L0>
 f0 69 80              cmp32	q2, q0
 da b3 00              breq16	0xb3 <L7>
<L0>:
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 69 08              cmp32	q0, q2
 d9 07                 brsge8	0x7 <L1>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 9b 00              jmp16	155 <L7>
<L1>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 ff 11                 u32tof
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 03                    mov	r4, r7
 f2 50                 sub	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 f2 68                 mov32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 08                    mov	r6, r4
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 fd 34                 cmov.slt	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 c2 05                 ldi8	r6, 0x5
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 49 1e           ldi16	r0, 0x1e49
 f0 01 00              ldi8	r1, 0x0
 d4 21                 jmp8	0x21 <L5>
<L2>:
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
<L3>:
 f4 2a                 ldsp16	r6, [sp+0xa]
<L4>:
 f4 b6                 dec16	r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 af                 inc16	r7
 cf 06                 cmpi.s8	r7, 0x6
 d0 32                 breq8	0x32 <L6>
<L5>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 6a                 stsp16	[sp+0xa], r6
 f4 5b                 stsp16	[sp+0x6], r7
 fb 77                 cmov.ne	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 c2 01                 ldi8	r6, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 df                 breq8	-0x21 <L3>
 f4 a4                 tst8	r4
 d1 c6                 brne8	-0x3a <L2>
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 66                 mov32	q1, q2
 d4 c4                 jmp8	-0x3c <L4>
<L6>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
<L7>:
 f2 69                 mov32	q2, q1
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_terminate>:
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
 e1 f0 e3              call16	-7184 <__avm_run_local_dtors>
<L0>:
 c4 61 1e              ldi16	r4, 0x1e61
 c1 00                 ldi8	r5, 0x0
 c6 61 1e              ldi16	r6, 0x1e61
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 61 1e           ldi16	r2, 0x1e61
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 61 1e           ldi16	r0, 0x1e61
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
 e1 a7 e3              call16	-7257 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
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
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
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
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f0 36 17              ldsp16	r6, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 46                 breq8	0x46 <L1>
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f9 c9                 or	r6, r2
 f1 16                 mov	r2, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 aa                    xor	r6, r6
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 77                 sub32	q1, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 6a                 add32	q2, q2
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d1 cc                 brne8	-0x34 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 d5 81                 call8	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d8 5d                 bruge8	0x5d <L2>
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 12                 brult8	0x12 <L0>
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e1 be fe              call16	__avm_lshrsi3
 f2 30                 sub	r0, r0
 d4 46                 jmp8	0x46 <L2>
<L0>:
 f6 2a                 tst16	r2
 d0 3c                 breq8	0x3c <L1>
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 63                 mov32	q0, q3
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 a2 fe              call16	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 67 fe              call16	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 80 fe              call16	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	0x6 <L2>
<L1>:
 f2 63                 mov32	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
<L2>:
 f2 6a                 mov32	q3, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
