#!/usr/bin/env python3
"""Optional native oracle validation, without external reference recordings."""
import argparse
import json
import subprocess
import sys
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import avm_music
from avm_audio_render import render

SCORES = {
    "steady": "loop channel 0 { volume 12 duty 64 c:800ms }",
    "single": "channel 0 { volume 12 octave 4 c:160ms octave 1 c:160ms octave 6 b:160ms }",
    "duties": "channel 0 { volume 31 duty 0 c:80ms duty 32 c:80ms duty 64 c:80ms duty 96 c:80ms duty 128 c:80ms duty 255 c:80ms }",
    "mix_clip": "channel 0 { volume 31 duty 32 c:600ms } channel 1 { volume 31 e:600ms } channel 2 { volume 31 g:600ms } channel 3 { wave noise volume 31 c:600ms }",
    "duty_slide": "channel 0 { volume 12 duty_slide { to 32 over 400ms } c:600ms }",
    "envelope": "envelope e { points 0ms:0%, 32ms:100%, 160ms:40% release 80ms:0% } instrument i { volume 13 envelope e } channel 0 i { gate 75% c:600ms }",
    "volume_slide": "channel 0 { volume 24 volume_slide { to 1 over 400ms } c:600ms }",
    "pitch_slide": "channel 0 { frequency_slide { to g4 over 400ms } c:600ms }",
    "lfo": "channel 0 { lfo { target pitch depth 22cents period 160ms } c:600ms }",
    "arpeggio": "channel 1 { arpeggio { offsets 0,3,7 step 40ms } c:600ms }",
    "glissando": "channel 0 { glissando { direction down step 1semitone every 40ms } c:600ms }",
    "noise": "channel 3 { wave noise volume 12 noise_retrigger { every 32ms seed 37 } c:240ms r:80ms noise_retrigger { every 16ms seed 2 } c:240ms }",
    "phase_loop": "loop channel 0 { volume 12 duty 64 c:80ms duty 128 g:80ms r:40ms c:80ms } channel 3 { wave noise volume 8 noise_retrigger { every 40ms seed 63 } c:280ms }",
}


def validate(exe, hex_path, listing, guest, output, live=False):
    output.mkdir(parents=True, exist_ok=True)
    rows = []
    for name, score in SCORES.items():
        data = avm_music.compile_source("automation 16ms\n" + score)
        asset = output / (name + ".bin")
        asset.write_bytes(data)
        for selected, rate in enumerate((7812.5, 15625)):
            result = render(data, rate=rate, duration=1.024)
            pcm = output / f"{name}-{selected}.u8"
            subprocess.run([str(exe), "--render-logical", str(hex_path), str(listing), str(guest),
                            str(asset), str(pcm), str(len(result.pcm)), str(selected)], check=True, capture_output=True)
            actual = np.frombuffer(pcm.read_bytes(), dtype=np.uint8)
            errors = np.abs(actual.astype(int)-result.pcm.astype(int))
            row = {"fixture": name, "rate": rate, "samples": len(actual),
                   "mismatched_samples": int(np.count_nonzero(errors)), "max_error": int(max(errors))}
            rows.append(row)
            print(row, flush=True)
    report = {"logical": rows, "exact": all(r["mismatched_samples"] == 0 for r in rows),
              "model": "Real AVR sequencer + synthesis, deterministic logical publication; no PWM or foreground jitter"}
    if live:
        captures = []
        for selected, rate in enumerate((7812.5, 15625)):
            path = output / f"live-{selected}.wav"
            subprocess.run([str(exe), "--capture", str(hex_path), str(listing), str(guest),
                            str(output / "phase_loop.bin"), str(path), "2", str(selected)], check=True, capture_output=True)
            trace = np.loadtxt(str(path)+".logical.csv", delimiter=",", skiprows=1)
            ideal = render((output / "phase_loop.bin").read_bytes(), rate=rate, master=64, duration=2.01)
            count = min(len(trace), len(ideal.pcm))
            # A diagnostic, not a claim of equivalence: actual foreground and
            # Timer0 clocks are asynchronous to the ideal deadline convention.
            captures.append({"rate": rate, "samples": len(trace),
                             "first_sample_us": float(trace[0, 0]/16),
                             "period_us_median": float(np.median(np.diff(trace[:, 0]))/16),
                             "unaligned_sample_disagreement": float(np.mean(trace[:count, 1] != ideal.pcm[:count])),
                             "note": "PWM capture is 50kHz with fixed x16 gain; held endpoint has one-sample delay. Foreground publication jitter changes phase at pitch changes; not sample-exact to ideal deadlines."})
            # At constant pitch there is a single startup phase alignment;
            # compare the directly observed logical endpoints before PWM.
            steady_path = output / f"steady-live-{selected}.wav"
            subprocess.run([str(exe), "--capture", str(hex_path), str(listing), str(guest),
                            str(output / "steady.bin"), str(steady_path), "1", str(selected)], check=True, capture_output=True)
            steady_trace = np.loadtxt(str(steady_path)+".logical.csv", delimiter=",", skiprows=1)[:, 1]
            steady = render((output / "steady.bin").read_bytes(), rate=rate, master=64, duration=1.).pcm
            lo, hi = round(.03*rate), round(.6*rate)
            shifts = range(-round(.008*rate), round(.008*rate)+1)
            shift = min(shifts, key=lambda d: np.mean(steady_trace[lo:hi] != steady[lo+d:hi+d]))
            captures[-1]["steady_alignment_samples"] = shift
            captures[-1]["steady_aligned_disagreement"] = float(np.mean(steady_trace[lo:hi] != steady[lo+shift:hi+shift]))
        report["live"] = captures
    (output / "validation.json").write_text(json.dumps(report, indent=2)+"\n")
    if not report["exact"]:
        raise AssertionError("Desktop renderer differs from AVR logical oracle")
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=ROOT / "build/tests/avm_audio_tests.exe")
    parser.add_argument("--hex", type=Path, default=ROOT / "interp/build/interp.hex")
    parser.add_argument("--listing", type=Path, default=ROOT / "interp/build/interp.lst")
    parser.add_argument("--guest", type=Path, default=ROOT / "build/tests/interp/audio.bin")
    parser.add_argument("--output", type=Path, default=ROOT / "build/stage2/renderer-validation")
    parser.add_argument("--live", action="store_true")
    args = parser.parse_args()
    validate(args.exe, args.hex, args.listing, args.guest, args.output, args.live)
