# AVM audio demo

The demo animates two rectangles while playing four-channel music. A triggers
a sound effect; B pauses/resumes music. Playback needs no guest update call.
`audio_demo.arduboy` contains the interpreter firmware and FX program data.

The original tune, **Sunlit Garden**, loops through 16 bars in C major at about
96 BPM (39.936 seconds per loop). Its first eight bars introduce and develop
the melody; the next four move through Em7, Am7, Dm7, and Gadd9 before a final
four-bar return. Channel 0 carries the melody, channel 1 plays root/fifth bass,
channel 2 adds eighth-note arpeggios, and channel 3 supplies low noise kicks,
soft backbeats, and quiet offbeat ticks. Short volume fades soften the notes
and percussion. A sound effect temporarily takes over channels 2 and 3 while
the melody and bass continue.

In `music.json`, a row lasts `row_ticks * 4 ms`, so `row_ticks: 13` gives
52 ms rows. This arrangement uses 12 rows per quarter note and 48 per bar.
Each event's `delta` counts rows since the previous event; `end_delta: 1`
completes the last bar before looping.

### Notes and volume

Channel objects accept `note` and `volume` (amplitude 0..31).
Channels 0, 1, and 2 always produce the same 50% square waveform; channel 3
always produces LFSR noise. A low note makes a bass part, and higher notes make
a lead part. On channel 3, the note controls the noise update rate.

For example, `{"note":"C2","volume":9}` on channel 1 plays a low C square
wave at amplitude 9. The compiler applies volume before note in the same
event. Later notes retain that volume; volume-only changes preserve the
current note and phase. This song uses explicit quiet volumes and timed
fades. There are no instrument identifiers or binary amplitude presets.

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
