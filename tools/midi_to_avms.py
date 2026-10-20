#!/usr/bin/env python3
"""Arrange Standard MIDI Files for AVM's three pulse voices and noise voice.

Only MIDI import needs mido. Analysis, arrangement, orchestration and score
generation operate on dataclasses, independently of the MIDI parser/compiler.
See docs/midi_to_avms.md for policies, algorithms and approximation limits.
"""
import argparse
import json
import math
import statistics
import sys
from bisect import bisect_right
from collections import Counter, defaultdict, deque
from dataclasses import asdict, dataclass, field, replace
from pathlib import Path

try:
    from . import avm_music
except ImportError:
    import avm_music


TICK = 0.004
ROLES = {0: "melody", 1: "harmony", 2: "bass", 3: "percussion"}


@dataclass
class Tempo:
    tick: int
    time: float
    microseconds: int


@dataclass
class Meter:
    time: float
    numerator: int
    denominator: int
    beat: float


@dataclass
class Track:
    index: int
    name: str
    programs: list = field(default_factory=list)


@dataclass
class Control:
    time: float
    track: int
    channel: int
    number: int
    value: int


@dataclass
class Bend:
    time: float
    track: int
    channel: int
    cents: float


@dataclass
class Note:
    id: int
    pitch: int
    start: float
    end: float
    velocity: int
    track: int
    channel: int
    program: int
    beat: float
    key_end: float = 0.0


@dataclass
class Song:
    title: str
    duration: float
    notes: list[Note]
    tracks: list[Track]
    tempos: list[Tempo]
    meters: list[Meter]
    controls: list[Control] = field(default_factory=list)
    bends: list[Bend] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)


@dataclass
class Source:
    track: int
    channel: int
    name: str
    program: int
    count: int
    median_pitch: float
    polyphony: float
    median_duration: float
    melody_score: float
    bass_score: float


@dataclass
class Chord:
    start: float
    end: float
    pitch_classes: tuple
    root: int
    quality: str
    sources: tuple


@dataclass
class Analysis:
    sources: list[Source]
    peak_polyphony: int
    chords: list[Chord] = field(default_factory=list)


@dataclass
class Effect:
    kind: str
    parameters: dict


@dataclass
class ArrangedNote:
    pitch: int
    start: float
    end: float
    velocity: int
    sources: tuple
    instrument: str
    channel: int
    articulation: str = "connected"
    effects: list[Effect] = field(default_factory=list)
    volume: int = 0
    start_tick: int | None = None
    end_tick: int | None = None
    gate: float = 1.0  # Sounding fraction; Stage 2 may shorten articulation, never the timeline.


@dataclass
class Instrument:
    name: str
    wave: str
    duty: int
    volume: int
    points: tuple
    release_ms: int = 8


@dataclass
class Arrangement:
    title: str
    duration: float
    voices: dict[int, list[ArrangedNote]]
    instruments: dict[str, Instrument]
    loop: bool
    meter: tuple
    automation_ms: int
    analysis: Analysis
    report: dict


@dataclass
class Settings:
    preset: str = "balanced"
    loop: bool = False
    melody_track: int | None = None
    melody_channel: int | None = None
    bass_track: int | None = None
    bass_channel: int | None = None
    harmony_track: int | None = None
    harmony_channel: int | None = None
    transpose: int = 0
    melody_octave: int | None = None
    bass_octave: int | None = None
    harmony_octave: int | None = None
    melody_range: tuple = (48, 88)
    bass_range: tuple = (40, 67)
    harmony_range: tuple = (48, 79)
    melody_density: float = 1.0
    harmony_density: float = 0.8
    percussion_density: float = 0.8
    arpeggios: bool | None = None
    effects: float | None = None
    lead_volume: int = 12
    harmony_volume: int = 5
    bass_volume: int = 8
    drum_volume: int = 7
    start: float = 0.0
    end: float | None = None


# Named weights expose the musical tradeoffs. Rewards favor sustained, audible
# lines; transitions penalize leaps and interrupting a still-sounding phrase.
VOICE_WEIGHTS = {"attack": 0.7, "duration": 3.5, "velocity": 0.5, "register": 0.045,
                     "interval": 0.10, "large_leap": 0.16, "interruption": 4.5}
PRESETS = {
    "faithful": {"arpeggios": False, "effects": 0.25, "arp_ms": 96, "automation_ms": 16},
    "balanced": {"arpeggios": True, "effects": 0.5, "arp_ms": 80, "automation_ms": 16},
    "chiptune": {"arpeggios": True, "effects": 0.85, "arp_ms": 48, "automation_ms": 16},
}


def read_midi(path):
    """Normalize type 0/1 MIDI, including global channel state across tracks.

    Overlapping same-pitch key presses pair FIFO (same track first). Pedal
    releases affect released keys, never subsequent active key presses.
    """
    try:
        import mido
    except ImportError as error:
        raise ValueError("MIDI import requires mido: python -m pip install -r tools/requirements-midi.txt") from error
    try:
        midi = mido.MidiFile(path)
    except (OSError, ValueError, EOFError, KeyError) as error:
        raise ValueError(f"Cannot read MIDI {path}: {error}") from error
    if midi.type not in (0, 1):
        raise ValueError(f"MIDI type {midi.type} is unsupported; use a synchronous type 0 or 1 file")
    if midi.ticks_per_beat <= 0:
        raise ValueError("SMPTE MIDI timing is unsupported; use ticks-per-quarter-note timing")
    events, tracks = [], []
    for index, track in enumerate(midi.tracks):
        tracks.append(Track(index, track.name))
        tick = 0
        for order, message in enumerate(track):
            tick += message.time
            events.append((tick, index, order, message))
    events.sort(key=lambda e: e[:3])
    notes, controls, bends, meters, warnings = [], [], [], [], []
    tempos = [Tempo(0, 0.0, 500000)]
    active, held = defaultdict(deque), defaultdict(list)
    pedal, programs, bend_raw = [False] * 16, [0] * 16, [0] * 16
    rpn = [[127, 127] for _ in range(16)]
    ranges = [2.0] * 16
    unsupported = Counter()
    previous_tick, elapsed, tempo = 0, 0.0, 500000
    unmatched = dangling = 0

    def finish(note, time):
        note.end = max(note.start + 0.000001, time)

    def release_held(channel, time):
        for note in held.pop(channel, []):
            finish(note, time)

    for tick, track, _, message in events:
        elapsed += (tick - previous_tick) * tempo / (midi.ticks_per_beat * 1e6)
        previous_tick = tick
        kind = message.type
        if kind == "set_tempo":
            if message.tempo <= 0:
                raise ValueError("MIDI tempo must be positive")
            tempo = message.tempo
            point = Tempo(tick, elapsed, tempo)
            if tempos[-1].tick == tick:
                tempos[-1] = point
            else:
                tempos.append(point)
        elif kind == "time_signature":
            meters.append(Meter(elapsed, message.numerator, message.denominator, tick / midi.ticks_per_beat))
        elif kind == "program_change":
            programs[message.channel] = message.program
            tracks[track].programs.append((elapsed, message.channel, message.program))
        elif kind in ("note_on", "note_off"):
            channel, pitch = message.channel, message.note
            queue = active[channel, pitch]
            if kind == "note_on" and message.velocity:
                note = Note(len(notes), pitch, elapsed, elapsed, message.velocity,
                            track, channel, programs[channel], tick / midi.ticks_per_beat)
                notes.append(note)
                queue.append(note)
            elif queue:
                same_track = next((n for n in queue if n.track == track), queue[0])
                queue.remove(same_track)
                same_track.key_end = elapsed
                if pedal[channel] and channel != 9:
                    held[channel].append(same_track)
                else:
                    finish(same_track, elapsed)
            else:
                unmatched += 1
        elif kind == "control_change":
            channel, number, value = message.channel, message.control, message.value
            controls.append(Control(elapsed, track, channel, number, value))
            if number == 64:
                pedal[channel] = value >= 64
                if not pedal[channel]:
                    release_held(channel, elapsed)
            elif number in (120, 123):
                for (ch, _), queue in active.items():
                    if ch == channel:
                        while queue:
                            note = queue.popleft()
                            note.key_end = elapsed
                            if pedal[ch] and number == 123:
                                held[ch].append(note)
                            else:
                                finish(note, elapsed)
                if number == 120:
                    release_held(channel, elapsed)
            elif number == 121:
                pedal[channel] = False
                release_held(channel, elapsed)
                bend_raw[channel] = 0
                bends.append(Bend(elapsed, track, channel, 0.0))
            elif number in (101, 100):
                rpn[channel][101 - number] = value
            elif number in (6, 38) and rpn[channel] == [0, 0]:
                ranges[channel] = value + ranges[channel] % 1 if number == 6 else int(ranges[channel]) + value / 100
                bends.append(Bend(elapsed, track, channel, bend_raw[channel] / 8192 * ranges[channel] * 100))
            elif number not in (1, 7, 11):
                unsupported[f"CC{number}"] += 1
        elif kind == "pitchwheel":
            bend_raw[message.channel] = message.pitch
            bends.append(Bend(elapsed, track, message.channel, message.pitch / 8192 * ranges[message.channel] * 100))
        elif kind in ("sysex", "aftertouch", "polytouch"):
            unsupported[kind] += 1
    for queue in active.values():
        for note in queue:
            dangling += 1
            note.key_end = max(elapsed, note.start + 0.1)
            finish(note, note.key_end)
    for channel in list(held):
        release_held(channel, elapsed)
    if not notes:
        raise ValueError("MIDI contains no notes")
    if unmatched:
        warnings.append(f"Ignored {unmatched} unmatched note-off messages")
    if dangling:
        warnings.append(f"Closed {dangling} missing note-offs at end of file (100ms minimum for a final open note)")
    if unsupported:
        warnings.append("Retained/ignored unsupported expression: " + ", ".join(f"{k} ({v})" for k, v in sorted(unsupported.items())))
    if any(n.pitch < 24 or n.pitch > 95 for n in notes if n.channel != 9):
        warnings.append("Source notes outside C1..B6 require octave folding")
    return Song(Path(path).stem, max(elapsed, max(n.end for n in notes)), notes, tracks,
                tempos, meters or [Meter(0, 4, 4, 0)], controls, bends, warnings)


def peak_polyphony(notes):
    current = peak = 0
    for _, change in sorted([(n.start, 1) for n in notes] + [(n.end, -1) for n in notes]):
        current += change
        peak = max(peak, current)
    return peak


def analyze(song):
    groups = defaultdict(list)
    for note in song.notes:
        if note.channel != 9:
            groups[note.track, note.channel].append(note)
    sources = []
    for (track, channel), notes in sorted(groups.items()):
        pitches = [n.pitch for n in notes]
        median = statistics.median(pitches)
        duration = statistics.median(n.end - n.start for n in notes)
        end = union = 0.0
        for note in sorted(notes, key=lambda n: (n.start, n.id)):
            union += max(0.0, note.end - max(end, note.start))
            end = max(end, note.end)
        polyphony = sum(n.end - n.start for n in notes) / max(union, 0.001)
        program = Counter(n.program for n in notes).most_common(1)[0][0]
        name = song.tracks[track].name.lower()
        melody_name = any(word in name for word in ("melody", "lead", "flute", "solo", "theme"))
        bass_name = any(word in name for word in ("bass", "cello", "contrabass"))
        chord_name = any(word in name for word in ("chord", "pad", "harmony", "accomp", "harp"))
        melodic_program = 64 <= program <= 79 or program in (40, 56, 80, 81)
        bass_program = 32 <= program <= 39
        repetition = Counter(pitches).most_common(1)[0][1] / len(notes)
        melody_score = (3 * melody_name + 0.8 * melodic_program - 3 * bass_name - 2 * bass_program
                        - 1.3 * chord_name - 1.5 * max(0, polyphony - 1)
                        + max(-2, 1.5 - abs(median - 73) / 12)
                        + min(duration, 0.6) - max(0, repetition - 0.45) * 2)
        bass_score = (4 * bass_name + 3 * bass_program + (60 - median) / 10
                      - max(0, polyphony - 1) - melody_name + min(duration, 0.6))
        sources.append(Source(track, channel, song.tracks[track].name, program, len(notes),
                              median, polyphony, duration, melody_score, bass_score))
    return Analysis(sources, peak_polyphony([n for n in song.notes if n.channel != 9]))


def choose_source(analysis, role, settings, excluded=()):
    track, channel = getattr(settings, role + "_track"), getattr(settings, role + "_channel")
    candidates = [s for s in analysis.sources if (s.track, s.channel) not in excluded
                  and (track is None or s.track == track) and (channel is None or s.channel == channel)]
    if not candidates:
        if track is not None or channel is not None:
            raise ValueError(f"No pitched notes match {role} track={track}, channel={channel} in selected region")
        return None, 0.0
    key = role + "_score"
    candidates.sort(key=lambda s: (-getattr(s, key), s.track, s.channel))
    confidence = 1.0 if len(candidates) == 1 or track is not None or channel is not None else min(
        1.0, max(0.0, (getattr(candidates[0], key) - getattr(candidates[1], key)) / 3))
    return candidates[0], confidence


def extract_line(notes, role):
    """Beam dynamic programming over onset groups, with a hold/silence state.

    A path can hold its current sustained melody across a backing attack. It
    cannot resume a note once replaced, and selected notes are trimmed at the
    next selected onset. Backpointers keep memory linear in the input size.
    """
    if not notes:
        return []
    if peak_polyphony(notes) <= 1:
        return sorted(notes, key=lambda n: (n.start, n.id))
    groups = defaultdict(list)
    for note in notes:
        groups[note.start].append(note)
    center = statistics.median(n.pitch for n in notes)
    direction = -1 if role == "bass" else 1
    # State: cumulative score, last source note, linked path.
    beam = [(0.0, None, None)]
    weights = VOICE_WEIGHTS
    for time, candidates in sorted(groups.items()):
        options = {}
        for score, previous, path in beam:
            key = previous.id if previous else -1
            if key not in options or score > options[key][0]:
                options[key] = (score, previous, path)
            for note in sorted(candidates, key=lambda n: n.id):
                length = note.end - note.start
                reward = (weights["attack"] + weights["duration"] * min(length, 0.8)
                          + weights["velocity"] * note.velocity / 127
                          + weights["register"] * direction * (note.pitch - center))
                penalty = 0.0
                if previous:
                    leap = abs(note.pitch - previous.pitch)
                    gap = max(0, time - previous.end)
                    penalty += (weights["interval"] * leap + weights["large_leap"] * max(0, leap - 7)) / (1 + gap * 2)
                    penalty += weights["interruption"] * max(0, previous.end - time)
                value = score + reward - penalty
                if note.id not in options or value > options[note.id][0]:
                    options[note.id] = (value, note, (note, path))
        beam = sorted(options.values(), key=lambda s: (-s[0], s[1].id if s[1] else -1))[:24]
    path, result = beam[0][2], []
    while path:
        result.append(path[0])
        path = path[1]
    return list(reversed(result))


def arranged_line(notes, channel):
    result = []
    for i, note in enumerate(notes):
        end = min(note.end, notes[i + 1].start) if i + 1 < len(notes) else note.end
        if end > note.start:
            articulation = "staccato" if end - note.start < 0.13 else "sustained" if end - note.start > 0.55 else "connected"
            result.append(ArrangedNote(note.pitch, note.start, end, note.velocity, (note.id,),
                                       ROLES[channel], channel, articulation))
    return result


def chord_identity(pitches):
    pcs = set(pitches)
    templates = (("major", (0, 4, 7)), ("minor", (0, 3, 7)), ("diminished", (0, 3, 6)),
                 ("dominant7", (0, 4, 7, 10)), ("minor7", (0, 3, 7, 10)), ("sus4", (0, 5, 7)))
    choices = []
    for root in sorted(pcs):
        for quality, intervals in templates:
            expected = {(root + i) % 12 for i in intervals}
            score = 2 * len(pcs & expected) - len(expected - pcs) - 1.5 * len(pcs - expected)
            choices.append((score, -len(intervals), -root, quality, root))
    best = max(choices)
    return best[4], best[3] if best[0] >= 3 else "partial"


def harmony(notes, analysis, settings, preset, foundations=()):
    """Sweep actual chord boundaries; choose silence, a line, or chord voicing."""
    track, channel = settings.harmony_track, settings.harmony_channel
    if track is not None or channel is not None:
        notes = [n for n in notes if (track is None or n.track == track) and (channel is None or n.channel == channel)]
        if not notes:
            raise ValueError("No remaining notes match the harmony override; choose a source distinct from the extracted lead/bass")
    if not notes or settings.harmony_density == 0:
        return []
    boundaries = defaultdict(list)
    for note in notes:
        boundaries[note.start].append((1, note))
        boundaries[note.end].append((-1, note))
    times = sorted(boundaries)
    active, result, previous = {}, [], 60
    silence_penalty = 0.4 + (1 - settings.harmony_density) * 2
    for i, start in enumerate(times[:-1]):
        for change, note in sorted(boundaries[start], key=lambda e: e[0]):
            if change > 0:
                active[note.id] = note
            else:
                active.pop(note.id, None)
        end = times[i + 1]
        if not active or end - start < 0.016:
            continue
        candidates = list(active.values())
        pitches = tuple(sorted({n.pitch % 12 for n in candidates}))
        root, quality = chord_identity(pitches)
        sources = tuple(sorted(active))
        analysis.chords.append(Chord(start, end, pitches, root, quality, sources))
        velocity = round(statistics.mean(n.velocity for n in candidates))
        utility = min(end - start, 0.6) * 2 + velocity / 127 + 0.2 * min(len(pitches), 3)
        if utility <= silence_penalty:
            continue
        # Inversions are chosen by proximity to the preceding harmony voice.
        foundation_pcs = {n.pitch % 12 for voice in foundations for n in voice if n.start <= start < n.end}
        chosen = min(candidates, key=lambda n: (abs(n.pitch - previous) + abs(n.pitch - 64) * 0.15
                                                + (3 if n.pitch % 12 in foundation_pcs else 0), n.id))
        base = chosen.pitch
        effects = []
        if preset["arpeggios"] and len(pitches) >= (2 if settings.preset == "chiptune" else 3) and end - start >= 0.16:
            offsets = tuple(sorted({(pc - base) % 12 for pc in pitches}))[:4]
            effects = [Effect("arpeggio", {"offsets": offsets, "step_ms": preset["arp_ms"]})]
        if settings.preset == "chiptune" and len(pitches) >= 3 and end - start >= 1.0:
            # Slower, articulated broken chords suit long keyboard blocks.
            offsets = sorted({(pc - base) % 12 for pc in pitches})[:3]
            pattern = [offsets[j] for j in (0, 1, 2, 1)]
            step = 0.16
            position = start
            count = 0
            while position < end - 0.000001:
                pitch = base + pattern[count % 4]
                represented = tuple(n.id for n in candidates if n.pitch % 12 == pitch % 12)
                result.append(ArrangedNote(pitch, position, min(end, position + step * 0.9),
                                           velocity, represented, "harmony", 1, "broken_chord"))
                position += step
                count += 1
        else:
            represented_pcs = {(base + offset) % 12 for offset in effects[0].parameters["offsets"]} if effects else {base % 12}
            represented = tuple(n.id for n in candidates if n.pitch % 12 in represented_pcs)
            result.append(ArrangedNote(base, start, end, velocity, represented, "harmony", 1, "chord" if len(pitches) > 1 else "connected", effects))
        previous = base
    return result


# Noise pitches are chosen for character/rate, never copied from GM drum keys.
DRUMS = {
    "kick": (43, 0.052, 5.0, 1.0), "snare": (67, 0.100, 4.6, 1.0),
    "clap": (72, 0.084, 4.4, 0.85), "hat": (90, 0.024, 1.0, 0.35),
    "open_hat": (86, 0.140, 1.3, 0.4), "cymbal": (91, 0.220, 2.8, 0.55),
    "tom": (52, 0.084, 3.0, 0.8), "other": (78, 0.048, 1.6, 0.45),
}


def drum_class(pitch):
    if pitch in (35, 36):
        return "kick"
    if pitch in (38, 40):
        return "snare"
    if pitch == 39:
        return "clap"
    if pitch in (42, 44):
        return "hat"
    if pitch == 46:
        return "open_hat"
    if pitch in (49, 51, 52, 55, 57, 59):
        return "cymbal"
    if pitch in (41, 43, 45, 47, 48, 50):
        return "tom"
    return "other"


def percussion(notes, settings, preset):
    if settings.percussion_density == 0:
        return []
    groups = defaultdict(list)
    for note in notes:
        groups[tick(note.start)].append(note)
    result = []
    for _, group in sorted(groups.items()):
        def priority(note):
            kind = drum_class(note.pitch)
            accent = 0.35 if abs(note.beat - round(note.beat)) < 0.01 else 0
            return DRUMS[kind][2] + note.velocity / 127 + accent, -note.id
        note = max(group, key=priority)
        start = note.start
        kind = drum_class(note.pitch)
        pitch, duration, importance, _ = DRUMS[kind]
        if importance + note.velocity / 127 < 1 + (1 - settings.percussion_density) * 3:
            continue
        effects = [Effect("note_cut", {"after_ms": round(duration * 1000)})]
        if kind == "cymbal" and preset["effects"] >= 0.5:
            effects.append(Effect("noise_retrigger", {"every_ms": 48, "seed": 37}))
        if result:
            result[-1].end = min(result[-1].end, start)
        result.append(ArrangedNote(pitch, start, start + duration, note.velocity, (note.id,), kind, 3, "percussive", effects))
    # Collapse uniform snare/clap/tom rolls, retaining every source identity.
    if preset["effects"] > 0:
        merged, i = [], 0
        while i < len(result):
            first = result[i]
            j = i + 1
            if first.instrument in ("snare", "clap", "tom") and j < len(result):
                interval = result[j].start - first.start
                if 0.016 <= interval <= 0.080:
                    while (j < len(result) and result[j].instrument == first.instrument
                           and abs(result[j].start - result[j - 1].start - interval) < 0.002
                           and abs(result[j].velocity - first.velocity) <= 12):
                        j += 1
            if j - i >= 3:
                first = replace(first, end=result[j - 1].end,
                                sources=tuple(s for n in result[i:j] for s in n.sources),
                                effects=[Effect("noise_retrigger", {"every_ms": max(4, tick(interval) * 4), "seed": 23})])
                i = j
            else:
                i += 1
            merged.append(first)
        result = merged
    return result


def crop_song(song, start, end):
    if not math.isfinite(start) or start < 0 or (end is not None and (not math.isfinite(end) or end <= start)):
        raise ValueError("Region requires finite 0 <= start < end seconds")
    end = song.duration if end is None else min(end, song.duration)
    notes = [replace(n, start=max(n.start, start) - start, end=min(n.end, end) - start,
                     key_end=max(0, min(n.key_end, end) - start))
             for n in song.notes if n.start < end and n.end > start]
    if not notes:
        raise ValueError("Selected MIDI region contains no notes")
    # Keep pre-region controller/bend history, shifted to negative time. It is
    # needed to evaluate state at the first cropped note, including held notes.
    return replace(song, duration=end - start, notes=notes,
                   controls=[replace(c, time=c.time - start) for c in song.controls if c.time <= end],
                   bends=[replace(b, time=b.time - start) for b in song.bends if b.time <= end])


def normalize_register(notes, low, high, octave, transpose):
    if not notes:
        return 0
    if octave is None:
        def cost(shift):
            return sum(max(low - (n.pitch + transpose + shift), 0) ** 2
                       + max(n.pitch + transpose + shift - high, 0) ** 2 for n in notes) + abs(shift) * 0.01
        shift = min(range(-96, 97, 12), key=lambda s: (cost(s), abs(s), s))
    else:
        shift = octave * 12
    previous = None
    moved = 0
    for note in notes:
        source_pitch = note.pitch
        target = source_pitch + transpose + shift
        minimum, maximum = (low, high) if octave is None else (24, 95)
        choices = [target + i * 12 for i in range(-20, 21) if minimum <= target + i * 12 <= maximum]
        if not choices:
            raise ValueError("Register must contain at least one octave")
        note.pitch = min(choices, key=lambda p: (abs(p - target) + (0.2 * abs(p - previous) if previous is not None else 0), p))
        # Keep every arpeggio tone in range without changing its pitch classes.
        for effect in note.effects:
            if effect.kind == "arpeggio":
                offsets = effect.parameters["offsets"]
                if note.pitch + max(offsets) > 95:
                    note.pitch -= 12
        moved += note.pitch != source_pitch + transpose
        previous = note.pitch
    return moved


def tick(time):
    return math.floor(time / TICK + 0.5 + 1e-9)


def quantize(arrangement):
    """Round absolute boundaries once; omit collapsed notes instead of drifting."""
    errors, omitted = [], 0
    end_tick = max(2 if arrangement.loop else 1, tick(arrangement.duration))
    for channel, notes in arrangement.voices.items():
        retained = []
        for note in notes:
            start, end = max(0, tick(note.start)), min(end_tick, tick(note.end))
            errors.extend((abs(start * TICK - note.start), abs(end * TICK - min(note.end, arrangement.duration))))
            if end <= start:
                omitted += 1
                continue
            if retained and retained[-1].end_tick > start:
                retained[-1].end_tick = start
                if retained[-1].end_tick <= retained[-1].start_tick:
                    retained.pop()
                    omitted += 1
            note.start_tick, note.end_tick = start, end
            retained.append(note)
        arrangement.voices[channel] = retained
    arrangement.report.update(sub_tick_notes_omitted=omitted + arrangement.report.get("sub_tick_notes_omitted", 0),
                              quantization_max_error_ms=max(max(errors, default=0) * 1000, arrangement.report.get("quantization_max_error_ms", 0)),
                              quantization_mean_error_ms=statistics.mean(errors) * 1000 if errors else 0,
                              score_duration_seconds=end_tick * TICK)
    return end_tick


def state_at(points, time, default):
    index = bisect_right(points, (time, float("inf"))) - 1
    return points[index][1] if index >= 0 else default


def orchestrate(arrangement, song, settings, preset):
    present = [channel for channel, notes in arrangement.voices.items() if notes]
    peaks = {0: settings.lead_volume, 1: settings.harmony_volume, 2: settings.bass_volume, 3: settings.drum_volume}
    # Worst possible signed addition at the default master 128. Budget 30 gives
    # 120 pin units (<127), irrespective of pulse phase or coincident accents.
    total = sum(peaks[ch] for ch in present)
    scale = min(1.0, 30 / max(total, 1))
    peaks = {ch: math.floor(value * scale) for ch, value in peaks.items()}
    if scale < 1:
        arrangement.report["warnings"].append(f"Scaled requested volumes by {scale:.3f} to fit a 30-unit music mix budget")
    instruments = {
        "melody": Instrument("melody", "pulse", 64, peaks[0], ((0, 100), (64, 88)), 8),
        "harmony": Instrument("harmony", "pulse", 32, peaks[1], ((0, 100), (96, 70)), 8),
        "bass": Instrument("bass", "pulse", 128, peaks[2], ((0, 100), (80, 82)), 8),
    }
    for kind, (_, duration, _, gain) in DRUMS.items():
        instruments[kind] = Instrument(kind, "noise", 128, round(peaks[3] * gain),
                                       ((0, 100), (max(4, tick(duration * 0.6) * 4), 30)), 0)
    arrangement.instruments = instruments
    original = {n.id: n for n in song.notes}
    controls, bends = defaultdict(list), defaultdict(list)
    for c in song.controls:
        controls[c.channel, c.number].append((c.time, c.value))
        if c.number == 121:
            for number, value in ((1, 0), (11, 127)):
                controls[c.channel, number].append((c.time, value))
    for b in song.bends:
        bends[b.channel].append((b.time, b.cents))
    # Sort stably by time; coincident messages retain MIDI order.
    for mapping in (controls, bends):
        for key in mapping:
            # Collapse equal-time values to their final channel state.
            mapping[key] = sorted(dict(mapping[key]).items())
    complex_bends = complex_expression = 0
    for channel, notes in arrangement.voices.items():
        for note in notes:
            source = original[note.sources[0]]
            instrument = instruments[note.instrument]
            volume_points, expression_points = controls[source.channel, 7], controls[source.channel, 11]

            def dynamic(time, volume_points=volume_points, expression_points=expression_points):
                return state_at(volume_points, time, 100) / 127 * state_at(expression_points, time, 127) / 127

            # Four velocity tiers retain accents without a separate instrument
            # per MIDI velocity. Controllers remain independent of velocity.
            tier = min((0.5, 2 / 3, 5 / 6, 1.0), key=lambda v: abs(v - math.sqrt(note.velocity / 127)))
            note.volume = max(0, min(instrument.volume, round(instrument.volume * tier * dynamic(note.start))))
            if channel == 3:
                continue
            length = note.end - note.start
            end_dynamic = dynamic(note.end - 1e-8)
            target_volume = min(instrument.volume, round(instrument.volume * tier * end_dynamic))
            if preset["effects"] > 0 and abs(target_volume - note.volume) >= 2 and length >= 0.05:
                note.effects.append(Effect("volume_slide", {"to": target_volume, "over_ms": max(4, tick(length) * 4)}))
                complex_expression += sum(note.start < t < note.end for t, _ in volume_points + expression_points) > 1
            points = bends[source.channel]
            start_bend = state_at(points, note.start, 0.0)
            inside = [(t, v) for t, v in points if note.start < t < note.end]
            end_bend = inside[-1][1] if inside else start_bend
            pitch_effect = any(e.kind in ("arpeggio", "glissando") for e in note.effects)
            if (abs(start_bend) >= 1 or any(abs(v) >= 1 for _, v in inside)) and not pitch_effect:
                complex_bends += len(inside) > 1
                if abs(end_bend - start_bend) < 1 and inside:
                    # Do not erase an up/down bend whose final value is zero.
                    _, end_bend = max(inside, key=lambda p: abs(p[1] - start_bend))
                frequency = 440 * 2 ** ((note.pitch - 69) / 12)
                over = max(4, tick((inside[-1][0] - note.start) if inside else length) * 4)
                note.effects.append(Effect("frequency_slide", {"from_hz": frequency * 2 ** (start_bend / 1200),
                                                                   "to_hz": frequency * 2 ** (end_bend / 1200), "over_ms": over}))
            mod = state_at(controls[source.channel, 1], note.start, 0)
            if length >= 0.5 and preset["effects"] > 0 and (mod >= 16 or (settings.preset == "chiptune" and channel == 0 and length >= 0.9)):
                note.effects.append(Effect("lfo", {"target": "pitch", "depth": min(22, 6 + mod / 8), "period_ms": 240, "wave": "sine"}))
            if settings.preset == "chiptune" and preset["effects"] >= 0.7 and length > 0.7 and channel == 0:
                note.effects.append(Effect("duty_slide", {"to": 48, "over_ms": 240}))
    if complex_bends:
        arrangement.report["warnings"].append(f"Approximated {complex_bends} multi-point pitch bends by one slide per note; complete curves remain in source IR")
    if complex_expression:
        arrangement.report["warnings"].append(f"Approximated {complex_expression} multi-point expression curves by endpoint volume slides")
    arrangement.report.update(mix_peak_volume_sum=sum(peaks[ch] for ch in present),
                              mix_peak_amplitude_at_master_128=sum(peaks[ch] * 4 for ch in present))


def arrange(song, settings=None):
    settings = settings or Settings()
    validate_settings(settings)
    preset = dict(PRESETS[settings.preset])
    for key in ("arpeggios", "effects"):
        if getattr(settings, key) is not None:
            preset[key] = getattr(settings, key)
    region = crop_song(song, settings.start, settings.end)
    analysis = analyze(region)
    melody, confidence = choose_source(analysis, "melody", settings)
    warnings = list(song.warnings)
    if confidence < 0.3 and melody:
        warnings.append("Low-confidence melody source; consider --melody-track/--melody-channel")
    if analysis.peak_polyphony > 8:
        warnings.append(f"High source polyphony ({analysis.peak_polyphony}); substantial reduction required")
    pitched = [n for n in region.notes if n.channel != 9]
    lead_notes = extract_line([n for n in pitched if melody and (n.track, n.channel) == (melody.track, melody.channel)], "melody")
    if settings.melody_density < 1:
        lead_notes = [n for n in lead_notes if n.end - n.start >= (1 - settings.melody_density) * 0.18
                      or abs(n.beat - round(n.beat)) < 0.01]
    used = {n.id for n in lead_notes}
    bass, _ = choose_source(analysis, "bass", settings,
                            excluded=[(melody.track, melody.channel)] if melody and len(analysis.sources) > 1
                            and settings.bass_track is None and settings.bass_channel is None else [])
    remaining = [n for n in pitched if n.id not in used]
    bass_notes = extract_line([n for n in remaining if bass and (n.track, n.channel) == (bass.track, bass.channel)], "bass")
    used.update(n.id for n in bass_notes)
    # Do not turn discarded notes from a dedicated bass track into treble
    # accompaniment. A single piano source still supplies all three voices.
    harmonic = [n for n in remaining if n.id not in used and (settings.harmony_track is not None or settings.harmony_channel is not None
                or not bass or bass == melody or (n.track, n.channel) != (bass.track, bass.channel))]
    lead_voice, bass_voice = arranged_line(lead_notes, 0), arranged_line(bass_notes, 2)
    voices = {0: lead_voice, 2: bass_voice,
              1: harmony(harmonic, analysis, settings, preset, (lead_voice, bass_voice)),
              3: percussion([n for n in region.notes if n.channel == 9], settings, preset)}
    transpositions = {}
    for channel in (0, 1, 2):
        role = ROLES[channel]
        transpositions[role] = normalize_register(voices[channel], *getattr(settings, role + "_range"),
                                                 getattr(settings, role + "_octave"), settings.transpose)
    meter = next((m for m in reversed(song.meters) if m.time <= settings.start), song.meters[0])
    report = {"warnings": warnings, "original_duration_seconds": song.duration, "region_start_seconds": settings.start,
                  "region_duration_seconds": region.duration, "original_note_count": len(song.notes), "region_note_count": len(region.notes),
                  "track_count": len(song.tracks), "source_channel_count": len({n.channel for n in song.notes}),
                  "peak_pitched_polyphony": analysis.peak_polyphony, "melody_source": asdict(melody) if melody else None,
                  "bass_source": asdict(bass) if bass else None, "melody_confidence": confidence,
                  "octave_adjusted_notes": transpositions, "settings": asdict(settings)}
    result = Arrangement(song.title, region.duration, voices, {}, settings.loop, (meter.numerator, meter.denominator),
                         preset["automation_ms"], analysis, report)
    orchestrate(result, region, settings, preset)
    quantize(result)
    if not any(result.voices.values()):
        raise ValueError("No notes survive the selected region/density and 4ms timing grid")
    kept = {s for notes in result.voices.values() for n in notes for s in n.sources}
    source_drums = [n for n in region.notes if n.channel == 9]
    drum_kept = {s for n in result.voices[3] for s in n.sources}
    report.update(selected_notes={ROLES[ch]: len(notes) for ch, notes in sorted(result.voices.items())},
                  dropped_source_notes=len(region.notes) - len(kept),
                  retained_source_notes=len(kept), percussion_source_events=len(source_drums),
                  percussion_retained_sources=len(drum_kept), percussion_dropped_or_merged=len(source_drums) - len(result.voices[3]),
                  generated_arpeggios=sum(e.kind == "arpeggio" for notes in result.voices.values() for n in notes for e in n.effects),
                  effects=dict(Counter(e.kind for notes in result.voices.values() for n in notes for e in n.effects)))
    if report["sub_tick_notes_omitted"]:
        warnings.append(f"Omitted {report['sub_tick_notes_omitted']} notes that collapsed on the 4ms grid")
    if len(kept) < len(region.notes) * 0.4:
        warnings.append("More than 60% of source notes were discarded; inspect harmony/source choices")
    return result


def effect_text(effect):
    p, kind = effect.parameters, effect.kind
    if kind == "arpeggio":
        return "arpeggio { offsets " + ",".join(str(v) for v in p["offsets"]) + f" step {p['step_ms']}ms repeat }}"
    if kind == "frequency_slide":
        return f"frequency_slide {{ from {p['from_hz']:.6f}Hz to {p['to_hz']:.6f}Hz over {p['over_ms']}ms }}"
    if kind in ("volume_slide", "duty_slide"):
        return f"{kind} {{ to {p['to']} over {p['over_ms']}ms }}"
    if kind == "lfo":
        unit = "cents" if p["target"] == "pitch" else ""
        return f"lfo {{ target {p['target']} depth {p['depth']:.3f}{unit} period {p['period_ms']}ms wave {p.get('wave', 'sine')} }}"
    if kind == "note_cut":
        return f"note_cut {{ after {max(4, tick(p['after_ms'] / 1000) * 4)}ms }}"
    if kind == "noise_retrigger":
        return f"noise_retrigger {{ every {p['every_ms']}ms seed {p['seed']} }}"
    if kind == "glissando":
        return f"glissando {{ direction {p['direction']} step {p.get('step', 1)}semitone every {p['every_ms']}ms }}"
    raise ValueError(f"Unknown arranged effect {kind!r}")


def generate_score(arrangement):
    """Regenerate from a modified arrangement, including changed instruments.

    Quantization is refreshed so future optimizers can edit real-time structure.
    Notes use octave directives: c4 means a quarter note, not MIDI octave 4.
    """
    end_tick = quantize(arrangement)
    lines = ["// Generated by midi_to_avms.py; physical voices: 0 lead, 1 harmony, 2 bass, 3 noise.",
             "title " + json.dumps(arrangement.title, ensure_ascii=True), "tempo 120",
             f"meter {arrangement.meter[0]}/{arrangement.meter[1]}", f"automation {arrangement.automation_ms}ms"]
    if arrangement.loop:
        lines.append("loop")
    lines.append("// Explicit absolute-boundary timings preserve the source tempo map.")
    for name, instrument in arrangement.instruments.items():
        if not any(n.instrument == name for notes in arrangement.voices.values() for n in notes):
            continue
        points = ", ".join(f"{t}ms:{level}%" for t, level in instrument.points)
        release = f" release {instrument.release_ms}ms:0%" if instrument.release_ms else ""
        lines.extend(["", f"envelope {name}_env {{ points {points}{release} curve linear }}",
                      f"instrument {name} {{ wave {instrument.wave} duty {instrument.duty} volume {instrument.volume} envelope {name}_env }}"])
    names = ("c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b")
    for channel, notes in sorted(arrangement.voices.items()):
        if not notes:
            continue
        lines.extend(["", f"// {ROLES[channel]}; {len(notes)} monophonic notes.", f"channel {channel} {{"])
        position = 0
        for note in notes:
            if note.start_tick > position:
                lines.append(f"    r:{(note.start_tick - position) * 4}ms")
            # use resets persistent effects, so an arp/bend never leaks into
            # the following note. Volumes and timbres retain reusable presets.
            commands = [f"use {note.instrument}", f"volume {min(note.volume, arrangement.instruments[note.instrument].volume)}", f"octave {note.pitch // 12 - 1}"]
            commands.extend(effect_text(effect) for effect in note.effects)
            # End release at the quantized MIDI offset; no tail accumulates or
            # lengthens the song. Adjacent attacks cancel a prior release.
            duration = (note.end_tick - note.start_tick) * 4
            release = arrangement.instruments[note.instrument].release_ms
            if not math.isfinite(note.gate) or not 0 < note.gate <= 1:
                raise ValueError("Arranged note gate must be in (0, 1]")
            gate_ms = max(4, tick(duration * note.gate / 1000) * 4 - release)
            if gate_ms < duration:
                commands.append(f"gate {gate_ms}/{duration}")
            elif release and not any(e.kind == "note_cut" for e in note.effects):
                commands.append(f"note_cut {{ after {duration}ms }}")
            commands.append(f"{names[note.pitch % 12]}:{duration}ms")
            lines.append("    " + " ".join(commands))
            position = note.end_tick
        if position < end_tick:
            lines.append(f"    r:{(end_tick - position) * 4}ms")
        lines.append("}")
    return "\n".join(lines) + "\n"


def compile_arrangement(arrangement):
    source = generate_score(arrangement)
    compiler_stats = {}
    data = avm_music.compile_source(source, "<MIDI arrangement>", statistics=compiler_stats)
    arrangement.report.update(avms_source_bytes=len(source.encode("utf-8")), compiled_song_bytes=len(data),
                              compiler=compiler_stats, output_duration_seconds=arrangement.report["score_duration_seconds"] + (0 if arrangement.loop else TICK),
                              initial_event_delay_ms=4,
                              updates_per_second=compiler_stats["events"] / max(arrangement.duration, TICK))
    if len(data) > 65536:
        arrangement.report["warnings"].append("Compiled song exceeds 64 KiB; supported by AVM, but review effect density/FX usage")
    if arrangement.report["updates_per_second"] > 150:
        arrangement.report["warnings"].append("More than 150 events/second; reduce effects or arpeggio density for foreground playback")
    return source, data


def validate_settings(settings):
    if settings.preset not in PRESETS:
        raise ValueError("Unknown arrangement preset")
    for name in ("melody_density", "harmony_density", "percussion_density", "effects"):
        value = getattr(settings, name)
        if value is not None and (not math.isfinite(value) or not 0 <= value <= 1):
            raise ValueError(f"{name} must be between 0 and 1")
    for name in ("lead_volume", "bass_volume", "harmony_volume", "drum_volume"):
        if not 0 <= getattr(settings, name) <= 31:
            raise ValueError(f"{name} must be 0..31")
    for role in ("melody", "bass", "harmony"):
        low, high = getattr(settings, role + "_range")
        if not 24 <= low <= high <= 95 or high - low < 11:
            raise ValueError(f"{role} register must be within 24..95 and span at least an octave")
        for suffix in ("track", "channel"):
            value = getattr(settings, role + "_" + suffix)
            if value is not None and (value < 0 or (suffix == "channel" and value > 15)):
                raise ValueError(f"{role} {suffix} is out of range (channels are zero-based 0..15)")


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--preset", choices=PRESETS, default="balanced")
    parser.add_argument("--loop", action="store_true")
    parser.add_argument("--title")
    parser.add_argument("--stats", action="store_true")
    parser.add_argument("--report", type=Path, help="write source IR, arranged IR and diagnostics as JSON")
    parser.add_argument("--binary", type=Path, help="also write validated A5 music")
    parser.add_argument("--transpose", type=int, default=0, help="semitones, before octave normalization")
    parser.add_argument("--start", type=float, default=0, help="region start in seconds")
    parser.add_argument("--end", type=float, help="region end in seconds")
    parser.add_argument("--arpeggios", action=argparse.BooleanOptionalAction, default=None)
    parser.add_argument("--effects", type=float, help="0..1 effect intensity; source pitch bends are always preserved approximately")
    for role in ("melody", "bass", "harmony"):
        parser.add_argument(f"--{role}-track", type=int, help="zero-based source track")
        parser.add_argument(f"--{role}-channel", type=int, help="zero-based MIDI channel")
        parser.add_argument(f"--{role}-octave", type=int, help="octave shift; default automatically fits target register")
        parser.add_argument(f"--{role}-range", type=int, nargs=2, metavar=("LOW", "HIGH"), default=getattr(Settings(), role + "_range"), help="target MIDI note register")
    for name in ("melody-density", "harmony-density", "percussion-density"):
        parser.add_argument("--" + name, type=float, default=getattr(Settings(), name.replace("-", "_")))
    for name in ("lead-volume", "harmony-volume", "bass-volume", "drum-volume"):
        parser.add_argument("--" + name, type=int, default=getattr(Settings(), name.replace("-", "_")))
    args = parser.parse_args(argv)
    try:
        settings = Settings(**{name: getattr(args, name) for name in Settings.__dataclass_fields__})
        song = read_midi(args.input)
        if args.title:
            song.title = args.title
        arrangement = arrange(song, settings)
        source, data = compile_arrangement(arrangement)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(source, encoding="utf-8", newline="\n")
        if args.binary:
            args.binary.parent.mkdir(parents=True, exist_ok=True)
            args.binary.write_bytes(data)
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps({"statistics": arrangement.report, "source": asdict(song), "arrangement": asdict(arrangement)}, indent=2) + "\n", encoding="utf-8")
        if args.stats:
            print(json.dumps(arrangement.report, indent=2))
        for warning in arrangement.report["warnings"]:
            print(f"warning: {warning}", file=sys.stderr)
    except (ValueError, OSError, EOFError) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
