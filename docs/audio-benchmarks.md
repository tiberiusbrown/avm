# Audio measurements

Measured with the repository's Ardens AVR emulator, unmerged AVR instructions,
16 MHz CPU, and a CMake `RelWithDebInfo` build. These are instruction-cycle
measurements and emulated integration results, not oscilloscope measurements.

## Native cycle costs

| Operation | AVR cycles | Time at 16 MHz |
| --- | ---: | ---: |
| Seek hook, no pending tick | **4 added** | 0.250 us |
| Seek hook, pending tick but no streams | 29 added | 1.813 us |
| Seek hook, one active stream, no event due | 115 added | 7.188 us |
| One-stream sparse countdown service, entry through RET | 104 | 6.500 us |
| Cached note-off event plus next extended delta and commit, entry through RET | 830 | 51.875 us |
| Timer3, including 4-cycle interrupt entry and 3-cycle vector JMP | **119..124** | 7.438..7.750 us |
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

At 7812.5 Hz the maximum measured ISR cost consumes **124 / 2048 = 6.0547%**
of the CPU; its minimum is 5.8105%. Noise hold costs 119 cycles; advancing
the LFSR costs 123 or 124, depending on its low bit. Thus execution is bounded
with five cycles of data-dependent variation and no dependency on event density.
This exceeds the proposed 100-cycle starting goal. Four SRAM phases and
preserving the interpreter's real register allocation account for the cost;
no VM registers were reserved for synthesis. Compared with the original
Timer0 ISR, audio adds 7 cycles on ordinary interrupts, 19 on produced ticks,
and 16 on saturated ticks (approximately 0.0625% CPU while ticks are draining).

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
124 cycles (7.75 us) of wall time per interrupt. Reads remain interruptible.
Phase-offset stress tests observed 21 sample ISR entries while SPI was active
and verified all returned bytes; no SPI collision was reported.

## Interpreter and integration results

The before/after instruction benchmark contains **1018 measurements**:
677 are unchanged, and the remaining 341 each increased by exactly four
cycles because they restart the FX stream. The 17/18-cycle sequential dispatch
cadences are unchanged. `bench/cycles_instruction.txt` records the resulting
timings. Specialized native stack tests also assert the unchanged PUSH/POP
cadences and updated CALL/RET seek costs.

Autonomous idle playback ran for 100 emulated ms with a maximum service-entry
gap of **4.00038 ms**. The compiled animated demo ran for one emulated second
with no guest audio update call: **62 rendered frames, 7810 sample interrupts,
4.14206 ms maximum service-entry gap**, and a measured native stack footprint
of 26 bytes with the 16-bar Sunlit Garden arrangement. Its configured frame
rate is 60; the existing frame scheduler uses integer millisecond periods.
Simulated A/B presses exercised SFX,
pause, and resume while graphics and song reads shared SPI.
The C libm/formatter stress workload with sample interrupts reached 36 bytes
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
| Native firmware before audio | 28184 bytes |
| Native firmware with audio | **29688 bytes** |
| Firmware increase | 1504 bytes |
| Bootloader ceiling / remaining space | 29696 / **8 bytes** |

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
and truncated streams, dense valid catch-up, zero-time loop bounds, saturation,
note retriggering, atomic chords, music under SFX, release, and direct tones.
Validation passed all 459 guest fixtures, 152 native PUSH/POP cases, 1133 native
stack-bound cases, 14 native audio cases, and six Python compiler tests, as well
as the animated and formatter integration workloads and both variant builds.

All fixed code-layout assertions and the firmware ceiling still hold. No
emulator changes were required: the bundled Ardens already models Timer3,
Timer4, PLL, SPI, and the relevant GPIO. Physical carrier frequency, differential
pin behavior, audio quality, clicks, current draw, and board/bootloader handoff
remain unverified without a device and scope.
