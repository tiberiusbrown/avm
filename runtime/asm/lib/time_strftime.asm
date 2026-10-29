
time_strftime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_strftime.c
00000000 l    d  .text.strftime	00000000 .text.strftime
00000000 l     F .text.conversion	000005a4 conversion
00000000 l     F .text.emit	00000032 emit
00000000 l    d  .text.emit	00000000 .text.emit
00000000 l    d  .text.conversion	00000000 .text.conversion
00000000 l     F .text.text	0000003b text
00000000 l     F .text.number	00000103 number
00000000 l     F .text.hms	00000078 hms
00000000 l     F .text.iso	000000d7 iso
00000000 l     F .text.date	0000008c date
00000000 l     F .text.ampm	0000001d ampm
00000000 l    d  .text.text	00000000 .text.text
00000000 l    d  .text.number	00000000 .text.number
00000000 l    d  .text.hms	00000000 .text.hms
00000000 l    d  .text.date	00000000 .text.date
00000000 l    d  .text.iso	00000000 .text.iso
00000000 l    d  .text.ampm	00000000 .text.ampm
00000000 g     F .text.strftime	000000bd strftime
00000000         *UND*	00000000 __avm_umulhisi3
00000000         *UND*	00000000 __avm_time_weekdays
00000000         *UND*	00000000 __avm_time_months
00000000         *UND*	00000000 __avm_time_floor
00000000         *UND*	00000000 __avm_divsi3
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_udivsi3
00000000         *UND*	00000000 __avm_udivmodsi4
00000000         *UND*	00000000 __avm_time_days
00000000         *UND*	00000000 __avm_modsi3
00000000         *UND*	00000000 __avm_time_civil

Disassembly of section .text.strftime:

<strftime>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 17                 mov	r2, r7
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 39 04              stsp16	[sp+0x4], r1
 f0 38 02              stsp16	[sp+0x2], r0
 46                    ld8u	r5, [r6]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x88
<L0>:
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f1 1e                 mov	r3, r6
 f4 ab                 inc16	r3
 cd 25                 cmpi.s8	r5, 0x25
 f6 45                 sext8	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x68
<L1>:
 f1 1e                 mov	r3, r6
 f0 0b 02              addi.s8	r3, 0x2
 ed ac 21              ld8u	r5, [r6+1]
 cd 4f                 cmpi.s8	r5, 0x4f
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x4a
<L2>:
 cd 45                 cmpi.s8	r5, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x51
<L3>:
 ed ac 22              ld8u	r5, [r6+2]
 ca 03                 addi.s8	r6, 0x3
 f1 1e                 mov	r3, r6
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x97
<L4>:
 f6 45                 sext8	r5
 f0 14 02              leasp	r4, 0x2
 f1 2a                 mov	r6, r2
 e3 00 00 00           callf	strftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion
 e2 00 00 00           jmpf	strftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strftime+0x6f
 f0 14 02              leasp	r4, 0x2
 e3 00 00 00           callf	strftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 2b                 mov	r6, r3
 f4 20                 ldsp16	r4, [sp+0x8]
 46                    ld8u	r5, [r6]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x99
<L5>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0x24
<L6>:
 e2 00 00 00           jmpf	strftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strftime+0x99
 c1 01                 ldi8	r5, 0x1
 a0                    xor	r4, r4
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0xb6
<L7>:
 e2 00 00 00           jmpf	strftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strftime+0xa6
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 f8 05                 cset.eq	r5
 a0                    xor	r4, r4
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0xb6
<L8>:
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strftime
		R_AVM_FAR24	.text.strftime+0xb6
<L9>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 04                 add	r0, r4
 a5                    xor	r5, r5
 ee a0 20              st8	[r0+0], r5
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.emit:

<emit>:
 ed d8 26              ld16	r6, [r4+6]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	emit
		R_AVM_FAR24	.text.emit+0xc
<L0>:
 ef                    ret
 ed d8 24              ld16	r6, [r4+4]
 ed f8 22              ld16	r7, [r4+2]
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	emit
		R_AVM_FAR24	.text.emit+0x2c
<L1>:
 2e                    sub	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	emit
		R_AVM_FAR24	.text.emit+0x2c
<L2>:
 0e                    mov	r7, r6
 f4 af                 inc16	r7
 ee f8 24              st16	[r4+4], r7
 60                    ld16	r4, [r4]
 12                    add	r4, r6
 51                    st8	[r4], r5
 ef                    ret
 c1 01                 ldi8	r5, 0x1
 ee b8 26              st16	[r4+6], r5
 ef                    ret

Disassembly of section .text.conversion:

<conversion>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f1 1e                 mov	r3, r6
 f1 14                 mov	r2, r4
 ed f6 2a              ld16	r7, [r3+10]
 0b                    mov	r6, r7
 fa ef                 asr16i	r7, 0xf
 f0 04 6c 07           ldi16	r0, 0x76c
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 cd 61                 cmpi.s8	r5, 0x61
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x72
<L0>:
 cd 4d                 cmpi.s8	r5, 0x4d
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x153
<L1>:
 cd 56                 cmpi.s8	r5, 0x56
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x1ee
<L2>:
 cd 53                 cmpi.s8	r5, 0x53
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x386
<L3>:
 cd 53                 cmpi.s8	r5, 0x53
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x52d
<L4>:
 cd 54                 cmpi.s8	r5, 0x54
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x481
<L5>:
 cd 55                 cmpi.s8	r5, 0x55
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L6>:
 ed b6 2c              ld16	r5, [r3+12]
 01                    mov	r4, r5
 fa cf                 asr16i	r5, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ed b6 2e              ld16	r5, [r3+14]
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 7e                 sub32	q3, q2
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x400
 cd 6e                 cmpi.s8	r5, 0x6e
 d3 04                 brslt8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x190
<L7>:
 cd 67                 cmpi.s8	r5, 0x67
 d3 04                 brslt8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x267
<L8>:
 cd 64                 cmpi.s8	r5, 0x64
 d3 04                 brslt8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x446
<L9>:
 cd 61                 cmpi.s8	r5, 0x61
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x23c
<L10>:
 cd 62                 cmpi.s8	r5, 0x62
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x2bc
<L11>:
 cd 63                 cmpi.s8	r5, 0x63
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L12>:
 f0 3b 00              stsp16	[sp+0x0], r3
 ed d6 2c              ld16	r6, [r3+12]
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0xce
<L13>:
 c1 0a                 ldi8	r5, 0xa
 02                    mov	r4, r6
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 d6 fe                 adjsp	-0x2
 c2 03                 ldi8	r6, 0x3
 f4 42                 stsp16	[sp+0x0], r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_time_weekdays
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_time_weekdays
 f7 6e                 add32	q3, q2
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.text
 d6 02                 adjsp	0x2
 c1 20                 ldi8	r5, 0x20
 f1 1a                 mov	r3, r2
 f1 22                 mov	r4, r2
 f1 15                 mov	r2, r5
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 28              ld16	r4, [r4+8]
 cc 0c                 cmpi.s8	r4, 0xc
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x104
<L14>:
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 d6 fe                 adjsp	-0x2
 c2 03                 ldi8	r6, 0x3
 f4 42                 stsp16	[sp+0x0], r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_time_months
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_time_months
 f7 6e                 add32	q3, q2
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.text
 d6 02                 adjsp	0x2
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 2a                 mov	r6, r2
 f0 32 00              ldsp16	r2, [sp+0x0]
 ed 94 26              ld16	r4, [r2+6]
 d6 fd                 adjsp	-0x3
 c1 02                 ldi8	r5, 0x2
 f4 41                 stsp16	[sp+0x0], r5
 f1 3a                 stsp8	[sp+0x2], r6
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 f1 23                 mov	r4, r3
 c1 20                 ldi8	r5, 0x20
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 aa                    xor	r6, r6
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hms
 f1 23                 mov	r4, r3
 c1 20                 ldi8	r5, 0x20
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 d6 fd                 adjsp	-0x3
 c0 30                 ldi8	r4, 0x30
 f1 38                 stsp8	[sp+0x2], r4
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f1 23                 mov	r4, r3
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55e
 cd 44                 cmpi.s8	r5, 0x44
 d9 04                 brsge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x224
<L15>:
 cd 47                 cmpi.s8	r5, 0x47
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x325
<L16>:
 cd 47                 cmpi.s8	r5, 0x47
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x416
<L17>:
 cd 48                 cmpi.s8	r5, 0x48
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4a1
<L18>:
 cd 49                 cmpi.s8	r5, 0x49
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L19>:
 ed b6 24              ld16	r5, [r3+4]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 02                 ldi8	r6, 0x2
 f4 42                 stsp16	[sp+0x0], r6
 c2 0c                 ldi8	r6, 0xc
 ec ee                 srem16	r5, r6
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x554
 cd 75                 cmpi.s8	r5, 0x75
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x283
<L20>:
 cd 78                 cmpi.s8	r5, 0x78
 d9 04                 brsge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x462
<L21>:
 cd 78                 cmpi.s8	r5, 0x78
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x48f
<L22>:
 cd 79                 cmpi.s8	r5, 0x79
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x506
<L23>:
 cd 7a                 cmpi.s8	r5, 0x7a
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L24>:
 ed b6 30              ld16	r5, [r3+16]
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L25>:
 c1 2b                 ldi8	r5, 0x2b
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f0 01 30              ldi8	r1, 0x30
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4ac
 cd 58                 cmpi.s8	r5, 0x58
 d9 04                 brsge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x3cd
<L26>:
 cd 58                 cmpi.s8	r5, 0x58
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x481
<L27>:
 cd 59                 cmpi.s8	r5, 0x59
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4f4
<L28>:
 cd 5a                 cmpi.s8	r5, 0x5a
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L29>:
 c1 55                 ldi8	r5, 0x55
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 c1 54                 ldi8	r5, 0x54
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 c1 43                 ldi8	r5, 0x43
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4aa
 cd 42                 cmpi.s8	r5, 0x42
 d3 04                 brslt8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x29f
<L30>:
 cd 25                 cmpi.s8	r5, 0x25
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x49b
<L31>:
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L32>:
 ed d6 2c              ld16	r6, [r3+12]
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L33>:
 f0 01 0a              ldi8	r1, 0xa
 c3 03                 ldi8	r7, 0x3
 cd 61                 cmpi.s8	r5, 0x61
 f1 19                 mov	r3, r1
 fb 1f                 cmov.eq	r3, r7
 02                    mov	r4, r6
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_time_weekdays
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_time_weekdays
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x2e0
 cd 6a                 cmpi.s8	r5, 0x6a
 d3 04                 brslt8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x2f0
<L34>:
 cd 67                 cmpi.s8	r5, 0x67
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x416
<L35>:
 cd 68                 cmpi.s8	r5, 0x68
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L36>:
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x2bc
 cd 72                 cmpi.s8	r5, 0x72
 d3 04                 brslt8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x30f
<L37>:
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4a8
<L38>:
 cd 70                 cmpi.s8	r5, 0x70
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L39>:
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4e0
 cd 42                 cmpi.s8	r5, 0x42
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x2bc
<L40>:
 cd 43                 cmpi.s8	r5, 0x43
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L41>:
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_floor
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x406
 ed d6 28              ld16	r6, [r3+8]
 ce 0c                 cmpi.s8	r6, 0xc
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L42>:
 f0 01 03              ldi8	r1, 0x3
 c3 0a                 ldi8	r7, 0xa
 cd 42                 cmpi.s8	r5, 0x42
 fb 0f                 cmov.eq	r1, r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 d6 fe                 adjsp	-0x2
 f0 39 00              stsp16	[sp+0x0], r1
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_time_months
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_time_months
 f7 6e                 add32	q3, q2
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.text
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x564
 cd 6a                 cmpi.s8	r5, 0x6a
 d1 04                 brne8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4b4
<L43>:
 cd 6d                 cmpi.s8	r5, 0x6d
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L44>:
 ed b6 28              ld16	r5, [r3+8]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 02                 ldi8	r6, 0x2
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4bf
 cd 72                 cmpi.s8	r5, 0x72
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4cd
<L45>:
 cd 74                 cmpi.s8	r5, 0x74
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L46>:
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4aa
 cd 44                 cmpi.s8	r5, 0x44
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x48f
<L47>:
 cd 46                 cmpi.s8	r5, 0x46
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L48>:
 d6 fd                 adjsp	-0x3
 c1 04                 ldi8	r5, 0x4
 f4 41                 stsp16	[sp+0x0], r5
 c1 30                 ldi8	r5, 0x30
 f1 39                 stsp8	[sp+0x2], r5
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 c1 2d                 ldi8	r5, 0x2d
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 96 28              ld16	r4, [r3+8]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 d6 fd                 adjsp	-0x3
 f0 00 30              ldi8	r0, 0x30
 f0 28 02              stsp8	[sp+0x2], r0
 f0 01 02              ldi8	r1, 0x2
 f0 39 00              stsp16	[sp+0x0], r1
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 f1 22                 mov	r4, r2
 c1 2d                 ldi8	r5, 0x2d
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 96 26              ld16	r4, [r3+6]
 d6 fd                 adjsp	-0x3
 f0 28 02              stsp8	[sp+0x2], r0
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x3c2
 cd 4d                 cmpi.s8	r5, 0x4d
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x534
<L49>:
 cd 52                 cmpi.s8	r5, 0x52
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L50>:
 ed b6 24              ld16	r5, [r3+4]
 d6 fd                 adjsp	-0x3
 c0 30                 ldi8	r4, 0x30
 f1 38                 stsp8	[sp+0x2], r4
 f0 01 02              ldi8	r1, 0x2
 f0 39 00              stsp16	[sp+0x0], r1
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 c1 3a                 ldi8	r5, 0x3a
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 96 22              ld16	r4, [r3+2]
 d6 fd                 adjsp	-0x3
 c1 30                 ldi8	r5, 0x30
 f1 39                 stsp8	[sp+0x2], r5
 f0 39 00              stsp16	[sp+0x0], r1
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55c
 cd 56                 cmpi.s8	r5, 0x56
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x416
<L51>:
 cd 57                 cmpi.s8	r5, 0x57
 d0 04                 breq8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L52>:
 ed b6 2c              ld16	r5, [r3+12]
 c9 06                 addi.s8	r5, 0x6
 c2 07                 ldi8	r6, 0x7
 ec ee                 srem16	r5, r6
 aa                    xor	r6, r6
 29                    sub	r6, r5
 06                    mov	r5, r6
 fa cf                 asr16i	r5, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f4 49                 stsp16	[sp+0x2], r5
 ed b6 2e              ld16	r5, [r3+14]
 01                    mov	r4, r5
 fa cf                 asr16i	r5, 0xf
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d6 fd                 adjsp	-0x3
 c0 30                 ldi8	r4, 0x30
 f1 38                 stsp8	[sp+0x2], r4
 c0 02                 ldi8	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55c
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 17 08              leasp	r7, 0x8
 f0 10 04              leasp	r0, 0x4
 f1 23                 mov	r4, r3
 f1 15                 mov	r2, r5
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.iso
 f1 1a                 mov	r3, r2
 f0 0f 47              cmpi.s8	r3, 0x47
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x4ec
<L53>:
 f0 0f 56              cmpi.s8	r3, 0x56
 d0 04                 breq8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x56b
<L54>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x58a
 09                    mov	r6, r5
 ca 9c                 addi.s8	r6, -0x64
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L55>:
 c2 30                 ldi8	r6, 0x30
 c3 20                 ldi8	r7, 0x20
 cd 65                 cmpi.s8	r5, 0x65
 fb 37                 cmov.eq	r6, r7
 ed b6 26              ld16	r5, [r3+6]
 d6 fd                 adjsp	-0x3
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x53b
 cd 75                 cmpi.s8	r5, 0x75
 d1 04                 brne8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x545
<L56>:
 cd 77                 cmpi.s8	r5, 0x77
 d0 04                 breq8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	conversion
		R_AVM_FAR24	.text.conversion+0x564
<L57>:
 ed b6 2c              ld16	r5, [r3+12]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 01                 ldi8	r6, 0x1
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x53f
 af                    xor	r7, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 0b                    mov	r6, r7
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hms
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x564
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.date
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x564
 c1 25                 ldi8	r5, 0x25
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x4aa
 ed b6 24              ld16	r5, [r3+4]
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x537
 c1 0a                 ldi8	r5, 0xa
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x564
 ed b6 2e              ld16	r5, [r3+14]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 03                 ldi8	r6, 0x3
 f4 42                 stsp16	[sp+0x0], r6
 01                    mov	r4, r5
 fa cf                 asr16i	r5, 0xf
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55c
 c3 01                 ldi8	r7, 0x1
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 0b                    mov	r6, r7
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hms
 c1 20                 ldi8	r5, 0x20
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ampm
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x564
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x58a
 d6 fd                 adjsp	-0x3
 c1 30                 ldi8	r5, 0x30
 f1 39                 stsp8	[sp+0x2], r5
 c1 04                 ldi8	r5, 0x4
 f4 41                 stsp16	[sp+0x0], r5
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55e
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_floor
 c6 9c ff              ldi16	r6, 0xff9c
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 02                 ldi8	r6, 0x2
 f4 42                 stsp16	[sp+0x0], r6
 f7 62                 add32	q0, q2
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55e
 ed b6 20              ld16	r5, [r3+0]
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x537
 ed b6 22              ld16	r5, [r3+2]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 02                 ldi8	r6, 0x2
 f4 42                 stsp16	[sp+0x0], r6
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x558
 ed b6 2c              ld16	r5, [r3+12]
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 01                 ldi8	r6, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 c2 07                 ldi8	r6, 0x7
 f6 2d                 tst16	r5
 fb 2e                 cmov.eq	r5, r6
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_floor
 c6 9c ff              ldi16	r6, 0xff9c
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 1a                 mov	r3, r2
 f7 6c                 add32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 01 02              ldi8	r1, 0x2
 f0 00 04              ldi8	r0, 0x4
 f0 0f 47              cmpi.s8	r3, 0x47
 fb 08                 cmov.eq	r1, r0
 d6 fd                 adjsp	-0x3
 c1 30                 ldi8	r5, 0x30
 f1 39                 stsp8	[sp+0x2], r5
 f0 39 00              stsp16	[sp+0x0], r1
 e2 00 00 00           jmpf	conversion
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.conversion+0x55e

Disassembly of section .text.text:

<text>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 f1 14                 mov	r2, r4
 f0 33 0b              ldsp16	r3, [sp+0xb]
 f4 b3                 dec16	r3
 f0 61 a0              ldp8s	r5, [q0]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	text
		R_AVM_FAR24	.text.text+0x36
<L0>:
 ed 94 26              ld16	r4, [r2+6]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	text
		R_AVM_FAR24	.text.text+0x36
<L1>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	text
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f6 2b                 tst16	r3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	text
		R_AVM_FAR24	.text.text+0xb
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.number:

<number>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f2 63                 mov32	q0, q3
 f0 25 1f              ldsp8s	r5, [sp+0x1f]
 f4 61                 stsp16	[sp+0x8], r5
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0x35
<L0>:
 f2 64                 mov32	q1, q0
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0x91
<L1>:
 e2 00 00 00           jmpf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number+0x53
 c1 2d                 ldi8	r5, 0x2d
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 74                 sub32	q1, q0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b4                 dec16	r4
 f4 58                 stsp16	[sp+0x6], r4
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0x91
<L2>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 c2 01                 ldi8	r6, 0x1
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f4 42                 stsp16	[sp+0x0], r6
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 f0 02 09              ldi8	r2, 0x9
 f2 4b                 sub	r3, r3
 f0 69 48              cmp32	q1, q2
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0x60
<L3>:
 e2 00 00 00           jmpf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number+0x98
 c2 01                 ldi8	r6, 0x1
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 18                 ldsp16	r4, [sp+0x6]
 38                    cmp	r6, r4
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0xba
<L4>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b4                 dec16	r4
 38                    cmp	r6, r4
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0xa3
<L5>:
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 fe                 adjsp	-0x2
 f0 14 10              leasp	r4, 0x10
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 08                    mov	r6, r4
 ca 30                 addi.s8	r6, 0x30
 f6 46                 sext8	r6
 f4 10                 ldsp16	r4, [sp+0x4]
 06                    mov	r5, r6
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	number
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivsi3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f0 69 c0              cmp32	q3, q0
 f2 62                 mov32	q0, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	number
		R_AVM_FAR24	.text.number+0xc1
<L6>:
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.hms:

<hms>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 ed b0 24              ld16	r5, [r0+4]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hms
		R_AVM_FAR24	.text.hms+0x1b
<L0>:
 c2 0c                 ldi8	r6, 0xc
 ec ee                 srem16	r5, r6
 f6 2d                 tst16	r5
 fb 2e                 cmov.eq	r5, r6
 d6 fd                 adjsp	-0x3
 f0 03 30              ldi8	r3, 0x30
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 02 02              ldi8	r2, 0x2
 f0 3a 00              stsp16	[sp+0x0], r2
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	hms
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 c1 3a                 ldi8	r5, 0x3a
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	hms
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 90 22              ld16	r4, [r0+2]
 d6 fd                 adjsp	-0x3
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	hms
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 f1 21                 mov	r4, r1
 c1 3a                 ldi8	r5, 0x3a
 e3 00 00 00           callf	hms
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 90 20              ld16	r4, [r0+0]
 d6 fd                 adjsp	-0x3
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	hms
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.date:

<date>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 ed 92 28              ld16	r4, [r1+8]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 d6 fd                 adjsp	-0x3
 c0 30                 ldi8	r4, 0x30
 f1 38                 stsp8	[sp+0x2], r4
 f1 1c                 mov	r3, r4
 f0 02 02              ldi8	r2, 0x2
 f0 3a 00              stsp16	[sp+0x0], r2
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 c1 2f                 ldi8	r5, 0x2f
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 92 26              ld16	r4, [r1+6]
 d6 fd                 adjsp	-0x3
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 f1 20                 mov	r4, r0
 c1 2f                 ldi8	r5, 0x2f
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 ed 92 2a              ld16	r4, [r1+10]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f0 06 6c 07           ldi16	r2, 0x76c
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_floor
 c6 9c ff              ldi16	r6, 0xff9c
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 d6 fd                 adjsp	-0x3
 c2 30                 ldi8	r6, 0x30
 f1 3a                 stsp8	[sp+0x2], r6
 c2 02                 ldi8	r6, 0x2
 f4 42                 stsp16	[sp+0x0], r6
 f7 66                 add32	q1, q2
 f1 20                 mov	r4, r0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	date
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.number
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.iso:

<iso>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 42                 stsp16	[sp+0x0], r6
 f4 49                 stsp16	[sp+0x2], r5
 ed 18 28              ld16	r0, [r4+8]
 ed b8 2a              ld16	r5, [r4+10]
 ed 98 26              ld16	r4, [r4+6]
 d6 fc                 adjsp	-0x4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 c4 6c 07              ldi16	r4, 0x76c
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f1 28                 mov	r6, r0
 f1 2c                 mov	r7, r0
 fa ef                 asr16i	r7, 0xf
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_days
 d6 04                 adjsp	0x4
 f2 62                 mov32	q0, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f2 68                 mov32	q2, q0
 c2 07                 ldi8	r6, 0x7
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_modsi3
 d6 fe                 adjsp	-0x2
 f0 16 0c              leasp	r6, 0xc
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 02 07              ldi8	r2, 0x7
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f2 42                 sub	r2, r2
 f0 69 84              cmp32	q2, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f7 72                 sub32	q0, q2
 f0 17 10              leasp	r7, 0x10
 f2 68                 mov32	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_civil
 d6 02                 adjsp	0x2
 f0 6a 80              ld32	q2, [r0]
 d6 fc                 adjsp	-0x4
 c2 04                 ldi8	r6, 0x4
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 01                 ldi8	r6, 0x1
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_days
 d6 04                 adjsp	0x4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_modsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f2 6a                 mov32	q3, q0
 f2 30                 sub	r0, r0
 f0 69 80              cmp32	q2, q0
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 74                 sub32	q1, q0
 f7 69                 add32	q2, q1
 e3 00 00 00           callf	iso
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.ampm:

<ampm>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 9a 24              ld16	r4, [r5+4]
 c1 50                 ldi8	r5, 0x50
 c2 41                 ldi8	r6, 0x41
 cc 0c                 cmpi.s8	r4, 0xc
 fd 2e                 cmov.slt	r5, r6
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	ampm
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
 c1 4d                 ldi8	r5, 0x4d
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 e2 00 00 00           jmpf	ampm
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.emit
