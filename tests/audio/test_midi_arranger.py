"""Synthetic musical assertions plus decoding through the existing AVMS compiler."""
import importlib.util
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import midi_to_avms as arranger
from test_score import decode

HAS_MIDO = importlib.util.find_spec("mido") is not None
if HAS_MIDO:
    import midi_fixtures as fixtures
    import mido


@unittest.skipUnless(HAS_MIDO, "optional MIDI tests need tools/requirements-midi.txt")
class MidiArrangerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "fixture.mid"

    def load(self, midi):
        midi.save(self.path)
        return arranger.read_midi(self.path)

    def convert(self, midi, **options):
        song = self.load(midi)
        arrangement = arranger.arrange(song, arranger.Settings(**options))
        source, data = arranger.compile_arrangement(arrangement)
        self.assertIn(data[0], range(1, 16))
        events, end, command = decode(data, raw=True)
        self.assertEqual(command, 1)
        for channel, notes in arrangement.voices.items():
            for i, note in enumerate(notes):
                self.assertEqual(note.channel, channel)
                self.assertTrue(24 <= note.pitch <= 95)
                self.assertGreater(note.end_tick, note.start_tick)
                if i:
                    self.assertLessEqual(notes[i - 1].end_tick, note.start_tick)
        return song, arrangement, source, data, events, end

    def test_type0_monophonic_is_nearly_exact_even_large_leaps_and_rests(self):
        midi = mido.MidiFile(type=0)
        expected = [(0, 240, 60, 60), (480, 240, 84, 100), (960, 120, 48, 90), (1440, 480, 72, 100)]
        midi.tracks.append(fixtures.track(expected, name="Melody"))
        song, arrangement, _, _, events, end = self.convert(midi, melody_octave=0)
        self.assertEqual([n.pitch for n in arrangement.voices[0]], [60, 84, 48, 72])
        self.assertFalse(arrangement.voices[1])
        self.assertFalse(arrangement.voices[2])
        onsets = [t for t, updates in events if updates.get(0, {}).get("note", 0)]
        self.assertEqual(onsets, [arranger.tick(n.start) + 1 for n in song.notes])
        self.assertLessEqual(abs(end * .004 - song.duration), .0021)

    def test_type1_named_melody_bass_chords_and_drums(self):
        song, a, source, data, _, _ = self.convert(fixtures.progression())
        self.assertEqual([n.sources[0] for n in a.voices[0]], [n.id for n in song.notes if n.track == 1])
        self.assertTrue(all(song.notes[n.sources[0]].track == 3 for n in a.voices[2]))
        self.assertEqual(data[0], 15)
        self.assertIn("arpeggio", source)
        self.assertTrue(a.voices[3])
        self.assertLess(a.report["mix_peak_amplitude_at_master_128"], 127)

    def test_piano_continuity_rejects_high_short_ornaments(self):
        _, a, _, _, _, _ = self.convert(fixtures.piano())
        self.assertEqual([n.pitch for n in a.voices[0]], [72, 74, 76, 74, 72, 71, 69, 72])
        self.assertTrue(a.voices[2])

    def test_dense_arrangement_keeps_melody_on_zero_bass_on_two(self):
        song, a, _, data, _, _ = self.convert(fixtures.dense())
        self.assertGreaterEqual(a.analysis.peak_polyphony, 9)
        self.assertEqual(data[0], 15)
        for channel, track in ((0, 1), (2, 3)):
            self.assertTrue(all(song.notes[n.sources[0]].track == track for n in a.voices[channel]))
        self.assertLess(len(data), 15000)
        self.assertLess(a.report["updates_per_second"], 150)

    def test_fast_repeated_attacks_remain_separate(self):
        _, a, _, _, events, _ = self.convert(fixtures.repeated())
        self.assertEqual(len(a.voices[0]), 32)
        self.assertEqual(sum(bool(u.get(0, {}).get("note", 0)) for _, u in events), 32)
        self.assertGreater(len({n.volume for n in a.voices[0]}), 1)

    def test_tempo_map_including_changes_between_note_events(self):
        song, a, _, _, events, end = self.convert(fixtures.tempos())
        self.assertAlmostEqual(song.notes[0].end, .5)
        self.assertAlmostEqual(song.notes[1].start, .625)
        self.assertAlmostEqual(song.notes[2].start, 1.375)
        self.assertEqual(len(song.tempos), 3)
        self.assertEqual(song.meters[-1].numerator, 3)
        onsets = [t for t, updates in events if updates.get(0, {}).get("note", 0)]
        for actual, note in zip(onsets, song.notes):
            self.assertLessEqual(abs((actual - 1) * .004 - note.start), .00201)
        self.assertLessEqual(abs(end * .004 - song.duration), .00201)
        self.assertLessEqual(a.report["quantization_max_error_ms"], 2.001)

    def test_sustain_repeated_notes_and_velocity_zero_off(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=480)
        midi.tracks.append(mido.MidiTrack([
            mido.Message("control_change", control=64, value=127),
            mido.Message("note_on", note=60, velocity=90),
            mido.Message("note_on", note=60, velocity=0, time=240),
            mido.Message("note_on", note=60, velocity=100, time=120),
            mido.Message("control_change", control=64, value=0, time=120),
            mido.Message("note_off", note=60, time=240),
        ]))
        song = self.load(midi)
        self.assertEqual([(n.start, n.end, n.key_end) for n in song.notes], [(0, .5, .25), (.375, .75, .75)])
        a = arranger.arrange(song)
        self.assertEqual(len(a.voices[0]), 2)

    def test_overlapping_same_pitch_pairs_fifo(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=480)
        midi.tracks.append(fixtures.track([(0, 480, 60, 80), (240, 480, 60, 90)]))
        song = self.load(midi)
        self.assertEqual([(n.start, n.end) for n in song.notes], [(0, .5), (.25, .75)])

    def test_program_channel_identity_and_shared_cross_track_state(self):
        midi = mido.MidiFile(type=1, ticks_per_beat=480)
        midi.tracks.append(mido.MidiTrack([mido.Message("program_change", channel=2, program=73),
                                           mido.Message("control_change", channel=2, control=64, value=127)]))
        midi.tracks.append(fixtures.track([(0, 240, 72, 90)], channel=2, program=40,
                                          controls=[(480, mido.Message("control_change", channel=2, control=64, value=0))]))
        song = self.load(midi)
        self.assertEqual((song.notes[0].track, song.notes[0].channel, song.notes[0].program), (1, 2, 40))
        self.assertEqual(song.notes[0].end, .5)

    def test_pitch_bend_expression_modulation_and_rpn(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=480)
        controls = [(0, mido.Message("control_change", control=1, value=90)),
                    (0, mido.Message("control_change", control=7, value=127)),
                    (0, mido.Message("control_change", control=101, value=0)),
                    (0, mido.Message("control_change", control=100, value=0)),
                    (0, mido.Message("control_change", control=6, value=12)),
                    (240, mido.Message("pitchwheel", pitch=4096)),
                    (480, mido.Message("control_change", control=11, value=30))]
        midi.tracks.append(fixtures.track([(0, 960, 72, 100)], name="Melody", controls=controls))
        song, a, source, _, _, _ = self.convert(midi)
        self.assertAlmostEqual(song.bends[-1].cents, 600)
        self.assertIn("frequency_slide", source)
        self.assertIn("volume_slide", source)
        self.assertIn("lfo", source)
        self.assertTrue(a.report["effects"])

    def test_bend_at_onset_survives_effects_zero(self):
        midi = mido.MidiFile(type=0)
        midi.tracks.append(fixtures.track([(0, 480, 72, 90)], controls=[(0, mido.Message("pitchwheel", pitch=2048))]))
        _, _, source, _, _, _ = self.convert(midi, effects=0)
        self.assertIn("frequency_slide", source)

    def test_complex_expression_has_diagnostic_and_complete_ir(self):
        midi = mido.MidiFile(type=0)
        controls = [(t, mido.Message("pitchwheel", pitch=p)) for t, p in ((120, 4096), (240, -4096), (360, 0))]
        midi.tracks.append(fixtures.track([(0, 480, 72, 90)], controls=controls))
        song, a, _, _, _, _ = self.convert(midi)
        self.assertEqual(len(song.bends), 3)
        self.assertTrue(any("multi-point pitch" in w for w in a.report["warnings"]))

    def test_out_of_range_and_bass_register(self):
        midi = mido.MidiFile(type=1)
        midi.tracks.extend((fixtures.track([(0, 480, 108, 90)], name="Melody"),
                            fixtures.track([(0, 480, 12, 90)], channel=1, program=32, name="Bass")))
        _, a, _, _, _, _ = self.convert(midi)
        self.assertTrue(48 <= a.voices[0][0].pitch <= 88)
        self.assertTrue(40 <= a.voices[2][0].pitch <= 67)
        self.assertTrue(a.report["octave_adjusted_notes"]["bass"])

    def test_drums_classification_priority_rate_mapping_and_density(self):
        song, a, _, _, _, _ = self.convert(fixtures.progression())
        first = a.voices[3][0]
        self.assertEqual(first.instrument, "kick")
        self.assertNotEqual(first.pitch, song.notes[first.sources[0]].pitch)
        _, quiet, _, _, _, _ = self.convert(fixtures.progression(), percussion_density=0)
        self.assertFalse(quiet.voices[3])
        self.assertEqual(arranger.drum_class(39), "clap")
        self.assertEqual(arranger.drum_class(45), "tom")
        self.assertEqual(arranger.drum_class(46), "open_hat")
        self.assertEqual(arranger.drum_class(49), "cymbal")
        self.assertEqual(arranger.drum_class(54), "other")

    def test_rolls_use_deliberate_noise_retrigger(self):
        _, a, source, _, _, _ = self.convert(fixtures.drums())
        self.assertIn("noise_retrigger", source)
        self.assertTrue(any(len(n.sources) >= 3 for n in a.voices[3]))

    def test_noise_arbitration_for_onsets_sharing_a_hardware_tick(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=1000)
        midi.tracks.append(fixtures.track([(0, 40, 36, 90), (1, 40, 42, 110)], channel=9))
        _, a, _, data, _, _ = self.convert(midi)
        self.assertEqual(data[0], 8)
        self.assertEqual(len(a.voices[3]), 1)
        self.assertEqual(a.voices[3][0].instrument, "kick")

    def test_chord_changes_use_source_minor_intervals(self):
        midi = mido.MidiFile(type=1)
        midi.tracks.extend((fixtures.track([(0, 960, 84, 90), (960, 960, 83, 90)], name="Melody"),
                            fixtures.track([(t, 900, p, 80) for t, ps in ((0, (60, 63, 67)), (960, (62, 65, 69))) for p in ps], channel=1, name="Chords"),
                            fixtures.track([(0, 960, 36, 90), (960, 960, 38, 90)], channel=2, program=32, name="Bass")))
        _, a, _, _, _, _ = self.convert(midi)
        chords = a.analysis.chords
        self.assertEqual([c.quality for c in chords], ["minor", "minor"])
        for note in a.voices[1]:
            pcs = {(note.pitch + offset) % 12 for effect in note.effects for offset in effect.parameters.get("offsets", ())}
            self.assertEqual(pcs, {0, 3, 7} if note.start < 1 else {2, 5, 9})

    def test_silence_and_faithful_disable_arpeggios(self):
        _, a, _, _, _, _ = self.convert(fixtures.progression(), harmony_density=0)
        self.assertFalse(a.voices[1])
        _, _, source, _, _, _ = self.convert(fixtures.progression(), preset="faithful")
        self.assertNotIn("arpeggio {", source)

    def test_chiptune_broken_chords_and_timbre(self):
        _, a, _source, _, _, _ = self.convert(fixtures.progression(), preset="chiptune")
        self.assertTrue(any(n.articulation == "broken_chord" for n in a.voices[1]))
        self.assertTrue(all(n.sources for n in a.voices[1]))

    def test_manual_overrides_and_error_for_nonexistent_source(self):
        _, a, _, _, _, _ = self.convert(fixtures.progression(), melody_track=2, bass_channel=2)
        self.assertEqual(a.report["melody_source"]["track"], 2)
        with self.assertRaisesRegex(ValueError, "No pitched notes"):
            self.convert(fixtures.progression(), melody_track=99)

    def test_region_preserves_inherited_controllers(self):
        midi = mido.MidiFile(type=0)
        midi.tracks.append(fixtures.track([(0, 1920, 72, 100)], name="Melody", controls=[
            (0, mido.Message("control_change", control=7, value=127)),
            (240, mido.Message("control_change", control=11, value=32)),
            (240, mido.Message("pitchwheel", pitch=2048))]))
        _, a, source, _, _, end = self.convert(midi, start=.5, end=1.5)
        self.assertEqual(a.voices[0][0].start_tick, 0)
        self.assertLessEqual(a.voices[0][0].volume, 3)
        self.assertIn("frequency_slide", source)
        self.assertEqual(end, 250)

    def test_short_notes_policy_and_initial_delay(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=1000)
        midi.tracks.append(fixtures.track([(0, 1, 72, 90), (100, 8, 74, 90), (200, 100, 76, 90)], name="Melody"))
        _, a, _, _, events, _ = self.convert(midi)
        self.assertGreater(a.report["sub_tick_notes_omitted"], 0)
        self.assertEqual(events[0][0], 1)
        self.assertLessEqual(a.report["quantization_max_error_ms"], 2.001)

    def test_four_ms_final_note_does_not_add_a_release_tail(self):
        midi = mido.MidiFile(type=0, ticks_per_beat=500)
        midi.tracks.append(fixtures.track([(0, 4, 72, 90)], name="Melody"))
        _, _, _, _, _, end = self.convert(midi)
        self.assertEqual(end, 2)

    def test_missing_note_off_and_unmatched_off_diagnostics(self):
        midi = mido.MidiFile(type=0)
        midi.tracks.append(mido.MidiTrack([mido.Message("note_off", note=55), mido.Message("note_on", note=72, velocity=90)]))
        song = self.load(midi)
        self.assertEqual(len(song.warnings), 2)
        self.assertAlmostEqual(song.duration, .1)

    def test_channel_all_sound_off_and_reset_pedal(self):
        for controller in (120, 121, 123):
            with self.subTest(controller=controller):
                midi = mido.MidiFile(type=0)
                midi.tracks.append(fixtures.track([(0, 120, 72, 90)], controls=[
                    (0, mido.Message("control_change", control=64, value=127)),
                    (480, mido.Message("control_change", control=controller, value=0))]))
                song = self.load(midi)
                self.assertAlmostEqual(song.notes[0].end, .5)

    def test_empty_malformed_type2_and_smpte_fail_clearly(self):
        for midi, message in ((mido.MidiFile(type=0), "no notes"), (mido.MidiFile(type=2), "type 2")):
            midi.tracks.append(mido.MidiTrack())
            with self.subTest(message=message), self.assertRaisesRegex(ValueError, message):
                self.load(midi)
        self.path.write_bytes(b"not a MIDI file")
        with self.assertRaisesRegex(ValueError, "Cannot read MIDI"):
            arranger.read_midi(self.path)
        midi = fixtures.repeated()
        midi.ticks_per_beat = -24
        with self.assertRaisesRegex(ValueError, "SMPTE"):
            self.load(midi)

    def test_determinism_ir_regeneration_and_json_report(self):
        song, a, source, data, _, _ = self.convert(fixtures.progression())
        other = arranger.arrange(song)
        self.assertEqual((source, data), arranger.compile_arrangement(other))
        a.instruments["melody"].duty = 80
        edited = arranger.generate_score(a)
        self.assertIn("duty 80", edited)
        self.assertNotEqual(edited, source)
        self.assertIn("source", json.loads(json.dumps({"source": arranger.asdict(song)})))

    def test_cli_writes_compilable_source_binary_and_full_report(self):
        self.load(fixtures.tempos())
        output = self.path.with_suffix(".avms")
        report = self.path.with_suffix(".json")
        binary = self.path.with_suffix(".bin")
        result = subprocess.run([sys.executable, str(ROOT / "tools/midi_to_avms.py"), str(self.path), str(output),
                                 "--stats", "--report", str(report), "--binary", str(binary)], capture_output=True, text=True, check=False)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(arranger.avm_music.compile_source(output.read_text()), binary.read_bytes())
        contents = json.loads(report.read_text())
        self.assertIn("source", contents)
        self.assertIn("arrangement", contents)
        self.assertIn("compiled_song_bytes", contents["statistics"])


class SettingsTests(unittest.TestCase):
    def test_checked_in_imports_and_original_fixture_scores(self):
        import re
        stats = json.loads((ROOT / "projects/audio_demo/songs/conversion_stats.json").read_text())
        for name, report in stats.items():
            path = ROOT / "projects/audio_demo/songs" / name
            source = path.with_suffix(".avms").read_text()
            data = arranger.avm_music.compile_source(source)
            header = path.with_suffix(".h").read_text()
            words = re.findall(r"0x([0-9a-f]{16})ULL", header)
            self.assertEqual(b"".join(int(word, 16).to_bytes(8, "little") for word in words)[:len(data)], data)
            self.assertEqual(report["compiled_song_bytes"], len(data))
            self.assertLessEqual(report["quantization_max_error_ms"], 2.001)
            self.assertIn(data[0], range(1, 16))
        for path in (ROOT / "examples/midi_arranger").glob("*.avms"):
            with self.subTest(path=path.name):
                self.assertIn(arranger.avm_music.compile_source(path.read_text())[0], range(1, 16))

    def test_invalid_settings(self):
        for values in ({"effects": float("nan")}, {"harmony_density": 2}, {"lead_volume": 32},
                       {"bass_range": (24, 25)}, {"melody_channel": 16}):
            with self.subTest(values=values), self.assertRaises(ValueError):
                arranger.validate_settings(arranger.Settings(**values))

    def test_absolute_rounding_half_up(self):
        self.assertEqual([arranger.tick(t) for t in (.001, .002, .003, .006)], [0, 1, 1, 2])


if __name__ == "__main__":
    unittest.main()
