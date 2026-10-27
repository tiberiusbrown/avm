
math_cbrt.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_cbrt.c
000003e3 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_cbrt.c
00000423 l       .init_array	00000000 .hidden __init_array_end
00000423 l       .init_array	00000000 .hidden __init_array_start
00000423 l       .fini_array	00000000 .hidden __fini_array_start
00000423 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000035 avm_test_main
000002fc g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fe g     F .text	000000e5 cbrtf

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
 e1 de 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 23 04              ldi16	r4, 0x423
 c1 00                 ldi8	r5, 0x0
 c6 23 04              ldi16	r6, 0x423
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 23 04           ldi16	r0, 0x423
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 23 04           ldi16	r2, 0x423
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
 c4 23 04              ldi16	r4, 0x423
 c1 00                 ldi8	r5, 0x0
 c6 23 04              ldi16	r6, 0x423
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 23 04           ldi16	r2, 0x423
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 23 04           ldi16	r0, 0x423
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
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 e3 03           ldi16	r2, 0x3e3
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 d5 17                 call8	cbrtf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e5                 brne8	-0x1b <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<cbrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 62                 mov32	q0, q2
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 64                 mov32	q1, q0
 f7 67                 add32	q1, q3
 f0 69 c4              cmp32	q3, q1
 d2 07                 brult8	0x7 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e0 b8 00              jmp16	184 <L4>
<L0>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d2 1c                 brult8	0x1c <L1>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 c4 69 ff              ldi16	r4, 0xff69
 12                    add	r4, r6
 d4 07                 jmp8	0x7 <L2>
<L1>:
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
<L2>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 7f                 ldi8	r4, 0x7f
 f9 84                 and	r4, r1
 c5 80 3f              ldi16	r5, 0x3f80
 94                    or	r5, r4
 f1 0d                 mov	r1, r5
 c2 96                 ldi8	r6, 0x96
 f4 18                 ldsp16	r4, [sp+0x6]
 18                    add	r6, r4
 c3 03                 ldi8	r7, 0x3
 ec b7                 sdiv16	r6, r7
 ca ce                 addi.s8	r6, -0x32
 c7 fd ff              ldi16	r7, 0xfffd
 f4 52                 stsp16	[sp+0x4], r6
 fe 37                 mul16	r6, r7
 18                    add	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 ff 16 08 74 15 cd 3a 4a c1 34 bb da ef 92 3b a5 64 17 bc c1 8e ab 3c 87 8e 67 bd 34 3e 82 3e ff 85 92 3f      fpoly	8, 0.00156466523, -0.00275810296, 0.00448415894, -0.00924030412, 0.0209420938, -0.056532409, 0.254380822, 1.14471424
 f2 66                 mov32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f6 2c                 tst16	r4
 d0 1c                 breq8	0x1c <L3>
 c6 f5 2f              ldi16	r6, 0x2ff5
 c7 cb 3f              ldi16	r7, 0x3fcb
 f0 04 18 45           ldi16	r0, 0x4518
 f0 05 a1 3f           ldi16	r1, 0x3fa1
 f4 18                 ldsp16	r4, [sp+0x6]
 cc 01                 cmpi.s8	r4, 0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
<L3>:
 c6 00 80              ldi16	r6, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 89                    and	r6, r5
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 67                 lsl16i	r7, 0x7
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 f7 61                 add32	q0, q1
 f9 c5                 or	r6, r1
 f1 20                 mov	r4, r0
 06                    mov	r5, r6
<L4>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
