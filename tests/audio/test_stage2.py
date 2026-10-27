"""Synthetic Stage 2 tests; no copyrighted recordings or SoundFont required."""
import importlib.util
import sys
import unittest
from copy import deepcopy
from itertools import product
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
HAS_AUDIO = all(importlib.util.find_spec(name) is not None for name in ("numpy", "scipy"))
if HAS_AUDIO:
    import avm_music
    import midi_to_avms as midi
    import numpy as np
    from avm_audio_features import (
        Reference,
        activity,
        aligned_audio,
        estimate_alignment,
        extract,
        load_reference,
    )
    from avm_audio_optimize import (
        Config,
        candidate_groups,
        optimize,
        restore,
        snapshot,
        structure,
        valid_candidate,
    )
    from avm_audio_render import decode, render


def fixture(channels=(0,), duration=1.2):
    voices, instruments = {ch: [] for ch in range(4)}, {}
    for ch in channels:
        name = "i"+str(ch)
        instruments[name] = midi.Instrument(name, "noise" if ch == 3 else "pulse", 128, 8, ((0, 100),), 0)
        voices[ch] = [midi.ArrangedNote((60, 67, 48, 60)[ch], 0, duration, 100, (ch,), name, ch, volume=8)]
    return midi.Arrangement("Synthetic", duration, voices, instruments, (4, 4), 16, midi.Analysis([], 1), {"warnings": []})


@unittest.skipUnless(HAS_AUDIO, "optional Stage 2 tests need tools/requirements-stage2.txt")
class RenderTests(unittest.TestCase):
    def test_score_volume_max_has_no_overload_across_loop_phases_and_rates(self):
        source = """
            automation 4ms
            envelope fade { points 0ms:100%, 28ms:25% release 12ms:0% }
            channel 0 { volume 31 duty 0 c:40ms wave triangle e:40ms }
            channel 1 { volume 24 wave saw g:80ms }
            channel 2 { volume 17 envelope fade octave 2 c:40ms e:40ms }
            channel 3 { volume 31 noise_retrigger { every 12ms seed 37 } c:80ms }
        """
        data = avm_music.compile_source("volume max " + source)
        loud = avm_music.compile_source(source)
        for rate in (7812.5, 15625):
            with self.subTest(rate=rate):
                actual = render(data, rate=rate, duration=2., loop=True)
                self.assertEqual(actual.metrics()["clipping_fraction"], 0)
                self.assertLessEqual(int(np.max(np.abs(actual.mix))), 124)
                self.assertGreater(render(loud, rate=rate).metrics()["clipping_fraction"], 0)

    def test_end_uses_the_playback_loop_option_and_rejects_old_loop_commands(self):
        data = avm_music.compile_source("channel 0 { volume 12 c:16ms r:16ms }")
        self.assertEqual(decode(data)[-1].command, 1)
        stopped = render(data, duration=.1)
        repeated = render(data, duration=.1, loop=True)
        end = int(np.ceil(.032 * 15625))
        self.assertTrue(np.all(stopped.pcm[end:] == 128))
        self.assertTrue(np.any(repeated.pcm[end:] != 128))
        with self.assertRaisesRegex(ValueError, "Unknown audio command"):
            decode(data[:-1] + b"\x02")

    def test_triangle_arrangement_export_snapshots_and_optimizer_coordinates(self):
        arrangement = fixture((0, 2))
        for instrument in arrangement.instruments.values():
            instrument.wave = "triangle"
        restored = restore(arrangement, snapshot(arrangement))
        self.assertEqual(snapshot(restored), snapshot(arrangement))
        source, data = midi.compile_arrangement(restored)
        self.assertIn("wave triangle", source)
        self.assertTrue(all(control & 32 for event in decode(data) for ch, control, _ in event.controls))
        self.assertEqual(list(candidate_groups("timbre", restored, arrangement, Config())), [])
        for _, candidates in candidate_groups("effects", restored, arrangement, Config(optimize_effects=True)):
            for _, mutate in candidates:
                changed = deepcopy(restored)
                mutate(changed)
                for notes in changed.voices.values():
                    for note in notes:
                        self.assertFalse(any(e.kind == "duty_slide" or (e.kind == "lfo" and e.parameters["target"] == "duty")
                                             for e in note.effects))

    def test_non_pulse_all_phase_values_channels_amplitudes_and_rates(self):
        for wave, rate in product(("triangle", "saw"), (7812.5, 15625)):
            for ch in range(3):
                for volume in (0, 1, 7, 31):
                    for master in (0, 32, 128, 255):
                        inc = 128 if rate == 7812.5 else 256
                        data = avm_music._encode_events(1 << ch, [(1, {ch: {
                            "increment": inc, "volume": volume, "wave": wave, "duty": 0}})], 20)
                        actual = render(data, rate=rate, master=master, duration=.05)
                        first = int(np.ceil(rate / 250))
                        amp = volume
                        expected = []
                        for step in range(1, 257):
                            high = step & 255
                            sample = high - 128 if wave == "saw" else 2 * min(high, 255-high) - 127
                            expected.append((((sample * amp + 64) // 128) * master + 16) // 32)
                        np.testing.assert_array_equal(actual.mix[first:first+256], expected)
                        np.testing.assert_array_equal(actual.pcm[first:first+256], np.clip(np.array(expected)+128, 0, 255))

    def test_waveform_switches_duty_retention_loops_mixing_and_phase(self):
        data = avm_music.compile_source("""
            channel 0 { volume 31 duty 32 c:12ms wave triangle c:12ms duty 192 c:12ms wave saw c:12ms wave pulse c:12ms }
            channel 1 { volume 17 wave triangle e:24ms wave saw e:24ms wave square e:12ms }
            channel 2 { volume 24 wave saw g:60ms }
            channel 3 { wave noise volume 7 noise_retrigger { every 16ms seed 37 } c:60ms }
        """)
        events = decode(data)
        for rate in (7812.5, 15625):
            for master in (0, 128, 255):
                actual = render(data, rate=rate, master=master, duration=.31, loop=True)
                phases, incs, controls, duties = [0]*4, [0]*4, [0]*4, [128]*4
                state, index, base, expected = 1, 0, 0, []
                for n in range(len(actual.pcm)):
                    while n >= np.ceil((base + events[index].tick)*rate/250):
                        event = events[index]
                        for ch, pitch in event.pitches:
                            incs[ch] = min(65535, pitch*(2 if rate == 7812.5 else 1))
                        for ch, control, ext in event.controls:
                            controls[ch] = control
                            if ext >= 0:
                                if ch < 3:
                                    duties[ch] = ext
                                else:
                                    state, phases[3] = ext, 0
                        index += 1
                        if event.command == 1:
                            base += event.tick
                            index = 0
                    mix = 0
                    for ch in range(4):
                        total = phases[ch] + incs[ch]
                        phases[ch] = total & 65535
                        amp = (controls[ch] & 31) if incs[ch] else 0
                        if ch == 3:
                            if total > 65535:
                                state = (state >> 1) ^ (0xb8 if state & 1 else 0)
                            mix += -amp if state & 1 else amp
                        else:
                            high = phases[ch] >> 8
                            sample = high-128 if controls[ch] & 64 else 2*min(high, 255-high)-127 if controls[ch] & 32 else (127 if high < duties[ch] else -127)
                            mix += (sample*amp+64)//128
                    expected.append((mix*master+16)//32)
                np.testing.assert_array_equal(actual.mix, expected)
                np.testing.assert_array_equal(actual.pcm, np.clip(np.array(expected)+128, 0, 255))
                partial = render(data, rate=rate, master=master, start=.16, duration=.08, loop=True)
                np.testing.assert_array_equal(partial.pcm, actual.pcm[int(np.ceil(.16*rate)):int(np.ceil(.24*rate))])

    def test_triangle_control_reserved_bits_and_truncation(self):
        for ch in range(4):
            for control in range(256):
                data = bytes([1 << ch, 0, 16 << ch, control])
                if control & 128:
                    data += bytes([37])
                data += bytes([0, 0, 1])
                wave = control & 0x60
                if (wave if ch == 3 else wave == 0x40):
                    with self.assertRaises(ValueError):
                        decode(data)
                else:
                    self.assertEqual(decode(data)[0].controls[0][1], control & 127)
            for data in (bytes([1<<ch,0,16<<ch]), bytes([1<<ch,0,16<<ch,0x80])):
                with self.assertRaises(ValueError):
                    decode(data)

    def test_pulse_exact_integer_formula_and_initial_delay_both_rates(self):
        data = avm_music.compile_source("channel 0 { volume 31 duty 64 octave 4 a:200ms }")
        for rate in (7812.5, 15625):
            result = render(data, rate=rate)
            first = int(np.ceil(.004*rate))
            self.assertTrue(np.all(result.pcm[:first] == 128))
            inc = avm_music.note_increment(69)*(2 if rate == 7812.5 else 1)
            phase = np.arange(1, 101)*inc % 65536
            expected = 128+np.where((phase >> 8) < 64, 124, -124)
            np.testing.assert_array_equal(result.pcm[first:first+100], expected)

    def test_duty_extremes_and_volume_quantization(self):
        for duty in (0, 32, 64, 96, 128, 255):
            data = avm_music.compile_source(f"channel 0 {{ volume 31 duty {duty} c:200ms }}")
            r = render(data, master=255)
            self.assertTrue(set(r.mix.tolist()).issubset({0, (31*255+16)//32, (-31*255+16)//32}))

    def test_noise_scalar_lfsr_and_reseeding(self):
        data = avm_music.compile_source("channel 3 { wave noise volume 8 noise_retrigger { every 32ms seed 37 } c:200ms }")
        actual = render(data, rate=15625)
        events = decode(data)
        phase, state, inc, amp, index = 0, 1, 0, 0, 0
        expected = []
        for n in range(len(actual.pcm)):
            if index < len(events) and n >= np.ceil(events[index].tick*15625/250):
                e = events[index]
                for _, value in e.pitches:
                    inc = value
                for _, volume, seed in e.controls:
                    amp = volume*4
                    if seed >= 0:
                        phase, state = 0, seed
                if e.command == 1:
                    inc = 0
                index += 1
            total = phase+inc
            phase = total & 65535
            if total > 65535:
                state = (state >> 1) ^ (0xb8 if state & 1 else 0)
            expected.append(128+((-amp if state & 1 else amp) if inc else 0))
        np.testing.assert_array_equal(actual.pcm, expected)

    def test_phase_and_noise_state_are_preserved_across_skipped_prefix(self):
        data = avm_music.compile_source("channel 0 { duty 32 c:80ms duty 96 e:120ms } channel 3 { wave noise c:200ms }")
        full = render(data, duration=1.4, loop=True)
        for start in (.137, .4, .801):
            partial = render(data, start=start, duration=.12, loop=True)
            lo, hi = int(np.ceil(start*15625)), int(np.ceil((start+.12)*15625))
            np.testing.assert_array_equal(full.pcm[lo:hi], partial.pcm)

    def test_signed_mix_clips_only_after_sum(self):
        a = render(avm_music.compile_source("channel 0 { volume 31 duty 0 c:100ms } channel 1 { volume 31 duty 255 c:100ms }"))
        self.assertLess(a.metrics()["clipping_fraction"], .05)
        b = render(avm_music.compile_source("channel 0 { volume 31 duty 0 c:100ms } channel 1 { volume 31 duty 0 c:100ms }"))
        self.assertGreater(b.metrics()["clipping_fraction"], .9)
        self.assertEqual(int(b.mix.min()), -248)

    def test_invalid_binary_and_parameters(self):
        for data in (b"", b"\xa4\x01", b"\x00", b"\x01\x00\x10\x60", b"\x08\x00\x80\x80\x00"):
            with self.assertRaises(ValueError):
                render(data)
        with self.assertRaises(ValueError):
            render(b"\x01\x00\x00\x01", rate=16000)



@unittest.skipUnless(HAS_AUDIO, "optional Stage 2 tests need tools/requirements-stage2.txt")
class FeatureTests(unittest.TestCase):
    def test_dc_is_not_treated_as_audible_loudness(self):
        silence = extract(np.zeros(8000), 15625)
        dc = extract(np.ones(8000)*.8, 15625)
        self.assertLess(float(np.max(np.abs(dc.rms-silence.rms))), 1e-10)
        self.assertLess(float(dc.pitch.max()), 1e-10)

    def test_silence_is_finite_and_zero(self):
        f = extract(np.zeros(8000), 15625)
        self.assertTrue(np.all(np.isfinite(f.chroma)))
        self.assertEqual(float(f.rms.max()), 0)
        self.assertEqual(float(f.pitch.max()), 0)

    def test_brightness_pitch_and_two_tones(self):
        t = np.arange(15625)/15625
        low = extract(np.sin(2*np.pi*220*t), 15625)
        high = extract(np.sin(2*np.pi*880*t), 15625)
        self.assertGreater(np.median(high.centroid), np.median(low.centroid)*3)
        mixture = extract(np.sin(2*np.pi*220*t)+np.sin(2*np.pi*440*t), 15625)
        self.assertEqual(np.argmax(mixture.chroma.sum(axis=1)), 9)  # A
        self.assertGreater(mixture.pitch[57-24].sum(), mixture.pitch[58-24].sum())

    def test_ramp_attack_decay_features(self):
        t = np.arange(15625)/15625
        ramp = extract(t*np.sin(2*np.pi*440*t), 15625)
        self.assertGreater(ramp.rms[-20:-5].mean(), ramp.rms[5:20].mean()*3)
        attack = np.r_[np.zeros(4000), np.ones(4000)*.5, np.zeros(4000)]
        _, onset = activity(attack, 15625)
        self.assertLess(abs(np.argmax(onset)/250-4000/15625), .02)


    def test_alignment_keeps_midi_rests_and_detects_latency(self):
        rate, latency = 15625, .12
        times = (.4, .81, 1.37, 1.92)
        song = midi.Song("alignment", 2.4, [midi.Note(i, 60, t, t+.1, 100, 0, 0, 0, t*2) for i, t in enumerate(times)], [], [], [])
        audio = np.zeros(round(2.7*rate))
        for t in times:
            lo = round((t+latency)*rate)
            audio[lo:lo+1000] = np.exp(-np.arange(1000)/300)
        ref = Reference(audio, rate, {})
        alignment = estimate_alignment(ref, song)
        self.assertAlmostEqual(alignment["reference_offset_seconds"], latency, delta=.02)
        aligned = aligned_audio(ref, 2.4, alignment["reference_offset_seconds"])
        self.assertTrue(np.all(aligned[:round(.37*rate)] == 0))


@unittest.skipUnless(HAS_AUDIO, "optional Stage 2 tests need tools/requirements-stage2.txt")
class OptimizationTests(unittest.TestCase):
    def fit(self, initial, target, evaluations=160):
        audio = render(midi.compile_arrangement(deepcopy(target))[1]).audio
        original = snapshot(initial)
        result = optimize(initial, audio, None, Config(max_evaluations=evaluations, excerpt_duration=target.duration))
        self.assertEqual(snapshot(initial), original)
        self.assertLess(result.optimized["loss"], result.baseline["loss"])
        self.assertLessEqual(result.evaluations, evaluations)
        self.assertTrue(valid_candidate(result.arrangement, initial))
        return result

    def test_recover_duty(self):
        a = fixture()
        b = deepcopy(a)
        b.instruments["i0"].duty = 64
        r = self.fit(a, b)
        self.assertIn(r.arrangement.instruments["i0"].duty, (64, 192))
        self.assertLess(r.optimized["components"]["spectral"], .01)

    def test_recover_envelope(self):
        a = fixture()
        b = deepcopy(a)
        b.instruments["i0"].points = ((0, 0), (24, 100), (160, 60))
        r = self.fit(a, b)
        self.assertLess(r.optimized["components"]["envelope"], r.baseline["components"]["envelope"]*.6)

    def test_recover_vibrato(self):
        a = fixture(duration=1.6)
        b = deepcopy(a)
        b.voices[0][0].effects = [midi.Effect("lfo", {"target": "pitch", "depth": 20, "period_ms": 240})]
        r = self.fit(a, b, 220)
        effects = [e for n in r.arrangement.voices[0] for e in n.effects if e.kind == "lfo" and e.parameters["target"] == "pitch"]
        self.assertTrue(effects)
        self.assertEqual(effects[0].parameters["period_ms"], 240)
        self.assertAlmostEqual(effects[0].parameters["depth"], 20, delta=10)

    def test_recover_duty_slide(self):
        a = fixture(duration=1.6)
        b = deepcopy(a)
        b.voices[0][0].effects = [midi.Effect("duty_slide", {"to": 32, "over_ms": 240})]
        r = self.fit(a, b, 220)
        self.assertTrue(any(e.kind == "duty_slide" for e in r.arrangement.voices[0][0].effects))

    def test_balance_does_not_silence_parts(self):
        a = fixture((0, 1, 2))
        a.instruments["i1"].volume = a.voices[1][0].volume = 12
        b = deepcopy(a)
        b.instruments["i1"].volume = b.voices[1][0].volume = 9
        r = self.fit(a, b, 180)
        self.assertLess(r.optimized["components"]["balance"], r.baseline["components"]["balance"])
        self.assertTrue(all(n.volume >= 4 for notes in r.arrangement.voices.values() for n in notes))

    def test_retrigger_rhythm_and_preservation(self):
        a = fixture((3,), .8)
        # Distinct attacks retain identity: no continuous-hiss replacement.
        a.voices[3] = [midi.ArrangedNote(60, t, t+.12, 100, (i,), "i3", 3, volume=8) for i, t in enumerate((0., .2, .4, .6))]
        b = deepcopy(a)
        for n in b.voices[3]:
            n.effects = [midi.Effect("noise_retrigger", {"every_ms": 16, "seed": 37})]
        r = self.fit(a, b, 160)
        self.assertTrue(any(e.kind == "noise_retrigger" for n in r.arrangement.voices[3] for e in n.effects))
        self.assertEqual([(n.start, n.end) for n in a.voices[3]], [(n.start, n.end) for n in r.arrangement.voices[3]])

    def test_simple_reference_does_not_collect_effects(self):
        a = fixture((0, 2))
        reference = render(midi.compile_arrangement(deepcopy(a))[1]).audio
        r = optimize(a, reference, None, Config(max_evaluations=100, excerpt_duration=a.duration))
        self.assertFalse([e for notes in r.arrangement.voices.values() for n in notes for e in n.effects])
        for ch in (0, 2):
            self.assertEqual(structure(a, ch), structure(r.arrangement, ch))
        self.assertEqual(r.baseline["compiled_bytes"], r.optimized["compiled_bytes"])

    def test_invalid_structure_and_duplicate_effects_are_rejected(self):
        a = fixture((0, 2))
        b = deepcopy(a)
        b.duration += .004
        self.assertFalse(valid_candidate(b, a))
        b = deepcopy(a)
        b.voices[0][0].pitch += 1
        self.assertFalse(valid_candidate(b, a))
        b = deepcopy(a)
        effect = midi.Effect("duty_slide", {"to": 32, "over_ms": 240})
        b.voices[0][0].effects = [effect, effect]
        self.assertFalse(valid_candidate(b, a))
        self.assertEqual(snapshot(restore(a, snapshot(a))), snapshot(a))
if __name__ == "__main__":
    unittest.main()
