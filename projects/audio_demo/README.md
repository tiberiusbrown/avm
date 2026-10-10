# AVM audio demo

The demo animates two rectangles while playing four-channel music. A triggers
a sound effect; B pauses/resumes music. Playback needs no guest update call.
`audio_demo.arduboy` contains the interpreter firmware and FX program data.

The original tune, **Sunlit Garden**, loops through 16 bars in C major at about
96 BPM (39.936 seconds per loop). Its first eight bars introduce and develop
the melody; the next four move through Em7, Am7, Dm7, and Gadd9 before a final
four-bar return. Channel 0 carries a sine melody, channel 1 plays triangle
root/fifth bass, channel 2 adds square eighth-note arpeggios, and channel 3 supplies low noise kicks,
soft backbeats, and quiet offbeat ticks. Short volume fades soften the notes
and percussion. A sound effect temporarily takes over channels 2 and 3 while
the melody and bass continue. The effect uses sawtooth on channel 2.

In `music.json`, `row_ticks: 1` makes each row one 4 ms tick. This arrangement
uses 156 ticks per quarter note and 624 per bar. Each event's positive `delta`
counts rows since the previous event. The first update waits one tick;
`end_delta: 12` completes the last bar before looping, preserving the
39.936-second period. The binary stores each wait as ticks minus one and
splits long waits with Continue records.

### Notes, volume, and waveform

Channel objects accept `note`, `volume` (amplitude 0..31), and `waveform`
(`square`, `triangle`, `sawtooth`, or `sine`). Channels 0, 1, and 2 select
independent 64-sample waveforms; channel 3 always produces LFSR noise and
ignores waveform selection. On channel 3, the note controls the noise update rate.

For example, `{"note":"C2","volume":9,"waveform":"triangle"}` on channel 1
plays a low C triangle wave at amplitude 9. One packed mask selects the note
and combined volume/waveform byte in the same event. The encoder tracks each
channel's volume and waveform, repeating the other field when either changes.
The first event initializes note, volume, and waveform on every owned channel,
including silent channels, so each loop restores its starting sound. Later
notes retain volume/waveform; control-only changes preserve note and phase.
This song uses explicit quiet volumes and timed
fades. There are no instrument identifiers or binary amplitude presets.

`avm_audio_volume` sets both music and SFX masters: 32 is 100%, 64 is 200%,
and 255 is 796.875%. `avm_audio_music_volume` and `avm_audio_sfx_volume` set
them independently; direct tones use the SFX master. For example,
`avm_audio_music_volume(16)` makes the music quieter while effects keep their
own gain. Gain 0 mutes its stream while playback and ownership continue.
The demo uses the default gain 32 for both. The interpreter prepares each
channel amplitude as `floor(volume * master / 32)`, retaining the song's
volume and waveform, and saturates the complete mix at the PWM limits.

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
Python. Their editable sources are `music.json` and `effect.json`.

After editing the JSON, regenerate the headers before rebuilding (Python 3
and the repository's `tools/avm_music.py` are required for regeneration):

```sh
cmake --build build --config RelWithDebInfo --target audio_demo_assets
cmake --build build --config RelWithDebInfo --target avm_audio_demo
```

For a standalone configuration, use `projects/audio_demo/build` in place of
`build`. Include both regenerated headers and the rebuilt `.arduboy` package
when updating the demo in Git. CMake clean removes only build artifacts.
