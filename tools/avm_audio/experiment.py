"""Audio preparation, reproducible CLI, listening assets and measurements."""

from __future__ import annotations

import argparse
import csv
import hashlib
import html
import io
import json
import math
import platform
import shutil
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

import numpy as np
import scipy
from scipy.io import wavfile
from scipy.signal import resample_poly, stft

from .codecs import (
    ADPCM_STEPS,
    HEADER,
    NAMES,
    RATE,
    STEPS,
    decode,
    encode,
    iter_native,
    iter_output,
    read_format,
)


def quantize(values):
    """Round to nearest, ties to even, then saturate; units are signed PCM8."""
    return np.clip(np.rint(values), -128, 127).astype(np.int8)


def preprocess(path, normalize=False, seconds=None, start=0.0):
    try:
        import soundfile as sf

        audio, rate = sf.read(path, dtype="float64", always_2d=True)
        backend = f"soundfile {sf.__version__}"
    except (ImportError, RuntimeError, ValueError):
        if not shutil.which("ffmpeg") or not shutil.which("ffprobe"):
            raise ValueError(
                "input format needs soundfile support or ffmpeg/ffprobe on PATH"
            )
        probe = subprocess.run(
            [
                "ffprobe",
                "-v",
                "error",
                "-select_streams",
                "a:0",
                "-show_entries",
                "stream=sample_rate,channels",
                "-of",
                "json",
                str(path),
            ],
            check=True,
            capture_output=True,
            text=True,
        )
        info = json.loads(probe.stdout)["streams"][0]
        rate, channels = int(info["sample_rate"]), int(info["channels"])
        result = subprocess.run(
            [
                "ffmpeg",
                "-v",
                "error",
                "-i",
                str(path),
                "-map",
                "0:a:0",
                "-f",
                "f64le",
                "-acodec",
                "pcm_f64le",
                "-",
            ],
            check=True,
            capture_output=True,
        )
        audio = np.frombuffer(result.stdout, dtype="<f8").reshape(-1, channels)
        backend = "ffmpeg float64 decode"
    original_frames, channels = audio.shape
    if not np.isfinite(audio).all():
        raise ValueError("source contains nonfinite samples")
    audio = audio[round(start * rate) :]
    if seconds is not None:
        audio = audio[: round(seconds * rate)]
    # Equal channel weights preserve stereo headroom and avoid implicit normalization.
    mono = audio.mean(axis=1)
    gain = 1.0
    if normalize and len(mono) and np.max(np.abs(mono)):
        gain = (127 / 128) / float(np.max(np.abs(mono)))
        mono *= gain
    divisor = math.gcd(rate, RATE)
    converted = (
        resample_poly(mono, RATE // divisor, rate // divisor) if len(mono) else mono
    )
    reference = quantize(converted * 128)
    metadata = {
        "source": str(Path(path).resolve()),
        "source_sha256": hashlib.sha256(Path(path).read_bytes()).hexdigest(),
        "source_rate": rate,
        "source_channels": channels,
        "source_frames": original_frames,
        "decoded_source_duration_seconds": original_frames / rate,
        "decoder_backend": backend,
        "excerpt_start_seconds": start,
        "excerpt_limit_seconds": seconds,
        "normalization_gain": gain,
        "downmix": "arithmetic mean of channels",
        "resampler": "scipy.signal.resample_poly, default Kaiser FIR",
        "quantization": "multiply by 128, nearest ties-to-even, clamp [-128,127]",
        "output_rate": RATE,
        "output_samples": len(reference),
        "output_duration_seconds": len(reference) / RATE,
        "reference_sha256": hashlib.sha256(reference.tobytes()).hexdigest(),
    }
    return reference, metadata


def half_rate(reference):
    return (
        quantize(resample_poly(reference.astype(np.float64), 1, 2))
        if len(reference)
        else reference.copy()
    )


def upsample(samples, count, method):
    if not len(samples):
        return np.empty(0, np.int8)
    result = np.repeat(samples, 2)[:count]
    if method == "linear":
        result[1 : 2 * (len(samples) - 1) : 2] = (
            samples[:-1].astype(np.int16) + samples[1:].astype(np.int16)
        ) // 2
    return result


def save_wav(path, samples):
    wavfile.write(path, RATE, samples.astype(np.int16) * 256)


def errors(reference, actual):
    if len(reference) != len(actual):
        raise ValueError("comparison sample count mismatch")
    if not len(reference):
        return {
            "rmse": 0.0,
            "mae": 0.0,
            "snr_db": None,
            "snr_status": "empty",
            "max_absolute_error": 0,
        }
    difference = reference.astype(np.float64) - actual.astype(np.float64)
    mse = float(np.mean(difference**2))
    power = float(np.mean(reference.astype(np.float64) ** 2))
    status = (
        "finite" if mse and power else ("exact" if mse == 0 else "silent_reference")
    )
    snr = 10 * math.log10(power / mse) if mse and power else None
    return {
        "rmse": math.sqrt(mse),
        "mae": float(np.mean(np.abs(difference))),
        "snr_db": snr,
        "snr_status": status,
        "max_absolute_error": int(np.max(np.abs(difference))),
    }


def boundary_metrics(reference, actual, frame_size):
    points = np.arange(frame_size, len(reference), frame_size)
    if not len(points):
        return {
            "boundary_count": 0,
            "boundary_jump_mean": 0.0,
            "boundary_jump_max": 0,
            "boundary_excess_rmse": 0.0,
        }
    ref = reference.astype(np.int16)
    rec = actual.astype(np.int16)
    jumps = rec[points] - rec[points - 1]
    excess = jumps - (ref[points] - ref[points - 1])
    return {
        "boundary_count": len(points),
        "boundary_jump_mean": float(np.mean(np.abs(jumps))),
        "boundary_jump_max": int(np.max(np.abs(jumps))),
        "boundary_excess_rmse": float(np.sqrt(np.mean(excess.astype(np.float64) ** 2))),
    }


def local_diagnostics(reference, actual):
    if not len(reference):
        return {
            "quiet_samples": 0,
            "quiet_rmse": None,
            "silence_samples": 0,
            "silence_rmse": None,
        }
    difference = reference.astype(np.float64) - actual.astype(np.float64)
    result = {}
    for name, mask in (
        ("quiet", np.abs(reference.astype(np.int16)) <= 8),
        ("silence", reference == 0),
    ):
        result[f"{name}_samples"] = int(mask.sum())
        result[f"{name}_rmse"] = (
            float(np.sqrt(np.mean(difference[mask] ** 2))) if mask.any() else None
        )
    return result


def make_plots(directory, reference, reconstructions):
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    if not len(reference) or not reconstructions:
        return
    # Pick the first 30 ms in the loudest one-second region, also useful for quiet intros.
    window = RATE
    energy = [
        np.mean(reference[i : i + window].astype(float) ** 2)
        for i in range(0, len(reference), window)
    ]
    begin = int(np.argmax(energy)) * window
    stop = min(len(reference), begin + 470)
    t = np.arange(begin, stop) / RATE
    rows = len(reconstructions)
    fig, axes = plt.subplots(rows, 2, figsize=(13, 2.1 * rows), squeeze=False)
    for (name, reconstruction), (left, right) in zip(reconstructions.items(), axes):
        left.plot(t, reference[begin:stop], color="black", lw=1, label="PCM8 reference")
        left.plot(t, reconstruction[begin:stop], alpha=0.8, lw=0.9, label=name)
        left.legend(fontsize=7, loc="upper right")
        left.set_ylabel("PCM8")
        right.plot(
            t, reconstruction[begin:stop].astype(float) - reference[begin:stop], lw=0.8
        )
        right.set_title(f"{name}: reconstruction error", fontsize=8)
        right.set_ylabel("PCM8 error")
    axes[-1, 0].set_xlabel("Time (seconds)")
    axes[-1, 1].set_xlabel("Time (seconds)")
    fig.tight_layout()
    fig.savefig(directory / "waveforms_and_errors.png", dpi=130)
    plt.close(fig)
    signals = {"reference": reference, **reconstructions}
    fig, axes = plt.subplots(
        len(signals), 1, figsize=(12, 2 * len(signals)), squeeze=False
    )
    segment = min(512, len(reference))
    if segment >= 2:
        for ax, (name, values) in zip(axes[:, 0], signals.items()):
            frequency, times, spectrum = stft(
                values.astype(float) / 128, RATE, nperseg=segment, noverlap=segment // 2
            )
            db = 20 * np.log10(np.maximum(np.abs(spectrum), 1e-6))
            ax.pcolormesh(
                times, frequency, db, vmin=-90, vmax=0, shading="auto", cmap="magma"
            )
            ax.set_title(name, fontsize=9)
            ax.set_ylabel("Hz")
        axes[-1, 0].set_xlabel("Time (seconds); all panels use -90..0 dBFS")
        fig.tight_layout()
        fig.savefig(directory / "spectrograms.png", dpi=120)
    plt.close(fig)
    fig, ax = plt.subplots(figsize=(10, 4))
    for name, values in reconstructions.items():
        error = values.astype(np.int16) - reference.astype(np.int16)
        hist = np.bincount(error + 255, minlength=511)
        ax.plot(np.arange(-255, 256), hist / len(error), label=name)
    ax.set_yscale("log")
    ax.set_xlabel("Reconstructed minus reference (PCM8)")
    ax.set_ylabel("Fraction of samples")
    ax.legend(fontsize=7)
    fig.tight_layout()
    fig.savefig(directory / "error_distribution.png", dpi=130)
    plt.close(fig)


def write_reports(directory, metadata, rows, arguments):
    report = {
        "format_version": 1,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "input": metadata,
        "command": sys.argv,
        "parameters": arguments,
        "environment": {
            "python": platform.python_version(),
            "numpy": np.__version__,
            "scipy": scipy.__version__,
        },
        "measurements": rows,
    }
    (directory / "metrics.json").write_text(
        json.dumps(report, indent=2, allow_nan=False), encoding="utf-8"
    )
    flattened = [
        {
            k: json.dumps(v, sort_keys=True) if isinstance(v, dict) else v
            for k, v in row.items()
        }
        for row in rows
    ]
    if rows:
        fields = list(dict.fromkeys(k for row in flattened for k in row))
        with (directory / "metrics.csv").open(
            "w", newline="", encoding="utf-8"
        ) as file:
            writer = csv.DictWriter(file, fieldnames=fields)
            writer.writeheader()
            writer.writerows(flattened)
    lines = [
        f"# Codec evaluation: {Path(metadata['source']).name}",
        "",
        (
            f"Reference: {metadata['output_samples']:,} signed PCM8 samples at {RATE:,} Hz; "
            f"{metadata['output_duration_seconds']:.6f} seconds. Normalization gain: {metadata['normalization_gain']:.6g}."
        ),
        "",
        (
            "All primary metrics compare decoded serialized streams with the same quantized reference. "
            "Runtime numbers are host measurements, not AVR cycles. Encoder timing includes compilation on a cold JIT cache."
        ),
        "",
        "| Configuration | Bytes | bits/output sample | RMSE | MAE | SNR dB | Boundary excess RMSE | Encode s | Decode s |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        snr = f"{row['snr_db']:.2f}" if row["snr_db"] is not None else row["snr_status"]
        bps = (
            f"{row['bits_per_output_sample']:.4f}"
            if row["bits_per_output_sample"] is not None
            else "n/a"
        )
        lines.append(
            f"| {row['name']} | {row['compressed_bytes']:,} | {bps} | {row['rmse']:.3f} | "
            f"{row['mae']:.3f} | {snr} | {row['boundary_excess_rmse']:.3f} | "
            f"{row['encoder_seconds']:.3f} | {row['decoder_host_seconds']:.3f} |"
        )
    if rows:
        best = min(rows, key=lambda row: row["rmse"])
        lines += [
            "",
            f"Best measured RMSE in this run: **{best['name']}** ({best['rmse']:.3f} PCM8 units).",
            "",
            "No subjective listening ranking has been assigned. Use comparison.html or the WAV files to audition the results.",
            "",
            "Predictor selections (0=previous, 1=linear, 2=half slope):",
        ]
        for row in rows:
            if row["codec"] == 3:
                lines.append(f"- {row['name']}: {row['predictor_frame_counts']}")
        lines += [
            "",
            (
                "Quiet/silence masks use reference samples with |value| <= 8 / value == 0; "
                "these are local diagnostics, not classifications of sustained quiet passages."
            ),
            (
                "Candidate 4 separately reports error against bandwidth-only hold/linear references and "
                "native half-rate PCM8. Bandwidth and quantization errors are correlated; their MSEs need not add."
            ),
            (
                "Saturated samples count actual decoder clamping before upsampling; endpoint samples are separate. "
                "A held low-rate saturated sample is counted once."
            ),
        ]
    (directory / "summary.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    players = [
        '<h2>Common PCM8 reference</h2><audio controls preload="none" src="reference_8bit_15625.wav"></audio>'
    ]
    for row in rows:
        if row.get("wav"):
            players.append(
                f"<h2>{html.escape(row['name'])}</h2><p>RMSE {row['rmse']:.3f}; "
                f"{row['bits_per_output_sample'] or 0:.4f} bits/sample</p>"
                f'<audio controls preload="none" src="{html.escape(row["wav"], quote=True)}"></audio>'
            )
    page = (
        '<!doctype html><meta charset="utf-8"><title>AVM codec comparison</title>'
        "<style>body{font:16px system-ui;max-width:1100px;margin:2em auto;padding:0 1em;background:#fafafa}"
        "audio{width:100%}img{max-width:100%}h2{font-size:18px;margin-top:2em}</style>"
        f"<h1>{html.escape(Path(metadata['source']).name)}</h1><p>15,625 Hz, identical length; no playback normalization.</p>"
        + "\n".join(players)
    )
    for name in (
        "waveforms_and_errors.png",
        "spectrograms.png",
        "error_distribution.png",
    ):
        if (directory / name).exists():
            page += f'<p><img src="{name}" alt="{name}"></p>'
    (directory / "comparison.html").write_text(page, encoding="utf-8")


def evaluate(args):
    directory = Path(args.output_dir)
    directory.mkdir(parents=True, exist_ok=True)
    reference, metadata = preprocess(
        args.input, args.normalize, args.seconds, args.start
    )
    low = half_rate(reference)
    save_wav(directory / "reference_8bit_15625.wav", reference)
    bandwidth = {
        kind: upsample(low, len(reference), kind) for kind in ("hold", "linear")
    }
    for kind, values in bandwidth.items():
        save_wav(directory / f"bandwidth_only_{kind}.wav", values)
    (directory / "input.json").write_text(
        json.dumps(metadata, indent=2), encoding="utf-8"
    )
    rows = []
    primary = {}
    configurations = [
        (frame, method, codec)
        for frame in args.block_sizes
        for method in args.methods
        for codec in args.codecs
    ]
    for number, (frame, method, codec) in enumerate(configurations, 1):
        if method == "exact" and codec != 1:
            continue
        width = 1 if method == "greedy" else args.beam_width
        method_name = method if method != "beam" else f"beam{width}"
        variation = "_sampleadapt" if codec == 2 and args.sample_adaptation else ""
        name = f"candidate{codec}_{NAMES[codec]}_f{frame}_{method_name}{variation}"
        binary = directory / f"{name}.avac"
        configuration = {
            "codec": codec,
            "frame_size": frame,
            "method": method,
            "beam_width": width,
            "sample_adaptation": codec == 2 and args.sample_adaptation,
            "boundary_penalty": args.boundary_penalty,
            "steps": args.adpcm_steps if codec == 4 else args.steps,
            "reference_sha256": metadata["reference_sha256"],
        }
        manifest = directory / f"{name}.config.json"
        print(
            f"[{number}/{len(configurations)}] {name}: {len(reference):,} output samples",
            flush=True,
        )
        progress_time = time.perf_counter()

        def progress(done, total):
            nonlocal progress_time
            now = time.perf_counter()
            if now - progress_time >= 20:
                print(f"  {100 * done / total:.1f}% encoded", flush=True)
                progress_time = now

        if args.reuse and binary.exists():
            data = binary.read_bytes()
            _check, fmt, _ = decode(data)
            if (fmt.codec, fmt.frame_size, fmt.sample_count, fmt.sample_adaptation) != (
                codec,
                frame,
                len(reference),
                codec == 2 and args.sample_adaptation,
            ):
                raise ValueError(f"cached format mismatch: {binary}")
            if (
                not manifest.exists()
                or json.loads(manifest.read_text()) != configuration
            ):
                raise ValueError(
                    "cached input or configuration mismatch; remove --reuse"
                )
            encoder_seconds, simulated = 0.0, None
        else:
            before = time.perf_counter()
            data, simulated = encode(
                low if codec == 4 else reference,
                codec,
                frame,
                width,
                method,
                steps=configuration["steps"],
                sample_adaptation=codec == 2 and args.sample_adaptation,
                boundary_penalty=args.boundary_penalty,
                output_count=len(reference),
                progress=progress,
            )
            encoder_seconds = time.perf_counter() - before
            binary.write_bytes(data)
            manifest.write_text(json.dumps(configuration, indent=2), encoding="utf-8")
        # Exercise the bytes actually written to disk, including headers and padding.
        data = binary.read_bytes()
        stream = io.BytesIO(data)
        fmt = read_format(stream)
        if simulated is not None:
            native = np.fromiter(iter_native(stream, fmt), dtype=np.int8)
            if not np.array_equal(native, simulated):
                raise AssertionError(
                    f"serialized decoder disagrees with encoder simulation: {name}"
                )
        kinds = ("hold", "linear") if codec == 4 else ("native",)
        for kind in kinds:
            before = time.perf_counter()
            reconstruction, fmt, stats = decode(data, kind if codec == 4 else "hold")
            decoder_seconds = time.perf_counter() - before
            full_name = f"{name}_{kind}" if codec == 4 else name
            wav_name = f"{full_name}.wav" if args.artifacts != "compressed" else None
            if wav_name:
                save_wav(directory / wav_name, reconstruction)
            row = {
                "name": full_name,
                "codec": codec,
                "frame_size": frame,
                "method": method,
                "beam_width": width,
                "compressed_file": binary.name,
                "wav": wav_name,
                "compressed_bytes": len(data),
                "file_header_bytes": HEADER.size + len(fmt.steps),
                "bits_per_output_sample": 8 * len(data) / len(reference)
                if len(reference)
                else None,
                "compression_ratio_vs_pcm8": len(reference) / len(data),
                **errors(reference, reconstruction),
                **boundary_metrics(reference, reconstruction, frame),
                **local_diagnostics(reference, reconstruction),
                "saturated_samples": stats.saturated_samples,
                "endpoint_samples": stats.endpoint_samples,
                "encoder_seconds": encoder_seconds,
                "encoder_reused": simulated is None,
                "decoder_host_seconds": decoder_seconds,
                "predictor_frame_counts": stats.modes,
                "initial_scale_frame_counts": stats.initial_scales,
            }
            native_count = (len(reference) + 1) // 2 if codec == 4 else len(reference)
            native_frame = frame // 2 if codec == 4 else frame
            frames = (native_count + native_frame - 1) // native_frame
            symbol_bits = (native_count - frames) * (4 if codec == 4 else 2)
            row.update(
                frame_header_bytes=frames * 2,
                residual_symbol_bits=symbol_bits,
                padding_bits=(len(data) - row["file_header_bytes"] - frames * 2) * 8
                - symbol_bits,
            )
            if codec == 4:
                row["bandwidth_only_error"] = errors(reference, bandwidth[kind])
                row["quantization_error_vs_bandlimited_output"] = errors(
                    bandwidth[kind], reconstruction
                )
                stream = io.BytesIO(data)
                native = np.fromiter(
                    iter_native(stream, read_format(stream)), dtype=np.int8
                )
                row["quantization_error_native_half_rate"] = errors(low, native)
            rows.append(row)
            if wav_name and frame == args.block_sizes[0] and method == args.methods[-1]:
                simple_name = f"candidate{codec}_{NAMES[codec]}" + (
                    f"_{kind}" if codec == 4 else ""
                )
                save_wav(directory / f"{simple_name}.wav", reconstruction)
                primary[simple_name] = reconstruction
            print(
                f"  {full_name}: RMSE {row['rmse']:.3f}, {row['bits_per_output_sample'] or 0:.4f} bits/sample",
                flush=True,
            )
        write_reports(directory, metadata, rows, vars(args))
    if args.plots and args.artifacts != "compressed":
        make_plots(directory, reference, primary)
    write_reports(directory, metadata, rows, vars(args))
    print(f"Results: {directory.resolve()}", flush=True)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    from .frontier import add_commands

    add_commands(commands)
    run = commands.add_parser(
        "evaluate", help="preprocess, encode, serialize, decode and measure"
    )
    run.add_argument("input")
    run.add_argument("--output-dir", required=True)
    run.add_argument(
        "--codecs", type=int, nargs="+", choices=range(1, 5), default=[1, 2, 3, 4]
    )
    run.add_argument("--block-sizes", type=int, nargs="+", default=[128])
    run.add_argument(
        "--methods",
        nargs="+",
        choices=["greedy", "beam", "exact"],
        default=["greedy", "beam"],
    )
    run.add_argument("--beam-width", type=int, default=16)
    run.add_argument(
        "--steps",
        type=int,
        nargs="+",
        default=list(STEPS),
        help="step table for codecs 1..3",
    )
    run.add_argument("--adpcm-steps", type=int, nargs="+", default=list(ADPCM_STEPS))
    run.add_argument("--normalize", action="store_true")
    run.add_argument("--start", type=float, default=0)
    run.add_argument(
        "--seconds",
        type=float,
        help="explicit excerpt duration; default is complete file",
    )
    run.add_argument(
        "--sample-adaptation",
        action="store_true",
        help="secondary codec-2 per-symbol scale rule",
    )
    run.add_argument("--boundary-penalty", type=float, default=0)
    run.add_argument("--artifacts", choices=["all", "compressed"], default="all")
    run.add_argument("--plots", action=argparse.BooleanOptionalAction, default=True)
    run.add_argument(
        "--reuse",
        action="store_true",
        help="reuse matching named streams and regenerate WAVs/reports",
    )
    dec = commands.add_parser("decode", help="decode using only a compressed AVAC file")
    dec.add_argument("input")
    dec.add_argument("output")
    dec.add_argument("--upsample", choices=["hold", "linear"], default="linear")
    commands.add_parser("formats", help="list supported version and parameter tables")
    args = parser.parse_args(argv)
    if hasattr(args, "experiment"):
        args.experiment(args)
    elif args.command == "formats":
        from .entropy import BOOKS
        from .transforms import PATTERNS

        print(
            json.dumps(
                {
                    "version": 1,
                    "rate": RATE,
                    "codecs": NAMES,
                    "steps": STEPS,
                    "adpcm_steps": ADPCM_STEPS,
                    "header_bytes_without_table": HEADER.size,
                    "extensions": {
                        "magic": "AVAX",
                        "version": 1,
                        "codecs": {
                            5: "entropy",
                            6: "mixed_predictive",
                            7: "two_band",
                            8: "integer_haar",
                        },
                        "canonical_huffman_lengths": BOOKS,
                        "haar_allocation_patterns": PATTERNS,
                    },
                },
                indent=2,
            )
        )
    elif args.command == "decode":
        # WAV output can be streamed; the entire compressed file is never loaded here.
        import wave

        with open(args.input, "rb") as source:
            magic = source.read(4)
            source.seek(0)
            if magic == b"AVAX":
                from .extended import iter_extended, read_extended

                fmt = read_extended(source)
                samples = iter_extended(source, fmt)
            else:
                fmt = read_format(source)
                samples = iter_output(source, fmt, args.upsample)
            with wave.open(args.output, "wb") as destination:
                destination.setparams(
                    (1, 2, RATE, fmt.sample_count, "NONE", "not compressed")
                )
                buffer = bytearray()
                for value in samples:
                    buffer += int(value * 256).to_bytes(2, "little", signed=True)
                    if len(buffer) >= 8192:
                        destination.writeframesraw(buffer)
                        buffer.clear()
                destination.writeframesraw(buffer)
        print(f"Decoded {fmt.sample_count:,} samples to {args.output}")
    else:
        if (
            args.start < 0
            or not math.isfinite(args.start)
            or (
                args.seconds is not None
                and (args.seconds <= 0 or not math.isfinite(args.seconds))
            )
        ):
            parser.error(
                "start must be nonnegative and seconds must be positive and finite"
            )
        for frame in args.block_sizes:
            if not 2 <= frame <= 65534 or (4 in args.codecs and frame % 2):
                parser.error("frame sizes must be 2..65534 and even when using codec 4")
        evaluate(args)
