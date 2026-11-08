# Native AVR runtime architecture

The source of record is the `root/interp/interp.asm` entry in
[implementation.zip](implementation.zip). [avr_audio.asm](reference/avr_audio.asm)
contains inspectable excerpts. It depends on interpreter macros/register
definitions and is not a standalone assembly module.

## Dataflow and scheduling

```text
AVM1 asset on FX
  -> foreground, interruptible reads of <=32 compressed bytes
  -> 64-byte compressed ring
  -> Timer1: output held PWM value, decode one successor sample
  -> signed sample * volume/128, clamp, add 128 bias
  -> held PWM value for next Timer1 interrupt
```

Only foreground code touches SPI. The existing interpreter restart hook
checks `data_audio_ticks_pending`; when nonzero it calls `audio_service_func`
with FX deselected, then resumes bytecode fetch at the original guest PC.
The idle wakeup path uses the same service and preserves its explicit
guest-PC increment. No guest update calls or guest RAM buffers are needed.
The historically named pending byte is a refill request, not elapsed musical
time. Timer0 no longer increments the old four-millisecond sequencer tick.

### Producer

`audio_service_func` clears the pending request, saves native r16..r23, and
calls `audio_refill` when the track is playing or paused. It preserves the
guest register file, PC, Y/guest stack pointer and GPIOR0 guest flags.
The shared FX byte reader may clobber r0:r1, r24:r27 and Z under its existing
interpreter scratch-register contract.

Read and write heads are independent uint8 counters. Available bytes are
`uint8(write - read)`, always at most 64. A head's physical ring index is
`head & 63`, so counter overflow and physical wrap need no multi-byte atomic
operation. The producer computes free space from a snapshot of the consumer
head. The ISR can only free additional space while that read is in progress.

Each chunk is bounded by free capacity, 32 bytes, the physical ring end,
and remaining declared payload bytes. Cursor/count updates use uint24 carry
chains; source addresses are image-relative and the shared reader adds the
selected FX image page. The producer publishes its new write head only after
the chunk has arrived. The ISR never sees partially written bytes. SPI reads
remain interruptible and use the existing timed SPI handoff implementation.

When payload bytes reach zero, a looping producer restores its payload start
and length and can prefetch the next iteration immediately. A one-shot
producer stops reading. Small loops may be copied into the ring repeatedly;
the empty-track guard prevents an infinite zero-byte refill. The native
container's explicit length prevents speculative reads past the payload.

### Consumer

Timer1 saves interrupted registers and SREG, clears TC4H, writes the held
sample to OCR4A at fixed latency, then prepares exactly one next sample.
It checks status, reloads the output counter for a loop when necessary,
requests refill when availability is <=32 bytes, and either:

1. consumes a two-byte frame header and emits its seed;
2. repeats a hold value;
3. consumes a buffered residual symbol, reconstructs one sample and updates history;
4. emits silence without advancing if a required compressed byte is unavailable.

A new frame header requires two available bytes before either is consumed.
A residual-byte refill requires one. Symbols never span a packed byte for
widths 1 or 2, and `audio_pop` is called only after this availability check.
The bit register shifts right; residual width determines whether one or two
bits are consumed. The final track sample counter is distinct from the
frame countdown, which permits partial final frames.

At an underrun, output becomes neutral 128, histories/bit position/sample
count freeze, and an 8-bit saturating diagnostic counter increments. The
request remains pending, so later foreground service can recover. A bad
frame stops playback. Pause also emits silence while freezing the decoder;
prefetched compressed data remains valid. Stop cannot be undone by resume.

The ISR saves r0:r1, r20:r27, Z and SREG. It does not assume the interpreter's
usual zero register r2 is zero: native libm can borrow it while interrupted.
It preserves GPIOR0 and the guest stack pointer. ISR body work is bounded;
there is no frame-sized decode loop, decoded PCM queue, SPI operation or
dynamic allocation in the interrupt.

## Persistent SRAM: 99 bytes

The state starts at `0x0A15`; all compact state/ring pointers fit one page.

| Offset | Size | Field / owner |
|---:|---:|---|
| 0 | 1 | Pending refill request, foreground/ISR |
| 1 | 1 | Volume, foreground |
| 2 | 1 | Status: 0 stopped, 1 playing, 2 paused |
| 3 | 1 | Native loop flag |
| 4 | 1 | Read head, ISR |
| 5 | 1 | Write head, producer |
| 6 | 3 | Next FX cursor, producer |
| 9 | 3 | Payload loop start |
| 12 | 3 | Remaining compressed bytes in this producer iteration |
| 15 | 3 | Total compressed payload length |
| 18 | 4 | Remaining output samples, ISR |
| 22 | 4 | Total output sample count |
| 26 | 1 | Residual outputs left in current frame |
| 27 | 1 | Frame parameter |
| 28 | 1 | Current step value |
| 29 | 1 | Previous reconstructed sample |
| 30 | 1 | Older reconstructed sample |
| 31 | 1 | Shifted compressed byte |
| 32 | 1 | Remaining bits in that byte |
| 33 | 1 | Held biased PWM sample |
| 34 | 1 | Saturating underrun diagnostic |
| 35 | 64 | Compressed ring |

The next private address is `0x0A78`. A temporary 12-byte AVM1 header aliases
the existing nonreentrant foreground formatter/text workspace; it is not
persistent and is never shared with an executing formatter. That workspace
ends at `0x0AC0` exclusive, leaving 64 bytes to the top of native SRAM/stack.
Observed minimum stack pointers were `0xAD5` for the animated demo and
`0xAD1` for the libm/formatter workload, respectively 21 and 17 bytes clear
of the workspace end. These observations are workload bounds, not a general
proof for arbitrary future SYS call stacks.

## Gain and speaker output

Gain is applied to the reconstructed signed sample as
`clamp(floor(sample * volume / 128), -128, 127)`, then biased by +128.
Default volume 128 is unity; 0 mutes while advancing music, 255 nearly doubles
amplitude. This differs from the previous synthesizer's 32=unity convention.
The assembly uses MULSU, overflow detection on the signed product high byte,
and a shift/carry for the floor conversion. It saturates the output only;
the predictor always retains the unscaled decoded signed PCM8 sample.

Timer1 CTC uses prescaler 8 and OCR1A=127: 16 MHz / 8 / 128 = 15,625 Hz,
or 1,024 CPU cycles per sample. Timer0 retains a separate millisecond clock.
The existing `audio_timer1_start` phase alignment to Timer0 was retained;
the shared prescaler is not reset. Timer4 retains the existing 64 MHz clock,
TOP=255 and 250 kHz carrier with differential PWM on PC6/PC7. TC4H is cleared
before each 8-bit duty write. The held value is written 14 cycles after ISR
body entry, 21 cycles after the compare at the ideal seven-cycle entry baseline.
No output smoothing, physical-speaker equalization or extra reconstruction
filter was introduced.

## Historical ABI and command behavior

SYS `0x38` takes the command in low8(r7). PLAY uses q2[23:0], volume uses
low8(r4), and STATUS returns a zero-extended value in r4. Other guest inputs
and flags are preserved. The guest wrappers are leaf functions with zero
guest stack allocation and the usual stack-size metadata.

| Command | Operation |
|---:|---|
| 0 | Play AVM1, replace current track and enable output |
| 2 | Stop music; retain enabled silent output |
| 3 / 4 | Pause / resume |
| 5 / 11 | Set common music volume |
| 6 | Enable silent output without restarting stopped music |
| 7 | Stop and disable Timer1/Timer4 output; neutralize speaker ports |
| 9 | Return 0 stopped, 1 playing, 2 paused |
| 1,8,10,12,13 | Reserved/ignored after SFX, tone and rate removal |

PLAY first sets stopped status so the ISR cannot consume partially installed
state. It validates/copies header fields, resets heads/history framing, fills
the ring, publishes playing status, then enables output. This is single-stream
music; there is no mixing, SFX ownership, tone API or legacy score compatibility.
The RPG explicitly selected volume 128 and set the native asset's loop flag.
