# Composing AVMS Music for the Arduboy Piezo

This guide describes how to write clear, expressive game music with AVMS's three tonal voices and one noise voice. It focuses on **musical arrangement, articulation, and sound design** rather than cataloging every language feature. For complete grammar, effects, compilation, and playback details, see [AVMS score format and hardware PWM audio](audio.md).

The examples use valid AVMS source notation. Treat their instruments, volumes, note registers, tempos, and envelope lengths as **starting points**, not acoustic specifications. The piezo speaker and the complete game mix are the final judges.

## 1. Design the arrangement before the sounds

A good four-voice arrangement is not four continuously sounding parts. Give every active voice a job, and let the parts alternate between prominence and support.

| Channel | Suggested starting sound | Musical responsibility |
| --- | --- | --- |
| **0** | `wave pulse duty 25%` | Recognizable lead, melody, or foreground motif |
| **1** | `wave pulse duty 50%` | Arpeggiated harmony, offbeat chord stabs, countermelody, or occasional tonal percussion |
| **2** | `wave saw` | Bass, roots/fifths/octaves, rhythmic ostinato |
| **3** | `wave noise` | Short percussion accents, rolls, fills, and noisy ambience |

These are roles, not fixed sonic rules. Channels 0–2 can each play pulse, triangle, or sawtooth. A 50% pulse is square-like; narrow pulses are brighter and more incisive. A sawtooth has strong harmonics that may make low pitches more perceptible. A triangle is smoother, but can become difficult to hear at some registers. Test the intended waveform on the hardware rather than assuming one is universally superior.

**Two voices can be enough.** A good melody and moving bass line can carry an entire waltz, menu theme, or exploration loop. A third voice can imply the chord progression with arpeggios. Reserve the noise voice for moments when percussion actually improves the music; many quiet or atmospheric pieces do not need drums at all.

**Leave room for SFX.** AVM sequenced sound effects can temporarily take over channels **1 and/or 3**. When practical, keep the indispensable melody on channel 0 and bass on channel 2. The arrangement should retain its identity while the harmony or percussion disappears briefly.

### Write in this order

1. Choose the musical character: energetic, playful, mysterious, gentle, tense, triumphant, or something else.
2. Sketch the key or mode, chord progression, meter, and intended loop length.
3. Write a short **melodic hook** and a bass line that remain convincing when played alone.
4. Add one-voice harmony only where it clarifies the progression or supports the rhythm.
5. Shape attacks, decays, and note lengths before adding advanced effects.
6. Add selective percussion, fills, and decorative effects.
7. Check the loop boundary, whole-song balance, and SFX audibility on hardware.

## 2. AVMS notation used throughout this guide

AVMS is a *score language*, not a runtime tracker. The asset compiler resolves notes, envelopes, arpeggios, slides, and other effects into timed controls. The device plays the compiled stream; it does not execute the textual score.

### Score, instruments, and channels

```avms
title "A Small Theme"
tempo 120
meter 4/4
volume 75%
automation 8ms

envelope pluck {
    points 0ms:100%, 60ms:55%, 140ms:20%
    release 20ms:0%
}

instrument lead { wave pulse duty 25% volume 14 envelope pluck gate 85% }
instrument bass { wave saw volume 10 }

phrase opening { c8 e8 g4 e8 d8 c4 | }

channel 0 lead octave 5 { repeat 2 { opening } }
channel 2 bass octave 2 { repeat 2 { c4 g4 c'4 g4 | } }
```

The channel declaration is `channel NUMBER [INSTRUMENT] [octave OCTAVE] { ... }`. Declare each channel at most once. All channels begin at the same score time and advance independent, monophonic timelines. An `instrument` sets a reusable sound; `@name` selects a complete instrument for a single note. A `phrase` and `repeat` make musical source patterns easier to organize.

| Notation | Meaning |
| --- | --- |
| `c4`, `c8`, `c16` | C at the current octave, lasting a quarter, eighth, or sixteenth note |
| `c#8`, `eb8` | Accidentals for this note only |
| `c'8`, `c,8` | C one octave above or below the current octave |
| `octave 5` | Set the channel's base octave |
| `r8`, `s4` | Eighth or quarter rest (`r` and `s` are equivalent) |
| `c4.`, `c8*2/3` | Dotted quarter; eighth multiplied by two-thirds |
| `c:48ms`, `r:3ticks` | Explicit duration in milliseconds or 4 ms ticks |
| `e8@bell` | Play this note using instrument `bell` |
| `c4 ~ c4` | Tie into one continuous note and envelope rather than a fresh attack |
| `\|` | Verify an exact measure boundary |

**Important:** In a channel, `c4` means a **quarter-note C**, not C in octave 4. Choose pitch octave with `octave 4` or the `'` and `,` modifiers. An explicit denominator updates the inherited duration for following notes; the starting duration is a quarter note. Notated pitches must resolve to C1–B6.

All channels need not contain the same number of notes, but the **longest written channel timeline determines a music score's end**. Use terminal rests when a release tail or phrase needs room to finish.

### Envelope and effect syntax

An envelope shapes the volume of each note from its onset. `gate` specifies the fraction of the written duration before release begins; a defined `release` may continue into a rest. The next sounded note cancels that tail.

```avms
envelope singing {
    points 0ms:100%, 120ms:82%, 320ms:62%
    release 32ms:0%
}

instrument voice {
    wave pulse duty 25% volume 12 envelope singing gate 90%
    lfo { target pitch depth 12cents period 240ms }
}
```

Other supported effects include `arpeggio`, `volume_slide`, `frequency_slide`, `duty_slide`, `glissando`, `note_cut`, `tremolo`, and `noise_retrigger`. Effects can appear in instruments or before notes in a channel; `off` disables an effect for subsequent notes. Smooth modulation is compiled offline. The default `automation 8ms` is usually a good starting point; a smaller interval can increase stream size without an audible benefit.

**Source reuse is not binary compression.** AVMS expands `phrase` and `repeat` when compiling. Use them for consistent musical form and maintainability; assess resulting asset sizes with the compiler's `--stats` output.

## 3. Melody: make a small idea memorable

Start with a **one- or two-bar motif** that has a distinctive rhythm and melodic shape. Repeat it often enough to establish recognition, then vary one element at a time: the ending, the highest note, the harmony, the register, or the rhythmic emphasis.

A useful eight-bar design is:

- **Bars 1–2:** State the hook.
- **Bars 3–4:** Repeat or answer it over different chords.
- **Bars 5–6:** Develop it with a short run, octave lift, or different ending.
- **Bars 7–8:** Build a turnaround that points back to bar 1.

Do not fill every beat with notes. A rest can emphasize the following entrance more effectively than an extra pitch. Likewise, an answering phrase can be more engaging than a continuously busy line.

### Motifs that can move with the chords

**Pentatonic patterns** are particularly useful for changing harmony without writing an entirely new melody every bar:

- Major pentatonic: scale degrees **1, 2, 3, 5, 6**, or offsets `0, 2, 4, 7, 9` from the tonic.
- Minor pentatonic: scale degrees **1, ♭3, 4, 5, ♭7**, or offsets `0, 3, 5, 7, 10`.

For example, a minor-pentatonic riff can often be moved among the minor **i, iv, and v** chords, while a major-pentatonic riff can often be moved among **I, IV, and V**. Check every resulting pitch against the actual key and harmony. A prominent third or leading tone often needs an intentional adjustment when a chord changes quality.

A useful variation is to retain the **rhythm** but rewrite just two or three pitches for the new chord. Musical coherence matters more than literal transposition.

### Choose registers for the actual speaker

These are starting locations, **not measured limits** of the Arduboy piezo:

| Use | Starting register | Why |
| --- | --- | --- |
| 25% pulse melody | **D5–B5** | Clear, foreground-oriented pitch range; extend roughly G4–E6 for contrast |
| Harmony roots | **C3–C4** | Triad arpeggios reach above the root without crowding the lead as much |
| Saw bass | **A2–G3** | Low register with upper harmonics that can carry the rhythm |
| Noise | No tonal register | Channel 3 note pitch gates the sound; it does not tune the noise oscillator |

A low sawtooth note can be audible through its upper harmonics even when the fundamental is weak. Conversely, a high pitched lead may become piercing at a duty setting that sounded pleasant lower down. Check relative *perceived* loudness instead of relying on source volume numbers alone.

## 4. Bass: supply both harmony and groove

**Write a bass rhythm, not merely a list of sustained chord roots.** Useful patterns include root–fifth, root–octave, root–octave–root, or a short walking figure. Repeat the core pattern and vary its last beat to lead into the next harmony.

```avms
instrument bass { wave saw volume 10 envelope pluck gate 85% }

// Root, fifth, octave, fifth: C2, G2, C3, G2.
channel 2 bass octave 2 {
    repeat 2 { c4 g4 c'4 g4 | }
}
```

### Make room for another instrument's attack

A powerful pattern in rhythmic game music is to **leave the bass silent briefly on the kick**, then enter on the offbeat:

| Beat subdivision | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- |
| Percussion | Kick | — | — | — |
| Bass | Rest | Root | Octave | Root |

Here the four subdivisions are sixteenth notes. A corresponding one-beat AVMS phrase is:

```avms
phrase bass_beat { r16 a16 a'16 a16 }
```

Use it with `octave 2` to get A2 → A3 → A2. The kick gets the initial transient, then the bass supplies forward motion. For a fuller groove, substitute a fifth for one of the roots or vary the final beat of each bar.

Another effective trick is to let bass and melody use **different attack patterns**. When both strike every downbeat together, their rhythms can blur; staggered onsets make the voices easier to distinguish.

## 5. Harmony: imply chords with one oscillator

On a three-tonal-voice system, an arpeggio is one of the most economical ways to imply simultaneous harmony. Common intervals relative to the written root include:

| Harmony | Semitone offsets |
| --- | --- |
| Major triad | `0,4,7` |
| Minor triad | `0,3,7` |
| Dominant-seventh color without fifth | `0,4,10` |
| Major-seventh color without fifth | `0,4,11` |
| Minor-seventh color without fifth | `0,3,10` |

Choose the intervals deliberately; a two- or three-note arpeggio may be all the listener needs to perceive a full chord. Inversions can keep adjacent chord shapes in a consistent register, reducing distracting jumps.

### Two useful arpeggio styles

**Short, fast chord stabs:** put a small chord on the offbeats and rotate quickly through its notes. The effect is energetic and rhythmic, almost like a compact chord texture.

```avms
instrument stab { wave pulse duty 50% volume 8 envelope pluck gate 75% }
channel 1 stab octave 3 {
    arpeggio { offsets 0,3,7 step 32ms }
    r8 a8 r8 a8 r8 a8 r8 a8 |
}
```

**Slow, shimmering harmony:** sustain one chord root while cycling more slowly through its components. Use a softer amplitude, a restrained tremolo if desired, and leave room around the melody.

```avms
instrument pad {
    wave pulse duty 50% volume 7
    tremolo { period 800ms depth 12% wave sine }
}
channel 1 pad octave 3 {
    arpeggio { offsets 0,3,7 step 120ms }
    d1
}
```

Here `d1` is a **whole-note D** in the selected octave. The `step` is measured in milliseconds, not the song's note-duration denominator. A fast arpeggio that works as a stab can sound irritating if left continuously active; conversely, a very slow arpeggio may sound like a melodic accompaniment rather than one held chord. Both can be useful.

For gentle music, try a **countermelody or long single note instead of a constant arpeggio**. Silence in the harmony voice is often desirable.

## 6. Articulation: envelopes make simple waveforms expressive

A pulse oscillator with a well-shaped envelope can act as a pluck, bell, sustained lead, or short accent. Most notes benefit from an intentional onset and end. In particular, repeated notes often need a **fresh attack**, even when the pitch is unchanged; tie only notes that should truly sound continuous.

Use these approximate shapes as a starting palette, then tune them to tempo and hardware:

| Sound | Attack and decay idea | Typical context |
| --- | --- | --- |
| Bell or soft pluck | Immediate attack; 100% → 40–60% in 100–200 ms | Melody, gentle menu music |
| Sustained lead | Immediate attack; settle gradually to 60–85% | Recognizable tune with clear legato |
| Chord stab | Bright attack; 100% → 15–35% in 60–160 ms | Offbeat harmony |
| Plucked bass | Strong start; 100% → 50–75% in 80–170 ms | Root/octave rhythm |
| Kick/click | Very sharp start; near silence after 20–50 ms | Percussion transients |
| Closed hat | Low volume; near silence after 20–40 ms | Light subdivisions |
| Snare or clap | Louder than a hat; decay over roughly 60–120 ms | Backbeats and accents |
| Open hat or wash | Moderately loud onset; decay over 120–250 ms | Longer noise accents |

```avms
envelope lead_fall {
    points 0ms:100%, 120ms:78%, 280ms:58%
    release 24ms:0%
}
envelope pluck {
    points 0ms:100%, 60ms:55%, 140ms:20%
    release 20ms:0%
}
envelope bass_fall {
    points 0ms:100%, 90ms:75%, 170ms:50%
    release 20ms:0%
}
```

These curves are not magic presets. If a sixteenth-note hat lasts 125 ms, its useful envelope may end in 25 ms. A whole-note melody tone needs a much longer contour. A gate or `note_cut` can supply sharp silence; a short release can prevent audible abrupt edges.

**Do not over-automate.** AVMS converts envelopes and smooth modulation into timed control events. Tiny changes may disappear after 0–31 volume quantization, while extremely fine automation can enlarge the asset. Start with a small number of musically meaningful envelope points.

### Use special effects for specific gestures

- **Pitch LFO (`lfo { target pitch ... }`):** restrained vibrato on a sustained or singing lead; a good first trial is ±12 cents with a 240 ms period.
- **Frequency slide:** a falling tonal kick, laser, whistle, or transition. Use `curve linear` for a direct Hz sweep or the default logarithmic curve for musical interval movement.
- **Tremolo:** a gently pulsing pad, a growing sense of motion, or a deliberate rhythmic swell.
- **Glissando:** stepped rises and falls at a phrase ending, not an automatic decoration on every note.
- **Duty slide or duty LFO:** timbral change on a pulse voice; test for harshness and unwanted shifts in perceived loudness.
- **Note cut:** controlled staccato, abrupt percussion termination, or a sharp special effect.

Effects should reinforce a musical event. If a track feels weak without them, strengthen its melody, rhythm, harmony, or articulation first.

## 7. Percussion: build several sounds from one noise source

Channel 3 produces **one fixed-clock pseudorandom noise waveform**. Written note pitches still specify sounding duration and note-on/off gating, but **changing their pitch does not change the noise rate or timbre**. Use note envelopes, amplitude, rhythmic placement, and explicit retriggering to create percussion contrast.

```avms
envelope kick_hit {
    points 0ms:100%, 20ms:25%, 48ms:0%
}
envelope snare_hit {
    points 0ms:100%, 44ms:45%, 100ms:0%
}
envelope hat_tick {
    points 0ms:100%, 28ms:0%
}

instrument kick  { wave noise volume 8 envelope kick_hit gate 65% }
instrument snare { wave noise volume 6 envelope snare_hit gate 65% }
instrument hat   { wave noise volume 2 envelope hat_tick gate 60% }

channel 3 octave 4 {
    repeat 2 {
        c8@kick b8@hat g8@snare b8@hat
        c8@kick b8@hat g8@snare b8@hat |
    }
}
```

The different note letters here do **not** select different noise pitches; the instruments' levels and envelopes provide the distinction. A single noise oscillator cannot play kick, snare, and hat simultaneously, so prioritize the most important hit when rhythms coincide.

### Practical patterns

- **Kick-like click:** stronger attack and very short decay, often on beats 1 and 3.
- **Closed hat:** low amplitude and short decay, often on offbeat eighths or sixteenths.
- **Open hat:** slightly louder with a longer tail, placed sparingly to avoid covering other hits.
- **Snare/clap:** a broader, higher-level burst on beats 2 and 4.
- **Roll or fill:** several closely spaced attacks, often rising in volume and concentrated near the end of a four- or eight-bar phrase.

For a **low tonal kick**, use a *tonal channel* with a quick downward frequency slide and an envelope; optionally layer a short noise click if the voice budget permits. A fixed-rate noise generator alone cannot produce a descending pitched thump.

```avms
// Alternative use of channel 1 when the harmony voice is available.
instrument tonal_kick {
    wave pulse duty 50% volume 14
    frequency_slide { from 700Hz to 110Hz over 64ms curve linear }
    volume_slide { to 0 over 80ms }
    note_cut { after 80ms }
}
channel 1 tonal_kick { c:125ms r:125ms }
```

### Noise retriggering

AVMS also provides a deterministic way to restart the noise sequence:

```avms
instrument roll {
    wave noise volume 6
    noise_retrigger { every 16ms seed 37 onset yes }
    note_cut { after 120ms }
}
channel 3 roll { c:160ms r:80ms }
```

The seed is an integer **1–63**, and the retrigger interval must be at least **4 ms**. `onset yes` is the default; `onset no` waits until the first interval has elapsed. Different seeds produce different deterministic noise sequences, **not different noise frequencies or EQ bands**. Retriggering is useful for reproducible attack textures and deliberate rolls. Ordinary note changes do not implicitly reseed the oscillator.

Avoid continuous dense percussion unless the style requires it. An arrangement's rhythm can also come from plucked bass, offbeat chord stabs, and rests—with no noise channel at all.

## 8. Musical form: repeat, contrast, and return

A compact game score can still have a convincing beginning, development, and return. Common useful forms include:

| Form | Suitable uses | Arrangement technique |
| --- | --- | --- |
| 2–4 bars | Menus, ambient spaces, puzzle cues | A recognizable motif and one contrasting harmony |
| 8 bars | Small level themes, exploratory loops | Statement, answer, variation, turnaround |
| 16 bars | Adventure and action themes | Develop an eight-bar cycle; lift the register or key, then pivot home |
| Longer sections | Titles, cutscenes, larger levels | Intro → theme → contrasting section → reprise → return or outro |

**An example eight-bar minor-key progression:** `Am | F | C | G | Am | F | G | E`. Its final E major chord creates a stronger pull back to Am than a static repetition would. For major-key material, `C | G | F | C` is a straightforward alternative. A change of key or a new countermelody in the second pass can make an extended loop feel like development rather than duplication.

### Rhythmic interest without additional voices

- **Offbeat accompaniment:** Let the melody land on a beat while chords answer between beats.
- **3–3–2 grouping:** Over eight eighth-note positions, accent after groups of three, three, and two. It creates syncopation without changing meter.
- **Different pattern lengths:** A five-note melodic figure against a three-note arpeggio can shift their alignments until both return together. Plan the alignment point deliberately, rather than allowing accidental drift.
- **Periodic fills:** Replace the last beat of every fourth or eighth bar, rather than running a fill continuously.
- **Temporary thinning:** Drop the harmony or percussion for a bar to make its return more effective.

### Make the loop seamless musically *and* technically

AVMS source does not use a top-level `loop` directive. The application enables looping using:

```c
avm_audio_music_loop(1);
avm_audio_play(song);
```

For a loop, make the intended final phrase lead naturally into the first. Check the last bass note, sustained arpeggio, noise tail, and releases. AVMS places the music End at the longest written duration and truncates final releases there. Give release tails time using appropriate rests and written score length, rather than assuming they can ring beyond the loop boundary.

Test several consecutive repetitions, not just one traversal. An arrangement can be valid in notation yet still have an awkward first-beat accent, an abrupt cutoff, or a rhythmic gap at the seam.

## 9. Mix for the piezo and for game sound effects

The number `volume 12` is not a measure of perceived loudness. Waveform, pitch, attack shape, and the piezo's response all change how prominent a voice sounds. Begin with the **lead clearly perceptible**, the bass supporting it, and the harmony and percussion quieter unless deliberately featured.

### Suggested mixing sequence

1. Listen to the lead alone. Fix the register, articulation, and harshness.
2. Add the bass. Make sure the parts form a recognizable piece without the other channels.
3. Add harmony at a low level, increasing it only enough to clarify the chords.
4. Add percussion. If it obscures the lead or bass, reduce it or simplify its rhythm.
5. Test with representative game SFX and any direct tones that can occur during gameplay.
6. Recheck on actual hardware at the intended master volume and sample rate.

For a game where effects need priority, a useful first experiment is to run background music at **roughly 60% of its menu/title level**, while leaving SFX more prominent. AVM has independent playback gains:

```c
// Both are independent byte controls: 255 = full owner gain.
avm_audio_music_volume(153);  // approximately 60%
avm_audio_sfx_volume(255);    // full SFX gain
```

This is a *mixing starting point*, not a mandatory preset. AVMS also supports score-wide `volume 70%` or `volume max`; both are resolved into the compiled stream. The runtime master control `avm_audio_volume()` applies a further post-mix gain and can cause clipping if pushed too high. Keep sufficient headroom for combined voices and SFX.

At 15,625 Hz and 7,812.5 Hz the same tonal notes have approximately the same intended pitch, but noise sampling and high-frequency behavior can differ. If the game exposes both rates, audition both.

**Do not rely only on a desktop preview.** The renderer is useful for catching timing, clipping, and envelope problems, but the piezo and its enclosure can strongly affect timbre and register balance.

## 10. Complete example: an eight-bar adventure loop

This example combines a recurring melody, harmonic changes, a bass pattern that avoids the downbeat, soft offbeat chord stabs, and restrained noise percussion. It uses `phrase`, reusable instruments, envelopes, arpeggios, rests, and a turnaround. Compile the score and listen before adjusting its pitches or levels.

```avms
title "A Small Adventure"
description "Eight bars with a repeating hook, offbeat harmony, and light drums"
tempo 120
meter 4/4
volume 70%
automation 8ms

envelope lead_env {
    points 0ms:100%, 120ms:82%, 320ms:60%
    release 24ms:0%
}
envelope chord_env {
    points 0ms:100%, 60ms:40%, 140ms:15%
    release 20ms:0%
}
envelope bass_env {
    points 0ms:100%, 90ms:75%, 170ms:50%
    release 20ms:0%
}
envelope kick_env { points 0ms:100%, 20ms:25%, 48ms:0% }
envelope snare_env { points 0ms:100%, 44ms:45%, 100ms:0% }
envelope hat_env { points 0ms:100%, 28ms:0% }

instrument lead   { wave pulse duty 25% volume 14 envelope lead_env gate 90% }
instrument chords { wave pulse duty 50% volume 7 envelope chord_env gate 80% }
instrument bass   { wave saw volume 11 envelope bass_env gate 85% }
instrument kick   { wave noise volume 7 envelope kick_env gate 65% }
instrument snare  { wave noise volume 5 envelope snare_env gate 65% }
instrument hat    { wave noise volume 2 envelope hat_env gate 60% }

phrase melody_am { a8 c8 e4 c8 b8 a4 | }
phrase melody_f  { a8 c8 f4 e8 c8 a4 | }
phrase melody_c  { g8 c'8 e'4 d'8 c'8 g4 | }
phrase melody_g  { b8 d'8 g'4 d'8 b8 g4 | }
phrase melody_e  { g#8 b8 e'4 d'8 b8 g#4 | }

// Foreground hook: Am | F | C | G | Am | F | G | E.
channel 0 lead octave 5 {
    melody_am melody_f melody_c melody_g
    melody_am melody_f melody_g melody_e
}

// Short, offbeat chords; alter the arp intervals with chord quality.
channel 1 chords octave 3 {
    arpeggio { offsets 0,3,7 step 40ms }
    r8 a8 r8 a8 r8 a8 r8 a8 |
    arpeggio { offsets 0,4,7 step 40ms }
    r8 f8 r8 f8 r8 f8 r8 f8 |
    r8 c8 r8 c8 r8 c8 r8 c8 |
    r8 g8 r8 g8 r8 g8 r8 g8 |
    arpeggio { offsets 0,3,7 step 40ms }
    r8 a8 r8 a8 r8 a8 r8 a8 |
    arpeggio { offsets 0,4,7 step 40ms }
    r8 f8 r8 f8 r8 f8 r8 f8 |
    r8 g8 r8 g8 r8 g8 r8 g8 |
    r8 e8 r8 e8 r8 e8 r8 e8 |
}

// Leave the first eighth of each half bar for percussion; use root/octave/fifth motion.
channel 2 bass octave 2 {
    r8 a8 a'8 a8 r8 a8 e8 a8 |
    r8 f8 f'8 f8 r8 f8 c'8 f8 |
    r8 c8 c'8 c8 r8 c8 g8 c8 |
    r8 g8 g'8 g8 r8 g8 d'8 g8 |
    r8 a8 a'8 a8 r8 a8 e8 a8 |
    r8 f8 f'8 f8 r8 f8 c'8 f8 |
    r8 g8 g'8 g8 r8 g8 d'8 g8 |
    r8 e8 e'8 e8 r8 e8 b8 e8 |
}

// One noise channel: the per-note instruments distinguish kick, snare and hat.
channel 3 octave 4 {
    repeat 7 {
        c8@kick b8@hat g8@snare b8@hat
        c8@kick b8@hat g8@snare b8@hat |
    }
    c8@kick b8@hat g8@snare b8@hat
    c8@kick b16@hat g16@snare g16@snare b16@hat r8 |
}
```

All four channels have eight measures of written duration. The last bar introduces a small percussion fill and ends on an E-major harmony that points back toward A minor. If the loop is too busy, remove the noise part first, then reduce the frequency of chord stabs; the lead and bass should still carry the piece.

Compile and inspect the asset:

```sh
python tools/avm_music.py adventure.avms adventure.bin --stats
python tools/avm_music.py adventure.avms adventure.h --name adventure
```

Include the generated header in the guest project and pass its exported name to `avm_audio_play()` as in [the audio API guide](audio.md#asset-compiler-and-exports).

## 11. Composer's review checklist

Before calling a score finished, check the following:

- [ ] **Musical identity:** The lead and bass make sense without harmony or percussion.
- [ ] **Voice roles:** No two channels continuously compete in the same register or with identical attacks.
- [ ] **Registers:** Melody, harmony, and bass are balanced on the actual piezo; no range recommendation is treated as a hardware guarantee.
- [ ] **Articulation:** Most notes have intentional attacks, decays, gates, and rests; ties are used only for genuine sustain.
- [ ] **Harmony:** Arpeggio offsets reflect the current chord quality; fast arps are not accidentally harsh.
- [ ] **Rhythm:** Accompaniment supports rather than mirrors every melody onset; fills occur at meaningful transitions.
- [ ] **Percussion:** Noise timbres come from envelope, level, and retrigger choices, not from changing channel 3 pitch.
- [ ] **Form:** Motifs recur with variation, and the last harmony leads naturally into the first.
- [ ] **Loop:** Durations, release tails, and consecutive loop passes sound natural.
- [ ] **SFX:** Temporarily losing channels 1 and/or 3 does not make essential music vanish; effects remain audible.
- [ ] **Headroom:** Combined voices and post-mix gain do not clip objectionably.
- [ ] **Verification:** Compile with `--stats`, preview if useful, and listen on the intended Arduboy hardware at its actual sample rate and volume.

The most productive way to improve a weak chiptune is usually to **strengthen its musical arrangement first**: a recognizable phrase, an independent bass, appropriate chord motion, and clear envelopes. Extra synthesis effects should serve those musical decisions, not replace them.
