"""Lossless symbol analysis and lightweight wrappers around AVAC candidate 3."""

from __future__ import annotations

import io
import itertools
import struct
from collections import Counter
from dataclasses import dataclass

import numpy as np

from .codecs import read_exact, read_format, transition
from .extended import BitReader, BitWriter, ExtendedFormat, signed_byte

BOOKS = ((2, 2, 2, 2),) + tuple(sorted(set(itertools.permutations((1, 2, 3, 3)))))
SCHEMES = (
    "global",
    "predictor",
    "selected",
    "bitplanes",
    "repeat",
    "alternate",
    "auto",
)


def canonical(lengths):
    result, word, previous = {}, 0, 0
    for length, symbol in sorted(
        (length, symbol) for symbol, length in enumerate(lengths)
    ):
        word <<= length - previous
        # Canonical words are consumed MSB first, inside LSB-first stored bytes.
        reverse = int(f"{word:0{length}b}"[::-1], 2)
        result[symbol] = (reverse, length)
        word += 1
        previous = length
    return result


WORDS = tuple(canonical(book) for book in BOOKS)
DECODE_WORDS = tuple(
    {(word, length): symbol for symbol, (word, length) in words.items()}
    for words in WORDS
)


def best_book(counts):
    return min(
        range(len(BOOKS)),
        key=lambda book: sum(int(c) * length for c, length in zip(counts, BOOKS[book])),
    )


def train_books(data):
    _, frames = extract_frames(data)
    counts = np.zeros((3, 4), np.int64)
    for frame in frames:
        counts[frame.parameter >> 4] += np.bincount(frame.codes, minlength=4)
    return (best_book(counts.sum(axis=0)), *(best_book(row) for row in counts))


def write_symbols(writer, codes, selector, book):
    if selector == 0:
        for symbol in codes:
            writer.write(int(symbol), 2)
    elif selector <= 14:
        for symbol in codes:
            writer.write(*WORDS[book][int(symbol)])
    elif selector == 15:
        for start in range(0, len(codes), 8):
            group = codes[start : start + 8]
            signs = sum((int(code) >> 1) << i for i, code in enumerate(group))
            magnitudes = sum(int(code in (0, 3)) << i for i, code in enumerate(group))
            writer.write(signs, len(group))
            writer.write(int(magnitudes != 0), 1)
            if magnitudes:
                writer.write(magnitudes, len(group))
    else:
        previous = 1
        for code in codes:
            predicted = previous if selector == 16 else 3 - previous
            writer.write(int(code != predicted), 1)
            if code != predicted:
                writer.write(int(code), 2)
            previous = int(code)


def read_symbols(reader, count, selector, book):
    if selector == 0:
        for _ in range(count):
            yield reader.read(2)
    elif selector <= 14:
        lookup = DECODE_WORDS[book]
        for _ in range(count):
            word = 0
            for length in range(1, 4):
                word |= reader.read(1) << (length - 1)
                if (word, length) in lookup:
                    yield lookup[word, length]
                    break
            else:
                raise ValueError("invalid Huffman word")
    elif selector == 15:
        for start in range(0, count, 8):
            size = min(8, count - start)
            signs = reader.read(size)
            magnitudes = reader.read(size) if reader.read(1) else 0
            for i in range(size):
                positive, large = (signs >> i) & 1, (magnitudes >> i) & 1
                yield (3 if large else 2) if positive else (0 if large else 1)
    else:
        previous = 1
        for _ in range(count):
            predicted = previous if selector == 16 else 3 - previous
            previous = reader.read(2) if reader.read(1) else predicted
            yield previous


def selected_book(selector, books, parameter):
    return (
        0
        if selector == 0
        else (
            books[0]
            if selector == 1
            else (books[1 + (parameter >> 4)] if selector == 2 else selector - 2)
        )
    )


def symbol_bits(codes, selector, book):
    if selector == 0:
        return len(codes) * 2
    if selector <= 14:
        return int(np.dot(np.bincount(codes, minlength=4), BOOKS[book]))
    if selector == 15:
        cost = len(codes) + (len(codes) + 7) // 8
        for start in range(0, len(codes), 8):
            group = codes[start : start + 8]
            if np.any((group == 0) | (group == 3)):
                cost += len(group)
        return cost
    previous = np.r_[1, codes[:-1]].astype(np.int16)
    predicted = previous if selector == 16 else 3 - previous
    return len(codes) + 2 * int(np.sum(codes != predicted))


def encode_entropy(data, group_size=512, scheme="auto", training=None):
    fmt, frames = extract_frames(data)
    if (
        scheme not in SCHEMES
        or group_size % fmt.frame_size
        or group_size < fmt.frame_size
    ):
        raise ValueError(
            "entropy group must contain whole baseline frames; invalid scheme"
        )
    books = train_books(data if training is None else training)
    output_fmt = ExtendedFormat(5, group_size, fmt.sample_count, fmt.steps)
    output = bytearray(
        output_fmt.header() + struct.pack("<H4B", fmt.frame_size, *books)
    )
    choices = {
        "global": [1],
        "predictor": [2],
        "selected": list(range(3, 15)),
        "bitplanes": [15],
        "repeat": [16],
        "alternate": [17],
        "auto": list(range(1, 18)),
    }
    modes = Counter()
    groups = group_size // fmt.frame_size
    for start in range(0, len(frames), groups):
        group = frames[start : start + groups]
        best = None
        for selector in [0, *choices[scheme]]:
            bits = 16 * len(group)
            for frame in group:
                book = (
                    selected_book(selector, books, frame.parameter)
                    if selector <= 14
                    else 0
                )
                bits += symbol_bits(frame.codes, selector, book)
            size = (bits + 7) // 8
            if best is None or size < best[1]:
                best = selector, size
        selector, _size = best
        writer = BitWriter()
        for frame in group:
            writer.write(frame.seed, 8)
            writer.write(frame.parameter, 8)
            book = (
                selected_book(selector, books, frame.parameter) if selector <= 14 else 0
            )
            write_symbols(writer, frame.codes, selector, book)
        payload = writer.finish()
        assert len(payload) == _size
        modes[selector] += 1
        output.append(selector)
        output += payload
    return bytes(output), {
        "selector_counts": dict(modes),
        "stored_codebook_ids": books,
        "training": "evaluated recording; book IDs stored"
        if training is None
        else "external representative stream; book IDs stored",
        "baseline_frame_size": fmt.frame_size,
        "entropy_frame_size": group_size,
        "extra_global_metadata_bytes": 6,
        "entropy_selector_bytes": sum(modes.values()),
    }


def iter_entropy(source, fmt, stats, symbol_sink=None):
    frame_size, *books = struct.unpack("<H4B", read_exact(source, 6))
    if (
        not 2 <= frame_size <= fmt.frame_size
        or fmt.frame_size % frame_size
        or any(book >= len(BOOKS) for book in books)
    ):
        raise ValueError("invalid entropy metadata")
    for start in range(0, fmt.sample_count, fmt.frame_size):
        selector = read_exact(source, 1)[0]
        if selector > 17:
            raise ValueError("unsupported entropy selector")
        reader = BitReader(source)
        size = min(fmt.frame_size, fmt.sample_count - start)
        for offset in range(0, size, frame_size):
            seed, parameter = reader.read(8), reader.read(8)
            index, mode = parameter & 15, parameter >> 4
            if index >= len(fmt.steps) or mode > 2:
                raise ValueError("invalid entropy predictor")
            seed = signed_byte(seed)
            state = (seed, seed, index, 1, 0)
            stats.modes[mode] = stats.modes.get(mode, 0) + 1
            stats.endpoint_samples += int(seed in (-128, 127))
            yield seed
            count = min(frame_size, size - offset) - 1
            book = selected_book(selector, books, parameter) if selector <= 14 else 0
            for position, code in enumerate(
                read_symbols(reader, count, selector, book)
            ):
                if symbol_sink is not None:
                    symbol_sink.append(code)
                state, saturated = transition(
                    3, state, code, fmt.steps, mode, position & 3
                )
                stats.saturated_samples += int(saturated)
                stats.endpoint_samples += int(state[0] in (-128, 127))
                yield state[0]
        reader.align()


@dataclass
class ResidualFrame:
    seed: int
    parameter: int
    codes: np.ndarray


def extract_frames(data):
    source = io.BytesIO(data)
    fmt = read_format(source)
    if fmt.codec != 3:
        raise ValueError("entropy experiments require candidate 3 AVAC input")
    frames = []
    for start in range(0, fmt.sample_count, fmt.frame_size):
        size = min(fmt.frame_size, fmt.sample_count - start)
        seed, parameter = read_exact(source, 2)
        if parameter >> 4 > 2 or (parameter & 15) >= len(fmt.steps):
            raise ValueError("invalid baseline frame parameter")
        packed = np.frombuffer(read_exact(source, (size - 1 + 3) // 4), np.uint8)
        codes = ((packed[:, None] >> np.array([0, 2, 4, 6], np.uint8)) & 3).ravel()[
            : size - 1
        ]
        if size > 1 and (size - 1) % 4 and packed[-1] >> (2 * ((size - 1) % 4)):
            raise ValueError("nonzero baseline padding")
        frames.append(ResidualFrame(seed, parameter, codes))
    if source.read(1):
        raise ValueError("trailing baseline bytes")
    return fmt, frames


def entropy(counts):
    counts = np.asarray(counts, dtype=np.float64)
    if not counts.sum():
        return 0.0
    probabilities = counts[counts > 0] / counts.sum()
    return float(-np.sum(probabilities * np.log2(probabilities)))


def conditional_entropy(counts):
    counts = np.asarray(counts).reshape(-1, 4)
    total = counts.sum()
    return sum(row.sum() / total * entropy(row) for row in counts) if total else 0.0


def residual_statistics(data):
    fmt, frames = extract_frames(data)
    counts = np.zeros(4, np.int64)
    pairs = np.zeros((4, 4), np.int64)
    triples = np.zeros((4, 4, 4), np.int64)
    modes = np.zeros((3, 4), np.int64)
    runs, magnitude_runs = Counter(), Counter()
    alternating = repeated = transitions = 0
    per_frame = []
    for number, frame in enumerate(frames):
        codes = frame.codes.astype(np.int64)
        histogram = np.bincount(codes, minlength=4)
        counts += histogram
        mode = frame.parameter >> 4
        if mode > 2:
            raise ValueError("invalid baseline predictor")
        modes[mode] += histogram
        if len(codes) > 1:
            pairs += np.bincount(codes[:-1] * 4 + codes[1:], minlength=16).reshape(4, 4)
            alternating += int(np.sum((codes[:-1] >> 1) != (codes[1:] >> 1)))
            repeated += int(np.sum(codes[:-1] == codes[1:]))
            transitions += len(codes) - 1
        if len(codes) > 2:
            triples += np.bincount(
                codes[:-2] * 16 + codes[1:-1] * 4 + codes[2:], minlength=64
            ).reshape(4, 4, 4)
        for values, target in ((codes, runs), (np.isin(codes, [0, 3]), magnitude_runs)):
            ends = np.r_[0, np.flatnonzero(values[1:] != values[:-1]) + 1, len(values)]
            target.update(int(length) for length in np.diff(ends) if length)
        per_frame.append(
            {
                "frame": number,
                "predictor": mode,
                "counts": histogram.tolist(),
                "entropy": entropy(histogram),
            }
        )
    n = int(counts.sum())
    probabilities = lambda matrix: np.divide(
        matrix,
        matrix.sum(axis=-1, keepdims=True),
        out=np.zeros_like(matrix, dtype=float),
        where=matrix.sum(axis=-1, keepdims=True) != 0,
    ).tolist()
    return {
        "output_samples": fmt.sample_count,
        "residual_symbols": n,
        "frame_size": fmt.frame_size,
        "symbol_counts": counts.tolist(),
        "symbol_probabilities": (counts / n).tolist() if n else [0.0] * 4,
        "negative_residuals": int(counts[0] + counts[1]),
        "positive_residuals": int(counts[2] + counts[3]),
        "small_residuals": int(counts[1] + counts[2]),
        "large_residuals": int(counts[0] + counts[3]),
        "by_predictor_counts": modes.tolist(),
        "by_predictor_probabilities": probabilities(modes),
        "previous_symbol_counts": pairs.tolist(),
        "previous_symbol_probabilities": probabilities(pairs),
        "previous_two_counts": triples.tolist(),
        "previous_two_probabilities": probabilities(triples),
        "entropy_bits_per_residual": entropy(counts),
        "conditional_entropy_previous": conditional_entropy(pairs),
        "conditional_entropy_previous_two": conditional_entropy(triples),
        "conditional_entropy_predictor": conditional_entropy(modes),
        "memoryless_lower_bound_bps_including_baseline_headers": (
            entropy(counts) * n + len(frames) * 16 + 8 * (18 + len(fmt.steps))
        )
        / fmt.sample_count
        if fmt.sample_count
        else None,
        "repeated_symbol_transitions": repeated,
        "alternating_sign_transitions": alternating,
        "total_within_frame_transitions": transitions,
        "symbol_run_lengths": dict(sorted(runs.items())),
        "magnitude_run_lengths": dict(sorted(magnitude_runs.items())),
        "per_frame": per_frame,
        "context_rule": "counts reset at original independent-frame boundaries; seeds excluded",
    }
