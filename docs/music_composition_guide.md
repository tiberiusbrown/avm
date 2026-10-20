# AVM Music Composition Guide for Arduboy

Practical guidelines for composing music that sounds good through the Arduboy's built-in piezo speaker and fits AVM's four-channel audio system.

## Audio target

AVM provides **four monophonic channels**:

| Channel | Sound source | Typical role |
| --- | --- | --- |
| 0 | Square/pulse wave, programmable duty cycle | Lead melody; never stolen by sequenced SFX |
| 1 | Square/pulse wave, programmable duty cycle | Harmony, countermelody, or arpeggios; tonal SFX slot |
| 2 | Square/pulse wave, programmable duty cycle | Bass or rhythmic ostinato; never stolen by sequenced SFX |
| 3 | Noise generator | Drums and percussion; noise SFX slot |

All three pitched channels use **square/pulse synthesis**. There are **no triangle, sawtooth, or sine oscillators**. Duty-cycle adjustment can vary the tone of a pulse wave, but it does not turn it into one of those other waveforms.

The roles are compositional conventions, but **sequenced SFX routing is fixed**. Put the essential melody on physical channel 0, the bass on 2, expendable pitched accompaniment on 1, and percussion on 3. A sequenced SFX can claim channel 1, channel 3, or both; it cannot claim channel 0 or 2. The low-level, manually addressed direct-tone API is a separate exception and can target any channel.

Respect the budget of **three simultaneous monophonic pitched parts and one noise part**. A rapid arpeggio still consumes only one pitched voice.

The **AVM song/SFX compiler supports** envelopes and releases, volume slides, frequency slides, duty slides, arpeggios, glissando, note cuts, pitch/volume/duty LFOs, attenuating tremolo, and noise retriggering. All musical modulation is **expanded into timed control events by the compiler**; it is not computed sample-by-sample on the Arduboy. Compose with these as ordinary expressive tools, but consider their event density, quantization, and FX asset size. The authoritative syntax is in `docs/audio.md`.

### Timing and pitch limits

- Playback events and note boundaries are quantized to **4 ms ticks**. The first event cannot occur at time zero; it starts after at least one tick. Time is rounded to the nearest 4 ms tick.
- Smooth curves and LFOs default to **8 ms automation**. `automation 4ms` is available for finer resolution, but can produce substantially more FX reads and larger scores.
- Audio synthesis runs at **7,812.5 Hz by default** or **15,625 Hz** when selected at runtime. These are sample rates, not the 250 kHz hardware PWM carrier frequency.
- Notated pitches cover **C1–B6**. At the default rate, keep phase increments below 16,384 for the fundamental to remain below Nyquist; below 32,768 for 15,625 Hz playback. Even when the fundamental is valid, bright pulse-wave harmonics can alias.
- The three pulse channels share the same synthesis capabilities. Pitch and duty changes **preserve oscillator phase**, even on repeated notes and at loops; amplitude envelopes rather than phase reset must shape attacks.

## Core composition principles

### 1. Melody first, bass second, harmony third

Write music that remains recognizable with only the melody and bass playing:

- **Melody:** A memorable musical phrase with clear note boundaries and breathing room.
- **Bass:** Defines roots, harmony, pulse, and forward motion; often more valuable than an extra chord tone.
- **Harmony:** Adds color through occasional counterpoint, call-and-response, or arpeggios. It need not play continuously.
- **Noise:** Reinforces rhythm and accents; it need not play continuously either.

Avoid filling all four channels every moment. Constant simultaneous pulse waves and noise can make the sound crowded and tiring, especially on a piezo speaker. **Rests are part of the arrangement.**

### 2. Suggest chords instead of playing them literally

A full chord would consume all three pitched voices, leaving none for a separate melody or bass. Instead:

- Use a **broken chord** (for example, C–E–G–E) on one channel.
- Use the **built-in arpeggio effect** for a shimmering, chord-like texture, or explicit slower note patterns for an audible rhythmic accompaniment.
- Let the **bass establish the root**, while melody and harmony imply the remaining chord tones.
- Use **alternating notes, octave shifts, and short responses** rather than stacked chords.

Fast arpeggios are an auditory illusion, not true polyphony: their effectiveness depends on effect speed, note register, and the speaker. They are especially useful when the harmony voice must imply two or three chord tones while the melody and bass continue. Test on hardware.

### 3. Make each channel rhythmically distinct

Three channels playing the same rhythm at full strength often blur together. Try a moving melody over an even bass, with harmony confined to melodic rests; or a sustained melody over short repeated bass notes and a light noise pulse. Keep the rhythmic parts complementary rather than competing.

### 4. Prefer short, repeatable motifs for gameplay

Gameplay music may loop for minutes. Favor phrases with:

- A recognizable identity in the first few measures.
- Enough repetition to establish familiarity, with small variations to avoid monotony.
- Clear phrase endings and musically satisfying loop points.
- Space for incidental game sound effects.

Loop transitions should preserve rhythmic continuity and avoid unwanted clicks or abrupt harmonic surprises unless intentional. At loop entry, AVM restores every owned channel's **initial pitch, volume, and duty**, and precompiled song-relative modulation starts over. Oscillator phase is **not reset**, and a release tail is truncated at a looping score's boundary. Test the actual loop rather than assuming a held note or release will bridge it.

## Designing pulse-wave instruments

Duty cycle changes the harmonic spectrum and therefore how the note is perceived. These are **starting points**, not fixed presets:

| Duty cycle | General character | Suggested use |
| --- | --- | --- |
| 12.5% (`duty 32`) | Thin, sharp, reedy | Light accents, high countermelodies, plucked-sounding parts |
| 25% (`duty 64`) | Bright, nasal, prominent | Leads, rhythmic melodies, classic chiptune textures |
| 50% (`duty 128`) | Fuller, hollow square-wave tone | Bass, sustained melody, gentler accompaniment |

A 50% duty cycle is still a square wave, **not a triangle wave**. Its higher harmonics can help bass notes remain audible on the piezo.

Practical advice:

1. Start with different duty cycles on different channels so the parts are easier to distinguish.
2. Change duty cycle sparingly for expression or a different section; constant rapid changes can distract from the tune.
3. Check perceived loudness on hardware. Changing duty cycle changes timbre and can change how prominent the note sounds even if the nominal amplitude is unchanged.
4. Avoid extreme duties near `0` and `255` for ordinary music. They are **almost constant-polarity outputs**, rather than useful quiet timbres, and can introduce DC offset, clipping, and clicks. The usual neutral 50% setting is `128`, and duty is measured in 256 steps (not 255 equal percentage steps).
5. Try **duty slides** for timbral sweeps and **duty LFOs** for subtle movement in sustained notes, while checking for aliasing and harshness at narrow settings.

### Articulation and envelopes

Plain, uninterrupted pulse tones quickly become monotonous. Shape note lengths and note transitions using **volume slides and note cuts**, not just new note-on events:

- **Melody:** Mostly connected notes; modest fades on held notes; clean note cuts at phrase boundaries.
- **Harmony:** Short plucks made from a quick volume decay; restrained arpeggios or softer held tones.
- **Bass:** Strong onset, controlled decay, and clear cuts between repeated notes.
- **Noise percussion:** Brief noise events with fast volume decay and a deliberate stop.

Use a hard note cut for crisp staccato articulation, a **gate shorter than the note** to allow its release envelope to sound, and a volume slide for movement within the note. A note cut cancels the release and subsequent modulation: it is not the same as the ordinary gate/release boundary. A volume slide adjusts **base volume before multiplication by the envelope**; it is not a replacement for shaping the release. Rapid volume changes can convey a plucked or struck sound; gentler fades can keep sustained notes from dominating. Avoid making every note swell or fade in the same way—phrasing should lead the effect design.

## Using AVM's expressive effects

The song and sound-effect compiler supports the following effects. They **modify a channel's sound over time**; they do not create extra independent voices. Use them to improve expression within the four-channel budget, rather than to make every moment more complicated.

| Effect | Best musical uses | Practical caution on the piezo |
| --- | --- | --- |
| **Volume slide** | Decay, fades, accents, crescendos, percussion tails | Changes pre-envelope base volume (0–31); quiet steps may disappear |
| **Frequency slide** | Smooth/logarithmic pitch scoops, falling bass transients, arcade zaps | Mutually exclusive with arpeggio/glissando on the same note |
| **Duty slide** | Timbral sweep, mellow-to-reedy accent, sustained-note color | Narrow extremes can create DC/clicks; control updates increase score size |
| **Arpeggio** | Rapid one-voice chord implication, ornaments, shimmering accompaniment | 2–16 offsets; can become harsh if too fast |
| **Glissando** | Discrete semitone stepping, short ornaments, ascending/descending flourishes | Not a continuous glide; exclusive with frequency slide/arpeggio |
| **Note cut** | Exact staccato lengths, rhythmic separation, short drum hits | Silences pitch and volume, cancels release and further modulation |
| **Pitch LFO** | Subtle vibrato, sirens, sustained-note animation | May accompany one of slide/arpeggio/glissando; avoid excess depth |
| **Duty LFO** | Slow timbral animation on a tonal voice | Can combine with duty slide; beware clicking/aliasing at narrow duties |
| **Volume LFO / tremolo** | Pulsation, expression, ambience | Volume LFO adds centered modulation; tremolo only attenuates |
| **Noise retrigger** | Repeated hats, rolls, rattles, repeatable noise attacks | Reseeds LFSR (seed 1–63) and resets noise phase, but does not change pitch |

### Legal effect combinations and note lifetimes

- Choose **at most one base pitch transformer per note**: `frequency_slide`, `arpeggio`, or `glissando`. Trying to enable more than one is a compiler error. You can still layer a **pitch LFO** on top of the selected transformer.
- A **duty slide and duty LFO** can operate together, and a separate **volume LFO** can accompany envelope, volume slide, and attenuating tremolo. There is at most one LFO for each target (pitch, duty, volume). Noise cannot have duty modulation.
- Effect directives in channels apply to **subsequent notes**, not notes already sounding, and restart at note onset. A tie extends one attack/effect timeline without retriggering; a rest provides a gap before the next attack.
- Slides hold their endpoints; note cuts permanently stop that note's release and modulation. Noise retriggers are intentional control commands, **not** deduplicated just because seed/pitch/volume are unchanged.
- LFOs may use note-relative or song-relative phase. Distinguish the centered additive **volume LFO** from attenuating **tremolo** when balancing a track.

### Recommended ways to apply the effects

**Melody:** Establish a clear pitch before adding decoration. Slight vibrato on selected held notes can add character; short frequency slides or glissandi can highlight phrase entrances and endings. Use note cuts and volume fades to create breathing room. Avoid sliding through every ordinary note transition.

**Harmony:** Use the arpeggio effect to imply harmony without spending multiple voices. Switch between arpeggiated passages, single counterpoint notes, and silence so the texture changes over time. Short volume decays can make a repeating accompaniment less obtrusive.

**Bass:** Keep the root progression and pulse easy to hear. Brief downward frequency slides can lend an attack to certain notes, while modest volume decays define repeated pulses. Favor stable pitch during the body of most bass notes: pitch modulation that sounds playful in a lead can make the bass less useful harmonically.

**Noise:** Combine short note durations, volume decay, and retriggering to separate hats, snare-like hits, rolls, and accents. A retrigger pattern is still one noise voice: schedule hits so they do not require simultaneous independent noise instruments.

**Sound effects:** Reserve larger pitch slides, deeper LFO effects, more conspicuous glissandi, and rapid noise retriggering for effects such as jumps, pickups, projectiles, impacts, and warnings. This helps SFX stand out without forcing the background music to compete for attention.

### Keep effect use purposeful

1. **Make the unadorned notes work first.** Melody, bass movement, rhythm, and harmony should be understandable without effects.
2. **Use contrasting envelopes.** A short, decaying accompaniment beneath a stable lead is clearer than every voice swelling or vibrating together.
3. **Keep note boundaries intentional.** Confirm how note-on, note-off/cut, and slide state interact at pattern boundaries in compiled output.
4. **Set modulation depth by ear.** Start subtle for musical vibrato/tremolo and use larger gestures for deliberate SFX.
5. **Check timing at 4 ms resolution.** The compiler honors onsets, note cuts, step changes, and retriggers even if the smooth automation interval is longer. Very small LFO depths may disappear after 8-bit/5-bit quantization.
6. **Plan for interruption.** Music's precompiled timeline continues while SFX owns channel 1 or 3; when SFX ends, the current music control state returns, rather than replaying missed slides, arpeggio steps, or noise reseeds.

A useful default is **stable melody pitch, rhythmic bass, selectively arpeggiated harmony, and restrained noise percussion**. Add expressive movement to moments that deserve it.

## Composing for the Arduboy piezo

The built-in piezo is not a full-range speaker. Its response varies substantially with frequency and enclosure, and the timbre heard through desktop speakers or headphones may differ greatly from physical hardware.

### Prioritize clarity over richness

- Favor **strong melodies and distinct rhythms** over large simulated chords.
- Keep sustained high notes and continuous, bright accompaniment under control; they can become piercing. Limit pronounced vibrato, fast arpeggios, and retriggered noise in this register.
- Avoid dense, loud combinations of three pulse channels and noise for extended periods.
- Use silence and brief pauses to restore contrast.
- Evaluate both **notes and balance** on a real Arduboy, not only in an emulator.

### Put bass where the hardware can reproduce it

Very low fundamentals may be weak or absent on the piezo. A bass line can still be recognizable through upper harmonics, but do not assume lower notes will be perceived as deep bass.

- If the bass vanishes on hardware, **transpose it up an octave** or change its register selectively.
- Favor moving roots, fifths, octaves, and short rhythmic figures over long, inaudible low notes.
- Choose a sufficiently harmonic-rich pulse timbre, but keep its loudness subordinate to the melody. A short volume-decay envelope can make repeated bass notes clearer.
- Test individual notes in the planned bass register; some pitches may project much more strongly than neighboring pitches.

### Control shrillness and masking

When multiple pulse tones occupy similar registers, their harmonics can interfere perceptually. Separate roles by **register, rhythm, timbre, and relative loudness**. If the mix becomes piercing or muddy, first simplify the arrangement rather than adding more synthesis effects.

## Mix levels to avoid clipping

AVM **adds four signed oscillator contributions and clips the final result** to the PWM output range. The nominal per-channel score `volume` is **0–31**, but overall gain is controlled separately. The music and SFX master gains both default to **128**, which means **400% of unity** (`32` is 100%). A voice's prepared amplitude is approximately `floor(score_volume × master / 32)`, and many loud simultaneous voices can saturate the mix.

- **Do not set every instrument to 24–31 by default.** The score's default volume 24 is loud at the default 128 master, particularly with simultaneous bass and melody.
- For a conservative, unclipped starting point when **both master gains are 128**, keep the sum of the simultaneously active score volumes around **30 or less**. For example, melody 13 + bass 9 + harmony 6 + percussion 2 = 30. This is a starting budget, not a mandatory musical balance; envelopes, SFX, phase and pulse duty change the instantaneous mix.
- Treat volume slides, envelopes, and additive volume LFOs as sources of **peak** volume; allow headroom for their maximum, not just their steady value. Effects may replace a quiet accompaniment with a much louder sound.
- Compare the song at its **actual runtime master setting**, not merely at the editor's volume. Set music and SFX masters independently when necessary to maintain headroom.
- Duty cycles far from 50% can introduce a strong average (DC-like) component in the raw pulse waveform; a different duty at the same nominal score volume is not necessarily equally loud or equally safe from clipping.

Clipping is not a way to make the piezo reproduce bass. If the bass lacks presence, **change the register, articulation, or arrangement first**, rather than raising all channel gains.

## Control-event density and FX cost

Effects are rendered offline by the song/SFX compiler into a stream of discrete pitch, volume, duty and noise-retrigger events. They impose **no continuously running AVR LFO/interpolation engine**. But higher automation density creates more score bytes and more FX reads/foreground work at playback.

- Start with **`automation 8ms`**, the compiler default. For slow fades and vibrato, experiment with a coarser interval if the sound remains smooth. Use `automation 4ms` only where audible improvement warrants the cost.
- Avoid unnecessarily running all three LFO targets and duty/volume/pitch changes on every voice. If several values quantize to the same integer, the compiler can omit unchanged controls, but a genuinely changing stream still costs space.
- Extreme cases involving four extended control updates every 4 ms can consume roughly **2,500 score bytes per second**. This is significant for long exploration themes.
- The interpreter services song events at **safe points** in foreground execution. A long stretch without a safe point can delay an update; catch-up may skip intermediate automation transitions or transient noise retriggers. Prefer moderate effect density for music that must play during demanding gameplay.
- Favor **phrase structure, envelopes, rhythm, and occasional effect accents** over permanently active fine-grained modulation. Check the compiler's `--stats` report for event/byte counts and validate playback during representative gameplay.

## Percussion with one noise channel

The noise generator is **monophonic**. It cannot independently sustain a hi-hat and snare at the same instant. Think in terms of a rhythmic sequence of brief noise events rather than a conventional multitrack drum kit.

| Percussion impression | Starting design |
| --- | --- |
| Hi-hat | Quiet, very short noise burst |
| Snare | Stronger noise burst with a longer decay |
| Cymbal | Longer or repeated noise bursts, used sparingly |
| Kick | Short low-register tonal transient where a tonal voice is available; optionally reinforced with noise |

Use **volume slides** to shape each noise burst, **note cuts** to stop it cleanly, and **noise retriggering** for repeated hats, rolls, and rattles. Vary burst duration, intensity, and retrigger spacing so kick/snare/hat impressions remain distinguishable despite having only one noise voice. A low thump is particularly hard to reproduce on a small piezo, so focus on conveying the **rhythm** rather than realistic drum timbres.

Prefer uncomplicated drum patterns. Town, ambient, and exploration themes may sound better with very little percussion, or none at all. Very dense retriggering can mask the melody even when the nominal noise volume is low.

## Leave room for gameplay sound effects

Design music to remain intelligible when a sound effect interrupts a channel. A useful default priority is:

1. Preserve the **melody** whenever possible.
2. Preserve the **bass** to maintain harmony and rhythmic continuity.
3. Treat **harmony/accompaniment** as the most interruptible tonal part.
4. Let sound effects use or preempt the **noise** channel when musically acceptable.

**AVM sequenced SFX have one fixed, one-shot stream with two possible slots**: tonal channel **1** and noise channel **3**. The SFX score declares channel 1, channel 3, or both; absent channels are not stolen. A declared slot is still owned during rests and zero volume. Starting another SFX replaces the previous SFX. There is no dynamic voice allocator.

While an SFX is active, the music timeline continues on its stolen channels, but their sound is hidden. At effect End/stop the current music pitch/volume/duty is restored, **not the interrupted onset or envelope transition**. A music noise-reseed event hidden by SFX is discarded, not replayed. Arrange harmony and percussion so their mid-phrase return sounds natural; keep the essential melody on channel 0 and bass on 2.

The separate **direct-tone** API can temporarily address any physical channel; do not assume it preserves the two-slot sequencing restriction.

## Recommended arrangements by game scene

| Scene | Musical approach |
| --- | --- |
| Overworld | Strong looping melody, active bass, occasional arpeggio effects, modest lead vibrato, restrained percussion |
| Town | Relaxed tempo, soft volume-decay accompaniment, gently pulsing bass, little/no noise |
| Dungeon | Repeating motifs, sparse intervals, occasional pitch slides or subtle LFO movement, subdued noise |
| Combat | Fast lead, driving bass with crisp note cuts, noise retriggers for rhythmic urgency |
| Boss | Bold motifs, dramatic cuts and glissandi, larger pitch gestures, selective fast arpeggios |
| Dialogue/menu | Short, softly decaying notes, minimal layers, room for UI SFX |

These are patterns to try, not requirements. Melody and thematic identity should determine the arrangement.

## Working with existing MIDI files

A MIDI file is a **source arrangement**, not automatically a suitable AVM score. General MIDI instruments and polyphonic tracks may need substantial adaptation.

### Evaluate before converting

- **Peak concurrent pitched notes:** Aim for three or fewer after any planned reduction, explicitly assigning melody→0, interruptible harmony→1, bass→2.
- **Per-track polyphony:** Each AVM tonal voice is monophonic. MIDI channel numbers do not automatically correspond to AVM physical channel numbers.
- **Chord density:** Prefer compositions whose chords can be implied by melody, bass, and one broken-chord part.
- **Rhythmic complexity:** Avoid tightly overlapping notes that make voice assignment ambiguous.
- **Percussion:** Consolidate the drum kit into a single sequence of noise events.
- **Loop suitability:** Prefer short themes with clear repeated sections.

**MIDI track count is not equivalent to hardware voice count.** Three tracks can contain a dozen simultaneous notes; six tracks might use no more than three notes at any given moment.

### Suggested conversion priorities

1. Preserve the primary melody, including phrasing and rests.
2. Extract a monophonic bass that communicates chord changes.
3. Reduce harmony to one line: arpeggios, counterpoint, or selected chord tones.
4. Map percussion to the noise channel, resolving overlapping hits by musical importance.
5. Map instrument identity to duty cycle, register, note cuts, and volume slides rather than trying to reproduce General MIDI timbres.
6. Preserve musically important MIDI pitch bends and expression as **frequency slides, glissando, or LFO movement** where appropriate; omit excessive detail that the speaker cannot communicate.
7. Convert chordal accompaniment into AVM **arpeggio effects** when fast chord implication works better than separate note events.
8. Use **noise retriggering** for rolls or subdivisions, while resolving overlapping percussion into one sequence.
9. Quantize events to AVM's 4 ms timeline; consider a coarser interval for smooth automation when adequate. Preserve recognizable rhythms, deliberate effect timing, and phrase articulation, while removing inaudible or redundant modulation.
10. Listen to the result **on the real Arduboy** and revise the arrangement.

For original music, a chiptune tracker or sequencer that allows strict monophonic voices and pulse/noise timbres is preferable to composing a large multitrack arrangement and trimming it down afterward.

## Example AVM score patterns

These snippets illustrate **valid `.avms` syntax**; adapt durations and pitches to the arrangement. A complete music score can also include `tempo`, `meter`, `loop`, additional instruments, and channels 0/2/3.

```text
automation 8ms

envelope pluck_env { points 0ms:100%, 12ms:75%, 100ms:40% release 24ms:0% }

instrument harmony_pluck {
    wave pulse duty 12.5% volume 6 envelope pluck_env gate 80%
    arpeggio { offsets 0,4,7 step 40ms repeat }
}

instrument animated_lead {
    wave pulse duty 25% volume 13
    lfo { target pitch depth 12cents period 240ms wave sine phase note }
    lfo { target duty depth 6.25% period 320ms wave triangle phase note }
}

channel 0 animated_lead octave 4 { c4 e4 g2 }
channel 1 harmony_pluck octave 3 { c4 r4 f4 r4 }
```

For a **separate, one-shot SFX**, use `sfx` at the top of its score, and declare only channel 1 and/or 3:

```text
sfx
instrument zap {
    wave pulse duty 25% volume 18
    frequency_slide { delta -600cents over 120ms }
    volume_slide { to 0 over 144ms }
    duty_slide { from 25% to 12.5% over 120ms }
    note_cut { after 140ms }
}
instrument hiss { wave noise volume 5 noise_retrigger { every 16ms seed 37 } }
channel 1 zap octave 5 { c:144ms }
channel 3 hiss octave 3 { c:48ms r:96ms }
```

Build and inspect score size with `python tools/avm_music.py song.avms song.bin --stats`. The score format (music `A5`, SFX `D1`–`D3`) has changed, so **regenerate old compiled assets** after upgrading. For precise effect syntax and edge cases, consult `docs/audio.md`; for listenable examples, see `projects/audio_demo/music.avms`, `effect.avms`, and `effects.avms`.

## Hardware validation checklist

Before finalizing a track, test it through the device's built-in piezo at a realistic playing distance:

- [ ] The melody is recognizable with harmony muted.
- [ ] The bass line is audible and helps establish the harmony.
- [ ] No important pitches disappear or become disproportionately piercing.
- [ ] Pulse channels have distinct musical jobs and do not overcrowd the same register.
- [ ] Duty-cycle choices sound balanced on hardware; extreme duties do not cause objectionable DC-like clicks.
- [ ] Percussion supports the beat without overwhelming the tune.
- [ ] Note lengths, note cuts, gated envelope releases, volume slides, and rests remain clear.
- [ ] Arpeggio speed preserves the intended harmony and does not sound brittle.
- [ ] Frequency slides and glissandi are expressive without obscuring note centers.
- [ ] LFO effects remain subtle in music unless deliberately used as a featured gesture.
- [ ] Noise retriggering is rhythmic rather than an overpowering hiss.
- [ ] The loop transition is smooth and rhythmically correct; no unwanted effect state carries across it.
- [ ] Typical sequenced gameplay sound effects on channels 1 and/or 3 do not make the music collapse; current music resumes cleanly.
- [ ] Total mix is not noticeably clipped at **actual music and SFX master gains**, including simultaneous maximum accents.
- [ ] Dense modulation does not inflate asset sizes unreasonably or lose transitions during demanding gameplay at safe points.
- [ ] Both 7,812.5 Hz and 15,625 Hz sample-rate modes sound acceptable if the game supports switching.
- [ ] Repeating the loop for several minutes is not fatiguing.

If a track sounds poor on hardware, **simplify before complicating**: mute parts, reduce brightness, adjust registers, shorten notes, and create more space.

## Quick reference: preferred defaults

- **Voice budget and physical routing:** 0 melody, 1 expendable harmony / tonal SFX, 2 bass, 3 noise percussion / noise SFX.
- **Arrangement:** Lead melody + bass + optional harmony/arpeggios.
- **Pulse timbres:** Start at duty 64 (25%) for lead, 128 (50%) for bass, and 32–64 (12.5–25%) for accompaniment; adjust by ear.
- **Articulation:** Use note cuts for precision, envelope gate/release for ordinary articulation, and volume slides for within-note dynamics.
- **Harmony:** Prefer built-in arpeggios, broken chords, and sparse counterpoint to three-note blocks.
- **Pitch expression:** Use frequency slides, glissando, and LFO effects sparingly for expressive music; use bolder motion for SFX.
- **Percussion:** Short decaying noise bursts; use noise retriggering for repeated hits and rolls, not constant hiss.
- **Bass:** Keep it in an audible register, even if that means an octave higher than the original.
- **SFX resilience:** Sequenced effects steal only channel 1 and/or 3. Those parts must sound natural when restored at their *current* state.
- **Mix headroom:** Both masters default to 128 (4×). Keep the sum of peak score volumes conservative; avoid multiple loud voices clipping together.
- **Effect timing:** 4 ms ticks, default 8 ms smooth automation. Use finer updates only when they are audible and worth the FX/foreground cost.
- **Final arbiter:** The physical Arduboy piezo, not emulator or headphone playback. Repository validation is simulation-based, not a physical listening test.

**Guiding principle:** Compose for the four voices and the piezo from the start. A clear, expressive, intentionally sparse arrangement will usually outperform a dense arrangement forced into the same channel budget.
