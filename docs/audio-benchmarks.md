# Audio measurements

Measured with the repository's Ardens AVR emulator, unmerged AVR instructions,
16 MHz CPU, and a CMake `RelWithDebInfo` build. These are instruction-cycle
measurements and emulated integration results, not oscilloscope measurements.

Audio uses Timer1 COMPA at 15,625 Hz, with 7,812.5 Hz synthesis; Timer0
retains its separate 1 kHz clock. The Timer3-labelled measurements below are
historical measurements of the same synthesis/output instruction paths.
See the [RPG timing investigation](../projects/avm_rpg/docs/audio_timing.md)
for the Timer3, Timer1 and unified Timer0 experiment results. Timer1 was selected
because it removes periodic Timer0 collisions with lower CPU cost than the
unified experiment.

## Temporary event bursts (current)

Each due event is read into a ten-byte temporary buffer using the existing FX
burst reader. X walks the buffer with post-increment LD instructions; the
uint24 flash cursor advances once by the actual consumed length. Continue uses
its buffered next delta; End ignores trailing read-ahead; Loop rewinds and
fetches the first delta again. The initial header/delta uses the same reader.
The dirty byte and ten-byte buffer share formatter/text scratch. Persistent
audio SRAM remains **85 bytes**, with **78 bytes** available for native stack.

The raw ten-byte transfer takes **255 cycles**; `audio_read_event`, including
source/count/destination setup and X initialization, takes **277 cycles**.
No SPI/address bookkeeping runs while parsing individual buffered bytes.
The event parser alone shrinks firmware **29148 -> 29140 bytes**. The startup
phase fix brings the final image to **29156 bytes**, leaving 540 below the ceiling.

| Stopped-timer service | Individual byte reads | Event burst | Change |
|---|---:|---:|---:|
| One-channel note + control | 1027 | 824 | -19.8% |
| Four-channel note + control | 1939 | 986 | -49.1% |
| Four-channel control only | 1330 | 877 | -34.1% |
| Continue | 515 | 437 | -15.1% |
| Note-off | 889 | 811 | -8.8% |
| Sparse countdown | 98 | 98 | unchanged |

All 36 native audio cases pass, including all 255 update masks, exact cursor
advancement, read-ahead past End, scratch bounds, SPI interrupts, looping and
termination beyond 64 KB, handoff races, register preservation and formatting.
The timer phase sweep covers all **16000 counter/prescaler combinations** and
**8000 real-timer outputs** with at most one extra cycle under its NOP workload.
Timer0 and the shared prescaler are unchanged by alignment. The final complete
RPG timing run has **0 updates delayed 10+ cycles** in both normal and FX-C,
with maximum extra delay **7 cycles**. The faster reader initially exposed
125 Hz Timer0 collisions; seeding Timer1's phase on enable removes dependence
on PLAY/header execution time. The ISR handoff and PWM-first ordering are
unchanged. See the [timing report](../projects/avm_rpg/docs/audio_timing.md) and
[merged-ISR options](audio-unified-options.md). The measurements
below retain earlier implementations for comparison.

## Individual byte reads and ISR handoff (previous)

The song reader now opens one transaction per consumed byte and returns it in
a register, with no cache or read-ahead. An isolated `audio_byte` call measures
**124 cycles (7.750 us)**. Removing the 32-byte cache and three metadata bytes
reclaims 35 SRAM bytes. The persistent 15-byte update buffer plus ready/retrigger
descriptor consumes 16, for **85 bytes of persistent audio SRAM** and **78 bytes
of native-stack allowance** above formatter/text workspace, a net gain of 19.

Foreground commit prepares all controls, then publishes its descriptor with one
two-cycle STS. It never masks interrupts for a copy. A pending packet remains
immutable until acknowledgment; back-to-back commits wait with interrupts
enabled. Stopped output and IRQ-disabled callers apply updates directly. The
ISR accepts a packet after its fixed PWM write and before advancing phases,
and clears its phase-reset mask exactly once. Disable drains packets after
stopping the output reader.

The ordinary synthesis ISR is now **200..207 cycles** including entry/vector,
and midpoint remains **41**. The ready check adds four cycles to synthesis,
or **0.1953 percentage points of CPU**. Accepting a packet adds **81..93 cycles**
on that synthesis interrupt; the measured four-voice handoff is **293 cycles**
and the instruction-count worst case is **300**, below the 1024-cycle output period.
The PWM store remains at **26 cycles** including entry/vector. ISR stack is
11 bytes normally, 13 during the copier call; libm/formatter stress still peaks
at 41 bytes. The animated demo renders 63 frames in one second, with 15622 PWM
updates, 7811 synthesized samples, and a 4.091 ms maximum observed service gap.

Stopped-timer sequencer measurements: one/four-channel combined note/control
updates cost **1027/1939 cycles**, four-channel volume-only **1330**, Continue
**515**, note-off **889**, and a sparse countdown **98**. The pending seek hook
and nonaudio interpreter paths are unchanged. These include direct reads and
immediate application for an unavailable output interrupt; live playback
publishes asynchronously and charges copying to the next synthesis interrupt.

Native tests cover interrupts throughout staging, persistent packet lifetime
across formatter scratch reuse, backpressure, exactly-once retriggers with a
borrowed ZERO register, disable/re-enable, and IRQ-disabled publication. All 35
native audio cases, 471 guest cases, and Mini/FX-C hardware checks pass.
The full RPG run records **0 of 860938 normal / 125000 FX-C updates delayed 10+
cycles**, versus 149/21 before. Maximum extra lateness is now **7/6 cycles**,
with p99 unchanged at four. Audio ISR CPU rises from 11.5944% to 11.8067%; total
measured gameplay frame work rises **0.28..0.30%**. See the
[timing report](../projects/avm_rpg/docs/audio_timing.md)
for retained histograms, frame results and limits of the measurement.
The chronological measurements below describe earlier cached implementations.

## Native cycle costs

| Operation | AVR cycles | Time at 16 MHz |
| --- | ---: | ---: |
| Seek hook, no pending tick | **4 added** | 0.250 us |
| Seek hook, pending tick but no streams | 29 added | 1.813 us |
| Seek hook, one active stream, no event due | 109 added | 6.813 us |
| One-stream sparse countdown service, entry through RET | 98 | 6.125 us |
| Cached note-off event plus next delta and commit, entry through RET | 724 | 45.250 us |
| Timer3 synthesis path, including entry/vector | **196..203** | 12.250..12.688 us |
| Timer3 midpoint path, including entry/vector | **41** | 2.563 us |
| Timer3 PWM write, both paths, including entry/vector | **26** | 1.625 us |
| Timer0, ordinary millis update, including entry/vector | 35 | 2.188 us |
| Timer0, ordinary millis update plus produced audio tick | 47 | 2.938 us |
| Timer0, all four millis bytes carry plus produced audio tick | 63 | 3.938 us |
| Pending snapshot and clear, including SREG save, CLI, and restore | 7 | 0.438 us |
| Global four-voice commit with all phases retriggered, through SREG restore | **120** | **7.500 us** |

The seek rows subtract the existing seek body. Direct service rows exclude
the caller's CALL. The global commit row starts just after CLI and includes
the SREG restore; CLI itself adds one cycle to the interrupt exclusion window.
The pending snapshot disables interrupts for six cycles including CLI.
All four controls are staged with interrupts enabled and then copied together.
The longest ISR remains short compared with its 1024-cycle output interval.

At 15625 Hz output and 7812.5 Hz synthesis, the maximum measured pair consumes
**(203 + 41) / 2048 = 11.9141%** of the CPU; its minimum is 11.5723%.
The original held-output implementation used 9.0332% maximum. Full synthesis
at 15625 Hz would instead use approximately 18.0664% with the original ISR.
Unclipped synthesis costs 196 cycles when holding the LFSR, or 200/201 cycles
when advancing it. Clipped synthesis costs 198/202/203 cycles respectively.
The light path always costs 41 cycles and does not advance any oscillator.
Execution is bounded with seven cycles of data-dependent variation and no
dependency on event density.
This exceeds the proposed 100-cycle starting goal. Four SRAM phases and
preserving the interpreter's real register allocation account for the cost;
no VM registers were reserved for synthesis. Compared with the original
Timer0 ISR, audio adds 7 cycles on ordinary interrupts, 19 on produced ticks,
and 16 on saturated ticks (approximately 0.0625% CPU while ticks are draining).

## Output interpolation and listening comparison

Timer3 now outputs at 15625 Hz while synthesis remains at 7812.5 Hz. A heavy
interrupt outputs the preceding endpoint before computing the next endpoint
and their midpoint. The next light interrupt outputs that midpoint. Both
OCR4A writes finish 26 cycles after interrupt entry/vector, preventing the
heavy/light workload difference from modulating the output spacing.

Real-timer Ardens captures of a sustained MIDI 76 sine at channel volume 31
and music master 64 measured the following. Both WAVs are mono 16-bit at
50000 Hz with identical fixed gain; analysis discards the first 100 ms and
projects the remaining samples through a Hann window onto the DDS fundamental
and its first image. These are emulator results, without a physical speaker.

| Measurement | Held output | Interpolated output |
| --- | ---: | ---: |
| Fundamental | 659.22737 Hz | 659.22737 Hz |
| Image frequency | 7153.27263 Hz | 7153.27263 Hz |
| Image relative to fundamental | -20.70 dB | -38.14 dB |
| Image suppression improvement | — | **17.45 dB** |

Capture mode accepts old or current firmware, so comparisons can use the
same emulator and song asset:

```sh
build/tests/avm_audio_tests --capture interp.hex interp.lst audio.bin song.bin output.wav 8
```

Here `audio.bin` is `build/tests/interp/audio.bin`; `song.bin` is an A2 asset
from `tools/avm_music.py`. The capture runs actual Timer0/Timer3 interrupts,
the foreground sequencer and Ardens PWM audio rather than reconstructing
the proposed filter mathematically. Listening comparisons also use the
first eight seconds of the RPG score with sine/triangle/sine voices, retaining
all notes, volumes and event timing. These captures precede the subsequent
Dewlight Skip recomposition of the shipped RPG score.

Interpolation adds 104 firmware bytes and three persistent SRAM bytes.
There are 51 native stack bytes above formatter/text workspace; the measured
libm/formatter interrupt stress still uses 41 bytes. Endpoint values, note
increments, noise rate, song format and 4 ms sequencing ticks are unchanged.
All 65536 previous/current duty pairs pass midpoint/output checks, in addition
to existing gain, waveform, saturation, register/SREG and phase checks. The
animated demo produces 15622 outputs and 7811 synthesized samples in its
one-second workload while rendering 62 frames.

This reduces output images; it does not undo aliased waveform harmonics or
phase truncation in the 64-entry oscillator tables. Audible quality on an
FX-C remains a listening check.

The rebuilt RPG passes full-device Ardens scenarios on FX and FX-C: title
silence, active music, dialogue/menu playback, save/restart, movement and
scrolling. Observed frame rate is 30.302 FPS. The separate eight native RPG
tests also pass. During this interpolation experiment the `peaceful_music`
test expected sine/triangle/sine and failed against the experimental square
score. The subsequent Dewlight Skip recomposition updates the score and its
tests together, resolving that mismatch. The
LLDB-based `rpg_integration` path stopped when its child image packer reported
permission denied opening `rpg.elf`; full-device checks were run directly
against both rebuilt packages instead.

## Waveform synthesis

Each tonal channel selects square, triangle, sawtooth, or sine from a 256-byte
flash page: four contiguous banks of 64 signed samples. Every shape uses the
same LPM/FMULSU path, with rounded signed contributions. Each amplitude is a
full unsigned byte, and each tone has a separate waveform selector in bits
7..6 of its bank byte. The latch occupies 15 bytes; persistent audio state is
104 bytes, including independent music/SFX masters and output interpolation.

The music control byte is a separate encoding: volume in bits 4..0, waveform
in bits 6..5, and ignored bit 7. The encoder repeats the tracked waveform on
every volume edit and the tracked volume on every waveform edit. Its first
event initializes every owned channel's note and control for consistent loops.
Event masks, deltas, record lengths, and the A2 header remain unchanged.

The complete ISR cycle accounting is:

| Instructions / work | Cycles |
| --- | ---: |
| Hardware interrupt entry (4), vector JMP (3) | 7 |
| Nine PUSHes (18), IN SREG (1), LDI waveform page (1), two CLRs for signed mix (2) | 22 |
| Select synthesis path: LDS, TST, taken BREQ, LDI, STS | 8 |
| Early endpoint output: LDS, CLR, STS TC4H, STS OCR4A | 7 |
| Each tonal phase: four LDS (8), ADD/ADC (2), two STS (4), times three | 42 |
| Each tonal sample: two LDSs (4), two LSRs (2), OR (1), LPM (3), FMULSU (2), SBC sign extension (1), LSL rounding (1), two ADCs (2), times three | 48 |
| Noise phase: four LDS (8), ADD/ADC (2), two STS (4) | 14 |
| LFSR: LDS (2) plus BRCC (2) when holding; or BRCC (1), LSR (1), BRCC (2), STS (2); XOR path replaces the second branch with BRCC/LDI/EOR (3) | 4 / 8 / 9 |
| Noise contribution: LDS (2), CLC (1), SBRC/optional NEG (2), SBC sign extension (1), ADD/ADC (2) | 8 |
| Add PWM bias: SUBI/SBCI (2) | 2 |
| Saturation: TST (1), BREQ (2) when in range; or BREQ (1), LDI (1), SBRS/optional LDI (2) | 3 / 5 |
| Save endpoint/midpoint: LDS (2), two STS (4), ADD (1), ROR (1) | 8 |
| Nine POPs (18), OUT SREG (1), RETI (4) | 23 |
| **Total unclipped: hold / advance without XOR / advance with XOR** | **196 / 200 / 201** |
| **Total clipped: hold / advance without XOR / advance with XOR** | **198 / 202 / 203** |

Before output interpolation, the completed-mix gain implementation cost 180/184/185 cycles for
unclipped samples and 174/178/179 for clipped samples. Prepared gains save
two cycles on unclipped samples and add six on clipped ones; the worst case
stays 185 cycles. Gain preparation removes the ISR's master load, completed-mix
multiply, and three LSL/ROL pairs. Wider accumulation and sign extension
allow full-byte gains and independent music/SFX control while retaining
zero-start accumulation and final saturation. SRAM grows by four persistent
bytes and one ISR stack byte. The three waveform bytes are copied without
loop overhead; atomic commit grows from 108 to 120 cycles.

Both masters accept 0..255: 32=100%, 255=796.875%. The foreground selects the
owning stream's master and prepares `A = floor(volume * master / 32)` (0..247).
Tone contributions are `floor(sample * A / 128 + 0.5)`; noise contributes +/-A.
The signed 16-bit mix starts at zero, remains in -982..982, then adds bias 128
and saturates to PWM duty 0..255. Loud opposing contributions cancel before
clipping. Unity samples match the previous version. Other gains truncate each
channel amplitude before synthesis instead of scaling the completed mix, so
low-volume channels can become silent at low gains. Commands recommit the
latch without retriggering notes or changing stream time.

Waveform support grew firmware from 29104 to 29472 bytes (+368); completed-mix
gain occupied 29500 bytes. Prepared gains and independent master commands
occupy 29560 bytes (+60). The table uses space before primary dispatch and
the timer ISR bodies remain later in the same assembly file.

## A1 to A2 format comparison

The A1 baseline is the interpreter after removing amplitude presets. A2 uses
packed note/volume masks, raw volume bytes, one-byte 1..256 tick waits, and
Continue/End/Loop controls. Timings below use equivalent cached events with
sample interrupts stopped; each measures service entry through RET, excluding
the caller's CALL. The note-off comparison includes reading an extended A1
delta versus a single-byte A2 delta for the following wait. A1's no-op row
still commits the latch; A2 Continue preserves it without committing.

| Workload | A1 cycles | A2 cycles | Reduction |
| --- | ---: | ---: | ---: |
| One channel, note and volume together | 914 | 758 | 17.1% |
| Four channels, notes and volumes together | 1556 | 1310 | 15.8% |
| Four channels, volumes only | 953 | 953 | Unchanged |
| Continue / no-op row | 564 | 326 | 42.2% |
| Note off and next delta | 830 | 692 | 16.6% |
| Sparse countdown | 104 | 98 | 5.8% |

At the A2 transition, interpreter `.text` shrank from **29664 to 29632 bytes**
(32 bytes saved). Programmed flash occupancy was **29632 bytes**, leaving
**64 bytes** below the bootloader boundary. The ELF's one alignment byte in
`.data` is excluded from the HEX.
Subsequent [interpreter optimizations](interpreter-optimizations.md) reduce
the square-only `.text` and programmed flash occupancy to **29104 bytes**;
the subsequent waveform implementation occupied **29472 bytes**, and the
current waveform/prepared-gain implementation occupies **29560 bytes**.
Persistent audio SRAM is now 109 bytes; the wait field stays uint16 so it
can represent 256 ticks. The demo music shrank from **3285 to 2958 bytes**
(327 bytes, 10.0%), with the same 39.936-second period and musical states,
shifted by the required one-tick initial wait.

The sample ISR, PWM configuration, and atomic commit cost were unchanged by A2.

Later amplitude scaling saves six cycles per active voice. With waveform
controls, cached one-channel note/control service was 757 cycles,
four-channel note/control service 1303 cycles, four-channel control-only
service 950 cycles, and note-off service 694 cycles. Moving master gain into
the ISR reduced these to 743, 1271, 918, and 668 cycles, respectively.
Prepared gains and separate waveform banks now cost **798, 1326, 973, and
724 cycles**. This moves work to event/gain changes instead of each sample.
The preceding square-only values were 752, 1286, 929, and 674 cycles. Continue
and sparse countdown retain their A2 timings above.

## FX bursts and cache choice

These use the existing `fx_read_program_bytes_func`, measuring its entry
through RET, including command/address setup and chip-select handling,
with Timer3 stopped for an uncontaminated comparison:

| Bytes | Cycles | Time | Cycles per byte |
| ---: | ---: | ---: | ---: |
| 16 | 357 | 22.313 us | 22.313 |
| **32** | **629** | **39.313 us** | **19.656** |
| 64 | 1173 | 73.313 us | 18.328 |

A 32-byte cache is retained: doubling it saves about 1.33 cycles per byte
but costs another 32 persistent bytes. The shared cache consumes 35 bytes
including its index, length, and owner. Music/SFX alternation invalidates
it instead of maintaining two caches. Last refills read only the remaining
asset bytes. The table measures the FX transfer, not parsing or the cache
miss bookkeeping around it. A coinciding Timer3 interrupt adds at most
203 cycles (12.688 us) of wall time per interrupt. Reads remain interruptible.
Phase-offset stress tests observed 45 output ISR entries while SPI was active
and verified all returned bytes; no SPI collision was reported.

## Interpreter and integration results

At the A1/A2 transition, the instruction benchmark contained **1018 identical measurements**.
The 17/18-cycle sequential dispatch cadences and four-cycle idle audio hook
are unchanged. `bench/cycles_instruction.txt` records the timings. Specialized
native stack tests also assert the PUSH/POP cadences and CALL/RET seek costs.
After the prepared-gain change, all 1018 instruction measurements match the
preceding waveform-only firmware exactly with sample interrupts disabled.

Autonomous idle playback ran for 100 emulated ms with a maximum service-entry
gap of **4.04563 ms**. The compiled animated demo ran for one emulated second
with no guest audio update call: **62 rendered frames, 15622 output interrupts,
7811 synthesized samples, 4.08512 ms maximum service-entry gap**, and a measured
native stack footprint of 29 bytes. Its configured frame
rate is 60; the existing frame scheduler uses integer millisecond periods.
Simulated A/B presses exercised SFX,
pause, and resume while graphics and song reads shared SPI.
The current C libm/formatter stress workload with sample interrupts reaches 41 bytes
of native stack, within the 51 bytes above the formatter/text workspace.

These workloads do not establish a universal service-latency bound. A long
straight-line instruction sequence or blocking native service can delay the
sequencer. Tests explicitly withhold servicing for 10, 50, and 100 ms:
the controls remain latched, Timer0 accumulates floor(ms/4) ticks from a zero
divider, and a single service catches up to the resulting state. Other initial
divider phases may produce one additional tick. Pending saturates at 255;
up to 1020 ms is represented and later ticks are discarded until serviced.

The note table covers MIDI 24..95 with maximum measured rounding error
**2.11087 cents**. It contains no runtime floating-point conversion.
Timer3 output rate is **15625 Hz**, with **7812.5 Hz** synthesis. Timer4 uses the **64 MHz PLL
clock**, TOP 255 and no prescaling, yielding a calculated **250 kHz carrier**.
See [audio.md](audio.md) for register settings and datasheet references.

## Size and validation

| Resource | Result |
| --- | ---: |
| Persistent audio SRAM | **85 bytes** |
| Persistent pending control packet | 16 bytes, included above |
| Call-lifetime audio dirty flag | 1 byte, in existing temporary workspace |
| Call-lifetime encoded event buffer | 10 bytes, in existing temporary workspace |
| Remaining native stack above formatter/text workspace | 78 bytes |
| Current native `.text` | **29156 bytes** |
| Current total firmware flash | **29156 bytes** |
| Waveform support versus square-only firmware | +368 bytes |
| Prepared gains and independent masters versus waveform-only firmware | +88 bytes |
| Display commands and system queries | +88 bytes |
| Subsequent cold-path size reductions | -176 bytes |
| Shared CSET decoder and local dispatch | -416 bytes |
| Hexadecimal float digit loop | -48 bytes |
| Output interpolation versus held output | +104 bytes |
| Terminator-driven song reader versus length-bounded reader | -76 bytes |
| Bootloader ceiling / remaining space | 29696 / **660 bytes** |

The [cold-path measurements](interpreter-optimizations.md#cold-path-size-reductions-after-displaysystem-queries)
record the startup and formatter tradeoffs for the latest size reductions.
The [CSET comparison](cset-benchmarks.md) records the subsequent decoder's
instruction and complete C/C++ benchmark changes in cycles and percentages.
The [hex formatter comparison](hex-formatter-benchmarks.md) records the
subsequent 48-byte reduction and five-cycle cost per finite `%a`/`%A` conversion.

The four bytes beyond the approximate 100-byte SRAM goal retain two complete
stream records, desired music/SFX banks, and one cache. This supports
effect overrides without losing music progression and pause/resume.
Phases and the current latch persist independently of aliased
formatter/text workspace. No queue of audio events or samples is stored.

The score compiler now accepts terse note notation, named instruments, custom
amplitude envelopes and tremolo, expanded offline into unchanged A2 controls.
Both masters default to 128; volume 31 prepares amplitude 124. Playback accepts
only a 24-bit pointer and follows End/Loop records. Removing size/remaining
counters saves eight SRAM bytes; assets larger than 65535 bytes are covered by
both compiler and native playback/rewind tests. The 32-byte cache may read ahead
past a terminal record. Asset truncation is no longer detected by byte count.

Run `cmake --build build --config RelWithDebInfo --target avm_audio_tests_run`
for the cycle, synthesis, parser, compiler, autonomous demo, SPI stress, and
Mini/FX-C assembly checks. `avm_tests_run` additionally runs all existing guest
fixtures, including the C audio/libm/formatter stress test at six optimization
levels. Tests cover packed 24-bit pointers, cache/page boundaries, malformed
records, dense positive-time catch-up, Continue-only loops,
one/256-tick initial waits, saturation,
note retriggering, atomic chords, music under SFX, release, and direct tones.
Validation passed all 471 guest fixtures, 152 native PUSH/POP cases, 1133 native
stack-bound cases, 31 native audio cases, and 21 Python compiler tests, as well
as the animated and formatter integration workloads and both variant builds.
Waveform checks compare 24576 samples (all 64 positions and 32 amplitudes on
all three tonal voices) against independent mathematical shapes; gain staging
checks exercise all 256 packed controls against all 256 master levels for
both streams (131072 cases), plus 256 mixed-owner gain combinations. Saturation
checks cover every possible -1014..1014 mix supported by raw full-byte
amplitudes (2029 cases), both clipping polarities, cancellation before clipping,
register/SREG preservation, and stack safety. A further 196608 samples combine
all four waveforms, all 256 raw amplitude values, and all three noise paths.
Command checks cover all 256 global gain bytes, independent muting, ownership,
phase/time preservation, pause/resume, SFX release, and direct-tone gain.
Decoder tests accept all 256 control-byte values, preserve phase,
restore initial loop state, and restore the current music waveform after SFX.

All fixed code-layout assertions and the firmware ceiling still hold. No
emulator changes were required: the bundled Ardens already models Timer3,
Timer4, PLL, SPI, and the relevant GPIO. Physical carrier frequency, differential
pin behavior, audio quality, clicks, current draw, and board/bootloader handoff
remain unverified without a device and scope.
