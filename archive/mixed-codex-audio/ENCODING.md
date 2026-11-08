# Encoder, quality and exact assets

The preceding host harness lives in `tools/avm_audio/`; its relevant source
and tests are also embedded under `root/tools/` in `implementation.zip`.
This document records the selected mixed-codec path, not a new codec search.

## Source preparation

The user supplied `TownTheme.mp3` and `determined_pursuit_loop.wav` in Downloads.
Both were stereo 44.1 kHz. The shared experiment reference was mono, resampled
with the harness's FIR path to 15,625 Hz, quantized to signed PCM8, with **no
normalization**. PCM16 listening WAV samples were the signed PCM8 values
multiplied by 256. Source, reference and decoded-sample hashes are preserved
in the asset manifest, bank configuration and metrics, respectively.

The raw source files and common reference WAVs are not embedded here. The
final encoded streams are embedded and independently decodable without them.
Reference WAVs and the original experiment outputs remain in the ignored
`build/audio-codec-results/<recording>/` directories if retained locally.

## Candidate search

For each independent 256-sample frame the encoder constructed three choices:

- Hold: repeat a stored rounded frame mean, potentially different from the
  source's first sample. This is an explicitly lossy choice.
- One-bit: search all three predictors and 16 canonical steps using binary
  residuals with reconstructed, clamped history.
- Two-bit: the successful candidate-3 predictor and symmetric residual
  quantizer, searched with the same history conventions.

Beam width 16 was used. Greedy fallback prevented a retained beam result from
being worse than the corresponding greedy objective. Deterministic tie rules
and duplicate-history pruning made repeat runs reproducible under the same
implementation and inputs. The scale/predictor choice is fixed per frame;
history does not cross frame boundaries. The seed is a direct output sample.

The two-bit bank for frame size 256 required its own optimization; the earlier
candidate-3 128-sample stream is not a drop-in bank for it. Compatible explicit
baselines are reused as encoded. Cache version 2 keys include reference hash,
frame length, beam width, scale table and supplied baseline-stream hash.
The two archived `bank-config.json` files preserve those exact inputs.

## Global rate allocation

The allocator measures actual serialized bytes for each candidate, including
seed, parameter, final residual padding and the file header. It binary-searches
a Lagrangian multiplier for `total squared error + lambda * total bits`.
Each multiplier is solved exactly over the generated candidate pool. Boundary
coupling, when requested, is handled by Viterbi transitions between adjacent
choices. Discrete choices can leave budget unused; this is not a guarantee of
globally optimal constrained-knapsack allocation or an exact requested bitrate.

For the selected streams, quiet weight was 1, quiet threshold 8, boundary
weight 0, and no hard frame-RMSE or peak-error limits were applied. The objective
was whole-track PCM8 squared error. Lambda was 3.59765625 for TownTheme and
14.24609375 for pursuit. This objective is not a physical piezo or perceptual
speaker model. Optional quiet weighting, boundary penalties and quality limits
change allocation only; the decoder remains identical.

## Selected measured points

| Property | TownTheme | determined_pursuit_loop |
|---|---:|---:|
| Target stored bits/sample | 1.75 | 1.25 |
| Samples / duration | 1,522,719 / 97.454016 s | 1,687,500 / 108 s |
| AVAX bytes | 333,052 | 263,644 |
| Actual AVAX bits/sample | 1.7497752376 | 1.2498678519 |
| AVM1 bytes | 333,030 | 263,622 |
| Actual AVM1 bits/sample | 1.7496596549 | 1.2497635556 |
| RMSE / MAE, PCM8 units | 1.390019 / 1.028117 | 3.030333 / 2.289752 |
| SNR | 21.501814 dB | 16.049446 dB |
| Maximum absolute error | 19 | 37 |
| Hold / one-bit / two-bit frames | 22 / 1,819 / 4,108 | 0 / 5,358 / 1,234 |
| Saturated / endpoint reconstructed samples | 0 / 0 | 0 / 0 |
| Shared candidate-bank search time | 159.107 s | 175.891 s |
| Per-target allocation/serialization time | 0.170 s | 0.141 s |

These times are observations on the original host, not portable performance
guarantees. The shorter per-target time excludes the shared beam search.
Raw source, AVAX and decoded signed PCM8 SHA-256 values are in
[assets/manifest.json](assets/manifest.json) and the per-track metrics.
The `verify_archive.py` script checks all archived decoded PCM hashes.

Native packaging copies `AVAX[34:]` byte-for-byte after a 12-byte AVM1 header.
The 22-byte reduction is container overhead only and adds no reconstruction
loss. C/C++ storage adds two ignored alignment-tail bytes per selected track;
the native container sizes above exclude those bytes and game titles/catalog.

## Reproduction

To inspect final audio without restoring the runtime, use the retained host
decoder against the archived assets:

```powershell
python tools/avm_audio_codec_test.py decode docs/mixed-codex-audio/assets/TownTheme.avax build/mixed-archive/TownTheme.wav
python tools/avm_audio_codec_test.py decode docs/mixed-codex-audio/assets/determined_pursuit_loop.avax build/mixed-archive/determined_pursuit_loop.wav
```

Create the destination directory first if needed. The decoder does not need
source audio. To recreate native containers or a C header using only the
standard library:

```powershell
python docs/mixed-codex-audio/reference/avm_audio_pack.py docs/mixed-codex-audio/assets/TownTheme.avax build/TownTheme.avm --loop
python docs/mixed-codex-audio/reference/avm_audio_pack.py docs/mixed-codex-audio/assets/determined_pursuit_loop.avax build/pursuit.h --loop --name pursuit
```

These commands create files only; they do not re-enable playback in AVM.
For a new optimization run, install `tools/requirements-audio-codecs.txt`,
prepare the same reference and use:

```powershell
python tools/avm_audio_codec_test.py mixed build/audio-codec-results/TownTheme/reference_8bit_15625.wav --baseline build/audio-codec-results/TownTheme/candidate3_predictor_dpcm_f128_beam16.avac --output-dir build/mixed-reencode/TownTheme --block-sizes 256 --beam-width 16 --targets 1.75
python tools/avm_audio_codec_test.py mixed build/audio-codec-results/determined_pursuit_loop/reference_8bit_15625.wav --baseline build/audio-codec-results/determined_pursuit_loop/candidate3_predictor_dpcm_f128_beam16.avac --output-dir build/mixed-reencode/pursuit --block-sizes 256 --beam-width 16 --targets 1.25
```

Match source/reference/baseline hashes to the archived configurations before
expecting byte-identical output. Omit `--baseline` to deliberately re-optimize
both widths; use `--candidate-cache-dir` only with matching cache identities.
The exact final streams here remain the authoritative reproduction artifacts.
