# Debugging AVM programs with LLDB

The SDK's `bin/avm-lldb` opens an AVM ELF file as the symbol and DWARF file,
packages its executable image with the matching `avm-image`, and runs that
image through the bundled AVR interpreter inside Ardens. No Ardens GUI or
Ardens LLVM loader is used. Build the game with `-g -gdwarf-4`; the debugger
ABI and the three-byte DWARF address representation are specified in
[debugger_abi.md](debugger_abi.md).

From this checkout, build with `cmake --build build --config RelWithDebInfo
--target avm_toolchain --parallel`. To install the SDK, use `cmake --install
build --config RelWithDebInfo --component avm-sdk --prefix <directory>`.
When configuring the checkout, `AVM_WITH_ARDENS` defaults to ON if the
`deps/Ardens` submodule is present and OFF otherwise. Use
`cmake -S . -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
-DAVM_WITH_ARDENS=OFF` to build the AVM LLVM, Clang, and LLD toolchain
without Ardens. This configuration omits LLDB, `avm-lldb`, emulator tests,
and benchmarks. Set `AVM_WITH_ARDENS=ON` and initialize `deps/Ardens` to
build the debugger; Ardens's own LLVM integration stays disabled.
An independent `llvm-project` build can enable LLDB, but it omits the AVM
process plugin unless the parent build supplies `avm_debug_emulator`.
The installed `bin/avm-lldb`, `bin/avm-image`, `bin/avm/interp.hex`, and
`bin/avm/interp-boundary.json` must remain together. `AVM_LLDB_IMAGE_TOOL`,
`AVM_LLDB_INTERP`, and `AVM_LLDB_BOUNDARY` may override the discovered paths
for development; the firmware hash must match its boundary metadata.

Start an interactive session with `avm-lldb game.elf`, or use LLDB's batch
mode, for example:

```text
avm-lldb --batch -o "breakpoint set --name main" -o run \
  -o "thread backtrace" -o "frame variable" game.elf
```

Normal LLDB commands provide AVM source, function, and address breakpoints,
disassembly, `continue`, `thread step-inst`, `step`, `next`, `finish`,
`register read`, `register write`, `frame variable`, `target variable`,
`memory read`, `memory write`, and interpreted `expr`. For example,
`expr argument + 2`, `expr program_pointer[0]`, and `expr pair.left` inspect
stopped-state values; `expr debug_counter = 7` writes an existing guest RAM
object. Ordinary conditional breakpoints such as
`breakpoint set --name debug_leaf --condition 'argument == 10'` use this
interpreter. Expression temporaries and its stack live only in LLDB's host
memory; no AVM RAM is reserved or guest code injected. The guest has one LLDB
thread. Data memory
load addresses are `0x01000000 + guest_address`; program load addresses are
the raw 24-bit guest addresses. For example, `memory read 0x01000100` reads
AVM RAM byte `0x100`. Program memory is read-only. When the game was built at
another source path, use LLDB's `settings set target.source-map <old> <new>`.
For an explicit untyped program-memory read, use `0x02000000 + program
address`; `memory read --size 1 --count 2 0x02011000` reads program bytes at
`0x011000`. Typed 24-bit program pointers dereference through this mapping
automatically, while 16-bit data pointers dereference RAM. The displayed
pointer values remain raw guest addresses.

These are separate widths: DWARF address fields and AS1 program pointers
are 3 bytes, AS0 data pointers are 2 bytes, and LLDB's ELF32 process-address
interface uses 4-byte tagged handles. Expression IR reads and writes pointers
using their AS0/AS1 widths. Its host-only temporary addresses fit in a
16-bit virtual range above guest RAM; that range is not backed by the emulator.

The `avm` commands return one JSON object per result:
Command errors emit `{"ok":false,"error":"..."}` and fail the LLDB
command; LLDB also prints its usual human-readable `error:` line.

| Command | Result |
| --- | --- |
| `avm time` | Exact `cycles`, seconds since AVR reset, cycles and seconds since AVM entry, and current AVM PC. The clock is 16 MHz. |
| `avm stop` | Last stop reason, next AVM PC, cycle, pending replay events, and watch access details when applicable. |
| `avm run-for 120cycles`, `5ms`, or `3s` | Run by an integer emulated duration. Return requested and actual stop cycle. The stop occurs at the next coherent AVM instruction boundary, so it may pass the deadline. |
| `avm realtime on`, `off`, `status` | Enable or disable wall-clock pacing without changing emulated deadlines. |
| `avm button press`, `release`, `set`, `status` | Control any combination of `UP RIGHT LEFT DOWN A B`; `set` with no names releases all. |
| `avm watch read`, `write`, or `readwrite` `<address> [size]` | Create an LLDB software watchpoint using a raw guest data address such as `0x500`. `avm watch delete <id>` removes it. LLDB `watchpoint set variable` also works for DWARF variables. |
| `avm replay load`, `run`, `resume`, `pause`, `status`, `abort`, `export` | Schedule and record timed button changes; exports include launch identity. |
| `avm display save` or `capture` `<path.pgm> --mode visible\|logical\|controller` | Save 128×64 gray8 PGM pixels and return mode, size, exact cycle, SHA-256 of pixel bytes, and absolute path. Existing files are rejected. |

The `visible` image uses Ardens's rendered, filtered display pixels.
`controller` expands the OLED controller RAM to pixels. `logical` expands the
game's framebuffer at AVM data `0x500`–`0x8ff`. The three can differ while
SPI transfer or display filtering is in progress. Capture only while stopped;
it does not advance emulated time.

For timed input, create a UTF-8 JSON replay file:

```json
{
  "version": 1,
  "events": [
    {"cycle": 0, "pressed": ["DOWN", "A"]},
    {"cycle": 48000000, "pressed": []}
  ]
}
```

The `cycle` values are nondecreasing offsets from the emulated cycle when
`avm replay load <file>` runs. Each event replaces the entire pressed-button
set; events at the same cycle are applied in file order. `avm replay run`
runs to the last event, `avm replay status` reports pending events, and
`avm replay resume` continues after a breakpoint or watchpoint. `avm replay
pause` marks a stopped replay as paused; `resume` clears that state. Ctrl-C
interrupts a running replay. `avm replay abort` clears pending events.
Loading another replay replaces the old schedule. Relaunching the process
resets scheduled input.

Issue `avm` commands while the process is stopped. A running process rejects
debugger-side reads and mutations; use Ctrl-C or `process interrupt` to reach a
coherent AVM boundary first.

`avm replay export <file.json>` writes button changes actually applied since
launch, with cycles relative to the first recorded change. The exported file
contains SHA-256 identities for the ELF, packaged image, interpreter,
initial EEPROM, and FX save, plus the initial ADC seed/mode and USB bus state.
`avm replay load` verifies these fields when present. To reproduce the timing,
load the export at the same guest stop that preceded its first button change.
The export rejects an existing path and an empty history.

`avm stop` reports `entry`, `breakpoint`, `watchpoint`, `step`, `deadline`,
`debug_break`, `fault`, or `interrupt`. A watchpoint's `access` object includes the watched
byte address, read/write kind, value, access cycle, and the AVM PC of the
instruction that performed it; the stop PC is the following instruction.
The adapter uses Ardens's per-instruction SRAM access records and breakpoint
bitsets to observe guest data accesses, including service writes, without
editing Ardens. It checks at every native instruction when watches are active.
For a native interpreter fault, `pc` and `cycles` describe the last coherent
AVM boundary; `fault_cycle` identifies the later AVR cycle of the fault.

## Current limits

- `expr` interprets expressions that LLDB can lower to its supported IR
  opcodes. Arithmetic, local/global variables, C++ reference fields,
  16-bit data and 24-bit program pointer dereferences, and assignments to
  mapped guest RAM are supported. Guest function calls and target-side code
  execution are unsupported and fail without running code in the guest.
  `avm run-for` rejects conditional breakpoints because that synchronous
  command cannot apply LLDB's condition evaluator; use `run` or `continue`.
  The host interpreter uses a 16 KiB virtual stack and fails an expression
  that exhausts its 16-bit virtual scratch range; it never borrows guest RAM.
  LLDB breakpoint ignore counts and hit counts work.
- Reverse execution and snapshot restore are not exposed through LLDB.
- Replay files record button changes and launch identity. They do not restore
  guest RAM, peripheral state, EEPROM, or FX save; start from the same launch
  and stop point before loading an export. Capture commands are separate from
  the replay file.
- Watchpoints cover mapped AVM SRAM `0x100`–`0x9ff`. The stop is reported at
  the next guest boundary. For overlapping ranges LLDB reports the first
  matching watchpoint for an access. Debugger memory reads do not count as
  guest accesses.
- A timed event is applied on the first native instruction boundary at or
  after its requested cycle. A timed run stops at the next guest instruction
  boundary; inspect the returned actual cycle to measure any overshoot.
- CFI is emitted for compiler-generated AVM functions. Handwritten assembly
  without CFI can only use LLDB's conservative function-entry fallback.
- Unwinding works at a raw function-entry or prologue address, but parameters
  already assigned a stack DWARF location can display stale values before the
  prologue stores them. A source or function breakpoint after the prologue
  provides reliable parameter values.
- Optimized builds may have variables with no valid DWARF location; LLDB
  reports them unavailable or optimized out.
- The installed SDK and integration gates have been exercised on Windows with
  the configured MSVC toolchain. Unix SDK installation and host-specific LLDB
  behavior have not been verified in this checkout.
- The display tests distinguish logical, controller, and visible pixels and
  verify capture hashes. Separate display-off, inversion, remap, and temporal
  filter cases have not been covered by automated tests yet.

Build-tree verification targets are `avm_debug_verify`,
`avm_debug_image_equivalence`, `avm_debug_cpp_verify`,
`avm_boundary_probe_run`, `avm_lldb_integration_run`, and
`avm_lldb_long_replay_run`. The last repeats a three-second DOWN replay
through a breakpoint and compares its stop trace and visible capture hash.
All are run with
`RelWithDebInfo` in this repository.
