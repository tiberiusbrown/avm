# Stopped-channel amplitude sentinel measurements

The tables below preserve the stopped-channel optimization measurements.
The subsequent compiler-trusted stream update reduced firmware to 29,220 bytes.
The runtime music-loop control now brings current firmware to **29,240 bytes**,
with **456 bytes** of bootloader headroom. These changes leave the synthesis
paths and their cycle counts unchanged; see the updates at the end.

Measured 2026-10-21 with the repository's Ardens AVR instruction emulator,
unmerged instructions, 16 MHz CPU, RelWithDebInfo. Before measurements use the
saved pre-change firmware and listing; after measurements execute the final
assembled instructions. Machine-readable measurements and historical evidence
are in [audio-validation.json](audio-validation.json).

## Representation and assembly

Foreground still prepares `floor(volume * master / 32)`, with volume 0..31
and master 0..255, at most 247. Its existing inactive-owner/zero-increment path
now writes `(0, 0, 0xFF)` to the pending control triple. No stop conditions,
normal amplitude arithmetic, packed waveform bits, packet layout, API, AVMS
syntax or binary asset formats change.

| Channel condition | Prepared amplitude | ISR behavior |
| --- | ---: | --- |
| Inactive owner or zero increment | 255 | Skip oscillator and mixing |
| Nonzero increment, volume or master zero | 0 | Advance phase and noise LFSR normally |
| Nonzero increment, audible | 1..247 | Existing synthesis and signed mixing |

Tonal synthesis loads amplitude into r20 first and checks `CPI/BREQ`. The
14-cycle phase update uses r0 for phase low, r21 for phase high, and r1 for
increment loads. Waveform dispatch reuses r0; the FMULSU/rounding/accumulation
sequence is unchanged. The BREQ displacement is +38 words, within -64..63.

Noise also retains amplitude in r20 during phase advancement. Afterwards r0
holds the LFSR and r21 becomes feedback scratch/sign extension. This permits
`LDI r21, 0xB8` without a move or extra register save. LDS/STS preserve carry
from phase ADC; BRCC tests that carry before LSR. LSR supplies feedback carry;
CLC before optional NEG and SBC supplies the original signed extension,
including amplitude zero. Its sentinel BREQ displacement is +29 words.
A pending retrigger resets phase and reseeds before this check even if stopped.

The suggested `LDI r0` is not an AVR instruction: LDI requires r16..r31.
Also, moving the amplitude LDS and adding CPI/BREQ plus MOV would add three
active cycles, not one. The implemented register arrangement removes MOV and
adds exactly **two** cycles to active noise. This accounts for the measured
204/281 maxima versus the proposed 203/280 targets.

## Assembled per-channel paths

| Path | Before | Active after | Stopped after |
| --- | ---: | ---: | ---: |
| Pulse | 33 | **35** | **5** |
| Triangle | 34 | **36** | **5** |
| Sawtooth | 32 | **34** | **5** |
| Noise, no overflow | 26 | **28** | **5** |
| Noise, overflow without feedback | 30 | **32** | **5** |
| Noise, overflow with feedback | 31 | **33** | **5** |

The early `LDS/CPI/BREQ` costs 2+1+1 cycles active or 2+1+2 stopped.
The LDS replaces the original later load, so every active oscillator adds two
cycles. A stopped path executes only these three instructions.

| Active tonal component | Pulse | Triangle | Saw |
| --- | ---: | ---: | ---: |
| Amplitude load and sentinel check | 4 | 4 | 4 |
| Phase load, advance, store | 14 | 14 | 14 |
| Waveform byte load | 2 | 2 | 2 |
| Pulse/non-pulse dispatch | 3 | 2 | 2 |
| Saw dispatch | 0 | 2 | 3 |
| Waveform calculation | 6 | 4 | 1 |
| Jump to shared mixer | 0 | 2 | 2 |
| Multiplication and accumulation | 6 | 6 | 6 |
| Total | **35** | **36** | **34** |

Noise costs 4 for load/check, 14 for phase, 4/8/9 for LFSR load/branch/update,
and 6 for signed mixing: **28/32/33** cycles. Muted active paths have exactly
these costs too; only 255 takes the stopped branch.

## Complete ISR and CPU cost

| Resource / timing | Before | After |
| --- | ---: | ---: |
| All-active ordinary ISR, all 27 tonal selections | 183..196 | 191..204 cycles |
| All-pulse active ordinary ISR | 186..193 | 194..201 cycles |
| All-triangle active ordinary ISR | 189..196 | 197..204 cycles |
| All-saw active ordinary ISR | 183..190 | 191..198 cycles |
| All-stopped ordinary ISR, pulse / triangle / saw | 186 / 189 / 183 | **81 / 81 / 81 cycles** |
| PWM endpoint store, including entry/vector | 21 | **21 cycles** |
| Pending-control copy overhead | 76 | 76 cycles |
| Maximum pending copy ISR | 272 | **280 cycles** |
| Maximum pending reseed ISR | 273 | **281 cycles** |
| Firmware .text, FX / FX-C / Mini | 29332 | **29352 bytes** |
| Bootloader headroom below 29696 bytes | 364 | **344 bytes** |
| Inline synthesis ISR machine code | 380 | 396 bytes |
| Control copier helper | 154 | 154 bytes |
| Foreground audio_commit_prepare | 158 | 160 bytes |
| Persistent audio SRAM | 89 | **89 bytes** |
| Live latch / complete pending packet | 16 / 17 | 16 / 17 bytes |
| Native stack allowance above formatter/text scratch | 74 | **74 bytes** |
| Ordinary / pending ISR stack, including return PCs | 9 / 11 | **9 / 11 bytes** |
| Observed demo / libm+formatter native high-water | 39 / 39 | **39 / 39 bytes** |

The saved baseline ELF in this checkout measures 29332 bytes, four bytes more
than the historical saw report's 29328; the table uses the actual saved image.
Three macros add four bytes each, noise adds four, and foreground adds two:
18 instruction bytes plus two bytes of final alignment padding, **20 total**.
No calls, loops, tables, persistent state or register saves are added to synthesis.

| Component, including entry/vector | Ordinary maximum | Pending copy | Pending reseed | All stopped ordinary |
| --- | ---: | ---: | ---: | ---: |
| Interrupt entry + vector | 7 | 7 | 7 | 7 |
| Prologue through PWM endpoint write | 14 | 14 | 14 | 14 |
| Remaining register saves | 8 | 8 | 8 | 8 |
| Update check, call and helper | 4 | 80 | 86 | 4 |
| Clear signed accumulator | 2 | 2 | 2 | 2 |
| Three tonal voices | 108 | 108 | 108 | 15 |
| Noise | 33 | 33 | 28 | 5 |
| Bias, saturation and held-sample store | 9 | 9 | 9 | 7 |
| Restore registers/flags + RETI | 19 | 19 | 19 | 19 |
| Total | **204** | **280** | **281** | **81** |

Reseeding prevents noise overflow on that sample, saving five synthesis cycles
while adding six copier cycles. The 281-cycle maximum leaves **743 cycles**
before the 1024-cycle deadline at 15625 Hz. Timer/PWM configuration and the
endpoint store position are unchanged. Phase alignment retains 64..120 cycles
of Timer0/Timer1 separation modulo 128.

| CPU utilization at 16 MHz | Before, 7812.5 Hz | After, 7812.5 Hz | Before, 15625 Hz | After, 15625 Hz |
| --- | ---: | ---: | ---: | ---: |
| All-active worst ordinary | 9.5703% | **9.9609%** | 19.1406% | **19.9219%** |
| All-stopped, retained triangles | 9.2285% | **3.9551%** | 18.4570% | **7.9102%** |
| Worst pending copy, if every sample accepts a packet | 13.2813% | 13.6719% | 26.5625% | 27.3438% |
| Worst pending reseed, if every sample accepts a packet | 13.3301% | 13.7207% | 26.6602% | 27.4414% |

Utilization is `cycles * sample_rate / 16000000`. All-active ordinary overhead
is eight cycles; all-stopped savings are 102..108 cycles depending on retained
waveforms. Pending percentages are upper bounds, not typical publication rates.

The path probe covers every stopped mask (bit N means channel N stopped), all
27 waveform selections, representative reachable gains, all 16 sign choices,
noise overflow/feedback, clipping and copy/odd-seed/even-seed descriptors:

| Stopped mask | Ordinary cycles | Maximum pending cycles |
| --- | ---: | ---: |
| 0 | 191..204 | 281 |
| 1, 2, 4 | 162..173 | 250 |
| 3, 5, 6 | 133..142 | 219 |
| 7 | 104..111 | 188 |
| 8 | 168..176 | 258 |
| 9, 10, 12 | 139..145 | 227 |
| 11, 13, 14 | 110..114 | 196 |
| 15 | 81 | 163 |

## Validation and reproduction

- 59 native audio cases and all 471 interpreter regressions pass. The suite
  retains sequencer, loop, SFX ownership/restoration, direct-tone, pause/resume,
  disable, rate-switch, register/SREG, packet and SPI checks.
- Tonal sample references cover 331776 pulse, 36864 triangle and 36864 saw
  outputs at both rates with phase wrap, representative low bytes/increments,
  duty extremes and reachable amplitudes through 247. A separate 589824-path
  sweep covers every high phase byte and amplitude 0..254 on all three tonal
  channels/waveforms; 255 explicitly tests the five-cycle zero contribution.
- 131072 noise paths cover all LFSR bytes, all amplitudes, overflow/hold,
  feedback carry, signed accumulation and stopped-state preservation.
- New foreground tests distinguish zero volume/master from zero increment,
  freeze each stopped oscillator for repeated interrupts, reactivate sample
  exactly, and accept stopped noise retriggers. Interrupt injection checks
  both transition directions for all 16 stopped masks. The ISR timing sweep
  measures 331776 paths and asserts 9/11-byte stack high-water on every path.
- The unchanged desktop renderer matches all 408000 samples over 34 fixture/
  rate combinations, including envelopes, rests, loops and noise reseeds.
- 116 Python audio tests and 565 audio-tool tests pass. Native PUSH16 (152),
  stack bounds (1133), three display controllers (88 each), and Timer0 tests
  for FX, FX-C, Mini and split/shared button presets pass. All configurations
  assemble within existing size, SRAM-page and stack assertions.
- Animated demo, live rate toggles, five-song playlist, formatter/libm with
  interrupts, and both 22000-attack C/C++ asset tests pass. The demo package
  is refreshed with current firmware and its unchanged guest image.
- RPG FX/FX-C timing smoke tests pass (two seconds each); 9/10 RPG CTests pass.
  Existing `imported_music` fails its score-inventory assertion before running
  firmware. The broader RPG device integration fails its title-screen music
  expectation with both current and saved baseline firmware. These checkout
  issues remain; no game behavior or score assets were changed for this work.
  RPG packages were refreshed, and its clipping verifier excludes 0xFF from
  audible amplitude. Other pre-existing RPG edits are preserved.

```sh
python -m unittest discover -s tests/audio -v
python -m pytest tools/tests -q --basetemp=build/audio-sentinel/pytest-temp
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_interpreter_fxc
python tests/audio/validate_stage2_renderer.py --output build/audio-sentinel/renderer
build/tests/avm_audio_tests.exe --stopped-profile interp/build/interp.hex interp/build/interp.lst build/tests/interp/audio.bin
ctest --test-dir projects/avm_rpg/build -C RelWithDebInfo --output-on-failure
```

This Windows build uses `_CL_=/Z7` for the installed MSVC PDB-manager mismatch
and a workspace-local TEMP/TMP for Python temporary files. Current-session
logs are under `build/audio-sentinel/`; historical evidence stays in the JSON.
This is instruction-level simulation, with no physical hardware/oscilloscope
validation. Active checks add two cycles per voice; further active-path savings
would need a different instruction/register arrangement or a broader redesign.

## Compiler-trusted stream update

The production chronological sequencer now trusts compiler-generated input.
Header/version, ownership, waveform and seed validation is removed from the
AVR; the compiler retains those checks. There is no runtime phrase bytecode
in this implementation. Both stream kinds begin with one ownership byte and
use physical channel bits for events. Removing magic and SFX slot conversion
reduces interpreter flash from **29,352 to 29,220 bytes**, saving **132 bytes**
and leaving **476 bytes** below the 29,696-byte limit. Persistent audio SRAM
remained **89 bytes**, with **74 bytes** of native stack allowance at that stage.

The 396-byte synthesis ISR has identical instructions except for the relocated
`RCALL audio_apply_update` operand; the call still reaches the same unchanged
copier and takes the same cycles. Ordinary paths remain 81..204 cycles,
with the existing 281-cycle maximum pending/reseed path. No synthesis
algorithm, output timing, waveform/control encoding or memory layout changed.

Validation passed 118 Python tests, 57 native audio cases, FX/FX-C/Mini
assembly, animated demo and playlist checks, C libm/formatter execution with
sample interrupts, and C/C++ exported assets exceeding 64 KiB. All 34
desktop-renderer/AVR logical fixture-and-rate comparisons are sample-exact.
An independent 12-song compiler comparison confirms unchanged control
payloads and timing after removing music magic and expanding SFX masks.
The demo and RPG packages were rebuilt with regenerated assets. Older
compiled formats require recompilation and are not detected by the AVR.

Current-session logs, instruction comparison and machine-readable results
are under `build/audio_trusted_format/`; builds use RelWithDebInfo, the same
MSVC `/Z7` workaround, and workspace-local TEMP/TMP described above.

## Runtime music loop control

Music now ends at the longest written channel duration, including terminal
rests, and every compiled stream terminates with End (`01`). The interpreter
uses a persistent music-loop setting to stop or rewind there; SFX always stops.
The former terminal Loop command (`02`) and AVMS `loop` directive are removed.

The assembled firmware is **29,240 bytes**, leaving **456 bytes** below the
29,696-byte limit. The setting adds one byte of persistent SRAM: **90 bytes**
total, leaving **73 bytes** of native stack allowance above formatter/text
scratch. Synthesis instructions and their cycle counts are unchanged.

Validation passed 121 Python audio tests, 59 native audio cases, FX/FX-C/Mini
assembly, both large C/C++ asset executions, the demo and playlist checks,
and the RPG audio timing smoke test. All 34 desktop-renderer/AVR comparisons
remain sample-exact, with repetition supplied as a playback option. The demo
and both RPG device packages were rebuilt. Current logs are under
`build/audio-loop-*.log`; renderer results are in
`build/audio-loop-renderer-validation/validation.json`.
