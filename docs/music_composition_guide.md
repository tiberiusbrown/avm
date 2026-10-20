# AVM Music Composition Guide for Arduboy

Practical guidelines for composing music that sounds good through the Arduboy's built-in piezo speaker and fits AVM's four-channel audio system.

## Audio target

AVM provides **four monophonic channels**:

| Channel | Sound source | Typical role |
| --- | --- | --- |
| Tonal 1 | Square/pulse wave, programmable duty cycle | Lead melody |
| Tonal 2 | Square/pulse wave, programmable duty cycle | Harmony, countermelody, or arpeggios |
| Tonal 3 | Square/pulse wave, programmable duty cycle | Bass or rhythmic ostinato |
| Noise | Noise generator | Drums, cymbals, and short sound effects |

All three pitched channels use **square/pulse synthesis**. There are **no triangle, sawtooth, or sine oscillators**. Duty-cycle adjustment can vary the tone of a pulse wave, but it does not turn it into one of those other waveforms.

The assignments above are conventions, not restrictions. Rearrange voices when the music benefits from it, but always respect the maximum of **three simultaneous pitched notes and one noise voice**. A rapid arpeggio still uses only one pitched voice at a time.

The **AVM song/SFX compiler supports** volume slides, frequency slides, arpeggios, glissando, note cuts, low-frequency oscillator (LFO) effects, and noise retriggering. Compose with these as normal expressive tools, not as features that might or might not exist. Their exact tick rates, parameter ranges, and combination rules depend on the AVM score/compiler specification; audition the compiled result rather than assuming an editor's preview will match.

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

Loop transitions should preserve rhythmic continuity and avoid unwanted clicks or abrupt harmonic surprises unless intentional.

## Designing pulse-wave instruments

Duty cycle changes the harmonic spectrum and therefore how the note is perceived. These are **starting points**, not fixed presets:

| Duty cycle | General character | Suggested use |
| --- | --- | --- |
| Around 12.5% | Thin, sharp, reedy | Light accents, high countermelodies, plucked-sounding parts |
| Around 25% | Bright, nasal, prominent | Leads, rhythmic melodies, classic chiptune textures |
| Around 50% | Fuller, hollow square-wave tone | Bass, sustained melody, gentler accompaniment |

A 50% duty cycle is still a square wave, **not a triangle wave**. Its higher harmonics can help bass notes remain audible on the piezo.

Practical advice:

1. Start with different duty cycles on different channels so the parts are easier to distinguish.
2. Change duty cycle sparingly for expression or a different section; constant rapid changes can distract from the tune.
3. Check perceived loudness on hardware. Changing duty cycle changes timbre and can change how prominent the note sounds even if the nominal amplitude is unchanged.
4. Avoid extreme duty settings that produce extremely narrow pulses or near-silence unless that effect is deliberate.

### Articulation and envelopes

Plain, uninterrupted pulse tones quickly become monotonous. Shape note lengths and note transitions using **volume slides and note cuts**, not just new note-on events:

- **Melody:** Mostly connected notes; modest fades on held notes; clean note cuts at phrase boundaries.
- **Harmony:** Short plucks made from a quick volume decay; restrained arpeggios or softer held tones.
- **Bass:** Strong onset, controlled decay, and clear cuts between repeated notes.
- **Noise percussion:** Brief noise events with fast volume decay and a deliberate stop.

Use an immediate cut for crisp staccato articulation and a volume slide for a more natural release. Rapid volume changes can convey a plucked or struck sound; gentler fades can keep sustained notes from dominating. Avoid making every note swell or fade in the same way—phrasing should lead the effect design.

## Using AVM's expressive effects

The song and sound-effect compiler supports the following effects. They **modify a channel's sound over time**; they do not create extra independent voices. Use them to improve expression within the four-channel budget, rather than to make every moment more complicated.

| Effect | Best musical uses | Practical caution on the piezo |
| --- | --- | --- |
| **Volume slide** | Plucked-note decay, held-note fade, accents, crescendos, short percussion tails | Fades may be perceived nonlinearly; very quiet levels can disappear |
| **Frequency slide** | Scoops into notes, falling bass transients, arcade zaps, swoops and SFX | Wide or slow glides can obscure the intended pitch or melody |
| **Arpeggio** | Rapid chord implication on a single voice, ornamental figures, shimmering accompaniment | Fast switching can become brittle or harsh; the effect still occupies one channel |
| **Glissando** | Expressive note-to-note pitch motion, short ornaments, descending or ascending flourishes | Use deliberately; excessive movement can make notes sound out of tune or indistinct |
| **Note cut** | Exact staccato lengths, rhythmic separation, clipped bass, short drum hits | Cutting too aggressively can make a line feel choppy; leave sustained notes where needed |
| **LFO effect** | Subtle vibrato or tremolo where the chosen LFO modulation target allows it, sustained-note animation, sci-fi effects | Strong or fast modulation can be tiring, especially in the high register |
| **Noise retrigger** | Hi-hat ticks, snare-like rolls, rattles, quick repeated noise accents | Dense retriggering can become a continuous hiss and mask tonal parts |

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
5. **Check effect timing at the song's actual tempo.** Rapid arpeggios, retriggers, and cuts depend on the compiler's tick timing and hardware playback cadence.
6. **Plan for interruption.** If an SFX takes over a channel, the interrupted music may lose its slide, arpeggio, or LFO gesture; its return should still sound coherent.

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

The **song/SFX compiler supports expressive effects**, but this alone does not specify the runtime's SFX voice-allocation, channel priority, or music-resume policy. If the runtime supports priority or temporary takeover, use it; otherwise, explicitly plan which voices will be used for SFX. In either case, arrange compositions so losing the harmony part briefly does not destroy the tune. For sound-heavy gameplay, keep accompaniment sparse and favor short notes.

If music and SFX share a channel, test what happens when an SFX interrupts an ongoing volume slide, glissando, arpeggio, or LFO effect, and what state is restored afterward. Favor robust phrase transitions over assuming every effect will resume mid-gesture.

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

- **Peak concurrent pitched notes:** Aim for three or fewer after any planned reduction.
- **Per-track polyphony:** Each AVM tonal voice is monophonic.
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
9. Quantize or simplify note events only as needed for compact playback; protect recognizable rhythms, deliberate effect timing, and phrase articulation.
10. Listen to the result **on the real Arduboy** and revise the arrangement.

For original music, a chiptune tracker or sequencer that allows strict monophonic voices and pulse/noise timbres is preferable to composing a large multitrack arrangement and trimming it down afterward.

## Hardware validation checklist

Before finalizing a track, test it through the device's built-in piezo at a realistic playing distance:

- [ ] The melody is recognizable with harmony muted.
- [ ] The bass line is audible and helps establish the harmony.
- [ ] No important pitches disappear or become disproportionately piercing.
- [ ] Pulse channels have distinct musical jobs and do not overcrowd the same register.
- [ ] Duty-cycle choices sound balanced on hardware.
- [ ] Percussion supports the beat without overwhelming the tune.
- [ ] Note lengths, note cuts, volume-slide releases, and rests remain clear.
- [ ] Arpeggio speed preserves the intended harmony and does not sound brittle.
- [ ] Frequency slides and glissandi are expressive without obscuring note centers.
- [ ] LFO effects remain subtle in music unless deliberately used as a featured gesture.
- [ ] Noise retriggering is rhythmic rather than an overpowering hiss.
- [ ] The loop transition is smooth and rhythmically correct; no unwanted effect state carries across it.
- [ ] Typical gameplay sound effects do not make the music collapse.
- [ ] Repeating the loop for several minutes is not fatiguing.

If a track sounds poor on hardware, **simplify before complicating**: mute parts, reduce brightness, adjust registers, shorten notes, and create more space.

## Quick reference: preferred defaults

- **Voice budget:** Three monophonic pulse-wave parts + one monophonic noise part.
- **Arrangement:** Lead melody + bass + optional harmony/arpeggios.
- **Pulse timbres:** Start around 25% for lead, 50% for bass, and 12.5–25% for accompaniment; adjust by ear.
- **Articulation:** Use note cuts for precision and volume slides for attacks/decays/releases.
- **Harmony:** Prefer built-in arpeggios, broken chords, and sparse counterpoint to three-note blocks.
- **Pitch expression:** Use frequency slides, glissando, and LFO effects sparingly for expressive music; use bolder motion for SFX.
- **Percussion:** Short decaying noise bursts; use noise retriggering for repeated hits and rolls, not constant hiss.
- **Bass:** Keep it in an audible register, even if that means an octave higher than the original.
- **SFX resilience:** Make the harmony part expendable; test interrupted effect states.
- **Final arbiter:** The physical Arduboy piezo, not emulator or headphone playback.

**Guiding principle:** Compose for the four voices and the piezo from the start. A clear, expressive, intentionally sparse arrangement will usually outperform a dense arrangement forced into the same channel budget.
