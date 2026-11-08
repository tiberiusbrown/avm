# Exact compressed formats and reconstruction

This describes the withdrawn implementation captured in this directory.
The wire format is independent of the native PWM output mechanism.

## Numeric conventions

- Output rate: exactly 15,625 samples/s; signed PCM8 range `[-128,127]`.
- Frame length: at most 256 output samples, including its seed.
- Signed byte values are two's complement. Multibyte fields are little endian.
- Residual symbols are packed least-significant bit first.
- Predictor/residual calculations use signed 16-bit intermediates.
- Half slopes round toward negative infinity, including negative odd slopes.
- Clamp once, after adding the residual, before updating reconstructed history.
- The scale table is fixed in firmware:
  `1,2,3,4,5,6,8,10,12,15,18,22,26,31,36,42`.

## AVAX evaluation container

The archived assets use AVAX v1, codec 6. Its common header is Python struct
`<4sBBBBHII`, followed by the scale table:

| Offset | Size | Value for native-compatible assets |
|---:|---:|---|
| 0 | 4 | ASCII `AVAX` |
| 4 | 1 | Version 1 |
| 5 | 1 | Codec 6: mixed predictive |
| 6 | 1 | Flags 0 |
| 7 | 1 | Scale count 16 |
| 8 | 2 | Frame size 256 |
| 10 | 4 | Original output sample count |
| 14 | 4 | Rate 15,625 |
| 18 | 16 | Canonical scale table above |
| 34 | remainder | Byte-aligned mixed frames |

The generic host harness supports other AVAX codecs and frame sizes. The
native packer deliberately accepts only this exact codec/frame/rate/table
combination. It validates complete payload length and zero padding by decoding
every frame before producing a runtime asset.

## AVM1 native container

The native player takes a packed 24-bit program-space pointer to this header:

| Offset | Size | Meaning |
|---:|---:|---|
| 0 | 4 | ASCII `AVM1` |
| 4 | 3 | Nonzero compressed **payload** byte length, uint24 |
| 7 | 1 | Bit 0 loops; all other bits zero |
| 8 | 4 | Nonzero output sample count, uint32 |
| 12 | declared length | Unchanged AVAX frame payload |

The rate, frame size and scales are implicit constants. Sample counts use
32 bits because both recordings exceed 65,535 samples; code addresses and
compressed-byte lengths remain 24 bits. The encoded file is 22 bytes smaller
than AVAX. There is no additional lossy conversion and no checksum.

Generated C/C++ objects use byte-aligned `uint64_t` fields, split into chunks
of at most 65,528 bytes. Internal boundaries add no padding; the last word
can add up to seven ignored zero bytes after the native container. Those
storage bytes are outside the declared payload and are not read by the player.

## Independent frame

Each frame begins with a signed seed byte, then a parameter byte `p`:

| Bits | Meaning |
|---|---|
| 7..6 | Width 0=hold, 1=one-bit, 2=two-bit, 3=invalid |
| 5..4 | Predictor 0=previous, 1=linear, 2=half slope, 3=invalid |
| 3..0 | Scale index 0..15 |

Hold requires the **entire** parameter byte to be zero. It repeats the seed
for the whole frame and has no residual bytes. Predictive frames emit the
seed once, set `previous = older = seed`, then decode `count - 1` symbols:

| Symbol | One-bit residual | Two-bit residual |
|---:|---:|---:|
| 0 | `-S` | `-3*S` |
| 1 | `+S` | `-S` |
| 2 | invalid | `+S` |
| 3 | invalid | `+3*S` |

The native one-bit path maps 0/1 onto common two-bit symbols 1/2, sharing
the predictor and residual arithmetic.

```text
prediction = previous
if predictor == 1:
    prediction += previous - older
if predictor == 2:
    prediction += floor((previous - older) / 2)
sample = clamp(prediction + residual, -128, 127)
older = previous
previous = sample
emit sample
```

Do not clamp the prediction before adding the residual. Do not use source
PCM history. Gain and PWM bias are applied after reconstruction and never
fed back into the predictor.

For `previous=-2`, `older=1`, predictor 2 and residual `+1`, the slope is -3,
half slope is -2, and the result is -3. Truncation toward zero would incorrectly
produce -2. For `previous=127`, `older=-128`, predictor 1 and residual -126,
the unclamped prediction is 382 and the final result is 127; clamping prediction
first would incorrectly produce 1.

## Packed examples and boundaries

`S=1`, predictor 0, seed 0, width 1, symbols 1,0,1 produces signed samples
`0,1,0,1`. The three low bits are `101`, so the frame is `00 40 05` when
the declared track contains exactly four samples. Unused high bits are zero.

With the same seed/predictor/scale, width 2, symbols 0,1,2,3 pack into `E4`
and produce `0,-3,-4,-3,0`: frame `00 80 E4` for five declared samples.

A frame occupies `2 + ceil((count - 1) * width / 8)` bytes. A full 256-sample
hold/one-bit/two-bit frame therefore uses 2/34/66 bytes, respectively. Its
per-frame rates are 0.0625/1.0625/2.0625 bits/sample before container overhead.
“1.75 bps” and “1.25 bps” are global allocation targets, not residual widths.

Track sample count determines the short final frame. Each frame begins at
the next byte after its residual payload; unused bits of the last byte must
be zero. The native countdown is 255 after a full-frame seed, decremented
once per residual output. A separate uint32 counter ends a partial frame at
the exact track sample count. On loop, that counter reloads and the next
sample is a new frame seed; no predictor history carries across the boundary.

## Validation and corruption limits

The host packer rejects unsupported headers/tables, zero native count/length,
invalid parameters, truncated frames, nonzero padding and trailing payload.
The native reader rejects bad magic/flags/zero fields and invalid frame
parameters, and stops on nonzero padding encountered at the next frame.
It cannot validate the physical size of a caller-supplied program-memory
object independently of its header. It trusts a valid pointer and truthful
length, as other program-memory APIs do. Valid-symbol bit corruption is not
detectable. Underrun is handled separately as a recoverable lack of buffered
data; it does not fabricate symbols or advance reconstruction.
