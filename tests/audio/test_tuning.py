"""Per-note tuning: table limits, agreement with the runtime tone table and every compiler path."""
import math
from pathlib import Path
import re
import unittest

from test_score import music, decode

ROOT = Path(__file__).resolve().parents[2]


def increments(source, channel=0):
    events, _end, _command = decode(music.compile_source(source), raw=True)
    return [update[channel]["note"] for _tick, update in events
            if channel in update and update[channel].get("note")]


class NoteTuningTests(unittest.TestCase):
    def test_table_spans_the_note_range_and_stays_within_six_cents(self):
        self.assertEqual(len(music.NOTE_TUNING_CENTS), music.NOTE_LAST - music.NOTE_FIRST + 1)
        self.assertEqual(max(abs(c) for c in music.NOTE_TUNING_CENTS), 6)
        for note, cents in enumerate(music.NOTE_TUNING_CENTS, music.NOTE_FIRST):
            exact = 440 * 2 ** ((note - 69) / 12)
            total = music.GLOBAL_TUNING_CENTS + cents
            self.assertLessEqual(abs(total), 11)
            self.assertAlmostEqual(1200 * math.log2(music.note_frequency(note) / exact), total, places=6)

    def test_universal_shift_applies_to_every_note_including_untuned_low_notes(self):
        self.assertEqual(music.GLOBAL_TUNING_CENTS, -5)
        for note in range(24, 48):
            self.assertEqual(music.NOTE_TUNING_CENTS[note - music.NOTE_FIRST], 0)
            self.assertAlmostEqual(music.note_tuning_cents(note), -5)
        self.assertEqual(music.note_increment(69), 1838)

    def test_increments_stay_strictly_ascending(self):
        values = [music.note_increment(note) for note in range(24, 96)]
        self.assertTrue(all(a < b for a, b in zip(values, values[1:])))

    def test_fractional_pitches_interpolate_between_neighbours(self):
        low, high = 79, 80
        middle = music.note_tuning_cents(79.5)
        expected = (music.NOTE_TUNING_CENTS[low - 24] + music.NOTE_TUNING_CENTS[high - 24]) / 2
        self.assertAlmostEqual(middle, music.GLOBAL_TUNING_CENTS + expected)

    def test_runtime_direct_tone_table_matches_the_compiler(self):
        text = (ROOT / "runtime/lib/note_increments.inc").read_text()
        values = [int(v) for v in re.findall(r"\b\d+\b", re.sub(r"/\*.*?\*/", "", text, flags=re.S))]
        self.assertEqual(values, [music.note_increment(note) for note in range(24, 96)])
        source = (ROOT / "runtime/lib/audio_tone.c").read_text()
        self.assertIn('#include "note_increments.inc"', source)

    def test_written_notes_arpeggios_glissandos_and_slide_endpoints_share_the_table(self):
        self.assertEqual(increments("channel 0 octave 5 { g4 }"), [music.note_increment(79)])
        arp = increments("channel 0 octave 4 { arpeggio { offsets 0,4,7 step 40ms } c2 }")
        self.assertEqual(arp[:3], [music.note_increment(n) for n in (60, 64, 67)])
        gliss = increments("channel 0 octave 4 { glissando { direction up every 20ms to e4 } c2 }")
        self.assertTrue(set(gliss) <= {music.note_increment(n) for n in range(60, 65)})
        self.assertEqual(increments("channel 0 { frequency_slide { to g5 over 100ms } c2 }")[-1],
                         music.note_increment(79))

    def test_pitches_in_hertz_are_never_adjusted(self):
        end = increments("channel 0 { frequency_slide { to 1568Hz over 100ms } c2 }")[-1]
        self.assertEqual(end, round(1568 * 65536 / 15625))
        self.assertNotEqual(end, music.note_increment(91))


if __name__ == "__main__":
    unittest.main()
