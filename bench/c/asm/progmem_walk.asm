
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_walk.c
000002aa l     O .rodata	00000080 program_bytes
00000100 l     O .data	00000002 progmem_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000092 avm_test_main
000002a8 g     F .text	00000002 avm_halt

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
 e1 92 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 04 aa 02           ldi16	r0, 0x2aa
 f0 01 00              ldi8	r1, 0x0
 0c                    mov	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
 f0 68 c4              ldp32	q3, [q1+]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 1c                    add	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 1e                    add	r7, r6
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 08 02              addi.s8	r0, 0x2
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 da                 brne8	avm_test_main+23
 f2 42                 sub	r2, r2
 f1 1a                 mov	r3, r2
 0c                    mov	r7, r4
 f0 04 aa 02           ldi16	r0, 0x2aa
 f0 01 00              ldi8	r1, 0x0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 2f                 add	r7, r3
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 f7 6b                 add32	q2, q3
 c2 07                 ldi8	r6, 0x7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f9 c8                 and	r6, r2
 f4 5a                 stsp16	[sp+0x6], r6
 f0 60 e8              ldp8u	r7, [q2]
 0b                    mov	r6, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 08                 shl16v	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 a2                    xor	r4, r6
 f0 0b 0d              addi.s8	r3, 0xd
 f4 aa                 inc16	r2
 c2 80                 ldi8	r6, 0x80
 f5 16                 cmp	r2, r6
 d1 d0                 brne8	avm_test_main+73
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 8d                 brne8	avm_test_main+17
 f0 5c 00 01           stm16	[0x100], r4
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
