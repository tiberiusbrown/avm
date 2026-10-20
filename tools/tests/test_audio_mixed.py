import itertools
import sys
from pathlib import Path

import numpy as np
import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.codecs import STEPS, _move, transition
from avm_audio.extended import decode_extended, iter_extended, read_extended
from avm_audio.mixed import _lagrange, allocate, build_mixed_bank, serialize_plan
from test_audio_codecs import fixtures
from test_audio_entropy import Ring64


@pytest.mark.parametrize("frame", [128, 256])
@pytest.mark.parametrize("name,reference", list(fixtures().items()))
def test_mixed_fixtures(frame, name, reference):
    fmt, bank, _ = build_mixed_bank(reference, frame, 2)
    for target in (1, 1.25, 1.5, 1.75, 2):
        plan, details = allocate(bank, reference, frame, target, len(fmt.header()))
        data, simulation = serialize_plan(fmt, bank, plan)
        np.testing.assert_array_equal(decode_extended(data)[0], simulation)
        if details["target_attainable"]:
            assert len(data) * 8 <= target * len(reference)
    for mode in range(3):
        data, simulation = serialize_plan(fmt, bank, [mode] * len(bank))
        ring = Ring64(data, 1)
        parsed = read_extended(ring)
        actual = np.fromiter(iter_extended(ring, parsed), np.int8)
        np.testing.assert_array_equal(actual, simulation)


@pytest.mark.parametrize("size", [0, 1, 2, 3, 127, 128, 129, 257])
def test_mixed_lengths_cache_and_errors(size, tmp_path):
    reference = (
        np.random.default_rng(size)
        .integers(-128, 128, size, dtype=np.int16)
        .astype(np.int8)
    )
    fmt, bank, info = build_mixed_bank(reference, 128, 2, cache=tmp_path)
    assert not info["cache_reused"]
    _, cached, info = build_mixed_bank(reference, 128, 2, cache=tmp_path)
    assert info["cache_reused"]
    for mode in range(3):
        data, simulation = serialize_plan(fmt, cached, [mode] * len(bank))
        np.testing.assert_array_equal(decode_extended(data)[0], simulation)
        assert len(simulation) == size
    if size:
        with pytest.raises(ValueError, match="local quality"):
            allocate(bank, reference, 128, 1, len(fmt.header()), max_peak=-1)


def test_binary_transition_matches_existing_predictor():
    rng = np.random.default_rng(61)
    for _ in range(1000):
        p, older = int(rng.integers(-128, 128)), int(rng.integers(-128, 128))
        index, mode, symbol = (
            int(rng.integers(16)),
            int(rng.integers(3)),
            int(rng.integers(2)),
        )
        independent, _ = transition(
            3, (p, older, index, 1, 0), symbol + 1, STEPS, mode, 0
        )
        assert (
            _move(
                6,
                p,
                older,
                index,
                1,
                0,
                symbol,
                np.array(STEPS, np.int64),
                mode,
                0,
                False,
            )
            == independent
        )


def test_lagrange_and_boundary_coupling_bruteforce():
    rng = np.random.default_rng(6)
    costs = rng.integers(1, 20, (4, 3)).astype(float)
    sizes = np.tile(np.array([16, 80, 144], np.int64), (4, 1))
    first, last = (
        rng.integers(-20, 20, (4, 3)).astype(float),
        rng.integers(-20, 20, (4, 3)).astype(float),
    )
    boundaries = np.array([0, 3, -5, 2], float)
    for weight in (0.0, 0.1):
        plan, actual, bits = _lagrange(
            costs, sizes, first, last, boundaries, 0.25, weight
        )
        brute = []
        for sequence in itertools.product(range(3), repeat=4):
            value = sum(
                costs[i, choice] + 0.25 * sizes[i, choice]
                for i, choice in enumerate(sequence)
            )
            value += sum(
                weight
                * (first[i, sequence[i]] - last[i - 1, sequence[i - 1]] - boundaries[i])
                ** 2
                for i in range(1, 4)
            )
            brute.append(value)
        assert actual == pytest.approx(min(brute))
        assert bits == sum(sizes[i, choice] for i, choice in enumerate(plan))


def test_mixed_corruption_and_padding():
    reference = np.zeros(130, np.int8)
    fmt, bank, _ = build_mixed_bank(reference, 128, 1)
    data, _ = serialize_plan(fmt, bank, [1] * len(bank))
    for length in range(len(data)):
        with pytest.raises(ValueError):
            decode_extended(data[:length])
    with pytest.raises(ValueError, match="padding"):
        decode_extended(data[:-1] + bytes([data[-1] | 128]))
    bad = bytearray(data)
    bad[35] = 0xFF
    with pytest.raises(ValueError, match="parameter"):
        decode_extended(bad)
    with pytest.raises(ValueError, match="trailing"):
        decode_extended(data + b"\0")


def test_candidate_cache_accounts_for_supplied_baseline(tmp_path):
    from avm_audio.codecs import encode

    source = np.arange(-20, 21, dtype=np.int8)
    greedy, _ = encode(source, 3, 128, method="greedy")
    _, _, first = build_mixed_bank(source, 128, 1, baseline=greedy, cache=tmp_path)
    assert not first["cache_reused"]
    _, _, repeated = build_mixed_bank(source, 128, 1, baseline=greedy, cache=tmp_path)
    assert repeated["cache_reused"]
    _, _, without_baseline = build_mixed_bank(source, 128, 1, cache=tmp_path)
    assert not without_baseline["cache_reused"]
