# Validation, measured costs and hardware outcome

## Outcome that determined the rollback

On 2026-10-20 the user reported that this implementation sounded great in the
emulator and sounded “pretty terrible” on the hardware's piezo speaker. The
user requested full preservation and reversion, so the implementation was
withdrawn. Emulator quality did not transfer to the intended listening device.

The available report does not identify a root cause, hardware revision,
measurement setup, precise artifact, or which processing stage dominates it.
No hardware defect, clipping diagnosis, specific filter requirement, or codec
quality explanation has been established. Numerical decoding correctness and
subjective device suitability are separate acceptance criteria.

## What was measured before withdrawal

All native timings below use Ardens with unmerged AVR instructions, a 16 MHz
CPU and RelWithDebInfo host builds. They are emulated instruction-cycle
measurements, not oscilloscope or analog speaker measurements.

| Measurement | Result |
|---|---:|
| Timer1 output period | 1,024 cycles / 15,625 Hz |
| Tested ISR including entry/vector | 81–237 cycles |
| Maximum tested ISR fraction of period | 23.15% |
| Fixed PWM write latency, body / ideal compare | 14 / 21 cycles |
| Ordinary FX, TownTheme mean ISR body | 202.24192 cycles |
| Same mean including entry/vector | 209.24192 cycles / 20.43% of period |
| FX / FX-C / Mini firmware text | 28,784 bytes |
| Firmware limit / headroom | 29,696 / 912 bytes |
| SH1106 firmware text | 28,808 bytes |
| Persistent audio / ring / PCM scratch | 99 / 64 / 0 bytes |
| Canonical firmware scales | 16 bytes |
| Temporary foreground header | 12 aliased workspace bytes |
| Lowest observed native SP, demo / formatter | 0xAD5 / 0xAD1 |
| Workspace end, exclusive | 0xAC0 |
| RPG guest static / complete guest stack bound | 267 / 171 bytes |
| RPG guest text / rodata | 11,094 / 618,754 bytes |
| Packaged padded guest image | 630,784 bytes |

The ISR range combines normal, hold, frame-boundary, loop, pause, corruption
and underrun paths exercised by tests. It is an observed bound, not an exhaustive
proof for every possible corrupted state or future track count. The mean is a
specific two-second TownTheme window, not an all-track or all-content average.

The calibrated observer saw 31,250 Timer1 interrupts in each two-second FX and
FX-C window, entry lateness 0–5 cycles above the seven-cycle entry baseline,
and no missed deadlines. `evidence/timing/summary.json` contains package,
firmware, guest-image and source-asset hashes plus distributions. CSVs retain
the underlying interval and blackout histograms. Calibration used known NOP
and CLI workloads. These short windows do not cover every game action or
both complete recordings in live gameplay.

At archival time the project packages had been rebuilt after those timing
windows. Their firmware hashes still match the timing evidence, but the guest
image and package hashes differ. The two complete codec payloads remain present
and are verified byte-for-byte. [package-identities.json](evidence/package-identities.json)
records both identities without changing the original timing report. Therefore
the short-window timing distributions describe the earlier recorded guest
build, not proof of an identical run of the final archived package. The cause
of the guest binary difference was not investigated during this rollback.

## Automated checks and their scope

- **40 native codec cases:** compare actual AVR reconstruction for all widths,
  predictors and canonical scales, extrema, saturation, partial final frames,
  ring/head wrap, 24-bit address wrap, exact one-shot termination, looping,
  signed gain, pause/resume, ignored removed commands, malformed headers and
  truncated streams. Borrowed r2 and interrupted-register preservation are tested.
- **Both complete recordings twice:** 6,420,438 output samples compared exactly
  against an independent scalar PCM8 reference. These are isolated native sample
  calls with foreground refill, distinct from real-time whole-track game runs.
- **Animated demo:** actual guest playback at 15,625 Hz, restart and two button
  pause/resume transitions while rendering. The test's initial failure was an
  uninitialized button-input fixture that paused playback; explicit released
  inputs fixed the fixture. No decoder change was needed for that failure.
- **Libm/formatter workload:** sample interrupts while native math borrows the
  zero register and formatting uses aliased foreground workspace; stack clearance
  and zero underruns verified.
- **C and C++ large assets:** all 33,000 hold headers cross the 64 KiB compressed
  boundary and loop. This fixture skips redundant repeated hold samples; the
  complete-recording tests do not skip samples.
- **1,277 Python tests:** retained harness/legacy compiler cases plus 689 native
  packer cases, cross-checking independently decoded formats, partial frames,
  invalid input and large generated C layout. The existing harness's one-byte
  incremental and simulated wrapping-ring tests remain included.
- **471 AVM guest cases:** complete interpreter regression across the existing
  C/C++ optimization configurations; stack-bound and display preset checks also
  passed. No LLVM code-generation changes were made by this integration.
- **10 RPG CTest checks:** rules/content/assets, exact bank identity and calibrated
  short FX/FX-C audio timing.
- **Direct full-device FX and FX-C QA:** title silence, New Game/Continue, audible
  PWM, both tracks, dialogue, menu pause/resume, save/restart, scrolling and
  collision, with no observed compressed-ring underruns. Observed gameplay
  remained approximately 30.30 frames/s. Guest full LTO, a single global game,
  no game-reference helper arguments and removed map tile-position storage
  were verified by the existing resource checks.

Logs are preserved under [evidence/](evidence/), including the optional
LLDB-driven RPG integration failure: its image-packer subprocess received
permission denied opening `rpg.elf` in the environment. That runner did not
pass. The freshly packaged games were instead loaded directly into the full
Ardens device tests for both hardware presets; those direct checks passed.

## What these checks did not establish

They did not establish piezo acoustic fidelity, real pin timing, PLL/carrier
jitter, actual FX electrical behavior under interrupt load, analog filtering,
physical clipping, speaker bandwidth, supply behavior, or listening quality
at matched loudness. No physical capture or raw-PCM hardware control trial is
preserved. RMSE/SNR are measured against the resampled PCM reference, not
against sound emitted by the speaker. The hardware report overrides any
assumption that those objective metrics or emulator sound were sufficient.

If this line of work is revisited, useful **new experiments** would include
matching decoded PCM and PWM pin captures, logging real underruns, comparing
uncompressed PCM with the same output path, and listening on the actual piezo
at controlled gain. These are suggestions for distinguishing stages, not
diagnoses or claims that any particular change would fix the sound. The
requested action here is preservation and rollback, not another tuning attempt.
