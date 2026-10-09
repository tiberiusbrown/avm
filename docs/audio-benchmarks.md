# Audio measurements

Measured with the repository's Ardens AVR emulator, unmerged AVR instructions,
16 MHz CPU, and a CMake `RelWithDebInfo` build. These are instruction-cycle
measurements and emulated integration results, not oscilloscope measurements.

## Native cycle costs

| Operation | AVR cycles | Time at 16 MHz |
| --- | ---: | ---: |
| Seek hook, no pending tick | **4 added** | 0.250 us |
| Seek hook, pending tick but no streams | 29 added | 1.813 us |
| Seek hook, one active stream, no event due | 109 added | 6.813 us |
| One-stream sparse countdown service, entry through RET | 98 | 6.125 us |
| Cached note-off event plus next delta and commit, entry through RET | 694 | 43.375 us |
| Timer3, including 4-cycle interrupt entry and 3-cycle vector JMP | **162..167** | 10.125..10.438 us |
| Timer0, ordinary millis update, including entry/vector | 35 | 2.188 us |
| Timer0, ordinary millis update plus produced audio tick | 47 | 2.938 us |
| Timer0, all four millis bytes carry plus produced audio tick | 63 | 3.938 us |
| Pending snapshot and clear, including SREG save, CLI, and restore | 7 | 0.438 us |
| Global four-voice commit with all phases retriggered, through SREG restore | **108** | **6.750 us** |

The seek rows subtract the existing seek body. Direct service rows exclude
the caller's CALL. The global commit row starts just after CLI and includes
the SREG restore; CLI itself adds one cycle to the interrupt exclusion window.
The pending snapshot disables interrupts for six cycles including CLI.
All four controls are staged with interrupts enabled and then copied together.
The sample ISR remains short compared with its 2048-cycle sample interval.

At 7812.5 Hz the maximum measured ISR cost consumes **167 / 2048 = 8.1543%**
of the CPU; its minimum is 7.9102%. Noise hold costs 162 cycles; advancing
the LFSR costs 166 or 167, depending on its low bit. Thus execution is bounded
with five cycles of data-dependent variation and no dependency on event density.
This exceeds the proposed 100-cycle starting goal. Four SRAM phases and
preserving the interpreter's real register allocation account for the cost;
no VM registers were reserved for synthesis. Compared with the original
Timer0 ISR, audio adds 7 cycles on ordinary interrupts, 19 on produced ticks,
and 16 on saturated ticks (approximately 0.0625% CPU while ticks are draining).

## Waveform synthesis

Each tonal channel selects square, triangle, sawtooth, or sine from a 256-byte
flash page: four contiguous banks of 64 signed samples. Every shape uses the
same LPM/MULS path, with rounded signed contributions. The live control packs
the bank into bits 7..6 and twice the scaled amplitude into bits 5..0. This
keeps the 12-byte latch and 105-byte persistent allocation unchanged.

The music control byte is a separate encoding: volume in bits 4..0, waveform
in bits 6..5, and ignored bit 7. The encoder repeats the tracked waveform on
every volume edit and the tracked volume on every waveform edit. Its first
event initializes every owned channel's note and control for consistent loops.
Event masks, deltas, record lengths, and the A2 header remain unchanged.

The complete ISR cycle accounting is:

| Instructions / work | Cycles |
| --- | ---: |
| Hardware interrupt entry (4), vector JMP (3) | 7 |
| Eight PUSHes (16), IN SREG (1), two LDIs (2) | 19 |
| Each tonal phase: four LDS (8), ADD/ADC (2), two STS (4), times three | 42 |
| Each tonal sample: LDS (2), MOV (1), two ANDIs (2), two LSRs (2), OR (1), LPM (3), MULS (2), LSL (1), ADC (1), times three | 45 |
| Noise phase: four LDS (8), ADD/ADC (2), two STS (4) | 14 |
| LFSR: LDS (2) plus BRCC (2) when holding; or BRCC (1), LSR (1), BRCC (2), STS (2); XOR path replaces the second branch with BRCC/LDI/EOR (3) | 4 / 8 / 9 |
| Noise contribution: LDS (2), SBRC/optional NEG (2), ADD (1) | 5 |
| CLR (1), STS TC4H (2), STS OCR4A (2) | 5 |
| Eight POPs (16), OUT SREG (1), RETI (4) | 21 |
| **Total: hold / advance without XOR / advance with XOR** | **162 / 166 / 167** |

This adds **43 cycles per sample** to the square-only ISR (2.0996 percentage
points of CPU), including the three additional saved registers r1 and Z.
The rounded square samples still reproduce the previous exact +/-amplitude
output. Noise synthesis, phase retrigger behavior, PWM settings, and the
108-cycle atomic commit are unchanged. Native firmware grows from 29104 to
29472 bytes (+368); the table uses the space before primary dispatch and the
timer ISR bodies move later in the same assembly file.

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
the subsequent waveform implementation occupies **29472 bytes**.
Persistent audio SRAM remains 105 bytes; the wait field stays uint16 so it
can represent 256 ticks. The demo music shrank from **3285 to 2958 bytes**
(327 bytes, 10.0%), with the same 39.936-second period and musical states,
shifted by the required one-tick initial wait.

The sample ISR, PWM configuration, and atomic commit cost were unchanged by A2.

Later amplitude scaling saves six cycles per active voice. With waveform
controls, current cached one-channel note/control service is 757 cycles,
four-channel note/control service 1303 cycles, four-channel control-only
service 950 cycles, and note-off service 694 cycles. The preceding square-only
values were 752, 1286, 929, and 674 cycles. Continue and sparse countdown retain
their A2 timings above.

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
167 cycles (10.438 us) of wall time per interrupt. Reads remain interruptible.
Phase-offset stress tests observed 22 sample ISR entries while SPI was active
and verified all returned bytes; no SPI collision was reported.

## Interpreter and integration results

At the A1/A2 transition, the instruction benchmark contained **1018 identical measurements**.
The 17/18-cycle sequential dispatch cadences and four-cycle idle audio hook
are unchanged. `bench/cycles_instruction.txt` records the timings. Specialized
native stack tests also assert the PUSH/POP cadences and CALL/RET seek costs.

Autonomous idle playback ran for 100 emulated ms with a maximum service-entry
gap of **4.00038 ms**. The compiled animated demo ran for one emulated second
with no guest audio update call: **62 rendered frames, 7811 sample interrupts,
4.14175 ms maximum service-entry gap**, and a measured native stack footprint
of 30 bytes with the 16-bar Sunlit Garden arrangement. Its configured frame
rate is 60; the existing frame scheduler uses integer millisecond periods.
Simulated A/B presses exercised SFX,
pause, and resume while graphics and song reads shared SPI.
The current C libm/formatter stress workload with sample interrupts reaches 40 bytes
of native stack, within the 58 bytes above the formatter/text workspace.

These workloads do not establish a universal service-latency bound. A long
straight-line instruction sequence or blocking native service can delay the
sequencer. Tests explicitly withhold servicing for 10, 50, and 100 ms:
the controls remain latched, Timer0 accumulates floor(ms/4) ticks from a zero
divider, and a single service catches up to the resulting state. Other initial
divider phases may produce one additional tick. Pending saturates at 255;
up to 1020 ms is represented and later ticks are discarded until serviced.

The note table covers MIDI 24..95 with maximum measured rounding error
**2.11087 cents**. It contains no runtime floating-point conversion.
Timer3 sample rate is **7812.5 Hz**. Timer4 uses the user-requested **64 MHz PLL
clock**, TOP 255 and no prescaling, yielding a calculated **250 kHz carrier**.
See [audio.md](audio.md) for register settings and datasheet references.

## Size and validation

| Resource | Result |
| --- | ---: |
| Persistent audio SRAM | **105 bytes** |
| Call-lifetime commit staging | 13 bytes, in existing temporary workspace |
| Remaining native stack above formatter/text workspace | 58 bytes |
| Current native `.text` | **29472 bytes** |
| Current total firmware flash | **29472 bytes** |
| Waveform support versus square-only firmware | +368 bytes |
| Bootloader ceiling / remaining space | 29696 / **224 bytes** |

The five bytes beyond the approximate 100-byte SRAM goal retain two complete
bounded stream records, desired music/SFX banks, and one cache. This supports
effect overrides without losing music progression, pause/resume, and bounded
asset reads. Phases and the current latch persist independently of aliased
formatter/text workspace. No queue of audio events or samples is stored.

Run `cmake --build build --config RelWithDebInfo --target avm_audio_tests_run`
for the cycle, synthesis, parser, compiler, autonomous demo, SPI stress, and
Mini/FX-C assembly checks. `avm_tests_run` additionally runs all existing guest
fixtures, including the C audio/libm/formatter stress test at six optimization
levels. Tests cover packed 24-bit pointers, cache/page boundaries, malformed
and truncated streams, dense positive-time catch-up, Continue-only loops,
one/256-tick initial waits, saturation,
note retriggering, atomic chords, music under SFX, release, and direct tones.
Validation passed all 459 guest fixtures, 152 native PUSH/POP cases, 1133 native
stack-bound cases, 23 native audio cases, and 12 Python compiler tests, as well
as the animated and formatter integration workloads and both variant builds.
Waveform checks compare 24576 samples (all 64 positions and 32 amplitudes on
all three tonal voices) against independent mathematical shapes; scaling checks
exercise all 256 packed controls against all 33 master levels and all 256 SFX
controls. Decoder tests accept all 256 control-byte values, preserve phase,
restore initial loop state, and restore the current music waveform after SFX.

All fixed code-layout assertions and the firmware ceiling still hold. No
emulator changes were required: the bundled Ardens already models Timer3,
Timer4, PLL, SPI, and the relevant GPIO. Physical carrier frequency, differential
pin behavior, audio quality, clicks, current draw, and board/bootloader handoff
remain unverified without a device and scope.
