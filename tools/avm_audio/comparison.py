"""Combine only measured full-length streams into rate-distortion comparisons."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path

import numpy as np

from .codecs import RATE
from .frontier import (
    load_reference,
    quality_details,
    save_report,
    structural_diagnostics,
)


def pareto(rows):
    selected, best = [], float("inf")
    for row in sorted(
        rows,
        key=lambda item: (item["bits_per_output_sample"], item["rmse"], item["name"]),
    ):
        if row["rmse"] < best:
            selected.append(row)
            best = row["rmse"]
    return selected


def decoder_model(family):
    """Explicit planning estimates; no model entry is an AVR measurement."""
    from .transforms import PATTERNS, SHUFFLES

    haar_table = 16 + sum(
        len(pattern) for patterns in PATTERNS.values() for pattern in patterns
    )
    haar_table += sum(
        len(cycle) + 1 for cycles in SHUFFLES.values() for cycle in cycles
    )
    models = {
        "candidate3": (
            16,
            0,
            16,
            [200, 400],
            [28, 58],
            [35, 75],
            "1 residual: 2 fixed bits; one seed/parameter header at restart",
        ),
        "adpcm_linear": (
            16,
            0,
            24,
            [250, 500],
            [30, 56],
            [60, 120],
            "one native decode every two outputs, one-sample lookahead",
        ),
        "entropy": (
            27,
            0,
            64,
            [600, 1100],
            [35, 85],
            [65, 150],
            "Huffman/context: <=3 bits/symbol; bitplanes: <=17 bits before a group output; raw/header boundaries add reads",
        ),
        "mixed": (
            17,
            0,
            16,
            [240, 480],
            [26, 60],
            [35, 80],
            "constant/one/two-bit width branch; at most 2 residual bits/output; 2-byte frame header",
        ),
        "mixed_weighted": (
            17,
            0,
            16,
            [240, 480],
            [26, 60],
            [35, 80],
            "identical mixed decoder; only offline allocation changes",
        ),
        "subband": (
            21,
            0,
            16,
            [400, 750],
            [28, 70],
            [65, 145],
            "per pair: low predictor, <=2 high bits, 3 inverse lift operations, two final clamps; 4-byte frame header",
        ),
        "haar8": (
            21,
            16,
            haar_table,
            [800, 1600],
            [40, 90],
            [320, 900],
            "8-sample burst: 7 inverse nodes, 8 shuffled words, <=20 coefficient/DC bits; foreground scratch 24 bytes",
        ),
        "haar16": (
            21,
            32,
            haar_table,
            [800, 1600],
            [45, 100],
            [650, 1800],
            "16-sample burst: 15 inverse nodes, 22 shuffled words, <=36 coefficient/DC bits; foreground scratch 48 bytes",
        ),
    }
    state, scratch, tables, firmware, average, worst, work = models[family]
    return {
        "avr_cost_status": "unmeasured source-level planning estimate",
        "avr_persistent_state_bytes_excluding_ring_estimate": state,
        "avr_pcm_coefficient_scratch_bytes": scratch,
        "avr_default_table_bytes": tables,
        "avr_kernel_firmware_bytes_estimate": firmware,
        "avr_cycles_per_output_average_estimate": average,
        "avr_synchronous_burst_cycles_estimate": worst,
        "decoder_work_bound": work,
        "ring_buffer_bytes": 64,
        "avr_code_size_scope": "kernel and framing; excludes FX refill and integration glue",
    }


def plot_rates(directory, rows, title):
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    groups = list(dict.fromkeys(row["family"] for row in rows))
    fig, ax = plt.subplots(figsize=(11, 6.5))
    for target in (1, 1.25, 1.5, 1.75, 2):
        ax.axvline(target, color="#d7d7d7", lw=0.8, ls="--")
    for family in groups:
        family_rows = [row for row in rows if row["family"] == family]
        frontier = pareto(family_rows)
        points = [(row["bits_per_output_sample"], row["rmse"]) for row in frontier]
        marker = (
            "*"
            if family == "candidate3"
            else ("x" if family == "mixed_weighted" else "o")
        )
        ax.plot(
            [point[0] for point in points],
            [point[1] for point in points],
            marker=marker,
            label=family,
            lw=1.2,
            ms=7 if marker != "*" else 12,
        )
    ax.set_xlim(
        0.95, max(2.17, max(row["bits_per_output_sample"] for row in rows) + 0.025)
    )
    ax.set_ylim(bottom=0)
    ax.set_xlabel("Actual serialized bits per original output sample")
    ax.set_ylabel("RMSE against common signed PCM8 reference")
    ax.set_title(
        title
        + "\nMarkers are measured streams; lines only connect measured Pareto points",
        fontsize=11,
    )
    ax.grid(axis="y", alpha=0.2)
    ax.legend(fontsize=8, ncol=2)
    fig.tight_layout()
    fig.savefig(directory / "rate_distortion.png", dpi=160)
    plt.close(fig)


def plot_error_spectra(directory, reference, signals):
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from scipy.signal import welch

    fig, ax = plt.subplots(figsize=(11, 5))
    for name, values in signals.items():
        frequency, spectrum = welch(
            values.astype(float) - reference.astype(float),
            RATE,
            nperseg=min(1024, len(reference)),
        )
        ax.plot(
            frequency,
            10 * np.log10(np.maximum(spectrum / (128 * 128), 1e-12)),
            label=name,
            lw=1,
        )
    ax.set_xlabel("Frequency (Hz)")
    ax.set_ylabel("Error spectrum (dBFS/Hz)")
    ax.legend(fontsize=7)
    ax.grid(alpha=0.2)
    fig.tight_layout()
    fig.savefig(directory / "error_spectra.png", dpi=150)
    plt.close(fig)
    events = structural_diagnostics(reference, reference)["energy_rise_event_samples"]
    if events:
        event = events[0]
        begin, end = max(0, event - 64), min(len(reference), event + 96)
        times = (np.arange(begin, end) - event) / RATE * 1000
        fig, axes = plt.subplots(
            len(signals), 1, figsize=(11, 1.8 * len(signals)), squeeze=False
        )
        for ax, (name, values) in zip(axes[:, 0], signals.items()):
            ax.plot(times, reference[begin:end], color="black", lw=1, label="reference")
            ax.plot(times, values[begin:end], lw=0.9, label=name)
            ax.axvline(0, color="gray", ls="--", lw=0.7)
            ax.legend(fontsize=7, loc="upper right")
        axes[0, 0].set_title(
            f"Numerical RMS-rise diagnostic at {event / RATE:.3f} s; no perceptual judgment"
        )
        axes[-1, 0].set_xlabel("Milliseconds relative to RMS-rise event")
        fig.tight_layout()
        fig.savefig(directory / "transient_comparison.png", dpi=140)
        plt.close(fig)


def compare_experiments(args):
    from .experiment import make_plots, save_wav

    recording = Path(args.recording_dir).resolve()
    directory = (
        Path(args.output_dir).resolve() if args.output_dir else recording / "below2"
    )
    directory.mkdir(parents=True, exist_ok=True)
    reference = load_reference(recording / "reference_8bit_15625.wav")
    if not len(reference):
        raise ValueError("rate-distortion plots require a nonempty reference")
    reference_hash = hashlib.sha256(reference.tobytes()).hexdigest()
    save_wav(directory / "reference_8bit_15625.wav", reference)
    rows, sources = [], {}
    for group in ("baseline", "entropy", "mixed", "mixed_weighted", "transforms"):
        base = recording if group == "baseline" else recording / "below2" / group
        path = base / "metrics.json"
        if not path.exists():
            continue
        report = json.loads(path.read_text())
        observed = report.get(
            "reference_sha256", report.get("input", {}).get("reference_sha256")
        )
        if observed != reference_hash:
            raise ValueError(
                f"reference hash mismatch; refuse to mix excerpt or different-input results: {path}"
            )
        sources[os.path.relpath(path, directory)] = report.get("command")
        for original in report["measurements"]:
            row = original.copy()
            if group == "baseline":
                if (
                    row["method"] != "beam"
                    or row["codec"] not in (3, 4)
                    or (row["codec"] == 4 and not row["name"].endswith("linear"))
                ):
                    continue
                row["family"] = "candidate3" if row["codec"] == 3 else "adpcm_linear"
            elif group == "mixed_weighted":
                row["family"], row["name"] = "mixed_weighted", "weighted_" + row["name"]
            row["wav"] = Path(os.path.relpath(base / row["wav"], directory)).as_posix()
            row["compressed_file"] = Path(
                os.path.relpath(base / row["compressed_file"], directory)
            ).as_posix()
            row["source_result"] = Path(os.path.relpath(path, directory)).as_posix()
            row["fx_bytes_per_second"] = row["bits_per_output_sample"] * RATE / 8
            row.update(decoder_model(row["family"]))
            rows.append(row)
    if not rows:
        raise ValueError("no measured results found")
    diagnostic_cache, signals = {}, {}
    selected_names = set()
    for family in ("candidate3", "mixed", "subband", "haar8", "haar16", "adpcm_linear"):
        candidates = [row for row in rows if row["family"] == family]
        if candidates:
            row = min(
                candidates,
                key=lambda row: (abs(row["bits_per_output_sample"] - 1.5), row["rmse"]),
            )
            selected_names.add(row["name"])
    for row in rows:
        pcm = load_reference(directory / row["wav"])
        if len(pcm) != len(reference):
            raise ValueError("do not combine different-length results")
        digest = hashlib.sha256(pcm.tobytes()).hexdigest()
        if row.get("decoded_pcm8_sha256", digest) != digest:
            raise ValueError(
                "listening file hash no longer matches measured reconstruction"
            )
        if digest not in diagnostic_cache:
            diagnostic_cache[digest] = {
                **quality_details(reference, pcm),
                **structural_diagnostics(reference, pcm),
            }
        details = diagnostic_cache[digest]
        row.update(
            decoded_pcm8_sha256=digest,
            frame_rmse_percentiles=details["frame_rmse_percentiles"],
            quiet_section_rmse=details["quiet_section_rmse"],
            high_band_power_ratio_db=details.get("high_band_power_ratio_db"),
            pre_energy_rise_error_rmse=details["pre_energy_rise_error_rmse"],
            post_energy_rise_error_rmse=details["post_energy_rise_error_rmse"],
        )
        (directory / f"{row['name']}.details.json").write_text(
            json.dumps(details, indent=2), encoding="utf-8"
        )
        if row["name"] in selected_names:
            signals[row["family"] + f" ({row['bits_per_output_sample']:.3f} bps)"] = pcm
    title = f"{recording.name}: measured compression frontier"
    plot_rates(directory, rows, title)
    make_plots(directory, reference, signals)
    plot_error_spectra(directory, reference, signals)
    best = []
    for target in (1, 1.25, 1.5, 1.75, 2):
        available = [row for row in rows if row["bits_per_output_sample"] <= target]
        if available:
            chosen = min(available, key=lambda row: row["rmse"])
            best.append(
                {
                    "budget_bps": target,
                    **{
                        key: chosen[key]
                        for key in (
                            "name",
                            "family",
                            "bits_per_output_sample",
                            "rmse",
                            "snr_db",
                            "compressed_bytes",
                            "wav",
                        )
                    },
                }
            )
    (directory / "best_at_budget.json").write_text(
        json.dumps(best, indent=2), encoding="utf-8"
    )
    (directory / "source_commands.json").write_text(
        json.dumps(sources, indent=2), encoding="utf-8"
    )
    save_report(directory, reference, rows, title)
    print(json.dumps(best, indent=2), flush=True)
    return rows
