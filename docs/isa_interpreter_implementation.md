# AVM ISA Opcode Map and AVR Interpreter Implementation Guide

**Status:** ISA architecture and opcode-map specification with AVR implementation design notes  
**Target host:** ATmega32U4 Arduboy FX interpreter  
**Priority:** Performance of LLVM-generated C and C++ code  
**Reference timing basis:** Sequential SPI byte fetch using the 17-cycle reverse-order and 18-cycle standard dispatch schedules described in Section 5; slower handlers extend the cadence when their native work exceeds the available slack.

---

## 1. Scope

This document defines the AVM opcode map and instruction semantics, then develops an efficient interpreter organization for the ATmega32U4. The ISA encodings and architectural behavior are authoritative. The AVR register allocation, table organization, assembly sequences, cycle counts, physical layout, and code-size figures describe a reference implementation and explain the design choices that make the ISA efficient to interpret; they are not mandatory implementation details or ISA-level performance guarantees.

The reference interpreter is organized around the following design choices:

1. A one-byte opcode directly selects native AVR operands.
2. A hot two-byte instruction uses the entire second byte as an executable-table index.
3. Every directly executing slot under a secondary-table prefix has the same **natural AVR word count**, including its final `RJMP` to a page-local dispatch tail. A forwarding page instead uses equal-width operand-specialized entries that jump to shared implementation bodies.
4. Instructions are not padded into a larger page merely to share a primary prefix.
5. The decoder computes `tableBase + secondary * slotWords` and performs one `IJMP` directly into the final operand-specialized slot. The `FA` page uses immediate body jumps or register-count forwarding entries to reach shared destination-specific shift bodies; the `FE` multiplication page uses equal-width forwarding entries. The `FB-FD` conditional-move prefixes share one 64-entry operand table after a prefix-specific condition gate.
6. A truncated table numbers valid entries contiguously from zero, checks one upper bound, and omits the unused tail.
7. Internal holes that cannot be moved to the tail remain same-width trap slots.
8. Hot dense instructions do not perform run-time architectural-register decoding; explicitly cold `F0` forms and the table-free `F9` page may do so.
9. Additional encoded bytes normally contain actual immediates, displacements, or addresses.
10. The reference interpreter uses a fixed four-word, eight-byte primary dispatch stride. A primary slot either executes a complete short handler ending in `RJMP` to a shared cadence tail, or performs up to three words of setup and uses its fourth word to forward to an out-of-line continuation.
11. For the size comparisons in this guide, the accounting region begins at the primary table. The primary table is aligned to 256 AVR words (512 bytes); no alignment padding before it is included in the accounted size. The reference layout emits the following code in one text section without interior power-of-two alignment gaps.

Unless otherwise noted, the cycle figures for the reference interpreter are measured from entry to one primary handler through entry to the next primary handler.

The linked-image format places `dataSize` as a little-endian 16-bit value at header offset `0x08` and `saveSize` as a little-endian 16-bit value at offset `0x0A`. `dataSize` is the combined `.saved` and `.data` size. The complete data image, including zero-initialized objects, begins at image offset `0x0100` and exactly `dataSize` bytes are copied to SRAM address `0x0100`. The format has no separate `.bss` region, so startup does not clear application SRAM before this copy.

---

## 2. Register architecture

### 2.1. Sixteen-bit registers

```text
r0 r1 r2 r3 r4 r5 r6 r7
```

Native mapping:

```text
r0 -> AVR r8:r9
r1 -> AVR r10:r11
r2 -> AVR r12:r13
r3 -> AVR r14:r15
r4 -> AVR r16:r17
r5 -> AVR r18:r19
r6 -> AVR r20:r21
r7 -> AVR r22:r23
```

Registers `r4-r7` also form the compact-encoding class:

```text
c0 = r4
c1 = r5
c2 = r6
c3 = r7
```

The compact names affect encoding only; all eight registers are semantically interchangeable.

### 2.2. Aligned pair registers

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

The first register contains bits `15:0`; the second contains bits `31:16`.

A canonical 24-bit program pointer uses the low register for bits `15:0`, the low byte of the high register for bits `23:16`, and zero in the remaining byte.

### 2.3. Calling-convention intent

```text
r0-r3  callee-saved
r4-r7  caller-saved, arguments, results, preferred compact-encoded values
r3     optional frame pointer
r4     first scalar result
q2     first pair/program-pointer result
```


### 2.4. Native AVR register allocation

The following names in this subsection are **native AVR registers**, not AVM architectural registers:

```text
AVR r0:r1    multiply result and unrestricted scratch
AVR r2       permanent zero
AVR r3       permanent one
AVR r4:r6    24-bit VM program counter, little-endian
AVR r7       permanent four; primary-table stride in AVR words
AVR r8:r23   AVM architectural registers r0-r7
AVR r24:r27  general interpreter scratch
AVR r28:r29  AVM stack pointer, native Y
AVR r30:r31  general scratch and dispatch target, native Z
GPIOR0       architectural VM_FLAGS
```

Native `X` is `r26:r27`, native `Y` is `r28:r29`, and native `Z` is `r30:r31`.

Initialization is performed once:

```asm
clr   r2
mov   r3, r2
inc   r3
mov   r7, r3
lsl   r7
lsl   r7
```

This initialization is outside the code-size accounting region unless explicitly placed after `primary_table`.

The allocation is valid subject to these rules:

1. `r2`, `r3`, and `r7` are immutable after startup.
2. Native `r0:r1` have no ABI meaning and need not satisfy `r1 == 0`; the interpreter and service routines are assembly-only.
3. Every ordinary one-byte PC advance uses:

   ```asm
   add   r4, r3
   adc   r5, r2
   adc   r6, r2
   ```

4. A known four-byte advance, particularly a far-call return address, uses:

   ```asm
   add   r4, r7
   adc   r5, r2
   adc   r6, r2
   ```

5. `MUL16` preserves its original destination in native `Z`, because native `r4:r5` hold the PC.
6. Interrupt handlers must preserve any interpreter registers they clobber and must preserve `GPIOR0`. All ISRs must save exactly the native state they use.

The permanent-one register materially shortens `INC16`, `DEC16`, and `BOOL`. The permanent-four register is essential to dispatch and is also useful for known four-byte PC advances. It does not justify a separate width-four page decoder, because duplicating the decoder tail would cost more code than the saved multiplier load.

---

## 3. Condition state

The architectural condition byte contains:

```text
C  unsigned less
Z  equal / zero
S  signed less
```

Only these instructions replace it:

```text
CMP
CMPI.S8
CMP32
TST16
TST8
```

All other instructions preserve architectural condition state even though they may freely modify native `SREG`.

`VM_FLAGS` is stored permanently in `GPIOR0`. This register is in the low I/O range, so it supports all of:

```asm
in    scratch, GPIOR0
out   GPIOR0, scratch
sbic  GPIOR0, bit
sbis  GPIOR0, bit
```

### 3.1. Flag writers

A writer captures native `SREG` and commits it through a nearby shared landing pad:

```asm
cp    lhsL, rhsL
cpc   lhsH, rhsH
in    flag_tmp, SREG
rjmp  flags_commit_18_delay_1
```

The landing pad performs the additional `OUT GPIOR0,flag_tmp` and uses the selected cadence delay. This keeps compact `CMP` inside its four-word primary slot and keeps every fixed-width secondary slot unchanged.

Compared with storing flags in a GPR, writers gain one native cycle for the `OUT`. Compact and ordinary 16-bit flag writers fit within an 18-cycle final cadence. Cold `CMP32` commits `GPIOR0` inline after its runtime-decoded comparison and has an approximately 81-cycle complete instruction latency.

### 3.2. Flag consumers

Fixed-bit consumers use `SBIC` and `SBIS` directly:

```asm
; Branch or materialize when the saved bit is set
sbic  GPIOR0, flag_bit
rjmp  condition_true

; Branch or materialize when the saved bit is clear
sbis  GPIOR0, flag_bit
rjmp  condition_true
```

For `CSET`, the skipped instruction is a one-word `MOV`, so the set and clear paths are equal-time.

`CMOV` uses one `IN ctest,GPIOR0` in its shared gate because the selected bit is prefix-dependent and secondary bit 6 dynamically requests inversion. Direct `SBIC`/`SBIS` variants would require duplicated prefix-specific gates or extra operand preservation and do not reduce the total code.

### 3.3. Interrupt and service rules

Assembly services may use all of `r24-r27` without preserving architectural flags. They must not modify `GPIOR0`. Interrupt handlers must save and restore `GPIOR0` if they use it.

`GPIOR0` is the architectural flag store for the entire interpreter.

---

## 4. Data-width and multiplication strategy

Sixteen-bit scalar operations are the primary arithmetic and data-movement forms. The ISA provides a limited pair-register subset for cases where native 32-bit operations materially reduce instruction count:

```text
ADD32
SUB32
CMP32
LSR32.1
ASR32.1
LD32
ST32
```

Other 32-bit operations lower to 16-bit instructions:

```text
32-bit copy       2x MOV16
32-bit AND        2x AND16
32-bit OR         2x OR16
32-bit XOR        2x XOR16
32-bit left shift ADD32 qD,qD
```

The multiplication forms are:

```text
MULU8.W   unsigned 8 x unsigned 8 -> unsigned 16
MULS8.W   signed 8 x signed 8 -> signed 16
MULSU8.W  signed 8 x unsigned 8 -> signed 16
MUL8      low 8 x low 8 -> low 8, zero-extended
MUL16     low 16 x low 16 -> low 16
```

The four 8-bit multiplication forms use compact registers, which map to AVR `r16-r23` and permit direct use of `MUL`, `MULS`, and `MULSU`. `MUL16` accepts all eight registers and returns the product modulo `2^16`; signed and unsigned multiplication have identical low sixteen bits, so no signedness variants are needed. Widening 16-bit multiplication and wider products lower through compiler-runtime helpers or synthesized instruction sequences.

---

## 5. Timing model

The dispatch cadence is determined by handler work, not by the low-register PC alone.

### 5.1. SPI byte-transfer and handoff rules

The external flash SPI transfer requires sixteen native cycles after an `OUT SPDR,...` before the received byte is complete. With the initiating `OUT` designated cycle 0, the completed byte is available for an `IN SPDR` on cycle 17.

#### Primary-slot entry cycle

For cadence accounting, the first native instruction in the selected primary-table slot begins on **cycle 9 after the dispatch's most recent `OUT SPDR,...`**. Both dispatch forms deliberately move one additional PC-update instruction before that `OUT`:

```asm
; Standard dispatch: OUT is cycle 0; selected primary slot starts at cycle 9.
; ADD executes before IN. IN and OUT preserve carry into the two ADCs.
add   VM_PCL, ONE
in    primary, SPDR
out   SPDR, ZERO
adc   VM_PCM, ZERO
adc   VM_PCH, ZERO
mul   primary, FOUR
movw  r30, r0
subi  r31, hi8(-(pm(primary_table)))
ijmp

; Reverse dispatch: OUT is cycle 0; selected primary slot also starts at 9.
; The complete 24-bit PC increment occurs before the protected handoff.
add   VM_PCL, ONE
adc   VM_PCM, ZERO
adc   VM_PCH, ZERO
cli
out   SPDR, ZERO
in    primary, SPDR
sei
mul   primary, FOUR
movw  r30, r0
subi  r31, hi8(-(pm(primary_table)))
ijmp
```

Using the dispatch `OUT` as cycle 0, both paths execute `MUL` on cycles 3-4, `IJMP` on cycles 7-8, and the selected slot on cycle 9. `IN`, `OUT`, `CLI`, and `SEI` preserve the arithmetic flags, including carry; interrupt handlers must restore the interrupted `SREG`, so the carry chains remain valid. `CLI` and `SEI` intentionally change only the interrupt-enable state around the reverse handoff.

At primary-slot entry, `VM_PC` names the executing primary opcode, not the following byte. A one-byte instruction advances to its successor in its final dispatch. A multi-byte instruction explicitly consumes each additional encoded byte. Consequently, every call must push the address immediately after the complete instruction; in particular, one-byte `CALLP` must push `VM_PC + 1`.

A primary slot that constructs its own cycle-17 reverse handoff has cycles 9 through 15 for slot and continuation work, followed by `CLI` on cycle 16 and `OUT` on cycle 17. A slot containing only `RJMP handler` reaches the handler on cycle 11, leaving five one-cycle work positions before `CLI`.

The standard dispatch moves only the low-byte `ADD` ahead of `IN`; moving either `ADC` there would require the completed opcode read to be delayed or would make the standard and reverse post-`OUT` paths asymmetric. The reverse dispatch moves all three PC-update instructions ahead of `OUT`, which is the minimum post-`OUT` schedule that keeps both dispatches aligned at cycle 9.

There are exactly two legal byte-to-byte handoff schedules:

#### Exact 17-cycle reverse handoff

Use the reverse-order handoff whenever the next `OUT` can be placed **exactly** seventeen cycles after the preceding `OUT`:

```asm
; preceding OUT occurred at cycle 0
; exactly fifteen cycles of work or delay occur here
cli                     ; cycle 16
out   SPDR, ZERO        ; cycle 17: start the next transfer
in    byte, SPDR        ; cycle 18: read the completed previous transfer
sei                     ; cycle 19
```

The `OUT` must land exactly on cycle 17. The received byte from the preceding transfer is already complete at that point, so the interpreter may start the next transfer before reading it. `CLI` and `SEI` protect the critical `OUT`/`IN` pair from interruption; an ISR between them could disturb `SPDR` or extend the interval in which the previous received byte remains unread.

This is the preferred schedule whenever the surrounding instruction work and padding can hit the exact cycle-17 boundary. It produces a 17-cycle `OUT`-to-`OUT` cadence.

#### Standard 18-cycle-or-later handoff

If the interpreter cannot place the next `OUT` exactly on cycle 17, it must read the completed byte first and then start the next transfer:

```asm
; preceding OUT occurred at cycle 0
; sixteen or more cycles of work or delay occur here
in    byte, SPDR        ; cycle 17 or later
out   SPDR, ZERO        ; cycle 18 or later
```

This produces an 18-cycle minimum `OUT`-to-`OUT` cadence. It is not selected according to whether the next transmitted byte is meaningful; it is selected because the handler missed, or cannot use, the exact cycle-17 reverse-handoff boundary.

The reverse form must not be used late. Once cycle 17 cannot be met exactly, use `IN; OUT` so the completed receive byte is consumed before a later transfer is launched.

For every primary tail, operand-fetch continuation, secondary-page decoder, and table handler:

1. Count from the preceding `OUT SPDR,...`.
2. Prefer `CLI; OUT; IN; SEI` if the new `OUT` can occur exactly on cycle 17.
3. Otherwise use `IN; OUT`, with the `OUT` on cycle 18 or later.
4. Add padding only to reach one of those legal boundaries; do not insert an arbitrary one-cycle delay that turns an attainable 17-cycle handoff into an 18-cycle handoff.
5. When an instruction ends the sequential flash stream, such as a taken control transfer, only the final operand `IN` must occur no earlier than cycle 17; no following sequential `OUT` is required before the stream-seek routine begins.

### 5.2. Exact primary cadence tails

The standard dispatch has an 18-cycle `OUT`-to-`OUT` cadence. Its dispatch body takes eleven cycles, leaving seven cycles for the instruction body, its final `RJMP`, and any selected delay:

```asm
cluster_tail_18_delay_1:
    nop
cluster_tail_18:
    add   r4, r3
    in    primary, SPDR
    out   SPDR, r2
    adc   r5, r2
    adc   r6, r2
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

The reverse-order dispatch has a 17-cycle `OUT`-to-`OUT` cadence. Its body takes thirteen cycles, leaving four cycles for the instruction body, final `RJMP`, and selected delay:

```asm
cluster_tail_17_delay_1:
    nop
cluster_tail_17:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    cli
    out   SPDR, r2
    in    primary, SPDR
    sei
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

Therefore:

```text
handler including final RJMP <= 4 cycles  -> pad to the 17-cycle tail
handler including final RJMP  = 5..7      -> pad to the 18-cycle tail
handler including final RJMP  > 7         -> use the standard tail and run slower
```

Examples:

```asm
; 3 native cycles: 1-cycle MOVW + 2-cycle RJMP
movw  r16, r18
rjmp  cluster_tail_17_delay_1

; 4 native cycles: ADD + ADC + RJMP
add   r16, r18
adc   r17, r19
rjmp  cluster_tail_17
```

The encoded-byte planning targets remain:

| Encoded bytes | Normal target | Complicated target |
|---:|---:|---:|
| 1 | 17 cycles | 18 cycles |
| 2 | 34 cycles | 36 cycles |
| 3 | 51 cycles | 54 cycles |
| 4 | 68 cycles | 72 cycles |

Those are targets, not automatic multiples. Operand-fetch continuations, taken control transfers, program-space reads, and handlers with more than seven native cycles may exceed them.

Taken control flow and program-space loads restart the external-flash stream and remain much slower:

| Class | Reference cycles |
|---|---:|
| Not-taken conditional branch | 35 |
| Taken conditional branch | 127 |
| Relative jump/call | 121 / 127 |
| Near relative jump/call | 134 / 134 |
| Far jump/call | 149 / 149 |
| Indirect jump/call | 109 / 116 |
| Return | 109 |
| Program-space scalar load | ~268-305 |


### 5.3. Cycle-9 reference dispatch schedule and family latencies

In the reference schedule, both standard and reverse dispatch begin executing the selected primary slot on cycle 9 after the dispatch `OUT`. The standard form moves `ADD VM_PCL,ONE` before `IN`; the reverse form completes the full 24-bit PC increment before `CLI`. The four handoff instructions preserve carry; this schedule assumes interrupt handlers restore the interrupted `SREG`.

The reference continuations and secondary decoders are scheduled from this cycle-9 entry point:

- direct `00-BF` handlers retain the 17- and 18-cycle cadence limits from Section 5.2;
- compact-immediate slots execute their cycle-9 padding word before forwarding;
- two-byte primary continuations place their operand handoff on the earliest legal cycle-17 reverse or cycle-18 standard boundary;
- the generic bounded decoder uses the standard `IN; OUT` handoff, while the shared width-two decoder uses the exact cycle-17 reverse handoff;
- `F9` performs useful pointer-high initialization before its reverse handoff;
- `FB-FD` use the standard `IN; OUT` handoff without an unnecessary native-`SREG` wrapper;
- taken control flow and indirect control enter the common seek/restart path as soon as their target and required return address are complete.

The resulting fixed-width secondary latencies for the shown organization, measured from prefix-slot entry through next-primary-slot entry, are:

| Family | Cycles |
|---|---:|
| `F1` | 37 |
| `F2` | 38 |
| `F3` | 38 |
| `F4` | 38 |
| `F5 CMP`, `F5 LD16`, `F5 ST16` | 39 |
| `F5 LD8U` | 38 |
| `F6 TST16` | 39 |
| Other `F6` forms | 38 |
| `F7 LD8U+` | 39 |
| `F7 LD16+`, `F7 ST16+` | 40 |
| Other `F7` forms | 38 |
| `F8` | 38 |
| `F9 AND` / `OR` / `XOR` | 52 / 53 / 54 |
| `FB-FD` false / true | 36 / 37 |
| `FE MUL16` | 46 |

---

## 6. Primary opcode map

| Primary range | Family | Bytes | Typical cycles |
|---|---|---:|---:|
| `00-0F` | `MOV cD,cS` | 1 | 17 |
| `10-1F` | `ADD cD,cS` | 1 | 17 |
| `20-2F` | `SUB cD,cS` | 1 | 17 |
| `30-3F` | `CMP cL,cR` | 1 | 18 |
| `40-4F` | `LD8U cD,[cA]` | 1 | 18 |
| `50-5F` | `ST8 [cA],cS` | 1 | 18 |
| `60-6F` | `LD16 cD,[cA]` | 1 | 18 |
| `70-7F` | `ST16 [cA],cS` | 1 | 18 |
| `80-8F` | `AND cD,cS` | 1 | 17 |
| `90-9F` | `OR cD,cS` | 1 | 17 |
| `A0-AF` | `XOR cD,cS` | 1 | 17 |
| `B0-B7` | `PUSH16 rN` | 1 | 18 |
| `B8-BF` | `POP16 rN` | 1 | 18 |
| `C0-C3` | `LDI8 cD,imm8` | 2 | 35 |
| `C4-C7` | `LDI16 cD,imm16` | 3 | 52 |
| `C8-CB` | `ADDI.S8 cD,simm8` | 2 | 35 |
| `CC-CF` | `CMPI.S8 cL,simm8` | 2 | 35 |
| `D0` | `BREQ8 rel8` | 2 | 35 not taken; 127 taken |
| `D1` | `BRNE8 rel8` | 2 | 35 not taken; 127 taken |
| `D2` | `BRULT8 rel8` | 2 | 35 not taken; 127 taken |
| `D3` | `BRSLT8 rel8` | 2 | 35 not taken; 127 taken |
| `D4` | `JMP8 rel8` | 2 | 121 |
| `D5` | `CALL8 rel8` | 2 | 127 |
| `D6` | `ADJSP simm8` | 2 | 35 |
| `D7` | `SYS service8` | 2 | 31 / 31 / 34 / 38 for services `00-03` |
| `D8` | `BRUGE8 rel8` | 2 | 35 not taken; 127 taken |
| `D9` | `BRSGE8 rel8` | 2 | 35 not taken; 127 taken |
| `DA` | `BREQ16 rel16` | 3 | 51 not taken; 134 taken |
| `DB` | `BRNE16 rel16` | 3 | 51 not taken; 134 taken |
| `DC` | `BRULT16 rel16` | 3 | 51 not taken; 134 taken |
| `DD` | `BRUGE16 rel16` | 3 | 51 not taken; 134 taken |
| `DE` | `BRSLT16 rel16` | 3 | 51 not taken; 134 taken |
| `DF` | `BRSGE16 rel16` | 3 | 51 not taken; 134 taken |
| `E0` | `JMP16 rel16` | 3 | 134 |
| `E1` | `CALL16 rel16` | 3 | 134 |
| `E2` | `JMPF target24` | 4 | 149 |
| `E3` | `CALLF target24` | 4 | 149 |
| `E4-E7` | `JMPP qN` | 1 | 109 |
| `E8-EB` | `CALLP qN` | 1 | 116 |
| `EC-EE` | Reserved | — | trap |
| `EF` | `RET` | 1 | 109 |
| `F0` | Bounded 1-word cold-form veneer page | 2-4 | varies |
| `F1` | Bounded dense 2-word page | 2 | 37 |
| `F2` | Bounded dense 3-word page A | 2 | 38 |
| `F3` | Bounded dense 3-word page B | 2 | 38 |
| `F4` | Bounded dense 3-word page C | 2 | 38 |
| `F5` | Bounded dense 4-word page A | 2 | 38-39 |
| `F6` | Bounded dense 4-word page B | 2 | 38-39 |
| `F7` | Bounded dense 5-word page A | 2 | 38-40 |
| `F8` | Bounded dense 5-word simple-condition page | 2 | 38 |
| `F9` | Dedicated runtime-decoded full-register bitwise page | 2 | 52-54 |
| `FA` | Compact immediate/register-count 16-bit shift page | 2 | count-dependent; 42-78 |
| `FB` | `CMOV.EQ` / `CMOV.NE` condition-family prefix | 2 | 36 false; 37 true |
| `FC` | `CMOV.ULT` / `CMOV.UGE` condition-family prefix | 2 | 36 false; 37 true |
| `FD` | `CMOV.SLT` / `CMOV.SGE` condition-family prefix | 2 | 36 false; 37 true |
| `FE` | Bounded 2-word `MUL16` forwarding page | 2 | 46 |
| `FF` | Reserved | — | trap |

All fifteen secondary-page prefixes occupy the contiguous range `F0-FE`. `F0-F8` and `FE` use bounded-page machinery, `F9` and `FA` use dedicated runtime decoders, and `FB-FD` use the shared condition gate. Their decoder entries and gates are emitted immediately after the primary table, while executable tables and shared bodies are ordered later according to the single-section layout in Section 26.

The other primary ranges provide push/pop, immediate, branch, control-flow, and reserved encodings while keeping all secondary prefixes contiguous.

## 7. One-byte compact-register matrices

For `00-AF`:

```text
bits 3:2  destination / address / left register
bits 1:0  source / address / right register
```

| Range | Instruction | Intended native work |
|---|---|---|
| `00-0F` | `MOV cD,cS` | `MOVW dL,srcL` |
| `10-1F` | `ADD cD,cS` | `ADD dL,srcL`; `ADC dH,srcH` |
| `20-2F` | `SUB cD,cS` | `SUB dL,srcL`; `SBC dH,srcH` |
| `30-3F` | `CMP cL,cR` | `CP`; `CPC`; save `SREG` |
| `40-4F` | `LD8U cD,[cA]` | `MOVW X,aL`; `LD dL,X`; `CLR dH` |
| `50-5F` | `ST8 [cA],cS` | `MOVW X,aL`; `ST X,srcL` |
| `60-6F` | `LD16 cD,[cA]` | `MOVW X,aL`; two `LD` |
| `70-7F` | `ST16 [cA],cS` | `MOVW X,aL`; two `ST` |
| `80-8F` | `AND cD,cS` | two `AND` |
| `90-9F` | `OR cD,cS` | two `OR` |
| `A0-AF` | `XOR cD,cS` | two `EOR` |

Aliases:

```text
CLR cN = XOR cN,cN
NOP    = MOV c0,c0
```

---

# Part I-A — Exact-Width Dense Secondary Tables

## 8. Sequence notation

Each sequence below is one final operand-specialized slot.

```text
dL,dH       low/high bytes of a 16-bit destination
srcL,srcH   low/high bytes of a 16-bit source
aL          low register of a compact 16-bit address pair
lhs0-lhs3   bytes of a 32-bit left operand, least significant first
rhs0-rhs3   bytes of a 32-bit right operand, least significant first
d0-d3       bytes of a 32-bit destination
src0-src3   bytes of a 32-bit source
X            native r26:r27 address scratch
Y            native r28:r29 VM stack pointer
ZERO         native r2, permanent zero
ONE          native r3, permanent one
FOUR         native r7, permanent four
VM_FLAGS     GPIOR0
t0           native interpreter scratch; use r16-r31 when an immediate is needed
tL,tH        native r30:r31 (`Z`) scratch pair when a preserved 16-bit temporary is needed
page_tail    local cadence continuation
```

Every shown `RJMP page_tail` is included in the stated slot width. The `FA` register-count forwarding entries use `MOV` plus `RJMP` to a shared shift body; immediate forms use a one-word body-jump table and enter those same bodies. The `FE` forwarding entries use `MOVW` plus `RJMP` to a shared multiplication body. Each shared body ends at its page-local tail. The `FB-FD` prefixes share one two-word, 64-entry `MOVW` table after a condition gate; those table entries end at `cmov_tail`.

### 8.1. Compact indexing for ordinary full-register binary families

A full-register binary family omits the sixteen combinations in which both architectural operands are compact registers, because those combinations have one-byte primary encodings. The remaining 48 combinations are numbered contiguously:

```text
00-1F  first operand r0-r3, second operand r0-r7
20-2F  first operand r4-r7, second operand r0-r3
```

This indexing applies to `MOV16`, `ADD`, `SUB`, and `CMP`. Full-register bitwise operations use the dedicated runtime-decoded `F9` family.

### 8.2. Fast compact-pointer memory indexing

All operand-specialized data-space memory instructions require a compact pointer `cA`.

For ordinary loads and stores, compact-data combinations already have one-byte primary encodings. The dense secondary family therefore contains only:

```text
4 compact pointers × 4 noncompact data registers = 16 entries
```

The entry index is:

```text
(pointer_index << 2) | (data_register_index - 4)
```

For postincrement forms there is no one-byte equivalent, so every data register is represented:

```text
4 compact pointers × 8 data registers = 32 entries
```

The entry index is:

```text
(pointer_index << 3) | data_register_index
```

The generic assembly syntax is:

```text
LD8U rD,[cA]
LD16 rD,[cA]
ST8  [cA],rS
ST16 [cA],rS

LD8U rD,[cA+]
LD16 rD,[cA+]
ST8  [cA+],rS
ST16 [cA+],rS
```

When the pointer is noncompact, LLVM uses the three-byte `F0` cold fallback forms in Section 9.5 rather than inserting mandatory copy-in/copy-out sequences.

## 9. `F0`: bounded 1-word cold-form veneer table

Bounds: `secondary < 0x6E`.

Every dense entry is exactly one word:

```asm
rjmp  operation_specific_body
```

The out-of-line bodies fetch remaining immediate, displacement, address, or operand bytes. They are not constrained to the one-word veneer width.

The immediate families contain only `r0-r3`; the equivalent `c0-c3` forms use the primary opcodes at `C0-CF`.

### 9.1. Immediate and stack-relative forms

| Secondary | Instruction | Total bytes | Cycles |
|---|---|---:|---:|
| `00-03` | `LDI8 r0-r3,imm8` | 3 | ~53-54 |
| `04-07` | `LDI16 r0-r3,imm16` | 4 | ~70-72 |
| `08-0B` | `ADDI.S8 r0-r3,simm8` | 3 | ~53-54 |
| `0C-0F` | `CMPI.S8 r0-r3,simm8` | 3 | ~53-54 |
| `10-17` | `LEASP rN,u8` | 3 | ~53-54 |
| `18-1F` | `LDSP8U rN,[SP+u8]` | 3 | ~54-56 |
| `20-27` | `LDSP8S rN,[SP+u8]` | 3 | ~55-57 |
| `28-2F` | `STSP8 [SP+u8],rN` | 3 | ~53-55 |
| `30-37` | `LDSP16 rN,[SP+u8]` | 3 | ~55-57 |
| `38-3F` | `STSP16 [SP+u8],rN` | 3 | ~55-57 |

### 9.2. Absolute data-space forms

| Secondary | Instruction | Total bytes | Cycles |
|---|---|---:|---:|
| `40-47` | `LDM8U rN,addr16` | 4 | ~70-72 |
| `48-4F` | `STM8 addr16,rN` | 4 | ~69-71 |
| `50-57` | `LDM16 rN,addr16` | 4 | ~71-72 |
| `58-5F` | `STM16 addr16,rN` | 4 | ~71-72 |

### 9.3. Program-space forms

| Secondary | Instruction | Total bytes | Cycles |
|---:|---|---:|---:|
| `60` | `LDP8U rD,[qA]` | 3 | ~270 |
| `61` | `LDP8S rD,[qA]` | 3 | ~272 |
| `62` | `LDP16 rD,[qA]` | 3 | ~284 |
| `63` | `LDP24 qD,[qA]` | 3 | ~292 |
| `64` | `LDP32 qD,[qA]` | 3 | ~300 |
| `65` | `LDP8U rD,[qA+]` | 3 | ~274 |
| `66` | `LDP16 rD,[qA+]` | 3 | ~288 |
| `67` | `LDP24 qD,[qA+]` | 3 | ~297 |
| `68` | `LDP32 qD,[qA+]` | 3 | ~305 |

`LDP24` loads three packed little-endian bytes into bits `23:0` of `qD` and clears bits `31:24`, producing a canonical 24-bit program pointer. The postincrement form advances `qA` by three bytes after capturing the original address. `LDP24 qD,[qA+]` reserves `qD == qA`, because one pair cannot simultaneously receive the loaded pointer and the updated source address.

### 9.4. Shared cold 32-bit forms

The 32-bit cold operations are encoded as three-byte `F0` instructions:

| Secondary | Instruction | Total bytes | Target cycles |
|---:|---|---:|---:|
| `69` | `CMP32 qL,qR` followed by `RRSPEC` | 3 | ~81 |
| `6A` | `LD32 qD,[rA]` followed by `RRSPEC` | 3 | ~80 |
| `6B` | `ST32 [rA],qS` followed by `RRSPEC` | 3 | ~79 |

`BOOL rD` is encoded in `F7`, where its compact fixed-width implementation avoids runtime register decoding.

#### 9.4.1. `RRSPEC` encoding

`RRSPEC` contains two pre-scaled register-file offsets from native AVR `r8`:

```text
bits 7:4  high operand offset
bits 3:0  low operand offset
```

Valid offsets are:

```text
16-bit rN: 0,2,4,6,8,10,12,14
32-bit qN: 0,4,8,12
```

The byte is interpreted as follows:

```text
CMP32: high=qL, low=qR
LD32:  high=qD, low=rA
ST32:  high=qS, low=rA
```

The store encoding deliberately places the 32-bit data operand in the high nibble, even though the assembly syntax writes the address first. This lets all three operations decode the high nibble into `X` as the 32-bit pair and the low nibble into `Z` as the comparison/address operand.

Canonical encodings are validated at runtime:

- High nibble bits corresponding to offsets 1 and 2 must be clear, so the high operand is an aligned `q` pair.
- Low bit 0 must be clear for all forms, so the low operand is at least an aligned `r`.
- `CMP32` additionally requires low bit 1 clear, so its low operand is also an aligned `q` pair.

Malformed specifiers branch to the shared invalid-instruction trap rather than exposing interpreter registers outside native `r8-r23`.

#### 9.4.2. Shared byte-consume and stream-restart entry

All three veneer entries contain the same one-word jump:

```asm
rjmp  f0_cold32_delay_3
```

The generic `F0` decoder has already started the `RRSPEC` transfer. From its `OUT SPDR,r2` to the common body entry, the decoder, `IJMP`, and one-word veneer consume fourteen cycles. A three-cycle landing delay therefore preserves the 17-cycle byte cadence:

```asm
f0_cold32_delay_3:
    rjmp  f0_cold32_delay_1       ; two cycles
f0_cold32_delay_1:
    nop                           ; one cycle
f0_cold32:
    add   r4, r3                  ; consume RRSPEC in the VM PC
    cli
    out   SPDR, r2                ; start speculative following-primary fetch
    in    spec, SPDR              ; read buffered RRSPEC
    sei
    adc   r5, r2
    adc   r6, r2
```

This region is nine AVR words. The carry from `ADD` is preserved across `CLI`, `OUT`, `IN`, and `SEI`.

#### 9.4.3. Validation and common pointer decode

```asm
    ; Common validity: high operand is q-aligned and low operand is r-aligned.
    mov   t0, spec
    andi  t0, 0x31                ; high-offset bits 0/1 and low-offset bit 0
    brne  f0_cold32_invalid

    ; X = native register-file pointer for high operand.
    mov   XL, spec
    swap  XL
    andi  XL, 0x0f
    subi  XL, -8
    mov   XH, r2

    ; Z = native register-file pointer for low operand.
    mov   ZL, spec
    andi  ZL, 0x0f
    subi  ZL, -8
    mov   ZH, r2

    cpi   secondary, 0x69
    breq  f0_cmp32
```

The validation is three words. Pointer formation is nine words. Because the specifier is not available until the third byte arrives, these twelve cycles are exposed rather than hidden under byte transfer.

#### 9.4.4. Shared memory-address capture

For both memory operations, `Z` initially points to the selected 16-bit address register. Capture the effective address before writing any destination or reading an overlapping source:

```asm
    ld    r24, Z+
    ld    r25, Z
    movw  Z, r24

    cpi   secondary, 0x6A
    breq  f0_ld32
```

This guarantees:

- `LD32 qD,[rA]` permits `qD` to overlap `rA`.
- `ST32 [rA],qS` permits `qS` to overlap `rA`.

The address has already been copied into native `Z` before any architectural register is modified or reused.

#### 9.4.5. Shared `ST32`

```asm
; X = qS register-file pointer
; Z = captured data-space address
f0_st32:
    ld    r24, X+
    st    Z+, r24
    ld    r24, X+
    st    Z+, r24
    ld    r24, X+
    st    Z+, r24
    ld    r24, X
    st    Z,  r24
    rjmp  cluster_a_tail_18
```

The transfer body is nine words and eighteen cycles including the final `RJMP`.

Reference complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
45  following-primary OUT-to-OUT execution interval
--
79 cycles
```

#### 9.4.6. Shared `LD32`

```asm
; X = qD register-file pointer
; Z = captured data-space address
f0_ld32:
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z
    st    X,  r24
    rjmp  cluster_a_tail_18
```

The transfer body is also nine words and eighteen cycles including its final `RJMP`.

Reference complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
46  following-primary OUT-to-OUT execution interval
--
80 cycles
```

The additional cycle relative to `ST32` is the taken operation-selection branch.

#### 9.4.7. Shared `CMP32`

`CMP32` requires the low nibble to be pair-aligned as well:

```asm
f0_cmp32:
    sbrc  spec, 1
    rjmp  f0_cold32_invalid

    ; Preserve the complete left operand before XL is reused as scratch.
    ld    r0,  X+
    ld    r1,  X+
    ld    r24, X+
    ld    r25, X

    ld    r26, Z+
    cp    r0,  r26
    ld    r26, Z+
    cpc   r1,  r26
    ld    r26, Z+
    cpc   r24, r26
    ld    r26, Z
    cpc   r25, r26

    in    r24, SREG
    out   GPIOR0, r24
    rjmp  cluster_a_tail_18
```

After all four left bytes are loaded, native `r26` may safely replace `XL` as the right-byte scratch register. Native `r1` has no zero-register ABI requirement.

Reference complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
47  following-primary OUT-to-OUT execution interval
--
81 cycles
```

#### 9.4.8. Invalid-specifier shim and exact code size

```asm
f0_cold32_invalid:
    rjmp  trap_entry
```

The common subsystem is exactly:

| Component | Words | Bytes |
|---|---:|---:|
| Three-cycle byte-cadence landing and RRSPEC consume/restart | 9 | 18 |
| Common validation | 3 | 6 |
| Two register-file pointer decoders | 9 | 18 |
| CMP-versus-memory selection | 2 | 4 |
| Shared address capture | 3 | 6 |
| LD-versus-ST selection | 2 | 4 |
| `ST32` transfer body | 9 | 18 |
| `LD32` transfer body | 9 | 18 |
| `CMP32` extra validation and body | 17 | 34 |
| Local invalid-specifier shim | 1 | 2 |
| **Shared cold-32 subsystem** | **64** | **128** |

The three one-word `F0` veneers consume another six bytes in the executable table. The complete cold-32 implementation therefore occupies:

```text
shared cold-32 subsystem    128 bytes
three F0 veneers              6
                             ---
total                        134 bytes
```

The primary `F9` slot belongs to the dedicated runtime-decoded bitwise family in Section 18 and is included in the fixed primary-table size.


### 9.5. Shared cold general-pointer data-space forms

Fast dense memory instructions require compact pointers. Two three-byte fallback forms allow any architectural register to serve as the pointer:

| Secondary | Encoding | Operation | Total bytes | Target cycles |
|---:|---|---|---:|---:|
| `6C` | `dddWaaaP` | Load | 3 | ~69-76 |
| `6D` | `dddWaaaP` | Store | 3 | ~69-78 |

```text
bits 7:5  ddd  data register rD/rS
bit  4    W    width: 0=byte, 1=word
bits 3:1  aaa  pointer register rA
bit  0    P    pointer update: 0=ordinary, 1=postincrement
```

The two secondary opcodes distinguish load from store. `W` and `P` are carried in `RRSPEC`, so every one of its 256 bit patterns selects valid architectural registers and a defined width/update combination.

The decoded instructions are:

```text
F0 6C ddd0aaa0    LD8U rD,[rA]
F0 6C ddd1aaa0    LD16 rD,[rA]
F0 6C ddd0aaa1    LD8U rD,[rA+]
F0 6C ddd1aaa1    LD16 rD,[rA+]

F0 6D ddd0aaa0    ST8 [rA],rS
F0 6D ddd1aaa0    ST16 [rA],rS
F0 6D ddd0aaa1    ST8 [rA+],rS
F0 6D ddd1aaa1    ST16 [rA+],rS
```

Postincrement loads reserve `rD == rA`, because one architectural register cannot simultaneously receive the loaded value and the updated pointer. Ordinary loads and all stores permit data/pointer overlap.

#### 9.5.1. Independent byte-cadence landing

Both `F0` veneer entries contain:

```asm
rjmp  f0_coldmem_delay_3
```

The landing preserves the 17-cycle secondary-to-`RRSPEC` cadence:

```asm
f0_coldmem_delay_3:
    rjmp  f0_coldmem_delay_1
f0_coldmem_delay_1:
    nop
f0_coldmem:
    add   r4, r3
    cli
    out   SPDR, r2
    in    spec, SPDR
    sei
    adc   r5, r2
    adc   r6, r2
```

This region occupies nine AVR words. The cold-memory subsystem has an independent landing so its classification work does not affect the cold-32 latencies.

#### 9.5.2. Register-file pointer decode

`ddd` and `aaa` are already positioned as doubled register indices. No parity or range validation is required.

```asm
    ; X = register-file pointer for rD/rS.
    mov   XL, spec
    swap  XL
    andi  XL, 0x0e       ; 2 * ddd
    subi  XL, -8
    mov   XH, r2

    ; Z = register-file pointer for rA.
    mov   ZL, spec
    andi  ZL, 0x0e       ; 2 * aaa
    subi  ZL, -8
    mov   ZH, r2

    ; 6C is load; 6D is store.
    sbrc  secondary, 0
    rjmp  f0_coldmem_store
```

The two pointer decoders occupy nine words. The load/store dispatch occupies two words.

#### 9.5.3. Unified load path

The load path always advances native `Z` while reading memory. The `P` bit decides whether that local advancement is written back to the architectural pointer.

```asm
f0_coldmem_load:
    ; Preserve the architectural pointer's register-file address.
    mov   r0, ZL

    ; Capture the effective data-space address before writing rD.
    ld    r24, Z+
    ld    r25, Z
    movw  Z, r24

    ; Load one byte, zero-extend, and conditionally load the high byte.
    ld    r24, Z+
    clr   r25
    sbrc  spec, 4        ; W=1
    ld    r25, Z+

    ; Write the selected byte or word result.
    st    X+, r24
    st    X,  r25

    ; P=0 completes without exposing native Z advancement.
    sbrs  spec, 0        ; P=1
    rjmp  cluster_a_tail_18

    ; P=1 writes Z back to rA.
    mov   XL, r0
    ; fall through
```

This single path implements all four load variants.

For `LD8U`, `r25` is zero. For `LD16`, the conditional `LD` replaces that zero with the high byte. Ordinary loads permit `rD == rA` because the effective address is captured before destination writeback.

#### 9.5.4. Shared postincrement writeback

```asm
f0_coldmem_post_writeback:
    st    X+, ZL
    st    X,  ZH
    rjmp  cluster_a_tail_18
```

Native `XH` is zero throughout register-file access, so no explicit clear is needed.

The load path restores `XL` from saved native `r0` before entering this helper. The store path places the pointer-register address in `XL` before loading the effective address.

#### 9.5.5. Unified store path

The complete source is captured before reading the pointer, preserving overlap between `rS` and `rA`.

```asm
f0_coldmem_store:
    ; Capture the low source byte and conditionally capture the high byte.
    ld    r0, X+
    sbrc  spec, 4        ; W=1
    ld    r1, X

    ; Preserve the architectural pointer's register-file address.
    mov   XL, ZL

    ; Capture its effective data-space address.
    ld    r24, Z+
    ld    r25, Z
    movw  Z, r24

    ; Store one byte and conditionally store the high byte.
    st    Z+, r0
    sbrc  spec, 4        ; W=1
    st    Z+, r1

    ; P=0 completes without architectural pointer writeback.
    sbrs  spec, 0        ; P=1
    rjmp  cluster_a_tail_18

    ; P=1 uses the shared writeback helper.
    rjmp  f0_coldmem_post_writeback
```

This single path implements all four store variants. Native `Z` may advance on an ordinary store because the updated value is discarded unless `P=1`.

#### 9.5.6. Exact subsystem size

| Component | Words | Bytes |
|---|---:|---:|
| Three-cycle landing and `RRSPEC` consume/restart | 9 | 18 |
| Two register-file pointer decoders | 9 | 18 |
| Load/store dispatch | 2 | 4 |
| Unified load path | 13 | 26 |
| Shared postincrement writeback | 3 | 6 |
| Unified store path | 13 | 26 |
| **Cold general-pointer subsystem** | **49** | **98** |

The two one-word `F0` veneers add four bytes to the executable table.

#### 9.5.7. Latency derivation

All forms pay two 17-cycle encoded-byte intervals:

```text
F0 primary -> secondary    17
secondary -> RRSPEC        17
```

The reference execution intervals and complete latencies are:

| Operation | Final execution interval | Complete cycles |
|---|---:|---:|
| `LD8U rD,[rA]` | 35 | **69** |
| `LD16 rD,[rA]` | 36 | **70** |
| `ST8 [rA],rS` | 35 | **69** |
| `ST16 [rA],rS` | 37 | **71** |
| `LD8U rD,[rA+]` | 41 | **75** |
| `LD16 rD,[rA+]` | 42 | **76** |
| `ST8 [rA+],rS` | 42 | **76** |
| `ST16 [rA+],rS` | 44 | **78** |

The shared code favors the load path by allowing it to fall through into the postincrement helper. Duplicating the three-word helper could remove two cycles from postincrement paths at a cost of six bytes; the compact shared form is shown here.


## 10. `F1`: bounded 2-word table

Bounds: `secondary < 0x90`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `MOV rD,rS` excluding compact/compact | 48 | 37 |
| `30-6F` | `STSP8 [SP+u4],cS` | 64 | 37 |
| `70-77` | `ZEXT8 rD` | 8 | 37 |
| `78-7F` | `SWAP8 rD` | 8 | 37 |
| `80-87` | `GETSP rD` | 8 | 37 |
| `88-8F` | `SETSP rS` | 8 | 37 |

```asm
; MOV rD,rS
movw  dL, srcL
rjmp  cluster_a_tail_17_delay_1

; STSP8 [SP+q],cS
std   Y+q, srcL
rjmp  cluster_a_tail_17

; ZEXT8 rD
clr   dH
rjmp  cluster_a_tail_17_delay_1

; SWAP8 rD
swap  dL
rjmp  cluster_a_tail_17_delay_1

; GETSP rD
movw  dL, Y
rjmp  cluster_a_tail_17_delay_1

; SETSP rS
movw  Y, srcL
rjmp  cluster_a_tail_17_delay_1
```

---

## 11. `F2`: bounded 3-word arithmetic table

Bounds: `secondary < 0x60`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `ADD rD,rS` excluding compact/compact | 48 | 38 |
| `30-5F` | `SUB rD,rS` excluding compact/compact | 48 | 38 |

```asm
; ADD rD,rS
add   dL, srcL
adc   dH, srcH
rjmp  cluster_a_tail_17

; SUB rD,rS
sub   dL, srcL
sbc   dH, srcH
rjmp  cluster_a_tail_17
```

Full-register `AND`, `OR`, and `XOR` are encoded by the dedicated runtime-decoded `F9` page. The one-byte compact forms use their direct primary encodings.

---

## 12. `F3`: bounded 3-word memory and widening-multiply table

Bounds: `secondary < 0x80`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-0F` | `ST8 [cA],rS`, noncompact `rS` only | 16 | 38 |
| `10-1F` | `MULU8.W cD,cS` | 16 | 38 |
| `20-2F` | `MULS8.W cD,cS` | 16 | 38 |
| `30-3F` | `MULSU8.W cD,cS` | 16 | 38 |
| `40-7F` | `LDSP8U cD,[SP+u4]` | 64 | 38 |

```asm
; ST8 [cA],rS
movw  X, aL
st    X, srcL
rjmp  cluster_a_tail_18_delay_1

; MULU8.W cD,cS
mul   dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; MULS8.W cD,cS
muls  dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; MULSU8.W cD,cS
mulsu dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; LDSP8U cD,[SP+q]
ldd   dL, Y+q
clr   dH
rjmp  cluster_a_tail_18_delay_1
```

Compact-source stores use the one-byte primary family. A noncompact pointer uses `F0 6D dddWaaaP` with `W=0` and `P=0`.

Native `r0:r1` are interpreter scratch, so multiply slots do not restore an ABI zero register. A 32-bit register copy is encoded as two `MOV16` operations.

## 13. `F4`: bounded 3-word table C

Bounds: `secondary < 0xB8`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-3F` | `LDSP16 cD,[SP+u4]` | 64 | 18 |
| `40-7F` | `STSP16 [SP+u4],cS` | 64 | 18 |
| `80-87` | `LSL16.1 rD` | 8 | 17 |
| `88-8F` | `LSR16.1 rD` | 8 | 17 |
| `90-97` | `ASR16.1 rD` | 8 | 17 |
| `98-9F` | `NOT16 rD` | 8 | 17 |
| `A0-A7` | `TST8 rD` | 8 | 18 |
| `A8-AF` | `INC16 rD` | 8 | 17 |
| `B0-B7` | `DEC16 rD` | 8 | 17 |

```asm
; LDSP16 cD,[SP+q]
ldd   dL, Y+q
ldd   dH, Y+q+1
rjmp  cluster_b_tail_18

; STSP16 [SP+q],cS
std   Y+q,   srcL
std   Y+q+1, srcH
rjmp  cluster_b_tail_18

; LSL16.1 rD
lsl   dL
rol   dH
rjmp  cluster_b_tail_17

; LSR16.1 rD
lsr   dH
ror   dL
rjmp  cluster_b_tail_17

; ASR16.1 rD
asr   dH
ror   dL
rjmp  cluster_b_tail_17

; NOT16 rD
com   dL
com   dH
rjmp  cluster_b_tail_17

; TST8 rD
cp    dL, r2
in    flag_tmp, SREG
rjmp  flags_commit_b_18_delay_1

; INC16 rD
add   dL, r3
adc   dH, r2
rjmp  cluster_b_tail_17

; DEC16 rD
sub   dL, r3
sbc   dH, r2
rjmp  cluster_b_tail_17
```

The permanent-one register reduces `INC16` and `DEC16` to two arithmetic instructions plus the final jump. Moving both families from the four-word page to this three-word page saves 32 bytes net.

---

## 14. `F5`: bounded 4-word table A

Bounds: `secondary < 0x60`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `CMP rL,rR` excluding compact/compact | 48 | 39 |
| `30-3F` | `LD8U rD,[cA]`, noncompact `rD` only | 16 | 38 |
| `40-4F` | `LD16 rD,[cA]`, noncompact `rD` only | 16 | 39 |
| `50-5F` | `ST16 [cA],rS`, noncompact `rS` only | 16 | 39 |

```asm
; CMP rL,rR
cp    lL, rL
cpc   lH, rH
in    flag_tmp, SREG
rjmp  flags_commit_b_18_delay_1

; LD8U rD,[cA]
movw  X, aL
ld    dL, X
clr   dH
rjmp  cluster_b_tail_18

; LD16 rD,[cA]
movw  X, aL
ld    dL, X+
ld    dH, X
rjmp  cluster_b_tail_18

; ST16 [cA],rS
movw  X, aL
st    X+, srcL
st    X, srcH
rjmp  cluster_b_tail_18
```

Compact-data forms use the one-byte primary families. Noncompact pointers use `F0 6C` for loads or `F0 6D` for stores, with `W` and `P` supplied by `RRSPEC`.

The address is copied to native `X` before a load overwrites its destination, so ordinary loads permit destination/pointer overlap.

## 15. `F6`: bounded 4-word table B

Bounds: `secondary < 0x50`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-1F` | `ST8 [cA+],rS` | 32 | 18 |
| `20-27` | `BSWAP16 rD` | 8 | 18 |
| `28-2F` | `TST16 rD` | 8 | 18 |
| `30-3F` | `MUL8 cD,cS` | 16 | 18 |
| `40-47` | `SEXT8 rD` | 8 | 18 |
| `48-4F` | `NEG16 rD` | 8 | 18 |

```asm
; ST8 [cA+],rS
movw  X, aL
st    X+, srcL
movw  aL, X
rjmp  cluster_b_tail_18

; BSWAP16 rD
mov   t0, dL
mov   dL, dH
mov   dH, t0
rjmp  cluster_b_tail_18_delay_1

; TST16 rD
cp    dL, r2
cpc   dH, r2
in    flag_tmp, SREG
rjmp  flags_commit_b_18_delay_1

; MUL8 cD,cS
mul   dL, srcL
mov   dL, r0
clr   dH
rjmp  cluster_b_tail_18

; SEXT8 rD
clr   dH
sbrc  dL, 7
dec   dH
rjmp  cluster_b_tail_18_delay_1

; NEG16 rD
neg   dL
adc   dH, r2
neg   dH
rjmp  cluster_b_tail_18_delay_1
```

A noncompact postincrement pointer uses `F0 6D dddWaaaP` with `W=0` and `P=1`. The three-operation `NEG16` sequence is smaller and faster than a `COM`/add-one formulation.

## 16. `F7`: bounded 5-word table A

Bounds: `secondary < 0x90`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-1F` | `LD8U rD,[cA+]` | 32 | 18 |
| `20-3F` | `LD16 rD,[cA+]` | 32 | 19 |
| `40-5F` | `ST16 [cA+],rS` | 32 | 19 |
| `60-6F` | `ADD32 qD,qS` | 16 | 18 |
| `70-7F` | `SUB32 qD,qS` | 16 | 18 |
| `80-83` | `LSR32.1 qD` | 4 | 18 |
| `84-87` | `ASR32.1 qD` | 4 | 18 |
| `88-8F` | `BOOL rD` | 8 | 18 |

```asm
; LD8U rD,[cA+]
movw  X, aL
ld    dL, X+
movw  aL, X
clr   dH
rjmp  cluster_c_tail_18

; LD16 rD,[cA+]
movw  X, aL
ld    dL, X+
ld    dH, X+
movw  aL, X
rjmp  cluster_c_tail_18

; ST16 [cA+],rS
movw  X, aL
st    X+, srcL
st    X+, srcH
movw  aL, X
rjmp  cluster_c_tail_18

; ADD32 qD,qS
add   d0, src0
adc   d1, src1
adc   d2, src2
adc   d3, src3
rjmp  cluster_c_tail_18

; SUB32 qD,qS
sub   d0, src0
sbc   d1, src1
sbc   d2, src2
sbc   d3, src3
rjmp  cluster_c_tail_18

; LSR32.1 qD
lsr   d3
ror   d2
ror   d1
ror   d0
rjmp  cluster_c_tail_18

; ASR32.1 qD
asr   d3
ror   d2
ror   d1
ror   d0
rjmp  cluster_c_tail_18

; BOOL rD
or    dL, dH
clr   dH
cpse  dL, r2
mov   dL, r3
rjmp  cluster_c_tail_18
```

Noncompact postincrement pointers use `F0 6C` for loads or `F0 6D` for stores with `P=1`.

`CPSE` plus the optional one-word `MOV` takes two cycles on either path. Postincrement loads reserve `rD == cA`. A 32-bit register copy uses two `MOV16` operations, and a one-bit left shift uses `ADD32 qD,qD`.

## 17. `F8`: bounded 5-word simple-condition table

Bounds: `secondary < 0x30`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-07` | `CSET.EQ rD` | 8 | 18 |
| `08-0F` | `CSET.NE rD` | 8 | 18 |
| `10-17` | `CSET.ULT rD` | 8 | 18 |
| `18-1F` | `CSET.UGE rD` | 8 | 18 |
| `20-27` | `CSET.SLT rD` | 8 | 18 |
| `28-2F` | `CSET.SGE rD` | 8 | 18 |

```asm
; Positive-bit conditions: EQ / ULT / SLT
clr   dL
clr   dH
sbic  GPIOR0, flag_bit
mov   dL, r3
rjmp  cluster_c_tail_18

; Inverted-bit conditions: NE / UGE / SGE
clr   dL
clr   dH
sbis  GPIOR0, flag_bit
mov   dL, r3
rjmp  cluster_c_tail_18
```

Skipping the one-word `MOV` costs the same as executing it. `GPIOR0` provides equal-time paths while leaving all four high scratch registers available.

Unsigned `ULE` and `UGT` materialization is canonicalized by swapping compare operands and selecting `UGE` or `ULT`.

---

## 18. `F9`: dedicated runtime-decoded full-register bitwise page

`F9` is a two-byte instruction family with no secondary executable table:

```text
F9 dddsssoo
```

```text
bits 7:5  destination register index ddd
bits 4:2  source register index sss
bits 1:0  operation

00  AND rD,rS
01  OR  rD,rS
10  XOR rD,rS
11  invalid
```

All 64 register combinations are representable for each valid operation. Compact/compact combinations are legal duplicate encodings, but assemblers and LLVM must canonicalize them to the one-byte `80-AF` compact forms.

### 18.1. Primary-slot entry and 17-cycle secondary cadence

The fixed four-word primary slot contains:

```asm
rjmp  f9_bitop_entry
nop
nop
nop
```

The slot begins on cycle 9 and reaches the dedicated entry on cycle 11. The entry performs the PC increment and pre-clears the high bytes of the two register-file pointers while the secondary byte is still transferring:

```asm
f9_bitop_entry:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    mov   XH, r2
    mov   ZH, r2
    cli
    out   SPDR, r2
    in    secondary, SPDR
    sei
```

The `OUT` lands exactly on cycle 17. Moving the two independent pointer-high clears before the handoff removes the need for pure delay and shortens the post-`OUT` decode path by two cycles. The complete handler remains exactly 39 words.

The resulting complete family latencies are 52 cycles for `AND`, 53 for `OR`, and 54 for `XOR`.

### 18.2. Runtime register-file pointer decode

Use:

```text
secondary = native r24
X         = destination register-file pointer
Z         = source register-file pointer
r0:r1     = original destination value
r25       = source low byte
r27       = source high byte, temporarily replacing XH
```

Destination decoding:

```asm
    mov   XL, secondary
    swap  XL
    andi  XL, 0x0e       ; bits 7:5 become 2*d
    subi  XL, -8
    mov   XH, r2
```

Source decoding:

```asm
    mov   ZL, secondary
    lsr   ZL
    andi  ZL, 0x0e       ; bits 4:2 become 2*s
    subi  ZL, -8
    mov   ZH, r2
```

Both pointers address the AVR register-file data-space mapping at native addresses `r8-r23`.

The operation field is preserved without another scratch register:

```asm
    lsr   secondary
```

After this instruction:

```text
C                 = original operation bit 0
secondary bit 0   = original operation bit 1
```

The subsequent `LD` instructions do not modify `SREG`, so both operation bits remain available for dispatch.

### 18.3. Capture both operands before modifying the destination

```asm
    ld    r0,  X+
    ld    r1,  X
    ld    r25, Z+
    ld    r27, Z
```

The complete original destination is captured before any store, so `rD == rS` is valid.

Loading the source high byte into native `r27` temporarily destroys `XH`. This is safe because the destination loads have completed and all architectural registers reside below data-space address `0x100`. `XH` is restored to zero immediately before the result stores.

### 18.4. Operation dispatch and shared writeback

```asm
    ; secondary bit 0 is original op bit 1.
    sbrc  secondary, 0
    rjmp  .Lf9_high_operation

    ; Low operation group: AND=00, OR=01.
    ; Carry is original op bit 0.
    brcc  .Lf9_and

    ; OR
    or    r0, r25
    or    r1, r27
    rjmp  .Lf9_store

.Lf9_and:
    and   r0, r25
    and   r1, r27
    ; fall through

.Lf9_store:
    mov   XH, r2
    st    X,  r1
    st    -X, r0
    rjmp  cluster_a_tail_18

.Lf9_high_operation:
    ; High group: XOR=10, invalid=11.
    brcs  .Lf9_invalid
    eor   r0, r25
    eor   r1, r27
    rjmp  .Lf9_store

.Lf9_invalid:
    rjmp  trap_entry
```

The carry established by `LSR secondary` survives all four operand loads. No runtime bounds validation is needed for the register fields because three-bit indices always select `r0-r7`.

### 18.5. Exact handler size

| Component | Words | Bytes |
|---|---:|---:|
| PC update, pointer-high preclear, and reverse secondary handoff | 9 | 18 |
| Destination pointer decode | 4 | 8 |
| Source pointer decode | 4 | 8 |
| Operation-state preparation and four operand loads | 5 | 10 |
| Operation dispatch, three ALU paths, shared writeback, and invalid shim | 17 | 34 |
| **Dedicated `F9` handler** | **39** | **78** |

The primary slot is part of the fixed 2,048-byte primary table and adds no incremental bytes to this page-specific total.

### 18.6. Reference latencies

The primary slot and pre-handoff work place the speculative following-primary `OUT` exactly on cycle 17. The operation paths then reach Cluster A at different times because `AND`, `OR`, and `XOR` take different selection paths.

| Operation | Complete instruction latency |
|---|---:|
| `AND rD,rS` | **52 cycles** |
| `OR rD,rS` | **53 cycles** |
| `XOR rD,rS` | **54 cycles** |

These totals are measured from entry to the `F9` primary slot through entry to the following primary slot. Compact bitwise operations remain one-byte, 17-cycle instructions.

### 18.7. Size summary

The dedicated `F9` handler occupies 39 AVR words / 78 bytes. It requires no secondary executable table, page stub, bounds check, or additional cadence cluster.

---

## 19. `FA`: compact immediate and register-count 16-bit shifts

Valid secondary range: `00-EF`. `F0-FF` is reserved and traps.

The original register-count encodings remain unchanged. Moving them to `C0-EF` would require an additional rejection path or executable trap slots for `F0-FF`, adding code size or latency without improving valid-instruction performance. The new immediate forms therefore use the previously unused range `30-EF`.

### 19.1. Encoding map

| Secondary | Instruction | Encoding details |
|---|---|---|
| `00-0F` | `SHL16V cD,cCount` | bits `3:2` destination, bits `1:0` count register |
| `10-1F` | `LSR16V cD,cCount` | bits `3:2` destination, bits `1:0` count register |
| `20-2F` | `ASR16V cD,cCount` | bits `3:2` destination, bits `1:0` count register |
| `30-6F` | `LSL16I cD,imm4` | `secondary - 0x30`: bits `5:4` destination, bits `3:0` count |
| `70-AF` | `LSR16I cD,imm4` | `secondary - 0x70`: bits `5:4` destination, bits `3:0` count |
| `B0-EF` | `ASR16I cD,imm4` | `secondary - 0xB0`: bits `5:4` destination, bits `3:0` count |
| `F0-FF` | Reserved | trap |

The immediate count is encoded directly in four bits and is therefore in `0-15`. Equivalently:

```text
LSL16I: secondary = 0x30 + (cD << 4) + imm4
LSR16I: secondary = 0x70 + (cD << 4) + imm4
ASR16I: secondary = 0xB0 + (cD << 4) + imm4
```

For register-count forms, the low four bits of `cCount` select a shift count in `0-15`; the count register is preserved. Copying the count before entering the shared body makes `cD == cCount` valid. All six instruction families preserve architectural condition state.

### 19.2. Decoder and table structure

The primary slot preloads the existing register-forwarding base and a pre-biased low-byte address for a thirteen-entry immediate body-jump table. The dedicated decoder performs the exact cycle-17 reverse SPI handoff, then selects one of two paths:

```asm
cpi   secondary, 0x30
brlo  register_count

; FA 30-EF immediate form; FA F0-FF reaches the final invalid entry.
mov   t0, secondary
swap  secondary
andi  secondary, 0x0f
mov   ZL, immediate_jump_base_low
add   ZL, secondary
ijmp

register_count:
; Original FA 00-2F forwarding index.
add   ZL, secondary
add   ZL, secondary
nop                         ; balances the taken classification branch
ijmp
```

The low-byte-only additions are safe because the pre-biased immediate base, all thirteen immediate jumps, and the complete 48-entry forwarding table are constrained to one 256-word AVR program-memory page.

The immediate jump table contains twelve direct `RJMP`s—one for each operation/destination body—and a thirteenth invalid entry selected by secondary values `F0-FF`. The register table remains 48 two-word entries:

```asm
; Example: SHL16V c2,c1
mov   r26, c1L
rjmp  fa_shl_c2

; Example: LSR16V c0,c3
mov   r26, c3L
rjmp  fa_lsr_c0

; Example: ASR16V c3,c3
mov   r26, c3L
rjmp  fa_asr_c3
```

Both paths enter the same twelve destination-specialized bodies on cycle 32. `SHL16V`/`LSL16I` and `LSR16V`/`LSR16I` use twelve-word bodies; `ASR16V`/`ASR16I` use thirteen-word bodies. The shift-by-eight path reduces counts `8-15` to a byte transfer followed by at most seven single-bit iterations.

### 19.3. Size and latency

```text
Dedicated FA decoder                    19 words /  38 bytes
Immediate body-jump table               13 words /  26 bytes
48 register forwarding entries          96 words / 192 bytes
8 left/logical-right bodies             96 words / 192 bytes
4 arithmetic-right bodies               52 words / 104 bytes
                                                   ---------
Total FA-specific implementation                    552 bytes
Increase over the former variable-only FA page       64 bytes
```

Immediate and register-count forms have identical complete latency:

| Count | `SHL16V` / `LSL16I` / `LSR16V` / `LSR16I` | `ASR16V` / `ASR16I` |
|---:|---:|---:|
| 0 | 42 | 42 |
| 1 | 45 | 45 |
| 4 | 60 | 60 |
| 7 | 75 | 75 |
| 8 | 44 | 45 |
| 12 | 62 | 63 |
| 15 | 77 | 78 |

LLVM should select `LSL16I`, `LSR16I`, or `ASR16I` for compile-time counts in `0-15`. The register-count forms remain available for genuinely variable shifts, while the one-byte `.1` forms may still be preferable when a surrounding combine can use them directly.

## 20. `FB-FD`: condition-family prefixes with one shared move table

The three prefixes provide full-register conditional moves while sharing one 64-entry operand-specialized executable table:

| Prefix | Secondary `00-3F` | Secondary `40-7F` | Saved condition bit |
|---:|---|---|---:|
| `FB` | `CMOV.EQ rD,rS` | `CMOV.NE rD,rS` | `Z` |
| `FC` | `CMOV.ULT rD,rS` | `CMOV.UGE rD,rS` | `C` |
| `FD` | `CMOV.SLT rD,rS` | `CMOV.SGE rD,rS` | `S` |

All three prefixes require:

```text
secondary < 0x80
bit 6      invert the selected condition bit
bits 5:3   destination rD
bits 2:0   source rS
```

Semantics:

```text
if selected condition is true:
    rD = rS
else:
    rD is unchanged
```

`CMOV` preserves the architectural condition byte. `rD == rS` is legal and acts as a conditional no-op. Unsigned `ULE` and `UGT` are formed by swapping the operands of the comparison and using `UGE` or `ULT`, respectively.

### 20.1. Prefix setup

The three primary slots share the same secondary decoder. While the secondary byte is in flight, each primary slot loads a one-bit mask identifying its condition family and preloads the word address of the shared table:

```asm
; FB: EQ / NE
ldi   cmask, (1 << SREG_Z)
ldi   ZL, lo8(pm(cmov_table))
ldi   ZH, hi8(pm(cmov_table))
rjmp  cmov_gate

; FC: ULT / UGE
ldi   cmask, (1 << SREG_C)
ldi   ZL, lo8(pm(cmov_table))
ldi   ZH, hi8(pm(cmov_table))
rjmp  cmov_gate

; FD: SLT / SGE
ldi   cmask, (1 << SREG_S)
ldi   ZL, lo8(pm(cmov_table))
ldi   ZH, hi8(pm(cmov_table))
rjmp  cmov_gate
```

A suitable allocation is:

```text
secondary  = AVR r26
cmask      = AVR r27
ctest      = interpreter scratch r25 or r26
Z          = shared-table word address
```

The speculative secondary byte is already in flight when the primary slot is entered. The four shown setup words therefore fill the four-word primary slot exactly. The common gate consumes the secondary byte, advances `PC`, and starts the following transfer.

### 20.2. Common condition gate

The prefix slot reaches the common gate on cycle 14. The gate completes the 24-bit PC increment on cycles 14-16, reads the completed secondary byte on cycle 17, and launches the speculative following-primary transfer with a standard `IN; OUT` handoff on cycle 18:

```asm
cmov_gate:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    in    secondary, SPDR
    out   SPDR, r2              ; begin fetching the following primary opcode

    cpi   secondary, 0x80
    brsh  cmov_invalid

    in    ctest, GPIOR0
    sbrc  secondary, 6          ; bit 6 selects the inverse condition
    com   ctest                 ; skip and execute paths are both two cycles
    and   ctest, cmask
    breq  cmov_no_move

    andi  secondary, 0x3F       ; dddsss operand index
    lsl   secondary             ; two AVR words per shared-table entry
    add   ZL, secondary
    adc   ZH, ZERO
    ijmp

cmov_no_move:
    rjmp  cluster_a_tail

cmov_invalid:
    rjmp  invalid_secondary
```

The standard handoff reads `SPDR` before launching the next transfer, so no interrupt masking or SREG save/restore is required. The complete gate is exactly **19 AVR words / 38 bytes**. Complementing all bits of `ctest` is safe because `cmask` immediately discards every bit except the selected architectural condition.

The `AND` intentionally sets native AVR `Z`; the following `BREQ` tests that temporary native result, not architectural `VM_FLAGS`.

### 20.3. Shared 64-entry move table

After masking bit 6, the remaining six bits are the ordinary full-register operand matrix:

```text
bits 5:3  destination rD
bits 2:0  source rS
```

Every table entry is exactly two AVR words:

```asm
cmov_table:
    ; Entry for CMOV r0,r0
    movw  r8,  r8
    rjmp  cmov_tail

    ; Entry for CMOV r0,r1
    movw  r8,  r10
    rjmp  cmov_tail

    ; ...all remaining operand combinations...

    ; Entry for CMOV r7,r7
    movw  r22, r22
    rjmp  cmov_tail
```

The same table is reached from all six architectural conditions. Condition-false execution bypasses it entirely.

### 20.4. Cadence and performance

The condition-false path performs the bounds check and condition gate but avoids fixed-stride table indexing, `IJMP`, and `MOVW`. The condition-true path adds those operations. Neither path restarts the external-flash stream.

| Path | Reference cycles | Notes |
|---|---:|---|
| Condition false | 36 | Goes directly to Cluster A's reverse tail |
| Condition true | 37 | Indexes the shared table and executes `MOVW` |

The shown implementation does not pad the two paths to equal time; it takes 36 cycles when the condition is false and 37 cycles when it is true.
The PC update executes during the secondary-byte transfer window. The gate uses the earliest legal standard handoff, so no additional wait padding is required.

For LLVM `select`, the destination should normally be initialized with the false value and the conditional move should name the true value:

```text
MOV       result,falseValue       ; omitted when coalesced
CMP       lhs,rhs
CMOV.cc   result,trueValue
```

The backend may invert the condition and exchange the true and false values to improve register allocation or eliminate the initializing move.

### 20.5. Exact code size

```text
64 shared entries * 2 words * 2 bytes       = 256 bytes
shared 19-word condition gate                =  38 bytes
three-cycle Cluster-A false-path landing       =   4 bytes
                                                ---------
exact incremental code outside primary slots = 298 bytes
```

The three primary slots are included in the fixed 2,048-byte primary table. The false path uses cluster A's shared cadence tail and true table entries use cluster C's shared cadence tail, so no page-local tail or placement allowance is charged here.

## 21. `FE`: bounded 2-word `MUL16` forwarding table

Bounds: `secondary < 0x40`.

```text
bits 5:3  destination rD
bits 2:0  source rS
```

Instruction semantics:

```text
rD = low16(rD * rS)
```

The operation returns the product modulo `2^16`. Signed and unsigned multiplication therefore use the same instruction. The source is preserved unless it aliases the destination, in which case the original operand value is captured before the destination is overwritten. Architectural condition state is preserved.

Every one of the 64 dense entries is exactly two AVR words. The entry copies the selected source into native `X` and jumps to one of eight shared bodies selected by the destination:

```asm
; Example: MUL16 r2,r6
movw  X, r6L
rjmp  fe_mul16_r2

; General forwarding slot
movw  X, srcL
rjmp  fe_mul16_rD
```

Copying the complete source to `X` makes all operand aliases legal, including `MUL16 rD,rD`. Each destination-specific body first copies the original destination to native scratch `tL:tH`, then evaluates only the partial products that contribute to bits `15:0`:

```text
(aL + 256*aH) * (bL + 256*bH) mod 65536
  = aL*bL + 256*(aH*bL + aL*bH) mod 65536
```

The high-byte product `aH*bH` contributes only at bit 16 and above and is omitted.

```asm
; Shared body specialized for architectural destination rD.
; Input:
;   dL:dH  = original destination operand
;   XL:XH  = preserved source operand
; Scratch:
;   tL:tH  = native r30:r31 (`Z`)
;   r1:r0  = native AVR MUL result

fe_mul16_rD:
    movw  r30, dL         ; preserve original aL:aH in Z

    mul   r30, XL          ; aL * bL
    movw  dL, r0          ; low product supplies result bits 15:0

    mul   r31, XL          ; aH * bL
    add   dH, r0          ; only its low byte contributes

    mul   r30, XH          ; aL * bH
    add   dH, r0          ; only its low byte contributes

    rjmp  fe_tail
```

The shared body is exactly eight AVR words and twelve native cycles:

```text
MOVW                    1
MUL + MOVW              3
MUL + ADD               3
MUL + ADD               3
RJMP                    2
                        --
                        12 cycles
```

The two-word forwarding entry adds three native cycles (`MOVW` plus `RJMP`). Including secondary fetch, bounds checking, fixed-stride dispatch, and the page tail, the shown organization completes in **46 cycles**. The latency is independent of operand values and aliasing.

Exact page-specific code size:

```text
64 forwarding entries * 2 words * 2 bytes   = 256 bytes
8 shared bodies * 8 words * 2 bytes         = 128 bytes
                                                ---------
exact page-specific table and bodies            384 bytes
```

The primary slot, shared width-two decoder, invalid path, and Cluster C cadence tail are accounted for globally in Sections 26 and 34 rather than charged again to `FE`.

Native `r0:r1`, `X`, and `Z` are interpreter scratch and may be clobbered. No explicit clearing of native `r1` is required because architectural zero is held in the separate permanent `ZERO` register.

---

# Part I-B — Dispatch and Implementation Strategy

## 22. Primary dispatch organization and locality

The primary dispatch table uses a **four-word, eight-byte stride**:

```text
256 * 8 bytes = 2048 bytes
```

The code-size accounting region begins at `primary_table`, and `primary_table` is aligned to **256 AVR words / 512 bytes**. Because the table-base word address therefore has a zero low byte, primary dispatch adds only the high byte of the table base after multiplying the opcode by four:

```asm
mul   primary, PRIMARY_SLOT_WORDS     ; PRIMARY_SLOT_WORDS = 4
movw  Z, r0
subi  ZH, -hi8(pm(primary_table))     ; low base byte is known zero
ijmp
```

This saves one AVR word and one native cycle relative to a general unaligned-base `SUBI`/`SBCI` pair. The saved cycle is normally cadence slack rather than a reduction below the 18-cycle external-flash byte cadence. Alignment padding before `primary_table` is outside the code-size accounting region by definition.

A primary slot has one of two forms:

```asm
; Complete direct handler: at most three operation words plus the final jump.
operation_word_1
operation_word_2
operation_word_3
rjmp  cluster_a_tail
```

or:

```asm
; Multi-byte, control, or page-prefix setup.
setup_word_1
setup_word_2
setup_word_3
rjmp  out_of_line_continuation
```

Fewer than three setup or operation words leave harmless padding. The speculative byte following the primary opcode is already in flight when the slot is entered. Out-of-line continuations consume that byte, advance `PC`, start the next transfer, and perform the remaining work. Therefore the forwarding `RJMP` normally occupies cycles that would otherwise be transfer-wait padding rather than extending the encoded-byte cadence.

### 22.1. Direct one-byte families

Every one-byte handler from `00-BF` fits in four words including its final `RJMP`:

| Family | Native words before tail | Total slot words | Result |
|---|---:|---:|---|
| `MOV` | 1 | 2 | fits |
| `ADD`, `SUB`, `AND`, `OR`, `XOR` | 2 | 3 | fits |
| `CMP` | 3 | 4 | exact fit |
| `LD8U` | 3 | 4 | exact fit |
| `ST8` | 2 | 3 | fits |
| `LD16`, `ST16` | 3 | 4 | exact fit |
| `PUSH16`, `POP16` | at most 3 | at most 4 | fits |

For example:

```asm
; LD8U cD,[cA] -- exact four-word slot
movw  X, aL
ld    dL, X
clr   dH
rjmp  cluster_a_tail_18_delay_1
```

The exact-fit families cannot carry local delay padding. Their final `RJMP` selects an appropriate shared 17- or 18-cycle cadence tail, which is already included in the shared-tail allowance.

### 22.2. Immediate and control primaries

The `C0-CF` immediate families do not require sixteen fully duplicated continuation bodies. A compact implementation preloads an operation-stub address or an exact native register-file address in the four-word primary slot, then uses one family-shared operand-fetch continuation. The continuation consumes the immediate byte or bytes, starts the following transfer, and enters a short destination-specialized operation stub.

One compact organization is:

```asm
; Primary slot: one of four destination-specialized entries
ldi   ZL, lo8(pm(ldi8_cD_apply))
ldi   ZH, hi8(pm(ldi8_cD_apply))
nop                               ; executed cycle-9 retiming padding
rjmp  fetch_imm8_then_ijmp

; Shared continuation
fetch_imm8_then_ijmp:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    in    t0, SPDR                 ; cycle 17
    out   SPDR, r2                 ; cycle 18
    ijmp

ldi8_cD_apply:
    mov   dL, t0
    clr   dH
    rjmp  cluster_a_tail_18_delay_1
```

`LDI16` uses an analogous two-byte fetch continuation. `ADDI.S8` and `CMPI.S8` share the signed-immediate fetch path but use separate destination-specialized apply stubs. This avoids run-time register decoding while keeping the continuation code bounded.

In the reference layout, the `C0-CF` continuation and apply-stub block occupies **182 bytes**. Its complete latencies are:

| Family | Cycles |
|---|---:|
| `LDI8 cD,imm8` | 35 |
| `LDI16 cD,imm16` | 52 |
| `ADDI.S8 cD,simm8` | 35 |
| `CMPI.S8 cL,simm8` | 35 |

The extra `RJMP`/`IJMP` work is hidden inside the operand-transfer windows except where reflected in those exact totals.

The reference handlers use the operand-transfer window for the `D0-D7` two-byte branch, `ADJSP`, and `SYS` forms as described in Section 30. The `E0-E3` handlers use their additional transfer slack to reach the listed latencies.

The one-byte indirect-control and return forms can share the seek/restart handler. In the reference schedule they take 109 cycles for `JMPP`, 116 for `CALLP`, and 109 for `RET`.

### 22.3. Secondary prefixes

The primary slots preload three page-specific values:

```text
entry limit
word-address low byte of the table
word-address high byte of the table
```

and use the fourth word to branch to a tiny page stub. The page stub loads the slot multiplier and enters one generic bounded-page decoder:

```asm
; Primary prefix slot
ldi   page_limit, ENTRY_COUNT
ldi   ZL, lo8(pm(page_table))
ldi   ZH, hi8(pm(page_table))
rjmp  page_stub

page_stub:
    ldi   page_multiplier, SLOT_WORDS
    rjmp  bounded_page_decode
```

The generic decoder consumes the secondary byte, starts the following transfer, checks the loaded limit, multiplies by the loaded slot width, adds the preloaded table base, and performs one `IJMP`.

Four generic slot widths share two-word stubs:

```text
slot widths 1, 3, 4, and 5
```

`F1` and `FE` bypass those stubs and share a dedicated width-two decoder. `FA` uses its own combined immediate/register-count decoder. The exact secondary-decoder infrastructure is:

```text
4 generic width stubs and generic decoder   20 words / 40 bytes
shared width-two decoder                    14 words / 28 bytes
dedicated `FA` shift decoder                19 words / 38 bytes
                                             ------------------
total                                       53 words / 106 bytes
```

The bounded pages are `F0-F8` and `FE`. `F9` and `FA` use dedicated decoders, and `FB-FD` use their separate shared condition gate. The generic multiplier-stub path reaches a standard cycle-17/18 `IN; OUT` handoff. The shared two-word decoder instead uses an exact cycle-17 reverse handoff. In both cases, PC-update work occupies transfer slack rather than extending the post-transfer critical path.

The reference interpreter uses the decode, table, forwarding, and shared-body structures in Sections 9-21 for the fifteen secondary prefixes `F0-FE`. The generic multiplier decoder serves `F0` and `F2-F8`; the shared width-two decoder serves `F1` and `FE`; dedicated handlers serve `F9` and `FA`; the `F9` bitwise handler is placed near the primary table; and `FB-FD` use their shared condition gate. The example physical layout places executable tables and shared bodies in the `RJMP`-reachable clusters described in Section 26.

### 22.4. Reference latency summary

| Instruction class | Reference complete latency |
|---|---|
| `00-BF` direct one-byte instructions | Selected 17- or 18-cycle cadence from Sections 5 and 27 |
| `C0-CF` immediate instructions | 35 / 52 / 35 / 35 by family |
| `D0-D7` branch/`ADJSP`/`SYS` | Exact values in Section 30 |
| `E0-E3` multi-byte direct control | 134 for near forms; 149 for far forms |
| `E4-EB` `JMPP`/`CALLP` | 109 / 116 |
| `EF` `RET` | 109 |
| `F0-F8` dense pages | Fast forms use their page cadence; cold pointer forms take ~69-78 cycles |
| `F9` runtime bitwise page | AND 52, OR 53, XOR 54 cycles |
| `FA` immediate and register-count shifts | Count-dependent values in Section 19; 42-78 cycles |
| `FB-FD` conditional moves | 36 cycles false / 37 cycles true |
| `FE MUL16` | 46 cycles |

The primary dispatch multiplier is a two-cycle AVR `MUL`.

---

## 23. Two-byte dense-page pipeline

1. Primary dispatch consumes the prefix opcode and starts fetching the secondary byte.
2. `F0` and `F2-F8` enter the generic multiplier decoder; `F1` and `FE` enter the shared width-two decoder; `F9` and `FA` enter dedicated runtime decoders; `FB-FD` enter the shared condition gate.
3. The selected decoder advances `PC`, consumes the secondary byte, and starts speculative fetch of the following primary opcode.
4. A truncated page performs one upper-bound check.
5. A direct dense page calculates the fixed-stride word address and executes one `IJMP` into the operand-specialized slot. A condition-false `FB-FD` instruction bypasses its shared table.
6. `F1-F8` slots perform the operation and `RJMP` to their assigned cluster continuation. `F9` dynamically decodes both architectural-register pointers, performs the selected bitwise operation, and returns through Cluster A. `FA` immediate entries jump directly to shared shift bodies while register-count entries forward through `MOV`/`RJMP` pairs. `FB-FD` use the shared conditional-move table, and `FE` slots forward to shared multiplication bodies.
7. The assigned cluster continuation consumes the speculative following primary byte and resumes primary dispatch.

There is no run-time architectural-register decoding for the dense `F1-F8` fast paths, `FA`, `FB-FD`, or `FE`. `F0 69-6D` dynamically decode cold 32-bit or general-pointer operands from `RRSPEC`, and `F9` dynamically decodes two 16-bit register indices from its secondary byte. `FA` uses immediate body jumps plus register-count forwarding entries, `FE` uses forwarding entries, and `FB-FD` share one operand table.

---

## 24. Bounds-check strategy

Use a secondary register in AVR `r16-r31`:

```asm
cp    secondary, page_limit
brsh  .Linvalid_secondary
```

Valid path:

```text
CP                   1 cycle
BRSH not taken       1 cycle
                     -------
                     2 cycles
```

Shared code cost:

```text
CP + BRSH in the generic decoder    2 words
adjacent invalid-secondary RJMP     1 word
```

The comparison and invalid shim are emitted once, not once per page. Each page contributes only its preloaded limit and two-word multiplier stub, included in the 68-byte combined bounded-decoder infrastructure.

For two- through four-word pages, these two valid-path cycles can replace cadence padding. For larger pages, the check remains worthwhile even if it contributes to a small overrun: omitting the unused table tail saves hundreds or thousands of bytes.

The ten bounded pages perform this upper-bound check in either the generic or shared width-two decoder. `FB-FD` use `secondary < 0x80`; bit 6 selects the inverse condition and bits 5:0 index the shared table. `F9` needs no register-field bounds check because each operand is a three-bit index; operation value `11` traps locally. `FE` uses `secondary < 0x40`. The duplicate compact-register combinations removed from `F1`, `F2`, and `F5` make their valid ranges contiguous, so no internal range test is required.

---

## 25. Fixed-stride address calculation

```text
slotAddressWords = tableBaseWords + secondary * slotWords
```

### 25.1. Generic multiplier decoder

`F0` and `F2-F8` use four two-word width stubs and one generic multiplier decoder. With cycle-9 primary entry, the setup/stub path reaches the secondary-byte `IN` on cycle 17 and the following-primary `OUT` on cycle 18:

```asm
bounded_page_decode:
    in    secondary, SPDR
    out   SPDR, ZERO

    add   r4, r3
    adc   r5, r2
    adc   r6, r2

    cp    secondary, page_limit
    brsh  invalid_secondary

    mul   secondary, page_multiplier
    add   ZL, r0
    adc   ZH, r1
    ijmp

invalid_secondary:
    rjmp  trap_entry
```

Reading `SPDR` before the new `OUT` makes this a standard handoff; it needs no interrupt mask or SREG wrapper. The four width stubs plus decoder and invalid shim occupy **20 words / 40 bytes**.

### 25.2. Shared two-word decoder

`F1` and `FE` bypass a multiplier-loading stub and share a dedicated two-word decoder. Their primary slots jump directly to this path on cycle 14:

```asm
bounded_width_2_decode:
    add   r4, r3
    adc   r5, r2
    cli
    out   SPDR, ZERO             ; exact cycle 17
    in    secondary, SPDR
    sei
    adc   r6, r2

    cp    secondary, page_limit
    brsh  invalid_secondary

    add   ZL, secondary
    adc   ZH, ZERO
    add   ZL, secondary
    adc   ZH, ZERO
    ijmp
```

The two complete 16-bit additions preserve the ninth offset bit for `F1` entries `0x80-0x8F`. This decoder occupies **14 words / 28 bytes**. With the generic decoder and stubs, bounded-page infrastructure occupies **34 words / 68 bytes**. The dedicated `FA` decoder adds **19 words / 38 bytes**, for **53 words / 106 bytes** of secondary decode infrastructure in total.

### 25.3. Dedicated `FA` shift decoder

`FA` uses the cycle-17 reverse handoff shown in Section 19 rather than the shared width-two bounds decoder. A single threshold distinguishes the unchanged register encodings `00-2F` from immediate encodings `30-EF`; the immediate jump table itself maps `F0-FF` to the invalid-secondary trap. Both valid paths are balanced to enter a shared shift body on cycle 32. The decoder occupies **19 words / 38 bytes**.

## 26. Single-section physical layout and jump relaxation

### 26.1. Measurement origin and alignment

The code-size accounting region begins at a 256-word-aligned `primary_table`. Alignment padding before that symbol is outside the reported implementation size. No interior block requires alignment greater than one AVR word.

### 26.2. Reference order and estimated word ranges

The following single-section order is a reference layout that keeps the major static transfers in range. The listed fixed-size blocks reflect the shown assembly sequences. The ordinary `F0` body block uses the budgeted allocation from Section 34; implementations may vary within the permitted size range provided all static transfers remain in range and no interior power-of-two alignment gaps are introduced.

| Order | Block | Start word | End word, exclusive | Words | Bytes |
|---:|---|---:|---:|---:|---:|
| 1 | Four-word primary table | 0 | 1024 | 1024 | 2048 |
| 2 | Dedicated `F9` handler | 1024 | 1063 | 39 | 78 |
| 3 | Dedicated `FA` shift decoder | 1063 | 1082 | 19 | 38 |
| 4 | Shared width-two decoder | 1082 | 1096 | 14 | 28 |
| 5 | Generic decoder and four width stubs | 1096 | 1116 | 20 | 40 |
| 6 | Shared `FB-FD` condition gate | 1116 | 1135 | 19 | 38 |
| 7 | Primary continuations, compact tails, `SYS` table, seek/restart, local delays, and traps | 1135 | 1779 | 644 | 1288 |
| 8 | Cluster-A false-path landing and cadence cluster | 1779 | 1805 | 26 | 52 |
| 9 | Local F0 trap plus `F0` veneer table | 1805 | 1916 | 111 | 222 |
| 10 | `F0` immediate, stack, absolute, and program-space bodies | 1916 | 2668 | 752 | 1504 |
| 11 | Shared `F0` cold-32 subsystem | 2668 | 2732 | 64 | 128 |
| 12 | Shared `F0` cold general-pointer subsystem | 2732 | 2781 | 49 | 98 |
| 13 | `F1` table | 2781 | 3069 | 288 | 576 |
| 14 | `F2` table | 3069 | 3357 | 288 | 576 |
| 15 | `F3` table | 3357 | 3741 | 384 | 768 |
| 16 | Cluster B and two local trap shims | 3741 | 3768 | 27 | 54 |
| 17 | `F4` table | 3768 | 4320 | 552 | 1104 |
| 18 | `F5` table | 4320 | 4704 | 384 | 768 |
| 19 | `F6` table | 4704 | 5024 | 320 | 640 |
| 20 | `F7` table | 5024 | 5744 | 720 | 1440 |
| 21 | Cluster C and local trap shim | 5744 | 5768 | 24 | 48 |
| 22 | `F8` table | 5768 | 6008 | 240 | 480 |
| 23 | `FA` immediate body-jump table | 6008 | 6021 | 13 | 26 |
| 24 | `FA` register forwarding table | 6021 | 6117 | 96 | 192 |
| 25 | Twelve shared `FA` shift bodies | 6117 | 6265 | 148 | 296 |
| 26 | Shared `FB-FD` move table | 6265 | 6393 | 128 | 256 |
| 27 | `FE` forwarding table | 6393 | 6521 | 128 | 256 |
| 28 | Eight `FE` multiplication bodies | 6521 | 6585 | 64 | 128 |
|  | **Reference end** |  | **6585** | **6585** | **13,170** |

Startup-only helpers and startup code follow this endpoint and are excluded from the core-size accounting region.

### 26.3. Exact shared cadence-tail sequences

The shown cadence tails implement 17- and 18-cycle schedules.

#### Reverse-order 17-cycle tail

```asm
cluster_tail_17_delay_1:
    nop
cluster_tail_17:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    cli
    out   SPDR, r2
    in    primary, SPDR
    sei
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

The tail body remains eleven words; the optional one-cycle delay makes the complete reverse region twelve words.

#### Standard 18-cycle tail

```asm
cluster_tail_18_delay_2:
    rjmp  cluster_tail_18
cluster_tail_18_delay_1:
    nop
cluster_tail_18:
    add   r4, r3
    in    primary, SPDR
    out   SPDR, r2
    adc   r5, r2
    adc   r6, r2
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

The standard tail body remains nine words. A one-word `RJMP` provides a two-cycle delay without two `NOP` words.

#### Cluster A commit arrangement

```asm
cluster_a_tail_18_delay_2:
    rjmp  cluster_a_tail_18
flags_commit_a_18_delay_1:
    out   GPIOR0, flag_tmp
cluster_a_tail_18_delay_1:
    nop
cluster_a_tail_18:
    ; nine-word standard body
```

Together with the twelve-word reverse region, Cluster A occupies 24 words.

#### Cluster B commit arrangement

```asm
flags_commit_b_18_delay_2:
    out   GPIOR0, flag_tmp
cluster_b_tail_18_delay_2:
    rjmp  cluster_b_tail_18
flags_commit_b_18_delay_1:
    out   GPIOR0, flag_tmp
cluster_b_tail_18_delay_1:
    nop
cluster_b_tail_18:
    ; nine-word standard body
```

This supports `TST8` and the longer 16-bit compare/test writers without widening any dense slot. Cluster B occupies 25 words including its reverse region.

#### Cluster C arrangement

```asm
cluster_c_tail_17_delay_1:
    nop
cluster_c_tail_17:
    ; eleven-word reverse body

cluster_c_tail_18_delay_2:
    rjmp  cluster_c_tail_18
cluster_c_tail_18_delay_1:
    nop
cluster_c_tail_18:
    ; nine-word standard body
```

Cluster C occupies 23 words. The cold pointer handlers return through Cluster A, so they require no additional cadence cluster.

### 26.4. Static-transfer reach considerations

AVR `RJMP` and `RCALL` reach `-2048..+2047` words relative to the following instruction. Any layout using these short transfers needs to keep each target within that range.

The reference layout is arranged so that:

- the primary `F9` slot reaches the dedicated `F9` handler directly;
- the `F9` handler reaches Cluster A directly;
- all `F4-F7` entries reach their assigned Cluster B or Cluster C continuation;
- every `FA` immediate jump and register forwarding entry reaches its destination-specific shift body;
- every `FE` forwarding entry reaches its destination-specific multiplication body;
- every `FA` and `FE` shared body reaches Cluster C;
- delay ladders are duplicated locally when a shared `RCALL` delay would exceed range.

A final GNU AVR link is useful for catching out-of-range static transfers. The reference size estimate does not reserve space for automatic trampolines or long-jump expansion.

### 26.5. Conditional-branch relaxation

Short conditional branches inside interpreter handlers target local labels or nearby one-word `RJMP` shims. No assembler-generated long conditional-branch expansion is included.

For AVM code, each condition has both a two-byte `rel8` form and a three-byte `rel16` form. A backend can select among:

```text
BRcond rel8 target       2 bytes
BRcond16 rel16 target    3 bytes
inverse BRcond + JMPF    6 bytes, for targets outside signed rel16 reach
```

The direct `rel16` form replaces the previous five-byte medium-range sequence `inverse BRcond rel8 + JMP16`. Besides saving two executable bytes, it avoids a taken short-branch stream restart on the fallthrough path and avoids decoding a separate `JMP16` on the target path.

### 26.6. Assembly layout assertions

Compile-time assertions for the reference block boundaries, dense slot widths, and static-transfer displacements make layout regressions easier to detect.

### 26.7. Latency consequences of the physical layout

Pointer class determines instruction selection:

- compact pointer and compact data: one-byte 18-cycle primary form;
- compact pointer and noncompact data: two-byte ~35-38-cycle dense form;
- noncompact pointer: three-byte ~69-78-cycle cold fallback.

No additional cadence tail or dispatch stage is introduced for the fast path.

Two compact array pointers are sufficient for the bubble-sort loop mappings, one compact marking pointer is sufficient for Sieve, and Fibonacci uses no explicit data-space pointer in its recursive body. Performance falls to the cold fallback only when allocator pressure places a hot pointer in a noncompact register.

## 27. Native register-allocation rules

This section records every family whose native sequence changes or whose cadence selection is materially constrained by the final register allocation.

### 27.1. Direct one-byte primary families

| Family | Native work before final tail | Handler cycles including `RJMP` | Cadence |
|---|---|---:|---:|
| `MOV` | `MOVW` | 3 | 17 |
| `ADD`, `SUB`, `AND`, `OR`, `XOR` | two byte operations | 4 | 17 |
| `CMP` | `CP`; `CPC`; `IN SREG`; jump to GPIOR0 commit | 7 after commit/pad | 18 |
| `LD8U` | `MOVW X`; `LD`; clear high | 6 | 18 |
| `ST8` | `MOVW X`; `ST` | 5 | 18 |
| `LD16`, `ST16` | `MOVW X`; two memory operations | 7 | 18 |
| `PUSH16`, `POP16` | two Y-based memory operations | 6 | 18 |

All fit in the four-word primary slot. The low-register PC changes neither dispatch cadence.

### 27.2. Constant-one optimizations

```asm
; INC16
add   dL, r3
adc   dH, r2
rjmp  cluster_tail_17

; DEC16
sub   dL, r3
sbc   dH, r2
rjmp  cluster_tail_17
```

Both are three-word slots and complete on a 17-cycle final cadence.

```asm
; BOOL
or    dL, dH
clr   dH
cpse  dL, r2
mov   dL, r3
rjmp  cluster_c_tail_18
```

The zero and nonzero paths are equal-time. These improvements justify moving `INC16`/`DEC16` from `F6` to `F4` and retaining the compact five-word `BOOL` implementation in `F7`.

`CSET` also uses `MOV dL,r3`, but this merely replaces `INC dL`; it does not reduce the five-word slot.

### 27.3. Constant-four uses

The permanent four is used directly by primary dispatch:

```asm
mul   primary, r7
```

It is also useful when a control path must add four to the 24-bit PC:

```asm
add   r4, r7
adc   r5, r2
adc   r6, r2
```

This is particularly appropriate for the return address of `CALLF target24`.

It does not shorten ordinary shifts, byte swaps, or page indexing. A separate width-four decoder would duplicate more code than it saves.

### 27.4. Flag writers and consumers

```asm
; 16-bit compare slot
cp    lL, rL
cpc   lH, rH
in    flag_tmp, SREG
rjmp  flags_commit_18_delay_1
```

```asm
; Positive CSET
clr   dL
clr   dH
sbic  GPIOR0, flag_bit
mov   dL, r3
rjmp  cluster_c_tail_18
```

Conditional branches use `SBIC`/`SBIS` in the structure shown in this guide. `CMOV` performs one `IN` in its shared gate.

### 27.5. Sequences that do not improve

```asm
; NEG16 uses three operations
neg   dL
adc   dH, r2
neg   dH
```

```asm
; SEXT8 uses three useful operations
clr   dH
sbrc  dL, 7
dec   dH
```

The sequences shown in the page definitions illustrate efficient implementations of `BSWAP16`, widening 8-bit multiplies, variable shifts, fast compact-pointer loads/stores, `ADD32`, `SUB32`, and the one-bit 32-bit shifts. Noncompact pointers can use the separately specified `F0` subsystem.

### 27.6. Fixed-width family latencies

| Page/family | Complete cycles |
|---|---:|
| `F1` all slots | 37 |
| `F2` all slots | 38 |
| `F3` all slots | 38 |
| `F4` all slots | 38 |
| `F5 LD8U` | 38 |
| `F5 CMP`, `LD16`, `ST16` | 39 |
| `F6 TST16` | 39 |
| Other `F6` slots | 38 |
| `F7 LD8U+` | 39 |
| `F7 LD16+`, `ST16+` | 40 |
| Other `F7` slots | 38 |
| `F8` all slots | 38 |
| `F9 AND` / `OR` / `XOR` | 52 / 53 / 54 |
| `FB-FD` condition false / true | 36 / 37 |
| `FE MUL16` | 46 |

Sections 9 and 19 give the cycle targets used when sizing and arranging the reference `F0` and `FA` handlers.

---

## 28. Aliasing rules

- Ordinary fast loads capture compact `cA` in native `X`, so `rD == cA` is valid.
- Fast postincrement stores capture the original compact pointer before updating it, so `cA == rS` is valid.
- Fast postincrement loads reserve `rD == cA`, because one register cannot receive both the loaded value and updated pointer.
- Cold ordinary loads capture the selected pointer value before writing the destination, so `rD == rA` is valid.
- Cold stores capture the complete source before reading or updating the pointer, so `rS == rA` is valid.
- Cold postincrement loads reserve `rD == rA`, matching the fast forms.
- Cold `LD32` and `ST32` capture the selected address register into native `Z` before touching the selected `q` pair, so pair/address overlap is legal.
- Cold `CMP32` allows `qL == qR`; it captures the entire left operand before reusing native `XL` as comparison scratch.
- `F9` bitwise operations allow every `rD,rS` combination, including `rD == rS`, because both original operands are loaded before writeback.
- `MUL16` permits every `rD,rS` combination, including equality.
- Every cold-memory `RRSPEC` bit pattern selects valid registers and modifiers. Reserved postincrement-load alias combinations are rejected by the assembler and backend.

## 29. Bounded-table footprint

| Page | Entries | Words/entry | Exact bytes | Full 256-entry bytes | Unused-tail reduction |
|---:|---:|---:|---:|---:|---:|
| `F0` | 110 | 1 | 220 | 512 | 292 |
| `F1` | 144 | 2 | 576 | 1024 | 448 |
| `F2` | 96 | 3 | 576 | 1536 | 960 |
| `F3` | 128 | 3 | 768 | 1536 | 768 |
| `F4` | 184 | 3 | 1104 | 1536 | 432 |
| `F5` | 96 | 4 | 768 | 2048 | 1280 |
| `F6` | 80 | 4 | 640 | 2048 | 1408 |
| `F7` | 144 | 5 | 1440 | 2560 | 1120 |
| `F8` | 48 | 5 | 480 | 2560 | 2080 |
| `FA` register table | 48 | 2 | 192 | 1024 | 832 |
| `FB-FD` shared table | 64 | 2 | 256 | 1024 | 768 |
| `FE` | 64 | 2 | 256 | 1024 | 768 |

The compact-pointer dense tables contain only fast forms. The two table-free cold-memory secondaries provide complete register coverage through one 49-word shared handler.

## 30. Control-flow primaries

| Opcode | Instruction | Bytes | Reference cycles |
|---:|---|---:|---:|
| `D0` | `BREQ8 rel8` | 2 | 35 not taken; 127 taken |
| `D1` | `BRNE8 rel8` | 2 | 35 not taken; 127 taken |
| `D2` | `BRULT8 rel8` | 2 | 35 not taken; 127 taken |
| `D3` | `BRSLT8 rel8` | 2 | 35 not taken; 127 taken |
| `D4` | `JMP8 rel8` | 2 | 121 |
| `D5` | `CALL8 rel8` | 2 | 127 |
| `D6` | `ADJSP simm8` | 2 | 35 |
| `D7` | `SYS service8` | 2 | 31 (`DEBUG_PUTC`), 31 (`DEBUG_BREAK`), 34 (`MILLIS`), 38 (`MILLIS32`) |
| `D8` | `BRUGE8 rel8` | 2 | 35 not taken; 127 taken |
| `D9` | `BRSGE8 rel8` | 2 | 35 not taken; 127 taken |
| `DA` | `BREQ16 rel16` | 3 | 51 not taken; 134 taken |
| `DB` | `BRNE16 rel16` | 3 | 51 not taken; 134 taken |
| `DC` | `BRULT16 rel16` | 3 | 51 not taken; 134 taken |
| `DD` | `BRUGE16 rel16` | 3 | 51 not taken; 134 taken |
| `DE` | `BRSLT16 rel16` | 3 | 51 not taken; 134 taken |
| `DF` | `BRSGE16 rel16` | 3 | 51 not taken; 134 taken |
| `E0` | `JMP16 rel16` | 3 | 134 |
| `E1` | `CALL16 rel16` | 3 | 134 |
| `E2` | `JMPF target24` | 4 | 149 |
| `E3` | `CALLF target24` | 4 | 149 |
| `E4-E7` | `JMPP qN` | 1 | 109 |
| `E8-EB` | `CALLP qN` | 1 | 116 |
| `EF` | `RET` | 1 | 109 |

All relative displacements are signed and relative to the address immediately following the complete instruction. The `rel8` branch forms use a signed 8-bit displacement; the corresponding `*16` forms use a signed 16-bit displacement. `JMP16` and `CALL16` retain the active code bank and use their signed 16-bit displacement to select the target within that bank. `JMPF` and `CALLF` carry an explicit 24-bit target and are separate opcodes.

The six conditions are available in both displacement widths:

```text
BREQ8 / BREQ16     Z == 1
BRNE8 / BRNE16     Z == 0
BRULT8 / BRULT16   C == 1
BRUGE8 / BRUGE16   C == 0
BRSLT8 / BRSLT16   S == 1
BRSGE8 / BRSGE16   S == 0
```

The short forms use six specialized `SBIC`/`SBIS GPIOR0,bit` decode paths. The 16-bit forms share one flag-mask decoder: each primary slot preloads the selected mask, opcode bit 0 selects inversion, and the condition is resolved while the high displacement byte transfers. The shared 16-bit branch subsystem occupies **25 AVR words / 50 bytes** outside the fixed primary table.

For the reference schedule, a not-taken 16-bit branch launches the fallthrough opcode at the second cycle-17 boundary and completes in 51 cycles. A taken branch reuses the `JMP16` signed-displacement suffix and therefore has the same 134-cycle latency as `JMP16`. LLVM should still choose fallthrough layout based on expected path frequency. `CALLF` uses native `r7` to add four to the low-register 24-bit PC when forming its return address.


## 31. LLVM lowering notes

### Register classes

```text
GPR16          r0-r7
CompactGPR16   r4-r7
DataPointer16  preferred c0-c3, fallback r0-r7
PAIR32         q0-q3
CompactPAIR32  q2-q3
```

`DataPointer16` is a constrained allocation class for fast memory operations, not a semantic restriction on C pointers.

### Compression

One semantic instruction may have a one-byte compact form and a two-byte full-register form:

```text
ADD r4,r6 -> 1-byte primary
ADD r1,r6 -> F2 secondary

AND r4,r6 -> 1-byte primary
AND r1,r6 -> F9 runtime-decoded secondary
```

Memory selection has three tiers:

```text
compact pointer + compact data      one-byte primary
compact pointer + noncompact data   dense F3/F5/F6/F7 form
noncompact pointer                  cold F0 + RRSPEC form
```

### Pointer allocation policy

Prioritize compact registers for:

1. hot data-space pointers;
2. loop induction pointers;
3. pointers used by postincrement forms;
4. byte and word values participating in one-byte operations.

A pointer live across a call may be spilled, recomputed, or retained in a noncompact register. The cold fallback prevents forced copy-in/copy-out around every access.

For a noncompact pointer used once, LLVM should compare:

```text
cold ordinary access                  69-71 cycles
MOV to compact + fast access          about 53-70 cycles
```

For postincrement, the cold form is usually preferred:

```text
cold postincrement access             75-78 cycles
MOV in + fast access + MOV back       roughly 105-110 cycles
```

Live-range splitting may make the compact form cheaper when several accesses share one copied pointer.

### Full-register bitwise lowering

```text
F9 dddsssoo
```

is used only when the result must remain in a noncompact register or when moving through a compact temporary would be slower.

Canonical costs:

```text
AND rD,rS  52 cycles
OR  rD,rS  53 cycles
XOR rD,rS  54 cycles
```

Compact/compact `F9` encodings are legal but noncanonical.

### Stack layout

Place frequently accessed fixed objects first:

```text
offset 0-15 byte stores       F1 STSP8
offset 0-15 unsigned loads    F3 LDSP8U
offset 0-15 word loads/stores F4 LDSP16/STSP16
larger or signed accesses     F0 long forms
```

### Thirty-two-bit values

Use pair operations where they reduce several 16-bit instructions. `CMP32`, `LD32`, and `ST32` are three-byte cold `F0` forms with approximate latencies of 81, 80, and 79 cycles. Their timings are independent of the cold pointer subsystem because the general-pointer fallback uses a separate landing and decoder.

```text
MOV32      -> 2x MOV16
AND32      -> 2x compact or F9 AND16
OR32       -> 2x compact or F9 OR16
XOR32      -> 2x compact or F9 XOR16
LSL32.1    -> ADD32 qD,qD
```

### Variable shifts

Use `SHL16V`, `LSR16V`, and `ASR16V` for genuinely variable compact-register shifts. Use `LSL16I`, `LSR16I`, and `ASR16I` for compile-time counts in `0-15`; repeated `.1` forms remain useful when they combine better with nearby operations.

### Conditional selection

Lower register-valued `select` operations to `CMOV` when avoiding a taken branch is profitable. `ULE` and `UGT` use swapped compare operands followed by `UGE` or `ULT`.

### Sixteen-bit multiplication

Use `MUL16 rD,rS` for a general non-widening product and model the destination as tied to the first input. Continue to select shifts and adds for profitable constants and widening 8-bit forms when range analysis permits.

## 32. Code-size accounting scope

Included in the reference interpreter-core size estimate:

- the 256-entry primary dispatch area;
- shared sequential dispatch and cadence tails;
- all primary handlers and continuations;
- every `F0-FE` decoder, table, forwarding page, shared body, and local trap shim;
- branch, jump, call, return, and stream-restart helpers;
- reserved-instruction traps;
- the `SYS` opcode decoder and bridge entry/exit.

Excluded from the reference interpreter-core size estimate:

- startup and vectors;
- interrupt handlers;
- hardware initialization and service bodies;
- save-flash routines;
- debugger implementation beyond trap entry;
- the C runtime and compiler helper functions.

---

## 33. Exact executable-table size

```text
primary table                    2,048 bytes
F0 veneer table                    220
F1 table                           576
F2 table                           576
F3 table                           768
F4 table                         1,104
F5 table                           768
F6 table                           640
F7 table                         1,440
F8 table                           480
FA immediate jump table              26
FA register forwarding table         192
shared FB-FD move table             256
FE forwarding table                256
                                  ------
all executable tables            9,350 bytes
```

The secondary executable tables total **7,302 bytes**. `F9` has no executable table. Runtime-decoded `F0` subsystems are accounted for separately.

## 34. Reference core-size estimate

### 34.1. Reference baseline and variable components

For the shown layout, the core with the `FA` bodies and all other implemented pages present, but excluding the ordinary `F0` bodies and the two shared `F0` runtime-decoded subsystems, occupies **11,440 bytes**. The remaining components are estimated as follows:

| Component | Reference bytes | Estimated range |
|---|---:|---:|
| `F0` immediate, stack, absolute, and program-space bodies | 1,504 | 1,408-1,664 |
| Shared `F0` cold-32 subsystem | 128 | exact |
| Shared `F0` cold general-pointer subsystem | 98 | exact |

### 34.2. Reference completed-core estimate

| Case | Bytes | KiB |
|---|---:|---:|
| Lower bound | 13,074 | 12.77 |
| Reference target | **13,170** | **12.86** |
| Upper bound | 13,330 | 13.02 |

The reference design targets about 13,170 bytes, with 13,330 bytes as a practical upper estimate before the physical layout and short-transfer ranges should be revisited.

## 35. Four-word primary-stride rationale

A four-word primary slot keeps the primary table at 2,048 bytes while allowing:

- complete one-byte handlers that end in `RJMP`;
- up to three setup words followed by one forwarding `RJMP`;
- one fixed dispatch multiplier, `r7 = 4`, measured in AVR words.

An eight-word primary table would consume another 2,048 bytes. The reference `C0-CF` continuation and apply-stub block occupies 182 bytes. Even conservatively charging that entire block against the four-word design, the net code-size advantage is at least:

```text
2,048 - 182 = 1,866 bytes
```

The four-word design preserves direct `RJMP` reach to nearby continuations and keeps the dispatch calculation to one native `MUL`.

## 36. Size-estimate uncertainty

In this estimate, the completed-core range varies mainly with the ordinary `F0` bodies. The cold-32, cold-pointer, and `FA` shared-body sizes are fixed for the shown implementation sequences.

If the ordinary `F0` bodies change substantially, it is prudent to retain the one-word veneer organization and recheck static-transfer reach, particularly for backward edges into Clusters A and C.

## 37. Suggested validation checklist

A thorough implementation should:

1. verify the cadence of every `F0` veneer body, including program-space stream interruption and restart;
2. verify identical count-dependent timing for `FA` immediate and register-count paths across all twelve shared bodies;
3. assemble and link with GNU AVR with no truncated `RJMP`, `RCALL`, or relocation;
4. assert every primary slot width, secondary slot width, table bound, table size, and fixed block size;
5. exhaustively test condition flags, invalid encodings, memory aliasing, postincrement reservations, and call/return stack behavior;
6. test every jump, call, and return across low-, middle-, and high-byte PC carry and wrap boundaries;
7. validate `F9` and `MUL16` for every operand alias class;
8. compile representative programs and compare observed latency and flash use with the reference figures in this guide.

## 38. Suggested validation sequence

1. Assemble and link the complete interpreter with GNU AVR.
2. Verify all compile-time size assertions and static-transfer ranges.
3. Run exhaustive per-encoding tests, including invalid and reserved encodings.
4. Run targeted 24-bit PC and stack tests for every control-flow form.
5. Run operand-alias and boundary-value tests for every memory, arithmetic, and multiplication family.
6. Compile a representative Arduboy corpus and compare code size and instruction timing with the reference design.

