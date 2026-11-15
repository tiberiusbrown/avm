#!/usr/bin/env python3
"""Derive the per-note tuning table used by avm_music.py and the runtime tone table.

The tonal oscillators are plain 16-bit phase accumulators without band limiting.
At the 15625 Hz synthesis rate a pulse sounds rough when its pitch lies within a
few hertz of 15625 / N for a whole number of samples N per period: the edges
snap to sample boundaries in a slowly shifting pattern and the resulting alias
lines beat against the real partials.

This tool measures that effect and picks, for each MIDI note, the correction
within +/-6 cents that minimizes it on top of the universal shift
avm_music.GLOBAL_TUNING_CENTS. The global shift was chosen by searching every
shift from -50 to +50 cents together with these corrections over C4..B6 (a
shift of -5 cents gave the lowest mean roughness at the 1024-cycle period).
The tool prints the table; --check compares the result with
avm_music.NOTE_TUNING_CENTS so the committed table can be reproduced.

Roughness is the amplitude modulation of the band around the fundamental
(0.6 f .. 1.6 f), expressed as the root-sum of the envelope's fluctuation
between 15 and 120 Hz relative to its mean, for a 37.5 percent pulse. Needs
NumPy and SciPy (the `audio` extra); the score compiler itself does not.
"""
import argparse
import math
import sys
from pathlib import Path

import numpy as np
from scipy.signal import butter, hilbert, sosfiltfilt

try:
    from . import avm_music
except ImportError:
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import avm_music

RATE = 15625.0
DUTY = 96                     # 37.5 percent, the narrowest pulse the shipped scores lean on
LIMIT = 6                     # cents; keeps simultaneous intervals within 12 cents
MIN_GAIN = 0.3                # roughness points a nudge must remove, or the note stays put
DURATIONS = (1.5, 0.7)        # seconds rendered; the cost is their mean
FIRST, LAST = avm_music.NOTE_FIRST, avm_music.NOTE_LAST
GLOBAL = avm_music.GLOBAL_TUNING_CENTS
TUNED_FROM = 48               # C3: below this the 15..120 Hz band is not a roughness measure


def roughness(note, cents, seconds):
    """Roughness of a note moved by cents (in total) from equal temperament at A = 440 Hz."""
    frequency = 440 * 2 ** ((note - 69) / 12) * 2 ** (cents / 1200)
    increment = round(frequency * 65536 / RATE)
    k = np.arange(int(RATE * seconds), dtype=np.int64) + 1
    high = ((k * increment) & 65535) >> 8
    x = np.where(high < DUTY, 127.0, -127.0) / 127.0
    f = increment * RATE / 65536
    lo, hi = 0.6 * f, min(1.6 * f, RATE / 2 * 0.98)
    y = sosfiltfilt(butter(4, [lo, hi], btype="band", fs=RATE, output="sos"), x)
    y = y[int(0.1 * RATE):-int(0.1 * RATE)]
    envelope = np.abs(hilbert(y))
    envelope /= envelope.mean()
    window = np.hanning(len(envelope))
    spectrum = np.abs(np.fft.rfft((envelope - 1) * window)) * 2 / window.sum()
    frequencies = np.fft.rfftfreq(len(envelope), 1 / RATE)
    band = (frequencies >= 15) & (frequencies <= 120)
    return 100 * math.sqrt((spectrum[band] ** 2).sum())


def derive():
    table = []
    for note in range(FIRST, LAST + 1):
        if note < TUNED_FROM:
            table.append(0)
            continue
        cost = {c: sum(roughness(note, GLOBAL + c, s) for s in DURATIONS) / len(DURATIONS)
                for c in range(-LIMIT, LIMIT + 1)}
        best = min(cost.values())
        if cost[0] - best < MIN_GAIN:
            table.append(0)
        else:
            table.append(min((abs(c), c) for c, v in cost.items() if v <= best + 0.05)[1])
    return tuple(table)


def summarize(table):
    rows = []
    for note in range(60, LAST + 1):
        before = sum(roughness(note, 0, s) for s in DURATIONS) / len(DURATIONS)
        after = sum(roughness(note, GLOBAL + table[note - FIRST], s) for s in DURATIONS) / len(DURATIONS)
        rows.append((before, after))
    before, after = np.array(rows).T
    return (f"C4..B6 roughness % at equal temperament -> shipped tuning: mean {before.mean():.2f} -> "
            f"{after.mean():.2f}, worst {before.max():.2f} -> {after.max():.2f}; "
            f"universal shift {GLOBAL:+d} cents, {sum(1 for c in table if c)} notes corrected, "
            f"mean |c| over them {np.mean([abs(c) for c in table if c]):.1f} cents")


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--check", action="store_true",
                        help="exit 1 if avm_music.NOTE_TUNING_CENTS differs from the derived table")
    args = parser.parse_args()
    table = derive()
    print("NOTE_TUNING_CENTS = (")
    for octave in range(FIRST // 12, LAST // 12 + 1):
        chunk = table[octave * 12 - FIRST:octave * 12 + 12 - FIRST]
        print("    " + " ".join(f"{c:+d}," for c in chunk) + f"  # C{octave - 1}..B{octave - 1}")
    print(")")
    print(summarize(table), file=sys.stderr)
    if args.check and table != tuple(avm_music.NOTE_TUNING_CENTS):
        print("avm_music.NOTE_TUNING_CENTS does not match the derived table", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
