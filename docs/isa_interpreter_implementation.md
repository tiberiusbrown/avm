# AVM ISA Opcode Map and AVR Interpreter Implementation Guide

**Status:** ISA architecture and opcode-map specification with AVR implementation design notes
**Target host:** ATmega32U4 Arduboy FX interpreter
**Priority:** Performance of generated code
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
8. Hot dense instructions do not perform run-time architectural-register decoding; the dedicated `EC` divider, explicitly cold `F0` forms, and the table-free `F9` and `FF` pages may do so.
9. Additional encoded bytes normally contain actual immediates, displacements, or addresses.
10. The reference interpreter uses a fixed four-word, eight-byte primary dispatch stride. A primary slot either executes a complete short handler ending in `RJMP` to a shared cadence tail, or performs up to three words of setup and uses its fourth word to forward to an out-of-line continuation.
11. For the size comparisons in this guide, the accounting region begins at the primary table. The primary table is aligned to 256 AVR words (512 bytes); no alignment padding before it is included in the accounted size. The reference layout emits the following code in one text section without interior power-of-two alignment gaps.

Unless otherwise noted, the cycle figures for the reference interpreter are measured from entry to one primary handler through entry to the next primary handler.
Where an exact value is listed, it reflects the current interpreter benchmark; approximate values are retained only for designs not yet represented by a measured implementation.


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

Registers `r4-r7` are called the **upper registers**. They are ordinary
architectural registers, but many short instruction encodings are restricted
to this subset. All eight registers remain semantically interchangeable.

### 2.2. Aligned pair registers

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

The first register contains bits `15:0`; the second contains bits `31:16`.

A canonical 24-bit program pointer uses the low register for bits `15:0`, the low byte of the high register for bits `23:16`, and zero in the remaining byte.

### 2.3. Native AVR register allocation

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
2. Native `r0:r1` are unrestricted scratch; this assembly-only interpreter has no permanent zero-register requirement for `r1`.
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

The landing pad performs the additional `OUT GPIOR0,flag_tmp` and uses the selected cadence delay. This keeps the one-byte `CMP` inside its four-word primary slot and keeps every fixed-width secondary slot unchanged.

Compared with storing flags in a GPR, writers gain one native cycle for the `OUT`. One-byte and ordinary 16-bit flag writers fit within an 18-cycle final cadence. Cold `CMP32` commits `GPIOR0` inline after its runtime-decoded comparison and has an approximately 81-cycle complete instruction latency.

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

Other 32-bit operations use these forms:

```text
32-bit copy       MOV32; upper-pair copies expand to 2x one-byte MOV
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

The four 8-bit multiplication forms require upper registers, which map to AVR `r16-r23` and permit direct use of `MUL`, `MULS`, and `MULSU`. `MUL16` accepts all eight registers and returns the product modulo `2^16`; signed and unsigned multiplication have identical low sixteen bits, so no signedness variants are needed. Widening 16-bit multiplication and wider products use external helpers or synthesized instruction sequences.

The 16-bit division and remainder forms are:

```text
UDIV16   unsigned quotient
UREM16   unsigned remainder
SDIV16   signed quotient, truncated toward zero
SREM16   signed remainder with the dividend's sign
```

All four accept every architectural register and preserve the source operand when distinct from the destination. Primary opcode `EC` uses two table-free, two-way-unrolled restoring cores: a dedicated eight-bit-magnitude core and a general sixteen-bit core. The interpreter recognizes eight-bit magnitudes and executes the shorter core. Wider division uses external helpers.

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
| Taken conditional branch | 128 |
| Relative jump/call | 122 / 128 |
| Near relative jump/call | 135 / 135 |
| Far jump/call | 150 / 150 |
| Indirect jump/call | 110 / 117 |
| Return | 110 |
| Program-space load | 290-357 |


### 5.3. Cycle-9 reference dispatch schedule and family latencies

In the reference schedule, both standard and reverse dispatch begin executing the selected primary slot on cycle 9 after the dispatch `OUT`. The standard form moves `ADD VM_PCL,ONE` before `IN`; the reverse form completes the full 24-bit PC increment before `CLI`. The four handoff instructions preserve carry; this schedule assumes interrupt handlers restore the interrupted `SREG`.

The reference continuations and secondary decoders are scheduled from this cycle-9 entry point:

- direct `00-BF` handlers retain the 17- and 18-cycle cadence limits from Section 5.2;
- one-byte immediate slots execute their cycle-9 padding word before forwarding;
- two-byte primary continuations place their operand handoff on the earliest legal cycle-17 reverse or cycle-18 standard boundary;
- the generic bounded decoder uses the standard `IN; OUT` handoff, while the shared width-two decoder uses the exact cycle-17 reverse handoff;
- `EC` and `F9` perform useful pointer-high initialization before their reverse handoffs;
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
| `EC` 16-bit division/remainder | 56-265, data-dependent |
| `F9 AND` / `OR` / `XOR` | 52 / 53 / 54 |
| `FB-FD` false / true | 36 / 37 |
| `FE MUL16` | 46 |
| `FF` floating-point page | operation- and helper-dependent |

---

## 6. Primary opcode map

| Primary range | Family | Bytes | Typical cycles |
|---|---|---:|---:|
| `00-0F` | `MOV rD,rS` | 1 | 17 |
| `10-1F` | `ADD rD,rS` | 1 | 17 |
| `20-2F` | `SUB rD,rS` | 1 | 17 |
| `30-3F` | `CMP rL,rR` | 1 | 18 |
| `40-4F` | `LD8U rD,[rA]` | 1 | 18 |
| `50-5F` | `ST8 [rA],rS` | 1 | 18 |
| `60-6F` | `LD16 rD,[rA]` | 1 | 18 |
| `70-7F` | `ST16 [rA],rS` | 1 | 18 |
| `80-8F` | `AND rD,rS` | 1 | 17 |
| `90-9F` | `OR rD,rS` | 1 | 17 |
| `A0-AF` | `XOR rD,rS` | 1 | 17 |
| `B0-B7` | `PUSH16 rN` | 1 | 18 |
| `B8-BF` | `POP16 rN` | 1 | 18 |
| `C0-C3` | `LDI8 rD,imm8` | 2 | 35 |
| `C4-C7` | `LDI16 rD,imm16` | 3 | 52 |
| `C8-CB` | `ADDI.S8 rD,simm8` | 2 | 35 |
| `CC-CF` | `CMPI.S8 rL,simm8` | 2 | 35 |
| `D0` | `BREQ8 rel8` | 2 | 35 not taken; 128 taken |
| `D1` | `BRNE8 rel8` | 2 | 35 not taken; 128 taken |
| `D2` | `BRULT8 rel8` | 2 | 35 not taken; 128 taken |
| `D3` | `BRSLT8 rel8` | 2 | 35 not taken; 128 taken |
| `D4` | `JMP8 rel8` | 2 | 122 |
| `D5` | `CALL8 rel8` | 2 | 128 |
| `D6` | `ADJSP simm8` | 2 | 35 |
| `D7` | `SYS service8` | 2 | 34 / 34 / 36 / 40 for services `00-03` |
| `D8` | `BRUGE8 rel8` | 2 | 35 not taken; 128 taken |
| `D9` | `BRSGE8 rel8` | 2 | 35 not taken; 128 taken |
| `DA` | `BREQ16 rel16` | 3 | 51 not taken; 135 taken |
| `DB` | `BRNE16 rel16` | 3 | 51 not taken; 135 taken |
| `DC` | `BRULT16 rel16` | 3 | 51 not taken; 135 taken |
| `DD` | `BRUGE16 rel16` | 3 | 51 not taken; 135 taken |
| `DE` | `BRSLT16 rel16` | 3 | 51 not taken; 135 taken |
| `DF` | `BRSGE16 rel16` | 3 | 51 not taken; 135 taken |
| `E0` | `JMP16 rel16` | 3 | 135 |
| `E1` | `CALL16 rel16` | 3 | 135 |
| `E2` | `JMPF target24` | 4 | 150 |
| `E3` | `CALLF target24` | 4 | 150 |
| `E4-E7` | `JMPP qN` | 1 | 110 |
| `E8-EB` | `CALLP qN` | 1 | 117 |
| `EC` | `UDIV16` / `UREM16` / `SDIV16` / `SREM16` runtime-decoded page | 2 | 56-265, data-dependent |
| `ED-EE` | Reserved | — | trap |
| `EF` | `RET` | 1 | 110 |
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
| `FA` | Upper-register immediate/register-count 16-bit shift page | 2 | count-dependent; 42-80 |
| `FB` | `CMOV.EQ` / `CMOV.NE` condition-family prefix | 2 | 36 false; 37 true |
| `FC` | `CMOV.ULT` / `CMOV.UGE` condition-family prefix | 2 | 36 false; 37 true |
| `FD` | `CMOV.SLT` / `CMOV.SGE` condition-family prefix | 2 | 36 false; 37 true |
| `FE` | Bounded 2-word `MUL16` forwarding page | 2 | 46 |
| `FF` | Dedicated floating-point page | 2-3 | operation- and helper-dependent |

All sixteen secondary-page prefixes occupy `F0-FF`. `F0-F8` and `FE` use bounded-page machinery; `F9`, `FA`, and `FF` use dedicated runtime decoders; `FB-FD` use the shared condition gate. Their decoder entries and gates are emitted immediately after the primary table, while executable tables and shared bodies are ordered later according to the single-section layout in Section 26.

The other primary ranges provide push/pop, immediate, branch, control-flow, and reserved encodings while keeping all secondary prefixes contiguous.

## 7. One-byte upper-register matrices

For `00-AF`, every architectural operand is restricted to `r4-r7`:

```text
bits 3:2  destination / address / left register
bits 1:0  source / address / right register
```

| Range | Instruction | Intended native work |
|---|---|---|
| `00-0F` | `MOV rD,rS` | `MOVW dL,srcL` |
| `10-1F` | `ADD rD,rS` | `ADD dL,srcL`; `ADC dH,srcH` |
| `20-2F` | `SUB rD,rS` | `SUB dL,srcL`; `SBC dH,srcH` |
| `30-3F` | `CMP rL,rR` | `CP`; `CPC`; save `SREG` |
| `40-4F` | `LD8U rD,[rA]` | `MOVW X,aL`; `LD dL,X`; `CLR dH` |
| `50-5F` | `ST8 [rA],rS` | `MOVW X,aL`; `ST X,srcL` |
| `60-6F` | `LD16 rD,[rA]` | `MOVW X,aL`; two `LD` |
| `70-7F` | `ST16 [rA],rS` | `MOVW X,aL`; two `ST` |
| `80-8F` | `AND rD,rS` | two `AND` |
| `90-9F` | `OR rD,rS` | two `OR` |
| `A0-AF` | `XOR rD,rS` | two `EOR` |

Aliases:

```text
CLR rN = XOR rN,rN
NOP    = MOV r4,r4
```

---

# Part I-A — Exact-Width Dense Secondary Tables

## 8. Sequence notation

Each sequence below is one final operand-specialized slot.

```text
dL,dH       low/high bytes of a 16-bit destination
srcL,srcH   low/high bytes of a 16-bit source
aL          low native AVR register of an upper-register 16-bit address pair
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

### 8.1. Upper-register indexing for ordinary full-register binary families

A full-register binary family omits the sixteen combinations in which both architectural operands are upper registers, because those combinations have one-byte primary encodings. The remaining 48 combinations are numbered contiguously:

```text
00-1F  first operand r0-r3, second operand r0-r7
20-2F  first operand r4-r7, second operand r0-r3
```

This indexing applies to `MOV16`, `ADD`, `SUB`, and `CMP`. Full-register bitwise operations use the dedicated runtime-decoded `F9` family.

### 8.2. Fast upper-register-pointer memory indexing

All operand-specialized data-space memory instructions require pointer `rA` to be in `r4-r7`.

For ordinary loads and stores, combinations with both pointer and data in upper registers already have one-byte primary encodings. The dense secondary family therefore contains only:

```text
4 upper-register pointers × 4 lower data registers = 16 entries
```

The entry index is:

```text
(pointer_index << 2) | (data_register_index - 4)
```

For postincrement forms there is no one-byte equivalent, so every data register is represented:

```text
4 upper-register pointers × 8 data registers = 32 entries
```

The entry index is:

```text
(pointer_index << 3) | data_register_index
```

The generic assembly syntax is:

```text
LD8U rD,[rA]
LD16 rD,[rA]
ST8  [rA],rS
ST16 [rA],rS

LD8U rD,[rA+]
LD16 rD,[rA+]
ST8  [rA+],rS
ST16 [rA+],rS
```

In these forms, `rA` is restricted to the upper registers `r4-r7`.

When the pointer is in a lower register, the three-byte `F0` cold fallback forms avoid mandatory copy-in/copy-out sequences.

## 9. `F0`: bounded 1-word cold-form veneer table

Bounds: `secondary < 0x6E`.

Every dense entry is exactly one word:

```asm
rjmp  operation_specific_body
```

The out-of-line bodies fetch remaining immediate, displacement, address, or operand bytes. They are not constrained to the one-word veneer width.

The immediate families contain only `r0-r3`; the equivalent forms for `r4-r7` use the primary opcodes at `C0-CF`.

### 9.1. Immediate and stack-relative forms

| Secondary | Instruction | Total bytes | Cycles |
|---|---|---:|---:|
| `00-03` | `LDI8 r0-r3,imm8` | 3 | 53 |
| `04-07` | `LDI16 r0-r3,imm16` | 4 | 71 |
| `08-0B` | `ADDI.S8 r0-r3,simm8` | 3 | 54 |
| `0C-0F` | `CMPI.S8 r0-r3,simm8` | 3 | 55 |
| `10-17` | `LEASP rN,u8` | 3 | 60 |
| `18-1F` | `LDSP8U rN,[SP+u8]` | 3 | 62 |
| `20-27` | `LDSP8S rN,[SP+u8]` | 3 | 64 |
| `28-2F` | `STSP8 [SP+u8],rN` | 3 | 60 |
| `30-37` | `LDSP16 rN,[SP+u8]` | 3 | 64 |
| `38-3F` | `STSP16 [SP+u8],rN` | 3 | 64 |

The cold stack-relative values include the shared operand fetch, dynamic register decode, and `SP+u8` address construction; these costs are exposed rather than hidden by the encoded-byte transfer windows.

### 9.2. Absolute data-space forms

| Secondary | Instruction | Total bytes | Cycles |
|---|---|---:|---:|
| `40-47` | `LDM8U rN,addr16` | 4 | 72 |
| `48-4F` | `STM8 addr16,rN` | 4 | 72 |
| `50-57` | `LDM16 rN,addr16` | 4 | 72 |
| `58-5F` | `STM16 addr16,rN` | 4 | 72 |

### 9.3. Program-space forms

| Secondary | Instruction | Total bytes | Cycles |
|---:|---|---:|---:|
| `60` | `LDP8U rD,[qA]` | 3 | 290 |
| `61` | `LDP8S rD,[qA]` | 3 | 292 |
| `62` | `LDP16 rD,[qA]` | 3 | 306 |
| `63` | `LDP24 qD,[qA]` | 3 | 326 |
| `64` | `LDP32 qD,[qA]` | 3 | 340 |
| `65` | `LDP8U rD,[qA+]` | 3 | 307 |
| `66` | `LDP16 rD,[qA+]` | 3 | 323 |
| `67` | `LDP24 qD,[qA+]` | 3 | 343 |
| `68` | `LDP32 qD,[qA+]` | 3 | 357 |

`LDP24` loads three packed little-endian bytes into bits `23:0` of `qD` and clears bits `31:24`, producing a canonical 24-bit program pointer. The postincrement form advances `qA` by three bytes after capturing the original address. `LDP24 qD,[qA+]` reserves `qD == qA`, because one pair cannot simultaneously receive the loaded pointer and the updated source address. Each postincrement form measures exactly 17 cycles more than its corresponding ordinary load because validation and pointer writeback add one minimum SPI interval to the complete path.

### 9.4. Shared cold 32-bit forms

The 32-bit cold operations are encoded as three-byte `F0` instructions:

| Secondary | Instruction | Total bytes | Measured cycles |
|---:|---|---:|---:|
| `69` | `CMP32 qL,qR` followed by `RRSPEC` | 3 | 83 |
| `6A` | `LD32 qD,[rA]` followed by `RRSPEC` | 3 | 82 |
| `6B` | `ST32 [rA],qS` followed by `RRSPEC` | 3 | 81 |

`BOOL rD` is encoded in `F7`, where its fixed-width upper-register implementation avoids runtime register decoding.

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

The store encoding deliberately places the 32-bit data operand in the high nibble, even though assembly syntax writes the address first. This lets all three operations decode the high nibble into `X` as the 32-bit pair and the low nibble into `Z` as the comparison/address operand.

Canonical encodings are validated at runtime:

- The high operand must be aligned to a `q` pair.
- The low operand must be aligned to at least an `r` register.
- `CMP32` additionally requires the low operand to be aligned to a `q` pair.

Malformed specifiers branch to the shared invalid-instruction trap before any register-file access outside native `r8-r23` can occur.

#### 9.4.2. Exact `RRSPEC` handoff and operation normalization

All three one-word veneers jump to the same entry. The generic width-one `F0` decoder launches the `RRSPEC` transfer nine cycles after entry to the `F0` primary slot and reaches the selected veneer body on cycle 23. One cadence slot remains before the exact reverse handoff, so the implementation uses it to normalize secondary values `69-6B` into operation indices `0-2`:

```asm
f0_cold32_delay_1:
    subi  secondary, 0x69       ; 0=CMP32, 1=LD32, 2=ST32
f0_cold32:
    add   r4, r3                ; consume RRSPEC in the VM PC
    cli
    out   SPDR, r2              ; cycle 26: following-primary transfer
    in    spec, SPDR            ; read completed RRSPEC
    sei
    adc   r5, r2
    adc   r6, r2
```

The new `OUT` occurs exactly seventeen cycles after the decoder launched `RRSPEC`. The normalization instruction replaces otherwise idle cadence padding and makes the current subsystem one word smaller than the older three-cycle-landing design.

#### 9.4.3. Validation and common pointer decode

```asm
    ; High operand must be q-aligned; low operand must be r-aligned.
    mov   XL, spec
    andi  XL, 0x31
    brne  f0_cold32_invalid

    ; X = native register-file pointer for the high operand.
    mov   XL, spec
    swap  XL
    andi  XL, 0x0f
    subi  XL, -8
    mov   XH, r2

    ; Z = native register-file pointer for the low operand.
    mov   ZL, spec
    andi  ZL, 0x0f
    subi  ZL, -8
    mov   ZH, r2

    tst   secondary             ; operation index zero is CMP32
    breq  f0_cmp32
```

Validation occupies three words and the two pointer decoders occupy nine words. Because `RRSPEC` is unavailable until the third encoded byte arrives, these cycles are exposed.

#### 9.4.4. Shared memory-address capture

For both memory operations, `Z` initially points to the selected 16-bit address register. The implementation captures the complete effective address before touching a potentially overlapping pair operand:

```asm
    ld    r0, Z+
    ld    r1, Z
    movw  Z, r0

    cpi   secondary, 1          ; operation index one is LD32
    breq  f0_ld32
```

This guarantees that `LD32 qD,[rA]` and `ST32 [rA],qS` permit pair/address-register overlap.

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

Measured complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
47  following-primary OUT-to-OUT execution interval
--
81 cycles
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

Measured complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
48  following-primary OUT-to-OUT execution interval
--
82 cycles
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

After all four left bytes are loaded, native `r26` may safely replace `XL` as right-byte scratch. Native `r1` has no permanent zero-register requirement.

Measured complete latency:

```text
17  prefix-to-secondary interval
17  secondary-to-RRSPEC interval
49  following-primary OUT-to-OUT execution interval
--
83 cycles
```

#### 9.4.8. Invalid-specifier shim and exact code size

```asm
f0_cold32_invalid:
    rjmp  invalid_secondary_instruction_func
```

The current common subsystem is exactly:

| Component | Words | Bytes |
|---|---:|---:|
| One-cycle normalization, `RRSPEC` consume, and stream restart | 8 | 16 |
| Common validation | 3 | 6 |
| Two register-file pointer decoders | 9 | 18 |
| CMP-versus-memory selection | 2 | 4 |
| Shared address capture | 3 | 6 |
| LD-versus-ST selection | 2 | 4 |
| `ST32` transfer body | 9 | 18 |
| `LD32` transfer body | 9 | 18 |
| `CMP32` extra validation and body | 17 | 34 |
| Local invalid-specifier shim | 1 | 2 |
| **Shared cold-32 subsystem** | **63** | **126** |

The three one-word `F0` veneers occupy six bytes in the executable table but replace trap entries, so implementing the family does not enlarge the fixed veneer table.


### 9.5. Shared cold general-pointer data-space forms

Fast dense memory instructions require pointers in upper registers. Two three-byte fallback forms allow any architectural register to serve as the pointer:

| Secondary | Encoding | Operation | Total bytes | Measured cycles |
|---:|---|---|---:|---:|
| `6C` | `dddWaaaP` | Load | 3 | 70-77 |
| `6D` | `dddWaaaP` | Store | 3 | 68-74 |

```text
bits 7:5  ddd  data register rD/rS
bit  4    W    width: 0=byte, 1=word
bits 3:1  aaa  pointer register rA
bit  0    P    pointer update: 0=ordinary, 1=postincrement
```

The two secondary opcodes distinguish load from store. `W` and `P` are carried in the trailing specifier, so every one of its 256 bit patterns selects valid architectural registers and a defined width/update combination.

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

#### 9.5.1. Independent exact-cadence landing

The generic width-one decoder reaches the one-word veneer with one cadence slot remaining before the exact reverse handoff. At that point native `r0` still contains the secondary opcode, so the implementation replaces a padding `NOP` with `BST` and preserves load/store selection in native `SREG.T`:

```asm
f0_coldmem_delay_1:
    bst   r0, 0                 ; T=0 for load, T=1 for store
f0_coldmem:
    add   r4, r3
    cli
    out   SPDR, r2
    in    spec, SPDR
    sei
    adc   r5, r2
    adc   r6, r2
```

The `OUT` starts speculative fetch of the following primary exactly seventeen cycles after the trailing specifier transfer began. `BST` consumes an otherwise idle cadence cycle and does not change architectural condition state, which is stored in `GPIOR0`.

#### 9.5.2. Register-file pointer decode and operation selection

`ddd` and `aaa` are already positioned as doubled register indices. No parity or range validation is required:

```asm
    ; X = register-file pointer for rD/rS.
    mov   XL, spec
    swap  XL
    andi  XL, 0x0e
    subi  XL, -8
    mov   XH, r2

    ; Z = register-file pointer for rA.
    mov   ZL, spec
    andi  ZL, 0x0e
    subi  ZL, -8
    mov   ZH, r2

    brts  f0_coldmem_store
```

The two pointer decoders occupy nine words. `BRTS` replaces the former two-word `SBRC`/`RJMP` selection and saves one cycle on both families.

#### 9.5.3. Unified load path

The load path advances native `Z` while reading memory. The `P` bit decides whether that local advancement is written back to the architectural pointer:

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
    sbrc  spec, 4
    ld    r25, Z+

    ; Write the selected byte or word result.
    st    X+, r24
    st    X,  r25

    ; P=0 discards native Z advancement. P=1 writes it back to rA.
    sbrs  spec, 0
    rjmp  cluster_a_tail_18
    mov   XL, r0
    ; fall through
```

For `LD8U`, `r25` remains zero. Ordinary loads permit `rD == rA` because the effective address is captured before destination writeback.

#### 9.5.4. Shared postincrement load writeback

```asm
f0_coldmem_post_writeback:
    st    X+, ZL
    st    X,  ZH
    rjmp  cluster_a_tail_18
```

Native `XH` remains zero throughout the load path, so no explicit clear is required.

#### 9.5.5. Direct-X unified store path

The complete source is captured before reading the pointer, preserving every source/pointer overlap case. Both source bytes are always captured; a byte store simply leaves the high byte unused. The effective address is then loaded directly into native `X`, and a postincrement store writes the updated `X` back through `Z`:

```asm
f0_coldmem_store:
    ld    r0, X+
    ld    r25, X

    ; Z addresses architectural rA. Load the effective address into X.
    ld    XL, Z+
    ld    XH, Z

    st    X+, r0
    sbrc  spec, 4
    st    X+, r25

    ; P=0 discards X. P=1 writes updated X back high then low.
    sbrs  spec, 0
    rjmp  cluster_a_tail_18
    st    Z,  XH
    st    -Z, XL
    rjmp  cluster_a_tail_18
```

Loading the effective address directly into `X` removes the old address-copy sequence and avoids an extra jump to the shared load writeback helper.

#### 9.5.6. Exact subsystem size

| Component | Words | Bytes |
|---|---:|---:|
| Cadence-slot classification, specifier consume, and restart | 8 | 16 |
| Two register-file pointer decoders | 9 | 18 |
| Load/store branch | 1 | 2 |
| Unified load path | 13 | 26 |
| Shared postincrement load writeback | 3 | 6 |
| Direct-X unified store path | 12 | 24 |
| **Cold general-pointer subsystem** | **46** | **92** |

The two one-word `F0` veneers occupy four bytes in the fixed executable table but replace trap entries.

#### 9.5.7. Measured latency derivation

All forms pay two seventeen-cycle encoded-byte intervals:

```text
F0 primary -> secondary    17
secondary -> specifier     17
```

The measured final intervals and complete latencies are:

| Operation | Final execution interval | Complete cycles |
|---|---:|---:|
| `LD8U rD,[rA]` | 36 | **70** |
| `LD16 rD,[rA]` | 37 | **71** |
| `ST8 [rA],rS` | 34 | **68** |
| `ST16 [rA],rS` | 35 | **69** |
| `LD8U rD,[rA+]` | 42 | **76** |
| `LD16 rD,[rA+]` | 43 | **77** |
| `ST8 [rA+],rS` | 39 | **73** |
| `ST16 [rA+],rS` | 40 | **74** |

The direct-X store arrangement makes stores faster than corresponding loads and reduces the subsystem by three words relative to the original shared-store design.

## 10. `F1`: bounded 2-word table

Bounds: `secondary < 0x90`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `MOV rD,rS` excluding pairs where both operands are upper registers | 48 | 37 |
| `30-6F` | `STSP8 [SP+u4],rS` | 64 | 37 |
| `70-77` | `ZEXT8 rD` | 8 | 37 |
| `78-7F` | `SWAP8 rD` | 8 | 37 |
| `80-87` | `GETSP rD` | 8 | 37 |
| `88-8F` | `SETSP rS` | 8 | 37 |

```asm
; MOV rD,rS
movw  dL, srcL
rjmp  cluster_a_tail_17_delay_1

; STSP8 [SP+q],rS
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

## 11. `F2`: bounded 3-word arithmetic and `MOV32` table

Bounds: `secondary < 0x6C`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `ADD rD,rS`, excluding upper/upper pairs | 48 | 38 |
| `30-5F` | `SUB rD,rS`, excluding upper/upper pairs | 48 | 38 |
| `60-6B` | `MOV32 qD,qS`, excluding `q2/q3` to `q2/q3` | 12 | 38 |

```asm
; ADD rD,rS
add   dL, srcL
adc   dH, srcH
rjmp  cluster_a_tail_17

; SUB rD,rS
sub   dL, srcL
sbc   dH, srcH
rjmp  cluster_a_tail_17

; MOV32 qD,qS
movw  dstLo, srcLo
movw  dstHi, srcHi
rjmp  cluster_a_tail_17
```

The twelve `MOV32` entries use the contiguous `QPAIR12` order from `arch.md`.
When both operands are `q2` or `q3`, emit two one-byte upper-register `MOV`
instructions instead; they take 34 cycles total. The table contains 108 slots,
occupies 648 bytes, and retains the three-word natural width.

Full-register `AND`, `OR`, and `XOR` use the runtime-decoded `F9` page. Upper-
register operands use their one-byte primary forms.

## 12. `F3`: bounded 3-word memory and widening-multiply table

Bounds: `secondary < 0x80`. The multiply and stack-load operands, and pointer `rA`, are restricted to `r4-r7` where those families require upper registers.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-0F` | `ST8 [rA],rS`, `rS` in `r0-r3` only | 16 | 38 |
| `10-1F` | `MULU8.W rD,rS` | 16 | 38 |
| `20-2F` | `MULS8.W rD,rS` | 16 | 38 |
| `30-3F` | `MULSU8.W rD,rS` | 16 | 38 |
| `40-7F` | `LDSP8U rD,[SP+u4]` | 64 | 38 |

```asm
; ST8 [rA],rS
movw  X, aL
st    X, srcL
rjmp  cluster_a_tail_18_delay_1

; MULU8.W rD,rS
mul   dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; MULS8.W rD,rS
muls  dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; MULSU8.W rD,rS
mulsu dL, srcL
movw  dL, r0
rjmp  cluster_a_tail_18_delay_1

; LDSP8U rD,[SP+q]
ldd   dL, Y+q
clr   dH
rjmp  cluster_a_tail_18_delay_1
```

Stores with an upper-register source use the one-byte primary family. A pointer in a lower register uses `F0 6D dddWaaaP` with `W=0` and `P=0`.

Native `r0:r1` are interpreter scratch, so multiply slots do not restore a zero register. A 32-bit register copy uses `MOV32`; upper-pair copies expand to two one-byte `MOV` instructions.

## 13. `F4`: bounded 3-word table C

Bounds: `secondary < 0xB8`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-3F` | `LDSP16 rD,[SP+u4]` | 64 | 18 |
| `40-7F` | `STSP16 [SP+u4],rS` | 64 | 18 |
| `80-87` | `LSL16.1 rD` | 8 | 17 |
| `88-8F` | `LSR16.1 rD` | 8 | 17 |
| `90-97` | `ASR16.1 rD` | 8 | 17 |
| `98-9F` | `NOT16 rD` | 8 | 17 |
| `A0-A7` | `TST8 rD` | 8 | 18 |
| `A8-AF` | `INC16 rD` | 8 | 17 |
| `B0-B7` | `DEC16 rD` | 8 | 17 |

```asm
; LDSP16 rD,[SP+q]
ldd   dL, Y+q
ldd   dH, Y+q+1
rjmp  cluster_b_tail_18

; STSP16 [SP+q],rS
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
| `00-2F` | `CMP rL,rR` excluding pairs where both operands are upper registers | 48 | 39 |
| `30-3F` | `LD8U rD,[rA]`, `rD` in `r0-r3` only | 16 | 38 |
| `40-4F` | `LD16 rD,[rA]`, `rD` in `r0-r3` only | 16 | 39 |
| `50-5F` | `ST16 [rA],rS`, `rS` in `r0-r3` only | 16 | 39 |

```asm
; CMP rL,rR
cp    lL, rL
cpc   lH, rH
in    flag_tmp, SREG
rjmp  flags_commit_b_18_delay_1

; LD8U rD,[rA]
movw  X, aL
ld    dL, X
clr   dH
rjmp  cluster_b_tail_18

; LD16 rD,[rA]
movw  X, aL
ld    dL, X+
ld    dH, X
rjmp  cluster_b_tail_18

; ST16 [rA],rS
movw  X, aL
st    X+, srcL
st    X, srcH
rjmp  cluster_b_tail_18
```

Forms with data in upper registers use the one-byte primary families. Pointers in lower registers use `F0 6C` for loads or `F0 6D` for stores, with `W` and `P` supplied by `RRSPEC`.

The address is copied to native `X` before a load overwrites its destination, so ordinary loads permit destination/pointer overlap.

## 15. `F6`: bounded 4-word table B

Bounds: `secondary < 0x50`. Pointer `rA` and the operands of `MUL8` are restricted to `r4-r7`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-1F` | `ST8 [rA+],rS` | 32 | 18 |
| `20-27` | `BSWAP16 rD` | 8 | 18 |
| `28-2F` | `TST16 rD` | 8 | 18 |
| `30-3F` | `MUL8 rD,rS` | 16 | 18 |
| `40-47` | `SEXT8 rD` | 8 | 18 |
| `48-4F` | `NEG16 rD` | 8 | 18 |

```asm
; ST8 [rA+],rS
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

; MUL8 rD,rS
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

A postincrement pointer in a lower register uses `F0 6D dddWaaaP` with `W=0` and `P=1`. The three-operation `NEG16` sequence is smaller and faster than a `COM`/add-one formulation.

## 16. `F7`: bounded 5-word table A

Bounds: `secondary < 0x90`. Pointer `rA` in the postincrement memory families is restricted to `r4-r7`.

| Secondary | Instruction | Entries | Final cadence |
|---|---|---:|---:|
| `00-1F` | `LD8U rD,[rA+]` | 32 | 18 |
| `20-3F` | `LD16 rD,[rA+]` | 32 | 19 |
| `40-5F` | `ST16 [rA+],rS` | 32 | 19 |
| `60-6F` | `ADD32 qD,qS` | 16 | 18 |
| `70-7F` | `SUB32 qD,qS` | 16 | 18 |
| `80-83` | `LSR32.1 qD` | 4 | 18 |
| `84-87` | `ASR32.1 qD` | 4 | 18 |
| `88-8F` | `BOOL rD` | 8 | 18 |

```asm
; LD8U rD,[rA+]
movw  X, aL
ld    dL, X+
movw  aL, X
clr   dH
rjmp  cluster_c_tail_18

; LD16 rD,[rA+]
movw  X, aL
ld    dL, X+
ld    dH, X+
movw  aL, X
rjmp  cluster_c_tail_18

; ST16 [rA+],rS
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

Postincrement pointers in lower registers use `F0 6C` for loads or `F0 6D` for stores with `P=1`.

`CPSE` plus the optional one-word `MOV` takes two cycles on either path. Postincrement loads reserve `rD == rA`. A 32-bit register copy uses two `MOV16` operations, and a one-bit left shift uses `ADD32 qD,qD`.

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

All 64 register combinations are representable for each valid operation. Combinations where both operands are upper registers are legal duplicate encodings, but assemblers should use the one-byte `80-AF` upper-register forms.

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

These totals are measured from entry to the `F9` primary slot through entry to the following primary slot. Upper-register bitwise operations remain one-byte, 17-cycle instructions.

### 18.7. Size summary

The dedicated `F9` handler occupies 39 AVR words / 78 bytes. It requires no secondary executable table, page stub, bounds check, or additional cadence cluster.

---

## 19. `FA`: upper-register immediate and register-count 16-bit shifts

All scalar operands in this page are restricted to `r4-r7`. In the formulas below, `U(rN) = N - 4`.

Valid secondary range: `00-EF`. `F0-FF` is reserved and traps.

The original register-count encodings remain unchanged. Moving them to `C0-EF` would require an additional rejection path or executable trap slots for `F0-FF`, adding code size or latency without improving valid-instruction performance. The new immediate forms therefore use the previously unused range `30-EF`.

### 19.1. Encoding map

| Secondary | Instruction | Encoding details |
|---|---|---|
| `00-0F` | `SHL16V rD,rCount` | bits `3:2` destination, bits `1:0` count register |
| `10-1F` | `LSR16V rD,rCount` | bits `3:2` destination, bits `1:0` count register |
| `20-2F` | `ASR16V rD,rCount` | bits `3:2` destination, bits `1:0` count register |
| `30-6F` | `LSL16I rD,imm4` | `secondary - 0x30`: bits `5:4` destination, bits `3:0` count |
| `70-AF` | `LSR16I rD,imm4` | `secondary - 0x70`: bits `5:4` destination, bits `3:0` count |
| `B0-EF` | `ASR16I rD,imm4` | `secondary - 0xB0`: bits `5:4` destination, bits `3:0` count |
| `F0-FF` | Reserved | trap |

The immediate count is encoded directly in four bits and is therefore in `0-15`. Equivalently:

```text
LSL16I: secondary = 0x30 + (U(rD) << 4) + imm4
LSR16I: secondary = 0x70 + (U(rD) << 4) + imm4
ASR16I: secondary = 0xB0 + (U(rD) << 4) + imm4
```

For register-count forms, the low four bits of `rCount` select a shift count in `0-15`; the count register is preserved. Copying the count before entering the shared body makes `rD == rCount` valid. All six instruction families preserve architectural condition state.

### 19.2. Decoder and table structure

The primary slot preloads the complete AVR word address of the 48-entry register-count forwarding table. The dedicated decoder performs the exact cycle-17 reverse SPI handoff, then selects one of two paths:

```asm
cpi   secondary, 0x30
brlo  register_count

; FA 30-EF immediate form; FA F0-FF selects the final invalid entry.
mov   t0, secondary              ; preserve the low-four-bit count
swap  secondary
andi  secondary, 0x0f           ; high nibble selects a body jump
sbiw  Z, 16                     ; pre-bias forwarding base to jump table
add   ZL, secondary
adc   ZH, ZERO
ijmp

register_count:
; Original FA 00-2F forwarding index: two words per entry.
lsl   secondary
add   ZL, secondary
adc   ZH, ZERO
ijmp
```

The immediate jump table contains twelve direct `RJMP`s—one for each operation/destination body—and a thirteenth invalid entry selected by secondary values `F0-FF`. The register table remains 48 two-word entries:

```asm
; Example: SHL16V r6,r5
mov   r26, VM_R5L
rjmp  fa_shl_r6

; Example: LSR16V r4,r7
mov   r26, VM_R7L
rjmp  fa_lsr_r4

; Example: ASR16V r7,r7
mov   r26, VM_R7L
rjmp  fa_asr_r7
```

The full 16-bit table-address calculations remove any requirement that the immediate jump table and forwarding table remain within one 256-word program-memory page. Register-count forms enter the twelve destination-specialized bodies on cycle 32. Immediate forms enter on cycle 34 because preserving the count, rebiasing `Z`, and performing a full 16-bit add cost two additional cycles.

`SHL16V`/`LSL16I` and `LSR16V`/`LSR16I` use twelve-word bodies; `ASR16V`/`ASR16I` use thirteen-word bodies. The shift-by-eight path reduces counts `8-15` to a byte transfer followed by at most seven single-bit iterations.

### 19.3. Size and latency

```text
Dedicated FA decoder                    20 words /  40 bytes
Immediate body-jump table               13 words /  26 bytes
48 register forwarding entries          96 words / 192 bytes
8 left/logical-right bodies             96 words / 192 bytes
4 arithmetic-right bodies               52 words / 104 bytes
                                                   ---------
Total FA-specific implementation                    554 bytes
Increase over the former variable-only FA page       66 bytes
```

Immediate forms are exactly two cycles slower than the corresponding register-count forms because they enter the shared bodies two cycles later:

| Count | `SHL16V` / `LSR16V` | `ASR16V` | `LSL16I` / `LSR16I` | `ASR16I` |
|---:|---:|---:|---:|---:|
| 0 | 42 | 42 | 44 | 44 |
| 1 | 45 | 45 | 47 | 47 |
| 2 | 50 | 50 | 52 | 52 |
| 3 | 55 | 55 | 57 | 57 |
| 4 | 60 | 60 | 62 | 62 |
| 5 | 65 | 65 | 67 | 67 |
| 6 | 70 | 70 | 72 | 72 |
| 7 | 75 | 75 | 77 | 77 |
| 8 | 44 | 45 | 46 | 47 |
| 9 | 47 | 48 | 49 | 50 |
| 10 | 52 | 53 | 54 | 55 |
| 11 | 57 | 58 | 59 | 60 |
| 12 | 62 | 63 | 64 | 65 |
| 13 | 67 | 68 | 69 | 70 |
| 14 | 72 | 73 | 74 | 75 |
| 15 | 77 | 78 | 79 | 80 |

Use `LSL16I`, `LSR16I`, or `ASR16I` for constant counts in `0-15`. The register-count forms remain available for variable shifts, while the one-byte `.1` forms may be preferable in short sequences.

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

For conditional selection, initialize the destination with the false value and name the true value as the conditional-move source:

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

## 21.1. `FF`: dedicated floating-point page

`FF` uses a table-free decoder. Floating-point operations are sufficiently
expensive that runtime decoding of two-bit pair fields is preferable to a large
operand-specialized executable table.

### Encoding groups

| Secondary | Family | Bytes |
|---:|---|---:|
| `00-0F` | `FADD qD,qS` | 2 |
| `10-1F` | `FSUB qD,qS` | 2 |
| `20-2F` | `FMUL qD,qS` | 2 |
| `30-3F` | `FDIV qD,qS` | 2 |
| `40-4F` | `FMIN qD,qS` | 2 |
| `50-5F` | `FMAX qD,qS` | 2 |
| `60-63` | `FNEG qD` | 2 |
| `64-67` | `FABS qD` | 2 |
| `68-6B` | `FSQRT qD` | 2 |
| `6C-7B` | Rounding operations | 2 |
| `7C-BF` | Reserved | — |
| `C0-C9` | Conversions, `FCMP`, and `FCLASS` plus specifier | 3 |
| `CA-FF` | Reserved | — |

The extended forms use three operand-byte layouts:

```text
RQSPEC   0rrr00qq   C0-C3 and C9
QQSPEC   0000ddss   C4-C7
RQQSPEC  0dddllrr   C8
```

For `RQSPEC`, `rrr` selects the scalar register and `qq` selects the pair. The
secondary opcode determines operand direction:

```text
C0-C1: rrr=rS, qq=qD
C2-C3: rrr=rD, qq=qS
C9:    rrr=rD, qq=qS
```

For `QQSPEC`, `dd=qD` and `ss=qS`. For `RQQSPEC`, `ddd=rD`, `ll=qL`, and
`rr=qR`.

The corresponding encodings and validation masks are:

```text
RQSPEC(rN,qN)       = (rN << 4) | qN
invalid RQSPEC      = (specifier & 0x8C) != 0

QQSPEC(qD,qS)       = (qD << 2) | qS
invalid QQSPEC      = (specifier & 0xF0) != 0

RQQSPEC(rD,qL,qR)   = (rD << 4) | (qL << 2) | qR
invalid RQQSPEC     = (specifier & 0x80) != 0
```

On AVR, the scalar index is `(specifier >> 4) & 7`, the low pair index is
`specifier & 3`, and the low nibble of `QQSPEC` or `RQQSPEC` is already a
`ddss`/`llrr` pair descriptor. Malformed specifiers must branch to the shared
invalid-instruction trap before register-file access.

The decoder should:

1. consume the secondary byte and launch the next sequential transfer;
2. reject `7C-BF` and `CA-FF`;
3. decode `q` indices by converting `qN` to native byte address `r8 + 4*N`;
4. fetch the trailing specifier for `C0-C9` using a legal SPI handoff;
5. dispatch to an inline bit operation or a shared helper bridge.

### Inline operations

`FNEG` and `FABS` require only a sign-bit toggle or clear in the most
significant byte of `qD` and should be implemented inline. `FCLASS` should also
be inline: inspect sign, exponent, fraction, and the binary32 quiet-NaN bit and
return the one-hot mask defined by `arch.md`.

`FMIN` and `FMAX` may be inline because they select an original operand rather
than producing a new arithmetic result. The implementation must test the first
operand for NaN before the second, preserve the selected operand bit-for-bit,
and order `-0.0` below `+0.0`.

### Soft-float bridge

Arithmetic, square root, rounding, conversion, and comparison handlers may call
AVR soft-float routines through one assembly bridge. The bridge must not expose
the helper register interface to bytecode handlers.

Before entering a helper, it must preserve every live interpreter register not
covered by the helper's result, including the 24-bit VM PC, VM stack pointer,
architectural register file, `VM_FLAGS`, permanent constants, and any pending
SPI state. It must establish the helper's required zero-register state, marshal
arguments into the AVR-GCC argument registers, call the helper, copy the result
back to the selected architectural destination, restore interpreter state, and
restart or resume the bytecode stream safely.

Because helper calls interrupt the fixed SPI pipeline, they should consume the
already-fetched bytes, stop relying on speculative stream state, and return
through the common stream-seek/restart path. Exact cycle counts are therefore
operation- and helper-dependent and must be measured after the bridge and
linked soft-float routines are selected.

The first implementation should provide `FADD`, `FSUB`, `FMUL`, `FDIV`, `FMIN`,
`FMAX`, `FNEG`, `FABS`, `FSQRT`, all eight conversions, `FCMP`, and `FCLASS`.
The rounding encodings may initially trap during development but are reserved
for their specified operations. No fused operation is assigned.

# Part I-B — Dispatch and Implementation Strategy

## 21.2. `EC`: dedicated runtime-decoded 16-bit division/remainder

`EC` is a two-byte, table-free instruction family:

```text
EC oo ddd sss
```

```text
bits 7:6  operation
bits 5:3  destination/dividend rD
bits 2:0  preserved source/divisor rS
```

| `oo` | Instruction | Result written to `rD` |
|---:|---|---|
| `00` | `UDIV16 rD,rS` | Unsigned quotient |
| `01` | `UREM16 rD,rS` | Unsigned remainder |
| `10` | `SDIV16 rD,rS` | Signed quotient, truncated toward zero |
| `11` | `SREM16 rD,rS` | Signed remainder with the dividend's sign |

The source register is preserved. `rD == rS` is legal because the handler captures both complete original operands before writing the destination. All four operations preserve `VM_FLAGS`.

Division by zero is deterministic:

```text
DIV16 by zero -> 0xFFFF
REM16 by zero -> original dividend bit pattern
```

The signed overflow case also has deterministic modulo-16-bit behavior:

```text
SDIV16 0x8000,-1 -> 0x8000
SREM16 0x8000,-1 -> 0
```

### 21.1.1. Exact secondary-byte handoff

The primary slot contains one `RJMP` to the dedicated handler. Primary-slot entry occurs on cycle 9 after the `OUT` that started the operand byte, and the handler begins on cycle 11. Five useful one-cycle instructions fill the remaining transfer window:

```asm
add   VM_PCL, ONE
adc   VM_PCM, ZERO
adc   VM_PCH, ZERO
mov   XH, ZERO
mov   ZH, ZERO
cli
out   SPDR, ZERO
in    secondary, SPDR
sei
```

The speculative following-primary `OUT` therefore lands exactly on cycle 17. Division then runs while that following opcode remains buffered, and the handler finishes through a late standard `IN; OUT` Cluster-A tail.

### 21.1.2. Runtime operand decode and scratch allocation

The secondary byte is decoded arithmetically rather than through an executable table:

```text
ZL = 8 + 2*ddd    destination/dividend register-file address
XL = 8 + 2*sss    source/divisor register-file address
```

After both architectural operands are captured, the native scratch allocation is:

```text
r24:r25  shifting dividend and quotient
r26:r27  unsigned divisor magnitude
r0:r1    partial remainder
r30      destination register-file address plus operation metadata
r31      sign scratch, magnitude-width test, then pair-iteration counter
```

The otherwise-unused high bits of `r30` retain the operation state while the divider uses every other scratch byte:

```text
bit 7  signed operation
bit 6  select remainder rather than quotient
bit 5  negate the selected signed result
```

This avoids hardware-stack spills and leaves the VM stack pointer untouched.

### 21.1.3. Dedicated two-way-unrolled restoring cores

After signed operands have been converted to unsigned magnitudes, the handler tests the two high bytes:

```asm
mov   count, dividendH
or    count, divisorH
breq  divrem8
```

A not-taken test costs three cycles on the general path. When both high bytes are zero, the operands use the dedicated eight-bit-magnitude core. This includes promoted `char` and `unsigned char` values as well as any wider integer values whose magnitudes happen to fit in one byte.

Both cores calculate quotient and remainder together and perform two quotient-bit iterations per loop branch.

The sixteen-bit core uses eight loop groups:

```asm
ldi   count, 8
loop16:
    ; quotient bit A
    lsl   quotientL
    rol   quotientH
    rol   remainderL
    rol   remainderH
    cp    remainderL, divisorL
    cpc   remainderH, divisorH
    brlo  no_subtract16_a
    sub   remainderL, divisorL
    sbc   remainderH, divisorH
    ori   quotientL, 1
no_subtract16_a:

    ; quotient bit B: identical sequence
    ...

    dec   count
    brne  loop16
```

The eight-bit core uses four loop groups and omits all high-byte shift, compare, and subtract operations:

```asm
ldi   count, 4
loop8:
    ; quotient bit A
    lsl   quotientL
    rol   remainderL
    cp    remainderL, divisorL
    brlo  no_subtract8_a
    sub   remainderL, divisorL
    ori   quotientL, 1
no_subtract8_a:

    ; quotient bit B: identical sequence
    ...

    dec   count
    brne  loop8
```

The byte core is emitted after the normal store-and-dispatch path. The magnitude test branches forward to it, and the byte core jumps back to common quotient/remainder selection. Consequently, the common true-16-bit path does not pay an extra jump after its loop.

For the sixteen-bit core, each zero quotient bit costs eight arithmetic cycles and each one bit costs two additional cycles. Two-way unrolling reduces loop-control cost from 47 cycles to 23 cycles, saving 24 cycles before the three-cycle width test.

For the eight-bit core, each zero quotient bit costs five arithmetic cycles and each one bit costs one additional cycle. Its four pair-loop controls cost eleven cycles.

### 21.1.4. Exact code size and latency

The complete shared handler occupies exactly:

```text
107 AVR words
214 bytes
```

This is a 29-word / 58-byte increase over the single rolled sixteen-bit core. The increase consists of:

```text
three-word magnitude-width test             3 words /  6 bytes
second sixteen-bit iteration body          10 words / 20 bytes
dedicated two-way-unrolled eight-bit core  16 words / 32 bytes
                                            --------------------
net growth                                 29 words / 58 bytes
```

No executable operand table is required, and the `EC` primary slot remains part of the fixed 2,048-byte primary table.

For a nonzero divisor whose unsigned magnitudes both fit in eight bits, unsigned forms have the exact complete latency:

```text
120 + popcount(unsigned 8-bit quotient) cycles
```

Therefore byte-magnitude `UDIV16` and `UREM16` span **120-128 cycles**.

When either magnitude requires sixteen bits, unsigned forms have the exact complete latency:

```text
217 + 2*popcount(unsigned 16-bit quotient) cycles
```

Therefore true-16-bit `UDIV16` and `UREM16` span **217-249 cycles**. Relative to the original rolled core, this is a universal 21-cycle improvement on the general path and a 118-126-cycle improvement for byte-sized magnitudes.

For signed forms, let:

```text
Nneg       = number of negative input operands, 0-2
neg_result = 1 when the selected quotient/remainder must be negated
Qmag       = unsigned magnitude quotient
```

For byte-sized magnitudes, exact complete latency is:

```text
130 + 2*Nneg + popcount(Qmag) + 4*neg_result cycles
```

Byte-magnitude `SDIV16` spans **130-144 cycles**, and byte-magnitude `SREM16` spans **130-146 cycles**.

For true-16-bit magnitudes, exact complete latency is:

```text
227 + 2*Nneg + 2*popcount(Qmag) + 4*neg_result cycles
```

True-16-bit `SDIV16` spans **227-263 cycles**, and true-16-bit `SREM16` spans **227-265 cycles**. Division-by-zero exits are unchanged at **57 cycles** for quotient forms and **56 cycles** for remainder forms.

The long arithmetic bodies do not require additional SPI transfers. The fastest nonzero byte-magnitude path still completes well after the prefetched following opcode is available, and every final handoff remains a legal late standard handoff.

---

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
; LD8U rD,[rA] -- exact four-word slot
movw  X, aL
ld    dL, X
clr   dH
rjmp  cluster_a_tail_18_delay_1
```

The exact-fit families cannot carry local delay padding. Their final `RJMP` selects an appropriate shared 17- or 18-cycle cadence tail, which is already included in the shared-tail allowance.

### 22.2. Immediate and control primaries

The `C0-CF` immediate families do not require sixteen fully duplicated continuation bodies. A size-efficient implementation preloads an operation-stub address or an exact native register-file address in the four-word primary slot, then uses one family-shared operand-fetch continuation. The continuation consumes the immediate byte or bytes, starts the following transfer, and enters a short destination-specialized operation stub.

One size-efficient organization is:

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
| `LDI8 rD,imm8` | 35 |
| `LDI16 rD,imm16` | 52 |
| `ADDI.S8 rD,simm8` | 35 |
| `CMPI.S8 rL,simm8` | 35 |

The extra `RJMP`/`IJMP` work is hidden inside the operand-transfer windows except where reflected in those exact totals.

The reference handlers use the operand-transfer window for the `D0-D7` two-byte branch, `ADJSP`, and `SYS` forms as described in Section 30. The `E0-E3` handlers use their additional transfer slack to reach the listed latencies.

The one-byte indirect-control and return forms can share the seek/restart handler. In the measured implementation they take 110 cycles for `JMPP`, 117 for `CALLP`, and 110 for `RET`. The extra cycle comes from enforcing the 18-cycle command-to-address transmit cadence in the shared stream-restart routine.

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

`F1` and `FE` bypass those stubs and share a dedicated width-two decoder. `FA` uses its own combined immediate/register-count decoder. The exact non-floating secondary-decoder infrastructure is:

```text
4 generic width stubs and generic decoder   20 words / 40 bytes
shared width-two decoder                    14 words / 28 bytes
dedicated `FA` shift decoder                20 words / 40 bytes
                                             ------------------
total                                       54 words / 108 bytes
```

The `FF` decoder and soft-float bridge are measured separately. The bounded pages are `F0-F8` and `FE`. `F9`, `FA`, and `FF` use dedicated decoders, and `FB-FD` use their separate shared condition gate. The generic multiplier-stub path reaches a standard cycle-17/18 `IN; OUT` handoff. The shared two-word decoder instead uses an exact cycle-17 reverse handoff. In both cases, PC-update work occupies transfer slack rather than extending the post-transfer critical path.

The reference interpreter uses the decode, table, forwarding, and shared-body structures in Sections 9-21 for `F0-FE`, the dedicated `FF` decoder in Section 21.1, and the dedicated `EC` division handler. The generic multiplier decoder serves `F0` and `F2-F8`; the shared width-two decoder serves `F1` and `FE`; dedicated handlers serve `EC`, `F9`, `FA`, and `FF`; the `F9` bitwise handler is placed near the primary table; and `FB-FD` use their shared condition gate. The example physical layout places executable tables and shared bodies in the `RJMP`-reachable clusters described in Section 26.

### 22.4. Reference latency summary

| Instruction class | Reference complete latency |
|---|---|
| `00-BF` direct one-byte instructions | Selected 17- or 18-cycle cadence from Sections 5 and 27 |
| `C0-CF` immediate instructions | 35 / 52 / 35 / 35 by family |
| `D0-D7` branch/`ADJSP`/`SYS` | Exact values in Section 30 |
| `E0-E3` multi-byte direct control | 135 for near forms; 150 for far forms |
| `E4-EB` `JMPP`/`CALLP` | 110 / 117 |
| `EC` 16-bit division/remainder | 56-265 cycles; exact formulas in Section 21.2 |
| `EF` `RET` | 110 |
| `F0-F8` dense pages | Fast forms use their page cadence; measured cold forms span 53-357 cycles by family |
| `F9` runtime bitwise page | AND 52, OR 53, XOR 54 cycles |
| `FA` immediate and register-count shifts | Count-dependent values in Section 19; 42-80 cycles |
| `FB-FD` conditional moves | 36 cycles false / 37 cycles true |
| `FE MUL16` | 46 cycles |
| `FF` floating point | operation- and helper-dependent |

The primary dispatch multiplier is a two-cycle AVR `MUL`.

---

## 23. Two-byte dense-page pipeline

1. Primary dispatch consumes the prefix opcode and starts fetching the secondary byte.
2. `EC` enters its division decoder; `F0` and `F2-F8` enter the generic multiplier decoder; `F1` and `FE` enter the shared width-two decoder; `F9`, `FA`, and `FF` enter dedicated runtime decoders; `FB-FD` enter the shared condition gate.
3. The selected decoder advances `PC`, consumes the secondary byte, and starts speculative fetch of the following primary opcode.
4. A truncated page performs one upper-bound check.
5. A direct dense page calculates the fixed-stride word address and executes one `IJMP` into the operand-specialized slot. A condition-false `FB-FD` instruction bypasses its shared table.
6. `EC` dynamically decodes two architectural registers and runs its shared 16-iteration divider. `FF` decodes pair operands and enters an inline handler or the soft-float bridge. `F1-F8` slots perform the operation and `RJMP` to their assigned cluster continuation. `F9` dynamically decodes both architectural-register pointers, performs the selected bitwise operation, and returns through Cluster A. `FA` immediate entries jump directly to shared shift bodies while register-count entries forward through `MOV`/`RJMP` pairs. `FB-FD` use the shared conditional-move table, and `FE` slots forward to shared multiplication bodies.
7. The assigned cluster continuation consumes the speculative following primary byte and resumes primary dispatch.

There is no run-time architectural-register decoding for the dense `F1-F8` fast paths, `FA`, `FB-FD`, or `FE`. `FF` deliberately decodes pair operands at run time. `EC`, `F0 69-6D`, and `F9` dynamically decode architectural-register operands from their trailing byte. `FA` uses immediate body jumps plus register-count forwarding entries, `FE` uses forwarding entries, and `FB-FD` share one operand table.

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

The ten bounded pages perform this upper-bound check in either the generic or shared width-two decoder. `FB-FD` use `secondary < 0x80`; bit 6 selects the inverse condition and bits 5:0 index the shared table. `F9` needs no register-field bounds check because each operand is a three-bit index; operation value `11` traps locally. `FE` uses `secondary < 0x40`. The duplicate upper-register combinations removed from `F1`, `F2`, and `F5`, together with the contiguous `MOV32` additions in `F2`, leave each valid range contiguous.

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

The two complete 16-bit additions preserve the ninth offset bit for `F1` entries `0x80-0x8F`. This decoder occupies **14 words / 28 bytes**. With the generic decoder and stubs, bounded-page infrastructure occupies **34 words / 68 bytes**. The dedicated `FA` decoder adds **20 words / 40 bytes**, for **54 words / 108 bytes** of secondary decode infrastructure in total.

### 25.3. Dedicated `FA` shift decoder

`FA` uses the cycle-17 reverse handoff shown in Section 19 rather than the shared width-two bounds decoder. A single threshold distinguishes the unchanged register encodings `00-2F` from immediate encodings `30-EF`; the immediate jump table itself maps `F0-FF` to the invalid-secondary trap. Register-count forms enter a shared shift body on cycle 32; immediate forms enter on cycle 34. The decoder occupies **20 words / 40 bytes**.

## 26. Single-section physical layout and jump relaxation

### 26.1. Measurement origin and alignment

The code-size accounting region begins at a 256-word-aligned `primary_table`. Alignment padding before that symbol is outside the reported implementation size. No interior block requires alignment greater than one AVR word.

### 26.2. Reference order and estimated word ranges

The following single-section order is a reference layout that keeps the major static transfers in range. The listed fixed-size blocks reflect the shown assembly sequences. The ordinary `F0` body block uses the budgeted allocation from Section 34; implementations may vary within the permitted size range provided all static transfers remain in range and no interior power-of-two alignment gaps are introduced.

| Order | Block | Start word | End word, exclusive | Words | Bytes |
|---:|---|---:|---:|---:|---:|
| 1 | Four-word primary table | 0 | 1024 | 1024 | 2048 |
| 2 | Dedicated `EC` 16-bit division/remainder handler | 1024 | 1131 | 107 | 214 |
| 3 | Dedicated `F9` handler | 1131 | 1170 | 39 | 78 |
| 4 | Dedicated `FA` shift decoder | 1170 | 1190 | 20 | 40 |
| 5 | Shared width-two decoder | 1190 | 1204 | 14 | 28 |
| 6 | Generic decoder and four width stubs | 1204 | 1224 | 20 | 40 |
| 7 | Shared `FB-FD` condition gate | 1224 | 1243 | 19 | 38 |
| 8 | Primary continuations, primary tails, `SYS` table, seek/restart, local delays, and traps | 1243 | 1887 | 644 | 1288 |
| 9 | Cluster-A false-path landing and cadence cluster | 1887 | 1913 | 26 | 52 |
| 10 | Local F0 trap plus `F0` veneer table | 1913 | 2024 | 111 | 222 |
| 11 | `F0` immediate, stack, absolute, and program-space bodies | 2024 | 2776 | 752 | 1504 |
| 12 | Shared `F0` cold-32 subsystem | 2776 | 2839 | 63 | 126 |
| 13 | Shared `F0` cold general-pointer subsystem | 2839 | 2885 | 46 | 92 |
| 14 | `F1` table | 2885 | 3173 | 288 | 576 |
| 15 | `F2` table | 3173 | 3497 | 324 | 648 |
| 16 | `F3` table | 3497 | 3881 | 384 | 768 |
| 17 | Cluster B and two local trap shims | 3881 | 3908 | 27 | 54 |
| 18 | `F4` table | 3908 | 4460 | 552 | 1104 |
| 19 | `F5` table | 4460 | 4844 | 384 | 768 |
| 20 | `F6` table | 4844 | 5164 | 320 | 640 |
| 21 | `F7` table | 5164 | 5884 | 720 | 1440 |
| 22 | Cluster C and local trap shim | 5884 | 5908 | 24 | 48 |
| 23 | `F8` table | 5908 | 6148 | 240 | 480 |
| 24 | `FA` immediate body-jump table | 6148 | 6161 | 13 | 26 |
| 25 | `FA` register forwarding table | 6161 | 6257 | 96 | 192 |
| 26 | Twelve shared `FA` shift bodies | 6257 | 6405 | 148 | 296 |
| 27 | Shared `FB-FD` move table | 6405 | 6533 | 128 | 256 |
| 28 | `FE` forwarding table | 6533 | 6661 | 128 | 256 |
| 29 | Eight `FE` multiplication bodies | 6661 | 6725 | 64 | 128 |
|  | **Non-floating reference end** |  | **6725** | **6725** | **13,450** |

The `FF` decoder, bridge, inline floating handlers, and linked soft-float routines are not included in this non-floating endpoint until measured. Startup-only helpers and startup code are also excluded.

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

- pointer in an upper register and data in an upper register: one-byte 18-cycle primary form;
- pointer in an upper register and data in a lower register: two-byte ~35-38-cycle dense form;
- pointer in a lower register: three-byte 68-77-cycle cold fallback, depending on direction, width, and postincrement.

No additional cadence tail or dispatch stage is introduced for the fast path.

Two pointers in upper registers are sufficient for the bubble-sort loop mappings, one marking pointer in an upper register is sufficient for Sieve, and Fibonacci uses no explicit data-space pointer in its recursive body. Performance falls to the cold fallback only when allocator pressure places a hot pointer in a lower register.

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

The zero and nonzero paths are equal-time. These improvements justify moving `INC16`/`DEC16` from `F6` to `F4` and retaining the five-word `BOOL` implementation in `F7`.

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

The sequences shown in the page definitions illustrate efficient implementations of `BSWAP16`, widening 8-bit multiplies, variable shifts, fast loads/stores using upper-register pointers, `ADD32`, `SUB32`, and the one-bit 32-bit shifts. Pointers in lower registers can use the separately specified `F0` subsystem.

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
| `FF` floating point | operation- and helper-dependent |

Sections 9 and 19 give the cycle targets used when sizing and arranging the reference `F0` and `FA` handlers.

---

## 28. Aliasing rules

- Ordinary fast loads capture upper-register `rA` in native `X`, so `rD == rA` is valid.
- Fast postincrement stores capture the original upper-register pointer before updating it, so `rA == rS` is valid.
- Fast postincrement loads reserve `rD == rA`, because one register cannot receive both the loaded value and updated pointer.
- Cold ordinary loads capture the selected pointer value before writing the destination, so `rD == rA` is valid.
- Cold stores capture the complete source before reading or updating the pointer, so `rS == rA` is valid.
- Cold postincrement loads reserve `rD == rA`, matching the fast forms.
- Cold `LD32` and `ST32` capture the selected address register into native `Z` before touching the selected `q` pair, so pair/address overlap is legal.
- Cold `CMP32` allows `qL == qR`; it captures the entire left operand before reusing native `XL` as comparison scratch.
- `F9` bitwise operations allow every `rD,rS` combination, including `rD == rS`, because both original operands are loaded before writeback.
- `MUL16` permits every `rD,rS` combination, including equality.
- `MOV32` permits every pair alias; upper-pair copies use two compact `MOV` instructions.
- Binary `FF` operations permit `qD == qS`; the helper bridge captures required inputs before writing the destination.
- Every cold-memory `RRSPEC` bit pattern selects valid registers and modifiers. Reserved postincrement-load alias combinations are rejected by the assembler and backend.

## 29. Bounded-table footprint

| Page | Entries | Words/entry | Exact bytes | Full 256-entry bytes | Unused-tail reduction |
|---:|---:|---:|---:|---:|---:|
| `F0` | 110 | 1 | 220 | 512 | 292 |
| `F1` | 144 | 2 | 576 | 1024 | 448 |
| `F2` | 108 | 3 | 648 | 1536 | 888 |
| `F3` | 128 | 3 | 768 | 1536 | 768 |
| `F4` | 184 | 3 | 1104 | 1536 | 432 |
| `F5` | 96 | 4 | 768 | 2048 | 1280 |
| `F6` | 80 | 4 | 640 | 2048 | 1408 |
| `F7` | 144 | 5 | 1440 | 2560 | 1120 |
| `F8` | 48 | 5 | 480 | 2560 | 2080 |
| `FA` register table | 48 | 2 | 192 | 1024 | 832 |
| `FB-FD` shared table | 64 | 2 | 256 | 1024 | 768 |
| `FE` | 64 | 2 | 256 | 1024 | 768 |

The dense tables for upper-register pointers contain only fast forms. The two table-free cold-memory secondaries provide complete register coverage through one 46-word shared handler.

## 30. Control-flow primaries

| Opcode | Instruction | Bytes | Measured cycles |
|---:|---|---:|---:|
| `D0` | `BREQ8 rel8` | 2 | 35 not taken; 128 taken |
| `D1` | `BRNE8 rel8` | 2 | 35 not taken; 128 taken |
| `D2` | `BRULT8 rel8` | 2 | 35 not taken; 128 taken |
| `D3` | `BRSLT8 rel8` | 2 | 35 not taken; 128 taken |
| `D4` | `JMP8 rel8` | 2 | 122 |
| `D5` | `CALL8 rel8` | 2 | 128 |
| `D6` | `ADJSP simm8` | 2 | 35 |
| `D7` | `SYS service8` | 2 | varies |
| `D8` | `BRUGE8 rel8` | 2 | 35 not taken; 128 taken |
| `D9` | `BRSGE8 rel8` | 2 | 35 not taken; 128 taken |
| `DA` | `BREQ16 rel16` | 3 | 51 not taken; 135 taken |
| `DB` | `BRNE16 rel16` | 3 | 51 not taken; 135 taken |
| `DC` | `BRULT16 rel16` | 3 | 51 not taken; 135 taken |
| `DD` | `BRUGE16 rel16` | 3 | 51 not taken; 135 taken |
| `DE` | `BRSLT16 rel16` | 3 | 51 not taken; 135 taken |
| `DF` | `BRSGE16 rel16` | 3 | 51 not taken; 135 taken |
| `E0` | `JMP16 rel16` | 3 | 135 |
| `E1` | `CALL16 rel16` | 3 | 135 |
| `E2` | `JMPF target24` | 4 | 150 |
| `E3` | `CALLF target24` | 4 | 150 |
| `E4-E7` | `JMPP qN` | 1 | 110 |
| `E8-EB` | `CALLP qN` | 1 | 117 |
| `EF` | `RET` | 1 | 110 |

The measured taken-transfer values are one cycle above the earlier estimates because the shared seek/restart routine now preserves the required 18-cycle `OUT`-to-`OUT` cadence while transmitting the `SFC_READ` command and address bytes. The measured `SYS` values include the complete service-table dispatch overhead.

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

For the reference schedule, a not-taken 16-bit branch launches the fallthrough opcode at the second cycle-17 boundary and completes in 51 cycles. A taken branch reuses the `JMP16` signed-displacement suffix and therefore has the same 134-cycle latency as `JMP16`. Code generators should choose fallthrough layout based on expected path frequency. `CALLF` uses native `r7` to add four to the low-register 24-bit PC when forming its return address.


## 31. Assembler selection rules

Use the one-byte primary form whenever all required operands are upper
registers. Use the dense or runtime-decoded full-register form otherwise.

`MOV32` is a target-selected pseudo:

```text
qD and qS both in q2-q3:
    emit MOV low16(qD),low16(qS)
    emit MOV high16(qD),high16(qS)
    2 bytes, 34 cycles

all other pairs:
    emit F2 60-6B
    2 bytes, 38 cycles
```

The disassembler prints encoded `F2 60-6B` instructions as `MOV32` but does not
combine adjacent `MOV` instructions.

For memory operations, prefer the one-byte upper/upper form, then the dense
upper-pointer form, and use the cold `F0` form when the pointer is in a lower
register. Use immediate `FA` shifts for constant counts in `0-15` and the
register-count forms for variable counts.

## 32. Code-size accounting scope

Included in the reference interpreter-core size estimate:

- the 256-entry primary dispatch area;
- shared sequential dispatch and cadence tails;
- all primary handlers and continuations;
- every non-floating `F0-FE` decoder, table, forwarding page, shared body, and local trap shim;
- branch, jump, call, return, and stream-restart helpers;
- reserved-instruction traps;
- the `SYS` opcode decoder and bridge entry/exit.

Excluded from the reference interpreter-core size estimate:

- startup and vectors;
- interrupt handlers;
- hardware initialization and service bodies;
- save-flash routines;
- debugger implementation beyond trap entry;
- the `FF` decoder, bridge, and inline floating handlers until measured;
- linked runtime-library and soft-float routines.

---

## 33. Exact executable-table size

```text
primary table                    2,048 bytes
F0 veneer table                    220
F1 table                           576
F2 table                           648
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
all executable tables            9,422 bytes
```

The secondary executable tables total **7,374 bytes**. `EC`, `F9`, and `FF` have no executable tables. Runtime-decoded `F0` subsystems are accounted for separately.

## 34. Reference core-size estimate

### 34.1. Reference baseline and variable components

For the shown layout, the non-floating core with the expanded `F2` table, `FA` bodies, and all other non-floating pages present, but excluding the ordinary `F0` bodies and the two shared `F0` runtime-decoded subsystems, occupies **11,728 bytes**. The remaining components are estimated as follows:

| Component | Reference bytes | Estimated range |
|---|---:|---:|
| `F0` immediate, stack, absolute, and program-space bodies | 1,504 | 1,408-1,664 |
| Shared `F0` cold-32 subsystem | 126 | exact |
| Shared `F0` cold general-pointer subsystem | 92 | exact |

### 34.2. Reference completed-core estimate

| Case | Bytes | KiB |
|---|---:|---:|
| Lower bound | 13,354 | 13.04 |
| Non-floating reference target | **13,450** | **13.13** |
| Upper bound | 13,610 | 13.29 |

The non-floating reference design targets about 13,450 bytes, with 13,610 bytes as a practical upper estimate before adding the `FF` decoder, bridge, inline handlers, and linked soft-float routines. Those components require separate measurement.

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

In this estimate, the completed-core range varies mainly with the ordinary `F0` bodies. The `EC` divider, cold-32, cold-pointer, and `FA` shared-body sizes are fixed for the shown implementation sequences.

If the ordinary `F0` bodies change substantially, it is prudent to retain the one-word veneer organization and recheck static-transfer reach, particularly for backward edges into Clusters A and C.

## 37. Suggested validation checklist

A thorough implementation should:

1. verify the cadence of every `F0` veneer body, including program-space stream interruption and restart;
2. verify the measured two-cycle immediate-versus-register offset and count-dependent timing for all twelve shared `FA` bodies;
3. assemble and link with GNU AVR with no truncated `RJMP`, `RCALL`, or relocation;
4. assert every primary slot width, secondary slot width, table bound, table size, and fixed block size;
5. exhaustively test condition flags, invalid encodings, memory aliasing, postincrement reservations, and call/return stack behavior;
6. test every jump, call, and return across low-, middle-, and high-byte PC carry and wrap boundaries;
7. validate `EC` division/remainder exhaustively for source preservation, `rD == rS`, signed truncation, division by zero, `INT_MIN / -1`, and timing bounds;
8. validate `F9`, `MUL16`, and both `MOV32` expansion paths for every operand alias class;
9. validate every `FF` classification, NaN, signed-zero, conversion, bridge-preservation, and SPI-restart case;
10. compile representative programs and compare observed latency and flash use with the reference figures in this guide.

## 38. Suggested validation sequence

1. Assemble and link the complete interpreter with GNU AVR.
2. Verify all compile-time size assertions and static-transfer ranges.
3. Run exhaustive per-encoding tests, including invalid and reserved encodings.
4. Run targeted 24-bit PC and stack tests for every control-flow form.
5. Run operand-alias and boundary-value tests for every memory, arithmetic, division/remainder, multiplication, `MOV32`, and floating-point family.
6. Verify the soft-float bridge preserves interpreter state and restarts the byte stream correctly.
7. Compile a representative Arduboy corpus and compare code size and instruction timing with the reference design.

