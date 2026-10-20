"""Shared measurement/report workflow for the below-two-bit experiments."""

from __future__ import annotations

import csv
import hashlib
import html
import json
import sys
import time
from pathlib import Path

import numpy as np
from scipy.io import wavfile
from scipy.signal import find_peaks, welch

from .codecs import RATE, decode
from .entropy import SCHEMES, encode_entropy, residual_statistics
from .extended import decode_extended


def load_reference(path):
    rate, audio = wavfile.read(path)
    if (
        rate != RATE
        or audio.dtype != np.int16
        or audio.ndim != 1
        or np.any(audio % 256)
    ):
        raise ValueError(
            "reference must be the existing mono PCM8-scaled PCM16 WAV at 15625 Hz"
        )
    return (audio // 256).astype(np.int8)


def quality_details(reference, reconstruction, frame=128):
    difference = reference.astype(float) - reconstruction.astype(float)
    frame_mse = np.array(
        [
            np.mean(difference[i : i + frame] ** 2)
            for i in range(0, len(reference), frame)
        ]
    )
    frame_rmse = np.sqrt(frame_mse)
    quiet = []
    for i in range(0, len(reference), frame):
        if np.mean(reference[i : i + frame].astype(float) ** 2) <= 64:
            quiet.extend(difference[i : i + frame])
    frequency, spectrum = (
        welch(difference, RATE, nperseg=min(1024, len(reference)))
        if len(reference) > 1
        else (np.array([]), np.array([]))
    )
    result = {
        "quality_window_samples": frame,
        "frame_rmse_percentiles": dict(
            zip(
                ("p0", "p50", "p90", "p95", "p99", "p100"),
                np.percentile(frame_rmse, [0, 50, 90, 95, 99, 100]).tolist()
                if len(frame_rmse)
                else [0.0] * 6,
            )
        ),
        "maximum_local_absolute_error": int(np.max(np.abs(difference)))
        if len(difference)
        else 0,
        "quiet_section_samples": len(quiet),
        "quiet_section_rmse": float(np.sqrt(np.mean(np.square(quiet))))
        if quiet
        else None,
        "frame_rmse": frame_rmse.tolist(),
        "error_spectrum_hz": frequency.tolist(),
        "error_spectrum_pcm8_squared_per_hz": spectrum.tolist(),
    }
    return result


def structural_diagnostics(reference, reconstruction):
    """Numerical artifact diagnostics; these do not assign listening judgments."""
    difference = reconstruction.astype(float) - reference.astype(float)
    result = {"final_saturation_note": "endpoint values alone do not imply clipping"}
    if len(reference) > 1:
        frequencies, source_power = welch(
            reference.astype(float), RATE, nperseg=min(1024, len(reference))
        )
        _, output_power = welch(
            reconstruction.astype(float), RATE, nperseg=min(1024, len(reference))
        )
        high = frequencies >= RATE / 4
        a, b = float(source_power[high].sum()), float(output_power[high].sum())
        result["high_band_power_ratio_db"] = 10 * np.log10(b / a) if a and b else None
    events = np.empty(0, np.int64)
    if len(reference) >= 128:
        energy = np.convolve(
            reference.astype(float) ** 2, np.ones(16) / 16, mode="same"
        )
        rms = np.sqrt(energy)
        rise = rms - np.r_[np.zeros(16), rms[:-16]]
        rise[:32], rise[-32:] = 0, 0
        peaks, _ = find_peaks(
            rise, height=max(1.0, float(np.percentile(rise, 99))), distance=256
        )
        events = peaks[np.argsort(rise[peaks], kind="stable")[-32:]]
        events = np.sort(events)
    before = (
        np.concatenate([difference[event - 32 : event] for event in events])
        if len(events)
        else np.empty(0)
    )
    after = (
        np.concatenate([difference[event : event + 32] for event in events])
        if len(events)
        else np.empty(0)
    )
    result.update(
        energy_rise_event_samples=events.tolist(),
        pre_energy_rise_error_rmse=float(np.sqrt(np.mean(before**2)))
        if len(before)
        else None,
        post_energy_rise_error_rmse=float(np.sqrt(np.mean(after**2)))
        if len(after)
        else None,
        energy_rise_note="32-sample windows around up to 32 strong RMS rises; numerical diagnostic, not a perceptual pre-echo measurement",
    )
    return result


def measure(
    directory, name, family, data, reference, encoder_seconds, extra=None, baseline=None
):
    from .experiment import boundary_metrics, errors, local_diagnostics, save_wav

    (directory / f"{name}.avax").write_bytes(data)
    serialized = (directory / f"{name}.avax").read_bytes()
    before = time.perf_counter()
    reconstruction, fmt, stats = decode_extended(serialized)
    elapsed = time.perf_counter() - before
    if len(reconstruction) != len(reference):
        raise AssertionError("reference sample count mismatch")
    if baseline is not None:
        np.testing.assert_array_equal(reconstruction, baseline)
    save_wav(directory / f"{name}.wav", reconstruction)
    details = quality_details(reference, reconstruction)
    (directory / f"{name}.details.json").write_text(
        json.dumps(details, indent=2), encoding="utf-8"
    )
    row = {
        "name": name,
        "family": family,
        "codec": fmt.codec,
        "frame_size": fmt.frame_size,
        "compressed_file": f"{name}.avax",
        "wav": f"{name}.wav",
        "samples": len(reference),
        "compressed_bytes": len(data),
        "bits_per_output_sample": len(data) * 8 / len(reference)
        if len(reference)
        else None,
        "encoder_seconds": encoder_seconds,
        "decoder_host_seconds": elapsed,
        **errors(reference, reconstruction),
        **boundary_metrics(reference, reconstruction, fmt.frame_size),
        **local_diagnostics(reference, reconstruction),
        "saturated_samples": stats.saturated_samples,
        "endpoint_samples": stats.endpoint_samples,
        "frame_rmse_percentiles": details["frame_rmse_percentiles"],
        "quiet_section_rmse": details["quiet_section_rmse"],
        "predictor_frame_counts": stats.modes,
        "decoded_pcm8_sha256": hashlib.sha256(reconstruction.tobytes()).hexdigest(),
        **(extra or {}),
    }
    return row, reconstruction


def save_report(directory, reference, rows, title="Below-two-bit audio evaluation"):
    report = {
        "reference_sha256": hashlib.sha256(reference.tobytes()).hexdigest(),
        "samples": len(reference),
        "command": sys.argv,
        "measurements": rows,
        "timing_note": "Host timings only; no AVR cycles measured",
    }
    (directory / "metrics.json").write_text(
        json.dumps(report, indent=2, allow_nan=False), encoding="utf-8"
    )
    flat = [
        {
            key: json.dumps(value) if isinstance(value, (dict, list, tuple)) else value
            for key, value in row.items()
        }
        for row in rows
    ]
    with (directory / "metrics.csv").open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(
            file, fieldnames=list(dict.fromkeys(key for row in flat for key in row))
        )
        writer.writeheader()
        writer.writerows(flat)
    lines = [
        f"# {title}",
        "",
        "All metrics compare independently decoded streams with the existing PCM8 reference. Host timings are not AVR timings.",
        "",
        "| Configuration | Bytes | Actual bps | RMSE | SNR dB | p99 frame RMSE |",
        "|---|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        snr = (
            f"{row['snr_db']:.2f}"
            if row["snr_db"] is not None
            else row.get("snr_status", "n/a")
        )
        lines.append(
            f"| {row['name']} | {row['compressed_bytes']:,} | {row['bits_per_output_sample'] or 0:.6f} | {row['rmse']:.4f} | {snr} | {row.get('frame_rmse_percentiles', {}).get('p99', 0):.3f} |"
        )
    (directory / "summary.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    players = [
        '<h2>Common PCM8 reference</h2><audio controls preload="none" src="reference_8bit_15625.wav"></audio>'
    ]
    for row in rows:
        players.append(
            f'<section data-family="{html.escape(row["family"], quote=True)}"><h2>{html.escape(row["name"])}</h2><p>{row["bits_per_output_sample"] or 0:.6f} bits/sample; RMSE {row["rmse"]:.4f}</p>'
            f'<audio controls preload="none" src="{html.escape(row["wav"], quote=True)}"></audio></section>'
        )
    families = sorted({row["family"] for row in rows})
    options = '<option value="">All codecs</option>' + "".join(
        f'<option value="{html.escape(family, quote=True)}">{html.escape(family)}</option>'
        for family in families
    )
    selector = (
        "<label>Show codec: <select onchange=\"for(const s of document.querySelectorAll('[data-family]')) s.hidden=!!this.value &amp;&amp; s.dataset.family!==this.value\">"
        + options
        + "</select></label>"
    )
    plots = "".join(
        f'<p><img src="{name}" alt="{label}"></p>'
        for name, label in (
            ("rate_distortion.png", "Measured rate-distortion points"),
            ("error_spectra.png", "Reconstruction error spectra"),
            ("transient_comparison.png", "RMS-rise waveform diagnostic"),
            ("waveforms_and_errors.png", "Waveform and error overlays"),
            ("spectrograms.png", "Reference and decoder spectrograms"),
        )
        if (directory / name).exists()
    )
    page = (
        '<!doctype html><meta charset="utf-8"><title>AVM below two bits</title>'
        "<style>body{font:16px system-ui;max-width:1100px;margin:2em auto;padding:0 1em}audio,img{width:100%}h2{font-size:18px;margin-top:2em}</style>"
        f"<h1>{html.escape(title)}</h1><p>Objective comparisons; no subjective listening ranking assigned.</p>"
        + plots
        + selector
        + "\n".join(players)
    )
    (directory / "comparison.html").write_text(page, encoding="utf-8")


def entropy_experiment(args):
    from .experiment import save_wav

    directory = Path(args.output_dir)
    directory.mkdir(parents=True, exist_ok=True)
    reference = load_reference(args.reference)
    data = Path(args.baseline).read_bytes()
    baseline = decode(data)[0]
    if len(reference) != len(baseline):
        raise ValueError("baseline and reference count mismatch")
    save_wav(directory / "reference_8bit_15625.wav", reference)
    stats = residual_statistics(data)
    (directory / "residual_statistics.json").write_text(
        json.dumps(stats, indent=2), encoding="utf-8"
    )
    print(
        f"H0={stats['entropy_bits_per_residual']:.6f}; H1={stats['conditional_entropy_previous']:.6f}; H2={stats['conditional_entropy_previous_two']:.6f}",
        flush=True,
    )
    training = Path(args.training_stream).read_bytes() if args.training_stream else None
    rows = []
    for group in args.entropy_frames:
        for scheme in args.schemes:
            name = f"entropy_{scheme}_f{group}"
            before = time.perf_counter()
            compressed, details = encode_entropy(data, group, scheme, training)
            encoder_seconds = time.perf_counter() - before
            row, _ = measure(
                directory,
                name,
                "entropy",
                compressed,
                reference,
                encoder_seconds,
                {"scheme": scheme, "zero_additional_distortion": True, **details},
                baseline,
            )
            rows.append(row)
            print(
                f"{name}: {row['bits_per_output_sample']:.6f} bps, exact baseline equality",
                flush=True,
            )
            save_report(
                directory,
                reference,
                rows,
                "Lossless entropy wrappers around candidate 3",
            )
    return rows


def add_commands(commands):
    from .comparison import compare_experiments

    comparison = commands.add_parser(
        "compare",
        help="combine complete-recording measurements, listening files and rate-distortion plots",
    )
    comparison.add_argument(
        "recording_dir", help="original per-recording result directory"
    )
    comparison.add_argument("--output-dir", help="defaults to recording_dir/below2")
    comparison.set_defaults(experiment=compare_experiments)
    parser = commands.add_parser(
        "entropy", help="lossless residual statistics and lightweight entropy coding"
    )
    parser.add_argument("baseline", help="existing candidate-3 .avac file")
    parser.add_argument("--reference", required=True)
    parser.add_argument("--output-dir", required=True)
    parser.add_argument(
        "--training-stream",
        help="representative candidate-3 stream; learned book IDs are still stored",
    )
    parser.add_argument(
        "--entropy-frames", type=int, nargs="+", default=[128, 256, 512, 1024]
    )
    parser.add_argument("--schemes", choices=SCHEMES, nargs="+", default=list(SCHEMES))
    parser.set_defaults(experiment=entropy_experiment)
    mixed = commands.add_parser(
        "mixed",
        help="allocate hold/one-bit/two-bit predictor frames to measured bitrate targets",
    )
    mixed.add_argument("reference", help="existing common PCM8 reference WAV")
    mixed.add_argument(
        "--baseline", help="reuse candidate-3 AVAC frame candidates where compatible"
    )
    mixed.add_argument("--output-dir", required=True)
    mixed.add_argument(
        "--candidate-cache-dir",
        help="reuse banks in another result directory without re-running encoder search",
    )
    mixed.add_argument("--block-sizes", type=int, nargs="+", default=[128, 256])
    mixed.add_argument(
        "--targets", type=float, nargs="+", default=[1, 1.25, 1.5, 1.75, 2]
    )
    mixed.add_argument("--beam-width", type=int, default=16)
    mixed.add_argument("--quiet-weight", type=float, default=1)
    mixed.add_argument("--quiet-threshold", type=float, default=8)
    mixed.add_argument("--max-frame-rmse", type=float)
    mixed.add_argument("--max-peak", type=float)
    mixed.add_argument("--boundary-weight", type=float, default=0)
    mixed.set_defaults(experiment=mixed_experiment)
    transform = commands.add_parser(
        "transforms", help="integer two-band and Haar rate-distortion experiments"
    )
    transform.add_argument("reference", help="existing common PCM8 reference WAV")
    transform.add_argument("--output-dir", required=True)
    transform.add_argument(
        "--families",
        choices=["subband", "haar8", "haar16"],
        nargs="+",
        default=["subband", "haar8", "haar16"],
    )
    transform.add_argument("--frame-size", type=int, default=256)
    transform.add_argument(
        "--targets", type=float, nargs="+", default=[1, 1.25, 1.5, 1.75, 2]
    )
    transform.add_argument("--beam-width", type=int, default=16)
    transform.add_argument("--effort", choices=["fast", "thorough"], default="fast")
    transform.add_argument(
        "--seconds",
        type=float,
        help="explicitly labeled prefix excerpt for more costly searches",
    )
    transform.set_defaults(experiment=transform_experiment)


def mixed_experiment(args):
    from .experiment import save_wav
    from .mixed import allocate, build_mixed_bank, serialize_plan

    directory = Path(args.output_dir)
    directory.mkdir(parents=True, exist_ok=True)
    reference = load_reference(args.reference)
    save_wav(directory / "reference_8bit_15625.wav", reference)
    baseline = Path(args.baseline).read_bytes() if args.baseline else None
    rows = []
    for frame in args.block_sizes:
        print(
            f"Building mixed candidates, frame={frame}, beam={args.beam_width}",
            flush=True,
        )
        stamp = time.perf_counter()

        def progress(done, total):
            nonlocal stamp
            if time.perf_counter() - stamp >= 20:
                print(f"  {100 * done / total:.1f}%", flush=True)
                stamp = time.perf_counter()

        cache_root = (
            Path(args.candidate_cache_dir) if args.candidate_cache_dir else directory
        )
        fmt, bank, timing = build_mixed_bank(
            reference,
            frame,
            args.beam_width,
            baseline,
            cache_root / f"bank_f{frame}_b{args.beam_width}",
            progress,
        )
        for target in args.targets:
            before = time.perf_counter()
            plan, allocation = allocate(
                bank,
                reference,
                frame,
                target,
                len(fmt.header()),
                args.quiet_weight,
                args.quiet_threshold,
                args.max_frame_rmse,
                args.max_peak,
                args.boundary_weight,
            )
            data, simulation = serialize_plan(fmt, bank, plan)
            elapsed = time.perf_counter() - before
            name = f"mixed_f{frame}_target{target:.2f}"
            mode_counts = {
                label: int(np.sum(plan == index))
                for index, label in enumerate(("hold", "one", "two"))
            }
            row, _ = measure(
                directory,
                name,
                "mixed",
                data,
                reference,
                elapsed,
                {**timing, **allocation, "frame_type_counts": mode_counts},
                simulation,
            )
            rows.append(row)
            print(
                f"{name}: {row['bits_per_output_sample']:.6f} bps, RMSE {row['rmse']:.4f}; {mode_counts}",
                flush=True,
            )
            save_report(
                directory,
                reference,
                rows,
                "Mixed one/two-bit predictive rate allocation",
            )
    return rows


def transform_experiment(args):
    from .experiment import save_wav
    from .mixed import allocate
    from .transforms import build_transform_bank, serialize_transform

    directory = Path(args.output_dir)
    directory.mkdir(parents=True, exist_ok=True)
    reference = load_reference(args.reference)
    if args.seconds is not None:
        if args.seconds <= 0 or not np.isfinite(args.seconds):
            raise ValueError("excerpt seconds must be positive and finite")
        reference = reference[: round(args.seconds * RATE)]
    save_wav(directory / "reference_8bit_15625.wav", reference)
    rows = []
    for family_name in args.families:
        family = "subband" if family_name == "subband" else "haar"
        block = 16 if family_name == "haar16" else 8
        print(
            f"Building {family_name}, frame={args.frame_size}, beam={args.beam_width}, effort={args.effort}",
            flush=True,
        )
        stamp = time.perf_counter()

        def progress(done, total):
            nonlocal stamp
            if time.perf_counter() - stamp >= 20:
                print(f"  {100 * done / total:.1f}%", flush=True)
                stamp = time.perf_counter()

        fmt, bank, timing = build_transform_bank(
            reference,
            family,
            args.frame_size,
            block,
            args.beam_width,
            1 if args.effort == "thorough" else 0,
            directory
            / f"bank_{family_name}_f{args.frame_size}_b{args.beam_width}_{args.effort}",
            progress,
        )
        for target in args.targets:
            before = time.perf_counter()
            plan, details = allocate(
                bank, reference, args.frame_size, target, timing["prefix_bytes"]
            )
            data, simulation = serialize_transform(fmt, bank, plan, block)
            elapsed = time.perf_counter() - before
            name = f"{family_name}_f{args.frame_size}_target{target:.2f}_{args.effort}"
            labels = {}
            for options, choice in zip(bank, plan):
                label = options[int(choice)].label
                labels[label] = labels.get(label, 0) + 1
            row, _ = measure(
                directory,
                name,
                family_name,
                data,
                reference,
                elapsed,
                {
                    **timing,
                    **details,
                    "configuration_counts": labels,
                    "transform_block_size": 2 if family == "subband" else block,
                    "effort": args.effort,
                    "excerpt_seconds": args.seconds,
                    "clipping_count_scope": "final PCM8 output clamps; internal low/DC predictor clamps excluded",
                },
                simulation,
            )
            rows.append(row)
            print(
                f"{name}: {row['bits_per_output_sample']:.6f} bps, RMSE {row['rmse']:.4f}",
                flush=True,
            )
            save_report(
                directory, reference, rows, "Integer transform and subband comparisons"
            )
    return rows
