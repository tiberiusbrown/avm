# AVMS score format and hardware PWM audio

AVMS (`.avms`) is AVM's text format for music and sequenced sound effects.
The asset compiler, [`tools/avm_music.py`](../tools/avm_music.py), resolves
notes, instruments, envelopes, and effects into timed pitch, volume, waveform, pulse-duty,
and noise-seed updates. The device plays that binary stream; it does not parse
AVMS or calculate musical effects during playback.

This page documents both the source language and its playback format:

- [Getting started with AVMS](#getting-started-with-avms)
- [Asset compiler and exports](#asset-compiler-and-exports)
- [AVMS file structure and score settings](#avms-file-structure-and-score-settings)
- [Channels, notes, and rhythm](#channels-notes-and-rhythm)
- [Phrases, repeats, and ties](#phrases-repeats-and-ties)
- [Instruments and sound settings](#instruments-and-sound-settings)
- [Envelopes, gates, and releases](#envelopes-gates-and-releases)
- [Offline musical effects](#offline-musical-effects)
- [Composition and timing rules](#composition-and-timing-rules)
- [Diagnostics and troubleshooting](#diagnostics-and-troubleshooting)
- [API, channels, and ownership](#api-channels-and-ownership)
- [Pulse, triangle, and noise synthesis](#pulse-triangle-and-noise-synthesis)
- [Binary formats: A5 and D1–D3](#binary-formats-a5-and-d1d3)
- [Timers, atomic publication, and memory](#timers-atomic-publication-and-memory)
- [Demo, validation and limits](#demo-validation-and-limits)

For arrangement, mix levels, and composing for the Arduboy speaker, see the
[music composition guide](music_composition_guide.md). For converting MIDI
files, see the [MIDI arranger](midi_to_avms.md).

For offline A5 rendering, emulator validation, and audio-guided MIDI fitting,
see [Stage 2](midi_to_avms_stage2.md). Its default previews use 15,625 Hz;
the hardware default remains 7812.5 Hz.

AVM has three identical pulse/triangle oscillators and one noise
oscillator. Timer1 synthesizes at 7812.5 Hz (default) or 15625 Hz. Timer4 drives
the differential PC6/PC7 speaker outputs with a 250 kHz hardware PWM carrier.
Pulse waveform duty and Timer4's output compare duty are different quantities.

## Getting started with AVMS

A complete one-shot song can be one line:

```text
channel 0 { c4 d e g }
```

This uses the defaults: tempo 120 quarter-note beats per minute, octave 4,
quarter-note durations, pulse duty 128 (50%), volume 24, and full-length gates.
It plays C4, D4, E4, and G4, then ends. **In a channel sequence, the number in
`c4` is the duration denominator, not the octave.** Set the octave with
`octave 4`; use apostrophes and commas for individual octave shifts.

Here is a complete four-channel loop. Save it as `song.avms` and compile it
using the commands in the next section. Each channel contains one 4/4 measure.

```text
title "A small loop"
description "Pulse melody, arpeggiated harmony, bass, and noise percussion"
tempo 120
meter 4/4
automation 8ms
loop

envelope pluck {
    points 0ms:0%, 8ms:100%, 80ms:60%
    release 24ms:0%
}
instrument lead { duty 25% volume 12 envelope pluck gate 90% }
instrument bass { duty 50% volume 8 gate 80% }
instrument hat { wave noise volume 3 note_cut { after 32ms } }
phrase melody { c8 d e g e4 r4 | }

channel 0 lead octave 4 { melody }
channel 1 octave 3 {
    duty 12.5% volume 6
    arpeggio { offsets 0,4,7 step 40ms }
    c2 g2 |
}
channel 2 bass octave 2 { c2 g2 | }
channel 3 hat octave 6 { repeat 8 { c16 r16 } | }
```

For a sound effect, add `sfx` before the definitions and declare channel 1,
channel 3, or both. This complete `pickup.avms` claims both SFX slots for
240 ms of written score time, even while either part is silent:

```text
sfx
automation 8ms
instrument zap {
    duty 25% volume 12
    frequency_slide { delta -1200cents over 160ms }
    volume_slide { to 0 over 180ms }
    note_cut { after 180ms }
}
instrument burst {
    wave noise volume 6
    noise_retrigger { every 16ms seed 37 }
    note_cut { after 60ms }
}
channel 1 zap octave 5 { c:240ms }
channel 3 burst octave 4 { c:80ms r:160ms }
```

## Asset compiler and exports

`tools/avm_music.py` uses only Python's standard library and is installed in
the SDK's bin directory. Run it from the repository root, or invoke the
installed script using its installed path:

```sh
python tools/avm_music.py song.avms song.bin --stats
python tools/avm_music.py song.avms song.h --name song
python tools/avm_music.py pickup.avms pickup.h --name pickup --stats
```

| Argument | Meaning |
| --- | --- |
| `source` | UTF-8 AVMS input file |
| `output` | Output path; missing parent directories are created |
| `--name IDENTIFIER` | Emit a C/C++ program-memory asset named `IDENTIFIER` |
| `--automation-ms N` | Override the score's smooth automation interval; integer multiple of 4, at least 4 |
| `--stats` | Print byte, event, pitch, volume, duty, and noise-retrigger counts to standard error |
| `--max-updates N` | Set the compiler's generated-update budget; default 2,000,000; 0 disables the guard |

The output is raw binary unless `--name` is supplied, regardless of filename
extension. Thus an output named `song.h` still needs `--name song`. An export
name must be a valid identifier such as `song` or `pickup_sound`.

Generated headers include `<avm/audio.h>` and declare the asset with
`AVM_PROGMEM`. Include them in guest C or C++ code and pass the exported names
directly to the playback API:

```c
#include "song.h"
#include "pickup.h"

void start_music(void) {
    avm_audio_music_volume(128);
    avm_audio_play(song);
}

void play_pickup(void) {
    avm_audio_sfx(pickup);
}
```

Near the beginning, each generated header reports `Compiled song size: N bytes.`
or `Compiled SFX size: N bytes.` The count is exactly `len(data)`: stream
headers, events, and terminal commands, excluding final `uint64_t` padding.
The same comment appears for large assets stored in chunked structures.
Raw binary exports and the existing opt-in `--stats` output are unchanged.

`avm_audio_play` expects A5 music; `avm_audio_sfx` expects D1–D3 SFX. The
compiler chooses the header from the score's `sfx` setting and declared
channels. The filename does not determine the stream type. Playback enables
output and advances automatically at interpreter safe points.

The Python entry points are:

```python
from tools.avm_music import compile_source, c_array

stats = {}
data = compile_source(
    "channel 0 { c4 d e g }",
    filename="song.avms",
    automation_ms=None,
    max_updates=2_000_000,
    statistics=stats,
)
header = c_array(data, "song")
```

`compile_source` returns `bytes`; `filename` labels diagnostics, `None` for
`automation_ms` uses the score setting, and `statistics` is an optional
dictionary populated with counts. Use `max_updates=None` to disable the API
budget; the CLI maps `--max-updates 0` to this value. The `events` statistic
counts resolved update records before insertion of long-wait Continue records
and the terminal End/Loop command.

`c_array` exports packed little-endian `uint64_t` words with at most seven
trailing zero bytes. Large C/C++ exports use contiguous chunks when necessary.
No 64 KB asset-size cap is introduced; streams and program addresses remain
24-bit. The End/Loop command makes export padding inert.

## AVMS file structure and score settings

An AVMS file consists of score settings, reusable definitions, and one or more
channel blocks. All score settings must precede the first definition or channel.
Definitions and channels may then appear in any order; references are resolved
after parsing, so a definition may be used before it appears in the file.

```text
// Score settings
tempo 120
meter 4/4

// Reusable definitions
envelope soft { points 0ms:0%, 12ms:100% release 40ms:0% }
effect shimmer { lfo { target pitch depth 25cents period 160ms } }
instrument lead { volume 12 envelope soft effects shimmer }
phrase riff { c8 d e g }

// Concurrent channel sequences
channel 0 lead octave 4 { repeat 4 { riff } }
channel 2 octave 2 { c1 }
```

Spaces, tabs, and line breaks separate tokens. Semicolons are optional
separators; braces delimit blocks. `//` begins a comment through the end of the
line. Quoted text uses double quotes and supports escapes such as `\"` and `\n`.
Use the lowercase keywords and exact unit spellings shown here, including
`Hz`. Note letters may be uppercase or lowercase. Definition names are case
sensitive; use identifiers beginning with a letter or underscore, followed by
letters, digits, or underscores.

### Score settings

Each setting may occur at most once.

| Setting | Default | Meaning and constraints |
| --- | --- | --- |
| `tempo 120` | `120` | Positive quarter-note BPM; integers, decimals, and fractions such as `1250/13` are accepted |
| `meter 4/4` | `4/4` | Positive whole-note fraction defining a measure for `\|` checks; `3/4` is three quarter-note beats |
| `automation 8ms` | `8ms` | Smooth automation sampling interval; positive multiple of 4 ms |
| `loop` | One-shot music | Rewind the whole music stream at its fixed end; written duration must be at least 8 ms |
| `sfx` | Music | Produce one-shot SFX; only channels 1 and/or 3 may be declared; incompatible with `loop` |
| `title "Name"` | Absent | Descriptive source text; not stored in the binary |
| `description "Text"` | Absent | Descriptive source text; not stored in the binary |

Tempo and meter are fixed for the whole score. Meter checks written bar lines;
it does not insert rests, accents, or bar lines. At least one channel is
required, and a one-shot score needs at least 4 ms of written duration.
Place `tempo` before settings using musical times, such as `automation 1/64`,
so those times use the intended tempo when parsed.

### Time and numeric values

Numeric fields generally accept integers, decimals, and rational fractions;
fields documented as integers reject fractional values. A leading `+` or `-`
is accepted where the field's range permits it. Time values use:

| Form | Meaning | Example at tempo 120 |
| --- | --- | --- |
| `48ms` | Milliseconds | 48 ms |
| `0.25s` | Seconds | 250 ms |
| `3ticks` | 4 ms ticks | 12 ms |
| `1/8` | Fraction of a whole note | 250 ms |
| `1` | One whole note | 2000 ms |

These forms apply to explicit note/rest times, envelope points, and effect
durations. A unitless time is always a whole-note fraction, including `1`;
it is not milliseconds or quarter-note beats. Time cannot be negative.
Envelope levels and gates accept either fractions (`1/2`, `0.5`) or
percentages (`50%`); duty and LFO percentages have their own scales below.

## Channels, notes, and rhythm

### Channel declarations

The declaration syntax is `channel NUMBER [INSTRUMENT] [octave OCTAVE] { ... }`,
where bracketed parts are optional. Declare each physical channel at most once:

```text
instrument lead { volume 12 duty 25% }
channel 0 lead octave 5 { c4 d e g }
channel 2 octave 2 { c2 g2 }
```

All channel timelines start at score time zero and play concurrently. Within
each channel, notes and rests advance a single monophonic timeline. A channel
without an instrument uses the default sound settings. Initial octave is 4
and initial inherited duration is a quarter note, independently per channel.

The declared channels determine binary ownership, even if a channel contains
only rests. Pulse/triangle hardware is fixed to channels 0..2, noise to channel 3;
the `wave` setting does not reroute a voice. Use `wave noise` for noise
instruments. On channel 3 the note's pitch controls the noise clock rate,
rather than the fundamental frequency of a pitched pulse.

The score length is the longest written channel timeline. Shorter parts become
silent after their sounding notes and release tails finish. Rests at the end
still contribute to written duration. One-shot playback can extend to retain
a final release; a loop always uses the longest written timeline as its fixed
boundary. Write trailing rests to make the intended loop length explicit.

### Note and rest syntax

A sequence note has this form:

```text
LETTER [# or b] [octave marks] [duration and dots] [:explicit_time] [*multiplier] [@instrument]
```

Keep the letter, accidental, octave marks, duration, and dots together as one
token, as in `c#'8.`. Use either a duration denominator or an explicit `:time`.
The accidental and octave marks precede the duration; the multiplier precedes
`@instrument`.

| Notation | Meaning |
| --- | --- |
| `c4` | C at the current octave, quarter note |
| `c#8`, `db8` | C sharp or D flat, eighth note; accidentals apply to this note only |
| `c'8`, `c,8` | One octave above or below the current octave, eighth note |
| `c''4`, `c,,4` | Two octaves above or below; marks may be repeated |
| `octave 5` | Change the base octave for subsequent notes |
| `r4`, `s4` | Quarter rest; `r` and `s` are equivalent |
| `e` | E with the inherited duration |
| `c4.`, `c4..` | Dotted or double-dotted quarter note |
| `c8*2/3` | Eighth-note duration multiplied by 2/3; useful for tuplets |
| `c:48ms`, `r:3ticks` | Explicit note or rest duration |
| `c8@bell` | Eighth-note C using the complete `bell` instrument for this note |
| `c4 ~ c4` | Two quarter notes joined into one attack and effect timeline |
| `\|` | Verify that the current position is an exact measure boundary |

Notated pitches must resolve to MIDI 24..95 (C1..B6); `octave` accepts 1..6.
An apostrophe or comma shifts only its own note. For example,
`octave 4 c'4 d4` plays C5 followed by D4. Accidentals carry across an octave
boundary in the usual way, provided the resulting pitch is in range. There
are no key signatures or automatic carry-over of accidentals.

In effect endpoints such as `frequency_slide { to g4 over 100ms }`, `g4`
instead names the absolute pitch G4. Endpoint pitches use scientific pitch
notation (`c4`, `f#3`, `bb2`) or a positive frequency such as `440Hz`.

### Durations and inheritance

A note duration denominator must be a positive power of two: `1` whole,
`2` half, `4` quarter, `8` eighth, `16` sixteenth, and so on. At tempo `BPM`,
an undotted duration `N` lasts `4 * 60000 / (BPM * N)` milliseconds.
One dot multiplies by 3/2, two by 7/4, three by 15/8. Dots require an explicit
denominator: write `c8.` rather than `c.`.

An explicit denominator updates the channel's inherited duration, including
its dots. Notes and rests both participate in inheritance:

```text
channel 0 { c4 d8 e r2 }
```

At tempo 120, this is C for 500 ms, D for 250 ms, E for 250 ms, and a
1000 ms rest. An explicit `:time` or `*multiplier` affects that item only;
neither changes the inherited duration beyond any written denominator:

```text
channel 0 { c8*2/3 d c:48ms e }
```

Here D and E are ordinary eighth notes. Three copies of `c8*2/3` occupy the
same written time as one quarter note. Every final note/rest duration must
be at least 4 ms, including after multiplication. Written timestamps use exact
rational arithmetic; the compiler rounds absolute positions to playback ticks
after constructing the timeline.

### Rests, articulation, and bars

A rest advances written time and starts no note or effect timeline. It cannot
have an accidental, octave marks, an instrument override, or a tie. A preceding
release tail may continue during the rest. To silence a note earlier, shorten
its gate or use `note_cut` as appropriate.

Repeated notes such as `c8 c8` produce separate onsets and restart envelopes
and note-relative effects, while oscillator phase remains continuous. Use a
tie when you want one sustained attack. With a flat envelope and a 100% gate,
adjacent identical notes can sound continuous; use an envelope or a shorter
gate for audible separation.

Bar lines consume no time and check the exact written position from the start
of the channel. At `meter 3/4`, `c4. d8 e4 |` is valid. An incomplete final
measure is accepted if no bar line checks it. Explicit millisecond durations
are also checked exactly, before 4 ms quantization.

## Phrases, repeats, and ties

Define a reusable sequence with `phrase NAME { ... }`, then invoke its name
as a sequence item. `repeat COUNT { ... }` expands its body a positive integer
number of times. Both constructs can contain notes, rests, settings, effects,
bar checks, other phrases, and nested repeats:

```text
phrase riff { c8 d e g }
phrase answer { e4 d }
channel 0 octave 4 {
    repeat 2 { riff answer | }
    octave 5
    riff answer |
}
```

Expansion happens at compile time. Phrases and repeats share the caller's
octave, inherited duration, sound settings, and current time. Changes made
inside them persist afterward and into later repeat iterations. They do not
introduce a local scope or consume less binary space simply by reusing source
text. Recursive phrases, including indirect recursion, are rejected. Phrase
names cannot conflict with note notation or sequence commands; `riff` is valid,
while `c`, `r4`, and `repeat` are not.

`~` must connect adjacent sounded notes with the same resolved pitch and
complete sound settings. Their durations merge into one note; the envelope,
gate fraction, slides, arpeggio, LFO phase, retriggers, and note cut all use the
combined lifetime. A rest, changed instrument setting, different pitch, or
missing following note makes the tie invalid. For example:

```text
channel 0 {
    lfo { target pitch depth 25cents period 160ms }
    c4 ~ c4
    r2
}
```

This holds C for a half note with one vibrato timeline, followed by a half rest.

## Instruments and sound settings

An instrument is a named set of sound settings and optional effects:

```text
instrument bell {
    wave pulse
    duty 12.5%
    volume 12
    gate 80%
}
channel 0 bell { c4 d e g }
```

| Setting | Default | Meaning |
| --- | --- | --- |
| `wave pulse` | `pulse` | `pulse` (alias `square`) or `triangle` on channels 0..2; `noise` requires channel 3 |
| `volume 12` | `24` | Integer base amplitude 0..31, before envelope/effects and runtime master gain |
| `duty 25%` | `128` | Pulse threshold, raw value or percent of 256; rounded and clamped to 0..255 |
| `gate 80%` | `100%` | Fraction of written note duration before release begins; greater than 0 and at most 100% |
| `envelope soft` | Flat at 100%, no release | Select a named envelope |
| `effects shimmer` | No bundle | Apply a named effect bundle; repeat the directive to apply additional bundles |
| An effect directive | Disabled | Add one of the effects documented below |

Each ordinary instrument field and each individual effect target may be set
once in an instrument. Multiple `effects NAME` directives are allowed.
Octave and note duration belong to channel notation, so `octave` is set on
the channel rather than inside an instrument.

Pulse duty uses a 256-step cycle: `12.5%` = 32, `25%` = 64, and `50%` = 128.
`100%` clamps to 255. Duty 0 is always negative; duty 255 retains one negative
phase bin. Use ordinary intermediate duties for musical tones. Static duty is
meaningful during pulse synthesis on channels 0..2; noise does not use it.
Triangle retains the current duty threshold and ignores it during synthesis.
Changing duty while triangle is selected updates that stored threshold;
switching back to pulse uses it. Each tonal channel selects its own waveform,
with pulse as the default. Channel 3 always synthesizes noise.

```text
instrument bass { wave triangle volume 16 }
channel 2 bass octave 2 { c4 duty 25% c4 wave pulse c4 wave triangle c4 }
```

Waveform directives and instrument selections apply to following notes.
Waveform changes preserve oscillator phase, as pitch and duty changes do.
An oscillator's `wave triangle` is independent of `lfo { wave triangle ... }`
or tremolo: those nested `wave` fields select offline modulation curves.

### Selecting and overriding sounds

Inside a channel or phrase, `volume`, `duty`, `wave`, `gate`, and `envelope`
change the current sound for subsequent notes. They take the same values as
instrument fields. `use NAME` replaces the complete current sound with the
named instrument, including its effects. `octave` changes notation separately.

```text
instrument lead { duty 25% volume 12 }
instrument bell { duty 12.5% volume 8 }
channel 0 lead octave 4 {
    c8
    volume 6 d8
    e8@bell
    f8
    use lead g4
    octave 5 c4
}
```

Here D and F use the lead sound at volume 6; only E uses `bell`. `use lead`
restores volume 12 for G. `@bell` replaces all sound settings for its note,
including effects, rather than layering them over the current channel sound.
Neither `use` nor `@instrument` resets octave or inherited duration. To return
to a flat envelope, select an instrument whose envelope is unspecified;
`envelope off` is not a special command.

### Reusable effect bundles and precedence

An `effect` definition holds effect directives; apply it with `effects NAME`
inside an instrument, channel, or phrase:

```text
effect shimmer {
    lfo { target pitch depth 25cents period 160ms }
    lfo { target duty depth 6.25% period 240ms wave triangle }
}
instrument lead {
    effects shimmer
    volume 12
    lfo { target pitch depth 12cents period 200ms }
}
channel 0 lead {
    c2
    lfo pitch off
    d2
}
```

Bundles contain effects, including `off` directives, and cannot contain sound
fields or nested `effects NAME` applications. Each effect target may occur
once per bundle. Instrument bundles apply in listed order, with later bundles
overriding earlier values for the same effect. Explicit instrument effects
then override bundled effects, regardless of their textual position in the
instrument. Channel directives and bundle applications update the current
sound in sequence order. `use` replaces that sound; a per-note `@instrument`
uses the selected instrument instead of all channel overrides.

In this example the instrument's pitch depth is 12 cents, its duty LFO comes
from `shimmer`, and D disables only the pitch LFO. Each enabled effect restarts
at each new onset, except the absolute phase reference of `phase song` LFOs
and tremolo. Settings written after a note affect later notes, even though the
earlier note may still have a sounding release tail.

## Envelopes, gates, and releases

Define an envelope and select it with `envelope NAME`:

```text
envelope soft {
    points 0ms:0%, 12ms:100%, 80ms:65%
    release 40ms:0%
    curve linear
}
instrument pad { volume 12 envelope soft gate 75% }
channel 0 pad { c:200ms r:100ms }
```

| Envelope field | Default | Meaning and constraints |
| --- | --- | --- |
| `points TIME:LEVEL, ...` | `0ms:100%` | Attack/decay contour from note onset; first time must be zero, later times strictly increasing |
| `release TIME:LEVEL, ...` | No release | Contour from the gate boundary; times strictly positive and increasing; last level must be zero |
| `curve linear` | `linear` | `linear` interpolates; `step` holds the previous level until the next breakpoint; applies to points and release |
| `tremolo { ... }` | None | Multiply the envelope by attenuating tremolo, as described below |
| `sustain` | Last point already held | Optional standalone marker; takes no value and does not change the contour |

Each field may appear once. Levels are fractions 0..1 or percentages 0..100%.
After the last `points` breakpoint, its level sustains until the gate boundary.
An empty `envelope flat { }` is equivalent to a constant 100% contour without
release. There is no implicit amplitude ramp in firmware.

Gate is measured against the full written note duration, including tied
segments. In the example, the gate boundary is at 150 ms (75% of 200 ms).
Release begins at the envelope's actual level at 150 ms and reaches zero
40 ms later. The next written item still starts at 200 ms. If the note ends
during its attack, the release starts from that partially attained level,
without jumping to the contour's final sustain level.

With no release, the note is silenced at its gate boundary. With a release,
the tail may extend beyond the written note and into rests. The next sounded
note on that channel cancels the tail. One-shot scores retain final tails
beyond the longest written channel duration; loops truncate tails at the
fixed loop boundary. A hard `note_cut` cancels the release immediately.

Envelope breakpoints always contribute candidate control times. Linear
segments also use smooth automation samples; `curve step` keeps abrupt changes
at its breakpoints. The contour multiplies the base volume or volume-slide
value, then other amplitude effects apply. Small changes can disappear after
rounding to the 0..31 channel-volume range.

## Offline musical effects

Effects may be written in instruments, effect bundles, channel sequences, or
phrases. Place a directive before the note it modifies. A channel directive
persists for subsequent notes and restarts its timeline at each onset. `off`
disables that effect for subsequent notes:

```text
channel 0 {
    frequency_slide { delta -100cents over 120ms }
    c4 d4
    frequency_slide off
    e2
}
```

Every effect has a braced parameter block, except its `off` form. Fields may
appear in any order; semicolons are optional. Ordinary effect fields must not
be repeated. All time values accept `ms`, `s`, `ticks`, or unitless whole-note
fractions. Smooth changes are sampled offline; discrete boundaries are also
included independently of the automation interval.

### Volume, frequency, and duty slides

Slides require `over` and exactly one of `to` or `delta`. Optional `from`
selects the starting value; otherwise the current note's base value is used.
`over` must be at least 4 ms. The endpoint holds until the note stops. A slide
restarts for every note and does not glide automatically from the previous
note's final state.

| Directive | Example | Values and behavior |
| --- | --- | --- |
| `volume_slide` | `volume_slide { from 24 to 0 over 200ms }` | Linear base-volume ramp; values clamp to 0..31 before multiplying the envelope |
| Relative volume | `volume_slide { delta -12 over 1/8 }` | Start from the selected instrument/channel volume; add a raw volume delta |
| `frequency_slide` | `frequency_slide { to g4 over 240ms }` | Absolute note or positive Hz endpoint; default `curve log` moves uniformly in musical pitch |
| Relative frequency | `frequency_slide { delta -600cents over 300ms }` | Pitch delta in `cents`, `semitone`, or `semitones`, within -96..96 semitones |
| Linear frequency | `frequency_slide { from 800Hz to 100Hz over 200ms curve linear }` | Linear interpolation in Hz; `from` also accepts an absolute pitch such as `g4` |
| `duty_slide` | `duty_slide { from 50% to 12.5% over 180ms }` | Linear pulse threshold ramp; raw values or percentages of 256 |
| Relative duty | `duty_slide { delta -32 over 120ms }` | Add a raw threshold delta; percentage deltas are also accepted |

Only frequency slides accept `curve`, either `log` or `linear`. With both
`from` and `delta`, the delta is relative to `from`. Volume/duty deltas are
additive; a pitch delta changes frequency by the corresponding musical
interval. Final sounding increments clamp to 1..65535, so frequency effects
may go beyond the C1..B6 range of written notes. Duty rounds and clamps to
0..255. Duty slides require a tonal channel.

### Arpeggio

```text
channel 1 octave 3 {
    arpeggio { offsets 0,4,7 step 40ms repeat }
    c2
    arpeggio { offsets 0,-12 step 32ms once }
    g2
}
```

`offsets` and `step` are required. Supply 2..16 comma-separated integer
semitone offsets, each in -71..71, relative to the written note. The first
offset sounds at onset; the next sounds after one `step`, which must be at
least 4 ms. `repeat` is the default; `once` traverses the list once and holds
its last pitch. Choose at most one of these flags. Resulting notes clamp to
C1..B6. Pitch switches preserve oscillator phase and do not restart the
amplitude envelope. `arpeggio off` returns later notes to ordinary pitch.

### Glissando

```text
channel 0 {
    glissando { direction down step 1semitone every 32ms to c3 }
    c2
    glissando off
    e2
}
```

`every` is required and must be at least 4 ms. Optional `direction` is `up`
(default) or `down`. Optional `step` defaults to 1 semitone; it may be a
positive fractional value up to 71, with an optional `semitone`/`semitones`
suffix. The written pitch sounds at onset and moves one step per interval.
Generated steps clamp to C1..B6. Optional `to` accepts an absolute pitch or
positive Hz target in the chosen direction; the slide stops there and holds.
Steps do not restart the envelope. `glissando off` disables it for later notes.

### Hard note cut

`note_cut { after 120ms }` silences pitch and volume at the specified time
from onset, leaving written rhythm unchanged. `after` is required and may be
zero (`after 0ms` makes the note silent). A cut cancels release, modulation,
and retriggers for that note; later LFO samples cannot turn it back on.
`note_cut off` lets subsequent notes use their ordinary gate and release.

### Pitch, duty, and volume LFOs

An LFO is centered modulation added to the current control, or applied as a
musical interval for pitch. It requires `target`, `depth`, and either `period`
or `rate`:

```text
instrument moving {
    volume 12 duty 25%
    lfo { target pitch depth 25cents period 160ms }
    lfo { target duty depth 12.5% period 240ms wave triangle phase song }
    lfo { target volume depth 4 rate 5Hz wave square }
}
channel 0 moving { c2 d2 }
```

| Field | Values and defaults |
| --- | --- |
| `target` | Required: `pitch`, `duty`, or `volume` |
| `depth` for pitch | Required, nonnegative cents or semitones; maximum 9600 cents / 96 semitones |
| `depth` for duty | Required, raw delta 0..256 or percentage 0..100% of 256 |
| `depth` for volume | Required, raw delta 0..31 or percentage 0..100% of 31 |
| `period` | Full cycle duration, at least 8 ms |
| `rate` | Alternative to `period`: positive frequency followed by `Hz`; resulting period must be at least 8 ms |
| `wave` | `sine` (default), `triangle`, or `square` |
| `phase` | `note` (default) restarts phase at onset; `song` uses absolute score time |

Sine begins at zero and rises; triangle begins at -1; square begins at +1
for its first half-cycle, then -1. Depth is the excursion on either side of
the base: `depth 25cents` ranges from -25 to +25 cents, and duty `depth 12.5%`
means a threshold excursion of ±32. Pitch modulation follows the base pitch
transform, duty modulation follows the duty slide, and volume modulation adds
after the envelope and tremolo. Final controls clamp to their legal ranges.

One LFO per target can run at a time, alongside LFOs for the other targets.
Noise accepts pitch and volume LFOs; duty LFOs require channels 0..2.
`lfo pitch off`, `lfo duty off`, and `lfo volume off` disable one target;
`lfo off` disables all three for later notes. Song-relative phase does not
advance another channel's timeline; each channel evaluates the same absolute
score clock. It restarts with the precompiled pattern on a loop.

### Attenuating tremolo

`tremolo` multiplies volume by an attenuation factor. It is accepted inside
an envelope as well as in instruments, channels, phrases, and effect bundles:

```text
envelope pulsing {
    points 0ms:100%
    tremolo { period 1/8 depth 30% wave sine phase song }
}
instrument pad { volume 12 envelope pulsing }
channel 0 pad { c1 }
```

Supply either `period` or `rate ...Hz`, with a period at least 8 ms. Optional
`depth` defaults to 25% and accepts a fraction 0..1 or percentage 0..100%.
`wave` defaults to `sine` and also accepts `triangle` or `square`; `phase`
defaults to `note` and also accepts `song`.

At depth 30%, the multiplier ranges from 70% to 100%. Sine and triangle start
at full level, reach maximum attenuation halfway through the cycle, and return
to full level at the end. Square is full level for the first half and attenuated
for the second. These phases differ from the centered LFO waves. An envelope
tremolo and a sound-setting tremolo multiply if both are present. `tremolo off`
disables the sound-setting tremolo for later notes; an envelope's own tremolo
remains part of that envelope.

### Noise retrigger

```text
instrument roll {
    wave noise volume 6
    noise_retrigger { every 16ms seed 37 onset yes }
    note_cut { after 120ms }
}
channel 3 roll { c:160ms r:80ms }
```

`every` and `seed` are required. The interval must be at least 4 ms and the
seed an integer 1..63. Optional `onset` defaults to `yes`, reseeding at onset
and each interval afterward. `onset no` waits one interval before the first
reseed. The command resets the noise LFSR and noise phase, preserving pitch.
It requires channel 3. `noise_retrigger off` disables it for later notes.

Retriggering runs for the note's sounding lifetime, including release, until
a cut, a new note, release completion, or the loop boundary. Rests start no
retrigger timeline themselves, but an existing release can keep retriggering
during a rest. Seed commands are emitted even when the seed and other controls
are unchanged. A music reseed hidden by SFX ownership is discarded at runtime.

### Combining effects

Only one of `frequency_slide`, `arpeggio`, and `glissando` may be active on
a note. Turn the old transform off before enabling another in a channel:

```text
channel 1 {
    arpeggio { offsets 0,4,7 step 40ms }
    c2
    arpeggio off
    glissando { direction down every 32ms to g3 }
    c2
}
```

Any one base pitch transform can combine with pitch LFO, duty slide/LFO,
envelope, volume slide, tremolo, volume LFO, and note cut. Noise may also
retrigger, but cannot use duty modulation. This complete example layers
several tonal effects:

```text
automation 8ms
envelope soft { points 0ms:0%, 12ms:100%, 80ms:65% release 40ms:0% }
instrument laser {
    wave pulse duty 25% volume 12 envelope soft
    frequency_slide { delta -1200cents over 240ms }
    volume_slide { to 4 over 240ms }
    lfo { target pitch depth 12cents period 160ms }
    lfo { target duty wave triangle depth 6.25% period 240ms }
    note_cut { after 280ms }
}
channel 1 laser { c:400ms }
```

## Composition and timing rules

### Control processing order

The compiler evaluates each note in this order:

1. Resolve the written note, selected instrument, and channel/per-note settings.
2. Apply one base pitch transform, then the pitch LFO.
3. Apply base duty or duty slide, then the duty LFO on tonal channels.
4. Clamp base volume or volume slide to 0..31 and multiply by the envelope.
5. Multiply by envelope tremolo and sound-setting tremolo, if present.
6. Add the volume LFO, then round and clamp the resulting controls.
7. Silence pitch and volume at the effective stop time.

The effective stop is the gate plus release duration, shortened by the next
sounded note, a hard cut, or a loop boundary. Effects continue through release
until that stop. Ties extend one lifetime; rests advance time without starting
effects. The runtime master gain applies later during foreground preparation.

### Sampling and tick quantization

Smooth automation defaults to 8 ms. `automation 4ms` or `--automation-ms 4`
selects finer sampling; the interval must be a positive multiple of 4 ms.
Samples lie on the absolute score-time grid. Onsets, stop/gate boundaries,
slide endpoints, envelope breakpoints, arpeggio steps, glissando steps, and
noise retriggers add their own candidate times, independently of that grid,
while the note remains active.

Absolute source positions round to the nearest 4 ms tick; half ticks round up.
For an update at source time `t` milliseconds, its first-traversal stream
position is `floor(t / 4 + 1/2) + 1` ticks. The extra tick gives every stream
a minimum 4 ms initial wait. At tempo 120, eight consecutive eighth notes
start at ticks 1, 64, 126, 189, 251, 314, 376, and 439. Their timing alternates
around the 250 ms ideal without accumulating rounding drift.

Coincident channel changes merge into one event. If several changes on the
same channel round to the same tick, their values are resolved in source-time
order; at the same source time an old note's off precedes the next onset.
A cut/off removes an earlier seed/onset at that quantized position. Unchanged
quantized controls are omitted, but explicit onsets remain pitch updates and
noise seeds are never deduplicated. The binary preserves phase on every pitch
and duty update.

### End and loop boundaries

For a one-shot, End occurs one tick after the rounded maximum of written
duration and final release completion. A 500 ms single note therefore starts
at 4 ms and reaches End at 504 ms. End itself silences and releases the stream;
a separate off record is unnecessary at that same terminal tick.

For a loop, Loop is scheduled at the rounded written duration, with a minimum
of two ticks. A 2000 ms loop reaches Loop at tick 500; its next first event is
at tick 501, so consecutive pattern onsets are 2000 ms apart. Loop entry
restores all owned initial pitch/volume/waveform/duty controls and restarts precompiled
song-relative modulation. Oscillator phase and ordinary noise state persist;
only explicit noise retriggers reseed. Releases and updates beyond the fixed
loop boundary are truncated.

### Asset size and runtime cost

The default compiler budget is two million generated updates. Raise it with
`--max-updates N`, disable it with `--max-updates 0`, or pass `None` through
the Python API. The budget guards generation before duplicate controls are
removed, so it is not the same as the final event count.

Fast modulation increases binary size and foreground FX/service work. Four
changing extended controls every tick alone require about 2500 bytes/s.
Phrases/repeats expand into ordinary events; long silent or held intervals use
Continue records. No envelope, slide, LFO calculation, or musical effect counter
runs on AVR. Noise reseeding is the explicit transient synthesis command.

## Diagnostics and troubleshooting

Compiler diagnostics include the source filename, line, and column. Invalid
source makes the CLI exit with an error instead of writing a new asset.

| Symptom or diagnostic | What to check |
| --- | --- |
| Pitch is in the wrong octave | In a sequence `c4` is a quarter note; use `octave` and apostrophe/comma shifts |
| `note duration must be a power of two` | Use `c4`, `c8`, etc.; use `*2/3` for tuplets or `:48ms` for explicit time |
| Effect does not change the previous note | Move its directive before that note; directives configure later onsets |
| Later notes retain unexpected settings | Phrases/repeats share state; use `use NAME` or explicit channel settings to restore it |
| A note override loses modulation | `@instrument` selects a complete sound, replacing channel effects for that note |
| `bar line does not fall on a complete measure` | Sum exact written durations against `meter`; `\|` checks rather than pads time |
| Tied notes are rejected | Match resolved pitch and complete sound settings; connect adjacent sounded notes |
| Multiple base pitch effects conflict | Disable the previous slide/arpeggio/glissando before selecting another |
| Noise or duty effect uses the wrong channel | Noise/retrigger requires 3; duty modulation requires 0..2 |
| Music disappears during a silent SFX part | Declared SFX channels retain ownership through rests and volume zero |
| A short rest still contains sound | The previous release may overlap it; adjust gate/release or use a hard cut |
| Repeated notes sound joined | Phase is continuous; shape attacks or reduce gate for separation |
| Automation is inaudible or stepped | Check 4 ms timing and integer volume/duty/pitch quantization; adjust depth or interval |
| `automation exceeds update budget` | Reduce duration/density or explicitly raise `--max-updates` |
| Output `.h` contains binary data | Supply `--name IDENTIFIER` to request a C/C++ export |
| Old asset fails playback | Regenerate A5/D1–D3 assets; earlier A4/C1–C3 headers are rejected |

Use the checked-in [music](../projects/audio_demo/music.avms),
[SFX](../projects/audio_demo/effect.avms),
[effect showcase](../projects/audio_demo/effects.avms), and
[tremolo score](../projects/audio_demo/tremolo.avms) as longer examples.
The parser and encoder in [`avm_music.py`](../tools/avm_music.py), plus
[score tests](../tests/audio/test_score.py) and
[effect tests](../tests/audio/test_effects.py), provide executable examples of
syntax, timing, and validation.

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
End/stop restores its current pitch, volume, waveform, and duty atomically. Oscillators
and phases are shared: there is no hidden fifth oscillator or saved music phase.

`avm_audio_tone(channel, MIDI_note, amplitude)` remains explicitly addressed:
it can override any physical channel 0..3 until `avm_audio_stop_sfx()`. Tonal
direct tones use pulse with duty 128. Channel/amplitude arguments are masked to 0..3/0..31;
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

## Pulse, triangle, and noise synthesis

Each tonal oscillator has a uint16 phase, uint16 increment, uint8 duty, and
prepared uint8 amplitude. It advances phase, then compares its upper byte:
`phase_high < duty` produces +127; otherwise -127. Duty is 0..255, default
128 (exact 50%). Percentages use a 256-step cycle: 12.5%=32, 25%=64, 50%=128;
100% clamps to 255. Duty 0 is always negative; 255 still has one negative phase
bin. These extremes can introduce DC and are useful chiefly as effect endpoints.
At duty 128 every sample equals the former square table for the same phase.

For triangle, let `h = phase >> 8`. If bit 7 is set, complement all eight
bits, then compute `sample = 2*h - 127`. Equivalently,
`sample = 2*min(phase_high, 255-phase_high) - 127`. The 256 bins run from
-127 to +127 and back symmetrically, duplicating the two endpoints. AVR
`SBRC/COM/LSL/SUBI` generates this in four cycles for either half of the phase.
`LDS/SBRS/RJMP` selects pulse or triangle. Including phase advancement, prepared
amplitude load, selection, and multiplication/accumulation, each tonal voice
costs 33 cycles for pulse or 32 for triangle, independent of phase and duty.

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

The source language compiles to a header followed by variable-length timed
records. All hexadecimal values below denote individual bytes. There is no
stored tempo, meter, title, instrument table, source phrase, or asset length;
all musical decisions have already been resolved to control updates.

### Stream headers and pitches

| Stream | Header bytes | Owned physical channels |
| --- | --- | --- |
| Music | `A5 MASK` | Bits 0..3 of `MASK`; nonzero, with no other bits set |
| Tonal SFX | `D1` | 1 |
| Noise SFX | `D2` | 3 |
| Combined SFX | `D3` | 1 and 3 |

Old A4/C1–C3 and earlier headers are rejected. Regenerate assets. Pitches are
little-endian uint16 increments with zero meaning off, encoded for 15625 Hz:
`round(frequency_Hz * 65536 / 15625)`. At 7812.5 Hz foreground preparation
doubles increments, saturating at 65535; desired state remains canonical.
All uint16 increments are legal. MIDI source notation covers C1..B6.
Pitch and duty updates preserve phase, including repeated notes and loops.

### Music events

After `A5 MASK`, an update record is `delta, change_mask, pitches..., controls...`.
Each selected pitch is two bytes; each selected control is one or two bytes.

| Physical channel | Ownership bit | Pitch-update bit | Control-update bit |
| --- | --- | --- | --- |
| 0 | `01` | `01` | `10` |
| 1 | `02` | `02` | `20` |
| 2 | `04` | `04` | `40` |
| 3 | `08` | `08` | `80` |

OR the relevant bits to make each mask. Emit all selected pitches in ascending
channel order, followed by all selected controls in ascending channel order.
For example, an event updating both pitch and control for channels 0 and 2
has change mask `55` and payload order `pitch0, pitch2, control0, control2`.
An update may mention only owned channels. Unselected controls retain their
previous values; a pitch-only update does not reset volume, waveform, or duty.

Initial desired volume is 24, duty 128, waveform pulse, pitch off. Every compiler-generated
first event initializes the pitch and control of every owned voice, including
tonal waveform and duty, even when the voice starts with a rest. This also establishes the
complete initial controls at loop entry.

### Control bytes

| Control bits | Meaning |
| --- | --- |
| 0..4 | Volume 0..31 |
| 5, channels 0..2 | Triangle selection: 0=pulse, 1=triangle |
| 5, channel 3 | Reserved; must be zero |
| 6 | Reserved; must be zero |
| 7, channels 0..2 | One unsigned duty byte follows |
| 7, channel 3 | One nonzero seed byte 1..63 follows; retrigger noise |

A volume/waveform control is one byte. A duty or seed update is two bytes and
also carries the currently selected volume and tonal waveform. Optional bytes immediately follow
their own control byte, before the next channel's control. Noise never
interprets the extension as duty. Seed-only changes still publish a packet.
For example `00 11 35 07 87 40` waits one tick, sets voice 0 to increment
1845, volume 7, and duty 64. `00 80 8A 25` reseeds noise with 37 at volume 10.
`00 10 27` selects triangle at volume 7 on channel 0, retaining its duty and
phase; `00 10 07` switches back to pulse. Older A5/D1–D3 streams with bit 5
clear remain pulse. Waveform selection adds no extension byte. A change in
waveform emits a control update even if volume and duty are unchanged.

### Sound-effect events

SFX has no ownership-mask byte after the header. An update record is
`delta, flags, pitches..., controls...`, using compact slot-relative flags:

| Flag bit | Hex mask | Payload |
| --- | --- | --- |
| 0 | `01` | Tonal pitch for physical channel 1, uint16 little-endian |
| 1 | `02` | Noise pitch for physical channel 3, uint16 little-endian |
| 2 | `04` | Tonal control and optional duty extension |
| 3 | `08` | Noise control and optional seed extension |
| 4..7 | `F0` | Reserved; must be zero |

Emit only selected fields, in the table's order: tonal pitch, noise pitch,
tonal control/extension, noise control/extension. Control-byte encoding is
identical to music. Updates outside declared slots are malformed; D1 allows
only flag bits 0 and 2, D2 only 1 and 3, and D3 all four.
`D1 00 05 85 0E 8C 20` starts a tonal effect on voice 1 at increment 3717,
volume 12, duty 32. Append `00 00 01` to end it one tick later.

### Timing and commands

Every delta byte means value+1 ticks (1..256), each tick 4 ms. There are no
zero-time records: `00` waits 4 ms and `FF` waits 1024 ms. The first event
waits at least 4 ms. A delta is relative to the preceding record, including
commands. Longer waits are split into Continue records plus the remaining
delta. For example, `FF 00 00` holds the current state for 256 ticks.

A zero change mask or zero SFX flags selects a command record
`delta, 00, command`, with no pitch or control payload:

| Command | Byte | Behavior |
| --- | --- | --- |
| Continue | `00` | Keep current state, then read the next record |
| End | `01` | Stop and release this stream |
| Loop | `02` | Music only: rewind to the first delta, skipping the validated header |

Each command consumes positive time. End releases SFX ownership and restores
the current music controls on those slots; music End silences music. Loop
replays the first delta as well as the events. SFX Loop, unknown commands or
headers, reserved control bits, invalid seeds, ownership violations, and
invalid flags stop that stream and release it.

### Worked binary example

This source plays A4 for one quarter note at the default tempo 120:

```text
channel 0 { volume 7 duty 25% a4 }
```

Its entire compiled stream is:

```hex
A5 01 00 11 35 07 87 40 7C 00 01
```

| Byte offsets (zero-based) | Bytes | Interpretation |
| --- | --- | --- |
| 0..1 | `A5 01` | Music, owning channel 0 |
| 2 | `00` | Wait 1 tick (4 ms) |
| 3 | `11` | Update channel 0 pitch and control |
| 4..5 | `35 07` | Increment `0x0735` = 1845, approximately 440 Hz |
| 6..7 | `87 40` | Volume 7 with extension flag; duty 64 = 25% |
| 8 | `7C` | Wait 125 ticks (500 ms) after the onset |
| 9..10 | `00 01` | Command record: End, at 504 ms from stream start |

### Reader limits

Maximum read-ahead at a due event includes the next delta: music 18 bytes
(mask 1 + pitches 8 + extended controls 8 + next delta 1); SFX 10 bytes
(flags 1 + pitches 4 + extended controls 4 + next delta 1). The current delta
has already been consumed. Only actual bytes consumed advance the 24-bit FX
cursor; unused read-ahead is discarded. No length is passed, so a truncated
stream cannot be reliably distinguished from adjacent program data. Supply
complete assets. End/Loop prevents trailing C-export padding from being used.

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

The live latch is 16 bytes: four `(increment, prepared_amplitude)` triples,
three duty bytes, and a waveform byte with triangle flags in bits 0..2.
Desired music/SFX voices remain four-byte records: increment low/high,
volume/waveform, duty. Bit 5 of desired volume holds triangle; only its lower
five bits contribute to prepared amplitude. Foreground chooses each current
music/SFX owner and waits for acknowledgement before reusing the 16-byte
staging buffer; one descriptor-byte store publishes the whole packet.
Bit 7 means ready, bits 0..5 contain optional seed 1..63 (zero means no reseed),
bit 6 is unused. Timer1 copies all controls then reseeds before the next sample.
Transient commands are not retained with desired state. Foreground never
writes live noise while Timer1 can run. IRQ-disabled/stopped output applies
packets directly; rate switching explicitly carries no reseed command.
SFX release restores the current music waveform, including changes made while
music was hidden. Pause/resume and rate changes retain waveform state and
phase; stop silences the owner. Direct tones initialize pulse and duty 128.

| Persistent state | Bytes |
| --- | ---: |
| Pending ticks, boot-hold byte, two masters | 4 |
| Live increments/amplitudes, duty and waveform | 16 |
| Phases and noise LFSR | 9 |
| Desired music voices / SFX slots | 16 / 8 |
| Music / SFX stream records | 10 / 7 |
| Pending latch and descriptor | 17 |
| Held sample and rate | 2 |
| Total | 89 |

Audio occupies 0A15..0A6D, private end 0A6E. Existing 72-byte formatter/text
scratch ends at 0AB6, leaving 74 bytes for native stack. Audio aliases 20 scratch
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
with pulse melody/vibrato on 0, pulse harmony on 1, triangle bass on 2 and noise on 3.
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
