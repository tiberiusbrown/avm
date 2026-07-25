
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_walk.c
000002b9 l     O .rodata	00000080 program_bytes
00000100 l     O .data	00000002 progmem_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000a1 avm_test_main
000002b7 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a1 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c4 b9 02              ldi16	r4, 0x2b9
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 02                    mov	r4, r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 42                 sub	r2, r2
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 68 c0              ldp32	q3, [q0+]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 16                    add	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 1e                    add	r7, r6
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 0a 02              addi.s8	r2, 0x2
 f0 0e 40              cmpi.s8	r2, 0x40
 d1 d3                 brne8	avm_test_main+30
 f2 30                 sub	r0, r0
 f1 08                 mov	r1, r0
 08                    mov	r6, r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f2 29                 add	r6, r1
 c0 7f                 ldi8	r4, 0x7f
 82                    and	r4, r6
 a5                    xor	r5, r5
 f0 06 b9 02           ldi16	r2, 0x2b9
 f0 03 00              ldi8	r3, 0x0
 f7 66                 add32	q1, q2
 c0 07                 ldi8	r4, 0x7
 f9 80                 and	r4, r0
 f0 60 a4              ldp8u	r5, [q1]
 f4 59                 stsp16	[sp+0x6], r5
 fa 04                 shl16v	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 a9                    xor	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 09 0d              addi.s8	r1, 0xd
 f4 a8                 inc16	r0
 c0 80                 ldi8	r4, 0x80
 f5 04                 cmp	r0, r4
 d1 d0                 brne8	avm_test_main+84
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d1 81                 brne8	avm_test_main+20
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
