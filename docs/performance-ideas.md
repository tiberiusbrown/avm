# AVM performance optimization ideas

**Status:** working record of proposed and evaluated ISA and interpreter optimizations. Nothing here is part of the ISA in [arch.md](arch.md), and no entry has been adopted unless it says so. Figures were measured on 2026-11-24 against repository revision `1ac7640`, from scratch prototypes and instruction traces, not from the committed interpreter; Section 7 was measured on 2026-11-25; its "before" figures are `ce20048`.

## 1. Evidence levels

- **Prototyped:** built in a scratch copy of the interpreter and measured on the emulator.
- **Trace estimate:** computed from instruction traces and the cost model in Section 2; no prototype.
- **Rejected:** measured or reasoned to be not worth its cost.

## 2. Cost model and profile summary

- Guest code streams from the external flash over SPI, so an instruction costs about 17.5 cycles per encoded byte plus small decode extras ([interpreter guide, Section 5](isa_interpreter_implementation.md#5-timing-model)).
- A taken branch, jump, call or return restarts the stream and costs about 97 cycles more than its not-taken or one-byte cost (`BREQ8`: 132 taken, 35 not taken when these figures were measured; the 2026-11 timing pass made it 118 and 34, and a `RET` or `JMPP` 110 instead of 114).
- Audio interrupts took 19.8% of busy cycles in exploration, so a saving in non-interrupt cycles counts about 1.25 times in observed cycles.
- avm_rpg exploration replay (398 frames; busy cycles 88.1 M of 128 M, excluding the vsync wait): `sys draw_overwrite` 21%, `sys display` 10.5%, taken control transfers 12.7%, 4-byte absolute `ldm`/`stm` 6.5%, `ldsp16`/`stsp16` 5.8%.

## 3. Index of ideas

| Idea | Gain | Interpreter cost | Evidence | Status |
|---|---|---:|---|---|
| [`CALLT [qN]`](#4-callt-fused-table-call) fused `ldp24` + `callp` | 0.62% of exploration (patched sites; about 0.74% if all) | +12 B | Prototyped | Shelved; opcodes in [Section 5](#5-primary-opcode-inventory) |
| 1-byte `LDSP16`/`STSP16 [sp+{0,2,4,6}]` on `r4-r7` | about 1.5% of exploration; 3.3% of benchmark cycles | about 0 (reuses 32 slots) | Trace estimate | Waiting on opcode supply ([Section 5.2](#52-demand-and-allocation-options)) |
| `SYS draw_tilemap` batch tile blit | 8.3% of exploration, pixel-identical | +176 B | Prototyped | Declined: cannot draw from the flash window or program memory without substantial added code; [Section 7.4](#74-batch-services-and-the-flash-window) proposes a window-capable form at about 9% on top of the sprite fast path |
| [Interior aligned sprite fast path](#73-renderer-changes) | 2.18% of exploration | +248 B | Prototyped | Adopted 2026-11-25 |
| [Tile copy cache](#74-batch-services-and-the-flash-window) inside a batch tile service | about 1.9% of exploration | about +110 B | Trace estimate | Not started |
| `ENTER`/`LEAVE` (push or pop `r0-r3` with `adjsp`, `ret`) | about 1.1% | about 100 B | Trace estimate | Not started |
| 3-byte paged absolute `LDM`/`STM` (page in the secondary byte, upper registers) | about 1.4% | about 170 B | Trace estimate | Not started |
| `TST8` + `BR8` fusion | about 0.5% | about 130 B | Trace estimate | Not started |
| Short forward skip instead of a stream re-seek | at most 0.05 M cycles | small | Rejected | Taken forward branches are mostly over 16 bytes |
| `MUL` or swap shifts in the `FA` page | about 0.3 M cycles | about 190 B | Rejected | Decode overhead dominates |
| Wider compare-and-branch fusion | under 1% | at least 1 KB | Rejected | |
| Display loop at a 17-cycle byte cadence | at most 0.5 M cycles | about 0 | Unvalidated | Needs OLED timing validation |

Interpreter flash is the shared constraint. After the 2026-11 interpreter timing pass ([interpreter guide, Section 5](isa_interpreter_implementation.md#5-timing-model)) the interpreter is 28,104 of 29,696 bytes, so 1,592 bytes are free for all ISA work combined (the figures in this document were measured when 364 were free; the pass cost four bytes net, and the later size trades of rare instructions, the float formatter, and cold startup and text code freed 1,332 more, and the sprite fast path with its delay re-encoding then used 100).

## 4. `CALLT`: fused table call

**Status:** shelved proposal. No encoding is reserved, and no interpreter, assembler, compiler or test has been changed. Sections 4.1-4.7 describe the instruction; Section 5 inventories the primary opcodes that could host it, which other proposals also want.

### 4.1. Motivation

A call through a table of function pointers in program memory compiles to `ldp24` followed by `callp`, after index arithmetic. In avm_rpg the chunk handlers (`AreaTable<A, STAGE>::functions[]`, `src/chunk_dispatch.cpp`) are dispatched like this:

```text
xor r5,r5 ; mov r6,r4 ; mov r7,r5          ; widen the index
add32 q3,q3 ; add32 q3,q2 ; add32 q3,q1    ; q3 = &functions[index]
ldp24 q2,[q3]
callp q2
```

C++ virtual calls through a vtable in flash use the same pair (`ldp24` + `callp`, or `ldp24` + `jmpp` for a tail call). `LDP24` reads the entry in one flash transaction and then restarts the instruction stream at the next instruction; `CALLP` abandons that stream and seeks again, to the target. The fused instruction reads the entry and goes straight to the target.

Adjacent pairs whose call register is the load destination (dynamic counts exclude the vsync wait):

| Corpus | `ldp24`+`callp` | `ldp24`+`jmpp` |
|---|---:|---:|
| avm_rpg exploration replay (398 frames); 25 + 2 static sites in `rpg.elf` | 2,978 (7.5 per frame) | 0 |
| avm_rpg device suite (11 scenarios, 82.7 M instructions) | 22,379 | 1,192 |
| 410 compiled benchmarks (11.1 M instructions) | 0 (820 static sites in startup/runtime code) | 0 |

### 4.2. Definition (proposed)

`callt [qN]` is one byte with four opcodes, one per pair, like `JMPP` (`E4-E7`) and `CALLP` (`E8-EB`). The recommended opcodes are in Section 5.2.

```text
nextPC = PC + 1
entry  = qN[23:0]                          ; qN[31:24] ignored, as for LDP24 and CALLP
target = mem24le_P[entry]                  ; three program-space bytes, little endian
SP     = SP - 3 ; mem24le[SP] = nextPC     ; same stack layout and overflow trap as CALLP
PC     = target
```

- It is equivalent to `ldp24 qT,[qN]` followed by `callp qT`, except that `qT` is not written.
- `qN`, every other general register, and `CC` are preserved.
- The table read follows the `LDP24` address rules. The target is not validated, exactly as `CALLP` does not validate its operand.
- The frame is identical to a `CALLP` frame, so unwinding, exception handling, the debugger and the profiler need no change.
- **Compiler contract:** fuse an adjacent `ldp24 qT,[qA]` + `callp qT` only if `qT` is dead after the call. That is automatic for `q2` and `q3` (`r4-r7` are caller-saved). For `q0` and `q1` (callee-saved) it needs a liveness check.

### 4.3. Reference interpreter implementation

Four primary slots, shaped like the `CALLP` slots, plus one 14-byte shared body. The listing is as prototyped; the prototype's opcode choice is discussed in Section 5.1.

```asm
.macro emit_primary_callt label, ptr16, ptr23_16
\label:
    movw  r24, \ptr16            ; r26:r25:r24 = table-entry address (image-relative)
    mov   r26, \ptr23_16
    ldi   r30, 24                ; Z = register-file address of r24: the read's destination
    rjmp  callt_body
    assert_primary_slot_width \label
.endm
emit_primary_callt primary_xx_q0, VM_R0, VM_R1L      ; one slot per pair
emit_primary_callt primary_xx_q1, VM_R2, VM_R3L
emit_primary_callt primary_xx_q2, VM_R4, VM_R5L
emit_primary_callt primary_xx_q3, VM_R6, VM_R7L

; Placed before stack_overflow_indirect, ahead of CALLP's push/seek tail.
callt_body:
    mov   r31, ZERO
    mov   r0, FOUR
    dec   r0                            ; count = 3
    mov   r1, ZERO
    rcall fx_read_program_bytes_func    ; one SFC_READ transaction; returns with FX deselected
    add   VM_PCL, ONE                   ; return address = opcode + 1
    rjmp  push_pc_seek_and_dispatch_func  ; CALLP's tail: push, install r26:r25:r24, seek
```

Why it works:

- **The read lands where `CALLP` expects its target.** The program-space reader stores its data bytes at Z. With Z = 24 they land in `r24`, `r25`, `r26`, exactly `CALLP`'s input registers. The reader sends the three address bytes before the first data byte arrives, so the source and destination can share those registers.
- **The PC carry must come after the read.** The reader clobbers native carry, so the slot cannot do the `add VM_PCL,ONE` that `CALLP`'s slot does. The shared tail then supplies the `adc` pair.
- **SPI timing.** The primary slot is entered with the next byte's transfer already running. The reader's first `SPDR` write must be at least 17 cycles after that transfer began; in this path it is about 26.
- **Reuse.** The stack-overflow check and pending-audio-tick handling in the push/seek tail apply unchanged. There is no new SRAM and no change to existing code.

**Size:** body 14 B (seven instructions); the interpreter image grows 29,332 → 29,344 bytes (+12 B). That leaves 352 of the 29,696-byte limit when 364 bytes were free; 1,592 are free after the 2026-11 timing, size and sprite passes, so flash remains the binding budget for every ISA proposal. Inserting the body moves later code by seven words, within the eight-word allowance in [guide Section 26.4](isa_interpreter_implementation.md#264-static-transfer-reach-considerations).

### 4.4. Measurements

| Measurement | Result |
|---|---|
| Microbenchmark: 400 table calls, 4 targets, interrupts suppressed | 708,409 → 638,409 cycles: **175 cycles saved per call** |
| Per-call cost | `ldp24` 321 + `callp` 119 (reference table) → about 265 |
| Call sequence | each target called exactly 100 times in both builds |
| avm_rpg exploration replay, 3 chunk-dispatch sites patched, interrupts on | busy cycles 88.10 M → 87.56 M (**-0.62%**); mean frame 220,682 → 219,322 |
| Framebuffer | 398 of 398 frame hashes identical to the unmodified build |

The 0.62% covers only the patched sites. Converting every fusable site is estimated at about 0.74% (2,978 × 175 cycles, scaled by 1.247 for interrupt time).

### 4.5. Variants (unbuilt, estimates only)

- **`jmpt [qN]`** replaces `ldp24` + `jmpp` for tail calls (2 static sites in `rpg.elf`, 1,192 dynamic in the device suite). The body is the same read, then `movw VM_PCL,r24 ; mov VM_PCH,r26 ; rjmp seek_and_dispatch_func`. Estimated +16 B and four more opcodes.
- **Indexed `callt qB, rI`** is a two-byte form (opcode plus an operand byte: bits 1:0 = base pair, bits 4:2 = index register) that computes `qB + 3*rI` in the interpreter. It would replace the compiler's `xor/mov/mov + 3 × add32` sequence, about 165 cycles at all 25 sites. The operand would use the existing one-byte fetch helper (`fetch_simm8_then_ijmp`) and decode the registers through the register-file-as-memory trick the `F0` forms use. Estimated +50 B, one opcode, and about 290 cycles saved per call in the game. It is a second step, not a replacement for the plain form.

### 4.6. Toolchain and repository work required

| Area | Location |
|---|---|
| Instruction definition (`isCall`, uses/defs `SP`, `CC`; `mayLoad`, `mayStore`) | `deps/llvm-project/llvm/lib/Target/AVM/AVMInstrInfo.td`, beside `CALLP` |
| Fusion peephole (adjacent `LDP24` + `CALLP`, register dead after) | near the `CALL_INDIRECT_PSEUDO` expansion in `AVMExpandPseudoInsts.cpp`, or a small late pass |
| **Stack records** | `AVMAsmPrinter.cpp` `emitStackCall` tests `CALLP`/`JMPP` by opcode to emit the indirect record and the proven `!callees` set. `CALLT` must be added there, or its call edges silently vanish from the link-time stack proof ([stack-analysis.md](stack-analysis.md)). |
| Tail-call conversion (`CALLP`+`RET` → `JMPP`) | `AVMFinalControlFlow.cpp`; needs `JMPT` or the conversion is skipped |
| Cost and schedule models | `AVMInstrInfo.cpp`, `AVMCycleCosts.def`, `AVMSchedule.td` |
| Assembler, encoder, disassembler, printer | `AsmParser/AVMAsmParser.cpp`, `MCTargetDesc/AVMMCCodeEmitter.cpp`, `Disassembler/AVMDisassembler.cpp`, `MCTargetDesc/AVMInstPrinter.cpp`; MC and CodeGen lit tests |
| Interpreter and its tests | `interp/interp.asm`; `tests/interp/isa/jmpp_callp.asm`, `tests/interp/stack_bounds.asm`, `tests/fixtures/interp.cmake` |
| Benchmarks | `bench/instruction_mix.cpp` (family taxonomy must list the new decoded operation), `bench/instructions.asm`, `bench/benchmark_names.txt`; refresh `bench/reference/` with `avm_bench_update` |
| Specification | [arch.md](arch.md) opcode map and the `CALLP` semantics table, the [interpreter guide](isa_interpreter_implementation.md) Section 6; update or remove the entry in this document |

### 4.7. Verification: done and outstanding

Done, on the scratch prototype:

- An unmodified scratch build reproduces the committed `interp.hex` byte for byte, so the build recipe is faithful.
- The microbenchmark and the avm_rpg replay above, including interrupt (audio) activity during the replay.

Not done:

- Only the `q3` slot was exercised by guests; the other three slots are untested.
- The stack-overflow trap path.
- A table entry at the end of the image or crossing the 24-bit wrap.
- Unwinding and exception handling through a `CALLT` frame, and debugger stepping.
- The FX-C interpreter build.
- Whether the stack proof survives the real compiler integration: the game prototype used inline asm, which makes the proof "incomplete".

## 5. Primary opcode inventory

### 5.1. What is free

All 256 primary opcodes are assigned ([guide Section 6](isa_interpreter_implementation.md#6-primary-opcode-map)). A new one-byte instruction must reassign an existing encoding, so the question is which are free.

**Corpora.** Dynamic counts: the avm_rpg exploration replay (1,011,884 executed instructions), the avm_rpg device suite (11 scenarios, 82,661,496), and 410 compiled benchmarks (11,125,562). Static counts: every AVM ELF and archive in the build tree (3,860 files, 19.2 million instructions), grouped as benchmarks, projects, runtime libraries (`libavm.a`, `libavm-builtins.a`), and "other" (tests, studies, hand-written ISA and latency assembly). The project counts include every build of each game in the tree, so they overstate unique sites. An opcode that exploration never executes is not free: `0x74` is never executed by exploration but ran 3,568 times in the device suite. A first prototype that used `0x74-0x77` crashed avm_rpg at the first `st16 [r5],r4` in `player_segment`, because the stock compiler emits it.

**Zero production use: self-operand "diagonal" encodings.** These 23 encodings have no use in any benchmark, project or runtime library. They appear only in hand-written ISA tests and latency assembly, which would have to change when one is reassigned. Each family's diagonal (the same register in both fields) is a regular quad at stride 5: opcode = `base | N<<2 | N`, which TableGen can express by assigning one operand to two fields.

| Family | Opcodes | Meaning | Static sites in tests/asm only |
|---|---|---|---:|
| `MOV` | `05` `0A` `0F` | `mov rN,rN` no-op (`00` stays the `NOP` alias) | 3 / 5 / 3 |
| `CMP` | `30` `35` `3A` `3F` | `cmp rN,rN`: constant flags Z=1, C=0, S=0 | 229 / 42 / 87 / 5 |
| `AND` | `80` `85` `8A` `8F` | `and rN,rN` no-op, `CC` preserved | 11 / 1 / 3 / 6 |
| `OR` | `90` `95` `9A` `9F` | `or rN,rN` no-op, `CC` preserved | 3 / 1 / 45 / 1 |
| `ST8` | `50` `55` `5A` `5F` | `st8 [rN],rN`: stores the pointer's low byte through itself | 3 / 6 / 91 / 1 |
| `ST16` | `70` `75` `7A` `7F` | `st16 [rN],rN` | 10 / 9 / 10 / 6 |

Alternative encodings if a program ever needs one: `ED`/`EE` displaced forms with offset 0 (54 / 55 cycles) for `st8`/`st16`; none are needed for the no-op and constant-flag forms.

**Reassignable if the assembler canonicalizes: `SUB` diagonal** (`20` `25` `2A` `2F`, `sub rN,rN`). It is a zeroing idiom that duplicates `xor rN,rN` (`A0` `A5` `AA` `AF`, same 1 byte, same 17 cycles, `CC` preserved), but it is used: production static sites are 32 / 23 / 94 / 83 (benchmarks + projects + libraries). The assembler would have to encode `sub rN,rN` as `xor rN,rN`. `ADD rN,rN` (a left shift by one) and `XOR rN,rN` are used and are not candidates.

**Used by production code, displaceable at a cost.** Each static site needs the assembler to emit the 3-byte displaced form instead (+2 bytes), and each dynamic execution costs about 34-37 more cycles (`ED`/`EE` 54-55 cycles against 18-21). Dynamic counts are benchmarks / device suite / exploration; static counts are benchmarks + projects + libraries.

| Opcode | Instruction | Dynamic | Static (prod.) |
|---|---|---|---:|
| `76` | `st16 [r5],r6` | 0 / 0 / 0 | 7 |
| `77` | `st16 [r5],r7` | 0 / 0 / 0 | 3 |
| `6F` | `ld16 r7,[r7]` | 0 / 0 / 0 | 98 |
| `6D` | `ld16 r7,[r5]` | 0 / 25 / 0 | 24 |
| `6C` | `ld16 r7,[r4]` | 0 / 123 / 0 | 359 |
| `78` | `st16 [r6],r4` | 0 / 250 / 0 | 27 |
| `79` | `st16 [r6],r5` | 352 / 0 / 0 | 87 |
| `7D` | `st16 [r7],r5` | 384 / 0 / 0 | 221 |
| `7B` | `st16 [r6],r7` | 410 / 0 / 0 | 66 |
| `7E` | `st16 [r7],r6` | 488 / 0 / 0 | 108 |
| `5D` | `st8 [r7],r5` | 128 / 110 / 0 | 313 |
| `74` | `st16 [r5],r4` | 704 / 3,568 / 48 | 254 |

**Not reassignable.** The upper-register `MOV`, `ADD`, `SUB` and `CMP` forms have no other encoding (the `F1`, `F2` and `F5` pages exclude the both-upper combinations), so their off-diagonal opcodes cannot be given up without adding encodings elsewhere. `PUSH`/`POP`, `LDI`, `ADDI`, `CMPI`, `LD8U`, `XOR` and `AND`/`OR` off the diagonal, and the control-flow opcodes, are hot.

### 5.2. Demand and allocation options

Candidates competing for the same encodings:

| Proposal | Primary opcodes | Status |
|---|---:|---|
| `callt [qN]` | 4 | [Section 4](#4-callt-fused-table-call) |
| `jmpt [qN]` | 4 | optional |
| Indexed `callt qB, rI` | 1 (+ operand byte) | optional |
| 1-byte `LDSP16 rD,[sp+off]` and `STSP16 [sp+off],rS`, `rD/rS` in `r4-r7`, `off` in `{0,2,4,6}` | 32 | trace estimate: covers 74% of upper-register spills and fills; each saves about 20 cycles (38 → 18); 3.3% of benchmark cycles, 1.5% of exploration cycles. Not specified elsewhere. |

The other measured ISA proposals (paged absolute loads and stores, `ENTER`/`LEAVE`) live in `F0` secondary space, and the tile-map batch service is a `SYS` service, so none of them uses primary opcodes.

**Recommended allocation:**

- **`callt`: the `ST16` diagonal** `70 | N<<2 | N` = `70`, `75`, `7A`, `7F` for `q0`-`q3`. Zero production use; hand-written ISA tests that use these forms must be updated.
- **`jmpt` (if adopted): the `ST8` diagonal** `50`, `55`, `5A`, `5F`. Same properties.
- **1-byte spill/fill:** the other diagonals (`MOV` 3, `CMP` 4, `AND` 4, `OR` 4, plus `SUB` 4 with canonicalization) supply 19 of the 32 opcodes. The remaining 13 would have to come from the used encodings above. Their cost is real: hundreds of static sites in the projects (each +2 B, in program flash) and 34-37 cycles per dynamic execution. Counting only `rpg.elf`, the benchmarks and the device suite would suggest 32 near-free opcodes, but the census over the runtime libraries and every project shows that `76`, `77`, `6F` and the rest are used. A smaller spill/fill (four registers × offsets `{0,2,4}` = 24 opcodes, needing 5 beyond the diagonals) is the likelier fit.

If `callt` has to share the diagonals with spill/fill, the fallback is a regular quad among the used encodings (for example `74`-`77`: 160k cycles in the measured dynamic corpora and about 260 static sites to re-encode in production code), which is worse; prefer giving `callt` the diagonal quad.

## 6. Other ideas

Gains are fractions of avm_rpg exploration busy cycles. Only `SYS draw_tilemap` and `CALLT` were prototyped.

- **`SYS draw_tilemap` (`SYS 0x3E`).** One service call draws a rows by columns array of tiles, replacing the per-tile guest loop and per-tile service restart. ABI: `r4` x, `r5` y, `r6` SRAM address of the tile array, `r7` = rows << 8 | cols, `r2` = skip << 8 | stride. It reused the generic sprite renderer unchanged and cost 172 B of code (+176 B in the image). Measured: busy cycles 88.10 M → 80.80 M (-8.3%), 398 of 398 frames identical, 1,600 randomized cases against a loop of `draw_overwrite` with no mismatch, a fixed 423 cycles per call and 896 per fully visible 16×16 tile. It was declined because it supports neither tile arrays in the flash window nor in program memory, and supporting both would add a lot of code.
- **1-byte spill and fill.** `ldsp16 rD,[sp+off]` and `stsp16 [sp+off],rS` as primary opcodes for `rD`, `rS` in `r4-r7` and `off` in `{0, 2, 4, 6}`: 32 opcodes. Across the benchmarks this covers 74% of the compiler's upper-register spills and fills, and each saves about 20 cycles (38 → 18).
- **`ENTER`/`LEAVE`.** In avm_rpg 7,658 four-register prologues (push `r3-r0`, `adjsp -n`) and matching epilogues (`adjsp +n`, pop `r0-r3`, `ret`) run per 398 frames. Fusing each into one 3-byte `F0` form is estimated at about 95 cycles saved per call.
- **Audio interrupt.** Synthesis took 19.8% of busy cycles; reducing it is an interpreter change, not an ISA change, and was not analyzed.

## 7. Sprite drawing: renderer fast paths and batch tile services

Measured on 2026-11-25 against `ce20048`, with scratch tools that are not in the repository: a native instruction tracer over the instruction benchmarks (`advance_instr()` stepping, cycle and PC per instruction), an SPDR-write timeline per benchmark, and a replay harness that logs the arguments of every call to `draw_bitmap_seek_func` during the exploration replay. Overwrite and plus-mask are the priority modes; nothing below is optimized for self-masked or erase.

### 7.1. What the exploration replay draws

Measured: 16,076 renderer entries in the replay window, every one a 16 x 16 sprite.

| | `draw_overwrite` (tiles) | `draw_plus_mask` (actors, ambient, birds) |
|---|---:|---:|
| calls (avm-prof) | 15,036, 20.8% of busy cycles, 1,184 cycles each including interrupts | 996, 2.0%, 1,747 each |
| fully on screen | 70.9% | 80.0% |
| clipped left or right | 10.0% + 10.0% | 0.6% |
| clipped top or bottom | 3.5% + 3.5% (corners 2.0%) | 9.4% (corners 1.5%) |
| entirely off screen | 0.1% | 8.4% |
| `y & 7 == 0` among fully visible | 86% | 79% |

`draw_tiles` as a whole is 24.0 M cycles (28% of busy), so the guest loop around each tile costs another 413 cycles. No self-masked or erase call occurs. Of the fully visible, page-aligned tiles, 9.7% repeat the tile to their left, 29.5% repeat one of the last four distinct tiles drawn in the same frame, and 41% repeat an earlier tile of the frame.

### 7.2. Where a cached call spends its cycles

Measured, no interrupts, cycles counted from the `SYS` decode's `OUT SPDR`:

| Phase | 8 x 8 aligned | 16 x 9 unaligned, frame 1 | SPI floor |
|---|---:|---:|---:|
| decode to the sprite's `SFC_READ` command | 66 | 77 | at least 17 (the speculative fetch must finish) |
| command to address-high | 87 | 99 | 18 |
| address-high to the first data byte | 86 | 87 | 71 |
| decode to the first data byte | 239 | 262 | about 106 |
| data bytes | 18 each | 18 each; 20 for the partial final page | 17 |
| row boundary | | +41 | 0 |
| clipped row (re-seek) | +101 each | | |
| end of the last data byte to the next opcode | 124 | 124 | about 105 |

Plus-mask data runs at 17.5 cycles per byte already. The address-high byte is late because the 15 pushes, the stride and frame arithmetic, the visibility test and the clipping all run before it. The flash transaction therefore idles for about 85 cycles in front of the first data byte, and again for about 50 to 60 cycles before the command is launched. About 130 to 155 cycles of every visible call are front-end work that the SPI bus could overlap.

### 7.3. Renderer changes

**Implemented 2026-11-25** (see the interpreter guide, pass summary): an interior page-aligned fast path for overwrite and plus-mask. It covers a sprite that is fully on screen, has `y & 7 == 0`, and, for overwrite, a height divisible by eight: 61% of the replay's tile calls and 63% of its plus-mask calls. It needs no register frame, opens the flash transaction as soon as the test passes, sends the address bytes at the minimum spacing, streams the whole frame at 17 cycles per byte with no row dispatch, and restarts the bytecode stream directly.

| Measured against `ce20048` | Before | After |
|---|---:|---:|
| aligned 16 x 16 overwrite draw, no interrupts | 1,132 | 974 |
| aligned 16 x 16 plus-mask draw, no interrupts | 1,573 | 1,426 |
| `draw_overwrite` in the replay, observed | 1,184 | 1,069 |
| `draw_plus_mask` in the replay, observed | 1,747 | 1,639 |
| replay busy cycles | 85.54 M | 83.68 M (-2.18%), identical final display |

Calls that fall back to the general renderer pay for the test: 4 cycles for unaligned `y`, 4 to 18 for clipped or off-screen draws, 20 to 26 for a partial final page, a 1 x 1 or an empty sprite, and 4 to 6 in self-masked and erase mode. The instruction benchmarks have 22 rows faster (by 92 to 1,355 cycles) and 162 sprite rows slower by those amounts; on the compiled benchmarks `tile_cache_render` gains 0.6% and the four unaligned tile-sprite programs lose 0.4 to 0.7%.

Not done, and why:

- **Front end of the general renderer.** It is bounded by its own instruction count, not by the SPI bus, so moving work behind the address bytes gains nothing there; only removing work would.
- **Cached stride in `set_sprite`** (about 10 cycles). The cached-sprite state sits inside the packed private RAM layout that the audio map depends on.
- **Peeling the last byte** of the fast loops, about 12 cycles per fast draw (0.2% of the replay): today each loop starts one transfer past the frame and waits for it. A batch service gains it once per tile.
- **Clipped and unaligned fast paths.** Extending the fast path to horizontally clipped aligned sprites would add about 0.5% of the replay for about 150 B. Unaligned sprites need the shift loops and registers; the general renderer already streams them at 18 cycles per byte.

### 7.4. Batch services and the flash window

Any service that takes a RAM pointer must accept an AS0 address at or above `0x0B00` (the flash window, image offset = address - `0x0600`), as `memcmp`, `memcpy` and the formatter do. A draw owns the SPI bus, so tile indices cannot be fetched from flash between tiles at less than one transaction (about 100 cycles) each. The services below therefore read a row of indices (or a chunk of records) at a time into the 68-byte private workspace at `data_end_private`, which the non-nested compare services already alias, and read SRAM arrays in place. Each reads the sheet selected by `set_sprite`, so no 24-bit sprite pointer register is needed; an explicit PROGMEM array variant is not proposed because ordinary `const` arrays are reachable through the window. All preserve every register, `CC` and `SP`, and draw exactly what the equivalent loop of single calls would draw.

Per-tile estimates, without interrupts, on the fast path: about 690 cycles for an eligible 16 x 16 tile (index and position step 25, frame address 15, eligibility 8, command 5, command to first data 89, 31 further bytes 527, transaction end 20) against about 1,180 for today's single call (about 850) plus the guest loop (about 330). Other tiles keep the general renderer at about 900 per tile (the prototype's measurement), against about 1,230 today. With the replay's 61/39 split that is about 430 cycles saved per tile.

| Option | ABI | Interpreter cost | Gain on the replay, on top of 7.3 |
|---|---|---:|---:|
| A. `draw_tilemap` (grid) | `r4` x, `r5` y of tile (0,0); `r6` AS0 address of tile[0][0]; `r7` = rows << 8 \| cols; `r2` = skip << 8 \| stride. Tile (r,c) = frame `tile[r*stride+c]` at (x + c*width, y + r*height), overwrite, skip value not drawn, row-major | about 300 B (176 B prototype, +30 B callable fast loops, +60 B per-tile dispatch, +40 B window rows) | about 9% (RAM map); about 8.5% if the map is in the window |
| B. `draw_tile_row` | `r4` x, `r5` y; `r6` AS0 address of the indices; `r7` = skip << 8 \| count; tile i at (x + i*width, y) | about 240 B | about 8.5% (RAM map): one call per row costs about 420 cycles each, 3 more per frame than A |
| C. `draw_sprites` (list) | `r6` AS0 address of records `{int16 x; int16 y; uint8 frame}`; `r7` = count; two service numbers for overwrite and plus-mask | about 250 B alone, about 150 B beside A | about 0.3%: only about 2.5 plus-mask draws per frame; about 220 cycles per sprite plus the guest loop in sprite-heavy games |
| D. Tile copy cache inside A or B | none (internal) | about 110 B, 16 bytes of workspace | about 1.9% more |

- **A** is the largest gain for the fewest calls. Skipping whole off-screen rows and columns is computed once per call, so off-screen tiles cost nothing. A window row costs about 105 + 17 x visible cols cycles, about 1.2 k per frame. A plus-mask mode byte would add about 14 B.
- **B** has a simpler ABI and the same window logic; choose it if the grid's five argument registers or the stride/skip semantics are unwanted.
- **C** is independent of tile maps and is the natural way to batch actors and effects, but the replay has few of them, and the guest still has to build the records.
- **D** copies the 32 bytes of an identical earlier tile of the same call from the framebuffer (about 220 cycles instead of about 690) when both are page-aligned and fully on screen; aligned overwrite tiles share no pages, so the copy is exact. 29.5% of the replay's eligible tiles match one of the last four distinct tiles (41% match any earlier tile of the frame, at a higher lookup cost).

### 7.5. Order of work

| Step | Observed gain on the replay | Interpreter cost |
|---|---:|---:|
| Interior aligned fast path (done) | 2.18% | +248 B (offset by 148 B of delay re-encoding) |
| A. `draw_tilemap` with window rows | about 9% | about 300 B |
| D. Tile copy cache | about 1.9% | about 110 B |
| Fast path for horizontally clipped aligned sprites | about 0.5% | about 150 B |

A and D together would take the replay about 11% below today's 83.68 M busy cycles for about 410 B of the 1,592 free. Verification for a batch service: randomized maps, positions, strides, skip values and both memory regions against a loop of single calls (pixel-identical, registers preserved), replay frame hashes, and the SPI-write checker.

## 8. Reproducing the measurements

- **Interpreter build:** the recipe in `cmake/BuildAvmInterpreter.cmake` (`avr-gcc -c -x assembler-with-cpp -mmcu=atmega32u4 interp.asm`, then link with `-nostartfiles -nostdlib -Wl,--gc-sections -Wl,--entry=__vectors -Wl,--section-start=.text=0x0000 -Wl,-Tdata=0x800A0B`, then `avr-objcopy -O ihex`). Patch a copy; do not edit the committed file for an experiment.
- **Guest microbenchmark:** C++ with the table base hidden from the optimizer by an empty `asm` (otherwise the call becomes a switch), then, for the fused build:

  ```cpp
  Fn const AVM_PROGMEM* p = &t[sel & 3];
  uint32_t dead_q2;
  asm volatile(".byte 0xNN" : "+{q3}"(p), "=&{q2}"(dead_q2) : : "cc", "memory");
  ```

  where `0xNN` is the opcode chosen for `q3`.
- **Cycle measurement:** load `interpreter.hex` and the image as `bench/avm_bench.cpp` does, with interrupts suppressed, and take the cycles between the two `DEBUG_BREAK`s.
- **Dynamic counts:** `avm_bench --c-only --jobs N --c-output X --stack-output Y --trace-output Z` (and `--cpp-only`) writes per-PC execution counts for every benchmark; join them with `avm-objdump -d build/bench/{c,cpp}/*.elf`. For the device suite, use a scratch copy of `projects/avm_rpg/tests/device_tests.cpp` with a PC histogram in `Device::step()` (an instruction boundary is a native PC word in `[0x100, 0x500)` with `(pc - 0x100) % 4 == 0`; guest PC is `r4:r6`), run with `RPG_NO_TIMING_CHECK=1`.
- **Static counts:** `avm-objdump -d` on every AVM ELF and archive, counting the first byte of each instruction.
- **Opcode bytes for exploration:** take them from `avm-objdump`, not from `avm-prof`, for builds made before the profiler's `.flash`-window fix (it misread program PCs in `0x0B00-0x0EB1`).
