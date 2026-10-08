# AVM audio demo

The demo animates two rectangles while playing four-channel music. A triggers
a sound effect; B pauses/resumes music. Playback needs no guest update call.
`audio_demo.arduboy` contains the interpreter firmware and FX program data.

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
