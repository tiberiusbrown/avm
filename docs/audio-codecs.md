# Host-side sampled-audio codec experiment

This experiment evaluates four real compressed formats without changing the AVM
interpreter, LLVM backend, or synthesis runtime. Listen to the generated WAVs;
objective error does not establish what sounds best on an Arduboy speaker.
The [supplied-recording results](audio-codec-results.md) compare TownTheme.mp3
and determined_pursuit_loop.wav, including full-length listening assets.
The follow-up [below-two-bit experiments](audio-codecs-below2.md) add exact
entropy wrappers, mixed one/two-bit prediction, two-band lifting and integer Haar
codecs; their [measured frontier](audio-codec-below2-results.md) covers 1.0..2.0 bps.

## Installation and use

From the repository root, with Python 3.10 or later:

```sh
python -m pip install -r tools/requirements-audio-codecs.txt
python -m pytest tools/tests/test_audio_codecs.py -q --basetemp build/audio-codec-pytest
python tools/avm_audio_codec_test.py formats
python tools/avm_audio_codec_test.py evaluate input.mp3 --output-dir build/codec_results
```

NumPy and SciPy are required. SoundFile reads supported WAV, FLAC, MP3, OGG and
other libsndfile formats. If that fails, FFmpeg and FFprobe on PATH provide input
decoding. Matplotlib generates plots. Numba is strongly recommended for recording
length searches; the same kernels have a slow Python fallback. Pytest runs tests.

The default evaluates greedy and width-16 beam encoders, all codecs, 128 output
samples per frame, and the entire input. No amplitude normalization or dynamics
processing is applied. The two full-file test commands used for the supplied
recordings are:

```powershell
python tools/avm_audio_codec_test.py evaluate "$env:USERPROFILE\Downloads\TownTheme.mp3" --output-dir build/audio-codec-results/TownTheme --block-sizes 128 --beam-width 16
python tools/avm_audio_codec_test.py evaluate "$env:USERPROFILE\Downloads\determined_pursuit_loop.wav" --output-dir build/audio-codec-results/determined_pursuit_loop --block-sizes 128 --beam-width 16
```

Useful experiments and independent decoding:

```sh
# Fast encoding of a complete recording
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/fast --methods greedy
# Frame-size sweep on a clearly identified excerpt
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/frames --start 30 --seconds 4 --block-sizes 32 64 128 256 --beam-width 16
# Higher search effort: any positive width up to 4096; practical values 1,16,64,256
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/high --methods beam --beam-width 64
# Exact optimization of codec 1 only (potentially expensive)
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/exact --seconds 1 --codecs 1 --methods greedy beam exact
# Secondary adaptive-scale experiment
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/sampleadapt --codecs 2 --sample-adaptation
# Encourage smaller jumps to the next independent-frame seed
python tools/avm_audio_codec_test.py evaluate input.wav --output-dir build/boundary --boundary-penalty 0.1
# Source audio is not needed for decoding
python tools/avm_audio_codec_test.py decode compressed.avac decoded.wav --upsample linear
```

`--normalize` explicitly enables peak normalization. `--steps` overrides the table
for codecs 1..3; `--adpcm-steps` overrides codec 4's table. Both accept 1..16 byte
values in 1..255. `--no-plots` suppresses plots. `--artifacts compressed` omits
codec reconstruction WAVs, while still decoding to measure and verify streams.
`--reuse` regenerates WAVs and reports from named existing streams, requiring an
exact reference hash and encoder-configuration manifest match. A reused encoder
runtime is reported as zero with `encoder_reused=true`. The standalone `decode`
command regenerates WAVs using only compressed input.

Output directories contain the common reference, `.avac` streams, configuration
manifests, WAVs, `metrics.json`, `metrics.csv`, `summary.md`, and `comparison.html`.
Open the HTML locally to compare players. Diagnostic PNGs show waveform/error
overlays, spectrograms with a common dBFS scale, and error distributions. Names
include frame size, method and beam width. Convenient `candidate1_...wav` through
`candidate4_adpcm_linear.wav` aliases use the first requested frame size and last
requested method. `bandwidth_only_hold.wav` and `bandwidth_only_linear.wav` show
the half-rate bandwidth loss without ADPCM. All playback files have identical
15,625 Hz sample counts and duration. Generated results live under ignored `build/`.

## Common reference and deterministic arithmetic

Input decoding produces floating-point samples without normalization. Channel
downmixing is the arithmetic mean, appropriate for ordinary stereo sources; for
surround material needing a specific speaker-layout matrix, supply a stereo/mono
mix. SciPy's default Kaiser FIR polyphase resampler converts to exactly 15,625 Hz.
The length is `ceil(source_frames * 15625 / source_rate)`, including filter edge
behavior, within one sample of the source duration. The experiment records source
and reference hashes, input backend, versions, gain, frame count and excerpt limits.

Multiply by 128, round to nearest with ties to even, and saturate to -128..127.
This quantized PCM8 is the only source for every codec. Reference and decoded
WAV files contain signed PCM16 equal to PCM8 times 256, with no added precision.
Codec 4 FIR-filters and downsamples this PCM8 reference by two, then rounds and
clamps again to PCM8. Its nominal rate is exactly 7,812.5 Hz; no WAV is mislabeled
7,812 or 7,813 Hz. It is emitted as upsampled 15,625 Hz audio.

Decoder arithmetic is mathematical signed integer, with at least a signed 16-bit
temporary and saturation after prediction plus residual. There is no wrapping.
For half-slope prediction, negative division rounds toward minus infinity; AVR
arithmetic right shift implements this floor. Frame seeds initialize both history
values and are output once. There is no implicit sample before or after the stream.

## AVAC version 1 binary format

Every stream is self-contained. All multibyte numbers are little endian. There
is no external JSON dependency for decoding, no checksum, and no stored source
history. The fixed file header is 18 bytes (`<4sBBBBHII`):

| Offset | Bytes | Meaning |
|---|---:|---|
| 0 | 4 | ASCII `AVAC` |
| 4 | 1 | Version, 1 |
| 5 | 1 | Codec ID, 1..4 |
| 6 | 1 | Flags: bit 0 = codec-2 per-sample adaptation; all others zero |
| 7 | 1 | Step-table entry count, 1..16 |
| 8 | 2 | Frame duration in original output samples, 2..65534 |
| 10 | 4 | Original 15,625 Hz output sample count, including seeds |
| 14 | 4 | Output rate, exactly 15625 |
| 18 | table count | Unsigned byte quantization step sizes |

Codec 4 requires an even output frame duration and decodes
`ceil(output_count/2)` native samples in frames of `frame_duration/2`. All other
codecs decode `output_count` samples. Frame size and count determine every final
frame length, so no per-frame length field is needed. Empty input has only a
header and table. Zero-length frames are never stored.

Each frame has:

1. One signed PCM8 seed byte, represented in two's complement.
2. One parameter byte: bits 0..3 initial step index; bits 4..5 predictor mode
   for codec 3, otherwise zero; bits 6..7 zero.
3. Codes for the remaining `native_frame_samples - 1` samples. Pack low bits
   first: four two-bit codes or two four-bit codes per byte. Pad unused high
   bits with zeros. Each new frame starts at a byte boundary.

The standalone decoder rejects unsupported headers, invalid frame parameters,
nonzero padding, missing bytes, and trailing bytes. The format is deterministic
but not designed to recover from transmission corruption.

At a full 128-output-sample frame, all codecs store two header bytes plus 32 code
bytes: **34 bytes, or 2.125 bits per output sample**, before the 34-byte default
file header/table. At sizes 32,64,256 this becomes 2.5,2.25,2.0625 respectively.
Tiny and final frames may have greater overhead. Reports count the entire actual
file, file and frame headers, residual bits, and padding separately. Both codec-4
upsamplers use the same stream; do not add their byte counts together.

### 1: Symmetric two-bit DPCM

Default steps: `[1,2,3,4,5,6,8,10,12,15,18,22,26,31,36,42]`.
Codes 0,1,2,3 add `-3S,-S,+S,+3S` to the previous reconstructed sample, then
clamp. The selected index is constant within the frame. No zero code is available,
so even digital silence has a small alternating reconstruction error.

### 2: Zero-aware adaptive two-bit DPCM

Uses the same default table. Codes 0,1,2,3 mean `0,+S,-S,direction*3S`.
Codes 1/2 set direction positive/negative before moving; codes 0/3 retain it.
Each frame initializes direction positive and the large-code count zero.
After every complete group of four residuals, count code-3 occurrences: 0..1
decreases the scale index, 2 leaves it unchanged, 3..4 increases it. Clamp the
index and reset the count. Seed output does not count toward the group. A partial
final group does **not** update the index; padding is never decoded or counted.

With header flag 0 set, the secondary per-sample rule increases the index after
code 3, decreases it after code 0, and leaves it unchanged after codes 1/2.
Both variants select the best initial index through reconstructed-error search.

### 3: Block-selected predictor DPCM

Uses codec 1's residuals and default table. Predictor modes are:

| Mode | Prediction |
|---|---|
| 0 | `previous` |
| 1 | `previous + previous - older` |
| 2 | `previous + floor((previous - older)/2)` |

Clamp only after adding the residual. Update older to the previous reconstructed
sample and previous to the new sample. Both history samples start at the seed.
All three modes and every step index are searched for each frame. Mode 0 uses
exactly codec 1's search state equivalence, giving a useful superset baseline.

### 4: Half-rate four-bit IMA-like ADPCM8

This is an explicitly **nonstandard IMA-like variant**, not a standard IMA WAV
block. It retains signed PCM8 predictor state and a 16-entry unsigned byte table:
`[1,2,3,4,5,7,10,14,20,28,40,56,80,112,160,224]`.

For code `c`, compute `delta = S>>3`, then add `S>>2` if bit 0 is set, `S>>1`
if bit 1 is set, and `S` if bit 2 is set. Bit 3 selects subtraction instead of
addition. Clamp predictor plus signed delta to PCM8. Update the index by
`[-1,-1,-1,-1,2,4,6,8][c&7]` and clamp to the table. These shifts and additions
use a signed 16-bit temporary; the predictor remains eight bits.

The seed is direct PCM8 and the initial index is explicit. All initial indices
and 16 legal code values are searched. The common reference is FIR-filtered and
halved before this codec, so bandwidth loss is part of its primary error.

Hold repeats every native sample twice, trimming the last repeated sample for
odd output lengths. Linear reconstruction outputs native sample `a` and then
`floor((a+b)/2)` before the next native sample `b`. At end of stream, repeat the
last sample if another output is needed. Linear needs one native-sample lookahead
and up to one native period (128 microseconds) of startup latency. It interpolates
across frame boundaries. Neither variant needs a whole frame in RAM.

## Encoder search and validation

Greedy selects the symbol with least immediate squared reconstructed error,
using the actual decoder state. Every initial step (and every predictor for 3)
is independently tried. Beam search expands all symbols for each retained state,
deduplicates equivalent decoder states with a bounded hash table, accumulates
squared error, and selects the best retained states with a bounded max heap.
It stores frame-local traceback, which has no effect on the runtime decoder.
All candidate-2 scale, direction, group-count, and phase consequences are simulated.
Candidate 4 searches at native half rate, making it a quantization optimizer;
its chosen paths are scored against the full-rate reference only in the report.

Finite beams can discard a useful path, so each configuration also retains its
greedy result as a fallback. At zero boundary penalty the selected optimized
stream is guaranteed no worse in its native squared-error objective. The two
codec-4 output methods can rank differently against the original full-rate input.
Greedy, beam and exact encoders all share the same binary format.

Codec 1 also offers exact dynamic programming across all 256 reconstructed sample
states, with traceback. The same step table is searched. Tie breaking is fixed:
mode then scale iteration order, lower code first on expansion, first discovered
equal-cost duplicate, deterministic heap order, first final retained state on
equal cost. Exact DP visits sample states ascending and codes ascending.

The objective is squared error plus an optional last-sample penalty
`weight*(last_reconstruction-next_frame_seed)^2`. This encourages smaller restart
jumps and may trade fidelity for smoother boundaries; it does not charge the
seed twice. The last frame has no such penalty. The objective is isolated in
the search kernels for experiments with different local error functions.

The independent scalar Python decoder reads actual packed bytes one at a time.
Encoder transitions are separately implemented in accelerated kernels. Every
evaluation verifies all serialized native samples equal the encoder simulation.
Tests include silence, constants, several sine frequencies/amplitudes, square,
sawtooth, impulses, steps, white noise, amplitude envelopes, abrupt changes,
alternating extremes, rounding/clipping, short/empty/odd lengths, padding, invalid
streams, deterministic search, exact DP versus exhaustive search, and a separate
process decoding without source audio.

## Metrics and their limits

Primary RMSE, MAE, maximum error, and SNR use PCM8 units against the common
15,625 Hz reference. SNR is `10*log10(mean(reference^2)/MSE)` without DC removal.
Exact reconstruction has JSON null SNR and status `exact` (mathematically +infinity
for nonzero reference); a silent reference with error has null SNR and status
`silent_reference` (mathematically -infinity). Empty input has status `empty`.
JSON never contains nonstandard NaN or Infinity numbers.

Boundary metrics report both the reconstructed jumps at independent frame
boundaries and the RMS error in those jumps relative to the reference. A source
transient is not automatically a codec click. Saturation counts raw decoder
values outside PCM8 before clamping; merely landing exactly on an endpoint is
counted separately. Codec-4 saturation is counted once per native sample, before
hold/interpolation. Host decoder runtime includes streaming/header/statistics
work and codec-4 upsampling. It provides no AVR timing evidence.

Codec 4 reports three extra comparisons: bandwidth-only output against common
reference, decoded output against bandwidth-only output, and decoded native
half-rate samples against half-rate PCM8. These separate diagnostic views; MSEs
need not add because errors may correlate. The quiet diagnostic selects individual
reference samples of magnitude <=8; the zero diagnostic selects exact zeros.
Use the plots and listening for sustained quiet passages and audible artifacts.

## AVR cost assessment (estimates, no native kernel measured)

These are source-level planning estimates for a specialized ATmega32U4 decoder,
not instruction-count benchmarks and not Python time converted to cycles.
The existing [audio measurements](audio-benchmarks.md) report 186..193 cycles for
ordinary synthesis and a 1,024-cycle period at 15,625 Hz. A further 50 cycles would
bring the 193-cycle case to about 23.7% CPU. Hardware listening and actual assembly
benchmarking are still required before choosing firmware integration.

Assume a 64-byte compressed ring, default tables fixed in flash, 16-bit frame
remaining count, 32-bit output remaining count, one packed byte, one symbol phase,
and three ring-management bytes. This shared control is 11 bytes, excluding the
64-byte ring and any backing FX address/caller state. Wide **stream control**
counters can run outside the sample arithmetic path. A shorter known asset can
specialize them. State totals below are concrete illustrative layouts, not a
compiled ABI. Custom per-asset tables need 16 additional RAM bytes or a flash
asset table pointer; the Python decoder supports them without an AVR commitment.

| Candidate | State including shared 11 B, excluding ring | Default flash tables | Arithmetic per decoded native sample | Estimated cycles per output sample |
|---|---:|---:|---|---:|
| 1 | 14 B: previous, S, 3S | 16 B steps; optionally 64 B signed residual LUT replacing on-frame scale construction | extract 2 bits, residual/sign choice, saturating addition | 18..35 |
| 2, group | 17 B: previous, index, direction, large count, S, 3S | 16 B steps; optional cached 3S table +16 B | extract, zero/sign/direction branch, add/clamp; every fourth residual compare count and change scale | 30..55 average |
| 3 | 16 B: previous, older, mode, S, 3S | 16 B steps or optional 64 B residual LUT | mode branch, optionally subtract/shift/add history, residual add/clamp | mode 0:18..35; mode 1:28..50; mode 2:35..58 |
| 4, hold | 15 B: previous, index, S, output phase | 16 B steps +8 B index deltas | on alternating outputs: nibble extraction, 3 magnitude tests, shifts/adds, sign, clamp, index update; otherwise held output | 25..48 average |
| 4, linear | 16 B: hold state + following sample | same 24 B | above plus signed 16-bit sum/arithmetic shift for midpoint | 30..56 average |

These broad ranges allow bit extraction, ring reads, common branches and modest
amortized frame setup, assuming register-resident hot state. They exclude backing
storage refill, the surrounding ISR save/restore, PWM write and mixing. Worst-case
clamping, adaptation, or frame parsing can exceed the average, and register
pressure can make these estimates optimistic. A default-table residual lookup
allows codec 1 to use byte saturating addition; generic custom steps can need
16-bit residuals. Codec 2's table arithmetic can also be byte-sized with an
explicit overflow/sign check for the default steps. Modes 1/2 of codec 3 and
codec 4 need signed 16-bit temporaries. None needs signed multiply, general
division, floating point, allocation, or a sample-sized source buffer.

All full frames fetch two header bytes per 128 outputs; a plausible setup is
12..30 cycles (two ring reads, direct seed, index/step load, history resets),
amortized about 0.1..0.24 cycles/output. Header work occurs together and should
be prefetched outside the critical ISR when possible. Stream-level header parsing
is a one-time foreground operation. Codec 2 initializes direction/count; codec 3
also copies seed to older and loads mode; codec 4 sets nibble/output phase.

Two-bit codecs fetch one residual byte for every four residual samples, plus
frame headers and at most one padded partial byte. Codec 4 fetches one byte for
two native residuals, also four output samples, plus frame headers. Seed positions
break an exact continuous four-output fetch cadence. No frame has to fit in the
64-byte ring: the decoder consumes it incrementally, including 256-output frames
whose 66 stored bytes exceed ring capacity. The ring must be replenished by the
caller. Linear interpolation alone needs one-sample lookahead, including across
frame headers. Codec 1 has the least branching and smallest algorithm state;
the complexity of the other candidates is justified only by measured quality.
