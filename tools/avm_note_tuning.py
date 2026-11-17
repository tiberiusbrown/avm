#!/usr/bin/env python3
"""Derive the per-note tuning table used by avm_music.py and the runtime tone table.

The tonal oscillators are plain 16-bit phase accumulators without band limiting. A pulse
sample that contains an edge holds the fraction of its interval spent high (computed from a
reciprocal that is exact only to 8 bits, see avm_audio_render.pulse_values), and the voice's
amplitude then rounds it to whole output steps. What is left is that quantization and the alias
lines that fall onto the real partials. At the 15625 Hz synthesis rate a pitch within a few
hertz of 15625 / N for a whole number of samples N per period still beats faintly against them.
The rounding matters: at the amplitudes the scores mostly use it is coarser than the 8-bit edge
fraction, and a model without it does not predict the roughness of the real output.

This tool measures that effect on the exact fixed-point model of the interrupt and picks, for
each MIDI note, the correction within +/-6 cents that minimizes it on top of the universal
shift avm_music.GLOBAL_TUNING_CENTS, averaged over the four duties the scores use and nine
voice amplitudes. The shift was chosen by deriving the whole table at every shift from -30 to
+30 cents (--shifts) and judging C4..B6: -5 cents gives the lowest mean roughness, and -7 to
-4 is a plateau. The tool prints the table; --check compares the result with
avm_music.NOTE_TUNING_CENTS so the committed table can be reproduced.

Roughness is the amplitude modulation of the band around the fundamental (0.6 f .. 1.6 f),
expressed as the root-sum of the envelope's fluctuation between 15 and 120 Hz relative to its
mean. Needs NumPy and SciPy (the `audio` extra); the score compiler itself does not.
"""
import argparse
import math
import sys
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

import numpy as np
from scipy.signal import butter, hilbert, sosfiltfilt

try:
    from . import avm_audio_render, avm_music
except ImportError:
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import avm_audio_render
    import avm_music

RATE = 15625.0
DUTIES = (32, 64, 96, 128)    # 12.5, 25, 37.5 and 50 percent: the duties the shipped scores use
AMPLITUDES = (4, 6, 8, 10, 12, 15, 20, 24, 31)  # voice amplitudes 0..31 the scores run at
LIMIT = 6                     # cents; keeps simultaneous intervals within 12 cents
MIN_GAIN = 0.05               # roughness points a nudge must remove, or the note stays put
TIE = 0.02                    # corrections within this of the best are equal; the smaller wins
DURATIONS = (1.5, 0.7)        # seconds rendered; the cost is their mean
FIRST, LAST = avm_music.NOTE_FIRST, avm_music.NOTE_LAST
GLOBAL = avm_music.GLOBAL_TUNING_CENTS
TUNED_FROM = 48               # C3: below this the 15..120 Hz band is not a roughness measure


def roughness(note, cents, seconds, duty, amplitude):
    """Roughness of a note moved by cents from equal temperament at A = 440 Hz, at one duty and
    amplitude, on the interrupt's own output: each sample is round(value * amplitude / 128)."""
    frequency = 440 * 2 ** ((note - 69) / 12) * 2 ** (cents / 1200)
    increment = round(frequency * 65536 / RATE)
    k = np.arange(int(RATE * seconds), dtype=np.int64) + 1
    values = avm_audio_render.pulse_values(k * increment, increment, duty)
    x = np.floor(values * amplitude / 128 + 0.5)
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


def cost(note, cents):
    """Mean roughness of a note over every duty, amplitude and rendered length."""
    return float(np.mean([roughness(note, cents, s, d, a)
                          for d in DUTIES for a in AMPLITUDES for s in DURATIONS]))


def _cost(args):
    return cost(*args)


def derive(jobs=None, shift=None):
    shift = GLOBAL if shift is None else shift
    notes = [n for n in range(FIRST, LAST + 1) if n >= TUNED_FROM]
    grid = [(n, shift + c) for n in notes for c in range(-LIMIT, LIMIT + 1)]
    with ProcessPoolExecutor(jobs) as pool:
        costs = dict(zip(grid, pool.map(_cost, grid, chunksize=8)))
    table = []
    for note in range(FIRST, LAST + 1):
        if note < TUNED_FROM:
            table.append(0)
            continue
        by_cents = {c: costs[(note, shift + c)] for c in range(-LIMIT, LIMIT + 1)}
        best = min(by_cents.values())
        if by_cents[0] - best < MIN_GAIN:
            table.append(0)
        else:
            table.append(min((abs(c), c) for c, v in by_cents.items() if v <= best + TIE)[1])
    return tuple(table)


def summarize(table, jobs=None, shift=None):
    shift = GLOBAL if shift is None else shift
    notes = range(60, LAST + 1)
    grid = [(n, 0) for n in notes] + [(n, shift + table[n - FIRST]) for n in notes]
    with ProcessPoolExecutor(jobs) as pool:
        values = list(pool.map(_cost, grid, chunksize=8))
    before, after = np.array(values[:len(notes)]), np.array(values[len(notes):])
    return (f"C4..B6 roughness % at equal temperament -> shipped tuning: mean {before.mean():.3f} -> "
            f"{after.mean():.3f}, worst {before.max():.2f} -> {after.max():.2f}; "
            f"universal shift {shift:+d} cents, {sum(1 for c in table if c)} notes corrected, "
            f"mean |c| over them {np.mean([abs(c) for c in table if c]):.1f} cents")


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--check", action="store_true",
                        help="exit 1 if avm_music.NOTE_TUNING_CENTS differs from the derived table")
    parser.add_argument("--jobs", type=int, default=None, help="worker processes (default: all cores)")
    parser.add_argument("--shifts", action="store_true",
                        help="derive the table at every shift from -30 to +30 cents and print the "
                             "C4..B6 roughness of each, instead of the committed shift's table")
    args = parser.parse_args()
    if args.shifts:
        for shift in range(-30, 31):
            print(f"{shift:+3d}: {summarize(derive(args.jobs, shift), args.jobs, shift)}")
        return 0
    table = derive(args.jobs)
    print("NOTE_TUNING_CENTS = (")
    for octave in range(FIRST // 12, LAST // 12 + 1):
        chunk = table[octave * 12 - FIRST:octave * 12 + 12 - FIRST]
        print("    " + " ".join(f"{c:+d}," for c in chunk) + f"  # C{octave - 1}..B{octave - 1}")
    print(")")
    print(summarize(table, args.jobs), file=sys.stderr)
    if args.check and table != tuple(avm_music.NOTE_TUNING_CENTS):
        print("avm_music.NOTE_TUNING_CENTS does not match the derived table", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
