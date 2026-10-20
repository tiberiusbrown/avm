# Hardware PWM audio

For offline A5 rendering, emulator validation, and audio-guided MIDI fitting,
see [Stage 2](midi_to_avms_stage2.md). Its default previews use 15,625 Hz;
the hardware default remains 7812.5 Hz.

AVM has three identical programmable-duty pulse oscillators and one noise
oscillator. Timer1 synthesizes at 7812.5 Hz (default) or 15625 Hz. Timer4 drives
the differential PC6/PC7 speaker outputs with a 250 kHz hardware PWM carrier.
Pulse waveform duty and Timer4's output compare duty are different quantities.

## API, channels, and ownership

Include `<avm/audio.h>` or `<avm.h>`. Playback advances automatically at interpreter
safe points; no guest update call is needed. All program pointers are packed
24-bit AVM program pointers, with no 16-bit asset-length limit.

| Channel | Convention | Oscillator | Sequenced SFX |
| --- | --- | --- | --- |
| 0 | Melody | Pulse | Never stolen |
| 1 | Harmony/countermelody | Pulse | Tonal slot |
| 2 | Bass | Pulse | Never stolen |
| 3 | Percussion | Noise | Noise slot |

`avm_audio_play(song)` and `avm_audio_sfx(effect)` start streams and enable
output. There is one one-shot SFX stream, which replaces any previous effect.
An effect owns only its declared slots, including during rests or volume zero.
Undeclared slots remain available to music. Music advances underneath SFX;
End/stop restores its current pitch, volume, and duty atomically. Oscillators
and phases are shared: there is no hidden fifth oscillator or saved music phase.

`avm_audio_tone(channel, MIDI_note, amplitude)` remains explicitly addressed:
it can override any physical channel 0..3 until `avm_audio_stop_sfx()`. Tonal
direct tones use duty 128. Channel/amplitude arguments are masked to 0..3/0..31;
MIDI outside 24..95 mutes that channel. Its MIDI lookup table lives in guest
program storage and is linked only if this API is used. The underlying SYS
command accepts a raw uint16 phase increment; conversion is outside the firmware.

`avm_audio_stop`, `avm_audio_pause`, `avm_audio_resume`, `avm_audio_stop_sfx`,
`avm_audio_enable`, `avm_audio_disable`, and `avm_audio_rate` retain their APIs.
Pause freezes and mutes music while SFX runs; stop mutes only music. Disable
stops both streams and timers and leaves the speaker pins low; the PLL remains
enabled. End/stop otherwise leaves timers running at neutral output.
`avm_audio_status()` returns music-playing bit 0, music-paused bit 1, SFX bit 2.

`avm_audio_volume` sets both masters; `avm_audio_music_volume` and
`avm_audio_sfx_volume` set them independently. Direct tones use SFX gain.
Masters accept 0..255, default to 128, and persist across stop/pause/disable:
32 is unity, 128 is 400%, 255 is 796.875%. Foreground preparation computes
`floor(volume * owner_master / 32)` (0..247). Muting SFX retains ownership.
The ISR clips the complete signed mix after summation; loud voices can clip.

## Pulse and noise synthesis

Each tonal oscillator has a uint16 phase, uint16 increment, uint8 duty, and
prepared uint8 amplitude. It advances phase, then compares its upper byte:
`phase_high < duty` produces +127; otherwise -127. Duty is 0..255, default
128 (exact 50%). Percentages use a 256-step cycle: 12.5%=32, 25%=64, 50%=128;
100% clamps to 255. Duty 0 is always negative; 255 still has one negative phase
bin. These extremes can introduce DC and are useful chiefly as effect endpoints.
At duty 128 every sample equals the former square table for the same phase.

The branchless `CP/SBC/ANDI/SUBI` comparison has fixed instruction cost for
every threshold and phase. It uses no table, LPM, or Z register. FMULSU,
rounding `floor(sample * amplitude / 128 + 0.5)`, sign extension, signed
16-bit mixing, PWM bias 128, and final 0..255 clipping are retained.
The unused space before the fixed primary dispatch table remains padding.

Noise uses a fourth phase accumulator; overflow clocks the existing 8-bit
Galois LFSR (feedback B8, startup seed 1, period 255). Its low bit selects
positive or negative prepared amplitude. Ordinary pitch/control changes
preserve phase and LFSR. An explicit retrigger atomically sets seed 1..63
and resets noise phase before generating the next sample. It does not change
the pitch. Hidden music retriggers are discarded while SFX owns noise; release
restores current music controls without replaying an earlier seed.

## Binary formats: A5 and D1–D3

Old A4/C1–C3 and earlier headers are rejected. Regenerate assets. Pitches are
little-endian uint16 increments with zero meaning off, encoded for 15625 Hz:
`round(frequency_Hz * 65536 / 15625)`. At 7812.5 Hz foreground preparation
doubles increments, saturating at 65535; desired state remains canonical.
All uint16 increments are legal. MIDI source notation covers C1..B6.
Pitch and duty updates preserve phase, including repeated notes and loops.

Music header: `A5, ownership_mask`; mask is nonzero with only bits 0..3 set.
Each event is `delta, change_mask, pitches..., controls...`. Change-mask bits
0..3 select pitches; bits 4..7 select controls. Each selected group is in
ascending physical channel order. Initial desired volume is 24, duty 128,
pitch off. Every compiler-generated first event initializes all owned voices,
including duty, so loop entry cannot inherit stale controls.

| Control bits | Meaning |
| --- | --- |
| 0..4 | Volume 0..31 |
| 5..6 | Reserved; must be zero |
| 7, channels 0..2 | One unsigned duty byte follows |
| 7, channel 3 | One nonzero seed byte 1..63 follows; retrigger noise |

A volume-only control is one byte. A duty or seed update is two bytes and
also carries the currently selected volume. Optional bytes immediately follow
their own control byte, before the next channel's control. Noise never
interprets the extension as duty. Seed-only changes still publish a packet.
For example `00 11 35 07 87 40` waits one tick, sets voice 0 to increment
1845, volume 7, and duty 64. `00 80 8A 25` reseeds noise with 37 at volume 10.

| SFX header | Ownership |
| --- | --- |
| D1 | Tonal slot, physical voice 1 |
| D2 | Noise slot, physical voice 3 |
| D3 | Both slots, physical voices 1 and 3 |

SFX has no mask byte after the header. Events use four update flags: bit 0
tonal pitch, bit 1 noise pitch, bit 2 tonal control, bit 3 noise control.
Payload order is tonal pitch, noise pitch, tonal control/extension, noise
control/extension. Other flag bits and updates outside declared slots are
malformed. `D1 00 05 85 0E 8C 20` starts a tonal effect on voice 1 at increment
3717, volume 12, duty 32. Append `00 00 01` to end it one tick later.

Every delta byte means value+1 ticks (1..256), each tick 4 ms. There are no
zero-time records. The first event waits at least 4 ms. A zero mask/flags is
followed by a command byte: 0 Continue, 1 End, 2 music-only Loop. Each command
consumes positive time. Loop rewinds to the first delta, skipping the validated
music header. SFX Loop, unknown commands/headers, reserved control bits, invalid
seed, ownership violations, and invalid flags stop that stream and release it.

Maximum read-ahead at a due event includes the next delta: music 18 bytes
(mask 1 + pitches 8 + extended controls 8 + next delta 1); SFX 10 bytes
(flags 1 + pitches 4 + extended controls 4 + next delta 1). The current delta
has already been consumed. Only actual bytes consumed advance the 24-bit FX
cursor; unused read-ahead is discarded. No length is passed, so a truncated
stream cannot be reliably distinguished from adjacent program data. Supply
complete assets. End/Loop prevents trailing C-export padding from being used.

## Asset compiler and notation

`tools/avm_music.py` uses only Python's standard library and is installed in
the SDK's bin directory. Diagnostics include filename, line and column.

```sh
python tools/avm_music.py projects/audio_demo/music.avms song.bin --stats
python tools/avm_music.py projects/audio_demo/effect.avms effect.h --name effect
```

`compile_source(text, filename="<score>", automation_ms=None,
max_updates=2000000, statistics=None)` returns bytes; `c_array(data, name)`
exports packed little-endian uint64 words with at most seven padding bytes.
Large C/C++ exports use contiguous chunks when necessary. No 64 KB size cap
is introduced; streams and program addresses remain 24-bit.

Score settings precede definitions/channels: `tempo 120` is quarter-note BPM,
`meter 4/4`, `automation 8ms`, and optional `loop` or one-shot `sfx`.
SFX may declare only channels 1/3 and cannot loop. Optional quoted `title` and
`description`, `//` comments and semicolons are supported.

`channel 0 [instrument] [octave 4] { ... }` is monophonic. `c4 d8 e r2`
means quarter C, eighth D/E, half rest; omitted duration inherits the previous
value. `r` and `s` are rests. Sharps/flats (`c#8 db8`), octave shifts (`c'8 c,8`),
dots (`c4.`), rational multipliers (`c8*2/3`), and explicit times (`c:48ms`)
are supported. Notes/rests must last at least 4 ms. Ties (`c4~ c4`) preserve one
attack and its effect timeline; tied pitch and settings must match. `|` checks
measure boundaries. `phrase riff { c8 d e g }` and `repeat 4 { riff }` reuse
notation; recursive phrases are rejected.

Instruments default to `wave pulse volume 24 duty 128 gate 100%` with a flat
envelope. `wave square` is an alias for pulse. Noise instruments use `wave
noise` and require channel 3. `use lead`, `volume 12`, `duty 25%`, `envelope soft`,
`gate 80%`, and `octave 5` affect subsequent notes. `c8@lead` replaces all sound
settings for that note only. All three tonal channels have identical capability.

Envelope points are time:level pairs, with the first at zero; levels are
fractions 0..1 or percentages. `curve linear` (default) interpolates; `curve
step` holds. The last point sustains. `release` starts from the current contour
at the gate boundary, has strictly positive times, and ends at zero. A new note
cancels the previous release tail. One-shot scores retain final release tails;
loops truncate them at the fixed loop boundary. Short attacks/releases reduce
clicks; no firmware amplitude ramp is implicit.

## Offline musical effects

Effect directives appear inside instruments or channels **before** the note
they modify. Channel directives persist for subsequent notes and restart at
each onset. They do not edit the preceding note backward in time. `off`
disables an effect for subsequent notes. Reusable bundles use
`effect shimmer { lfo { target pitch depth 25cents period 160ms } }`, then
`effects shimmer` inside an instrument/channel. Explicit instrument effects
override bundled effects; bundles are applied in listed order, and channel
directives override the selected instrument. `use` resets to that instrument;
per-note `@instrument` replaces channel sound settings for that note.

All effect times accept `ms`, `s`, `ticks` (4 ms each), or unitless whole-note
fractions such as `1/16`. Rational cumulative timestamps avoid rhythmic drift.
Smooth automation normally samples every 8 ms (`automation 4ms` or
`--automation-ms 4` selects finer sampling). The interval must be a positive
multiple of 4 ms. Onsets, cuts, slide endpoints, envelope breakpoints, arpeggio
steps, glissando steps and noise retriggers are included independently of that
interval. Absolute positions round to the nearest 4 ms tick; half ticks round up.

| Effect | Example directive | Behavior |
| --- | --- | --- |
| Volume slide | `volume_slide { from 24 to 0 over 200ms }` | Linear volume ramp; endpoint held; final range 0..31 |
| Relative volume | `volume_slide { delta -12 over 1/8 }` | Starts from instrument volume at each note |
| Portamento | `frequency_slide { to g4 over 240ms }` | Logarithmic interpolation in musical pitch |
| Relative pitch | `frequency_slide { delta -600cents over 300ms }` | Cents or semitones relative to starting note |
| Linear frequency | `frequency_slide { from 800Hz to 100Hz over 200ms curve linear }` | Linear Hz/increment interpolation; optional `from`; default curve is `log` |
| Duty slide | `duty_slide { from 50% to 12.5% over 180ms }` | Linear 8-bit threshold interpolation; raw values/delta also accepted |
| Arpeggio | `arpeggio { offsets 0,4,7 step 40ms repeat }` | Rapid monophonic pitch switching; repeat is default |
| Once arpeggio | `arpeggio { offsets 0,-12 step 32ms once }` | One traversal, then holds last pitch |
| Glissando | `glissando { direction down step 1semitone every 32ms to c3 }` | Discrete pitch steps; optional target stops the slide; default direction up, step 1 |
| Hard cut | `note_cut { after 120ms }` | Silences pitch/volume; written timeline continues |
| Vibrato | `lfo { target pitch wave sine depth 25cents period 160ms phase note }` | Centered modulation around transformed pitch |
| Duty LFO | `lfo { target duty wave triangle depth 12.5% period 240ms phase song }` | Centered modulation around base/sliding duty |
| Volume LFO | `lfo { target volume wave square depth 4 period 200ms }` | Additive centered volume modulation, clamped 0..31 |
| Noise retrigger | `noise_retrigger { every 16ms seed 37 onset yes }` | Channel 3 only; periodically restart LFSR and noise phase |

Slides require exactly one `to` or `delta` and an `over` duration at least
4 ms. They restart at note onset, stop at their target and hold it. Frequencies
clamp to nonzero uint16 increments. Arpeggios accept 2..16 signed semitone
offsets in -71..71; generated notes and glissando clamp to C1..B6. Their steps
must be at least 4 ms. They never restart the amplitude envelope. Noise
retrigger intervals must be at least 4 ms; seeds are 1..63, onset defaults to
yes. `onset no` waits one interval before the first reseed. Retriggering ends
at cut/note-off (or release completion); rests generate no periodic commands.

LFO waves are sine, triangle and square, with periods at least 8 ms. Use either
`period` or `rate 6Hz`. Phase defaults to `note`; `song` follows absolute score
time, independently per channel. Sine starts at zero rising, triangle at -1,
square at +1. Pitch depth accepts cents or semitones (at most 96 semitones);
duty depth accepts raw threshold delta or percentage of 256; volume depth
accepts raw delta or percentage of 31. All are nonnegative. One LFO per target
can run simultaneously with LFOs on the other targets. `lfo pitch off` disables
one target; `lfo off` disables all. Duty effects are invalid on noise.

Existing envelope `tremolo { period 1/8 depth 30% wave sine phase song }` remains
attenuating: it multiplies volume by 70..100%, unlike the centered additive
volume LFO. It is also accepted as an instrument/channel directive. It preserves
its historical sine/triangle/square phases and note/song phase semantics.

## Composition and timing rules

Processing order is base note/instrument, one base pitch transform, pitch LFO,
base duty/duty slide, duty LFO, envelope multiplied by the volume slide,
attenuating tremolo, additive volume LFO, then hard cut/off, clamping and integer
quantization. Volume slides specify the pre-envelope base volume. Effects
continue through release tails until a new note/cut/loop boundary cancels them.
Ties extend one timeline and never retrigger effects. Rests do not restart
effects; the next sounded note does. A hard cut cancels the release and all
remaining modulation for that note, so later samples cannot reactivate it.

Only one of frequency slide, arpeggio, and glissando may be active on a note;
conflicting combinations produce a location diagnostic. Each can combine with
vibrato, duty effects, envelopes and amplitude modulation. Coincident channel
changes merge into one event; unchanged quantized values are omitted. Explicit
note onsets remain pitch events for articulation/diagnostics, though they do not
reset phase. Seed commands are never deduplicated. Loop entry restores complete
initial controls and restarts the precompiled song-relative modulation pattern.

```text
automation 8ms
envelope soft { points 0ms:0%, 12ms:100%, 80ms:65% release 40ms:0% }
instrument laser {
    wave pulse duty 25% volume 24 envelope soft
    frequency_slide { delta -1200cents over 240ms }
    volume_slide { to 8 over 240ms }
    lfo { target pitch depth 12cents period 160ms }
    lfo { target duty wave triangle depth 6.25% period 240ms }
    note_cut { after 280ms }
}
channel 1 laser { c:400ms }
```

`--stats` reports bytes, event count, pitch, volume, duty, and retrigger changes.
The default budget is two million generated updates; `--max-updates N` raises
it and `--max-updates 0` disables the guard. The Python API uses `None` for no
limit. Fast modulation increases asset size and foreground FX/service work;
four changing extended controls every tick alone require about 2500 bytes/s.
No musical effect state, interpolation, LFO calculation or counters run on AVR.
The only added runtime operation is atomic noise reseeding.

## Timers, atomic publication, and memory

Timer1 uses CTC, prescaler 8, TOP 255/127. Timer0 remains an independent 1 kHz
clock, prescaler 64, TOP 249, and publishes a saturating pending tick every
4 ms. Timer3 is stopped/masked and releases its speaker pin. Timer4 uses the
64 MHz PLL clock, TOP 255, and the existing complementary differential outputs.
Startup clears inherited power gates/interrupts. Sample generation never uses
SPI or floating point.

Every Timer1 interrupt writes the held PWM sample first, at 21 CPU cycles from
the compare deadline plus acceptance delay. It then accepts pending controls
and synthesizes the successor. Neither rate nor duty alters that store timing.
Timer1 COMPA wins simultaneous pending arbitration over Timer0; an already
running Timer0 ISR is not preempted. The unchanged startup/rate-switch sequence
seeds Timer1 from Timer0, placing deadlines 64..120 cycles apart modulo 128.

The live latch remains 15 bytes: four `(increment, prepared_amplitude)` triples
plus three duty bytes. Desired music/SFX voices are four-byte records:
increment low/high, volume, duty. Foreground waits for acknowledgement before
reusing the 15-byte staging buffer; one descriptor-byte store publishes it.
Bit 7 means ready, bits 0..5 contain optional seed 1..63 (zero means no reseed),
bit 6 is unused. Timer1 copies all controls then reseeds before the next sample.
Transient commands are not retained with desired state. Foreground never
writes live noise while Timer1 can run. IRQ-disabled/stopped output applies
packets directly; rate switching explicitly carries no reseed command.

| Persistent state | Bytes |
| --- | ---: |
| Pending ticks, boot-hold byte, two masters | 4 |
| Live increments/amplitudes and duty | 15 |
| Phases and noise LFSR | 9 |
| Desired music voices / SFX slots | 16 / 8 |
| Music / SFX stream records | 10 / 7 |
| Pending latch and descriptor | 16 |
| Held sample and rate | 2 |
| Total | 87 |

Audio occupies 0A15..0A6B, private end 0A6C. Existing 72-byte formatter/text
scratch ends at 0AB4, leaving 76 bytes for native stack. Audio aliases 20 scratch
bytes: dirty, transient reseed and 18-byte event buffer; persistent state and
the pending packet never alias scratch. Guest memory addresses are unchanged.
Assembler assertions retain the single-SRAM-page and minimum-stack constraints.
Timer1 uses 9 stack bytes including interrupt PC, 11 while calling the fixed
copier. It preserves r0/r1/r20/r21/r26/r27 and SREG; Z is untouched even on the
pending path. The foreground preserves borrowed VM state and guest flags.

The compact FX reader performs one interruptible burst per due event with
24-bit cursors and actual-consumption advancement, preserving speculative
instruction-fetch transactions. The seek hook costs four cycles without a tick.
Long native calls/straight-line bytecode can delay service: the old controls
remain audible, then catch-up commits only the resulting state. Intermediate
transitions/reseeds cannot be recovered. Pending time saturates at 255 ticks
(1020 ms). Audio needs frequent safe points for rapid effects.

## Demo, validation and limits

`projects/audio_demo/music.avms` retains Sunlit Garden's 39.936-second form,
with pulse melody/vibrato on 0, harmony on 1, 50% pulse bass on 2 and noise on 3.
`effect.avms` demonstrates simultaneous pitch/volume/duty slides, cut and
retrigger. `effects.avms` additionally demonstrates arpeggio and glissando.
A triggers SFX; B pauses; Up changes rate. Left/right switch between Sunlit
Garden and four MIDI imports with wraparound, preserving pause and rate.
See [MIDI arranger](midi_to_avms.md) for conversion, reports and limitations.
Build `audio_demo_assets` then
`avm_audio_demo`; the checked-in package is `projects/audio_demo/audio_demo.arduboy`.

See [audio-benchmarks.md](audio-benchmarks.md) for measured resource results.
`avm_audio_tests_run` uses Ardens' AVR instruction emulator for samples,
sequencing, ownership, publication races, SPI and native-stack checks, plus
Python compiler tests and Mini/FX-C assembly. `avm_tests_run` adds all interpreter
and guest C/C++ fixtures. Large exported C/C++ assets are exercised beyond 64 KB.

Fast arpeggios/LFOs and narrow pulses can alias at either synthesis rate;
useful smooth modulation needs several automation samples per period. Keep
tonal increments below 16384 for the 8 kHz Nyquist limit, or 32768 at 16 kHz;
pulse harmonics can still alias. Quantization limits small/slow modulation.
Abrupt duty/cut/ownership changes can click. Four loud voices can clip.

These checks are simulator verification. Physical Arduboy listening, speaker
polarity, PLL/carrier timing, analog DC/click behavior, power draw and FX-C/Mini
pad routing still need hardware validation. Mini needs an added speaker.

Conceptual reference: [ATMlib2 documentation](https://github.com/moduscreate/ATMlib2)
and [its effect implementation](https://github.com/moduscreate/ATMlib2/blob/master/src/atm_synth.c).
AVM compiles effects offline and uses different timing, amplitude ranges,
interpolation, ownership slots and noise reseeding semantics; its firmware does
not port ATMlib2's effect engine.
