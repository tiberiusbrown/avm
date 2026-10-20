# UP+DOWN bootloader shortcut

Timer0 COMPA preserves r24 and SREG, increments the existing 32-bit millisecond
clock, and queues a saturating audio tick whenever the clock is divisible by
four. Once every 32 ms it checks for UP+DOWN with LEFT, RIGHT, A, and B released.
The former audio-divider byte at `0x0A16` is now `data_boot_hold`; startup's
existing private-state clear initializes it. No later SRAM address moves.

The 48th consecutive matching sample enters `bootloader_reset`. This named,
nonreturning entry disables interrupts, resets the watchdog counter, writes
WDCE|WDE and then WDE to WDTCSR, and waits for system reset. The second store
completes three CPU cycles after the first, within the four-cycle window.
Cathy3K handles the reset; the interpreter writes no bootloader SRAM key.

All presets use the compact PINF mask `0xF0 == 0x60`, followed by configured
A/B bit tests. Shared-port pin overrides compile to a corresponding mask;
split-port overrides compile to six bit tests. Only the selected instructions
are emitted. The normal ISR saves two bytes (one GPR and SREG), plus the
hardware return address, as before. Timer1 code, priority and timer setup are
unchanged.

## Resources and timing

Measured with the repository's Ardens AVR emulator using unmerged AVR
instructions, 16 MHz, and a CMake RelWithDebInfo build. Baseline firmware was
assembled from the source saved before this change. Cycle counts include the
four-cycle interrupt acceptance, three-cycle vector JMP and RETI; they exclude
completion of an already running foreground instruction.

| Resource / Timer0 path | Before | After |
| --- | ---: | ---: |
| FX / Mini / FX-C flash `.text` | 29,008 B | 29,060 B (+52) |
| Total flash payload, including existing 1 B `.data` initializer | 29,009 B | 29,061 B (+52) |
| `.text` headroom below Cathy3K's 29,696 B boundary | 688 B | 636 B |
| Persistent interpreter-private SRAM, `0x0A00..0x0A65` | 102 B | 102 B |
| Timer/audio state within that region | 81 B | 81 B |
| Ordinary 1 ms interrupt, no audio tick | 35 cycles | 33 cycles |
| Ordinary 4 ms audio tick, no poll | 47 cycles | 42 cycles |
| 32 ms boundary, all buttons released, no millis carry | 47 cycles | 53 cycles |
| 32 ms boundary, matching hold, no millis carry | 47 cycles | 60 cycles |
| Worst returning path, full 32-bit carry + matching hold | 63 cycles | 76 cycles |

Persistent SRAM is manually addressed in this assembly; `avr-size` section
sizes alone do not describe it. Existing VM memory, aliased 72-byte service
workspace, and native stack allowance are unchanged. The split-port override
fixture uses 29,068 B of flash and takes 64/80 cycles on the matching/worst
poll paths. The shared-port override fixture has the standard size/timings.

The matching poll adds 18 cycles (1.125 microseconds) to the new ordinary
audio path. Compared with the previous implementation at the same boundary,
the maximum extra Timer0 occupancy is 13 cycles (0.8125 microseconds).
The worst returning ISR takes 4.75 microseconds total; 69 cycles (4.3125
microseconds) are the handler from its first instruction through RETI.
Timer1 cannot preempt this work, so a pending audio interrupt must wait for
the remaining Timer0 instructions. Reset intentionally stops normal audio.

With no buttons pressed and a nonsaturated pending counter, the 32 ms average
falls from 38 to 35.59375 cycles per millisecond before millis-carry costs.
The identical long-term carry cost is approximately 0.0235293 cycles/ms in
both versions. This saves 2,406.25 CPU cycles/second, about 0.01504 percentage
points of a 16 MHz CPU (6.33% of Timer0's previous cost). Even continuously
matching polls save 2,187.5 cycles/second until reset. Saturated audio ticks
take 44 cycles before and 41 after on an ordinary 4 ms boundary; saturation
never bypasses the bootloader poll.

## Validation

The focused `avm_timer0_tests_run` target assembles and executes FX, Mini,
FX-C, a split-port override exchanging UP/B, and a shared-port override
permuting direction bits and exchanging A/B. It covers all 128 interrupted
SREG combinations with distinct values in every GPR, all millis carry
boundaries through `0xFFFFFFFF`, all 256 pending-counter values, all 64 button
combinations, exact tick/poll phases, short holds and cancelled holds.
The actual watchdog stores are observed three cycles apart, reset-only mode
is checked, and watchdog expiry is observed at the programmed boot fuse
entry. A busy guest with no SYS calls reaches 48 polls while Timer1 continues
to execute. Direct foreground entry to `bootloader_reset` is checked too.

All five wiring runs passed. Each busy-guest run armed the watchdog after
1,534.98 ms and observed 11,991 Timer1 interrupts. Isolated watchdog expiry
reached the boot fuse entry after 255,997 additional emulated CPU cycles
(approximately 16 ms).

The complete regression checks passed:

- All 471 assembly/C/C++ interpreter tests, with C/C++ at all six optimization levels.
- All 41 native audio cases, including Timer1 arbitration, register preservation,
  live rate/phase alignment, synthesis references, delayed service, animated
  demos, and the two 22,000-attack exported assets.
- All 23 Python score-compiler tests.
- 152 PUSH16/POP16 and 1,133 stack-bound cases.
- 88 display preservation cases on each of SSD1306, SSD1309, and SH1106.
- LLDB integration, DWARF verification, runtime header checks, and the
  interpreter-boundary probe.

Commands used were `cmake --build build --config RelWithDebInfo --target
avm_tests_run avm_lldb_integration_run avm_runtime_checks avm_boundary_probe_run
--parallel 8`, plus the focused Timer0 target during development. The configured
MSVC environment was initialized. A local compiler/PDB-manager mismatch was
worked around with the per-process `_CL_=/Z7` option; the configured compiler,
generator, optimization and RelWithDebInfo configuration were preserved.
LLDB's image-packer subprocess initially encountered a sandbox filesystem
denial; integration and the remaining targets passed when rerun outside that
sandbox. No software checks remain blocked. Hardware checks were not run.

## Assumptions and practical limits

The target is an ATmega32U4 at 16 MHz with Cathy3K and the corresponding boot
fuses, active-low GPIO buttons, and the configured pull-ups enabled (or
provided externally when `AVM_INIT_BUTTONS=0`). Pin overrides use the same
low-I/O PIN-register conventions required by the existing SYS_BUTTONS code.
Guest execution must leave global interrupts and Timer0 enabled.

Arming occurs 1,504..1,536 ms after a continuous press, depending on sample
phase, followed by the shortest watchdog timeout (nominally 16 ms). Releases
or extra presses wholly between samples can be missed. Watchdog oscillator
tolerance affects the final delay. Ardens models watchdog expiry but does
not enforce WDCE's timed window; the test therefore checks executed store
values and cycle separation explicitly. Its reset model does not faithfully
represent every reset-cause flag. Physical buttons, analog timing, and the
subsequent Cathy3K menu/USB behavior still require hardware verification.

Reference: [Cathy3K source](https://github.com/MrBlinky/cathy3k/blob/main/cathy3k.asm).
