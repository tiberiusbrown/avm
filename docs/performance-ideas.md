# AVM performance optimization ideas

**Status:** working record of proposed and evaluated ISA and interpreter optimizations. Nothing here is part of the ISA in [arch.md](arch.md), and no entry has been adopted unless it says so. Figures were measured on 2026-11-24 against repository revision `1ac7640`, from scratch prototypes and instruction traces, not from the committed interpreter.

## 1. Evidence levels

- **Prototyped:** built in a scratch copy of the interpreter and measured on the emulator.
- **Trace estimate:** computed from instruction traces and the cost model in Section 2; no prototype.
- **Rejected:** measured or reasoned to be not worth its cost.

## 2. Cost model and profile summary

- Guest code streams from the external flash over SPI, so an instruction costs about 17.5 cycles per encoded byte plus small decode extras ([interpreter guide, Section 5](isa_interpreter_implementation.md#5-timing-model)).
- A taken branch, jump, call or return restarts the stream and costs about 97 cycles more than its not-taken or one-byte cost (`BREQ8`: 132 taken, 35 not taken).
- Audio interrupts took 19.8% of busy cycles in exploration, so a saving in non-interrupt cycles counts about 1.25 times in observed cycles.
- avm_rpg exploration replay (398 frames; busy cycles 88.1 M of 128 M, excluding the vsync wait): `sys draw_overwrite` 21%, `sys display` 10.5%, taken control transfers 12.7%, 4-byte absolute `ldm`/`stm` 6.5%, `ldsp16`/`stsp16` 5.8%.

## 3. Index of ideas

| Idea | Gain | Interpreter cost | Evidence | Status |
|---|---|---:|---|---|
| [`CALLT [qN]`](#4-callt-fused-table-call) fused `ldp24` + `callp` | 0.62% of exploration (patched sites; about 0.74% if all) | +12 B | Prototyped | Shelved; opcodes in [Section 5](#5-primary-opcode-inventory) |
| 1-byte `LDSP16`/`STSP16 [sp+{0,2,4,6}]` on `r4-r7` | about 1.5% of exploration; 3.3% of benchmark cycles | about 0 (reuses 32 slots) | Trace estimate | Waiting on opcode supply ([Section 5.2](#52-demand-and-allocation-options)) |
| `SYS draw_tilemap` batch tile blit | 8.3% of exploration, pixel-identical | +176 B | Prototyped | Declined: cannot draw from the flash window or program memory without substantial added code |
| `ENTER`/`LEAVE` (push or pop `r0-r3` with `adjsp`, `ret`) | about 1.1% | about 100 B | Trace estimate | Not started |
| 3-byte paged absolute `LDM`/`STM` (page in the secondary byte, upper registers) | about 1.4% | about 170 B | Trace estimate | Not started |
| `TST8` + `BR8` fusion | about 0.5% | about 130 B | Trace estimate | Not started |
| Short forward skip instead of a stream re-seek | at most 0.05 M cycles | small | Rejected | Taken forward branches are mostly over 16 bytes |
| `MUL` or swap shifts in the `FA` page | about 0.3 M cycles | about 190 B | Rejected | Decode overhead dominates |
| Wider compare-and-branch fusion | under 1% | at least 1 KB | Rejected | |
| Display loop at a 17-cycle byte cadence | at most 0.5 M cycles | about 0 | Unvalidated | Needs OLED timing validation |

Interpreter flash is the shared constraint: the committed interpreter is 29,332 of 29,696 bytes, so 364 bytes are free for all ISA work combined.

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

**Size:** body 14 B (seven instructions); the interpreter image grows 29,332 → 29,344 bytes (+12 B). That leaves 352 of the 29,696-byte limit; only 364 bytes are free today, so flash is the binding budget for every ISA proposal. Inserting the body moves later code by seven words, within the eight-word allowance in [guide Section 26.4](isa_interpreter_implementation.md#264-static-transfer-reach-considerations).

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

## 7. Reproducing the measurements

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
