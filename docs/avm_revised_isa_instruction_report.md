# Proposed AVM ISA Instruction Inventory and AVR Cycle Estimates

**Status:** Design report for the proposed accumulator/compact-register ISA overhaul  
**Basis:** `interp(15).asm` timing structure and the revised ISA discussed immediately before this report  
**Target interpreter:** ATmega32U4, SPI bytecode stream, fixed-stride primary dispatch

## 1. Scope

This report inventories every architectural instruction form in the proposed revised AVM ISA. It includes the mnemonic, function, encoded byte length, condition-code behavior, and an estimated native AVR execution cost using the current interpreter structure.

A table row represents one architectural instruction form or one encoding form with materially different size or timing. Register-number variants inside a family are not repeated as separate rows because they have the same semantics and estimated timing.

This is a design estimate, not a benchmark. Many extension handlers do not yet exist, so their timings are inferred from the current dispatch macros, SPI cadence, register mapping, and seek helper.

## 2. Architectural conventions used by the report

```text
r0-r7   eight 16-bit architectural registers
c0-c3   compact aliases for r4-r7
A       accumulator alias for c0/r4; no additional storage
q0      r0:r1,  q1 = r2:r3,  q2 = r4:r5,  q3 = r6:r7
CC      architectural condition state containing only C, Z, and S
```

Comparison and test instructions replace CC. The one-byte compact `ADD cD,cS` and `SUB cD,cS` instructions also replace CC because the current direct AVR handlers can capture native `SREG` with no increase over the 17-cycle cadence. All other arithmetic, logical, shift, multiply, move, memory, stack, and address operations preserve CC. A branch or `CSET` reads CC without modifying it.

The comparison meanings are:

| Bit/name | Meaning after CMP/TST |
|---|---|
| `C` | unsigned left operand is less than unsigned right operand |
| `Z` | operands are equal |
| `S` | signed left operand is less than signed right operand |

For the one-byte compact arithmetic instructions, CC is the native 16-bit AVR result of the direct byte-pair operation:

| Instruction | `C` | `Z` | `S` |
|---|---|---|---|
| `ADD cD,cS` | carry out of bit 15 | 16-bit result is zero | native `N xor V` for the 16-bit result |
| `SUB cD,cS` | borrow from bit 15 | 16-bit result is zero | signed original `cD` is less than `cS` |

The interpreter may retain other native `SREG` bits internally, but they are not architectural and software must not depend on them.

## 3. Revised `RRSPEC` encoding

`RRSPEC` remains one byte containing two four-bit register fields:

```text
bits 7:4   operand 0 register
bits 3:0   operand 1 register
```

Each nibble stores the register index already multiplied by two:

| AVM register | Nibble | Effective AVR low-byte address |
|---|---:|---:|
| `r0` | `0x0` | `0x08` (`AVR r8`) |
| `r1` | `0x2` | `0x0A` (`AVR r10`) |
| `r2` | `0x4` | `0x0C` (`AVR r12`) |
| `r3` | `0x6` | `0x0E` (`AVR r14`) |
| `r4` | `0x8` | `0x10` (`AVR r16`) |
| `r5` | `0xA` | `0x12` (`AVR r18`) |
| `r6` | `0xC` | `0x14` (`AVR r20`) |
| `r7` | `0xE` | `0x16` (`AVR r22`) |

The effective native data-space address is therefore:

```text
AVR_low_byte_address = 8 + encoded_nibble
```

For a two-register instruction, operand 0 is encoded in the high nibble and operand 1 in the low nibble. Thus `LD8 rD,[rA]` encodes `rD` high and `rA` low, while `ST8 [rA],rS` encodes `rA` high and `rS` low.

A handler can decode each field without a shift:

```asm
; Low-nibble operand
mov  r26, r6
andi r26, 0x0E
subi r26, -8

; High-nibble operand
mov  r26, r6
swap r26
andi r26, 0x0E
subi r26, -8
```

Compared with the previous three-bit register index, this removes one `LSL` per decoded register. Ordinary two-register `RRSPEC` instructions are therefore estimated two AVR cycles faster.

## 4. Cycle-estimation model

Cycle counts are measured from entry to the current primary-opcode handler through entry to the next primary-opcode handler. Thus they include operand fetch, secondary dispatch, instruction work, and dispatch of the following instruction.

| Component | Estimate |
|---|---:|
| One-byte sequential primary instruction | about 17 cycles |
| Each additional sequential byte when fully pipelined | about 17 cycles |
| Two-byte operand-specialized extension | about 34 cycles |
| Three-byte sequential instruction before extra decode work | about 51 cycles |
| Four-byte sequential instruction before extra decode work | about 68 cycles |
| Decode both registers from revised pre-scaled `RRSPEC` | about 2 cycles less than the old index encoding |
| One current-style SPI stream restart and target dispatch | about 105 cycles |
| Program-space scalar load | two stream seeks plus one or two data transfers |

`NT` and `T` mean not taken and taken. For variable shifts, `n` is the masked run-time shift count. At 16 MHz, 16 AVR cycles are approximately 1 microsecond.

## 5. Exhaustive instruction tables

### 5.1. Primary compact and hot instructions

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `00/05/0A/0F` | `CLR cD` | Set the selected compact 16-bit register to zero. | 1 | ≈17 | Preserve |  |
| `00–0F, off-diagonal` | `MOV cD,cS` | Copy one compact 16-bit register to another. | 1 | ≈17 | Preserve |  |
| `10–1F` | `LD8 cD,[cS]` | Load one data-space byte through a compact address register and zero-extend it. | 1 | ≈17 | Preserve |  |
| `20–2F` | `ST8 [cD],cS` | Store the low byte of a compact source register through a compact address register. | 1 | ≈17 | Preserve |  |
| `30–3F` | `LD16 cD,[cS]` | Load a little-endian 16-bit word through a compact address register. | 1 | ≈17 | Preserve |  |
| `40–4F` | `ST16 [cD],cS` | Store a little-endian 16-bit word through a compact address register. | 1 | ≈17 | Preserve |  |
| `50–57` | `AND A,rS` | A = A & rS, where A is the alias of c0/r4. | 1 | ≈17 | Preserve |  |
| `58–5F` | `OR A,rS` | A = A \| rS. | 1 | ≈17 | Preserve |  |
| `60–67` | `XOR A,rS` | A = A ^ rS. | 1 | ≈17 | Preserve |  |
| `68–6F` | `BIC A,rS` | A = A & ~rS. | 1 | ≈17 | Preserve | A specialized handler can use MOVW+COM+COM+AND+AND and still fit the current one-byte cadence. |
| `70–77` | `PUSH16 rS` | Decrement SP by two and push a 16-bit register in little-endian stack order. | 1 | ≈17 | Preserve |  |
| `78–7F` | `POP16 rD` | Pop a 16-bit register and increment SP by two. | 1 | ≈17 | Preserve |  |
| `80–8F` | `ADD cD,cS` | cD = cD + cS modulo 2^16. | 1 | ≈17 | Replace C/Z/S | Uses the current `ADD`/`ADC`/`IN SREG` sequence; flag capture has no cycle penalty. |
| `90–9F` | `SUB cD,cS` | cD = cD - cS modulo 2^16. | 1 | ≈17 | Replace C/Z/S | Uses the current `SUB`/`SBC`/`IN SREG` sequence; flag capture has no cycle penalty. |
| `A0–AF, off-diagonal` | `CMP16 cL,cR` | Set CC from a 16-bit comparison without changing operands. | 1 | ≈17 | Replace C/Z/S |  |
| `A0/A5/AA/AF` | `TST16 cN` | Set CC from a 16-bit comparison against zero. | 1 | ≈17 | Replace C/Z/S |  |
| `B0–BF, off-diagonal` | `CMP8 cL,cR` | Set CC from an 8-bit comparison of the low bytes. | 1 | ≈17 | Replace C/Z/S |  |
| `B0/B5/BA/BF` | `TST8 cN` | Set CC from an 8-bit comparison of the low byte against zero. | 1 | ≈17 | Replace C/Z/S |  |
| `C0–CF` | `BEQ.S disp4` | Branch when Z=1 using the embedded displacement set {-9..-2,+1..+8}. | 1 | NT ≈17; T ≈114 | Read |  |
| `D0–DF` | `BNE.S disp4` | Branch when Z=0 using the embedded displacement set {-9..-2,+1..+8}. | 1 | NT ≈17; T ≈114 | Read |  |

### 5.2. E0 miscellaneous extension page

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E0 00–07` | `NOT16 rN` | Bitwise complement a 16-bit register. | 2 | ≈34 | Preserve |  |
| `E0 08–0F` | `NEG16 rN` | Two's-complement negate a 16-bit register. | 2 | ≈34 | Preserve |  |
| `E0 10–17` | `INC16 rN` | Increment a 16-bit register modulo 2^16. | 2 | ≈34 | Preserve |  |
| `E0 18–1F` | `DEC16 rN` | Decrement a 16-bit register modulo 2^16. | 2 | ≈34 | Preserve |  |
| `E0 20–27` | `LSL16 rN` | Shift a 16-bit register left by one; zero enters bit 0. | 2 | ≈34 | Preserve |  |
| `E0 28–2F` | `LSR16 rN` | Logical right shift a 16-bit register by one. | 2 | ≈34 | Preserve |  |
| `E0 30–37` | `ASR16 rN` | Arithmetic right shift a 16-bit register by one. | 2 | ≈34 | Preserve |  |
| `E0 38–3F` | `LSR8 rN` | Logical right shift only the low byte; preserve the high byte. | 2 | ≈34 | Preserve |  |
| `E0 40–47` | `ASR8 rN` | Arithmetic right shift only the low byte; preserve the high byte. | 2 | ≈34 | Preserve |  |
| `E0 48–4F` | `ZEXT8 rN` | Zero-extend the low byte through the high byte. | 2 | ≈34 | Preserve |  |
| `E0 50–57` | `SEXT8 rN` | Sign-extend the low byte through the high byte. | 2 | ≈34 | Preserve |  |
| `E0 58–5F` | `SWAP8 rN` | Swap the high and low nibbles of the low byte. | 2 | ≈34 | Preserve |  |
| `E0 60–67` | `GETSP rN` | Copy the VM stack pointer into rN. | 2 | ≈34 | Preserve |  |
| `E0 68–6F` | `SETSP rN` | Replace the VM stack pointer with rN. | 2 | ≈34 | Preserve |  |
| `E0 70–77` | `MTPB rN` | PB = low8(rN). | 2 | ≈34 | Preserve |  |
| `E0 78–7F` | `MFPB rN` | rN = zero_extend(PB). | 2 | ≈34 | Preserve |  |
| `E0 80–87 + imm16` | `LDI16 rN,imm16` | Load a 16-bit immediate. | 4 | ≈68 | Preserve |  |
| `E0 88–8F + imm8` | `LDI8 rN,imm8` | Load an 8-bit immediate and zero-extend it. | 3 | ≈51 | Preserve |  |
| `E0 90–97 + imm16` | `ADDI16 rN,imm16` | Add a 16-bit immediate modulo 2^16. | 4 | ≈68–70 | Preserve |  |
| `E0 98–9F + imm16` | `SUBI16 rN,imm16` | Subtract a 16-bit immediate modulo 2^16. | 4 | ≈68–70 | Preserve |  |
| `E0 A0–A7 + imm16` | `ANDI16 rN,imm16` | Bitwise AND with a 16-bit immediate. | 4 | ≈68–70 | Preserve |  |
| `E0 A8–AF + imm16` | `ORI16 rN,imm16` | Bitwise OR with a 16-bit immediate. | 4 | ≈68–70 | Preserve |  |
| `E0 B0–B7 + imm16` | `XORI16 rN,imm16` | Bitwise XOR with a 16-bit immediate. | 4 | ≈68–70 | Preserve |  |
| `E0 B8–BF + imm16` | `CMPI16 rN,imm16` | Set CC from a 16-bit register/immediate comparison. | 4 | ≈69–71 | Replace C/Z/S |  |
| `E0 C0–C7 + imm8` | `CMPI8 rN,imm8` | Set CC from an 8-bit low-byte/immediate comparison. | 3 | ≈52–54 | Replace C/Z/S |  |
| `E0 C8–CF` | `JMPR rN` | Jump within the current code bank to PC=rN. | 2 | ≈134 | Preserve | Requires one SPI stream restart. |
| `E0 D0–D7` | `CALLR rN` | Push the three-byte return address, then jump within the current code bank to PC=rN. | 2 | ≈141 | Preserve | Requires one SPI stream restart. |
| `E0 D8–DF` | `JMPP rN` | Far jump to PB:rN and copy PB into CB. | 2 | ≈136 | Preserve | Requires one SPI stream restart. |
| `E0 E0–E7` | `CALLP rN` | Push the return address and far-call PB:rN. | 2 | ≈143 | Preserve | Requires one SPI stream restart. |
| `E0 E8–EF` | `TST16 rN` | Set CC from a full-register 16-bit comparison against zero. | 2 | ≈34 | Replace C/Z/S |  |
| `E0 F0–F7` | `TST8 rN` | Set CC from a full-register low-byte comparison against zero. | 2 | ≈34 | Replace C/Z/S |  |
| `E0 F8–FF` | `Reserved` | Reserved for future miscellaneous instructions. | — | — | — |  |

### 5.3. E1 32-bit pair ALU extension page

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E1 0dddss` | `MOV32 qD,qS` | Copy one aligned 32-bit register pair to another. | 2 | ≈34 | Preserve |  |
| `E1 1dddss` | `ADD32 qD,qS` | qD = qD + qS modulo 2^32. | 2 | ≈34–36 | Preserve |  |
| `E1 2dddss` | `SUB32 qD,qS` | qD = qD - qS modulo 2^32. | 2 | ≈34–36 | Preserve |  |
| `E1 3dddss` | `AND32 qD,qS` | 32-bit bitwise AND. | 2 | ≈34–36 | Preserve |  |
| `E1 4dddss` | `OR32 qD,qS` | 32-bit bitwise OR. | 2 | ≈34–36 | Preserve |  |
| `E1 5dddss` | `XOR32 qD,qS` | 32-bit bitwise XOR. | 2 | ≈34–36 | Preserve |  |
| `E1 6dddss` | `CMP32 qL,qR` | Set CC from a 32-bit comparison. | 2 | ≈35–37 | Replace C/Z/S |  |
| `E1 7dddss` | `SHL32V qD,qS` | Shift qD left by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 8dddss` | `LSR32V qD,qS` | Logical right shift qD by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 9dddss` | `ASR32V qD,qS` | Arithmetic right shift qD by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 Adddss–Fdddss` | `Reserved` | Reserved pair-page operations. | — | — | — |  |

### 5.4. E2 accumulator ALU extension page

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E2 00sss` | `MOV A,rS` | Copy any 16-bit register into A. | 2 | ≈34 | Preserve |  |
| `E2 01sss` | `ADD A,rS` | A = A + rS modulo 2^16. | 2 | ≈34 | Preserve |  |
| `E2 02sss` | `SUB A,rS` | A = A - rS modulo 2^16. | 2 | ≈34 | Preserve |  |
| `E2 03sss` | `AND A,rS` | A = A & rS. | 2 | ≈34 | Preserve | Assembler should prefer the one-byte 50–57 form. |
| `E2 04sss` | `OR A,rS` | A = A \| rS. | 2 | ≈34 | Preserve | Assembler should prefer the one-byte 58–5F form. |
| `E2 05sss` | `XOR A,rS` | A = A ^ rS. | 2 | ≈34 | Preserve | Assembler should prefer the one-byte 60–67 form. |
| `E2 06sss` | `BIC A,rS` | A = A & ~rS. | 2 | ≈34 | Preserve | Assembler should prefer the one-byte 68–6F form. |
| `E2 07sss` | `CMP16 A,rS` | Set CC from a 16-bit comparison. | 2 | ≈34 | Replace C/Z/S |  |
| `E2 08sss` | `CMP8 A,rS` | Set CC from a low-byte comparison. | 2 | ≈34 | Replace C/Z/S |  |
| `E2 09sss` | `MULU8 A,rS` | A = unsigned(low8(A)) × unsigned(low8(rS)). | 2 | ≈34–36 | Preserve |  |
| `E2 0Asss` | `MULS8 A,rS` | A = signed(low8(A)) × signed(low8(rS)). | 2 | ≈34–38 | Preserve |  |
| `E2 0Bsss` | `MULSU8 A,rS` | A = signed(low8(A)) × unsigned(low8(rS)). | 2 | ≈34–38 | Preserve |  |
| `E2 0Csss` | `SHL16V A,rS` | Shift A left by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); about 38–113 cycles. |
| `E2 0Dsss` | `LSR16V A,rS` | Logical right shift A by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); about 38–113 cycles. |
| `E2 0Esss` | `ASR16V A,rS` | Arithmetic right shift A by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); about 38–113 cycles. |
| `E2 0Fsss–1Fsss` | `Reserved` | Reserved accumulator operations. | — | — | — |  |

### 5.5. E3 register transfer and condition extension page

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E3 00dddsss` | `MOV16 rD,rS` | Copy any 16-bit architectural register to any other. | 2 | ≈34 | Preserve |  |
| `E3 01dddsss` | `MOV8Z rD,bS` | Copy a low byte and zero-extend it to 16 bits. | 2 | ≈34 | Preserve |  |
| `E3 10dddsss` | `MOV8S rD,bS` | Copy a low byte and sign-extend it to 16 bits. | 2 | ≈34 | Preserve |  |
| `E3 11cccddd` | `CSET rD,cc` | Materialize an AVM condition as 0 or 1 in rD. | 2 | ≈34–38 | Read | cc encodes EQ, NE, ULT, UGE, SLT, SGE, ULE, or UGT. |

### 5.6. Direct primary immediate, control, and system instructions

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E4 operand` | `CMPI6 cN,simm6` | Compare a compact register with a signed six-bit immediate packed with the register field. | 2 | ≈38–42 | Replace C/Z/S | Still needs one compact-register address decode unless split into four primary opcodes. |
| `E5 rel8` | `JMP rel8` | Unconditional same-bank PC-relative jump from nextPC. | 2 | ≈130–134 | Preserve |  |
| `E6 rel8` | `CALL rel8` | Push the return address and perform a same-bank PC-relative call. | 2 | ≈137–141 | Preserve |  |
| `E7 simm8` | `ADJSP simm8` | SP = SP + sign_extend(simm8). | 2 | ≈34 | Preserve |  |
| `E8 imm8` | `LDPBI imm8` | PB = imm8. | 2 | ≈34 | Preserve |  |
| `E9 service8` | `SYS service8` | Invoke a system-ABI service selected by an immediate identifier. | 2 | ≈38 + service | Preserve | Table dispatch and service body make timing service-dependent. |
| `E9 00` | `SYS DEBUG_PUTC` | Write low8(A) to the simulator/debug character output service. | 2 | ≈40–44 | Preserve |  |
| `E9 01` | `SYS DEBUG_BREAK` | Execute the native AVR BREAK service. | 2 | Stops; ≈39 if resumed | Preserve |  |
| `EA addr16` | `JMP16 addr16` | Absolute same-bank jump to a 16-bit PC. | 3 | ≈147–151 | Preserve |  |
| `EB addr16` | `CALL16 addr16` | Push the return address and call an absolute 16-bit PC in the current bank. | 3 | ≈154–158 | Preserve |  |
| `EC` | `NOP` | No architectural effect. | 1 | ≈17 | Preserve |  |
| `ED–EF` | `Reserved` | Reserved primary opcodes. | — | — | — |  |

### 5.7. F0-FC compact immediates, compact ALU page, and branches

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `F0–F3 imm8` | `LDI8 cD,imm8` | Load an 8-bit immediate into a compact register and zero-extend it. | 2 | ≈34 | Preserve |  |
| `F4 0dddss` | `MOV cD,cS (extended)` | Alternate compact-page move. | 2 | ≈34 | Preserve | Normally dominated by the one-byte primary MOV encoding. |
| `F4 1dddss` | `ADD.NF cD,cS` | Non-flagging compact-page 16-bit add. | 2 | ≈34 | Preserve | Use when CC must survive; otherwise prefer the one-byte flag-producing `ADD`. |
| `F4 2dddss` | `SUB.NF cD,cS` | Non-flagging compact-page 16-bit subtract. | 2 | ≈34 | Preserve | Use when CC must survive; otherwise prefer the one-byte flag-producing `SUB`. |
| `F4 3dddss` | `AND cD,cS` | Compact 16-bit bitwise AND. | 2 | ≈34 | Preserve |  |
| `F4 4dddss` | `OR cD,cS` | Compact 16-bit bitwise OR. | 2 | ≈34 | Preserve |  |
| `F4 5dddss` | `XOR cD,cS` | Compact 16-bit bitwise XOR. | 2 | ≈34 | Preserve |  |
| `F4 6dddss` | `BIC cD,cS` | Compact 16-bit bit clear: cD = cD & ~cS. | 2 | ≈34 | Preserve |  |
| `F4 7dddss` | `CMP16 cL,cR (extended)` | Alternate compact-page 16-bit compare. | 2 | ≈34 | Replace C/Z/S | Normally dominated by the one-byte primary CMP16 encoding. |
| `F4 8dddss` | `CMP8 cL,cR (extended)` | Alternate compact-page low-byte compare. | 2 | ≈34 | Replace C/Z/S | Normally dominated by the one-byte primary CMP8 encoding. |
| `F4 9dddss` | `MULU8 cD,cS` | Unsigned 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–36 | Preserve |  |
| `F4 Adddss` | `MULS8 cD,cS` | Signed 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–38 | Preserve |  |
| `F4 Bdddss` | `MULSU8 cD,cS` | Signed-by-unsigned 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–38 | Preserve |  |
| `F4 Cdddss` | `SHL16V cD,cS` | Shift cD left by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Ddddss` | `LSR16V cD,cS` | Logical right shift cD by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Edddss` | `ASR16V cD,cS` | Arithmetic right shift cD by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Fdddss` | `Reserved` | Reserved compact binary operation. | — | — | — |  |
| `F5 rel8` | `BREQ rel8` | Branch when Z=1. | 2 | NT ≈34; T ≈132 | Read |  |
| `F6 rel8` | `BRNE rel8` | Branch when Z=0. | 2 | NT ≈34; T ≈132 | Read |  |
| `F7 rel8` | `BRULT rel8` | Branch when C=1. | 2 | NT ≈34; T ≈132 | Read |  |
| `F8 rel8` | `BRUGE rel8` | Branch when C=0. | 2 | NT ≈34; T ≈132 | Read |  |
| `F9 rel8` | `BRSLT rel8` | Branch when S=1. | 2 | NT ≈34; T ≈132 | Read |  |
| `FA rel8` | `BRSGE rel8` | Branch when S=0. | 2 | NT ≈34; T ≈132 | Read |  |
| `FB rel8` | `BRULE rel8` | Branch when C\|Z is nonzero. | 2 | NT ≈35–36; T ≈133–134 | Read |  |
| `FC rel8` | `BRUGT rel8` | Branch when C=0 and Z=0. | 2 | NT ≈35–36; T ≈133–134 | Read |  |

### 5.8. FD data-space and program-space extension page

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `FD 00 RRSPEC` | `LD8 rD,[rA]` | Generic register-indirect byte load with zero extension. | 3 | ≈60–64 | Preserve |  |
| `FD 01 RRSPEC` | `ST8 [rA],rS` | Generic register-indirect byte store. | 3 | ≈58–62 | Preserve |  |
| `FD 02 RRSPEC` | `LD16 rD,[rA]` | Generic register-indirect 16-bit load. | 3 | ≈62–66 | Preserve |  |
| `FD 03 RRSPEC` | `ST16 [rA],rS` | Generic register-indirect 16-bit store. | 3 | ≈60–64 | Preserve |  |
| `FD 04 RRSPEC` | `LD8 rD,[rA+]` | Load a byte, zero-extend it, then increment rA by one. | 3 | ≈64–69 | Preserve |  |
| `FD 05 RRSPEC` | `ST8 [rA+],rS` | Store a byte, then increment rA by one. | 3 | ≈62–67 | Preserve |  |
| `FD 06 RRSPEC` | `LD16 rD,[rA+]` | Load a word, then increment rA by two. | 3 | ≈66–71 | Preserve |  |
| `FD 07 RRSPEC` | `ST16 [rA+],rS` | Store a word, then increment rA by two. | 3 | ≈64–69 | Preserve |  |
| `FD 08 RRSPEC disp8` | `LEA rD,[rA+simm8]` | Compute a signed-eight-bit displaced data-space address. | 4 | ≈74–80 | Preserve |  |
| `FD 09 RRSPEC disp8` | `LD8 rD,[rA+simm8]` | Displaced byte load with zero extension. | 4 | ≈78–84 | Preserve |  |
| `FD 0A RRSPEC disp8` | `ST8 [rA+simm8],rS` | Displaced byte store. | 4 | ≈76–82 | Preserve |  |
| `FD 0B RRSPEC disp8` | `LD16 rD,[rA+simm8]` | Displaced 16-bit load. | 4 | ≈80–86 | Preserve |  |
| `FD 0C RRSPEC disp8` | `ST16 [rA+simm8],rS` | Displaced 16-bit store. | 4 | ≈78–84 | Preserve |  |
| `FD 10–17 u8` | `LDSP8 rN,[SP+u8]` | Load a stack-relative byte and zero-extend it. | 3 | ≈58–64 | Preserve |  |
| `FD 18–1F u8` | `STSP8 [SP+u8],rN` | Store a stack-relative byte. | 3 | ≈56–62 | Preserve |  |
| `FD 20–27 u8` | `LDSP16 rN,[SP+u8]` | Load a stack-relative 16-bit word. | 3 | ≈60–66 | Preserve |  |
| `FD 28–2F u8` | `STSP16 [SP+u8],rN` | Store a stack-relative 16-bit word. | 3 | ≈58–64 | Preserve |  |
| `FD 30–37 addr16` | `LDM8 rN,addr16` | Load a byte from an absolute data-space address and zero-extend it. | 4 | ≈72–78 | Preserve |  |
| `FD 38–3F addr16` | `STM8 addr16,rN` | Store a byte to an absolute data-space address. | 4 | ≈70–76 | Preserve |  |
| `FD 40–47 addr16` | `LDM16 rN,addr16` | Load a 16-bit word from an absolute data-space address. | 4 | ≈74–80 | Preserve |  |
| `FD 48–4F addr16` | `STM16 addr16,rN` | Store a 16-bit word to an absolute data-space address. | 4 | ≈72–78 | Preserve |  |
| `FD 80 RRSPEC` | `LDP8 rD,[PB:rA]` | Load one byte from program space, zero-extend it, then restore the instruction stream. | 3 | ≈233–248 | Preserve | Requires a data-stream seek and a code-stream seek. |
| `FD 81 RRSPEC` | `LDP16 rD,[PB:rA]` | Load a little-endian word from program space, then restore the instruction stream. | 3 | ≈248–266 | Preserve | Requires two seeks and two program-data transfers. |
| `FD 82 RRSPEC disp8` | `LDP8 rD,[PB:rA+simm8]` | Displaced program-space byte load. | 4 | ≈250–268 | Preserve | Requires two seeks. |
| `FD 83 RRSPEC disp8` | `LDP16 rD,[PB:rA+simm8]` | Displaced program-space 16-bit load. | 4 | ≈266–284 | Preserve | Requires two seeks. |
| `FD other` | `Reserved` | All other FD secondary opcodes are reserved. | — | — | — |  |

### 5.9. Far control and return

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `FE T0 T1 T2, link=0` | `JMPF target24` | Far jump to a two-byte-aligned 24-bit target. | 4 | ≈164–170 | Preserve |  |
| `FE T0 T1 T2, link=1` | `CALLF target24` | Push the three-byte return address and far-call a two-byte-aligned 24-bit target. | 4 | ≈171–178 | Preserve |  |
| `FF` | `RET` | Pop CB:PC from the VM stack and restart fetch at the return address. | 1 | ≈112–120 | Preserve |  |

## 6. Important timing conclusions

The one-byte short-branch encoding deliberately omits displacement `-1`. Because short-branch displacements are relative to `nextPC`, `-1` would branch back to the branch instruction itself. The negative encoding range is instead `-9` through `-2`, preserving eight backward choices while extending the useful backward reach by one byte. The positive range remains `+1` through `+8`.


1. The hot one-byte compact and accumulator instructions remain at approximately 17 cycles.
2. A specialized two-byte ALU page is approximately 34 cycles, roughly half the estimated cost of the current three-byte `F4 + operation + RRSPEC` pattern.
3. Generic `RRSPEC` data-space memory instructions remain moderately expensive, but the pre-scaled nibble encoding removes one `LSL` per decoded register and saves about two cycles for ordinary two-register forms.
4. Taken control transfers are dominated by restarting the external-flash read stream, not by opcode decoding.
5. Program-space scalar loads are exceptionally expensive because they interrupt the code stream, seek to data, transfer data, and seek back to code.
6. Removing routine ALU flag production saves several AVR operations per handler. The one-byte compact `ADD` and `SUB` are the intentional exception because their existing native flag capture already fits the 17-cycle cadence.

## 7. Encoding issues to resolve before freezing the ISA

### 7.1 Flag-preserving F4 arithmetic and remaining duplicates

The `F4` `ADD.NF` and `SUB.NF` forms are intentionally retained as non-flagging alternatives to the one-byte compact `ADD` and `SUB`; LLVM can use them when CC is live across an arithmetic operation. Extended `MOV`, `CMP16`, and `CMP8` remain true duplicates of one-byte primary forms and should probably be reassigned or reserved before the ISA is frozen.

### 7.2 CMPI6 remains partly decoded at run time

The direct two-byte `CMPI6` is much cheaper than the current three-byte extended form, but its packed register field still requires a small address calculation. Four dedicated primary opcodes would reduce the estimate toward 34 cycles, but would consume three additional primary slots.

### 7.3 Variable shifts are still loop operations

Operand specialization removes register decode, but AVR has no variable-count word shift. Their run time therefore remains proportional to the shift count. LLVM should use fixed shifts, strength reduction, or helper sequences when profitable.

### 7.4 CSETM is intentionally omitted

This report assigns the final quarter of the `E3` page to `CSET`. A full-width all-zero/all-one mask can be formed as `CSET` followed by flag-neutral `NEG16`. A dedicated `CSETM` can be added later if profiling justifies another encoding.

### 7.5 Compact stack-relative forms are omitted

The earlier compact `LDSP/STSP` forms are not assigned in this map. Stack slots use the `FD` three-byte `u8` forms. Restoring two-byte compact stack forms may be worthwhile if frame-offset profiling shows they are among the most frequent instructions.

## 8. Instructions removed from the old flag/carry model

| Removed instruction or behavior | Replacement |
|---|---|
| `ADC rD,rS` | `ADD32 qD,qS` for 32-bit arithmetic; runtime helpers for wider arithmetic |
| `SBC rD,rS` | `SUB32 qD,qS` for 32-bit arithmetic; runtime helpers for wider arithmetic |
| `CPC16 rL,rR` | `CMP32 qL,qR` |
| General ALU-produced branch flags | Explicit `CMP`, `CMPI`, or `TST`; primary compact `ADD`/`SUB` may feed branches directly when their arithmetic flags are desired |
| Partial flag updates or carry preservation | Every flag-writing instruction replaces all C/Z/S; all other instructions preserve all CC |
| Generic ALU `RRSPEC` | Compact `F4`, accumulator `E2`, pair `E1`, or moves through `E3` |

## 9. Confidence and validation plan

The approximately 17-cycle primary timings are high-confidence because they match the current padded handlers, including flag-producing compact `ADD` and `SUB`. Two-byte specialized estimates are medium-confidence because they assume the same secondary dispatch organization as the current `F4` table. Revised `RRSPEC` estimates directly account for removal of two `LSL` instructions, but generic memory, control-transfer, and program-load totals remain lower-confidence until handlers are implemented and measured.

Before freezing the cost model:

1. Implement one representative handler from each category.
2. Add a simulator cycle counter around handler entry points.
3. Measure taken and not-taken branch paths separately.
4. Measure program-space loads with both one-byte and two-byte results.
5. Feed measured costs into LLVM scheduling and instruction-cost hooks.

**Instruction-form rows in this report:** 149
