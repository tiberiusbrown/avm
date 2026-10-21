# Audio-guided MIDI-to-AVMS optimization

Stage 2 fits the existing Stage 1 `Arrangement` to a MIDI-associated WAV. It
exports a preserved baseline and a validated optimized score, A5 binary,
PCM16 listening previews, plots, and JSON reports. **The default evaluation
and preview rate is 15,625 Hz**, AVM's higher-quality (approximately 16 kHz)
mode. `--rate 7812.5` explicitly evaluates the default hardware mode instead.
The binary retains canonical 15,625 Hz increments, as required by AVM.
Device players use `avm_audio_rate(1)` to select the matching synthesis rate;
the score asset itself does not change the global rate.

The optional numerical dependencies are isolated from the standard-library-only
AVMS compiler and from Stage 1. No SoundFont, external synthesizer, GPU, Numba,
or online service is required. Python 3.10+ is supported.

## PowerShell usage

From the repository root, with a Python installation containing the optional
dependencies (Python 3.12 was used for validation):

```powershell
py -3.12 -m pip install -r tools/requirements-stage2.txt
py -3.12 tools/midi_to_avms_stage2.py `
  --input-dir "$env:USERPROFILE\Downloads\stage2" `
  --output-dir build/stage2 --preset balanced --rate 15625 --stats

py -3.12 tools/midi_to_avms_stage2.py `
  "$env:USERPROFILE\Downloads\stage2\z1overw.mid" `
  "$env:USERPROFILE\Downloads\stage2\z1overw.wav" `
  --output-dir build/stage2/z1overw --rate 15625
```

Batch discovery matches `.mid`/`.midi` and `.wav` case-insensitively by basename;
ambiguous duplicates fail clearly, unmatched basenames are reported, and a
bad pair does not prevent the remaining pairs from running. Batch failures
produce a nonzero exit status and appear in `summary.json`/`summary.md`.
Input recordings and MIDI are only read. Output directories that would
overwrite an input are rejected. Keep generated derivatives in ignored `build/`;
no recordings or generated song assets need to be added to Git.

Useful options:

| Option | Meaning |
|---|---|
| `--max-evaluations 240` | Maximum unique compiled candidate evaluations, including baseline; default 240 |
| `--max-seconds 120` | Search wall-clock budget; finishing an evaluation and final verification/export can run beyond it |
| `--excerpt-duration 12` | Total fitting audio; normally three representative four-second windows |
| `--excerpt-start 20 --excerpt-duration 16` | Fit one specific excerpt; still validate/export the complete song |
| `--no-optimize-effects` | Fit mix, timbre, envelopes and gates only |
| `--no-refine-harmony` | Preserve existing harmony effects |
| `--size-weight 0.025 --clipping-weight 4` | Resource and overload weights; all weights are in `Weights` for Python callers |
| `--no-percussion` | Stage 1 percussion density zero |
| `--resume` | Additional bounded sweep from the saved, validated best; mismatched inputs/configuration are rejected |
| `--render-only` | MIDI+WAV baseline export and comparison, without fitting |
| `--analyze-only` | Baseline analysis/report/export, without fitting |
| `--no-plots` | Skip the optional Matplotlib comparison image |

All Stage 1 `Settings` options remain available: preset, source track/channel
overrides, octave/register selection, transpose, densities, channel volumes,
arpeggios, effect intensity, region `--start`/`--end`, and `--loop`.
The search has no stochastic operations or random seed. Resume preserves prior
history and totals, but uses a new in-memory cache and can revisit candidates.
A checkpoint is written atomically after each accepted improvement. A resumed
search uses the same input/setting fingerprint; it is an additional sweep,
not a serialized continuation of an interrupted coordinate iterator.

Render an existing AVMS or A5 asset independently:

```powershell
py -3.12 tools/midi_to_avms_stage2.py build/stage2/z1overw/optimized.avms `
  --render-only --excerpt-duration 12 --rate 15625 --output-dir build/stage2/preview
```

## Implementation and numerical model

- `tools/avm_audio_render.py` validates/decodes A5 ownership, variable pitch
  and control payloads, Continue, End, and Loop. Its event-span renderer uses
  unsigned 16-bit phase, canonical quantized increments (saturating doubling
  at 7812.5 Hz), phase-high duty comparison or the AVR integer triangle fold,
  exact FMULSU rounding, prepared
  amplitude `floor(volume * master / 32)`, signed summation, and final clipping.
  The noise voice uses the 255-state B8 LFSR cycle, low-bit polarity, overflow
  clocking, and explicit phase reset/seed commands. Off pitches mute without
  discarding phase. Ordinary notes, waveform/duty changes, and loops preserve phase.
  Tonal control bit 5 selects triangle, bit 6 stays reserved; noise reserves
  both bits. Only bits 0..4 contribute to amplitude. Stage 1 instrument export
  and Stage 2/3 arrangement snapshots retain `wave triangle`; the renderer used
  by fitting and validation honors it. Duty fitting applies to pulse instruments.
- `tools/avm_audio_features.py` loads unsigned/signed PCM and floating WAV,
  checks finite samples, downmixes channels (with a cancellation fallback),
  performs rational polyphase resampling, and records original format, peak,
  RMS, possible clipping, and leading/trailing activity. Silence is measured,
  never blindly trimmed. A single bounded onset/energy correlation estimates
  recording latency relative to MIDI. First-activity evidence resolves nearly
  tied periodic peaks within 40 ms of that anchor. Eight-second block residuals
  and weak/ambiguous alignment are reported. There is no time warping.
- `tools/avm_audio_optimize.py` separates the cached objective from the bounded
  deterministic search. Candidates deep-copy the Stage 1 IR, compile using
  `compile_arrangement`, and render actual quantized A5 data. Repeated compiled
  hashes reuse metrics. Reference features, sparse harmonic kernels, and
  MIDI-informed masks are cached. Prefix phase/LFSR state is advanced
  arithmetically, allowing late excerpts without synthesizing the whole prefix.
- `tools/midi_to_avms_stage2.py` discovers inputs, prepares the reference,
  checkpoints, performs whole-song verification, and exports reports/previews.
  The only Stage 1 IR extension is `ArrangedNote.gate`, a sounding fraction with
  default 1.0. Shortening it changes articulation without moving note boundaries;
  existing score generation is unchanged at its default.

Features include 256-, 512-, and 2048-sample STFT magnitudes in 64 logarithmic
frequency bands; compressed log magnitudes and normalized spectral shape;
short-time RMS and energy/spectral-flux onsets; spectral centroid and 85% energy
rolloff; harmonic comb salience for MIDI 24..107; four harmonic energy
distributions; and chroma. Centroid, rolloff and individual harmonic arrays
are available for analysis; the objective does not separately weight them.

The weighted objective actually used is:

| Component | Weight | Measurement |
|---|---:|---|
| Spectral | 0.65 | Three resolutions, compressed magnitude and per-frame normalized shape |
| Envelope | 1.10 | RMS error divided by reference mean RMS |
| Onset | 0.80 | Energy/spectral novelty error with an activity-normalized denominator |
| Pitch structure | 1.20 | Chroma distribution error plus lead/bass masked temporal salience |
| Balance | 0.80 | Relative role energy in MIDI-informed time/pitch masks |
| Preservation | 0.25 | Volume-ratio and gate changes, in addition to hard structure guards |
| Clipping | 4.00 | Actual unclipped integer mix outside -128..127, plus continuous overload duration |
| Complexity | 0.025 | Measured binary bytes, decoded event count, distinct effects and used instruments |

RMS normalization estimates a global recording gain as a nuisance parameter,
pooled over all excerpts, rather than changing the reference target per voice.
Comparison signals first reject DC/subsonic energy with a zero-phase,
second-order 10 Hz high-pass. This preserves musical timing and C1 while
preventing pulse duty bias from masquerading as audible loudness. It is not a
measured speaker response. Raw previews remain unfiltered. Reports distinguish
raw RMS, DC and AC RMS; the optimizer's recording gain and loudness floor use
the filtered AC signal.
Physical gain remains master 128 (400%); overload is measured before any
comparison normalization. Candidate AC RMS must remain at least 60% of
baseline, and individual nonzero note levels at least 55% (rounded upward).
Relative note dynamics are scaled together; the search never independently
flattens velocities. Instrument volume rises are bounded, worst-case note peaks
fit 30 units (or an inherited higher baseline), and accompaniment cannot
overwhelm the lead. No physical piezo response curve is assumed.

Reference role masks use original MIDI pitches reached through
`ArrangedNote.sources`; candidate masks use Stage 1's output register and
source-derived arpeggio pitches. Overlapping masks are apportioned. These are
uncertain auxiliary estimates from the full mix, **not separated stems**.
Neither bass nor another single voice is fitted independently to the whole
unseparated reference. The supplied SoundFont is not needed or assumed to
match the reference renderer.

## Search and safeguards

The finite coordinate schedule fits channel balance, coarse pulse duty/noise
pitch, reusable envelope/attack/decay/sustain/release and note gates, expressive
effects, source-derived harmony refinement, and local volume/duty refinement.
Round-robin coordinates allocate the budget across instruments rather than
exhausting it on the first role. Exact duplicate binaries are skipped. The
finite sweep terminates when its neighborhood is exhausted or the budget is
reached; improvements below the relative threshold (0.1% by default) are
rejected. A near tie can favor a smaller binary without worsening objective.

Coarse pulse duties are 32, 48, 64, 80, 96, 128, and 192; local refinement tests
neighboring eight-unit thresholds. Noise rates are bounded MIDI shifts from
the baseline. Eight reusable envelope shapes, 0/8/24/48 ms releases, and a
small gate vocabulary keep the output compact. Long pulse notes may acquire
10/20-cent vibrato at 160/240/320 ms periods, duty slides, slow duty LFO,
subtle volume LFO/slide. Duty-slide proposals jointly restore the starting
duty/envelope so a prior static fit cannot erase a useful modulated attack.
Noise retrigger proposals use 16/32/64 ms periods and seeds 1/37. Existing
effects are replaced by kind/target rather than duplicated.

Harmony refinement tests 48/96/128 ms source-derived arpeggios, note cuts, and
source-chord pitch transitions. Chromatic glissandi are considered only where
all intervening semitones are actually in the source chord, so most ordinary
chords do not qualify. New frequency slides/glissandi never alter melody or
bass. Existing source pitch transformations remain intact, with at most one
base transform per note. Added vibrato is limited to 25 cents and periods
at least 120 ms; duty LFO is similarly bounded. Melody/bass gates stay at
least 80%; all notes, source identities, pitches, onsets and offsets remain
unchanged except bounded noise timbre pitches. Harmony notes are not deleted.
No candidates invent unrelated chord arpeggios or continuous noise replacing
the original percussion rhythm. The compiler is the final syntax/range
authority. A5 decoding independently rejects malformed assets, and the
evaluator caps decoded event density at 250/s.

Final whole-song loss is measured independently of excerpt fitting. If it
regresses, the exported optimized arrangement is the preserved Stage 1
baseline and the fallback is explicit. Every exported candidate is compiled
and rendered again. Search evaluation counts exclude final repeat verification,
the two whole-song evaluations, and listening-preview exports. Reported
resource event counts include encoded Continue and terminal records; Stage 1's
compiler counters are also included separately.

## Files and listening

Each song directory contains `baseline.avms/.bin/.wav`,
`optimized.avms/.bin/.wav`, `reference.wav` (an unchanged copy of the supplied
WAV), `reference_aligned.wav` (mono, resampled analysis preview),
`comparison.json`, `comparison.png`, `optimization_history.json`,
`arrangement.json`, and `checkpoint.json`. The batch root contains
`summary.json` and `summary.md`. All original source assets remain outside
version control.

Baseline and optimized WAVs use the same fixed master, with no independent
normalization. For 7812.5 Hz, RIFF's integer-rate limitation is handled by exact
2x polyphase resampling to a 15,625 Hz WAV, avoiding pitch drift. Plots use
the same spectral dB limits and one reference display gain; they label that
gain and do not imply that each signal has been loudness-matched. JSON includes
gain, alignment diagnostics, raw loss components, actual overload, peak/RMS/DC,
instrument definitions, gate/volume/duty changes, effects/arpeggios, compiled
bytes/events, runtime and warnings. Compare the files by ear before deciding
whether a numerically better fit is preferable music.

## Independent renderer validation

Build the native tests with the repository's existing MSVC developer environment
and CMake configuration, then run the optional oracle:

```powershell
cmake --build build --config RelWithDebInfo --target avm_audio_tests_run --parallel
py -3.12 tests/audio/validate_stage2_renderer.py --live
py -3.12 -m unittest discover -s tests/audio -v
py -3.12 tests/audio/validate_stage2_corpus.py `
  --input-dir "$env:USERPROFILE\Downloads\stage2" --output-dir build/stage2 --rate 15625
```

`avm_audio_tests --render-logical` runs the **actual AVR A5 sequencer,
foreground control preparation, and Timer1 ISR** at deterministic logical
sample boundaries. It is not a C++ reimplementation of synthesis. The Python
oracle script compiles synthetic scores and compares every raw uint8 endpoint
to this independent execution. `--capture` remains the existing real-timer,
50 kHz PWM audio capture, now with a `.logical.csv` sidecar observing the
post-synthesis held endpoint before PWM reconstruction.

On 2026-10-21, all **30 fixtures/rate combinations (360,000 samples)** matched
exactly: constant and low/high tones, duty extremes, simultaneous voices,
clipping, envelopes, volume/duty/frequency slides, vibrato, arpeggios,
glissando, noise and repeated seeds, initial delay, phase continuity and loops,
all-triangle chords, mixed pulse/triangle/noise, waveform switches, and retained
duty changes. The earlier 2026-10-20 live steady tones also matched exactly after startup offsets of 9 samples
at 7812.5 Hz and 15 samples at 15,625 Hz in this harness. Output intervals
were 128 and 64 microseconds. These startup offsets are harness measurements,
not universal hardware latency corrections.

The logical convention publishes each event immediately before sample
`ceil(tick * rate / 250)`, including the mandatory first 4 ms delay. Real
foreground service is asynchronous to Timer0 and Timer1, while the ISR writes
the **previous** held sample to PWM. The PWM capture additionally includes
250 kHz carrier integration and its fixed x16 capture gain. Retiming a
modulated live capture by one global sample shift cannot undo accumulated
phase differences after differently scheduled pitch changes. The live loop
diagnostic deliberately reports unaligned sample disagreement (about 53% at
15,625 Hz), not a false sample-exact claim. Logical sample equality and
aligned steady live equality establish the synthesis target; foreground jitter,
PWM filtering, and speaker acoustics remain outside the optimizer model.

The synthetic unit suite verifies renderer arithmetic, bad assets, excerpts,
WAV formats/resampling, silence/brightness/pitch/ramp/attack/alignment, recovery
of known duty/envelope/vibrato/duty-slide/balance/retrigger targets, simplicity,
preservation, discovery and CLI/resume behavior. Tests clearly skip numerical
cases if their optional dependencies are absent. Original Stage 1/compiler
tests remain independent of NumPy/SciPy.

## Limits and further work

The constrained vocabulary and approximate full-mix masks can fit the wrong
musical balance when overlapping source instruments have similar harmonics.
Global RMS/onset features do not replace note-specific perceptual judgments.
An ambiguous onset alignment is reported even when first-activity evidence
chooses a plausible peak; local residuals in periodic material can also be
ambiguous. Dense orchestration, missing Stage 1 parts, reverb, and sampled
instruments remain irreducible mismatches. A lower loss is not evidence of
better physical-speaker listening quality; no listening results are claimed.

Next useful work is level-matched listening on an Arduboy, a measured piezo
transfer function, reliable source stems with documented renderer provenance,
improved note-conditioned attack/release and pitch-modulation estimation,
multiple alternate whole-song-validated finalists, and incremental compiler
caching for larger search budgets. Arbitrary structural rewriting or unrestricted
time warping would undermine composition preservation and is intentionally absent.
