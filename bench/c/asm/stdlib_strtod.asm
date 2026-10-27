
stdlib_strtod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_strtod.c
00000103 l     O .data	00000010 inputs
00000100 l     O .data	00000003 call
00000113 l     O .data	00000004 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000b34 l     O .rodata	00000028 decimal_overflows.threshold
00000b1c l     O .rodata	00000018 decimal_value.powers
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000b5c l       .init_array	00000000 .hidden __init_array_end
00000b5c l       .init_array	00000000 .hidden __init_array_start
00000b5c l       .fini_array	00000000 .hidden __fini_array_start
00000b5c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000069 avm_test_main
000009f3 g     F .text	00000065 __avm_terminate
000002d0 g     F .text	00000002 avm_halt
0000016a g     O .data	00000002 __avm_errno
000009f0 g     F .text	00000003 strtod
000002d2 g     F .text	00000011 isalnum
000002e3 g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000ab0 g     F .text	0000006c __avm_mulsi3
000002ef g     F .text	00000701 strtof
00000a58 g     F .text	0000002c __avm_ashlsi3
00000a84 g     F .text	0000002c __avm_lshrsi3

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
 e1 dd 07              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ad 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5c 0b              ldi16	r4, 0xb5c
 c1 00                 ldi8	r5, 0x0
 c6 5c 0b              ldi16	r6, 0xb5c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5c 0b           ldi16	r0, 0xb5c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5c 0b           ldi16	r2, 0xb5c
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
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c6 03 01              ldi16	r6, 0x103
 c7 00 01              ldi16	r7, 0x100
 f1 05                 mov	r0, r5
<L0>:
 f0 38 00              stsp16	[sp+0x0], r0
 f1 0d                 mov	r1, r5
<L1>:
 f0 5d 6a 01           stm16	[0x16a], r5
 f1 21                 mov	r4, r1
 12                    add	r4, r6
 f5 40                 ld16	r0, [r4]
 03                    mov	r4, r7
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 15 02              leasp	r5, 0x2
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f2 58                 sub	r6, r0
 f0 57 6a 01           ldm16	r7, [0x16a]
 1e                    add	r7, r6
 c6 03 01              ldi16	r6, 0x103
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 c7 00 01              ldi16	r7, 0x100
 f7 66                 add32	q1, q2
 a5                    xor	r5, r5
 f0 09 02              addi.s8	r1, 0x2
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 cb                 brne8	-0x35 <L1>
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 bc                 brne8	-0x44 <L0>
 c4 13 01              ldi16	r4, 0x113
 f0 6b 48              st32	[r4], q1
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

<strtof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f1 0c                 mov	r1, r4
 f6 2d                 tst16	r5
 d0 02                 breq8	0x2 <L0>
 f5 55                 st16	[r5], r1
<L0>:
 f0 3d 16              stsp16	[sp+0x16], r5
<L1>:
 f1 01                 mov	r0, r1
 f0 6c 83              ld8u	r4, [r1+]
 d5 dc                 call8	isspace
 f6 2c                 tst16	r4
 d1 f5                 brne8	-0xb <L1>
 ed 80 20              ld8u	r4, [r0+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L2>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 1c                 brne8	0x1c <L3>
<L2>:
 a5                    xor	r5, r5
 c6 00 80              ldi16	r6, 0x8000
 cc 2d                 cmpi.s8	r4, 0x2d
 fb 2e                 cmov.eq	r5, r6
 f0 39 1c              stsp16	[sp+0x1c], r1
 ed 82 20              ld8u	r4, [r1+0]
 f1 1d                 mov	r3, r5
 f2 42                 sub	r2, r2
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d0 73                 breq8	0x73 <L7>
 d4 0f                 jmp8	0xf <L4>
<L3>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d0 62                 breq8	0x62 <L7>
<L4>:
 cd 69                 cmpi.s8	r5, 0x69
 db b8 00              brne16	0xb8 <L13>
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ed ca 21              ld8u	r6, [r5+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 db aa 00              brne16	0xaa <L13>
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ed cc 22              ld8u	r6, [r6+2]
 89                    and	r6, r5
 ce 46                 cmpi.s8	r6, 0x46
 db 9e 00              brne16	0x9e <L13>
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 ed ce 23              ld8u	r6, [r7+3]
 89                    and	r6, r5
 03                    mov	r4, r7
 c8 03                 addi.s8	r4, 0x3
 ce 49                 cmpi.s8	r6, 0x49
 d1 23                 brne8	0x23 <L5>
 ed ce 24              ld8u	r6, [r7+4]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d1 1b                 brne8	0x1b <L5>
 ed ce 25              ld8u	r6, [r7+5]
 89                    and	r6, r5
 ce 49                 cmpi.s8	r6, 0x49
 d1 13                 brne8	0x13 <L5>
 ed ce 26              ld8u	r6, [r7+6]
 89                    and	r6, r5
 ce 54                 cmpi.s8	r6, 0x54
 d1 0b                 brne8	0xb <L5>
 ed ce 27              ld8u	r6, [r7+7]
 89                    and	r6, r5
 ce 59                 cmpi.s8	r6, 0x59
 d1 03                 brne8	0x3 <L5>
 cb 08                 addi.s8	r7, 0x8
 03                    mov	r4, r7
<L5>:
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 2d                 tst16	r5
 d0 01                 breq8	0x1 <L6>
 74                    st16	[r5], r4
<L6>:
 c4 80 7f              ldi16	r4, 0x7f80
 f9 8d                 or	r4, r3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e0 d1 05              jmp16	1489 <L68>
<L7>:
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ed ca 21              ld8u	r6, [r5+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 41                 cmpi.s8	r6, 0x41
 d1 4e                 brne8	0x4e <L13>
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ed cc 22              ld8u	r6, [r6+2]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d1 43                 brne8	0x43 <L13>
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f1 01                 mov	r0, r1
 f0 08 03              addi.s8	r0, 0x3
 ed 82 23              ld8u	r4, [r1+3]
 cc 28                 cmpi.s8	r4, 0x28
 f0 34 16              ldsp16	r4, [sp+0x16]
 d1 1f                 brne8	0x1f <L10>
 f0 09 05              addi.s8	r1, 0x5
 d4 02                 jmp8	0x2 <L9>
<L8>:
 f4 a9                 inc16	r1
<L9>:
 ed 82 1f              ld8u	r4, [r1-1]
 e1 f8 fe              call16	isalnum
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L8>
 ed 82 1f              ld8u	r4, [r1-1]
 cc 5f                 cmpi.s8	r4, 0x5f
 d0 ed                 breq8	-0x13 <L8>
 cc 29                 cmpi.s8	r4, 0x29
 f0 34 16              ldsp16	r4, [sp+0x16]
 d0 02                 breq8	0x2 <L11>
<L10>:
 f1 08                 mov	r1, r0
<L11>:
 f6 2c                 tst16	r4
 d0 02                 breq8	0x2 <L12>
 f5 51                 st16	[r4], r1
<L12>:
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 8d                 or	r4, r3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e0 76 05              jmp16	1398 <L68>
<L13>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 c1 09                 ldi8	r5, 0x9
 f4 69                 stsp16	[sp+0xa], r5
 cc 30                 cmpi.s8	r4, 0x30
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 d1 51                 brne8	0x51 <L15>
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 ed 84 21              ld8u	r4, [r2+1]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 cc 78                 cmpi.s8	r4, 0x78
 d1 49                 brne8	0x49 <L16>
 ed 84 22              ld8u	r4, [r2+2]
 c1 02                 ldi8	r5, 0x2
 c2 03                 ldi8	r6, 0x3
 cc 2e                 cmpi.s8	r4, 0x2e
 fb 2e                 cmov.eq	r5, r6
 f2 26                 add	r5, r2
 41                    ld8u	r4, [r5]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d2 0e                 brult8	0xe <L14>
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d8 26                 bruge8	0x26 <L17>
<L14>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 09 02              addi.s8	r1, 0x2
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 c0 08                 ldi8	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 d4 07                 jmp8	0x7 <L17>
<L15>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d4 02                 jmp8	0x2 <L17>
<L16>:
 f1 0a                 mov	r1, r2
<L17>:
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 09 02              addi.s8	r1, 0x2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f1 1c                 mov	r3, r4
 f1 14                 mov	r2, r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 05                 jmp8	0x5 <L19>
<L18>:
 f0 02 01              ldi8	r2, 0x1
 f4 a9                 inc16	r1
<L19>:
 ed 82 1e              ld8u	r4, [r1-2]
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 04                 brne8	0x4 <L20>
 f6 2a                 tst16	r2
 d0 f0                 breq8	-0x10 <L18>
<L20>:
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d8 11                 bruge8	0x11 <L21>
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2d                 cset.sge	r5
 f6 28                 tst16	r0
 de 9b 00              brslt16	0x9b <L27>
 d4 1c                 jmp8	0x1c <L22>
<L21>:
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 96                    or	r5, r6
 09                    mov	r6, r5
 ca a9                 addi.s8	r6, -0x57
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 06                 cmov.ult	r0, r6
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2d                 cset.sge	r5
 f6 28                 tst16	r0
 d3 7d                 brslt8	0x7d <L27>
<L22>:
 f4 12                 ldsp16	r6, [sp+0x4]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d1 76                 brne8	0x76 <L27>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3a 18              stsp16	[sp+0x18], r2
 f6 2a                 tst16	r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 77                 sub32	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 03 01              ldi8	r3, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 08                 brne8	0x8 <L23>
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L23>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 39                 jmp8	0x39 <L26>
<L23>:
 f1 11                 mov	r2, r1
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f4 28                 ldsp16	r4, [sp+0xa]
 f5 0c                 cmp	r1, r4
 d9 16                 brsge8	0x16 <L24>
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 88 05              call16	__avm_mulsi3
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 a9                 inc16	r1
 f0 39 1e              stsp16	[sp+0x1e], r1
 d4 16                 jmp8	0x16 <L25>
<L24>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 68                 add32	q2, q0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
<L25>:
 f1 0a                 mov	r1, r2
<L26>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f4 a9                 inc16	r1
 e0 3e ff              jmp16	-194 <L19>
<L27>:
 f6 2b                 tst16	r3
 d0 1b                 breq8	0x1b <L29>
 f1 25                 mov	r5, r1
 c9 fe                 addi.s8	r5, -0x2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d0 16                 breq8	0x16 <L30>
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 65                 cmpi.s8	r4, 0x65
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 d0 16                 breq8	0x16 <L31>
<L28>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e0 a5 00              jmp16	165 <L39>
<L29>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 fc 03              jmp16	1020 <L68>
<L30>:
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 70                 cmpi.s8	r4, 0x70
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 d1 ea                 brne8	-0x16 <L28>
<L31>:
 f1 29                 mov	r6, r1
 f4 b6                 dec16	r6
 42                    ld8u	r4, [r6]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L32>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 13                 brne8	0x13 <L33>
<L32>:
 ed 62 20              ld8u	r3, [r1+0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0f                 cset.ne	r7
 f1 23                 mov	r4, r3
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 4b                 bruge8	0x4b <L37>
 d4 10                 jmp8	0x10 <L34>
<L33>:
 c3 01                 ldi8	r7, 0x1
 f1 1c                 mov	r3, r4
 f1 0e                 mov	r1, r6
 f1 23                 mov	r4, r3
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 39                 bruge8	0x39 <L37>
<L34>:
 f0 3f 18              stsp16	[sp+0x18], r7
 f1 11                 mov	r2, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 3f 42           ldi16	r0, 0x423f
 f0 01 0f              ldi8	r1, 0xf
 f0 69 08              cmp32	q0, q2
 d9 14                 brsge8	0x14 <L36>
<L35>:
 ed 64 21              ld8u	r3, [r2+1]
 f4 aa                 inc16	r2
 f1 2b                 mov	r6, r3
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 20                 bruge8	0x20 <L38>
 f0 69 08              cmp32	q0, q2
 d3 ec                 brslt8	-0x14 <L35>
<L36>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 d1 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0b d0              addi.s8	r3, -0x30
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 d4 da                 jmp8	-0x26 <L35>
<L37>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 d4 24                 jmp8	0x24 <L39>
<L38>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 f0 36 18              ldsp16	r6, [sp+0x18]
 f4 a6                 tst8	r6
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f1 26                 mov	r5, r2
<L39>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 2c                 tst16	r4
 d0 01                 breq8	0x1 <L40>
 71                    st16	[r4], r5
<L40>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 7e                 breq8	0x7e <L44>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 da 80 00              breq16	0x80 <L45>
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 fa cf                 asr16i	r5, 0xf
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 de 12 03              brslt16	0x312 <L66>
 f0 69 8c              cmp32	q2, q3
 db 70 01              brne16	0x170 <L52>
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 d4 02                 jmp8	0x2 <L42>
<L41>:
 f4 ae                 inc16	r6
<L42>:
 42                    ld8u	r4, [r6]
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 f9                 breq8	-0x7 <L41>
 cc 30                 cmpi.s8	r4, 0x30
 d0 f5                 breq8	-0xb <L41>
 f2 4b                 sub	r3, r3
 c0 30                 ldi8	r4, 0x30
 f0 3c 12              stsp16	[sp+0x12], r4
<L43>:
 46                    ld8u	r5, [r6]
 cd 2e                 cmpi.s8	r5, 0x2e
 f8 07                 cset.eq	r7
 1e                    add	r7, r6
 43                    ld8u	r4, [r7]
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f1 72                 zext8	r2
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 36 12              ldsp16	r6, [sp+0x12]
 fc 34                 cmov.ult	r6, r4
 f1 03                 mov	r0, r3
 f2 39                 sub	r1, r1
 c4 34 0b              ldi16	r4, 0xb34
 c1 00                 ldi8	r5, 0x0
 f7 62                 add32	q0, q2
 f0 60 80              ldp8u	r4, [q0]
 38                    cmp	r6, r4
 db 21 01              brne16	0x121 <L51>
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 16                 cset.ult	r6
 1e                    add	r7, r6
 f4 ab                 inc16	r3
 f0 0f 27              cmpi.s8	r3, 0x27
 0b                    mov	r6, r7
 d1 ca                 brne8	-0x36 <L43>
 e0 bc 02              jmp16	700 <L66>
<L44>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 e0 c4 02              jmp16	708 <L68>
<L45>:
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f0 01 10              ldi8	r1, 0x10
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 fc 31                 cmov.ult	r6, r1
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f0 06 00 01           ldi16	r2, 0x100
 f0 69 84              cmp32	q2, q1
 d2 10                 brult8	0x10 <L46>
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 97                    or	r5, r7
 fa 78                 lsr16i	r4, 0x8
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
<L46>:
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 02 10              ldi8	r2, 0x10
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d2 0f                 brult8	0xf <L47>
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4c                 lsl16i	r5, 0xc
 97                    or	r5, r7
 fa 74                 lsr16i	r4, 0x4
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 ca 04                 addi.s8	r6, 0x4
<L47>:
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d2 0f                 brult8	0xf <L48>
 0c                    mov	r7, r4
 fa a2                 lsr16i	r7, 0x2
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 97                    or	r5, r7
 fa 72                 lsr16i	r4, 0x2
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 ca 02                 addi.s8	r6, 0x2
<L48>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 69 48              cmp32	q1, q2
 f8 12                 cset.ult	r2
 f2 16                 add	r2, r6
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 c2 7f                 ldi8	r6, 0x7f
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d9 09                 brsge8	0x9 <L49>
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 e0 1a 02              jmp16	538 <L66>
<L49>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 6a ff              ldi16	r4, 0xff6a
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 c8              cmp32	q3, q2
 d9 0b                 brsge8	0xb <L50>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e0 f8 01              jmp16	504 <L66>
<L50>:
 c4 81 ff              ldi16	r4, 0xff81
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 de fb 00              brslt16	0xfb <L58>
 f0 06 6b ff           ldi16	r2, 0xff6b
 f4 1a                 ldsp16	r6, [sp+0x6]
 f2 46                 sub	r2, r6
 f0 0e 01              cmpi.s8	r2, 0x1
 de 73 01              brslt16	0x173 <L61>
 f0 0e 21              cmpi.s8	r2, 0x21
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 dd ca 01              bruge16	0x1ca <L66>
 c4 4b ff              ldi16	r4, 0xff4b
 38                    cmp	r6, r4
 db db 01              brne16	0x1db <L69>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 dd 13 02              bruge16	0x213 <L71>
 c0 01                 ldi8	r4, 0x1
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e0 95 01              jmp16	405 <L65>
<L51>:
 f1 76                 zext8	r6
 32                    cmp	r4, r6
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 dc 9c 01              brult16	0x19c <L66>
<L52>:
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 de 8a 01              brslt16	0x18a <L66>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 11                 u32tof
 f2 64                 mov32	q1, q0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f2 52                 sub	r4, r2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 f1 26                 mov	r5, r2
 fd 2c                 cmov.slt	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 c0 05                 ldi8	r4, 0x5
 f4 58                 stsp16	[sp+0x6], r4
 f1 2b                 mov	r6, r3
 fa 9f                 lsr16i	r6, 0xf
 f0 06 1c 0b           ldi16	r2, 0xb1c
 f0 03 00              ldi8	r3, 0x0
 02                    mov	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 28                 jmp8	0x28 <L56>
<L53>:
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
<L54>:
 f2 62                 mov32	q0, q2
<L55>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b4                 dec16	r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 36 12              ldsp16	r6, [sp+0x12]
 d0 2d                 breq8	0x2d <L57>
<L56>:
 f4 a6                 tst8	r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 fb 65                 cmov.ne	r4, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 fa 14                 lsr16v	r5, r4
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 d9                 breq8	-0x27 <L55>
 f4 a6                 tst8	r6
 d0 c0                 breq8	-0x40 <L53>
 f4 01                 ldsp16	r5, [sp+0x0]
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 d4 be                 jmp8	-0x42 <L54>
<L57>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 e0 d4 00              jmp16	212 <L65>
<L58>:
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 0e 18              cmpi.s8	r2, 0x18
 d8 30                 bruge8	0x30 <L59>
 f0 00 17              ldi8	r0, 0x17
 f2 32                 sub	r0, r2
 c2 0f                 ldi8	r6, 0xf
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 a8                    xor	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 fa 1e                 lsr16v	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 06                 shl16v	r5, r6
 97                    or	r5, r7
 c2 10                 ldi8	r6, 0x10
 f9 18                 and	r0, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 02                 shl16v	r4, r6
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 d4 6e                 jmp8	0x6e <L63>
<L59>:
 f1 22                 mov	r4, r2
 c8 e8                 addi.s8	r4, -0x18
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 95 01              call16	__avm_ashlsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 89 01              call16	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 0a e9              addi.s8	r2, -0x17
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e1 9a 01              call16	__avm_lshrsi3
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 d8 16                 bruge8	0x16 <L62>
<L60>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 d4 23                 jmp8	0x23 <L63>
<L61>:
 c0 95                 ldi8	r4, 0x95
 18                    add	r6, r4
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 4f 01              call16	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 d4 3f                 jmp8	0x3f <L65>
<L62>:
 f0 69 c8              cmp32	q3, q2
 d1 0f                 brne8	0xf <L63>
 f4 32                 ldsp16	r6, [sp+0xc]
 f6 2e                 tst16	r6
 d1 df                 brne8	-0x21 <L60>
 f2 6a                 mov32	q3, q0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d1 d6                 brne8	-0x2a <L60>
<L63>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 0c              cmp32	q0, q3
 f8 06                 cset.eq	r6
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6b                 add32	q2, q3
 c2 7f                 ldi8	r6, 0x7f
 f0 69 c8              cmp32	q3, q2
 d3 29                 brslt8	0x29 <L66>
 c2 7f                 ldi8	r6, 0x7f
 f9 c4                 and	r6, r1
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
<L64>:
 f7 62                 add32	q0, q2
<L65>:
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f7 68                 add32	q2, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 80              ldi16	r7, 0x80ff
 f0 69 c8              cmp32	q3, q2
 d2 06                 brult8	0x6 <L67>
<L66>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 6a 01           stm16	[0x16a], r4
<L67>:
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 97                    or	r5, r7
 02                    mov	r4, r6
<L68>:
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L69>:
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 cd 00              call16	__avm_ashlsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 c1 00              call16	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e1 d5 00              call16	__avm_lshrsi3
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 d8 18                 bruge8	0x18 <L72>
<L70>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 d4 89                 jmp8	-0x77 <L64>
<L71>:
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e0 78 ff              jmp16	-136 <L65>
<L72>:
 f0 69 c8              cmp32	q3, q2
 db 72 ff              brne16	-0x8e <L65>
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 d1 dc                 brne8	-0x24 <L70>
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 da 62 ff              breq16	-0x9e <L65>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e0 5a ff              jmp16	-166 <L64>

<strtod>:
 e0 fc f8              jmp16	strtof

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
 e1 f8 f5              call16	-2568 <__avm_run_local_dtors>
<L0>:
 c4 5c 0b              ldi16	r4, 0xb5c
 c1 00                 ldi8	r5, 0x0
 c6 5c 0b              ldi16	r6, 0xb5c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5c 0b           ldi16	r2, 0xb5c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5c 0b           ldi16	r0, 0xb5c
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
 e1 af f5              call16	-2641 <__avm_run_local_dtors>
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
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
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
 0b                    mov	r6, r7
 16                    add	r5, r6
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
