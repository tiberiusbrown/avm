# Audio experiments below two bits per sample

This extends the [existing harness](audio-codecs.md) and preserves all AVAC v1
formats. The original full-track candidate-3 streams and common PCM8 references
are reused, without re-encoding or changing preprocessing. No interpreter,
LLVM backend, native synthesis runtime, or firmware assets are modified.

## Phase 1: residual analysis and exact entropy wrappers

```powershell
python tools/avm_audio_codec_test.py entropy build/audio-codec-results/TownTheme/candidate3_predictor_dpcm_f128_beam16.avac --reference build/audio-codec-results/TownTheme/reference_8bit_15625.wav --output-dir build/audio-codec-results/TownTheme/below2/entropy --training-stream build/audio-codec-results/determined_pursuit_loop/candidate3_predictor_dpcm_f128_beam16.avac
```

Swap recording names for the other track. Training uses the other complete
recording in this experiment, but every trained codebook identifier is stored
and counted. Omitting `--training-stream` trains from the evaluated stream and
still stores all learned identifiers. `--schemes` can select individual schemes;
`--entropy-frames` defaults to 128,256,512,1024 output samples.

`residual_statistics.json` contains symbol/sign/magnitude frequencies, each
original frame's distribution, predictor-conditioned distributions, previous
one/two-symbol transition counts and probabilities, repeated and alternating-sign
counts, symbol/magnitude run lengths, and empirical entropies. Context counts
restart at the original independent-frame boundaries, excluding direct seeds.
These empirical bounds do not include a practical entropy decoder's model or
context initialization costs.

| Complete recording | H(symbol) | H(symbol given previous) | H(symbol given two previous) | Memoryless bound with original seeds/headers |
|---|---:|---:|---:|---:|
| TownTheme | 1.950069 | 1.878707 | 1.858780 | 2.060019 output bps |
| determined_pursuit_loop | 1.957971 | 1.955493 | 1.937589 | 2.067839 output bps |

Residual probabilities are fairly balanced. The original symmetric quantizer has
no zero symbol, but alternating corrections do not make these whole music tracks
highly predictable. Lightweight entropy coding is measured despite these limited
theoretical savings; it is not assumed to reach the 1.0..1.75 bps region.

Tested schemes are global canonical Huffman, predictor-specific canonical
Huffman, frame-selected predefined Huffman, separate grouped sign/magnitude
planes, previous-symbol prediction with sparse exceptions, alternating-symbol
prediction with sparse exceptions, and best selection across all schemes. Every
group permits a raw two-bit fallback. Huffman code lengths are bounded by three.
The predefined family contains all twelve permutations of lengths `[1,2,3,3]`
plus raw `[2,2,2,2]`. Canonical ties use ascending symbol number.

Every encoded stream is independently decoded and compared sample-for-sample
with the original candidate-3 reconstruction. The residual symbols themselves
are also compared in automated tests. No additional audio distortion is allowed.

## AVAX v1 extension container

The command `decode` recognizes both AVAC and AVAX without access to original
audio. The AVAX common header has the same field widths as AVAC:
`<4sBBBBHII`, followed by an unsigned-byte step table. Magic is `AVAX`, version
1; codec IDs are 5 entropy, 6 mixed predictive, 7 two-band, 8 integer Haar.
Flags must be zero. Table count is 1..16 for codecs 5..7 and zero for Haar.
Frame size and original output count include direct seeds. Rate must be 15625.
All byte-valued signed samples are two's complement. Multibyte fields and fixed
bit fields use little-endian/LSB-first order. Padding is zero and validated.
The final output count determines partial final frames; trailing bytes are errors.

Bit input reads at most one compressed byte at a time. Fixed-header reads tolerate
short reads. No encoded frame is buffered. Tests simulate actual wrapping 64-byte
compressed rings, feed one-byte input chunks, and cross headers and variable words
over the wrap point. The formats have no checksum: valid symbol corruption need
not be detectable. Invalid headers, modes, truncation and padding are rejected.

### Codec 5: entropy wrapper

After the common header/table, store uint16 original baseline frame size and
four byte codebook IDs (global, predictor 0, predictor 1, predictor 2). Total
default file header is 40 bytes. The entropy group duration must be a multiple
of the original frame duration; original seeds, scale indices and predictors
are preserved exactly.

Each entropy group starts with a selector byte, then a continuous bitstream of
original subframes: eight-bit seed, eight-bit predictor/scale parameter, then
the known number of residual symbols. Subframe headers need not be byte aligned.
Only the entropy group's end is padded. Thus grouping also removes some old
per-subframe padding. There is no stored frame length; output count, baseline
frame size, and bounded prefix rules determine termination exactly.

| Selector | Residual representation |
|---|---|
| 0 | Raw two-bit symbol values |
| 1 | Global stored canonical codebook |
| 2 | Stored codebook for current original predictor |
| 3..14 | Predefined Huffman book IDs 1..12 |
| 15 | Groups of at most eight: raw sign bits, one magnitude-present flag, then raw large/small bits if any large residual occurs |
| 16 | Predict previous symbol (initial 1): zero exception bit means predicted, one means following raw two-bit literal |
| 17 | Predict `3-previous` (initial previous=1), with the same exception/literal representation |

Huffman words use canonical MSB-first prefix order inside the byte stream; this
is explicit and differs from the LSB-first order of fixed-width fields. The sign
is `symbol>>1`; large means symbol 0 or 3. Grouped bitplanes keep only sign byte,
magnitude byte and a small group count. Symbol predictors restart at each original
subframe. Seed output initializes both sample histories exactly as AVAC codec 3.

Global metadata, group selectors, seeds, parameters and final padding are all
included in compressed byte counts. A raw group can be larger than its original
AVAC frames because the wrapper needs a selector; this is an honest negative
result, rather than omitted overhead. Groups are independently restartable when
their byte offsets are indexed by the caller. No seek index is included or free.

## Phase 2: mixed one-bit and two-bit frames

```powershell
python tools/avm_audio_codec_test.py mixed build/audio-codec-results/TownTheme/reference_8bit_15625.wav --baseline build/audio-codec-results/TownTheme/candidate3_predictor_dpcm_f128_beam16.avac --output-dir build/audio-codec-results/TownTheme/below2/mixed --block-sizes 128 256 --beam-width 16
```

Candidate banks are encoded once, verified through serialization and independent
decoding, and cached with a reference hash, table, width and format revision.
The existing 128-sample two-bit stream is reused. A different frame duration
needs its own candidate-3 optimization; this is not a repeat of the old experiment.
One-bit frames extend the existing beam kernel to two symbols, using exactly
the same reconstructed predictor histories, clipping and tie conventions.
All three predictors and sixteen steps are searched. The common first-sample
seed convention is retained. A constant frame stores the rounded frame mean,
which can differ from the original first sample, and is explicitly a lossy mode.

Each frame contributes three measured candidates: best constant, best one-bit,
and best two-bit. The selector uses the actual byte size including seeds,
parameters and final padding. A global Lagrangian search selects frame candidates
for requested 1.00,1.25,1.50,1.75,2.00 bps operating points. Each multiplier is
solved exactly over the candidate bank. The target is an upper bit budget when
attainable; discrete choices can leave unused budget. No exact-bitrate guarantee
or globally optimal constrained-knapsack claim is made. The default objective is
total squared PCM8 reconstruction error. Empty and too-short inputs explicitly
report unattainable rates when the file header alone exceeds the target.

Optional `--quiet-weight`, `--quiet-threshold`, `--max-frame-rmse`, `--max-peak`
and `--boundary-weight` alter only allocation. Quiet weighting uses reference
frame RMS, not zero-crossing sample masks. A positive boundary weight adds the
actual squared difference between decoded and reference frame-boundary jumps;
the allocator uses Viterbi transitions across adjacent candidate choices, including
lossy hold seeds. Thus the boundary coupling is optimized explicitly. Hard quality
limits apply to the generated candidate pool; infeasible frames cause a clear
error rather than an unreported violation. They do not imply a perceptual model.

Use `--candidate-cache-dir` pointing at an earlier mixed result directory to
compare allocation policies without repeating candidate search. High-quality
encoding can use `--beam-width 64`; default 16 follows the previous experiment's
diminishing predictor-search returns. Result rows separate shared candidate-bank
encoding time from per-target allocation/serialization time.
An explicitly supplied compatible baseline is reused as encoded; omit
`--baseline` to re-optimize both widths at the new beam width. Cache keys include
the supplied baseline stream's hash, so changing its encoder output cannot
silently reuse a different two-bit candidate bank.

### Codec 6: mixed predictive layout

After the common AVAX header/table, each byte-aligned independent frame has a
sample byte and parameter byte. Parameter bits 0..3 are the scale index, 4..5
the original predictor mode, and 6..7 the residual width: 0 constant, 1 one-bit,
2 two-bit, 3 invalid. Constant frames require parameter zero and repeat the
stored sample for the entire frame. Other frames output the seed once and encode
the remaining samples as LSB-first symbols. One-bit 0/1 adds -S/+S; the decoder
maps these directly to existing candidate-3 symbols 1/2. Two-bit symbols and
prediction are unchanged from candidate 3. High final padding bits must be zero.

Full 128-sample frames occupy 2/18/34 bytes (0.125/1.125/2.125 bps), and
256-sample frames occupy 2/34/66 bytes (0.0625/1.0625/2.0625 bps). File headers
and final partial frames add overhead. A nominal 1.0-bps output with these
independent frames needs some constant frames; it cannot be obtained by calling
one-bit symbol width the complete stored rate. The decoder needs no PCM scratch
and reads one code byte per eight or four residual outputs, plus two header bytes
at restarts. Both histories initialize to the stored seed.

## Phase 3: integer subband and Haar codecs

```powershell
python tools/avm_audio_codec_test.py transforms build/audio-codec-results/TownTheme/reference_8bit_15625.wav --output-dir build/audio-codec-results/TownTheme/below2/transforms --families subband haar8 haar16 --frame-size 256 --beam-width 16
```

This runs complete recordings at each target. `--families` selects alternatives.
`--effort thorough` adds coefficient-coordinate refinement to Haar, checking actual
reconstructed PCM8 error for each trial. `--seconds 4` explicitly selects a prefix
excerpt for expensive encoder comparisons; its exact sample count, hash and
excerpt limit are recorded and must not be combined with complete-track curves.
Candidate banks use compressed numeric NPZ caches with `allow_pickle=False` and
configuration/reference hashes. Host-only encoder search memory is unrelated to
the AVR decoder scratch requirements.

### Codec 7: two-band adjacent-pair lifting

Analysis uses `high=odd-even`, `low=even+(high>>1)`. Synthesis computes
`even=low-(high>>1)`, `odd=high+even`, with signed floor shifts. Without
quantization, this reconstructs every possible PCM8 pair exactly, including
extremes. Low is PCM8; high can be -255..255. For an odd final count, duplicate
the last source sample only for analysis, and omit the final reconstructed odd
output. Its imaginary error is excluded from optimization.

Low-band one/two-bit DPCM uses all existing predictors/steps and beam search at
half rate. The low-band search objective is low-band MSE; the final alternatives
are selected using common full-rate PCM8 error after inverse lifting and clipping.
High-band options are zero/omitted, binary +/-H, and symmetric two-bit
`{-3H,-H,+H,+3H}`. For each low-band candidate and high-band mode, exhaustively
search every integer H (1..255 binary, 1..85 two-bit), choosing each high symbol
by actual decoded pair error. This staged optimization is not a claim of globally
optimal joint low/high trajectories. The shared rate allocator chooses between
the six stored allocations using full-reference error and serialized bytes.

Each frame has four byte fields: low seed, low predictive parameter, high mode,
high step H. The low parameter uses codec-6 width/predictor/scale bit positions;
width must be 1 or 2. High modes 0/1/2 mean omitted/binary/two-bit; mode 0 requires
H=0 and other modes require nonzero H. For each pair, read a low residual except
on the first pair, then read the high symbol if present. Fixed fields and symbols
are LSB first. Pad the final frame byte with zeros. There is no complete-frame
buffer. Keep the second output sample until the following tick. Use 16-bit
temporaries and clamp final even and odd independently after inverse lifting.

At 256-output frames the six full-frame stored rates, before file header/final
overhead, are 0.625,1.125,1.625,1.125,1.625,2.125 bps for
low1/high0, low1/high1, low1/high2, low2/high0, low2/high1, low2/high2. The
actual allocator can mix these modes to reach intermediate requested rates.

### Codec 8: eight/sixteen-sample Haar blocks

Apply the same reversible lifting recursively to the low halves. Coefficient
order is DC, coarsest detail, the next two details, and subsequent finer details.
The file stores one extra byte identifying block length 8 or 16. The AVAX frame
duration is 128 or 256 (or another multiple of the block size), not the transform
block size. The common step table is empty because DC uses the format's fixed
STEPS table. Its default file header is 19 bytes including the block-size byte.

DC coefficients across each independent frame use one/two-bit predictor DPCM,
all three predictors and all sixteen steps, with beam search and a direct initial
DC seed. A frame has three header bytes: DC seed, codec-6 predictive parameter
(width 1/2), and `(allocation_pattern<<4)|quantizer_exponent`. There are nine
predefined allocation patterns for each block length, printed by the `formats`
command and defined in `transforms.PATTERNS`. Exponent 0..8 is shared by the
frame. Different frames select different patterns/exponents and DC widths.

Each block reads a DC symbol except the first, then its detail coefficients in
the fixed pattern's order. Width zero omits a coefficient (value zero), width one
means -1/+1, and widths 2..5 use signed two's-complement fixed fields. Reconstruct
details by left-shifting their integer values by the exponent. The inverse uses
only additions, subtractions, shifts, and fixed shuffle cycles. Clamp the final
PCM8 outputs, omitting padded outputs in the final partial block. File counts
determine all termination and zero padding. No multiplication/division is required
in the proposed decoder. The encoder alone uses float rounding to nearest-even.

The encoder exhaustively searches the nine exponents and allocation patterns,
and both DC widths, using the exact common PCM8 reconstruction error. Fast mode
starts from nearest scalar coefficient quantization. Thorough mode performs one
coordinate pass, checking neighboring coefficient codes against actual block
error; it cannot worsen the initial configuration's objective. DC optimization
is a staged approximation before full-output coefficient search. All final
candidate simulations are checked against an independently implemented streaming
decoder before global allocation. No unquantized source history reaches a decoder.

Haar analysis is reversible and is tested separately from lossy quantization.
The decoder uses an in-place inverse: synthesize even/odd halves, then interleave
with fixed permutation cycles using one held word. This avoids a second full
coefficient buffer. Eight/sixteen signed words take 16/32 bytes; after clamping,
the same buffer can be packed in place to PCM8 for output. A foreground producer
with a separate active PCM block needs 24/48 total scratch bytes, plus control.
The 16-sample foreground double-buffer variant exceeds the preferred 32-byte
scratch range and is reported explicitly, rather than assumed free.

## Phase 4: comparison and reproducibility

```powershell
python tools/avm_audio_codec_test.py compare build/audio-codec-results/TownTheme
python tools/avm_audio_codec_test.py compare build/audio-codec-results/determined_pursuit_loop
python tools/avm_audio_codec_test.py decode build/audio-codec-results/TownTheme/below2/mixed/mixed_f256_target1.75.avax decoded.wav
python tools/avm_audio_codec_test.py formats
python -m pytest tools/tests tests/audio/test_score.py -q --basetemp build/audio-codec-pytest
```

`compare` reads the preserved baseline and new `entropy`, `mixed`,
`mixed_weighted`, and `transforms` result directories, checks the exact common
reference hash and every listening file's decoded PCM8 hash, and produces combined
JSON/CSV, a listening page with family filtering, rate-distortion plots, common
waveform/spectrogram diagnostics, error spectra, RMS-rise closeups, and a
`best_at_budget.json` table. It refuses to merge different sources or excerpts.
Markers represent real compressed streams; connecting segments do not create
measurements at untested rates. Empirical Pareto filtering only removes dominated
tested points. The complete table retains all measurements, including poor ones.

For the optional full-track allocation comparison, run the mixed command with
`--block-sizes 128 --targets 1.5 1.75 --quiet-weight 4 --boundary-weight 0.5`,
use `--candidate-cache-dir` pointing at the original mixed directory, and write
to `below2/mixed_weighted`. For the measured effort comparison use the transform
command with `--families haar8 haar16 --seconds 4 --targets 1.5 1.75`, separately
with `--effort fast` and `--effort thorough`. Store those labeled excerpts in
`below2/transforms_excerpt_fast` / `below2/transforms_excerpt_thorough`.

Cached candidates are an encoder optimization, not decoder dependencies. A
standalone decoder needs only its `.avax` or `.avac` file. Header/padding parsing
never reads a full encoded frame into RAM. Tests include every symbol/allocation
mode, all 64 ring start alignments, arbitrary short reads, partial final frames,
one/two-sample input, empty streams, exact transform inversion, brute-force
allocator comparisons including boundary coupling, and separate decoding processes.

The repository regression command is:

```sh
cmake --build build --config RelWithDebInfo --parallel 8 --target avm_tests_run
```

On Windows initialize the MSVC developer environment matching the configured
compiler/toolset first, as required by `.agents/AGENTS.md`. The recorded run used
the existing Ninja/RelWithDebInfo configuration and passed all 471 AVM tests,
41 native audio cases and existing asset checks. Its log is
`build/audio-below2-regression.log`. No interpreter, LLVM or audio runtime changes
were necessary. See [full findings](audio-codec-below2-results.md) for measured
quality, negative results, and the explicitly unmeasured AVR feasibility estimates.
