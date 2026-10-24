"""Assert emitted parameters and timing, including composition and quantization."""
import math
import unittest

from test_score import music, decode


def resolved(source):
    events, end, command = decode(music.compile_source(source), raw=True)
    states = {ch: dict(note=0, control=24, duty=128) for ch in range(4)}
    result = {}
    for tick, updates in events:
        for ch, update in updates.items():
            states[ch].update({k: v for k, v in update.items() if k != "seed"})
        result[(tick - 1) * 4] = {ch: dict(value) for ch, value in states.items()}
    return result, events


def at(states, time, ch=0):
    return states[max(t for t in states if t <= time)][ch]


def pitch(note):
    return round(440 * 2 ** ((note - 69) / 12) * 65536 / 15625)


class EffectTests(unittest.TestCase):
    def test_score_volume_follows_all_volume_effects_and_scales_release(self):
        states, _ = resolved("""
            volume 25% automation 4ms
            envelope shape {
                points 0ms:50% release 16ms:0%
                tremolo { period 16ms depth 50% wave triangle }
            }
            instrument lead {
                volume 24 envelope shape gate 50%
                volume_slide { to 8 over 16ms }
                tremolo { period 16ms depth 50% wave triangle }
                lfo { target volume depth 4 period 16ms wave square }
            }
            channel 0 lead { c:32ms r:16ms }
        """)
        self.assertEqual([at(states, t)["control"] for t in range(0, 36, 4)],
                         [4, 2, 0, 0, 2, 1, 0, 0, 0])
        self.assertEqual(at(states, 32)["note"], 0)

    def test_score_volume_applies_before_final_clamp_and_mutes_noise_retriggers(self):
        for percent, expected in ((50, 24), (0, 0)):
            with self.subTest(percent=percent):
                states, events = resolved(f"""
                    volume {percent}% automation 4ms
                    channel 3 {{
                        volume 24 lfo {{ target volume depth 24 period 16ms wave square }}
                        noise_retrigger {{ every 4ms seed 37 }} c:16ms r:4ms
                    }}
                """)
                self.assertEqual(at(states, 0, 3)["control"], expected)
                self.assertEqual(at(states, 8, 3)["control"], 0)
                self.assertNotEqual(at(states, 8, 3)["note"], 0)
                self.assertEqual([(tick, update[3]["seed"]) for tick, update in events
                                  if "seed" in update[3]], [(1, 37), (2, 37), (3, 37), (4, 37)])

    def test_volume_slides_endpoints_and_clamps(self):
        for left, right, expected in ((24, 0, [24, 18, 12, 6, 0]),
                                      (0, 24, [0, 6, 12, 18, 24]),
                                      (24, 40, [24, 28, 31, 31, 31])):
            states, _ = resolved(f"automation 4ms channel 0 {{ volume_slide {{ from {left} to {right} over 16ms }} c:24ms }}")
            self.assertEqual([at(states, t)["control"] for t in range(0, 20, 4)], expected)

    def test_volume_delta_and_envelope_multiply(self):
        states, _ = resolved("""
            automation 4ms envelope half { points 0ms:50% }
            instrument x { volume 20 envelope half volume_slide { delta -20 over 16ms } }
            channel 0 x { c:24ms d:24ms }
        """)
        self.assertEqual([at(states, t)["control"] for t in (0, 8, 16, 24, 32)], [10, 5, 0, 10, 5])

    def test_frequency_slide_log_intermediates_and_end(self):
        for target, half in (("g4", 63.5), ("f3", 56.5)):
            states, _ = resolved(f"automation 4ms channel 0 {{ frequency_slide {{ to {target} over 16ms }} c:24ms }}")
            self.assertEqual(at(states, 8)["note"], pitch(half))
            self.assertEqual(at(states, 16)["note"], music.note_increment(target))
            self.assertEqual(at(states, 20)["note"], at(states, 16)["note"])

    def test_frequency_linear_hz_and_relative_cents(self):
        states, _ = resolved("automation 4ms channel 0 { frequency_slide { from 200Hz to 400Hz over 16ms curve linear } c:24ms }")
        self.assertEqual(at(states, 8)["note"], round(300 * 65536 / 15625))
        states, _ = resolved("automation 4ms channel 0 { frequency_slide { delta -600cents over 16ms } c:24ms }")
        self.assertEqual(at(states, 8)["note"], pitch(57))
        self.assertEqual(at(states, 16)["note"], pitch(54))

    def test_frequency_range_saturates(self):
        states, _ = resolved("channel 0 { frequency_slide { from 0.001Hz to 999999Hz over 16ms curve linear } c:24ms }")
        self.assertEqual(at(states, 0)["note"], 1)
        self.assertEqual(at(states, 16)["note"], 65535)

    def test_duty_slide_exact_values_and_coarse_endpoint(self):
        states, events = resolved("automation 12ms channel 0 { duty_slide { from 50% to 12.5% over 20ms } c:40ms }")
        self.assertEqual([at(states, t)["duty"] for t in (0, 12, 20, 24)], [128, 70, 32, 32])
        self.assertEqual([t for t, u in events if "duty" in u.get(0, {})], [1, 4, 6])

    def test_duty_delta_and_clamp(self):
        states, _ = resolved("automation 4ms channel 0 { duty 254 duty_slide { delta 8 over 16ms } c:24ms }")
        self.assertEqual([at(states, t)["duty"] for t in (0, 4, 16)], [254, 255, 255])

    def test_arpeggio_exact_boundaries_under_coarse_automation(self):
        states, events = resolved("automation 32ms channel 0 { arpeggio { offsets 0,4,7 step 4ms repeat } c:28ms r:4ms }")
        self.assertEqual([at(states, t)["note"] for t in range(0, 28, 4)], [pitch(n) for n in (60,64,67,60,64,67,60)])
        self.assertTrue(all("control" not in u[0] for _, u in events[1:]))

    def test_arpeggio_once_negative_offsets_and_restarts(self):
        states, _ = resolved("channel 0 { arpeggio { offsets 0,-12 step 4ms once } c:16ms d:16ms }")
        self.assertEqual([at(states, t)["note"] for t in (0,4,12,16,20)], [pitch(n) for n in (60,48,48,62,50)])

    def test_arpeggio_ties_rests_and_disable(self):
        states, _ = resolved("phrase chord { c:8ms ~ c:8ms } channel 0 { arpeggio { offsets 0,4,7 step 4ms } chord r:8ms c:8ms arpeggio off d:8ms }")
        self.assertEqual([at(states, t)["note"] for t in (8,12,16,24,28,32,36)],
                         [pitch(67),pitch(60),0,pitch(60),pitch(64),pitch(62),pitch(62)])

    def test_arpeggio_clamps_note_range(self):
        states, _ = resolved("channel 0 octave 1 { arpeggio { offsets -12,71 step 4ms } c:8ms r:4ms }")
        self.assertEqual([at(states,t)["note"] for t in (0,4)], [pitch(24),pitch(95)])

    def test_glissando_up_down_target_and_disable(self):
        for direction, target, expected in (("up", "e4", (60,61,62,63,64,64)),
                                             ("down", "g3", (60,59,58,57,56,55))):
            states, _ = resolved(f"channel 0 {{ glissando {{ direction {direction} every 4ms to {target} }} c:24ms glissando off d:12ms }}")
            self.assertEqual([at(states,t)["note"] for t in range(0,24,4)], [pitch(n) for n in expected])
            self.assertEqual(at(states,32)["note"],pitch(62))

    def test_glissando_interval_and_boundary(self):
        states, _ = resolved("channel 0 octave 6 { glissando { direction up step 2semitones every 8ms } a:32ms }")
        self.assertEqual([at(states,t)["note"] for t in (0,8,16,24)], [pitch(n) for n in (93,95,95,95)])

    def test_note_cut_stops_modulation_and_recovers(self):
        states, events = resolved("""
            automation 32ms channel 0 {
                note_cut { after 12ms }
                lfo { target volume depth 31 period 16ms wave square }
                c:40ms d:40ms
            }
        """)
        self.assertEqual(at(states,12)["note"],0)
        self.assertEqual(at(states,32)["control"],0)
        self.assertNotEqual(at(states,40)["note"],0)
        self.assertEqual(at(states,52)["note"],0)
        self.assertFalse(any(4 < t < 11 for t, _ in events))

    def test_note_cut_zero_tie_and_noise(self):
        states, _ = resolved("channel 0 { note_cut { after 12ms } c:8ms ~ c:8ms note_cut off d:8ms }")
        self.assertEqual(at(states,12)["note"],0)
        self.assertEqual(at(states,16)["note"],pitch(62))
        states, _ = resolved("channel 3 { note_cut { after 0ms } c:16ms }")
        self.assertEqual(at(states,0,3)["note"],0)

    def test_lfo_shapes_and_volume_limits(self):
        expected = {"sine": [16,31,16,0], "triangle": [0,16,31,16], "square": [31,31,0,0]}
        for wave, values in expected.items():
            states, _ = resolved(f"automation 4ms channel 0 {{ volume 16 lfo {{ target volume depth 16 period 16ms wave {wave} }} c:20ms }}")
            self.assertEqual([at(states,t)["control"] for t in (0,4,8,12)], values)

    def test_lfo_pitch_cents_and_semitones(self):
        for depth in ("100cents", "1semitone"):
            states, _ = resolved(f"automation 4ms channel 0 {{ lfo {{ target pitch depth {depth} period 16ms }} c:20ms }}")
            self.assertEqual([at(states,t)["note"] for t in (0,4,8,12)], [pitch(n) for n in (60,61,60,59)])

    def test_lfo_duty_phase_and_independence(self):
        for phase, expected in (("note",128), ("song",96)):
            states, _ = resolved(f"automation 4ms channel 0 {{ lfo {{ target duty depth 12.5% period 16ms phase {phase} }} c:12ms d:12ms }} channel 1 {{ c:24ms }}")
            self.assertEqual(at(states,12)["duty"],expected)
            self.assertEqual(at(states,12,1)["duty"],128)

    def test_simultaneous_lfos_deterministic(self):
        source = """automation 4ms instrument x {
            lfo { target pitch depth 25cents period 24ms }
            lfo { target duty depth 20 period 32ms wave triangle }
            lfo { target volume depth 10 period 16ms wave square }
        } channel 0 x { repeat 4 { c:32ms } }"""
        self.assertEqual(music.compile_source(source),music.compile_source(source))
        states, _ = resolved(source)
        self.assertNotEqual(at(states,4)["note"],pitch(60))
        self.assertNotEqual(at(states,4)["duty"],128)
        self.assertEqual(at(states,8)["control"],14)

    def test_frequency_slide_plus_vibrato(self):
        states, _ = resolved("automation 4ms channel 0 { frequency_slide { delta -1200cents over 16ms } lfo { target pitch depth 100cents period 16ms } c:24ms }")
        self.assertEqual([at(states,t)["note"] for t in (0,4,8,12,16)], [pitch(n) for n in (60,58,54,50,48)])

    def test_duty_slide_plus_lfo(self):
        states, _ = resolved("automation 4ms channel 0 { duty_slide { from 128 to 64 over 16ms } lfo { target duty depth 16 period 16ms } c:24ms }")
        self.assertEqual([at(states,t)["duty"] for t in (0,4,8,12,16)], [128,128,96,64,64])

    def test_arpeggio_and_legacy_tremolo(self):
        states, _ = resolved("automation 4ms channel 0 { volume 20 arpeggio { offsets 0,7 step 4ms } tremolo { period 16ms depth 100% wave triangle } c:24ms }")
        self.assertEqual(at(states,4)["note"],pitch(67))
        self.assertEqual([at(states,t)["control"] for t in (0,4,8,12)], [20,10,0,10])

    def test_noise_retrigger_periodic_onset_disable_cut_and_envelope(self):
        source = """automation 32ms
            envelope fade { points 0ms:100%, 24ms:0% }
            instrument n { wave noise envelope fade noise_retrigger { every 8ms seed 37 onset no } note_cut { after 20ms } }
            channel 3 n { c:32ms noise_retrigger off note_cut off d:16ms }
        """
        states, events = resolved(source)
        seeds=[(t,u[3]["seed"]) for t,u in events if "seed" in u.get(3,{})]
        self.assertEqual(seeds,[(3,37),(5,37)])
        self.assertEqual(at(states,20,3)["control"],0)
        self.assertNotEqual(at(states,32,3)["note"],0)

    def test_seed_only_updates_are_never_deduplicated(self):
        source="sfx channel 3 { noise_retrigger { every 4ms seed 63 } c:16ms }"
        _, events=resolved(source)
        self.assertEqual([(t,u[3]["seed"]) for t,u in events],[(1,63),(2,63),(3,63),(4,63)])

    def test_reusable_effects_instruments_and_note_overrides(self):
        states, _=resolved("""
            effect bend { frequency_slide { delta -1200cents over 8ms } }
            instrument x { effects bend duty 32 }
            instrument y { volume 7 }
            phrase riff { c:16ms }
            channel 0 x { riff d:16ms@y frequency_slide off e:16ms }
        """)
        self.assertEqual(at(states,8)["note"],pitch(48))
        self.assertEqual(at(states,24)["note"],pitch(62))
        self.assertEqual(at(states,40)["note"],pitch(64))
        self.assertEqual(at(states,16)["control"],7)

    def test_effects_work_for_music_and_sfx(self):
        body="""channel 1 { volume_slide { delta -20 over 24ms } frequency_slide { to g4 over 24ms }
            duty_slide { to 32 over 24ms } lfo { target duty depth 8 period 16ms } note_cut { after 20ms } c:32ms }
            channel 3 { noise_retrigger { every 8ms seed 1 } c:32ms }"""
        self.assertEqual(resolved(body),resolved("sfx "+body))

    def test_invalid_effects_have_location_diagnostics(self):
        bad = ["arpeggio { offsets 0 step 4ms }", "arpeggio { offsets 0,72 step 4ms }",
               "arpeggio { offsets 0,4 step 1ms }", "glissando { direction sideways every 8ms }",
               "glissando { step 0 every 8ms }", "volume_slide { from 1 over 8ms }",
               "frequency_slide { to 0Hz over 8ms }", "duty_slide { delta 2 over 0ms }",
               "lfo { target pitch depth 20 period 16ms }", "lfo { target duty depth 2cents period 16ms }",
               "lfo { target volume depth -1 period 16ms }", "lfo { target duty depth 1 period 4ms }",
               "noise_retrigger { every 4ms seed 0 }", "noise_retrigger { every 4ms seed 64 }",
               "noise_retrigger { every 4ms seed 1 }", "effects missing",
               "arpeggio { offsets 0,4 step 4ms } glissando { every 4ms }"]
        for directive in bad:
            with self.subTest(directive=directive), self.assertRaisesRegex(music.ScoreError,r"bad.avms:1:\d+:"):
                music.compile_source(f"channel 0 {{ {directive} c:16ms }}","bad.avms")

    def test_automation_budget_statistics_and_binary_maximum(self):
        source="channel 0 { lfo { target pitch depth 25cents period 16ms } c:80ms }"
        with self.assertRaisesRegex(music.ScoreError,"budget"):
            music.compile_source(source,max_updates=2)
        stats={}
        data=music.compile_source(source,max_updates=None,statistics=stats)
        self.assertEqual(stats["bytes"],len(data))
        updates={c:dict(increment=1234,volume=31,**({"seed":63} if c==3 else {"duty":255})) for c in range(4)}
        data=music._encode_events(15,[(1,updates)],1)
        self.assertEqual(len(data),22) # 1 ownership byte + 18 max event + 3 terminal
        events,_,_=decode(data,raw=True)
        self.assertEqual(events[0][1][3]["seed"],63)
        for ch in range(3):
            self.assertEqual(events[0][1][ch]["duty"],255)


if __name__ == "__main__":
    unittest.main()
