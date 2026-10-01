# Profiling AVM source

Build the game with `-g`, then use the installed SDK tools:

```text
avm-prof record game.elf --for 5s --replay inputs.json -o run.avmp
avm-prof report run.avmp --html profile.html
avm-prof diff before.avmp after.avmp --html diff.html
```

`record` packages the ELF with the SDK's `avm-image` and runs it under the
matching `interp.hex`. The window starts at AVM entry unless `--warmup 1s`
(or another duration) is supplied. Durations are whole `cycles`, `ms`, or `s`
at 16 MHz. Replay events are scheduled at entry, before warmup. The recorder
runs without wall clock pacing. It requires a nonzero `--for` duration and
never replaces an existing output file. Its exit status is 2 if execution
stops before the requested end; the written profile is marked incomplete and
contains the stop reason.

The primary metric is **elapsed emulated cycles** between coherent AVM
instruction boundaries. At a boundary, the previous AVM PC has just completed
its interval and the current PC has not executed. This measures all native
interpreter work, interrupt activity, and waiting between those boundaries.
It is not an intrinsic latency of the AVM opcode. A timed run stops at the
next guest boundary and can overshoot its requested cycle. The file records
requested and actual end cycles. A native fault can leave a partial interval;
those cycles are reported separately and never counted as a completed AVM
instruction. A debugger write to the AVM PC is recorded as a discontinuity.
If native execution goes two million emulator advances without another guest
boundary, the stop reason is `boundary_timeout` and the unfinished interval
is kept in the partial-cycle bucket.

`report` reads only the `.avmp` file. It prints the hottest functions and
source lines, and its self-contained HTML page includes the function table,
source heat map, instruction bytes, and AVM disassembly. The report remains
usable after the ELF is removed. If a source file is unavailable, its file and
line identity and PC costs remain. Use `--source-map OLD=NEW` on `record` or
`report` to find source moved to a new checkout. An optimized build can move
or omit DWARF locations; inspect the instruction drill-down when a source
line seems surprising. A stripped ELF retains any available symbol or raw PC
hotspots.

`--native` adds an independent AVR interpreter view. It enables Ardens's
existing native-PC profiler only for the selected window and uses the matching
installed `avm/interp.elf` to name routines. The ELF's `.text` bytes are
checked against `interp.hex` before names are accepted. Native active,
waiting/idle, and unclassified cycles are shown separately. AVR addresses in
this view must not be summed into AVM source costs.

## Comparable input schedules

A version-1 replay contains ordered button events with cycle offsets, as
described in [lldb.md](lldb.md). `avm replay export` adds ELF, image, and
initial peripheral identity fields; both the debugger and profiler verify
these when loading it. To use the same button schedule with another build:

```text
avm-prof inputs portable exported.json -o inputs.json
avm-prof record before.elf --for 5s --replay inputs.json -o before.avmp
avm-prof record after.elf --for 5s --replay inputs.json -o after.avmp
avm-prof diff before.avmp after.avmp --html diff.html
```

The converted file has no binding `identity`; its original identity is kept
as `provenance`. Each recording stores its actual initial EEPROM, FX save,
ADC, and USB identity. `diff` shows changes in firmware, replay schedule,
window length, peripheral identity, end PC, and display hash before the cost
comparison. These checks reveal workload drift but cannot prove equivalent
behavior. Functions match by linkage name and compilation unit. Source lines
are trustworthy only when the source-file hashes match; changed or missing
sources are shown as tentative.

## Interactive LLDB windows

At any stopped AVM boundary:

```text
(lldb) avm profile start
(lldb) avm run-for 250ms
(lldb) avm profile status
(lldb) avm profile stop
(lldb) avm profile report --top 10
(lldb) avm profile save run.avmp
```

`avm profile start --native` also collects native AVR hotspots. Collection
continues across `continue`, stepping, and repeated `avm run-for` commands.
The profile commands use the `avm` JSON result/error convention. `save`
symbolizes hit PCs after collection and writes the same `.avmp` version as
the standalone recorder. LLDB's `target.source-map` is applied at save and
report time. Relaunch resets the measurement; a PC write reanchors it.

## `.avmp` version 1

The UTF-8 JSON object has `version: 1` and `metric: "elapsed emulated cycles"`.
`window` contains `start_cycle`, `end_cycle`, `requested_end_cycle`, AVM start
and end PCs, completed and partial cycles, discontinuities, completeness, stop
reason, and native active/elapsed totals. `pcs` stores one row per hit AVM PC:
cycles, execution count, instruction bytes and disassembly, function and
linkage name, compilation unit, source file/line/column and hash, available
source text, and an inline chain. `native_pcs` stores AVR byte addresses and
active-cycle costs. `identity` contains ELF, packaged image, interpreter,
initial EEPROM and FX save hashes plus ADC and USB fields. The root also has
the replay-event hash, optional replay provenance, end-display hash, and
interpreter-ELF hash. All 64-bit counts and cycle values are canonical decimal
strings, so JSON and HTML readers never lose precision. The reader rejects
unsupported versions, duplicate PCs, overflowed values, and profiles whose
per-PC and partial costs do not reconcile with the window.

The SDK profiler is built only with `AVM_WITH_ARDENS=ON`. Windows/MSVC is the
verified host platform for this checkout. LLVM sample-PGO export is outside
version 1.

In a serial Windows/MSVC measurement on 2026-10-01, the 20-million-cycle
fixture took median host times of 0.285 s with collection off, 0.284 s with
guest collection, and 0.287 s with native collection (three trials each).
The observed changes were −0.2% and +0.7%, within the run-to-run noise.
These host times measure profiler overhead; they are not game cycle costs.
