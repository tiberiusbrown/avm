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
| `E0 20–23` | `LSL16 rN` | Shift non-compact register `r0` through `r3` left by one; zero enters bit 0. | 2 | ≈34 | Preserve | Compact `r4` through `r7` use `ADD.NF cN,cN`, which has the same result and preserves CC. |
| `E0 24–27` | `Reserved` | Reserved former compact-register `LSL16` encodings. | — | — | — | Code generation must not emit these encodings. |
| `E0 28–2F` | `LSR16 rN` | Logical right shift a 16-bit register by one. | 2 | ≈34 | Preserve |  |
| `E0 30–37` | `ASR16 rN` | Arithmetic right shift a 16-bit register by one. | 2 | ≈34 | Preserve |  |
| `E0 38–3F` | `LSR8 rN` | Logical right shift only the low byte; preserve the high byte. | 2 | ≈34 | Preserve |  |
| `E0 40–47` | `ASR8 rN` | Arithmetic right shift only the low byte; preserve the high byte. | 2 | ≈34 | Preserve |  |
| `E0 48–4F` | `Reserved` | Reserved former `ZEXT8 rN` encodings. | — | — | — | The assembler may retain `ZEXT8 rN` as an alias for `MOV8Z rN,bN` on E3. |
| `E0 50–57` | `Reserved` | Reserved former `SEXT8 rN` encodings. | — | — | — | The assembler may retain `SEXT8 rN` as an alias for `MOV8S rN,bN` on E3. |
| `E0 58–5F` | `SWAP8 rN` | Swap the high and low nibbles of the low byte. | 2 | ≈34 | Preserve |  |
| `E0 60–67` | `GETSP rN` | Copy the VM stack pointer into rN. | 2 | ≈34 | Preserve |  |
| `E0 68–6F` | `SETSP rN` | Replace the VM stack pointer with rN. | 2 | ≈34 | Preserve |  |
| `E0 70–77` | `MTPB rN` | PB = low8(rN). | 2 | ≈34 | Preserve |  |
| `E0 78–7F` | `MFPB rN` | rN = zero_extend(PB). | 2 | ≈34 | Preserve |  |
| `E0 80–87 + imm16` | `LDI16 rN,imm16` | Load a 16-bit immediate. | 4 | ≈68 | Preserve |  |
| `E0 88–8B + imm8` | `LDI8 rN,imm8` | Load an 8-bit immediate into non-compact `r0` through `r3` and zero-extend it. | 3 | ≈51 | Preserve |  |
| `E0 8C–8F` | `Reserved` | Reserved former compact-register `LDI8` encodings. | — | — | — | Compact `r4` through `r7` use the shorter primary `F0–F3 LDI8 cN,imm8` forms. |
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
| `E0 E8–EB` | `TST16 rN` | Set CC from a 16-bit comparison of non-compact `r0` through `r3` against zero. | 2 | ≈34 | Replace C/Z/S |  |
| `E0 EC–EF` | `Reserved` | Reserved former compact-register `TST16` encodings. | — | — | — | Compact `r4` through `r7` use primary `A0/A5/AA/AF`. |
| `E0 F0–F3` | `TST8 rN` | Set CC from a low-byte comparison of non-compact `r0` through `r3` against zero. | 2 | ≈34 | Replace C/Z/S |  |
| `E0 F4–F7` | `Reserved` | Reserved former compact-register `TST8` encodings. | — | — | — | Compact `r4` through `r7` use primary `B0/B5/BA/BF`. |
| `E0 F8–FF` | `Reserved` | Reserved for future miscellaneous instructions. | — | — | — |  |

### 5.3. E1 32-bit pair ALU extension page

The E1 secondary byte uses the following layout:

```text
bits 7:4   operation
bits 3:2   destination/left q-register
bits 1:0   source/right q-register
```

Each two-bit pair field selects one of `q0` through `q3`.

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E1 0ddss` | `MOV32 qD,qS` | Copy one aligned 32-bit register pair to another. | 2 | ≈34 | Preserve |  |
| `E1 1ddss` | `ADD32 qD,qS` | qD = qD + qS modulo 2^32. | 2 | ≈34–36 | Preserve |  |
| `E1 2ddss` | `SUB32 qD,qS` | qD = qD - qS modulo 2^32. | 2 | ≈34–36 | Preserve |  |
| `E1 3ddss` | `AND32 qD,qS` | 32-bit bitwise AND. | 2 | ≈34–36 | Preserve |  |
| `E1 4ddss` | `OR32 qD,qS` | 32-bit bitwise OR. | 2 | ≈34–36 | Preserve |  |
| `E1 5ddss` | `XOR32 qD,qS` | 32-bit bitwise XOR. | 2 | ≈34–36 | Preserve |  |
| `E1 6ddss` | `CMP32 qL,qR` | Set CC from a 32-bit comparison. | 2 | ≈35–37 | Replace C/Z/S |  |
| `E1 7ddss` | `SHL32V qD,qS` | Shift qD left by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 8ddss` | `LSR32V qD,qS` | Logical right shift qD by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 9ddss` | `ASR32V qD,qS` | Arithmetic right shift qD by low5(qS). | 2 | ≈39 + 7n | Preserve | n = low5(qS); about 39–256 cycles. |
| `E1 Addss–Fddss` | `Reserved` | Reserved pair-page operations. | — | — | — |  |

### 5.4. E2 accumulator/non-compact-source ALU extension page

The E2 secondary byte uses the following layout:

```text
bits 7:2   operation
bits 1:0   source register
```

The two-bit source field selects only `r0` through `r3`. Compact sources `r4` through `r7` use their one-byte primary forms or the compact `F4` page. The accumulator logical operations `AND`, `OR`, `XOR`, and `BIC` are omitted from E2 because the one-byte `50–6F` forms already accept all eight source registers. Each operation below therefore occupies four consecutive secondary-byte values.

| Encoding | Mnemonic | Function | Bytes | Estimated AVR cycles | CC | Notes |
|---|---|---|---:|---:|---|---|
| `E2 00–03` | `MOV A,rS` | Copy non-compact register rS into A. | 2 | ≈34 | Preserve | rS is `r0` through `r3`, selected by bits 1:0. |
| `E2 04–07` | `ADD.NF A,rS` | A = A + rS modulo 2^16 without changing CC. | 2 | ≈34 | Preserve | Compact sources use `F4 ADD.NF`; use the one-byte `ADD` when replacing CC is acceptable. |
| `E2 08–0B` | `SUB.NF A,rS` | A = A - rS modulo 2^16 without changing CC. | 2 | ≈34 | Preserve | Compact sources use `F4 SUB.NF`; use the one-byte `SUB` when replacing CC is acceptable. |
| `E2 0C–0F` | `CMP16 A,rS` | Set CC from a 16-bit comparison. | 2 | ≈34 | Replace C/Z/S | Compact sources use the one-byte primary `CMP16` forms. |
| `E2 10–13` | `CMP8 A,rS` | Set CC from a low-byte comparison. | 2 | ≈34 | Replace C/Z/S | Compact sources use the one-byte primary `CMP8` forms. |
| `E2 14–17` | `MULU8 A,rS` | A = unsigned(low8(A)) × unsigned(low8(rS)). | 2 | ≈34–36 | Preserve | Compact sources use `F4 MULU8`. |
| `E2 18–1B` | `MULS8 A,rS` | A = signed(low8(A)) × signed(low8(rS)). | 2 | ≈34–38 | Preserve | Compact sources use `F4 MULS8`. |
| `E2 1C–1F` | `MULSU8 A,rS` | A = signed(low8(A)) × unsigned(low8(rS)). | 2 | ≈34–38 | Preserve | Compact sources use `F4 MULSU8`. |
| `E2 20–23` | `SHL16V A,rS` | Shift A left by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); compact sources use `F4 SHL16V`. |
| `E2 24–27` | `LSR16V A,rS` | Logical right shift A by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); compact sources use `F4 LSR16V`. |
| `E2 28–2B` | `ASR16V A,rS` | Arithmetic right shift A by low4(rS). | 2 | ≈38 + 5n | Preserve | n = low4(rS); compact sources use `F4 ASR16V`. |
| `E2 2C–FF` | `Reserved` | Reserved accumulator operations. | — | — | — |  |

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
| `F4 0ddss` | `MOV cD,cS (extended)` | Alternate compact-page move. | 2 | ≈34 | Preserve | Normally dominated by the one-byte primary MOV encoding. |
| `F4 1ddss` | `ADD.NF cD,cS` | Non-flagging compact-page 16-bit add. | 2 | ≈34 | Preserve | Use when CC must survive; otherwise prefer the one-byte flag-producing `ADD`. |
| `F4 2ddss` | `SUB.NF cD,cS` | Non-flagging compact-page 16-bit subtract. | 2 | ≈34 | Preserve | Use when CC must survive; otherwise prefer the one-byte flag-producing `SUB`. |
| `F4 3ddss`, `dd≠00` | `AND cD,cS` | Compact 16-bit bitwise AND. | 2 | ≈34 | Preserve | Destination is `c1` through `c3`; `c0`/A uses one-byte `AND A,rS`. |
| `F4 4ddss`, `dd≠00` | `OR cD,cS` | Compact 16-bit bitwise OR. | 2 | ≈34 | Preserve | Destination is `c1` through `c3`; `c0`/A uses one-byte `OR A,rS`. |
| `F4 5ddss`, `dd≠00` | `XOR cD,cS` | Compact 16-bit bitwise XOR. | 2 | ≈34 | Preserve | Destination is `c1` through `c3`; `c0`/A uses one-byte `XOR A,rS`. |
| `F4 6ddss`, `dd≠00` | `BIC cD,cS` | Compact 16-bit bit clear: cD = cD & ~cS. | 2 | ≈34 | Preserve | Destination is `c1` through `c3`; `c0`/A uses one-byte `BIC A,rS`. |
| `F4 30–33, 40–43, 50–53, 60–63` | `Reserved` | Removed compact logical encodings with destination `c0`/A. | — | — | — | The equivalent one-byte accumulator opcodes `50–6F` accept all eight source registers. |
| `F4 7ddss` | `CMP16 cL,cR (extended)` | Alternate compact-page 16-bit compare. | 2 | ≈34 | Replace C/Z/S | Normally dominated by the one-byte primary CMP16 encoding. |
| `F4 8ddss` | `CMP8 cL,cR (extended)` | Alternate compact-page low-byte compare. | 2 | ≈34 | Replace C/Z/S | Normally dominated by the one-byte primary CMP8 encoding. |
| `F4 9ddss` | `MULU8 cD,cS` | Unsigned 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–36 | Preserve |  |
| `F4 Addss` | `MULS8 cD,cS` | Signed 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–38 | Preserve |  |
| `F4 Bddss` | `MULSU8 cD,cS` | Signed-by-unsigned 8×8 multiply into a 16-bit compact destination. | 2 | ≈34–38 | Preserve |  |
| `F4 Cddss` | `SHL16V cD,cS` | Shift cD left by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Dddss` | `LSR16V cD,cS` | Logical right shift cD by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Eddss` | `ASR16V cD,cS` | Arithmetic right shift cD by low4(cS). | 2 | ≈38 + 5n | Preserve | n = low4(cS); about 38–113 cycles. |
| `F4 Fddss` | `Reserved` | Reserved compact binary operation. | — | — | — |  |
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

### 7.1 Flag-preserving F4 arithmetic, E2 source specialization, and remaining duplicates

The `F4` `ADD.NF` and `SUB.NF` forms are intentionally retained as non-flagging alternatives to the one-byte compact `ADD` and `SUB`; LLVM can use them when CC is live across an arithmetic operation. E2 now covers only non-compact sources `r0` through `r3`; compact-source accumulator operations use the one-byte primary encodings or F4. E2 does not duplicate `AND`, `OR`, `XOR`, or `BIC`, because the one-byte accumulator forms already accept all eight registers. For the same reason, the F4 logical encodings with destination `c0`/A (`30–33`, `40–43`, `50–53`, and `60–63`) are reserved; only destinations `c1` through `c3` remain valid in those families. Extended `F4` `MOV`, `CMP16`, and `CMP8` remain true duplicates of one-byte primary forms and should probably be reassigned or reserved before the ISA is frozen.

### 7.2 CMPI6 remains partly decoded at run time

The direct two-byte `CMPI6` is much cheaper than the current three-byte extended form, but its packed register field still requires a small address calculation. Four dedicated primary opcodes would reduce the estimate toward 34 cycles, but would consume three additional primary slots.

### 7.3 Redundant E0 forms are intentionally omitted

E0 keeps register-indexed forms only when no equal-or-better encoding already
exists elsewhere:

- `E0 20–23` encode `LSL16` only for `r0` through `r3`; `24–27` are reserved.
  Compact left shifts use `ADD.NF cN,cN`, or primary `ADD cN,cN` only when
  replacing CC is acceptable.
- `E0 48–57` are reserved. `ZEXT8 rN` and `SEXT8 rN` may remain assembler
  aliases, but must encode as `MOV8Z rN,bN` and `MOV8S rN,bN` on E3.
- `E0 88–8B` encode `LDI8` only for `r0` through `r3`; `8C–8F` are reserved.
  Compact registers use primary `F0–F3`.
- `E0 E8–EB` and `F0–F3` encode `TST16` and `TST8` only for `r0` through
  `r3`. `EC–EF` and `F4–F7` are reserved; compact registers use the diagonal
  primary test encodings.

Code generators, assemblers, and disassemblers must not treat the reserved E0
ranges as valid encodings.

### 7.4 Variable shifts are still loop operations

Operand specialization removes register decode, but AVR has no variable-count word shift. Their run time therefore remains proportional to the shift count. LLVM should use fixed shifts, strength reduction, or helper sequences when profitable.

### 7.5 CSETM is intentionally omitted

This report assigns the final quarter of the `E3` page to `CSET`. A full-width all-zero/all-one mask can be formed as `CSET` followed by flag-neutral `NEG16`. A dedicated `CSETM` can be added later if profiling justifies another encoding.

### 7.6 Compact stack-relative forms are omitted

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

**Instruction-form rows in this report:** 150