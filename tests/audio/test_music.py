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
        self.assertEqual(data, bytes([0xa1,3,0,2,0xa7,0,3,60,64,255,44,1,1,128,0,64]))

    def test_sparse_rest_tempo_loop(self):
        data = music.compile_song({"mask": 1, "row_ticks": 25, "loop": True,
            "events": [{"delta": 2}, {"delta": 1, "row_ticks": 50, "channels": {"0": 60}}], "end_delta": 2})
        self.assertEqual(data, bytes([0xa1,1,50,0,50,1,60,100,128]))

    def test_validation(self):
        for value in [0, 23, 96, "bad", "C0"]:
            with self.assertRaises(ValueError): music.note_number(value)
        for song in [{"mask": 0}, {"loop": True}, {"events": [{"delta": 65536}]},
                     {"mask": 1, "events": [{"channels": {"1": 60}}]},
                     {"events": [{"channels": {"0": {"volume": 32}}}]},
                     {"events": [{"channels": {"0": 60}}] * 64}]:
            with self.assertRaises(ValueError): music.compile_song(song)

    def test_escapes_and_c_array(self):
        for n in [0,254,255,256,65535]:
            d = music.delta_bytes(n)
            actual = d[0] if d[0]<255 else d[1] + (d[2]<<8)
            self.assertEqual(actual,n)
        self.assertIn("AVM_PROGMEM song[]", music.c_array(bytes([161,1,0,64]), "song"))

    def test_reject_instrument_fields(self):
        for name in ["square", "bass", "lead", "noise"]:
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "unknown channel field"):
                music.compile_song({"events": [{"channels": {
                    "0": {"instrument": name, "volume": 7, "note": "C4"}}}]})

    def test_loop_boundary_budget(self):
        zero = {"channels": {"0": 60}}
        # Both halves fit alone; the loop suffix plus prefix must also fit.
        with self.assertRaises(ValueError):
            music.compile_song({"loop": True, "events": [zero]*40 + [{"delta": 1}] + [zero]*40})
        music.compile_song({"events": [zero]*62})
        with self.assertRaises(ValueError): music.compile_song({"events": [zero]*63})
        music.compile_song({"loop": True, "end_delta": 1, "events": [zero]*62})
        music.compile_song({"loop": True, "events": [{"delta": 1}]*100})


if __name__ == "__main__":
    unittest.main()
