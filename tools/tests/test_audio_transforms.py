import sys
from pathlib import Path

import numpy as np
import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.extended import decode_extended, iter_extended, read_extended
from avm_audio.mixed import allocate
from avm_audio.transforms import (
    PATTERNS,
    _quantize_details,
    build_transform_bank,
    haar_forward,
    haar_inverse,
    pair_inverse,
    pair_lift,
    serialize_transform,
)
from test_audio_codecs import fixtures
from test_audio_entropy import Ring64


def test_reversible_pair_transform_exhaustive():
    for even in range(-128, 128):
        for odd in range(-128, 128):
            low, high = pair_lift(even, odd)
            assert pair_inverse(low, high) == (even, odd)


@pytest.mark.parametrize("size", [8, 16])
def test_reversible_haar(size):
    rng = np.random.default_rng(size)
    for _ in range(300):
        original = rng.integers(-128, 128, size, dtype=np.int16).astype(np.int8)
        coefficients = haar_forward(original)
        assert np.max(np.abs(coefficients)) <= 255
        np.testing.assert_array_equal(haar_inverse(coefficients), original)


@pytest.mark.parametrize("family,block", [("subband", 8), ("haar", 8), ("haar", 16)])
@pytest.mark.parametrize("name,reference", list(fixtures().items()))
def test_transform_fixtures(family, block, name, reference):
    fmt, bank, timing = build_transform_bank(reference, family, 128, block, 2)
    for target in (1, 1.25, 1.5, 1.75, 2):
        plan, details = allocate(bank, reference, 128, target, timing["prefix_bytes"])
        data, simulation = serialize_transform(fmt, bank, plan, block)
        np.testing.assert_array_equal(decode_extended(data)[0], simulation)
        if details["target_attainable"]:
            assert len(data) * 8 <= target * len(reference)
    # Every generated allocation pattern is serialized and parsed through a wrapping ring.
    for option in range(len(bank[0])):
        data, simulation = serialize_transform(fmt, bank, [option] * len(bank), block)
        ring = Ring64(data, 1)
        parsed = read_extended(ring)
        actual = np.fromiter(iter_extended(ring, parsed), np.int8)
        np.testing.assert_array_equal(actual, simulation)


@pytest.mark.parametrize("family,block", [("subband", 8), ("haar", 8), ("haar", 16)])
@pytest.mark.parametrize("size", [0, 1, 2, 7, 8, 9, 15, 16, 17, 129, 259])
def test_transform_lengths_and_cache(family, block, size, tmp_path):
    source = (
        np.random.default_rng(size)
        .integers(-128, 128, size, dtype=np.int16)
        .astype(np.int8)
    )
    fmt, bank, _ = build_transform_bank(source, family, 128, block, 1, cache=tmp_path)
    _, cached, timing = build_transform_bank(
        source, family, 128, block, 1, cache=tmp_path
    )
    assert timing["cache_reused"]
    plan = np.zeros(len(bank), np.int32)
    data, simulation = serialize_transform(fmt, cached, plan, block)
    assert len(simulation) == size
    np.testing.assert_array_equal(decode_extended(data)[0], simulation)


@pytest.mark.parametrize("family,block", [("subband", 8), ("haar", 8), ("haar", 16)])
def test_transform_corruption(family, block):
    source = np.zeros(9, np.int8)
    fmt, bank, _ = build_transform_bank(source, family, 128, block, 1)
    data, _ = serialize_transform(fmt, bank, [0], block)
    for length in range(len(data)):
        with pytest.raises(ValueError):
            decode_extended(data[:length])
    with pytest.raises(ValueError, match="trailing"):
        decode_extended(data + b"\0")
    bad = bytearray(data)
    header = 18 + len(fmt.steps) + int(family == "haar")
    bad[header + 1] = 0xFF
    with pytest.raises(ValueError, match="parameter"):
        decode_extended(bad)


def test_thorough_quantizer_never_worsens_local_error():
    source = fixtures()["sine_440_127"][:8]
    coefficients = haar_forward(source)
    for pattern in PATTERNS[8]:
        pattern = np.array(pattern, np.int64)
        fast = _quantize_details(
            coefficients, pattern, 2, int(coefficients[0]), source, 0
        )
        thorough = _quantize_details(
            coefficients, pattern, 2, int(coefficients[0]), source, 1
        )
        assert thorough[0] <= fast[0]
