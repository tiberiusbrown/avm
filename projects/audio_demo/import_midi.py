#!/usr/bin/env python3
"""Reproduce the four demo imports from a directory of user-supplied MIDI files."""
import argparse
import hashlib
import json
import sys
from dataclasses import asdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
from midi_to_avms import Settings, arrange, avm_music, compile_arrangement, read_midi

SONGS = (("z1overw", "The Legend of Zelda - Overworld"), ("ff1town", "Final Fantasy I - Town"),
         ("ff1overw", "Final Fantasy I - Overworld"), ("ff1matya", "Final Fantasy I - Matoya's Cave"))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("midi_dir", type=Path, help="folder containing z1overw.mid, ff1town.mid, ff1overw.mid, ff1matya.mid")
    args = parser.parse_args()
    output = Path(__file__).resolve().parent / "songs"
    reports = ROOT / "build/midi-arranger"
    try:
        for name, _ in SONGS:
            if not (args.midi_dir / (name + ".mid")).is_file():
                raise ValueError(f"Missing input: {args.midi_dir / (name + '.mid')}")
        output.mkdir(parents=True, exist_ok=True)
        reports.mkdir(parents=True, exist_ok=True)
        summary = {}
        for name, title in SONGS:
            path = args.midi_dir / (name + ".mid")
            song = read_midi(path)
            song.title = title
            arrangement = arrange(song, Settings())
            source, data = compile_arrangement(arrangement)
            (output / (name + ".avms")).write_text(source, encoding="utf-8", newline="\n")
            (output / (name + ".h")).write_text(avm_music.c_array(data, name), encoding="utf-8", newline="\n")
            summary[name] = dict(title=title, input_filename=path.name, input_sha256=hashlib.sha256(path.read_bytes()).hexdigest(), **arrangement.report)
            (reports / (name + ".json")).write_text(json.dumps({"statistics": summary[name], "source": asdict(song), "arrangement": asdict(arrangement)}, indent=2) + "\n", encoding="utf-8")
            (reports / (name + ".bin")).write_bytes(data)
            print(f"{name}: {arrangement.report['score_duration_seconds']:.3f}s, {len(data)} bytes, "
                  f"notes {arrangement.report['selected_notes']}")
        (output / "conversion_stats.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8", newline="\n")
    except (ValueError, OSError) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
