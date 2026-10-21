# Runtime pulse/triangle audio measurements

Measured 2026-10-21 with the repository's Ardens AVR instruction emulator,
unmerged instructions, 16 MHz CPU, RelWithDebInfo. The A5 pulse column is
the recorded 2026-10-20 baseline. Machine-readable
results and package identities are in [audio-validation.json](audio-validation.json).

| Resource / timing | Previous A5 pulse | A5 pulse/triangle |
| --- | ---: | ---: |
| Ordinary synthesis ISR, including entry/vector | 171..178 cycles | 183..193 cycles |
| PWM store, excluding interrupt acceptance delay | 21 cycles | 21 cycles |
| Pending-control copy overhead | 72 cycles | 76 cycles |
| Measured four-voice pending handoff | 243 cycles | 260 cycles (two triangles) |
| Worst pending packet ISR in the exhaustive path probe | 250 cycles | 269 cycles |
| Worst packet with noise reseed in the path probe | 251 cycles | 270 cycles |
| Additional reseed work versus equivalent copy path | — | 6 cycles |
| Worst ordinary CPU use at 7812.5 Hz | 8.6914% | 9.4238% |
| Worst ordinary CPU use at 15625 Hz | 17.3828% | 18.8477% |
| Firmware .text | 29208 bytes | 29300 bytes |
| Headroom below 29696-byte bootloader ceiling | 488 bytes | 396 bytes |
| Persistent audio SRAM | 87 bytes | 89 bytes |
| Live latch / complete pending packet | 15 / 16 bytes | 16 / 17 bytes |
| Stack space above formatter/text scratch | 76 bytes | 74 bytes |
| ISR native stack, including interrupt PC | 9 bytes | 9 bytes |
| ISR native stack with pending copier return PC | 11 bytes | 11 bytes |

Every tonal path was timed directly between labels around the real assembled
macro, across all 256 phase bytes and all three channels:

| Per-channel component | Pulse | Triangle |
| --- | ---: | ---: |
| Phase update | 14 | 14 |
| Prepared amplitude load | 2 | 2 |
| Selection, including triangle's jump to mixing | 5 | 6 |
| Waveform generation | 6 | 4 |
| Multiply and accumulate | 6 | 6 |
| Total | **33** | **32** |

All-pulse ordinary paths take 186..193 cycles; three triangles take 183..190.
Each triangle saves one cycle. Within a selection the cost is independent of
phase, duty, and amplitude. Noise-overflow and final-clipping branches account
for the remaining seven-cycle range. The fixed-address copier never uses Z.
Seed packets reset noise phase, so their worst observed path differs from the
ordinary overflow case. The path probe covers all eight waveform combinations,
both seed parities, all oscillator
sign combinations, representative full-byte amplitudes, overflow paths, clipping,
and native-stack depth. The 270-cycle worst packet leaves 754 cycles before
the 1024-cycle 16 kHz deadline. Foreground stages one extra byte and publishes
it with the existing descriptor; no phase reset, lookup table, SPI, floating
point, additional multiply, or foreground sample processing was introduced.

The removed 256-byte waveform page remains padding before fixed primary
dispatch, so table removal does not reclaim 256 bytes from .text. The increase
over the pulse baseline is 92 bytes for selection and control preparation.
There is no new per-sample musical modulation engine. Both FX and FX-C firmware are 29300 bytes;
Mini and the custom button presets also assemble within the limit.

## Foreground service and FX costs

These are stopped-timer, 8 kHz preparation measurements. The one/four-channel
fixtures include tonal duty extensions; the maximum-event fixtures also include
noise reseeding. They include bounded decoding/preparation/direct application,
not wall-clock waiting for a live ISR acknowledgement.

| Operation | Recorded A5 pulse | A5 pulse/triangle cycles |
| --- | ---: | ---: |
| One voice pitch + control | 980 | 1015 |
| Four voices pitch + control | 1195 | 1243 |
| Four controls | 1087 | 1135 |
| Pitch off | 953 | 984 |
| Continue | 579 | 579 |
| Sparse countdown | 100 | 100 |
| Maximum-size music event | 1218 | 1266 |
| Maximum-size two-slot SFX event | 1025 | 1065 |
| Raw music event burst | 416 (18 bytes) | 416 (18 bytes) |

The seek hook remains four cycles when no tick is pending. Inactive pending-tick
seek overhead is 29 cycles; active countdown seek overhead is 111. Existing
SPI transaction checks pass with sample interrupts active. Maximum read-ahead
is 18/10 bytes for music/SFX, including the next delta, and cursor advancement
uses only consumed bytes. Fast offline modulation increases service work and
asset size; the live synthesis cost stays fixed.
These foreground paths run with sample interrupts enabled; their total work
does not constitute an ISR blackout.

## Validation

- 113 Python audio tests pass with NumPy/SciPy installed, asserting emitted values/timing for every effect,
  simultaneous effects, cuts, releases/ties/rests, phase modes, budgets, binary
  encoding, deduplication and large assets.
- 50 native audio cases pass. The pulse reference checks 387072 samples across
  all three voices, nine thresholds, every phase high byte, varied increments/
  amplitudes, wraparound and both rates. Independent gain, signed-mix/noise,
  clipping and full-register preservation probes also pass. The triangle reference
  adds 43008 samples: all 256 phase bytes, seven amplitudes including 0/255,
  four increments including wraparound, all tonal voices, and both rates.
  All eight pulse/triangle mixtures are checked with noise and clipping.
- The Python renderer matches the actual AVR sequencer/preparation/ISR exactly
  over 30 fixture/rate combinations, 360000 samples, including waveform switches,
  duty edits during triangle, mixed oscillators, and loops. Stage 2/3 preserves
  triangle instruments and does not treat them as noise-rate fitting candidates.
  All 565 additional audio-tool tests pass.
- Native decoding covers all music masks, legal SFX flags/ownership, extended
  controls, reserved bits, obsolete versions, seed validity, exact logical
  cursors, cross-page/64 KB reads, loops/End, and fail-closed streams.
- Reseed tests verify deterministic sequences, seed-only publication, repeated
  commands, ISR application, hidden music arbitration, restoration without stale
  retriggers, tonal-only SFX ending during a music reseed, and ordinary phase
  preservation. Waveform tests include hidden music updates, SFX/direct-tone
  restoration, pause/resume, rate changes, and waveform-only updates. Staging
  is interrupted and scratch reused before acceptance; all 16 control bytes
  survive back-to-back and IRQ-disabled publication.
- All 471 interpreter tests pass, including C/C++ optimization variants. Mini,
  FX-C, Timer0/button/watchdog, stack bounds, libm and formatter checks pass.
- The animated demo renders 62 frames in each one-second run: 7811 output samples
  at 8 kHz, 10935 with rate toggles, and no lost synthesis/output samples.
  SFX, pause/resume and both rate switches pass. Conservative native high-water
  measurements are 39 bytes in the demo and during libm/formatting, within
  the 74-byte allowance. Each exported C/C++ large asset plays all 22000 attacks
  and its terminal record beyond 64 KB.
- Recorded 2026-10-20 RPG baseline: guest/device integration and all 11 RPG CTests passed. All nine songs retained
  their duration and two-loop state checks after regeneration. Its real workload
  records 430469 normal and 62500 FX-C PWM writes, extra lateness 0..7 cycles,
  zero delays of at least 10 cycles, and interval error -6..+7 cycles. Native
  startup/rate-switch coverage still passes 32000 timer phase combinations.
  RPG arrangements and assets were not modified or regenerated for this change;
  their package identities and timing in the JSON are explicitly historical.

Reproduce from a configured repository build:

```sh
python -m unittest discover -s tests/audio -v
python -m pytest tools/tests -q
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_interpreter_fxc avm_audio_demo
python tests/audio/validate_stage2_renderer.py --output build/triangle-renderer
```

The deliverable is [audio_demo.arduboy](../projects/audio_demo/audio_demo.arduboy).
Its firmware bytes were checked against the final interpreter HEX. See
[audio.md](audio.md) for complete source syntax, formats and composition rules,
and [effects.avms](../projects/audio_demo/effects.avms) for the showcase.
Sunlit Garden uses triangle bass with pulse melody/harmony;
[waveform_switch.avms](../projects/audio_demo/waveform_switch.avms) demonstrates
retained duty and waveform switching on one channel. Generated headers report
the exact encoded stream byte count, excluding word padding, for arrays and
large chunked structures.

This is simulator verification. No physical Arduboy or oscilloscope testing was
performed. Listening quality, clicks/DC from narrow pulses, carrier behavior,
speaker polarity, electrical power and physical FX-C/Mini routing still need
hardware checks. Quantization, aliasing, clipping and delayed foreground service
remain the practical limitations described in audio.md.
