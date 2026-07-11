# AVM Assembly Interpreter: Remaining Opcode Implementation Strategy

**Baseline:** `interp.asm` and the accompanying AVM architecture draft  
**Scope:** Complete the unimplemented `0xF4`, `0xFD`, `0xFE`, and `0xFF` handlers while preserving the existing streamed-SPI execution model.

---

## 1. Current implementation state

The interpreter already implements the operand-specialized primary families from `0x00` through `0xF3`, the dedicated conditional branches at `0xF5–0xFC`, and the reserved primary slots at `0x50–0x6F`.

The `0xF4` and `0xFD` primary handlers now share the required extension-prefix state: they advance `PC` to the secondary opcode, read it into `r6`, start transferring byte 2, and dispatch through separate 256-entry one-word `RJMP` tables. Architecturally valid entries have named family skeletons, `0xF4:0xBC` reaches the existing `CMPI6` implementation, `0xF4:0xF3` implements `NOP`, and reserved entries reach a distinct common invalid-secondary path. Except for `CMPI6` and `NOP`, the family skeletons still enter the common unimplemented-instruction loop.

The remaining architectural work is:

| Primary opcode | Remaining work |
| --- | --- |
| `0xF4` | Implement the semantics behind the existing family skeletons; `CMPI6` (`0xBC`) and `NOP` (`0xF3`) are complete |
| `0xFD` | Implement the semantics behind the existing memory/program-space family skeletons |
| `0xFE` | `JMPF` and `CALLF` |
| `0xFF` | `RET` |

The `0x50–0x6F` primary range should remain reserved. Its handlers should eventually jump to one common invalid-opcode path rather than permanently spinning in 32 separate local loops, but no architectural operation should be assigned there yet.

## 2. ISA clarifications made during this review

No opcode reassignment was necessary. The updated architecture specification makes the following implementation-relevant behavior explicit:

1. The maximum encoded instruction length is four bytes, not five.
2. `NEG16` and all fixed shifts update `C/Z/N/V/S`. A nonzero variable shift produces the flags of its final one-bit shift, while a zero count preserves both the destination and all AVM flags.
3. Byte shifts and `SWAP8` modify only the low byte and leave the high byte unchanged.
4. Data-space displaced and postincrement address arithmetic wraps at 16 bits.
5. Word data-space operations access their second byte modulo `2^16`.
6. Program-space displacement is a full 24-bit addition, including carry or borrow into the bank byte.
7. A program-space word load may cross a 64 KiB bank boundary; its second byte is at the next 24-bit address.

These are semantic clarifications rather than encoding changes.

---

## 3. Shared infrastructure to implement first

Most of the remaining instructions should be small front ends around common out-of-line helpers. Implementing the shared machinery first prevents every secondary handler from independently solving SPI timing, dynamic register decoding, flags, and control-flow restart.

The secondary-table decode and extension-prefix portions of this infrastructure are complete. The fetch primitives, register decoding, flag helpers, seek/restart helpers, and call-stack helpers below remain to be implemented as their first consumers are added.

### 3.1 Secondary dispatch tables (implemented)

The interpreter now uses one 256-entry table for `0xF4` and one for `0xFD`. Each entry is a one-word `RJMP` to a family handler or to the common invalid-secondary path.

Because each table entry is one AVR word, the secondary opcode is already the word offset; no multiplication is required:

```asm
; r6 = secondary opcode
ldi  ZL, lo8(pm(f4_secondary_table))
ldi  ZH, hi8(pm(f4_secondary_table))
add  ZL, r6
adc  ZH, ZERO
ijmp

f4_secondary_table:
    rjmp f4_not16
    ; ... 255 more one-word entries
```

Benefits:

- Constant-time decode.
- Direct mapping of register-encoded ranges to one shared family routine.
- Reserved values map to a common invalid-opcode routine.
- The primary dispatch stride remains independent of extension complexity.

A 256-entry `RJMP` table occupies 512 bytes. The current family labels alias nearby veneers, keeping all targets within `RJMP` range, and assembler assertions require each table to occupy exactly 256 words. If later handlers move outside `RJMP` range, retain a nearby veneer after the table or use a two-level range decoder. Avoid changing the ISA to accommodate internal-flash layout.

### 3.2 Extension-byte fetch states

At entry to either extension primary handler:

```text
PC   = address of the primary opcode
SPDR = transferring the secondary opcode
```

After the implemented common extension prefix reads the secondary opcode:

```text
PC   = address of the secondary opcode
SPDR = transferring byte 2
```

Byte 2 is either the next primary opcode for a two-byte instruction or the first operand for a longer instruction.

Create three fetch primitives:

```text
READ_AND_PREFETCH_NEXT(dst)
    Read the current byte and launch the following sequential byte.

READ_FINAL_BEFORE_TRANSFER(dst)
    Read the current byte without launching another sequential byte.
    Use for unconditional jumps, calls, returns, and program-space loads.

DISPATCH_PREFETCHED()
    Dispatch when the next primary opcode is already transferring or complete
    and PC names the final byte of the current instruction.
```

Every helper must maintain the invariant that normal fallthrough advances PC exactly once per encoded byte. Do not duplicate ad hoc `ADIW` placement across every instruction family.

The existing fixed-delay SPI approach may be retained. For development builds, add an optional assertion that `SPIF` is set before each `IN SPDR`; this catches incorrect cycle accounting without changing release timing.

### 3.3 RRSPEC decode

For:

```text
bit 7     reserved
bits 6:4  destination
bit 3     reserved
bits 2:0  source/address
```

use a common decoder that returns native data-space addresses for the low bytes of the two AVM registers:

```asm
; r5 = RRSPEC

; X -> source/address low byte
mov  r26, r5
andi r26, 0x07
lsl  r26
subi r26, -8
clr  r27

; Z -> destination low byte
mov  r30, r5
swap r30
andi r30, 0x07
lsl  r30
subi r30, -8
clr  r31
```

A diagnostic build should reject nonzero bits 7 or 3 before performing the operation.

Always stage source values and effective addresses before writing a destination. This automatically handles legal aliases such as `LD16 rD,[rD]`, `ADD rD,rD`, and `ST8_POST [rA]+,rA`.

### 3.4 Dynamic register access helpers

Useful common helpers are:

```text
LOAD_GPR16_X_TO_r4r5
STORE_r4r5_TO_GPR16_Z
LOAD_GPR8_X_TO_r4
STORE_r4_TO_GPR8_Z_AND_CLEAR_HIGH
```

Keep architectural register values in scratch until all input operands have been captured. Native `r4:r5` and `r0:r1` are suitable scratch pairs because AVM registers reside in native `r8–r23`.

### 3.5 Flag helpers

Do not write `VM_FLAGS` directly to native `SREG`. AVM bits 5–7 are architecturally reserved, while native `SREG` bits 5–7 include `H`, `T`, and interrupt enable. A direct write could accidentally disable interrupts.

Implement selective merge helpers:

- Restore native `C` before an operation that consumes carry.
- Restore native `C` and `Z` before `ADC`, `SBC`, or `CPC16` to preserve cumulative-zero behavior.
- Merge old AVM `C` into the result of logical operations.
- Merge old AVM `N/V/S` with native `MUL`'s new `Z/C` result.
- Commit the complete arithmetic flags produced by `NEG16`.
- For right shifts of a 16-bit word, preserve the final shifted-out bit, test the complete result, and synthesize `V = N xor C` and `S = N xor V`.
- For zero-count variable shifts, bypass all native flag-producing work and retain `VM_FLAGS` unchanged.

A safe carry-and-zero restore pattern is:

```asm
in   r26, SREG
andi r26, ~(_BV(SREG_C) | _BV(SREG_Z))
mov  r27, VM_FLAGS
andi r27,  (_BV(SREG_C) | _BV(SREG_Z))
or   r26, r27
out  SREG, r26
```

For 16-bit logical result flags, reuse the approach already used by `TST16`:

```asm
bst  VM_FLAGS, SREG_C
cp   resultL, ZERO
cpc  resultH, ZERO
in   VM_FLAGS, SREG
bld  VM_FLAGS, SREG_C
```

### 3.6 Control-flow helpers

Implement these common operations:

```text
PUSH_RETURN_ADDRESS(nextCB, nextPC)
    st -Y, bank
    st -Y, high
    st -Y, low

SEEK_AND_DISPATCH_CURRENT_PC()
    Restart external-flash streaming at CB:PC and enter the target handler
    without incrementing PC.

INSTALL_NEAR_TARGET(targetPC)
    Preserve CB and install PC.

INSTALL_FAR_TARGET(targetBank, targetPC)
    Install both CB and PC.
```

Calls should compute and push the complete return address before changing `CB` or `PC`.

### 3.7 Invalid opcode path

Replace permanent local self-loops with one common routine. A diagnostic build should report the primary opcode, secondary opcode if applicable, and logical `CB:PC`. A release build may invoke an assertion/fault `SYS` service or stop execution according to system-ABI policy.

---

## 4. Recommended implementation order

### Phase 1 — Two-byte `0xF4` operations

Implement operations that require no extra operand beyond the secondary opcode:

- Unary operations `0x00–0x5F`.
- Indirect jumps/calls `0xC0–0xDF`.
- `MTPB` and `MFPB` `0xE0–0xEF`.
- `NOP` `0xF3` (implemented).

The secondary jump-table structure is already build-validated. This phase validates the two-byte fallthrough behavior and replaces the corresponding family skeletons with working handlers.

### Phase 2 — RRSPEC ALU operations

Implement:

- Binary ALU `0x60–0x6D`.
- Full-register `MOV/ADD/SUB/CMP16` at `0xB8–0xBB`.

This validates dynamic register decode, alias handling, and architectural flags.

### Phase 3 — Immediate ALU and relocated core operations

Implement:

- Immediate families `0x70–0xB7`.
- Preserve the completed `CMPI6` table integration at `0xBC` while adding the other immediate and relocated-core handlers.
- `ADJSP` `0xBF`.
- Compact stack-relative operations `0xF9–0xFA`.

This phase validates three- and four-byte fallthrough instructions.

### Phase 4 — Control and system operations

Implement:

- `JMP rel8` `0xBD`.
- `CALL rel8` `0xBE`.
- `JMPR/CALLR/JMPP/CALLP`.
- `LDPBI` `0xF0`.
- `JMP16/CALL16` `0xF1–0xF2`.
- `SYS` `0xF4`.

This phase validates return-address generation and stream restart.

### Phase 5 — Data-space memory extension

Implement `0xFD` secondary groups:

- Generic indirect and postincrement `0x00–0x0C`.
- Extended stack-relative `0x10–0x2F`.
- Direct data-space `0x30–0x4F`.

This phase should be complete before program-space loads because it exercises the same extension fetch and register machinery without changing the external-flash stream.

### Phase 6 — Program-space loads

Implement `0xFD 0x80–0x83` with a common 24-bit logical-address helper and a generalized physical-flash seek routine.

### Phase 7 — Far transfer and return

Implement:

- `0xFE` `JMPF/CALLF`.
- `0xFF` `RET`.

These are conceptually simple after the shared call-stack and seek helpers exist.

---

## 5. `0xF4` family implementation details

### 5.1 Unary operations `0x00–0x5F`

All unary handlers derive `rN` from `secondary & 7`, load the value to scratch, operate, and store it back.

| Family | Suggested native sequence | AVM flags |
| --- | --- | --- |
| `NOT16` | `com low; com high` | Recompute `Z/N/V/S`; preserve `C` |
| `NEG16` | Clear a scratch word, then `sub`/`sbc` the staged operand | Commit the resulting 16-bit subtraction flags |
| `LSL16` | `lsl low; rol high` | Commit the final native flags; cumulative `Z` describes the whole word |
| `LSR16` | `lsr high; ror low` | Reconstruct whole-word `Z/N`; retain final `C`; synthesize `V/S` |
| `ASR16` | `asr high; ror low` | Reconstruct whole-word `Z/N`; retain final `C`; synthesize `V/S` |
| `LSR8` | `lsr low` | Commit native byte-shift flags; high unchanged |
| `ASR8` | `asr low` | Commit native byte-shift flags; high unchanged |
| `ZEXT8` | `clr high` | Preserve |
| `SEXT8` | Copy bit 7 into all high-byte bits | Preserve |
| `SWAP8` | `swap low` | Preserve; high unchanged |
| `GETSP` | Store `Y` into selected AVM register | Preserve |
| `SETSP` | Load selected AVM register into `Y` | Preserve |

For `NOT16`, do not use the flags from the second `COM` directly; they describe only the high byte. Test the complete 16-bit result and merge the old carry.

For `NEG16`, a low-byte `SUB` followed by a high-byte `SBC` naturally produces the required whole-word carry/borrow, cumulative zero, sign, overflow, and signed-result flags when the result scratch word begins at zero.

For `LSL16`, AVR `ROL` is an `ADC`-style operation, so the final high-byte step retains the low-byte zero result cumulatively and directly produces the specified 16-bit flags.

For `LSR16` and `ASR16`, the final `ROR low` leaves native `C` equal to the last bit shifted out, but its native `Z/N/V/S` describe only the low-byte operation. Save that carry, test the complete final word to obtain `Z` and the bit-15 `N`, then synthesize:

```text
V = N xor C
S = N xor V
```

The native flags produced directly by `LSR8` and `ASR8` already match the specified low-byte flag semantics.

### 5.2 Binary ALU `0x60–0x6D`

Capture both operands before storing the result.

#### Logical operations

`AND`, `OR`, `XOR`, and `BIC` should operate on staged words and then use the common 16-bit logical flag helper. For `BIC`, complement the staged source, not the architectural source.

#### `ADC`, `SBC`, and `CPC16`

Restore native `C/Z` from `VM_FLAGS` immediately before the low-byte operation. Decode and operand staging must occur before that restore because those instructions modify native flags.

#### `CMP8`

Compare only the staged low bytes and commit native flags directly.

#### Multiplication

- `MULU8`: stage both low bytes, use `MUL`, and store `r1:r0`.
- `MULS8`: stage operands into native high registers and use `MULS`.
- `MULSU8`: avoid relying on AVR's restricted `MULSU` register set for arbitrary AVM registers. A general implementation can perform unsigned `MUL` and, when the signed operand is negative, subtract the unsigned operand from the product high byte.

After the final product is formed, derive `Z` from the complete 16-bit product and derive `C` from product bit 15, then merge those bits with the old AVM `N/V/S`. This is required for the software-corrected `MULSU8` path and is a useful uniform implementation for all three multiply variants.

#### Variable shifts

Stage the destination word and `low4(source)` before writing anything. Test the captured count before performing any shift or count update:

- `count == 0`: store no new destination value and leave `VM_FLAGS` unchanged.
- `count != 0`: apply the corresponding one-bit shift exactly `count` times and commit the flags from the final shift step.

Counts are only 0–15, so a counted loop is acceptable initially. Do not let loop-counter maintenance overwrite the final shift flags. Two workable approaches are:

1. Structure the loop so the count test occurs before the final shift, leaving the last shift's native flags intact.
2. Save the final shifted-out carry immediately after the last shift and reconstruct flags from the final result.

For `SHL16V`, a final `lsl low; rol high` can be committed directly when its flags remain intact. For `LSR16V` and `ASR16V`, use the same whole-word flag reconstruction as the fixed right shifts: preserve the final `C`, derive `Z/N` from the complete word, and synthesize `V/S`.

### 5.3 Immediate operations `0x70–0xB7`

The low three secondary-opcode bits select the destination register.

- Fetch 8-bit immediates into one scratch byte.
- Fetch 16-bit immediates little-endian into a scratch pair.
- Stage the destination before the final arithmetic operation.
- `LDI8` clears the destination high byte.
- `ADDI16`, `SUBI16`, and comparisons commit normal arithmetic flags.
- Immediate logical operations recompute whole-word logical flags while preserving carry.

### 5.4 Full-register operations `0xB8–0xBB`

Use the same RRSPEC and ALU helpers as `0x60–0x6D`:

- `MOV` preserves flags.
- `ADD` and `SUB` start a fresh 16-bit arithmetic flag chain.
- `CMP16` performs `CP/CPC` on staged operands.

Do not special-case compact operands in the interpreter. Compact compression belongs to the assembler/linker/backend.

### 5.5 Relocated `CMPI6`, jump, call, and stack adjustment

- The existing `CMPI6` decode is now routed through the common F4 secondary table; preserve that path and its SPI cadence as adjacent handlers are implemented.
- `JMP rel8` reads the signed displacement as the final sequential byte, computes `nextPC + displacement`, and seeks without launching a fallthrough fetch.
- `CALL rel8` computes the same target, pushes `CB:nextPC`, then seeks.
- `ADJSP` performs 16-bit signed addition to `Y` and preserves AVM flags.

### 5.6 Compact stack-relative operations

Decode:

```text
width = operand bit 7
cN    = operand bits 6:5
u5    = operand bits 4:0
```

Use `Y` as the original SP and form the effective address in `X` or `Z`. Do not modify `Y`. Stage store values before address arithmetic.

### 5.7 Indirect control flow

For the selected register:

- `JMPR`: `PC = rN`, preserve `CB`.
- `CALLR`: push return, then `PC = rN`.
- `JMPP`: `CB = PB`, `PC = rN`.
- `CALLP`: push return, then install `PB:rN`.

The secondary opcode itself is the last encoded byte, so `nextPC` is one byte after the secondary opcode.

### 5.8 Program-bank operations

- `MTPB`: load selected register low byte and write `VM_PB`.
- `MFPB`: read `VM_PB`, write it to the selected register low byte, and clear the high byte.
- `LDPBI`: fetch the immediate and write `VM_PB`.

All preserve flags.

### 5.9 `JMP16`, `CALL16`, `NOP`, and `SYS`

- `JMP16/CALL16` read a little-endian target PC and retain the current bank.
- `NOP` uses the already-prefetched next primary opcode (implemented with the normal reverse-dispatch cadence).
- `SYS` should initially dispatch through a 256-entry service table or a bounds-checked pointer table. Unsupported services go to the common fault path.

A native ABI bridge must preserve every AVM register that the native ABI can clobber, restore `ZERO`, restore the configured dispatch multiplier in `r7`, and restart the instruction stream if the service used SPI.

---

## 6. `0xFD` memory extension implementation details

### 6.1 Generic indirect operations `0x00–0x0C`

For every RRSPEC form:

1. Validate and decode RRSPEC.
2. Capture the address register and source value before any destination write.
3. Apply displacement or postincrement in scratch.
4. Perform the memory access through `X` or `Z`.
5. Commit the updated address and/or loaded destination.

Specific overlap rules:

- Plain loads permit `rD == rA` because the address is captured first.
- Postincrement loads require `rD != rA` as specified.
- Stores permit source/address overlap; capture the store value first.

Use 16-bit wrapping address arithmetic. Word accesses naturally wrap from `0xFFFF` to `0x0000` when implemented with pointer postincrement.

### 6.2 Extended stack-relative operations `0x10–0x2F`

The register is `secondary & 7`. Fetch the unsigned offset, copy `Y` to an address scratch pair, add the offset, and load/store without modifying `Y`.

### 6.3 Direct data-space operations `0x30–0x4F`

The register is `secondary & 7`. Fetch `addr16` little-endian and use it directly as `X` or `Z`.

Do not optimize I/O addresses into `IN/OUT` or `LDS/STS` in the first implementation. Uniform indirect access is simpler and correctly permits the entire 16-bit data address space. Address-specific fast paths can be added after profiling without changing the ISA.

### 6.4 Program-space loads `0x80–0x83`

Create a helper that accepts a logical 24-bit address and byte count:

```text
PROGRAM_READ(logicalBank, logicalWord, size)
```

The helper must:

1. Capture `PB:rA` before writing `rD`.
2. Apply the signed displacement as a full 24-bit addition when present.
3. Add the physical image base.
4. Start a flash read at the resulting physical address.
5. Read one or two data bytes.
6. Restart sequential bytecode fetch at `CB:nextPC`.
7. Commit the loaded result and dispatch the prefetched next opcode.

Do not reuse a helper that assumes the physical image base is page-aligned unless the image format is separately changed to require that alignment. The current architecture permits a general 24-bit image base.

For `LDP16`, allow the second byte to cross a program bank or physical-flash page boundary. The flash stream already handles the physical increment; only logical-address validation must account for the crossing.

---

## 7. `0xFE` direct far transfer

At handler entry, `T0` is in flight. Read:

```text
T0 = target low seven bits plus link bit
T1 = target bits 15:8
T2 = target bits 23:16
```

Do not launch a speculative fallthrough fetch after reading `T2`, because both encodings transfer control.

Decode:

```text
link   = T0 & 1
target = T2:T1:(T0 & 0xFE)
nextPC = original PC + 4
```

For `CALLF`, push `CB:nextPC` before installing the target. Then install `CB:PC = target` and use the common seek-and-dispatch helper.

A diagnostic build should verify that the decoded target is even and lies within the image.

---

## 8. `0xFF` return

`RET` has no operand bytes. At handler entry, the byte after `RET` has already been speculatively requested; discard it.

Pop in this order:

```asm
ld   targetLow,  Y+
ld   targetHigh, Y+
ld   targetBank, Y+
```

Install the target and restart the stream. Flags and PB are unchanged.

A diagnostic build should check that three bytes are available in the VM stack before reading them.

---

## 9. Testing strategy

### 9.1 Reference model

Create a small host-side semantic model for each instruction. It need not model SPI timing; it should model:

- Registers.
- FLAGS.
- PB, CB, PC, and SP.
- 16-bit data space.
- 24-bit program space.
- Call-stack byte order.

Run identical generated instruction cases against the model and the AVR interpreter in a simulator.

### 9.2 Alias matrix

For every two-register instruction, test all 64 `rD/rS` combinations. For memory operations, additionally test:

- Destination equals address.
- Source equals address.
- Adjacent native register-file addresses.
- Address wrap at `0xFFFF`.

### 9.3 Flags

Exhaustively test all 256×256 input combinations for byte compares and multiplies. For 16-bit arithmetic, use boundary-focused vectors:

```text
0x0000, 0x0001, 0x007F, 0x0080,
0x00FF, 0x0100, 0x7FFF, 0x8000,
0xFFFE, 0xFFFF
```

Include incoming `C/Z` combinations for `ADC`, `SBC`, and `CPC16`.

For negation and shifts, include:

- `NEG16` inputs `0x0000`, `0x0001`, `0x7FFF`, `0x8000`, and `0xFFFF`.
- Fixed 16-bit shifts at values with bits 15 and 0 independently set.
- Exhaustive low-byte inputs for `LSR8` and `ASR8`, with representative unchanged high bytes.
- Variable counts `0`, `1`, `7`, `8`, and `15` for each variable shift.
- Every initial AVM flag pattern for count-zero variable shifts, verifying exact flag preservation.
- For nonzero variable shifts, comparison against repeated application of the corresponding fixed-shift reference operation.

### 9.4 Addressing

Test:

- Positive and negative displaced addresses.
- Data-space wrap in both directions.
- Program displacement crossing a 64 KiB bank boundary.
- Program word load at `xx:FFFF`.
- Direct access to SRAM, framebuffer, low I/O, and interpreter-reserved addresses in a controlled test build.

### 9.5 Control flow

Test every call type followed by `RET`, including:

- Near forward/backward calls.
- Same-bank indirect calls.
- Far calls with PB.
- Direct far calls.
- Nested calls across banks.
- Stack pointer and return-byte order after each operation.

### 9.6 Fetch-state assertions

For every instruction length and path, verify:

```text
fallthrough PC = original PC + encoded length
taken target   = nextPC-relative or absolute target as specified
SPDR state     = next opcode in flight/completed on fallthrough
```

Test both taken and not-taken branches and every always-taken control transfer.

### 9.7 Build-time size checks

Emit assembler errors when:

- A primary handler crosses the configured next-slot origin.
- A secondary `RJMP` entry cannot reach its veneer/family handler.
- A table has other than 256 entries.
- Reserved primary slots accidentally receive non-reserved implementations.

---

## 10. Completion criteria

The remaining interpreter is complete when:

1. Every non-reserved `0xF4` and `0xFD` secondary opcode has a handler.
2. `0xFE` and `0xFF` pass nested cross-bank call/return tests.
3. Every reserved primary and secondary opcode reaches the common invalid path.
4. All legal operand aliases match the semantic model.
5. AVM flags match the specification without modifying native interrupt state accidentally.
6. Every instruction path maintains correct PC and streamed-SPI state.
7. The primary table builds successfully at more than one configured dispatch stride.
8. LLVM-generated smoke tests execute correctly before cycle-level optimization begins.

The recommended optimization order after correctness is:

1. Remove unnecessary operand staging in non-aliasing specialized cases.
2. Fill SPI transfer latency with decode and arithmetic work.
3. Specialize common extension subranges if profiles justify it.
4. Reconsider the reserved `0x50–0x6F` primary range only with dynamic LLVM workload data.
