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
all unrelated changes and do not restore files from older revisions. The LLVM
fork lives in `deps/llvm-project/`; make LLVM and Clang source changes there.

Always build and run LLVM targets in the Debug configuration. Build through
CMake, never by invoking Ninja, MSBuild, or another backend directly:

    cmake --build build --parallel

For a multi-config generator, add `--config Debug`, use Debug-built tools, and
pass `-C Debug` to CTest. For a single-config generator, verify that
`CMAKE_BUILD_TYPE=Debug` in `build/CMakeCache.txt` before building. Preserve the
existing generator and compiler unless explicitly directed otherwise.

On Windows only, when the configured generator is Ninja or Ninja Multi-Config
and the compiler is MSVC (`cl.exe`), initialize the matching MSVC developer
environment before building and use that same shell for `cmake --build`. Match
the Visual Studio/MSVC installation recorded in `build/CMakeCache.txt`; a
mismatched or missing environment commonly appears as missing standard or
Windows headers and may also cause ABI or linker failures. Locate Visual Studio
with `vswhere.exe` and invoke `vcvars64.bat` or `VsDevCmd.bat` as needed. Do not
hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain
header paths to CMake files. Do not perform this setup on non-Windows systems,
with non-MSVC compilers, or for Visual Studio/MSBuild generators unless the
configured build actually requires it.

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
- reject every LLVM IR `addrspacecast` between AS0 and AS1 in either direction;
  do not lower one to truncation, extension, masking, or a bitwise copy;
- accept a null pointer already typed in either address space; creating an AS0
  or AS1 null value does not require an `addrspacecast`;
- lower direct function calls to RELAX_CALL;
- lower indirect function-pointer calls to CALLP;
- support packed three-byte function pointers in memory.

Use deterministic backend diagnostics for invalid IR:

```text
AVM address space 1 is read-only
AVM does not support casts between address spaces 0 and 1
```

Accept AS1 constant arrays emitted by Clang for flash strings. A global of the
form

```llvm
@.avm.flashstr.N = private addrspace(1) constant [N x i8] ..., align 1
```

must be placed in `.rodata`, addressed with the existing AS1 `%lo16`/`%hi8`
relocations, and loaded only through `LDP*`. It must never be copied into the
AS0 startup data image. Do not require `unnamed_addr`; same-translation-unit
pooling is implemented by reusing one global rather than relying on LLVM to
merge or duplicate address-insignificant constants. This is ordinary AS1 global
lowering, not a new LLVM IR intrinsic. Add a positive IR test containing one
such global and a function that returns its `ptr addrspace(1)` address and loads
a byte from it.

Support static initializers containing AS1 addresses. Audit the existing MC,
object-writer, and LLD paths for `R_AVM_PROG24` and fix them if necessary so a
`ptr addrspace(1)` constant can initialize either an AS0 `.data` object or an
AS1 `.rodata` object. The relocation writes `S + A` as a three-byte
little-endian program address and must diagnose overflow rather than truncate.
Add object tests for both section destinations and a linked test proving the
final three bytes resolve to the flash-string symbol address. This is required
for file-scope `F()` pointer variables and tables in Prompt 8.

Establish the canonical LLVM IR representation for program-space copies before
the Clang builtin is added in Prompt 8:

```llvm
call void @llvm.memcpy.p0.p1.i16(
    ptr %dst,
    ptr addrspace(1) %src,
    i16 %size,
    i1 false)
```

This is the ordinary overloaded LLVM `memcpy` intrinsic with an AS0 destination
and AS1 source. Do not add `llvm.avm.memcpy.p`, do not insert an
`addrspacecast`, and do not convert the source to an integer merely to bypass
the address-space type system. At this prompt, add IR verifier/round-trip tests
showing that the intrinsic retains the two pointer address spaces and the i16
length. Full machine lowering to `SYS 0x10` belongs to Prompt 9; do not create a
temporary AS0 libcall lowering that would misrepresent the source memory space.

Add `llvm/test/CodeGen/AVM/as1-invalid.ll` as a `split-file` test containing
separate modules and separate `not --crash llc` RUN lines for:

- an i8 store through `ptr addrspace(1)`;
- an i16 store through `ptr addrspace(1)`;
- `addrspacecast ptr %p to ptr addrspace(1)`;
- `addrspacecast ptr addrspace(1) %p to ptr`;
- an `addrspacecast` whose result is used only by a comparison, proving that
  unused-memory behavior does not make the cast legal.

Each RUN line must check the exact diagnostic above. Add a positive companion
`llvm/test/CodeGen/AVM/as1-valid.ll` proving that typed AS0 and AS1 null values,
same-address-space pointer copies, same-address-space comparisons, and AS1
loads of i8/i16/i24/i32 compile without an `addrspacecast`.

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
64-KiB boundary, canonicalization of loaded program pointers, the complete
positive and negative address-space IR matrix above, and exact invalid-IR
diagnostics.
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
- normalized q2 return for program and function pointers, with bits 31:24
  zero at the ordinary ABI boundary;
- i64 arguments and returns in all four units when available;
- stack packing without implicit padding.

Apply the revised AS1 register-container contract without changing the LLVM
data layout or source-level pointer type:

- `ptr addrspace(1)` remains a fully defined 24-bit LLVM pointer and has
  `sizeof == 3`;
- the fourth byte of the target `GPR32` container is backend-only padding and
  must never become visible in Clang IR, AST constant evaluation, debug types,
  object layout, or C/C++ type behavior;
- ordinary program- and function-pointer arguments and returns remain
  normalized ABI values with container bits 31:24 zero;
- packed stack arguments, globals, fields, arrays, and static initializers
  remain exactly three bytes with one-byte alignment;
- source-level equality and relational operations compare the logical 24-bit
  pointer values, never target padding;
- a cast from an AS1 pointer to `uint32_t` or another wider integer produces a
  zero-extended 24-bit value;
- a cast from an integer to an AS1 pointer uses the low 24 bits;
- do not introduce an implicit AS0/AS1 conversion or represent the padding byte
  as source-level `undef`, poison, or storage.

Extend Clang ABI and CodeGen tests to cover a computed AS1 pointer passed to and
returned from an ordinary function, `sizeof` and alignment of AS1 pointers,
packed AS1 pointer arrays and structures, pointer equality, and pointer-to-i32
conversion. The IR must continue to use `ptr addrspace(1)` rather than exposing
a synthetic i32 container.

Implement variadic functions:

- every argument, including named arguments, is passed on the stack;
- default argument promotions apply first;
- va_list is an AS0 16-bit pointer;
- lower VASTART, VAARG, VACOPY, and VAEND;
- the initial va_list points at the first argument byte above the return
  address.

Implement the target's full inline-assembly constraint set and correct physical
register names and aliases. Do not leave the current r-only implementation.

Implement the target-specific Clang builtin
`__builtin_avm_flash_string` during this prompt. It is a Clang source builtin,
not an `llvm.avm.*` IR intrinsic and not a runtime call.

Use this exact source contract:

```c
const char __attribute__((address_space(1))) *
__builtin_avm_flash_string(const char literal[]);
```

The apparent prototype above documents the type only. Register it as an AVM
target builtin and perform custom semantic checking:

- add `clang/include/clang/Basic/BuiltinsAVM.def` containing the target builtin;
- add an `AVM` builtin-ID namespace to
  `clang/include/clang/Basic/TargetBuiltins.h`;
- have `AVMTargetInfo::getTargetBuiltins()` expose the table;
- use builtin type encoding `cC*1cC*0` and attributes `nctE`: the result is a
  pointer in address space 1 to const char, the apparent argument is a pointer
  in address space 0 to const char, `t` requests custom checking, and `E`
  identifies the builtin as frontend constant-evaluable;
- add `clang/lib/Sema/SemaAVM.cpp`, its declaration in `Sema.h`, its CMake entry,
  and the target dispatch needed to call `Sema::CheckAVMBuiltinFunctionCall` for
  AVM builtin IDs;
- require exactly one argument;
- strip parentheses and implicit casts and require the original argument to be
  a `StringLiteral` of ordinary narrow kind. Concatenated ordinary narrow
  tokens are accepted because Clang represents them as one `StringLiteral`;
- reject variables, conditional expressions, compound literals, wide literals,
  UTF-8 literals, UTF-16 literals, and UTF-32 literals with the stable
  diagnostic `argument to '__builtin_avm_flash_string' must be an ordinary narrow string literal`;
- permit the builtin both within functions and in static-storage initializers;
  it must be a constant address expression suitable for C file-scope and static
  local initialization, aggregate initialization, and C++ `constexpr` and
  `constinit` pointer initialization;
- the result type is exactly
  `const char __attribute__((address_space(1))) *`, so normal Clang overload
  resolution and the AS0/AS1 conversion diagnostics apply without helper-class
  casts.

Implement constant evaluation and IR emission directly in Clang:

- represent the builtin as a true compile-time address of a conceptual
  static-duration AS1 array, not as a call result. Prefer a narrowly scoped
  special case for the target builtin; do not add a new AST node unless the
  existing constant-value representation cannot retain the pooled-object
  identity correctly;
- implement the builtin in both Clang constant-evaluation engines so behavior
  does not depend on whether `-fexperimental-new-constant-interpreter` is used;
- the required constant-expression scope is pointer formation and propagation:
  static scalar and aggregate initialization, C++ `constexpr`, and C++
  `constinit`. Constexpr dereferencing of the flash bytes, use as a non-type
  template argument, and other deeper constexpr memory operations are outside
  this milestone and need not be added;
- add a dedicated `CodeGenModule` helper and per-module cache for AVM flash
  strings; both function-body builtin emission and constant global-initializer
  emission must use this same helper and cache. Do not emit a call or an LLVM
  intrinsic;
- key the cache by the complete emitted byte sequence including the implicit
  terminating null and by element width/address space. For this milestone only
  ordinary one-byte strings are accepted, but keep the key structurally capable
  of distinguishing element width;
- always pool identical builtin strings within one translation unit, independent
  of ordinary string-literal merging flags and regardless of whether the uses
  occur at file scope or within functions;
- do not pool an AS1 flash string with an ordinary AS0 string containing the
  same bytes;
- create exactly one LLVM global per cache entry with private linkage, address
  space 1, constant initializer, and alignment 1. Do not mark it
  `unnamed_addr`; pooling comes from reusing the cached global;
- name globals with the `.avm.flashstr.` prefix followed by a deterministic
  module-local sequence number;
- emit the builtin expression as a `ptr addrspace(1)` constant pointing at
  element zero of that global;
- add the AVM builtin case to the target-builtin path in
  `clang/lib/CodeGen/CGBuiltin.cpp` and the corresponding constant-emitter path
  used by static initializers; do not modify generic string-literal semantics;
- a file-scope AS1 pointer object in AS0 `.data` must use `R_AVM_PROG24` to
  initialize its three-byte value. An AS1 pointer table explicitly placed in
  AS1 `.rodata` uses the same relocation for each element;
- never emit a dynamic initializer, runtime helper, or `llvm.global_ctors` entry
  for this builtin;
- guarantee same-translation-unit pooling as an implementation requirement,
  but document source-level pointer identity between distinct invocations as
  unspecified. Do not add COMDAT or cross-translation-unit pooling
  requirements; LTO or a future linker may merge further.

Add `clang/test/Sema/avm-flash-string.c` and
`clang/test/SemaCXX/avm-flash-string.cpp` covering valid ordinary and
concatenated literals, rejection of every nonliteral/prefixed-literal category,
the exact AS1 result type, C++ overload selection, AS1-to-AS0 assignment
rejection, C file-scope/static-local scalar and aggregate initializers, and C++
`constexpr`/`constinit` pointer initialization. Run these tests as C++20 and
run the constant-expression cases both with the default evaluator and with
`-fexperimental-new-constant-interpreter`.

Add `clang/test/CodeGen/avm-flash-string.c` and a C++ companion proving:

- file-scope, static-local, and function-expression uses of
  `__builtin_avm_flash_string("Hello")` in one translation unit reference one
  and only one `.avm.flashstr.*` AS1 global;
- `__builtin_avm_flash_string("Hell" "o")` reuses that same global;
- `__builtin_avm_flash_string("Hello\0")` creates a distinct seven-byte
  global;
- an ordinary `"Hello"` expression remains a distinct AS0 string object;
- every flash-string global is `private addrspace(1) constant`, has alignment
  1, includes its terminating null, is not `unnamed_addr`, and is referenced as
  `ptr addrspace(1)`;
- an AS0 file-scope pointer variable and an AS0 array of AS1 pointers contain
  constant `ptr addrspace(1)` initializers rather than runtime code;
- an explicitly AS1 pointer table is emitted in `.rodata` and contains the same
  constant AS1 references;
- C++ `constexpr` and `constinit` pointer globals produce no dynamic
  initialization and no `llvm.global_ctors` entry;
- no runtime call and no `addrspacecast` is emitted.

Document the extension in `clang/docs/LanguageExtensions.rst`, including the
argument restriction, exact AS1 result type, static-initializer and
`constexpr`/`constinit` support, same-TU pooling, unspecified pointer identity,
and the explicitly deferred deeper constexpr operations.

Also add the target-specific Clang builtin
`__builtin_avm_memcpy_p`. This is a source builtin whose IR representation is
the generic cross-address-space LLVM `memcpy` intrinsic, not an
`llvm.avm.memcpy.p` intrinsic and not a runtime call.

Use this exact source contract:

```c
typedef const void __attribute__((address_space(1))) *avm_progmem_cptr;

void *__builtin_avm_memcpy_p(
    void *dst,
    avm_progmem_cptr src,
    uint16_t size);
```

Implement it in the existing AVM target-builtin table and target CodeGen path:

- add it to `clang/include/clang/Basic/BuiltinsAVM.def`;
- use builtin type encoding `v*0v*0vC*1Us` and attribute `n`: the result and
  destination are AS0 `void *`, the source is AS1 `const void *`, and the size
  is an unsigned 16-bit value;
- rely on the builtin type for ordinary pointer and integer conversions; do not
  permit an AS0 source, insert an address-space cast, or add a helper-class
  conversion;
- evaluate every source argument exactly once using Clang's ordinary
  call-argument evaluation rules. Preserve the language's sequencing rules;
  do not hand-expand the expression in a way that duplicates or reorders
  side-effecting arguments beyond what an ordinary call permits;
- emit the destination, source, and size values with types `ptr`,
  `ptr addrspace(1)`, and `i16`;
- emit a nonvolatile generic `llvm.memcpy.p0.p1.i16` with one-byte source and
  destination alignment;
- the LLVM intrinsic returns `void`, so return the original evaluated `dst`
  value as the builtin expression result;
- emit no runtime call, no `llvm.avm.memcpy.p`, no `addrspacecast`, and no
  integer round trip;
- the builtin has ordinary `memcpy` overlap semantics: overlapping source and
  destination objects are outside its contract. It may read AS1 and write AS0
  but has no other side effects.

Add `clang/test/Sema/avm-memcpy-p.c` and a C++ companion proving:

- AS1 `char`, byte-array, structure, and `void` pointers convert to
  `avm_progmem_cptr`;
- an AS0 source is rejected with the normal address-space diagnostic;
- the result converts to `void *` and appropriately typed AS0 object pointers;
- the size argument is converted to 16 bits;
- C and C++ diagnose the same invalid address-space uses.

Add `clang/test/CodeGen/avm-memcpy-p.c` and a C++ companion proving:

- the emitted IR is exactly an AS0-destination, AS1-source
  `llvm.memcpy.p0.p1.i16`;
- the builtin result is the already evaluated destination pointer;
- side-effecting destination, source, and size expressions are each evaluated
  once;
- there is no runtime call, AVM target memcpy-P intrinsic, `addrspacecast`, or
  pointer/integer conversion;
- constant and dynamic sizes both retain an i16 length before optimization.

Enforce the AVM source-language address-space contract in Clang:

- AS0 and AS1 are disjoint; neither is a superset of the other;
- an AS0 pointer is not implicitly convertible to an AS1 pointer;
- an AS1 pointer is not implicitly convertible to an AS0 pointer;
- C explicit casts and C++ `static_cast`, `reinterpret_cast`, `const_cast`, and
  C-style casts may not change a pointer between AS0 and AS1;
- a null pointer constant may initialize or be assigned to either pointer type;
- copies, initialization, argument passing, returns, comparisons, and
  conditional expressions using two pointers in the same address space remain
  valid;
- a conditional expression mixing AS0 and AS1 pointers is invalid;
- pointer subtraction and relational comparison between AS0 and AS1 pointers
  are invalid;
- dereferencing an AS1 pointer for a load is valid;
- every source-level store through an AS1 pointer is diagnosed, regardless of
  whether the pointee type was written with `const`. AS1 is architecturally
  read-only, not merely conventionally const.

Do not rely only on Clang's generic address-space tests. Add these target tests:

1. `clang/test/Sema/avm-address-spaces.c`, run with:

   ```text
   %clang_cc1 -triple avm -fsyntax-only -verify %s
   ```

2. `clang/test/SemaCXX/avm-address-spaces.cpp`, run with:

   ```text
   %clang_cc1 -triple avm -std=c++17 -fsyntax-only -verify %s
   ```

Both files must use AS1 pointees declared with
`__attribute__((address_space(1)))` and must cover this exact matrix in both
directions wherever the language construct exists:

- pointer declaration initialization;
- simple assignment;
- function argument passing;
- returning from a function;
- mixed-address-space conditional operator;
- explicit cast;
- subtraction and relational comparison;
- attempted AS1 store;
- legal same-address-space initialization, assignment, argument passing,
  return, equality comparison, and dereference load;
- legal initialization and assignment from `0`, `NULL` in C, and `nullptr` in
  C++.

Use `expected-error` checks containing stable diagnostic substrings rather than
line-number-sensitive full diagnostics. The implicit-conversion checks must
contain `changes address space of pointer`; explicit-cast checks must contain
`cast` and `address space`; AS1 store checks must contain `address space 1 is
read-only`. If generic Clang does not already provide the explicit-cast or
read-only-store diagnostics, add the smallest target-gated Sema implementation
needed to produce them; do not permit the constructs and defer failure to the
LLVM backend.

Add `clang/test/CodeGen/avm-address-spaces.c` proving that:

- a legal AS1 dereference emits `load ..., ptr addrspace(1)`;
- an ordinary data pointer remains `ptr` in AS0;
- a typed AS1 null is emitted as `ptr addrspace(1) null`;
- valid source emits no `addrspacecast`;
- `const char *p = "Hello"` uses an AS0 string literal;
- `const char text[] = "Hello"` defines an AS0 array initializer and does not
  require an AS1 temporary or `addrspacecast`.

Lower atomics according to the single-thread policy. Diagnose dynamic alloca,
variable-length arrays reaching the backend, unsupported address-space stores,
and statically known single-function frames larger than 256 bytes.

Add Clang ABI IR tests and LLVM CodeGen tests for every aggregate size from
zero through eight bytes, sret, byval, i64, variadic named and unnamed
arguments, va_arg advancement, narrow arguments, narrow returns, inline
assembly constraints, atomic expansion, both AVM source builtins, and every
address-space semantic and CodeGen case listed above.
```

## Prompt 9 — Services, TTI, measured optimization quality, and end-to-end gate

**Agent:** GPT-5.6 Sol, High reasoning.

```text
Finish the initial AVM codegen milestone.

Add the `llvm.avm.*` target intrinsics from the architecture specification and
lower them to service-specific machine pseudos with exact fixed physical uses,
definitions, preservation, and side-effect properties. Do not lower them
through an untyped generic-SYS IR operation.

`__builtin_avm_flash_string` is explicitly excluded from this intrinsic set:
Prompt 8 lowers it directly to an AS1 constant global and pointer.
`__builtin_avm_memcpy_p` is also excluded from the AVM target-intrinsic set:
Prompt 8 lowers it to generic AS0-destination, AS1-source `llvm.memcpy`, which
this prompt must recognize and lower to inline code or `SYS 0x10`.

Prompt 7 was completed under the earlier rule that every register-form
program pointer was immediately canonicalized. Apply the revised architecture
during this prompt and update the affected Prompt 7 CodeGen tests rather than
adding a separate follow-on milestone. Do not otherwise reopen completed
Prompt 7 work.

Model an AS1 pointer as a fully defined logical 24-bit `PROGPTR` held in a
32-bit `GPR32` container:

```text
meaningful pointer bits = 23:0
container padding       = 31:24
```

The padding byte is machine-level storage only. It is not an LLVM value bit and
must not be modeled as LLVM `undef` or poison.

Implement demand-driven program-pointer normalization:

1. Remove unconditional high-byte clearing from AS1 GEP/pointer arithmetic.
   A full `ADD32` or `SUB32` is legal when its low 24 bits implement the
   required modulo-`2^24` result. The resulting padding byte may be arbitrary.

2. Treat these as nonobserving program-pointer consumers that use only bits
   23:0 and therefore do not require normalization:

   - every ordinary and postincrement `LDP*` address;
   - `JMPP` and `CALLP`;
   - `SYS_MEMCPY_P`;
   - another program-pointer add/subtract;
   - a packed three-byte program- or function-pointer store.

3. Insert or preserve normalization before observing uses:

   - ordinary function-call arguments and ordinary pointer returns;
   - `ptrtoint` to an integer wider than 24 bits;
   - a full `CMP32` pointer comparison, unless a 24-bit-aware comparison is
     selected;
   - any conversion or operation that exposes the complete `GPR32` bit pattern;
   - inline assembly using a general 32-bit value constraint rather than the
     semantic `t` program-pointer constraint.

4. Add a semantic target node or pseudo such as
   `AVMISD::NORMALIZE_PROGPTR`. It clears only container bits 31:24 and must be
   inserted only where required. Track known-normalized values when practical,
   but correctness must not depend on global dataflow proving normalization.

5. Lower AS1 pointer equality and ordering using logical bits 23:0. The initial
   implementation may normalize both inputs and use `CMP32`; a direct
   low16-plus-high8 comparison is an optional later optimization.

6. Lower `ptrtoint ptr addrspace(1) to i32` as zero-extension of the logical
   24-bit value. Lower `inttoptr` using the low 24 bits and leave padding
   unspecified until a normalized consumer requires it.

7. Add DAG combines that remove
   `NORMALIZE_PROGPTR` immediately before `LDP*`, `JMPP`, `CALLP`, and
   `SYS_MEMCPY_P`. Prefer producing relaxed temporaries directly rather than
   relying only on cleanup combines.

8. Keep symbols, null pointers, packed three-byte loads, and ABI ingress values
   normalized when already convenient. Do not add work merely to make a local
   temporary normalized.

Implement:

- debug.putc and debug.break as ordered side-effecting operations;
- millis and millis32 as evolving-state operations that cannot be CSE'd,
  hoisted, duplicated, or speculated;
- floating math services as pure operations with fixed q0/q1 operands;
- AS0-to-AS0 `memcpy` through the dedicated `llvm.avm.memcpy` intrinsic and
  `SYS_MEMCPY` machine pseudo;
- AS1-to-AS0 `memcpy_P` through generic `llvm.memcpy.p0.p1.i16` and the
  `SYS_MEMCPY_P` machine pseudo;
- AS0 `memset` through the dedicated `llvm.avm.memset` intrinsic or generic
  `llvm.memset.p0.i16`, lowered to the `SYS_MEMSET` machine pseudo;
- AS0 `memmove` through the dedicated `llvm.avm.memmove` intrinsic or generic
  `llvm.memmove.p0.p0.i16`, lowered to the `SYS_MEMMOVE` machine pseudo;
- Clang builtins for the recommended __avm_* source interfaces;
- install `clang/lib/Headers/avm/pgmspace.h` as the public convenience
  header for program-space strings and copies, containing these interfaces
  plus normal include guards and the required `<stdint.h>` include:

  ```c
  #define AVM_PROGMEM __attribute__((address_space(1)))

  typedef const char AVM_PROGMEM *avm_flash_string_t;
  typedef const void AVM_PROGMEM *avm_progmem_cptr;

  #define AVM_PSTR(s) __builtin_avm_flash_string(s)
  #define F(s) AVM_PSTR(s)

  void *memcpy_P(void *dst, avm_progmem_cptr src, uint16_t size);

  #define memcpy_P(dst, src, size) \
      __builtin_avm_memcpy_p((dst), (src), (size))
  ```

  Declare the out-of-line function before defining the function-like macro.
  This preserves `&memcpy_P` as address-taking of the ordinary-ABI fallback
  symbol while normal call syntax selects the builtin. Do not define a helper
  class, cast away the address space, or hide the AS1 pointer type. The header
  is included explicitly as `<avm/pgmspace.h>`; do not inject `F` or
  `memcpy_P` into every compilation;
- recognized standard float libcalls where their semantics match;
- all specified runtime-helper symbol names for unsupported wide operations
  and memory operations.

Implement memory intrinsic code generation exactly as follows.

1. Add the dedicated AS0 copy target intrinsic:

   ```llvm
   declare ptr @llvm.avm.memcpy(ptr %dst, ptr %src, i16 %size)
   ```

   Define it in `llvm/include/llvm/IR/IntrinsicsAVM.td` with AS0 read/write
   memory effects matching nonvolatile `memcpy`. Lower it to a semantic
   `SYS_MEMCPY` machine pseudo. Also recognize ordinary nonvolatile
   AS0-to-AS0 generic LLVM `memcpy` and route dynamic or non-inline copies
   through the same pseudo. Retain Prompt 5's profitable small-constant inline
   expansion.

2. Add the dedicated AS0 fill target intrinsic:

   ```llvm
   declare ptr @llvm.avm.memset(ptr %dst, i16 %val, i16 %size)
   ```

   Define it in `llvm/include/llvm/IR/IntrinsicsAVM.td` with AS0 write-only
   memory effects matching nonvolatile `memset`. The intrinsic returns the
   original destination pointer and uses only the low eight bits of `%val`.
   Lower it to a semantic `SYS_MEMSET` machine pseudo.

   Also recognize ordinary nonvolatile generic LLVM memset:

   ```llvm
   call void @llvm.memset.p0.i16(
       ptr %dst,
       i8 %val,
       i16 %size,
       i1 false)
   ```

   Zero-extend the generic intrinsic's `i8` fill value to the 16-bit service
   operand. Retain Prompt 5's profitable small-constant store expansion and
   route dynamic or non-inline fills through `SYS_MEMSET`.

3. Add the dedicated AS0 move target intrinsic:

   ```llvm
   declare ptr @llvm.avm.memmove(ptr %dst, ptr %src, i16 %size)
   ```

   Define it in `llvm/include/llvm/IR/IntrinsicsAVM.td` with AS0 read/write
   memory effects matching nonvolatile, overlap-permitting `memmove`. The
   intrinsic returns the original destination pointer. Lower it to a semantic
   `SYS_MEMMOVE` machine pseudo.

   Also recognize ordinary nonvolatile generic LLVM memmove:

   ```llvm
   call void @llvm.memmove.p0.p0.i16(
       ptr %dst,
       ptr %src,
       i16 %size,
       i1 false)
   ```

   Retain Prompt 5's overlap-correct small-constant expansion and route dynamic
   or non-inline moves through `SYS_MEMMOVE`. Never replace a memmove with a
   memcpy representation unless analysis proves the ranges cannot overlap.

4. Recognize generic nonvolatile `llvm.memcpy` with an AS0 destination and AS1
   source. Never require or create an AVM-specific IR intrinsic for this case.
   Retain profitable small constant copies as inline `LDP*` loads plus AS0
   stores. Lower dynamic or larger copies to a semantic `SYS_MEMCPY_P` pseudo.

5. Give the pseudos these exact final physical interfaces:

   ```text
   SYS_MEMCPY:
       tied use/def r4 = dst
       use          r5 = src
       use          r6 = size
       encoding        = SYS 0x0F

   SYS_MEMCPY_P:
       tied use/def r4 = dst
       use          q3 = src
       use          r5 = size
       encoding        = SYS 0x10

   SYS_MEMSET:
       tied use/def r4 = dst
       use          r5 = val
       use          r6 = size
       encoding        = SYS 0x11

   SYS_MEMMOVE:
       tied use/def r4 = dst
       use          r5 = src
       use          r6 = size
       encoding        = SYS 0x12
   ```

   The physical order for `SYS_MEMCPY_P` is intentionally `dst`, `size`,
   `src`, even though the source signature remains `(dst, src, size)`. Do not
   insert an unused aligned argument slot or normalize `q3` solely for this
   service: `SYS 0x10` consumes `q3[23:0]` and ignores its padding byte.
   `SYS_MEMSET` naturally matches the ordinary AVM argument assignment for
   `(dst, val, size)`. `SYS_MEMMOVE` likewise matches the ordinary assignment
   for `(dst, src, size)`.

6. Use glued, parallel-copy-safe fixed-register setup and result extraction,
   analogous to call lowering but without an ordinary call-preserved register
   mask. Each `r4` destination operand is a tied input/output whose bit pattern
   is preserved by the service. Input-only `r5`, `r6`, and `q3` operands are
   uses, not clobbers, and remain valid after the instruction when live.

7. Preserve chain and memory semantics precisely:

   - `SYS_MEMCPY` reads AS0 and writes AS0;
   - `SYS_MEMCPY_P` reads AS1 and writes AS0;
   - `SYS_MEMSET` writes AS0 and reads no memory;
   - `SYS_MEMMOVE` reads AS0 and writes AS0, and its source and destination
     may overlap;
   - copy pseudos carry the original source and destination MachineMemOperands;
   - the fill pseudo carries the original destination MachineMemOperand;
   - preserve alias information, unknown or constant size, and one-byte
     alignment;
   - mark copy and move pseudos as loading and storing, and `SYS_MEMSET` as
     storing but not loading;
   - none of the pseudos is an ordinary call;
   - attach no generic side-effect flag broader than the actual memory effects;
   - do not speculate or move them across potentially aliasing accesses;
   - never select a service for a volatile generic `llvm.memcpy`,
     `llvm.memset`, or `llvm.memmove`. Leave volatile operations to
     conservative target-independent expansion or an explicitly correct
     volatile sequence;
   - preserve memmove overlap semantics in all transformations. Convert a
     memmove to memcpy only when nonoverlap is proven.

8. Preserve source-level return values efficiently. `llvm.avm.memcpy`,
   `llvm.avm.memset`, and `llvm.avm.memmove` directly return their tied
   destination results. Generic LLVM `memcpy`, `memset`, and `memmove` return
   `void`, but source-level builtins and
   library calls return their original `dst`; arrange the target nodes and tied
   destination values so common forms such as:

   ```c
   return memset(dst, val, n);
   return memmove(dst, src, n);
   return __builtin_avm_memcpy_p(dst, src, n);
   ```

   need no redundant save-and-restore or post-service copy when register
   constraints permit.

9. Keep the ordinary symbols `__avm_memcpy`, `memcpy`,
   `__avm_memcpy_P`, `memcpy_P`, `__avm_memset`, `memset`,
   `__avm_memmove`, and `memmove` as normal-ABI
   fallback or address-taken functions. Recognize direct noninterposable calls
   when legal and convert them to the same intrinsic representations. An
   out-of-line `memcpy_P` wrapper must shuffle its ordinary ABI arguments into
   `r4`, `q3`, and `r5` before `SYS 0x10`. An out-of-line memset wrapper needs
   no nonstandard argument shuffle because its normal ABI assignment is already
   `r4`, `r5`, and `r6`. The out-of-line memmove wrapper also needs no
   nonstandard shuffle.

Do not invent size-dependent cycle formulas for the services in this milestone.
For speed optimization, retain the existing measured small-copy, small-fill,
and overlap-correct small-move inline thresholds where available and otherwise
prefer the service for dynamic or larger operations. For `-Os`/`-Oz`, compare
final encoded bytes, including fixed-register setup copies.

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
   - cost small constant AS0 and AS1-source copies from the selected inline
     sequence; cost dynamic or larger copies as their service plus required
     fixed-register setup copies;
   - cost small constant fills from the selected inline store sequence; cost
     dynamic or larger fills as `SYS_MEMSET` plus required setup copies;
   - cost small constant memmoves from the selected overlap-correct sequence;
     cost dynamic or larger moves as `SYS_MEMMOVE` plus setup copies;
   - do not invent unmeasured per-byte cycle formulas for copy, fill, or move
     services;
   - volatile and atomic-compatible operations retain the same execution cost
     but carry their required ordering constraints.

6. Floating costs use the predetermined Typical values in AVMCycleCosts.def.
   Service intrinsic costs use their predetermined Typical values. Mark the
   pure math services expensive but speculatable according to their semantics;
   keep debug and timer services non-speculatable as already required.

7. Constants, casts, and program-pointer normalization:
   - upper LDI8 35, cold LDI8 53;
   - upper LDI16 52, cold LDI16 71;
   - ZEXT8 37, SEXT8 38, BSWAP16 38, BOOL 38;
   - use two component costs for i32 constants;
   - charge normalization only when an observing use or ordinary ABI boundary
     requires it;
   - assign zero normalization cost before `LDP*`, `JMPP`, `CALLP`,
     `SYS_MEMCPY_P`, pointer arithmetic, or packed three-byte stores.

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
- normalized padding at ordinary program-pointer argument and return boundaries;
- no high-byte normalization for temporary pointers used only by `LDP*`,
  `JMPP`, `CALLP`, `SYS_MEMCPY_P`, or packed three-byte stores;
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
- indexed temporary AS1 load:

  ```c
  uint8_t read_program_char(program_char *base, int32_t index) {
    return base[index];
  }
  ```

  lowers to pointer arithmetic plus `LDP8U` with no intervening or preceding
  high-byte `ZEXT8`/normalization whose only purpose is the load;
- computed indirect calls use `CALLP` without padding normalization when the
  pointer has no observing use;
- computed AS1 pointers passed to or returned from ordinary functions are
  normalized at the ABI boundary;
- AS1 pointer equality is unaffected by different machine padding bytes;
- AS1 `ptrtoint` to i32 zero-extends the logical 24-bit value;
- packed three-byte AS1 pointer stores do not normalize solely for the store;
- left shifts by 1, 2, 3, and 4 use the exact threshold policy.

Update any Prompt 7 checks that required unconditional pointer
canonicalization. Preserve tests that verify normalized `LDP24` results,
packed three-byte memory representation, symbol materialization, and ABI
boundaries; change tests for temporary arithmetic so they require the absence
of unnecessary normalization.

Add dedicated LLVM CodeGen tests for all four memory services:

- direct `llvm.avm.memcpy` lowers to `SYS 0x0F` with tied `r4`, source in `r5`,
  size in `r6`, and no call-preserved register mask;
- generic `llvm.memcpy.p0.p1.i16` lowers to `SYS 0x10` with tied `r4`, source in
  `q3`, and size in `r5`, without normalizing a temporary source pointer solely
  for the service;
- direct `llvm.avm.memset` lowers to `SYS 0x11` with tied `r4`, value in `r5`,
  and size in `r6`;
- eligible generic `llvm.memset.p0.i16` lowers to the same `SYS 0x11` pseudo,
  with its `i8` fill value zero-extended for `r5`;
- direct `llvm.avm.memmove` and eligible generic
  `llvm.memmove.p0.p0.i16` lower to `SYS 0x12` with tied `r4`, source in `r5`,
  and size in `r6`;
- final assembly proves there is no skipped `r5` argument slot for
  `memcpy_P`;
- input-only source, value, and size registers remain usable after their
  services, including all `r5` and `r6` inputs to `SYS_MEMMOVE`;
- returning the destination immediately after any operation introduces no
  unnecessary copy;
- only `low8(r5)` controls memset bytes, while the complete input register is
  preserved;
- small constant AS0 copies, fills, and moves retain Prompt 5's inline
  expansion, with memmove sequences remaining correct for overlap;
- small constant AS1-source copies use `LDP*` plus AS0 stores;
- dynamic and representative larger copies, fills, and moves select their
  services;
- volatile copies, fills, and moves do not select a service;
- surrounding may-alias loads and stores remain correctly ordered;
- `SYS_MEMSET` is modeled as a store but not a load;
- `SYS_MEMMOVE` is modeled as both a load and a store and does not carry
  nonoverlap assumptions;
- memmove is converted to memcpy only in a test where nonoverlap is proven;
- AS1-source copies emit no `addrspacecast`, integer pointer conversion, or
  ordinary AS0 memcpy libcall;
- test `-O0`, `-O2`, `-Os`, and `-Oz`, including cases where size and speed
  choose different legal implementations.

Add an end-to-end address-space gate using the Clang driver rather than only
`clang -cc1` or `llc`:

- compile a valid C file containing an AS1 byte load, an AS1 pointer increment,
  same-address-space copies, an AS1 null pointer, an ordinary string-literal
  pointer, and an AS0 character array initialized from a string literal;
- check the LLVM IR contains AS1 loads but no `addrspacecast`;
- check final assembly uses `LDP8U` and the postincrement LDP form where the
  source pattern permits it;
- include an indexed AS1 load whose computed pointer dies at the load and check
  that no padding-byte normalization is emitted;
- include a computed AS1 pointer crossing an ordinary call/return boundary and
  check that normalization is emitted there;
- include AS1 pointer equality and pointer-to-`uint32_t` conversion and verify
  logical 24-bit semantics;
- compile separate invalid C and C++ files with `not clang --target=avm` and
  verify failure for implicit AS0-to-AS1 conversion, implicit AS1-to-AS0
  conversion, explicit conversion in both directions, mixed conditional
  expressions, and AS1 stores;
- run the same invalid files at `-O0` and `-O2` to prove diagnostics occur in
  Sema and do not depend on optimization or backend reachability.

Add an end-to-end flash-string gate using the installed resource header:

- compile C and C++ files that include `<avm/pgmspace.h>` and call an AS1-aware
  function or C++ overload with `F("Hello")`;
- verify `F("Hello")` has type `avm_flash_string_t` and cannot initialize a
  `const char *`;
- use `F("Hello")` at file scope, in a static local initializer, and within a
  function, including one concatenated spelling, and verify the LLVM IR
  contains exactly one six-byte AS1 global for all identical uses;
- include a C file-scope scalar and aggregate of `avm_flash_string_t`, plus C++
  `constexpr` and `constinit` pointer globals, and prove no dynamic initializer
  or `llvm.global_ctors` entry is emitted;
- include both an AS0 table of AS1 pointers and an explicitly `AVM_PROGMEM` AS1
  table; inspect the object to verify `R_AVM_PROG24` relocations in `.data` and
  `.rodata`, then inspect the linked image to verify each three-byte
  little-endian address resolves to the correct flash-string symbol;
- verify an ordinary `"Hello"` in the same file remains AS0 and is not pooled
  with the AS1 object;
- verify final assembly places the bytes in `.rodata`, materializes a 24-bit
  program address, and uses `LDP8U` or its postincrement form while iterating;
- link the object and use `llvm-readobj`/`llvm-objdump` to prove the flash string
  is absent from the AS0 `.data` startup image;
- run the C++ constant-initializer tests with both constant evaluators;
- compile invalid nonliteral, prefixed-literal, and AS1-to-AS0 uses through
  `clang --target=avm` and check the stable Prompt 8 diagnostics;
- do not require constexpr dereferencing, non-type-template-argument support,
  or pooling across separately compiled translation units.

Add an end-to-end `memcpy_P` gate using `<avm/pgmspace.h>`:

- compile C and C++ calls using `memcpy_P(dst, F("Hello"), 6)` and dynamic AS1
  source/size arguments;
- verify Clang IR contains generic `llvm.memcpy.p0.p1.i16`, not
  `llvm.avm.memcpy.p`, an `addrspacecast`, or a runtime call;
- verify the builtin result is usable directly as the returned or assigned
  destination pointer;
- inspect final assembly and require `r4 = dst`, `q3 = src`, and `r5 = size`
  at `sys 0x10`, with no alignment hole or unnecessary shuffle;
- keep `&memcpy_P` valid and prove it refers to the ordinary-ABI fallback
  function rather than expanding the function-like macro;
- link and execute representative zero-length, one-byte, odd-sized, and
  boundary-crossing copies in the available AVM test harness, checking the
  exact AS1 bytes copied to AS0 and preservation of every non-result register;
- add negative C and C++ tests showing that an AS0 source is rejected before
  backend lowering.


Add an end-to-end `memset` gate through ordinary C and C++ source interfaces:

- compile calls to `memset(dst, val, n)`, `__builtin_memset`, and
  `__avm_memset`, including a form that immediately returns the result;
- verify Clang emits eligible generic `llvm.memset` or the dedicated
  `llvm.avm.memset` representation without an unnecessary runtime call;
- inspect final assembly and require `r4 = dst`, `r5 = val`, and `r6 = size`
  at `sys 0x11`;
- verify the generic intrinsic's `i8` fill is represented correctly in the
  16-bit `r5` service operand and that high input bits never change the filled
  byte;
- link and execute representative zero-length, one-byte, odd-sized, and
  boundary-reaching fills in the AVM test harness;
- check exact destination bytes, no writes outside the requested range,
  preservation of every input-only and unrelated register, `CC`, and `SP`;
- keep address-taking of `memset` and `__avm_memset` valid through their
  ordinary-ABI fallback symbols;
- test small constant fills for inline stores and dynamic or larger fills for
  `SYS 0x11`;
- prove volatile memset operations do not select `SYS 0x11`.


Add an end-to-end `memmove` gate through ordinary C and C++ source interfaces:

- compile calls to `memmove(dst, src, n)`, `__builtin_memmove`, and
  `__avm_memmove`, including a form that immediately returns the result;
- verify Clang emits eligible generic `llvm.memmove` or the dedicated
  `llvm.avm.memmove` representation without an unnecessary runtime call;
- inspect final assembly and require `r4 = dst`, `r5 = src`, and `r6 = size`
  at `sys 0x12`;
- keep address-taking of `memmove` and `__avm_memmove` valid through their
  ordinary-ABI fallback symbols;
- link and execute zero-length and identical-pointer cases and prove they
  perform no memory access;
- execute nonoverlapping moves in both relative address orders;
- execute overlapping `dst < src` and `dst > src` cases, including
  `dst - src == n - 1`, `dst - src == n`, and one-byte moves;
- verify exact temporary-array-equivalent results, no writes outside the
  destination range, and preservation of `r4`, `r5`, `r6`, every unrelated
  register, `CC`, and `SP`;
- test small constant moves for overlap-correct inline expansion and dynamic or
  larger moves for `SYS 0x12`;
- prove volatile memmove operations do not select `SYS 0x12`;
- add an optimization test proving memmove becomes memcpy only when alias
  analysis proves nonoverlap.

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
    -> LLVM IR with AS0 data, AS1 functions/program data, typed memcpy
       operations (`llvm.avm.memcpy` or generic AS0<-AS1 `llvm.memcpy`), and
       `llvm.avm.memset` or generic AS0 `llvm.memset`, and
       `llvm.avm.memmove` or generic AS0 `llvm.memmove`
    -> AVM TTI using measured interpreter costs
    -> SelectionDAG using avm-interpreter-32u4-v1 scheduling
    -> logical 24-bit PROGPTR values in GPR32 with demand-driven normalization
    -> AVM semantic machine pseudos, including SYS_MEMCPY, SYS_MEMCPY_P,
       SYS_MEMSET, and SYS_MEMMOVE
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
* Program-space data, pooled `F("...")` strings, function pointers, and
  relaxed temporary PROGPTR padding.
* Optimized AS0 copies, AS1-to-AS0 copies, AS0 fills, and overlap-safe AS0
  moves.
* System services.

The intentionally deferred work is GlobalISel, debug information, a hosted libc/libc++, helper-library implementations, jump-table policy, a custom frequency-weighted register-allocation-hint pass, worst-case-execution-time tooling, additional interpreter/native/JIT tune CPUs, stack-usage metadata format, source-level convenience syntax beyond `<avm/pgmspace.h>` and `F("...")`, and final flat-image packaging.
