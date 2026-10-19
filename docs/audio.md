# Hardware PWM audio

AVM synthesizes three selectable tonal voices and one noise voice using Timer1 COMPA.
Timer4 produces differential PWM on PC6/PC7. The ISR consumes prepared updates
and synthesizes from a fixed 15-byte control latch; song decoding, gain
preparation, sequencing, and FX reads run synchronously when the interpreter
restarts its instruction stream. No guest update call is required.

All native implementation and SRAM definitions are in `interp/interp.asm`.

## Guest API and demo

Include `<avm/audio.h>` or `<avm.h>`. `avm_audio_play(ptr)` starts a
program-space song and enables output. `avm_audio_sfx(ptr)`
starts one effect, replacing the preceding effect. Both pointers are packed
24-bit AVM program pointers. Music terminates with End or Loop; effects end with End. No byte length
is passed and there is no 65535-byte song limit.

`avm_audio_stop`, `avm_audio_pause`, `avm_audio_resume`, `avm_audio_volume`,
`avm_audio_music_volume`, `avm_audio_sfx_volume`, `avm_audio_stop_sfx`,
`avm_audio_enable`, and `avm_audio_disable` provide controls.
Both masters accept 0..255, with 0=mute, 32=100%, and 255=796.875%.
`avm_audio_volume` sets both; the music and SFX setters change only their own
master. Direct tones use SFX gain. Both default to **128 (400%)** and retain their values
across play, stop, pause, and disable/enable. The foreground prepares each
channel amplitude as `floor(volume * owner_master / 32)`; desired channel
volumes stay 0..31. Gain changes preserve notes, waveforms, phase, and
sequencing time. At the default gain, volume 31 produces amplitude 124,
close to the full signed PWM range. The ISR saturates the complete signed
mix at PWM duty 0/255; several loud voices can clip together.
Muted SFX still owns its channels, so muting effects does not expose music
underneath them; stop SFX to release those channels.
Pause freezes the music countdown and mutes music;
SFX keeps running. Stop mutes music, leaving SFX intact. Disable stops both
streams and both timers and leaves the speaker outputs low. PLL stays enabled.
Stop/end leaves the timers running at neutral duty; disable removes the sample
ISR overhead when output is no longer needed.

`avm_audio_tone(channel, MIDI_note, amplitude)` replaces the effect with one
latched voice until `avm_audio_stop_sfx`. Channels 0..2 are square, 3 is noise.
Valid channel/amplitude arguments are 0..3/0..31; these fields are masked to
their respective widths. MIDI outside 24..95 mutes the selected voice.
The MIDI table and conversion live in the guest runtime's `audio_tone.c`, in
program storage, and are linked only when this API is used. The internal SYS
command accepts a full uint16 phase increment in r5. This low-level direct-tone
API retains its explicit 0..3 channel override; sequenced SFX uses only 2/3.
`avm_audio_status()` returns bit 0=music playing, bit 1=music paused, bit 2=SFX
playing (including a direct tone). Play also enables output automatically.

Sequenced effects have two fixed slots: tonal voice 2 and noise voice 3.
Use voice 0 for the melody, voice 1 for primary accompaniment, voice 2 for
secondary accompaniment, and voice 3 for music percussion/noise. An effect
steals only the slots declared in its source: a tonal-only effect leaves music
noise audible, and a noise-only effect leaves tonal accompaniment audible.
A declared channel retains ownership during rests, note-off, and zero volume;
omit a channel entirely to leave its music voice available. Starting a new
effect replaces the entire previous effect and releases any omitted slots.
Music's note/control timeline continues underneath the stolen voices. End/stop
restores its **current** state atomically. The oscillators are shared: there
is no separate hidden music phase or fifth voice. There is one one-shot effect
stream, with no allocator or ISR arbitration.

```c
avm_audio_play(music);
avm_audio_music_volume(64); // Half the default music gain; SFX keeps gain 128.
// Draw, run gameplay, or idle. Playback advances automatically.
avm_audio_sfx(effect);
```

Build `avm_audio_demo` with CMake, configuration `RelWithDebInfo`.
The package is `projects/audio_demo/audio_demo.arduboy`; the development image
is `projects/audio_demo/build/audio_demo.bin`. It renders
two moving rectangles at 60 Hz. A triggers a two-channel effect; B toggles
pause. Its generated audio headers are checked in alongside the `.avms` scores;
`audio_demo_assets` regenerates them before a rebuild. The directory also
supports standalone CMake builds with an installed SDK; see its
[README](../projects/audio_demo/README.md). There is no update call in
`setup`/`loop`. Firmware is `interp/build/interp.hex`.

## Binary formats: A3 music and compact B1..B3 SFX

All pitches are **little-endian uint16 phase increments**, with zero meaning
off. The synthesizer adds each increment to its uint16 phase at 7812.5 Hz:
`increment = round(frequency_Hz * 65536 / 7812.5)`. Resolution is approximately
0.119209 Hz. All uint16 values are accepted; tonal frequencies above Nyquist
alias, so assets should keep tonal increments below 32768. Noise uses phase
overflow to clock its LFSR. The interpreter contains no MIDI table or pitch
conversion. The score compiler still accepts C1..B6 notation and performs the
conversion offline; `_encode_events` also accepts explicit `increment` updates
for arbitrary pitches and future pitch automation.

Pitch and control changes **preserve phase**, including repeated notes and
loop boundaries. Phase is initialized at interpreter startup. Increment zero
freezes the oscillator and mutes its output. Volume zero mutes without stopping
a nonzero increment. Use envelopes that reach zero at note boundaries to
reduce audible clicks. No retrigger flags or phase-reset packets are stored.

Music begins with `A3, ownership_mask`, where the mask is nonzero and uses
bits 0..3. All declared voices start off, at retained volume 24 with square
selected. Each event starts with `delta, change_mask`:

| Music change-mask bits | Meaning |
| --- | --- |
| 0..3 | uint16 pitch changes for voices 0..3 |
| 4..7 | Packed volume/waveform changes for voices 0..3 |

Selected pitches follow in ascending voice order, then selected controls in
ascending voice order. A control uses bits 4..0 for volume 0..31 and bits 6..5
for waveform: 0=square, 1=triangle, 2=sawtooth, 3=sine. Bit 7 is ignored.
Voice 3 ignores waveform bits and generates noise. For example,
`00 11 6B 0E 67` waits one tick, then sets voice 0 to increment 3691 (A4)
with sine at volume 7. Mask `88` changes both the noise rate and volume.

SFX begins with **one header byte**:

| Header | Declared slots / ownership |
| --- | --- |
| `B1` | Tonal slot -> voice 2 |
| `B2` | Noise slot -> voice 3 |
| `B3` | Both slots -> voices 2 and 3 |

There is no additional channel mask or route table. Each SFX event starts with
`delta, update_flags`; only four flag bits are valid:

| SFX update-flag bit | Payload |
| --- | --- |
| 0 | Tonal uint16 increment |
| 1 | Noise uint16 increment |
| 2 | Tonal packed volume/waveform |
| 3 | Noise packed volume (waveform bits ignored) |

Payload order is tonal pitch, noise pitch, tonal control, noise control,
omitting fields whose bits are clear. Updates outside declared slots are
malformed. For example, `B1 00 05 85 0E 6C` declares tonal-only ownership,
waits one tick, then selects increment 3717 with sine at volume 12. A complete
two-slot update is eight bytes including delta and flags; a complete music
update is fourteen bytes. Unchanged controls/pitches need no repeated payload.

Both formats use the same **byte value + 1** delta, in 4 ms ticks: `00` waits
one tick and `FF` waits 256 ticks. Playback starts silent; the first event can
begin after 4 ms. There are no zero-time records. A zero change mask/flags is
followed by one command byte:

| Record | Meaning |
| --- | --- |
| `delta, 00, 00` | Continue, preserving state and phase |
| `delta, 00, 01` | End and release ownership |
| `delta, 00, 02` | Music only: Loop to the first delta after its header |

SFX Loop, other commands, invalid headers/masks/flags, and updates outside
ownership stop that stream and release its ownership. A1/A2 assets are rejected
and must be regenerated. Every record consumes time; a 255-tick snapshot can
process at most 255 records per stream without a separate loop budget.
The compiler initializes every declared voice in the first event, including
off voices, so music loops restore pitch/control state on their first event.
Long waits split into Continue records; 600 ticks uses two `FF 00 00` records
then delta `57` for the remaining 88 ticks.

The decoder follows a full 24-bit cursor until End/Loop, with no length field
or 65535-byte asset cap. It reads fourteen music bytes or eight SFX bytes into temporary scratch for
each due event, consumes only the actual record and next delta, and discards
extra read-ahead. Truncation cannot be detected by byte count. Program/image
addressing uses the same modulo-24-bit page addition as F0 program loads.

## Asset compiler

`tools/avm_music.py` uses Python's standard library only. `.avms` scores compile
to A3 music or compact B1..B3 SFX, with five-bit channel volumes:

```sh
python tools/avm_music.py projects/audio_demo/music.avms song.bin --stats
python tools/avm_music.py projects/audio_demo/music.avms song.h --name music
```

SDK installation also places `avm_music.py` in its `bin` directory. The Python
entry point `compile_source(text, filename="<score>", automation_ms=None)`
returns bytes; `c_array(data, name)` creates a program-memory C declaration.
Diagnostics identify the source file, line, and column.
C exports pack eight event bytes into each little-endian `uint64_t` initializer.
This reduces initializer count without changing the encoded byte stream. At most
seven trailing zero bytes pad the final word and are ignored after End/Loop.
If even the word count exceeds Clang's 16-bit inferred-array bound, the header
uses contiguous, byte-aligned chunks and exposes the same 24-bit program
pointer. Pass the requested name directly to playback; no asset size is needed.
Both C and C++ exports are exercised beyond the 64 KB boundary.

```text
tempo 120
meter 4/4
loop
automation 8ms

envelope soft {
    points 0ms:0%, 12ms:100%, 80ms:65%
    sustain
    release 40ms:0%
    tremolo { period 1/8 depth 30% wave sine phase song }
}
instrument lead { wave sine volume 16 envelope soft gate 85% }
phrase motif { c8 d e g e4 d }

channel 0 lead octave 4 { motif | c2~ c4 r4 | }
```

Score settings precede definitions and channels. Tempo is quarter-note BPM
(default 120); fractions such as `1250/13` are exact. Meter defaults to 4/4.
`loop` selects Loop instead of End for music. Add the top-level `sfx` setting
for a one-shot effect; `sfx` rejects `loop` and declarations outside channels
2 and 3. Ownership is inferred from declarations, including all-rest channels. Optional quoted `title`
and `description` fields are metadata. `//` comments and optional semicolons
are accepted.

Each `channel 0..3 [instrument] [octave 1..6] { ... }` is a monophonic sequence
starting at score time zero; shorter channels are silent for the remainder.
Channel 3 uses note pitch as its noise update rate. Noise instruments require
channel 3; other waveforms are square, triangle, sawtooth, or sine.

- `c4`, `d8`, `e16` are quarter, eighth, and sixteenth notes. An omitted duration
  inherits the last explicit note value, initially a quarter. `r` or `s` rests.
- `c#8`, `db8` use sharps/flats. The channel octave defaults to 4; apostrophes
  and commas shift an individual note up/down from that octave (`c'8`, `c,8`).
  Pitch remains restricted to C1..B6.
- `c4.`, `c4..` add dots; `c8*2/3` multiplies that note's duration, useful for
  tuplets. `c:48ms` or `r:12ticks` specifies an exact time instead. Every note
  or rest must occupy at least one 4ms tick.
- `c4~ c4` is one held note with one attack and envelope. Tied pitches and
  instrument settings must match. `|` checks that a complete measure has elapsed.
- `phrase riff { ... }`, `riff`, and `repeat 4 { ... }` reuse notation. Recursive
  phrases are rejected. Repeats expand before encoding.
- `use lead`, `octave 5`, `volume 12`, `wave triangle`, `envelope soft`, and
  `gate 80%` change subsequent notes. `c8@lead` overrides one note's instrument.

An instrument's default settings are square, volume 24, a flat envelope, and
gate 100%. Gate starts release at that fraction of the written note duration;
it does not move subsequent notes. The last breakpoint of an envelope holds
until release (`sustain` makes that intent explicit). Levels are percentages
or fractions of the note's volume, never raw packed controls. Breakpoint times
are relative to note onset and may use ms, s, ticks, or musical whole-note
fractions such as `1/16`. Times increase strictly and the first point is at zero.
`curve linear` is the default; `curve step` gives discrete changes.

For best sound quality, prefer envelopes that start and end at 0% amplitude.
Start with `points 0ms:0%` and include an explicit release to `0%`, as in the
`soft` envelope above. A short attack and release reduce abrupt amplitude
changes and audible clicks. Allow the release to finish before the next note
or loop boundary cuts it off.

Release points are relative to note-off, begin after zero, and must end at
zero amplitude. Release starts from the contour's current level, including
when a short note ends during attack. A subsequent note cancels the old tail;
ties continue the original contour. One-shot exports retain final release tails.
Loops truncate tails at their fixed musical boundary and initialize every owned
channel on the next iteration.

An envelope may contain `tremolo { ... }`. Use either `rate 6Hz` or `period 1/8`
(beat-synchronized), with `depth 0..100%`, `wave sine|triangle|square`, and
`phase note|song`. Defaults are depth 25%, sine, and note phase. Depth 30%
multiplies the contour by a value between 70% and 100%. Note phase restarts at
each attack; song phase follows absolute score time. Ties and release preserve
phase. The period must be at least 8ms; useful smooth modulation needs several
automation samples per cycle.

The compiler resolves exact cumulative timestamps, expands envelopes/tremolo,
rounds to the 4ms sequencer grid, merges simultaneous channel changes, and
omits unchanged controls. Note onsets remain explicit unless tied; all pitch updates preserve oscillator phase. Automation samples
default to 8ms; `automation 4ms` or `--automation-ms 4` selects a finer interval.
The interval must be a multiple of 4ms. Explicit breakpoints and note/gate
boundaries are retained independently of the sampling interval. The first event
still waits 4ms. Loop periods use the written duration without accumulating
that startup delay; the Loop record occupies the final tick. One-shot End
occurs after the final release. No envelope state or modulation DSP runs in
the firmware.

`--stats` reports the compiled size. Four changing volumes every 4ms cost up
to 1500 bytes/second before note payloads, so finer automation increases FX
usage and foreground service work. The compiler has no 16-bit asset-size cap.

Only score notation is accepted; JSON event lists are unsupported. Long waits
split into positive-time Continue records in the binary output.

## Timer and register allocation

Timer1: CTC, `TCCR1A=0`, `TCCR1B=WGM12|CS11`, prescaler 8, `OCR1A=127`:
16 MHz / 8 / 128 = **15625 Hz output**. Alternate interrupts synthesize at
**7812.5 Hz**. Note increments and the output interpolation retain their
original rates. Timer1 COMPA (vector 17) wins pending interrupt arbitration
over Timer0 COMPA (vector 21); an already running ISR is not preempted.
Timer3 is stopped and masked, with its speaker-pin output ownership cleared.
Startup clears the Timer0 and Timer1 power gates before configuring them.

Timer0 keeps its **1 kHz** CTC clock, with prescaler 64 and `OCR0A=249`.
Its ISR increments the millisecond counter, then divides ticks by four and
saturates an unsigned pending sequencer byte. Millisecond APIs and the
millisecond frame scheduler retain their original behavior. The experimental
16 kHz unified clock and monotonic API are not part of the selected runtime.
See the [timing investigation](../projects/avm_rpg/docs/audio_timing.md) for
measured PWM jitter and the performance comparison.

The synthesis interrupt first outputs the preceding endpoint, then computes
the next endpoint and their unsigned midpoint. The intervening light interrupt
outputs that midpoint without advancing phases or LFSR. Both PWM writes occur
at the same instruction offset from interrupt entry; synthesis duration does
not skew alternating output intervals. The midpoint uses the ninth addition
bit before shifting, so duties spanning 0..255 cannot overflow. Enable resets
both held duties to neutral 128 and starts with the synthesis path.
This is twofold linear output interpolation, with 64 us additional latency
relative to the former held output. It reduces spectral images but does not
remove harmonics already aliased at the synthesis rate or improve the
64-entry oscillator lookup. No samples are read from FX in either ISR path.

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

The Timer1 synthesis path saves native r0:r1, r20:r21, r26:r27, Z, and SREG,
using eleven native stack bytes including the interrupt return PC (thirteen
while calling the pending-update copier). The light
path saves only r0, r20 and SREG, using five stack bytes including the PC.
Borrowed VM registers are
restored; Y, VM PC, GPIOR0, SPI and FX are untouched. r2 is **not assumed zero**: native floating paths temporarily
borrow it. The normal-context service borrows/saves r16:r23; scratch is r0:r1,
r24:r27, Z and native SREG. r2:r15, VM PC r4:r6, Y, and architectural flags
are preserved. It does not rely on the avr-gcc ABI.

Three 16-bit phases add latched increments. The upper six phase bits select
one of 64 samples; a separate byte for each tone holds its bank in bits 7..6.
The aligned 256-byte flash table occupies `0100..01FF`, before primary
dispatch; both timer ISR bodies are placed later in the same assembly file.
Its samples span -127..127. All four latched amplitudes are full unsigned
bytes, prepared in the foreground as `A = floor(volume * owner_master / 32)`
(0..247). Each tonal contribution is `floor(sample * A / 128 + 0.5)`.
FMULSU supplies the fractional product; its carry records the sign before
the fractional shift, and SBC sign-extends the rounded contribution into
the 16-bit mix. This handles boosted contributions outside int8 without
additional product shifts. The original square samples are unchanged at
unity. Noise has a fourth phase: overflow clocks an 8-bit Galois LFSR with
feedback B8, nonzero seed 1, period 255. Its low bit selects +/-A.

Accumulation starts at zero in a signed 16-bit register pair. The complete
mix is in -982..982 at maximum prepared amplitudes; the ISR then adds 128
and clamps to duty 0..255. Clipping occurs after all contributions, allowing
loud opposing voices to cancel. The ISR never reads either master, multiplies
the completed mix, or performs the old three-pair shift. At unity synthesized
endpoints are unchanged. Other gains truncate each channel amplitude before synthesis,
so quieter gains can silence low-volume channels and differ from scaling
the completed mix. There is no general loop in the ISR; each tonal voice
performs one LPM and one FMULSU with identical timing for all waveforms.
The guest MIDI table covers 24..95, with maximum rounding error 2.111 cents.
Raw increments expose the existing oscillator precision between semitones.
Waveform harmonics above Nyquist still alias at this sample rate, so audible
quality needs hardware evaluation.

## Memory allocation

| Persistent data | Bytes |
| --- | ---: |
| Pending ticks, divider, music/SFX masters | 4 |
| Live increments and prepared amplitudes (four times three) | 12 |
| Separate tonal waveform selectors | 3 |
| ISR phases and LFSR | 9 |
| Desired music states (four times three) | 12 |
| Desired SFX states (two times three) | 6 |
| Music stream record / one-shot SFX record | 10 / 7 |
| Pending controls and ready descriptor | 16 |
| Held endpoint, midpoint and output phase | 3 |
| **Total** | **82** |

Audio occupies `0A15..0A66`; `data_end_private=0A67`. Formatter/text scratch
ends at `0AAF` (exclusive), leaving 81 bytes for native stack. Guest globals,
framebuffer, and guest stack retain their original addresses. The dirty byte
and fourteen-byte event buffer alias the existing temporary workspace and add
no persistent allocation. At least 48 bytes above text scratch remain required
by the assembler assertion.

Both stream records have CURSOR=0 (uint24), WAIT=3 (uint16), STATUS=5, MASK=6.
Only music stores START=7 (uint24) for looping. SFX has no loop-start pointer.
Desired states are `(increment_low, increment_high, packed_control)` triples.
Music retains four; SFX retains tonal/noise slots. During direct-tone playback,
the tonal slot can override any explicitly requested tonal voice, preserving
the existing public API.

Desired state preserves unscaled volume and both sources' settings. Foreground
commit selects each voice's owner, applies pause/off, separates waveform bits,
and prepares `floor(volume * owner_master / 32)`. The ISR uses only the live
controls, phases, waveform selectors, and LFSR.

The persistent pending packet is unchanged: 15 prepared bytes plus a one-byte
ready descriptor (bit 7). Foreground waits for acknowledgment, prepares the
whole packet with interrupts enabled, then publishes the descriptor. After its
fixed PWM write, synthesis copies all controls, clears ready, and advances
phases without resetting them. The normal synthesis path adds four cycles;
the midpoint path is unchanged. ISR stack is eleven bytes normally and
thirteen while applying a packet, including its return PC. Back-to-back commits
wait up to a synthesis interval. When output/global interrupts are unavailable,
commit applies controls directly without waiting. Disable drains pending
controls and applies silence before enable can restart playback. No foreground
block copy disables interrupts.

When output starts, Timer1's initial counter is seeded from Timer0's counter
using their shared prescaler. The timed read/write sequence places audio
compare deadlines 64..120 CPU cycles after clock deadlines modulo 128. This
avoids depending on the duration of PLAY/header processing to miss Timer0's
nonpreemptible ISR. It changes neither the shared prescaler nor Timer0/millis.
Native tests cover all 250 Timer0 counts and 64 sub-tick phases, plus 8000
real-timer outputs across complete 8 ms relative-phase patterns.

## SPI safety and servicing latency

The primary hook adds `LDS/TST/BRNE`, four cycles when no tick is pending.
Neither `dispatch` nor `dispatch_reverse` changed. Existing taken-branch
padding finishes speculative transfers before chip select drops. F0 loads
finish their data reads before entering the hook; native SYS callers either
finish the speculative opcode before their far entry or arrive at the
already-disabled continuation after a completed data transaction.

ISR entry can extend transfer wall time but does not access SPDR or disturb
SREG/registers. Existing CLI/OUT/IN/SEI reverse handoffs remain protected.
The event reader calls the shared image-relative FX burst reader for fourteen music bytes (eight for SFX)
and returns X at the temporary buffer. Notes, controls and timing are consumed
with `LD r24, X+`; Z is free for desired state and the stream record. Continue
uses its buffered next delta. Loop rewinds and fetches the initial delta again,
discarding read-ahead from the old position. Startup similarly reads the header
and first delta in one burst. The transaction permits interrupts except for the
existing short per-byte SPI handoffs. The seek continuation always reopens
the bytecode stream at the preserved 24-bit PC. Native tests assert that an
active speculative transfer is complete on entry to the shared seek path.

Idle sleep leaves Timer0, Timer1 and Timer4 running during playback. After wakeup, an extra four-cycle
pending check routes to the seek hook only when necessary; otherwise idle
uses its existing dispatch tail. Timer1 wakes idle at the output rate, with no
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
levels. Native tests cover register/PC/stack preservation, address boundaries,
looping/termination beyond 64 KB, all 255 event masks, exact cursor advancement,
discarded read-ahead after End, bounded catch-up, interrupted packet staging,
back-to-back commits, phase-preserving pitch updates, formatter workspace reuse,
stopped/IRQ-disabled handoffs, direct tones and SFX release.

## Tradeoffs and remaining hardware checks

The synthesis path exceeds the initial 100-cycle goal: preserving actual
registers and loading/storing four SRAM phases, looking up/scaling samples,
clipping and preparing interpolation costs 200..207 cycles without a pending
packet. Alternate output interrupts take 41 cycles, for at most 12.1094% CPU
across an ordinary pair. Pending packet application adds 69 cycles, with no per-voice phase-reset work. Reserving
AVR registers
would compromise the interpreter allocation contract, so SRAM phases are used.
Event fetches use a fourteen-byte interruptible FX burst rather than individual byte reads. There is no persistent cache or
ownership/invalidation logic. The persistent handoff still uses 16 bytes; the total allocation is three bytes smaller than the preceding A2 implementation.
Square duty is fixed at 50%; there is no runtime vibrato, filter, or envelope DSP.
The score compiler expands custom envelopes and tremolo into control events.
Asset durations encode tempo rather than adding live tempo state.

Firmware retains the 29696-byte bootloader ceiling and all primary/secondary
layout assertions. The waveform table uses space before the primary table,
keeping firmware at 28972 bytes, with 724 bytes remaining. Future features must remain within that ceiling.

FX, Mini and FX-C presets compile with the same Timer1/4 configuration; existing
FX chip-select preset differences are retained. The [Mini](https://www.arduboy.com/mini)
has no built-in speaker and needs an added speaker for audio. Homemade hardware that moves the speaker
away from PC6/PC7 cannot use these complementary Timer4 outputs.

No physical device or oscilloscope was available. Actual pin polarity, buffered
update timing at the PLL clock, carrier/DC behavior, audible quality/clicks,
electrical power draw, Mini/FX-C pad routing, and bootloader-to-firmware timer
handoff remain hardware acceptance checks. Neutral duty and clean pin disabling
reduce transients, but there is no amplitude ramp promising click-free playback.
