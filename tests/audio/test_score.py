"""Decode exported scores to verify musical timing and automation behavior."""
import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location("music_score", Path(__file__).resolve().parents[2] / "tools/avm_music.py")
music = importlib.util.module_from_spec(spec)
spec.loader.exec_module(music)


def decode(data, raw=False):
    effect = data[0] != 0xA5
    assert data[0] == 0xA5 or data[0] in (0xD1, 0xD2, 0xD3)
    events, offset, time = [], 1 if effect else 2, 0
    midi = {music.note_increment(note): note for note in range(24, 96)}
    midi[0] = 128
    while True:
        delta, mask = data[offset:offset + 2]
        offset += 2
        time += delta + 1
        if not mask:
            command = data[offset]
            offset += 1
            if command:
                assert offset == len(data)
                return events, time, command
            continue
        if effect:
            assert mask < 16
            mask = ((mask & 1) << 1) | ((mask & 2) << 2) | ((mask & 4) << 3) | ((mask & 8) << 4)
        update = {}
        for field, shift in (("note", 0), ("control", 4)):
            for channel in range(4):
                if mask & (1 << (channel + shift)):
                    width = 2 if field == "note" else 1
                    value = int.from_bytes(data[offset:offset + width], "little")
                    update.setdefault(channel, {})[field] = midi[value] if field == "note" and not raw else value & 31 if field == "control" else value
                    offset += width
                    if field == "control":
                        assert value & 0x60 == 0
                        if value & 128:
                            update[channel]["seed" if channel == 3 else "duty"] = data[offset]
                            offset += 1
        events.append((time, update))


class ScoreTests(unittest.TestCase):
    def compile(self, source):
        return decode(music.compile_source(source))

    def test_raw_increments_and_compact_sfx_ownership(self):
        for mask, tag in ((2, 0xD1), (8, 0xD2), (10, 0xD3)):
            channels = " ".join(f"channel {ch} {{ r:4ms c:8ms }}" for ch in (1, 3) if mask & (1 << ch))
            data = music.compile_source("sfx " + channels)
            self.assertEqual(data[0], tag)
            events, _, command = decode(data, raw=True)
            self.assertEqual(set(events[0][1]), {ch for ch in (1, 3) if mask & (1 << ch)})
            self.assertEqual(command, 1)
            self.assertTrue(all(update["note"] == 0 for update in events[0][1].values()))
        data = music._encode_events(2, [(1, {1: {"increment": 3717, "volume": 12}})], 1, False, True)
        self.assertEqual(data, bytes([0xD1, 0, 5, 0x85, 0x0e, 140, 128, 0, 0, 1]))
        self.assertEqual(decode(data, raw=True)[0][0][1][1]["note"], 3717)
        self.assertEqual(music.note_increment(69), 1845)

    def test_sfx_rejects_loops_and_unavailable_channels(self):
        for source in ("sfx loop channel 1 { c4 }", "sfx channel 0 { c4 }", "sfx channel 2 { r4 }"):
            with self.subTest(source=source), self.assertRaises(music.ScoreError):
                music.compile_source(source)

    def test_pitches_durations_and_inheritance(self):
        events, end, command = self.compile("tempo 120 channel 0 octave 4 { c4 d8 e r2 }")
        onsets = [(t, u[0]["note"]) for t, u in events if u.get(0, {}).get("note", 128) != 128]
        self.assertEqual(onsets, [(1, 60), (126, 62), (189, 64)])
        self.assertEqual((end, command), (501, 1))

    def test_accidentals_octaves_and_retrigger(self):
        events, _, _ = self.compile("channel 0 octave 4 { c#8 db g'4 c, }")
        self.assertEqual([u[0]["note"] for _, u in events if u[0].get("note", 128) != 128], [61, 61, 79, 48])

    def test_simultaneous_tracks_and_initial_silence(self):
        events, _, _ = self.compile("channel 0 { c4 d } channel 2 { r4 e }")
        self.assertEqual(events[0][1][2], {"note": 128, "control": 0, "duty": 128})
        self.assertEqual(events[1], (126, {0: {"note": 62}, 2: {"note": 64, "control": 24}}))

    def test_exact_fractional_timing_and_loop_period(self):
        events, end, command = self.compile("tempo 120 loop channel 0 { repeat 8 { c8 } }")
        self.assertEqual([t for t, u in events if u[0].get("note", 128) != 128],
                         [1, 64, 126, 189, 251, 314, 376, 439])
        self.assertEqual((end, command), (500, 2))

    def test_dots_tuplet_multipliers_and_bars(self):
        events, end, _ = self.compile("tempo 120 meter 3/4 channel 0 { c4. d8 e4 | }")
        self.assertEqual([t for t, u in events if u[0].get("note", 128) != 128], [1, 189, 251])
        self.assertEqual(end, 376)
        events, end, _ = self.compile("tempo 120 channel 0 { repeat 3 { c4*2/3 } }")
        self.assertEqual(end, 251)

    def test_phrase_and_repeat(self):
        events, end, _ = self.compile("phrase riff { c8 d } channel 0 { repeat 2 { riff } }")
        self.assertEqual([u[0]["note"] for _, u in events if u[0].get("note", 128) != 128], [60, 62, 60, 62])
        self.assertEqual(end, 251)

    def test_ties_preserve_one_attack(self):
        events, _, _ = self.compile("channel 0 { c4~ c4 r2 }")
        self.assertEqual(sum(u[0].get("note", 128) != 128 for _, u in events), 1)
        self.assertIn((251, {0: {"note": 128, "control": 0}}), events)

    def test_linear_envelope_and_pulse_duty(self):
        events, end, _ = self.compile("""
            automation 4ms
            envelope shape { points 0ms:0%, 8ms:100%, 16ms:50% }
            instrument lead { wave pulse duty 25% volume 20 envelope shape }
            channel 0 lead { c:32ms }
        """)
        self.assertEqual([u[0]["control"] for _, u in events], [0, 10, 20, 15, 10])
        self.assertEqual(events[0][1][0]["duty"], 64)
        self.assertEqual(end, 9)

    def test_stepped_custom_breakpoints(self):
        events, _, _ = self.compile("""
            envelope shape { points 0ms:100%, 12ms:50%, 24ms:25% curve step }
            instrument lead { volume 20 envelope shape }
            channel 0 lead { c:40ms }
        """)
        self.assertEqual([(t, u[0]["control"]) for t, u in events], [(1, 20), (4, 10), (7, 5)])

    def test_short_note_releases_from_current_attack_level(self):
        events, end, _ = self.compile("""
            automation 4ms
            envelope shape { points 0ms:0%, 40ms:100% release 20ms:0% }
            instrument lead { volume 20 envelope shape }
            channel 0 lead { c:20ms }
        """)
        self.assertIn((6, {0: {"control": 10}}), events)
        self.assertIn((7, {0: {"control": 8}}), events)
        self.assertEqual(end, 11)

    def test_new_note_cancels_old_release(self):
        events, end, _ = self.compile("""
            automation 4ms
            envelope shape { points 0ms:100% release 80ms:0% }
            instrument lead { volume 20 envelope shape gate 50% }
            channel 0 lead { c:40ms d:40ms }
        """)
        self.assertIn((11, {0: {"note": 62, "control": 20}}), events)
        self.assertEqual(end, 36)

    def test_tremolo_depth_and_shape(self):
        events, _, _ = self.compile("""
            automation 4ms
            envelope trem { tremolo { period 32ms depth 100% wave triangle } }
            instrument lead { volume 20 envelope trem }
            channel 0 lead { c:32ms }
        """)
        self.assertEqual([u[0]["control"] for _, u in events], [20, 15, 10, 5, 0, 5, 10, 15])
        self.assertTrue(all("note" not in u[0] for _, u in events[1:]))

    def test_tremolo_note_and_song_phase(self):
        for phase, expected in (("note", 20), ("song", 0)):
            events, _, _ = self.compile(f"""
                automation 4ms
                envelope trem {{ tremolo {{ rate 31.25Hz depth 100% wave square phase {phase} }} }}
                instrument lead {{ volume 20 envelope trem }}
                channel 0 lead {{ c:16ms d:16ms }}
            """)
            update = dict(events)[5][0]
            self.assertEqual(update["note"], 62)
            self.assertEqual(update.get("control", 20), expected)

    def test_beat_synchronized_tremolo(self):
        events, _, _ = self.compile("""
            tempo 120 automation 4ms
            envelope trem { tremolo { period 1/8 depth 50% wave triangle } }
            instrument lead { volume 20 envelope trem }
            channel 0 lead { c4 }
        """)
        levels = [u[0]["control"] for _, u in events]
        self.assertEqual((min(levels), max(levels)), (10, 20))

    def test_note_override_and_noise(self):
        events, _, _ = self.compile("""
            instrument bell { wave pulse duty 12.5% volume 12 }
            instrument drum { wave noise volume 8 }
            channel 0 { c8@bell use bell d }
            channel 3 drum { c,4 }
        """)
        self.assertEqual(events[0][1][0]["control"], 12)
        self.assertEqual(events[0][1][0]["duty"], 32)
        self.assertEqual(events[0][1][3]["control"], 8)

    def test_long_wait_and_unlimited_asset_size(self):
        data = music.compile_source("channel 0 { repeat 22000 { c:4ms } }")
        self.assertGreater(len(data), 65535)
        events, end, command = decode(data)
        self.assertEqual((len(events), end, command), (22000, 22001, 1))

    def test_word_export_preserves_bytes_and_padding(self):
        import re
        for length in (1, 7, 8, 9, 65535, 66006, 524281):
            data = bytes(i % 256 for i in range(length))
            header = music.c_array(data, "song")
            words = re.findall(r"0x([0-9a-f]{16})ULL", header)
            unpacked = b"".join(int(word, 16).to_bytes(8, "little") for word in words)
            self.assertEqual(unpacked[:length], data)
            self.assertLess(len(unpacked) - length, 8)
            self.assertEqual(unpacked[length:], bytes(len(unpacked) - length))

    def test_json_input_is_rejected(self):
        with self.assertRaises(music.ScoreError):
            music.compile_source('{"events": [{"channels": {"0": "C4"}}]}', "old.json")

    def test_long_delays_use_continue_records(self):
        data = music.compile_source("channel 0 { c:2400ms }")
        self.assertIn(bytes([255, 0, 0]), data)
        self.assertEqual(decode(data)[1:], (601, 1))

    def test_location_diagnostics_and_validation(self):
        bad = [
            "channel 4 { c4 }", "channel 0 { c3 }", "channel 0 { c:1ms }",
            "channel 0 { c4~ d4 }", "channel 0 { r4~ c4 }", "channel 0 { c4~ }",
            "channel 0 { missing }", "phrase riff { riff } channel 0 { riff }",
            "channel 0 missing { c4 }", "instrument x { volume 32 } channel 0 x { c4 }",
            "instrument x { envelope missing } channel 0 x { c4 }",
            "instrument x { wave noise } channel 0 x { c4 }",
            "envelope x { points 4ms:100% } channel 0 { c4 }",
            "envelope x { release 4ms:50% } channel 0 { c4 }",
            "envelope x { tremolo { rate 0Hz } } channel 0 { c4 }",
            "envelope x { tremolo { period 4ms } } channel 0 { c4 }",
            "envelope x { tremolo { period 32ms wave saw } } channel 0 { c4 }",
            "automation 5ms channel 0 { c4 }", "tempo 0 channel 0 { c4 }",
            "channel 0 { c4 | }", "channel 0 { repeat 0 { c4 } }",
            "channel 0 { c4 } channel 0 { d4 }", "channel 0 { c4 } tempo 100",
            "channel 0 { c4 } $",
            "loop channel 0 { c:4ms }", "channel 0 { }",
            "phrase c { d4 } channel 0 { c }",
        ]
        for source in bad:
            with self.subTest(source=source):
                with self.assertRaises(music.ScoreError) as error:
                    music.compile_source("// comment\n" + source, "bad.avms")
                self.assertRegex(str(error.exception), r"bad\.avms:2:\d+:")

    def test_checked_in_scores_and_generated_headers(self):
        root = Path(__file__).resolve().parents[2]
        for name in ("music", "effect"):
            source = root / "projects/audio_demo" / (name + ".avms")
            data = music.compile_source(source.read_text(encoding="utf-8"), source)
            expected = source.with_suffix(".h").read_text(encoding="utf-8")
            self.assertEqual(music.c_array(data, name), expected)
        source = root / "projects/audio_demo/tremolo.avms"
        data = music.compile_source(source.read_text(encoding="utf-8"), source)
        self.assertEqual(decode(data)[1:], (1000, 2))
        source = root / "projects/audio_demo/effects.avms"
        data = music.compile_source(source.read_text(encoding="utf-8"), source)
        events, _, command = decode(data, raw=True)
        self.assertEqual(command, 1)
        self.assertTrue(any("duty" in u for _, update in events for u in update.values()))
        self.assertTrue(any("seed" in u for _, update in events for u in update.values()))


if __name__ == "__main__":
    unittest.main()
