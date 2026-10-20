# MIDI to AVMS arranger

`tools/midi_to_avms.py` converts synchronous Standard MIDI Files (types 0 and
1) to readable AVMS and validates every result with `tools/avm_music.py`.
It arranges three monophonic pulse parts and one monophonic noise part:
melody on 0, interruptible accompaniment on 1, bass on 2, percussion on 3.
No interpreter, synthesis, guest API, or binary format changes are needed.

## Install and convert

The optional importer requires Python 3.10+ and `mido`. The AVMS compiler
still uses only the standard library; ordinary demo/SDK builds do not import
MIDI or need `mido`.

```sh
python -m pip install -r tools/requirements-midi.txt
python tools/midi_to_avms.py input.mid output.avms
python tools/midi_to_avms.py input.mid output.avms --loop --preset balanced --stats --report output.json --binary output.bin
python tools/avm_music.py output.avms output.h --name song --stats
```

Looping is opt-in and covers the entire selected region. `--start 4.5 --end
28.0` selects a region in seconds. Source tempo changes are integrated before
cropping, including changes between notes. The generated score uses a fixed
notation tempo with explicit millisecond lengths, preserving the real tempo map.

Useful overrides (track and MIDI channel numbers are **zero-based**):

```sh
python tools/midi_to_avms.py input.mid output.avms --melody-track 1 --bass-channel 3 --harmony-track 2
python tools/midi_to_avms.py input.mid output.avms --transpose -2 --bass-octave 1 --melody-octave 0
python tools/midi_to_avms.py input.mid output.avms --bass-range 40 67 --harmony-density 0.5 --percussion-density 0.4 --no-arpeggios
python tools/midi_to_avms.py input.mid output.avms --lead-volume 12 --bass-volume 8 --harmony-volume 5 --drum-volume 7 --effects 0.3
```

`--*-octave` is a relative octave shift, before folding illegal pitches into
C1–B6. Omission chooses a whole-part shift to fit a target register, followed
by selective octave folding. `--melody-range`, `--bass-range`, and
`--harmony-range` set target registers in MIDI note numbers. `--transpose`
applies before register normalization. Density and effect settings are 0..1;
`--melody-density 1` preserves selected melody attacks. Decreasing melody
density omits short offbeat ornaments. Zero harmony/percussion density mutes
that role. Music volumes are scaled conservatively if requested simultaneous
peaks sum above 30, giving at most 120 amplitude units at master 128. This
bound covers the music; independently mixed gameplay SFX can still clip.

| Preset | Policy |
| --- | --- |
| `faithful` | Preserve existing lines; single harmonic tones; minimal effects |
| `balanced` (default) | Preserve lead/bass; source-derived chord arpeggios; short envelopes |
| `chiptune` | Faster arpeggios, articulated broken chords, occasional lead vibrato/duty movement |

`--arpeggios`/`--no-arpeggios` and `--effects` override preset settings.
Pitch bend interpretation remains active at effects 0 because bends change
the source pitches. No arbitrary slides/glissandi are added to ordinary melody
intervals. The IR/score generator also supports volume/duty/pitch LFOs and
glissando for callers that explicitly supply those effects.

## Pipeline and extension points

The module exposes dataclasses and functions rather than making score text
the arrangement's only representation:

1. `read_midi(path) -> Song`: merge absolute ticks, integrate the actual tempo
   map, pair keys, resolve pedal, preserve identities, program history,
   time signatures, controllers, and pitch bend sensitivity (RPN 0).
2. `analyze(song) -> Analysis`: profile sources by track/channel, estimate
   polyphony, register, articulation, repetition, program/name salience.
3. `arrange(song, Settings) -> Arrangement`: select sources, extract continuous
   lines, reduce chords/drums, normalize register, orchestrate, and quantize.
4. `generate_score(arrangement) -> str`: regenerate readable AVMS from the
   structured arrangement and explicit `Instrument`/`Effect` parameters.
5. `compile_arrangement(arrangement) -> (str, bytes)`: reuse the existing A5
   compiler and add its event/control/byte statistics to the report.

Times remain real-valued seconds until the final absolute-boundary rounding.
Each arranged note carries original note IDs, its physical output channel,
articulation, instrument, effects, volume, and quantized boundaries. `Analysis`
retains all candidate chord identities, boundaries and contributing source
IDs; voiced chord notes list sources of the tones actually represented.
`--report` serializes the original normalized `Song`, complete `Arrangement`,
and statistics. It contains the complete source controller/bend curves even
when playback uses a simpler approximation.

The implemented [Stage 2 audio-guided optimizer](midi_to_avms_stage2.md) keeps a
`Song` and `Arrangement` in memory, changes instruments,
effects, volumes, or note choices, and call `generate_score` or
`compile_arrangement` again. No MIDI reparse is needed. A future transcription
stage can construct the same `Song`. Audio matching is an optional separate
pipeline; transcription remains outside these implementations.

## Musical decisions

**Lead and bass:** source scoring favors a named melody/solo or melodic program
with a clear, moderate-register line. Bass scoring favors named/GM bass parts
and low, sustained material. A beam dynamic program follows onset candidates,
rewarding duration, salience, velocity and register while penalizing large
leaps and interruption of a sustained note. A hold/silence state allows the
lead to continue across a short higher ornament. A monophonic source keeps
every note, including repeated attacks, leaps and rests. Bass inference uses
remaining notes in the same source for a single polyphonic piano track.
Source confidence and overrides help diagnose ambiguous choices.

**Harmony:** an active-note sweep splits at actual note/chord boundaries.
Existing monophonic material remains a line; held chords become a smoothly
voiced representative tone, source-derived arpeggio, or slower broken chord.
The selected tone favors information absent from the lead/bass pitch classes.
Arpeggio intervals come from actual active source pitch classes, including
minor/diminished/partial chords; major triads are never assumed. A silence
penalty rejects short/weak accompaniment and increases as density decreases.
Chord estimates are diagnostic and do not invent missing chord tones.

**Drums:** kick, snare, clap, hats, cymbals, toms and other classes have distinct
noise rates and decays. Simultaneous hits arbitrate by class priority, source
velocity, and beat accent. Durations are chosen for noise transients rather
than copied from drum MIDI key lengths. Noise pitch is independent of the GM
drum number. Uniform snare/clap/tom rolls can collapse into deterministic
retrigger effects; cymbals may use a longer retriggered texture. Dense weak
percussion can disappear. A source without drums leaves noise silent.

**Orchestration:** a small pulse/noise palette, four velocity tiers, CC7/CC11
dynamics, short release envelopes and precise offsets provide articulation.
CC1 can activate subtle vibrato on long notes. Pitch bends become frequency
slides with onset bend and RPN sensitivity honored. Complex bends/expression
are reduced to one slide per note with warnings. Chiptune adds occasional
long-lead duty motion. One base pitch transform per note prevents conflicts
between slides, arpeggios and glissando. Effects reset with each instrument use.
Automation defaults to 16ms here to limit foreground event work; note/effect
boundaries still use the compiler's 4ms grid.

## Timing and import policies

- Absolute onsets and offsets round to the nearest 4ms, half up. Durations
  subtract rounded boundaries, so errors do not accumulate. Simultaneous
  voices stay aligned. The compiler adds its mandatory 4ms initial event
  delay; one-shot End adds one tick, and loops use a fixed rounded boundary.
- Notes collapsing to zero ticks are omitted with a diagnostic. A 4ms note
  gets a precise cut, preventing its release from extending the score.
  Loops have the compiler's 8ms minimum length. Repeated-note attacks remain
  distinct when the source onsets occupy distinct ticks.
- Sustain holds physically released keys until pedal-up. Same-pitch overlaps
  pair FIFO, preferring the originating track when possible. Channel state
  is shared across tracks. Missing note-offs close at file end, with a 100ms
  minimum for a final open note; unmatched offs produce warnings.
- All-sound-off, all-notes-off and reset-controllers are handled. Default
  pitch bend range is ±2 semitones; RPN 0 coarse/fine sensitivity is supported.
- Type 2 and SMPTE division fail clearly. Other RPNs, bank changes, pan,
  reverb, SysEx and pressure are not synthesized; controller messages remain
  in source IR and unsupported expressive messages generate warnings.
- Regions inherit controller/bend state and clip notes already sounding at
  the region start. End-of-file silence is retained. Meter changes remain in
  source IR; explicit timing makes them independent of score notation meter.

## Examples and validation

The demo includes the user-supplied `z1overw.mid`, `ff1town.mid`,
`ff1overw.mid`, and `ff1matya.mid` conversions alongside Sunlit Garden.
See `projects/audio_demo/songs/conversion_stats.json` for source hashes,
source choices, counts, warnings, timing errors, and compiler statistics.
The original MIDI files stay outside the repository. Reproduce the imports:

```sh
python projects/audio_demo/import_midi.py /path/to/midi-folder
cmake --build build --config RelWithDebInfo --target avm_audio_demo
```

Individual conversions from Downloads, in PowerShell from the repository root:

```powershell
python tools/midi_to_avms.py "$env:USERPROFILE\Downloads\z1overw.mid" build/midi-arranger/z1overw.avms --loop --stats
python tools/midi_to_avms.py "$env:USERPROFILE\Downloads\ff1town.mid" build/midi-arranger/ff1town.avms --loop --stats
python tools/midi_to_avms.py "$env:USERPROFILE\Downloads\ff1overw.mid" build/midi-arranger/ff1overw.avms --loop --stats
python tools/midi_to_avms.py "$env:USERPROFILE\Downloads\ff1matya.mid" build/midi-arranger/ff1matya.avms --loop --stats
```

| Input | Rounded loop | Compiled bytes | Lead / harmony / bass / drums |
| --- | ---: | ---: | --- |
| `z1overw.mid` | 38.916s | 6,459 | 128 / 138 / 159 / 137 |
| `ff1town.mid` | 39.184s | 3,262 | 64 / 116 / 52 / 0 |
| `ff1overw.mid` | 73.848s | 5,791 | 98 / 265 / 240 / 0 |
| `ff1matya.mid` | 99.312s | 14,080 | 255 / 387 / 339 / 387 |

Original fixture scores in `examples/midi_arranger/` cover a C–F–G–C theme,
polyphonic piano with high ornaments, dense pads, fast repeated notes, tempo
changes and drum rolls. Regenerate and test without external music:

```sh
python tests/audio/generate_midi_examples.py
python -m unittest discover -s tests/audio -v
cmake --build build --config RelWithDebInfo --target avm_audio_tests_run
```

MIDI-specific tests skip clearly when optional `mido` is absent; existing
compiler tests and checked-in score/header tests still run. With `mido`,
tests inspect synthetic melody/bass identities, piano continuity, drum
priorities, polyphony, sustain, tempo maps, controllers, sub-tick notes,
initial delay, A5 ownership/durations, deterministic output, CLI/reporting,
and event/size limits. The native demo test also visits all five songs,
checks both wrap directions and switches/resumes while paused.

Implementation validation on 2026-10-20: all **82 Python tests** passed using
Python 3.12 with `mido`. `avm_audio_tests_run` passed the native audio suite
(45 audio cases plus timer, synthesis, ownership, SPI, formatter and large
asset checks), both sample-rate demo runs, and the five-song playlist test.
The CMake-selected Python 3.13 lacks optional `mido`, so its separate Python
run passed 54 tests and explicitly skipped the 28 MIDI fixture tests; those
28 all ran in the Python 3.12 run. New Python files passed Ruff. A separate
`python -S tools/avm_music.py ...` invocation verified compiler use without
site packages. Four-second WAV previews of every import were rendered via
the existing native `--capture` facility to `build/midi-arranger/*.wav` and
checked for nonzero audio. That capture facility uses music master 64;
the demo uses master 128. These are emulator renders, not listening results.

A compact generated score fragment (octave and duration are separate):

```text
title "Example"
tempo 120
automation 16ms
envelope melody_env { points 0ms:100%, 64ms:88% release 8ms:0% }
instrument melody { wave pulse duty 64 volume 12 envelope melody_env }
channel 0 {
    use melody volume 9 octave 5 gate 408/416 c:416ms
    r:84ms
    use melody volume 8 octave 5 gate 408/416 e:416ms
}
```

These checks validate structure and playback correctness, not musical taste.
Separated game themes and clear solo lines are the strongest use cases.
Automatic selection remains weak with melody handoffs between unrelated
tracks, dense piano counterpoint, polyrhythms, expressive continuous bends,
and arrangements relying on sampled timbres or more than three independent
pitched lines. Track metadata can be misleading. Harmony can be simplified
aggressively and inferred roots are estimates. File-end looping is manual,
not automatic seamless-loop discovery. Physical Arduboy listening remains
necessary to judge the piezo, register, articulation and mix.
