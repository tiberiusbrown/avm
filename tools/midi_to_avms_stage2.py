#!/usr/bin/env python3
"""Audio-guided MIDI-to-AVMS fitting (15,625 Hz previews by default)."""
import argparse
import hashlib
import json
import shutil
import sys
import time
from collections import Counter
from copy import deepcopy
from dataclasses import asdict, fields
from pathlib import Path

try:
    from . import avm_music
    from . import midi_to_avms as midi
    from .avm_audio_features import (
        aligned_audio,
        estimate_alignment,
        extract,
        load_reference,
    )
    from .avm_audio_optimize import (
        Config,
        Evaluator,
        Weights,
        optimize,
        restore,
        snapshot,
        structure,
    )
    from .avm_audio_render import RATES, render, write_wav
except ImportError:
    import avm_music
    import midi_to_avms as midi
    from avm_audio_features import (
        aligned_audio,
        estimate_alignment,
        extract,
        load_reference,
    )
    from avm_audio_optimize import (
        Config,
        Evaluator,
        Weights,
        optimize,
        restore,
        snapshot,
        structure,
    )
    from avm_audio_render import RATES, render, write_wav


def write_json(path, value):
    # Atomic checkpoint/report replacement; a failed candidate never destroys
    # the last complete best-state file.
    temporary = path.with_suffix(path.suffix+".tmp")
    temporary.write_text(json.dumps(value, indent=2, allow_nan=False)+"\n", encoding="utf-8")
    temporary.replace(path)


def discover_pairs(directory):
    groups = {}
    for path in sorted(directory.iterdir(), key=lambda p: p.name.casefold()):
        suffix = path.suffix.casefold()
        kind = "midi" if suffix in (".mid", ".midi") else "wav" if suffix == ".wav" else None
        if path.is_file() and kind:
            group = groups.setdefault(path.stem.casefold(), {})
            if kind in group:
                raise ValueError(f"Ambiguous case-insensitive {kind} basename: {path.stem}")
            group[kind] = path
    unmatched = [key for key, group in groups.items() if len(group) != 2]
    return [(g["midi"], g["wav"]) for g in groups.values() if len(g) == 2], unmatched


def arrangement_metrics(arrangement):
    return {"instruments": {key: asdict(value) for key, value in arrangement.instruments.items()
                            if any(n.instrument == key for notes in arrangement.voices.values() for n in notes)},
            "roles": {midi.ROLES[ch]: {"note_count": len(notes),
                      "peak_volume": max((n.volume for n in notes), default=0),
                      "mean_volume": sum(n.volume for n in notes)/max(1, len(notes)),
                      "duties": sorted({arrangement.instruments[n.instrument].duty for n in notes}),
                      "gates": sorted({n.gate for n in notes}),
                      "noise_pitches": sorted({n.pitch for n in notes}) if ch == 3 else []}
                      for ch, notes in sorted(arrangement.voices.items())},
            "effects": dict(Counter(e.kind for notes in arrangement.voices.values() for n in notes for e in n.effects)),
            "arpeggios": [asdict(e) for n in arrangement.voices.get(1, []) for e in n.effects if e.kind == "arpeggio"],
            "resources": {k: arrangement.report[k] for k in ("compiled_song_bytes", "compiler", "updates_per_second")}}


def comparison_plot(path, reference, baseline, optimized, rate, history, before, after, start, duration):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import numpy as np
    figure, axes = plt.subplots(3, 2, figsize=(14, 10), layout="constrained")
    lo, hi = round(start*rate), round((start+duration)*rate)
    # One common reference-recording gain for display; A/B are never normalized
    # independently. Files preserve the actual quantized output level.
    gain = np.sqrt(np.mean(baseline**2))/max(1e-12, np.sqrt(np.mean(reference**2)))
    features = [extract(a[lo:hi], rate) for a in (reference*gain, baseline, optimized)]
    for axis, feature, title in zip(axes[:, 0], features, ("Reference (display gain only)", "Stage 1", "Stage 2")):
        axis.pcolormesh(feature.times+start, feature.frequencies, 20*np.log10(feature.magnitude+1e-7),
                        vmin=-75, vmax=-15, cmap="magma", shading="auto")
        axis.set(title=title, ylabel="Hz", ylim=(0, min(6000, rate/2)))
    for feature, label in zip(features, ("Reference", "Stage 1", "Stage 2")):
        axes[0, 1].plot(feature.times+start, feature.rms, label=label, linewidth=.9)
    axes[0, 1].set(title="RMS envelopes (common display gain)", xlabel="seconds")
    axes[0, 1].legend()
    losses = [h["loss"] for h in history]
    best = np.minimum.accumulate(losses)
    axes[1, 1].plot(range(1, len(losses)+1), losses, ".", alpha=.3, label="Trials")
    axes[1, 1].plot(range(1, len(losses)+1), best, label="Best")
    axes[1, 1].set(title="Excerpt optimization", xlabel="evaluation", ylabel="weighted loss")
    keys = list(before["components"])
    positions = np.arange(len(keys))
    axes[2, 1].bar(positions-.18, [before["components"][k] for k in keys], width=.36, label="Stage 1")
    axes[2, 1].bar(positions+.18, [after["components"][k] for k in keys], width=.36, label="Stage 2")
    axes[2, 1].set_xticks(positions, keys, rotation=35, ha="right")
    axes[2, 1].set(title="Whole-song loss components (unweighted)")
    axes[2, 1].legend()
    figure.savefig(path, dpi=130)
    plt.close(figure)


def process_pair(midi_path, wav_path, output, settings, config, *, resume=False, render_only=False, analyze_only=False, plots=True):
    inputs = {midi_path.resolve(), wav_path.resolve()}
    generated = ("baseline.avms", "baseline.bin", "baseline.wav", "optimized.avms", "optimized.bin", "optimized.wav",
                 "reference.wav", "reference_aligned.wav", "checkpoint.json", "comparison.json", "comparison.png",
                 "optimization_history.json", "arrangement.json", "summary.json", "summary.md")
    if any((output/name).resolve() in inputs for name in generated):
        raise ValueError("Output files would overwrite an original input; choose a separate output directory")
    started = time.monotonic()
    output.mkdir(parents=True, exist_ok=True)
    song = midi.read_midi(midi_path)
    baseline = midi.arrange(song, settings)
    source, binary = midi.compile_arrangement(baseline)
    reference = load_reference(wav_path, config.rate)
    alignment = estimate_alignment(reference, song)
    duration = baseline.duration+.004
    # Cropping is inherited from Stage 1; account for that region in the
    # reference offset without changing MIDI's absolute onset alignment.
    target = aligned_audio(reference, duration, alignment["reference_offset_seconds"]+settings.start)
    messages = list(reference.metadata["warnings"])+alignment["warnings"]+baseline.report["warnings"]
    discrepancy = reference.metadata["duration"]-song.duration
    reference.metadata["duration_minus_midi_seconds"] = discrepancy
    if abs(discrepancy) > 1:
        messages.append(f"Reference duration differs from MIDI by {discrepancy:.3f}s; silence/tail retained in original reference")
    fingerprint = hashlib.sha256(midi_path.read_bytes()+wav_path.read_bytes()+
                    json.dumps({"objective_version": 2, "settings": asdict(settings), "rate": config.rate,
                                "config": {k: v for k, v in asdict(config).items() if k not in ("max_evaluations", "max_seconds")}}, sort_keys=True).encode()).hexdigest()
    checkpoint = output / "checkpoint.json"
    initial = None
    old_history = []
    previous_evaluations, previous_runtime = 0, 0.
    if resume and checkpoint.exists():
        saved = json.loads(checkpoint.read_text(encoding="utf-8"))
        if saved.get("fingerprint") != fingerprint:
            raise ValueError("Resume checkpoint does not match inputs/settings/rate/objective")
        initial = restore(baseline, saved["best"])
        if (output / "optimization_history.json").exists():
            old = json.loads((output / "optimization_history.json").read_text(encoding="utf-8"))
            old_history = old.get("history", [])
            previous_evaluations, previous_runtime = old.get("evaluations", 0), old.get("runtime_seconds", 0.)

    def progress(stage, count, metrics, best):
        print(f"{midi_path.stem}: {stage}, {count} renders, best {metrics['loss']:.5f}", flush=True)
        write_json(checkpoint, {"version": 1, "fingerprint": fingerprint, "best": snapshot(best),
                               "loss": metrics["loss"], "stage": stage, "evaluations": count})

    run_config = deepcopy(config)
    if render_only or analyze_only:
        run_config.max_evaluations = 1
        initial = None
    result = optimize(baseline, target, song, run_config, initial=initial, progress=progress)
    optimized = result.arrangement
    # Independent full-song check after fitting excerpts. All final results
    # are compiled and physically rendered again at the selected rate.
    full_config = deepcopy(config)
    full_config.excerpt_start = 0.
    full_config.excerpt_duration = duration
    full = Evaluator(baseline, target, song, full_config)
    full_before, _, _, _ = full.evaluate(deepcopy(baseline))
    full_after, _, _, _ = full.evaluate(deepcopy(optimized))
    resumed_best_retained = False
    if initial is not None:
        previous_full, _, _, _ = full.evaluate(deepcopy(initial))
        if previous_full["loss"] < full_after["loss"]:
            optimized, full_after = deepcopy(initial), previous_full
            resumed_best_retained = True
            messages.append("Additional excerpt sweep regressed against the saved full-song best; retained the saved arrangement")
    fallback = full_after["loss"] > full_before["loss"]+1e-10
    if fallback:
        messages.append("Excerpt fit regressed on the full song; exported the validated Stage 1 baseline")
        optimized, full_after = deepcopy(baseline), full_before
    # Clear large full-song feature arrays before preview/plot generation.
    del full
    opt_source, opt_binary = midi.compile_arrangement(optimized)
    baseline_render = render(binary, rate=config.rate, duration=duration)
    optimized_render = render(opt_binary, rate=config.rate, duration=duration)
    for name, score, data, rendered in (("baseline", source, binary, baseline_render),
                                       ("optimized", opt_source, opt_binary, optimized_render)):
        (output / (name+".avms")).write_text(score, encoding="utf-8", newline="\n")
        (output / (name+".bin")).write_bytes(data)
        write_wav(output / (name+".wav"), rendered.audio, config.rate)
    shutil.copyfile(wav_path, output / "reference.wav")
    write_wav(output / "reference_aligned.wav", target, config.rate)
    write_json(output / "arrangement.json", {"baseline": snapshot(baseline), "optimized": snapshot(optimized)})
    history = old_history + [{**h, "evaluation": h["evaluation"]+previous_evaluations} for h in result.history]
    write_json(output / "optimization_history.json", {"history": history,
               "evaluations": previous_evaluations+result.evaluations,
               "runtime_seconds": previous_runtime+result.runtime,
               "resume_note": "Each resume is an additional deterministic sweep from the saved best; compiler/render cache is per run"})
    if plots:
        start, length = result.windows[0]
        comparison_plot(output / "comparison.png", target, baseline_render.audio, optimized_render.audio,
                        config.rate, history, full_before, full_after, start, length)
    limitations = "Numerical perceptual similarity is not a listening judgment. Full-mix MIDI masks are approximate, not isolated stems; pulse spectra cannot reproduce sampled instruments. No measured piezo transfer function is assumed."
    preservation = {midi.ROLES[ch]: structure(baseline, ch) == structure(optimized, ch) for ch in (0, 1, 2)}
    report = {"song": midi_path.stem, "midi": str(midi_path), "reference": reference.metadata,
              "input_sha256": {"midi": hashlib.sha256(midi_path.read_bytes()).hexdigest(),
                               "wav": hashlib.sha256(wav_path.read_bytes()).hexdigest()},
              "rate": config.rate, "music_master": 128, "alignment": alignment,
              "weights": asdict(config.weights), "excerpts": result.windows,
              "baseline": full_before, "optimized": full_after,
              "improvement_percent": 100*(full_before["loss"]-full_after["loss"])/max(full_before["loss"], 1e-12),
              "excerpt_baseline": result.baseline, "excerpt_optimized": result.optimized,
              "full_song_fallback": fallback,
              "resumed_best_retained": resumed_best_retained,
              "audio": {"baseline": baseline_render.metrics(), "optimized": optimized_render.metrics()},
              "arrangement": {"baseline": arrangement_metrics(baseline), "optimized": arrangement_metrics(optimized)},
              "compiled_size_change_percent": 100*(len(opt_binary)-len(binary))/max(1, len(binary)),
              "protected_pitch_timing_sources_unchanged": preservation,
              "evaluations": previous_evaluations+result.evaluations, "optimization_runtime_seconds": previous_runtime+result.runtime,
              "total_runtime_seconds": time.monotonic()-started, "warnings": sorted(set(messages+result.warnings)),
              "limitations": limitations, "output_directory": str(output.resolve()),
              "mode": "analyze-only" if analyze_only else "render-only" if render_only else "optimize"}
    write_json(output / "comparison.json", report)
    # Save the final whole-song-validated result for resume, even after fallback.
    write_json(checkpoint, {"version": 1, "fingerprint": fingerprint, "best": snapshot(optimized), "loss": full_after["loss"]})
    # Retain explicit data needed for reviewing decisions; no source audio enters Git.
    return report


def summary_reports(output, reports, errors, unmatched):
    write_json(output / "summary.json", {"songs": reports, "errors": errors, "unmatched_basenames": unmatched})
    lines = ["# Stage 2 audio-guided arrangements", "", "All metrics compare final compiled A5 audio. Improvements are numerical, not subjective listening results.", "",
             "| Song | Rate | Baseline loss | Optimized loss | Change | Bytes before/after | Events before/after |", "|---|---:|---:|---:|---:|---:|---:|"]
    for r in reports:
        a, b = r["baseline"], r["optimized"]
        lines.append(f"| {r['song']} | {r['rate']:g} | {a['loss']:.4f} | {b['loss']:.4f} | {r['improvement_percent']:.2f}% | {a['compiled_bytes']} / {b['compiled_bytes']} | {a['events']} / {b['events']} |")
    lines += ["", "Melody, bass, harmony note pitches/onsets/offsets and provenance are protected. Harmony effects may change only using source-derived chords. Supplied reference.wav is copied unchanged; reference_aligned.wav is a resampled mono analysis preview. Baseline/optimized previews use identical master 128 without separate normalization.", ""]
    for r in reports:
        lines += [f"## {r['song']}", "", f"Outputs: `{r['output_directory']}`", "", r["limitations"], ""]
        lines += ["- "+w for w in r["warnings"]]
        lines.append("")
    lines += ["- "+e for e in errors]+["- Unmatched basename: "+u for u in unmatched]
    (output / "summary.md").write_text("\n".join(lines)+"\n", encoding="utf-8")


def parser():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("midi", type=Path, nargs="?")
    p.add_argument("reference", type=Path, nargs="?")
    p.add_argument("--input-dir", type=Path)
    p.add_argument("--output-dir", type=Path, default=Path("build/stage2"))
    p.add_argument("--rate", type=float, choices=RATES, default=15625.)
    p.add_argument("--max-evaluations", type=int, default=240)
    p.add_argument("--max-seconds", type=float)
    p.add_argument("--excerpt-start", type=float)
    p.add_argument("--excerpt-duration", type=float, default=12.)
    p.add_argument("--optimize-effects", action=argparse.BooleanOptionalAction, default=True)
    p.add_argument("--refine-harmony", action=argparse.BooleanOptionalAction, default=True)
    p.add_argument("--size-weight", type=float, default=.025)
    p.add_argument("--clipping-weight", type=float, default=4.)
    p.add_argument("--resume", action="store_true")
    p.add_argument("--render-only", action="store_true", help="MIDI+WAV: export baseline; AVMS/bin alone: render preview.wav")
    p.add_argument("--analyze-only", action="store_true", help="baseline comparison and reports, without search")
    p.add_argument("--no-percussion", action="store_true")
    p.add_argument("--no-plots", action="store_true")
    p.add_argument("--stats", action="store_true")
    p.add_argument("--preset", choices=midi.PRESETS, default="balanced")
    for field in fields(midi.Settings):
        name = field.name
        if name == "preset":
            continue
        default = getattr(midi.Settings(), name)
        flag = "--"+name.replace("_", "-")
        if name == "loop":
            p.add_argument(flag, action="store_true")
        elif name == "arpeggios":
            p.add_argument(flag, action=argparse.BooleanOptionalAction, default=None)
        elif name.endswith("_range"):
            p.add_argument(flag, type=int, nargs=2, default=default)
        else:
            integer = name.endswith(("_track", "_channel", "_octave", "_volume")) or name == "transpose"
            p.add_argument(flag, type=int if integer else float, default=default)
    return p


def main(argv=None):
    import math
    p = parser()
    args = p.parse_args(argv)
    try:
        if args.max_evaluations < 1 or not math.isfinite(args.excerpt_duration) or args.excerpt_duration <= 0:
            raise ValueError("Positive evaluation budget and excerpt duration required")
        for value in (args.size_weight, args.clipping_weight):
            if not math.isfinite(value) or value < 0:
                raise ValueError("Loss weights must be finite and nonnegative")
        if args.max_seconds is not None and (not math.isfinite(args.max_seconds) or args.max_seconds <= 0):
            raise ValueError("Wall-clock budget must be finite and positive")
        args.output_dir.mkdir(parents=True, exist_ok=True)
        if args.render_only and args.midi and args.midi.suffix.casefold() in (".avms", ".bin") and not args.reference:
            data = avm_music.compile_source(args.midi.read_text(encoding="utf-8")) if args.midi.suffix.casefold() == ".avms" else args.midi.read_bytes()
            rendered = render(data, rate=args.rate, duration=args.excerpt_duration, start=args.excerpt_start or 0.)
            write_wav(args.output_dir / "preview.wav", rendered.audio, args.rate)
            print(args.output_dir / "preview.wav")
            return 0
        if args.input_dir:
            if args.midi or args.reference:
                raise ValueError("Use positional MIDI/WAV or --input-dir, not both")
            pairs, unmatched = discover_pairs(args.input_dir)
        elif args.midi and args.reference:
            pairs, unmatched = [(args.midi, args.reference)], []
        else:
            raise ValueError("Provide a MIDI and reference WAV, or --input-dir")
        if not pairs:
            raise ValueError("No matching MIDI/WAV pairs found")
        settings = midi.Settings(**{f.name: getattr(args, f.name) for f in fields(midi.Settings)})
        if args.no_percussion:
            settings.percussion_density = 0
        config = Config(rate=args.rate, max_evaluations=args.max_evaluations, max_seconds=args.max_seconds,
                        excerpt_start=args.excerpt_start, excerpt_duration=args.excerpt_duration,
                        optimize_effects=args.optimize_effects, refine_harmony=args.refine_harmony,
                        weights=Weights(complexity=args.size_weight, clipping=args.clipping_weight))
        reports, errors = [], []
        for midi_path, wav_path in pairs:
            output = args.output_dir / midi_path.stem if args.input_dir else args.output_dir
            try:
                report = process_pair(midi_path, wav_path, output, settings, config, resume=args.resume,
                                      render_only=args.render_only, analyze_only=args.analyze_only, plots=not args.no_plots)
                reports.append(report)
                print(f"{midi_path.stem}: full-song loss {report['baseline']['loss']:.5f} -> {report['optimized']['loss']:.5f}, {report['improvement_percent']:.2f}%", flush=True)
            except (OSError, ValueError, EOFError) as error:
                errors.append(f"{midi_path.name}: {error}")
                print(errors[-1], file=sys.stderr)
        summary_reports(args.output_dir, reports, errors, unmatched)
        if args.stats:
            print(json.dumps({"songs": len(reports), "errors": errors, "summary": str(args.output_dir / "summary.md")}, indent=2))
        return 1 if errors else 0
    except (OSError, ValueError) as error:
        p.error(str(error))


if __name__ == "__main__":
    raise SystemExit(main())
