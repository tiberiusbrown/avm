# AVM benchmarks

Workloads are grouped under `workloads/codegen`, `workloads/library`, and `workloads/math`, with C/C++ subdirectories. Names remain stable across directory moves. Each compiled workload places two debug breaks around the measured interval; the adjacent-break baseline removes measurement overhead. Runtime and library workloads retain volatile calls, inputs and sinks where required to avoid builtin replacement or dead-code elimination.

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_bench avm_bench_images
build/avm_bench --c-only --filter '^math_(sin|cos)' --c-output build/bench/selected-cycles.txt
cmake --build build --config RelWithDebInfo --parallel --target avm_bench_run
```

All measurements default to `build/bench/results/`, and listings to `build/bench/disassembly/`. `avm_bench_run` runs instruction timing, compiled workloads and representative instruction-mix measurement. It does not run the test suite or diagnostic compilations. `avm_bench_mir` generates diagnostic dumps separately.

The serial and parallel runners produce ordered results and reuse isolated emulator sessions. Use `--jobs N` to control concurrency and `--list` to inspect a filtered selection without building its images. The shared instruction-mix selection lives in `instruction_mix_benchmarks.txt`.

Committed reference measurements and listings live under `reference/`. Refresh them explicitly after validating a compiler or interpreter change:

```sh
cmake --build build --config RelWithDebInfo --target avm_bench_update
```

This retains per-workload disassemblies and updates the cycle and instruction-mix reports. Review these changes alongside the implementation; ordinary benchmark execution leaves references untouched. The ISA cycle baseline is [reference/cycles_instruction.txt](reference/cycles_instruction.txt).

Numerical semantics and precision policy are described in the [math runtime guide](../runtime/lib/math/README.md). Candidate-generation and research report scripts live under `tools/research/math/`; their working results belong under `build/research/`.

## Area-sampled pulses, without the tonal low-pass

(The 16-bit reciprocal figures below are superseded by the next subsection, which records the 8-bit reciprocal that is current.)

A pulse sample is the high fraction of its sample interval instead of a point
sample, so edges fall between samples, and the tonal low-pass is removed. Before
and after, measured on the same builds of the Ardens harness (`avm_audio_tests`),
with the real sequencer and ISR playing four shipped songs, and the 15 to 120 Hz
beating metric of `tools/avm_note_tuning.py` on the emulated output for all 144
combinations of the notes C4..B6 and pulse duties 12.5%, 25%, 37.5% and 50%:

| Measurement | Before | After |
| --- | ---: | ---: |
| FX/FX-C/Mini interpreter flash | 29,064 bytes | 29,464 bytes (+400) |
| Space below 29,696-byte limit | 632 bytes | 232 bytes |
| Persistent audio SRAM | 98 bytes | 107 bytes |
| Native stack space after formatter/text scratch | 65 bytes | 56 bytes |
| Timer1 stack, ordinary / pending packet | 8 / 10 bytes | 8 / 10 bytes (9 / 11 on a pulse edge) |
| Exhaustive ISR range, entry to return | 79..283 cycles | 74..399 cycles |
| All-stopped ISR / with a pending packet | 79 / 159 cycles | 74 / 178 cycles |
| All-active ISR at gain 128, ordinary / pending maxima | 199 / 279 cycles | 246 / 350 cycles |
| All-active ISR, every gain, ordinary / pending maxima | 227 / 307 cycles | 262 / 366 cycles |
| Pulse voice, wholly high / wholly low | 33 / 33 cycles | 35 / 40 cycles |
| Pulse voice, rising edge / falling edge | 33 / 33 cycles | 71 / 87 cycles |
| Foreground: four-voice note service | 1,239 cycles | 2,103 cycles |
| Foreground: volume-only service | 1,131 cycles | 1,344 cycles |

Per synthesis interrupt over a whole song at 15625 Hz (min / average / max, cycles):

| Song | Before | After |
| --- | ---: | ---: |
| Call of Venlor | 79 / 168.30 / 195 | 74 / 175.60 / 298 |
| Morning in the Meadow | 79 / 173.99 / 176 | 74 / 183.38 / 279 |
| Steel at Dawn | 79 / 171.96 / 195 | 74 / 179.83 / 298 |
| Where the Light Ends | 79 / 161.87 / 195 | 74 / 166.30 / 298 |

Beating roughness of the emulated output at voice volume 24 (percent amplitude modulation, min / mean / max):

| Pulse duty | Before | After |
| --- | ---: | ---: |
| 12.5% | 0.41 / 3.21 / 13.58 | 0.06 / 0.23 / 0.63 |
| 25% | 0.00 / 1.22 / 5.36 | 0.02 / 0.09 / 0.30 |
| 37.5% | 0.00 / 0.44 / 2.33 | 0.01 / 0.05 / 0.17 |
| 50% | 0.00 / 0.02 / 0.12 | 0.00 / 0.02 / 0.16 |
| All 144 | 0.00 / 1.22 / 13.58 | 0.00 / 0.10 / 0.63 |

The extra sample cost is the 16-bit compares on every pulse sample plus the edge paths; the
removed low-pass check saves five cycles on every sample. The saw and triangle are unchanged
apart from that: the saw measures at most 0.67% above C3 on the same metric, so only the
pulse is area-sampled.

### 8-bit reciprocal and per-note tuning for area-sampled pulses

The reciprocal is `floor(65536/increment)` in one byte instead of `floor(2^24/increment)` in
two, the foreground keeps the staged byte whenever it is still the floor for the new
increment, and the note tuning is re-derived on the area-sampled output (it now includes
the rounding of each sample to the voice's amplitude, which the earlier model left out).
The universal -5 cent shift stays: re-deriving the table at every shift from -30 to +30
cents on this model again puts -5 lowest. Before is the table above's "After" build; the
songs are recompiled with each tuning.

| Measurement | Before | After |
| --- | ---: | ---: |
| FX/FX-C/Mini interpreter flash | 29,464 bytes | 29,332 bytes (-132) |
| Space below 29,696-byte limit | 232 bytes | 364 bytes |
| Persistent audio SRAM | 107 bytes | 101 bytes |
| Native stack space after formatter/text scratch | 56 bytes | 62 bytes |
| Timer1 stack, ordinary / pending packet | 8 / 10 bytes (9 / 11 on a pulse edge) | 8 / 10 bytes |
| Exhaustive ISR range, entry to return | 74..399 cycles | 74..339 cycles |
| All-stopped ISR / with a pending packet | 74 / 178 cycles | 74 / 166 cycles |
| No voice stopped, ordinary range / pending maximum | 174..238 / 342 cycles | 174..238 / 330 cycles |
| Pulse voice, rising edge / falling edge | 71 / 87 cycles | 55 / 71 cycles |
| Foreground: four-voice note service | 2,103 cycles | 1,689 cycles |
| Foreground: volume-only service | 1,344 cycles | 1,272 cycles |
| Foreground: commit with one tonal voice, pitch unchanged / vibrato-sized step | 548 / 771 cycles | 446 / 446 cycles |
| Foreground: commit with one tonal voice, new pitch / silence | 771 / 529 cycles | 552 / 417 cycles |

Per synthesis interrupt over a whole song at 15625 Hz (min / average / max, cycles):

| Song | Before | After |
| --- | ---: | ---: |
| Call of Venlor | 74 / 175.60 / 298 | 74 / 173.71 / 266 |
| Morning in the Meadow | 74 / 183.38 / 279 | 74 / 181.95 / 247 |
| Steel at Dawn | 74 / 179.83 / 298 | 74 / 177.83 / 266 |
| Where the Light Ends | 74 / 166.30 / 298 | 74 / 165.03 / 266 |
| All four (3.7 M interrupts) | 74 / 174.95 / 298 | 74 / 173.43 / 266 |

Beating roughness of the emulated output for all 144 combinations of the notes C4..B6 and
duties of 12.5%, 25%, 37.5% and 50% (percent amplitude modulation, min / mean / max), at
three voice volumes, because the rounding of each sample to whole output steps dominates
at low volume:

| Voice volume | Before | After |
| --- | ---: | ---: |
| 8 | 0.00 / 0.20 / 1.65 | 0.00 / 0.18 / 0.85 |
| 15 | 0.00 / 0.16 / 2.13 | 0.00 / 0.15 / 0.71 |
| 24 | 0.00 / 0.10 / 0.63 | 0.00 / 0.11 / 0.70 |

The 8-bit reciprocal costs accuracy in the top octave only: the worst note is now G6 at 25%
to 50% duty (0.7%, where the reciprocal is 10; it was 0.1% to 0.2% at volume 24 with 16
bits), and the mean is up 0.01 at volume 24. Everything else is at or below the old figures.
Removing the -5 cent shift, which was tried and reverted, raised the modelled mean roughness
over all amplitudes by about a fifth.

The edge paths need no saved register any more, which removes the extra stack byte and takes
16 cycles off every edge sample; the flash saving (132 bytes) also includes the shorter
staging. An edge sample occurs 0.075 to 0.126 times per interrupt in the shipped songs (0.094
over all four). A single edge routine shared by the three voices (hand-counted: an `RCALL`/
`RET` pair, one pushed register for the two products, and the per-voice loads that cannot be
shared) would save about 18 flash bytes and cost 12 more cycles per edge, which is about 1.1
cycles per interrupt on average (0.90 to 1.51 by song). It was not adopted.

## Noise synthesis resources and timing

The Ardens audio harness profiles the assembled firmware through
`audio_noise_begin`/`audio_noise_end` and complete Timer1 ISR execution,
including interrupt entry/vector cost. Channel 3 now stores a 16-bit LFSR at
`0A2E..0A2F`; `0A30` is reserved and all subsequent addresses stay fixed.
The stopped gate freezes state; active volume zero advances once per sample.
Pitch magnitude does not affect noise timing or output polarity.

These measurements were taken when channel 3 was reimplemented. The tonal low-pass in
their filter rows has since been removed (see above), so the "Current" column is that
change's result, not today's figures.

| Measurement | Before | Current |
| --- | ---: | ---: |
| FX/FX-C/Mini interpreter flash | 29,044 bytes | 29,032 bytes (-12) |
| Space below 29,696-byte limit | 652 bytes | 664 bytes |
| Persistent audio SRAM | 98 bytes | 98 bytes |
| Native stack space after formatter/text scratch | 65 bytes | 65 bytes |
| Timer1 stack, ordinary / pending packet | 8 / 10 bytes | 8 / 10 bytes |
| Active noise block | 25 / 29 / 30 cycles | 24 cycles |
| Stopped noise block | 5 cycles | 5 cycles |
| All-stopped ISR, filter bypass | 79 cycles | 79 cycles |
| All-stopped pending ISR, filter bypass | 161 cycles | 159 cycles |
| All-active ordinary ISR, default gain, filter bypass | 205 cycles max | 199 cycles max |
| All-active pending ISR, default gain, filter bypass | 282 cycles max | 279 cycles max |
| All-active ordinary ISR, default gain, named filters | 219 cycles max | 213 cycles max |
| All-active pending ISR, default gain, named filters | 296 cycles max | 293 cycles max |
| All-active ordinary ISR, extreme gains and named filters | 233 cycles max | 227 cycles max |
| All-active pending ISR, extreme gains and named filters | 310 cycles max | 307 cycles max |
| Early PWM write, including entry/vector | 21 cycles | 21 cycles |

The active block checks the stopped sentinel first, shifts the two-byte state,
XORs feedback from shifted high-byte bits 7 and 6, reloads amplitude and adds
its signed contribution. Each `SBRC` plus optional one-word instruction takes
two cycles, so state and sign cannot change its 24-cycle cost. Applying an
explicit seed uses `STS/SWAP/STS` and takes two fewer cycles than the previous
seed application. The 16-byte packet and one-byte descriptor are unchanged.

The complete-ISR matrix covers both synthesis rates, all 27 tonal waveform
combinations, signs, tonal phase boundaries, ordinary and
copy/retrigger packets, and gains 0/1/32/128/255. Every profiled ISR stays
below the shortest 1,024-cycle interval.

Reproduce the measurements after building the RelWithDebInfo audio target:

```sh
cmake --build build --config RelWithDebInfo --target avm_audio_tests_run --parallel
build/tests/avm_audio_tests --mixer-check build/interp/interp.hex build/interp/interp.lst build/tests/interp/audio.bin
build/tests/avm_audio_tests --stopped-profile build/interp/interp.hex build/interp/interp.lst build/tests/interp/audio.bin
build/python/bin/python tests/audio/validate_stage2_renderer.py --exe build/tests/avm_audio_tests
```

The renderer oracle compares real AVR samples at both rates, including pulse edges
at every duty, retriggers, pitch changes, stopped and muted noise, and loops. Compiler/ISA benchmark disassemblies remain under
`build/bench/disassembly/`; this synthesis change does not change generated
AVM guest instructions or the committed benchmark disassemblies.
