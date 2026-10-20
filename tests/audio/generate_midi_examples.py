#!/usr/bin/env python3
"""Regenerate original listening examples; no external MIDI downloads needed."""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import midi_fixtures
from midi_to_avms import Settings, arrange, compile_arrangement, read_midi

if __name__ == "__main__":
    output = ROOT / "examples/midi_arranger"
    midi_dir = ROOT / "build/midi-arranger/examples"
    output.mkdir(parents=True, exist_ok=True)
    midi_dir.mkdir(parents=True, exist_ok=True)
    for name in ("progression", "piano", "dense", "repeated", "tempos", "drums"):
        path = midi_dir / (name + ".mid")
        getattr(midi_fixtures, name)().save(path)
        song = read_midi(path)
        song.title = "Arranger example - " + name
        source, data = compile_arrangement(arrange(song, Settings(loop=True)))
        (output / (name + ".avms")).write_text(source, encoding="utf-8", newline="\n")
        (midi_dir / (name + ".bin")).write_bytes(data)
        print(f"{name}: {len(data)} bytes")
