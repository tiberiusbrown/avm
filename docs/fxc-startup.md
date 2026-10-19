# FX-C startup investigation

**Resolved on hardware, 2026-10-18.** The user confirmed that the rebuilt
ordinary FX-C package shows the title and starts a game. Its SHA-256 is
`7789d35867f690a125b28f1aff909507e082f5eccfef6c07bbe15291c930b47f`.
Ardens is updated to `e1f12b07c26f56eeae2b16763851c07805a9a47c` from
`spi_cadence_fix`; its hardware-verified SPI model exposed the remaining early
status acknowledgment. Final display acknowledgment now reads SPSR at cycle 18
and SPDR at 19. Meaningful SPI command/address bytes use at least 18 cycles;
intentional zero writes at 17 remain valid and set WCOL. The final build also
includes the USB startup cleanup below. Hardware success confirms the combined
build, without isolating each fix's contribution.

After this confirmation, the optional interpreter diagnostics and their CMake
targets were removed at the user's request. The normal firmware retains the SPI
and USB fixes. The diagnostic descriptions, package hashes and probe results
below record the investigation before that cleanup; the diagnostic target and
package are no longer provided.

## Validation after removing diagnostics

Both normal interpreter HEX files and both RPG packages were rebuilt and are
byte-for-byte identical to their pre-cleanup versions, including the FX-C
package confirmed working on hardware. The interpreter still occupies 29,040
bytes. Only optional probe source and build targets were removed; the timing
differences below are relative to the previously recorded benchmark reports.

All checks passed in RelWithDebInfo:

- 471 AVM assembly/C/C++ fixtures across the supported optimization settings;
  12 music compiler tests; 27 native audio cases; 152 PUSH/POP cases; 1,133
  stack-bound cases; 88 display cases for each of three controllers; runtime
  header checks and firmware variants.
- 377 AVM-specific LLVM/Clang/assembler/linker/image/transform regressions.
  The ELF-only LLD build used an isolated test launcher allowing absent
  COFF/Mach-O/Wasm drivers, while requiring the actual ELF driver and retaining
  all 29 AVM ELF tests. No compiler or linker source or execution behavior was
  changed for this run.
- DWARF verification, debug/no-debug image equivalence, profiler and LLDB
  integration, deterministic three-second replay, boundary trace, and profiler
  throughput/behavior checks.
- Full upstream Ardens integration, full RPG FX and FX-C gameplay/audio/save
  integration, and all nine RPG CTest suites.

All 1,018 instruction/SYS, 78 C, and five C++ benchmarks completed. Refreshed
reports are in `bench/cycles_instruction.txt`, `bench/cycles_c.txt`, and
`bench/cycles_cpp.txt`; generated benchmark disassemblies are retained.
The instruction/SYS report changes only for two display cases (+3 cycles each)
and 136 sprite cases (+1 each); the other 880 cases are unchanged.

| C benchmark | Previous cycles | Current cycles | Increase |
|---|---:|---:|---:|
| `draw_text.c` | 18,717 | 18,718 | 1 |
| `draw_text_P.c` | 20,825 | 20,826 | 1 |
| `text.c` | 51,421 | 51,424 | 3 |
| `tilessprite.c` | 90,796 | 90,924 | 128 |
| `tilessprite16.c` | 37,912 | 37,944 | 32 |
| `tilessprite16_cached.c` | 34,724 | 34,756 | 32 |
| `tilessprite_cached.c` | 77,336 | 77,464 | 128 |

The remaining 71 C benchmarks and all five C++ benchmarks are unchanged. The
profiling acceptance test's exact boundary timestamps were refreshed from the
measured hardware-correct SPI model. Its three display calls now total 55,927
cycles, previously 55,918; independent interval accounting and CLI/LLDB
equivalence also pass.

Logs and before/after artifact hashes are under `build/diagnostic-removal/`.
The latest RPG evidence is `projects/avm_rpg/build/verification-7kun5bdo/`.

## Original investigation

The original reported symptom was a black screen, no audio and no input response on an
Arduboy FX-C, including after a power cycle. The same package runs in Ardens
with flash chip select configured as PE2. Uploads used ArduboyWebFlasher.

## Reproduced defect: inherited USB interrupts

AVM previously enabled global interrupts without disabling the bootloader's
USB controller or interrupt sources. Cathy3K's `StartSketch` disables global
interrupts and detaches USB, but leaves `USBCON` and `UDIEN` intact. Its USB
initialization enables end-of-reset and suspend interrupts. See the
[Cathy3K source](https://github.com/MrBlinky/cathy3k/blob/main/cathy3k.asm).

The ATmega32U4 distinguishes USB detachment from controller reset. Clearing
`USBCON.USBE` resets the controller; `UDIEN` and `USBCON.VBUSTE` enable interrupt
sources independently of the global interrupt flag. See sections 21.6, 21.13
and 22.2 of the
[Microchip datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf).

Injecting a detached, enabled USB controller with `UDIEN=0x09` and a pending
suspend (`UDINT=0x01`) before running the old FX-C firmware reproduces the
black screen. At 3,200,001 CPU cycles, the AVR is stuck at byte PC `0x00AC`,
the interpreter's infinite `default_isr` loop. The display is enabled but its
RAM is entirely zero. The guest never reaches its title or music.

Startup now masks USB device interrupts, detaches USB, disables/resets the
controller with its clock frozen, and clears USB event flags before setting
up peripherals and the shared audio PLL. The firmware grows by 24 bytes to
29,032 bytes, below the 29,696-byte application limit.

The RPG device harness applies this inherited state on initial startup and
save/restart. Both FX and FX-C pass gameplay, display, music and persistence
checks with the fix. The old-firmware failure log is in
`build/fxc-investigation/usb-handoff-before.log`; the old package is retained
beside it. Current full-device logs are located through
`projects/avm_rpg/build/latest-verification.txt`.

The user retried the rebuilt package on hardware and reported the same failure.
The USB cleanup alone therefore did not resolve the reported hardware issue. The
exact USB state and bootloader launch path have not been measured. In particular,
Cathy3K can skip USB initialization on a direct power-on launch when built
with `RUN_APP_ON_POWERON`.

## Why the default Ardens run missed the USB defect

Ardens does enable its bundled Cathy3K bootloader by default:
`arduboy_config_t::bootloader` is true and `boot_to_menu` is false. For a
standalone package, `arduboy_t::reset()` selects `ARDENS_BOOT_GAME_E2` when
using PE2. That start-game build can launch directly on power-on before USB
initialization. The current USB model also never generates `UDINT.SUSPI`;
it implements host enumeration/reset/SOF and detachment without bus-inactivity
suspend detection. Enabling a bootloader alone therefore does not reproduce
the deliberately injected pending-suspend state.

These observations concern this checkout's Ardens source, especially
`deps/Ardens/src/absim.hpp`, `absim_arduboy.cpp`, `absim_usb.hpp` and
`tests/_refs/cathy3k/cathy3k.asm`; other Ardens versions/settings may differ.

## Hardware diagnostic package (historical)

`projects/avm_rpg/rpg.diagnostic.fxc.arduboy` runs the same RPG with a separate
interpreter built using `AVM_STARTUP_DIAGNOSTICS=1`. Normal packages omit all
diagnostic code. The user tested the original diagnostic and reported steady
green, locating the failure after audio initialization. The current diagnostic
adds an independent first-opcode comparison, fatal reports, and framebuffer
inspection before each guest display call.

| Steady color | Last stage entered | Investigate next if the screen stays black |
|---|---|---|
| Red | Reset entry / GPIO ready, configuring SPI and OLED | SPI peripheral state, OLED startup |
| Yellow | OLED command sequence sent, waking flash | Flash wake transfer / SPI completion |
| Blue | Flash wake finished, locating the image | Chip select, actual flash contents, tail placement |
| Cyan | Image location selected, validating its header | Returned header bytes, version and memory bounds |
| Magenta | Header accepted, copying globals and blanking OLED | Data read / initial framebuffer transfer |
| White | Initial display finished / timers and PLL initializing; later, first timed opcode verified | PLL initialization or guest startup before its first display call |
| Green | Audio initialization returned; later, a guest display call had nonzero framebuffer pixels | Before VM entry: first opcode seek/read; after guest rendering: OLED transfer/visibility |

A guest display call with a completely blank framebuffer sets cyan. Fatal
reports also set a color and display ten hexadecimal bytes on the first OLED
page using a font in MCU program memory, without any FX asset reads:

```text
code PC-high PC-middle PC-low r24 r23 UDIEN UDINT SPCR SPSR
```

| Code | LED | Meaning |
|---|---|---|
| `01` | Red | Unexpected interrupt entered the default handler |
| `02` | Yellow | Invalid primary instruction |
| `03` | Magenta | Invalid secondary instruction |
| `04` | Blue | Invalid SYS service |
| `05` | Red | Guest stack bounds failure |
| `06` | Cyan | First timed opcode differs from the independent polled read |

For code `06`, `r24` is the timed result and `r23` is the polled expected byte.
For other reports these are the native registers at the trap. PC bytes name
the image-relative VM PC at the trap, which may already have advanced through
an instruction. The fault handler disables interrupts, drains SPI, and displays
the report before halting. A report color can overlap an earlier startup color;
the hexadecimal line identifies a fatal report unambiguously when visible.

The early reset marker turns red on before normal GPIO setup. Later markers
use three SBI/CBI instructions each, preserve every register and flag, and
never touch SPI or acknowledge completion flags. Fatal hooks run only after
execution has stopped. The first-opcode comparison runs before the opcode
pipeline starts. Framebuffer inspection runs with FX deselected and SPI idle;
it preserves the guest registers required by display. The normal timed opcode
and operand handoff macros are unchanged.

The former RPG target `rpg_fxc_diagnostic` built this package using a matching
AVM checkout configured through `AVM_SOURCE_ROOT` and `AVM_BUILD_ROOT`. That
target and the interpreter's `avm_interpreter_fxc_diagnostic` target have been
removed along with `AVM_STARTUP_DIAGNOSTICS` and all on-device probe code.

The diagnostic interpreter occupies 29,416 bytes, below the 29,696-byte limit.
Its package passed gameplay, audio, save/restart and corrupt-save checks using
the repaired upstream Ardens model. A read-only observer rejects ignored SPI
writes and nonzero writes at the cycle-17 zero-transmit boundary while allowing
intentional cycle-17 zero writes and their hardware WCOL flag. Injected faults
verified all six reports by decoding the actual OLED pixels. An earlier
diagnostic run restoring the old seek timing bug produced
`06 00 03 00 FF B3 00 00 50 81`: timed `FF`, expected `B3`, at VM PC `000300`.
The current observer rejects that bad transfer directly. Earlier marker checks still pass for bad tail,
bad header, and an audio-initialization stall. Reproducer scripts and logs are
in `build/fxc-investigation/check_diagnostic_reports.py` and
`check_diagnostic.py`.

The user tested diagnostic package
`b4d61dcc6b1647b6c624ed5664fbb6c43c5c40e7e208173de226fbd0d3b25df4`
and reported a blue LED with `06 00 03 00 B3 FF 00 00 50 81`. The timed result
`B3` matches the actual entry opcode, while the polled result is wrong. This
exposed premature SPI flag acknowledgment, described below.

After correcting those boundaries, the current diagnostic package SHA-256 is
`67452ad9b6b6b5c3ef92da8d23ec814b2acb91ebce29ea40c65e732cc1f458b9`;
the ordinary FX-C package SHA-256 is
`7789d35867f690a125b28f1aff909507e082f5eccfef6c07bbe15291c930b47f`.
The user confirmed the ordinary package works on physical FX-C hardware. The
current diagnostic has software verification only. The normal interpreter
occupies 29,040 bytes; the diagnostic occupies 29,416 bytes.

## SPI status-flag follow-up

The SSD1306/SSD1309 display loop read SPSR at cycle 15 and SPDR at 16, before
the final transfer's fresh SPIF appeared at 18. A fresh SPIF could therefore appear after
the acknowledgment and fool the next polling operation. SH1106 also read final
status early. All three controllers now read final SPSR at cycle 18 and SPDR
at 19. SYS display also drains its speculative FX byte at those boundaries,
without relying on a possibly old SPIF.

An exploratory strict-flag probe reproduced the diagnostic mismatch and an
address-high write collision. Its stale byte was `00`, rather than hardware's
`FF`, because the experiment retained Ardens' zero-valued inactive/command SPI
input. The current corrected ordinary and diagnostic packages both pass this
probe without collisions. The new root display checks inject an old completion
flag and verify both acknowledgment boundaries. They failed on the old firmware
and pass on all three controllers with the corrections.

Ardens previously cleared SPIF/WCOL on accepted SPDR writes and restricted
acknowledgment arming to idle transfers with SPIF set. Upstream commit
`e1f12b07c26f56eeae2b16763851c07805a9a47c` now includes corrected sticky flags,
status/data acknowledgment, and independently measured receive/completion phases:
RX data at 16, the zero-transmit boundary with WCOL at 17, and fresh SPIF at 18.
Its hardware probe captures are retained under
`deps/Ardens/tests/spi_status_probe/`. See
`docs/ardens-spi-status-flags-handoff.md` for the repair history and regressions.
The interpreter tests use upstream behavior without a SPI timing/flag adapter.
Their observer leaves all writes and hardware flags unchanged and rejects
ignored or corrupted writes. Saved packages with the old cadence and status
bugs both fail under the updated model; the final packages pass.

The latest root log is `build/fxc-investigation/interpreter-status-hardware-tests.log`;
all 471 cases, audio/stack checks, and the strengthened display cases pass.
Full FX/FX-C integration and all nine native/content suites pass in
`projects/avm_rpg/build/verification-hd2cwa5s/`. Ardens' SPI and full integration
suites also pass; logs are `ardens-status-fix-spi.log` and
`ardens-status-fix-integration.log` in the investigation folder. The user's
subsequent hardware test confirmed that the final ordinary FX-C package resolves
the black screen and can start a game.

## Earlier SPI cadence repair

Three meaningful SPI address bytes had 17-cycle write intervals, where the
ATmega32U4 transmit-zero quirk corrupts the outgoing value. `fx_seek_to_pc`
now uses an 18-cycle command-to-address-high interval; generic sprite setup
and `text_finish` each add a NOP to make their affected address intervals
18 cycles. Intentional dummy-zero 17-cycle bytecode handoffs remain valid.
The user retried this corrected ordinary package and still reported a black
screen; this cadence fix alone did not resolve the physical failure.

Ardens' completion update previously cleared the zero-transmit timestamp before
the write handler could use it. The first submodule update used `spi_cadence_fix`
commit `c5285f36bc383e263b24af798a4ea2deb16f9b6e`, which preserves that timestamp.
The temporary RPG harness SPI workaround has been removed. Ardens' SPI and full
integration suites pass; the old diagnostic reproduces its green/blank freeze
directly under the repaired model, while the corrected ordinary package passes.
Logs are `ardens-spi-fix-tests.log`, `ardens-spi-fix-integration.log`,
`upstream-old-rom.log`, and `upstream-current-rom.log` in the investigation folder.

All 471 AVM tests passed against the updated emulator, plus 27 audio cases,
152 PUSH/POP cases, 1,133 stack checks, and 88 display cases for each of three
controllers. Full RPG FX/FX-C integration and all nine native/content suites
also passed. Full-device logs are in
`projects/avm_rpg/build/verification-ozvkmcs9/`; the root test log is
`build/fxc-investigation/interpreter-upstream-spi-tests.log`. The original
upstream handoff and its follow-up status are in
`docs/ardens-spi-cycle17-handoff.md`.

## Other paths checked

- The FX-C firmware selects flash on PE2/HWB, and preserves the PE6 A-button
  input. The standard FX firmware selects PD1. The current official
  [FX-C board definition](https://github.com/MrBlinky/Arduboy-homemade-package/blob/main/board-package-source/boards.txt)
  agrees on PE2, a 16 MHz CPU, the Mini bootloader, and a 29,696-byte application limit.
- The [web flasher source](https://github.com/bateske/ArduboyWebFlasher/blob/main/index.html)
  pads data to 256 bytes and saves to 4 KiB, then writes the combined data to
  the end of the 16 MiB chip. This matches AVM's standalone image-tail lookup
  at `0xFFEFF8` when a save sector is present.
- AVM sends `0xAB` to release flash power-down and waits about 6 microseconds.
  The [Winbond W25Q128JV datasheet](https://manuals.plus/m/45251f882b592b5ac7292179598ac1e45969ce66fb98e9dd978be915629c0b23.pdf),
  sections 8.2.22 and 9.6, specifies a maximum 3-microsecond release time
  without the optional device-ID read.
- OLED reset is held low for about 5 milliseconds, followed by another
  5 milliseconds before initialization. SPI is mode 0 at 8 MHz. These satisfy
  the [SSD1306 timing specifications](https://cdn.sparkfun.com/assets/d/a/a/b/c/SSD1306_datasheet.pdf)
  of at least 3 microseconds reset and a 100-nanosecond serial clock period.
- An initial stricter SPI flag experiment passed ordinary gameplay/save tests.
  The later independent polled diagnostic exposed the acknowledgment failure;
  upstream hardware probes established the final completion phases. The older
  exploratory harness and logs are retained in `build/fxc-investigation`.
