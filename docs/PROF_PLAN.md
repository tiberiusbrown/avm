# AVM source-level profiling plan

## Goal

Ship `avm-prof` in the AVM SDK so a developer can run an AVM ELF under the
bundled interpreter, see where emulated time went in their C, C++, and assembly
source, and compare the same workload across builds. Add `avm profile` commands
to `avm-lldb` for profiling a selected part of an interactive debugging
session. Both entry points must use one collector and one profile format.

The primary metric is **elapsed emulated AVR cycles between AVM instruction
boundaries**, not host wall time or an estimate from AVM opcode tables. Record
AVM instruction execution counts as a separate metric. State the actual start
and stop cycles, including any overshoot to the next guest boundary.

Keep Ardens unchanged, use its embedded emulator and existing profiler API, and
leave `ARDENS_LLVM=OFF`. Do not instrument guest code, reserve AVM RAM, or use
guest-side expression execution. Build the profiler only when
`AVM_WITH_ARDENS=ON`; the Ardens-free LLVM/Clang/LLD build must remain valid.

## SDK experience

The intended commands are:

```text
avm-prof record game.elf --for 5s --replay inputs.json -o run.avmp
avm-prof record game.elf --warmup 1s --for 5s --native -o run.avmp
avm-prof report run.avmp --html profile.html
avm-prof diff before.avmp after.avmp --html diff.html
```

`record` starts at AVM entry unless `--warmup` is supplied. It requires a
bounded `--for` duration in cycles, milliseconds, or seconds and runs without
real-time pacing by default. It packages the ELF with the SDK's `avm-image`,
uses the SDK's matching `interp.hex` and boundary metadata, and accepts the
version-1 timed-button replay documented in [lldb.md](lldb.md). Build the ELF
with `-g -gdwarf-4` for source attribution; a stripped ELF still gets PC and
available symbol hotspots. Replay events are scheduled before warmup. Failure
to reach the requested window end must produce a clear stop reason and an
explicitly incomplete profile.

`report` prints the hottest functions and source lines in the terminal. Its
single-file HTML output provides a sortable function table, source heat map,
AVM instruction drill-down, the measurement window, and unmapped-cycle totals.
If source files cannot be found, retain the function, file/line, and AVM
disassembly views rather than silently dropping those costs. Support source
path remapping as in LLDB.

`diff` compares total and per-function cycles and execution counts, then
per-line costs when the source file identity matches. Show absolute and
percentage changes. Surface differences in firmware, replay schedule, window
length, initial peripheral state, and end PC/display hash before presenting a
comparison; these checks indicate workload drift but cannot prove equivalent
program behavior.

For interactive work, add `avm profile start [--native]`, `stop`, `status`,
`save <file.avmp>`, and `report [--top N]` to the existing AVM LLDB command
tree. Commands return the same JSON result/error convention as `avm time`.
They operate at stopped AVM boundaries, survive `continue`, `step`, and
`avm run-for`, and never require a debugger stop at every instruction.

## Timing and attribution contract

1. In [AvmEmulator.cpp](../debug/AvmEmulator.cpp), anchor the collector at
   the current coherent boundary: raw 24-bit AVM PC and 64-bit AVR cycle
   count. At each later boundary, attribute the cycle delta to the *previous*
   AVM PC, increment its execution count once, and move the anchor. The
   current stop PC has not executed yet. Collect sparse per-PC counters, not
   an unbounded instruction trace.
2. Start and stop only at coherent boundaries. The sum of per-PC completed
   intervals plus explicit partial/unattributed cycles must equal the
   recorded window. A fault before the next boundary must not be presented
   as a completed AVM instruction. A breakpoint, watchpoint, debug break,
   timed deadline, or interrupt at a boundary must not duplicate or omit the
   preceding interval when execution resumes.
3. Preserve the anchor across ordinary LLDB stop/resume cycles. On launch,
   reset, or a debugger write to the AVM PC, reanchor at the new PC and
   account for the discontinuity explicitly. Use checked 64-bit arithmetic
   for cycles and counts. Profiling must leave guest registers, RAM,
   breakpoints, timed inputs, and display behavior unchanged.
4. Label the primary number "elapsed emulated cycles": it includes native
   interpreter work and any interrupt or wait time between guest boundaries.
   If the Ardens active-cycle totals can be reconciled for the same window,
   expose active and waiting/idle cycles as secondary columns. Never label a
   boundary delta as an intrinsic AVM opcode latency.
5. Ardens already stores cycle counts by **native AVR instruction PC** in
   `profiler_state.counts`. That aggregate cannot be symbolized with the AVM
   ELF. With `--native`, enable and snapshot Ardens's existing profiler for
   the selected window and show a separate interpreter hotspot view by AVR
   address. Install the matching `interp.elf` if its symbols are needed to
   name native routines; verify it matches the packaged firmware. Keep
   native and guest costs in separate tables and explain any excluded sleep
   or unclassified cycles. Do not modify Ardens or replace its breakpoint
   behavior.
6. Keep collection cheap when disabled: no map updates, DWARF lookups, file
   writes, or native-profiler enablement in the execution loop. Symbolize
   unique hit PCs after collection, not at every dispatch.

## Source mapping and profile data

Use the LLDB symbol machinery already capable of reading the AVM ELF's
three-byte DWARF addresses. Offline `avm-prof` can create an LLDB target and
resolve AVM file addresses without launching an LLDB process; the LLDB
command can use its current target. Validate both against the same fixture.
In this checkout `avm-lldb image lookup --address` resolves AVM source
locations, while `llvm-symbolizer` rejects DWARF address size 3; do not
widen the ABI to 4 bytes or make `llvm-symbolizer` a required SDK component.

Cache a mapping from hit AVM PC to function identity, file, line, column or
discriminator where available, and inline chain. Attribute each PC's cost
once to its innermost source location; derive inclusive inline/caller views
without summing the same cycles twice. Preserve distinct rows for different
PCs on one line. Fall back to ELF symbols and an explicit `<unmapped>` bucket
when line information is absent. Optimized code may move or omit source
locations, so always provide the PC and AVM disassembly behind a hot line.

Define `.avmp` version 1 as a documented, machine-readable profile. Store
raw per-PC cycles/counts, instruction bytes or disassembly, resolved
locations, aggregate and unattributed totals, requested and actual window
boundaries, stop reason, ELF/image/
interpreter hashes, replay event hash, initial peripheral identity, end PC,
end display hash, and available source-file hashes. Preserve enough resolved
locations to render and compare a baseline after its ELF has been replaced.
Use exact 64-bit values in the file and HTML reader; reject malformed,
overflowed, or unsupported versions. The report generator reads `.avmp`
without rerunning emulation.

For cross-build comparisons, accept an identity-free version-1 button event
schedule. Existing `avm replay export` files contain ELF and image hashes
and must remain strict when loaded normally. Provide an explicit
`avm-prof inputs portable exported.json -o inputs.json` conversion that
copies the timed events but removes build-specific binding, while retaining
the original identity as provenance. The two `record` runs must report their
actual initial peripheral identities and the diff must warn when they differ.
Match functions by linkage name and compilation unit; compare source lines
only when file hashes match, otherwise mark line deltas tentative and keep
function-level comparison available.

## Implementation sequence

1. **Freeze the measurement contract.** Add small C, C++, and assembly
   fixtures with known guest PCs, loops, branches, a high 24-bit code address,
   and an optimized inline call. Record the expected boundary/stop behavior
   and the intended profile schema before implementing reports.
2. **Share launch and input support.** Extract SDK path discovery, temporary
   image packaging, duration parsing, and replay validation from
   `ProcessAVM.cpp` into host-side helpers used by both entry points. Preserve
   existing `avm-lldb` launch and replay behavior, including strict exported
   replay identity checks.
3. **Add one collector to the emulator adapter.** Implement the lifecycle and
   sparse counters in `debug/AvmEmulator.*` or a small adjacent component.
   Use the existing boundary and cycle observations; optionally read
   Ardens's native profiler state for `--native`. Expose immutable snapshots
   so serialization and symbolization happen outside the run loop and LLDB
   emulator lock.
4. **Build the profile writer and symbolizer.** Use LLDB's address and symbol
   context APIs for three-byte DWARF. Add versioned `.avmp` validation,
   source-path remapping, inline attribution, and an unmapped bucket.
5. **Build the two interfaces.** Add the installed `avm-prof` executable and
   shared launch support in [debug/CMakeLists.txt](../debug/CMakeLists.txt);
   then add `avm profile` commands to the AVM process plugin. Keep
   `AVM_WITH_ARDENS=OFF` free of Ardens and LLDB targets.
6. **Reports and comparisons.** Generate terminal and self-contained HTML
   reports from the profile file, then implement diff and portable-input
   conversion. Do not require a network service or a GUI. LLVM sample-PGO
   export is outside version 1: it needs a separately validated mapping to
   source discriminators, inline call sites, and compiler profile weights.
7. **Document the installed workflow.** Add a profiling guide with one
   command to record, one to inspect, and one to compare; explain the timing
   semantics, replay identity choices, optimized-DWARF limitations, and
   optional native interpreter view. Link it from [lldb.md](lldb.md).

## Verification gates

- Build every new and affected target with `RelWithDebInfo` through
  `cmake --build`. On Ninja/MSVC, initialize the matching MSVC environment
  from the configured compiler before building. Keep the current generator
  and compiler.
- Add and run an `avm_prof_integration_run` target using the existing debug
  fixture and a deterministic input schedule. Check exact per-PC execution
  counts, sum-of-cycles reconciliation, source/function/inline lookup,
  24-bit PCs, a source-free fallback, and CLI/LLDB profile equivalence.
- Test start/stop across stepping, repeated run calls, breakpoints,
  watchpoints, replay events, PC writes, early faults, and relaunch. With
  profiling off/on and pacing off/on, compare stop PC, emulated cycle count,
  replay trace, and display hash. Test native counters separately.
- Test profile serialization, malformed input rejection, HTML generation,
  strict exported-replay identity, portable cross-build input, and diff
  warnings for mismatched firmware, source revision, or workload. Verify a
  profile remains reportable after its original ELF is unavailable.
- Build `avm_toolchain`, `avm_prof`, and the existing
  `avm_lldb_integration_run` and `avm_lldb_long_replay_run` gates. Install
  the SDK to a temporary prefix and run the installed profiler against an
  AVM ELF. Configure and build an LLVM target with
  `AVM_WITH_ARDENS=OFF` to confirm the profiler and LLDB are absent.
- Measure host throughput for the same emulated window with collection
  disabled, guest collection enabled, and `--native` enabled. Record the
  overhead and remove per-boundary allocation or symbol lookup if present;
  host time is a profiler engineering metric, not the reported game cost.
- Run `git diff --check` and confirm no Ardens files changed. If code
  generation changes during implementation, run the repository benchmarks
  after those changes. Leave all work uncommitted and unpushed.

Completion requires the installed SDK workflow, the LLDB workflow, source
and native reports, reproducible comparison, and all applicable gates above
to pass. Document any platform or DWARF cases that remain unverified.
