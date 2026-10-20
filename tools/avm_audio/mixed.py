"""One/two-bit predictor frame candidates and shared rate-distortion allocation."""

from __future__ import annotations

import hashlib
import json
import time
from dataclasses import dataclass
from pathlib import Path

import numpy as np

from .codecs import (
    STEPS,
    _beam,
    _greedy,
    decode,
    encode,
    njit,
    pack_codes,
    read_exact,
    transition,
)
from .entropy import extract_frames
from .extended import BitReader, ExtendedFormat, decode_extended, signed_byte


@dataclass
class FrameOption:
    payload: bytes
    reconstruction: np.ndarray
    label: str


def iter_mixed(source, fmt, stats):
    for start in range(0, fmt.sample_count, fmt.frame_size):
        count = min(fmt.frame_size, fmt.sample_count - start)
        seed, parameter = read_exact(source, 2)
        width, mode, index = parameter >> 6, (parameter >> 4) & 3, parameter & 15
        if (
            width == 3
            or mode > 2
            or index >= len(fmt.steps)
            or (width == 0 and parameter != 0)
        ):
            raise ValueError("unsupported mixed-frame parameter")
        seed = signed_byte(seed)
        state = (seed, seed, index, 1, 0)
        stats.modes[width * 4 + mode] = stats.modes.get(width * 4 + mode, 0) + 1
        stats.endpoint_samples += int(seed in (-128, 127))
        yield seed
        reader = BitReader(source)
        for position in range(count - 1):
            if width:
                symbol = reader.read(width)
                symbol = symbol + 1 if width == 1 else symbol
                state, saturated = transition(
                    3, state, symbol, fmt.steps, mode, position & 3
                )
                stats.saturated_samples += int(saturated)
            stats.endpoint_samples += int(state[0] in (-128, 127))
            yield state[0]
        reader.align()


def parse_bank(streams, reference):
    banks = []
    format_ = None
    for data, label in zip(streams, ("hold", "one", "two")):
        reconstruction, fmt, _ = decode_extended(data)
        if fmt.codec != 6 or len(reconstruction) != len(reference):
            raise ValueError("invalid mixed candidate cache")
        if format_ is None:
            format_ = fmt
            banks = [
                []
                for _ in range((len(reference) + fmt.frame_size - 1) // fmt.frame_size)
            ]
        elif fmt != format_:
            raise ValueError("inconsistent candidate cache formats")
        offset = 18 + len(fmt.steps)
        for frame, start in enumerate(range(0, len(reference), fmt.frame_size)):
            size = min(fmt.frame_size, len(reference) - start)
            width = data[offset + 1] >> 6
            length = 2 + ((size - 1) * width + 7) // 8
            banks[frame].append(
                FrameOption(
                    data[offset : offset + length],
                    reconstruction[start : start + size],
                    label,
                )
            )
            offset += length
        if offset != len(data):
            raise ValueError("mixed candidate cache length mismatch")
    return format_, banks


def build_mixed_bank(
    reference, frame_size=128, beam_width=16, baseline=None, cache=None, progress=None
):
    if reference.dtype != np.int8 or reference.ndim != 1:
        raise ValueError("candidate banks require the common signed PCM8 reference")
    ExtendedFormat(6, frame_size, len(reference)).validate()
    if not 1 <= beam_width <= 4096:
        raise ValueError("beam width must be 1..4096")
    config = {
        "reference_sha256": hashlib.sha256(reference.tobytes()).hexdigest(),
        "frame_size": frame_size,
        "beam_width": beam_width,
        "steps": list(STEPS),
        "baseline_stream_sha256": hashlib.sha256(baseline).hexdigest()
        if baseline is not None
        else None,
        "bank_version": 2,
    }
    cache = Path(cache) if cache else None
    names = ("hold", "one", "two")
    if (
        cache
        and (cache / "config.json").exists()
        and json.loads((cache / "config.json").read_text()) == config
    ):
        streams = [(cache / f"all_{label}.avax").read_bytes() for label in names]
        fmt, bank = parse_bank(streams, reference)
        return fmt, bank, {"cache_reused": True, "candidate_encode_seconds": 0.0}
    before = time.perf_counter()
    source_format = None
    if baseline is not None:
        source_format, _ = extract_frames(baseline)
    if (
        source_format is None
        or source_format.frame_size != frame_size
        or source_format.steps != STEPS
    ):
        baseline, _ = encode(reference, 3, frame_size, beam_width)
    source_format, frames = extract_frames(baseline)
    if source_format.sample_count != len(reference):
        raise ValueError("baseline sample count mismatch")
    fmt = ExtendedFormat(6, frame_size, len(reference))
    streams = [bytearray(fmt.header()) for _ in names]
    table = np.array(STEPS, np.int64)
    simulations = [np.empty_like(reference) for _ in names]
    two = decode(baseline)[0]
    for frame, start in enumerate(range(0, len(reference), frame_size)):
        target = reference[start : start + frame_size]
        value = int(np.rint(np.mean(target)))
        streams[0] += bytes([value & 255, 0])
        simulations[0][start : start + len(target)] = value
        best, selected = np.inf, None
        for mode in range(3):
            for index in range(len(STEPS)):
                result = _beam(
                    target, 6, table, mode, index, beam_width, False, 0.0, 1000
                )
                if beam_width > 1:
                    greedy = _greedy(target, 6, table, mode, index, False, 0.0, 1000)
                    if greedy[0] < result[0]:
                        result = greedy
                if result[0] < best:
                    best, selected = result[0], (mode, index, result[1], result[2])
        mode, index, codes, reconstructed = selected
        streams[1] += bytes(
            [int(target[0]) & 255, 0x40 | (mode << 4) | index]
        ) + pack_codes(codes, 1)
        simulations[1][start : start + len(target)] = reconstructed
        original = frames[frame]
        streams[2] += bytes([original.seed, original.parameter | 0x80]) + pack_codes(
            original.codes, 2
        )
        simulations[2][start : start + len(target)] = two[start : start + len(target)]
        if progress and frame % 256 == 0:
            progress(min(start + frame_size, len(reference)), len(reference))
    for data, simulated in zip(streams, simulations):
        np.testing.assert_array_equal(decode_extended(bytes(data))[0], simulated)
    if cache:
        cache.mkdir(parents=True, exist_ok=True)
        for label, data in zip(names, streams):
            (cache / f"all_{label}.avax").write_bytes(data)
        (cache / "config.json").write_text(
            json.dumps(config, indent=2), encoding="utf-8"
        )
    fmt, bank = parse_bank(streams, reference)
    return (
        fmt,
        bank,
        {
            "cache_reused": False,
            "candidate_encode_seconds": time.perf_counter() - before,
        },
    )


@njit(cache=True)
def _lagrange(costs, sizes, first, last, boundaries, multiplier, boundary_weight):
    n, width = costs.shape
    choices = np.empty(n, np.int32)
    if n == 0:
        return choices, 0.0, 0
    if boundary_weight == 0:
        objective, bits = 0.0, 0
        for frame in range(n):
            best, selected = np.inf, 0
            for option in range(width):
                value = costs[frame, option] + multiplier * sizes[frame, option]
                if value < best:
                    best, selected = value, option
            choices[frame] = selected
            objective += best
            bits += sizes[frame, selected]
        return choices, objective, bits
    prior = costs[0] + multiplier * sizes[0]
    parents = np.empty((n, width), np.int32)
    for frame in range(1, n):
        current = np.full(width, np.inf)
        for option in range(width):
            for previous in range(width):
                edge = (
                    first[frame, option] - last[frame - 1, previous] - boundaries[frame]
                )
                value = (
                    prior[previous]
                    + costs[frame, option]
                    + multiplier * sizes[frame, option]
                    + boundary_weight * edge * edge
                )
                if value < current[option]:
                    current[option] = value
                    parents[frame, option] = previous
        prior = current
    option = int(np.argmin(prior))
    objective = prior[option]
    bits = 0
    for frame in range(n - 1, -1, -1):
        choices[frame] = option
        bits += sizes[frame, option]
        if frame:
            option = parents[frame, option]
    return choices, objective, bits


def allocate(
    bank,
    reference,
    frame_size,
    target_bps,
    header_bytes,
    quiet_weight=1.0,
    quiet_threshold=8.0,
    max_frame_rmse=None,
    max_peak=None,
    boundary_weight=0.0,
):
    if (
        not np.isfinite(target_bps)
        or target_bps <= 0
        or quiet_weight <= 0
        or boundary_weight < 0
    ):
        raise ValueError("invalid allocation parameters")
    if not bank:
        return np.empty(0, np.int32), {
            "target_bps": target_bps,
            "target_attainable": False,
            "lambda": 0.0,
        }
    width = max(map(len, bank))
    costs = np.full((len(bank), width), np.inf)
    sizes = np.zeros_like(costs, np.int64)
    first, last = np.zeros_like(costs), np.zeros_like(costs)
    boundaries = np.zeros(len(bank))
    for frame, options in enumerate(bank):
        source = reference[frame * frame_size : (frame + 1) * frame_size].astype(
            np.float64
        )
        weight = quiet_weight if np.mean(source**2) <= quiet_threshold**2 else 1.0
        if frame:
            boundaries[frame] = int(reference[frame * frame_size]) - int(
                reference[frame * frame_size - 1]
            )
        for index, option in enumerate(options):
            error = option.reconstruction.astype(float) - source
            mse = float(np.mean(error**2))
            if (max_frame_rmse is None or mse <= max_frame_rmse**2) and (
                max_peak is None or np.max(np.abs(error)) <= max_peak
            ):
                costs[frame, index] = float(np.sum(error**2)) * weight
            sizes[frame, index] = len(option.payload) * 8
            first[frame, index], last[frame, index] = (
                option.reconstruction[0],
                option.reconstruction[-1],
            )
        if not np.isfinite(costs[frame]).any():
            raise ValueError(
                f"no generated candidate meets local quality constraints at frame {frame}"
            )
    budget = math_floor(target_bps * len(reference)) - header_bytes * 8
    solve = lambda value: _lagrange(
        costs, sizes, first, last, boundaries, value, boundary_weight
    )
    best, _objective, bits = solve(0.0)
    if bits <= budget:
        return best, {
            "target_bps": target_bps,
            "target_attainable": True,
            "lambda": 0.0,
        }
    low, high = 0.0, 1.0
    while high < 2**48:
        plan, _objective, bits = solve(high)
        if bits <= budget:
            break
        high *= 2
    if bits > budget:
        return plan, {
            "target_bps": target_bps,
            "target_attainable": False,
            "lambda": high,
        }
    best = plan
    for _ in range(48):
        middle = (low + high) / 2
        plan, _objective, bits = solve(middle)
        if bits <= budget:
            best, high = plan, middle
        else:
            low = middle
    return best, {
        "target_bps": target_bps,
        "target_attainable": True,
        "lambda": high,
        "allocator": "exact Viterbi for each Lagrangian multiplier; binary-searched serialized-bit budget",
        "quiet_weight": quiet_weight,
        "quiet_threshold": quiet_threshold,
        "boundary_weight": boundary_weight,
        "max_frame_rmse": max_frame_rmse,
        "max_peak": max_peak,
    }


def math_floor(value):
    # Avoid a hidden upward tolerance in byte-accurate target accounting.
    return int(np.floor(value))


def serialize_plan(fmt, bank, plan):
    output = bytearray(fmt.header())
    reconstruction = []
    for options, choice in zip(bank, plan):
        option = options[int(choice)]
        output += option.payload
        reconstruction.append(option.reconstruction)
    return bytes(output), np.concatenate(
        reconstruction
    ) if reconstruction else np.empty(0, np.int8)
