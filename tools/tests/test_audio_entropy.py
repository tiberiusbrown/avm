"""Lossless entropy coding and byte-at-a-time/ring-boundary parsing."""

import sys
from pathlib import Path

import numpy as np
import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.codecs import DecodeStats, Format, decode, encode, pack_codes
from avm_audio.entropy import (
    BOOKS,
    SCHEMES,
    encode_entropy,
    extract_frames,
    iter_entropy,
    read_symbols,
    residual_statistics,
    symbol_bits,
    write_symbols,
)
from avm_audio.extended import BitReader, BitWriter, decode_extended, read_extended


class Ring64:
    """A foreground feeder with an actual 64-byte wrapping ring and partial reads."""

    def __init__(self, data, chunk=3, initial=61):
        self.data, self.source = data, 0
        self.ring = bytearray(64)
        self.read_pos = self.write_pos = initial
        self.count = self.wraps = 0
        self.chunk = chunk

    def read(self, size):
        assert 0 < size <= 64
        while self.count < 64 and self.source < len(self.data):
            self.ring[self.write_pos] = self.data[self.source]
            self.source += 1
            self.write_pos = (self.write_pos + 1) & 63
            self.count += 1
        size = min(size, self.chunk, self.count)
        result = bytearray()
        for _ in range(size):
            assert self.count > 0
            result.append(self.ring[self.read_pos])
            self.read_pos = (self.read_pos + 1) & 63
            self.wraps += int(self.read_pos == 0)
            self.count -= 1
        return bytes(result)


def baseline(codes, frame_size=128):
    fmt = Format(3, frame_size, len(codes) + 1, (1, 3, 8))
    return fmt.header() + bytes([0, 0x20]) + pack_codes(codes, 2)


@pytest.mark.parametrize("selector", range(18))
@pytest.mark.parametrize("size", [0, 1, 2, 7, 8, 9, 127])
def test_every_symbol_mode(selector, size):
    codes = np.random.default_rng(size).integers(0, 4, size, dtype=np.uint8)
    writer = BitWriter()
    book = max(0, min(selector - 2, len(BOOKS) - 1))
    write_symbols(writer, codes, selector, book)
    assert writer.bits == symbol_bits(codes, selector, book)
    reader = BitReader(Ring64(writer.finish(), chunk=1))
    assert list(read_symbols(reader, size, selector, book)) == list(codes)
    reader.align()


@pytest.mark.parametrize("scheme", SCHEMES)
@pytest.mark.parametrize("size", [0, 1, 2, 128, 129, 259])
def test_lossless_entropy(scheme, size):
    samples = (
        np.random.default_rng(size)
        .integers(-128, 128, size, dtype=np.int16)
        .astype(np.int8)
    )
    source, _ = encode(samples, 3, frame_size=128, beam_width=2)
    data, _ = encode_entropy(source, 256, scheme)
    expected = decode(source)[0]
    np.testing.assert_array_equal(decode_extended(data)[0], expected)
    ring = Ring64(data, 1)
    fmt = read_extended(ring)
    symbols = []
    actual = np.fromiter(iter_entropy(ring, fmt, DecodeStats(), symbols), np.int8)
    np.testing.assert_array_equal(actual, expected)
    _, frames = extract_frames(source)
    assert symbols == [int(code) for frame in frames for code in frame.codes]
    if len(data) > 64:
        assert ring.wraps


def test_alternation_statistics_and_compression():
    codes = np.resize(np.array([1, 2], np.uint8), 127)
    source = baseline(codes)
    stats = residual_statistics(source)
    assert stats["conditional_entropy_previous"] == 0
    assert stats["alternating_sign_transitions"] == 126
    compressed, modes = encode_entropy(source, 128, "alternate")
    assert modes["selector_counts"] == {17: 1}
    assert len(compressed) < len(source)
    np.testing.assert_array_equal(decode_extended(compressed)[0], decode(source)[0])


def test_entropy_corruption_and_training_metadata():
    source = baseline(np.resize(np.array([1, 2], np.uint8), 127))
    data, info = encode_entropy(source, 128, "alternate", training=source)
    assert info["extra_global_metadata_bytes"] == 6
    for end in range(len(data)):
        with pytest.raises(ValueError):
            decode_extended(data[:end])
    for altered in (data + b"\0", data[:-1] + bytes([data[-1] | 128])):
        with pytest.raises(ValueError):
            decode_extended(altered)
    bad = bytearray(data)
    bad[18 + 3 + 6] = 255  # unsupported group selector
    with pytest.raises(ValueError):
        decode_extended(bad)
