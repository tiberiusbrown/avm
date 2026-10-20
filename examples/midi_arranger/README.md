# Original MIDI arranger examples

These AVMS scores come from original, programmatically generated fixtures in
`tests/audio/midi_fixtures.py`. Regenerate with
`python tests/audio/generate_midi_examples.py` after installing
`tools/requirements-midi.txt`. Fixture MIDI and compiled A5 files go under
`build/midi-arranger/examples/`.

- `progression.avms`: eight-bar C–F–G–C melody, bass, chords and drums.
- `piano.avms`: single piano track with sustained chords and high ornaments.
- `dense.avms`: the progression plus a dense sustained pad.
- `repeated.avms`: distinct fast repeated attacks and velocity tiers.
- `tempos.avms`: tempo changes, including one between note events.
- `drums.avms`: a snare roll, cymbal, tom and open hat.

Compile any score with `python tools/avm_music.py example.avms example.bin
--stats`. For manual listening, use the existing emulator capture facility
or play a compiled score on AVM. Compilation alone is not a musical-quality
test; these examples need physical piezo listening as well.
