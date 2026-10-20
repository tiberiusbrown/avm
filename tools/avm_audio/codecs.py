"""Four independently decodable, framed integer audio codecs (AVAC v1)."""

from __future__ import annotations

import io
import struct
from collections.abc import Iterator
from dataclasses import dataclass, field
from typing import BinaryIO

import numpy as np

try:
    from numba import njit
except ImportError:

    def njit(*args, **kwargs):
        return lambda fn: fn


RATE = 15625
STEPS = (1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 18, 22, 26, 31, 36, 42)
ADPCM_STEPS = (1, 2, 3, 4, 5, 7, 10, 14, 20, 28, 40, 56, 80, 112, 160, 224)
HEADER = struct.Struct("<4sBBBBHII")
NAMES = {1: "symmetric_dpcm", 2: "adaptive_dpcm", 3: "predictor_dpcm", 4: "adpcm"}


@dataclass(frozen=True)
class Format:
    codec: int
    frame_size: int
    sample_count: int
    steps: tuple[int, ...]
    sample_adaptation: bool = False

    def header(self) -> bytes:
        self.validate()
        return HEADER.pack(
            b"AVAC",
            1,
            self.codec,
            int(self.sample_adaptation),
            len(self.steps),
            self.frame_size,
            self.sample_count,
            RATE,
        ) + bytes(self.steps)

    def validate(self):
        if self.codec not in NAMES or not 2 <= self.frame_size <= 65534:
            raise ValueError("invalid codec or frame size (2..65534)")
        if self.codec == 4 and self.frame_size % 2:
            raise ValueError("half-rate codec requires an even output frame size")
        if not 0 <= self.sample_count <= 0xFFFFFFFF:
            raise ValueError("sample count exceeds AVAC v1")
        if not 1 <= len(self.steps) <= 16 or any(not 1 <= s <= 255 for s in self.steps):
            raise ValueError("step table must have 1..16 entries in 1..255")
        if self.sample_adaptation and self.codec != 2:
            raise ValueError("sample adaptation flag is only valid for codec 2")


def read_exact(stream: BinaryIO, count: int) -> bytes:
    data = bytearray()
    while len(data) < count:
        chunk = stream.read(count - len(data))
        if not chunk:
            raise ValueError("truncated audio stream")
        data.extend(chunk)
    return bytes(data)


def read_format(stream: BinaryIO) -> Format:
    magic, version, codec, flags, count, frame, samples, rate = HEADER.unpack(
        read_exact(stream, HEADER.size)
    )
    if magic != b"AVAC" or version != 1 or rate != RATE or flags & ~1:
        raise ValueError("unsupported AVAC header")
    if not 1 <= count <= 16:
        raise ValueError("invalid step table length")
    fmt = Format(codec, frame, samples, tuple(read_exact(stream, count)), bool(flags))
    fmt.validate()
    return fmt


def transition(codec, state, code, steps, mode, phase, sample_adaptation=False):
    """Independent scalar decoder. All arithmetic is mathematical signed integer."""
    previous, older, index, direction, large = state
    step = steps[index]
    prediction = previous
    if codec in (1, 3):
        if mode == 1:
            prediction = previous + previous - older
        elif mode == 2:
            prediction = previous + ((previous - older) >> 1)
        magnitude = step + (step << 1) if code in (0, 3) else step
        raw = prediction + (-magnitude if code < 2 else magnitude)
    elif codec == 2:
        if code == 1:
            direction = 1
        elif code == 2:
            direction = -1
        magnitude = step + (step << 1) if code == 3 else step
        raw = (
            previous
            if code == 0
            else previous + (magnitude if direction > 0 else -magnitude)
        )
        if sample_adaptation:
            index += 1 if code == 3 else (-1 if code == 0 else 0)
            index = min(len(steps) - 1, max(0, index))
        else:
            large += int(code == 3)
            if phase == 3:
                index += -1 if large < 2 else (1 if large > 2 else 0)
                index = min(len(steps) - 1, max(0, index))
                large = 0
    else:
        delta = step >> 3
        if code & 1:
            delta += step >> 2
        if code & 2:
            delta += step >> 1
        if code & 4:
            delta += step
        raw = previous + (-delta if code & 8 else delta)
        index = min(
            len(steps) - 1, max(0, index + (-1, -1, -1, -1, 2, 4, 6, 8)[code & 7])
        )
    value = min(127, max(-128, raw))
    return (value, previous, index, direction, large), raw != value


@dataclass
class DecodeStats:
    saturated_samples: int = (
        0  # raw reconstruction exceeded range, not merely hit an endpoint
    )
    endpoint_samples: int = 0
    modes: dict[int, int] = field(default_factory=dict)
    initial_scales: dict[int, int] = field(default_factory=dict)


def iter_native(
    stream: BinaryIO, fmt: Format, stats: DecodeStats | None = None
) -> Iterator[int]:
    """Read at most one packed data byte at a time; no frame-sized allocation."""
    stats = stats if stats is not None else DecodeStats()
    total = (fmt.sample_count + 1) // 2 if fmt.codec == 4 else fmt.sample_count
    frame = fmt.frame_size // 2 if fmt.codec == 4 else fmt.frame_size
    bits = 4 if fmt.codec == 4 else 2
    mask = (1 << bits) - 1
    for start in range(0, total, frame):
        count = min(frame, total - start)
        seed, param = read_exact(stream, 2)
        seed = seed if seed < 128 else seed - 256
        index, mode = param & 15, param >> 4
        if index >= len(fmt.steps) or (mode > 2 if fmt.codec == 3 else mode != 0):
            raise ValueError("invalid frame parameter")
        stats.modes[mode] = stats.modes.get(mode, 0) + 1
        stats.initial_scales[index] = stats.initial_scales.get(index, 0) + 1
        state = (seed, seed, index, 1, 0)
        stats.endpoint_samples += int(seed in (-128, 127))
        yield seed
        packed, offset = 0, 0
        for position in range(count - 1):
            if offset == 0:
                packed = read_exact(stream, 1)[0]
            code = (packed >> offset) & mask
            offset = (offset + bits) & 7
            state, saturated = transition(
                fmt.codec,
                state,
                code,
                fmt.steps,
                mode,
                position & 3,
                fmt.sample_adaptation,
            )
            stats.saturated_samples += int(saturated)
            stats.endpoint_samples += int(state[0] in (-128, 127))
            yield state[0]
        used = offset
        if used and packed >> used:
            raise ValueError("nonzero frame padding")
    if stream.read(1):
        raise ValueError("trailing bytes after AVAC stream")


def iter_output(
    stream: BinaryIO, fmt: Format, upsample="hold", stats=None
) -> Iterator[int]:
    native = iter_native(stream, fmt, stats)
    if fmt.codec != 4:
        yield from native
        return
    if upsample not in ("hold", "linear"):
        raise ValueError("upsampler must be hold or linear")
    if upsample == "hold":
        remaining = fmt.sample_count
        for value in native:
            for _ in range(min(2, remaining)):
                yield value
                remaining -= 1
        return
    previous = next(native, None)
    remaining = fmt.sample_count
    while previous is not None:
        following = next(native, None)
        if remaining:
            yield previous
            remaining -= 1
        if remaining:
            yield (
                (previous + following) >> 1
                if upsample == "linear" and following is not None
                else previous
            )
            remaining -= 1
        previous = following


def decode(data: bytes, upsample="hold"):
    stream = io.BytesIO(data)
    fmt = read_format(stream)
    stats = DecodeStats()
    samples = np.fromiter(iter_output(stream, fmt, upsample, stats), dtype=np.int8)
    return samples, fmt, stats


def pack_codes(codes, bits):
    output = bytearray((len(codes) * bits + 7) // 8)
    for i, code in enumerate(codes):
        output[i * bits // 8] |= int(code) << ((i * bits) & 7)
    return bytes(output)


@njit(cache=True)
def _move(
    codec, p, older, index, direction, large, code, steps, mode, phase, per_sample
):
    """Encoder simulation, deliberately separate from the streaming Python decoder."""
    step = int(steps[index])
    if codec == 1 or codec == 3 or codec == 6:
        prediction = p
        if mode == 1:
            prediction = p + p - older
        elif mode == 2:
            prediction = p + (p - older) // 2
        raw = prediction + (2 * code - (1 if codec == 6 else 3)) * step
    elif codec == 2:
        if code == 1:
            direction = 1
        elif code == 2:
            direction = -1
        raw = p
        if code != 0:
            raw += direction * step * (3 if code == 3 else 1)
        if per_sample:
            index += 1 if code == 3 else (-1 if code == 0 else 0)
            index = max(0, min(len(steps) - 1, index))
        else:
            large += int(code == 3)
            if phase == 3:
                index += -1 if large < 2 else (1 if large > 2 else 0)
                index = max(0, min(len(steps) - 1, index))
                large = 0
    else:
        delta = step >> 3
        if code & 1:
            delta += step >> 2
        if code & 2:
            delta += step >> 1
        if code & 4:
            delta += step
        raw = p + (-delta if code & 8 else delta)
        adjustment = -1
        if (code & 7) >= 4:
            adjustment = (2, 4, 6, 8)[(code & 7) - 4]
        index = max(0, min(len(steps) - 1, index + adjustment))
    return max(-128, min(127, raw)), p, index, direction, large


@njit(cache=True)
def _state_key(codec, p, older, index, direction, large):
    if codec == 1:
        return p + 128
    if codec == 3 or codec == 6:
        return p + 128 + 256 * (older + 128)
    if codec == 2:
        return p + 128 + 256 * (index + 16 * (int(direction > 0) + 2 * large))
    return p + 128 + 256 * index


@njit(cache=True)
def _greedy(target, codec, steps, mode, index, per_sample, penalty, next_seed):
    n = len(target)
    codes = np.empty(max(0, n - 1), np.uint8)
    recon = np.empty(n, np.int8)
    if n == 0:
        return 0.0, codes, recon
    p = older = int(target[0])
    direction, large = 1, 0
    recon[0] = p
    cost = 0.0
    alphabet = 16 if codec == 4 else (2 if codec == 6 else 4)
    for t in range(1, n):
        best = np.inf
        chosen = 0
        for code in range(alphabet):
            q, _o, _ix, _d, _lg = _move(
                codec,
                p,
                older,
                index,
                direction,
                large,
                code,
                steps,
                mode,
                (t - 1) & 3,
                per_sample,
            )
            error = (int(target[t]) - q) ** 2
            if t == n - 1 and next_seed < 1000:
                error += penalty * (q - next_seed) ** 2
            if error < best:
                best, chosen = error, code
        p, older, index, direction, large = _move(
            codec,
            p,
            older,
            index,
            direction,
            large,
            chosen,
            steps,
            mode,
            (t - 1) & 3,
            per_sample,
        )
        cost += best
        codes[t - 1], recon[t] = chosen, p
    return cost, codes, recon


@njit(cache=True)
def _beam(target, codec, steps, mode, index, width, per_sample, penalty, next_seed):
    if width == 1 or len(target) < 2:
        return _greedy(
            target, codec, steps, mode, index, per_sample, penalty, next_seed
        )
    n = len(target)
    alphabet = 16 if codec == 4 else (2 if codec == 6 else 4)
    limit = width * alphabet
    states = np.zeros((width, 5), np.int64)
    states[0, 0] = target[0]
    states[0, 1] = target[0]
    states[0, 2] = index
    states[0, 3] = 1
    costs = np.zeros(width, np.float64)
    parents = np.empty((n, width), np.int32)
    symbols = np.empty((n, width), np.uint8)
    values = np.empty((n, width), np.int8)
    values[0, 0] = target[0]
    candidate = np.empty((limit, 5), np.int64)
    ccost = np.empty(limit, np.float64)
    cparent = np.empty(limit, np.int32)
    ccode = np.empty(limit, np.uint8)
    heap = np.empty(width, np.int32)
    capacity = 1
    while capacity < limit * 2:
        capacity *= 2
    keys = np.empty(capacity, np.int64)
    slots = np.empty(capacity, np.int32)
    active = 1
    for t in range(1, n):
        keys[:] = -1
        unique = 0
        for parent in range(active):
            p, o, ix, d, lg = states[parent]
            for code in range(alphabet):
                q, qo, qi, qd, ql = _move(
                    codec, p, o, ix, d, lg, code, steps, mode, (t - 1) & 3, per_sample
                )
                cost = costs[parent] + (int(target[t]) - q) ** 2
                if t == n - 1 and next_seed < 1000:
                    cost += penalty * (q - next_seed) ** 2
                key_codec = 1 if (codec == 3 or codec == 6) and mode == 0 else codec
                key = _state_key(key_codec, q, qo, qi, qd, ql)
                slot = (key * 2654435761) & (capacity - 1)
                while keys[slot] != -1 and keys[slot] != key:
                    slot = (slot + 1) & (capacity - 1)
                if keys[slot] == -1:
                    keys[slot], slots[slot] = key, unique
                    pos = unique
                    unique += 1
                    ccost[pos] = np.inf
                else:
                    pos = slots[slot]
                if cost < ccost[pos]:
                    candidate[pos, 0] = q
                    candidate[pos, 1] = qo
                    candidate[pos, 2] = qi
                    candidate[pos, 3] = qd
                    candidate[pos, 4] = ql
                    ccost[pos], cparent[pos], ccode[pos] = cost, parent, code
        # A bounded max heap chooses the best B unique states in O(K log B).
        size = 0
        for pos in range(unique):
            if size < width:
                h = size
                size += 1
                heap[h] = pos
                while h > 0:
                    up = (h - 1) // 2
                    a, b = heap[h], heap[up]
                    if ccost[a] < ccost[b] or (ccost[a] == ccost[b] and a < b):
                        break
                    heap[h], heap[up] = b, a
                    h = up
            elif ccost[pos] < ccost[heap[0]] or (
                ccost[pos] == ccost[heap[0]] and pos < heap[0]
            ):
                heap[0] = pos
                h = 0
                while 2 * h + 1 < size:
                    child = 2 * h + 1
                    if child + 1 < size:
                        a, b = heap[child], heap[child + 1]
                        if ccost[b] > ccost[a] or (ccost[b] == ccost[a] and b > a):
                            child += 1
                    a, b = heap[h], heap[child]
                    if ccost[a] > ccost[b] or (ccost[a] == ccost[b] and a > b):
                        break
                    heap[h], heap[child] = b, a
                    h = child
        active = size
        for j in range(active):
            pos = heap[j]
            states[j], costs[j] = candidate[pos], ccost[pos]
            parents[t, j], symbols[t, j], values[t, j] = (
                cparent[pos],
                ccode[pos],
                candidate[pos, 0],
            )
    chosen = 0
    for j in range(1, active):
        if costs[j] < costs[chosen]:
            chosen = j
    cost = costs[chosen]
    codes = np.empty(n - 1, np.uint8)
    recon = np.empty(n, np.int8)
    for t in range(n - 1, 0, -1):
        codes[t - 1], recon[t] = symbols[t, chosen], values[t, chosen]
        chosen = parents[t, chosen]
    recon[0] = target[0]
    return cost, codes, recon


@njit(cache=True)
def _exact(target, steps, index, penalty, next_seed):
    """Exact shortest path through the 256 sample states of symmetric DPCM."""
    n = len(target)
    codes = np.empty(max(0, n - 1), np.uint8)
    recon = np.empty(n, np.int8)
    if n < 2:
        if n:
            recon[0] = target[0]
        return 0.0, codes, recon
    cost = np.full(256, np.inf)
    cost[int(target[0]) + 128] = 0.0
    parents = np.empty((n, 256), np.uint8)
    symbols = np.empty((n, 256), np.uint8)
    step = int(steps[index])
    for t in range(1, n):
        future = np.full(256, np.inf)
        for state in range(256):
            if not np.isfinite(cost[state]):
                continue
            for code in range(4):
                q = max(-128, min(127, state - 128 + (2 * code - 3) * step))
                error = cost[state] + (int(target[t]) - q) ** 2
                if t == n - 1 and next_seed < 1000:
                    error += penalty * (q - next_seed) ** 2
                if error < future[q + 128]:
                    future[q + 128] = error
                    parents[t, q + 128], symbols[t, q + 128] = state, code
        cost = future
    state = np.argmin(cost)
    best = cost[state]
    for t in range(n - 1, 0, -1):
        recon[t], codes[t - 1] = state - 128, symbols[t, state]
        state = parents[t, state]
    recon[0] = target[0]
    return best, codes, recon


def encode(
    samples,
    codec,
    frame_size=128,
    beam_width=16,
    method="beam",
    steps=None,
    sample_adaptation=False,
    boundary_penalty=0.0,
    output_count=None,
    progress=None,
):
    """samples are common int8 PCM, or its filtered/requantized half-rate form for 4."""
    samples = np.asarray(samples)
    if samples.dtype != np.int8 or samples.ndim != 1:
        raise ValueError("encoder requires a one-dimensional signed 8-bit reference")
    if method not in ("greedy", "beam", "exact") or beam_width < 1 or beam_width > 4096:
        raise ValueError("invalid search method or beam width (1..4096)")
    if method == "exact" and codec != 1:
        raise ValueError("exact dynamic programming is available for codec 1")
    if boundary_penalty < 0 or not np.isfinite(boundary_penalty):
        raise ValueError("boundary penalty must be finite and nonnegative")
    steps = tuple(
        steps if steps is not None else (ADPCM_STEPS if codec == 4 else STEPS)
    )
    output_count = (
        len(samples) * 2 if codec == 4 and output_count is None else output_count
    )
    fmt = Format(
        codec,
        frame_size,
        len(samples) if output_count is None else output_count,
        steps,
        sample_adaptation,
    )
    payload = bytearray(fmt.header())
    expected = (fmt.sample_count + 1) // 2 if codec == 4 else fmt.sample_count
    if len(samples) != expected:
        raise ValueError("native and output sample counts disagree")
    table = np.array(steps, dtype=np.int64)
    frame = frame_size // 2 if codec == 4 else frame_size
    simulated = np.empty_like(samples)
    modes = range(3) if codec == 3 else range(1)
    width = 1 if method == "greedy" else beam_width
    for start in range(0, len(samples), frame):
        target = samples[start : start + frame]
        next_seed = (
            int(samples[start + frame]) if start + frame < len(samples) else 1000
        )
        best = np.inf
        selected = None
        for mode in modes:
            for index in range(len(steps)):
                if method == "exact":
                    result = _exact(target, table, index, boundary_penalty, next_seed)
                else:
                    result = _beam(
                        target,
                        codec,
                        table,
                        mode,
                        index,
                        width,
                        sample_adaptation,
                        boundary_penalty,
                        next_seed,
                    )
                    # Finite beams need not contain the greedy trajectory. Preserve it
                    # as a fallback so offline optimization never worsens this objective.
                    if width > 1:
                        greedy = _greedy(
                            target,
                            codec,
                            table,
                            mode,
                            index,
                            sample_adaptation,
                            boundary_penalty,
                            next_seed,
                        )
                        if greedy[0] < result[0]:
                            result = greedy
                if result[0] < best:
                    best, selected = result[0], (mode, index, result[1], result[2])
        mode, index, codes, reconstruction = selected
        payload += bytes((int(target[0]) & 255, index | (mode << 4)))
        payload += pack_codes(codes, 4 if codec == 4 else 2)
        simulated[start : start + len(target)] = reconstruction
        if progress and (start // frame) % 512 == 0:
            progress(min(start + frame, len(samples)), len(samples))
    return bytes(payload), simulated
