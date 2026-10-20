# AVM audio demo

The demo animates two rectangles while playing four-channel music. A triggers
a sound effect; B pauses/resumes music. Up toggles between unsmoothed 8 kHz
(the default) and 16 kHz synthesis, with the selected rate shown on screen.
The exact rates are 7812.5 and 15625 Hz. Playback needs no guest update call.
`audio_demo.arduboy` contains the interpreter firmware and FX program data.

The original tune, **Sunlit Garden**, loops through 16 bars in C major at about
96 BPM (39.936 seconds per loop). Its first eight bars introduce and develop
the melody; the next four move through Em7, Am7, Dm7, and Gadd9 before a final
four-bar return. Channel 0 carries a 25% pulse melody with vibrato, channel 2 plays 50% pulse
root/fifth bass, channel 1 adds 12.5% pulse eighth-note arpeggios, and channel 3 supplies low noise kicks,
soft backbeats, and quiet offbeat ticks. Short volume fades soften the notes
and percussion. A sound effect temporarily takes over channels 1 and 3 while
the melody and bass continue. The effect combines a descending pitch slide,
volume/duty slides, a timed cut, and deterministic noise retriggers.

`music.avms` describes independent note sequences with reusable instruments
and stepped envelopes. Its exact tempo `1250/13` gives 156 ticks per quarter
and 624 per bar, preserving the 39.936-second loop and every original note
attack and fade. Envelopes apply to each note automatically. Gate settings
produce the short articulations without manually writing note-off events.

### Notes, volume, and duty

Instruments select `volume` (0..31), pulse `duty` (0..255, default 128),
an optional envelope and gate. Channels 0, 1, and 2 are identical pulse voices.
Channel 3 produces LFSR noise; its note controls the noise update rate.

For example, `instrument low { wave pulse duty 50% volume 9 }` followed by
`channel 2 low octave 2 { c4 g }` plays two low quarter notes. The compiler
merges notes and offline effects into A5 raw-increment/control events;
instruments are source definitions and add no runtime state. Every loop
initializes all owned channels. Control-only changes preserve oscillator phase.
See `tremolo.avms` for a small score with a smooth custom contour, release,
beat-synchronized tremolo, a reusable phrase, and tied notes. The complete
syntax is documented in [audio.md](../../docs/audio.md#asset-compiler-and-notation).
`effects.avms` demonstrates tracker arpeggios, glissando, slides, simultaneous
LFO targets, reusable effects, cuts and noise retriggering in one short score.

`avm_audio_volume` sets both music and SFX masters: 32 is 100%, 64 is 200%,
and 255 is 796.875%. `avm_audio_music_volume` and `avm_audio_sfx_volume` set
them independently; direct tones use the SFX master. For example,
`avm_audio_music_volume(16)` makes the music quieter while effects keep their
own gain. Gain 0 mutes its stream while playback and ownership continue.
The demo uses the default gain 128 (400%) for both. Volume 31 therefore
produces amplitude 124, close to the full signed pin range. The interpreter prepares each
channel amplitude as `floor(volume * master / 32)`, retaining the song's
volume and duty, and saturates the complete mix at the PWM limits.

Build from the repository root:

```sh
cmake --build build --config RelWithDebInfo --target avm_audio_demo
```

Or configure this directory with an installed AVM SDK:

```sh
cmake -S projects/audio_demo -B projects/audio_demo/build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DAVM_SDK_ROOT=/path/to/avm-sdk
cmake --build projects/audio_demo/build --config RelWithDebInfo
```

Like `ardurogue2`, this uses the installed SDK's Clang, linker, image packer,
and interpreter. The repository build installs its SDK before building the demo.
Both builds copy the package to `projects/audio_demo/audio_demo.arduboy`.
Objects, ELF, and the development FX image stay in `projects/audio_demo/build`.
The checked-in `music.h` and `effect.h` let ordinary SDK builds run without
Python. Their editable sources are `music.avms` and `effect.avms`.

After editing a score, regenerate the headers before rebuilding (Python 3
and the repository's `tools/avm_music.py` are required for regeneration):

```sh
cmake --build build --config RelWithDebInfo --target audio_demo_assets
cmake --build build --config RelWithDebInfo --target avm_audio_demo
```

For a standalone configuration, use `projects/audio_demo/build` in place of
`build`. Include both regenerated headers and the rebuilt `.arduboy` package
when updating the demo in Git. CMake clean removes only build artifacts.

Effects use the top-level `sfx` setting and declare channel 1 (tonal), channel 3
(noise), or both. The compiler emits a compact one-shot D1/D2/D3 stream; an
omitted slot leaves music audible. Declared slots retain ownership during rests.
Place melody on voice 0, harmony on 1, bass on 2, and percussion/noise on 3.
All pitch and duty updates preserve oscillator phase.
