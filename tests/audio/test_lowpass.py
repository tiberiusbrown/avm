"""Tonal-only low-pass rendering and state continuity."""
import importlib.util
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tools"))
HAS_AUDIO = all(importlib.util.find_spec(name) is not None for name in ("numpy", "scipy"))
if HAS_AUDIO:
    import numpy as np
    from avm_audio_render import render
    from avm_music import compile_source


@unittest.skipUnless(HAS_AUDIO, "optional rendering tests require NumPy and SciPy")
class LowpassTests(unittest.TestCase):
    def test_default_is_sample_exact_bypass(self):
        data = compile_source("channel 0 { volume 31 c:40ms } channel 3 { volume 7 c:40ms }")
        for rate in (7812.5, 15625):
            np.testing.assert_array_equal(render(data, rate=rate).pcm, render(data, rate=rate, lowpass=0).pcm)

    def test_integer_reference_noise_bypass_and_clipping(self):
        tones = """
            channel 0 { volume 31 duty 32 c:40ms wave triangle e:40ms r:24ms }
            channel 1 { volume 24 wave saw g:104ms }
            channel 2 { volume 17 octave 2 c:104ms }
        """
        noise = "channel 3 { volume 31 noise_retrigger { every 16ms seed 37 } c:104ms }"
        for rate in (7812.5, 15625):
            for master in (32, 128, 255):
                raw = render(compile_source(tones + noise), rate=rate, master=32, duration=.15)
                tonal = render(compile_source(tones), rate=rate, master=32, duration=.15).mix
                percussion = raw.mix.astype(int) - tonal
                for level in (1, 2, 32, 64, 128, 254, 255):
                    actual = render(compile_source(tones + noise), rate=rate, master=master,
                                    duration=.15, lowpass=level)
                    state, expected = 0, []
                    coefficient = level if rate == 15625 else min(255, 2*level - (level*level >> 8))
                    for target, percussion_sample in zip(tonal, percussion):
                        delta = int(target) - state
                        step = (abs(delta)*coefficient + 255) >> 8
                        state += step if delta >= 0 else -step
                        expected.append(((state + int(percussion_sample)) * master + 16) // 32)
                    np.testing.assert_array_equal(actual.mix, expected)
                    np.testing.assert_array_equal(actual.pcm, np.clip(np.array(expected) + 128, 0, 255))
                    self.assertTrue(np.all(actual.pcm[-100:] == 128))

    def test_noise_is_unchanged_at_every_level(self):
        data = compile_source("channel 3 { volume 31 noise_retrigger { every 12ms seed 37 } c:120ms }")
        for rate in (7812.5, 15625):
            raw = render(data, rate=rate)
            for level in (1, 2, 32, 64, 128, 254, 255):
                actual = render(data, rate=rate, lowpass=level)
                np.testing.assert_array_equal(actual.pcm, raw.pcm)

    def test_excerpt_preserves_filter_history_and_loops(self):
        data = compile_source("channel 0 { volume 1 c:24ms wave saw g:24ms r:16ms }")
        for rate in (7812.5, 15625):
            for level in (1, 2, 32, 64, 128, 254, 255):
                full = render(data, rate=rate, lowpass=level, master=32, duration=.4, loop=True)
                partial = render(data, rate=rate, lowpass=level, master=32, start=.128, duration=.128, loop=True)
                first, stop = int(np.ceil(.128 * rate - 1e-9)), int(np.ceil(.256 * rate - 1e-9))
                np.testing.assert_array_equal(partial.pcm, full.pcm[first:stop])

    def test_invalid_levels_are_rejected(self):
        data = compile_source("channel 0 { c:40ms }")
        for level in (-1, 256, 1.5, "mild", None):
            with self.assertRaisesRegex(ValueError, "Lowpass coefficient"):
                render(data, lowpass=level)


if __name__ == "__main__":
    unittest.main()
