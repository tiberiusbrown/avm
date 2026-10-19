# Ardens SPI status flags: follow-up to spi_cadence_fix

Prepared 2026-10-18. Fix and validate these status-flag semantics in the main
Ardens repository before further AVM interpreter diagnosis. The cycle-17 repair
is working; this is a separate emulator discrepancy exposed by the next
physical FX-C diagnostic result.

Resolved and revalidated: the submodule now uses `spi_cadence_fix` at
`e1f12b07c26f56eeae2b16763851c07805a9a47c`. The repair includes physical
FX-C status and receive measurements, independent flag acknowledgment, and
read-only SPSR bits. RX is available at cycle 16; a dummy OUT at 17 starts a
transfer and sets WCOL; fresh SPIF appears at 18. Ardens' SPI/full suites and
the AVM suites pass. AVM's acknowledgments now read status at 18 or later.
No SPI model adapter is installed; a host observer rejects ignored writes and
nonzero boundary writes while preserving the expected dummy-write WCOL.
The user confirmed the rebuilt ordinary FX-C package works on physical hardware
on 2026-10-18. The original handoff follows, with corrected phase examples.

## Inspected revision

Branch `spi_cadence_fix`, commit
`c5285f36bc383e263b24af798a4ea2deb16f9b6e` in
[tiberiusbrown/Ardens](https://github.com/tiberiusbrown/Ardens).
At the original handoff, the AVM checkout used this commit in `deps/Ardens`,
with no local Ardens source modifications. Its then-existing SPI regression and
full integration suites passed.

Relevant code is in
[src/absim_spi.hpp](https://github.com/tiberiusbrown/Ardens/blob/c5285f36bc383e263b24af798a4ea2deb16f9b6e/src/absim_spi.hpp).
Use `src/absim_atmega32u4.hpp` for queued completion ordering and
`tests/spi_tests.cpp` for the current upstream timing tests.

## Hardware contract and source discrepancies

The [ATmega16U4/32U4 datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf),
section 17.2.2, printed page 186, specifies status/data acknowledgment:

- A completed transfer sets `SPIF`.
- Software acknowledges `SPIF` by reading `SPSR` with `SPIF` set and then
  accessing `SPDR`. The SPI interrupt vector is another clearing mechanism.
- Reading `SPSR` with `WCOL` set, followed by an `SPDR` access, clears `WCOL`
  and `SPIF`.
- These status bits are read-only. Writing `SPSR` controls `SPI2X`, rather than
  replacing the completion/collision flags.

Self-timed SPI reads can access `SPDR` directly. An unacknowledged completion
flag can therefore remain set during a later transfer. Polling that old flag
does not establish that the current transfer is complete.

The current model diverges in these places:

1. `spi_handle_st_spdr()` unconditionally executes
   `spsr &= ~(SPIF | WCOL)` for an accepted write. It clears old flags even
   without a preceding status read, and it does not implement acknowledgment
   on an `SPDR` write as a distinct operation.
2. `spi_handle_ld_spsr()` only arms acknowledgment when `!cpu.spi_busy` and
   `SPIF` is set. A status read with an old `SPIF` set while the next transfer
   is busy still belongs to the hardware acknowledgment sequence. A status
   read with only `WCOL` set also needs correct handling.
3. `spi_handle_st_spcr_or_spsr()` assigns `cpu.data[ptr] = x`, letting an
   `SPSR` write replace the read-only flags.

Also review `update_spi()` resetting `spsr_read_after_transmit` on completion.
Test a status read, intervening completion, and subsequent data access rather
than assuming a pending acknowledgment can be discarded. Establish precise
flag priority for such races from hardware before choosing an implementation.

## Small independent regression cases

Use a fresh initialized device for each case. Enable master mode 0 at
`F_CPU/2` (`SPCR=0x50`, `SPSR.SPI2X=1`), with SPI interrupts disabled. The
times below use the same write-handler cycle convention as `tests/spi_tests.cpp`.

### Old SPIF survives a new transfer

```text
T=100: write SPDR=0x5A.
Provide received byte 0x3C at T=116; fresh SPIF appears at T=118.
Do not read SPSR or acknowledge the completed transfer.
T=119: write SPDR=0x96.
Expect: new transfer busy, receive buffer still 0x3C, SPIF still 1.
Current Ardens: SPIF becomes 0 on the second write.
```

### Status read while busy acknowledges the old flag

```text
Continue the preceding case with the old SPIF still 1.
T=120: read SPSR: must return SPIF=1 although the next transfer is busy.
T=121: read SPDR: returns old RX=0x3C and clears the acknowledged flag.
Expect: the second transfer remains active and its eventual RX is unaffected.
At its completion, SPIF becomes 1 again for that transfer.
```

Exercise `SPDR` writes as the second access as well as reads. Cover accepted
writes and a write attempted while busy, preserving normal collision behavior.

### WCOL-only acknowledgment

```text
T=100: start a transfer.
T=106: write SPDR again while busy: WCOL=1, SPIF=0.
T=107: read SPSR with WCOL set.
T=108: access SPDR.
Expect: acknowledged collision clears; active transfer is not corrupted.
```

### SPSR read-only bits

Set completion/collision flags through real transfers/collisions, then write
different `SPI2X` values to `SPSR`. Verify flags are preserved and cannot be set
or cleared by software writes to their bit positions. Verify reserved bits
remain zero.

Run these through register handlers and real instructions, with queue-first
and handler-first completion, both execution modes, and snapshot/reset replay.
Retain all cycle-17/18 transmit and receive-buffer guarantees from the existing
branch. In particular, dummy `OUT` at 17 / old-byte `IN` at 18 remains valid.
Add a polling-after-streaming fixture with a legal stale completion flag.

## Hardware result that exposed the problem

The AVM RPG diagnostic compared a polled read against the normal timed seek at
the guest entry point. The user reported a blue LED and this OLED line:

```text
06 00 03 00 B3 FF 00 00 50 81
```

The fields are:

```text
code PC-high PC-middle PC-low timed-byte polled-byte UDIEN UDINT SPCR SPSR
```

Thus the timed read returned `B3` at guest PC `000300`, while the polled path
returned `FF`. `B3` matches the package's first guest opcode. This observation
does not support treating the timed byte as the bad one.

AVM's framebuffer transfer acknowledged its final byte too early: for
SSD1306/SSD1309, `SPSR` was read at cycle 15 and `SPDR` at cycle 16, before
completion at 17. A new `SPIF` could appear just afterward and remain set.
The diagnostic's next polled transfer then mistook an old flag for its own
completion, returned old receive data, and attempted the address byte too
early. Ardens' unconditional clearing on each new write concealed this case.

An isolated experimental status-flag adapter reproduced the diagnostic
mismatch and an address-high write collision. Its OLED report was:

```text
06 00 03 00 B3 00 00 00 50 81
```

The stale byte was `00` rather than hardware's `FF`. Ardens returns zero for
SPI input with FX deselected and for command/address phases; this experiment
did not change that bus model. Do not claim all ten hardware bytes were
reproduced exactly. The shared result is the correct timed opcode versus an
incorrect polled byte, with a prematurely accepted completion flag.

## Interpreter corrections and current evidence

AVM now waits two extra cycles before its final OLED status/data acknowledgment
(including SH1106, whose old status read was also early). The SYS display
wrapper also uses a fixed completion boundary for the speculative FX byte
instead of trusting an old `SPIF`. Byte-stream handoff timing is unchanged.

Focused display tests in `tests/interp/display_system.cpp` now inject a legal
stale `SPIF` at SYS display entry and assert both acknowledgment reads occur
after transfer completion. The new final-byte assertion failed on the old
firmware, and all three controller variants pass with the correction.

All 471 AVM cases, audio/stack checks, full FX/FX-C RPG integration, and nine
native/content suites pass. All six fatal diagnostic reports were checked by
decoding actual emulated OLED pixels. Both corrected packages also pass the
isolated stricter status-flag probe without write collisions. Physical hardware
has not yet validated the latest corrections, and the original black-screen
failure must still be treated as unresolved.

Local artifacts in the AVM checkout, mostly ignored build files:

- `build/fxc-investigation/rpg.before-spif-fix.diagnostic.fxc.arduboy`:
  original package that produced the user's report; SHA-256
  `b4d61dcc6b1647b6c624ed5664fbb6c43c5c40e7e208173de226fbd0d3b25df4`.
- `build/fxc-investigation/strict_spi_flags.hpp` and
  `strict-flags/device_tests.cpp`: exploratory adapter/probe, not upstream code.
  The probe's copy was adjusted to continue after WCOL so it could show the
  same error path as hardware; collision warnings are logged separately.
- `build/fxc-investigation/strict-diagnostic-before.log` and
  `strict-diagnostic-before.report.txt`: failing strict-model result.
- `build/fxc-investigation/strict-current-after.log` and
  `strict-diagnostic-after.log`: corrected package passes, no collisions.
- `build/fxc-investigation/display-ack-before.log` and
  `display-stale-before.log`: focused pre-fix regression failures.
- `build/fxc-investigation/interpreter-spif-fix-tests.log`: root suite.
- `projects/avm_rpg/build/verification-hyjf42ky/`: RPG device/SDK checks.

The exploratory adapter is not a complete upstream fix. Implement and validate
the real register semantics in Ardens, then rerun these scenarios with all
adapters removed. That work is now complete at the revision noted above.
