"""Small, original deterministic MIDI fixtures, also used for listening examples."""
import mido


def track(notes, channel=0, program=0, name="", controls=()):
    events = [(0, -2, mido.MetaMessage("track_name", name=name)),
              (0, -1, mido.Message("program_change", channel=channel, program=program))]
    for start, length, pitch, velocity in notes:
        events.extend([(start, 1, mido.Message("note_on", channel=channel, note=pitch, velocity=velocity)),
                       (start + length, 0, mido.Message("note_off", channel=channel, note=pitch))])
    events.extend((time, -1, message) for time, message in controls)
    result, previous = mido.MidiTrack(), 0
    for time, _, message in sorted(events, key=lambda e: (e[0], e[1])):
        result.append(message.copy(time=time - previous))
        previous = time
    return result


def progression():
    midi = mido.MidiFile(type=1, ticks_per_beat=480)
    midi.tracks.append(mido.MidiTrack([mido.MetaMessage("set_tempo", tempo=500000),
                                      mido.MetaMessage("time_signature", numerator=4, denominator=4)]))
    melody, bass, chords, drums = [], [], [], []
    for bar, root in enumerate((48, 53, 55, 48, 48, 53, 55, 48)):
        time = bar * 1920
        phrase = (root + 24, root + 28, root + 31, root + 28)
        melody.extend((time + j * 480, 400, pitch, 96 if j == 0 else 80) for j, pitch in enumerate(phrase))
        bass.extend(((time, 840, root - 12, 90), (time + 960, 840, root - 5, 76)))
        chords.extend((time, 1800, root + interval, 64) for interval in (0, 4, 7))
        drums.extend((time + j * 480, 60, 36 if j % 2 == 0 else 38, 90) for j in range(4))
        drums.extend((time + j * 240, 30, 42, 52) for j in range(8))
    midi.tracks.extend((track(melody, 0, 73, "Melody"), track(chords, 1, 48, "Chords"),
                        track(bass, 2, 32, "Bass"), track(drums, 9, name="Drums")))
    return midi


def piano():
    melody = [(i * 480, 420, p, 100) for i, p in enumerate((72, 74, 76, 74, 72, 71, 69, 72))]
    chords = [(i * 960, 900, p, 52) for i in range(4) for p in (48, 55, 60)]
    # High ornaments do not carry the tune, and must not win merely by pitch.
    ornaments = [(i * 480 + 120, 20, 88, 30) for i in range(8)]
    midi = mido.MidiFile(type=0, ticks_per_beat=480)
    midi.tracks.append(track(melody + chords + ornaments, name="Piano"))
    return midi


def dense():
    midi = progression()
    midi.tracks.append(track([(i * 480, 440, p, 50) for i in range(32) for p in (60, 64, 67, 71)], 4, 89, "Pad"))
    return midi


def repeated():
    midi = mido.MidiFile(type=0, ticks_per_beat=480)
    midi.tracks.append(track([(i * 60, 42, 72, 60 + (i % 4) * 20) for i in range(32)], name="Melody"))
    return midi


def tempos():
    midi = mido.MidiFile(type=1, ticks_per_beat=480)
    midi.tracks.append(mido.MidiTrack([
        mido.MetaMessage("set_tempo", tempo=500000),
        mido.MetaMessage("set_tempo", tempo=750000, time=240),
        mido.MetaMessage("time_signature", numerator=3, denominator=4, time=240),
        mido.MetaMessage("set_tempo", tempo=300000, time=480),
    ]))
    midi.tracks.append(track([(i * 480, 400, p, 90) for i, p in enumerate((72, 74, 76, 79, 76, 72))], name="Melody"))
    return midi


def drums():
    midi = progression()
    midi.tracks[4] = track([(i * 60, 30, 38, 84) for i in range(16)] +
                           [(960, 30, 49, 100), (1440, 30, 45, 100), (1680, 30, 46, 70)], 9, name="Drums")
    return midi
