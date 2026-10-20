"""Cross-family source-free decoding and all compressed-ring wrap alignments."""

import subprocess
import sys
from pathlib import Path

import numpy as np
import pytest
from scipy.io import wavfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.codecs import encode
from avm_audio.entropy import encode_entropy
from avm_audio.extended import decode_extended, iter_extended, read_extended
from avm_audio.mixed import build_mixed_bank, serialize_plan
from avm_audio.transforms import build_transform_bank, serialize_transform
from test_audio_entropy import Ring64


@pytest.fixture(scope="module")
def streams():
    reference = (
        np.random.default_rng(64)
        .integers(-128, 128, 259, dtype=np.int16)
        .astype(np.int8)
    )
    baseline, _ = encode(reference, 3, 128, 2)
    entropy = encode_entropy(baseline, 1024, "selected")[0]
    fmt, bank, _ = build_mixed_bank(reference, 256, 2)
    mixed = serialize_plan(fmt, bank, [1] * len(bank))[0]
    fmt, bank, _ = build_transform_bank(reference, "subband", 256, beam_width=2)
    subband = serialize_transform(fmt, bank, [5] * len(bank))[0]
    fmt, bank, _ = build_transform_bank(reference, "haar", 256, 16, 2)
    haar = serialize_transform(fmt, bank, [17] * len(bank), 16)[0]
    return (entropy, mixed, subband, haar)


@pytest.mark.parametrize("index", range(4))
def test_all_ring_wrap_alignments(streams, index):
    data = streams[index]
    expected = decode_extended(data)[0]
    for initial in range(64):
        ring = Ring64(data, chunk=1 + initial % 7, initial=initial)
        fmt = read_extended(ring)
        actual = np.fromiter(iter_extended(ring, fmt), np.int8)
        np.testing.assert_array_equal(actual, expected)
        assert ring.wraps


@pytest.mark.parametrize("index", range(4))
def test_standalone_extended_decoder(streams, index, tmp_path):
    source, target = tmp_path / "stream.avax", tmp_path / "output.wav"
    source.write_bytes(streams[index])
    script = Path(__file__).resolve().parents[1] / "avm_audio_codec_test.py"
    subprocess.run(
        [sys.executable, str(script), "decode", str(source), str(target)], check=True
    )
    rate, samples = wavfile.read(target)
    expected = decode_extended(streams[index])[0].astype(np.int16) * 256
    np.testing.assert_array_equal(samples, expected)
    assert rate == 15625
