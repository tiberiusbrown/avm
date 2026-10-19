# Ardens SPI cycle-17 regression: repair and validation handoff

Prepared 2026-10-18 during the AVM RPG / Arduboy FX-C investigation.

Update: the AVM submodule now uses `spi_cadence_fix` at
`c5285f36bc383e263b24af798a4ea2deb16f9b6e`. Ardens was rebuilt and its SPI and
full integration suites passed. All 471 AVM cases, audio/display/stack checks,
and full FX/FX-C RPG integration passed against the upstream model. The old ROM
fails with a blank display and the corrected ROM passes with the temporary
QA adapter removed. Investigation has resumed; the original handoff follows.

A subsequent hardware result exposed separate SPI status-flag discrepancies.
Those are documented in [the status-flag follow-up](ardens-spi-status-flags-handoff.md).
That work is now validated at `e1f12b07c26f56eeae2b16763851c07805a9a47c`.
Physical measurements establish RX at cycle 16, an accepted dummy OUT plus
WCOL at 17, and fresh SPIF at 18. The phase contract and proposed tests below
have been updated; the source-history discussion describes the original bug.
The user confirmed the rebuilt FX-C package works on hardware on 2026-10-18.

## Task for the Ardens agent

Fix the ATmega32U4 SPI timing regression in the main
[Ardens repository](https://github.com/tiberiusbrown/Ardens), and add regression
coverage for both transmitted bytes and received bytes. Validate the fix before
using Ardens results to guide further AVM interpreter changes. AVM has many
cycle-scheduled SPI reads, including intentional 17-cycle handoffs, so accurate
receive timing is part of this task.

Ardens already contains code intended to transmit zero when a new `SPDR` write
lands at the cycle-17 boundary. A later change clears the boundary timestamp
before that code can recognize it. Consequently, firmware with incorrect SPI
command/address timing can appear to work in the emulator.

This document records the original handoff, rather than implementing the
upstream fix. See the status update above for the subsequent repair validation.

## Revisions and primary sources

The inspected dependency is `deps/Ardens` in the AVM checkout, with upstream
`https://github.com/tiberiusbrown/Ardens.git` and HEAD:

```text
6126ebecf7c2602b0144526b2456780d360ed730
Fixes related to instruction merging (#158)
```

Relevant history, checked using local Git objects:

- [4fe89479b4bdde56c93fecbc58c8c3d1e1cf4dfc](https://github.com/tiberiusbrown/Ardens/commit/4fe89479b4bdde56c93fecbc58c8c3d1e1cf4dfc),
  2024-04-25: original transmit-zero modeling, PR #63.
- [e343be0937e7387ebd8846b68178741abbc40da7](https://github.com/tiberiusbrown/Ardens/commit/e343be0937e7387ebd8846b68178741abbc40da7),
  2025-05-31: SPI cycle timing changes, PR #134. Its diff introduces the
  timestamp-clearing conflict described below. This attribution is based on
  source history; a historical executable bisect has not been run.
- [fd994138b76742a2c725a0e30c809aa91e4506bb](https://github.com/tiberiusbrown/Ardens/commit/fd994138b76742a2c725a0e30c809aa91e4506bb):
  later emulator architecture refactor, PR #150. This is the last commit
  touching `src/absim_spi.hpp` at the inspected HEAD. That file is unchanged
  between this revision and `6126ebe`.

Useful files at the inspected revision:

- [src/absim_spi.hpp](https://github.com/tiberiusbrown/Ardens/blob/6126ebecf7c2602b0144526b2456780d360ed730/src/absim_spi.hpp):
  register handlers and SPI completion.
- [src/absim_atmega32u4.hpp](https://github.com/tiberiusbrown/Ardens/blob/6126ebecf7c2602b0144526b2456780d360ed730/src/absim_atmega32u4.hpp):
  `advance_cycle()` processes `PQ_SPI` before executing the next instruction.
- [src/absim_arduboy.cpp](https://github.com/tiberiusbrown/Ardens/blob/6126ebecf7c2602b0144526b2456780d360ed730/src/absim_arduboy.cpp):
  `arduboy_t::cycle()` delivers the transmitted byte to the OLED/flash and
  supplies `spi_datain_byte` when `spi_done_cycle` is reached.
- `src/absim_execute.cpp`: `instr_out()` / `instr_in()` and merged variants.
- `src/absim_reset.cpp`: resets `spi_transmit_zero_cycle` to `UINT64_MAX`.
- `src/absim_snapshot.cpp`: serializes `spi_transmit_zero_cycle`.
- `tests/integration_tests.cpp`: existing integration test target; includes
  SPI state comparisons and an I2C peer-pump SPI test, but the inspected test
  sources contain no explicit 16/17/18-cycle transmit-boundary test.

For documented SPI register and buffering behavior, use the
[ATmega16U4/32U4 datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf),
section 17. The exact transmit-zero quirk is evidenced here by Ardens' original
implementation/history, not a quoted datasheet guarantee. A hardware trace or
the original PR's hardware observations would strengthen its timing oracle.

## Timing contract to recover

The failing AVM paths use master SPI mode 0, a 16 MHz CPU, `SPCR=0x50`
(`SPE|MSTR`), and `SPSR=0x01` (`SPI2X`): an 8 MHz SPI clock, with
`spi_clock_cycles == 2` in Ardens.

Define `T` as `cpu.cycle_count` when the first `SPDR` write handler runs.
Intervals below are write-to-write CPU-cycle differences, not a count of NOPs.

| Second write | Expected behavior from the intended model |
|---|---|
| `T+16` | Transfer still busy; write collision (`WCOL`), rather than a valid next byte. |
| `T+17` | New transfer starts with outgoing `0x00`, and WCOL is set. A dummy zero write still advances the stream. |
| `T+18` or later | New transfer sends the requested byte. |

At the fast SPI setting, the received byte is available at `T+16`, while fresh
SPIF appears at `T+18`. AVM deliberately uses this sequence:

```text
T+17: OUT SPDR, zero_register   ; launch a dummy transmit for the next flash read
T+18: IN  destination, SPDR    ; collect the previous received byte
```

The transmit-zero behavior is harmless for a dummy zero byte. It is harmful
for a nonzero command, address, or payload. Preserve this intentional streaming
pattern and the separation between the transmit shift register and receive
buffer. A new `SPDR` write must not overwrite the previous received byte.

## Why the existing check does not work

In `spi_handle_st_spdr()` the order is effectively:

```cpp
cpu.update_spi();
// ... validate SPE/MSTR and handle a busy-transfer collision ...
if (cpu.spi_transmit_zero_cycle == cpu.cycle_count)
    cpu.spi_data_byte = 0;
else
    cpu.spi_data_byte = /* requested value, with DORD handling */;
```

A transfer starts with:

```cpp
cpu.spi_done_cycle = cpu.cycle_count + cpu.spi_clock_cycles * 8 + 1;
cpu.spi_transmit_zero_cycle = cpu.spi_done_cycle;
cpu.spi_busy = true;
cpu.peripheral_queue.schedule(cpu.spi_transmit_zero_cycle, PQ_SPI);
```

At `T+17`, `update_spi()` completes it and executes:

```cpp
data[reg::addr::SPDR] = spi_datain_byte;
spi_busy = false;
spsr_read_after_transmit = false;
spi_transmit_zero_cycle = UINT64_MAX;
spsr |= SPIF;
```

The comparison in the write handler then sees `UINT64_MAX`, not `T+17`.
The nonzero byte is transmitted unchanged. `AB_SPI_WCOL` does not catch this:
the transfer is no longer busy, so this is an accepted write with the wrong
transmit value.

There are two relevant orderings:

1. The register handler itself completes the previous transfer via
   `update_spi()` before checking the timestamp.
2. The peripheral queue has already processed `PQ_SPI` at the same CPU cycle,
   clearing the timestamp before the register handler even starts.

Saving the timestamp only at write-handler entry would address the first
ordering while still missing the second. Preserve enough completion-boundary
state across peripheral processing to recognize a subsequent same-cycle write.

The PR #134 diff changed completion from `T+16` with a following latch phase to
`T+17`, made `spi_transmit_zero_cycle` equal `spi_done_cycle`, and added the
clearing assignment above. Inspect all three changes together. Simply moving
completion earlier risks changing when received data and `SPIF` become visible.

## Minimal upstream regression tests

Add small tests independent of AVM ROMs, bootloaders, and FX-C pin selection.
The following is a proposed unit-test skeleton, not a test already added to
Ardens. It illustrates the completion-before-write ordering:

```cpp
auto device = std::make_unique<absim::arduboy_t>();
device->reset();
auto& cpu = device->core_state.cpu;
using namespace absim::reg;

cpu.cycle_count = 100;
cpu.st(addr::SPCR, 0x50);  // SPE | MSTR
cpu.st(addr::SPSR, 0x01);  // SPI2X
cpu.st(addr::SPDR, 0x03);
auto const boundary = cpu.spi_transmit_zero_cycle; // 117

cpu.spi_datain_byte = 0x3c;
cpu.cycle_count = boundary;
cpu.update_spi();         // explicitly complete before entering the write handler
cpu.st(addr::SPDR, 0xa5);

// Expected: outgoing byte is zero, previous receive byte remains 0x3c,
// and a new transfer is busy with WCOL. The original broken source sent 0xa5.
bool pass = cpu.spi_data_byte == 0x00 &&
            cpu.data[addr::SPDR] == 0x3c && cpu.spi_busy &&
            (cpu.data[addr::SPSR] & bit::SPSR::WCOL);
```

Also test direct handler completion without the explicit `update_spi()`.
Use fresh devices for each boundary case so a previous transfer or flag cannot
contaminate the result. Adapt these assertions to the repository's test style;
ensure they remain active in RelWithDebInfo builds.

Then exercise actual instruction execution and board-level peripheral delivery.
For example, this AVR instruction sequence has a 17-cycle write interval:

```asm
; Set master SPI mode 0 at F_CPU/2 and disable interrupts first.
ldi r16, 0x03
ldi r17, 0xa5
out 0x2e, r16       ; SPDR's I/O address on ATmega32U4
; exactly sixteen single-cycle NOPs here
out 0x2e, r17
```

Use fifteen NOPs for a 16-cycle interval and seventeen for an 18-cycle interval.
Observe the byte delivered to the flash/OLED model, not just an internal field.
Check the following:

- Nonzero writes at 16, 17, 18, and later cycles; dummy zero writes at 17.
- Reads at 15/16/17/18 cycles: previous receive-buffer contents before 16,
  the new byte at 16, its stability afterward, and fresh SPIF at 18.
- The reverse `OUT` at 17 / `IN` at 18 streaming sequence above, with distinct
  consecutive received bytes so a stale or overwritten byte fails visibly.
- Repeated back-to-back transfers, verifying byte order and both directions.
- `SPIF` and `WCOL` visibility and clearing through the documented
  `SPSR`-then-`SPDR` access sequence.
- Queue-first and handler-first completion, including an intervening `SPSR`
  or `SPDR` read at the boundary.
- Both ordinary and merged instruction execution (`no_merged` true/false),
  debugger stepping, and normal continuous execution.
- Reset and snapshot/restore near a pending/completed boundary. The existing
  timestamp is serialized; retain deterministic replay if state changes.

Keep slower SPI clock settings and other modes covered by control tests.
Establish their exact boundary behavior from hardware/history before extending
the fast-mode quirk to a new timing rule. The AVM QA workaround below only
models the fast setting.

## AVM evidence already collected

During the initial investigation, AVM's RPG host QA temporarily restored the
missing behavior without editing Ardens. The now-removed `SpiBoundary`,
`spi_write_boundary()`, and `Device::hardware_spi_boundary()` definitions in
`projects/avm_rpg/tests/device_tests.cpp` kept a separate per-CPU timestamp,
independent of Ardens clearing its field:

```text
Before calling Ardens' SPDR handler:
    if spi_clock_cycles == 2 and cycle_count == saved_boundary:
        replace the outgoing value with zero
Call the original Ardens SPDR handler.
If a transfer is busy, save its spi_transmit_zero_cycle for the next write.
```

This adapter was installed after reset/load, including save/restart, and the
device tests use `no_merged=true`. SPI write-collision autobreaks are also
enabled. This is a targeted transmit workaround, not validation of all Ardens
SPI receive timing or execution modes. It was removed before validating the
upstream repair so it could not mask a remaining emulator defect.

With that adapter, the pre-fix diagnostic RPG package fails immediately:

```text
cycle-17 SPI transmit-zero: avr_pc=13518 value=255
display on=1 pump=1 filter=0 row=45 clock=1754386 cycles=3200000 avr_pc=4594 UDIEN=0 UDINT=0 PORTB=113 DDRB=231 SPCR=80 SPSR=129 PLLCSR=19 ram_nonzero=0
FAIL blank visible display
```

The logged PCs are AVR **byte addresses** (`cpu.pc * 2`), not word addresses or
guest PCs. The first warning is at byte PC `0x34CE`, with a requested outgoing
`0xFF` becoming zero. This occurs while sending the flash address-high byte in
`fx_seek_to_pc`. A nonzero high byte is required for the package's placement
near the top of the 16 MiB flash. Zero addresses the wrong region, preventing
the first guest instructions from being fetched correctly. `PORTB=113` matches
the green startup marker and the OLED RAM remains blank.

After correcting that first interval, further QA exposed two more meaningful
bytes at the same boundary:

```text
cycle-17 SPI transmit-zero: avr_pc=19166 value=152
cycle-17 SPI transmit-zero: avr_pc=19166 value=162
cycle-17 SPI transmit-zero: avr_pc=23920 value=251
FAIL frame timeout
```

Those byte PCs are `0x4ADE` and `0x5D70` in that intermediate firmware build.
They identify the generic sprite address-low transfer and text return's
address-middle transfer. PCs vary with firmware builds; use the named paths
and matching listing rather than treating these addresses as permanent.

The three AVM corrections were:

1. `fx_seek_to_pc`: change the first delay call from `fx_seek_delay_10` to
   `fx_seek_delay_11`, making command-to-address-high spacing 18 cycles.
2. Generic sprite setup: add one NOP before the address-low `OUT`.
3. `text_finish`: add one NOP after eight register pops, before address-middle
   `OUT`, making that interval 18 cycles.

With all three corrections and the targeted QA adapter active, full FX and
FX-C RPG integration passed gameplay, display, music, scrolling, menus,
save/restart, and corrupt-save checks. The direct FX-C run ended with:

```json
{"result":"PASS","scenario":"16x16 world, sign, menus, save/restart and scrolling with peaceful music"}
```

### Available evidence in the AVM checkout

These are local investigation artifacts, mostly in ignored build directories;
copy them separately if the Ardens agent needs the original binaries or logs.
The minimal upstream tests above do not require them.

| Artifact | Location |
|---|---|
| Pre-fix diagnostic ROM | `build/fxc-investigation/rpg.before-spi-fix.diagnostic.fxc.arduboy` |
| Pre-fix ordinary ROM | `build/fxc-investigation/rpg.before-spi-fix.fxc.arduboy` |
| First startup failure | `build/fxc-investigation/cycle17-before.log` |
| Later sprite/text failures | `projects/avm_rpg/build/verification-qbn4ttyc/proof.log` |
| Passing corrected FX-C run | `build/fxc-investigation/cycle17-after.log` |
| Full passing integration logs | `projects/avm_rpg/build/verification-_3a9w4re/` |
| Targeted emulator adapter | `projects/avm_rpg/tests/device_tests.cpp` |
| Interpreter changes | `interp/interp.asm` |

SHA-256 identifiers:

```text
Pre-fix diagnostic ROM:
81017908ca8f70d34574ac72f2efae2275e0f5a9168525f7122b2e17d54692bc

Pre-fix ordinary ROM:
638fe0b010dde428ce2438639891be6f04dcc4368571117d755755947e2dd88d

Corrected ordinary rpg.fxc.arduboy tested by the user:
f6b3407f69d5024568ea86f140804a50f6ffe3c13a9da21c2abd145a9fd401b4
```

## Limits of the current conclusion

The source-level timestamp conflict and the adapter-induced AVM failures are
reproduced emulator findings. The user reported a steady green LED with the
earlier diagnostic on physical FX-C hardware, which is consistent with a
failure after audio initialization and before successful guest rendering.
That observation alone does not prove which SPI transaction failed.

The user subsequently flashed the ordinary FX-C package with all three AVM
timing corrections and still reported a black screen with no LED. The ordinary
build has no diagnostic LED markers. The reported hardware failure therefore
remains unresolved. Do not describe the three corrections, or this emulator
repair, as a confirmed hardware cure. USB bootloader-state handling was another
separate finding; it is not needed for the isolated SPI regression tests.

## Completion criteria

The upstream fix should make the unmodified Ardens SPI model pass the boundary
and receive-buffer tests above, in both execution modes, and preserve existing
integration/snapshot tests. Build through the repository's CMake setup with
RelWithDebInfo; the inspected tree provides an `integration_tests` target linked
to `ardensdebuggerlib`.

If the AVM fixtures are available, verify that the pre-fix ROM now exposes the
nonzero cycle-17 transfers without the QA adapter, while the corrected ROM
passes with the adapter disabled. Record transmitted bytes, received bytes,
cycle counts, and execution mode in the regression output. Resume AVM hardware
diagnosis once this SPI model and its tests are trustworthy.
