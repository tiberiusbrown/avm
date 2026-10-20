#!/usr/bin/env python3
"""Verify local Stage 2 artifacts against original inputs and compiler output.

Run after the batch CLI; recordings remain external integration fixtures.
"""
import argparse
import hashlib
import json
import sys
from pathlib import Path

import numpy as np
from scipy.io import wavfile
from scipy.signal import resample_poly

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import avm_music
from avm_audio_render import decode, render
from midi_to_avms_stage2 import discover_pairs


def verify(inputs, output, expected_rate=15625.):
    pairs, unmatched = discover_pairs(inputs)
    if not pairs:
        raise AssertionError("No local integration pairs")
    summary = json.loads((output/"summary.json").read_text())
    assert not summary["errors"], summary["errors"]
    assert len(summary["songs"]) == len(pairs)
    checked = []
    for midi_path, wav_path in pairs:
        directory = output/midi_path.stem
        report = json.loads((directory/"comparison.json").read_text())
        assert report["rate"] == expected_rate
        assert report["optimized"]["loss"] <= report["baseline"]["loss"]+1e-10
        assert all(report["protected_pitch_timing_sources_unchanged"].values())
        assert (directory/"reference.wav").read_bytes() == wav_path.read_bytes()
        assert report["input_sha256"]["midi"] == hashlib.sha256(midi_path.read_bytes()).hexdigest()
        assert report["input_sha256"]["wav"] == hashlib.sha256(wav_path.read_bytes()).hexdigest()
        saved = json.loads((directory/"arrangement.json").read_text())
        for ch in ("0", "1", "2", "3"):
            before = saved["baseline"]["voices"][ch]
            after = saved["optimized"]["voices"][ch]
            assert len(before) == len(after)
            for a, b in zip(before, after):
                for field in ("start", "end", "sources"):
                    assert a[field] == b[field], (midi_path.name, ch, field)
                if ch != "3":
                    assert a["pitch"] == b["pitch"]
        for name in ("baseline", "optimized"):
            data = (directory/(name+".bin")).read_bytes()
            assert avm_music.compile_source((directory/(name+".avms")).read_text()) == data
            assert hashlib.sha256(data).hexdigest() == report[name]["digest"]
            assert len(data) == report[name]["compiled_bytes"]
            assert len(decode(data)) == report[name]["events"]
            rate, pcm = wavfile.read(directory/(name+".wav"))
            assert rate == 15625  # Both native 15625 and exact 2x 7812.5 previews.
            result = render(data, rate=expected_rate, duration=len(pcm)/15625)
            audio = result.audio if expected_rate == 15625 else resample_poly(result.audio, 2, 1)
            expected = np.rint(np.clip(audio, -1, 32767/32768)*32768).astype(np.int16)
            # Fractional-rate previews can contain one extra rational edge sample.
            np.testing.assert_array_equal(pcm, expected[:len(pcm)])
            assert abs(result.metrics()["clipping_fraction"]-report["audio"][name]["clipping_fraction"]) < 1e-6
        assert (directory/"comparison.png").stat().st_size > 1000
        assert (directory/"optimization_history.json").stat().st_size > 100
        checked.append(midi_path.stem)
        print(midi_path.stem+": compiled bytes, logical PCM, rate, provenance, reports and original-copy checks passed")
    result = {"checked": checked, "rate": expected_rate, "unmatched": unmatched, "passed": True}
    (output/"integration-validation.json").write_text(json.dumps(result, indent=2)+"\n")
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, default=ROOT/"build/stage2")
    parser.add_argument("--rate", type=float, choices=(7812.5, 15625), default=15625)
    args = parser.parse_args()
    verify(args.input_dir, args.output_dir, args.rate)
