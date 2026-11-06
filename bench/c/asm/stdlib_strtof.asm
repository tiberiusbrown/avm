
stdlib_strtof.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000586 l     F .text	00000044 __avm_run_constructors
00000000 l    df *ABS*	00000000 stdlib_strtof.c
00000b00 l     O .flash	00000010 inputs
00000100 l     O .data	00000003 call
00000103 l     O .data	00000004 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000a09 l     F .text	0000005f decimal_overflows
00001921 l     O .rodata	00000028 decimal_overflows.threshold
00000000 l    df *ABS*	00000000 strtof_internal.c
00001949 l     O .rodata	00000018 __avm_decimal_value.powers
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00001618 l     F .text	0000010f open_section
00001727 l     F .text	000000ff read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00001db5 l       .init_array	00000000 .hidden __init_array_end
00001db5 l       .init_array	00000000 .hidden __init_array_start
00001db5 l       .fini_array	00000000 .hidden __fini_array_start
00001db5 l       .fini_array	00000000 .hidden __fini_array_end
00000109 l       *ABS*	00000000 .hidden __avm_heap_start
00000dcf g     F .text	00000015 __avm_trap_entry
00000563 g     F .text	00000023 _start
000005ca g     F .text	00000066 avm_test_main
00000d6a g     F .text	00000065 __avm_terminate
00000630 g     F .text	00000002 avm_halt
00000107 g     O .data	00000002 __avm_errno
0000064f g     F .text	000003ba strtof
00000632 g     F .text	00000011 isalnum
00000643 g     F .text	0000000c isspace
00001a14 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000f1b g     F .text	000006fd __avm_trap_lookup
00000de4 g     F .text	00000137 __avm_trap_report
000018c1 g     F .text	00000060 __avm_mulsi3
00000a68 g     F .text	00000228 __avm_hex_value
00000c90 g     F .text	000000da __avm_decimal_value
0000182b g     F .text	0000002c __avm_ashlsi3
00001857 g     F .text	0000002c __avm_lshrsi3
00001826 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00001883 g     F .text	0000003e __avm_umulhisi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	__avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 f1 07              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 aa 00              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b5 1d              ldi16	r4, 0x1db5
 c1 00                 ldi8	r5, 0x0
 c6 b5 1d              ldi16	r6, 0x1db5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b5 1d           ldi16	r0, 0x1db5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b5 1d           ldi16	r2, 0x1db5
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
 c6 00 0b              ldi16	r6, 0xb00
 c7 00 01              ldi16	r7, 0x100
 f1 05                 mov	r0, r5
<L0>:
 f0 38 00              stsp16	[sp+0x0], r0
 f1 0d                 mov	r1, r5
<L1>:
 f0 5d 07 01           stm16	[0x107], r5
 f1 21                 mov	r4, r1
 12                    add	r4, r6
 f5 40                 ld16	r0, [r4]
 03                    mov	r4, r7
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 15 02              leasp	r5, 0x2
 f1 20                 mov	r4, r0
 eb                    callp	q3
 c7 00 01              ldi16	r7, 0x100
 c6 00 0b              ldi16	r6, 0xb00
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 50                 sub	r4, r0
 f0 55 07 01           ldm16	r5, [0x107]
 14                    add	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 09 02              addi.s8	r1, 0x2
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 ce                 brne8	-0x32 <L1>
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 bf                 brne8	-0x41 <L0>
 c4 03 01              ldi16	r4, 0x103
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
 d6 de                 adjsp	-0x22
 f1 0c                 mov	r1, r4
 f6 2d                 tst16	r5
 d0 02                 breq8	0x2 <L0>
 f5 55                 st16	[r5], r1
<L0>:
 f0 3d 12              stsp16	[sp+0x12], r5
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
 ed 82 20              ld8u	r4, [r1+0]
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3d 16              stsp16	[sp+0x16], r5
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d0 6b                 breq8	0x6b <L7>
 d4 12                 jmp8	0x12 <L4>
<L3>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f1 08                 mov	r1, r0
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d0 57                 breq8	0x57 <L7>
<L4>:
 cd 69                 cmpi.s8	r5, 0x69
 db a8 00              brne16	0xa8 <L14>
 ed c2 21              ld8u	r6, [r1+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 db 9d 00              brne16	0x9d <L14>
 ed c2 22              ld8u	r6, [r1+2]
 89                    and	r6, r5
 ce 46                 cmpi.s8	r6, 0x46
 db 94 00              brne16	0x94 <L14>
 ed c2 23              ld8u	r6, [r1+3]
 89                    and	r6, r5
 f1 21                 mov	r4, r1
 c8 03                 addi.s8	r4, 0x3
 ce 49                 cmpi.s8	r6, 0x49
 d1 25                 brne8	0x25 <L5>
 ed c2 24              ld8u	r6, [r1+4]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d1 1d                 brne8	0x1d <L5>
 ed c2 25              ld8u	r6, [r1+5]
 89                    and	r6, r5
 ce 49                 cmpi.s8	r6, 0x49
 d1 15                 brne8	0x15 <L5>
 ed c2 26              ld8u	r6, [r1+6]
 89                    and	r6, r5
 ce 54                 cmpi.s8	r6, 0x54
 d1 0d                 brne8	0xd <L5>
 ed c2 27              ld8u	r6, [r1+7]
 89                    and	r6, r5
 ce 59                 cmpi.s8	r6, 0x59
 d1 05                 brne8	0x5 <L5>
 f0 09 08              addi.s8	r1, 0x8
 f1 21                 mov	r4, r1
<L5>:
 f0 35 12              ldsp16	r5, [sp+0x12]
 f6 2d                 tst16	r5
 d0 01                 breq8	0x1 <L6>
 74                    st16	[r5], r4
<L6>:
 c4 80 7f              ldi16	r4, 0x7f80
 d4 4b                 jmp8	0x4b <L13>
<L7>:
 ed c2 21              ld8u	r6, [r1+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 41                 cmpi.s8	r6, 0x41
 d1 4c                 brne8	0x4c <L14>
 ed c2 22              ld8u	r6, [r1+2]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d1 44                 brne8	0x44 <L14>
 f1 01                 mov	r0, r1
 f0 08 03              addi.s8	r0, 0x3
 ed 82 23              ld8u	r4, [r1+3]
 cc 28                 cmpi.s8	r4, 0x28
 f0 34 12              ldsp16	r4, [sp+0x12]
 d1 1f                 brne8	0x1f <L10>
 f0 09 05              addi.s8	r1, 0x5
 d4 02                 jmp8	0x2 <L9>
<L8>:
 f4 a9                 inc16	r1
<L9>:
 ed 82 1f              ld8u	r4, [r1-1]
 e1 09 ff              call16	isalnum
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L8>
 ed 82 1f              ld8u	r4, [r1-1]
 cc 5f                 cmpi.s8	r4, 0x5f
 d0 ed                 breq8	-0x13 <L8>
 cc 29                 cmpi.s8	r4, 0x29
 f0 34 12              ldsp16	r4, [sp+0x12]
 d0 02                 breq8	0x2 <L11>
<L10>:
 f1 08                 mov	r1, r0
<L11>:
 f6 2c                 tst16	r4
 d0 02                 breq8	0x2 <L12>
 f5 51                 st16	[r4], r1
<L12>:
 c4 c0 7f              ldi16	r4, 0x7fc0
<L13>:
 f0 37 16              ldsp16	r7, [sp+0x16]
 93                    or	r4, r7
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 e0 af 02              jmp16	687 <L47>
<L14>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 c1 09                 ldi8	r5, 0x9
 f4 59                 stsp16	[sp+0x6], r5
 cc 30                 cmpi.s8	r4, 0x30
 f0 39 20              stsp16	[sp+0x20], r1
 d1 4e                 brne8	0x4e <L16>
 ed 82 21              ld8u	r4, [r1+1]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 cc 78                 cmpi.s8	r4, 0x78
 d1 44                 brne8	0x44 <L16>
 ed 82 22              ld8u	r4, [r1+2]
 c1 02                 ldi8	r5, 0x2
 c2 03                 ldi8	r6, 0x3
 cc 2e                 cmpi.s8	r4, 0x2e
 fb 2e                 cmov.eq	r5, r6
 f2 25                 add	r5, r1
 41                    ld8u	r4, [r5]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d2 0e                 brult8	0xe <L15>
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 33 20              ldsp16	r3, [sp+0x20]
 d8 21                 bruge8	0x21 <L17>
<L15>:
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 0b 02              addi.s8	r3, 0x2
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 c0 08                 ldi8	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 d4 02                 jmp8	0x2 <L17>
<L16>:
 f1 19                 mov	r3, r1
<L17>:
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 0b 02              addi.s8	r3, 0x2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 0c                 mov	r1, r4
 f1 04                 mov	r0, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 05                 jmp8	0x5 <L19>
<L18>:
 f0 00 01              ldi8	r0, 0x1
 f4 ab                 inc16	r3
<L19>:
 ed 86 1e              ld8u	r4, [r3-2]
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 04                 brne8	0x4 <L20>
 f6 28                 tst16	r0
 d0 f0                 breq8	-0x10 <L18>
<L20>:
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d8 11                 bruge8	0x11 <L21>
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2d                 cset.sge	r5
 f6 2a                 tst16	r2
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
 f0 06 ff ff           ldi16	r2, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 16                 cmov.ult	r2, r6
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2d                 cset.sge	r5
 f6 2a                 tst16	r2
 d3 7d                 brslt8	0x7d <L27>
<L22>:
 f4 12                 ldsp16	r6, [sp+0x4]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d1 76                 brne8	0x76 <L27>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 38 1e              stsp16	[sp+0x1e], r0
 f6 28                 tst16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 73                 sub32	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 01 01              ldi8	r1, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 08                 brne8	0x8 <L23>
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L23>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 39                 jmp8	0x39 <L26>
<L23>:
 f1 03                 mov	r0, r3
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f4 18                 ldsp16	r4, [sp+0x6]
 f5 1c                 cmp	r3, r4
 d9 16                 brsge8	0x16 <L24>
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 51 10              call16	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 ab                 inc16	r3
 f0 3b 1c              stsp16	[sp+0x1c], r3
 d4 16                 jmp8	0x16 <L25>
<L24>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
<L25>:
 f1 18                 mov	r3, r0
<L26>:
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f4 ab                 inc16	r3
 e0 3e ff              jmp16	-194 <L19>
<L27>:
 f1 25                 mov	r5, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2d                 tst16	r5
 da 59 01              breq16	0x159 <L47>
 f1 27                 mov	r5, r3
 c9 fe                 addi.s8	r5, -0x2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d0 41                 breq8	0x41 <L32>
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 65                 cmpi.s8	r4, 0x65
 d0 41                 breq8	0x41 <L33>
<L28>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f6 2c                 tst16	r4
 d0 01                 breq8	0x1 <L30>
<L29>:
 71                    st16	[r4], r5
<L30>:
 f0 69 c0              cmp32	q3, q0
 d0 4a                 breq8	0x4a <L35>
<L31>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 4d                 breq8	0x4d <L36>
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 fa cf                 asr16i	r5, 0xf
 f7 69                 add32	q2, q1
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db e3 00              brne16	0xe3 <L43>
 f0 34 20              ldsp16	r4, [sp+0x20]
 e1 1a 01              call16	decimal_overflows
 e0 db 00              jmp16	219 <L44>
<L32>:
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 70                 cmpi.s8	r4, 0x70
 d1 bf                 brne8	-0x41 <L28>
<L33>:
 f1 2b                 mov	r6, r3
 f4 b6                 dec16	r6
 42                    ld8u	r4, [r6]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L34>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 2e                 brne8	0x2e <L37>
<L34>:
 ed 06 20              ld8u	r0, [r3+0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0f                 cset.ne	r7
 f1 20                 mov	r4, r0
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 66                 bruge8	0x66 <L41>
 d4 2b                 jmp8	0x2b <L38>
<L35>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 e0 de 00              jmp16	222 <L47>
<L36>:
 d6 fe                 adjsp	-0x2
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 40                 stsp16	[sp+0x0], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e1 39 01              call16	__avm_hex_value
 d6 02                 adjsp	0x2
 e0 ab 00              jmp16	171 <L45>
<L37>:
 c3 01                 ldi8	r7, 0x1
 f1 04                 mov	r0, r4
 f1 1e                 mov	r3, r6
 f1 20                 mov	r4, r0
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 39                 bruge8	0x39 <L41>
<L38>:
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f1 0b                 mov	r1, r3
 f0 06 3f 42           ldi16	r2, 0x423f
 f0 03 0f              ldi8	r3, 0xf
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d9 14                 brsge8	0x14 <L40>
<L39>:
 ed 02 21              ld8u	r0, [r1+1]
 f4 a9                 inc16	r1
 f1 28                 mov	r6, r0
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 36                 bruge8	0x36 <L42>
 f0 69 48              cmp32	q1, q2
 d3 ec                 brslt8	-0x14 <L39>
<L40>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 50 0f              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 08 d0              addi.s8	r0, -0x30
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 d4 da                 jmp8	-0x26 <L39>
<L41>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 db 36 ff              brne16	-0xca <L29>
 f0 69 c0              cmp32	q3, q0
 db 36 ff              brne16	-0xca <L31>
 e0 7d ff              jmp16	-131 <L35>
<L42>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 76                 sub32	q1, q2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f4 a6                 tst8	r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 25                 mov	r5, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 db 06 ff              brne16	-0xfa <L29>
 f0 69 c0              cmp32	q3, q0
 db 06 ff              brne16	-0xfa <L31>
 e0 4d ff              jmp16	-179 <L35>
<L43>:
 a0                    xor	r4, r4
<L44>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 e1 b3 02              call16	__avm_decimal_value
 d6 04                 adjsp	0x4
<L45>:
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d2 06                 brult8	0x6 <L46>
 c2 22                 ldi8	r6, 0x22
 f0 5e 07 01           stm16	[0x107], r6
<L46>:
 f0 37 16              ldsp16	r7, [sp+0x16]
 97                    or	r5, r7
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
<L47>:
 f2 68                 mov32	q2, q0
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<decimal_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d4 02                 jmp8	0x2 <L1>
<L0>:
 f4 ac                 inc16	r4
<L1>:
 44                    ld8u	r5, [r4]
 cd 2e                 cmpi.s8	r5, 0x2e
 d0 f9                 breq8	-0x7 <L0>
 cd 30                 cmpi.s8	r5, 0x30
 d0 f5                 breq8	-0xb <L0>
 f2 30                 sub	r0, r0
 c1 30                 ldi8	r5, 0x30
 f4 41                 stsp16	[sp+0x0], r5
 f0 06 21 19           ldi16	r2, 0x1921
 f0 03 00              ldi8	r3, 0x0
<L2>:
 44                    ld8u	r5, [r4]
 cd 2e                 cmpi.s8	r5, 0x2e
 f8 07                 cset.eq	r7
 1c                    add	r7, r4
 47                    ld8u	r5, [r7]
 01                    mov	r4, r5
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 f4 02                 ldsp16	r6, [sp+0x0]
 fc 35                 cmov.ult	r6, r5
 f0 38 02              stsp16	[sp+0x2], r0
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 39                    cmp	r6, r5
 d1 14                 brne8	0x14 <L3>
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 1c                    add	r7, r4
 f0 30 02              ldsp16	r0, [sp+0x2]
 f4 a8                 inc16	r0
 f0 0c 27              cmpi.s8	r0, 0x27
 03                    mov	r4, r7
 d1 d1                 brne8	-0x2f <L2>
 c0 01                 ldi8	r4, 0x1
 d4 05                 jmp8	0x5 <L4>
<L3>:
 f1 76                 zext8	r6
 36                    cmp	r5, r6
 f8 14                 cset.ult	r4
<L4>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_hex_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f0 00 10              ldi8	r0, 0x10
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 f2 39                 sub	r1, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fc 37                 cmov.ult	r6, r7
 fc 39                 cmov.ult	r7, r1
 f0 34 19              ldsp16	r4, [sp+0x19]
 f4 50                 stsp16	[sp+0x4], r4
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
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 c0 7f                 ldi8	r4, 0x7f
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 07                 brsge8	0x7 <L4>
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 18 01              jmp16	280 <L12>
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 06 6a ff           ldi16	r2, 0xff6a
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 c4              cmp32	q3, q1
 de 04 01              brslt16	0x104 <L12>
 f0 06 81 ff           ldi16	r2, 0xff81
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 d3 2f                 brslt8	0x2f <L5>
 f0 06 6b ff           ldi16	r2, 0xff6b
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 46                 sub	r2, r6
 f0 0e 01              cmpi.s8	r2, 0x1
 de 99 00              brslt16	0x99 <L8>
 f0 0e 21              cmpi.s8	r2, 0x21
 dd df 00              bruge16	0xdf <L12>
 c4 4b ff              ldi16	r4, 0xff4b
 38                    cmp	r6, r4
 db df 00              brne16	0xdf <L13>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 dd 13 01              bruge16	0x113 <L15>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e0 c4 00              jmp16	196 <L12>
<L5>:
 f0 0c 18              cmpi.s8	r0, 0x18
 d8 2c                 bruge8	0x2c <L6>
 f0 01 17              ldi8	r1, 0x17
 f2 38                 sub	r1, r0
 c2 0f                 ldi8	r6, 0xf
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 a8                    xor	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 fa 1e                 lsr16v	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 06                 shl16v	r5, r6
 97                    or	r5, r7
 c2 10                 ldi8	r6, 0x10
 f9 38                 and	r1, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 02                 shl16v	r4, r6
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 d4 69                 jmp8	0x69 <L10>
<L6>:
 f1 20                 mov	r4, r0
 c8 e8                 addi.s8	r4, -0x18
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 90 0c              call16	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 84 0c              call16	__avm_ashlsi3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 08 e9              addi.s8	r0, -0x17
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e1 95 0c              call16	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 d8 14                 bruge8	0x14 <L9>
<L7>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 d4 22                 jmp8	0x22 <L10>
<L8>:
 c0 95                 ldi8	r4, 0x95
 18                    add	r6, r4
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 4e 0c              call16	__avm_ashlsi3
 d4 3f                 jmp8	0x3f <L12>
<L9>:
 f0 69 4c              cmp32	q1, q3
 d1 10                 brne8	0x10 <L10>
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 e1                 brne8	-0x1f <L7>
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 d7                 brne8	-0x29 <L7>
<L10>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 8c              cmp32	q2, q3
 f8 06                 cset.eq	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6c                 add32	q3, q0
 f0 00 7f              ldi8	r0, 0x7f
 f0 69 0c              cmp32	q0, q3
 de ef fe              brslt16	-0x111 <L3>
 c3 7f                 ldi8	r7, 0x7f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 0e                    mov	r7, r6
 08                    mov	r6, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
<L11>:
 f7 6b                 add32	q2, q3
<L12>:
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 f6 0b              call16	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 ea 0b              call16	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e1 fe 0b              call16	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c0              cmp32	q3, q0
 d8 14                 bruge8	0x14 <L16>
<L14>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d4 b5                 jmp8	-0x4b <L11>
<L15>:
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 d4 a8                 jmp8	-0x58 <L12>
<L16>:
 f0 69 0c              cmp32	q0, q3
 d1 a3                 brne8	-0x5d <L12>
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 e1                 brne8	-0x1f <L14>
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 93                 breq8	-0x6d <L12>
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d4 8c                 jmp8	-0x74 <L11>

<__avm_decimal_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 17              ldsp16	r4, [sp+0x17]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f0 32 19              ldsp16	r2, [sp+0x19]
 f0 00 27              ldi8	r0, 0x27
 f2 39                 sub	r1, r1
 f0 69 08              cmp32	q0, q2
 d3 09                 brslt8	0x9 <L0>
 f6 2a                 tst16	r2
 d0 14                 breq8	0x14 <L2>
 f0 69 80              cmp32	q2, q0
 d1 0f                 brne8	0xf <L2>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
<L1>:
 f2 69                 mov32	q2, q1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L2>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 e8                 brslt8	-0x18 <L1>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 11                 u32tof
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 f2 5c                 sub	r7, r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 fd 37                 cmov.slt	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 c2 05                 ldi8	r6, 0x5
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 fa 7f                 lsr16i	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 49 19           ldi16	r0, 0x1949
 f0 01 00              ldi8	r1, 0x0
 d4 21                 jmp8	0x21 <L6>
<L3>:
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
<L4>:
 f4 22                 ldsp16	r6, [sp+0x8]
<L5>:
 f4 b6                 dec16	r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 af                 inc16	r7
 cf 06                 cmpi.s8	r7, 0x6
 d0 32                 breq8	0x32 <L7>
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 5b                 stsp16	[sp+0x6], r7
 fb 77                 cmov.ne	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 c2 01                 ldi8	r6, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 df                 breq8	-0x21 <L4>
 f4 a4                 tst8	r4
 d1 c6                 brne8	-0x3a <L3>
 f4 23                 ldsp16	r7, [sp+0x8]
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
 f4 22                 ldsp16	r6, [sp+0x8]
 f2 66                 mov32	q1, q2
 d4 c4                 jmp8	-0x3c <L5>
<L7>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 e0 54 ff              jmp16	-172 <L1>

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
 e1 81 f2              call16	-3455 <__avm_run_local_dtors>
<L0>:
 c4 b5 1d              ldi16	r4, 0x1db5
 c1 00                 ldi8	r5, 0x0
 c6 b5 1d              ldi16	r6, 0x1db5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b5 1d           ldi16	r2, 0x1db5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b5 1d           ldi16	r0, 0x1db5
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
 e1 38 f2              call16	-3528 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_trap_entry>:
 c4 00 01              ldi16	r4, 0x100
 c5 00 09              ldi16	r5, 0x900
 c6 00 01              ldi16	r6, 0x100
 d7 0f                 sys	memcpy
 c7 00 0a              ldi16	r7, 0xa00
 f1 8f                 setsp	r7
 c4 00 02              ldi16	r4, 0x200
 d4 00                 jmp8	__avm_trap_report

<__avm_trap_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f1 04                 mov	r0, r4
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 05 20 02           ldi16	r1, 0x220
 f2 69                 mov32	q2, q1
 f1 29                 mov	r6, r1
 e1 20 01              call16	__avm_trap_lookup
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e1 21 0a              call16	memset
 c4 14 1a              ldi16	r4, 0x1a14
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 a0                    xor	r4, r4
 d7 32                 sys	set_text_mode
 ed 80 23              ld8u	r4, [r0+3]
 cc 01                 cmpi.s8	r4, 0x1
 d0 16                 breq8	0x16 <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d0 0b                 breq8	0xb <L0>
 cc 02                 cmpi.s8	r4, 0x2
 d1 15                 brne8	0x15 <L2>
 c6 e5 19              ldi16	r6, 0x19e5
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 f5 19              ldi16	r6, 0x19f5
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 d6 19              ldi16	r6, 0x19d6
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 07 1a              ldi16	r6, 0x1a07
 c3 00                 ldi8	r7, 0x0
<L3>:
 a0                    xor	r4, r4
 c1 05                 ldi8	r5, 0x5
 d7 34                 sys	draw_text_p
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ed 90 24              ld16	r4, [r0+4]
 f4 50                 stsp16	[sp+0x4], r4
 f0 13 00              leasp	r3, 0x0
 c6 61 19              ldi16	r6, 0x1961
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 0b                 ldi8	r5, 0xb
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	0x12 <L4>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 72 19              ldi16	r6, 0x1972
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 7b 19              ldi16	r6, 0x197b
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
<L5>:
 c6 23 02              ldi16	r6, 0x223
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 1d                 breq8	0x1d <L6>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c4 26 02              ldi16	r4, 0x226
 f0 6a 88              ld32	q2, [r4]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 55                 stsp16	[sp+0x5], r5
 f0 12 00              leasp	r2, 0x0
 c6 80 19              ldi16	r6, 0x1980
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 8a 19              ldi16	r6, 0x198a
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 34                 sys	draw_text_p
<L7>:
 ed 90 28              ld16	r4, [r0+8]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2a              ld16	r4, [r0+10]
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 00              leasp	r2, 0x0
 c6 8e 19              ldi16	r6, 0x198e
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 9e 19              ldi16	r6, 0x199e
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 ae 19              ldi16	r6, 0x19ae
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 be 19              ldi16	r6, 0x19be
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 ce 19              ldi16	r6, 0x19ce
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 35                 ldi8	r5, 0x35
 d7 36                 sys	draw_textfv_p
 a0                    xor	r4, r4
 d7 1d                 sys	display
<L8>:
 d4 fe                 jmp8	-0x2 <L8>

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a2                 adjsp	-0x5e
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 cb 06                 addi.s8	r7, 0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 4e              st32	[r7], q1
 0e                    mov	r7, r6
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 0e                    mov	r7, r6
 cb 03                 addi.s8	r7, 0x3
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f0 63 80              ldp24	q2, [q0]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 02 2e              ldi8	r2, 0x2e
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 66                 add32	q1, q2
 f0 00 2f              ldi8	r0, 0x2f
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 40              cmp32	q1, q0
 d2 76                 brult8	0x76 <L0>
 f0 60 e8              ldp8u	r7, [q2]
 cf 41                 cmpi.s8	r7, 0x41
 d1 6f                 brne8	0x6f <L0>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d1 5f                 brne8	0x5f <L0>
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d1 51                 brne8	0x51 <L0>
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d1 41                 brne8	0x41 <L0>
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 05                 cmpi.s8	r7, 0x5
 d1 21                 brne8	0x21 <L0>
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d1 13                 brne8	0x13 <L0>
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 07                 breq8	0x7 <L1>
<L0>:
 d6 5e                 adjsp	0x5e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 d2 e9                 brult8	-0x17 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 72                 sub32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 d2 d1                 brult8	-0x2f <L0>
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f7 62                 add32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 a0                    xor	r4, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
<L2>:
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 62                 add32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 69                 mov32	q2, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f2 66                 mov32	q1, q2
 f0 63 80              ldp24	q2, [q0]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 60 88              ldp8u	r4, [q2]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 18              stsp16	[sp+0x18], r4
 3c                    cmp	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 db 67 ff              brne16	-0x99 <L0>
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 04              cmp32	q0, q1
 db 5b ff              brne16	-0xa5 <L0>
 d6 fa                 adjsp	-0x6
 f0 17 28              leasp	r7, 0x28
 f4 53                 stsp16	[sp+0x4], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e1 7d 05              call16	open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 da 2f ff              breq16	-0xd1 <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 05                 cmpi.s8	r4, 0x5
 db 65 ff              brne16	-0x9b <L2>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 db 15 ff              brne16	-0xeb <L0>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 08                    mov	r6, r4
 fa 96                 lsr16i	r6, 0x6
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4a                 lsl16i	r5, 0xa
 96                    or	r5, r6
 fa 76                 lsr16i	r4, 0x6
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 58              ldsp16	r6, [sp+0x58]
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db ed fe              brne16	-0x113 <L0>
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db dc fe              brne16	-0x124 <L0>
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 db ce fe              brne16	-0x132 <L0>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 db b5 fe              brne16	-0x14b <L0>
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 da fd 00              breq16	0xfd <L5>
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L3>:
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 7c                 sub32	q3, q0
 f7 83                 lsr32.1	q3
 f7 6c                 add32	q3, q0
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 64                 add32	q1, q0
 f0 63 44              ldp24	q1, [q1]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 69 c8              cmp32	q3, q2
 d2 b8                 brult8	-0x48 <L3>
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 c0              cmp32	q3, q0
 da 94 00              breq16	0x94 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 70                 bruge8	0x70 <L5>
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6b                 mov32	q3, q1
 e1 40 05              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 2e                 breq8	0x2e <L4>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c0              cmp32	q3, q0
 d0 1f                 breq8	0x1f <L4>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 76                 sub32	q1, q2
 f0 69 c4              cmp32	q3, q1
 d8 12                 bruge8	0x12 <L4>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d1 09                 brne8	0x9 <L4>
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 62                 mov32	q0, q2
<L4>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
<L5>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 da a8 fd              breq16	-0x258 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
<L6>:
 f2 68                 mov32	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 61                 mov32	q0, q1
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 e1 69 06              call16	__avm_mulsi3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 fc 19                 cmov.ult	r3, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f0 69 04              cmp32	q0, q1
 d2 c1                 brult8	-0x3f <L6>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 4e fd              breq16	-0x2b2 <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 33 06              call16	__avm_mulsi3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 69 c0              cmp32	q3, q0
 dd 54 02              bruge16	0x254 <L17>
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 3c 32              stsp16	[sp+0x32], r4
 f2 39                 sub	r1, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 60                 stsp16	[sp+0x8], r4
 f4 a4                 tst8	r4
 de da 00              brslt16	0xda <L11>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da 7e fc              breq16	-0x382 <L0>
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c0 0f                 ldi8	r4, 0xf
 82                    and	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 fa 94                 lsr16i	r6, 0x4
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
<L8>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
<L9>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6e                 add32	q3, q2
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 c4              cmp32	q3, q1
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 dc 32 fc              brult16	-0x3ce <L0>
<L10>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 ff              ldi8	r3, 0xff
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 76                 sub32	q1, q2
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 30              ldsp16	r1, [sp+0x30]
 f2 6a                 mov32	q3, q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 dd 0d fc              bruge16	-0x3f3 <L0>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 68                 add32	q2, q0
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 69 48              cmp32	q1, q2
 dc 8a 01              brult16	0x18a <L19>
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 dd 6a 01              bruge16	0x16a <L18>
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 68                 add32	q2, q0
 f0 02 40              ldi8	r2, 0x40
 f2 4b                 sub	r3, r3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 db f6 fe              brne16	-0x10a <L7>
 e0 b0 fb              jmp16	-1104 <L0>
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 80                 cmpi.s8	r4, -0x80
 d1 76                 brne8	0x76 <L12>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 ea 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 8e fb              breq16	-0x472 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 ce 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 72 fb              breq16	-0x48e <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 69 08              cmp32	q0, q2
 dd 5d fb              bruge16	-0x4a3 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 9d 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 41 fb              breq16	-0x4bf <L0>
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e0 e6 fe              jmp16	-282 <L9>
<L12>:
 c2 ff                 ldi8	r6, 0xff
 f4 20                 ldsp16	r4, [sp+0x8]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 93                 cmpi.s8	r6, -0x6d
 d2 23                 brult8	0x23 <L14>
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L13>:
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
 e0 d3 fe              jmp16	-301 <L10>
<L14>:
 c6 82 ff              ldi16	r6, 0xff82
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 d2 24                 brult8	0x24 <L15>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 3d 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da e1 fa              breq16	-0x51f <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 82                 cmpi.s8	r4, -0x7e
 d0 c1                 breq8	-0x3f <L13>
 d4 0e                 jmp8	0xe <L16>
<L15>:
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L16>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da bf fa              breq16	-0x541 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 ff 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da a3 fa              breq16	-0x55d <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f1 28                 mov	r6, r0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f6 4e                 neg16	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 80                 lsr32.1	q0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 e0 2a fe              jmp16	-470 <L8>
<L17>:
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 da 79 fa              breq16	-0x587 <L0>
 d4 20                 jmp8	0x20 <L20>
<L18>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L19>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 da 57 fa              breq16	-0x5a9 <L0>
<L20>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 4d fa              bruge16	-0x5b3 <L0>
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e1 68 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L21>
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 16                 breq8	0x16 <L21>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d8 09                 bruge8	0x9 <L21>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 0d                 breq8	0xd <L22>
<L21>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e0 dd f9              jmp16	-1571 <L0>
<L22>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da cb f9              breq16	-0x635 <L0>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 06                 addi.s8	r4, 0x6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 e0 bc f9              jmp16	-1604 <L0>

<open_section>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 32 15              ldsp16	r2, [sp+0x15]
 f0 33 17              ldsp16	r3, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d0 11                 breq8	0x11 <L0>
 cd 03                 cmpi.s8	r5, 0x3
 d1 1e                 brne8	0x1e <L2>
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 49                 bruge8	0x49 <L3>
 a0                    xor	r4, r4
 d4 70                 jmp8	0x70 <L5>
<L0>:
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
<L1>:
 f0 6b c8              st32	[r4], q3
 d4 5d                 jmp8	0x5d <L4>
<L2>:
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 54                 brult8	0x54 <L5>
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d0 4e                 breq8	0x4e <L6>
 cd 01                 cmpi.s8	r5, 0x1
 d1 73                 brne8	0x73 <L7>
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 2d                 brne8	0x2d <L5>
 e0 81 00              jmp16	129 <L8>
<L3>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 63 8c              ldp24	q2, [q3]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 6b 84              st32	[r2], q2
 f7 63                 add32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 0c                 addi.s8	r5, 0xc
 f0 6b 0a              st32	[r5], q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 63                 add32	q0, q3
 c8 10                 addi.s8	r4, 0x10
 f0 6b 08              st32	[r4], q0
<L4>:
 c0 01                 ldi8	r4, 0x1
<L5>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 df                 brne8	-0x21 <L5>
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3c              st16	[r4+28], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e0 6c ff              jmp16	-148 <L1>
<L7>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f1 20                 mov	r4, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e1 98 01              call16	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d1 af                 brne8	-0x51 <L5>
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	0x11 <L9>
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3e              st16	[r4+30], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 04                 addi.s8	r4, 0x4
 e0 34 ff              jmp16	-204 <L1>
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e0 23 ff              jmp16	-221 <L1>

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 6a 0a              ld32	q0, [r5]
 f0 69 0c              cmp32	q0, q3
 d8 6f                 bruge8	0x6f <L3>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f4 69                 stsp16	[sp+0xa], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 c0              ldp8s	r6, [q0]
 c0 7f                 ldi8	r4, 0x7f
 06                    mov	r5, r6
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 a6                 tst8	r6
 d3 12                 brslt8	0x12 <L1>
 f4 29                 ldsp16	r5, [sp+0xa]
<L0>:
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d4 3c                 jmp8	0x3c <L3>
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 d8 32                 bruge8	0x32 <L2>
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 61 a4              ldp8s	r5, [q1]
 09                    mov	r6, r5
 fa 57                 lsl16i	r6, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 82                    and	r4, r6
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 0d                    mov	r7, r5
 f4 a7                 tst8	r7
 d3 17                 brslt8	0x17 <L4>
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f6 2f                 tst16	r7
 d1 b7                 brne8	-0x49 <L0>
 d4 01                 jmp8	0x1 <L3>
<L2>:
 a0                    xor	r4, r4
<L3>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d8 e9                 bruge8	-0x17 <L3>
 f0 60 e4              ldp8u	r7, [q1]
 07                    mov	r5, r7
 fa 4e                 lsl16i	r5, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 a9                 or	r5, r2
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 fa 92                 lsr16i	r6, 0x2
 f0 3d 0c              stsp16	[sp+0xc], r5
 f0 3e 0e              stsp16	[sp+0xe], r6
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a7                 tst8	r7
 d3 0b                 brslt8	0xb <L5>
 f6 47                 sext8	r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 2f                 tst16	r7
 db 73 ff              brne16	-0x8d <L0>
 d4 bd                 jmp8	-0x43 <L3>
<L5>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 f4 29                 ldsp16	r5, [sp+0xa]
 d8 b2                 bruge8	-0x4e <L3>
 f0 61 e4              ldp8s	r7, [q1]
 f4 a7                 tst8	r7
 d3 ab                 brslt8	-0x55 <L3>
 f4 53                 stsp16	[sp+0x4], r7
 f1 17                 mov	r2, r7
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 64                 mov32	q1, q0
 f6 2f                 tst16	r7
 db 39 ff              brne16	-0xc7 <L0>
 d4 83                 jmp8	-0x7d <L3>

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
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

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
