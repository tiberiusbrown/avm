import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location("music", Path(__file__).resolve().parents[2] / "tools/avm_music.py")
music = importlib.util.module_from_spec(spec)
spec.loader.exec_module(music)


class CompilerTests(unittest.TestCase):
    def test_note_names(self):
        self.assertEqual(music.note_number("C1"), 24)
        self.assertEqual(music.note_number("B6"), 95)
        self.assertEqual(music.note_number("A4"), 69)
        self.assertEqual(music.note_number("Db4"), music.note_number("C#4"))
        self.assertEqual(music.note_number(None), 128)

    def test_chord_and_retained_volume(self):
        data = music.compile_song({"mask": 3, "events": [
            {"channels": {"1": {"note": "E4", "volume": 7}, "0": "C4"}},
            {"delta": 300, "channels": {"0": None}}]})
        self.assertEqual(data, bytes([0xa2,3,0,0x33,60,64,24,7,255,0,0,43,1,128,0,0,1]))

    def test_sparse_rest_tempo_loop(self):
        data = music.compile_song({"mask": 1, "row_ticks": 25, "loop": True,
            "events": [{"delta": 2}, {"delta": 1, "row_ticks": 50, "channels": {"0": 60}}], "end_delta": 2})
        self.assertEqual(data, bytes([0xa2,1,49,0x11,128,24,49,1,60,99,0,2]))

    def test_validation(self):
        for value in [0, 23, 96, "bad", "C0"]:
            with self.assertRaises(ValueError): music.note_number(value)
        for song in [{"mask": 0}, {"row_ticks": 0}, {"end_delta": 0},
                     {"events": [{"delta": 0}]}, {"events": [{"delta": -1}]},
                     {"events": [{"delta": 1.5}]}, {"events": [{"delta": 10**20}]},
                     {"mask": 1, "events": [{"channels": {"1": 60}}]},
                     {"mask": 1, "events": [{"channels": {"1": {"volume": 7}}}]},
                     {"events": [{"channels": {"0": {"volume": 32}}}]},
                     {"events": [{"channels": {"0": {"volume": -1}}}]}]:
            with self.assertRaises(ValueError): music.compile_song(song)

    def test_one_byte_deltas_and_c_array(self):
        for n in [1,2,255,256]:
            self.assertEqual(music.delta_bytes(n), bytes([n-1]))
        for n in [0,257,65535]:
            with self.assertRaises(ValueError): music.delta_bytes(n)
        self.assertIn("AVM_PROGMEM song[]", music.c_array(bytes([162,1,0,0,1]), "song"))

    def test_long_waits_and_continue(self):
        for ticks in [1,256,257,512,600,65536]:
            with self.subTest(ticks=ticks):
                data = music.compile_song({"events": [{"delta": ticks, "channels": {"0": 60}}]})
                count = (ticks-1)//256
                self.assertEqual(data, bytes([0xa2,15]) + bytes([255,0,0])*count
                    + bytes([ticks-256*count-1,255,60,128,128,128,24,24,24,24,0,0,1]))
        self.assertEqual(music.compile_song({"events": [{"delta": 600}]}),
            bytes([0xa2,15,255,0,0,255,0,0,87,255,128,128,128,128,24,24,24,24,0,0,1]))

    def test_full_mask_and_noise_note_volume(self):
        self.assertEqual(music.compile_song({"mask": 8, "events": [{"channels": {
            "3": {"note": "C3", "volume": 16}}}]}), bytes([0xa2,8,0,0x88,48,16,0,0,1]))
        self.assertEqual(music.compile_song({"events": [{"channels": {
            str(ch): {"note": 95, "volume": 31} for ch in range(4)}}]}),
            bytes([0xa2,15,0,255,95,95,95,95,31,31,31,31,0,0,1]))

    def test_reject_instrument_fields(self):
        for name in ["square", "bass", "lead", "noise"]:
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "unknown channel field"):
                music.compile_song({"events": [{"channels": {
                    "0": {"instrument": name, "volume": 7, "note": "C4"}}}]})

    def test_positive_time_loops(self):
        event = {"channels": {"0": 60}}
        self.assertEqual(music.compile_song({"loop": True}), bytes([0xa2,15,0,0,2]))
        self.assertEqual(music.compile_song({"loop": True, "events": [event]*100}),
            bytes([0xa2,15,0,255,60,128,128,128,24,24,24,24])
            + bytes([0,1,60])*99 + bytes([0,0,2]))

    def test_packed_waveform_tracking(self):
        self.assertEqual(music.compile_song({"mask": 1, "events": [
            {"channels": {"0": {"note": "C4", "volume": 12, "waveform": "sine"}}},
            {"channels": {"0": {"volume": 7}}},
            {"channels": {"0": "D4"}},
            {"channels": {"0": {"waveform": "triangle"}}},
            {"channels": {"0": {"waveform": "sawtooth", "volume": 31}}},
            {"channels": {"0": {"waveform": "square"}}}]}),
            bytes([0xa2,1,0,0x11,60,0x6c,0,0x10,0x67,0,1,62,
                   0,0x10,0x27,0,0x10,0x5f,0,0x10,31,0,0,1]))

    def test_first_event_resets_every_owned_channel(self):
        self.assertEqual(music.compile_song({"mask": 5, "loop": True, "events": [
            {"channels": {"0": {"waveform": "sine"}}},
            {"channels": {"2": {"note": 65, "volume": 3, "waveform": "triangle"}}},
            {"channels": {"0": {"note": 70, "volume": 1, "waveform": "sawtooth"}}}]}),
            bytes([0xa2,5,0,0x55,128,128,0x78,24,0,0x44,65,0x23,
                   0,0x11,70,0x41,0,0,2]))
        for update, note, control in [
                ({"volume": 7},128,7), ({"waveform": "triangle"},128,0x38),
                ({"note": 60},60,24), ({},128,24)]:
            with self.subTest(update=update):
                self.assertEqual(music.compile_song({"mask": 1, "events": [
                    {"channels": {"0": update}}]}),
                    bytes([0xa2,1,0,0x11,note,control,0,0,1]))

    def test_waveform_validation_and_independent_channels(self):
        for wave in ["saw", "noise", "lead", 2, None, []]:
            with self.subTest(wave=wave), self.assertRaisesRegex(ValueError, "waveform must"):
                music.compile_song({"events": [{"channels": {"0": {"waveform": wave}}}]})
        self.assertEqual(music.compile_song({"mask": 3, "events": [
            {"channels": {"0": {"waveform": "sine"}, "1": {"waveform": "triangle"}}},
            {"channels": {"0": {"volume": 1}, "1": {"volume": 2}}}]}),
            bytes([0xa2,3,0,0x33,128,128,0x78,0x38,0,0x30,0x61,0x22,0,0,1]))


if __name__ == "__main__":
    unittest.main()
