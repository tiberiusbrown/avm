# Compression frontier below two bits per sample

**Recommend mixed one/two-bit predictor frames, 256 outputs per frame, around
1.75 stored bits/output sample for the next native AVM prototype.** On both
complete recordings this stays within the requested 25%-extra-RMSE stretch
target, saves about 17.7% against the original candidate-3 assets, and adds only
a width/constant selector to the successful predictor decoder. AVR timing and
speaker listening remain to be measured.

The [implementation guide](audio-codecs-below2.md) documents all new formats,
commands, streaming rules, allocator, and decoder estimates. The original
[baseline report](audio-codec-results.md) is preserved. These results establish
the frontier of the tested configurations, not a mathematical optimum over all
possible codecs.

## Full-recording operating points

All rows use actual serialized byte counts, including file headers, tables,
restart parameters, seeds and padding. All errors compare independently decoded
PCM8 with the original common 15,625 Hz PCM8 reference. Neither recording was
truncated or normalized. Both new decoders and the old AVAC formats work through
the same standalone `decode` command.

| Budget | TownTheme actual bps | RMSE | Best tested codec | determined_pursuit_loop actual bps | RMSE | Best tested codec |
|---|---:|---:|---|---:|---:|---|
| 1.00 | 0.999959 | 3.389 | Mixed, 256 | 0.999799 | 4.021 | Two-band, 256 |
| 1.25 | 1.249954 | 2.336 | Mixed, 256 | 1.249868 | 3.030 | Mixed, 256 |
| 1.50 | 1.499780 | 1.793 | Mixed, 256 | 1.499876 | 2.511 | Mixed, 256 |
| 1.75 | 1.749775 | 1.390 | Mixed, 256 | 1.749883 | 2.081 | Mixed, 256 |
| 2.00 | 1.999938 | 1.154 | Mixed, 256 | 1.999706 | 1.822 | Mixed, 256 |
| Original candidate 3 | 2.125186 | 1.148 | Two-bit, 128 | 2.125165 | 1.765 | Two-bit, 128 |

At 1.75 bps the assets occupy **333,052 / 369,116 bytes**, versus the original
404,508 / 448,277. RMSE increases about **21.1% / 17.9%**, meeting the 1.44 / 2.21
stretch limits. At 1.5 bps, 285,468 / 316,380 bytes save about 29.4%, but RMSE
increases about 56.2% / 42.2%, missing those stretch limits. Near 2.0 bps,
380,668 / 421,813 bytes save about 5.9%, with only about 0.6% / 3.2% extra RMSE.

Mixed prediction wins the tested 1.25..2.0 budgets on both tracks. The two-band
codec has one useful exception: near 1.0 bps on determined_pursuit_loop it gives
4.021 RMSE versus mixed prediction's 4.166. This is source-dependent and did not
extend to the higher rates. The largest quality losses occur toward 1.0..1.25;
there is no listening-validated universal minimum acceptable bitrate.

| Mixed predictive frame size | TownTheme RMSE at ~1.5 / ~1.75 | determined_pursuit_loop RMSE at ~1.5 / ~1.75 |
|---|---:|---:|
| 128 | 1.886 / 1.464 | 2.571 / 2.133 |
| 256 | **1.793 / 1.390** | **2.511 / 2.081** |

Fewer restarts leave more bits for residual precision. A one-bit symbol stream
alone still costs 1.0625 bps in full 256-output frames; reaching 1.0 requires
some lossy constant frames. The encoder never reports the symbol width as the
whole-file bitrate. Very short files can have unattainable target rates because
of mandatory headers.

## Entropy coding: exact but small savings

All 28 entropy scheme/group combinations per recording reproduced the original
candidate-3 PCM8 **exactly**, with no additional distortion. The best tested
wrapper was automatic selection with 1024-output entropy groups:

| Recording | Original bytes | Entropy bytes | Actual bps | Storage saving | RMSE |
|---|---:|---:|---:|---:|---:|
| TownTheme | 404,508 | 395,464 | 2.077673 | 2.24% | 1.148 |
| determined_pursuit_loop | 448,277 | 445,705 | 2.112972 | 0.57% | 1.765 |

The whole-stream symbol entropies are 1.9501 / 1.9580 bits/residual; including
the original seeds/headers gives memoryless lower bounds of 2.0600 / 2.0678
output bps. Previous-one/two-symbol contexts lower TownTheme's empirical entropy
to 1.8787 / 1.8588, but barely help the other recording (1.9555 / 1.9376).
Those bounds omit practical context-model costs and do not promise a lightweight
implementation at that rate.

The best wrapper used mostly raw groups: 1085/1488 for TownTheme, 1476/1648 for
determined_pursuit_loop. Other selected groups were mainly predefined or
predictor-conditioned Huffman. Sign/magnitude planes and repeated/alternating
predictions were attempted and tested, but did not produce a useful general
low-rate solution. Larger entropy groups remove some original padding and
amortize selectors; original 128-sample predictor restarts remain intact.

This is insufficient justification for a general multi-scheme entropy decoder
in the space-constrained firmware. Keep it as an exact offline experiment;
discard it as the primary strategy for reaching 1.0..1.75 bps.

## Transform and subband outcomes

| Family at approximately 1.5 bps | TownTheme RMSE | determined_pursuit_loop RMSE |
|---|---:|---:|
| Mixed prediction, 256 | **1.793** | **2.511** |
| Two-band lifting | 2.916 | 3.115 |
| Haar, eight-sample blocks | 5.688 | 4.590 |
| Haar, sixteen-sample blocks | 4.916 | 5.485 |

These are working independently decoded codecs, not theoretical estimates.
Two-band coding exhaustively searched high-band quantization scales after
beam-optimizing the low-band predictor. Haar searched two DC widths, all predictor
modes/scales, nine coefficient allocations, and nine exponents per frame, scoring
actual final PCM8 reconstruction error. The lossless lifting transforms were
separately verified exactly, so poor results are losses from these quantizers,
allocations and block structures, not a broken inverse transform.

On separately labeled **first-four-second excerpts**, coefficient-coordinate
refinement helped only modestly. TownTheme Haar8 at ~1.5 bps changed 6.141 → 6.132;
Haar16 changed 4.518 → 4.493. The other recording changed 3.382 → 3.335 and
4.295 → 4.236. Actual excerpt rates are in their own reports; some discrete plans
leave slightly different unused budgets. These excerpt points are excluded from
the complete-track plots. There was no reason to spend full-recording compute
polishing these clearly inferior settings.

The tested Haar codecs should be discarded for AVM implementation. Retain the
two-band codec as a low-rate, source-specific alternative, especially if a
1.0-bps asset is necessary. This does not rule out all future transform or
subband designs; it rejects the tested designs as the main AVM solution.

## Local quality and artifact diagnostics

Per-frame RMSE distributions use common 128-sample diagnostic windows for all
families. Each stream also has MAE, peak error, boundary excess error, final
clipping count, quiet-section error and an error PSD. Detailed JSON files retain
every window RMSE and spectral bin. Reconstructed WAVs have the exact common
sample count and contain only decoded PCM8 times 256.

At ~1.5 bps, p99 diagnostic-window RMSE was 2.953 / 3.869 for mixed prediction,
5.673 / 4.749 for two-band, 11.264 / 6.876 for Haar8, and 9.070 / 8.797 for Haar16.
The transform deficit is thus local as well as whole-track. At ~1.75 bps mixed
256's maximum absolute error was 19 / 29 PCM8 units, versus baseline 15 / 29.

The optional quiet-weight-4, boundary-weight-0.5 allocation reused the exact
128-sample candidate banks and unchanged decoder. At ~1.5 bps, quiet-section
RMSE improved 1.270 → 0.876 for TownTheme and 1.595 → 1.363 for the other track.
Whole-track RMSE changed 1.886 → 1.921 and 2.571 → 2.577. At ~1.75, quiet-section
RMSE improved 1.205 → 0.780 / 1.588 → 1.056. Boundary excess did not consistently
improve under this combined policy. Hard per-frame RMSE and peak limits are also
supported and tested; no full-track hard-limit improvement is claimed.

Quiet sections are reference windows with RMS <=8; this is different from the
old diagnostic mask of individual quiet samples near zero crossings. The
weighted policy improves that numerical local-quality measure, but an audible
preference has not been established.

Waveform/error overlays, common-scale spectrograms, error PSDs and RMS-rise
waveform closeups are generated for both recordings. Around strong reference
RMS rises, mixed ~1.5 bps had pre-window error RMSE 1.769 / 2.472; Haar8 had
10.701 / 6.276. These are numerical 32-sample windows, **not a perceptual pre-echo
measurement**. The plots expose block/time artifacts for listening assessment.
High-band output energy can increase because of quantization noise and block
transitions even when useful high-frequency information is lost. For example,
TownTheme's high-band power ratio was +6.78 dB for mixed ~1.5, +12.28 dB for
two-band, and +14.38 dB for Haar8; such extra energy is not proof of preserved
bandwidth. No subjective tonal/transient/speaker-quality ranking is invented.

## Decoder feasibility and ranking

All new formats stream through a 64-byte compressed ring without buffering an
entire encoded frame. Mixed and two-band codecs emit samples incrementally;
Haar reconstructs one small block. Tests cover every ring wrap alignment, partial
input chunks, code/header boundaries, unsupported modes, truncation and padding.
They verify parser correctness, not real FX refill scheduling or ISR deadlines.

The following are **unmeasured planning estimates**, not Python runtimes turned
into AVR cycles. Persistent state includes the previously documented 11-byte
shared counters/ring control, excludes the 64-byte ring, and excludes registers
that a real integration may need to save. Firmware estimates cover kernel and
framing, excluding FX-refill/integration glue and tables.

| Decoder | Persistent B | PCM/coefficient scratch B | Default tables B | Estimated kernel B | Estimated average cycles/output | Estimated synchronous burst cycles |
|---|---:|---:|---:|---:|---:|---:|
| Existing predictor | 16 | 0 | 16 | 200..400 | 28..58 | 35..75 |
| Mixed predictor | 17 | 0 | 16 | 240..480 | 26..60 | 35..80 |
| All entropy modes + predictor | 27 | 0 | 64 | 600..1100 | 35..85 | 65..150 |
| Two-band | 21 | 0 | 16 | 400..750 | 28..70 | 65..145 |
| Haar8 | 21 | 16 | 243 | 800..1600 | 40..90 | 320..900 |
| Haar16 | 21 | 32 | 243 | 800..1600 | 45..100 | 650..1800 |

The original predictor/mixed paths use signed 16-bit temporaries for extrapolation;
mixed adds only width/constant selection and a one-bit symbol mapping. Two-band
adds three inverse-lift operations per pair, high-code extraction, final clamps,
and one held odd sample; its temporary arithmetic is 16-bit. Haar's inverse has
7/15 pair-lifting nodes and 8/22 shuffled words per 8/16-output block. Signed
coefficient expansion uses shifts (up to eight), which can be costly on AVR.
There is no general multiplication/division in the proposed decoder algorithms.
The 243-byte Haar table figure includes both block lengths and all predefined
patterns. Specializing to only Haar8/Haar16 would reduce unpacked table storage
to approximately 90/180 bytes; packed patterns or unrolled shuffles trade code
for additional savings. These variants were not compiled or benchmarked.

Entropy Huffman/context symbols consume at most three bits, but grouped bitplanes
can consume seventeen bits before the first output in an eight-residual group.
Mixed needs at most two residual bits per output, plus a two-byte restart header.
Two-band needs at most four residual bits per pair and four header bytes at a
restart. Haar8/Haar16 need at most 20/36 coefficient/DC bits before a block,
plus three header bytes at a restart. Seed ticks parse headers instead of doing
ordinary prediction. Data-dependent branches, bit refills, clamp paths and table
loads must be included in a real kernel benchmark.

A Haar block can be decoded in the foreground, leaving a simple 2..6-cycle
estimated buffered-output action in the ISR, but this does not remove total CPU
work. Separate active PCM plus coefficient scratch uses 24 bytes for Haar8 or
48 for Haar16, beyond the preferred scratch range for the latter. Synchronous
Haar16 bursts can exceed the entire 1024-cycle output period. Scheduling work
across ticks would need a concrete buffer/state design; it is not assumed free.

At actual ~1.75 bps, FX bandwidth is about 3418 bytes/s, versus about 4151 for
the original candidate 3; ~1.5 needs about 2929 bytes/s. Those rates already
include all stored overhead. An offline seek index is not included: a 24-bit
offset per 256-output checkpoint would add 0.09375 bps, or 0.02344 per
1024-output entropy checkpoint. Without such an index, locating variable frames
requires scanning; entropy group lengths require parsing their codes. Once
positioned, every checkpoint restarts independently. No whole frame must fit
inside the 64-byte ring, and refills remain foreground work.

| Storage change relative to original candidate 3 | Saved bps | Extra estimated cycles/output |
|---|---:|---:|
| Best exact entropy, TownTheme / other track | 0.0475 / 0.0122 | roughly +5..20 for parsing, varying by selected scheme |
| Mixed at ~1.75 | 0.375 | roughly -2..+4 for width/constant dispatch and simpler one-bit symbols |
| Mixed ~1.75 → ~1.5 | another 0.25 | approximately unchanged kernel; more one-bit frames, higher error |
| Two-band at ~1.75 | 0.375 | roughly -10..+20; only half as many low predictors, but extra inverse/high-band work |
| Haar at ~1.75 | 0.375 | roughly +5..55 average plus the block bursts above |

These deltas are separate rough implementation comparisons, not measurements or
strict subtraction of independent worst-case ranges. Entropy adds comparatively
much work for very little storage. Mixed reduces storage largely by changing
offline choices, with nearly the same decoder. The current repository documents
only 688 bytes of firmware headroom; actual linked sizes and register pressure
are required before promising any design fits. None of these estimates certifies
the desired ~50-cycle target.

Ranked recommendations:

1. **Best tested quality at 1.5 and 1.75 bps: mixed prediction, 256-output frames.**
   Use ~1.75 as the first compromise setting; keep ~2.0 for fidelity and ~1.5 for
   tighter assets. Quality policy is entirely offline.
2. **Best new candidate for a roughly 50-cycle decoder: mixed prediction.** Its
   core is the existing simple predictor, and it needs no output scratch. An
   actual specialized AVR kernel must verify average and worst paths. The old
   elementary candidate 1 remains the minimum-complexity fallback, but has not
   achieved these lower rates in this experiment.
3. **Best tested ~1.0-bps exception: two-band on determined_pursuit_loop.** Retain
   only if that low-rate storage need outweighs its quality/complexity tradeoff.
4. **Discard general entropy wrapping and these Haar codecs as primary firmware
   targets.** The former saves too little; the latter have worse fidelity,
   larger tables/code/scratch and more dangerous bursts. All experimental code
   and negative results remain available.

## Artifacts and validation

Each recording's `build/audio-codec-results/<recording>/below2/` contains:

- `comparison.html`, with complete listening files and plots.
- `metrics.json` / `metrics.csv`, with 57 measured points including two preserved
  baseline comparisons and 55 new full-length streams per recording.
- `best_at_budget.json`, exact measured winners at the five requested budgets.
- `rate_distortion.png`, using only actual measured points; connected lines make
  no claim about untested rates.
- Error spectra, waveform/error overlays, spectrograms and RMS-rise closeups.
- Residual statistics, per-stream local/spectral details, compressed streams,
  and cached candidates. Excerpt effort tests have their own directories/hashes.

All lossy selected streams agree exactly with their encoder simulations; entropy
streams agree exactly with the old candidate-3 PCM8. Standalone decode subprocesses
require only the compressed input. The full 471-test AVM regression target,
including 41 native audio cases and existing asset tests, passed with the existing
RelWithDebInfo/MSVC configuration. The Python harness and existing score tests
also pass; exact commands are in the implementation guide. No AVR kernels were
implemented or benchmarked, and no subjective listening claims are made.
The final Python run passed 588 tests: 565 harness tests plus 23 existing score
compiler tests. Ruff lint and formatting checks passed.
