# Verdict

**Yes—after a small preflight correction, the architecture is complete enough to begin code generation.** The document already specifies the pieces that normally force a backend author to make architectural decisions: data layout, legal types, register classes, calling convention, frame organization, condition-code behavior, operation legalization, helper ABI, address spaces, relocations, sections, and system intrinsics. 

The existing branch is also a strong starting point:

* It deliberately stops at MC and registers no `TargetMachine`.
* The instruction descriptions already contain many useful tied-operand and CC annotations, even though they are presently labeled MC-only.
* ELF relocation emission is implemented.
* LLD already implements the AVM target, relocations, and relaxation.
* Clang already recognizes AVM and has most of the scalar data model, although its ABI and inline-assembly support are still skeletal.

This is therefore primarily a **SelectionDAG implementation project**, not an architecture-design project.

## Corrections to make before codegen

### 1. Add the LLVM program address space to the data layout

The current string defines the width of `p1`, but does not set address space 1 as LLVM's program address space. LLVM's `ProgramAddrSpace` defaults to zero.  LLVM recognizes distinct program, global, and alloca address-space settings.

Change the layout to:

```text
e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8-P1-G0-A0
```

`P1` is essential. `G0` and `A0` merely make the other choices explicit.

This should be tested by confirming that:

```c
void f(void);
_Static_assert(sizeof(&f) == 3, "");
```

passes and that emitted LLVM IR places functions in address space 1.

### 2. Reconcile the CPU name

The specification names `avm1`, while the backend currently defines only `generic`.  Make `avm1` the default CPU. Retaining `generic` as a compatibility alias is harmless.

### 3. Fix two small MC inconsistencies

`MaxInstLength` is currently four bytes, but a relaxable conditional branch occupies six bytes before linking.   Set it to six.

The assembler backend currently refuses to generate alignment NOPs even though `0x00`, `mov r4,r4`, is the canonical NOP.  Make `writeNopData` emit zero bytes.

### 4. Disable source-level `_Float16` initially

The current Clang target enables `HasFloat16`, although the architecture contract only gives direct legalization rules for `f32`.  Keep the LLVM `f16` alignment entry for IR compatibility, but have Clang reject `_Float16` until its ABI and lowering are intentionally specified.

# Implementation strategy

Use **SelectionDAG only**. Do not implement GlobalISel, FastISel, debug information, or jump tables during this phase.

The most important design choice is:

> Select broad semantic pseudos before register allocation, prefer upper registers during allocation, and choose the actual compact, dense, or cold encoding after physical registers are known.

For example, instruction selection should initially produce a generic `PseudoADD16`. After allocation:

```text
both operands in r4-r7  -> one-byte ADD
otherwise               -> F2 full-register ADD
```

Use the same technique for moves, compares, immediates, ordinary memory operations, stack operations, and `MOV32`. This avoids dozens of fragile pre-RA patterns and directly implements the policy already specified in the architecture document.

## Timing model and optimization policy

The measured interpreter timings in
`https://github.com/tiberiusbrown/avm/blob/master/bench/cycles_instruction.txt`
are the normative tuning source for this implementation plan. Pin the imported
data to source blob `63cd3602b6d1ce25a1c1372690859f4c3a6714f0`. These timings describe the
current ATmega32U4 AVM interpreter, not the AVM ISA itself. Keep the identities
separate:

```text
-mcpu=avm1
-mtune=avm-interpreter-32u4-v1
```

`avm1` selects the Version 1 ISA and ABI.
`avm-interpreter-32u4-v1` selects the measured cost and scheduling model and is
the default tune CPU for this backend milestone.

The AVM Clang driver must select this tune CPU even when the user supplies no
`-mtune` option. A plain `clang --target=avm ...` invocation must pass
`-tune-cpu avm-interpreter-32u4-v1` to `clang -cc1`. An explicit
`-mtune=<name>` overrides that default without changing `-mcpu`; unknown tune
names are diagnosed. The backend must retain the same default as a defensive
fallback for IR produced without the Clang driver.

The LLVM tree must contain a distilled, checked-in timing snapshot so builds and
tests never depend on a network connection or another checkout. Use these files:

```text
llvm/lib/Target/AVM/AVMCycleCosts.def
llvm/lib/Target/AVM/AVMCostModel.h
llvm/lib/Target/AVM/AVMCostModel.cpp
llvm/lib/Target/AVM/AVMSchedule.td
```

A complete `AVMCycleCosts.def` is supplied alongside this plan. Place that file
at the path above before running Prompt 2. Its SHA-256 is:

```text
3c3841618c80dca62874b45cc1c74010121fb68796ff5214ecb6342cd91d10a3
```

Do not create a generator, parse the benchmark during the LLVM build, or ask an
agent to reconstruct this file. Prompt 2 consumes the supplied file as immutable
input. `AVMCycleCosts.def` is the single source of truth inside LLVM and has this
macro-oriented interface:

```text
AVM_FIXED_COST(Name, Cycles)
AVM_RANGE_COST(Name, Typical, Minimum, Maximum)
AVM_BRANCH_COST(Name, NotTaken, Taken)
AVM_SHIFT_COST(Name, Count, Cycles)
```

The supplied file records every fixed timing in the benchmark verbatim. For
operations with data-dependent timings, it contains the following predetermined
representative values; agents must not recompute averages or choose different
cases:

| Cost name | Typical | Minimum | Maximum |
|---|---:|---:|---:|
| `UDiv16` | 219 | 59 | 251 |
| `URem16` | 219 | 58 | 251 |
| `SDiv16` | 229 | 59 | 265 |
| `SRem16` | 229 | 58 | 267 |
| `FAdd` | 190 | 167 | 207 |
| `FSub` | 190 | 159 | 208 |
| `FMul` | 225 | 169 | 237 |
| `FDiv` | 560 | 169 | 1328 |
| `FMin` | 115 | 104 | 122 |
| `FMax` | 115 | 104 | 122 |
| `FSqrt` | 560 | 125 | 757 |
| `FTrunc` | 115 | 74 | 160 |
| `FFloor` | 120 | 74 | 173 |
| `FCeil` | 120 | 74 | 173 |
| `FRound` | 120 | 74 | 173 |
| `S16ToF` | 180 | 149 | 207 |
| `U16ToF` | 175 | 144 | 196 |
| `FToS16` | 190 | 179 | 196 |
| `FToU16` | 180 | 169 | 221 |
| `S32ToF` | 200 | 148 | 231 |
| `U32ToF` | 200 | 152 | 225 |
| `FToS32` | 205 | 178 | 248 |
| `FToU32` | 190 | 168 | 228 |
| `FCmp` | 140 | 122 | 150 |
| `FClass` | 135 | 105 | 159 |
| `SysSinf` | 1800 | 1074 | 3331 |
| `SysCosf` | 1800 | 1100 | 3265 |
| `SysAtan2f` | 2900 | 128 | 2942 |
| `SysTanf` | 2300 | 1211 | 3862 |
| `SysExpf` | 2400 | 105 | 2852 |
| `SysLogf` | 2200 | 180 | 2450 |
| `SysLog2f` | 2100 | 104 | 2325 |
| `SysLog10f` | 2200 | 180 | 2462 |
| `SysPowf` | 4600 | 93 | 4633 |
| `SysHypotf` | 900 | 129 | 1448 |
| `SysFmodf` | 300 | 118 | 1903 |

Record all immediate shift counts exactly. Record conditional branches as:

```text
rel8:  not taken 35, taken 128
rel16: not taken 51, taken 135
CMOV:  not taken 36, taken 37
```

Use `Typical` for the scheduling model and normal `-O2`/`-O3` decisions. Retain
`Minimum` and `Maximum` for diagnostics, tests, and future worst-case analysis.
For LLVM TTI speed costs, normalize cycles with:

```text
normalizedCost = max(1, (cycles + 8) / 17)
```

using integer division. Code-size costs are the final encoded byte count, not
the normalized cycle cost. At `-Os` and `-Oz`, prefer fewer bytes unless the
faster choice is the same size or smaller. At `-O0`, perform only correctness-
required lowering and mandatory pseudo expansion.

# Agent model and reasoning assignments

These assignments target Codex and intentionally use cheaper GPT-5.6 tiers for
bounded mechanical work while reserving GPT-5.6 Sol for backend phases where an
incorrect architectural choice is likely to create expensive rework. Use a
fresh agent task for each prompt and use the exact model and reasoning level
listed below. Do not enable automatic model selection or `max` reasoning.

| Prompt | Model | Reasoning | Cost rationale |
|---|---|---|---|
| 1 | GPT-5.6 Luna | High | Bounded target/driver/MC edits with explicit tests. |
| 2 | GPT-5.6 Terra | High | Large but mechanical TableGen and cost-table integration. |
| 3 | GPT-5.6 Sol | High | Foundational TargetMachine and SelectionDAG structure. |
| 4 | GPT-5.6 Sol | Extra High (`xhigh`) | Calling convention, frame lowering, spills, and scavenging are tightly coupled. |
| 5 | GPT-5.6 Sol | High | Memory-form lowering and object-section policy cross several subsystems. |
| 6 | GPT-5.6 Sol | Extra High (`xhigh`) | CC glue, branch polarity, if-conversion, and shift profitability interact. |
| 7 | GPT-5.6 Sol | Extra High (`xhigh`) | Legal i32/f32, AS1 pointer representation, and program loads are high risk. |
| 8 | GPT-5.6 Sol | Extra High (`xhigh`) | Clang ABI, aggregates, varargs, and LLVM lowering must agree exactly. |
| 9 | GPT-5.6 Sol | High | Broad integration and optimization audit, but all policies are already specified. |

If a listed tier is unavailable in the installed Codex version, update Codex
rather than silently substituting another model. A failed task may be resumed
with the same model and effort; do not restart it at a more expensive setting
unless the failure demonstrates a reasoning error rather than a build or test
issue.

# Common instructions for every agent prompt

Give this once at the beginning of the agent session:

```text
Work on the current AVM branch and patch the current files in place. Preserve
all unrelated changes and do not restore files from older revisions.

The current AVM architecture specification is normative. Do not invent or
change an ISA encoding, ABI rule, pointer representation, calling convention,
relocation, or section rule unless the current prompt explicitly directs it.

Implement only the SelectionDAG code-generation path. Do not add GlobalISel,
FastISel, debug-information support, exceptions, RTTI, dynamic allocation,
dynamic alloca, TLS, or hosted-library support.

Use semantic code-generation pseudos before physical register allocation and
select compact/dense/cold final encodings after register allocation.

Treat AVMCycleCosts.def as the only LLVM-side timing authority. It is supplied
input, not generated work; do not modify it, and verify its documented SHA-256
before Prompt 2. Do not infer latencies from instruction byte length, comments,
intuition, or host-CPU behavior. Preserve the separation between -mcpu=avm1 and
-mtune=avm-interpreter-32u4-v1. The Clang driver must provide that tune CPU by
default when the user omits -mtune.

For speed decisions, use measured cycles and block frequency. For size decisions,
use final encoded byte counts. Do not add an optimization unless the prompt gives
its exact profitability rule.

After each prompt:
1. Build only the affected LLVM targets and tools.
2. Run all existing AVM MC, object, disassembler, and LLD tests.
3. Run the new AVM CodeGen and Clang tests.
4. Run clang-format on changed C++ files.
5. Leave the checkout building and tests passing.
6. Make one focused commit for the completed step.
```

# Nine-prompt implementation plan

## Prompt 1 — Contract preflight

**Agent:** GPT-5.6 Luna, High reasoning.

```text
Perform the AVM code-generation preflight, without adding a TargetMachine yet.

1. Change the normative LLVM data-layout string to:

   e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8-P1-G0-A0

2. Make Clang's AVMTargetInfo use that exact string rather than synthesizing a
   generic layout with resetDataLayout().

3. Verify through a Clang CodeGen test that:
   - ordinary data pointers are 2 bytes;
   - function pointers are 3 bytes;
   - functions are emitted in LLVM program address space 1;
   - ordinary globals and allocas remain in address space 0.

4. Make avm1 the canonical and default ISA CPU in AVM.td and all MC target
   setup. The name generic may remain as a compatibility alias with identical
   features.

5. Add `avm-interpreter-32u4-v1` as the sole Version 1 tune-CPU spelling in
   Clang target validation and make it the driver default:

   - with no `-mcpu` or `-mtune`, `clang --target=avm -###` must show cc1
     receiving `-target-cpu avm1` and
     `-tune-cpu avm-interpreter-32u4-v1`;
   - `-mcpu=avm1` must not suppress or alter the default tune CPU;
   - `-mtune=avm-interpreter-32u4-v1` must pass through unchanged;
   - an unknown `-mtune` value must produce a driver or target diagnostic;
   - the emitted IR function attributes must be
     `"target-cpu"="avm1"` and
     `"tune-cpu"="avm-interpreter-32u4-v1"`.

   Implement the default in the AVM Clang driver path, not only in
   `AVMTargetInfo`. Retain the same default in target/backend code as a fallback
   for direct cc1 or non-Clang IR input. This step only establishes names,
   driver behavior, and IR attributes; the schedule model is added in Prompt 2.

6. Set AVMMCAsmInfo::MaxInstLength to 6.

7. Make AVMAsmBackend::writeNopData emit one 0x00 byte per requested byte.

8. Disable source-language _Float16 in AVMTargetInfo. Do not remove f16 from
   the LLVM data layout.

Add focused Clang and MC tests for these corrections. Do not make any codegen
classes, passes, or TargetMachine changes in this step.
```

## Prompt 2 — Codegen metadata and measured timing model

**Agent:** GPT-5.6 Terra, High reasoning.

```text
Convert the existing AVM TableGen descriptions from MC placeholders into
codegen-correct descriptions while preserving every existing assembly spelling,
encoding, fixup, parser behavior, printer behavior, and disassembly result.

Register classes:

- GPR16: r4, r5, r6, r7, r0, r1, r2, r3 in that allocation order.
- UpperGPR16: r4-r7.
- LowGPR16: r0-r3.
- PTR16: the same members and order as GPR16.
- UpperPTR16: r4-r7.
- GPR8: the same physical registers as GPR16, with i8 value type. Do not create
  independently allocatable byte storage.
- UpperGPR8: r4-r7 with i8 value type.
- GPR32: q2, q3, q0, q1 in that allocation order, supporting i32 and f32.
- UpperGPR32: q2 and q3.

Retain compatibility aliases for the old MC register-class names so parser and
emitter code does not need gratuitous renaming.

Split the generic compact-matrix instruction class into semantically correct
classes for:

- move: destination definition plus source use;
- two-address arithmetic and bitwise operations;
- compare: two uses plus CC definition;
- load: destination definition plus address use and mayLoad;
- store: address and source uses and mayStore.

Correct the remaining instruction records so that:

- tied read/write operands are represented as tied machine operands;
- all loads and stores have correct mayLoad/mayStore flags;
- PUSH16, POP16, calls, RET, ADJSP, GETSP, and SETSP model SP correctly;
- CMP, CMP32, CMPI, TST8, and TST16 define CC;
- branches, CSET, and CMOV use CC;
- arithmetic and logical instructions do not define CC;
- SYS is conservatively side-effecting;
- calls and returns have their existing branch/call/return flags.

Integrate the supplied measured timing snapshot and add the schedule
description:

1. Before changing code, verify that
   `llvm/lib/Target/AVM/AVMCycleCosts.def` is byte-for-byte the supplied file and
   that its SHA-256 is
   `3c3841618c80dca62874b45cc1c74010121fb68796ff5214ecb6342cd91d10a3`.
   If it is absent or the checksum differs, stop rather than regenerating or
   editing it. Do not add a generator or benchmark parser.

2. Treat the names in `AVMCycleCosts.def` as the canonical `AVMCostKind`
   spellings. Define `enum class AVMCostKind : uint16_t` by including the file
   once with `AVM_FIXED_COST`, `AVM_RANGE_COST`, and `AVM_BRANCH_COST` expanding
   to `Name,` and `AVM_SHIFT_COST` expanding to nothing, then append exactly
   these six shift kinds to the enum:

   `Shl16V`, `Lsr16V`, `Asr16V`, `Lsl16I`, `Lsr16I`, `Asr16I`.

   Do not create duplicate per-count enum values.

3. Create AVMCostModel.h/cpp with these exact APIs:

   - AVMCycleRange { unsigned Typical, Minimum, Maximum; };
   - getFixedCycles(AVMCostKind);
   - getCycleRange(AVMCostKind);
   - getShiftCycles(AVMCostKind, unsigned Count);
   - getBranchCycles(AVMCostKind, bool Taken);
   - getExpectedBranchCycles(AVMCostKind, BranchProbability TakenProbability),
     rounded to the nearest whole cycle;
   - normalizeCyclesForTTI(unsigned Cycles), implementing
     max(1, (Cycles + 8) / 17).

   Implement the lookup tables by repeated inclusion of `AVMCycleCosts.def`:

   - fixed-cost switch: `AVM_FIXED_COST` emits a case returning `Cycles`;
   - range-cost switch: `AVM_RANGE_COST` emits a case returning the three
     values;
   - branch-cost switch: `AVM_BRANCH_COST` emits a case selecting `Taken` or
     `NotTaken`;
   - six `std::array<unsigned, 16>` tables are initialized by
     `AVM_SHIFT_COST`; reject counts greater than 15 with `llvm_unreachable` in
     internal APIs and return invalid cost only at public defensive boundaries;
   - `getExpectedBranchCycles` computes
     `(NotTaken * (D - N) + Taken * N + D / 2) / D`, where `N` and `D` are the
     taken probability numerator and denominator. Use 64-bit intermediates.

4. Create AVMSchedule.td with one processor model named
   avm-interpreter-32u4-v1, issue width 1, one nonpipelined interpreter
   execution resource, and complete scheduling coverage for every real
   instruction. Use exact fixed cycles where available and Typical for range
   costs. Branch schedule classes use the not-taken cost because they terminate
   a basic block; branch-probability decisions use getExpectedBranchCycles.

5. Attach schedule classes by actual encoded form. A semantic pseudo has no
   final schedule class; its post-RA expansion supplies the real instruction's
   class.

Add unit or lit tests that verify representative constants from each category,
all shift-array entries, branch expected-cost arithmetic at probabilities 0,
1/2, and 1, and complete scheduling coverage with no default/unknown class.

Do not add instruction-selection patterns or C++ TargetMachine files yet. The
output of every existing llvm-mc and llvm-objdump test must remain byte-for-byte
unchanged.
```

## Prompt 3 — TargetMachine and minimal leaf codegen

**Agent:** GPT-5.6 Sol, High reasoning.

```text
Turn AVM into a SelectionDAG code-generation target and compile simple leaf
functions using i16 values.

Add the standard backend files:

- AVM.h
- AVMTargetMachine.{h,cpp}
- AVMSubtarget.{h,cpp}
- AVMInstrInfo.{h,cpp}
- AVMRegisterInfo.{h,cpp}
- AVMFrameLowering.{h,cpp}
- AVMSelectionDAGInfo.{h,cpp}
- AVMISelLowering.{h,cpp}
- AVMISelDAGToDAG.cpp
- AVMMachineFunctionInfo.{h,cpp}
- AVMAsmPrinter.cpp
- AVMMCInstLower.{h,cpp}
- AVMExpandPseudoInsts.cpp

Update CMake and TableGen generation for the calling-convention and DAG-isel
tables. Replace the empty LLVMInitializeAVMTarget implementation with
TargetMachine, instruction-selector, pseudo-expander, and asm-printer
registration.

Implement per-function subtarget lookup using target-cpu, tune-cpu, and
target-features attributes. Reject unknown tune CPUs. If tune-cpu is absent,
use avm-interpreter-32u4-v1.

Use:

- static relocation model;
- large code model;
- one-byte function and stack alignment;
- SelectionDAG;
- TargetLoweringObjectFileELF temporarily;
- the avm-interpreter-32u4-v1 scheduling model from AVMSchedule.td.

Implement codegen semantic pseudos for:

- 16-bit copy;
- 8- and 16-bit constants;
- ADD, SUB, AND, OR, and XOR;
- function return.

The post-RA pseudo expander must choose the lowest measured-cycle legal form
at -O1/-O2/-O3 and the smallest legal form at -Os/-Oz. For the operations in
this prompt, this produces these exact choices:

- compact one-byte form when all required operands are upper registers;
- the full-register form otherwise;
- compact immediate form for r4-r7;
- cold immediate form for r0-r3.

Implement AVMInstrInfo::getInstrLatency by delegating real opcodes to
AVMCostModel. Fixed instructions return the exact value; range-cost instructions
return Typical; immediate shifts are handled in Prompt 6.

Implement enough lowering for no-argument and register-i16 leaf functions,
i16 returns in r4, constants, copies, and the five binary operations.

Required tests:

- empty function emits RET;
- uint16_t add(uint16_t a, uint16_t b) emits one compact ADD and RET at -O2;
- constants select compact or cold LDI according to the final register;
- MC output and object emission work through the existing emitter;
- llc accepts -mcpu=avm1 -mtune=avm-interpreter-32u4-v1 and rejects unknown
  tune names;
- scheduling-model tests report 17 cycles for compact ADD and 38 cycles for
  full ADD.
```

Simple C code should begin compiling after this prompt.

## Prompt 4 — Calls, calling convention, frames, and spills

**Agent:** GPT-5.6 Sol, Extra High (`xhigh`) reasoning.

```text
Implement the complete backend machinery for ordinary calls and fixed stack
frames.

Use a custom AVM argument allocator implementing the specification literally:

- four 16-bit units mapped to r4-r7;
- source-order allocation;
- two-unit values align to an even unit;
- four-unit values begin at unit zero;
- no argument is split;
- after the first stack argument, all later arguments use the stack;
- stack arguments are packed at one-byte alignment;
- narrow named register arguments are sign- or zero-extended to 16 bits;
- narrow stack arguments retain their exact byte size.

The allocation helper should already understand one-, two-, and four-unit
classes even where later prompts have not legalized all corresponding values.

Implement:

- LowerFormalArguments;
- LowerCall;
- LowerReturn;
- direct calls through RELAX_CALL;
- indirect calls through CALLP;
- call-preserved masks preserving r0-r3 and SP and clobbering r4-r7 and CC;
- outgoing call-frame allocation and deallocation;
- the three-byte return-address bias for incoming stack arguments;
- callee-save discovery for r0-r3;
- PUSH16/POP16 prologues and epilogues;
- fixed-frame allocation with ADJSP, splitting adjustments into signed-8-bit
  chunks when necessary;
- frame-index elimination;
- r3 frame-pointer support when required;
- spill and reload support for GPR16 and GPR32;
- register scavenging and the optional emergency slot;
- copyPhysReg for scalar and pair registers.

Do not implement dynamic alloca or varargs yet.

Test 0-6 scalar arguments, nested calls, indirect calls, callee-saved values,
spilled values at -O0, incoming stack arguments, and frames on both sides of
the signed-8-bit ADJSP boundary.
```

Multi-function freestanding C should work after this prompt.

## Prompt 5 — AS0 memory, globals, bytes, and object sections

**Agent:** GPT-5.6 Sol, High reasoning.

```text
Implement address-space-zero data access and byte legalization.

Add broad pre-RA memory pseudos for byte/word load and store, including
postincrement and stack-relative forms. Expand them after register allocation
using these exact choices:

Ordinary indirect:
- upper pointer and upper data register: compact one-byte form;
- upper pointer and lower data register: the appropriate F3/F5 dense form;
- lower pointer: F0 general-pointer form.

Postincrement:
- upper pointer: F6/F7 form;
- lower pointer: F0 general-pointer postincrement form.

Stack-relative:
- upper data register and offset 0-15: compact stack form;
- otherwise, offset 0-255: F0 stack form.

These choices are mandatory for both speed and size because the selected form
is never larger or slower than its fallback. Attach the exact measured cost of
the emitted real opcode after expansion. Do not assign one generic memory cost
to all forms.

Implement:

- i8 load, store, truncation, sign extension, and zero extension;
- promotion of ordinary i8 arithmetic to i16;
- i16 unaligned memory operations;
- i32 spills as pair operations or two word operations;
- data-symbol address materialization with R_AVM_DATA16;
- direct absolute LDM/STM selection for suitable globals;
- volatile accesses without widening, narrowing, or merging;
- small constant memcpy/memmove/memset expansion.

Add AVMTargetObjectFile and select sections by LLVM address space:

- AS0 globals, including ordinary const globals and string literals, go to
  .data unless explicitly assigned to .saved or .saved.*;
- AS1 executable definitions go to .text;
- AS1 constants go to .rodata;
- never place an AS0 object into program-space .rodata merely because it is
  constant;
- preserve explicit .saved sections and AVM ELF section flags.

Test globals, strings, arrays, structures, signed and unsigned char, volatile
MMIO-style accesses, stack objects, pointer iteration, postincrement, and all
post-RA memory-encoding cases.
```

## Prompt 6 — CC, measured branch policy, shifts, multiply, and division

**Agent:** GPT-5.6 Sol, Extra High (`xhigh`) reasoning.

```text
Complete scalar integer instruction selection and control flow.

Introduce target SelectionDAG nodes for comparison, CC-producing operations,
conditional branch, conditional select, and condition materialization. Use
SelectionDAG glue and explicit CC operands so compares remain correctly
associated with their consumers. Calls must clobber CC; normal arithmetic must
not.

Implement:

- i8 and i16 EQ, NE, ULT, UGE, SLT, and SGE;
- ULE and UGT by swapping operands and using UGE or ULT;
- compare plus RELAX_BR_* for conditional branches;
- RELAX_JMP for unconditional machine-basic-block branches;
- CSET for materialized comparisons;
- CMOV for i8/i16 selects;
- TST8/TST16 for comparisons against zero;
- CMPI.S8 when the signed immediate fits;
- compare-and-branch without first materializing a boolean;
- analyzeBranch, insertBranch, removeBranch, and reverseBranchCondition.

Implement the measured branch policy exactly:

1. Add a late AVMBranchPolarity MachineFunction pass after machine block
   placement and before final pseudo expansion.

2. For each two-successor conditional branch, use MachineBranchProbabilityInfo.
   Make the more probable successor the fallthrough by reversing the AVM
   condition and swapping successors when necessary. If probabilities are
   equal, preserve the existing layout. Never duplicate blocks in this pass.

3. Use these expected cycle formulas for profitability:

   rel8  = round(35 * (1-p) + 128 * p)
   rel16 = round(51 * (1-p) + 135 * p)

   where p is the probability that the encoded branch is taken. Internal
   conditional branches are costed as rel8 unless the current estimated byte
   distance from the branch opcode to the target is outside -128..127, in which
   case use rel16. Linker relaxation remains authoritative for final encoding.

4. At -O1/-O2/-O3, lower a scalar SETCC select whose two candidate values are
   already available to one CMOV. Lower an i32 select to exactly two CMOVs, one
   per 16-bit component. Do not generate a branch for these cases.

5. Enable generic machine if-conversion only when the candidate region consists
   solely of one or two copy-like assignments that become at most two CMOVs.
   Return unprofitable for every region containing arithmetic, memory,
   calls, more than two assignments, or side effects. Do not speculate those
   operations.

6. At -Os/-Oz, use CMOV for the same scalar and i32 select cases because it is
   no larger than the corresponding branch-plus-copy sequence. Do not otherwise
   enable block if-conversion for size.

Implement scalar operation selection:

- INC16 and DEC16 combines;
- ADDI.S8 combines;
- MUL8, widening byte multiply, and MUL16;
- direct UDIV16, UREM16, SDIV16, and SREM16;
- one-bit shifts;
- FA immediate shifts for counts 0-15;
- FA variable shifts with upper-register operand classes;
- normal LLVM legalization for out-of-range constant shifts.

Implement constant 16-bit shift selection using these exact speed rules:

- Count 0: emit no shift instruction.
- SHL count 1-3: retain a GPR16 pseudo. After allocation, emit count compact
  ADD instructions if the register is upper; otherwise emit count LSL16.1
  instructions.
- SHL count 4-15: constrain the value/result to UpperGPR16 and emit one LSL16I.
- LSR or ASR count 1: emit one GPR16 LSR16.1 or ASR16.1.
- LSR or ASR count 2-15: constrain the value/result to UpperGPR16 and emit one
  LSR16I or ASR16I.
- At -Os/-Oz, use one immediate instruction whenever it is legal; otherwise use
  the shortest legal one-bit sequence. Count 0 still emits nothing.
- A known constant count must never be selected as a variable-count instruction.
- For a true variable count, use the exact count-indexed table only when value
  analysis proves one count. Otherwise use 60 cycles as the scheduling and TTI
  typical cost for SHL16V/LSR16V/ASR16V.

For division and remainder scheduling/TTI, use the predetermined Typical values
from AVMCycleCosts.def. Continue to let target-independent DAG combines replace
constant power-of-two division with shifts and masks; do not add AVM-specific
strength-reduction algorithms.

Disable jump-table generation for now and lower switch statements to branch
trees. Do not invent a jump-table format.

Add -O0, -O2, -Os, and -Oz tests for if/else, loops, branch polarity with and
without profile metadata, zero tests, signed and unsigned comparisons, boolean
results, scalar and i32 selects, switches, every constant shift count 0-15,
variable shifts, multiply, divide, and remainder. Check exact instruction
sequences for the shift thresholds above and check that compare-and-branch
emits no unnecessary CSET.
```

Ordinary integer C should have reasonable quality after this prompt.

## Prompt 7 — `i32`, `f32`, program pointers, and AS1 loads

**Agent:** GPT-5.6 Sol, Extra High (`xhigh`) reasoning.

```text
Legalize i32 and f32 in GPR32 and implement address-space-one values.

For i32:

- constants use two 16-bit immediate loads;
- copies use the MOV32 pseudo;
- post-RA MOV32 expansion uses two compact MOV instructions when both physical
  pairs are q2/q3, and MOV32_F2 otherwise;
- ADD and SUB use ADD32 and SUB32;
- AND, OR, and XOR split into word operations;
- comparisons use CMP32 plus branch or CSET;
- loads and stores use LD32/ST32 where suitable;
- BSWAP splits or uses the available scalar operation;
- multiplication, division, remainder, and general shifts lower to the
  specified __avm_* helpers until profitable inline sequences are added.

For f32:

- select FADD, FSUB, FMUL, FDIV, FSQRT, FNEG, FABS, conversions, FCMP, and
  FCLASS directly;
- select FMIN/FMAX only for LLVM minnum/maxnum semantics or where nnan proves
  the distinction unobservable;
- preserve operand order for FMIN/FMAX;
- implement ordered and unordered floating predicates from FCMP's four result
  values;
- leave constrained strict floating operations expanded.

For address space 1:

- represent p1:24 values canonically in GPR32 with bits 31:24 zero;
- materialize symbols with %lo16 and %hi8 relocations;
- implement 24-bit pointer arithmetic followed by canonicalization;
- implement LDP8U, LDP8S, LDP16, LDP24, and LDP32;
- reject AS1 stores;
- reject implicit AS0/AS1 address-space casts;
- lower direct function calls to RELAX_CALL;
- lower indirect function-pointer calls to CALLP;
- support packed three-byte function pointers in memory.

Apply these mandatory AS1 cost policies:

- assign exact measured fixed costs: LDP8U 290, LDP8S 292, LDP16 306,
  LDP24 326, and LDP32 340 cycles; postincrement forms use 307, 323, 343,
  and 357 cycles respectively;
- select a native postincrement LDP whenever the IR contains a load followed by
  an increment of the same AS1 pointer by the access width and the loaded value
  does not overlap the address pair;
- do not duplicate or speculate a nonconstant AS1 load during target-specific
  combines;
- allow ordinary LICM to hoist a nonvolatile loop-invariant AS1 load when
  aliasing and safety rules permit;
- never hoist, merge, widen, narrow, or eliminate a volatile AS1 load.

Use the predetermined Typical/Minimum/Maximum costs for f32 operations and
conversions. Do not make value-dependent instruction choices for floating
special cases; LLVM constant folding should remove operations whose complete
result is known.

Test long arithmetic, float arithmetic and comparisons, function pointers,
indirect calls, LLVM IR AS1 globals and loads, pointer arithmetic across a
64-KiB boundary, and canonicalization of loaded program pointers.
```

## Prompt 8 — Complete C ABI and Clang ABI lowering

**Agent:** GPT-5.6 Sol, Extra High (`xhigh`) reasoning.

```text
Complete the source-language ABI rather than relying on Clang's generic ABI.

Add clang/lib/CodeGen/Targets/AVM.cpp and register an AVMTargetCodeGenInfo.

Implement exactly:

- direct aggregates of sizes 1-4 bytes;
- indirect byval arguments for aggregates larger than 4 bytes;
- direct aggregate returns of sizes 1-4;
- sret for larger returns;
- hidden sret pointer as the first one-unit argument;
- returned sret pointer in r4;
- exact one-byte alignment;
- canonical signext/zeroext attributes on narrow named arguments;
- only low8(r4) defined for i8 and bool returns;
- canonical q2 return for program pointers;
- i64 arguments and returns in all four units when available;
- stack packing without implicit padding.

Implement variadic functions:

- every argument, including named arguments, is passed on the stack;
- default argument promotions apply first;
- va_list is an AS0 16-bit pointer;
- lower VASTART, VAARG, VACOPY, and VAEND;
- the initial va_list points at the first argument byte above the return
  address.

Implement the target's full inline-assembly constraint set and correct physical
register names and aliases. Do not leave the current r-only implementation.

Lower atomics according to the single-thread policy. Diagnose dynamic alloca,
variable-length arrays reaching the backend, unsupported address-space stores,
and statically known single-function frames larger than 256 bytes.

Add Clang ABI IR tests and LLVM CodeGen tests for every aggregate size from
zero through eight bytes, sret, byval, i64, variadic named and unnamed
arguments, va_arg advancement, narrow arguments, narrow returns, inline
assembly constraints, and atomic expansion.
```

## Prompt 9 — Services, TTI, measured optimization quality, and end-to-end gate

**Agent:** GPT-5.6 Sol, High reasoning.

```text
Finish the initial AVM codegen milestone.

Add the llvm.avm.* target intrinsics from the architecture specification and
lower them to service-specific machine pseudos with exact fixed physical uses,
definitions, preservation, and side-effect properties. Do not lower them
through the generic SYS instruction.

Implement:

- debug.putc and debug.break as ordered side-effecting operations;
- millis and millis32 as evolving-state operations that cannot be CSE'd,
  hoisted, duplicated, or speculated;
- floating math services as pure operations with fixed q0/q1 operands;
- Clang builtins for the recommended __avm_* source interfaces;
- recognized standard float libcalls where their semantics match;
- all specified runtime-helper symbol names for unsupported wide operations
  and memory operations.

Add AVMTargetTransformInfo.{h,cpp}, return it from AVMTargetMachine, and use
AVMCostModel as its only speed-cost source. Implement these exact TTI policies:

1. Speed/latency costs use normalizeCyclesForTTI(TypicalCycles).

2. Code-size costs use final encoded bytes. For a semantic pseudo, use the
   smallest legal form when physical registers are unknown:
   compact scalar form where allocation can satisfy it, dense memory form for
   an upper pointer with an unconstrained data register, and cold form only
   when the pointer is known to require a lower register.

3. Integer costs:
   - i16 ADD/SUB/AND/OR/XOR: compact measured cost;
   - i16 MUL: 46 cycles;
   - i16 unsigned DIV/REM: 219 cycles;
   - i16 signed DIV/REM: 229 cycles;
   - i32 ADD/SUB: 38 cycles;
   - unsupported i32/i64 operations: the corresponding helper-call cost plus
     argument/result copy costs, using 150 cycles for a far direct call before
     helper body cost is known.

4. Compare/select/control-flow costs:
   - compact i16 compare: 18 cycles;
   - full i16 compare: 39 cycles only when operands are known non-upper;
   - CSET: 38 cycles;
   - scalar CMOV: 37 cycles;
   - i32 select: 74 cycles;
   - generic conditional control-flow cost: rel8 not-taken 35 cycles;
   - probability-aware machine decisions use the branch formulas from Prompt 6.

5. Memory costs:
   - AS0 indirect i8/i16 load/store with unconstrained allocatable values:
     use compact 18 cycles for scalar optimization estimates;
   - known lower-pointer AS0 access: use the exact cold opcode cost;
   - AS0 i32 load/store: 82/81 cycles;
   - AS1 operations: use the exact LDP costs from Prompt 7;
   - volatile and atomic-compatible operations retain the same execution cost
     but carry their required ordering constraints.

6. Floating costs use the predetermined Typical values in AVMCycleCosts.def.
   Service intrinsic costs use their predetermined Typical values. Mark the
   pure math services expensive but speculatable according to their semantics;
   keep debug and timer services non-speculatable as already required.

7. Constants and casts:
   - upper LDI8 35, cold LDI8 53;
   - upper LDI16 52, cold LDI16 71;
   - ZEXT8 37, SEXT8 38, BSWAP16 38, BOOL 38;
   - use two component costs for i32 constants.

8. Report vector operations as illegal and prohibit vectorization. Report jump
   tables as undesirable. Set unrolling preferences conservatively: do not
   unroll a loop when the duplicated body contains AS1 loads, division,
   floating division/square root, or system math services; otherwise permit
   only the target-independent default threshold using the AVM TTI costs.

Audit post-RA selection using the measured model:

- preserve upper-first allocation order for GPR16, PTR16, and GPR32;
- do not add a custom frequency-weighted register-allocation pass in this
  milestone;
- compact encodings whenever all constraints permit;
- dense encodings before cold encodings;
- compact MOV32 expansion;
- no unnecessary copies around q2/q3 arguments and returns;
- no boolean materialization before a branch;
- no address materialization for direct absolute data loads/stores;
- frequently accessed stack slots assigned the lowest offsets;
- serial-interpreter scheduling model enabled;
- vectorization and jump tables disabled.

Add tests:

- cost-model tests for every explicit TTI rule above and representative
  fixed/range/service costs;
- schedule tests for compact, full, dense, cold, AS1, branch, integer divide,
  floating, and service classes;
- straight-line llvm-mca tests proving that the one-resource model sums the
  measured cycle costs without overlap;
- codegen tests proving the measured shift and CMOV choices;
- a check that -Os/-Oz can choose a smaller sequence even when it is slower.

Create a small freestanding C regression corpus and test -O0, -O2, -Os, and
-Oz. The -O2 checks must include:

- uint16_t add(a,b): one compact ADD plus RET;
- uint16_t inc(a): INC16 plus RET;
- uint8_t load(const uint8_t *p): one byte load plus RET;
- uint32_t add32(a,b): one ADD32 plus RET;
- float addf(a,b): one FADD plus RET;
- compare-and-branch: CMP/TST plus one relaxable branch with hot fallthrough;
- scalar select: CMP/TST plus CMOV;
- direct call: RELAX_CALL;
- indirect call: CALLP;
- upper-pair MOV32: two compact MOV instructions;
- ordinary global byte load: direct absolute load where legal;
- AS1 pointer iteration: native postincrement LDP;
- left shifts by 1, 2, 3, and 4 use the exact threshold policy.

Compile the corpus with clang -ffreestanding to assembly and ELF objects, link
a minimal no-runtime program with the existing AVM ld.lld target, and inspect
the result with llvm-readobj and llvm-objdump.

Do not make LLVM lit tests depend on an external AVM checkout. Add a documented
optional command that, when a local AVM checkout is provided through
AVM_BENCH_ROOT, builds the generated corpus with that checkout's interpreter
and compares measured straight-line cycles against the schedule model. A
mismatch greater than 2 cycles for fixed-cost instructions is a failure; do not
apply this threshold to data-dependent range-cost instructions.

Do not add GlobalISel, debug information, a hosted C library, an image packer,
helper-library implementations, or additional tune CPUs in this step.
```

# End state

After prompt 9, the expected supported path is:

```text
C / basic C++
    -> Clang AVM ABI lowering
    -> LLVM IR with AS0 data and AS1 functions/program data
    -> AVM TTI using measured interpreter costs
    -> SelectionDAG using avm-interpreter-32u4-v1 scheduling
    -> AVM semantic machine pseudos
    -> register allocation with upper-register preference
    -> post-RA compact/dense/cold instruction selection
    -> existing MC ELF writer
    -> existing AVM LLD linker and relaxation
```

This should support useful freestanding programs containing:

* Byte, 16-bit, and 32-bit integer code.
* Direct floating-point arithmetic.
* Globals, arrays, structures, pointers, and stack frames.
* Direct and indirect calls.
* Variadic functions.
* Small aggregate passing and returning.
* Program-space data and function pointers.
* System services.

The intentionally deferred work is GlobalISel, debug information, a hosted libc/libc++, helper-library implementations, jump-table policy, a custom frequency-weighted register-allocation-hint pass, worst-case-execution-time tooling, additional interpreter/native/JIT tune CPUs, stack-usage metadata format, source-level convenience syntax beyond generic address-space attributes, and final flat-image packaging.
