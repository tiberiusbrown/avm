"""Decode exported scores to verify musical timing and automation behavior."""
import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location("music_score", Path(__file__).resolve().parents[2] / "tools/avm_music.py")
music = importlib.util.module_from_spec(spec)
spec.loader.exec_module(music)


def decode(data, raw=False):
    assert data and 1 <= data[0] <= 15
    events, offset, time = [], 1, 0
    midi = {music.note_increment(note): note for note in range(24, 96)}
    midi[0] = 128
    while True:
        delta, mask = data[offset:offset + 2]
        offset += 2
        time += delta + 1
        if not mask:
            command = data[offset]
            offset += 1
            assert command in (0, 1)
            if command:
                assert offset == len(data)
                return events, time, command
            continue
        update = {}
        for field, shift in (("note", 0), ("control", 4)):
            for channel in range(4):
                if mask & (1 << (channel + shift)):
                    width = 2 if field == "note" else 1
                    value = int.from_bytes(data[offset:offset + width], "little")
                    update.setdefault(channel, {})[field] = midi[value] if field == "note" and not raw else value & 31 if field == "control" else value
                    offset += width
                    if field == "control":
                        wave = value & 0x60
                        assert not (wave if channel == 3 else wave == 0x40)
                        if value & 32:
                            update[channel]["wave"] = "saw" if value & 64 else "triangle"
                        if value & 128:
                            update[channel]["seed" if channel == 3 else "duty"] = data[offset]
                            offset += 1
        events.append((time, update))


class ScoreTests(unittest.TestCase):
    def compile(self, source):
        return decode(music.compile_source(source))

    def test_score_volume_defaults_to_100_percent(self):
        body = """
            automation 4ms
            instrument lead { volume 17 wave saw duty 25% }
            channel 1 lead { volume_slide { to 3 over 16ms } c:24ms }
            channel 3 { noise_retrigger { every 8ms seed 37 } c:24ms }
        """
        for kind in ("", "sfx "):
            with self.subTest(kind=kind):
                self.assertEqual(music.compile_source(kind + body),
                                 music.compile_source(kind + "volume 100% " + body))

    def test_score_volume_scales_all_channels_and_sound_settings(self):
        events, end, command = self.compile("""
            volume 50%
            instrument lead { volume 20 }
            instrument bell { volume 10 }
            phrase riff { c:8ms d:8ms@bell volume 6 e:8ms use lead f:8ms }
            channel 0 lead { riff }
            channel 1 lead { riff }
            channel 2 lead { riff }
            channel 3 lead { riff }
        """)
        self.assertEqual((end, command), (8, 1))
        for channel in range(4):
            self.assertEqual([update[channel]["control"] for _, update in events],
                             [10, 5, 3, 10])

    def test_score_volume_percentages_round_and_saturate(self):
        for percent, expected in (("0", 0), ("12.5", 3), ("125/3", 10),
                                  ("50", 12), ("100", 24), ("150", 31)):
            for kind, channel in (("", 0), ("sfx ", 1)):
                with self.subTest(percent=percent, kind=kind):
                    events, end, command = self.compile(
                        f"{kind}volume {percent}% channel {channel} {{ duty 64 c:16ms r:8ms }}")
                    self.assertEqual(events[0][1][channel],
                                     {"note": 60, "control": expected, "duty": 64})
                    self.assertEqual((end, command), (7 if kind else 6, 1))
                    self.assertEqual(events[-1][1][channel]["note"], 128)
        events, _, _ = self.compile("volume 50% channel 0 { volume 1 c:8ms }")
        self.assertEqual(events[0][1][0]["control"], 1)

    def test_score_volume_validation(self):
        bad = (
            ("volume -1% channel 0 { c:8ms }", "nonnegative"),
            ("volume 50 channel 0 { c:8ms }", "expected '%'"),
            ("volume 50% volume 100% channel 0 { c:8ms }", "duplicate volume"),
            ("instrument lead { volume 12 } volume 50% channel 0 { c:8ms }", "must precede"),
            ("channel 0 { c:8ms } volume 50%", "must precede"),
            ("channel 0 { volume 50% c:8ms }", "channel volume must be 0..31"),
            ("volume max volume 50% channel 0 { c:8ms }", "duplicate volume"),
            ("volume 50% volume max channel 0 { c:8ms }", "duplicate volume"),
            ("channel 0 { c:8ms } volume max", "must precede"),
            ("instrument lead { volume 12 } volume max channel 0 { c:8ms }", "must precede"),
            ("volume max% channel 0 { c:8ms }", "unknown score command"),
            ("channel 0 { volume max c:8ms }", "expected a number"),
        )
        for source, message in bad:
            with self.subTest(source=source):
                with self.assertRaises(music.ScoreError) as error:
                    music.compile_source("// comment\n" + source, "bad.avms")
                self.assertRegex(str(error.exception), r"bad\.avms:2:\d+:")
                self.assertIn(message, str(error.exception))

    def test_score_volume_max_boosts_and_attenuates_equal_voices(self):
        for count, expected in ((1, 31), (2, 15), (3, 10), (4, 7)):
            for base in (1, 24, 31):
                with self.subTest(count=count, base=base):
                    source = "volume max " + " ".join(
                        f"channel {ch} {{ volume {base} c:16ms r:4ms }}"
                        for ch in range(count))
                    stats = {}
                    events, end, command = decode(music.compile_source(source, statistics=stats))
                    self.assertEqual([events[0][1][ch]["control"] for ch in range(count)],
                                     [expected] * count)
                    self.assertEqual((end, command), (5, 1))
                    self.assertEqual(stats["peak_volume"], count * expected)
                    self.assertGreater(stats["volume_percent"], 100 if base == 1 else 0)
                    if base == 24 and count > 1:
                        self.assertLess(stats["volume_percent"], 100)

    def test_score_volume_max_uses_one_scale_for_the_whole_score(self):
        events, _, _ = self.compile("""
            volume max
            channel 0 { volume 20 c:8ms volume 10 d:8ms r:4ms }
            channel 1 { volume 10 e:8ms volume 5 f:8ms r:4ms }
        """)
        self.assertEqual([events[0][1][ch]["control"] for ch in (0, 1)], [21, 10])
        self.assertEqual([events[1][1][ch]["control"] for ch in (0, 1)], [10, 5])

    def test_score_volume_max_counts_simultaneous_activity(self):
        events, end, _ = self.compile("""
            volume max
            channel 0 { volume 24 c:6ms r:10ms }
            channel 1 { volume 24 r:6ms c:10ms }
        """)
        self.assertEqual(events[0][1][0]["control"], 31)
        self.assertEqual(events[0][1][1]["control"], 0)
        self.assertEqual(events[1][1][0]["control"], 0)
        self.assertEqual(events[1][1][1]["control"], 31)
        self.assertEqual((events[1][0], end), (3, 4))

    def test_score_volume_max_ignores_updates_removed_by_tick_quantization(self):
        events, _, _ = self.compile("""
            volume max
            channel 0 { volume 31 gate 25% c:4ms r:28ms }
            channel 1 { volume 1 c:32ms }
        """)
        self.assertEqual(events[0][1][0]["control"], 0)
        self.assertEqual(events[0][1][1]["control"], 31)

    def test_score_volume_max_boosts_before_rounding_quiet_envelopes(self):
        events, _, _ = self.compile("""
            volume max
            envelope quiet { points 0ms:1% }
            channel 0 { volume 1 envelope quiet c:16ms }
        """)
        self.assertEqual(events[0][1][0]["control"], 31)

    def test_score_volume_max_preserves_silent_scores(self):
        for kind, channel in (("", 0), ("sfx ", 3)):
            for body in ("r:16ms", "volume 0 c:16ms r:4ms"):
                with self.subTest(kind=kind, body=body):
                    source = f"channel {channel} {{ {body} }}"
                    stats = {}
                    self.assertEqual(music.compile_source(kind + "volume max " + source,
                                                          statistics=stats),
                                     music.compile_source(kind + source))
                    self.assertEqual(stats["peak_volume"], 0)
                    self.assertEqual(stats["volume_percent"], 100)

    def test_raw_increments_and_physical_sfx_ownership(self):
        for mask in (2, 8, 10):
            channels = " ".join(f"channel {ch} {{ r:4ms c:8ms }}" for ch in (1, 3) if mask & (1 << ch))
            data = music.compile_source("sfx " + channels)
            self.assertEqual(data[0], mask)
            events, _, command = decode(data, raw=True)
            self.assertEqual(set(events[0][1]), {ch for ch in (1, 3) if mask & (1 << ch)})
            self.assertEqual(command, 1)
            self.assertTrue(all(update["note"] == 0 for update in events[0][1].values()))
        data = music._encode_events(2, [(1, {1: {"increment": 3717, "volume": 12}})], 1, True)
        self.assertEqual(data, bytes([2, 0, 0x22, 0x85, 0x0e, 140, 128, 0, 0, 1]))
        self.assertEqual(decode(data, raw=True)[0][0][1][1]["note"], 3717)
        self.assertEqual(music.note_increment(69), 1845)

    def test_loop_directive_and_unavailable_sfx_channels_are_rejected(self):
        for source in ("loop channel 0 { c4 }", "sfx loop channel 1 { c4 }", "sfx channel 0 { c4 }", "sfx channel 2 { r4 }"):
            with self.subTest(source=source), self.assertRaises(music.ScoreError):
                music.compile_source(source)

    def test_compiler_enforces_the_trusted_stream_contract(self):
        for mask in (0, 16, -1):
            with self.subTest(mask=mask), self.assertRaises(ValueError):
                music._encode_events(mask, [(1, {0: {"increment": 1234}})], 1)
        for channel in (1, 2, 3):
            with self.subTest(channel=channel), self.assertRaises(ValueError):
                music._encode_events(1, [(1, {channel: {"increment": 1234}})], 1)
        for seed in (0, 64, 127, 255):
            with self.subTest(seed=seed), self.assertRaises(ValueError):
                music._encode_events(8, [(1, {3: {"seed": seed}})], 1)
        for channel, wave in ((0, "noise"), (3, "pulse"), (3, "triangle"), (3, "saw")):
            with self.subTest(channel=channel, wave=wave), self.assertRaises(ValueError):
                music._encode_events(1 << channel, [(1, {channel: {"wave": wave}})], 1)

    def test_music_and_sfx_emit_identical_physical_stream_bytes(self):
        updates = {1: {"increment": 3717, "volume": 12, "wave": "saw", "duty": 64},
                   3: {"increment": 549, "volume": 8, "seed": 37}}
        song = music._encode_events(10, [(1, updates)], 256)
        effect = music._encode_events(10, [(1, updates)], 256, sfx=True)
        self.assertEqual(song, effect)
        self.assertEqual(song[:3], bytes([10, 0, 0xaa]))
        self.assertEqual(decode(song, raw=True)[1:], (257, 1))

    def test_pitches_durations_and_inheritance(self):
        events, end, command = self.compile("tempo 120 channel 0 octave 4 { c4 d8 e r2 }")
        onsets = [(t, u[0]["note"]) for t, u in events if u.get(0, {}).get("note", 128) != 128]
        self.assertEqual(onsets, [(1, 60), (126, 62), (189, 64)])
        self.assertEqual((end, command), (500, 1))

    def test_accidentals_octaves_and_retrigger(self):
        events, _, _ = self.compile("channel 0 octave 4 { c#8 db g'4 c, }")
        self.assertEqual([u[0]["note"] for _, u in events if u[0].get("note", 128) != 128], [61, 61, 79, 48])

    def test_simultaneous_tracks_and_initial_silence(self):
        events, _, _ = self.compile("channel 0 { c4 d } channel 2 { r4 e }")
        self.assertEqual(events[0][1][2], {"note": 128, "control": 0, "duty": 128})
        self.assertEqual(events[1], (126, {0: {"note": 62}, 2: {"note": 64, "control": 24}}))

    def test_exact_fractional_timing_and_loop_period(self):
        events, end, command = self.compile("tempo 120 channel 0 { repeat 8 { c8 } }")
        self.assertEqual([t for t, u in events if u[0].get("note", 128) != 128],
                         [1, 64, 126, 189, 251, 314, 376, 439])
        self.assertEqual((end, command), (500, 1))

    def test_music_boundary_includes_terminal_rests_on_the_longest_channel(self):
        events, end, command = self.compile("channel 0 { c:16ms r:24ms } channel 2 { g:24ms r:32ms }")
        self.assertEqual((end, command), (14, 1))
        self.assertTrue(all(t < end for t, _ in events))
        self.assertIn((5, {0: {"note": 128, "control": 0}}), events)
        self.assertIn((7, {2: {"note": 128, "control": 0}}), events)

    def test_music_truncates_final_release_but_sfx_preserves_it(self):
        body = """automation 4ms
            envelope tail { points 0ms:100% release 40ms:0% }
            instrument lead { volume 20 envelope tail }
            channel 1 lead { c:20ms }
        """
        events, end, command = self.compile(body)
        self.assertEqual((end, command), (5, 1))
        self.assertTrue(all(t < end for t, _ in events))
        self.assertEqual([u[1]["control"] for _, u in events], [20])
        tail, end, command = self.compile(body.replace("c:20ms", "c:20ms r:44ms"))
        self.assertEqual((end, command), (16, 1))
        self.assertIn((7, {1: {"control": 18}}), tail)
        self.assertEqual(self.compile("sfx " + body)[1:], (16, 1))

    def test_dots_tuplet_multipliers_and_bars(self):
        events, end, _ = self.compile("tempo 120 meter 3/4 channel 0 { c4. d8 e4 | }")
        self.assertEqual([t for t, u in events if u[0].get("note", 128) != 128], [1, 189, 251])
        self.assertEqual(end, 375)
        events, end, _ = self.compile("tempo 120 channel 0 { repeat 3 { c4*2/3 } }")
        self.assertEqual(end, 250)

    def test_phrase_and_repeat(self):
        events, end, _ = self.compile("phrase riff { c8 d } channel 0 { repeat 2 { riff } }")
        self.assertEqual([u[0]["note"] for _, u in events if u[0].get("note", 128) != 128], [60, 62, 60, 62])
        self.assertEqual(end, 250)

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
        self.assertEqual(end, 8)

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
            channel 0 lead { c:20ms r:24ms }
        """)
        self.assertIn((6, {0: {"control": 10}}), events)
        self.assertIn((7, {0: {"control": 8}}), events)
        self.assertEqual(end, 11)

    def test_new_note_cancels_old_release(self):
        events, end, _ = self.compile("""
            automation 4ms
            envelope shape { points 0ms:100% release 80ms:0% }
            instrument lead { volume 20 envelope shape gate 50% }
            channel 0 lead { c:40ms d:40ms r:64ms }
        """)
        self.assertIn((11, {0: {"note": 62, "control": 20}}), events)
        self.assertEqual(end, 36)

    def test_tremolo_depth_and_shape(self):
        events, _, _ = self.compile("""
            automation 4ms
            envelope trem { tremolo { period 32ms depth 100% wave triangle } }
            instrument lead { volume 20 envelope trem }
            channel 0 lead { c:32ms r:4ms }
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
        data = music.compile_source("channel 0 { repeat 22000 { c:8ms } }")
        self.assertGreater(len(data), 65535)
        events, end, command = decode(data)
        self.assertEqual((len(events), end, command), (22000, 44000, 1))

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
            self.assertIn(f"/* Compiled audio size: {len(data)} bytes. */", header)

    def test_header_exact_stream_sizes_and_cli_output(self):
        import re
        import subprocess
        import sys
        import tempfile
        for kind, score in (("song", "channel 0 { c:8ms }"), ("SFX", "sfx channel 1 { wave triangle c:8ms }")):
            data = music.compile_source(score)
            self.assertNotEqual(len(data) % 8, 0)
            header = music.c_array(data, "asset")
            self.assertEqual(int(re.search(r"Compiled .* size: (\d+) bytes", header)[1]), len(data))
            self.assertIn(f"Compiled audio size:", header)
            # Force the chunked representation with a real, large encoded stream.
            ch = 1 if kind == "SFX" else 0
            large = music._encode_events(1 << ch, ((1, {ch: {"increment": 1234}}) for _ in range(175000)),
                                         1, kind == "SFX")
            exported = music.c_array(large, "large")
            self.assertIn("_avm_storage", exported)
            self.assertIn(f"Compiled audio size: {len(large)} bytes.", exported)
            with tempfile.TemporaryDirectory() as folder:
                source, output = Path(folder)/"asset.avms", Path(folder)/"asset.bin"
                source.write_text(score)
                command = [sys.executable, str(Path(music.__file__)), str(source), str(output)]
                result = subprocess.run(command, capture_output=True, check=True)
                self.assertEqual((result.stdout, result.stderr), (b"", b""))
                self.assertEqual(output.read_bytes(), data)
                header_output = Path(folder)/"asset.h"
                result = subprocess.run(command[:3] + [str(header_output), "--name", "asset"], capture_output=True, check=True)
                self.assertEqual((result.stdout, result.stderr), (b"", b""))
                self.assertEqual(header_output.read_text(), header)
                result = subprocess.run(command + ["--stats"], capture_output=True, check=True)
                self.assertIn(f"bytes={len(data)}".encode(), result.stderr)

    def test_triangle_controls_retention_switches_alias_and_initial_loop_state(self):
        for ch in range(3):
            data = music.compile_source(f"""
                instrument t {{ wave triangle duty 64 volume 12 }}
                channel {ch} {{ volume 12 duty 32 c:8ms wave triangle c:8ms
                    duty 192 c:8ms wave pulse c:8ms use t c:8ms wave square c:8ms }}""")
            # Inspect packed controls directly; waveform-only updates need no extension.
            offset, controls = 1, []
            while data[offset+1]:
                mask = data[offset+1]
                offset += 2 + (2 if mask & (1 << ch) else 0)
                if mask & (16 << ch):
                    control = data[offset]
                    offset += 1
                    duty = data[offset] if control & 128 else None
                    offset += int(bool(control & 128))
                    controls.append((control, duty))
            self.assertEqual(controls, [(140, 32), (44, None), (172, 192), (12, None), (172, 64), (12, None)])
            self.assertEqual(data[-1], 1)
        self.assertEqual(music.compile_source("channel 0 { wave square c4 }"),
                         music.compile_source("channel 0 { wave pulse c4 }"))
        for score in ("channel 3 { wave triangle c4 }", "channel 3 { wave triangle r4 }",
                      "instrument t { wave triangle } channel 3 t { r4 }", "channel 0 { wave noise r4 }"):
            with self.assertRaises(music.ScoreError):
                music.compile_source(score)
        for ch, wave in ((0, "noise"), (3, "triangle"), (3, "saw")):
            with self.assertRaises(ValueError):
                music._encode_events(1 << ch, [(1, {ch: {"wave": wave}})], 1)

    def test_saw_controls_instruments_rests_effects_and_all_transitions(self):
        for ch in range(3):
            for sfx in (False, True) if ch == 1 else (False,):
                for before, left in (("pulse", 0), ("triangle", 32), ("saw", 96)):
                    for after, right in (("pulse", 0), ("triangle", 32), ("saw", 96)):
                        data = music._encode_events(1 << ch, [
                            (1, {ch: {"wave": before, "increment": 123, "volume": 9}}),
                            (1, {ch: {"wave": after}}),
                            (1, {ch: {"volume": 10, "duty": 64}}),
                            (1, {ch: {"increment": 0}}),
                            (1, {ch: {"increment": 456, "volume": 9}}),
                        ], 1, sfx)
                        events, _, _ = decode(data, raw=True)
                        self.assertEqual([u[ch]["control"] for _, u in events if "control" in u[ch]], [9, 9, 10, 9])
                        self.assertEqual(events[2][1][ch]["wave"] if right else "pulse", after)
                        # Exact bytes: waveform-only control, duty extension, rest,
                        # then volume-only update retaining the current waveform.
                        mask = 16 << ch
                        self.assertIn(bytes([0, mask, 9 | right, 0, mask, 0x80 | 10 | right, 64]), data)
                        self.assertEqual(data[5], 0x80 | 9 | left)
            data = music.compile_source(f"""automation 4ms
                envelope fade {{ points 0ms:0%, 8ms:100% release 8ms:0% }}
                instrument bass {{ wave saw volume 9 duty 32 envelope fade
                    frequency_slide {{ delta 100cents over 16ms }}
                    duty_slide {{ to 192 over 16ms }} }}
                channel {ch} bass {{ c:32ms r:8ms c:32ms wave triangle c:8ms use bass c:32ms }}""")
            events, _, terminal = decode(data, raw=True)
            controls = [(tick, u[ch]) for tick, u in events if "control" in u.get(ch, {})]
            self.assertEqual(terminal, 1)
            self.assertTrue(all(u["wave"] == "saw" for tick, u in controls if tick < 19 or tick >= 21))
            self.assertTrue(any(u["wave"] == "triangle" for _, u in controls))
            self.assertTrue(any(u["control"] == 0 for _, u in controls))
            self.assertTrue(any(u.get("duty", 0) > 32 for _, u in controls))
        for source in ("channel 3 { wave saw c4 }", "channel 3 { wave saw r4 }",
                       "instrument bass { wave saw } channel 3 bass { r4 }", "channel 0 { wave sawtooth c4 }"):
            with self.assertRaises(music.ScoreError):
                music.compile_source(source)

    def test_three_waveform_example(self):
        source = Path(__file__).resolve().parents[2] / "examples/tonal_waveforms.avms"
        events, _, terminal = decode(music.compile_source(source.read_text()), raw=True)
        self.assertEqual(terminal, 1)
        self.assertNotIn("wave", events[0][1][0])
        self.assertEqual(events[0][1][1]["wave"], "triangle")
        self.assertEqual(events[0][1][2]["wave"], "saw")

    def test_pulse_and_triangle_exact_bytes(self):
        for wave, expected in (
            ("pulse", "0100114904894001110000000011490409000001"),
            ("triangle", "0100114904a94001110000200011490429000001"),
        ):
            source = f"channel 0 {{ wave {wave} volume 9 duty 64 c:8ms r:4ms c:8ms }}"
            self.assertEqual(music.compile_source(source), bytes.fromhex(expected))

    def test_triangle_oscillator_and_triangle_lfo_are_independent(self):
        data = music.compile_source("automation 4ms channel 2 { wave triangle volume 16 lfo { target volume depth 16 period 16ms wave triangle } c:20ms r:4ms }")
        events, _, _ = decode(data)
        self.assertEqual([u[2]["control"] for _, u in events], [0, 16, 31, 16, 0])
        self.assertTrue(all(u[2]["wave"] == "triangle" for _, u in events))

    def test_json_input_is_rejected(self):
        with self.assertRaises(music.ScoreError):
            music.compile_source('{"events": [{"channels": {"0": "C4"}}]}', "old.json")

    def test_long_delays_use_continue_records(self):
        data = music.compile_source("channel 0 { c:2400ms }")
        self.assertIn(bytes([255, 0, 0]), data)
        self.assertEqual(decode(data)[1:], (600, 1))

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
            "loop channel 0 { c:8ms }", "channel 0 { c:4ms }", "channel 0 { }",
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
        self.assertEqual(decode(data)[1:], (1000, 1))
        source = root / "projects/audio_demo/effects.avms"
        data = music.compile_source(source.read_text(encoding="utf-8"), source)
        events, _, command = decode(data, raw=True)
        self.assertEqual(command, 1)
        self.assertTrue(any("duty" in u for _, update in events for u in update.values()))
        self.assertTrue(any("seed" in u for _, update in events for u in update.values()))


if __name__ == "__main__":
    unittest.main()
