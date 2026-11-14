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

## Noise synthesis resources and timing

The Ardens audio harness profiles the assembled firmware through
`audio_noise_begin`/`audio_noise_end` and complete Timer1 ISR execution,
including interrupt entry/vector cost. Channel 3 now stores a 16-bit LFSR at
`0A2E..0A2F`; `0A30` is reserved and all subsequent addresses stay fixed.
The stopped gate freezes state; active volume zero advances once per sample.
Pitch magnitude does not affect noise timing or output polarity.

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
combinations, signs, tonal phase boundaries, filter histories, ordinary and
copy/retrigger packets, and gains 0/1/32/128/255. Every profiled ISR stays
below the shortest 1,024-cycle interval. With filtering enabled, stopped
voices can still leave a decaying tonal filter history: the observed stopped
ordinary/pending maxima are 113/193 cycles; once settled, ordinary is 84.
These are distinct from the 79-cycle filter-bypass stopped path.

Reproduce the measurements after building the RelWithDebInfo audio target:

```sh
cmake --build build --config RelWithDebInfo --target avm_audio_tests_run --parallel
build/tests/avm_audio_tests --mixer-check build/interp/interp.hex build/interp/interp.lst build/tests/interp/audio.bin
build/tests/avm_audio_tests --stopped-profile build/interp/interp.hex build/interp/interp.lst build/tests/interp/audio.bin
build/python/bin/python tests/audio/validate_stage2_renderer.py --exe build/tests/avm_audio_tests
```

The renderer oracle compares real AVR samples at both rates and low-pass
settings 0/128/64/32, including retriggers, pitch changes, stopped and muted
noise, and loops. Compiler/ISA benchmark disassemblies remain under
`build/bench/disassembly/`; this synthesis change does not change generated
AVM guest instructions or the committed benchmark disassemblies.
