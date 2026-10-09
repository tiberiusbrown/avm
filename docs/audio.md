# Hardware PWM audio

AVM synthesizes three square voices and one noise voice using Timer3 COMPA.
Timer4 produces differential PWM on PC6/PC7. The ISR only reads the current
12-byte control latch; song decoding, timing, and FX reads run synchronously
when the interpreter restarts its instruction stream. No guest update call
and no queue of future samples or channel states are required.

All native implementation and SRAM definitions are in `interp/interp.asm`.

## Guest API and demo

Include `<avm/audio.h>` or `<avm.h>`. `avm_audio_play(ptr, byte_size)` starts a
bounded program-space song and enables output. `avm_audio_sfx(ptr, byte_size)`
starts one effect, replacing the preceding effect. Both pointers are packed
24-bit AVM program pointers. Use `sizeof(array)` for generated C assets.

`avm_audio_stop`, `avm_audio_pause`, `avm_audio_resume`, `avm_audio_volume`,
`avm_audio_stop_sfx`, `avm_audio_enable`, and `avm_audio_disable` provide controls.
Master music volume is 0..32 (32 is unity, larger values clamp); individual
channel volumes are 0..31. Pause freezes the music countdown and mutes music;
SFX keeps running. Stop mutes music, leaving SFX intact. Disable stops both
streams and both timers and leaves the speaker outputs low. PLL stays enabled.
Stop/end leaves the timers running at neutral duty; disable removes the sample
ISR overhead when output is no longer needed.

`avm_audio_tone(channel, MIDI_note, amplitude)` replaces the effect with one
latched voice until `avm_audio_stop_sfx`. Channels 0..2 are square, 3 is noise.
Valid channel/amplitude arguments are 0..3/0..31; these fields are masked to
their respective widths. MIDI outside 24..95 mutes the selected voice.
`avm_audio_status()` returns bit 0=music playing, bit 1=music paused, bit 2=SFX
playing (including a direct tone). Play also enables output automatically.

Effects own the channels declared in their header, including during their
rests. Music continues progressing beneath those channels. End/stop of SFX
releases ownership and restores the music's **current** state in the same
atomic commit. There is one effect stream; no allocator or ISR arbitration.

```c
avm_audio_play(music, sizeof(music));
// Draw, run gameplay, or idle. Playback advances automatically.
avm_audio_sfx(effect, sizeof(effect));
```

Build `avm_audio_demo` with CMake, configuration `RelWithDebInfo`.
The package is `projects/audio_demo/audio_demo.arduboy`; the development image
is `projects/audio_demo/build/audio_demo.bin`. It renders
two moving rectangles at 60 Hz. A triggers a two-channel effect; B toggles
pause. Its generated audio headers are checked in alongside the JSON sources;
`audio_demo_assets` regenerates them before a rebuild. The directory also
supports standalone CMake builds with an installed SDK; see its
[README](../projects/audio_demo/README.md). There is no update call in
`setup`/`loop`. Firmware is `interp/build/interp.hex`.

## Binary format (version A2)

Assets are at most 65535 bytes. Header byte 0 is `A2`; byte 1 is a nonzero
four-bit ownership mask. Channels 0..2 are tonal, 3 is noise. At start, all
notes are off and each retained channel volume is 24.

Each event starts with `delta, change_mask`. The single delta byte encodes
**byte value + 1 ticks**, each 4 ms: `00` waits one tick and `FF` waits 256
ticks. There is no extended form or zero-time event. Playback starts silent
and waits for the first event, so the earliest note begins after 4 ms.

| Change-mask bits | Meaning |
| --- | --- |
| 0..3 | Note changes for channels 0..3 |
| 4..7 | Volume changes for channels 0..3 |

A nonzero change mask is followed by all selected notes in ascending channel
order, then all selected volumes in ascending channel order. Notes are MIDI
24..95 (`18..5F`) or `80` for off; other note values are malformed. Volumes
are raw 0..31 bytes; larger values are malformed. For example, mask `11`
followed by `3C 07` sets channel 0 to MIDI 60 at amplitude 7 in one event.
Mask `88` updates both the noise note/rate and volume. All 255 nonzero masks
are available; there are no update-command opcodes.

A zero change mask is followed by one control byte:

| Record | Meaning |
| --- | --- |
| `delta, 00, 00` | Continue: consume time, preserving channel state and phase |
| `delta, 00, 01` | End playback |
| `delta, 00, 02` | Loop to the first delta after the header |

Other control bytes and changes outside the ownership mask are malformed.
An exhausted asset or malformed record stops that stream and releases its
effect ownership. Every record consumes at least one tick, including Continue
and Loop. At most 255 elapsed ticks are handled per snapshot, so each stream
can process at most 255 records without a separate event or zero-time-loop budget.

Note changes retrigger phase and retain volume when no volume bit is present.
Volume-only changes retain the note and preserve phase. All due updates are
applied to desired state before the complete latch is committed atomically.
Looping retains note/volume state. Put explicit initial values in a loop if
it must reset them on every iteration. Longer waits use Continue records;
the maximum wait in one record is 1.024 seconds. A 600-tick wait uses two
`FF 00 00` Continue records followed by the actual event with delta `57`
(88 ticks). Continue does not require a latch commit.

The three tonal waveforms use fixed 50% duty; noise is restricted to channel 3.
Bass and lead register choices come from note selection. Envelopes use
sequencer-rate volume events with no per-sample envelope/DSP cost.
A1 assets are rejected and must be regenerated with the current compiler.

The caller supplies a valid FX/image-relative pointer and byte size. The
decoder bounds reads to that size, including the last partial cache refill.
It cannot validate a caller's size against an image length, which the current
interpreter does not retain. Physical addressing uses the same modulo-24-bit
image-page addition as F0 program loads.

## Asset compiler

`tools/avm_music.py` uses Python's standard library only:

```sh
python tools/avm_music.py projects/audio_demo/music.json song.bin
python tools/avm_music.py projects/audio_demo/music.json song.h --name music
```

SDK installation also places `avm_music.py` in its `bin` directory.

JSON fields: `mask` (default 15), `row_ticks` (default 1), `loop` (default
false), `end_delta` (default 1), and `events`. Each event has `delta` (rows,
default 1), optional new `row_ticks`, and `channels`, keyed by channel number.
`delta`, `end_delta`, and `row_ticks` are positive integers. JSON deltas are
actual row counts; the compiler multiplies by `row_ticks`, splits waits above
256 ticks into Continue records, then subtracts one for the binary encoding.
An event without channel changes emits Continue.
A channel is a note name (`C4`, `F#3`, `Bb2`), MIDI integer, null for note off,
or an object with `note` and/or `volume` (amplitude 0..31). Unknown channel
fields are rejected. `row_ticks` changes tempo offline by changing
subsequent encoded deltas, with no runtime division or tempo decoder.

The channel number determines the waveform. The note selects pitch on
channels 0..2 and the LFSR update rate on channel 3. For a channel object
containing both `volume` and `note`, the compiler emits one packed-mask event.
Later notes retain the selected amplitude, while
volume-only changes preserve the current note and phase. Attacks and decays
use later volume events. There are no instrument identifiers or amplitude
preset commands; older JSON assets using `instrument` must replace it with
an explicit `volume` before compiling to A2.

## Timer and register allocation

Timer3: CTC, `TCCR3A=0`, `TCCR3B=WGM32|CS31`, prescaler 8, `OCR3A=255`:
16 MHz / 8 / 256 = **7812.5 Hz**. It does not drive OC3A, leaving PC6 to Timer4.
Timer0 keeps its original 1 kHz CTC configuration; its ISR only divides ticks
by four and saturates an unsigned pending byte.

Timer4: 8-bit fast PWM (`PWM4A=1`, `WGM41:0=0`), `COM4A1:0=01` connects both
complementary outputs, TOP `OCR4C=255`, `CS43:0=0001`, no timer prescaling.
`PLLCSR=PINDIV|PLLE`, `PLLFRQ=6A`: 96 MHz VCO / 1.5 = **64 MHz Timer4 clock**,
USB postcaler /2 preserves a nominal 48 MHz USB clock. The resulting carrier
is **250 kHz**. Initialization disables PLL before configuring it, waits over
100 us and then polls PLOCK. Enhanced PWM, dead time, fault protection and all
Timer4 interrupts are disabled. Each duty write explicitly clears shared
`TC4H` before `OCR4A`; hardware buffers compare updates. Enable primes neutral
duty 128; disable disconnects PWM and drives both pins low.

These settings follow the [ATmega32U4 datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf),
sections 6.11 and 15. The /1.5 PLL postcaler has documented individual-clock
jitter despite an exact average frequency. PC6/PC7 speaker wiring is defined
by [Arduboy2](https://github.com/MLXXXp/Arduboy2/blob/master/src/Arduboy2Core.h).

Timer3 saves native r0, r24:r26, and SREG, using seven native stack bytes
including the interrupt return PC. It never touches VM registers, Y, PC,
GPIOR0, SPI or FX. r2 is **not assumed zero**: native floating paths temporarily
borrow it. The normal-context service borrows/saves r16:r23; scratch is r0:r1,
r24:r27, Z and native SREG. r2:r15, VM PC r4:r6, Y, and architectural flags
are preserved. It does not rely on the avr-gcc ABI.

Three 16-bit phases add latched increments and contribute +/-amplitude using
the phase high bit. Noise has a fourth phase: overflow clocks an 8-bit Galois
LFSR with feedback B8, nonzero seed 1, period 255. Its low bit selects polarity.
The sum is `128 + four signed contributions`, range 4..252 at maximum
amplitudes. There is no clipping, multiply, divide, or general loop in the ISR.
The internal table covers MIDI 24..95, with maximum measured rounding error
2.111 cents. The C1..B6 table bounds flash usage and avoids very short tonal
periods; higher MIDI notes are rejected. Square-wave harmonics above Nyquist
still alias at this sample rate, so audible quality needs hardware evaluation.

## Memory allocation

| Persistent data | Bytes |
| --- | ---: |
| Pending ticks, divider, master volume | 3 |
| Latched increments/amplitudes (four times three) | 12 |
| ISR phases and LFSR | 9 |
| Desired note/volume banks for music and SFX | 16 |
| Two stream records | 30 |
| FX cache and index/length/owner | 35 |
| **Total** | **105** |

Audio occupies `0A15..0A7D`; `data_end_private=0A7E`. Formatter/text scratch
ends at `0AC6` (exclusive), leaving 58 bytes for native stack. The existing
framebuffer, guest globals, and guest stack stay at their original addresses.
Audio commit staging uses 13 call-lifetime bytes beginning at `data_end_private`.
Sequencing happens after other SYS callers restore their saved state, so its
workspace cannot alias a live formatter/text call. The SRAM assertion now
requires at least 48 bytes beyond text scratch for native stack.

Stream offsets are START=0 (uint24), CURSOR=3 (uint24), SIZE=6 (uint16),
LEFT=8 (uint16), WAIT=10 (uint16), STATUS=12, MASK=13, TRIGGER=14.
Desired banks contain four `(table_note_index, amplitude)` pairs, with 80=off.
The ISR sees only controls/phases/LFSR; stream fields are never ISR inputs.

## SPI safety and servicing latency

The primary hook adds `LDS/TST/BRNE`, four cycles when no tick is pending.
Neither `dispatch` nor `dispatch_reverse` changed. Existing taken-branch
padding finishes speculative transfers before chip select drops. F0 loads
finish their data reads before entering the hook; native SYS callers either
finish the speculative opcode before their far entry or arrive at the
already-disabled continuation after a completed data transaction.

ISR entry can extend transfer wall time but does not access SPDR or disturb
SREG/registers. Existing CLI/OUT/IN/SEI reverse handoffs remain protected.
The audio reader uses the shared image-relative FX burst reader, which
deselects only after the final byte. The seek continuation always reopens
the bytecode stream at the preserved 24-bit PC. Native tests assert that an
active speculative transfer is complete on entry to the shared seek path.

Idle sleep leaves both audio timers running. After wakeup, an extra four-cycle
pending check routes to the seek hook only when necessary; otherwise idle
uses its existing dispatch tail. Timer3 wakes idle at sample rate, with no
guest busy wait introduced. Ordinary gameplay loops naturally service at
taken branches/calls/returns, and long SYS operations service on return.

There is **no universal latency bound** for arbitrarily long native calls or
straight-line bytecode between safe points. No check was added to sequential
dispatch. If service is delayed 10/50/100 ms, approximately 2-3/12-13/25 ticks
accumulate (depending on divider phase); the old latch keeps sounding, then
the decoder skips countdown intervals and commits the resulting state.
Missed intermediate audible transitions cannot be recovered. Pending saturates
at 255 (1020 ms represented); additional elapsed time is dropped until service.
This extends notes/time rather than wrapping into an incorrect short interval.

## Measurements and validation

See [audio-benchmarks.md](audio-benchmarks.md) for the measured cycle table.
`avm_audio_tests_run` executes AVR instructions in Ardens and compares sample
and sequencer results against independent expected values. It includes compiler
tests and builds Mini/FX-C preset firmware. `avm_tests_run` includes these
checks plus the existing interpreter tests. The C audio fixture exercises
libm and formatting with synthesis interrupts enabled at all six optimization
levels. Native tests cover register/PC/stack preservation, cache boundaries,
looping/truncation/bounded catch-up, chord commits, direct tones and SFX release.

## Tradeoffs and remaining hardware checks

The ISR exceeds the initial 100-cycle goal: preserving actual registers and
loading/storing four SRAM phases costs 119..124 cycles. Reserving AVR registers
would compromise the interpreter allocation contract, so SRAM phases are used.
The 32-byte cache is shared between music/effects; interleaving their streams
invalidates it, trading extra bursts for a smaller persistent footprint.
Pulse duty is fixed; there is no vibrato/filter/ADSR.
Asset durations encode tempo rather than adding live tempo state.

Firmware retains the 29696-byte bootloader ceiling and all primary/secondary
layout assertions. Native audio uses otherwise-unused space before the primary
table, keeping the rest of the code below the limit. There is very little flash
headroom remaining; future features need space savings or a different build.

FX, Mini and FX-C presets compile with the same Timer3/4 configuration; existing
FX chip-select preset differences are retained. The [Mini](https://www.arduboy.com/mini)
has no built-in speaker and needs an added speaker for audio. Homemade hardware that moves the speaker
away from PC6/PC7 cannot use these complementary Timer4 outputs.

No physical device or oscilloscope was available. Actual pin polarity, buffered
update timing at the PLL clock, carrier/DC behavior, audible quality/clicks,
electrical power draw, Mini/FX-C pad routing, and bootloader-to-firmware timer
handoff remain hardware acceptance checks. Neutral duty and clean pin disabling
reduce transients, but there is no amplitude ramp promising click-free playback.
