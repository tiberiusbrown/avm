"""AVAX v1 extension container and bounded incremental bit I/O."""

from __future__ import annotations

import io
from dataclasses import dataclass

import numpy as np

from .codecs import HEADER, RATE, STEPS, DecodeStats, read_exact


@dataclass(frozen=True)
class ExtendedFormat:
    codec: int
    frame_size: int
    sample_count: int
    steps: tuple[int, ...] = STEPS

    def header(self):
        self.validate()
        return HEADER.pack(
            b"AVAX",
            1,
            self.codec,
            0,
            len(self.steps),
            self.frame_size,
            self.sample_count,
            RATE,
        ) + bytes(self.steps)

    def validate(self):
        if (
            self.codec not in (5, 6, 7, 8)
            or not 2 <= self.frame_size <= 65534
            or not 0 <= self.sample_count <= 0xFFFFFFFF
        ):
            raise ValueError("invalid AVAX format")
        if self.codec == 8:
            if self.frame_size % 8 or self.steps:
                raise ValueError(
                    "Haar frames must be multiples of 8 with no step table"
                )
        elif not 1 <= len(self.steps) <= 16 or any(
            not 1 <= s <= 255 for s in self.steps
        ):
            raise ValueError("invalid AVAX step table")
        if self.codec == 7 and self.frame_size % 2:
            raise ValueError("two-band frames must have even length")


def read_extended(stream):
    magic, version, codec, flags, count, frame, samples, rate = HEADER.unpack(
        read_exact(stream, HEADER.size)
    )
    if magic != b"AVAX" or version != 1 or flags or rate != RATE or count > 16:
        raise ValueError("unsupported AVAX header")
    fmt = ExtendedFormat(codec, frame, samples, tuple(read_exact(stream, count)))
    fmt.validate()
    return fmt


class BitWriter:
    def __init__(self):
        self.data = bytearray()
        self.value = 0
        self.used = 0
        self.bits = 0

    def write(self, value, width):
        if width < 0 or not 0 <= int(value) < 1 << width:
            raise ValueError("bit field outside range")
        self.value |= int(value) << self.used
        self.used += width
        self.bits += width
        while self.used >= 8:
            self.data.append(self.value & 255)
            self.value >>= 8
            self.used -= 8

    def finish(self):
        return bytes(self.data) + (bytes([self.value]) if self.used else b"")


class BitReader:
    def __init__(self, stream):
        self.stream = stream
        self.value = 0
        self.remaining = 0
        self.bits = 0

    def read(self, width):
        result, used = 0, 0
        while width:
            if self.remaining == 0:
                self.value, self.remaining = read_exact(self.stream, 1)[0], 8
            count = min(width, self.remaining)
            result |= (self.value & ((1 << count) - 1)) << used
            self.value >>= count
            self.remaining -= count
            width -= count
            used += count
            self.bits += count
        return result

    def align(self):
        if self.value:
            raise ValueError("nonzero AVAX padding")
        self.remaining = 0


def signed_byte(value):
    return value - 256 if value >= 128 else value


def iter_extended(stream, fmt, stats=None):
    stats = stats if stats is not None else DecodeStats()
    if fmt.codec == 5:
        from .entropy import iter_entropy

        yield from iter_entropy(stream, fmt, stats)
    elif fmt.codec == 6:
        from .mixed import iter_mixed

        yield from iter_mixed(stream, fmt, stats)
    elif fmt.codec in (7, 8):
        from .transforms import iter_haar, iter_subband

        yield from (
            iter_subband(stream, fmt, stats)
            if fmt.codec == 7
            else iter_haar(stream, fmt, stats)
        )
    if stream.read(1):
        raise ValueError("trailing AVAX data")


def decode_extended(data):
    stream = io.BytesIO(data)
    fmt = read_extended(stream)
    stats = DecodeStats()
    samples = np.fromiter(iter_extended(stream, fmt, stats), np.int8)
    if len(samples) != fmt.sample_count:
        raise ValueError("AVAX sample count mismatch")
    return samples, fmt, stats
