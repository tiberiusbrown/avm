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

4. Make avm1 the canonical and default CPU in AVM.td and all MC target setup.
   The name generic may remain as a compatibility alias with identical features.

5. Set AVMMCAsmInfo::MaxInstLength to 6.

6. Make AVMAsmBackend::writeNopData emit one 0x00 byte per requested byte.

7. Disable source-language _Float16 in AVMTargetInfo. Do not remove f16 from
   the LLVM data layout.

Add focused Clang and MC tests for these corrections. Do not make any codegen
classes, passes, or TargetMachine changes in this step.
```

## Prompt 2 — Codegen-correct register and instruction metadata

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

Do not add instruction-selection patterns or C++ codegen files yet. The output
of every existing llvm-mc and llvm-objdump test must remain byte-for-byte
unchanged.
```

## Prompt 3 — TargetMachine and minimal leaf codegen

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

Use:

- static relocation model;
- large code model;
- one-byte function and stack alignment;
- SelectionDAG;
- TargetLoweringObjectFileELF temporarily;
- no scheduling itinerary.

Implement codegen semantic pseudos for:

- 16-bit copy;
- 8- and 16-bit constants;
- ADD, SUB, AND, OR, and XOR;
- function return.

The post-RA pseudo expander must choose:

- compact one-byte form when all required operands are upper registers;
- the full-register form otherwise;
- compact immediate form for r4-r7;
- cold immediate form for r0-r3.

Implement enough lowering for no-argument and register-i16 leaf functions,
i16 returns in r4, constants, copies, and the five binary operations.

Required tests:

- empty function emits RET;
- uint16_t add(uint16_t a, uint16_t b) emits one compact ADD and RET at -O2;
- constants select compact or cold LDI according to the final register;
- MC output and object emission work through the existing emitter.
```

Simple C code should begin compiling after this prompt.

## Prompt 4 — Calls, calling convention, frames, and spills

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

## Prompt 6 — CC, branches, selects, shifts, multiply, and division

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

Implement scalar operation selection:

- INC16 and DEC16 combines;
- ADDI.S8 combines;
- MUL8, widening byte multiply, and MUL16;
- direct UDIV16, UREM16, SDIV16, and SREM16;
- one-bit shifts;
- FA immediate shifts for counts 0-15;
- FA variable shifts with upper-register operand classes;
- normal LLVM legalization for out-of-range constant shifts.

Disable jump-table generation for now and lower switch statements to branch
trees. Do not invent a jump-table format.

Add -O0 and -O2 tests for if/else, loops, zero tests, signed and unsigned
comparisons, boolean results, selects, switches, shifts, multiply, divide, and
remainder. Add checks that compare-and-branch emits no unnecessary CSET.
```

Ordinary integer C should have reasonable quality after this prompt.

## Prompt 7 — `i32`, `f32`, program pointers, and AS1 loads

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

Test long arithmetic, float arithmetic and comparisons, function pointers,
indirect calls, LLVM IR AS1 globals and loads, pointer arithmetic across a
64-KiB boundary, and canonicalization of loaded program pointers.
```

## Prompt 8 — Complete C ABI and Clang ABI lowering

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

## Prompt 9 — Services, optimization quality, and end-to-end gate

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

Audit and improve post-RA encoding selection:

- upper-register-first allocation for GPR16, PTR16, and GPR32;
- compact encodings whenever all constraints permit;
- dense encodings before cold encodings;
- compact MOV32 expansion;
- no unnecessary copies around q2/q3 arguments and returns;
- no boolean materialization before a branch;
- no address materialization for direct absolute data loads/stores;
- frequently accessed stack slots assigned the lowest offsets;
- register-pressure-oriented SelectionDAG scheduling;
- vectorization and jump tables disabled.

Create a small freestanding C regression corpus and test both -O0 and -O2.
The -O2 checks must include:

- uint16_t add(a,b): one compact ADD plus RET;
- uint16_t inc(a): INC16 plus RET;
- uint8_t load(const uint8_t *p): one byte load plus RET;
- uint32_t add32(a,b): one ADD32 plus RET;
- float addf(a,b): one FADD plus RET;
- compare-and-branch: CMP/TST plus one relaxable branch;
- scalar select: CMP/TST plus CMOV;
- direct call: RELAX_CALL;
- indirect call: CALLP;
- upper-pair MOV32: two compact MOV instructions;
- ordinary global byte load: direct absolute load where legal.

Compile the corpus with clang -ffreestanding to assembly and ELF objects, link
a minimal no-runtime program with the existing AVM ld.lld target, and inspect
the result with llvm-readobj and llvm-objdump. Do not add GlobalISel, debug
information, a hosted C library, an image packer, or implementations of the
runtime helper library in this step.
```

# End state

After prompt 9, the expected supported path is:

```text
C / basic C++
    -> Clang AVM ABI lowering
    -> LLVM IR with AS0 data and AS1 functions/program data
    -> SelectionDAG
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

The intentionally deferred work is GlobalISel, debug information, a hosted libc/libc++, helper-library implementations, jump-table policy, stack-usage metadata format, source-level convenience syntax beyond generic address-space attributes, and final flat-image packaging.
