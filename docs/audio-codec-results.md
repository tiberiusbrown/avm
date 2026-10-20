# Supplied-recording codec results

Both complete recordings in Downloads were encoded, serialized, independently
decoded, and measured. No firmware or interpreter code was changed. The
[harness guide](audio-codecs.md) documents commands, formats, arithmetic and AVR
cost estimates. Listening assets and complete JSON/CSV reports are under
`build/audio-codec-results/`; these large generated files are intentionally ignored
by Git. Open each recording's `comparison.html` for all listening players.

## Complete recordings, 128-output-sample frames

TownTheme.mp3 produced 1,522,719 common PCM8 samples, 97.454016 seconds.
determined_pursuit_loop.wav produced 1,687,500 samples, exactly 108 seconds.
Both inputs are stereo 44,100 Hz, downmixed and FIR-resampled without
normalization. All playback WAVs are mono 15,625 Hz PCM16 containing only the
decoded PCM8 values times 256. No track was truncated for these primary results.

Every codec stores **404,508 bytes** for TownTheme and **448,277 bytes** for
determined_pursuit_loop, including file header, step table, seeds, parameters,
and padding. That is approximately **2.1252 bits/output sample**, or **3.764:1**
versus common eight-bit PCM. The two ADPCM upsamplers share one compressed file.

| Codec, width-16 beam encoder | TownTheme RMSE | TownTheme SNR dB | determined_pursuit_loop RMSE | determined_pursuit_loop SNR dB |
|---|---:|---:|---:|---:|
| 1: symmetric DPCM | 1.893 | 18.82 | 2.004 | 19.64 |
| 2: group-adaptive zero-aware DPCM | 1.990 | 18.38 | 2.759 | 16.86 |
| 3: block-selected predictor DPCM | **1.148** | **23.16** | **1.765** | **20.74** |
| 4: half-rate ADPCM, hold | 4.189 | 11.92 | 4.015 | 13.61 |
| 4: half-rate ADPCM, linear | 1.625 | 20.15 | 2.647 | 17.22 |

RMSE is in signed PCM8 units against the common full-rate reference, not the
higher-precision original or the reduced-bandwidth input. Candidate 3 wins the
objective comparison on both recordings. No subjective listening test or
Arduboy speaker listening was performed; a subjective winner remains unassigned.

## Encoder effort without decoder changes

| Codec | TownTheme greedy → beam16 RMSE | RMSE reduction | determined_pursuit_loop greedy → beam16 RMSE | RMSE reduction |
|---|---:|---:|---:|---:|
| 1 | 2.023 → 1.893 | 6.40% | 2.228 → 2.004 | 10.06% |
| 2 | 3.817 → 1.990 | 47.86% | 4.671 → 2.759 | 40.92% |
| 3 | 1.423 → 1.148 | 19.30% | 2.155 → 1.765 | 18.07% |
| 4, linear output | 2.443 → 1.625 | 33.48% | 3.307 → 2.647 | 19.98% |

Search has a substantial benefit at identical stored size and decoder behavior.
Full-track beam16 encode times were about 22/25 seconds for codec 1, 41/46 for
codec 2, 93/104 for codec 3, and 60/69 for codec 4 on this host. Greedy encoders
took about 1..3 seconds each. These measurements were taken with simultaneous
track evaluations and include any cold-cache compilation; they are not controlled
host benchmarks and say nothing about AVR cycles.

Additional widths 16,64,256 and exact codec-1 DP were compared on **30..31 seconds
only**, separately for each recording. Codec 1's width-16 RMSE already matched
exact DP: 1.553649 / 2.195136. Codec 3 improved only slightly from width 16 to
256: 1.015275 → 1.013003 / 1.951262 → 1.923414. Codec 2 benefited more:
1.803854 → 1.351621 / 3.157325 → 2.559350. This supports width 16 as a practical
default for the predictor codec, with wider searches available for difficult
adaptive states. Width increases are not a universal monotonic guarantee for
finite beams, and full-rate ADPCM error can differ from its optimized native
half-rate objective.

## Frame size and discontinuities

These sweeps use **30..34 seconds only**, with width-16 beam search. Numbers
below describe these excerpts, not a second complete-track run.

| Output frame size | Nominal stored bits/sample before file/final-frame overhead | Codec 3 TownTheme RMSE | Codec 3 determined_pursuit_loop RMSE |
|---|---:|---:|---:|
| 32 | 2.5000 | 0.925 | 1.768 |
| 64 | 2.2500 | 0.953 | 1.831 |
| 128 | 2.1250 | 0.971 | 1.864 |
| 256 | 2.0625 | 0.984 | 1.884 |

Shorter frames buy more exact seeds and local scale/predictor selection. Moving
128 → 256 reduces nominal bitrate by about 2.94% and increased codec-3 RMSE by
only about 1.3% / 1.1% on these excerpts. A 256-output frame has 66 stored bytes,
but the streaming decoder never needs the whole frame in its 64-byte ring.

For complete tracks, codec-3 beam16 boundary excess RMSE was 1.031 / 1.548,
versus 1.435 / 2.190 with greedy encoding. A weight-0.1 boundary-jump penalty on
the four-second excerpts changed boundary excess RMSE 0.8481 → 0.8469 for
TownTheme and 1.7356 → 1.7462 for determined_pursuit_loop. It produced no consistent
benefit, so the default remains zero. This penalty targets jump magnitude,
whereas the reported excess compares each jump with the source transient.
Listening is needed to assess clicks, tonal distortion, noise and transients.

## Adaptive scales and predictor selection

At width 16, codec 2's four-residual adaptation did not beat fixed-scale codec 1
on either complete recording. Exact zero does preserve synthetic silence and
constants. On TownTheme's local quiet-sample mask (|reference| <=8), codec 2
slightly improved RMSE over codec 1: 1.501 versus 1.596. On the other track it
was worse: 2.455 versus 1.864. Individual zero-valued samples inside music are
not equivalent to sustained silence. The results do not establish that the
direction-dependent large code is worth its additional state; no ablation
isolating direction alone was performed.

The secondary **per-sample** rule is more promising on 30..34-second excerpts:
codec-2 RMSE improved from 1.573 to 1.163 for TownTheme and from 2.948 to 2.065
for determined_pursuit_loop, at the same bitrate. Codec 3 still won those
excerpts at 0.971 / 1.864. Per-sample adaptation was not run on the complete tracks.

Codec 3's complete-track beam16 predictor selections were:

| Recording | Previous | Linear | Half slope |
|---|---:|---:|---:|
| TownTheme | 0 | 4,718 (39.7%) | 7,179 (60.3%) |
| determined_pursuit_loop | 808 (6.1%) | 166 (1.3%) | 12,210 (92.6%) |

Its additional predictors reduced RMSE versus codec 1 by about 39.4% / 11.9%.
Half slope is the most frequently selected predictor, but linear extrapolation
is useful on a substantial portion of TownTheme. Retain all modes for quality
testing before deciding whether firmware size justifies removing a mode.

## Half-rate tradeoff and recommendation

Linear interpolation substantially outperformed hold objectively. Against the
common reference, bandwidth-only linear output already had RMSE 1.097 / 2.411.
ADPCM's extra error against that bandwidth-only output was 1.156 / 1.014; final
full-reference RMSE was 1.625 / 2.647. These errors are correlated and do not add
as independent MSE terms. The stronger bandwidth loss on determined_pursuit_loop
limits the half-rate option even when quantization is good. On TownTheme,
half-rate linear ADPCM beat codec 1 but remained behind codec 3. On the other
track it was worse than codecs 1 and 3. Subjective preference on the small speaker
is still an open listening question.

**Recommend candidate 3 with offline beam search for the next native AVR
prototype**, using 128-output frames initially and evaluating 256 when storage
is tighter. It has the best measured quality here and needs only one additional
history byte plus predictor mode relative to the elementary baseline. Candidate 1
is the minimum-complexity fallback and is likely to use the fewest cycles.
The [cost assessment](audio-codecs.md#avr-cost-assessment-estimates-no-native-kernel-measured)
estimates roughly 18..35 cycles/output for codec 1 and 28..58 for the extrapolating
codec-3 modes. Those are unmeasured planning ranges; codec 3's half-slope path
may exceed the desired 50-cycle target. Profile an actual kernel and register
pressure before integrating it with the 186..193-cycle synthesis ISR.

## Validation and reproducibility

All **234 harness tests passed**, and Ruff lint/format checks passed. Every
complete-track WAV was rechecked against the final independent streaming decoder.
Both best streams were also decoded by separate CLI processes with only `.avac`
input; resulting WAV SHA-256 hashes match the listening aliases exactly. Byte
accounting includes all framing and padding. No AVR cycle measurements or hardware
listening results are claimed.

Input SHA-256 hashes:

- TownTheme.mp3: `2657861d5107d4a3c01ef81cb6a4d61ddd5e7a054b6da57e658373d79d0c3466`
- determined_pursuit_loop.wav: `e4f3be098b50213b56a60aefe60fffae79cd9f7c9008088f93c187ef1bbc856b`

See each recording's `input.json` for reference hashes, decoder version, source
frame count and exact preprocessing settings.

The experiment directories record actual parameter sets and machine-readable
measurements for all widths, frame sizes, adaptation, exact DP and boundary
penalty runs. Reproduction commands for the full recordings and sweep examples
are in the [harness guide](audio-codecs.md#installation-and-use).
