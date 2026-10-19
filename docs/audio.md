# Hardware PWM audio

AVM synthesizes three selectable tonal voices and one noise voice using Timer3 COMPA.
Timer4 produces differential PWM on PC6/PC7. The ISR only reads the current
15-byte control latch; song decoding, gain preparation, timing, and FX reads run synchronously
when the interpreter restarts its instruction stream. No guest update call
and no queue of future samples or channel states are required.

All native implementation and SRAM definitions are in `interp/interp.asm`.

## Guest API and demo

Include `<avm/audio.h>` or `<avm.h>`. `avm_audio_play(ptr)` starts a
program-space song and enables output. `avm_audio_sfx(ptr)`
starts one effect, replacing the preceding effect. Both pointers are packed
24-bit AVM program pointers. Assets terminate with End or Loop; no byte length
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
`avm_audio_status()` returns bit 0=music playing, bit 1=music paused, bit 2=SFX
playing (including a direct tone). Play also enables output automatically.

Effects own the channels declared in their header, including during their
rests. Music continues progressing beneath those channels. End/stop of SFX
releases ownership and restores the music's **current** state in the same
atomic commit. There is one effect stream; no allocator or ISR arbitration.

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

## Binary format (version A2)

Assets end with an End or Loop record. Header byte 0 is `A2`; byte 1 is a nonzero
four-bit ownership mask. Channels 0..2 are tonal, 3 is noise. At start, all
notes are off and each retained channel volume is 24, with square selected.

Each event starts with `delta, change_mask`. The single delta byte encodes
**byte value + 1 ticks**, each 4 ms: `00` waits one tick and `FF` waits 256
ticks. There is no extended form or zero-time event. Playback starts silent
and waits for the first event, so the earliest note begins after 4 ms.

| Change-mask bits | Meaning |
| --- | --- |
| 0..3 | Note changes for channels 0..3 |
| 4..7 | Packed volume/waveform changes for channels 0..3 |

A nonzero change mask is followed by all selected notes in ascending channel
order, then all selected controls in ascending channel order. Notes are MIDI
24..95 (`18..5F`) or `80` for off; other note values are malformed. Each control
byte has volume 0..31 in bits 4..0 and waveform in bits 6..5: 0=square,
1=triangle, 2=sawtooth, 3=sine. Bit 7 is ignored, so all 256 byte values are
accepted. Channel 3 ignores waveform bits and continues to generate noise.
For example, mask `11` followed by `3C 67` sets channel 0 to MIDI 60 with sine
at volume 7. Existing control bytes 0..31 select square and sound as before.
Mask `88` updates both the noise note/rate and volume. All 255 nonzero masks
are available; there are no update-command opcodes.

A zero change mask is followed by one control byte:

| Record | Meaning |
| --- | --- |
| `delta, 00, 00` | Continue: consume time, preserving channel state and phase |
| `delta, 00, 01` | End playback |
| `delta, 00, 02` | Loop to the first delta after the header |

Other control bytes and changes outside the ownership mask are malformed.
A malformed header, note, ownership mask, or command stops that stream and
releases its effect ownership. Every record consumes at least one tick, including Continue
and Loop. At most 255 elapsed ticks are handled per snapshot, so each stream
can process at most 255 records without a separate event or zero-time-loop budget.

Note changes retrigger phase and retain volume/waveform when no control bit is present.
Control-only changes retain the note and preserve phase. All due updates are
applied to desired state before the complete latch is committed atomically.
Looping retains channel state until the next update. The compiler makes
its first event a complete note/volume/waveform update for every owned channel,
including note-off for channels starting silent. This restores the initial
sound each iteration without extra records or changed timing. Handwritten
binary loops should initialize their channels the same way. Longer waits use Continue records;
the maximum wait in one record is 1.024 seconds. A 600-tick wait uses two
`FF 00 00` Continue records followed by the actual event with delta `57`
(88 ticks). Continue does not require a latch commit.

Channels 0..2 independently select square, triangle, sawtooth, or sine from
four 64-byte signed sample banks; noise is restricted to channel 3.
Bass and lead register choices come from note selection. Envelopes use
sequencer-rate volume events with no per-sample envelope/DSP cost.
A1 assets are rejected and must be regenerated with the current compiler.

The caller supplies a valid FX/image-relative pointer to a terminated asset.
The decoder follows its full 24-bit cursor until End or Loop. Its cache reads
ahead in 32-byte bursts and may fetch bytes past the terminator, without
interpreting them. Truncated assets cannot be detected by byte count. Physical
addressing uses the same modulo-24-bit image-page addition as F0 program loads;
available image/FX capacity remains the practical size limit.

## Asset compiler

`tools/avm_music.py` uses Python's standard library only. `.avms` scores compile
to the unchanged A2 note/control encoding, with five-bit channel volumes:

```sh
python tools/avm_music.py projects/audio_demo/music.avms song.bin --stats
python tools/avm_music.py projects/audio_demo/music.avms song.h --name music
```

SDK installation also places `avm_music.py` in its `bin` directory. The Python
entry point `compile_source(text, filename="<score>", automation_ms=None)`
returns bytes; `c_array(data, name)` creates a program-memory C declaration.
Diagnostics identify the source file, line, and column.
C exports pack eight event bytes into each little-endian `uint64_t` initializer.
This reduces initializer count without changing the A2 byte stream. At most
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
`loop` selects Loop instead of End. The ownership mask is inferred from the
declared channels, including channels that only rest. Optional quoted `title`
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
omits unchanged controls. Notes always retrigger unless tied. Automation samples
default to 8ms; `automation 4ms` or `--automation-ms 4` selects a finer interval.
The interval must be a multiple of 4ms. Explicit breakpoints and note/gate
boundaries are retained independently of the sampling interval. A2's first event
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

Timer3: CTC, `TCCR3A=0`, `TCCR3B=WGM32|CS31`, prescaler 8, `OCR3A=127`:
16 MHz / 8 / 128 = **15625 Hz output**. Alternate interrupts synthesize at
**7812.5 Hz**, so note increments, LFSR clock rates and song timing are unchanged.
It does not drive OC3A, leaving PC6 to Timer4.
Timer0 keeps its original 1 kHz CTC configuration; its ISR only divides ticks
by four and saturates an unsigned pending byte.

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

The Timer3 synthesis path saves native r0:r1, r20:r21, r26:r27, Z, and SREG,
using eleven native stack bytes including the interrupt return PC. The light
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
The internal table covers MIDI 24..95, with maximum measured rounding error
2.111 cents. The C1..B6 table bounds flash usage and avoids very short tonal
periods; higher MIDI notes are rejected. Waveform harmonics above Nyquist
still alias at this sample rate, so audible quality needs hardware evaluation.

## Memory allocation

| Persistent data | Bytes |
| --- | ---: |
| Pending ticks, divider, music/SFX masters | 4 |
| Latched increments and prepared amplitudes (four times three) | 12 |
| Separate tonal waveform selectors | 3 |
| ISR phases and LFSR | 9 |
| Desired note/volume/waveform banks for music and SFX | 16 |
| Two stream records | 22 |
| FX cache and index/length/owner | 35 |
| Held endpoint, midpoint and output phase | 3 |
| **Total** | **104** |

Audio occupies `0A15..0A7C`; `data_end_private=0A7D`. Formatter/text scratch
ends at `0AC5` (exclusive), leaving 59 bytes for native stack. The existing
framebuffer, guest globals, and guest stack stay at their original addresses.
Audio commit staging uses 16 call-lifetime bytes beginning at `data_end_private`.
Sequencing happens after other SYS callers restore their saved state, so its
workspace cannot alias a live formatter/text call. The SRAM assertion now
requires at least 48 bytes beyond text scratch for native stack.

Stream offsets are START=0 (uint24), CURSOR=3 (uint24), WAIT=6 (uint16),
STATUS=8, MASK=9, TRIGGER=10. There are no stored sizes or remaining-byte counters.
Desired banks contain four `(table_note_index, packed_control)` pairs, with 80=off.
The desired control uses music-byte encoding; commit strips ignored bit 7,
separates each tone's waveform, and scales each amplitude using its owner's
master. The ISR sees controls/banks/phases/LFSR; stream fields and masters
are never ISR inputs. Master commands recommit all controls without note
triggers. The 15-byte latch is copied atomically, including waveform selectors,
so an interrupt cannot observe a mix of old and new gains or waveforms.

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
uses its existing dispatch tail. Timer3 wakes idle at the output rate, with no
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
looping/termination beyond 64 KB, bounded catch-up, chord commits, direct tones and SFX release.

## Tradeoffs and remaining hardware checks

The synthesis path exceeds the initial 100-cycle goal: preserving actual
registers and loading/storing four SRAM phases, looking up/scaling samples,
clipping and preparing interpolation costs 196..203 cycles. Alternate output
interrupts take 41 cycles, for at most 11.9141% CPU across each pair. Reserving
AVR registers
would compromise the interpreter allocation contract, so SRAM phases are used.
The 32-byte cache is shared between music/effects; interleaving their streams
invalidates it, trading extra bursts for a smaller persistent footprint.
Square duty is fixed at 50%; there is no runtime vibrato, filter, or envelope DSP.
The score compiler expands custom envelopes and tremolo into control events.
Asset durations encode tempo rather than adding live tempo state.

Firmware retains the 29696-byte bootloader ceiling and all primary/secondary
layout assertions. The waveform table uses space before the primary table,
keeping firmware at 29036 bytes, with 660 bytes remaining. There is little flash
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
