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
| Cached note-off event plus next delta and commit, entry through RET | 724 | 45.250 us |
| Timer3, including 4-cycle interrupt entry and 3-cycle vector JMP | **178..185** | 11.125..11.563 us |
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
The sample ISR remains short compared with its 2048-cycle sample interval.

At 7812.5 Hz the maximum measured ISR cost consumes **185 / 2048 = 9.0332%**
of the CPU; its minimum is 8.6914%. Unclipped samples cost 178 cycles when
holding the LFSR, or 182/183 cycles when advancing it, depending on its low bit.
Clipped samples cost 180/184/185 cycles respectively.
Execution is bounded with seven cycles of data-dependent variation and no
dependency on event density.
This exceeds the proposed 100-cycle starting goal. Four SRAM phases and
preserving the interpreter's real register allocation account for the cost;
no VM registers were reserved for synthesis. Compared with the original
Timer0 ISR, audio adds 7 cycles on ordinary interrupts, 19 on produced ticks,
and 16 on saturated ticks (approximately 0.0625% CPU while ticks are draining).

## Waveform synthesis

Each tonal channel selects square, triangle, sawtooth, or sine from a 256-byte
flash page: four contiguous banks of 64 signed samples. Every shape uses the
same LPM/FMULSU path, with rounded signed contributions. Each amplitude is a
full unsigned byte, and each tone has a separate waveform selector in bits
7..6 of its bank byte. The latch occupies 15 bytes; persistent audio state is
109 bytes, including independent music and SFX master bytes.

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
| Each tonal phase: four LDS (8), ADD/ADC (2), two STS (4), times three | 42 |
| Each tonal sample: two LDSs (4), two LSRs (2), OR (1), LPM (3), FMULSU (2), SBC sign extension (1), LSL rounding (1), two ADCs (2), times three | 48 |
| Noise phase: four LDS (8), ADD/ADC (2), two STS (4) | 14 |
| LFSR: LDS (2) plus BRCC (2) when holding; or BRCC (1), LSR (1), BRCC (2), STS (2); XOR path replaces the second branch with BRCC/LDI/EOR (3) | 4 / 8 / 9 |
| Noise contribution: LDS (2), CLC (1), SBRC/optional NEG (2), SBC sign extension (1), ADD/ADC (2) | 8 |
| Add PWM bias: SUBI/SBCI (2) | 2 |
| Saturation: TST (1), BREQ (2) when in range; or BREQ (1), LDI (1), SBRS/optional LDI (2) | 3 / 5 |
| CLR (1), STS TC4H (2), STS OCR4A (2) | 5 |
| Nine POPs (18), OUT SREG (1), RETI (4) | 23 |
| **Total unclipped: hold / advance without XOR / advance with XOR** | **178 / 182 / 183** |
| **Total clipped: hold / advance without XOR / advance with XOR** | **180 / 184 / 185** |

The preceding completed-mix gain implementation cost 180/184/185 cycles for
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
185 cycles (11.563 us) of wall time per interrupt. Reads remain interruptible.
Phase-offset stress tests observed 23 sample ISR entries while SPI was active
and verified all returned bytes; no SPI collision was reported.

## Interpreter and integration results

At the A1/A2 transition, the instruction benchmark contained **1018 identical measurements**.
The 17/18-cycle sequential dispatch cadences and four-cycle idle audio hook
are unchanged. `bench/cycles_instruction.txt` records the timings. Specialized
native stack tests also assert the PUSH/POP cadences and CALL/RET seek costs.
After the prepared-gain change, all 1018 instruction measurements match the
preceding waveform-only firmware exactly with sample interrupts disabled.

Autonomous idle playback ran for 100 emulated ms with a maximum service-entry
gap of **4.11469 ms**. The compiled animated demo ran for one emulated second
with no guest audio update call: **62 rendered frames, 7811 sample interrupts,
4.14194 ms maximum service-entry gap**, and a measured native stack footprint
of 31 bytes with the 16-bar Sunlit Garden arrangement. Its configured frame
rate is 60; the existing frame scheduler uses integer millisecond periods.
Simulated A/B presses exercised SFX,
pause, and resume while graphics and song reads shared SPI.
The current C libm/formatter stress workload with sample interrupts reaches 41 bytes
of native stack, within the 54 bytes above the formatter/text workspace.

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
| Persistent audio SRAM | **109 bytes** |
| Call-lifetime commit staging | 16 bytes, in existing temporary workspace |
| Remaining native stack above formatter/text workspace | 54 bytes |
| Current native `.text` | **29472 bytes** |
| Current total firmware flash | **29472 bytes** |
| Waveform support versus square-only firmware | +368 bytes |
| Prepared gains and independent masters versus waveform-only firmware | +88 bytes |
| Display commands and system queries | +88 bytes |
| Subsequent cold-path size reductions | -176 bytes |
| Bootloader ceiling / remaining space | 29696 / **224 bytes** |

The [cold-path measurements](interpreter-optimizations.md#cold-path-size-reductions-after-displaysystem-queries)
record the startup and formatter tradeoffs for the latest size reductions.

The nine bytes beyond the approximate 100-byte SRAM goal retain two complete
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
stack-bound cases, 27 native audio cases, and 12 Python compiler tests, as well
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
