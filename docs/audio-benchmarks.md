# Runtime pulse, triangle, and sawtooth audio measurements

Measured 2026-10-21 with the repository's Ardens AVR instruction emulator,
unmerged instructions, 16 MHz CPU, RelWithDebInfo. The baseline is the existing
pulse/triangle implementation, assembled and run before modification.
Machine-readable results, baseline measurements, legacy asset digests, and
package identities are in [audio-validation.json](audio-validation.json).

## Resources and worst-case timing

| Resource / timing | Before (pulse/triangle) | After (pulse/triangle/saw) |
| --- | ---: | ---: |
| Ordinary synthesis ISR, including entry/vector | 183..193 cycles | 183..196 cycles |
| All-pulse ordinary ISR | 186..193 cycles | 186..193 cycles |
| All-triangle ordinary ISR | 183..190 cycles | 189..196 cycles |
| All-saw ordinary ISR | — | 183..190 cycles |
| PWM store, excluding interrupt acceptance delay | 21 cycles | 21 cycles |
| Pending-control copy overhead | 76 cycles | 76 cycles |
| Worst pending copy ISR | 269 cycles | 272 cycles |
| Worst pending noise-reseed ISR | 270 cycles | 273 cycles |
| Worst ordinary CPU use at 7812.5 Hz | 9.4238% | 9.5703% |
| Worst ordinary CPU use at 15625 Hz | 18.8477% | 19.1406% |
| Firmware .text (FX and FX-C) | 29300 bytes | 29328 bytes |
| Headroom below 29696-byte bootloader ceiling | 396 bytes | 368 bytes |
| Inline synthesis ISR machine code | 356 bytes | 380 bytes |
| Fixed control copier helper | 154 bytes | 154 bytes |
| Foreground audio_commit_prepare machine code | 154 bytes | 158 bytes |
| Persistent audio SRAM | 89 bytes | 89 bytes |
| Live latch / complete pending packet | 16 / 17 bytes | 16 / 17 bytes |
| Native stack space above formatter/text scratch | 74 bytes | 74 bytes |
| ISR native stack, including interrupt PC | 9 bytes | 9 bytes |
| Pending ISR native stack, including copier return PC | 11 bytes | 11 bytes |
| Observed demo / libm+formatter native high-water | 39 / 39 bytes | 39 / 39 bytes |

Each macro grows from 72 to 80 bytes: exactly four additional one-word
instructions (SBRC, RJMP, SUBI, RJMP), eight bytes per channel, 24 total.
Foreground packing adds BST/BLD (four bytes of code, six executed cycles over
three channels). Control validation adds two code bytes. Two bytes of final
.text alignment padding disappear, so total flash grows by **28 bytes**.
The original phase update, pulse dispatch and generation, triangle calculation,
shared FMULSU/mixer, register saves, Timer1 schedule, and held PWM output remain.
No waveform state byte or sample lookup table is added.

## Assembled per-channel paths

The native tests execute the compiled instructions from audio_wave_beginN to
audio_wave_endN, on all three channels and all 256 phase bytes. They also check
the signed 16-bit accumulator before saturation at amplitudes 0, 1, 31, 247,
and 255, including saw sample -128. avr-objdump shows the requested sequence;
LSL is displayed as its equivalent ADD register,register. All new jumps are
one-word RJMPs; there is no assembler expansion or revised cycle accounting.

| Per-channel component | Pulse | Triangle | Saw |
| --- | ---: | ---: | ---: |
| Phase load, advance, store | 14 | 14 | 14 |
| Prepared amplitude load | 2 | 2 | 2 |
| Waveform byte load | 2 | 2 | 2 |
| Existing pulse/non-pulse dispatch | 3 | 2 | 2 |
| New saw dispatch (inside non-pulse only) | 0 | 2 | 3 |
| Waveform calculation | 6 | 4 | 1 |
| Jump to shared mixer | 0 | 2 | 2 |
| Multiplication and accumulation | 6 | 6 | 6 |
| Total | **33** | **34** | **32** |

SBRS takes one cycle plus the two-cycle RJMP for pulse, or two cycles skipping
that one-word jump for non-pulse. Saw's SBRC/RJMP costs three cycles when taken,
two when skipped. Triangle's SBRC/COM pair always costs two. FMULSU costs two;
the four following accumulation instructions cost one each.

| Three tonal voices | Cycles (excluding shared ISR/noise) |
| --- | ---: |
| Pulse + pulse + pulse | 99 |
| Pulse + pulse + triangle | 100 |
| Pulse + triangle + saw | 99 |
| Pulse + saw + saw | 97 |
| Triangle + triangle + triangle | 102 |
| Saw + saw + saw | 96 |

## Complete ISR and CPU cost

The path probe covers all 27 waveform combinations, all oscillator sign
combinations, full-byte amplitudes, both noise seed parities, noise overflow
paths, clipping, and pending descriptors. The measured worst paths decompose
as follows, including the hardware interrupt entry and vector JMP:

| Component | Ordinary | Pending copy | Pending reseed |
| --- | ---: | ---: | ---: |
| Interrupt entry + vector | 7 | 7 | 7 |
| Prologue through PWM endpoint write | 14 | 14 | 14 |
| Remaining register saves | 8 | 8 | 8 |
| Update check, call and helper | 4 | 80 | 86 |
| Clear signed accumulator | 2 | 2 | 2 |
| Three triangles (worst tonal selection) | 102 | 102 | 102 |
| Noise phase, LFSR, amplitude and accumulation | 31 | 31 | 26 |
| Bias, worst saturation and held-sample store | 9 | 9 | 9 |
| Register/flags restoration + RETI | 19 | 19 | 19 |
| Total | **196** | **272** | **273** |

Reseeding resets noise phase, preventing overflow on that sample; it adds six
copy-helper cycles but saves five noise cycles versus the worst copy path.
Before this change the same shared overhead plus three 33-cycle pulses gave
193/269/270 cycles. The new global maxima each rise by three cycles. The
273-cycle pending maximum leaves 751 cycles before the 1024-cycle deadline at
15625 Hz. PWM stores still occur at cycle 21 at both rates; Timer0/Timer1
startup and rate-switch tests retain 64..120 cycles of separation modulo 128.

| Worst ISR CPU utilization | Before at 7812.5 Hz | After | Before at 15625 Hz | After |
| --- | ---: | ---: | ---: | ---: |
| Ordinary | 9.4238% | 9.5703% | 18.8477% | 19.1406% |
| Pending copy, if every sample accepted a packet | 13.1348% | 13.2813% | 26.2695% | 26.5625% |
| Pending reseed, if every sample accepted a packet | 13.1836% | 13.3301% | 26.3672% | 26.6602% |

CPU utilization is cycles * sample_rate / 16000000. Each global maximum
increases by 0.1465 percentage points at 7812.5 Hz or 0.2930 at 15625 Hz.
All-pulse use is unchanged. For the same all-triangle workload, six additional
cycles cost 0.2930/0.5859 percentage points; each individual triangle adds two.
Pending-row utilization describes an upper bound, not ordinary packet frequency.

## Foreground measurements

Stopped-timer 7812.5 Hz preparation, including decoding, preparation and direct
application (not wall-clock waiting for ISR acknowledgment):

| Operation | Before cycles | After cycles |
| --- | ---: | ---: |
| One voice pitch + control | 1015 | 1021 |
| Four voices pitch + control | 1243 | 1247 |
| Four controls | 1135 | 1139 |
| Pitch off | 984 | 990 |
| Continue / sparse countdown | 579 / 100 | 579 / 100 |
| Maximum music / SFX event | 1266 / 1065 | 1270 / 1069 |
| Raw 18-byte event read | 416 | 416 |

Foreground packs bits 5 and 6 from the current owner; only volume bits 0..4
enter amplitude preparation. Tonal saw controls are 0x60 plus volume and optional
0x80 duty flag. The existing single-byte publication copies all 16 controls.
Read-ahead remains 18/10 bytes for music/SFX; desired voices remain four bytes.

## Validation and reproduction

- All 471 interpreter tests, 54 native audio cases, 116 Python audio tests
  (including NumPy/SciPy), and 565 additional audio-tool tests pass. FX, FX-C,
  Mini and the custom button presets assemble within the flash/SRAM limits.
- Native tests cover 387072 pulse samples, 43008 triangle samples and 43008 saw
  samples; all 27 concurrent waveform combinations with noise/clipping; nine
  ordered transitions on every tonal channel at both rates; every control
  encoding; SFX ownership/restoration across hidden music changes and loops;
  interrupted staging, pending publication, retained duty and phase.
- The desktop renderer matches the actual AVR sequencer/preparation/synthesis
  exactly over 34 fixture/rate combinations, 408000 samples, including saw
  extremes, mixed oscillators, duty edits, waveform changes and loops.
- Fifteen existing demo/example AVMS assets (58765 compiled bytes) compare
  byte-for-byte with the pre-change compiler. Frozen pulse and triangle binary
  regression tests also cover rests, subsequent notes, extensions and loops.
- The three-waveform example compiles to 39 bytes. The full interpreter,
  audio demo, Mini, FX-C, timer, stack, formatter and large C/C++ asset checks
  use the existing build targets. See the JSON for final test counts.

```sh
python -m unittest discover -s tests/audio -v
python -m pytest tools/tests -q
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_interpreter_fxc avm_audio_demo
python tests/audio/validate_stage2_renderer.py --output build/saw-renderer
python tools/avm_music.py examples/tonal_waveforms.avms build/tonal_waveforms.bin --stats
```

On this Windows installation the native build uses the existing `_CL_=/Z7`
workaround for MSVC's PDB manager mismatch; tests use a workspace-local TEMP.
The explicit Python run includes NumPy/SciPy; the CMake-selected Python omits
those optional dependencies. Historical RPG timing in the JSON is retained
as historical evidence; RPG assets were not modified for saw support.

The refreshed [audio demo package](../projects/audio_demo/audio_demo.arduboy)
contains the final firmware and unchanged guest image. The new concurrent
example is [tonal_waveforms.avms](../examples/tonal_waveforms.avms).
This is simulator verification; no physical hardware or oscilloscope validation
was performed. Unbandlimited harmonics alias at both sample rates, and loud
mixed voices can clip; see [audio.md](audio.md) for format and playback details.

## Files changed

- `interp/interp.asm` and regenerated `interp/build/interp.hex`, `.lst`, `.map`:
  waveform generation, packing and stream validation.
- `tools/avm_music.py`, `tools/avm_audio_render.py`: source encoding, validation
  and exact offline saw rendering.
- `tests/interp/audio.cpp`, `tests/audio/test_score.py`,
  `tests/audio/test_stage2.py`, `tests/audio/validate_stage2_renderer.py`:
  extend the existing native/compiler/renderer tests and cycle probes.
- `docs/audio.md`, this report, `docs/audio-validation.json`,
  `docs/midi_to_avms_stage2.md`: format, performance and validation evidence.
- `examples/tonal_waveforms.avms` and refreshed
  `projects/audio_demo/audio_demo.arduboy`: concurrent waveform example and
  current firmware package. Existing scores and generated music headers retain
  their original compiled bytes.
