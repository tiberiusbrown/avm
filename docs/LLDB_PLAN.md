# Plan: `avm-lldb` for AVM ELF debugging

## Goal and completion criteria

Ship an SDK command named `avm-lldb` that opens an AVM `ET_EXEC` `.elf`, runs its
packaged image through the AVR AVM interpreter inside Ardens, and presents the
*AVM* program as one LLDB process/thread. LLDB owns ELF, symbols, DWARF, source
mapping, variables, and unwind information. Ardens supplies execution, live
memory, buttons, display state, and emulated time. Ardens's own LLVM/DWARF path
stays disabled for this integration.

Completion means an installed SDK can, without a separate GUI:

1. Launch a `.elf` directly; stop at its AVM entry or `main`; disassemble AVM
   instructions; set address, function, and source-line breakpoints; continue,
   interrupt, reset, and step into/over/out.
2. Inspect registers, globals, parameters, locals, types, and call stacks in
   representative C and C++ programs built with `-g`. Report optimized-out
   variables accurately. Read and write supported data memory while stopped.
3. Stop on AVM read, write, and read/write watchpoints, including writes made by
   interpreter system services; identify the AVM instruction and watched address.
4. Sample both the logical framebuffer and the physical displayed image, save
   an image, and return machine-readable capture metadata.
5. Set/release any combination of six buttons; run by simulated duration; load
   and replay timed input events; choose wall-clock pacing on/off; query exact
   emulated cycles and elapsed time. Breakpoints must not silently discard
   pending replay events.
6. Work from the installed SDK, with an automated integration suite and usage
   documentation. A clean `RelWithDebInfo` CMake build and the existing AVM
   tests must pass.

LLDB's arbitrary C/C++ `expr` command is a separate acceptance gate below:
basic value inspection must not be presented as equivalent to injecting and
executing compiled expressions on the guest.

## Verified starting point

- The top-level `CMakeLists.txt` enables LLVM projects `clang;lld`, not `lldb`.
  `avm_toolchain` and `avm_sdk_tools` do not include a debugger. The repository
  contains LLDB sources under `deps/llvm-project/lldb`.
- The AVM MC asm info in
  `deps/llvm-project/llvm/lib/Target/AVM/MCTargetDesc/AVMMCTargetDesc.cpp`
  sets `SupportsDebugInformation = false`. A small `-g -O0` AVM compile was
  checked: its object had `.symtab` but no `.debug_*` sections. The AVM target
  has no explicit DWARF register numbers or frame CFI implementation.
- LLDB's `ArchSpec`, ABI plugin list, and ELF object handling do not currently
  recognize `EM_AVM`. Merely enabling the LLDB CMake project will not make AVM
  objects debuggable.
- The top-level build already sets `ARDENS_LLVM=OFF`. `ardensdebuggerlib` is the
  Ardens target used by `tests/avm_tests.cpp`; avoid `ardenslib`, whose player
  configuration defines `ARDENS_NO_DEBUGGER`.
- Existing AVM tests load `interp/build/interp.hex` plus a packaged FX `.bin`
  into `absim::arduboy_t`. `avm_add_image` already packages ELF with
  `llvm-avm-image --development`. Ardens's ELF loader is for AVR ELF, so it
  cannot be the AVM debug-image loader.
- Interpreter state is visible in AVR state: AVM PC in native `r4:r6`, AVM
  `r0-r7` in native `r8:r23`, AVM SP in native `r28:r29`, and CC in `GPIOR0`
  (`interp/interp.asm`). AVR SRAM holds the usable AVM data ranges. Ardens has
  `cycle_count`, display RAM/rendered pixels, active-low button pins, snapshot
  support, and AVR-level data breakpoints.
- `docs/arch.md` defines a 24-bit program address space, 16-bit data address
  space, three-byte code pointers and return addresses, one-byte alignment,
  `EM_AVM=0x4156`, custom section flags, and a 16 MHz device clock. These are
  debugger ABI requirements, not implementation conveniences.

## Architecture and ownership

Use a native LLDB process plugin backed by a small AVM/Ardens adapter, built
into the `avm-lldb` host executable or its linked LLDB library. The process
plugin exposes one logical AVM process with one logical AVM thread; it must
never expose AVR interpreter frames as game frames. Implement target commands
under one `avm` command namespace. Keep the adapter's emulator controls in a
testable library independent of the command parser.

The planned layering is:

```text
avm-lldb CLI and `avm` commands
        |
LLDB AVM architecture, ABI, Process, Thread, RegisterContext
        |
AVM emulator adapter: guest instruction boundary, memory, events, captures
        |
Ardens debugger core + interpreter HEX + packaged FX image
```

An in-process plugin is the primary design because it keeps the Ardens library
embedded and permits direct access to display and input state. A GDB remote
stub is an alternative only if an early LLDB build/plugin spike demonstrates
an in-process blocker. Switching transports must not change the AVM ABI,
debug-info work, command contract, or tests.

Use the original ELF as LLDB's symbol/debug file. Package a temporary FX image
with the installed `avm-image` (or a shared packer library) on launch. Do not
point LLDB at the packaged `.bin` for symbols. Verify ELF class, endianness,
machine, ABI flag, entry point, image size, interpreter version, and packer
success before starting. Preserve an optional explicit `.bin` override only
with a robust ELF/image identity check. Avoid shell invocation for packaging.

## Phase 0: lock down the debug contract and build spike

- [ ] Add an AVM debugger ABI document, adjacent to `docs/arch.md`, specifying
  DWARF version, register numbers, PC/SP/CC encoding, `qN` representation,
  three-byte return addresses, CFA/frame-base rules, pointer address classes,
  program/data address translation, and stop-point semantics. Keep actual
  guest pointer storage at 16 or 24 bits.
- [ ] Make a tiny fixture with a global, stack local, nested calls, data and
  program pointers, and a button-driven display update. Keep `-O0` and an
  optimized variant. Record expected addresses and values as a golden trace.
- [ ] Enable `lldb` in the existing LLVM build in a minimal configuration and
  prove its CLI and liblldb build with the configured host toolchain. Determine
  the exact target/link arrangement for `avm-lldb` and Ardens without building
  a second LLVM tree or introducing a CMake dependency cycle. Test Windows
  first, then the supported non-Windows SDK hosts.
- [ ] Check the actual interpreter binary/map for a stable AVM instruction
  boundary. Entry to each fixed-stride primary dispatch slot is a candidate:
  the dispatch macros have already advanced the native `r4:r6` PC past the
  opcode, so the logical instruction address may be `VM_PC - 1`. Prove this
  for startup, all opcode lengths, branches, calls, returns, invalid opcodes,
  interrupts, and system services before relying on it. Generate/debug-check
  hook addresses from the interpreter ELF/map; do not hard-code native PCs
  against an unversioned firmware image. If no single safe point exists, add
  a low-cost, versioned interpreter-to-host boundary marker.
- [ ] Define one authoritative stop snapshot: guest PC at the first byte of
  the *next* AVM instruction, all architectural registers and memory coherent,
  completed prior side effects, and a precise emulated cycle count. Document
  how watchpoints report a completed instruction when the host stops at its
  following boundary.

**Gate:** A standalone probe can launch the fixture, enumerate consecutive
AVM PCs and register values, and agree with the AVM disassembler and known
trace while both short and long instructions execute.

## Phase 1: emit usable AVM DWARF from Clang/LLVM/LLD

- [ ] Enable debug information in AVM MC asm info only after setting the
  target's DWARF minimum instruction length, code pointer size, default CFI
  state, and register-number mappings. Assign stable numbers for `r0-r7`, SP,
  PC, and CC. Express `qN` values through constituent registers/pieces unless
  a separate number is demonstrably needed.
- [ ] Make `avm-clang -g -O0/-Og/-O2` emit correct compile units, line tables,
  subprograms, lexical scopes, types, parameters, globals, locals, and
  location expressions/lists. Verify physical register, register-pair,
  frame-relative, and stack-spill locations; account for byte-valued low halves
  and 24-bit code pointers. Test C and C++ names/types.
- [ ] Emit and test call-frame information in `AVMFrameLowering` for every
  prologue, epilogue, callee-save push/pop, SP adjustment, optional `r3` frame
  pointer, and call site. Ensure the unwind rule reads three-byte return
  addresses and works before, within, and after the prologue. Handle
  `-fomit-frame-pointer`, leaf functions, indirect calls, tail calls, and
  hand-written
  assembly with documented fallbacks. Prefer nonallocated `.debug_frame` if
  runtime unwind data is not required; measure any image-size effect.
- [ ] Specify and emit DWARF address classes for 16-bit data pointers and
  24-bit program/function pointers. Verify LLDB can dereference both when
  numeric addresses overlap, without widening stored pointers. Cover
  `DW_OP_addr`, `DW_OP_fbreg`, `DW_OP_reg*`, `DW_OP_breg*`, pieces, and the
  forms Clang actually emits for this target.
- [ ] Test linker handling of `.debug_*` and `.debug_frame` through section
  garbage collection and AVM branch/call relaxation. Check final linked
  addresses, line ranges, symbol scopes, relocations, and CFI after 8-, 16-,
  and 24-bit control-transfer forms. Add AVM LLD relocation support for debug
  sections if needed. Ensure `avm-image` ignores nonallocated debug sections
  and its output bytes match the same program built without `-g`.
- [ ] Add compiler, MC, LLD, and readobj/objdump tests. Fail the build test if
  `-g` produces no `.debug_info`/`.debug_line`, if source addresses differ
  from final code, or if unwind rules cannot recover nested return addresses.

**Gate:** `avm-readobj` and LLDB can inspect line tables and variable
locations in a linked fixture; an ELF with `-g` packages and runs unchanged.

## Phase 2: make LLDB understand the AVM target

- [ ] Register `EM_AVM`, the `avm-unknown-arduboyfx` triple, little-endian
  ELF32, the AVM core, instruction-length range, ABI flag, and section flags
  in LLDB's architecture/object-file paths. Reject an incompatible ABI.
- [ ] Make LLDB load AVM `.text`/`.rodata` as program space and `.saved`/`.data`
  as data space. Define a collision-free *debugger load-address* mapping while
  preserving raw guest pointer values. Translate by section and pointer
  address class on reads/writes; never conflate program `0x0100` with data
  `0x0100`. Verify symbol lookup, source breakpoints, `image lookup`, and
  dereferencing pointers in each space, including program addresses above
  `0xffff`.
- [ ] Register AVM disassembly using the existing LLVM AVM disassembler and
  match LLDB register names, instruction sizes, and displayed addresses.
- [ ] Implement an AVM ABI/unwind plugin: register definitions and generic
  roles (PC/SP/flags), argument/return locations, callee-saved registers,
  CFA/return-address recovery, frame-base selection, and fallback unwind
  behavior. Validate `thread backtrace`, `frame select`, and `frame variable`.
- [ ] Add LLDB tests for object detection, symbol context, line breakpoints,
  16/24-bit pointer types, register access, unwind, and duplicate numeric
  addresses across address spaces.

**Gate:** LLDB opens the fixture ELF as AVM, disassembles it, resolves source
locations and symbols, and uses the specified address mapping consistently.

## Phase 3: Ardens adapter and LLDB process control

- [ ] Build a small adapter over `ardensdebuggerlib` with `ARDENS_LLVM=OFF` and
  no GUI dependency. Package or locate the matching `interp.hex` and its
  versioned boundary metadata in the SDK. Check interpreter/image runtime
  compatibility at launch; emit actionable diagnostics for missing firmware,
  malformed ELF, failed packaging, unsupported layout, and missing debug info.
- [ ] Start Ardens with interpreter HEX and packaged FX image, run through AVR
  reset/startup, and establish the first AVM stop at the ELF entry. Define
  whether emulated-time origin is emulator reset or AVM entry; expose both.
- [ ] Read/write AVM `r0-r7`, SP, PC, and CC through the interpreter's native
  storage, with widths and reserved bits validated. Read supported data space
  from live AVR SRAM and program space from current FX state/overlays. Reject
  unsupported addresses and program writes with clear errors. Restrict state
  mutation to stopped state and invalidate LLDB caches after writes.
- [ ] Add efficient guest-boundary notifications or probes. Ensure Ardens
  merged-instruction optimization cannot skip a requested stop, watchpoint,
  input event, or time deadline. Keep a fast path when no fine-grained event
  is pending; benchmark against the current headless run.
- [ ] Implement LLDB Process/Thread/RegisterContext operations: launch,
  resume, halt/Ctrl-C, reset/relaunch, destroy, thread state, memory regions,
  register reads/writes, async stop notification, and precise stop reasons.
  Serialize emulator access across LLDB command and run threads. Distinguish
  breakpoint, watchpoint, `SYS debug_break`, invalid instruction, emulator
  fault, timed-run completion, replay completion, and user interrupt.
- [ ] Implement nonpatching AVM software breakpoints keyed by logical program
  address. Resolve pending function/source breakpoints, support multiple sites,
  enable/disable/remove, conditions, hit counts, and continue-past-current-
  breakpoint without immediately retriggering. Do not rewrite flash or alter
  AVM code bytes.
- [ ] Implement AVM instruction step and source step. Step-over/out must use
  correct frame depth/call semantics, including direct and indirect calls,
  runtime helpers, tails, and interrupts. Define fallback when unwind data is
  missing. Stepping must not expose AVR interpreter instructions.
- [ ] Define behavior on reset, program reload, snapshot restore, and FX
  changes: revalidate image identity, refresh code/data caches, re-resolve
  breakpoints, and invalidate stale variable/frame state.

**Gate:** The user can run `avm-lldb game.elf`, break at `main`, continue,
single-step, view registers/memory/source, inspect a backtrace, and reset.

## Phase 4: AVM software watchpoints

- [ ] Add an Ardens memory-access callback or equivalent lossless event path
  that records each relevant AVR SRAM read/write, address, value, cycle, and
  originating guest instruction. Existing `just_read`/`just_written` and
  AVR-only breakpoint bitsets are not by themselves a complete AVM watchpoint
  implementation. Cover single/multi-byte accesses and writes by `SYS`
  services, including framebuffer operations.
- [ ] Map each supported physical access to AVM data-space semantics; ignore
  firmware-private traffic. For a watched range, report access kind and byte
  range; stop at the next coherent AVM boundary. Ensure read watchpoints do
  not fire because the debugger reads memory, and write watchpoints fire even
  when the stored value is unchanged.
- [ ] Wire LLDB watchpoint creation/removal/enable/disable and stop reasons to
  the adapter. Specify behavior for overlapping ranges, one-shot/conditional
  watchpoints, unsupported I/O addresses, and guest-initiated flash changes.
- [ ] Measure callback cost and add a no-watchpoint fast path. Test accesses
  from ordinary loads/stores, stack operations, display `SYS` calls, and
  interpreter startup, with no false stops from private interpreter writes.

**Gate:** A write and a read watchpoint each stop once at the correct AVM
instruction with the correct value/address, including a service-side write.

## Phase 5: display inspection commands

- [ ] Add `avm display capture`/`save` with explicit modes: logical AVM
  framebuffer at data `0x0500-0x08ff`; controller RAM; and physical visible
  128x64 pixels after Ardens display mapping/filtering. Keep mode names and
  orientation explicit. The visible capture must reflect Ardens display state,
  not merely bytes in the game framebuffer.
- [ ] Produce PNG (or another universally readable image) and optionally raw
  pixel bytes. Return width, height, mode, cycle/time, pixel format, path, and
  a content hash in stable JSON for agents. Define output path handling,
  overwrite behavior, and errors. Sampling while stopped must not advance
  emulation or alter the filter; a capture during running must be serialized
  at a defined cycle/boundary.
- [ ] Test a fixed framebuffer pattern and a physical-display update that
  occurs later via SPI; assert the two modes differ when expected. Test
  inversion, display-off state, rotation/remap, and temporal filtering.

**Gate:** An agent can save and inspect the current visible screen and can
query the raw logical framebuffer separately.

## Phase 6: buttons, timed runs, replay, and pacing

- [ ] Provide `avm button press/release/set/status` for UP, RIGHT, LEFT, DOWN,
  A, B, including simultaneous buttons. Translate to Ardens's active-low
  PINF/PINE/PINB state. Reuse one input path for manual commands and replay;
  ensure it coexists with Ardens input history and snapshot/time travel.
- [ ] Implement `avm run-for <duration>` against the 16 MHz emulated clock,
  not host time. Parse durations to integer cycles with documented rounding
  or reject sub-cycle values; guard overflow. If Ardens executes multiple
  cycles per host call, split at a deadline so event timing is cycle-accurate,
  or report an explicit measured bound and actual event cycle. A three-second
  run requests 48,000,000 cycles.
- [ ] Define a versioned replay file schema with ordered events at absolute
  cycles or durations relative to replay start, button-state changes, optional
  capture points, and optional stop/assert conditions. Validate names, time
  ordering, duration bounds, and schema version before executing anything.
  Choose deterministic ordering for simultaneous events. Include load, run,
  pause, resume, status, abort, and export commands. Preserve pending events
  across breakpoint/watchpoint stops; resume continues from the recorded
  emulated cycle. Reset/restart has an explicit replay policy.
- [ ] Add `avm realtime on/off/status`. `off` runs as fast as the host allows;
  `on` throttles toward one simulated second per wall-clock second. Switching
  modes or pausing must re-anchor pacing so wall-clock delay does not silently
  advance guest state. All event timing and `run-for` deadlines remain
  identical in both modes.
- [ ] Add `avm time` returning total cycles, seconds since AVR reset, seconds
  since AVM entry, and optionally replay-relative time. Use integer cycles as
  the source of truth and stable machine-readable output. Report precise
  stop time and requested-versus-actual duration.
- [ ] For reproducibility, record image/interpreter identity, initial EEPROM
  and FX save contents, ADC/random-seed/USB settings, input event cycles, and
  snapshot origin. Replaying from a known reset/snapshot with the same inputs
  must reproduce the same stop trace and display hash. Identify and control
  any remaining nondeterministic peripheral source.

Example intended flow (final spelling may change during CLI design):

```text
(lldb) avm realtime off
(lldb) avm button press DOWN
(lldb) avm run-for 3s
(lldb) avm button release DOWN
(lldb) avm time --json
(lldb) avm display save frame.png --mode visible --json
```

**Gate:** The same timed replay gives the same button observations and capture
hash in paced and unpaced modes; a breakpoint mid-replay preserves its future
release event.

## Phase 7: SDK, agent interface, and advanced debugger behavior

- [ ] Add `avm-lldb` to the SDK CMake build/install targets. Install the
  matching interpreter firmware, debug metadata, `avm-image` dependency or
  shared packer, LLDB runtime libraries/plugins, and licenses as applicable.
  Make installed-path discovery relative to the executable, with explicit
  overrides for development. Do not require the Ardens GUI or its LLVM loader.
- [ ] Provide interactive and batch/scripted use. Document stable JSON output
  for AVM-specific commands, errors, stop reasons, and capture paths so an
  agent can distinguish completion, breakpoint, fault, and timeout without
  parsing human prose. Verify LLDB's `--batch` and command-file behavior.
- [ ] Document supported LLDB commands, source path remapping, `-g` build
  flags, optimized-variable limitations, and examples for breakpoints,
  watchpoints, screenshots, input replay, pacing, and time queries.
- [ ] Evaluate LLDB `expr` separately. First support read-only inspection via
  `frame variable`/`target variable` and typed memory/register reads. Then
  test arithmetic, field/pointer access, assignments, function calls, and
  target-side expression execution. If full `expr` needs guest code injection,
  provide the required memory/call ABI and safe stop/restore mechanics before
  claiming support. Explicitly document any unsupported expression category.
- [ ] Decide whether optional reverse debugging can reuse Ardens snapshots.
  If exposed, make LLDB/replay state restore together and validate reverse
  stop reasons; otherwise keep it out of the first release and do not advertise
  reverse stepping as supported.

## Verification matrix and release gates

Use `RelWithDebInfo` for all builds and runs, through CMake (`cmake --build
build --config RelWithDebInfo --parallel`). Preserve the configured generator
and compiler; on Windows initialize the matching MSVC developer environment
when needed. Follow `.agents/AGENTS.md`: run tests while developing and run
benchmarks after any AVM code-generation change. Do not commit or push changes
in this repository or submodules as part of this work.

| Area | Required checks |
| --- | --- |
| Compiler/debug info | `-g` section presence; DWARF verifier; `-O0` and optimized locals; C/C++ types; 16/24-bit pointers; stack spills; inline functions; tail calls; far code above 64 KiB. |
| Linker/image | Debug-section retention; branch relaxation address updates; `--gc-sections`; identical executable image with/without `-g`; malformed ELF/ABI/oversize failures. |
| Emulator boundary | Every AVM opcode class, branches, calls/returns, services, interrupts, faults, reset; no missed/duplicate guest instruction events. |
| LLDB basics | ELF recognition; `breakpoint set`, `run`, `continue`, `step`, `next`, `finish`, `thread backtrace`, `register read`, `frame variable`, `target variable`, memory read/write, interrupt. |
| Watchpoints | Read/write/range/overlap, same-value stores, service writes, no debugger-read false hit, correct stop PC/value. |
| Display | Logical versus physical image, SPI delay, display off/inversion/remap/filter, capture hash and metadata. |
| Replay/time | Six buttons and combinations, zero/long durations, event ordering, breakpoint interruption/resume, reset/snapshot policy, exact cycle reporting, pace on/off equivalence. |
| Packaging | Build-tree and installed SDK on Windows and supported Unix hosts; paths with spaces; missing files; batch mode; no Ardens GUI dependency. |
| Regression/performance | Existing `avm_tests_run`, LLDB tests, AVM compiler/linker tests, and instruction benchmarks when codegen changes; fast-mode throughput with and without break/watchpoints. |

Final end-to-end demonstration: build a C/C++ game with `-g`, launch its ELF
with the installed `avm-lldb`, break in a nested function, inspect a local and
backtrace, set a write watchpoint, queue DOWN for three emulated seconds, stop
and resume through a breakpoint, capture the visible display, release DOWN at
the scheduled cycle, and query elapsed emulated time. Repeat from a clean
initial state and compare the stop trace and image hash.

## Risks that must be resolved explicitly

1. **Debug info is absent today.** This is a compiler/LLD/LLDB project, not
   just an Ardens wrapper. The first `-g` gate must pass before promising
   source variables.
2. **Two overlapping address spaces.** LLDB's section load addresses and
   DWARF pointer classes must preserve AVM's 16/24-bit values without
   confusing program and data address `0x0100`.
3. **Guest boundary versus AVR execution.** Sampling native registers at an
   arbitrary AVR PC gives inconsistent AVM state. Every stop and capture needs
   a verified coherent boundary or a clearly documented cycle point.
4. **Watchpoint attribution.** AVR memory accesses include interpreter-private
   work; an AVM watchpoint needs exact access events and guest attribution.
5. **Build and distribution size.** Enabling LLDB can add substantial build
   time and runtime dependencies. Keep optional LLDB features minimal where
   compatible with the required debugger capabilities, and verify installed
   artifacts rather than only the build tree.
6. **Expression evaluation and reverse execution.** These are additional
   engineering tasks beyond DWARF variable reads. Do not describe them as
   complete until their separate gates pass.
