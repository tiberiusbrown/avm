# AVM ISA Opcode Map and Interpreter Plan

**Status:** Architecture and opcode-map specification  
**Target host:** ATmega32U4 Arduboy FX interpreter  
**Priority:** Performance of LLVM-generated C and C++ code  
**Timing basis:** Sequential SPI byte fetch using the exact 17-cycle reverse-order and 18-cycle standard dispatch schedules; slower handlers extend the cadence only when their native work exceeds the available slack.

---

## 1. Scope

This document defines the AVM opcode map and interpreter organization with global memory, a framebuffer, a VM stack, 16-bit data pointers, and 24-bit program pointers.

The ISA is organized around these interpreter rules:

1. A one-byte opcode directly selects native AVR operands.
2. A hot two-byte instruction uses the entire second byte as an executable-table index.
3. Every directly executing slot under a secondary-table prefix has the same **natural AVR word count**, including its final `RJMP` to a page-local dispatch tail. A forwarding page instead uses equal-width operand-specialized entries that jump to shared implementation bodies.
4. Instructions are not padded into a larger page merely to share a primary prefix.
5. The decoder computes `tableBase + secondary * slotWords` and performs one `IJMP` directly into the final operand-specialized slot. The `FA` variable shifts and `FE` multiplication page use equal-width forwarding entries that jump to shared destination-specific bodies. The `FB-FD` conditional-move prefixes share one 64-entry operand table after a prefix-specific condition gate.
6. A truncated table numbers valid entries contiguously from zero, checks one upper bound, and omits the unused tail.
7. Internal holes that cannot be moved to the tail remain same-width trap slots.
8. Hot dense instructions do not perform run-time architectural-register decoding; explicitly cold `F0` forms and the table-free `F9` page may do so.
9. Additional encoded bytes normally contain actual immediates, displacements, or addresses.
10. The primary dispatch table uses a fixed four-word, eight-byte stride. A primary slot either executes a complete short handler ending in `RJMP` to a shared cadence tail, or performs up to three words of setup and uses its fourth word to forward to an out-of-line continuation.
11. The measured code region begins at the primary table. The primary table is aligned to 256 AVR words (512 bytes); no alignment padding before it is included in the measured size. All following code is emitted in one text section without interior power-of-two alignment gaps.

Cycle estimates are measured from entry to one primary handler through entry to the next primary handler.

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

This initialization is outside the measured region unless explicitly placed after `primary_table`.

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

For cadence accounting, the first native instruction in the selected primary-table slot begins on **cycle 10 after the dispatch's most recent `OUT SPDR,...`**. This is true for both dispatch forms:

```asm
; Standard dispatch: OUT is cycle 0; selected primary slot starts at cycle 10.
in    primary, SPDR
out   SPDR, ZERO
add   VM_PCL, ONE
adc   VM_PCM, ZERO
adc   VM_PCH, ZERO
mul   primary, FOUR
movw  r30, r0
subi  r31, hi8(-(pm(primary_table)))
ijmp

; Reverse dispatch: its OUT is cycle 0; selected primary slot also starts at
; cycle 10. The low- and middle-byte PC updates occur before that OUT. CLI,
; OUT, IN, and SEI preserve the carry into the high-byte ADC after the handoff.
add   VM_PCL, ONE
adc   VM_PCM, ZERO
cli
out   SPDR, ZERO
in    primary, SPDR
sei
adc   VM_PCH, ZERO
mul   primary, FOUR
movw  r30, r0
subi  r31, hi8(-(pm(primary_table)))
ijmp
```

Consequently, a primary slot that must perform a reverse handoff on cycle 17 has only cycles 10 through 15 available before its `CLI` and `OUT`. Include all slot instructions, taken jumps into continuations, and continuation instructions in that seven-cycle window. For example, a slot containing `NOP; RJMP handler` reaches the handler on cycle 13, leaving cycles 13 through 15 for three one-cycle instructions before `CLI` on cycle 16 and `OUT` on cycle 17.

The reverse dispatch must update `VM_PCM` before `CLI; OUT; IN; SEI`. Moving that middle-byte `ADC` after the handoff adds one post-`OUT` cycle and delays primary-slot entry to cycle 11. The handoff instructions do not modify carry, so the carry produced by the middle-byte `ADC` remains valid for the subsequent `VM_PCH` update. Interrupt handlers must preserve `SREG`, as required elsewhere in this specification.

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
    in    primary, SPDR
    out   SPDR, r2
    add   r4, r3
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
    cli
    out   SPDR, r2
    in    primary, SPDR
    sei
    adc   r6, r2
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

| Class | Expected cycles |
|---|---:|
| Not-taken conditional branch | 35-36 |
| Taken conditional branch | ~130 |
| Relative jump | ~126 |
| Relative call | ~140 |
| Near relative jump/call | ~147 / ~163 |
| Far jump/call | ~164 / ~181 |
| Indirect jump/call | ~130 / ~146 |
| Return | ~122 |
| Program-space scalar load | ~268-305 |

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
| `C0-C3` | `LDI8 cD,imm8` | 2 | 34 |
| `C4-C7` | `LDI16 cD,imm16` | 3 | 51-54 |
| `C8-CB` | `ADDI.S8 cD,simm8` | 2 | 34-36 |
| `CC-CF` | `CMPI.S8 cL,simm8` | 2 | 35-36 |
| `D0-D3` | Conditional branches | 2 | 35-36 NT; ~130 T |
| `D4` | `JMP rel8` | 2 | ~126 |
| `D5` | `CALL rel8` | 2 | ~140 |
| `D6` | `ADJSP simm8` | 2 | 36-38 |
| `D7` | `SYS service8` | 2 | ~37 plus service |
| `D8-DF` | Reserved | — | trap |
| `E0` | `JMP16 rel16` | 3 | ~147 |
| `E1` | `CALL16 rel16` | 3 | ~163 |
| `E2` | `JMPF target24` | 4 | ~164 |
| `E3` | `CALLF target24` | 4 | ~181 |
| `E4-E7` | `JMPP qN` | 1 | ~130 |
| `E8-EB` | `CALLP qN` | 1 | ~146 |
| `EC-EE` | Reserved | — | trap |
| `EF` | `RET` | 1 | ~122 |
| `F0` | Bounded 1-word cold-form veneer page | 2-4 | varies |
| `F1` | Bounded dense 2-word page | 2 | 34-36 |
| `F2` | Bounded dense 3-word page A | 2 | 35-36 |
| `F3` | Bounded dense 3-word page B | 2 | 35-36 |
| `F4` | Bounded dense 3-word page C | 2 | ~36 |
| `F5` | Bounded dense 4-word page A | 2 | 35-36 |
| `F6` | Bounded dense 4-word page B | 2 | ~36-38 |
| `F7` | Bounded dense 5-word page A | 2 | ~36-38 |
| `F8` | Bounded dense 5-word simple-condition page | 2 | ~36-38 |
| `F9` | Dedicated runtime-decoded full-register bitwise page | 2 | ~54-56 |
| `FA` | Bounded dense 2-word variable-shift forwarding page | 2 | variable; ~43-79 |
| `FB` | `CMOV.EQ` / `CMOV.NE` condition-family prefix | 2 | ~36-38 false; ~40-42 true |
| `FC` | `CMOV.ULT` / `CMOV.UGE` condition-family prefix | 2 | ~36-38 false; ~40-42 true |
| `FD` | `CMOV.SLT` / `CMOV.SGE` condition-family prefix | 2 | ~36-38 false; ~40-42 true |
| `FE` | Bounded 2-word `MUL16` forwarding page | 2 | ~44-47 |
| `FF` | Reserved | — | trap |

All fifteen secondary-page prefixes occupy the contiguous range `F0-FE`. `F0-F8`, `FA`, and `FE` use the generic bounded-page machinery; `F9` uses a dedicated runtime decoder; and `FB-FD` use the shared condition gate. Their decoder entries and gates are emitted immediately after the primary table, while executable tables and shared bodies are ordered later according to the single-section layout in Section 26.

The remaining primary ranges provide push/pop, immediate, branch, control-flow, and reserved encodings while keeping all secondary prefixes contiguous.

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

Every shown `RJMP page_tail` is included in the stated slot width. The `FA` forwarding entries use `MOV` plus `RJMP` to a shared shift body. The `FE` forwarding entries use `MOVW` plus `RJMP` to a shared multiplication body. Each shared body ends at its page-local tail. The `FB-FD` prefixes share one two-word, 64-entry `MOVW` table after a condition gate; those table entries end at `cmov_tail`.

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

| Secondary | Instruction | Total bytes | Planned cycles |
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

Planned complete latency:

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

Planned complete latency:

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

Planned complete latency:

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

| Secondary | Encoding | Operation | Total bytes | Planned cycles |
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

The final execution intervals and complete planned latencies are:

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

The shared code favors the load path by allowing it to fall through into the postincrement helper. Duplicating the three-word helper could remove two cycles from postincrement paths at a cost of six bytes; the compact shared form is specified.


## 10. `F1`: bounded 2-word table

Bounds: `secondary < 0x90`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `MOV rD,rS` excluding compact/compact | 48 | 34-35 |
| `30-6F` | `STSP8 [SP+u4],cS` | 64 | 34-35 |
| `70-77` | `ZEXT8 rD` | 8 | 34-35 |
| `78-7F` | `SWAP8 rD` | 8 | 34-35 |
| `80-87` | `GETSP rD` | 8 | 34-35 |
| `88-8F` | `SETSP rS` | 8 | 34-35 |

```asm
; MOV rD,rS
movw  dL, srcL
rjmp  f1_tail

; STSP8 [SP+q],cS
std   Y+q, srcL
rjmp  f1_tail

; ZEXT8 rD
clr   dH
rjmp  f1_tail

; SWAP8 rD
swap  dL
rjmp  f1_tail

; GETSP rD
movw  dL, Y
rjmp  f1_tail

; SETSP rS
movw  Y, srcL
rjmp  f1_tail
```

---

## 11. `F2`: bounded 3-word arithmetic table

Bounds: `secondary < 0x60`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-2F` | `ADD rD,rS` excluding compact/compact | 48 | 35-36 |
| `30-5F` | `SUB rD,rS` excluding compact/compact | 48 | 35-36 |

```asm
; ADD rD,rS
add   dL, srcL
adc   dH, srcH
rjmp  f2_tail

; SUB rD,rS
sub   dL, srcL
sbc   dH, srcH
rjmp  f2_tail
```

Full-register `AND`, `OR`, and `XOR` are encoded by the dedicated runtime-decoded `F9` page. The one-byte compact forms use their direct primary encodings.

---

## 12. `F3`: bounded 3-word memory and widening-multiply table

Bounds: `secondary < 0x80`.

| Secondary | Instruction | Entries | Cycles |
|---|---|---:|---:|
| `00-0F` | `ST8 [cA],rS`, noncompact `rS` only | 16 | 35-36 |
| `10-1F` | `MULU8.W cD,cS` | 16 | ~36 |
| `20-2F` | `MULS8.W cD,cS` | 16 | ~36 |
| `30-3F` | `MULSU8.W cD,cS` | 16 | ~36 |
| `40-7F` | `LDSP8U cD,[SP+u4]` | 64 | 35-36 |

```asm
; ST8 [cA],rS
movw  X, aL
st    X, srcL
rjmp  f3_tail

; MULU8.W cD,cS
mul   dL, srcL
movw  dL, r0
rjmp  f3_tail

; MULS8.W cD,cS
muls  dL, srcL
movw  dL, r0
rjmp  f3_tail

; MULSU8.W cD,cS
mulsu dL, srcL
movw  dL, r0
rjmp  f3_tail

; LDSP8U cD,[SP+q]
ldd   dL, Y+q
clr   dH
rjmp  f3_tail
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
rjmp  cluster_b_tail_18_delay_1

; STSP16 [SP+q],cS
std   Y+q,   srcL
std   Y+q+1, srcH
rjmp  cluster_b_tail_18_delay_1

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
rjmp  flags_commit_b_18_delay_2

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
| `00-2F` | `CMP rL,rR` excluding compact/compact | 48 | 35-36 |
| `30-3F` | `LD8U rD,[cA]`, noncompact `rD` only | 16 | 35-36 |
| `40-4F` | `LD16 rD,[cA]`, noncompact `rD` only | 16 | 35-36 |
| `50-5F` | `ST16 [cA],rS`, noncompact `rS` only | 16 | 35-36 |

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
rjmp  f5_tail

; LD16 rD,[cA]
movw  X, aL
ld    dL, X+
ld    dH, X
rjmp  f5_tail

; ST16 [cA],rS
movw  X, aL
st    X+, srcL
st    X, srcH
rjmp  f5_tail
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
rjmp  cluster_b_tail_18_delay_1

; BSWAP16 rD
mov   t0, dL
mov   dL, dH
mov   dH, t0
rjmp  cluster_b_tail_18_delay_2

; TST16 rD
cp    dL, r2
cpc   dH, r2
in    flag_tmp, SREG
rjmp  flags_commit_b_18_delay_1

; MUL8 cD,cS
mul   dL, srcL
mov   dL, r0
clr   dH
rjmp  cluster_b_tail_18_delay_1

; SEXT8 rD
clr   dH
sbrc  dL, 7
dec   dH
rjmp  cluster_b_tail_18_delay_2

; NEG16 rD
neg   dL
adc   dH, r2
neg   dH
rjmp  cluster_b_tail_18_delay_2
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
rjmp  cluster_c_tail_18_delay_1

; SUB32 qD,qS
sub   d0, src0
sbc   d1, src1
sbc   d2, src2
sbc   d3, src3
rjmp  cluster_c_tail_18_delay_1

; LSR32.1 qD
lsr   d3
ror   d2
ror   d1
ror   d0
rjmp  cluster_c_tail_18_delay_1

; ASR32.1 qD
asr   d3
ror   d2
ror   d1
ror   d0
rjmp  cluster_c_tail_18_delay_1

; BOOL rD
or    dL, dH
clr   dH
cpse  dL, r2
mov   dL, r3
rjmp  cluster_c_tail_18_delay_1
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
rjmp  cluster_c_tail_18_delay_1

; Inverted-bit conditions: NE / UGE / SGE
clr   dL
clr   dH
sbis  GPIOR0, flag_bit
mov   dL, r3
rjmp  cluster_c_tail_18_delay_1
```

Skipping the one-word `MOV` costs the same as executing it. `GPIOR0` provides equal-time paths while leaving all four high scratch registers available.

Unsigned `ULE` and `UGT` materialization is canonicalized by swapping compare operands and selecting `UGE` or `ULT`.

---

## 18. `F9`: dedicated runtime-decoded full-register bitwise page

`F9` is a two-byte instruction family with no secondary executable table:

```text
F9 oodddsss
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

### 18.1. Primary-slot entry and 18-cycle secondary cadence

The fixed four-word primary slot contains:

```asm
rjmp  f9_bitop_entry
nop
nop
nop
```

Only the `RJMP` executes. The dedicated entry completes the 24-bit PC increment and starts the speculative following-primary transfer:

```asm
f9_bitop_entry:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    cli
    out   SPDR, r2
    in    secondary, SPDR
    sei
```

The primary-slot `RJMP` costs two cycles, and the five instructions through `OUT` cost another five. The secondary-byte transfer has an exact **18-cycle OUT-to-OUT cadence**.

The `OUT` occurs before the buffered `SPDR` read while interrupts are masked, matching the reverse-order transfer strategy used elsewhere. The following primary byte begins transferring before runtime operand decoding starts.

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

### 18.5. Exact implementation size

| Component | Words | Bytes |
|---|---:|---:|
| Secondary consume, PC update, and speculative restart | 7 | 14 |
| Destination pointer decode | 5 | 10 |
| Source pointer decode | 5 | 10 |
| Operation-state preparation and four operand loads | 5 | 10 |
| Operation dispatch, three ALU paths, shared writeback, and invalid shim | 17 | 34 |
| **Dedicated `F9` handler** | **39** | **78** |

The primary slot is already part of the fixed 2,048-byte primary table and therefore adds no incremental bytes.

### 18.6. Exact planned latencies

The first interval, from fetching the `F9` primary byte to starting the following-primary transfer, is 18 cycles.

From that second `OUT` to the next dispatch `OUT`:

```text
common post-OUT work:
    IN + SEI                           2 cycles
    two register-pointer decoders     10
    operation-state LSR                1
    four register-file loads           8
                                      --
                                      21 cycles
```

Operation-specific completion:

| Operation | Selection, ALU, writeback, final dispatch | Complete instruction |
|---|---:|---:|
| `AND rD,rS` | 15 cycles | **54 cycles** |
| `OR rD,rS` | 16 cycles | **55 cycles** |
| `XOR rD,rS` | 17 cycles | **56 cycles** |

These totals include the final `RJMP` and the `IN`/`OUT` at the head of Cluster A's standard 18-cycle tail.

The runtime-decoded forms cost about 18-21 cycles more than a 35-36-cycle dense specialized form. Compact bitwise operations are one-byte, 17-cycle instructions.

### 18.7. Exact code size

The dedicated `F9` handler occupies 39 AVR words / 78 bytes. It requires no secondary executable table, page stub, bounds check, or additional cadence cluster.

---

## 19. `FA`: bounded 2-word variable-shift forwarding table

Bounds: `secondary < 0x30`.

| Secondary | Instruction | Entries | Estimated cycles |
|---|---|---:|---:|
| `00-0F` | `SHL16V cD,cCount` | 16 | ~43 at count 0; ~46 at 1; ~45 at 8; ~78 at 15 |
| `10-1F` | `LSR16V cD,cCount` | 16 | ~43 at count 0; ~46 at 1; ~45 at 8; ~78 at 15 |
| `20-2F` | `ASR16V cD,cCount` | 16 | ~43 at count 0; ~46 at 1; ~46 at 8; ~79 at 15 |

Within each sixteen-entry family:

```text
bits 3:2  destination cD
bits 1:0  count register cCount
```

The low four bits of `cCount` select a shift count in `0-15`; the count register is preserved. Copying the count before entering the shared body makes `cD == cCount` valid. Architectural condition state is preserved. `t0` must be an upper native scratch register because the bodies use `ANDI`; native `r26` is a suitable choice after the secondary-table address calculation has completed.

Every dense entry is exactly two AVR words and directly specializes both register operands:

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

There are twelve shared bodies: one for each combination of three operations and four destinations. `SHL16V` and `LSR16V` use twelve-word bodies; `ASR16V` uses thirteen words. The complete page-size estimate is:

```text
48 forwarding entries * 2 words * 2 bytes   = 192 bytes
8 SHL/LSR bodies * 12 words * 2 bytes       = 192 bytes
4 ASR bodies * 13 words * 2 bytes            = 104 bytes
                                                ---------
exact page-specific table and bodies            488 bytes
```

The primary slot, one two-word page stub, generic bounds decoder, invalid path, and cluster C cadence tail are accounted for globally in Sections 26 and 34 rather than charged again to `FA`.

```asm
; SHL16V cD,cCount
fa_shl_cD:
    andi  t0, 15
    sbrs  t0, 3
    rjmp  1f
    mov   dH, dL          ; shift left by eight
    clr   dL
    andi  t0, 7
1:
    breq  3f
2:
    lsl   dL
    rol   dH
    dec   t0
    brne  2b
3:
    rjmp  fa_tail

; LSR16V cD,cCount
fa_lsr_cD:
    andi  t0, 15
    sbrs  t0, 3
    rjmp  1f
    mov   dL, dH          ; logical shift right by eight
    clr   dH
    andi  t0, 7
1:
    breq  3f
2:
    lsr   dH
    ror   dL
    dec   t0
    brne  2b
3:
    rjmp  fa_tail

; ASR16V cD,cCount
fa_asr_cD:
    andi  t0, 15
    sbrs  t0, 3
    rjmp  1f
    mov   dL, dH          ; retain the original high byte as low byte
    lsl   dH              ; original sign bit -> C
    sbc   dH, dH          ; 0x00 or 0xFF sign extension
    andi  t0, 7
1:
    breq  3f
2:
    asr   dH
    ror   dL
    dec   t0
    brne  2b
3:
    rjmp  fa_tail
```

The shift-by-eight path reduces counts `8-15` to one byte-transfer sequence plus a loop of at most seven iterations. Counts `0-7` use the ordinary loop. Approximate total instruction latency is:

| Count | `SHL16V` / `LSR16V` | `ASR16V` |
|---:|---:|---:|
| 0 | ~43 | ~43 |
| 1 | ~46 | ~46 |
| 4 | ~61 | ~61 |
| 7 | ~76 | ~76 |
| 8 | ~45 | ~46 |
| 12 | ~63 | ~64 |
| 15 | ~78 | ~79 |

LLVM should select constant shifts independently: use one or more `.1` instructions for small compile-time counts and reserve these forms for genuinely variable counts. `CSET.ULE` and `CSET.UGT` require no encodings; the backend canonicalizes them by swapping compare operands and using `CSET.UGE` or `CSET.ULT`, respectively.

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

The common body consumes the secondary byte, advances the 24-bit program counter, starts speculative fetch of the following primary opcode, validates bit 7, applies the inversion bit, and enters the shared table only when the condition is true. The SPI read/restart sequence is protected against an interrupt occurring between reading `SPDR` and starting the next transfer:

```asm
cmov_gate:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2

    in    saved_sreg, SREG
    cli
    in    secondary, SPDR
    out   SPDR, r2              ; begin fetching the following primary opcode
    out   SREG, saved_sreg

    cpi   secondary, 0x80
    brsh  cmov_invalid

    in    ctest, GPIOR0
    sbrc  secondary, 6            ; bit 6 selects the inverse condition
    com   ctest                    ; skip and execute paths are both two cycles
    and   ctest, cmask
    breq  cmov_no_move

    andi  secondary, 0x3F         ; dddsss operand index
    lsl   secondary               ; two AVR words per shared-table entry
    add   ZL, secondary
    adc   ZH, ZERO
    ijmp

cmov_no_move:
    rjmp  cluster_a_tail

cmov_invalid:
    rjmp  invalid_secondary
```

This sequence is exactly **22 AVR words / 44 bytes**, including the local false and invalid exits. Complementing all bits of `ctest` is safe because `cmask` immediately discards every bit except the selected architectural condition. `SBRC` plus the optional one-word `COM` has equal native timing whether inversion is requested or not.

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

| Path | Expected cycles | Notes |
|---|---:|---|
| Condition false | ~36-38 | Goes directly to `cmov_tail` |
| Condition true | ~40-42 | Indexes the shared table and executes `MOVW` |

The two paths need not be padded to equal time. If deterministic timing is later required, the false path can receive local delay padding without changing the encoding or shared-table layout.
The PC-update and interrupt-mask instructions shown in the gate execute during the secondary-byte transfer window, so making them explicit does not by itself increase the stated `CMOV` latency.

For LLVM `select`, the destination should normally be initialized with the false value and the conditional move should name the true value:

```text
MOV       result,falseValue       ; omitted when coalesced
CMP       lhs,rhs
CMOV.cc   result,trueValue
```

The backend may invert the condition and exchange the true and false values to improve register allocation or eliminate the initializing move.

### 20.5. Code-size estimate

```text
64 shared entries * 2 words * 2 bytes       = 256 bytes
shared 22-word condition gate                =  44 bytes
                                                ---------
exact incremental code outside primary slots = 300 bytes
```

The three primary slots are already included in the fixed 2048-byte primary table. The false path uses cluster A's shared cadence tail and true table entries use cluster C's shared cadence tail, so no page-local tail or placement allowance is charged here.

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

The two-word forwarding entry adds three native cycles (`MOVW` plus `RJMP`). Including secondary fetch, bounds checking, fixed-stride dispatch, and the page tail, estimated total latency is **44-47 cycles**. The latency is independent of operand values and aliasing.

Code-size estimate:

```text
64 forwarding entries * 2 words * 2 bytes   = 256 bytes
8 shared bodies * 8 words * 2 bytes         = 128 bytes
                                                ---------
exact page-specific table and bodies            384 bytes
```

The primary slot, one two-word page stub, generic bounds decoder, invalid path, and cluster C cadence tail are accounted for globally in Sections 26 and 34 rather than charged again to `FE`.

Native `r0:r1`, `X`, and `Z` are interpreter scratch and may be clobbered. No explicit clearing of native `r1` is required because architectural zero is held in the separate permanent `ZERO` register.

---

# Part I-B — Dispatch and Implementation Strategy

## 22. Primary dispatch organization and locality

The primary dispatch table uses a **four-word, eight-byte stride**:

```text
256 * 8 bytes = 2048 bytes
```

The measured region begins at `primary_table`, and `primary_table` is aligned to **256 AVR words / 512 bytes**. Because the table-base word address therefore has a zero low byte, primary dispatch adds only the high byte of the table base after multiplying the opcode by four:

```asm
mul   primary, PRIMARY_SLOT_WORDS     ; PRIMARY_SLOT_WORDS = 4
movw  Z, r0
subi  ZH, -hi8(pm(primary_table))     ; low base byte is known zero
ijmp
```

This saves one AVR word and one native cycle relative to a general unaligned-base `SUBI`/`SBCI` pair. The saved cycle is normally cadence slack rather than a reduction below the 18-cycle external-flash byte cadence. Alignment padding before `primary_table` is outside the measured region by definition.

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

A representative organization is:

```asm
; Primary slot: one of four destination-specialized entries
ldi   ZL, lo8(pm(ldi8_cD_apply))
ldi   ZH, hi8(pm(ldi8_cD_apply))
rjmp  fetch_imm8_then_ijmp
nop

; Shared continuation
fetch_imm8_then_ijmp:
    ; schedule the PC update and interrupt masking while the byte is in flight
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    in    saved_sreg, SREG
    cli
    in    t0, SPDR
    out   SPDR, r2
    out   SREG, saved_sreg
    ijmp

ldi8_cD_apply:
    mov   dL, t0
    clr   dH
    rjmp  cluster_a_tail_18_delay_1
```

`LDI16` uses an analogous two-byte fetch continuation. `ADDI.S8` and `CMPI.S8` share the signed-immediate fetch path but use separate destination-specialized apply stubs. This avoids run-time register decoding while keeping the continuation code bounded.

A realistic continuation footprint is:

| Component | Expected bytes |
|---|---:|
| Shared 8-bit and 16-bit fetch paths | 40-56 |
| Four `LDI8` apply stubs | 24-32 |
| Four `LDI16` apply stubs | 24-32 |
| Four `ADDI.S8` apply stubs | 24-32 |
| Four `CMPI.S8` apply stubs | 24-32 |
| **Total** | **136-184 bytes** |

The planning value is **144 bytes**, with a credible range of 136-184 bytes.

Latency impact:

| Family | Four-word-stride estimate | Change from eight-word slot |
|---|---:|---:|
| `LDI8 cD,imm8` | 34-36 cycles | 0-2 |
| `LDI16 cD,imm16` | 51-54 cycles | 0 |
| `ADDI.S8 cD,simm8` | 35-38 cycles | 0-2 |
| `CMPI.S8 cL,simm8` | 36-38 cycles | 0-2 |

The extra `RJMP`/`IJMP` work is normally hidden by the immediate-byte transfer. Two-byte forms have the tightest window and require assembled timing verification.

The `D0-D7` two-byte branch, `ADJSP`, and `SYS` forms have an operand-transfer window and should not require a systematic latency increase. `E0-E3` have additional transfer slack.

The one-byte indirect-control and return forms are different: `JMPP`, `CALLP`, and `RET` may need a forwarding `RJMP` that cannot be hidden behind an operand fetch. Budget **up to two additional cycles** for these paths unless their first setup work can be placed in the primary slot.

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

The five remaining distinct slot widths share five two-word stubs:

```text
slot widths 1, 2, 3, 4, and 5
```

The physical layout therefore fixes the decoder/stub region at **25 AVR words / 50 bytes**:

```text
5 width-shared stubs * 2 words          = 10 words
interrupt-safe 24-bit-PC decoder        = 14 words
near invalid-secondary RJMP shim        =  1 word
                                             --------
total                                      25 words = 50 bytes
```

The eleven generic direct bounded pages are `F0-F8`, `FA`, and `FE`. `F9` uses its dedicated decoder and `FB-FD` use their separate shared condition gate. The multiplier load and extra `RJMP` occur while the secondary byte is still in flight, so they do not change the documented generic-page latencies.
The 24-bit PC increment and interrupt-mask instructions are scheduled before `SPDR` becomes ready and replace wait padding; they do not add to the post-transfer critical path.

All fifteen secondary prefixes `F0-FE` are active. The generic decoder serves `F0-F8`, `FA`, and `FE`; the dedicated `F9` bitwise handler is placed near the primary table; and `FB-FD` use their shared condition gate. Executable tables and shared bodies are laid out in several `RJMP`-reachable clusters.

### 22.4. Latency impact summary

| Instruction class | Planned latency |
|---|---|
| `00-BF` direct one-byte instructions | Selected 17- or 18-cycle cadence from Sections 5 and 27 |
| `C0-CF` immediate instructions | Approximately 34-54 cycles depending on operand width |
| `D0-D7` branch/`ADJSP`/`SYS` | Operand-transfer and stream-restart dependent |
| `E0-E3` multi-byte direct control | Operand-transfer and stream-restart dependent |
| `E4-EB` `JMPP`/`CALLP` | Control-transfer cost, with up to two forwarding cycles |
| `EF` `RET` | Return-stream restart cost, with up to two forwarding cycles |
| `F0-F8` dense pages | Fast forms use their page cadence; cold pointer forms take ~69-78 cycles |
| `F9` runtime bitwise page | AND ~54, OR ~55, XOR ~56 cycles |
| `FA` variable shifts | Approximately 43-79 cycles |
| `FB-FD` conditional moves | Approximately 36-38 cycles false / 40-42 cycles true |
| `FE MUL16` | Approximately 44-47 cycles |

The primary dispatch multiplier is a two-cycle AVR `MUL`.

---

## 23. Two-byte dense-page pipeline

1. Primary dispatch consumes the prefix opcode and starts fetching the secondary byte.
2. `F0-F8`, `FA`, and `FE` prepare generic-page values and enter the shared bounded decoder; `F9` jumps to its dedicated runtime decoder; `FB-FD` enter the shared condition gate.
3. The selected decoder advances `PC`, consumes the secondary byte, and starts speculative fetch of the following primary opcode.
4. A truncated page performs one upper-bound check.
5. A direct dense page calculates the fixed-stride word address and executes one `IJMP` into the operand-specialized slot. A condition-false `FB-FD` instruction bypasses its shared table.
6. `F1-F8` slots perform the operation and `RJMP` to their assigned cluster continuation. `F9` dynamically decodes both architectural-register pointers, performs the selected bitwise operation, and returns through Cluster A. `FA` slots forward to shared shift bodies, `FB-FD` use the shared conditional-move table, and `FE` slots forward to shared multiplication bodies.
7. The assigned cluster continuation consumes the speculative following primary byte and resumes primary dispatch.

There is no run-time architectural-register decoding for the dense `F1-F8` fast paths, `FA`, `FB-FD`, or `FE`. `F0 69-6D` dynamically decode cold 32-bit or general-pointer operands from `RRSPEC`, and `F9` dynamically decodes two 16-bit register indices from its secondary byte. `FA` and `FE` use forwarding entries, while `FB-FD` share one operand table.

---

## 24. Bounds-check strategy

Use a secondary register in AVR `r16-r31`:

```asm
cpi   secondary, ENTRY_COUNT
brsh  .Linvalid_secondary
```

Valid path:

```text
CPI                  1 cycle
BRSH not taken       1 cycle
                     -------
                     2 cycles
```

Shared code cost:

```text
CP + BRSH in the generic decoder    2 words
adjacent invalid-secondary RJMP     1 word
```

The comparison and invalid shim are emitted once, not once per page. Each page contributes only its preloaded limit and two-word multiplier stub, already included in the 50-byte shared decoder/stub block.

For two- through four-word pages, these two valid-path cycles should replace cadence padding. For larger pages, the check remains worthwhile even if it contributes to a small overrun: omitting the unused table tail saves hundreds or thousands of bytes.

The eleven generic direct pages perform this upper-bound check. `FB-FD` use `secondary < 0x80`; bit 6 selects the inverse condition and bits 5:0 index the shared table. `F9` needs no register-field bounds check because each operand is a three-bit index; operation value `11` traps locally. `FE` uses `secondary < 0x40`. The duplicate compact-register combinations removed from `F1`, `F2`, and `F5` make their valid ranges contiguous, so no internal range test is required.

---

## 25. Fixed-stride address calculation

```text
slotAddressWords = tableBaseWords + secondary * slotWords
```

Every direct bounded page uses one generic multiplier-based decoder. Each page stub loads `slotWords` as an immediate while the secondary byte is still transferring. The decoder advances the full 24-bit VM program counter and protects the `SPDR` handoff:

```asm
bounded_page_decode:
    add   r4, r3
    adc   r5, r2
    adc   r6, r2

    in    saved_sreg, SREG
    cli
    in    secondary, SPDR
    out   SPDR, r2
    out   SREG, saved_sreg

    cp    secondary, page_limit
    brsh  invalid_secondary       ; nearby one-word RJMP shim

    mul   secondary, page_multiplier
    add   ZL, r0
    adc   ZH, r1
    ijmp

invalid_secondary:
    rjmp  trap_entry
```

The low-register-PC decoder is **14 words**, and the nearby invalid shim is one word. Pages with the same slot width share the same two-word multiplier stub. The complete decoder/stub region is exactly **25 words / 50 bytes**.

Using `MUL` for widths 1, 2, and 4 costs no extra visible instruction latency because the decoder runs under the in-flight secondary transfer. It saves more code than maintaining separate shift-based decoders for five slot widths.

## 26. Single-section physical layout and jump relaxation

### 26.1. Measurement origin and alignment

The measured core begins at a 256-word-aligned `primary_table`. Alignment padding before that symbol is outside the reported implementation size. No interior block requires alignment greater than one AVR word.

### 26.2. Planned order and word ranges

The cold general-pointer subsystem is adjacent to the other `F0` bodies. Dense compact-pointer tables and all runtime-decoded subsystems fit in one text section with no interior alignment gaps.

| Order | Block | Start word | End word, exclusive | Words | Bytes |
|---:|---|---:|---:|---:|---:|
| 1 | Four-word primary table | 0 | 1024 | 1024 | 2048 |
| 2 | Generic secondary decoder, invalid shim, and five width-shared stubs | 1024 | 1049 | 25 | 50 |
| 3 | Exact dedicated `F9` runtime bitwise handler | 1049 | 1088 | 39 | 78 |
| 4 | Shared `FB-FD` condition gate | 1088 | 1110 | 22 | 44 |
| 5 | `C0-CF` immediate fetch/apply block | 1110 | 1182 | 72 | 144 |
| 6 | Control transfer and stream-restart block | 1182 | 1562 | 380 | 760 |
| 7 | Trap entry and `SYS` decoder/bridge | 1562 | 1610 | 48 | 96 |
| 8 | Cluster A cadence tails and compact-CMP flag commit | 1610 | 1634 | 24 | 48 |
| 9 | `F0` 110-entry veneer table | 1634 | 1744 | 110 | 220 |
| 10 | `F0` immediate, stack, absolute, and program-space bodies | 1744 | 2496 | 752 | 1504 |
| 11 | Exact shared `F0` cold-32 subsystem | 2496 | 2560 | 64 | 128 |
| 12 | Exact shared `F0` cold general-pointer subsystem | 2560 | 2609 | 49 | 98 |
| 13 | `F1` table | 2609 | 2897 | 288 | 576 |
| 14 | `F2` table | 2897 | 3185 | 288 | 576 |
| 15 | `F3` table | 3185 | 3569 | 384 | 768 |
| 16 | Cluster B cadence tails and `TST8`/`CMP`/`TST16` commits | 3569 | 3594 | 25 | 50 |
| 17 | `F4` table | 3594 | 4146 | 552 | 1104 |
| 18 | `F5` table | 4146 | 4530 | 384 | 768 |
| 19 | `F6` table | 4530 | 4850 | 320 | 640 |
| 20 | `F7` table | 4850 | 5570 | 720 | 1440 |
| 21 | Cluster C 17/18-cycle cadence tails | 5570 | 5593 | 23 | 46 |
| 22 | `F8` table | 5593 | 5833 | 240 | 480 |
| 23 | `FA` forwarding table | 5833 | 5929 | 96 | 192 |
| 24 | Twelve shared `FA` shift bodies | 5929 | 6077 | 148 | 296 |
| 25 | Shared `FB-FD` move table | 6077 | 6205 | 128 | 256 |
| 26 | `FE` forwarding table | 6205 | 6333 | 128 | 256 |
| 27 | Eight shared `FE` multiplication bodies | 6333 | 6397 | 64 | 128 |
|  | **Planning end** |  | **6397** | **6397** | **12,794** |

The `F9`, cold-32, and cold general-pointer subsystems have exact word counts. Four implementation blocks use planning ranges as listed in Section 34.


### 26.3. Exact shared cadence-tail sequences

The actual dispatch schedules remain 17 and 18 cycles.

#### Reverse-order 17-cycle tail

```asm
cluster_tail_17_delay_1:
    nop
cluster_tail_17:
    add   r4, r3
    adc   r5, r2
    cli
    out   SPDR, r2
    in    primary, SPDR
    sei
    adc   r6, r2
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

The tail body is eleven words; the optional one-cycle delay makes the complete reverse region twelve words.

#### Standard 18-cycle tail

```asm
cluster_tail_18_delay_2:
    rjmp  cluster_tail_18
cluster_tail_18_delay_1:
    nop
cluster_tail_18:
    in    primary, SPDR
    out   SPDR, r2
    add   r4, r3
    adc   r5, r2
    adc   r6, r2
    mul   primary, r7
    movw  r30, r0
    subi  r31, hi8(-(pm(primary_table)))
    ijmp
```

The standard tail body is nine words. A one-word `RJMP` provides a two-cycle delay without two `NOP` words.

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

### 26.4. `RJMP` and `RCALL` reach proof

AVR `RJMP` and `RCALL` reach `-2048..+2047` words relative to the instruction following the transfer.

| Edge | Approximate displacement | Margin |
|---|---:|---:|
| Primary `F9` slot to dedicated handler | about `+52` words | over 1,990 words |
| Dedicated `F9` handler to Cluster A | about `+520` words | over 1,520 words |
| Final cold general-pointer body back to Cluster A | about `-975` words | over 1,070 words |
| First `F1` entry to Cluster B | about `+960` words | over 1,080 words |
| Last `F6` entry back to Cluster B | about `-1,255` words | over 790 words |
| First `F7` entry to Cluster C | about `+720` words | over 1,320 words |
| Final `FE` body back to Cluster C | about `-805` words | over 1,235 words |

All static intra-interpreter transfers fit in `RJMP` or `RCALL`. Dynamic table dispatch continues to use `IJMP`.

### 26.5. Conditional-branch relaxation

Short conditional branches inside handlers target local labels or nearby one-word `RJMP` shims. No long conditional-branch expansion is included.

### 26.6. Assembly layout assertions

The implementation should assert every block start and end from Section 26.2, each dense slot width, and every static transfer displacement.

### 26.7. Latency consequences of the physical layout

Pointer class determines instruction selection:

- compact pointer and compact data: one-byte 18-cycle primary form;
- compact pointer and noncompact data: two-byte ~35-38-cycle dense form;
- noncompact pointer: three-byte ~69-78-cycle cold fallback.

No additional cadence tail or dispatch stage is introduced for the fast path.

Two compact array pointers are sufficient for the bubble-sort loop mappings, one compact marking pointer is sufficient for Sieve, and Fibonacci uses no explicit data-space pointer in its recursive body. Performance falls to the cold fallback only when allocator pressure places a hot pointer in a noncompact register.

## 27. Register-allocation implementation audit

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
rjmp  cluster_tail_18_delay_1
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
rjmp  cluster_tail_18_delay_1
```

Conditional branches use `SBIC`/`SBIS` and the structure shown in this specification. `CMOV` performs one `IN` in its shared gate.

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

`BSWAP16`, widening 8-bit multiplies, variable shifts, fast compact-pointer loads/stores, `ADD32`, `SUB32`, and the one-bit 32-bit shifts use the sequences shown in their page definitions. Noncompact pointers use the separately audited `F0` subsystem.

### 27.6. Full family cadence audit

| Page/family | Final or complete latency |
|---|---|
| `F1` one-operation slots | 17-cycle final cadence |
| `F2` ADD/SUB slots | 17-cycle final cadence |
| `F3` compact-pointer ST8, widening multiplies, LDSP8U | 18-cycle final cadence |
| `F4` shifts, NOT, INC, DEC | 17-cycle final cadence |
| `F4` word stack operations, TST8 | 18-cycle final cadence |
| `F5` compact-pointer ordinary memory and CMP | 18-cycle final cadence |
| `F6` compact-pointer ST8+ and unary families | 18-cycle final cadence |
| `F7` compact-pointer LD8+, arithmetic/shift32, BOOL | 18-cycle final cadence |
| `F7` compact-pointer LD16+/ST16+ | 19-cycle final cadence |
| `F8` CSET | 18-cycle final cadence |
| `F9` AND/OR/XOR | 54 / 55 / 56 complete cycles |
| `F0` cold general-pointer ordinary forms | 69-71 complete cycles |
| `F0` cold general-pointer postincrement forms | 75-78 complete cycles |
| `F0` cold ST32/LD32/CMP32 | 79 / 80 / 81 complete cycles |
| `FA` variable shifts | count-dependent |
| `FB-FD` CMOV | condition-path dependent |
| `FE` MUL16 | fixed |

Fast-form cycles are determined by their dense-page cadence. The cold rows are complete three-byte instruction latencies.

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
| `FA` | 48 | 2 | 192 | 1024 | 832 |
| `FB-FD` shared table | 64 | 2 | 256 | 1024 | 768 |
| `FE` | 64 | 2 | 256 | 1024 | 768 |

The compact-pointer dense tables contain only fast forms. The two table-free cold-memory secondaries provide complete register coverage through one 49-word shared handler.

## 30. Control-flow primaries

| Opcode | Instruction | Bytes | Cycles |
|---:|---|---:|---:|
| `D0` | `BREQ rel8` | 2 | 35 NT; ~130 T |
| `D1` | `BRNE rel8` | 2 | 35 NT; ~130 T |
| `D2` | `BRULT rel8` | 2 | 35 NT; ~130 T |
| `D3` | `BRSLT rel8` | 2 | 35 NT; ~130 T |
| `D4` | `JMP rel8` | 2 | ~126 |
| `D5` | `CALL rel8` | 2 | ~140 |
| `D6` | `ADJSP simm8` | 2 | 36-38 |
| `D7` | `SYS service8` | 2 | ~37 plus service |
| `E0` | `JMP16 rel16` | 3 | ~147 |
| `E1` | `CALL16 rel16` | 3 | ~163 |
| `E2` | `JMPF target24` | 4 | ~164 |
| `E3` | `CALLF target24` | 4 | ~181 |
| `E4-E7` | `JMPP qN` | 1 | ~130 |
| `E8-EB` | `CALLP qN` | 1 | ~146 |
| `EF` | `RET` | 1 | ~122 |

All relative displacements are signed and relative to the address immediately following the complete instruction. `JMP16` and `CALL16` retain the active code bank and use their signed 16-bit displacement to select the target within that bank. `JMPF` and `CALLF` carry an explicit 24-bit target and are separate opcodes.

Conditional branches use `SBIC`/`SBIS GPIOR0,bit`. LLVM should invert branches and swap compare operands to make the likely path fall through. `CALLF` uses native `r7` to add four to the low-register 24-bit PC when forming its return address.


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
F9 oodddsss
```

is used only when the result must remain in a noncompact register or when moving through a compact temporary would be slower.

Canonical costs:

```text
AND rD,rS  ~54 cycles
OR  rD,rS  ~55 cycles
XOR rD,rS  ~56 cycles
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

Use `SHL16V`, `LSR16V`, and `ASR16V` for genuinely variable compact-register shifts. For compile-time constants, prefer repeated `.1` operations for small counts and direct byte-manipulation sequences where profitable.

### Conditional selection

Lower register-valued `select` operations to `CMOV` when avoiding a taken branch is profitable. `ULE` and `UGT` use swapped compare operands followed by `UGE` or `ULT`.

### Sixteen-bit multiplication

Use `MUL16 rD,rS` for a general non-widening product and model the destination as tied to the first input. Continue to select shifts and adds for profitable constants and widening 8-bit forms when range analysis permits.

## 32. Estimate scope

Included:

- 256-entry primary dispatch area.
- Shared sequential dispatch and cadence tails.
- Primary handlers.
- Active `F0-FE` prefix handling: generic bounded pages, the dedicated `F9` runtime bitwise handler, shared cadence tails, executable slots, the shared `FA` variable-shift bodies, the shared `FB-FD` conditional-move table and gate, and the shared `FE` multiplication bodies.
- `F0` veneer table, out-of-line bodies, the exact shared cold-32 subsystem, and the exact shared cold general-pointer subsystem.
- Branch/jump/call/return and stream-restart helpers.
- Reserved-instruction traps.
- `SYS` opcode decoder and bridge entry/exit.

Excluded:

- Startup and vectors.
- Interrupt handlers.
- Hardware initialization and service bodies.
- Save-flash routines.
- Debugger implementation beyond trap entry.
- C runtime and compiler helper functions.

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
FA forwarding table                192
shared FB-FD move table             256
FE forwarding table                256
                                  ------
all executable tables            9,324 bytes
```

The active secondary executable tables total 7,276 bytes. `F9` has no executable table. Runtime-decoded `F0` subsystems are accounted for separately.

## 34. Layout-derived implementation-code estimate

### 34.1. Exact or layout-fixed components

| Component | Bytes | Basis |
|---|---:|---|
| Four-word primary table | 2,048 | exact |
| All active secondary executable slots | 7,276 | exact |
| Dedicated `F9` runtime bitwise handler | 78 | exact, 39 words |
| Shared `F0` cold-32 subsystem | 128 | exact, 64 words |
| Shared `F0` cold general-pointer subsystem | 98 | exact, 49 words |
| Twelve shared `FA` shift bodies | 296 | exact |
| Eight shared `FE` multiplication bodies | 128 | exact |
| Shared `FB-FD` condition gate | 44 | exact |
| Generic decoder, invalid shim, and five width-shared stubs | 50 | exact |
| Three cadence clusters and GPIOR0 commit shims | 144 | exact |
| Interior alignment and jump veneers | 0 | proved unnecessary |
| **Layout-fixed subtotal** | **10,290** | — |

### 34.2. Implementation budgets

| Component | Planning bytes | Credible range |
|---|---:|---:|
| `F0` immediate, stack, absolute, and program-space bodies | 1,504 | 1,408-1,664 |
| `C0-CF` immediate fetch/apply block | 144 | 136-184 |
| Control transfer and stream-restart block | 760 | 700-840 |
| Trap entry and `SYS` decoder/bridge | 96 | 80-112 |

### 34.3. Total

```text
  10,290  exact/layout-fixed
+  2,504  budgeted blocks
---------
  12,794 bytes = 12.49 KiB = 6,397 AVR words
```

| Case | Bytes | KiB |
|---|---:|---:|
| Lower | 12,614 | 12.32 |
| Planning | **12,794** | **12.49** |
| Upper | 13,090 | 12.78 |

The 476-byte range comes entirely from the four budgeted blocks.

## 35. Four-word primary-stride rationale

A four-word primary slot keeps the primary table at 2,048 bytes while allowing:

- complete one-byte handlers that end in `RJMP`;
- up to three setup words followed by one forwarding `RJMP`;
- one fixed dispatch multiplier, `r7 = 4`, measured in AVR words.

An eight-word primary table would consume another 2,048 bytes. The immediate continuation block required by the four-word design is budgeted at 144 bytes, so the net code-size advantage is approximately:

```text
2,048 - 144 = 1,904 bytes
```

The four-word design preserves direct `RJMP` reach to nearby continuations and keeps the dispatch calculation to one native `MUL`.

## 36. Estimate uncertainty

These quantities are fixed:

- Primary-table alignment cost is outside the measurement origin.
- Interior table alignment consumes zero bytes.
- The three cadence-tail clusters have exact word counts.
- All static internal transfers fit `RJMP` or `RCALL`.
- Secondary tables and shared arithmetic bodies have exact sizes.
- The `F9`, cold-32, and cold general-pointer subsystems have exact sizes.

The estimate can vary within **12,614-13,090 bytes (12.32-12.78 KiB)** as these four blocks are assembled:

- `F0` immediate, stack, absolute, and program-space bodies.
- `C0-CF` operand-fetch and apply continuations.
- Control-transfer and external-flash restart machinery.
- Trap entry and the `SYS` bridge.

Any block movement requires rerunning the Section 26 reach assertions. The cold-pointer-to-Cluster-A and final-`F6`-to-Cluster-B edges should be asserted explicitly.

## 37. Main validation risks

1. Whether every `00-BF` direct handler assembles to at most four words including its final `RJMP`, especially the exact-fit `CMP`, `LD8U`, `LD16`, and `ST16` families.
2. Exact scheduling of bounds checks on the remaining 1- through 5-word generic pages and verification of the dedicated `F9` 18-cycle secondary cadence.
3. Measured latency and branch layout of the twelve shared `FA` shift bodies, especially the count-0 and shift-by-eight paths.
4. Measured true/false latency and table reach for the shared `FB-FD` conditional-move implementation.
5. Measured latency, alias behavior, and `RJMP` reach for all eight shared `FE` multiplication bodies.
6. Whether multipliers 3, 5, and 6 can always be prepared while the secondary byte transfers.
7. Fast and cold postincrement-load alias reservations, and overlap behavior for all store forms.
8. Exact size of the budgeted `F0` bodies; the 64-word cold-32, 49-word cold-pointer, and 39-word `F9` subsystems are fixed.
9. Assembly-time verification of the exact Section 26 word offsets, especially cold-pointer-to-Cluster-A and last-`F6`-to-Cluster-B reach.
10. Runtime-helper size and calling convention.
11. Confirming the fixed-width `NEG16` sequence and all native flag-dependent or skip-dependent microsequences in assembled tests.

---

## 38. Recommended validation sequence

1. Align `primary_table` to 256 AVR words, define it as the measurement origin, and assert every primary slot is exactly four words.
2. Emit blocks in the exact Section 26 order without interior `.align` padding; add an assertion after every block.
3. Implement a page macro parameterized by base, entry count, and slot words.
4. Prototype every remaining exact-width generic page from one through five words, plus the dedicated table-free `F9` decoder, the two-word `FA` forwarding table, shared two-word `FB-FD` move table, and two-word `FE` forwarding table.
5. Assemble each family sequence shown in this report and assert its word count; specifically verify the four exact-fit direct primary families and measure that the `C0-CF` continuation block fits within 136-184 bytes.
6. Confirm one bounds check and one fixed-stride address calculation per direct dense page; verify that a true `FB-FD` condition performs one `IJMP` into the shared table and a false condition bypasses it.
7. Measure all eight cold general-pointer semantic forms, including ordinary overlap, store overlap, postincrement writeback, every `dddWaaaP` modifier combination, and reserved load aliases; also measure unary, `F9`, cold-32, `FA`, `FB-FD`, and `FE` paths.
8. Verify every primary slot, the dedicated `F9` handler, every veneer and final table slot, both cold `F0` subsystems, and all shared bodies reach their targets with `RJMP`; assert the cold-pointer/Cluster-A and last-`F6`/Cluster-B edges explicitly.
9. Assemble the exact 39-word `F9`, 64-word cold-32, and 49-word cold-pointer subsystems; assert their byte cadences, all documented 54-81-cycle totals, and every `RJMP`/`RCALL` relaxation.
10. Compile a representative Arduboy corpus and collect static and dynamic instruction frequencies.
11. Finalize the map after measured cycles and flash usage agree with this model.
