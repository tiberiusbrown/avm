# Programmable pulse audio measurements

Measured 2026-10-20 with the repository's Ardens AVR instruction emulator,
unmerged instructions, 16 MHz CPU, RelWithDebInfo. The previous A4 column is
the recorded pre-change baseline, not a new physical measurement. Machine-readable
results and package identities are in [audio-validation.json](audio-validation.json).

| Resource / timing | Previous A4 | A5 pulse |
| --- | ---: | ---: |
| Ordinary synthesis ISR, including entry/vector | 186..193 cycles | 171..178 cycles |
| PWM store, excluding interrupt acceptance delay | 21 cycles | 21 cycles |
| Pending-control copy overhead | 69 cycles | 72 cycles |
| Measured four-voice pending handoff | 255 cycles | 243 cycles |
| Worst pending packet ISR in the exhaustive path probe | — | 250 cycles |
| Worst packet with noise reseed in the path probe | — | 251 cycles |
| Additional reseed work versus equivalent copy path | — | 6 cycles |
| Worst ordinary CPU use at 7812.5 Hz | 9.4238% | 8.6914% |
| Worst ordinary CPU use at 15625 Hz | 18.8477% | 17.3828% |
| Firmware .text | 29008 bytes | 29208 bytes |
| Headroom below 29696-byte bootloader ceiling | 688 bytes | 488 bytes |
| Persistent audio SRAM | 81 bytes | 87 bytes |
| Live latch / complete pending packet | 15 / 16 bytes | 15 / 16 bytes |
| Stack space above formatter/text scratch | 82 bytes | 76 bytes |
| ISR native stack, including interrupt PC | 11 bytes | 9 bytes |
| ISR native stack with pending copier return PC | 13 bytes | 11 bytes |

Removing table lookup and the normal Z save/restore saves exactly 15 cycles
on equivalent sample paths. The comparison is constant cost for every phase
and duty. The existing noise-overflow and final-clipping branches still account
for the seven-cycle normal-path range. The fixed-address copier never uses Z.
Seed packets reset noise phase, so their worst observed path differs from the
ordinary overflow case. The path probe covers both seed parities, all oscillator
sign combinations, representative full-byte amplitudes, overflow paths, clipping,
and native-stack depth. All remain below the 1024-cycle 16 kHz deadline.

The removed 256-byte waveform page remains padding before fixed primary
dispatch, so table removal does not reclaim 256 bytes from .text. The increase
comes from extended-control decoding, routing and reseeding. There is no new
per-sample musical modulation engine. Both FX and FX-C firmware are 29208 bytes;
Mini and the custom button presets also assemble within the limit.

## Foreground service and FX costs

These are stopped-timer, 8 kHz preparation measurements. The one/four-channel
fixtures include tonal duty extensions; the maximum-event fixtures also include
noise reseeding. They include bounded decoding/preparation/direct application,
not wall-clock waiting for a live ISR acknowledgement.

| Operation | Recorded A4 | A5 cycles |
| --- | ---: | ---: |
| One voice pitch + control | 885 | 980 |
| Four voices pitch + control | 1047 | 1195 |
| Four controls | 947 | 1087 |
| Pitch off | 876 | 953 |
| Continue | 508 | 579 |
| Sparse countdown | 98 | 100 |
| Maximum-size music event | — | 1218 |
| Maximum-size two-slot SFX event | — | 1025 |
| Raw music event burst | 348 (14 bytes) | 416 (18 bytes) |

The seek hook remains four cycles when no tick is pending. Inactive pending-tick
seek overhead is 29 cycles; active countdown seek overhead is 111. Existing
SPI transaction checks pass with sample interrupts active. Maximum read-ahead
is 18/10 bytes for music/SFX, including the next delta, and cursor advancement
uses only consumed bytes. Fast offline modulation increases service work and
asset size; the live synthesis cost stays fixed.

## Validation

- 51 Python compiler tests pass, asserting emitted values/timing for every effect,
  simultaneous effects, cuts, releases/ties/rests, phase modes, budgets, binary
  encoding, deduplication and large assets.
- 45 native audio cases pass. The pulse reference checks 387072 samples across
  all three voices, nine thresholds, every phase high byte, varied increments/
  amplitudes, wraparound and both rates. Independent gain, signed-mix/noise,
  clipping and full-register preservation probes also pass.
- Native decoding covers all music masks, legal SFX flags/ownership, extended
  controls, reserved bits, obsolete versions, seed validity, exact logical
  cursors, cross-page/64 KB reads, loops/End, and fail-closed streams.
- Reseed tests verify deterministic sequences, seed-only publication, repeated
  commands, ISR application, hidden music arbitration, restoration without stale
  retriggers, tonal-only SFX ending during a music reseed, and ordinary phase
  preservation. Staging is interrupted and scratch reused before acceptance.
- All 471 interpreter tests pass, including C/C++ optimization variants. Mini,
  FX-C, Timer0/button/watchdog, stack bounds, libm and formatter checks pass.
- The animated demo renders 62 frames in each one-second run: 7811 output samples
  at 8 kHz, 10934 with rate toggles, and no lost synthesis/output samples.
  SFX, pause/resume and both rate switches pass. Conservative native high-water
  measurements are 35 bytes in the demo and 39 during libm/formatting, within
  the 76-byte allowance. Each exported C/C++ large asset plays all 22000 attacks
  and its terminal record beyond 64 KB.
- RPG guest/device integration and all 11 RPG CTests pass. All nine songs retain
  their duration and two-loop state checks after regeneration. Its real workload
  records 430469 normal and 62500 FX-C PWM writes, extra lateness 0..7 cycles,
  zero delays of at least 10 cycles, and interval error -6..+7 cycles. Native
  startup/rate-switch coverage includes 32000 timer phase combinations.

Reproduce from a configured repository build:

```sh
python -m unittest discover -s tests/audio -v
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_interpreter_fxc avm_audio_demo
cmake --build projects/avm_rpg/build --config RelWithDebInfo --target all rpg_integration
ctest --test-dir projects/avm_rpg/build -C RelWithDebInfo --output-on-failure
```

The deliverable is [audio_demo.arduboy](../projects/audio_demo/audio_demo.arduboy).
Its firmware bytes were checked against the final interpreter HEX. See
[audio.md](audio.md) for complete source syntax, formats and composition rules,
and [effects.avms](../projects/audio_demo/effects.avms) for the showcase.

This is simulator verification. No physical Arduboy or oscilloscope testing was
performed. Listening quality, clicks/DC from narrow pulses, carrier behavior,
speaker polarity, electrical power and physical FX-C/Mini routing still need
hardware checks. Quantization, aliasing, clipping and delayed foreground service
remain the practical limitations described in audio.md.
