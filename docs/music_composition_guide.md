# Composing AVMS Music for the Arduboy Piezo

Practical guidelines for writing clear, expressive, four-channel game music that sounds good on the Arduboy piezo. Treat the suggested instruments, registers, and effects as starting points, not rigid rules. Always refine the result by listening on hardware.

## 1. The default arrangement

AVMS offers three independently selectable pitched voices (channels 0–2) and one noise voice (channel 3). A useful default arrangement is:

| AVMS channel | Starting sound | Main job |
|---|---|---|
| **0** | `wave pulse duty 25%` | Foreground melody or recognizable riff |
| **1** | `wave pulse duty 50%` | Arpeggiated harmony, chord stabs, or occasional countermelody |
| **2** | `wave saw` | Bass, repeated ostinato, roots/fifths/octaves |
| **3** | `wave noise` | Short percussion accents, occasional fills or ambience |

**This palette is a starting point, not a restriction.** A piece can use just one or two voices, change their roles, or omit noise entirely. Pulse, square-equivalent pulse, and sawtooth offer contrasting timbres. `wave triangle` is another available color, but judge it by how it sounds at the intended register on the physical speaker. Waveform and volume settings both affect perceived loudness.

**Design for sound effects:** Keep the indispensable melody on channel 0 and bass on channel 2 where practical; AVMS sequenced SFX can temporarily occupy channels 1 and/or 3.

## 2. Pitch registers for the piezo

Start with these registers when assigning musical roles to the voices. The **preferred starting range** is where to write most notes; the **extension range** gives room for melodic peaks, accompaniment movement, and special effects. These are composition guidelines, **not measured acoustic limits**: perceived loudness varies greatly with pitch, waveform, and the individual speaker.

| Voice / typical use | Preferred starting range | Extension range | Notes |
|---|---|---|---|
| **CH0 / 25% pulse lead** | **D5–B5** (587–988 Hz) | **G4–E6** (392–1,319 Hz) | Go higher briefly for emphasis |
| **CH1 / square harmony** | **B2–C4** (123–262 Hz), especially chord *roots* | **G2–F5** (98–698 Hz) | Arpeggios sound above their written roots |
| **CH2 / saw bass** | **A2–G♯3** (110–208 Hz) | **F2–G4** (87–392 Hz) | Emphasize harmonics and rhythmic articulation |
| **CH3 / noise** | No tonal register | Adjust pitch/noise clock by ear | Short accents and fills |

**How to use these ranges:**

- **Melody:** Start near **C5–C6**, concentrating on **D5–B5**, with occasional excursions into G4–E6. Try higher notes for brief accents, and lower notes for subdued or unusual cues.
- **Harmony:** Start with chord roots near **C3–C4**. A triad arpeggio adds **+3/+4 and +7 semitones**, so the *sounding* harmony extends higher than the written root. Echoes and countermelodies can move into the lead register.
- **Bass:** Start near **A2–G3**. Root/fifth/octave figures can extend toward D4 or G4. **Do not automatically move all bass into octave 4**: a harmonically rich sawtooth can make notes in octaves 2–3 audible even when their fundamental frequencies are weak.
- **Sawtooth is not bass-only:** It can also carry a lead or melodic ostinato. Try a different register when the composition calls for it, rather than treating any channel as permanently bound to one octave.
- **Noise:** Choose kick/snare/hat textures by ear on hardware. Pitch tokens on the noise channel select noise-clock settings, not ordinary melodic pitches. Vary amplitude and duration to distinguish percussion parts.

**Hardware caveat:** Register guidance is not a measured frequency-response curve. An A2 fundamental (~110 Hz) may be weak on the piezo while higher harmonics remain audible. Do not assume a universal bass floor, resonance, or equal-loudness curve. Verify the final register and mix on the target hardware.

## 3. Core composition rules

### Give almost every note a fresh attack and decay

Give each note a clear onset followed by a controlled decay. A repeated note should generally restart its envelope so its rhythm stays audible instead of blending into the previous note.

Translate this into a **note-relative AVMS envelope**. Short, bright notes can decay rapidly; sustained melodic notes usually fall more gently. Do not tie every repeated note together: a new attack is often what keeps an identical repeated pitch distinguishable.

```avms
envelope lead_fall {
    points 0ms:100%, 120ms:78%, 280ms:58%
    release 24ms:0%
}
envelope pluck {
    points 0ms:100%, 60ms:55%, 140ms:20%
    release 20ms:0%
}
instrument lead { wave pulse duty 25% volume 14 envelope lead_fall gate 90% }
instrument stab { wave pulse duty 50% volume 8 envelope pluck gate 75% }
```

These millisecond contours and volumes are **starting settings**. Adjust them for the tempo, note lengths, and physical speaker.

### Imply chords with one voice instead of spending three

Fast arpeggios can imply full chords with a single voice. Use a major triad (**0, +4, +7 semitones**) or minor triad (**0, +3, +7**). Short, offbeat stabs provide rhythmic support; longer, softer arpeggios create a shimmering chord texture.

```avms
// One voice implies a major chord, restarting the cycle on each new note.
channel 1 stab octave 3 {
    arpeggio { offsets 0,4,7 step 32ms }
    r8 c8 r8 g8 r8 c8 r8 g8 |

    // Change to a minor chord for the next measure.
    arpeggio { offsets 0,3,7 step 32ms }
    r8 a8 r8 e8 r8 a8 r8 e8 |
}
```

Here `c8` and `a8` are **eighth-note durations**, not C8/A8 pitches. The declared `octave 3` controls pitch. A `step 32ms` arpeggio changes pitch every 32 ms; it does not play simultaneous notes. Select a step that sounds distinct on hardware without turning into an irritating buzz. **Arpeggios are common, not compulsory**—a single countermelody or a rest is sometimes better.

For an unarpeggiated counterline or held single notes:

```avms
channel 1 stab octave 4 {
    arpeggio off
    r4 e8 g8 c4 r4 |
}
```

### Write a strong melody over an independent bass

Assign distinct jobs to the voices: a moving melody, a repeating bass, and lighter chord stabs or responses. **Compose melody and bass first**, then check that the tune remains recognizable with the harmony and percussion muted.

Bass lines can use a **root–fifth**, **root–octave**, repeating rhythmic cell, or brief walking passage. These establish harmony without using extra voices:

```avms
instrument bass { wave saw volume 10 envelope pluck gate 85% }

// Root / fifth / octave / fifth (C2 G2 C3 G2).
channel 2 bass octave 2 {
    repeat 2 { c4 g4 c'4 g4 | }
}
```

Use `phrase` and `repeat` for readable musical motifs; make small changes to the last beat of a phrase, to harmony, or to octave. Repetition in AVMS source is for organization; it is expanded by the compiler and does not itself save audio-stream bytes.

### Give accompaniment a different rhythm from the melody

Use offbeat chords, alternating bass strokes, melodic replies, and held tones against moving lines. Do not have all three pitched voices continually attack together. Make rests, gates, and contrasting note lengths deliberate.

```avms
phrase melody_cell { c8 e8 g4 e8 d8 c4 | }
channel 0 lead octave 5 {
    repeat 2 { melody_cell }
}
```

The phrase is one 4/4 measure; `repeat 2` makes a two-measure melody. For variation, answer it with a second phrase rather than looping one measure unchanged indefinitely.

### Make drums with short, varied noise envelopes

Make percussion from short noise notes with contrasting envelopes. Alternate quiet ticks with louder accents, and reserve rolls or fills for emphasis; continual dense noise is rarely necessary.

```avms
envelope drum_hit { points 0ms:100%, 56ms:10% release 16ms:0% }
envelope drum_tick { points 0ms:100%, 28ms:0% }
instrument kick  { wave noise volume 8 envelope drum_hit gate 65% }
instrument snare { wave noise volume 6 envelope drum_hit gate 65% }
instrument hat   { wave noise volume 2 envelope drum_tick gate 60% }

// Note names on a noise channel select noise-clock settings, not tonal melody.
// These particular noise pitches are placeholders; test the texture on hardware.
channel 3 octave 4 {
    repeat 2 {
        c8@kick b8@hat g8@snare b8@hat
        c8@kick b8@hat g8@snare b8@hat |
    }
}
```

You can omit percussion entirely when a two- or three-voice arrangement already feels complete.

### Use repeated forms, with restrained variations

Build a recognizable hook and develop it with an altered phrase, turnaround, or periodic fill. Consider eight-, sixteen-, or twenty-four-bar loops for longer themes, and just a few notes for short jingles. There is **no required key, mode, meter, or tempo**: major, minor, modal, march, waltz, jig, atmospheric, and syncopated writing are all available.

For AVMS, line up the written durations of concurrent channels and ensure the harmonic/rhythmic ending leads naturally into the start. Enable repetition with `avm_audio_music_loop(1)` in the application; looping is not a top-level `.avms` directive. Test the actual loop boundary, including release tails.

### Reserve special effects for a reason

Use volume envelopes and arpeggios as everyday tools. **Vibrato, tremolo, frequency slides, glissando, and note cuts are optional embellishments**—use them for expressive held notes, whistles, sweeps, or sharp gestures rather than adding them indiscriminately. Duty slides, duty LFOs, and noise retriggering are specialized effects rather than default requirements.

A supported optional example:

```avms
instrument singing_lead {
    wave pulse duty 25% volume 12 envelope lead_fall gate 90%
    lfo { target pitch depth 12cents period 240ms }
}
```

Tune vibrato depth and rate by ear; overly deep or fast modulation can distract from a melody.

## 4. Complete two-bar starting score

This deliberately simple sketch combines the core techniques in a complete AVMS score. Compile it and audition it on the piezo, then adjust its register, volume balance, and note envelopes to suit the piece.

```avms
title "Four-Voice Starting Point"
tempo 120
meter 4/4
volume max

envelope lead_env { points 0ms:100%, 150ms:75%, 300ms:55% release 24ms:0% }
envelope stab_env { points 0ms:100%, 80ms:35%, 170ms:15% release 20ms:0% }
envelope bass_env { points 0ms:100%, 140ms:65% release 24ms:0% }
envelope hit_env  { points 0ms:100%, 56ms:0% }

instrument melody { wave pulse duty 25% volume 28 envelope lead_env gate 90% }
instrument chords { wave pulse duty 50% volume 14 envelope stab_env gate 75% }
instrument bass   { wave saw volume 20 envelope bass_env gate 85% }
instrument drum   { wave noise volume 10 envelope hit_env gate 50% }

phrase hook { c8 e8 g4 e8 d8 c4 | }

channel 0 melody octave 5 {
    repeat 2 { hook }
}
channel 1 chords octave 3 {
    arpeggio { offsets 0,4,7 step 32ms }
    repeat 2 { r8 c8 r8 g8 r8 c8 r8 g8 | }
}
channel 2 bass octave 2 {
    repeat 2 { c4 g4 c'4 g4 | }
}
channel 3 drum octave 4 {
    repeat 2 { c8 r8 g8 r8 c8 r8 g8 r8 | }
}
```

**Adjust first:** melodic octave, arpeggio root and volume, bass audibility, noise-clock pitches, and envelopes. Different physical piezos and different playback gains can change the best balance. A successful mix often requires the accompaniment to be **considerably less prominent** than the melody, even when its source-note root is low.

## 5. Composer checklist

1. **Register:** Melody mainly D5–B5; chord roots typically around C3–C4; saw bass mainly A2–G3. Break these tendencies intentionally, and test the actual speaker.
2. **Timbre:** Begin with 25% pulse lead, 50% pulse harmony, saw bass; do not assume triangle improves the sound without listening.
3. **Articulation:** Give most notes a perceptible attack and decay. Choose rests and note gates rather than continuous undifferentiated tones.
4. **Voices:** Make melody and bass independent. Add one-voice major/minor arpeggios, stabs, or counterpoint only where they help.
5. **Rhythm and form:** Repeat clear motifs with modest variations; let bass/accompaniment contrast the melody; make the loop seam musical.
6. **Percussion and SFX:** Use short noise accents sparingly, keep the essential voices intact during sound effects, and balance music below effects as appropriate.
7. **Validation:** Listen on an actual Arduboy piezo at the intended volume. Adjust pitch registers and voice balance for the hardware rather than assuming every note sounds equally loud.
