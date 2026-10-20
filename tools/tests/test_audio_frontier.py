import json
import sys
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from avm_audio.experiment import main, save_wav


def test_end_to_end_extended_experiments_and_comparison(tmp_path):
    source = tmp_path / "source.wav"
    recording = tmp_path / "recording"
    save_wav(source, np.rint(20 * np.sin(np.arange(259) * 0.15)).astype(np.int8))
    main(
        [
            "evaluate",
            str(source),
            "--output-dir",
            str(recording),
            "--codecs",
            "3",
            "--methods",
            "beam",
            "--beam-width",
            "1",
            "--no-plots",
        ]
    )
    baseline = recording / "candidate3_predictor_dpcm_f128_beam1.avac"
    reference = recording / "reference_8bit_15625.wav"
    main(
        [
            "entropy",
            str(baseline),
            "--reference",
            str(reference),
            "--output-dir",
            str(recording / "below2/entropy"),
            "--entropy-frames",
            "256",
            "--schemes",
            "auto",
        ]
    )
    main(
        [
            "mixed",
            str(reference),
            "--baseline",
            str(baseline),
            "--output-dir",
            str(recording / "below2/mixed"),
            "--block-sizes",
            "128",
            "--beam-width",
            "1",
            "--targets",
            "1.5",
            "1.75",
        ]
    )
    main(
        [
            "transforms",
            str(reference),
            "--output-dir",
            str(recording / "below2/transforms"),
            "--families",
            "subband",
            "--beam-width",
            "1",
            "--targets",
            "1.5",
        ]
    )
    main(["compare", str(recording)])
    combined = json.loads((recording / "below2/metrics.json").read_text())
    assert len(combined["measurements"]) == 5
    for name in (
        "rate_distortion.png",
        "error_spectra.png",
        "waveforms_and_errors.png",
        "spectrograms.png",
        "comparison.html",
        "metrics.csv",
        "best_at_budget.json",
    ):
        assert (recording / "below2" / name).stat().st_size > 0
    row = next(row for row in combined["measurements"] if row["family"] == "entropy")
    assert row["zero_additional_distortion"]
    assert row["avr_cost_status"].startswith("unmeasured")
