# Step-by-Step Implementation Plan for an LLVM Backend Targeting AVM

## Purpose

This document is a sequence of implementation prompts intended to be handed, one at a time and in order, to a small AI coding agent. Each prompt deliberately limits scope, identifies the expected LLVM subsystem, and requires tests and a clean build before the agent stops.

The source of truth for the target is `docs/arch.md`. The LLVM fork is located at `deps/llvm-project`. The plan assumes the AVM Version 1 architecture described by that specification, including:

- The target triple `avm-unknown-arduboyfx` as the preferred canonical spelling.
- Eight 16-bit architectural registers, with `r4-r7` forming the compact register class `c0-c3`.
- Distinct 16-bit data-space pointers in address space 0 and 24-bit program-space/function pointers in address space 1.
- Little-endian data, one-byte scalar and stack alignment, a 16-bit `int`, and a 256-byte VM stack.
- Explicit architectural `FLAGS` and `PB` dependencies.
- GlobalISel as the initial instruction-selection framework.
- Generic/full-register machine instructions before register allocation, followed by a post-register-allocation compact-encoding pass.
- Little-endian ELF relocatable objects, an early restricted single-object assembly-to-image path for simulator testing, an AVM-aware LLD port, and a production flat-image writer that creates the AVM header and tail locator.

The plan uses current LLVM concepts—target registration, TableGen descriptions, the MC layer, GlobalISel's `CallLowering`, `LegalizerInfo`, `RegisterBankInfo`, and `InstructionSelector`, MIR tests, and LLD target support. Exact APIs must always be taken from the checked-in fork rather than copied blindly from online documentation.

This revision is anchored to the supplied top-level `CMakeLists.txt` and the current diff against `deps/llvm-project`. The diff is a snapshot of work already started, not a patch that later agents should blindly reapply. Each step assumes both the top-level repository and the nested `deps/llvm-project` repository are clean before the step starts. During and after the step, the staged, unstaged, and untracked changes in both repositories are authoritative.

## Independent review workflow

Each implementation step should be reviewed in a fresh agent session before its changes are accepted when the step is marked **Independent review: Recommended**, and whenever a lower-risk step produces surprising changes or unresolved failures.

The implementation workflow assumes that **both Git repositories are clean immediately before each step begins**:

- The top-level AVM repository at the repository root.
- The nested LLVM repository at `deps/llvm-project`.

Consequently, the union of the current changes in those two repositories is the complete review scope for the step. The top-level repository may report only that `deps/llvm-project` is dirty; that is not sufficient. The reviewer must inspect the nested repository's own status, staged diff, unstaged diff, and untracked files directly.

Independent review is strongly recommended after Steps **5, 8, 11, 15, 17, 21-24, 26, 28, 32-33, 36, 38-41, and 46**. It is optional for lower-risk steps unless the implementation produced surprising changes, broad target-independent edits, or unresolved failures.

### How to combine the reviewer prompt with a step prompt

1. Start a fresh reviewer session in the same working tree after the implementation agent stops and before committing, accepting, reverting, or otherwise altering the step's changes.
2. Paste the complete **Reusable reviewer prompt** below.
3. Immediately after it, paste the complete original **Agent prompt** from the implementation step being reviewed. Do not paste only the step title, goal, or acceptance checklist; the reviewer needs the full copyable prompt.
4. Do not paste the entire plan unless the reviewer identifies a specific need for broader context. The reusable reviewer prompt followed by the original step prompt is the intended complete input.
5. Do not include the step's **Recommended agent profile** line in the copied implementation prompt. Model recommendations are plan-execution metadata, not implementation requirements or review criteria.
6. The reviewer should inspect and test the implementation rather than relying on the implementation agent's summary. It may make narrowly scoped corrections that are clearly required by the reviewed step, but it must not start later steps or rewrite the implementation wholesale.

The combined reviewer input should have this shape:

```text
[Reusable reviewer prompt from this header]

[Complete Agent prompt from the step being reviewed]
```

### Reusable reviewer prompt

```text
You are independently reviewing one completed step of the AVM LLVM backend plan. The complete original Agent prompt for that step follows this reviewer prompt and defines the entire intended scope, requirements, acceptance checks, and deliverables. Treat that following prompt as the specification for this review. Do not implement later steps.

Assume that both Git repositories were clean immediately before the implementation step began:
1. the top-level AVM repository at the current repository root; and
2. the nested LLVM repository at `deps/llvm-project`.

The union of all current staged, unstaged, and untracked changes in those two repositories is therefore the complete implementation to review. Inspect both repositories explicitly. At minimum, run the equivalent of:

Top-level repository:
- `git status --short`
- `git diff --stat`
- `git diff`
- `git diff --cached --stat`
- `git diff --cached`
- `git ls-files --others --exclude-standard`

Nested LLVM repository:
- `git -C deps/llvm-project status --short`
- `git -C deps/llvm-project diff --stat`
- `git -C deps/llvm-project diff`
- `git -C deps/llvm-project diff --cached --stat`
- `git -C deps/llvm-project diff --cached`
- `git -C deps/llvm-project ls-files --others --exclude-standard`

Open and review the full contents of every newly created untracked file in either repository because ordinary `git diff` does not include those files. The top-level repository may merely show `deps/llvm-project` as dirty; always inspect the nested repository directly. Do not review unrelated historical commits unless a current change requires context.

Refer to `docs/arch.md` as the architectural source of truth. The LLVM fork is in `deps/llvm-project`. Use the repository-root `CMakeLists.txt`, the existing `build/` directory, its configured generator, and only the Debug configuration. Every `cmake --build` command must include `--config Debug`; every `ctest` command must include `-C Debug`; direct tool invocations must use Debug artifacts. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with MSVC `cl.exe`, initialize the matching Visual Studio/MSVC developer environment before building, using the same installation and toolset that configured the tree. Use `vswhere.exe` and the matching `vcvars64.bat` or `VsDevCmd.bat` when needed. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to CMake files.

Review the implementation against every item in the following original step prompt. In particular:
- Verify that the combined changes across both repositories stay within the assigned step and do not implement later milestones.
- Verify architectural fidelity to `docs/arch.md`, including any ISA, ABI, ELF, linker, image-format, or address-space details relevant to the step.
- Verify that existing AVM work was extended rather than duplicated, accidentally reverted, or inconsistently implemented between the top-level repository and `deps/llvm-project`.
- Verify that source, TableGen, CMake, and test changes use APIs and conventions from the checked-in LLVM fork.
- Verify that tests meaningfully exercise the required behavior, including important negative and boundary cases, rather than merely increasing coverage superficially.
- Re-run the narrowest relevant Debug build and test commands needed to validate the step. Do not accept claimed test results without checking them when feasible.
- Check generated-file discipline, Markdown deliverable paths under `docs/llvm_plan/`, and the absence of unrelated cleanup in either repository.
- Identify correctness risks, missing acceptance criteria, weak diagnostics, unstable encodings or relocation numbers, and integration issues likely to break later steps.

Produce a review report with these sections:
1. Verdict: `ACCEPT`, `ACCEPT WITH MINOR FIXES`, or `REJECT`.
2. Scope reviewed: separately summarize the top-level repository changes and the `deps/llvm-project` changes, including staged, unstaged, and untracked files.
3. Findings: list issues in descending severity, with exact file and line references where possible.
4. Acceptance-criteria audit: mark each requirement from the original step prompt as satisfied, partially satisfied, or unsatisfied.
5. Build and test verification: list the exact commands run and their results.
6. Corrections made: list any narrowly scoped edits you made, or state that none were made.
7. Remaining risks or follow-up items: include only items relevant to this step; do not begin later steps.

If the implementation is correct, say so clearly and still document the evidence. If it is not correct, make only focused fixes that are unambiguously within this step; otherwise leave the code unchanged and explain precisely what the implementation agent must correct. Stop after the review and any focused corrections. Do not proceed to the next implementation step.
```

## Current repository and build snapshot

### Top-level CMake entry point

The repository root is the supported configuration entry point. Its current defaults are:

```cmake
LLVM_TARGETS_TO_BUILD=""
LLVM_EXPERIMENTAL_TARGETS_TO_BUILD=""
LLVM_ENABLE_PROJECTS="lld"
LLVM_BUILD_TOOLS=ON
```

The root project adds `deps/llvm-project/llvm` as the `llvm-build` subdirectory. These cache defaults intentionally produce a minimal LLVM + LLD tools build while the AVM code-generation target libraries do not yet exist. This configuration has been confirmed to configure and build successfully. Callers may override the cache values from the command line; agents must preserve that property and must not add `FORCE` to these settings.

Consequences for the plan:

- All steps configure and build from the repository root, not by treating `deps/llvm-project/llvm` as an unrelated standalone checkout.
- `build/` is the canonical and only normal build directory for this plan. Reuse it rather than creating `build-bootstrap`, `build-debug`, or other parallel directories.
- Every build uses the **Debug** configuration. Every `cmake --build` command must include `--config Debug`; every `ctest` command must include `-C Debug`; direct invocations of generated tools must use Debug artifacts, typically under `build/Debug/bin` for a multi-configuration generator.
- On Windows, a Ninja or Ninja Multi-Config build configured with MSVC requires the matching Visual Studio/MSVC developer environment. Agents must inspect `build/CMakeCache.txt`, use the same compiler installation/toolset that configured the tree, and launch builds from a shell initialized by the matching `vcvars64.bat` or `VsDevCmd.bat` when necessary.
- AVM is initially absent from `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD`. Keep it disabled through the target-independent scaffold steps. Enable it only after the AVM component group and skeletal target libraries exist.
- The default build should include target-independent tools such as `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, and `ld.lld`; AVM-specific behavior becomes available as the later target steps are completed.
- Clang is deliberately not enabled by default. The first Clang step explicitly reconfigures the same `build/` tree with `-DLLVM_ENABLE_PROJECTS="clang;lld"` while retaining the Debug configuration.
- Compiler-RT is also not enabled by the current root defaults. Runtime work must either opt into it explicitly in the same `build/` tree or use a clearly separate AVM runtime library.

A representative configuration is:

```text
cmake -S . -B build [existing generator/platform options]
cmake --build build --config Debug --target llc llvm-mc llvm-objdump llvm-readobj ld.lld
```

Do not switch or hard-code the existing generator, platform, or host architecture. The build-directory name is deliberately fixed to `build/`, and the build configuration is deliberately fixed to `Debug`.

### Windows Ninja/MSVC environment

Before building on Windows, inspect `build/CMakeCache.txt` to determine the configured generator and compiler. If the generator is Ninja or Ninja Multi-Config and the compiler is MSVC (`cl.exe`), the build command must run from a developer shell initialized for the same Visual Studio/MSVC installation and toolset that configured `build/`. Using another installed MSVC version can produce ABI mismatches or linker failures even when compilation appears to work.

A missing developer environment often first appears as failures to find standard-library, CRT, or Windows SDK headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h`. Treat those errors as an environment problem before changing source or CMake files.

When setup is required:

1. Read the generator and compiler paths recorded in `build/CMakeCache.txt`.
2. Locate installed Visual Studio instances with `vswhere.exe` and select the instance matching the cached compiler/toolset rather than blindly selecting the newest installation.
3. From one `cmd.exe` session, call the matching `vcvars64.bat` or `VsDevCmd.bat`.
4. Run `cmake --build build --config Debug ...` and any related test commands from that same initialized shell.

Do not hard-code Visual Studio release numbers, MSVC toolset versions, Windows SDK versions, installation paths, or SDK/header include directories. Do not work around environment setup by adding compiler or SDK header paths to the repository-root `CMakeLists.txt` or LLVM CMake files.

### Existing AVM integration shown by the current diff

The current diff already introduces part of the target-identity and ELF plumbing:

- `Triple::avm` is added to the target parser and is printed and parsed as `avm`.
- AVM is treated as a 16-bit-pointer, little-endian architecture using ELF, with no 32-bit, 64-bit, or big-endian variant.
- `EM_AVM = 0x4156` is introduced as a private development ELF machine value.
- LLVM ELF conversion helpers, ELF object identification, relocation-name lookup, and ELF YAML enumeration recognize AVM.
- `AVM` is added to `LLVM_ALL_EXPERIMENTAL_TARGETS`.
- LLD's ELF build and target dispatch are wired to `Arch/AVM.cpp` and `setAVMTargetInfo`.

The supplied diff does **not** show the implementation of `lld/ELF/Arch/AVM.cpp`, `llvm/include/llvm/BinaryFormat/ELFRelocs/AVM.def`, an AVM `TargetInfo` directory, an AVM backend directory, MC components, tests, or Clang support. Those files may be untracked or present outside the diff, so Step 1 must inspect the actual working tree before concluding they are absent.

The current patch therefore represents a partially connected scaffold. Early work must first make that scaffold self-consistent and test-covered before adding code generation. Do not duplicate existing `Triple::avm`, `EM_AVM`, object-format, or LLD registration changes. Do not renumber the provisional ELF machine value or relocation numbers casually; centralize and document any intentional change.

## Rules for running the prompts

1. Run the prompts in order. A later prompt may assume every earlier prompt is complete.
2. Give one prompt to one agent. Do not ask an agent to continue into the next step.
3. Keep each change buildable. Every prompt requires targeted tests and the relevant LLVM test-suite subset.
4. Use the repository-root `CMakeLists.txt` as the normal configuration entry point. Preserve command-line cache override behavior. The current minimal baseline leaves `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty until the skeletal AVM target libraries exist.
5. Use `build/` as the canonical build directory and reuse its existing CMake generator. Every `cmake --build` invocation must include `--config Debug`; every `ctest` invocation must include `-C Debug`; direct tool invocations must select Debug artifacts. Re-run root CMake only when a step explicitly requires a configuration change. Never switch generators in-place or create an alternate normal build directory.
6. On Windows, inspect `build/CMakeCache.txt` before building. If it records Ninja or Ninja Multi-Config with MSVC `cl.exe`, initialize the matching Visual Studio/MSVC developer environment and run the build from that same shell. Use `vswhere.exe` when needed to locate the matching installation, then call its `vcvars64.bat` or `VsDevCmd.bat`. Do not use a different MSVC version, hard-code Visual Studio/MSVC/Windows SDK versions, or add toolchain header paths to CMake files. Missing `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicates that this environment was not initialized.
7. Before editing, inspect staged, unstaged, and untracked changes in both the top-level repository and the nested `deps/llvm-project` repository. Use `git -C deps/llvm-project ...` for the nested repository rather than relying on the top-level repository merely reporting it as dirty. Extend existing AVM work; do not reapply or recreate changes already present.
8. Before the Clang phase, do not require `clang` to be in the default build. The default project list is currently `lld` only.
9. Place every Markdown document created or updated as a plan deliverable under `docs/llvm_plan/`. Create that directory when first needed. The architecture specification remains at `docs/arch.md` and must not be moved.
10. Do not silently change the ISA or ABI. When `docs/arch.md` is ambiguous or conflicts with LLVM requirements, record the issue in `docs/llvm_plan/avm-llvm-open-issues.md`, choose the least invasive temporary implementation only when necessary, and add a test that makes the temporary behavior visible.
11. Treat `EM_AVM = 0x4156` and any AVM relocation numbers as private development assignments until documented otherwise. Keep them centralized and stable within this fork.
12. Avoid broad cleanup. Touch unrelated targets or target-independent LLVM code only when registration or a genuinely missing generic hook requires it.
13. Prefer small MIR, LLVM IR, MC, object, Clang, and LLD `lit` tests over large end-to-end fixtures until the final phases.
14. Preserve generated-file discipline: edit TableGen and source inputs, not generated build outputs.
15. Beginning with Step 11, retain the restricted assembly-to-image path as a fast MC/interpreter regression route. Later linker and image work must extend the same image serialization and validation implementation rather than creating a second incompatible writer.
16. Use the per-step recommended model profile shown outside the copyable Agent prompt when available, but do not copy model recommendations into the implementation prompt. Run each implementation step in a fresh session with only that step's Agent prompt. For review, use a separate fresh session and combine the reusable reviewer prompt in the document header with the original step prompt exactly as instructed. Model choice never permits an agent to skip tests, exceed scope, or modify `docs/arch.md` silently.

## Recommended models and execution settings

These recommendations assume access to the GPT-5.6 coding-model family described below. Model availability and labels may vary by client; when an exact option is unavailable, use the nearest available coding model with equivalent reasoning depth. The model choice is an execution recommendation, not part of the AVM architecture or acceptance criteria.

### Default execution profile

Use the following profile for most substantive implementation steps:

```text
Model: GPT-5.6 Sol
Reasoning: High
Execution: One local/workspace coding agent with terminal and write access
Session: Fresh session for the individual step
Prompt context: Copy only that step's agent prompt
Repository state: Accepted output of all preceding steps
Network: Off or approval-required unless external documentation is genuinely needed
```

Use **GPT-5.6 Sol with Medium reasoning** for straightforward repository plumbing or documentation, and **GPT-5.6 Sol with Extra High reasoning** for the most architecture-sensitive ABI, legalization, address-space, linker, relaxation, and image-layout work. Escalate a difficult or failed Extra High attempt to **Sol Max** rather than immediately broadening the task.

### Other model profiles

- **GPT-5.6 Terra, Medium reasoning:** suitable for bounded audits, mechanical CMake integration, repetitive TableGen or test additions after the design is settled, straightforward build fixes, and documentation updates. Do not use Terra as the sole implementer for novel ABI, GlobalISel, address-space, or LLD design without a later Sol review.
- **GPT-5.6 Luna, Low or Medium reasoning:** reserve for narrow mechanical subwork such as generating repetitive test cases, inventorying files or symbols, renaming documented paths, or running a known command sequence. Do not assign an entire substantive backend step to Luna.
- **GPT-5.6 Sol Max:** use selectively when a High or Extra High run failed to converge, when several LLVM subsystem designs must be compared, when a change spans MC, CodeGen, ELF, and LLD, or when a proposed change would modify `docs/arch.md`.
- **Ultra/multi-agent mode:** use only for read-only or naturally separable audits, profiling analysis, test-matrix design, or final traceability review. Do not let multiple agents edit the same working tree concurrently. One primary agent must synthesize any parallel findings.

### Per-step profile notation

Each step below includes a **Recommended agent profile** outside its copyable Agent prompt. These profile lines are execution guidance only and must not be copied into the implementation or reviewer prompt. `Independent review: Recommended` means the implementation should receive the review described in the document header before the next dependent step begins. Model selection does not relax the step's scope, deliverables, build requirements, or acceptance checks.

## Recommended milestone gates

- **Gate 0 — Existing scaffold coherent:** the current AVM triple/ELF/LLD integration compiles from the root build, all referenced files exist, and focused target-parser/object/YAML/LLD smoke tests pass.
- **Gate A — Target recognized:** `llc`, `llvm-mc`, and `llvm-objdump` recognize the AVM target and canonical triple.
- **Gate B — MC round trip:** representative AVM assembly assembles, disassembles, and reassembles byte-for-byte.
- **Gate C — Runnable assembly image:** a restricted single-object path turns hand-written AVM assembly into a valid header/payload/tail image that can be loaded by the Arduboy interpreter or simulator.
- **Gate D — Minimal code generation:** an empty LLVM function lowers to valid AVM assembly and a `RET`.
- **Gate E — Core C subset:** integer arithmetic, branches, loads/stores, frames, and calls compile correctly.
- **Gate F — Harvard address spaces:** program pointers, `PB`, program loads, and indirect far calls work.
- **Gate G — Linkable Clang toolchain:** after explicitly enabling Clang, it emits AVM objects and LLD links them with AVM relocations.
- **Gate H — Production linked image:** the generalized image writer consumes linked ELF, preserves linker placement, and creates a conforming header, payload layout, CRC, padding, and tail locator.
- **Gate I — Hardened backend:** conformance, diagnostics, profiling, and optimization tests are in place.

## Official LLVM references

These are background references only. The checked-in source under `deps/llvm-project` is authoritative for exact class names and APIs.

- LLVM, *Writing an LLVM Backend*: https://llvm.org/docs/WritingAnLLVMBackend.html
- LLVM, *The LLVM Target-Independent Code Generator*: https://llvm.org/docs/CodeGenerator.html
- LLVM, *Porting GlobalISel to a New Target*: https://llvm.org/docs/GlobalISel/Porting.html
- LLVM, *GlobalISel Legalizer*: https://llvm.org/docs/GlobalISel/Legalizer.html
- LLVM, *GlobalISel InstructionSelect*: https://llvm.org/docs/GlobalISel/InstructionSelect.html
- LLVM, *Machine IR Format Reference*: https://llvm.org/docs/MIRLangRef.html
- LLVM, *TableGen Programmer's Reference*: https://llvm.org/docs/TableGen/ProgRef.html

---
## Step 1: Audit the current AVM scaffold and establish a reproducible root-build baseline

**Depends on:** None

**Goal:** Determine exactly which parts of the supplied AVM patch are already present, identify missing or untracked companion files, and document a reproducible baseline using the repository-root CMake configuration.

**Recommended agent profile:** `GPT-5.6 Terra` with `Medium` reasoning. This is a bounded repository audit and reproducibility task. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The initial minimal baseline leaves `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; do not enable AVM before the plan step that creates the skeletal AVM target component libraries. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests when appropriate, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Audit the partially implemented AVM target-identity/ELF/LLD scaffold and establish a reproducible baseline without changing production source files.

Required work:
1. Record the exact LLVM revision and inspect `git status --short`, `git diff -- deps/llvm-project`, and the equivalent untracked-file listing. Determine whether the current working tree contains files not visible in the supplied tracked diff.
2. Verify the current state of every already-started integration point: `Triple::avm`; little-endian/16-bit-pointer/ELF triple properties; `EM_AVM = 0x4156`; BinaryFormat conversion helpers; ELF object identification; relocation-name dispatch; ObjectYAML support; experimental-target registration; and LLD CMake/target dispatch hooks.
3. Specifically determine whether `deps/llvm-project/lld/ELF/Arch/AVM.cpp` and `deps/llvm-project/llvm/include/llvm/BinaryFormat/ELFRelocs/AVM.def` exist, are tracked, and are complete enough for the current build. Also search for any existing `llvm/lib/Target/AVM`, AVM tests, or Clang target code.
4. Inspect the root `CMakeLists.txt` and document how its cache defaults behave on a fresh configure and on a command-line override. Do not add `FORCE` or change the defaults in this step.
5. Configure from the repository root using the existing generator/platform choices. With the default project set, attempt to build at least `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, and `ld.lld`. Do not require `clang`, because the root default enables only LLD.
6. Run a narrow existing target-parser/object/YAML/LLD test subset that does not depend on a complete AVM backend. If the current scaffold prevents configuration, compilation, or linking, capture the first actionable error and map it to the exact missing or inconsistent integration point.
7. Create or update `docs/llvm_plan/avm-llvm-bringup.md` with the exact root configure/build/test commands, LLVM revision, build generator, enabled projects, discovered AVM files, and current pass/fail state.
8. Create or update `docs/llvm_plan/avm-llvm-open-issues.md` with sections for current-scaffold blockers, ISA/ABI questions, LLVM integration questions, and deferred optimization work.

Acceptance checks:
1. The documentation accurately distinguishes changes already present from work still missing.
2. The baseline uses the repository-root CMake entry point and does not assume Clang is enabled.
3. Any build failure is reduced to a concrete source-level blocker such as a missing `AVM.cpp`, missing `AVM.def`, unresolved registration symbol, or malformed relocation declaration.
4. No production source file is changed in this audit step.

Required deliverables: `docs/llvm_plan/avm-llvm-bringup.md`, `docs/llvm_plan/avm-llvm-open-issues.md`, and a concise inventory of existing, missing, and untracked AVM integration files.

Before finishing, run the narrowest relevant build and tests available in the current scaffold. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 2: Complete and test the target-independent AVM identity, ELF, and minimal LLD scaffold

**Depends on:** Step 1

**Goal:** Turn the partially connected current diff into a self-consistent, buildable, test-covered foundation without yet implementing AVM instruction encoding or code generation.

**Recommended agent profile:** `GPT-5.6 Sol` with `Medium` reasoning. The work is mostly target-independent plumbing, but it touches several shared LLVM and LLD registries. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The initial minimal baseline leaves `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; do not enable AVM before the plan step that creates the skeletal AVM target component libraries. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Assume Step 1 is complete. Do not implement instruction descriptions, MC encoding, GlobalISel, or full linker relocation semantics in this step. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Complete and verify the target-independent AVM architecture/triple, ELF identity, and minimal LLD work already started by the current diff while keeping AVM disabled in `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD`.

Required work:
1. Preserve and review the existing `Triple::avm` additions rather than adding a second architecture entry. Verify architecture-name parsing/printing, 16-bit default pointer width, little-endian classification, ELF default object format, and unsupported 32/64/big-endian variants.
2. Make `avm-unknown-arduboyfx` the canonical target triple required by `docs/arch.md`. Treat `arduboyfx` as the platform/OS component because it is the third triple component. Add the minimum target-parser support needed for stable parsing and normalization. Support `avm-none-arduboyfx` as an alias only if the checked-in triple conventions make that unambiguous; normalize and test whichever policy is chosen.
3. Preserve `EM_AVM = 0x4156` as the current private development value unless Step 1 found a documented conflict. Centralize its status in `docs/llvm_plan/avm-elf.md`; do not scatter numeric literals.
4. Review the current placement of `#include "ELFRelocs/AVM.def"` in `llvm/include/llvm/BinaryFormat/ELF.h`. Create or complete `ELFRelocs/AVM.def` if absent. Define stable development relocation numbers for at least `R_AVM_NONE`, `R_AVM_DATA16`, `R_AVM_PROG24`, `R_AVM_PROG_LO16`, `R_AVM_PROG_HI8`, `R_AVM_PCREL8`, `R_AVM_BANK16`, `R_AVM_FAR24`, and `R_AVM_RELAX`. Follow this fork's `.def` conventions and avoid collisions within the AVM namespace.
5. Complete the BinaryFormat, Object, ELFObjectFile, and ObjectYAML integration already begun. Add tests proving machine-name conversion, ELF YAML round trip, object-format naming, and relocation-name lookup.
6. Do not create or enable an LLVM AVM target component in this step. The current successful root configuration intentionally leaves `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; target-component registration is deferred until Step 3 can add a coherent skeletal component group and libraries.
7. Reconcile the existing LLD hooks. If `lld/ELF/Arch/AVM.cpp` is absent, add the smallest valid target implementation needed to keep the default root LLVM+LLD build linkable and to recognize `EM_AVM`. It may reject all non-`R_AVM_NONE` relocations with a clear unsupported-relocation diagnostic; full relocation application remains Step 38. If a stub already exists, test and tighten it rather than replacing it wholesale.
8. Add focused tests in the target-parser, BinaryFormat/ObjectYAML/Object, and LLD suites. Include at least one `yaml2obj`/`llvm-readobj` AVM ELF smoke test and one `ld.lld` target-selection test that does not pretend relocation support is complete.

Acceptance checks:
1. The existing `build/` tree builds the target-independent LLVM tools and `ld.lld` in Debug mode without attempting to resolve an `AVM` LLVM component library.
2. `avm-unknown-arduboyfx` parses and normalizes according to the documented policy.
3. AVM ELF objects are recognized as `elf32-avm`, use `EM_AVM = 0x4156`, and display AVM relocation names.
4. AVM remains disabled as a code-generation target in this step, so configuration does not fail with `Target AVM is not in the set of libraries`.
5. LLD recognizes AVM objects and either performs the explicitly supported minimal operation or emits a deliberate unsupported-relocation diagnostic.

Required deliverables: Completed target-independent scaffold, `ELFRelocs/AVM.def`, minimal coherent LLD target handling, `docs/llvm_plan/avm-elf.md`, and focused tests.

Before finishing, build through the repository-root CMake configuration and run the narrowest relevant LLVM and LLD test subsets. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 3: Create the target-machine, subtarget, and data-layout skeleton

**Depends on:** Step 2

**Goal:** Allow `llc` to construct an AVM `TargetMachine` and report the correct data layout, even though instruction selection is not yet functional.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Target-component and TargetMachine bring-up requires careful matching to the checked-in LLVM revision. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The initial minimal baseline leaves `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty. This is the first step permitted to enable AVM: create the complete skeletal AVM component group and libraries first, then reconfigure the existing `build/` tree with AVM enabled. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Allow `llc` to construct an AVM `TargetMachine` and report the correct data layout, even though instruction selection is not yet functional.

Required work:
1. Create the conventional AVM backend directory under `deps/llvm-project/llvm/lib/Target/AVM`, adapting names and structure to the checked-in fork. Add an AVM component group and the minimum coherent skeletal libraries expected by this LLVM revision, including target-info, MC-description, and code-generation components. Do not leave CMake referring to an `AVM` pseudo-component that has no backing library.
2. Implement minimal `LLVMInitializeAVMTargetInfo`, `LLVMInitializeAVMTarget`, and `LLVMInitializeAVMTargetMC` entry points, plus `AVMTargetMachine`, `AVMSubtarget`, and the minimal target pass configuration required for object/assembly code-generation setup. The MC registration may remain deliberately skeletal until later MC steps, but it must link cleanly.
3. After the component libraries exist, update or override the repository-root configuration so `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVM`, re-run CMake in the existing `build/` directory without changing generators, and build with `cmake --build build --config Debug`. Record the exact configure and build commands in `docs/llvm_plan/avm-llvm-bringup.md`.
4. Use the data-layout string from `docs/arch.md`: `e-m:e-p:16:8:8:16-p1:24:8:8:24-P1-G0-A0-i8:8:8-i16:8:8-i32:8:8-i64:8:8-f32:8:8-n8:16-S8`.
5. Set the default code model to large, the default relocation model to static unless the fork requires another explicit choice, and reject unsupported JIT assumptions rather than pretending they work.
6. Provide a basic target object-file lowering class that classifies address-space-zero globals as data-space objects and address-space-one constants/functions as program-space objects. Keep section details minimal until the section-layout step.
7. Add tests that construct a target machine and check the exact data layout, pointer sizes, endianness, function address space, stack alignment, native integer widths, and registered-target visibility.

Acceptance checks:
1. Root CMake configures successfully in `build/` with AVM enabled and no `Target AVM is not in the set of libraries` error.
2. The Debug build produces the AVM target component libraries and links `llc`, `llvm-mc`, and related tools.
3. `llc -mtriple=avm-unknown-arduboyfx` reaches the AVM backend and fails only at a clearly expected unimplemented code-generation point.
4. Data-layout tests confirm 16-bit AS0 pointers and 24-bit AS1 pointers with one-byte ABI alignment.
5. No fake instruction output is emitted.

Required deliverables: Coherent AVM component group, skeletal target-info/MC-description/code-generation libraries, AVM target-machine skeleton, subtarget, object-file-lowering skeleton, updated root target enablement, bring-up commands, and data-layout tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 4: Define the AVM register file and register classes

**Depends on:** Step 3

**Goal:** Model all allocatable registers, subregisters, compact classes, compound pairs, and special nonallocatable state in TableGen and target register-info code.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Register-class design is foundational and affects all later CodeGen work. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Model all allocatable registers, subregisters, compact classes, compound pairs, and special nonallocatable state in TableGen and target register-info code.

Required work:
1. Define physical 16-bit registers `R0-R7` and low-byte subregisters `B0-B7`, preserving the architecture's aliasing relationship rather than treating byte registers as independent storage.
2. Define register classes equivalent to `GPR16`, `CGPR16` (`R4-R7`), `GPR8`, and `CGPR8` (`B4-B7`). Ensure class ordering and allocation hints favor compact registers where requested but do not globally starve callee-saved registers.
3. Define even-aligned compound register pairs for `R0:R1`, `R2:R3`, `R4:R5`, and `R6:R7`, with subregister indices suitable for i32 and program-pointer values.
4. Model `SP`, `FLAGS`, `PB`, and any required `CB` dependency as special nonallocatable physical registers or target state according to the checked-in LLVM APIs. `SP` is the architectural stack pointer, while `FLAGS` and `PB` must be available for implicit operands.
5. Implement `AVMRegisterInfo`, including reserved registers, callee-saved sets (`R0-R3`), caller-saved sets (`R4-R7`), call-preserved masks, frame register selection, and register scavenging policy.
6. Add TableGen and MIR tests that verify subregister aliasing, pair composition, reserved registers, compact class membership, and ABI masks.

Acceptance checks:
1. `llvm-tblgen` outputs a coherent register model with no overlap or subregister-cycle errors.
2. The machine verifier accepts MIR using 8-bit subregisters and 16/32-bit pair registers.
3. The call-preserved mask matches the ABI in `docs/arch.md`.

Required deliverables: Register TableGen files, `AVMRegisterInfo`, generated integration, and MIR/register-info tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 5: Describe every concrete AVM instruction and encoding

**Depends on:** Step 4

**Goal:** Create a single authoritative TableGen instruction database covering the Version 1 ISA, including primary encodings, extension pages, operand constraints, flags, and control-flow properties.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. The full instruction/encoding model is broad and mistakes propagate into MC, CodeGen, and the interpreter. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Create a single authoritative TableGen instruction database covering the Version 1 ISA, including primary encodings, extension pages, operand constraints, flags, and control-flow properties.

Required work:
1. Create instruction-format classes for one-byte compact primary instructions, immediate forms, `0xF4` secondary instructions, `0xFD` memory extensions, `0xFE` far transfers, and `0xFF` return.
2. Define operand types for compact registers, full registers, low-byte registers, signed and unsigned immediates, RRSPEC fields, stack offsets, relative displacements, packed 24-bit program addresses, and memory operands.
3. Enter all concrete opcodes and secondary opcodes from `docs/arch.md`. Preserve reserved ranges as unassigned; do not create encodable placeholders for `0x50-0x6F` or reserved extension subopcodes.
4. Mark loads, stores, calls, returns, branches, barriers, side effects, and terminators accurately. Add implicit `FLAGS` and `PB` uses/defs where architectural behavior requires them. Mark flag-preserving instructions as not defining `FLAGS`.
5. Represent invalid operand overlaps such as postincrement load `destination == address` with verifier or late-expansion checks rather than silently encoding them.
6. Define non-encodable target pseudos needed later for generic branches, calls, frame indexes, program-pointer materialization, and post-RA compression. Keep pseudos in a separate file or clearly separated section.
7. Add TableGen record-dump tests or compile-time assertions that spot-check every opcode family and instruction length.

Acceptance checks:
1. The generated instruction enums contain all and only the Version 1 encodable operations plus clearly identified pseudos.
2. Instruction lengths and operand fields match `docs/arch.md` for representative values at field boundaries.
3. Reserved encodings cannot be emitted through ordinary instruction definitions.

Required deliverables: AVM instruction-format and instruction-definition TableGen files, target base-info helpers, and encoding-table tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 6: Implement MC assembly information and instruction printing

**Depends on:** Step 5

**Goal:** Make AVM `MCInst` objects printable in stable canonical assembly syntax.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. MC assembly information and printing are substantial but follow the settled instruction model. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Make AVM `MCInst` objects printable in stable canonical assembly syntax.

Required work:
1. Implement AVM `MCAsmInfo`, instruction-info creation, register-info creation, subtarget-info creation, and the MC target-desc registration functions required by the current fork.
2. Implement `AVMInstPrinter` with canonical mnemonic spelling and operand formatting from `docs/arch.md`.
3. Print compact physical registers as `c0-c3` when the selected concrete encoding is compact; print full architectural registers as `r0-r7` for full-register forms. Print low bytes as `b0-b7` only where syntax requires them.
4. Print data-memory operands with brackets, stack-relative forms as `[SP+offset]`, program operands as `[PB:rN]` or `[PB:rN+disp]`, and control-flow targets in a form the future parser can consume.
5. Ensure diagonal compact encodings disassemble conceptually as `CLR`, `TST16`, or `TST8`, not as forbidden self-moves or self-compares.
6. Add `llvm-mc -show-inst` and direct inst-printer tests using manually constructed encoded instruction records where possible.

Acceptance checks:
1. Every representative instruction family prints deterministic canonical text.
2. Compact aliases and special diagonal mnemonics are printed according to the architecture.
3. The printer does not invent syntax for reserved encodings.

Required deliverables: MC target-desc support, `AVMInstPrinter`, registration, and printer tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 7: Implement the MC code emitter, fixups, and encoding validation

**Depends on:** Step 6

**Goal:** Encode concrete AVM `MCInst` instructions into exactly the byte sequences defined by the architecture.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Encoding, fixup, and validation errors can be subtle and byte-level correctness is essential. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Encode concrete AVM `MCInst` instructions into exactly the byte sequences defined by the architecture.

Required work:
1. Implement the target `MCCodeEmitter` and use TableGen-generated encoding where practical. Add small C++ custom encoders for compact fields, RRSPEC, signed immediate packing, `CMPI6`, and packed far-control targets.
2. Emit little-endian immediate bytes and packed 24-bit program addresses exactly as specified.
3. Define target fixup kinds for data-space absolute 16-bit values, program-space 24-bit values and pieces, same-bank low-16 targets, signed 8-bit PC-relative fields, far-control packed targets, and relaxation markers. Map them to the stable AVM relocation names and numbers established in Step 2; do not create a second relocation-number table.
4. Validate immediate ranges, reserved RRSPEC bits, even far targets, compact-register eligibility, and forbidden postincrement overlaps. Produce useful diagnostics instead of truncating values.
5. Ensure far call/jump encoding preserves the link bit while relocating the remaining packed address bits.
6. Add exhaustive or generated MC encoding tests for all primary opcode families and boundary tests for each immediate/fixup kind.

Acceptance checks:
1. `llvm-mc -show-encoding` matches known byte sequences from the specification.
2. Out-of-range immediates and illegal register combinations fail with targeted diagnostics.
3. Relocatable expressions produce fixups rather than premature absolute values.

Required deliverables: AVM MC code emitter, fixup definitions, encoding helpers, and comprehensive MC encoding tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 8: Implement AVM ELF object emission and relocation recording

**Depends on:** Step 7

**Goal:** Make `llvm-mc -filetype=obj` produce valid little-endian AVM ELF relocatable objects with AVM relocation records.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. ELF object emission and relocation recording establish a long-lived binary contract. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Make `llvm-mc -filetype=obj` produce valid little-endian AVM ELF relocatable objects with AVM relocation records.

Required work:
1. Implement `AVMAsmBackend`, including fixup application for fully resolved values, relaxation-query stubs, NOP or fill behavior, and object-writer construction.
2. Implement the AVM ELF object writer and map target fixups to relocations corresponding to `R_AVM_DATA16`, `R_AVM_PROG24`, `R_AVM_PROG_LO16`, `R_AVM_PROG_HI8`, `R_AVM_PCREL8`, `R_AVM_BANK16`, `R_AVM_FAR24`, and `R_AVM_RELAX`.
3. Reuse the existing private development machine value `EM_AVM = 0x4156` established and documented in Step 2. Do not choose a new value in the object writer. Ensure the object writer, object readers, YAML support, and LLD all consume the same central definition.
4. Set ELF class, endianness, address sizes, section flags, symbol properties, and relocation addend style consistently with the target's 24-bit logical program space and 16-bit data space.
5. Add object-inspection tests using `llvm-readobj`, `llvm-readelf`, and `llvm-objdump` to verify headers, sections, symbols, and relocations.
6. Do not implement final flat-image output in this step.

Acceptance checks:
1. `llvm-mc` emits AVM ELF objects that LLVM object readers can parse.
2. Each unresolved operand class generates the intended relocation and retains the correct encoded placeholder bits.
3. The provisional `e_machine` decision is documented and isolated.

Required deliverables: MC asm backend, ELF object writer, fixup-to-existing-relocation mapping, any necessary updates to `docs/llvm_plan/avm-elf.md`, and object-file tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 9: Implement the AVM disassembler

**Depends on:** Step 8

**Goal:** Decode AVM bytes into concrete `MCInst` objects with correct instruction lengths and invalid-encoding behavior.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. The disassembler is bounded but must exactly mirror the encoding definitions. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Decode AVM bytes into concrete `MCInst` objects with correct instruction lengths and invalid-encoding behavior.

Required work:
1. Implement an AVM disassembler using generated decoder tables where possible and custom decode functions for compact fields, extension pages, RRSPEC, `CMPI6`, and far-control packing.
2. Decode diagonal primary forms directly to `CLR`, `TST16`, and `TST8` instruction records.
3. Reject reserved primary ranges, reserved extension subopcodes, malformed RRSPEC reserved bits, and structurally invalid encodings. Ensure the decoder consumes no extra bytes after a hard failure.
4. Return exact instruction lengths from one through four bytes.
5. Provide symbolization hooks or target operand support needed for `llvm-objdump -d`, without attempting linker-level bank analysis.
6. Add round-trip tests that assemble representative instructions, disassemble them, reassemble the printed form, and compare bytes. Add negative tests for every reserved range.

Acceptance checks:
1. `llvm-objdump -d` correctly disassembles AVM ELF `.text` sections.
2. All legal instruction lengths are decoded correctly at buffer boundaries.
3. Reserved or malformed encodings are reported as invalid rather than decoded as future instructions.

Required deliverables: AVM disassembler registration, decoder helpers, and positive/negative round-trip tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 10: Implement the integrated AVM assembler parser

**Depends on:** Step 9

**Goal:** Parse canonical and permitted alias AVM assembly into `MCInst` objects and relocatable expressions.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. The parser is sizeable and syntax-sensitive but can follow established MC patterns. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Parse canonical and permitted alias AVM assembly into `MCInst` objects and relocatable expressions.

Required work:
1. Implement the target `MCAsmParser` using generated matchers where appropriate.
2. Parse full registers `r0-r7`, compact aliases `c0-c3`, low-byte names, `SP`, `PB`, bracketed memory operands, stack-relative operands, program-space operands, immediate values, local labels, and symbolic expressions.
3. Accept full-register spelling such as `MOV r4,r5` and select a compact concrete instruction when the compact form is semantically legal. Reject diagonal compact aliases that would change semantics; `MOV r4,r4` must remain a full-form no-op or be explicitly diagnosed, never encoded as `CLR`.
4. Implement mnemonic aliases and suffixes for one-byte equality branches without making the printed canonical syntax ambiguous.
5. Perform semantic checks for register classes, immediate ranges, even far targets when absolute, postincrement overlap, and incompatible address spaces.
6. Add parser diagnostics tests and assembly/disassembly round trips for all instruction families.

Acceptance checks:
1. Canonical printer output always parses.
2. Allowed aliases choose the shortest semantically equivalent encoding.
3. Ambiguous or semantically dangerous aliases are rejected or kept in the safe full form.

Required deliverables: AVM assembly parser, matcher definitions, alias rules, and parser tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 11: Add a restricted assembly-to-image path for simulator testing

**Depends on:** Step 10

**Goal:** Produce interpreter-consumable AVM images from hand-written assembly before GlobalISel, full LLD relocation handling, bank placement, and linker relaxation exist.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. This is the first interpreter-consumable image milestone and must not create a conflicting image path. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby tools before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change. Assume all preceding steps in the implementation plan are complete. Do not begin GlobalISel, full LLD relocation handling, bank-aware placement, relaxation, veneers, or general linked-ELF image generation in this step. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Add the earliest practical path from AVM assembly to a flat image accepted by the Arduboy interpreter or simulator.

Required work:
1. Add a small LLVM utility, preferably named `llvm-avm-image`, and a documented build target for it. Put reusable header/tail serialization, CRC, image validation, and section-layout code in a library or clearly separable module that the later production image-writer step can extend instead of replacing.
2. Support an explicit restricted mode that accepts exactly one little-endian AVM `ET_REL` ELF object produced by `llvm-mc -triple=avm-unknown-arduboyfx -filetype=obj`. Do not invoke LLD internally and do not accept multiple input objects in this milestone.
3. Define and enforce a deliberately small input contract suitable for early assembly tests:
   - one ordinary `.text` section containing `_start`;
   - optional `.rodata`, `.data`, and `.bss` sections;
   - no undefined symbols, common symbols, COMDAT groups, TLS, dynamic sections, archives, or linker scripts;
   - no input relocation sections in the initial mode, except relocation kinds that can be implemented cleanly and tested without duplicating LLD; reject every unsupported relocation with an actionable diagnostic;
   - all executable content must remain in logical bank 0, no function or instruction may cross the bank boundary, and `_start` must be an even instruction boundary;
   - `saveSize` defaults to zero and may be supplied only through an explicit checked command-line option.
4. Use deterministic early layout rules derived from `docs/arch.md`:
   - reserve file/logical offsets `0x000000-0x0000FF` for the 256-byte header;
   - place the `.data` initializer at logical/file offset `0x000100` and assign its SRAM destination addresses beginning at `0x0100`;
   - account for `.bss` immediately after `.data` in SRAM when computing `staticSize` without emitting `.bss` bytes;
   - set `programStart = align_up(0x000100 + dataSize, 0x100)`;
   - place `.text` at `programStart`, followed by optional `.rodata` using deterministic alignment and `0xFF` gaps;
   - reject inputs that require bank-aware placement, section interleaving decisions, veneers, or relaxation.
5. Serialize the complete Version 1 image wrapper even in this restricted mode: header magic `41 56 4D 01`, `runtimeVersion = 1` unless explicitly overridden, packed 24-bit `_start` entry point, checked `dataSize`, `staticSize`, and `saveSize`, zero reserved header bytes, CRC-32/ISO-HDLC over header bytes `0x00-0xFB`, `0xFF` padding, and the final eight-byte `AVT` tail with an exact 256-byte page count.
6. Add a validation/inspection mode to the same tool so tests and developers can print and verify the header, entry point, sizes, CRC, tail magic, page count, padding, and reconstructed image base. The validator must accept images produced by the restricted mode and reject targeted corruptions.
7. Add at least two hand-written AVM assembly fixtures: a minimal `_start` program and a small control-flow program using local labels that the assembler resolves without linker relocations. Drive each fixture through `llvm-mc`, `llvm-avm-image`, and the validator in `lit` tests. Assert important output bytes and decoded metadata rather than merely checking exit status.
8. Add negative tests for a missing or odd `_start`, unsupported relocations, undefined symbols, duplicate or unsupported allocatable sections, static storage above 1024 bytes, save storage above 1024 bytes, bank-0 overflow, malformed ELF, and CRC/tail corruption.
9. Write `docs/llvm_plan/assembly-image-testing.md` with exact Debug-build commands for the existing generator, including how to locate Debug tools for single- and multi-configuration builds, how to assemble an `.s` file, how to create and validate the `.avm` image, and where to pass that image to an Arduboy simulator. Do not assume or hard-code a particular simulator executable if none exists in the repository.
10. Preserve this restricted path as a fast MC/interpreter regression route. Clearly document that it is not a substitute for LLD: it intentionally lacks multi-object symbol resolution, production relocation application, bank clustering, relaxation, veneers, and arbitrary linked-section layout.

Acceptance checks:
1. A hand-written relocation-free AVM assembly file can be converted, using Debug tools from `build/`, into a byte-for-byte deterministic flat AVM image with a valid header, CRC, aligned payload, final padding, and tail locator.
2. The produced image passes the tool's validator and is structurally suitable for direct loading by the Arduboy interpreter or simulator without any later backend or linker step.
3. Unsupported object features fail explicitly rather than being ignored or laid out incorrectly.
4. The implementation is factored so the later production image-writer step can add linked `ET_EXEC` input while retaining this single-object assembly-test mode and its tests.

Required deliverables: Restricted single-object `llvm-avm-image` mode, reusable image serialization/validation code, hand-written assembly image tests, negative tests, and `docs/llvm_plan/assembly-image-testing.md`.

Before finishing, build `llvm-mc`, `llvm-objdump`, and the new image-tool target with `cmake --build build --config Debug`, then run the focused AVM MC/image tests using Debug binaries. When a simulator is available in the repository, perform and report one smoke run; otherwise produce the validated image artifact in the test flow and document the exact manual simulator handoff. Do not claim simulator execution if it was not performed. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 12: Add the GlobalISel pipeline skeleton

**Depends on:** Step 11

**Goal:** Create the target's GlobalISel components and pass pipeline so a minimal function can progress through IR translation to an intentional selection failure.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. GlobalISel pipeline bring-up requires coherent target hooks even before full selection exists. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Create the target's GlobalISel components and pass pipeline so a minimal function can progress through IR translation to an intentional selection failure.

Required work:
1. Implement skeletal `AVMCallLowering`, `AVMLegalizerInfo`, `AVMRegisterBankInfo`, and `AVMInstructionSelector` classes using signatures from this exact LLVM fork.
2. Wire those objects into `AVMSubtarget` and configure `AVMPassConfig` to use GlobalISel by default.
3. Add target pass-configuration hooks for later pre-legalizer combines, post-legalizer combines, pre-register-allocation target passes, frame lowering, and post-register-allocation compression, but leave unimplemented hooks empty and clearly commented.
4. Disable SelectionDAG fallback initially unless the checked-in fork requires a minimal fallback for infrastructure reasons. If fallback is unavoidable, document it and make tests explicitly use GlobalISel.
5. Add a trivial MIR/IR test that reaches each pipeline stage and fails at a known unselected generic opcode with a controlled diagnostic rather than crashing.
6. Enable machine verification around GlobalISel in tests.

Acceptance checks:
1. The GlobalISel pipeline is selected for AVM.
2. A minimal function reaches the instruction selector deterministically.
3. No component claims support for operations it does not yet lower.

Required deliverables: GlobalISel class skeletons, pass-pipeline integration, and pipeline smoke tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 13: Implement AVM GlobalISel legalization rules

**Depends on:** Step 12

**Goal:** Shape generic MIR into the legal scalar, pointer, memory, and control types expected by the AVM selector.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Legalization decisions for unusual integer and pointer types constrain the entire backend. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Shape generic MIR into the legal scalar, pointer, memory, and control types expected by the AVM selector.

Required work:
1. Define legal types and actions based on `docs/arch.md`: native `s8`, `s16`, and `p0`; custom handling for `p1`; expansion of `s1`, `s24`, `s32`, `s64`, and `s32` floating-point operations as appropriate.
2. Satisfy GlobalISel's mandatory legality requirements for `G_ANYEXT` and `G_TRUNC` across the producer and consumer type sets in the checked-in fork.
3. Legalize scalar loads/stores of 8 and 16 bits in address space 0. Split or lower wider memory operations into little-endian pieces with one-byte alignment.
4. Keep `i1` primarily as compare/branch information; when materialized, widen to canonical `s8` zero or one.
5. Specify legality for arithmetic, shifts, compares, selects, branches, pointer arithmetic, casts, calls, returns, frame indexes, globals, constants, and intrinsics. Mark unsupported atomics, vectors, scalable vectors, dynamic stack allocation, and exception constructs as unsupported with clear diagnostics or libcall policy.
6. Add pass-level MIR tests using `-run-pass`, `-stop-after`, or the fork's equivalent to verify each legalization rule independently.

Acceptance checks:
1. The legalizer leaves only the documented legal/custom forms.
2. Wider integers are decomposed consistently into 16-bit units.
3. Unsupported operations fail predictably instead of looping or crashing the legalizer.

Required deliverables: Complete initial `AVMLegalizerInfo` and focused GlobalISel legalizer tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 14: Implement register-bank mapping and operand constraints

**Depends on:** Step 13

**Goal:** Map generic virtual registers to AVM register banks and prepare them for allocation into 8-bit, 16-bit, and pair register classes.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Register-bank mapping is foundational but has a relatively contained implementation surface. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Map generic virtual registers to AVM register banks and prepare them for allocation into 8-bit, 16-bit, and pair register classes.

Required work:
1. Define register banks for 16-bit general registers and, if required by the fork, low-byte views and compound-pair values. Avoid treating aliased low bytes as a physically independent bank.
2. Map `s8`, `s16`, and `p0` values to the general register bank; map `s32` and register-represented `p1` values to even-aligned pair classes during or after selection.
3. Implement operand mappings for generic instructions and selected AVM pseudos, including copies between subregister views and compound pairs.
4. Ensure special registers such as `FLAGS`, `PB`, and `SP` are never selected as ordinary virtual-register destinations.
5. Add allocation hints or hooks that can later prefer `R4-R7` for compact-eligible short-lived values without changing ABI-mandated assignments.
6. Add MIR tests for bank selection, pair constraints, subregister copies, and verifier errors on impossible mappings.

Acceptance checks:
1. Register-bank selection completes for the legal operations implemented so far.
2. No accidental cross-bank copies or impossible class constraints are introduced.
3. Pair values are constrained to the four legal even-aligned pairs.

Required deliverables: `AVMRegisterBankInfo`, register-bank definitions, allocation-hint scaffolding, and MIR tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 15: Implement ABI argument and return assignment in CallLowering

**Depends on:** Step 14

**Goal:** Lower formal arguments and return values according to the AVM calling convention, before implementing call instructions themselves.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. The custom calling convention, packed arguments, and 24-bit pointers are architecture-sensitive. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Lower formal arguments and return values according to the AVM calling convention, before implementing call instructions themselves.

Required work:
1. Encode the ABI assignment rules in target calling-convention TableGen or C++ helpers appropriate to this fork: argument units use `R4-R7`, values are not split between registers and stack, and stack arguments are packed at one-byte alignment in source order.
2. Support `i8`, `i16`, AS0 data pointers, `i32`, AS1 program/function pointers represented as two register units, and `i64` when it fits all four argument units.
3. Implement `lowerFormalArguments` and `lowerReturn` for non-variadic functions. Canonicalize returned `i8`/`bool` values in the low byte of `R4` as required.
4. Implement hidden structure-return pointer handling, consuming the first argument unit.
5. Create fixed stack objects for incoming stack arguments at offsets that account for the three-byte return address visible at callee entry.
6. Reject or defer unsupported by-value aggregate corner cases explicitly; record them in the open-issues document rather than silently mis-lowering them.
7. Add IR-to-MIR tests covering each argument boundary, an argument that would partially fit but must go entirely to stack, every return class, and structure return.

Acceptance checks:
1. Formal arguments appear in the ABI-defined physical registers or correct incoming stack slots.
2. Program pointers consume consecutive units with a canonical zero-extended bank word.
3. No argument is split between register and stack locations.

Required deliverables: Calling-convention definitions/helpers, `lowerFormalArguments`, `lowerReturn`, and ABI MIR tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 16: Select constants, copies, and basic register operations

**Depends on:** Step 15

**Goal:** Produce the first complete target instructions for a minimal function and simple value movement.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Basic selection is central but comparatively local once legalization and register banks exist. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Produce the first complete target instructions for a minimal function and simple value movement.

Required work:
1. Implement instruction selection for `G_CONSTANT` of 8- and 16-bit values, `G_COPY`, `G_IMPLICIT_DEF`, `G_TRUNC`, and legal no-op extensions.
2. Select generic full-register AVM operations or target pseudos before physical register allocation. Do not prematurely choose compact encodings based on virtual registers.
3. Use `LDI8`, `LDI16`, `CLR`, `MOV`, subregister copies, or constant synthesis only where semantically correct. Preserve flags for constant and move operations.
4. Implement copy handling for 16-bit values, low-byte subregister values, compound pairs, and copies to/from ABI physical registers.
5. Add the minimal pseudo expansion required for an empty function to emit a `RET` once return lowering is present, but do not implement general calls yet.
6. Add IR, MIR, assembly, and object tests for empty functions, return constants, register copies, and all constant boundary values.

Acceptance checks:
1. An empty function and functions returning simple constants compile through `llc` to AVM assembly and object code.
2. No compact physical encoding is selected before register allocation except for ABI-fixed physical instructions that are already known safe.
3. Constant materialization preserves architectural flags.

Required deliverables: Initial instruction-selector logic, copy support, minimal return emission, and Gate D tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 17: Select core ALU operations and model FLAGS explicitly

**Depends on:** Step 16

**Goal:** Lower 8/16-bit arithmetic, logical operations, compares, and flag dependencies with architecture-correct semantics.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Explicit FLAGS dependencies and cumulative-zero semantics are easy to implement plausibly but incorrectly. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Lower 8/16-bit arithmetic, logical operations, compares, and flag dependencies with architecture-correct semantics.

Required work:
1. Select 16-bit add, subtract, bitwise AND/OR/XOR, BIC where profitable, increment, decrement, negate, test, compare, and immediate forms.
2. Represent every flag-producing instruction with an implicit definition of the physical `FLAGS` register. Represent flag-preserving instructions without that definition.
3. Represent `ADC`, `SBC`, and `CPC16` with implicit `FLAGS` use and definition, preserving cumulative-zero semantics across multiword sequences.
4. Handle logical-operation semantics that preserve carry while replacing Z/N/V/S. If a single target instruction has exactly those semantics, select it; otherwise use an accurate pseudo expansion.
5. Keep compare results in flags when immediately consumed by a branch. Materialize compare results only when required by IR uses.
6. Add MIR verifier tests proving that unrelated flag-defining instructions cannot be scheduled between a compare and its consumer. Add semantic tests for carry/borrow, signed overflow, zero, negative, and cumulative zero.

Acceptance checks:
1. Core arithmetic compiles without generic opcodes remaining.
2. MIR shows explicit `FLAGS` dependencies for all relevant operations.
3. Flag semantics match edge cases in `docs/arch.md`, including 0x7FFF/0x8000 transitions and multiword zero propagation.

Required deliverables: ALU/compare selection, explicit `FLAGS` modeling, and semantic MIR/codegen tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 18: Lower conditional and unconditional branches

**Depends on:** Step 17

**Goal:** Lower IR control flow to relaxable AVM branch and jump pseudos while preserving flag dependencies and same-bank semantics.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Branch lowering is important but can build directly on the settled FLAGS model. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Lower IR control flow to relaxable AVM branch and jump pseudos while preserving flag dependencies and same-bank semantics.

Required work:
1. Implement selection/lowering for `G_BR`, `G_BRCOND`, integer compare-and-branch patterns, and fallthrough organization.
2. Map equality, unsigned, and signed conditions to the AVM conditions `EQ`, `NE`, `ULT`, `UGE`, `SLT`, `SGE`, `ULE`, and `UGT`.
3. Create branch pseudos that retain a `MachineBasicBlock` target until layout. Distinguish candidates for one-byte `BEQ.S`/`BNE.S`, signed-8-bit `BRcc`, and long inverted-branch-plus-jump expansion.
4. Use branch analysis hooks (`analyzeBranch`, `insertBranch`, `removeBranch`, `reverseBranchCondition`) according to current LLVM APIs.
5. Ensure branches implicitly use `FLAGS` and that branch folding does not assume native host flags.
6. Add tests for all predicates, forward/backward branches, zero-distance structural cases, branch reversal, and CFG simplification.

Acceptance checks:
1. All integer conditional branches lower to target branch pseudos with correct conditions.
2. Machine branch analysis can analyze and rewrite ordinary AVM terminators.
3. No branch displacement is finalized before layout.

Required deliverables: Branch lowering, target branch-analysis hooks, branch pseudos, and condition tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 19: Lower data-space loads, stores, and address arithmetic

**Depends on:** Step 18

**Goal:** Support AS0 memory operations and choose the initial generic AVM addressing forms without relying on physical compact registers.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Data-space addressing is substantial but uses conventional 16-bit pointer behavior. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Support AS0 memory operations and choose the initial generic AVM addressing forms without relying on physical compact registers.

Required work:
1. Select 8- and 16-bit loads/stores in address space 0, preserving one-byte alignment and little-endian semantics.
2. Support register-indirect, signed-8-bit displaced, direct 16-bit absolute, and `LEA` forms through target instructions or pseudos.
3. Represent frame-index accesses separately for the frame-lowering step rather than treating them as ordinary addresses.
4. Zero-extend byte loads into the full 16-bit destination register and track that canonicalization in machine-level metadata or known-bits hooks when practical.
5. Reject program-space stores and reject AS1 loads here so that they cannot accidentally use data-space instructions.
6. Implement target addressing-mode legality/cost hooks conservatively. Do not select compact primary encodings before physical register allocation.
7. Add codegen tests for globals, pointers, unaligned 16-bit accesses, offsets at signed-8-bit boundaries, direct low hardware addresses, and aliasing destination/address cases.

Acceptance checks:
1. AS0 loads and stores compile to semantically correct full-register or pseudo forms.
2. Byte loads are visibly canonical zero extensions.
3. AS1 memory operations remain distinct and fail at a controlled later implementation point.

Required deliverables: AS0 memory selection, address-materialization helpers, memory legality hooks, and load/store tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 20: Eliminate frame indexes and select stack-relative accesses

**Depends on:** Step 19

**Goal:** Map LLVM frame objects and incoming/outgoing stack slots to AVM stack-relative instructions or explicit address calculations.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Frame-index elimination is bounded once frame and addressing rules are established. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Map LLVM frame objects and incoming/outgoing stack slots to AVM stack-relative instructions or explicit address calculations.

Required work:
1. Implement `AVMFrameLowering` basics: stack grows down, stack alignment is one byte, initial empty stack is `0x0A00`, and the ABI has a three-byte return address.
2. Implement frame-index reference calculation for fixed objects, local objects, spills, callee saves, and outgoing call frames.
3. Select compact stack-relative forms with offsets `0-31` only after physical register allocation or when a fixed physical register is already known. Use extended stack-relative forms for offsets `0-255`; use address materialization plus indirect access beyond that.
4. Implement `eliminateFrameIndex` or the current equivalent, preserving byte/word width and avoiding accidental SP modification.
5. Order frame objects or provide a target hook so high-frequency and spill objects can occupy low offsets when possible.
6. Add MIR tests for positive offsets around 31 and 255, word accesses at the end of ranges, incoming arguments beginning at `SP+3`, and frames with/without a frame pointer.

Acceptance checks:
1. No frame-index operands survive the frame-elimination pass.
2. Offsets use the shortest legal stack-relative form based on final physical registers and range.
3. Incoming stack arguments account for the three-byte return address exactly.

Required deliverables: Initial frame lowering, frame-index elimination, stack-access selection, and frame-offset MIR tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 21: Implement prologues, epilogues, callee saves, and stack diagnostics

**Depends on:** Step 20

**Goal:** Generate ABI-correct function frames and restore SP and callee-saved registers on every return path.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. The 256-byte stack, callee saves, and three-byte return addresses demand careful frame reasoning. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Generate ABI-correct function frames and restore SP and callee-saved registers on every return path.

Required work:
1. Determine used callee-saved registers and emit `PUSH16`/`POP16` only for those registers.
2. Use `ADJSP simm8` for fixed frame allocation/deallocation, splitting adjustments when necessary without changing flags.
3. Implement frame-pointer setup with `R3` using `PUSH16 R3`, `GETSP R3`, and `SETSP R3` semantics from `docs/arch.md`. Omit the frame pointer by default.
4. Implement call-frame pseudo elimination for reserved and non-reserved call frames as appropriate for this small stack.
5. Emit stack-size metadata in a form usable by diagnostics or later image tooling. Diagnose statically provable per-function or call-chain-local stack use above 256 bytes where LLVM has sufficient information; otherwise emit a warning or metadata rather than an unsound hard error.
6. Add tests for leaf/non-leaf functions, all callee-save combinations, large split adjustments, frame-pointer forcing, multiple returns, and zero-sized frames.

Acceptance checks:
1. Every prologue has a matching epilogue and restores the entry SP.
2. Only used `R0-R3` registers are saved.
3. Frame-pointer and frame-pointer-omission layouts match the ABI examples.

Required deliverables: Complete basic `AVMFrameLowering`, callee-save handling, stack metadata/diagnostics, and prologue/epilogue tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 22: Lower direct calls, returns, and tail calls

**Depends on:** Step 21

**Goal:** Implement ABI-correct function calls using relaxable direct-call pseudos and the architecture's universal three-byte return-address convention.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Calls, returns, tail calls, and relaxation pseudos cross ABI and control-flow boundaries. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Implement ABI-correct function calls using relaxable direct-call pseudos and the architecture's universal three-byte return-address convention.

Required work:
1. Implement `AVMCallLowering::lowerCall` for non-variadic direct calls, including register arguments, packed stack arguments, hidden sret pointers, call-preserved masks, and caller cleanup.
2. Emit a relaxable direct-call pseudo for unresolved or external targets. Treat it as potentially far until link-time layout proves a shorter form.
3. Model calls as clobbering caller-saved registers, `FLAGS`, and `PB`, while preserving callee-saved registers and restoring SP according to the ABI.
4. Finalize return lowering so every ordinary return uses `RET` and no separate near-return concept exists.
5. Implement eligible sibling/tail calls by restoring the current frame and emitting a jump pseudo rather than a call. Reject tail calls whose ABI or stack-argument layout is incompatible.
6. Add tests for register-only calls, mixed register/stack calls, calls with all arguments on stack when later marked variadic, recursive calls, external calls, and same-function tail recursion.

Acceptance checks:
1. Call sequences pass and return values in the specified registers and clean outgoing stack arguments.
2. Calls expose `FLAGS` and `PB` clobbers to the machine scheduler and verifier.
3. Tail calls emit jumps and do not add a second return address.

Required deliverables: Direct call lowering, return completion, tail-call eligibility/lowering, and ABI call tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 23: Implement the 24-bit program-pointer register representation

**Depends on:** Step 22

**Goal:** Support LLVM address-space-one pointers as 24-bit logical values represented in memory by three bytes and in registers by an even-aligned pair of 16-bit registers.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. The 24-bit address-space-one pointer representation is unusual and impacts legalization and ABI behavior. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Support LLVM address-space-one pointers as 24-bit logical values represented in memory by three bytes and in registers by an even-aligned pair of 16-bit registers.

Required work:
1. Define target lowering conventions for `p1`: low 16 bits in the first pair member and a canonical zero-extended bank byte in the low byte of the second 16-bit member.
2. Legalize/select `G_INTTOPTR`, `G_PTRTOINT`, `G_PTR_ADD`, comparisons, null constants, copies, loads/stores of pointer objects, and phi/select operations involving `p1`.
3. Implement packed three-byte memory representation for program/function pointers. A memory load must reconstruct the pair and zero the unused high byte; a store must write exactly three little-endian bytes.
4. Keep AS0 and AS1 pointer casts distinct. Reject implicit `addrspacecast` unless a documented target extension is intentionally implemented.
5. Implement 24-bit pointer arithmetic with carry/borrow propagation into the bank word and restore canonicality after operations.
6. Add IR/MIR tests for null pointers, constant addresses, pointer arithmetic across a 64 KiB boundary, pointer comparison, memory round trips, and forbidden address-space casts.

Acceptance checks:
1. Register-form `p1` values always use legal pairs and canonical bank words.
2. Memory-form `p1` objects are exactly three bytes with one-byte alignment.
3. AS0 and AS1 operations never silently share the wrong instruction family.

Required deliverables: Program-pointer legalization/selection, packed-memory lowering, and address-space tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 24: Lower PB state, program-space loads, and indirect control flow

**Depends on:** Step 23

**Goal:** Implement AVM's separate program-bank latch and all AS1 dereference and indirect-call/jump operations.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. PB dependencies, program-space loads, and indirect far control flow span multiple backend concepts. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Implement AVM's separate program-bank latch and all AS1 dereference and indirect-call/jump operations.

Required work:
1. Select `MTPB`, `MFPB`, and `LDPBI` operations and model `PB` as an explicit implicit use/definition.
2. Lower AS1 scalar loads to `LDP8`/`LDP16` forms using the register pair representation: load or reuse the bank word into `PB`, then address with the low word.
3. Implement signed-displacement program loads with full 24-bit carry/borrow semantics. Neither `PB` nor the base register may be modified by a load.
4. Lower same-bank indirect control flow to `JMPR`/`CALLR` when the type and provenance prove the bank is current; otherwise lower function/program pointers through `PB` to `JMPP`/`CALLP`.
5. Teach machine common-subexpression or a target peephole pass to remove redundant consecutive PB loads when no intervening call, `SYS`, or explicit clobber occurs.
6. Model program loads as high-cost operations that disturb the interpreter fetch stream in target cost hooks added later.
7. Add tests for repeated loads from one bank, bank changes, loads crossing a low-word boundary, indirect function calls, and PB clobbers across calls.

Acceptance checks:
1. Every AS1 dereference explicitly uses `PB` and an AVM program-load instruction.
2. Redundant PB writes are eliminated only when safe.
3. Indirect calls preserve the full 24-bit return address through the architectural call instruction.

Required deliverables: PB-aware lowering, program-space loads, indirect control flow, PB peephole optimization, and tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 25: Complete i8, i1, extension, and boolean lowering

**Depends on:** Step 24

**Goal:** Make byte operations and materialized booleans efficient while respecting the architecture's partial-register and canonicalization rules.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Byte and boolean canonicalization is detailed but bounded by explicit architectural rules. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Make byte operations and materialized booleans efficient while respecting the architecture's partial-register and canonicalization rules.

Required work:
1. Track or infer which byte-producing instructions zero the high byte: byte loads, `LDI8`, `CLR`, and `MFPB` as listed in `docs/arch.md`.
2. Lower `G_TRUNC s16 to s8` as a subregister view when safe. Lower `G_ZEXT` to no instruction for known-canonical producers and to `ZEXT8` otherwise. Lower `G_SEXT` to `SEXT8` unless folded.
3. Lower 8-bit comparisons, tests, logical operations, and shifts so flags describe the low byte and high-byte preservation matches the ISA.
4. Materialize `i1` results as canonical `0` or `1` in an `s8`/low-byte value. Prefer control-flow or flag-based forms over materialization when possible.
5. Implement `SWAP8` only as a target operation or combine when it is actually selected; do not add a generic transform without profitability evidence.
6. Add known-bits and demanded-bits hooks if the fork's APIs make them useful for avoiding redundant `ZEXT8`.
7. Add tests for canonical/noncanonical producers, bool returns/arguments, byte wraparound, low-byte shifts with preserved upper bytes, and redundant extension elimination.

Acceptance checks:
1. No redundant `ZEXT8` is emitted after canonical producers.
2. Materialized booleans are always zero or one.
3. 8-bit flag behavior and preserved high bytes match `docs/arch.md`.

Required deliverables: Complete byte/boolean lowering, canonicalization analysis, and i8/i1 tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 26: Implement i32 multiword arithmetic, comparisons, shifts, and memory

**Depends on:** Step 25

**Goal:** Support the primary 32-bit integer operations by decomposing values into legal 16-bit register pairs and instruction sequences.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Multiword arithmetic and cumulative flags require precise cross-word semantics. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Support the primary 32-bit integer operations by decomposing values into legal 16-bit register pairs and instruction sequences.

Required work:
1. Lower i32 add/subtract to low-word `ADD`/`SUB` followed by high-word `ADC`/`SBC`, preserving cumulative-zero and carry dependencies.
2. Lower i32 comparisons to low-word `CMP16` plus high-word `CPC16` in the order required by AVM borrow semantics; verify signed and unsigned predicates carefully.
3. Lower i32 loads/stores as two little-endian 16-bit accesses, respecting one-byte alignment and aliasing.
4. Implement constant and variable shifts using word operations, conditional sequences, or helper calls based on code size and correctness. Cover counts outside the source-language defined range only as required by LLVM's legalized semantics.
5. Implement i32 logical operations as independent word operations, taking care not to let intermediate flag definitions corrupt a later branch unless the final flags are intentionally used.
6. Implement pair copies, spills, reloads, and phi/select constraints.
7. Add randomized semantic tests or interpreter-backed tests for arithmetic and compare edge cases in addition to FileCheck shape tests.

Acceptance checks:
1. All common i32 operations compile without illegal generic instructions.
2. Signed and unsigned comparisons are correct at high-word sign boundaries.
3. Pair allocation remains restricted to the four legal pairs.

Required deliverables: i32 lowering and selection, pair spill/reload support, and semantic tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 27: Implement shifts, multiply lowering, and runtime libcalls

**Depends on:** Step 26

**Goal:** Complete scalar shift and multiplication support and establish a correct policy for division, remainder, floating point, and larger unsupported operations.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Shift, multiply, and libcall lowering are substantial but comparatively conventional after prior groundwork. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Complete scalar shift and multiplication support and establish a correct policy for division, remainder, floating point, and larger unsupported operations.

Required work:
1. Select fixed and variable 16-bit shifts, including the rule that a variable count of zero preserves both value and all flags.
2. Select `MULU8`, `MULS8`, and `MULSU8`, and add allocation hints or local copies that strongly prefer compact registers for signed/mixed multiplication where native interpreter cost benefits.
3. Implement 16x16 multiplication as an inline byte-multiply sequence or a runtime helper. Start with the simpler correct implementation and document code-size/cycle tradeoffs.
4. Define target libcalls and calling conventions for 16/32/64-bit division/remainder, large shifts if needed, 64-bit arithmetic, and f32 operations. Ensure helper names are stable and do not collide with host AVR routines.
5. Mark unsupported operations for libcall expansion in legalization and provide clear diagnostics when a required helper is absent at link time.
6. Add tests for all shift counts 0-15, signed shift behavior, multiplication signedness combinations, and libcall symbol selection.

Acceptance checks:
1. Variable shift count zero does not define `FLAGS`.
2. Multiply result and flag semantics match the architecture.
3. Every expanded unsupported arithmetic operation names a documented AVM runtime helper.

Required deliverables: Shift/multiply selection, libcall mapping, helper ABI documentation, and tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 28: Implement variadic functions and remaining aggregate ABI cases

**Depends on:** Step 27

**Goal:** Complete the calling convention for variadic functions, packed stack arguments, `va_list`, and common aggregate passing/return cases.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Variadic and aggregate ABI cases are error-prone and must match the custom calling convention exactly. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Complete the calling convention for variadic functions, packed stack arguments, `va_list`, and common aggregate passing/return cases.

Required work:
1. Implement the AVM rule that every argument to a variadic function—including named arguments—is passed on the stack after default argument promotions.
2. Implement `va_start`, `va_arg`, `va_copy`, and `va_end` lowering using a 16-bit data-space pointer as `va_list`.
3. Ensure caller and callee agree on the first variadic argument address after the three-byte return address and any fixed stack layout.
4. Complete by-value handling for small aggregates using packed one-byte alignment, or deliberately lower them through memory/sret when register splitting would violate the no-partial-fit rule.
5. Verify default promotions for `char`, `bool`, and `short` to 16-bit `int`, and `float` promotion according to the selected C ABI policy.
6. Add Clang-independent LLVM IR tests first; later Clang tests will verify C source behavior.

Acceptance checks:
1. Variadic callees receive no named arguments in `R4-R7`.
2. `va_list` advances through packed promoted stack objects correctly.
3. Aggregate cases are either supported with tests or rejected with explicit diagnostics.

Required deliverables: Variadic CallLowering, `va_list` lowering, aggregate ABI completion, and tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 29: Implement global addresses, sections, constant pools, and constructor arrays

**Depends on:** Step 28

**Goal:** Lower symbols and organize ELF sections according to AVM's split data/program address spaces and startup layout.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Section and constant placement are broad but governed by a clear memory-layout specification. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Lower symbols and organize ELF sections according to AVM's split data/program address spaces and startup layout.

Required work:
1. Lower AS0 global addresses to 16-bit data-space relocations and AS1 function/constant addresses to packed 24-bit program-space relocations.
2. Define target section selection for `.text`, `.rodata`, `.data`, `.bss`, `.init_array`, `.fini_array`, `.avm.metadata`, and debug sections. Functions, readonly constants, and constructor arrays belong to program space.
3. Ensure writable `.data` and `.bss` symbols receive data-space virtual addresses beginning at `0x0100`, while their initializers remain representable for later image construction.
4. Implement constant-pool, jump-table placeholder, block-address, external-symbol, and global-address operands in `AVMAsmPrinter` and MC lowering.
5. Implement `AVMAsmPrinter` sufficiently to emit assembly and ELF objects from selected `MachineInstr`s, including function labels, symbol variants, and target flags for relocation pieces.
6. Add tests for local/global/weak symbols, function pointers, program constants, initialized and zero-initialized globals, constructor arrays, and symbol relocations.

Acceptance checks:
1. AS0 and AS1 symbols receive distinct relocation kinds and section placement.
2. `llc -filetype=obj` emits usable AVM ELF objects for functions and globals.
3. No `.bss` bytes are emitted into program-space payload data.

Required deliverables: Asm printer, MC lowering, section policy, symbol lowering, and global/section tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 30: Implement switch lowering policy

**Depends on:** Step 29

**Goal:** Generate efficient and correct switch code while recognizing the high cost of program-space jump-table reads.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Switch policy is primarily a target-cost and lowering task with measurable outcomes. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Generate efficient and correct switch code while recognizing the high cost of program-space jump-table reads.

Required work:
1. Implement target lowering/cost hooks that favor compare chains for small switches and binary decision trees for moderately sized sparse switches.
2. Define a conservative initial density/size threshold for jump tables and document it as provisional pending profiling.
3. When a jump table is selected, emit packed 24-bit logical program addresses in AS1, load the selected entry through AVM program-load operations, transfer the bank to `PB`, and use `JMPP`.
4. Ensure jump-table labels and entries receive correct program-space relocations and alignment.
5. Add tests below, at, and above the threshold; dense and sparse cases; same-bank and cross-bank targets; and `-Oz` behavior.
6. Record the threshold and rationale in the backend documentation so profiling can revise it later.

Acceptance checks:
1. Small switches do not incur program-space jump-table loads.
2. Jump-table entries are exactly three bytes and use AS1 relocations.
3. All indirect switch targets are valid instruction boundaries and use `PB` explicitly.

Required deliverables: Switch-lowering policy, jump-table emission/lowering, cost thresholds, and tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 31: Form postincrement memory operations before register allocation

**Depends on:** Step 30

**Goal:** Recognize load/store-plus-pointer-update patterns and preserve them as target pseudos until final physical-register costs are known.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Pre-RA postincrement formation is a focused combine and cost-model problem. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Recognize load/store-plus-pointer-update patterns and preserve them as target pseudos until final physical-register costs are known.

Required work:
1. Implement a GlobalISel combiner or target pre-RA pass that recognizes legal `*p++` byte/word patterns in AS0.
2. Create target pseudos for byte and word postincrement loads/stores, carrying the original address, value, and updated pointer semantics without selecting an encoding yet.
3. Reject or avoid forming a postincrement load when destination and address must be the same physical register; preserve a fallback sequence or temporary.
4. Maintain memory operands, aliasing information, debug locations, and atomic/volatile restrictions.
5. At later lowering, allow a choice between the generic `0xFD` postincrement instruction and compact load/store plus explicit increment based on physical registers, bytecode size, and optimization mode.
6. Add MIR tests for positive matches, no-match alias cases, volatile accesses, word increments by two, and pointer values with additional uses.

Acceptance checks:
1. Canonical load/store-plus-increment IR forms one postincrement pseudo when semantics permit.
2. Illegal overlap and multi-use cases remain correct and uncombined.
3. No concrete compact/full encoding decision is made before register allocation.

Required deliverables: Postincrement combine pass/pseudos and pre-RA MIR tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 32: Implement the post-register-allocation compact-encoding pass

**Depends on:** Step 31

**Goal:** Convert eligible physical-register instructions into one-byte compact primary encodings after register allocation.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Post-RA compression must preserve semantics while exploiting physical-register encodings. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Convert eligible physical-register instructions into one-byte compact primary encodings after register allocation.

Required work:
1. Create a target post-RA pass that inspects physical operands and replaces full-register or generic forms with compact concrete instructions when all required operands are `R4-R7` and semantics are identical.
2. Implement mappings for compact `MOV`, data-space `LD8/ST8/LD16/ST16`, `ADD`, `SUB`, `CMP16`, `CMP8`, compact `LDI8`, and compact stack-relative forms.
3. Handle diagonal hazards explicitly: remove dead/self `MOV`; keep a required self-move in full form; constant-fold self-compare where legal; never turn self-compare into `TST` unless that is the intended semantics.
4. Lower postincrement pseudos by comparing the generic `0xFD` form against compact access plus `INC16` or another increment sequence. Use `-Oz` to favor byte count and a documented default cost for other modes.
5. Preserve kill/dead flags, implicit `FLAGS`/`PB` operands, memory operands, debug locations, and bundles.
6. Add MIR tests for every mapping, every nonmapping reason, all diagonal cases, postincrement choices, and compact stack-offset boundaries.

Acceptance checks:
1. Only semantically equivalent instructions are compacted.
2. The pass reduces code size on compact-register workloads and leaves noncompact physical operands unchanged.
3. Machine verification passes before and after the transformation.

Required deliverables: Post-RA compression pass, instruction mapping tables/helpers, and exhaustive MIR tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 33: Expand branch/call pseudos and emit relaxation metadata

**Depends on:** Step 32

**Goal:** Translate machine basic-block and symbol control-flow pseudos into conservative concrete encodings and relocation hints suitable for assembler and linker relaxation.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Pseudo expansion and relaxation metadata form the contract between CodeGen and the linker. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Translate machine basic-block and symbol control-flow pseudos into conservative concrete encodings and relocation hints suitable for assembler and linker relaxation.

Required work:
1. Implement a late machine or MC lowering step that emits conservative `JMPF`/`CALLF`-class encodings for unresolved direct symbols and records `R_AVM_RELAX` metadata.
2. For local resolved machine blocks, choose `BEQ.S`/`BNE.S`, `BRcc rel8`, `JMP rel8`, or `JMP16` only when the final assembler layout can prove range and same-bank constraints; otherwise use long forms.
3. Implement long conditional expansion as an inverted condition around a jump, preserving fallthrough and branch probabilities.
4. Ensure far targets are even aligned or represented in a way that allows the linker to insert an aligned veneer.
5. Implement MC relaxation hooks only for transformations that do not change section/bank placement assumptions. Leave cross-object and bank-sensitive shrinking to LLD.
6. Add boundary tests at every displacement limit and tests where instruction-size changes alter a following branch's range.

Acceptance checks:
1. Unresolved control flow is always encoded safely and carries relaxation information.
2. Local short forms are chosen only with proven byte displacement and bank membership.
3. Conditional long expansion remains correct after layout changes.

Required deliverables: Late control-flow expansion, MC relaxation support where safe, relocation markers, and boundary tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 34: Add target cost models, allocation preferences, and codegen tuning

**Depends on:** Step 33

**Goal:** Teach target-independent optimizers and code generation about AVM code size, compact registers, expensive taken control flow, and expensive program-space loads.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Cost models and allocation preferences should be implemented conservatively and measured later. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Teach target-independent optimizers and code generation about AVM code size, compact registers, expensive taken control flow, and expensive program-space loads.

Required work:
1. Implement conservative `TargetTransformInfo` and codegen cost hooks for 8/16/32-bit arithmetic, data-space memory, AS1 program loads, calls, branches, switches, and libcalls.
2. Prefer compact-register allocation for short-lived call arguments/results, addresses, loop counters, comparison operands, multiply operands, and values likely to use primary encodings.
3. Prefer `R0-R3` for long-lived values and values live across calls through allocation order, hints, or eviction costs rather than hard constraints.
4. Model taken branches and calls as expensive because they restart the SPI stream; model fallthrough and one-byte compact operations as cheap in size terms.
5. Provide sensible behavior for `-O0`, `-O2`, and `-Oz`. At `-O0`, prioritize correctness and debuggability; at `-Oz`, prioritize encoded byte count.
6. Add optimization tests that show compact-register preference, no pathological spill increase, conservative jump-table use, and reduced redundant PB loads/extensions.

Acceptance checks:
1. Optimization decisions reflect AVM's unusual costs without changing correctness.
2. Compact-register preference improves compact encoding frequency on representative tests.
3. The cost model does not encourage AS1 scalar loads when a bulk/runtime alternative is more appropriate.

Required deliverables: TTI/codegen cost hooks, allocation preference tuning, and optimization-regression tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 35: Enable Clang in the root build and add AVM target data-model and ABI support

**Depends on:** Step 34

**Goal:** Extend the repository's AVM-focused LLVM+LLD configuration to include Clang, then teach Clang the AVM C/C++ data model, target triple, address spaces, and ABI-visible type properties.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Clang data-model integration is broad but follows the already established LLVM target ABI. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. The repository-root `CMakeLists.txt` currently enables only LLD by default. Reconfigure the existing `build/` tree in place with `-DLLVM_ENABLE_PROJECTS="clang;lld"`; do not create a parallel build directory and do not switch generators. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Do not add `FORCE` to cache variables, and do not change the root default merely to make this one step build. Assume all preceding steps are complete. Do not implement driver libraries, runtime helpers, or later linker work in this step. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Enable Clang through the root build's cache override mechanism and implement AVM target data-model and ABI support.

Required work:
1. Reconfigure from the repository root with Clang and LLD enabled while preserving all existing generator, platform, toolchain, and AVM experimental-target options. Record the exact command in `docs/llvm_plan/avm-llvm-bringup.md`.
2. Add an AVM target-info implementation under the organization used by this fork's `clang/lib/Basic/Targets`. Reuse `Triple::avm` and the canonical `avm-unknown-arduboyfx` policy from Step 2.
3. Implement the C/C++ data model from `docs/arch.md`: signed plain `char`; 16-bit `short`, `int`, `size_t`, `ptrdiff_t`, and `wchar_t`; 32-bit `long`, `float`, `double`, and `long double`; 64-bit `long long`; 16-bit AS0 data pointers; 24-bit AS1 program/function pointers; and one-byte ABI alignment.
4. Set target endianness, integer rank/width tables, typedef choices, va-list representation, preferred alignment, stack alignment, and atomic capability conservatively and explicitly.
5. Map Clang address spaces to LLVM AS0 and AS1 without introducing implicit data/program pointer conversions. Functions must lower in program address space 1 according to the backend's established policy.
6. Define target macros and feature reporting sufficient for freestanding headers, including AVM, Arduboy FX, pointer-width, and endian macros. Avoid claiming hosted-library, threading, atomics, TLS, exceptions, RTTI, or heap capabilities that are not implemented.
7. Add Clang `-cc1` tests for predefined macros, `sizeof`/`alignof`, record layout, enum defaults, pointer widths by address space, function-pointer width, `va_list`, null representation assumptions, and target triple acceptance.
8. Build the `clang` target and run only the relevant Clang target-info tests plus the previously established LLVM AVM tests.

Acceptance checks:
1. The root build can be configured with `LLVM_ENABLE_PROJECTS="clang;lld"` without editing or forcing the root cache defaults.
2. `clang -target avm-unknown-arduboyfx` reports the exact AVM type widths and alignments.
3. AS0 pointers are 16 bits and AS1/function pointers are 24 bits in emitted LLVM IR.
4. The target rejects or does not advertise unsupported hosted features.

Required deliverables: Documented root CMake override for Clang, AVM Clang target info, ABI/data-model implementation, and focused Clang tests.

Before finishing, build `clang` through the root configuration and run the narrowest relevant Clang and LLVM tests. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 36: Add Clang driver integration and the program-space source extension

**Depends on:** Step 35

**Goal:** Make the Clang driver invoke the AVM backend correctly and expose a usable C/C++ spelling for address-space-one program data.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Driver behavior and program-space source-language support cross Clang, LLVM address spaces, and linking. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Make the Clang driver invoke the AVM backend correctly and expose a usable C/C++ spelling for address-space-one program data.

Required work:
1. Register the AVM toolchain/driver path for `--target=avm-unknown-arduboyfx`, using integrated assembler and LLD defaults only when those components are available in the build.
2. Pass the target triple, CPU/features, relocation model, code model, freestanding defaults, and linker/image options through without host leakage.
3. Implement or map a target address-space qualifier such as `__flash` to LLVM address space 1, following existing Clang target-address-space mechanisms in this fork.
4. Ensure functions are emitted in AS1 and unqualified writable objects in AS0. Place string literals and explicitly flash-qualified constants in AS1 according to the chosen language policy.
5. Set sensible default flags for the initial C++ policy: freestanding, no exceptions, no RTTI, no thread-safe statics unless explicitly supported. Do not silently override explicit user options without a diagnostic.
6. Add driver command-line tests and C source-to-IR tests for `__flash`, function pointers, program-pointer arithmetic, and forbidden implicit AS0/AS1 conversions.

Acceptance checks:
1. `clang --target=avm-unknown-arduboyfx -S` reaches the AVM backend with the correct data layout and address spaces.
2. The `__flash` spelling produces AS1 pointers and constants.
3. Driver output is host-platform independent.

Required deliverables: Clang driver/toolchain integration, address-space qualifier support, defaults, and driver/CodeGen tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 37: Provide compiler runtime builtins and the freestanding startup ABI

**Depends on:** Step 36

**Goal:** Supply the helper functions and startup/runtime objects required by code generated by the backend.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Runtime builtins and startup are sizeable but have explicit ABI and image-format contracts. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Supply the helper functions and startup/runtime objects required by code generated by the backend.

Required work:
1. Inventory every libcall emitted by legalization and instruction selection, including division/remainder, 64-bit helpers, floating-point helpers, memory intrinsics, and any program-space copy helpers.
2. Add AVM-compatible implementations in the project's chosen runtime location—prefer compiler-rt when its build system supports the target cleanly, otherwise use a clearly separated AVM runtime library outside generic LLVM code.
3. Define `_start` according to `docs/arch.md`: run static constructors, call `main`, run required termination handlers, and invoke the system service used for program exit.
4. Provide `memcpy`, `memmove`, `memset`, and optionally `memcmp` implementations appropriate to AS0. Provide distinct program-space bulk-copy entry points rather than pretending ordinary `memcpy` accepts AS1 sources.
5. Provide stubs or link-time failures for unavailable heap allocation, exceptions, RTTI support routines, thread-local storage, and unsupported C++ allocation operators.
6. Add unit tests that compile calls to each helper and link them. Where an AVM interpreter or emulator test harness exists, execute arithmetic and memory helper tests.

Acceptance checks:
1. Every backend-generated libcall has a matching documented symbol or a deliberate compile-time diagnostic.
2. A trivial `main` links with `_start` and constructor arrays.
3. No heap API is accidentally supplied as a working general allocator.

Required deliverables: AVM runtime/builtin library, startup objects, helper ABI documentation, and compile/link tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 38: Complete the existing AVM support in LLD's ELF linker

**Depends on:** Step 37

**Goal:** Replace the minimal LLD scaffold introduced in Step 2 with complete AVM relocation application and linked-ELF layout support, while preserving the existing CMake and target-dispatch integration from the current patch.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Completing LLD relocation semantics is a high-risk binary-correctness milestone; use Sol Max if design ambiguity remains. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root CMake configuration, which already enables LLD by default and already contains AVM LLD build/dispatch hooks from the current patch. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Assume all preceding steps are complete. Do not implement bank-aware placement, relaxation, veneers, or the flat-image writer in this step. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Complete `lld/ELF/Arch/AVM.cpp` and the existing AVM LLD registration so LLD can link ordinary AVM ELF objects correctly before bank-aware optimization.

Required work:
1. Inspect the `lld/ELF/CMakeLists.txt`, `Target.cpp`, and `Target.h` changes already present. Do not add duplicate source-list entries, duplicate `EM_AVM` switch cases, or a second `setAVMTargetInfo` declaration.
2. Replace or extend the minimal Step 2 AVM target implementation in `lld/ELF/Arch/AVM.cpp`. Register it for the existing centralized private machine value `EM_AVM = 0x4156`.
3. Implement relocation-expression classification, relocation application, addend handling, range checking, and diagnostics for the exact relocation definitions established in Step 2 and emitted by the MC object writer: `R_AVM_DATA16`, `R_AVM_PROG24`, `R_AVM_PROG_LO16`, `R_AVM_PROG_HI8`, `R_AVM_PCREL8`, `R_AVM_BANK16`, `R_AVM_FAR24`, and `R_AVM_RELAX` as applicable.
4. Handle packed 24-bit program addresses, low-16 and high-8 pieces, 16-bit data addresses, signed next-PC-relative displacements, same-bank absolute targets, and packed far control while preserving the link bit.
5. Define a basic linked-ELF section-address policy without yet synthesizing the AVM flat header or tail. Assign `.data` and `.bss` data-space VMAs beginning at `0x0100`; assign executable and immutable program-space sections logical program addresses consistent with the eventual image layout.
6. Keep data-space and program-space symbols distinguishable in diagnostics and relocation checking. Reject invalid cross-space relocation use rather than truncating it.
7. Add `lld/test/ELF` tests for every relocation, exact output bytes, positive and negative boundaries, undefined symbols, malformed objects, section placement, mixed AS0/AS1 symbols, and the preserved far-call link bit.
8. Add a regression test proving that the existing Step 2 minimal unsupported-relocation behavior has been replaced by real handling and that `ld.lld` still recognizes plain AVM objects with no relocations.

Acceptance checks:
1. The default root LLVM+LLD build compiles and links with the existing AVM CMake and target-dispatch hooks exactly once.
2. `ld.lld` links multiple AVM objects into a parseable AVM ELF.
3. Every supported relocation produces exact expected bytes and useful overflow/address-space diagnostics.
4. Data-space and program-space symbol addresses follow `docs/arch.md` and the documented linked-ELF policy.

Required deliverables: Completed `lld/ELF/Arch/AVM.cpp`, full AVM relocation handling using the existing centralized definitions, initial linked-ELF layout policy, and LLD tests.

Before finishing, build `ld.lld` through the repository-root configuration and run the narrowest relevant LLD and AVM object tests. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 39: Implement bank constraints and initial bank-aware section placement

**Depends on:** Step 38

**Goal:** Enforce the architectural rule that no function, instruction, basic-block fallthrough, or sequential path crosses a 64 KiB program bank.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Bank constraints and placement require global layout reasoning; use Sol Max if the first design does not converge. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Enforce the architectural rule that no function, instruction, basic-block fallthrough, or sequential path crosses a 64 KiB program bank.

Required work:
1. Teach the linker to identify function sections and their sizes using function sections, symbol metadata, or AVM-specific metadata emitted by the backend.
2. Reject any single function larger than 64 KiB.
3. Place functions wholly within one bank and align address-taken functions and cross-bank direct targets to two bytes.
4. Prevent basic-block fallthrough across bank boundaries. If the backend emits per-basic-block sections or metadata, use it; otherwise require a conservative function-level layout that leaves sufficient terminal padding and explicit terminators.
5. Fill unused terminal bank space with a chosen invalid/diagnostic-fault byte pattern consistent with `docs/arch.md`, and test that ordinary fallthrough cannot wrap PC.
6. Start with deterministic first-fit or call-order placement. Do not implement profile-guided clustering yet, but design data structures so clustering can be added later.
7. Add tests for exact-fit functions, one-byte overflow, alignment-induced overflow, multiple banks, and invalid fallthrough.

Acceptance checks:
1. Every linked function occupies exactly one bank.
2. Oversized functions and impossible placements fail with clear symbol-specific diagnostics.
3. Cross-bank entry targets satisfy even alignment requirements.

Required deliverables: Bank-aware placement/enforcement, fill policy, metadata contract, and bank-layout tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 40: Implement linker relaxation and veneers

**Depends on:** Step 39

**Goal:** Shrink conservative far calls/jumps and conditional branches after final placement, and insert veneers when alignment or range requires them.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Relaxation and veneers are iterative linker transformations with subtle range and alignment invariants; use Sol Max when needed. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Shrink conservative far calls/jumps and conditional branches after final placement, and insert veneers when alignment or range requires them.

Required work:
1. Implement iterative relaxation for calls: `CALLF` to same-bank `CALL rel8` when in range, otherwise to `CALL16` when same-bank, otherwise retain `CALLF`.
2. Implement the analogous jump relaxation and equality-branch shrinking to one-byte `BEQ.S`/`BNE.S` where legal.
3. Expand out-of-range conditional branches to an inverted branch around an appropriately relaxed jump. Ensure iteration converges when instruction sizes change layout.
4. Insert local cross-bank call veneers that are near-callable and use `JMPF` so the remote callee returns directly to the original caller.
5. Insert even-aligned veneers for odd far destinations when necessary, using a same-bank jump to the final odd target where architecturally permitted.
6. Preserve debug/symbol mapping as well as possible and expose relaxation decisions in linker map or verbose diagnostics.
7. Add tests for every relaxation tier, cascading relaxation, veneer creation/reuse, bank-boundary cases, odd target handling, and nonconvergence safeguards.

Acceptance checks:
1. Final control-flow encodings are the shortest legal forms after layout.
2. Every far target is even or reached through a valid aligned veneer.
3. Relaxation terminates deterministically and never invalidates bank constraints.

Required deliverables: LLD relaxation engine, veneers, iterative layout handling, and exhaustive linker tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 41: Generalize the AVM image writer for production linked ELF files

**Depends on:** Step 40

**Goal:** Extend the early `llvm-avm-image` implementation to convert fully linked AVM ELF files into production images without regressing the restricted assembly-test path.

**Recommended agent profile:** `GPT-5.6 Sol` with `Extra High` reasoning. Production image generation must preserve linker placement and exactly implement header, CRC, data, padding, and tail rules; use Sol Max when needed. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point. It enables LLVM tools and LLD by default; preserve the existing `llvm-avm-image` target and integrate its production mode without forcing Clang or unrelated targets. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Assume all preceding steps are complete. Do not change the linked-image format or interpreter contract outside `docs/arch.md`. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Generalize the existing `llvm-avm-image` tool and reusable image library from Step 11 so they consume fully linked AVM ELF files and implement the complete production image path.

Required work:
1. Reuse and extend the `llvm-avm-image` tool and reusable serialization/validation code introduced in Step 11. Do not add a second competing image-format implementation or silently remove the restricted single-`ET_REL` assembly-test mode.
2. Add production input support for fully linked AVM `ET_EXEC` ELF files emitted by LLD, while preserving the early mode behind an explicit option or unambiguous ELF-type dispatch. Keep one documented tool target and one authoritative header/tail/CRC implementation.
3. Document and test the tool's explicit build target name. Preserve the root cache defaults and command-line override behavior; do not add `FORCE` or enable Clang merely for this tool.
4. Consume the linked AVM ELF and reserve the first 256 bytes for the header. Emit the contiguous `.data` initializer at logical/file offset `0x000100`, compute `programStart = align_up(0x100 + dataSize, 0x100)`, and fill alignment gaps with `0xFF`.
5. Lay out linked program-space sections at their linker-assigned logical addresses, preserving bank placements and allowing code/readonly-data interleaving. Unlike Step 11's restricted deterministic layout, production mode must trust and validate the final LLD addresses rather than re-layout linked sections heuristically.
6. Compute `dataSize`, `staticSize`, `saveSize`, and the 24-bit entry point. Enforce all size limits, section-space rules, bank-layout assumptions, and entry-point validity requirements from `docs/arch.md`.
7. Serialize header magic `41 56 4D 01`, `runtimeVersion`, fields, zero reserved bytes, and CRC-32/ISO-HDLC over bytes `0x00-0xFB`, storing the CRC little-endian at `0xFC` through the shared implementation from Step 11.
8. Choose `fileSize = align_up(endOfPayload + 8, 0x100)`, fill final padding with `0xFF`, and write the mandatory eight-byte tail with magic `41 56 54 01`, image page count, and zero reserved field.
9. Extend validation and inspection modes for linked images, including header/tail decoding, CRC verification, page-count reconstruction, linked-section/layout reporting, bank-boundary checks, development-placement checks, and detection of runtime-excluded debug/nonallocatable sections.
10. Add golden linked-binary tests, malformed-ELF tests, corruption tests, page-count tests, maximum static/save-size tests, reproducibility tests, linked-section placement tests, and a build-system test that invokes the tool target from the root build. Continue running all Step 11 single-object assembly-image tests unchanged.

Acceptance checks:
1. The output file offset equals logical program address for every stored runtime byte from the linked ELF.
2. The image length is a multiple of 256 and the tail page count exactly matches it.
3. Header CRC, reserved bytes, padding, bank/layout assumptions, and all architecture invariants validate.
4. Both production `ET_EXEC` mode and the early restricted `ET_REL` assembly-test mode build and pass their tests through the same documented tool target.
5. The tool remains available through the root CMake workflow without changing the default enabled LLVM projects.

Required deliverables: Production linked-ELF mode in the existing AVM image writer/validator, preserved early assembly mode, root-build documentation, and golden/negative tests for both modes.

Before finishing, build the image-tool target through the repository-root configuration and run its complete focused test set, including the Step 11 assembly-image tests and the relevant LLD layout tests. Produce at least one linked image and validate it byte-for-byte. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 42: Add debug information, assembler directives, and stack metadata support

**Depends on:** Step 41

**Goal:** Make generated code debuggable without placing nonruntime metadata in the flat image.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Debug and metadata support spans several formats but follows established implementation contracts. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Make generated code debuggable without placing nonruntime metadata in the flat image.

Required work:
1. Define the minimum DWARF register-number mapping for `R0-R7`, `SP`, `FLAGS`, `PB`, and any represented PC/CB state.
2. Implement CFI or target-specific unwind/debug directives only to the extent valid without exceptions. Do not claim runtime unwinding support that does not exist.
3. Ensure `.debug_*`, symbol tables, line tables, stack-usage metadata, and build identifiers remain in ELF or sidecar outputs and are excluded from the flat runtime image.
4. Add assembler directives needed for section/address-space selection, function size/type, alignment, and AVM metadata used by the linker.
5. Preserve source locations through pseudos, post-RA compression, relaxation, and veneers as accurately as the LLVM/LLD infrastructure permits.
6. Add tests using `llvm-dwarfdump`, `llvm-objdump --source` where supported, linker maps, and image validation to confirm debug sections are not copied into the image.

Acceptance checks:
1. ELF retains useful symbol and line information after linking.
2. The flat image contains only runtime bytes, header, padding, and tail.
3. DWARF register numbers and stack metadata are documented and stable.

Required deliverables: Debug-register mapping, metadata/directive support, sidecar/debug policy, and tests.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 43: Build an end-to-end conformance test matrix

**Depends on:** Step 42

**Goal:** Verify the complete Clang-to-image toolchain and architecture semantics with small deterministic programs.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. End-to-end conformance requires broad coverage and disciplined fixture design. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Verify the complete Clang-to-image toolchain and architecture semantics with small deterministic programs.

Required work:
1. Create end-to-end tests that compile C and LLVM IR with Clang/llc, assemble, link with LLD, produce a flat image, validate the image, and inspect or execute it.
2. If an AVM interpreter/emulator is available in the repository, integrate it as an optional execution test harness. Otherwise create a lightweight reference decoder/semantic harness sufficient for deterministic instruction-level tests without duplicating the production backend.
3. Cover integer arithmetic and flags, all branch predicates, unaligned data loads/stores, stack frames, nested calls, recursion limits, variadic calls, globals, constructors, function pointers, program-space loads, bank crossings, far calls, and save-size metadata.
4. Add ABI cross-check tests that independently inspect caller and callee MIR/assembly for every argument and return class.
5. Add image placement tests for flashcart-supplied page bases and both development tail locations, even though physical placement may be handled by external tooling.
6. Create a documented command that runs the AVM-specific test suites without requiring all LLVM targets.

Acceptance checks:
1. Representative freestanding C programs compile to valid AVM images.
2. Execution tests, where available, match host-computed expected results.
3. Every major architectural section in `docs/arch.md` is mapped to at least one test.

Required deliverables: End-to-end test suite, optional execution harness integration, architecture-to-test coverage matrix, and test-run documentation.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 44: Add negative testing, fuzzing, and diagnostics hardening

**Depends on:** Step 43

**Goal:** Ensure malformed assembly, objects, relocations, layouts, and images fail safely with actionable diagnostics.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Diagnostics and fuzzing benefit from strong reasoning but can be decomposed into bounded negative cases. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Ensure malformed assembly, objects, relocations, layouts, and images fail safely with actionable diagnostics.

Required work:
1. Add negative MC tests for every reserved primary/secondary encoding, malformed RRSPEC bits, invalid compact registers, out-of-range immediates, odd far targets, and forbidden postincrement overlap.
2. Add LLD tests for relocation overflow, cross-address-space misuse, oversized functions, bank overflow, fallthrough across banks, impossible veneers, duplicate/conflicting metadata, and corrupted objects.
3. Add image-writer tests for invalid sizes, entry points, padding, CRC, tail magic, tail page count, reserved fields, and physical-placement overflow.
4. Where LLVM's fuzzing infrastructure is available, add focused fuzz targets for AVM assembly parsing, disassembly, object relocation parsing, and image validation. Seed corpora with every legal instruction length and extension family.
5. Run sanitizers supported by the host build on the AVM-specific tests and fix crashes, infinite loops, unchecked truncation, and undefined behavior.
6. Standardize diagnostics so messages name the symbol, section, instruction, or field and show the invalid value and legal range.

Acceptance checks:
1. Malformed inputs do not crash or hang the tools.
2. Reserved encodings never silently become valid instructions.
3. Diagnostics are stable enough for `lit` checking and useful to a toolchain user.

Required deliverables: Negative tests, fuzz targets/corpora where supported, sanitizer fixes, and standardized diagnostics.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 45: Add profiling instrumentation and tune AVM-specific policies

**Depends on:** Step 44

**Goal:** Collect the measurements required by the architecture before assigning reserved opcodes or finalizing cost thresholds.

**Recommended agent profile:** `GPT-5.6 Sol` with `High` reasoning. Profiling and policy tuning require synthesis across measurements; Terra may assist with mechanical corpus/report work. **Independent review:** Optional unless the diff or failures are surprising.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Collect the measurements required by the architecture before assigning reserved opcodes or finalizing cost thresholds.

Required work:
1. Add optional compiler/linker reporting for static instruction bytes, compact-encoding eligibility and success, extension-page frequency, spills, stack-offset distribution, branch ranges, call ranges, bank distribution, veneers, and relaxation savings.
2. Define a machine-readable report format suitable for aggregating multiple Arduboy workloads.
3. If execution profiling is available from the interpreter/emulator, integrate dynamic opcode counts, taken/not-taken branches, program-load frequency, handler cycles, and postincrement alternatives.
4. Build a representative benchmark corpus of small games, graphics loops, input/audio code, C library routines, and C++ features supported by the target.
5. Use measurements to tune compact-register allocation, jump-table thresholds, postincrement selection, inline-vs-libcall decisions, and branch/call cost models. Keep each policy change in a separate testable commit.
6. Do not assign any opcode in `0x50-0x6F` in this step. Produce a data-backed recommendation document only.

Acceptance checks:
1. Reports reproduce the profiling categories required by `docs/arch.md`.
2. Policy changes are justified by before/after data and retain correctness tests.
3. Reserved opcodes remain reserved.

Required deliverables: Profiling/reporting support, benchmark corpus, tuned policies, and `docs/llvm_plan/avm-isa-profiling-results.md`.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---

## Step 46: Finalize documentation, compatibility contracts, and release gates

**Depends on:** Step 45

**Goal:** Turn the working backend into a maintainable toolchain component with explicit versioning and repeatable release checks.

**Recommended agent profile:** `GPT-5.6 Sol` with `Medium` reasoning. Use Medium for the documentation work, followed by an independent Sol High final implementation and traceability audit. **Independent review:** Recommended before proceeding.

### Agent prompt

```text
You are implementing one narrowly scoped step of the AVM LLVM toolchain. Work from the repository root. Refer to `docs/arch.md` for all target information and treat it as the architectural source of truth. Place every Markdown document created or updated by this step under `docs/llvm_plan/`, creating that directory if needed; do not move `docs/arch.md`. The LLVM fork is in `deps/llvm-project`; inspect that checked-in revision and nearby targets before choosing APIs or file structure. Inspect the existing AVM changes, `git status`, tracked diffs, and untracked files before editing; extend the current implementation and do not recreate work that is already present. Use the repository-root `CMakeLists.txt` as the normal build entry point and preserve command-line cache overrides. The repository began with `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD` empty; Step 3 enabled AVM only after adding coherent target component libraries. Preserve the AVM target-enablement state established by the preceding steps. Use the existing `build/` directory and its configured generator. Build only the Debug configuration: every `cmake --build` invocation must include `--config Debug`, every `ctest` invocation must include `-C Debug`, and generated tools must be invoked from the Debug output location. On Windows, if `build/CMakeCache.txt` records Ninja or Ninja Multi-Config with an MSVC `cl.exe` compiler, initialize the matching Visual Studio/MSVC developer environment before building and use the same installation/toolset that configured the tree; a different MSVC version can cause ABI or linker failures. If needed, locate the matching Visual Studio instance with `vswhere.exe`, call its `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` and tests from that same shell. Missing headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h` usually indicate missing environment setup. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`. Re-run root CMake only when this step explicitly requires a configuration change, such as enabling another project. Assume all preceding steps in the implementation plan are complete. Do not implement later steps. Keep the tree buildable, add focused tests, run them, and stop after reporting changed files, test commands, results, and any open issue.

Objective: Turn the working backend into a maintainable toolchain component with explicit versioning and repeatable release checks.

Required work:
1. Document the backend directory structure, supported LLVM IR types/operations, ABI, address spaces, assembly syntax, ELF relocations, linker behavior, image-tool commands, runtime helpers, and known limitations.
2. Create a traceability table mapping each relevant section of `docs/arch.md` to implementation files and tests.
3. Document the selected canonical triple, ELF machine value status, relocation numbers, DWARF register numbers, runtime helper names, and `runtimeVersion = 1` compatibility contract.
4. Add a release-gate script or documented command sequence that reuses the single repository-root `build/` directory and existing generator. Exercise at least two sequential CMake states: (a) the focused LLVM+LLD build and (b) the Clang-enabled build using `-DLLVM_ENABLE_PROJECTS="clang;lld"`. Every build command must use `cmake --build build --config Debug`, every CTest command must use `ctest --test-dir build -C Debug`, and all directly invoked tools must come from the Debug output. Build AVM tools, run all AVM tests, validate golden images, and optionally execute emulator tests on every supported host configuration.
5. Audit all TODOs, temporary fallbacks, unimplemented operations, and open issues. Convert silent limitations into diagnostics and close or explicitly defer each issue.
6. Run formatting, generated-check, sanitizer, and reproducibility checks. Confirm that release images do not contain debug metadata and that identical inputs produce identical flat images.
7. Do not change `docs/arch.md` merely to match implementation accidents; any required architecture change must be reviewed as a separate design decision with versioning impact.

Acceptance checks:
1. A new developer can build and use the AVM toolchain from the documentation.
2. Every architecture requirement has an implementation/test reference or a documented unsupported status.
3. The release gate is deterministic and passes on the repository's supported build configurations.

Required deliverables: Complete AVM LLVM documentation, traceability matrix, root-CMake build matrix and release-gate workflow, and resolved/deferred issue list.

Before finishing, run the narrowest relevant build and lit/unit tests plus any AVM-specific tests added in this step. Do not claim success if tests were not run; report the exact blocker instead. Do not edit generated build products. Do not make opportunistic changes outside this step.
```

---


## Current-patch reconciliation checklist

Before declaring any early step complete, verify that the implementation has exactly one authoritative instance of each item below:

| Area | Current snapshot | Planned completion |
| --- | --- | --- |
| Triple architecture enum and parser | Already started with `Triple::avm` | Step 2 verifies canonical triple/platform spelling and adds tests |
| Endianness, pointer width, default object format | Already started | Step 2 verifies behavior and tests it; Step 3 owns LLVM data layout |
| Experimental target list | Already started with `AVM` | Step 2 connects actual `TargetInfo`/CMake target registration |
| ELF machine value | Already started as private `0x4156` | Step 2 centralizes/documents it; later steps reuse it unchanged |
| ELF object/YAML recognition | Already started | Step 2 completes and tests it |
| AVM relocation-name include | Referenced by current diff | Step 2 creates/completes the single authoritative `AVM.def` |
| LLD source-list and target dispatch | Already started | Step 2 supplies a minimal coherent target; Step 38 completes relocation semantics |
| AVM backend directory and TableGen | Not shown in supplied diff | Steps 2-6 create target registration, target machine, registers, instructions, and MC support |
| Clang | Not enabled by root default and not shown in diff | Step 35 explicitly enables and implements it |
| AVM image tool | Not shown in diff | Step 11 adds a restricted single-object assembly path; Step 41 generalizes the same implementation for linked ELF without forcing unrelated LLVM projects |

When the actual working tree differs from this snapshot, update `docs/llvm_plan/avm-llvm-bringup.md` and follow the source tree rather than forcing it to match the old patch.

## Completion definition

The early simulator-validation path becomes available at Step 11 and remains supported thereafter:

```text
Hand-written AVM assembly
    -> llvm-mc AVM ET_REL object
    -> restricted llvm-avm-image layout and validation
    -> interpreter/simulator-consumable AVM flat image
```

This route is intentionally single-object and restricted. It exists to validate MC encodings and interpreter behavior early; it does not replace the production LLD path.

The plan is complete when the final release gate can take a freestanding C/C++ source file through:

```text
Clang source parsing and AVM ABI lowering
    -> LLVM IR with AS0/AS1 pointers
    -> GlobalISel legalization and instruction selection
    -> AVM register allocation and post-RA compression
    -> AVM assembly or ELF object emission
    -> LLD symbol resolution, bank placement, relaxation, and veneers
    -> AVM flat-image generation with header CRC and tail locator
    -> image validation
    -> execution in the AVM interpreter/emulator or equivalent conformance harness
```

A backend that only prints assembly is not considered complete. A complete Version 1 toolchain must also preserve the ABI, distinct address spaces, bank rules, relocation semantics, static-data startup layout, and image format defined in `docs/arch.md`.
