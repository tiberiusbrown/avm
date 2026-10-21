"""Deterministic, bounded optimization of Stage 1 Arrangement objects.

Every evaluated candidate is a deep copy, compiled with the production AVM audio
compiler and rendered after quantization. MIDI structure is never reconstructed
from score text. The evaluator and search are separate from synthesis/import.
"""
import hashlib
import math
import time
from collections import Counter
from copy import deepcopy
from dataclasses import asdict, dataclass, field

import numpy as np

try:
    from . import midi_to_avms as midi
    from .avm_audio_features import comparison_signal, extract, role_masks
    from .avm_audio_render import decode, render
except ImportError:
    import midi_to_avms as midi
    from avm_audio_features import comparison_signal, extract, role_masks
    from avm_audio_render import decode, render


@dataclass
class Weights:
    spectral: float = .65
    envelope: float = 1.1
    onset: float = .8
    pitch_structure: float = 1.2
    balance: float = .8
    preservation: float = .25
    clipping: float = 4.
    complexity: float = .025


@dataclass
class Config:
    rate: float = 15625.
    max_evaluations: int = 240
    max_seconds: float | None = None
    excerpt_start: float | None = None
    excerpt_duration: float = 12.
    optimize_effects: bool = True
    refine_harmony: bool = True
    minimum_improvement: float = .001
    weights: Weights = field(default_factory=Weights)


def snapshot(arrangement):
    return {"instruments": {k: asdict(v) for k, v in arrangement.instruments.items()},
            "voices": {str(ch): [asdict(n) for n in notes] for ch, notes in arrangement.voices.items()}}


def restore(baseline, saved):
    result = deepcopy(baseline)
    result.instruments = {k: midi.Instrument(**v) for k, v in saved["instruments"].items()}
    result.voices = {int(ch): [midi.ArrangedNote(**{**n, "sources": tuple(n["sources"]),
                           "effects": [midi.Effect(**e) for e in n["effects"]]}) for n in notes]
                     for ch, notes in saved["voices"].items()}
    return result


def structure(arrangement, channel):
    return [(n.pitch, n.start, n.end, n.sources) for n in arrangement.voices.get(channel, [])]


def valid_candidate(candidate, baseline):
    """Hard composition/mix safeguards, beyond the compiler's syntax checks."""
    if (candidate.duration, candidate.loop, candidate.meter) != (baseline.duration, baseline.loop, baseline.meter):
        return False
    if set(candidate.voices) != set(baseline.voices):
        return False
    for ch in range(4):
        notes = candidate.voices.get(ch, [])
        original = baseline.voices.get(ch, [])
        if len(notes) != len(original):
            return False  # No silent note deletion / phrase rewriting.
        if ch != 3 and structure(candidate, ch) != structure(baseline, ch):
            return False
        if ch == 3 and any((a.start, a.end, a.sources) != (b.start, b.end, b.sources) for a, b in zip(notes, original)):
            return False
        peak = max((n.volume for n in original), default=0)
        for note, old in zip(notes, original):
            if not 24 <= note.pitch <= 95 or not 0 <= note.volume <= 31 or not .55 <= note.gate <= 1:
                return False
            if ch in (0, 2) and note.gate < .8:
                return False
            if old.volume and note.volume < max(1, math.ceil(old.volume*.55)):
                return False
            if note.volume > max(peak*1.65, peak+2):
                return False
            base = [e for e in note.effects if e.kind in ("frequency_slide", "arpeggio", "glissando")]
            if len(base) > 1:
                return False
            keys = [(e.kind, e.parameters.get("target")) for e in note.effects]
            if len(keys) != len(set(keys)):
                return False
            if ch in (0, 2):
                # Source bends/arps remain intact; new pitch movement is limited
                # to quiet vibrato. No spectral-driven slides through the tune.
                old_base = [asdict(e) for e in old.effects if e.kind in ("frequency_slide", "arpeggio", "glissando")]
                if [asdict(e) for e in base] != old_base:
                    return False
            for e in note.effects:
                p = e.parameters
                if e.kind == "lfo" and p["target"] == "pitch" and (abs(p["depth"]) > 25 or p["period_ms"] < 120):
                    return False
                if e.kind == "lfo" and p["target"] == "duty" and (abs(p["depth"]) > 32 or p["period_ms"] < 160):
                    return False
    peaks = [max((min(n.volume, candidate.instruments[n.instrument].volume) for n in candidate.voices.get(ch, [])), default=0) for ch in range(4)]
    # Allow inherited loud inputs, but do not make their worst-case sum worse.
    old_sum = sum(max((n.volume for n in baseline.voices.get(ch, [])), default=0) for ch in range(4))
    if sum(peaks) > max(30, old_sum):
        return False
    if peaks[0] and peaks[1] > peaks[0]*1.2:
        return False
    for instrument in candidate.instruments.values():
        if not 0 <= instrument.duty <= 255 or not 0 <= instrument.volume <= 31:
            return False
    return True


def choose_windows(arrangement, config):
    duration = arrangement.duration+.004
    if config.excerpt_start is not None:
        if not 0 <= config.excerpt_start < duration:
            raise ValueError("Excerpt start is outside the song")
        return [(config.excerpt_start, min(config.excerpt_duration, duration-config.excerpt_start))]
    if duration <= config.excerpt_duration:
        return [(0., duration)]
    # Three deterministic representative blocks, one from each third, ranked
    # for roles, attacks and sustained notes. Instruments are shared globally.
    length = config.excerpt_duration/3
    windows = []
    for region in range(3):
        low = region*duration/3
        high = max(low, min((region+1)*duration/3, duration-length))
        candidates = np.linspace(low, high, 9)
        def quality(start):
            groups = [[n for n in notes if n.start < start+length and n.end > start]
                      for notes in arrangement.voices.values()]
            return sum(bool(g)*5 + min(16, len(g))*.15 + sum(n.end-n.start > .5 for n in g)*.2 for g in groups)
        start = float(max(candidates, key=quality))
        windows.append((start, min(length, duration-start)))
    return windows


def _distribution(values, axis=0):
    return values/(values.sum(axis=axis, keepdims=True)+1e-10)


class Evaluator:
    """Cached reference targets and configurable perceptual/physical objective."""
    def __init__(self, baseline, reference, song, config):
        self.baseline, self.config = deepcopy(baseline), config
        self.windows = choose_windows(baseline, config)
        self.targets, self.source_masks, self.output_masks = [], [], []
        chunks = [comparison_signal(reference[math.ceil(s*config.rate-1e-9):math.ceil((s+d)*config.rate-1e-9)], config.rate)
                  for s, d in self.windows]
        if not chunks or not sum(len(c) for c in chunks):
            raise ValueError("Empty analysis excerpt")
        self.reference_rms = float(np.sqrt(sum(np.dot(c, c) for c in chunks)/sum(len(c) for c in chunks)))
        if self.reference_rms < 1e-6:
            raise ValueError("Reference is silent in selected excerpts")
        for chunk, (start, _) in zip(chunks, self.windows):
            target = extract(chunk*.15/self.reference_rms, config.rate, prepared=True)
            self.targets.append(target)
            self.source_masks.append(role_masks(target, baseline, song, start))
            self.output_masks.append(role_masks(target, baseline, None, start))
        self.cache = {}
        self.baseline_audio_rms = None
        self.base_bytes = self.base_events = None

    def evaluate(self, arrangement):
        source, binary = midi.compile_arrangement(arrangement)
        digest = hashlib.sha256(binary).hexdigest()
        if digest in self.cache:
            return self.cache[digest], source, binary, True
        timeline = decode(binary)
        events = len(timeline)
        playback_seconds = timeline[-1].tick*.004
        if events/max(.004, playback_seconds) > 250:
            raise ValueError("Candidate exceeds 250 compiled events/second")
        renders = [render(binary, rate=self.config.rate, start=s, duration=d) for s, d in self.windows]
        analysis_audio = [comparison_signal(r.audio, self.config.rate) for r in renders]
        rms = float(np.sqrt(sum(np.dot(a, a) for a in analysis_audio)/sum(len(a) for a in analysis_audio)))
        if self.baseline_audio_rms is None:
            self.baseline_audio_rms, self.base_bytes, self.base_events = rms, len(binary), events
        if rms < max(1e-5, self.baseline_audio_rms*.6):
            raise ValueError("Candidate violates physical loudness floor")
        components = Counter()
        for target, reference_mask, output_mask, rendered, audio in zip(self.targets, self.source_masks, self.output_masks, renders, analysis_audio):
            candidate = extract(audio*.15/rms, self.config.rate, prepared=True)
            spectral = 0.
            for a, b in zip(candidate.spectra, target.spectra):
                # Compressed absolute magnitude plus independently normalized
                # spectral shape. A single bright harmonic cannot dominate.
                spectral += .5*np.mean(np.abs(np.log1p(a*100)-np.log1p(b*100)))
                spectral += .5*np.mean(np.sum(np.abs(_distribution(a)-_distribution(b)), axis=0))
            components["spectral"] += spectral/3
            components["envelope"] += float(np.mean(np.abs(candidate.rms-target.rms))/(np.mean(target.rms)+1e-8))
            components["onset"] += float(np.mean(np.abs(candidate.onset-target.onset))/(np.mean(target.onset)+.05))
            active = target.rms > target.rms.max(initial=0)*.02
            chroma = np.sum(np.abs(_distribution(candidate.chroma)-_distribution(target.chroma)), axis=0)
            components["pitch_structure"] += float(np.mean(chroma[active])) if active.any() else 0.
            ref_roles = (reference_mask*target.pitch[None, :, :]).sum(axis=1)
            avm_roles = (output_mask*candidate.pitch[None, :, :]).sum(axis=1)
            # Relative energy at MIDI/provenance masks: auxiliary estimates,
            # never an isolated voice matched against the unseparated mix.
            components["balance"] += float(np.abs(_distribution(avm_roles.sum(axis=1))-_distribution(ref_roles.sum(axis=1))).sum())
            for ch in (0, 2):
                a, b = avm_roles[ch], ref_roles[ch]
                if b.max(initial=0) > 1e-8:
                    components["pitch_structure"] += .2*float(np.mean(np.abs(a/(a.max(initial=0)+1e-8)-b/b.max())))
            metrics = rendered.metrics()
            components["clipping"] += metrics["clipping_fraction"]+min(1., metrics["longest_clipping_ms"]/100)*.1
        components = {key: float(value/len(renders)) for key, value in components.items()}
        ratios = []
        gate_changes = []
        for ch in range(4):
            for n, b in zip(arrangement.voices.get(ch, []), self.baseline.voices.get(ch, [])):
                if b.volume:
                    ratios.append(abs(math.log(max(1, n.volume)/b.volume)))
                gate_changes.append(abs(n.gate-b.gate))
        components["preservation"] = .1*float(np.mean(ratios or [0]))+.15*float(np.mean(gate_changes or [0]))
        effects = [e for notes in arrangement.voices.values() for n in notes for e in n.effects]
        unique = len({(e.kind, str(sorted(e.parameters.items()))) for e in effects})
        instruments = len({n.instrument for notes in arrangement.voices.values() for n in notes})
        components["complexity"] = .5*len(binary)/max(self.base_bytes, 1)+.3*events/max(self.base_events, 1)+.02*unique+.01*instruments
        weights = asdict(self.config.weights)
        loss = sum(components.get(k, 0.)*v for k, v in weights.items())
        result = {"loss": float(loss), "components": components, "compiled_bytes": len(binary),
                  "events": events, "updates_per_second": events/max(.004, playback_seconds),
                  "physical_ac_rms": rms, "comparison_gain": self.reference_rms/max(rms, 1e-12), "digest": digest,
                  "clipping_fraction": float(np.mean([r.metrics()["clipping_fraction"] for r in renders]))}
        self.cache[digest] = result
        return result, source, binary, False


def _set_effect(note, effect):
    """Replace by kind/target, never accumulate stale directives across trials."""
    key = (effect.kind, effect.parameters.get("target"))
    note.effects = [e for e in note.effects if (e.kind, e.parameters.get("target")) != key]
    note.effects.append(deepcopy(effect))


def _instrument_notes(a, name):
    return [n for notes in a.voices.values() for n in notes if n.instrument == name]


def _scale_role(a, baseline, channel, factor):
    for n, b in zip(a.voices[channel], baseline.voices[channel]):
        n.volume = min(31, max(1 if b.volume else 0, round(b.volume*factor)))
    for name in {n.instrument for n in a.voices[channel]}:
        a.instruments[name].volume = min(31, round(baseline.instruments[name].volume*factor))


def candidate_groups(stage, best, baseline, config):
    """Lazily yield coordinate groups (description, list of mutation functions)."""
    used = sorted({n.instrument for notes in best.voices.values() for n in notes},
                  key=lambda name: (-len(_instrument_notes(best, name)), name))
    if stage in ("mix", "refinement"):
        for ch in (0, 2, 1, 3):
            if best.voices.get(ch):
                old_peak = max(n.volume for n in baseline.voices[ch])
                current = max(n.volume for n in best.voices[ch])
                factors = (.75, 1.25, 1., .9, 1.1) if stage == "mix" else (
                    max(.55, (current-1)/max(1, old_peak)), min(1.65, (current+1)/max(1, old_peak)))
                yield f"channel {ch} volume", [(f"scale {factor}", lambda a, c=ch, f=factor: _scale_role(a, baseline, c, f)) for factor in factors]
        if stage == "refinement":
            for name in used:
                instrument = best.instruments[name]
                if instrument.wave == "pulse":
                    yield name+" local duty", [(str(v), lambda a, n=name, v=v: setattr(a.instruments[n], "duty", v))
                                              for v in (max(24, instrument.duty-8), min(192, instrument.duty+8))]
    elif stage == "timbre":
        for name in used:
            if best.instruments[name].wave == "pulse":
                yield name+" duty", [(str(d), lambda a, n=name, v=d: setattr(a.instruments[n], "duty", v)) for d in (128, 64, 96, 32, 48, 80, 192)]
            elif best.instruments[name].wave == "noise":
                def pitch(a, shift, name=name):
                    for n, b in zip(_instrument_notes(a, name), _instrument_notes(baseline, name)):
                        n.pitch = min(95, max(24, b.pitch+shift))
                yield name+" noise rate", [(str(s), lambda a, s=s, p=pitch: p(a, s)) for s in (-12, -5, 5, 12)]
    elif stage == "envelopes":
        # A compact reusable vocabulary; values are actual compiler breakpoints.
        shapes = [((0, 100),), ((0, 100), (48, 35)), ((0, 100), (96, 60)),
                  ((0, 100), (160, 40)), ((0, 100), (240, 70)),
                  ((0, 0), (24, 100), (160, 60)), ((0, 0), (48, 100), (240, 80)),
                  ((0, 30), (8, 100), (96, 70))]
        for name in used:
            yield name+" envelope", [(str(s), lambda a, n=name, s=s: setattr(a.instruments[n], "points", s)) for s in shapes]
            yield name+" release", [(str(v), lambda a, n=name, v=v: setattr(a.instruments[n], "release_ms", v)) for v in (0, 8, 24, 48)]
            def gate(a, value, name=name):
                for note in _instrument_notes(a, name):
                    note.gate = value
            minimum = .8 if any(n.channel in (0, 2) for n in _instrument_notes(best, name)) else .65
            yield name+" gate", [(str(v), lambda a, v=v, g=gate: g(a, v)) for v in (minimum, .95, 1.)]
    elif stage == "effects" and config.optimize_effects:
        for name in used:
            notes = _instrument_notes(best, name)
            sustained = any(n.end-n.start >= .45 for n in notes)
            noise = best.instruments[name].wave == "noise"
            proposals = []
            if sustained and not noise:
                for depth in (10, 20):
                    for period in (160, 240, 320):
                        proposals.append(midi.Effect("lfo", {"target": "pitch", "depth": depth, "period_ms": period, "wave": "sine"}))
                if best.instruments[name].wave == "pulse":
                    for to in (32, 64, 128):
                        proposals.append(midi.Effect("duty_slide", {"to": to, "over_ms": 240}))
                    proposals.append(midi.Effect("lfo", {"target": "duty", "depth": 16, "period_ms": 320, "wave": "triangle"}))
                proposals += [midi.Effect("lfo", {"target": "volume", "depth": 1, "period_ms": 240}),
                              midi.Effect("volume_slide", {"to": max(1, best.instruments[name].volume-2), "over_ms": 320})]
            if noise:
                proposals += [midi.Effect("noise_retrigger", {"every_ms": every, "seed": seed})
                              for every in (16, 32, 64) for seed in (1, 37)]
            def apply(a, effect, name=name, noise=noise):
                if effect.kind == "duty_slide":
                    # Static timbre fitting often lands at the slide's final
                    # duty. Search the starting duty jointly so modulation can
                    # recover an attack that the static coordinate erased.
                    a.instruments[name].duty = baseline.instruments[name].duty
                    a.instruments[name].points = baseline.instruments[name].points
                for note in _instrument_notes(a, name):
                    if noise or note.end-note.start >= .45:
                        _set_effect(note, effect)
            yield name+" expression", [(str(asdict(e)), lambda a, e=e, f=apply: f(a, e)) for e in proposals]
    elif stage == "harmony" and config.refine_harmony:
        for speed in (48, 96, 128):
            def arp(a, speed=speed):
                for n in a.voices.get(1, []):
                    for e in n.effects:
                        if e.kind == "arpeggio":
                            e.parameters["step_ms"] = speed
            yield "source chord arpeggio speed", [(str(speed), arp)]
        # Source-derived slides/glissandi only; endpoints must be represented
        # by a source chord. Never apply arbitrary pitch motion to lead/bass.
        for kind in ("frequency_slide", "glissando", "note_cut"):
            def articulation(a, kind=kind):
                for n in a.voices.get(1, []):
                    if kind == "note_cut":
                        _set_effect(n, midi.Effect(kind, {"after_ms": max(4, round((n.end-n.start)*850/4)*4)}))
                        continue
                    arp = next((e for e in n.effects if e.kind == "arpeggio"), None)
                    if not arp or n.end-n.start < .3:
                        continue
                    offsets = arp.parameters["offsets"]
                    top = max(offsets)
                    # Gliss is allowed only if every intervening semitone is in
                    # the source chord. This intentionally rejects most chords.
                    if top <= 0 or (kind == "glissando" and not set(range(top+1)).issubset(offsets)):
                        continue
                    n.effects = [e for e in n.effects if e.kind not in ("arpeggio", "frequency_slide", "glissando")]
                    if kind == "frequency_slide":
                        hz = 440*2**((n.pitch-69)/12)
                        effect = midi.Effect(kind, {"from_hz": hz, "to_hz": hz*2**(top/12), "over_ms": max(4, round((n.end-n.start)*1000/4)*4)})
                    else:
                        effect = midi.Effect(kind, {"direction": "up", "step": 1, "every_ms": max(4, round((n.end-n.start)*1000/top/4)*4)})
                    _set_effect(n, effect)
            yield "harmony "+kind, [(kind, articulation)]


@dataclass
class Result:
    arrangement: midi.Arrangement
    baseline: dict
    optimized: dict
    history: list
    evaluations: int
    runtime: float
    windows: list
    warnings: list


def optimize(baseline, reference, song, config=None, *, initial=None, progress=None):
    config = config or Config()
    if config.max_evaluations < 1 or config.excerpt_duration <= 0:
        raise ValueError("Evaluation budget and excerpt duration must be positive")
    started = time.monotonic()
    evaluator = Evaluator(baseline, reference, song, config)
    best = deepcopy(baseline)
    base_metrics, _, _, _ = evaluator.evaluate(best)
    metrics, evaluations = base_metrics, 1
    history = [{"evaluation": 1, "stage": "baseline", "loss": metrics["loss"], "accepted": True, "components": metrics["components"]}]
    messages = []
    if initial is not None and config.max_evaluations > 1:
        if not valid_candidate(initial, baseline):
            raise ValueError("Resume candidate violates baseline safeguards")
        candidate = deepcopy(initial)
        measured, _, _, cached = evaluator.evaluate(candidate)
        evaluations += not cached
        if measured["loss"] < metrics["loss"]:
            best, metrics = candidate, measured
    stages = ("mix", "timbre", "envelopes", "effects", "harmony", "refinement")
    allocations = (.14, .19, .29, .26, .06, .06)
    cumulative = 0.
    for stage, fraction in zip(stages, allocations):
        cumulative += fraction
        stage_limit = max(evaluations, round(config.max_evaluations*cumulative))
        groups = list(candidate_groups(stage, best, baseline, config))
        if progress:
            progress(stage, evaluations, metrics, best)
        # Round-robin coordinates avoids spending the entire budget on the
        # first instrument's release while later roles never get an envelope.
        for trial in range(max((len(options) for _, options in groups), default=0)):
            for description, options in groups:
                if trial >= len(options):
                    continue
                if evaluations >= stage_limit or evaluations >= config.max_evaluations:
                    break
                if config.max_seconds is not None and time.monotonic()-started >= config.max_seconds:
                    messages.append("Wall-clock budget reached; retained best compiled candidate")
                    return Result(best, base_metrics, metrics, history, evaluations, time.monotonic()-started, evaluator.windows, messages)
                label, mutate = options[trial]
                candidate = deepcopy(best)
                mutate(candidate)
                if not valid_candidate(candidate, baseline):
                    continue
                try:
                    measured, _, _, cached = evaluator.evaluate(candidate)
                except ValueError as error:
                    messages.append(f"Rejected {description}: {error}")
                    continue
                if cached:
                    continue
                evaluations += 1
                improvement = metrics["loss"]-measured["loss"]
                accepted = improvement > config.minimum_improvement*max(.1, metrics["loss"])
                # A near tie may replace an elaborate candidate with a smaller
                # one, but never allow a worse objective than the retained best.
                if 0 <= improvement and measured["compiled_bytes"] < metrics["compiled_bytes"]*.98:
                    accepted = True
                history.append({"evaluation": evaluations, "stage": stage, "coordinate": description, "candidate": label,
                                "loss": measured["loss"], "best_loss": min(metrics["loss"], measured["loss"]) if accepted else metrics["loss"],
                                "accepted": accepted, "components": measured["components"], "digest": measured["digest"]})
                if accepted:
                    best, metrics = candidate, measured
                    if progress:
                        progress(stage, evaluations, metrics, best)
    # Production compile/render again after final quantization, outside cache.
    evaluator.cache.clear()
    final, _, _, _ = evaluator.evaluate(deepcopy(best))
    if abs(final["loss"]-metrics["loss"]) > 1e-10:
        raise AssertionError("Final quantized candidate is not reproducible")
    return Result(best, base_metrics, final, history, evaluations, time.monotonic()-started, evaluator.windows, sorted(set(messages)))
