# Stage 2 development and validation report

Validated locally on 2026-10-20. Evaluation and all final song previews use **15,625 Hz**, as requested. This report describes measured objective changes, not subjective listening results.

## Implementation

The new renderer (`tools/avm_audio_render.py`), analysis module (`tools/avm_audio_features.py`), optimizer (`tools/avm_audio_optimize.py`), and CLI (`tools/midi_to_avms_stage2.py`) reuse Stage 1 Song/Arrangement/Instrument/Effect objects and the existing AVMS compiler. The only IR extension is a default-preserving note gate fraction. Numerical dependencies live in `tools/requirements-stage2.txt`.

The objective combines multiresolution compressed/normalized spectra, RMS contours, energy/spectral onsets, chroma and MIDI/provenance-masked pitch/role energy, musical preservation, actual integer clipping, compiled bytes/events and effect complexity. Comparison normalization rejects DC/subsonic energy at 10 Hz; raw previews retain exact synthesis output. Bounded deterministic coordinates fit shared mix/duty/noise rates/envelopes/gates, selectively add expression, refine source-derived harmony, then test local volume/duty changes. Final whole-song verification can retain the baseline or an earlier resumed best.

See [usage, architecture, bounds, objective and limitations](midi_to_avms_stage2.md) for implementation details.

## Reproduce in PowerShell

```powershell
py -3.12 -m pip install -r tools/requirements-stage2.txt
py -3.12 tools/midi_to_avms_stage2.py `
  --input-dir "$env:USERPROFILE\Downloads\stage2" `
  --output-dir build/stage2 --preset balanced --rate 15625 --stats
py -3.12 tests/audio/validate_stage2_corpus.py `
  --input-dir "$env:USERPROFILE\Downloads\stage2" --output-dir build/stage2 --rate 15625
```

## Corpus measurements

Loss is measured on the complete song after compiling and quantizing. Event counts include Continue and terminal records; compiler-only update counters are also present in each JSON report.

| Song | Loss before | Loss after | Reduction | Bytes before/after | Events before/after | Evaluations | Search seconds |
|---|---:|---:|---:|---:|---:|---:|---:|
| ff1matya | 1.492580 | 1.223185 | 18.05% | 14085 / 16252 | 2846 / 3589 | 182 | 96.11 |
| ff1overw | 1.441943 | 1.267740 | 12.08% | 5791 / 6953 | 1263 / 1638 | 114 | 39.91 |
| ff1town | 1.649593 | 1.149207 | 30.33% | 3262 / 5477 | 737 / 1295 | 118 | 29.38 |
| z1overw | 2.100489 | 1.526813 | 27.31% | 6462 / 8946 | 1228 / 1934 | 125 | 34.78 |

All four outputs retain melody, harmony and bass note pitches, onset/offset times and source identities. Percussion attack identities/times also remain intact. All baseline and optimized renders measured **zero clipped samples**. No whole-song baseline fallback was needed in this run.

| Song | Reference seconds | Tail/silence beyond MIDI | Alignment seconds | Raw RMS before/after | AC RMS before/after | Size change | Updates/s after |
|---|---:|---:|---:|---:|---:|---:|---:|
| ff1matya | 103.851 | 4.541 | 0.004 | 0.3310 / 0.3015 | 0.2776 / 0.2184 | +15.39% | 36.14 |
| ff1overw | 78.170 | 4.324 | 0.020 | 0.3180 / 0.2602 | 0.2703 / 0.2539 | +20.07% | 22.18 |
| ff1town | 50.074 | 10.890 | 0.008 | 0.3677 / 0.3322 | 0.2983 / 0.2059 | +67.90% | 33.05 |
| z1overw | 42.318 | 3.404 | 0.032 | 0.2070 / 0.2158 | 0.1849 / 0.1924 | +38.44% | 49.69 |

References were all 44,100 Hz stereo PCM16, without detected clipping. They remain unchanged; `reference.wav` is an exact copy. Longer reference durations are retained as original silence/tail, not forced into the MIDI timeline. Alignment diagnostics remain ambiguous on repetitive material; Matoya also raises a local residual warning, which may reflect periodic ambiguity rather than confirmed timing drift.

## Per-song decisions and outputs

### ff1matya

[Baseline WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1matya/baseline.wav) · [Optimized WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1matya/optimized.wav) · [Comparison image](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1matya/comparison.png) · [Detailed JSON](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1matya/comparison.json) · [AVMS](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1matya/optimized.avms)

| Role | Duty before/after | Peak note volume before/after |
|---|---|---:|
| melody | [64] / [32] | 9 / 7 |
| harmony | [32] / [96] | 4 / 5 |
| bass | [128] / [80] | 6 / 5 |
| percussion | [128] / [128] | 5 / 6 |

Effect counts: `{'arpeggio': 156, 'note_cut': 387, 'noise_retrigger': 3}` → `{'arpeggio': 156, 'note_cut': 387, 'noise_retrigger': 3}`.

Envelope definitions, releases, gates, arpeggio parameters, noise pitches, peak/DC levels and every loss component are recorded before/after in the detailed JSON. Trial losses and acceptance decisions are in `optimization_history.json`.

- Local timing mismatch exceeds 80ms; timbre optimization cannot fix source timing
- Reference duration differs from MIDI by 4.541s; silence/tail retained in original reference
- Retained/ignored unsupported expression: CC0 (4)
- Scaled requested volumes by 0.938 to fit a 30-unit music mix budget
- Weak/ambiguous global onset alignment; inspect previews

### ff1overw

[Baseline WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1overw/baseline.wav) · [Optimized WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1overw/optimized.wav) · [Comparison image](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1overw/comparison.png) · [Detailed JSON](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1overw/comparison.json) · [AVMS](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1overw/optimized.avms)

| Role | Duty before/after | Peak note volume before/after |
|---|---|---:|
| melody | [64] / [192] | 10 / 8 |
| harmony | [32] / [40] | 3 / 3 |
| bass | [128] / [128] | 6 / 8 |

Effect counts: `{}` → `{}`.

Envelope definitions, releases, gates, arpeggio parameters, noise pitches, peak/DC levels and every loss component are recorded before/after in the detailed JSON. Trial losses and acceptance decisions are in `optimization_history.json`.

- Reference duration differs from MIDI by 4.324s; silence/tail retained in original reference
- Weak/ambiguous global onset alignment; inspect previews

### ff1town

[Baseline WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1town/baseline.wav) · [Optimized WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1town/optimized.wav) · [Comparison image](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1town/comparison.png) · [Detailed JSON](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1town/comparison.json) · [AVMS](C:/Users/Brown/Documents/GitHub/avm/build/stage2/ff1town/optimized.avms)

| Role | Duty before/after | Peak note volume before/after |
|---|---|---:|
| melody | [64] / [32] | 10 / 8 |
| harmony | [32] / [104] | 4 / 5 |
| bass | [128] / [32] | 6 / 4 |

Effect counts: `{'arpeggio': 116}` → `{'arpeggio': 116}`.

Envelope definitions, releases, gates, arpeggio parameters, noise pitches, peak/DC levels and every loss component are recorded before/after in the detailed JSON. Trial losses and acceptance decisions are in `optimization_history.json`.

- Reference duration differs from MIDI by 10.890s; silence/tail retained in original reference
- Rejected harmony envelope: Candidate violates physical loudness floor
- Rejected melody envelope: Candidate violates physical loudness floor
- Retained/ignored unsupported expression: CC0 (4), CC10 (4)
- Weak/ambiguous global onset alignment; inspect previews

### z1overw

[Baseline WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/z1overw/baseline.wav) · [Optimized WAV](C:/Users/Brown/Documents/GitHub/avm/build/stage2/z1overw/optimized.wav) · [Comparison image](C:/Users/Brown/Documents/GitHub/avm/build/stage2/z1overw/comparison.png) · [Detailed JSON](C:/Users/Brown/Documents/GitHub/avm/build/stage2/z1overw/comparison.json) · [AVMS](C:/Users/Brown/Documents/GitHub/avm/build/stage2/z1overw/optimized.avms)

| Role | Duty before/after | Peak note volume before/after |
|---|---|---:|
| melody | [64] / [32] | 6 / 4 |
| harmony | [32] / [24] | 2 / 2 |
| bass | [128] / [96] | 6 / 8 |
| percussion | [128] / [128] | 2 / 2 |

Effect counts: `{'note_cut': 137}` → `{'lfo': 11, 'note_cut': 137}`.

Envelope definitions, releases, gates, arpeggio parameters, noise pitches, peak/DC levels and every loss component are recorded before/after in the detailed JSON. Trial losses and acceptance decisions are in `optimization_history.json`.

- Reference duration differs from MIDI by 3.404s; silence/tail retained in original reference
- Retained/ignored unsupported expression: CC0 (4), CC10 (1), CC91 (2)
- Scaled requested volumes by 0.938 to fit a 30-unit music mix budget

## Verification

- Renderer: 26 fixture/rate combinations, 312,000 logical samples, zero differences against the actual AVR sequencer/preparation/ISR.
- Existing live PWM capture: both rates ran; constant-tone logical endpoints match exactly after startup offsets of 9/15 samples at 7812.5/15625 Hz. Modulated real-timer captures retain foreground jitter and PWM differences; no sample-exact live-loop claim is made.
- Python: **106 tests passed**, including all 82 existing Stage 1/compiler tests and 24 numerical/CLI/synthetic fitting tests. No skips in the Python 3.12 run.
- Native RelWithDebInfo audio suite: **45 audio cases passed**, plus timer/synthesis/ownership/SPI/formatter checks, both demo-rate scenarios, five-song playlist and large C/C++ assets beyond 64 KiB. The CMake-selected Python 3.13 has no optional numerical/MIDI packages; optional tests skip there, while the separate Python 3.12 run executes them.
- Local corpus integration: all four sets recompile to the exported binary, fresh logical PCM matches the WAV samples, output rates are 15,625 Hz, note provenance is preserved, and original reference copies/hashes match.
- New/modified Python files pass Ruff; whitespace checks pass. A `python -S` compiler invocation succeeds without site packages. No commits or pushes were made.

## Assessment and next steps

These results show lower combined full-song loss with preserved composition and measured headroom. Individual spectral components can regress while balance/onset measures improve; the JSON exposes those tradeoffs. Asset sizes generally increase with envelope/effect automation, so these are quality/resource compromises rather than free improvements. Stereo references are full mixes; MIDI masks do not reliably separate overlapping instruments. Fixed expressive vocabularies and approximate alignment limit recovery of complex sampled timbres and performance gestures. No hardware listening test or subjective quality result is claimed.

The next priorities are level-matched Arduboy listening, a measured piezo transfer function, reliable documented source stems, more direct note-conditioned attack/release and vibrato estimates, retaining several whole-song-validated finalists, and incremental compiler caching. Original inputs and all generated audio/binaries remain outside version control under ignored build outputs.
