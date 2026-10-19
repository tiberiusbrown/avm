#!/usr/bin/env python3
"""Compile AVM scores (.avms) to A4 music or compact C1..C3 sound effects."""
import argparse
import ast
import math
import re
import sys
from fractions import Fraction
from pathlib import Path

WAVEFORMS = {"square": 0, "triangle": 1, "sawtooth": 2, "sine": 3}


def note_number(value):
    if value is None:
        return 0x80
    if isinstance(value, str):
        match = re.fullmatch(r"([A-Ga-g])([#b]?)(-?\d+)", value)
        if not match:
            raise ValueError(f"invalid note {value!r}")
        name, accidental, octave = match.groups()
        value = 12 * (int(octave) + 1) + dict(C=0, D=2, E=4, F=5, G=7, A=9, B=11)[name.upper()]
        value += {"": 0, "#": 1, "b": -1}[accidental]
    if not isinstance(value, int) or not 24 <= value <= 95:
        raise ValueError("notes must be MIDI 24..95 (C1..B6)")
    return value


def delta_bytes(ticks):
    if not isinstance(ticks, int) or not 1 <= ticks <= 256:
        raise ValueError("encoded delta must be 1..256 ticks")
    return bytes([ticks - 1])


def emit_event(output, ticks, payload):
    if not isinstance(ticks, int) or ticks < 1:
        raise ValueError("delta must be a positive integer number of ticks")
    continues = (ticks - 1) // 256
    if continues > sys.maxsize // 3:
        raise ValueError("encoded wait exceeds host addressable memory")
    try:
        output += bytes([255, 0, 0]) * continues
    except (MemoryError, OverflowError) as error:
        raise ValueError("encoded wait exceeds available host memory") from error
    output += delta_bytes(ticks - 256 * continues)
    output += payload


def note_increment(value):
    """Convert a score/MIDI note to a uint16 increment at canonical 15625 Hz."""
    note = note_number(value)
    return 0 if note == 0x80 else round(440 * 2 ** ((note - 69) / 12) * 65536 / 15625)


def _encode_events(mask, events, tail_ticks, loop, sfx=False):
    """Encode resolved updates. An explicit increment permits non-semitone pitches."""
    if sfx and (loop or not mask or mask & ~12):
        raise ValueError("SFX must be one-shot and declare only channels 2 and/or 3")
    output = bytearray([0xC0 | (mask >> 2)]) if sfx else bytearray([0xA4, mask])
    notes, volumes, waves = [0] * 4, [24] * 4, [0] * 4
    first = True
    for ticks, updates in events:
        changed_notes, changed_controls = {}, {}
        for channel, update in updates.items():
            if "note" in update or "increment" in update:
                notes[channel] = update["increment"] if "increment" in update else note_increment(update["note"])
                if not isinstance(notes[channel], int) or not 0 <= notes[channel] <= 65535:
                    raise ValueError("phase increments must be uint16 values (0=off)")
                changed_notes[channel] = notes[channel]
            if "volume" in update:
                volumes[channel] = update["volume"]
            if "waveform" in update:
                waves[channel] = WAVEFORMS[update["waveform"]]
            if "volume" in update or "waveform" in update:
                changed_controls[channel] = (waves[channel] << 5) | volumes[channel]
        if first:
            for channel in range(4):
                if mask & (1 << channel):
                    changed_notes[channel] = notes[channel]
                    changed_controls[channel] = (waves[channel] << 5) | volumes[channel]
            first = False
        packed = sum(1 << c for c in changed_notes) | sum(16 << c for c in changed_controls)
        if sfx:
            packed = ((packed >> 2) & 3) | ((packed >> 4) & 12)
        payload = (bytes([packed]) + b"".join(changed_notes[c].to_bytes(2, "little") for c in sorted(changed_notes))
                   + bytes(changed_controls[c] for c in sorted(changed_controls)))
        emit_event(output, ticks, payload if packed else bytes([0, 0]))
    emit_event(output, tail_ticks, bytes([0, 2 if loop else 1]))
    return bytes(output)


class ScoreError(ValueError):
    """A diagnostic with a source filename, line, and column."""


TOKEN = re.compile(
    r'\s+|//[^\n]*|"(?:\\.|[^"\\])*"'
    r"|[a-grs](?:#|b)?[',]*\d*\.*(?![\w'])"
    r"|[A-Za-z_]\w*|\d+(?:\.\d+)?|[{}():;,/%~|@*+-]",
    re.IGNORECASE,
)
NOTE = re.compile(r"([a-grs])([#b]?)([',]*)(\d*)(\.*)", re.IGNORECASE)


class ScoreParser:
    def __init__(self, source, filename):
        self.source, self.filename = source, str(filename)
        self.tokens = []
        offset = 0
        while offset < len(source):
            match = TOKEN.match(source, offset)
            if not match:
                self.error(f"unexpected character {source[offset]!r}", ("", offset))
            token = match.group()
            if not token.isspace() and not token.startswith("//"):
                self.tokens.append((token, offset))
            offset = match.end()
        self.tokens.append(("<end>", len(source)))
        self.position = 0
        self.tempo = Fraction(120)
        self.meter = Fraction(4)
        self.loop = False
        self.sfx = False
        self.automation_ms = Fraction(8)
        self.envelopes, self.instruments, self.phrases, self.channels = {}, {}, {}, {}

    def error(self, message, token=None):
        if token is None:
            token = self.tokens[self.position]
        offset = token[1]
        line = self.source.count("\n", 0, offset) + 1
        column = offset - self.source.rfind("\n", 0, offset)
        raise ScoreError(f"{self.filename}:{line}:{column}: {message}")

    def peek(self):
        return self.tokens[self.position][0]

    def take(self):
        token = self.tokens[self.position]
        if token[0] == "<end>":
            self.error("unexpected end of score")
        self.position += 1
        return token

    def accept(self, value):
        if self.peek() == value:
            self.take()
            return True
        return False

    def expect(self, value):
        if not self.accept(value):
            self.error(f"expected {value!r}, got {self.peek()!r}")

    def name(self):
        token = self.take()
        if not re.fullmatch(r"[A-Za-z_]\w*", token[0]):
            self.error("expected a name", token)
        return token[0]

    def number(self, integer=False):
        token = self.take()
        try:
            value = Fraction(token[0])
            if self.accept("/"):
                value /= Fraction(self.take()[0])
        except (ValueError, ZeroDivisionError):
            self.error("expected a number or fraction", token)
        if integer and value.denominator != 1:
            self.error("expected an integer", token)
        return int(value) if integer else value

    def percent(self):
        token = self.tokens[self.position]
        value = self.number()
        if self.accept("%"):
            value /= 100
        if not 0 <= value <= 1:
            self.error("level must be 0..100% (or a fraction from 0 to 1)", token)
        return value

    def time(self):
        token = self.tokens[self.position]
        value = self.number()
        if self.peek() in ("ms", "s", "ticks"):
            unit = self.take()[0]
            value *= {"ms": 1, "s": 1000, "ticks": 4}[unit]
        else:
            # A unitless musical fraction is a fraction of a whole note.
            value *= 4 * 60000 / self.tempo
        if value < 0:
            self.error("time must be nonnegative", token)
        return value

    def points(self, release=False):
        points = []
        while True:
            token = self.tokens[self.position]
            time = self.time()
            self.expect(":")
            level = self.percent()
            if (points and time <= points[-1][0]) or (release and time <= 0):
                self.error("breakpoint times must increase (release starts after zero)", token)
            points.append((time, level))
            if not self.accept(","):
                break
        if not release and points[0][0] != 0:
            self.error("an envelope must start at time zero", token)
        if release and points[-1][1] != 0:
            self.error("release must end at level zero", token)
        return points

    def tremolo(self):
        result = {"depth": Fraction(1, 4), "wave": "sine", "phase": "note"}
        self.expect("{")
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            field = token[0]
            if field in ("rate", "period"):
                if "period" in result:
                    self.error("specify either tremolo rate or period once", token)
                if field == "rate":
                    rate = self.number()
                    self.expect("Hz")
                    if rate <= 0:
                        self.error("tremolo rate must be positive", token)
                    result["period"] = 1000 / rate
                else:
                    result["period"] = self.time()
                if result["period"] < 8:
                    self.error("tremolo period must be at least 8ms", token)
            elif field == "depth":
                result[field] = self.percent()
            elif field in ("wave", "phase"):
                result[field] = self.name()
                allowed = ("sine", "triangle", "square") if field == "wave" else ("note", "song")
                if result[field] not in allowed:
                    self.error(f"{field} must be one of {', '.join(allowed)}", token)
            else:
                self.error(f"unknown tremolo field {field!r}", token)
        if "period" not in result:
            self.error("tremolo needs a rate or period")
        return result

    def envelope(self):
        result = {"points": [(Fraction(0), Fraction(1))], "release": [], "curve": "linear"}
        self.expect("{")
        seen = set()
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            field = token[0]
            if field in seen:
                self.error(f"duplicate envelope field {field!r}", token)
            seen.add(field)
            if field in ("points", "release"):
                result[field] = self.points(field == "release")
            elif field == "curve":
                result[field] = self.name()
                if result[field] not in ("linear", "step"):
                    self.error("curve must be linear or step", token)
            elif field == "tremolo":
                result[field] = self.tremolo()
            elif field != "sustain":
                self.error(f"unknown envelope field {field!r}", token)
        return result

    def setting(self, field, token):
        if field == "volume":
            value = self.number(integer=True)
            if not 0 <= value <= 31:
                self.error("channel volume must be 0..31", token)
        elif field == "gate":
            value = self.percent()
            if value == 0:
                self.error("gate must be greater than zero", token)
        elif field == "octave":
            value = self.number(integer=True)
            if not 1 <= value <= 6:
                self.error("octave must be 1..6", token)
        else:
            value = self.name()
            if field == "wave" and value not in (*WAVEFORMS, "noise"):
                self.error("unknown waveform", token)
        return value

    def instrument(self):
        result = {"wave": "square", "volume": 24, "envelope": None, "gate": Fraction(1)}
        self.expect("{")
        seen = set()
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            field = token[0]
            if field not in result or field in seen:
                self.error(f"unknown or duplicate instrument field {field!r}", token)
            seen.add(field)
            result[field] = self.setting(field, token)
        return result

    def sequence(self):
        self.expect("{")
        result = []
        while not self.accept("}"):
            token = self.take()
            value = token[0]
            if value == ";":
                continue
            if value == "repeat":
                count = self.number(integer=True)
                if count < 1:
                    self.error("repeat count must be positive", token)
                result.append(("repeat", (count, self.sequence()), token))
            elif value in ("use", "octave", "volume", "wave", "envelope", "gate"):
                result.append((value, self.setting(value, token), token))
            elif value in ("|", "~"):
                result.append((value, None, token))
            elif match := NOTE.fullmatch(value):
                name, accidental, octave, denominator, dots = match.groups()
                duration = None
                if denominator:
                    denominator = int(denominator)
                    if denominator == 0 or denominator & (denominator - 1):
                        self.error("note duration must be a power of two", token)
                    duration = Fraction(4, denominator) * (2 - Fraction(1, 2 ** len(dots)))
                elif dots:
                    self.error("dots require an explicit duration", token)
                raw_ms = self.time() if self.accept(":") else None
                if raw_ms is not None and denominator:
                    self.error("use a musical duration or an explicit time", token)
                if self.accept("*"):
                    multiplier = self.number()
                    if multiplier <= 0:
                        self.error("duration multiplier must be positive", token)
                else:
                    multiplier = Fraction(1)
                instrument = self.name() if self.accept("@") else None
                result.append(("note", (name.lower(), accidental, octave, duration, raw_ms,
                                        multiplier, instrument), token))
            elif re.fullmatch(r"[A-Za-z_]\w*", value):
                result.append(("phrase", value, token))
            else:
                self.error(f"unexpected sequence item {value!r}", token)
        return result

    def parse(self):
        definitions = False
        seen = set()
        while self.peek() != "<end>":
            if self.accept(";"):
                continue
            token = self.take()
            command = token[0]
            if command in ("tempo", "meter", "automation", "loop", "sfx", "title", "description"):
                if command in seen:
                    self.error(f"duplicate {command}", token)
                seen.add(command)
                if definitions:
                    self.error("score settings must precede definitions and channels", token)
                if command == "tempo":
                    self.tempo = self.number()
                    if self.tempo <= 0:
                        self.error("tempo must be positive", token)
                elif command == "meter":
                    # Convert the whole-note fraction to quarter-note beats.
                    self.meter = self.number() * 4
                    if self.meter <= 0:
                        self.error("meter must be positive", token)
                elif command == "automation":
                    self.automation_ms = self.time()
                elif command == "loop":
                    self.loop = True
                elif command == "sfx":
                    self.sfx = True
                else:
                    text = self.take()
                    if not text[0].startswith('"'):
                        self.error("expected a quoted string", text)
                    try:
                        ast.literal_eval(text[0])
                    except (ValueError, SyntaxError):
                        self.error("invalid quoted string", text)
            else:
                definitions = True
                if command == "channel":
                    channel = self.number(integer=True)
                    if channel not in range(4) or channel in self.channels:
                        self.error("channel must be a unique number from 0 to 3", token)
                    instrument = self.name() if self.peek() not in ("{", "octave") else None
                    octave = self.setting("octave", token) if self.accept("octave") else 4
                    self.channels[channel] = (instrument, octave, self.sequence(), token)
                elif command in ("envelope", "instrument", "phrase"):
                    name = self.name()
                    if command == "phrase" and (NOTE.fullmatch(name) or name in
                            ("repeat", "use", "octave", "volume", "wave", "envelope", "gate")):
                        self.error("phrase name conflicts with note notation or a sequence command", token)
                    table = getattr(self, command + "s")
                    if name in table:
                        self.error(f"duplicate {command} {name!r}", token)
                    table[name] = getattr(self, command)() if command != "phrase" else self.sequence()
                else:
                    self.error(f"unknown score command {command!r}", token)
        if not self.channels:
            self.error("score needs at least one channel")
        if self.sfx and (self.loop or any(channel not in (2, 3) for channel in self.channels)):
            self.error("SFX must be one-shot and declare only channels 2 and/or 3")
        return self


def curve_level(points, time, step=False):
    """Hold the last point; linear or stepped interpolation between points."""
    for index in range(1, len(points)):
        if time < points[index][0]:
            left, right = points[index - 1], points[index]
            if step:
                return left[1]
            return left[1] + (right[1] - left[1]) * (time - left[0]) / (right[0] - left[0])
    return points[-1][1]


def tremolo_level(tremolo, elapsed, song_time):
    phase = float((elapsed if tremolo["phase"] == "note" else song_time) / tremolo["period"]) % 1
    if tremolo["wave"] == "sine":
        attenuation = (1 - math.cos(2 * math.pi * phase)) / 2
    elif tremolo["wave"] == "triangle":
        attenuation = 1 - abs(2 * phase - 1)
    else:
        attenuation = int(phase >= 0.5)
    return 1 - float(tremolo["depth"]) * attenuation


def score_events(score):
    """Resolve channel notation to notes with exact, absolute millisecond times."""
    channels, endings = {}, []
    flat = {"points": [(Fraction(0), Fraction(1))], "release": [], "curve": "linear"}

    def instrument(name, token):
        if name is None:
            return {"wave": "square", "volume": 24, "envelope": None, "gate": Fraction(1)}
        if name not in score.instruments:
            score.error(f"unknown instrument {name!r}", token)
        return score.instruments[name].copy()

    for channel, (name, octave, sequence, token) in score.channels.items():
        notes = []
        state = {"time": Fraction(0), "duration": Fraction(1), "octave": octave,
                 "sound": instrument(name, token), "tie": False}

        def expand(sequence, stack=()):
            for kind, value, item in sequence:
                if kind == "repeat":
                    for _ in range(value[0]):
                        expand(value[1], stack)
                elif kind == "phrase":
                    if value not in score.phrases:
                        score.error(f"unknown phrase {value!r}", item)
                    if value in stack:
                        score.error(f"recursive phrase {value!r}", item)
                    expand(score.phrases[value], (*stack, value))
                elif kind == "use":
                    state["sound"] = instrument(value, item)
                elif kind == "octave":
                    state[kind] = value
                elif kind in ("volume", "wave", "envelope", "gate"):
                    state["sound"][kind] = value
                elif kind == "|":
                    bar_ms = score.meter * 60000 / score.tempo
                    if state["time"] % bar_ms:
                        score.error("bar line does not fall on a complete measure", item)
                elif kind == "~":
                    if not notes or state["tie"] or notes[-1]["end"] != state["time"]:
                        score.error("tie must follow a note", item)
                    state["tie"] = True
                else:
                    name, accidental, shift, duration, raw_ms, multiplier, override = value
                    if duration is not None:
                        state["duration"] = duration
                    length = (raw_ms if raw_ms is not None else state["duration"] * 60000 / score.tempo) * multiplier
                    if length < 4:
                        score.error("notes and rests must last at least one 4ms tick", item)
                    start, end = state["time"], state["time"] + length
                    state["time"] = end
                    if name in ("r", "s"):
                        if state["tie"] or accidental or shift or override:
                            score.error("a rest cannot be tied, pitched, or assigned an instrument", item)
                        continue
                    pitch_octave = state["octave"] + shift.count("'") - shift.count(",")
                    try:
                        pitch = note_number(f"{name}{accidental}{pitch_octave}")
                    except ValueError as error:
                        score.error(str(error), item)
                    sound = instrument(override, item) if override else state["sound"].copy()
                    env_name = sound["envelope"]
                    if env_name is not None and env_name not in score.envelopes:
                        score.error(f"unknown envelope {env_name!r}", item)
                    if sound["wave"] == "noise" and channel != 3:
                        score.error("noise instruments require channel 3", item)
                    envelope = score.envelopes[env_name] if env_name else flat
                    if state["tie"]:
                        previous = notes[-1]
                        if previous["pitch"] != pitch or previous["sound"] != sound:
                            score.error("tied notes must have the same pitch and instrument settings", item)
                        previous["end"] = end
                        state["tie"] = False
                    else:
                        notes.append(dict(start=start, end=end, pitch=pitch, sound=sound, envelope=envelope))
        expand(sequence)
        if state["tie"]:
            score.error("tie needs a following note", token)
        channels[channel] = notes
        endings.append(state["time"])
    return channels, max(endings)


def compile_source(source, filename="<score>", automation_ms=None):
    """Compile note notation and automation to A4 music or C1..C3 SFX bytes."""
    score = ScoreParser(source, filename).parse()
    interval = score.automation_ms if automation_ms is None else Fraction(automation_ms)
    if interval < 4 or interval % 4:
        score.error("automation interval must be a positive multiple of 4ms")
    channels, duration = score_events(score)
    if duration < (8 if score.loop else 4):
        score.error("a loop needs at least 8ms; a one-shot score needs at least 4ms")
    changes = []
    for channel, (name, _, _, _) in score.channels.items():
        wave = score.instruments[name]["wave"] if name else "square"
        changes.append((Fraction(0), -1, channel,
                        {"note": None, "volume": 0, "waveform": "square" if wave == "noise" else wave}))
    finish = duration
    for channel, notes in channels.items():
        for index, note in enumerate(notes):
            start, end, sound, envelope = (note[k] for k in ("start", "end", "sound", "envelope"))
            gate = start + (end - start) * sound["gate"]
            release = envelope["release"]
            stop = gate + (release[-1][0] if release else 0)
            if index + 1 < len(notes):
                stop = min(stop, notes[index + 1]["start"])
            if score.loop:
                stop = min(stop, duration)
            finish = max(finish, stop)
            step = envelope["curve"] == "step"
            gate_level = curve_level(envelope["points"], gate - start, step)
            times = {start, stop, min(gate, stop)}
            times.update(start + t for t, _ in envelope["points"] if start + t < min(gate, stop))
            times.update(gate + t for t, _ in release if gate + t < stop)
            # Constant stepped shapes need only their explicit breakpoints.
            ramps = any(a[1] != b[1] for a, b in zip(envelope["points"], envelope["points"][1:]))
            if "tremolo" in envelope or (not step and (ramps or release)):
                sample = (start // interval + 1) * interval
                while sample < stop:
                    times.add(sample)
                    sample += interval
            for time in sorted(times):
                if time >= stop:
                    continue
                if time >= gate and release:
                    level = curve_level([(Fraction(0), gate_level), *release], time - gate, step)
                else:
                    level = curve_level(envelope["points"], time - start, step)
                if "tremolo" in envelope:
                    level *= tremolo_level(envelope["tremolo"], time - start, time)
                volume = max(0, min(31, math.floor(float(level * sound["volume"]) + 0.5)))
                update = {"volume": volume}
                if time == start:
                    update.update(note=note["pitch"], waveform="square" if sound["wave"] == "noise" else sound["wave"])
                changes.append((time, 1, channel, update))
            changes.append((stop, 0, channel, {"note": None, "volume": 0}))

    def tick(time):
        # Round cumulative positions, never individual note lengths.
        return math.floor(time / 4 + Fraction(1, 2))

    terminal = max(2, tick(duration) if score.loop else tick(finish) + 1)
    timeline = {}
    for time, priority, channel, update in sorted(changes, key=lambda item: (item[0], item[1])):
        position = tick(time) + 1  # Every stream waits one tick before its first event.
        if position < terminal:
            timeline.setdefault(position, {}).setdefault(channel, {}).update(update)
    previous, events = 0, []
    volumes, waves, pitches = [24] * 4, ["square"] * 4, [None] * 4
    for position, updates in sorted(timeline.items()):
        filtered = {}
        for channel, update in updates.items():
            result = {}
            for field, values in (("volume", volumes), ("waveform", waves), ("note", pitches)):
                if field in update:
                    value = update[field]
                    if value != values[channel] or (field == "note" and value is not None):
                        result[field] = value
                    values[channel] = value
            if result:
                filtered[channel] = result
        if not events or filtered:
            events.append((position - previous, filtered))
            previous = position
    return _encode_events(sum(1 << channel for channel in channels), events, terminal - previous, score.loop, score.sfx)


def c_array(data, name):
    """Pack little-endian words; End/Loop makes trailing zero padding inert."""
    if not re.fullmatch(r"[A-Za-z_]\w*", name):
        raise ValueError("invalid C identifier")
    words = [int.from_bytes(data[i:i + 8].ljust(8, b"\0"), "little")
             for i in range(0, len(data), 8)]
    prefix = "/* Generated by avm_music.py. */\n#include <avm/audio.h>\n"

    def rows(values, indent):
        return "\n".join(indent + ", ".join(f"0x{x:016x}ULL" for x in values[i:i + 4]) + ","
                         for i in range(0, len(values), 4))

    if len(words) <= 65535:
        return (prefix + "static const uint64_t AVM_PROGMEM " + name + "[] = {\n"
                + rows(words, "    ") + "\n};\n")
    # Even word arrays eventually exceed Clang's 16-bit inferred bound.
    # Byte-aligned uint64 fields keep arbitrary FX-sized assets contiguous,
    # with each field smaller than the ordinary C object-size bound.
    chunks = [words[i:i + 2048] for i in range(0, len(words), 2048)]
    fields = "\n".join(f"    uint64_t part_{i}[{len(chunk)}];" for i, chunk in enumerate(chunks))
    bodies = ["    {\n" + rows(chunk, "        ") + "\n    }," for chunk in chunks]
    return (prefix + "static const AVM_PROGMEM struct {\n" + fields + "\n} " + name + "_avm_storage = {\n"
            + "\n".join(bodies) + "\n};\n#define " + name
            + " ((const uint8_t AVM_PROGMEM *)&" + name + "_avm_storage)\n")



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--name", help="emit a C array with this identifier")
    parser.add_argument("--automation-ms", type=int, help="sample score automation every N ms (multiple of 4)")
    parser.add_argument("--stats", action="store_true", help="report the compiled byte count")
    args = parser.parse_args()
    try:
        source = args.source.read_text(encoding="utf-8")
        data = compile_source(source, args.source, args.automation_ms)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        if args.name:
            header = c_array(data, args.name)
            if not args.output.exists() or args.output.read_text(encoding="utf-8") != header:
                args.output.write_text(header, encoding="utf-8")
        else:
            args.output.write_bytes(data)
        if args.stats:
            print(f"{args.source}: {len(data)} bytes ({'SFX' if data[0] != 0xA4 else 'A4'})", file=sys.stderr)
    except (ValueError, KeyError, TypeError, OSError) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
