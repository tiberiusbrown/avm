"""Integer lifting transforms; encoder inverses are separate from streaming decoders."""

from __future__ import annotations

import hashlib
import json
import time
from pathlib import Path

import numpy as np

from .codecs import STEPS, _beam, _greedy, njit, read_exact, transition
from .extended import BitReader, BitWriter, ExtendedFormat, decode_extended, signed_byte
from .mixed import FrameOption


def pair_lift(even, odd):
    high = int(odd) - int(even)
    return int(even) + (high >> 1), high


def pair_inverse(low, high):
    even = int(low) - (int(high) >> 1)
    return even, int(high) + even


def _shuffle_cycles(size):
    seen, cycles = set(), []
    for first in range(size):
        if first in seen:
            continue
        cycle, current = [], first
        while current not in seen:
            seen.add(current)
            cycle.append(current)
            current = (
                (current << 1)
                if current < size // 2
                else ((current - size // 2) << 1) + 1
            )
        if len(cycle) > 1:
            cycles.append(tuple(cycle))
    return tuple(cycles)


SHUFFLES = {size: _shuffle_cycles(size) for size in (2, 4, 8, 16)}
PATTERNS = {
    8: (
        (0,) * 7,
        (4, 0, 0, 0, 0, 0, 0),
        (3, 2, 2, 0, 0, 0, 0),
        (4, 2, 2, 0, 0, 0, 0),
        (4, 3, 3, 0, 0, 0, 0),
        (4, 2, 2, 1, 1, 1, 1),
        (4, 3, 3, 1, 1, 1, 1),
        (5, 4, 4, 1, 1, 1, 1),
        (4, 3, 3, 2, 2, 2, 2),
    ),
    16: (
        (0,) * 15,
        (4, 2, 2) + (0,) * 12,
        (4, 3, 3) + (1,) * 4 + (0,) * 8,
        (4, 4, 4) + (1,) * 4 + (0,) * 8,
        (4, 3, 3) + (2,) * 4 + (0,) * 8,
        (4, 3, 3) + (1,) * 12,
        (4, 4, 4) + (2,) * 4 + (1,) * 8,
        (5, 4, 4) + (2,) * 4 + (1,) * 8,
        (4, 3, 3) + (2,) * 12,
    ),
}


@njit(cache=True)
def haar_forward(samples):
    output = samples.astype(np.int64).copy()
    size = len(output)
    scratch = np.empty_like(output)
    while size > 1:
        half = size // 2
        for index in range(half):
            even, odd = output[index * 2], output[index * 2 + 1]
            high = odd - even
            scratch[index], scratch[half + index] = even + (high >> 1), high
        output[:size] = scratch[:size]
        size = half
    return output


def haar_inverse(coefficients):
    """In-place inverse: one signed-16 buffer and register-sized temporaries."""
    output = [int(value) for value in coefficients]
    size = 2
    while size <= len(output):
        half = size >> 1
        for index in range(half):
            low, high = output[index], output[half + index]
            even = low - (high >> 1)
            output[index], output[half + index] = even, high + even
        for cycle in SHUFFLES[size]:
            held = output[cycle[-1]]
            for position in range(len(cycle) - 1, 0, -1):
                output[cycle[position]] = output[cycle[position - 1]]
            output[cycle[0]] = held
        size <<= 1
    return output


@njit(cache=True)
def _inverse_host(coefficients):
    output = coefficients.copy()
    scratch = np.empty_like(output)
    size = 2
    while size <= len(output):
        half = size // 2
        for i in range(half):
            even = output[i] - (output[half + i] >> 1)
            scratch[2 * i], scratch[2 * i + 1] = even, even + output[half + i]
        output[:size] = scratch[:size]
        size *= 2
    return output


def best_predictive(target, width, beam_width):
    table = np.array(STEPS, np.int64)
    best, selected = np.inf, None
    for mode in range(3):
        for index in range(len(STEPS)):
            codec = 6 if width == 1 else 3
            result = _beam(
                target, codec, table, mode, index, beam_width, False, 0.0, 1000
            )
            if beam_width > 1:
                greedy = _greedy(target, codec, table, mode, index, False, 0.0, 1000)
                if greedy[0] < result[0]:
                    result = greedy
            if result[0] < best:
                best, selected = result[0], (mode, index, result[1], result[2])
    return selected


@njit(cache=True)
def _high_quantizer(target, low_reconstruction, high_mode):
    pairs = len(low_reconstruction)
    best, chosen_step = np.inf, 0
    chosen_codes = np.zeros(pairs, np.uint8)
    chosen_pcm = np.empty(len(target), np.int8)
    max_step = 0 if high_mode == 0 else (255 if high_mode == 1 else 85)
    for step in range(0 if high_mode == 0 else 1, max_step + 1):
        cost = 0.0
        codes = np.empty(pairs, np.uint8)
        pcm = np.empty(len(target), np.int8)
        for pair in range(pairs):
            local, selected, a, b = np.inf, 0, 0, 0
            for code in range(1 if high_mode == 0 else (2 if high_mode == 1 else 4)):
                high = (
                    0
                    if high_mode == 0
                    else (2 * code - (1 if high_mode == 1 else 3)) * step
                )
                raw_even = int(low_reconstruction[pair]) - (high >> 1)
                even, odd = (
                    max(-128, min(127, raw_even)),
                    max(-128, min(127, raw_even + high)),
                )
                error = (int(target[pair * 2]) - even) ** 2
                if pair * 2 + 1 < len(target):
                    error += (int(target[pair * 2 + 1]) - odd) ** 2
                if error < local:
                    local, selected, a, b = error, code, even, odd
            cost += local
            codes[pair], pcm[pair * 2] = selected, a
            if pair * 2 + 1 < len(target):
                pcm[pair * 2 + 1] = b
        if cost < best:
            best, chosen_step = cost, step
            chosen_codes[:], chosen_pcm[:] = codes, pcm
    return chosen_step, chosen_codes, chosen_pcm


def iter_subband(source, fmt, stats):
    for start in range(0, fmt.sample_count, fmt.frame_size):
        count = min(fmt.frame_size, fmt.sample_count - start)
        seed, parameter, high_mode, high_step = read_exact(source, 4)
        width, mode, index = parameter >> 6, (parameter >> 4) & 3, parameter & 15
        if (
            width not in (1, 2)
            or mode > 2
            or index >= len(fmt.steps)
            or high_mode > 2
            or (high_mode == 0 and high_step != 0)
            or (high_mode and high_step == 0)
            or (high_mode == 2 and high_step > 85)
        ):
            raise ValueError("unsupported subband parameter")
        seed = signed_byte(seed)
        state = (seed, seed, index, 1, 0)
        reader = BitReader(source)
        for pair in range((count + 1) // 2):
            if pair:
                symbol = reader.read(width)
                state, _ = transition(
                    3, state, symbol + 1 if width == 1 else symbol, fmt.steps, mode, 0
                )
            high = 0
            if high_mode:
                code = reader.read(high_mode)
                magnitude = (
                    high_step + (high_step << 1)
                    if high_mode == 2 and code in (0, 3)
                    else high_step
                )
                high = magnitude if code >= (1 if high_mode == 1 else 2) else -magnitude
            even, odd = pair_inverse(state[0], high)
            for value in (even, odd)[: min(2, count - pair * 2)]:
                clipped = min(127, max(-128, value))
                stats.saturated_samples += int(clipped != value)
                stats.endpoint_samples += int(clipped in (-128, 127))
                yield clipped
        reader.align()


@njit(cache=True)
def _quantize_details(coefficients, pattern, exponent, dc, target, passes):
    n = len(coefficients)
    quantized = np.zeros(n, np.int64)
    codes = np.zeros(n - 1, np.int64)
    quantized[0] = dc
    for i in range(1, n):
        bits = pattern[i - 1]
        if bits == 0:
            continue
        if bits == 1:
            code = 1 if coefficients[i] >= 0 else 0
            value = 1 if code else -1
        else:
            value = int(np.rint(coefficients[i] / (1 << exponent)))
            value = max(-(1 << (bits - 1)), min((1 << (bits - 1)) - 1, value))
            code = value & ((1 << bits) - 1)
        codes[i - 1], quantized[i] = code, value << exponent
    for _ in range(passes):
        for i in range(1, n):
            bits = pattern[i - 1]
            if not bits:
                continue
            current = quantized[i]
            best_value, best_error = current, np.inf
            for candidate in range(-1, 2):
                value = (current >> exponent) + candidate
                if bits == 1:
                    value = -1 if candidate < 0 else 1
                if (
                    not -(1 << (bits - 1)) <= value <= (1 << (bits - 1)) - 1
                    and bits > 1
                ):
                    continue
                quantized[i] = value << exponent
                reconstructed = _inverse_host(quantized)
                error = 0
                for j in range(len(target)):
                    sample = max(-128, min(127, reconstructed[j]))
                    error += (int(target[j]) - sample) ** 2
                if error < best_error:
                    best_error, best_value = error, value << exponent
            quantized[i] = best_value
            value = best_value >> exponent
            codes[i - 1] = int(value > 0) if bits == 1 else value & ((1 << bits) - 1)
    reconstructed = _inverse_host(quantized)
    pcm = np.empty(len(target), np.int8)
    cost = 0
    for j in range(len(target)):
        value = max(-128, min(127, reconstructed[j]))
        pcm[j] = value
        cost += (int(target[j]) - value) ** 2
    return cost, codes, pcm


@njit(cache=True)
def _haar_frame_search(
    target, coefficients, pattern, dc_reconstructed, block_size, passes
):
    best, chosen = np.inf, 0
    payloads = np.empty((len(coefficients), block_size - 1), np.int64)
    output = np.empty(len(target), np.int8)
    for exponent in range(9):
        cost = 0
        trial_codes = np.empty_like(payloads)
        trial_pcm = np.empty_like(output)
        for block, values in enumerate(coefficients):
            source = target[block * block_size : (block + 1) * block_size]
            local, codes, pcm = _quantize_details(
                values, pattern, exponent, int(dc_reconstructed[block]), source, passes
            )
            cost += local
            trial_codes[block] = codes
            trial_pcm[block * block_size : block * block_size + len(pcm)] = pcm
        if cost < best:
            best, chosen = cost, exponent
            payloads[:], output[:] = trial_codes, trial_pcm
    return chosen, payloads, output


def haar_payload(target, block_size, width, pattern_id, prepared, passes=0):
    coefficients, dc, prediction = prepared
    mode, index, dc_codes, dc_reconstructed = prediction
    pattern = np.array(PATTERNS[block_size][pattern_id], np.int64)
    exponent, payloads, output = _haar_frame_search(
        target, np.array(coefficients), pattern, dc_reconstructed, block_size, passes
    )
    writer = BitWriter()
    for block, codes in enumerate(payloads):
        if block:
            writer.write(int(dc_codes[block - 1]), width)
        for code, bits in zip(codes, pattern):
            if bits:
                writer.write(int(code), int(bits))
    payload = (
        bytes(
            [
                int(dc[0]) & 255,
                (width << 6) | (mode << 4) | index,
                (pattern_id << 4) | exponent,
            ]
        )
        + writer.finish()
    )
    return FrameOption(payload, output, f"dc{width}_pattern{pattern_id}")


def iter_haar(source, fmt, stats):
    block_size = read_exact(source, 1)[0]
    if block_size not in PATTERNS or fmt.frame_size % block_size:
        raise ValueError("unsupported Haar block size")
    for start in range(0, fmt.sample_count, fmt.frame_size):
        count = min(fmt.frame_size, fmt.sample_count - start)
        seed, parameter, configuration = read_exact(source, 3)
        width, mode, index = parameter >> 6, (parameter >> 4) & 3, parameter & 15
        exponent, pattern_id = configuration & 15, configuration >> 4
        if (
            width not in (1, 2)
            or mode > 2
            or index >= len(STEPS)
            or exponent > 8
            or pattern_id >= len(PATTERNS[block_size])
        ):
            raise ValueError("unsupported Haar parameter")
        seed = signed_byte(seed)
        state = (seed, seed, index, 1, 0)
        reader = BitReader(source)
        pattern = PATTERNS[block_size][pattern_id]
        for block_start in range(0, count, block_size):
            if block_start:
                symbol = reader.read(width)
                state, _ = transition(
                    3, state, symbol + 1 if width == 1 else symbol, STEPS, mode, 0
                )
            coefficients = [state[0]]
            for bits in pattern:
                value = reader.read(bits) if bits else 0
                if bits == 1:
                    value = 1 if value else -1
                elif bits and value & (1 << (bits - 1)):
                    value -= 1 << bits
                coefficients.append(value << exponent)
            for value in haar_inverse(coefficients)[
                : min(block_size, count - block_start)
            ]:
                clipped = min(127, max(-128, value))
                stats.saturated_samples += int(value != clipped)
                stats.endpoint_samples += int(clipped in (-128, 127))
                yield clipped
        reader.align()


def _save_bank(cache, bank, frame_size):
    width = max(map(len, bank), default=0)
    pcm = np.zeros((len(bank), width, frame_size), np.int8)
    lengths = np.zeros((len(bank), width), np.int32)
    labels = np.full((len(bank), width), "", dtype="U32")
    counts = np.array([len(options) for options in bank], np.int16)
    payloads = bytearray()
    for frame, options in enumerate(bank):
        for index, option in enumerate(options):
            pcm[frame, index, : len(option.reconstruction)] = option.reconstruction
            lengths[frame, index], labels[frame, index] = (
                len(option.payload),
                option.label,
            )
            payloads += option.payload
    np.savez_compressed(
        cache / "bank.npz",
        pcm=pcm,
        lengths=lengths,
        labels=labels,
        counts=counts,
        payloads=np.frombuffer(payloads, np.uint8),
    )


def _load_bank(cache, reference, frame_size):
    result, offset = [], 0
    with np.load(cache / "bank.npz", allow_pickle=False) as source:
        payloads = source["payloads"].tobytes()
        counts, lengths = source["counts"], source["lengths"]
        pcm, labels = source["pcm"], source["labels"]
        for frame, count in enumerate(counts):
            size = min(frame_size, len(reference) - frame * frame_size)
            options = []
            for index in range(int(count)):
                length = int(lengths[frame, index])
                options.append(
                    FrameOption(
                        payloads[offset : offset + length],
                        pcm[frame, index, :size].copy(),
                        str(labels[frame, index]),
                    )
                )
                offset += length
            result.append(options)
    if offset != len(payloads):
        raise ValueError("transform cache length mismatch")
    return result


def build_transform_bank(
    reference,
    family,
    frame_size=256,
    block_size=8,
    beam_width=16,
    passes=0,
    cache=None,
    progress=None,
):
    if reference.dtype != np.int8 or reference.ndim != 1 or not 1 <= beam_width <= 4096:
        raise ValueError("transform bank needs PCM8 and a positive beam width")
    if family not in ("subband", "haar") or (
        family == "haar" and (block_size not in PATTERNS or frame_size % block_size)
    ):
        raise ValueError("unsupported transform configuration")
    fmt = ExtendedFormat(
        7 if family == "subband" else 8,
        frame_size,
        len(reference),
        STEPS if family == "subband" else (),
    )
    prefix = fmt.header() + (bytes([block_size]) if family == "haar" else b"")
    config = {
        "reference_sha256": hashlib.sha256(reference.tobytes()).hexdigest(),
        "family": family,
        "frame_size": frame_size,
        "block_size": block_size,
        "beam_width": beam_width,
        "passes": passes,
        "version": 1,
    }
    cache = Path(cache) if cache else None
    if (
        cache
        and (cache / "config.json").exists()
        and json.loads((cache / "config.json").read_text()) == config
    ):
        return (
            fmt,
            _load_bank(cache, reference, frame_size),
            {
                "cache_reused": True,
                "candidate_encode_seconds": 0.0,
                "prefix_bytes": len(prefix),
            },
        )
    before, bank = time.perf_counter(), []
    for start in range(0, len(reference), frame_size):
        target = reference[start : start + frame_size]
        options = []
        if family == "subband":
            paired = np.pad(target, (0, len(target) % 2), mode="edge").astype(np.int16)
            low = ((paired[::2] + paired[1::2]) // 2).astype(np.int8)
            for width in (1, 2):
                mode, index, codes, decoded_low = best_predictive(
                    low, width, beam_width
                )
                for high_mode in range(3):
                    step, high_codes, pcm = _high_quantizer(
                        target, decoded_low, high_mode
                    )
                    writer = BitWriter()
                    for pair in range(len(low)):
                        if pair:
                            writer.write(int(codes[pair - 1]), width)
                        if high_mode:
                            writer.write(int(high_codes[pair]), high_mode)
                    payload = (
                        bytes(
                            [
                                int(low[0]) & 255,
                                (width << 6) | (mode << 4) | index,
                                high_mode,
                                step,
                            ]
                        )
                        + writer.finish()
                    )
                    options.append(
                        FrameOption(payload, pcm, f"low{width}_high{high_mode}")
                    )
        else:
            coefficients = []
            for block_start in range(0, len(target), block_size):
                source = target[block_start : block_start + block_size]
                coefficients.append(
                    haar_forward(
                        np.pad(source, (0, block_size - len(source)), mode="edge")
                    )
                )
            dc = np.array([values[0] for values in coefficients], np.int8)
            for width in (1, 2):
                prediction = best_predictive(dc, width, beam_width)
                for pattern_id in range(len(PATTERNS[block_size])):
                    options.append(
                        haar_payload(
                            target,
                            block_size,
                            width,
                            pattern_id,
                            (coefficients, dc, prediction),
                            passes,
                        )
                    )
        for option in options:
            local_fmt = ExtendedFormat(fmt.codec, frame_size, len(target), fmt.steps)
            local_data = (
                local_fmt.header()
                + (bytes([block_size]) if family == "haar" else b"")
                + option.payload
            )
            np.testing.assert_array_equal(
                decode_extended(local_data)[0], option.reconstruction
            )
        bank.append(options)
        if progress and (start // frame_size) % 128 == 0:
            progress(min(start + frame_size, len(reference)), len(reference))
    if cache:
        cache.mkdir(parents=True, exist_ok=True)
        _save_bank(cache, bank, frame_size)
        (cache / "config.json").write_text(
            json.dumps(config, indent=2), encoding="utf-8"
        )
    return (
        fmt,
        bank,
        {
            "cache_reused": False,
            "candidate_encode_seconds": time.perf_counter() - before,
            "prefix_bytes": len(prefix),
        },
    )


def serialize_transform(fmt, bank, plan, block_size=8):
    output = bytearray(fmt.header() + (bytes([block_size]) if fmt.codec == 8 else b""))
    pcm = []
    for options, choice in zip(bank, plan):
        output += options[int(choice)].payload
        pcm.append(options[int(choice)].reconstruction)
    return bytes(output), np.concatenate(pcm) if pcm else np.empty(0, np.int8)
