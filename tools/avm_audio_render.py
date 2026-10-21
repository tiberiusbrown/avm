#!/usr/bin/env python3
"""Sample-accurate A5 music rendering at AVM's logical synthesis output.

This models the ISR, not Timer4 PWM, acoustic piezo response, or foreground
service jitter. Events publish immediately before the first sample at/after
their 4 ms deadline. The hardware writes the previous held sample to PWM.
Only Stage 2 imports NumPy; the score compiler remains standard-library-only.
"""
import math
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path

import numpy as np
from scipy.io import wavfile
from scipy.signal import resample_poly

RATES = (7812.5, 15625.0)


@dataclass(frozen=True)
class Event:
    tick: int
    pitches: tuple
    controls: tuple
    command: int = -1


@dataclass
class Render:
    pcm: np.ndarray  # uint8 PWM endpoint, before its one-sample output hold
    mix: np.ndarray  # signed, unclipped sum (actual overload measurement)
    rate: float
    start: float
    event_count: int

    @property
    def audio(self):
        return (self.pcm.astype(np.float64) - 128) / 128

    def metrics(self):
        audio = self.audio
        overloaded = (self.mix < -128) | (self.mix > 127)
        # Longest continuous overload, independent of ordinary rail samples.
        edges = np.diff(np.r_[False, overloaded, False].astype(np.int8))
        runs = np.flatnonzero(edges == -1) - np.flatnonzero(edges == 1)
        return {"peak": float(np.max(np.abs(audio), initial=0)),
                "rms": float(np.sqrt(np.mean(audio ** 2))) if len(audio) else 0.,
                "ac_rms": float(np.std(audio)) if len(audio) else 0.,
                "dc": float(np.mean(audio)) if len(audio) else 0.,
                "clipping_fraction": float(np.mean(overloaded)) if len(audio) else 0.,
                "longest_clipping_ms": float(max(runs, default=0) * 1000 / self.rate)}


def decode(data):
    """Validate and decode one A5 traversal, stopping at End/Loop (padding OK)."""
    data = bytes(data)
    if len(data) < 2 or data[0] != 0xA5 or not 1 <= data[1] <= 15:
        raise ValueError("Expected A5 music and ownership mask 1..15")
    owner, position, tick, events = data[1], 2, 0, []

    def byte():
        nonlocal position
        if position >= len(data):
            raise ValueError("Truncated A5 stream (missing End/Loop or payload)")
        value = data[position]
        position += 1
        return value

    while position < len(data):
        tick += byte() + 1
        mask = byte()
        if not mask:
            command = byte()
            if command not in (0, 1, 2):
                raise ValueError("Unknown A5 command")
            events.append(Event(tick, (), (), command))
            if command:
                return events
            continue
        if ((mask & 15) | (mask >> 4)) & ~owner:
            raise ValueError("A5 event updates an unowned voice")
        pitches, controls = [], []
        for channel in range(4):
            if mask & (1 << channel):
                pitches.append((channel, byte() | (byte() << 8)))
        for channel in range(4):
            if mask & (16 << channel):
                control = byte()
                if control & (0x60 if channel == 3 else 0x40):
                    raise ValueError("Reserved A5 control bits")
                extension = byte() if control & 128 else -1
                if channel == 3 and extension != -1 and not 1 <= extension <= 63:
                    raise ValueError("Noise seed must be 1..63")
                # Retain the tonal waveform bit with volume, as in AVR desired state.
                controls.append((channel, control & 63, extension))
        events.append(Event(tick, tuple(pitches), tuple(controls)))
    raise ValueError("A5 stream has no End/Loop")


# Every nonzero seed belongs to this single 255-element Galois cycle.
_cycle = [1]
for _ in range(254):
    _value = _cycle[-1]
    _cycle.append((_value >> 1) ^ (0xB8 if _value & 1 else 0))
_cycle = np.array(_cycle, dtype=np.int64)
_indices = {int(v): i for i, v in enumerate(_cycle)}


def render(data, *, rate=15625., master=128, duration=None, start=0.):
    """Render compiled data, preserving state across skipped prefix samples.

    Skipping a prefix advances phases/LFSR arithmetically without generating
    samples. This makes fitting late excerpts practical. A looping asset needs
    an explicit duration to render more than one traversal.
    """
    if rate not in RATES or not isinstance(master, int) or not 0 <= master <= 255:
        raise ValueError("Rate must be 7812.5 or 15625; master must be 0..255")
    events = decode(data)
    if not math.isfinite(start) or start < 0:
        raise ValueError("Start must be finite and nonnegative")
    if duration is None:
        duration = max(0., events[-1].tick * .004 - start)
    if not math.isfinite(duration) or duration <= 0:
        raise ValueError("Duration must be finite and positive")
    first = math.ceil(start * rate - 1e-9)
    stop = math.ceil((start + duration) * rate - 1e-9)
    mix = np.zeros(stop - first, dtype=np.int16)
    increments, volumes, duties, phases = [0]*4, [24]*4, [128]*3, [0]*4
    noise_index, cursor, base_tick, count = 0, 0, 0, 0

    def span(end):
        nonlocal cursor, noise_index
        end = min(end, stop)
        if end <= cursor:
            return
        lo = max(cursor, first)
        if end > lo:
            k = np.arange(lo - cursor + 1, end - cursor + 1, dtype=np.int64)
            out = np.zeros(len(k), dtype=np.int16)
            for ch in range(4):
                amp = (volumes[ch] & 31) * master // 32 if increments[ch] else 0
                if not amp:
                    continue
                position = phases[ch] + k * increments[ch]
                if ch < 3:
                    high = (position & 65535) >> 8
                    if volumes[ch] & 32:
                        # SBRC/COM, LSL, SUBI: fold high half, then -127..127.
                        sample = 2 * np.where(high & 128, high ^ 255, high) - 127
                    else:
                        sample = np.where(high < duties[ch], 127, -127)
                    # FMULSU rounding: floor(sample * amp / 128 + .5).
                    out += ((sample * amp + 64) // 128).astype(np.int16)
                else:
                    lfsr = _cycle[(noise_index + (position >> 16)) % 255]
                    out += np.where(lfsr & 1, -amp, amp).astype(np.int16)
            mix[lo-first:end-first] = out
        n = end - cursor
        noise_index = (noise_index + (phases[3] + n * increments[3]) // 65536) % 255
        for ch in range(4):
            phases[ch] = (phases[ch] + n * increments[ch]) & 65535
        cursor = end

    while cursor < stop:
        for event in events:
            deadline = math.ceil((base_tick + event.tick) * rate / 250 - 1e-9)
            span(deadline)
            if cursor >= stop:
                break
            count += 1
            for ch, pitch in event.pitches:
                increments[ch] = min(65535, pitch * (2 if rate == 7812.5 else 1))
            for ch, volume, extension in event.controls:
                volumes[ch] = volume
                if extension >= 0:
                    if ch < 3:
                        duties[ch] = extension
                    else:
                        phases[3], noise_index = 0, _indices[extension]
            if event.command == 1:
                increments = [0]*4
                span(stop)
                break
        if events[-1].command == 2:
            base_tick += events[-1].tick
        else:
            break
    return Render(np.clip(mix.astype(np.int32)+128, 0, 255).astype(np.uint8), mix, rate, start, count)


def write_wav(path, audio, rate):
    """Lossless PCM16 preview; 7812.5 Hz uses exact 2x resampling to 15625 Hz.

    RIFF sample rates are integers. No independent loudness normalization is
    applied. Fixed conversion preserves A/B levels and avoids pitch drift.
    """
    audio = np.asarray(audio, dtype=np.float64)
    if rate != int(rate):
        ratio = Fraction(rate).limit_denominator()
        audio = resample_poly(audio, ratio.denominator, 1)
        rate = ratio.numerator
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    wavfile.write(path, int(rate), np.rint(np.clip(audio, -1, 32767/32768)*32768).astype(np.int16))
