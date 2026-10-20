"""Actual AVAC bytes, independent streaming decoder, and integer edge cases."""

import io
import itertools
import subprocess
import sys
from pathlib import Path

import numpy as np
import pytest
from scipy.io import wavfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.codecs import (
    ADPCM_STEPS,
    HEADER,
    STEPS,
    Format,
    _exact,
    _move,
    decode,
    encode,
    iter_native,
    pack_codes,
    read_format,
    transition,
)
from avm_audio.experiment import (
    errors,
    half_rate,
    preprocess,
    quantize,
    save_wav,
    upsample,
)


def fixtures():
    t = np.arange(139) / 15625
    rng = np.random.default_rng(713)
    data = {
        "silence": np.zeros(139),
        "positive": np.full(139, 63),
        "negative": np.full(139, -77),
        "square": np.where(np.sin(2 * np.pi * 900 * t) >= 0, 127, -128),
        "saw": np.arange(139) % 31 * 8 - 124,
        "impulse": np.r_[127, np.zeros(137), -128],
        "step": np.r_[np.full(69, -100), np.full(70, 100)],
        "noise": rng.integers(-128, 128, 139),
        "envelope": np.linspace(0, 127, 139) * np.sin(2 * np.pi * 770 * t),
        "abrupt": np.r_[
            np.sin(2 * np.pi * 440 * t[:70]) * 3, np.sin(2 * np.pi * 440 * t[70:]) * 125
        ],
        "extremes": np.resize([-128, 127], 139),
        "boundaries": np.resize([-128, -127, -126, 0, 125, 126, 127], 139),
    }
    for frequency in (50, 440, 3000, 7000):
        for amplitude in (3, 127):
            data[f"sine_{frequency}_{amplitude}"] = amplitude * np.sin(
                2 * np.pi * frequency * t
            )
    return {key: quantize(value) for key, value in data.items()}


@pytest.mark.parametrize("codec", [1, 2, 3, 4])
@pytest.mark.parametrize("method", ["greedy", "beam"])
@pytest.mark.parametrize("name,reference", list(fixtures().items()))
def test_synthetic_roundtrip(codec, method, name, reference):
    native = half_rate(reference) if codec == 4 else reference
    data, simulated = encode(native, codec, 32, 4, method, output_count=len(reference))
    stream = io.BytesIO(data)
    fmt = read_format(stream)
    actual = np.fromiter(iter_native(stream, fmt), dtype=np.int8)
    np.testing.assert_array_equal(actual, simulated)
    for kind in ("hold", "linear"):
        output, _, _ = decode(data, kind)
        assert output.dtype == np.int8
        assert len(output) == len(reference)
        if codec == 4:
            np.testing.assert_array_equal(
                output, upsample(simulated, len(reference), kind)
            )
        else:
            np.testing.assert_array_equal(output, simulated)


@pytest.mark.parametrize("codec", [1, 2, 3, 4])
@pytest.mark.parametrize("length", [0, 1, 2, 3, 4, 31, 32, 33, 63, 65])
def test_short_lengths_and_exact_size(codec, length):
    reference = (
        np.random.default_rng(length)
        .integers(-128, 128, length, dtype=np.int16)
        .astype(np.int8)
    )
    native = half_rate(reference) if codec == 4 else reference
    data, simulated = encode(native, codec, 32, 2, output_count=length)
    output, fmt, _ = decode(data)
    assert len(output) == length
    frame = 16 if codec == 4 else 32
    bits = 4 if codec == 4 else 2
    expected = HEADER.size + 16
    for start in range(0, len(native), frame):
        count = min(frame, len(native) - start)
        expected += 2 + ((count - 1) * bits + 7) // 8
        assert simulated[start] == native[start]
    assert len(data) == expected
    assert fmt.sample_count == length


def test_packing_and_golden_stream():
    assert pack_codes([0, 1, 2, 3], 2) == b"\xe4"
    assert pack_codes([1, 2, 15], 4) == b"\x21\x0f"
    fmt = Format(1, 32, 5, (2,))
    data = fmt.header() + bytes([10, 0, 0xE4])
    np.testing.assert_array_equal(decode(data)[0], [10, 4, 2, 4, 10])


@pytest.mark.parametrize("codec", [1, 2, 3, 4])
def test_independent_transitions(codec):
    rng = np.random.default_rng(codec)
    steps = ADPCM_STEPS if codec == 4 else STEPS
    for _ in range(1500):
        state = (
            int(rng.choice([-128, -127, 0, 126, 127])),
            int(rng.integers(-128, 128)),
            int(rng.integers(16)),
            int(rng.choice([-1, 1])),
            int(rng.integers(4)),
        )
        code = int(rng.integers(16 if codec == 4 else 4))
        mode = int(rng.integers(3)) if codec == 3 else 0
        phase = int(rng.integers(4))
        per_sample = bool(rng.integers(2)) if codec == 2 else False
        python, _ = transition(codec, state, code, steps, mode, phase, per_sample)
        accelerated = _move(
            codec,
            *state,
            code,
            np.array(steps, dtype=np.int64),
            mode,
            phase,
            per_sample,
        )
        assert python == accelerated


def test_scale_direction_and_partial_group():
    state = (0, 0, 5, 1, 0)
    for phase in range(3):
        state, _ = transition(2, state, 3, STEPS, 0, phase)
        assert (
            state[2] == 5
        )  # even a partial group of three big codes does not adapt yet
    state, _ = transition(2, state, 3, STEPS, 0, 3)
    assert state[2] == 6 and state[4] == 0
    state, _ = transition(2, state, 2, STEPS, 0, 0)
    assert state[3] == -1
    old = state[0]
    state, _ = transition(2, state, 3, STEPS, 0, 1)
    assert state[0] == max(-128, old - 3 * STEPS[6])
    state, _ = transition(2, state, 0, STEPS, 0, 0, True)
    assert state[2] == 5


def test_negative_half_slope_rounding():
    state, _ = transition(3, (0, 3, 0, 1, 0), 2, (1,), 2, 0)
    assert state[0] == -1  # floor(-3/2)=-2, then +1 residual


def test_sample_adaptation_stream():
    reference = fixtures()["noise"]
    data, simulated = encode(reference, 2, 32, 8, sample_adaptation=True)
    result, fmt, _ = decode(data)
    assert fmt.sample_adaptation
    np.testing.assert_array_equal(result, simulated)


def test_optimization_and_predictor_superset():
    reference = fixtures()["sine_440_127"]
    greedy, _ = encode(reference, 1, 32, method="greedy")
    beam, _ = encode(reference, 1, 32, 16)
    exact, _ = encode(reference, 1, 32, method="exact")
    predictor, _ = encode(reference, 3, 32, 16)
    mse = lambda data: errors(reference, decode(data)[0])["rmse"]
    assert mse(exact) <= mse(beam) <= mse(greedy)
    assert mse(predictor) <= mse(beam)
    assert beam == encode(reference, 1, 32, 16)[0]


def test_exact_dp_bruteforce():
    target = np.array([0, 9, -4, 6, 1], np.int8)
    steps = np.array([3], np.int64)
    result, _codes, _ = _exact(target, steps, 0, 0.0, 1000)
    costs = []
    for sequence in itertools.product(range(4), repeat=len(target) - 1):
        state, cost = (0, 0, 0, 1, 0), 0
        for desired, code in zip(target[1:], sequence):
            state, _ = transition(1, state, code, steps, 0, 0)
            cost += (int(desired) - state[0]) ** 2
        costs.append(cost)
    assert result == min(costs)


@pytest.mark.parametrize("frame", [32, 64, 128, 256])
@pytest.mark.parametrize("codec", [1, 2, 3, 4])
def test_configurable_frames_tables_and_boundaries(frame, codec):
    reference = (
        np.random.default_rng(frame + codec)
        .integers(-128, 128, frame + 3, dtype=np.int16)
        .astype(np.int8)
    )
    native = half_rate(reference) if codec == 4 else reference
    stream, simulation = encode(
        native,
        codec,
        frame,
        4,
        steps=[1, 17, 255],
        output_count=len(reference),
        boundary_penalty=0.1,
    )
    _output, fmt, _ = decode(stream)
    assert fmt.steps == (1, 17, 255)
    data = io.BytesIO(stream)
    actual = np.fromiter(iter_native(data, read_format(data)), dtype=np.int8)
    np.testing.assert_array_equal(actual, simulation)
    native_frame = frame // 2 if codec == 4 else frame
    np.testing.assert_array_equal(actual[::native_frame], native[::native_frame])


def test_cli_report_reuse_and_validation(tmp_path):
    import json

    from avm_audio.experiment import main

    source = tmp_path / "source.wav"
    destination = tmp_path / "results"
    save_wav(source, np.arange(-40, 41, dtype=np.int8))
    command = [
        "evaluate",
        str(source),
        "--output-dir",
        str(destination),
        "--beam-width",
        "2",
        "--no-plots",
    ]
    main(command)
    report = json.loads((destination / "metrics.json").read_text())
    assert len(report["measurements"]) == 10
    for row in report["measurements"]:
        assert (
            row["compressed_bytes"] * 8
            == (row["file_header_bytes"] + row["frame_header_bytes"]) * 8
            + row["residual_symbol_bits"]
            + row["padding_bits"]
        )
        rate, samples = wavfile.read(destination / row["wav"])
        assert rate == 15625 and len(samples) == 81
    main(command + ["--reuse"])
    with pytest.raises(ValueError, match="configuration mismatch"):
        main(command + ["--reuse", "--boundary-penalty", ".1"])


@pytest.mark.parametrize("codec", [1, 2, 3, 4])
def test_corruption_rejected(codec):
    data, _ = encode(
        np.array([0, 1], np.int8), codec, output_count=3 if codec == 4 else 2
    )
    for end in range(len(data)):
        with pytest.raises(ValueError):
            decode(data[:end])
    with pytest.raises(ValueError, match="trailing"):
        decode(data + b"\0")
    with pytest.raises(ValueError, match="padding"):
        decode(data[:-1] + bytes([data[-1] | 128]))
    broken = bytearray(data)
    broken[4] = 99
    with pytest.raises(ValueError):
        decode(broken)
    broken = bytearray(data)
    broken[HEADER.size + 16 + 1] = 0xF0
    with pytest.raises(ValueError, match="parameter"):
        decode(broken)


def test_silence_quantization_and_pcm_wav(tmp_path):
    for codec in (2, 4):
        stream, _ = encode(np.zeros(65, np.int8), codec)
        assert not decode(stream)[0].any()
    assert errors(np.zeros(3, np.int8), np.zeros(3, np.int8))["snr_status"] == "exact"
    assert (
        errors(np.zeros(3, np.int8), np.ones(3, np.int8))["snr_status"]
        == "silent_reference"
    )
    samples = np.array([-128, -1, 0, 1, 127], np.int8)
    path = tmp_path / "pcm.wav"
    save_wav(path, samples)
    rate, actual = wavfile.read(path)
    assert rate == 15625 and actual.dtype == np.int16
    np.testing.assert_array_equal(actual, samples.astype(np.int16) * 256)
    common, _ = preprocess(path)
    np.testing.assert_array_equal(common, samples)
    np.testing.assert_array_equal(
        quantize([-129, -127.5, -1.5, -0.5, 0.5, 1.5, 127.5]),
        [-128, -128, -2, 0, 0, 2, 127],
    )


def test_bandlimited_preprocessing(tmp_path):
    rate = 44100
    t = np.arange(rate) / rate
    audio = np.sin(2 * np.pi * 12000 * t) * 0.8
    source = tmp_path / "high.wav"
    wavfile.write(source, rate, np.column_stack([audio, audio]).astype(np.float32))
    reference, _metadata = preprocess(source)
    assert len(reference) == 15625
    assert np.sqrt(np.mean(reference[100:-100].astype(float) ** 2)) < 1
    # 6 kHz is below common Nyquist but above the half-rate Nyquist.
    reference = quantize(100 * np.sin(2 * np.pi * 6000 * np.arange(15625) / 15625))
    low = half_rate(reference)
    assert len(low) == 7813
    assert np.sqrt(np.mean(low[100:-100].astype(float) ** 2)) < 1


def test_streaming_standalone_command(tmp_path):
    reference = fixtures()["step"]
    data, _ = encode(half_rate(reference), 4, output_count=len(reference))
    source, target = tmp_path / "alone.avac", tmp_path / "decoded.wav"
    source.write_bytes(data)
    subprocess.run(
        [
            sys.executable,
            str(Path(__file__).resolve().parents[1] / "avm_audio_codec_test.py"),
            "decode",
            str(source),
            str(target),
        ],
        check=True,
    )
    rate, audio = wavfile.read(target)
    np.testing.assert_array_equal(
        audio, decode(data, "linear")[0].astype(np.int16) * 256
    )
    assert rate == 15625
