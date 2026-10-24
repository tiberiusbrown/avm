#!/usr/bin/env python3
"""Compile AVM scores (.avms) to compiler-validated music and SFX streams."""
import argparse
import ast
import math
import re
import sys
from fractions import Fraction
from pathlib import Path

EFFECTS = ("volume_slide", "frequency_slide", "duty_slide", "arpeggio",
           "glissando", "note_cut", "lfo", "noise_retrigger", "tremolo")
WAVE_BITS = {"pulse": 0x00, "triangle": 0x20, "saw": 0x60, "noise": 0x00}


def default_sound():
    return {"wave": "pulse", "volume": 24, "duty": 128,
            "envelope": None, "gate": Fraction(1)}


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


def _encode_events(mask, events, tail_ticks, sfx=False):
    """Encode resolved updates. An explicit increment permits non-semitone pitches."""
    if not isinstance(mask, int) or not 1 <= mask <= 15:
        raise ValueError("ownership mask must be 1..15")
    if sfx and mask & ~10:
        raise ValueError("SFX must declare only channels 1 and/or 3")
    # PLAY/SFX selects the stream kind; both formats use physical channel bits.
    # The AVR trusts these compiler checks and needs no type/version magic.
    output = bytearray([mask])
    notes, volumes, duties = [0] * 4, [24] * 4, [128] * 4
    waves = ["pulse"] * 3 + ["noise"]
    first = True
    for ticks, updates in events:
        changed_notes, changed_controls = {}, {}
        for channel, update in updates.items():
            if channel not in range(4) or not mask & (1 << channel):
                raise ValueError("event updates an undeclared channel")
            if update.keys() - {"note", "increment", "volume", "wave", "duty", "seed"}:
                raise ValueError("event fields must be note/increment, volume, wave, duty or seed")
            if "note" in update or "increment" in update:
                notes[channel] = update["increment"] if "increment" in update else note_increment(update["note"])
                if not isinstance(notes[channel], int) or not 0 <= notes[channel] <= 65535:
                    raise ValueError("phase increments must be uint16 values (0=off)")
                changed_notes[channel] = notes[channel]
            if "volume" in update:
                volumes[channel] = update["volume"]
            if not isinstance(volumes[channel], int) or not 0 <= volumes[channel] <= 31:
                raise ValueError("volume must be 0..31")
            if "wave" in update:
                wave = update["wave"]
                wave = "pulse" if wave == "square" else wave
                if wave not in (("noise",) if channel == 3 else ("pulse", "triangle", "saw")):
                    raise ValueError("wave must be pulse/triangle/saw on channels 0..2 or noise on channel 3")
                waves[channel] = wave
            waveform = WAVE_BITS[waves[channel]]
            extension = "seed" if channel == 3 else "duty"
            if "duty" in update:
                duties[channel] = update["duty"]
            if ("duty" in update and channel == 3) or ("seed" in update and channel != 3):
                raise ValueError("duty requires a tonal voice; noise seeds require channel 3")
            if "volume" in update or "wave" in update or extension in update:
                control = bytes([volumes[channel] | waveform | (128 if extension in update else 0)])
                if extension in update:
                    value = update[extension]
                    if not isinstance(value, int) or not (1 <= value <= 63 if channel == 3 else 0 <= value <= 255):
                        raise ValueError("noise seed must be 1..63; duty must be 0..255")
                    control += bytes([value])
                changed_controls[channel] = control
        if first:
            for channel in range(4):
                if mask & (1 << channel):
                    changed_notes[channel] = notes[channel]
                    if channel != 3:
                        changed_controls[channel] = bytes([128 | volumes[channel] | WAVE_BITS[waves[channel]], duties[channel]])
                    else:
                        changed_controls.setdefault(channel, bytes([volumes[channel]]))
            first = False
        packed = sum(1 << c for c in changed_notes) | sum(16 << c for c in changed_controls)
        payload = (bytes([packed]) + b"".join(changed_notes[c].to_bytes(2, "little") for c in sorted(changed_notes))
                   + b"".join(changed_controls[c] for c in sorted(changed_controls)))
        emit_event(output, ticks, payload if packed else bytes([0, 0]))
    emit_event(output, tail_ticks, bytes([0, 1]))
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
        self.volume = Fraction(1)
        self.sfx = False
        self.automation_ms = Fraction(8)
        self.envelopes, self.instruments, self.phrases, self.channels = {}, {}, {}, {}
        self.effects = {}

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
        sign = -1 if self.accept("-") else 1
        self.accept("+")
        token = self.take()
        try:
            value = Fraction(token[0])
            if self.accept("/"):
                value /= Fraction(self.take()[0])
        except (ValueError, ZeroDivisionError):
            self.error("expected a number or fraction", token)
        if integer and value.denominator != 1:
            self.error("expected an integer", token)
        value *= sign
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

    def duty_value(self):
        value = self.number()
        return value * 256 / 100 if self.accept("%") else value

    def pitch_value(self):
        token = self.tokens[self.position]
        if re.fullmatch(r"[a-gA-G][#b]?\d+", self.peek()):
            self.take()
            try:
                return 440 * 2 ** ((note_number(token[0]) - 69) / 12)
            except ValueError as error:
                self.error(str(error), token)
        value = self.number()
        self.expect("Hz")
        if value <= 0:
            self.error("frequency must be positive", token)
        return float(value)

    def pitch_delta(self):
        value = self.number()
        unit = self.take()
        if unit[0] not in ("cents", "semitone", "semitones"):
            self.error("pitch delta needs cents or semitones", unit)
        value *= 1 if unit[0] == "cents" else 100
        if abs(value) > 9600:
            self.error("pitch delta must be within 96 semitones", unit)
        return value

    def effect(self, kind):
        """Return parameter settings; directives persist and restart at each note."""
        if self.accept("off"):
            return {key: None for key in ("lfo_pitch", "lfo_volume", "lfo_duty")} if kind == "lfo" else {kind: None}
        if kind == "tremolo":
            return {kind: self.tremolo()}
        if kind == "lfo" and self.peek() in ("pitch", "volume", "duty"):
            target = self.take()[0]
            self.expect("off")
            return {"lfo_" + target: None}
        result = {}
        self.expect("{")
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            field = token[0]
            if field in result or (field == "rate" and "period" in result):
                self.error(f"duplicate {kind} field {field!r}", token)
            if kind in ("volume_slide", "duty_slide", "frequency_slide"):
                if field in ("from", "to", "delta"):
                    if kind == "duty_slide":
                        result[field] = self.duty_value()
                    elif kind == "frequency_slide":
                        result[field] = self.pitch_delta() if field == "delta" else self.pitch_value()
                    else:
                        result[field] = self.number()
                elif field == "over":
                    result[field] = self.time()
                elif field == "curve" and kind == "frequency_slide":
                    result[field] = self.name()
                    if result[field] not in ("log", "linear"):
                        self.error("pitch slide curve must be log or linear", token)
                else:
                    self.error(f"unknown {kind} field {field!r}", token)
            elif kind == "arpeggio":
                if field == "offsets":
                    result[field] = [self.number(integer=True)]
                    while self.accept(","):
                        result[field].append(self.number(integer=True))
                    if not 2 <= len(result[field]) <= 16 or any(abs(v) > 71 for v in result[field]):
                        self.error("arpeggio needs 2..16 offsets within -71..71 semitones", token)
                elif field == "step":
                    result[field] = self.time()
                elif field in ("repeat", "once"):
                    result[field] = True
                else:
                    self.error(f"unknown arpeggio field {field!r}", token)
            elif kind == "glissando":
                if field == "direction":
                    result[field] = self.name()
                    if result[field] not in ("up", "down"):
                        self.error("direction must be up or down", token)
                elif field == "step":
                    result[field] = self.number()
                    if self.peek() in ("semitone", "semitones"):
                        self.take()
                    if not 0 < result[field] <= 71:
                        self.error("glissando step must be greater than zero and at most 71 semitones", token)
                elif field == "every":
                    result[field] = self.time()
                elif field == "to":
                    result[field] = self.pitch_value()
                else:
                    self.error(f"unknown glissando field {field!r}", token)
            elif kind == "note_cut" and field == "after":
                result[field] = self.time()
            elif kind == "noise_retrigger":
                if field == "every":
                    result[field] = self.time()
                elif field == "seed":
                    result[field] = self.number(integer=True)
                    if not 1 <= result[field] <= 63:
                        self.error("noise seed must be 1..63", token)
                elif field == "onset":
                    result[field] = self.name()
                    if result[field] not in ("yes", "no"):
                        self.error("onset must be yes or no", token)
                else:
                    self.error(f"unknown noise_retrigger field {field!r}", token)
            elif kind == "lfo":
                if field in ("target", "wave", "phase"):
                    result[field] = self.name()
                    allowed = {"target": ("pitch", "volume", "duty"), "wave": ("sine", "triangle", "square"), "phase": ("note", "song")}
                    if result[field] not in allowed[field]:
                        self.error(f"{field} must be one of {', '.join(allowed[field])}", token)
                elif field == "depth":
                    # Keep units until target is known, permitting any field order.
                    result[field] = self.number()
                    result["units"] = self.take()[0] if self.peek() in ("%", "cents", "semitone", "semitones") else "raw"
                elif field == "period":
                    result[field] = self.time()
                elif field == "rate":
                    rate = self.number()
                    self.expect("Hz")
                    if rate <= 0:
                        self.error("LFO rate must be positive", token)
                    result["period"] = 1000 / rate
                else:
                    self.error(f"unknown lfo field {field!r}", token)
            else:
                self.error(f"unknown {kind} field {field!r}", token)
        required = {"volume_slide": ("over",), "frequency_slide": ("over",), "duty_slide": ("over",),
                    "arpeggio": ("offsets", "step"), "glissando": ("every",), "note_cut": ("after",),
                    "noise_retrigger": ("seed", "every"), "lfo": ("target", "depth", "period")}[kind]
        if any(field not in result for field in required):
            self.error(f"{kind} requires {', '.join(required)}")
        for field in ("over", "step" if kind == "arpeggio" else "every", "period"):
            if field in result and result[field] < (8 if field == "period" else 4):
                self.error(f"{kind} {field} must be at least {8 if field == 'period' else 4}ms")
        if kind.endswith("_slide") and (("to" in result) == ("delta" in result)):
            self.error("a slide requires exactly one of to or delta")
        if kind == "arpeggio" and "repeat" in result and "once" in result:
            self.error("arpeggio cannot be both repeat and once")
        if kind == "lfo":
            target, units, depth = result["target"], result.pop("units"), result["depth"]
            if target == "pitch":
                if units not in ("cents", "semitone", "semitones"):
                    self.error("pitch LFO depth needs cents or semitones")
                depth *= 1 if units == "cents" else 100
                maximum = 9600
            else:
                if units not in ("%", "raw"):
                    self.error("volume/duty LFO depth needs a raw delta or percentage")
                maximum = 31 if target == "volume" else 256
                if units == "%":
                    depth *= Fraction(maximum, 100)
            if not 0 <= depth <= maximum:
                self.error("LFO depth outside supported range")
            result.update(depth=depth, wave=result.get("wave", "sine"), phase=result.get("phase", "note"))
            return {"lfo_" + target: result}
        return {kind: result}

    def effect_bundle(self):
        result = {}
        self.expect("{")
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            if token[0] not in EFFECTS:
                self.error("expected an effect directive", token)
            settings = self.effect(token[0])
            if result.keys() & settings.keys():
                self.error("duplicate effect in bundle", token)
            result.update(settings)
        return result

    def setting(self, field, token):
        if field == "volume":
            value = self.number(integer=True)
            if not 0 <= value <= 31:
                self.error("channel volume must be 0..31", token)
        elif field == "duty":
            value = max(0, min(255, math.floor(self.duty_value() + Fraction(1, 2))))
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
            if field == "wave":
                if value not in ("pulse", "square", "triangle", "saw", "noise"):
                    self.error("wave must be pulse (square alias), triangle, saw or noise", token)
                if value == "square":
                    value = "pulse"
        return value

    def instrument(self):
        result = default_sound()
        self.expect("{")
        seen = set()
        while not self.accept("}"):
            if self.accept(";"):
                continue
            token = self.take()
            field = token[0]
            if field in EFFECTS:
                settings = self.effect(field)
                if seen & settings.keys():
                    self.error("duplicate instrument effect", token)
                seen.update(settings)
                result.update(settings)
                continue
            if field == "effects":
                result.setdefault("bundles", []).append(self.name())
                continue
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
            elif value in EFFECTS:
                result.append(("effect", self.effect(value), token))
            elif value == "effects":
                result.append(("effects", self.name(), token))
            elif value in ("use", "octave", "volume", "wave", "duty", "envelope", "gate"):
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
            if command in ("tempo", "meter", "volume", "automation", "sfx", "title", "description"):
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
                elif command == "volume":
                    self.volume = self.number() / 100
                    self.expect("%")
                    if self.volume < 0:
                        self.error("score volume must be a nonnegative percentage", token)
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
                elif command in ("envelope", "instrument", "phrase", "effect"):
                    name = self.name()
                    if command == "phrase" and (NOTE.fullmatch(name) or name in
                            ("repeat", "use", "octave", "volume", "wave", "duty", "envelope", "gate", "effects", *EFFECTS)):
                        self.error("phrase name conflicts with note notation or a sequence command", token)
                    table = getattr(self, command + "s")
                    if name in table:
                        self.error(f"duplicate {command} {name!r}", token)
                    table[name] = (self.effect_bundle() if command == "effect" else
                                   self.sequence() if command == "phrase" else getattr(self, command)())
                else:
                    self.error(f"unknown score command {command!r}", token)
        if not self.channels:
            self.error("score needs at least one channel")
        if self.sfx and any(channel not in (1, 3) for channel in self.channels):
            self.error("SFX must be one-shot and declare only channels 1 and/or 3")
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
            return default_sound()
        if name not in score.instruments:
            score.error(f"unknown instrument {name!r}", token)
        sound = score.instruments[name].copy()
        settings = {}
        for bundle in sound.pop("bundles", []):
            settings.update(effect_bundle(bundle, token))
        settings.update(sound)  # Explicit instrument fields override reusable effects.
        return settings

    def effect_bundle(name, token):
        if name not in score.effects:
            score.error(f"unknown effect {name!r}", token)
        return score.effects[name]

    for channel, (name, octave, sequence, token) in score.channels.items():
        notes = []
        state = {"time": Fraction(0), "duration": Fraction(1), "octave": octave,
                 "sound": instrument(name, token), "tie": False}

        def validate_channel(sound, item):
            if sound["wave"] in ("triangle", "saw") and channel == 3:
                score.error(f"{sound['wave']} instruments require a tonal channel (0..2)", item)
            if sound["wave"] == "noise" and channel != 3:
                score.error("noise instruments require channel 3", item)
            if sound.get("noise_retrigger") and channel != 3:
                score.error("noise_retrigger requires channel 3", item)
            if channel == 3 and any(sound.get(k) for k in ("duty_slide", "lfo_duty")):
                score.error("duty effects require a tonal channel", item)

        validate_channel(state["sound"], token)

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
                    validate_channel(state["sound"], item)
                elif kind == "octave":
                    state[kind] = value
                elif kind in ("volume", "wave", "duty", "envelope", "gate"):
                    state["sound"][kind] = value
                    validate_channel(state["sound"], item)
                elif kind in ("effect", "effects"):
                    state["sound"].update(value if kind == "effect" else effect_bundle(value, item))
                    validate_channel(state["sound"], item)
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
                    validate_channel(sound, item)
                    pitch_effects = [k for k in ("frequency_slide", "arpeggio", "glissando") if sound.get(k)]
                    if len(pitch_effects) > 1:
                        score.error("choose only one base pitch effect: frequency_slide, arpeggio, glissando", item)
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


def lfo_value(effect, elapsed, song_time):
    phase = float((elapsed if effect["phase"] == "note" else song_time) % effect["period"] / effect["period"])
    if effect["wave"] == "sine":
        return math.sin(2 * math.pi * phase)
    if effect["wave"] == "triangle":
        return 1 - 4 * abs(phase - 0.5)
    return 1 if phase < 0.5 else -1


def slide_value(effect, base, elapsed, pitch=False):
    left = effect.get("from", base)
    right = effect.get("to", left * 2 ** (float(effect["delta"]) / 1200) if pitch and "delta" in effect
                       else left + effect.get("delta", 0))
    amount = min(Fraction(1), elapsed / effect["over"])
    if pitch and effect.get("curve", "log") == "log":
        return float(left) * (float(right) / float(left)) ** float(amount)
    return left + (right - left) * amount


def compile_source(source, filename="<score>", automation_ms=None, max_updates=2000000, statistics=None):
    """Resolve effects offline. Only pitch, volume, wave, duty and seed reach firmware."""
    score = ScoreParser(source, filename).parse()
    interval = score.automation_ms if automation_ms is None else Fraction(automation_ms)
    if interval < 4 or interval % 4:
        score.error("automation interval must be a positive multiple of 4ms")
    channels, duration = score_events(score)
    if duration < (4 if score.sfx else 8):
        score.error("music needs at least 8ms; SFX needs at least 4ms")
    changes = []
    budget = 0

    def account(count):
        nonlocal budget
        budget += count
        if max_updates is not None and budget > max_updates:
            score.error("automation exceeds update budget; raise --max-updates explicitly")

    for channel in channels:
        update = {"increment": 0, "volume": 0}
        if channel != 3:
            update["duty"] = 128
            update["wave"] = "pulse"
        changes.append((Fraction(0), -1, channel, update))
    finish = duration
    for channel, notes in channels.items():
        for index, note in enumerate(notes):
            start, end, sound, envelope = (note[k] for k in ("start", "end", "sound", "envelope"))
            gate = start + (end - start) * sound["gate"]
            release = envelope["release"]
            stop = gate + (release[-1][0] if release else 0)
            if index + 1 < len(notes):
                stop = min(stop, notes[index + 1]["start"])
            if not score.sfx:
                stop = min(stop, duration)
            if sound.get("note_cut"):
                stop = min(stop, start + sound["note_cut"]["after"])
            finish = max(finish, stop)
            step = envelope["curve"] == "step"
            gate_level = curve_level(envelope["points"], gate - start, step)
            times = {start, stop, min(gate, stop)}
            times.update(start + t for t, _ in envelope["points"] if start + t < min(gate, stop))
            times.update(gate + t for t, _ in release if gate + t < stop)
            ramps = any(a[1] != b[1] for a, b in zip(envelope["points"], envelope["points"][1:]))
            automated = any(sound.get(k) for k in ("volume_slide", "frequency_slide", "duty_slide",
                           "lfo_pitch", "lfo_volume", "lfo_duty", "tremolo"))
            if automated or "tremolo" in envelope or (not step and (ramps or release)):
                sample = (start // interval + 1) * interval
                count = max(0, math.ceil((stop - sample) / interval))
                account(count)
                times.update(sample + i * interval for i in range(count))
            # Exact boundaries are independent of the smooth automation interval.
            for kind in ("volume_slide", "frequency_slide", "duty_slide"):
                if sound.get(kind) and start + sound[kind]["over"] < stop:
                    times.add(start + sound[kind]["over"])
            for kind, field in (("arpeggio", "step"), ("glissando", "every"), ("noise_retrigger", "every")):
                if not sound.get(kind):
                    continue
                effect = sound[kind]
                count = max(0, math.ceil((stop - start) / effect[field]) - 1)
                if kind == "arpeggio" and effect.get("once"):
                    count = min(count, len(effect["offsets"]) - 1)
                account(count)
                times.update(start + i * effect[field] for i in range(1, count + 1))
            account(1)
            for time in sorted(times):
                if time >= stop:
                    continue
                elapsed = time - start
                frequency = 440 * 2 ** ((note["pitch"] - 69) / 12)
                if sound.get("frequency_slide"):
                    frequency = slide_value(sound["frequency_slide"], frequency, elapsed, True)
                elif sound.get("arpeggio"):
                    arp = sound["arpeggio"]
                    position = int(elapsed // arp["step"])
                    position = min(position, len(arp["offsets"]) - 1) if arp.get("once") else position % len(arp["offsets"])
                    pitch = max(24, min(95, note["pitch"] + arp["offsets"][position]))
                    frequency = 440 * 2 ** ((pitch - 69) / 12)
                elif sound.get("glissando"):
                    gliss = sound["glissando"]
                    direction = -1 if gliss.get("direction", "up") == "down" else 1
                    pitch = max(24, min(95, note["pitch"] + direction * gliss.get("step", 1) * (elapsed // gliss["every"])))
                    frequency = 440 * 2 ** (float(pitch - 69) / 12)
                    if "to" in gliss:
                        base = 440 * 2 ** ((note["pitch"] - 69) / 12)
                        target = max(base, gliss["to"]) if direction > 0 else min(base, gliss["to"])
                        frequency = min(frequency, target) if direction > 0 else max(frequency, target)
                if sound.get("lfo_pitch"):
                    effect = sound["lfo_pitch"]
                    frequency *= 2 ** (float(effect["depth"]) * lfo_value(effect, elapsed, time) / 1200)
                duty = sound["duty"]
                if sound.get("duty_slide"):
                    duty = slide_value(sound["duty_slide"], duty, elapsed)
                if sound.get("lfo_duty"):
                    effect = sound["lfo_duty"]
                    duty += float(effect["depth"]) * lfo_value(effect, elapsed, time)
                if time >= gate and release:
                    level = curve_level([(Fraction(0), gate_level), *release], time - gate, step)
                else:
                    level = curve_level(envelope["points"], elapsed, step)
                base_volume = sound["volume"]
                if sound.get("volume_slide"):
                    base_volume = max(0, min(31, slide_value(sound["volume_slide"], base_volume, elapsed)))
                volume = level * base_volume
                if "tremolo" in envelope:
                    volume *= tremolo_level(envelope["tremolo"], elapsed, time)
                if sound.get("tremolo"):
                    volume *= tremolo_level(sound["tremolo"], elapsed, time)
                if sound.get("lfo_volume"):
                    effect = sound["lfo_volume"]
                    volume += float(effect["depth"]) * lfo_value(effect, elapsed, time)
                volume *= score.volume
                update = {"increment": max(1, min(65535, round(frequency * 65536 / 15625))),
                          "volume": max(0, min(31, math.floor(float(volume) + 0.5)))}
                if time == start:
                    update["onset"] = True
                if channel != 3:
                    update["duty"] = max(0, min(255, math.floor(float(duty) + 0.5)))
                    update["wave"] = sound["wave"]
                retrigger = sound.get("noise_retrigger")
                if retrigger and elapsed % retrigger["every"] == 0 and (elapsed or retrigger.get("onset", "yes") == "yes"):
                    update["seed"] = retrigger["seed"]
                changes.append((time, 1, channel, update))
            changes.append((stop, 0, channel, {"increment": 0, "volume": 0}))

    def tick(time):
        return math.floor(time / 4 + Fraction(1, 2))

    # Music has a fixed written boundary, whether the runtime repeats it or not.
    # SFX retains its final release and its existing one-shot timing.
    terminal = max(2, tick(finish) + 1 if score.sfx else tick(duration))
    timeline = {}
    for time, priority, channel, update in sorted(changes, key=lambda item: (item[0], item[1])):
        position = tick(time) + 1
        if position < terminal:
            merged = timeline.setdefault(position, {}).setdefault(channel, {})
            # A cut/off cancels every earlier seed/onset quantized to this tick.
            if update.get("increment") == 0:
                merged.pop("seed", None)
                merged.pop("onset", None)
            merged.update(update)
    previous, events = 0, []
    retained = [dict(volume=24, duty=128, increment=0, wave="pulse") for _ in range(4)]
    counts = dict(pitch=0, volume=0, duty=0, noise_retrigger=0)
    for position, updates in sorted(timeline.items()):
        filtered = {}
        for channel, update in updates.items():
            result = {}
            for field in ("volume", "duty", "increment", "wave"):
                if field in update:
                    value = update[field]
                    if value != retained[channel][field] or (field == "increment" and update.get("onset")):
                        result[field] = value
                        if field != "wave":
                            counts["pitch" if field == "increment" else field] += 1
                    retained[channel][field] = value
            if "seed" in update:
                result["seed"] = update["seed"]
                counts["noise_retrigger"] += 1
            if result:
                filtered[channel] = result
        if not events or filtered:
            events.append((position - previous, filtered))
            previous = position
    data = _encode_events(sum(1 << channel for channel in channels), events, terminal - previous, score.sfx)
    if statistics is not None:
        statistics.update(counts, bytes=len(data), events=len(events))
    return data


def c_array(data, name):
    """Pack little-endian words; End makes trailing zero padding inert."""
    if not re.fullmatch(r"[A-Za-z_]\w*", name):
        raise ValueError("invalid C identifier")
    words = [int.from_bytes(data[i:i + 8].ljust(8, b"\0"), "little")
             for i in range(0, len(data), 8)]
    prefix = ("/* Generated by avm_music.py. */\n"
              f"/* Compiled audio size: {len(data)} bytes. */\n\n#include <avm/audio.h>\n")

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
    parser.add_argument("--max-updates", type=int, default=2000000, help="automation budget (0 disables the limit)")
    args = parser.parse_args()
    try:
        source = args.source.read_text(encoding="utf-8")
        if args.max_updates < 0:
            raise ValueError("--max-updates must be nonnegative")
        stats = {}
        data = compile_source(source, args.source, args.automation_ms, args.max_updates or None, stats)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        if args.name:
            header = c_array(data, args.name)
            if not args.output.exists() or args.output.read_text(encoding="utf-8") != header:
                args.output.write_text(header, encoding="utf-8")
        else:
            args.output.write_bytes(data)
        if args.stats:
            print(f"{args.source}: " + ", ".join(f"{key}={value}" for key, value in stats.items()), file=sys.stderr)
    except (ValueError, KeyError, TypeError, OSError) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
