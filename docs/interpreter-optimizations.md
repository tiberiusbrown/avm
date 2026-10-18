# Interpreter optimization measurements

Measured with the repository's Ardens emulator at 16 MHz, using unmerged AVR
instructions and CMake `RelWithDebInfo`. Native implementation remains entirely
in `interp/interp.asm`. Each of the first four stages passed `avm_tests_run` and
the instruction, C, and C++ benchmarks before the next stage was applied.

These measurements describe the square-only implementation before selectable
waveforms. Current firmware size, synthesis timing, and validation results are
in [audio-benchmarks.md](audio-benchmarks.md).

## Firmware size

| Stage | `.text` bytes | Change from preceding stage |
| --- | ---: | ---: |
| Baseline | 29632 | — |
| Eight-bit decimal division with small-dividend fast path | 29640 | +8 |
| Bound SYS IDs and truncate dispatch to 57 entries | 29244 | -396 |
| Remove five float veneers and shorten eligible transfers | 29184 | -60 |
| Preserve computed float precision on the native stack | 29144 | -40 |
| Amplitude scaling, trap removal, four tail calls, eight branch collapses | 29104 | -40 |

Total `.text` savings are **528 bytes (1.78%)**. Alignment accounts for the
small differences between individual instruction-byte savings and linked
stage sizes. Total programmed flash occupancy is **29104 bytes**, leaving
**592 bytes** below the 29696-byte bootloader boundary. The ELF's one alignment
byte in `.data` is excluded from the HEX by the build's `.text` selection.
Persistent audio SRAM is unchanged.

The SYS guard rejects IDs `0x39..0xff` before indexing the table. Defined IDs
retain their existing meaning. The debug services use padded standard dispatch
tails to keep SPI reads after completion despite the new bounds check.

Five float helpers are now reached directly. Two remaining veneers use RJMP
because some callers cannot reach the shared helpers with RCALL. Ordinary
absolute transfers were shortened only after checking their assembled ranges;
fixed vector slots and the timing-sensitive far-jump handoff retain their forms.

## Cycle measurements

| Workload | Before | After |
| --- | ---: | ---: |
| SYS vsnprintf `%d`, INT16_MIN | 4225 | 1874 |
| SYS vsnprintf `%ld`, INT32_MIN | 20548 | 3627 |
| SYS vsnprintf `%lu`, UINT32_MAX | 19954 | 3631 |
| SYS debug_printfv_P `%f`, 1.5 | 2084 | 2063 |
| SYS debug_printfv_P `%e`, 1.5 | 2129 | 2090 |
| SYS debug_printfv_P `%g`, small scientific form | 2355 | 2314 |
| SYS debug_break / debug_putc | 34 | 35 |
| SYS millis | 36 | 38 |
| SYS millis32 | 40 | 42 |

The large decimal cases improve by **81.8% and 82.3%**. The byte division
performs eight bounded bit steps instead of up to 255 repeated subtractions;
leading values below ten still take a short path. Formatter T state is retained.
The SYS bound adds two cycles to the shared dispatch path; the debug-service
tail changes recover one of those cycles.

Audio staging uses FMUL followed by two shifts to compute
`floor(amplitude * master / 32)` exactly over amplitudes 0..31 and master 0..32.
This saves **12 code bytes and 6 cycles per active voice**, or 24 cycles for a
four-voice chord. The 108-cycle atomic copy and 119..124-cycle sample ISR are
unchanged. The four ordinary helper tail calls each save two bytes and five
cycles; the eight collapsed conditional trampolines each save two bytes and
one cycle on either outcome.

The MOV32 benchmark now assembles `mov32 q0, q1`, measuring the dedicated F2
instruction at **38 cycles**. Its former 74-cycle result measured two F1 moves.
This corrects the benchmark rather than changing MOV32's interpreter latency.
LLVM's MOV32 and four fixed SYS costs, benchmark provenance, and scheduling
regression are updated to match these measurements.
The assembler selects the existing MOV32_F2 opcode for native forms so
LLVM-MCA can use its scheduling class; emitted instruction bytes are unchanged.

## Validation

The suite passes 459 guest fixtures at all configured optimization levels,
152 native PUSH/POP cases, 1133 stack-bound cases, 19 audio cases, and nine
Python music-compiler tests. Added native checks cover:

- All 2560 byte/remainder division inputs and ten 32-bit boundaries.
- All 57 defined and 199 invalid SYS IDs, preserving guest registers and flags.
- 96 float precision/value/T-state combinations with balanced native stack.
- All 1056 amplitude/master pairs and 32 SFX levels on every voice.

Mini and FX-C firmware variants assemble successfully. The animated demo still
renders 62 frames and processes 7811 sample interrupts in one emulated second.
The formatter/audio workload reaches **37 bytes** of native stack after the
precision save, within the 58 bytes available above temporary workspace.
The tracked interpreter HEX/listing/map, benchmark results/disassemblies, and
`projects/audio_demo/audio_demo.arduboy` are regenerated.
All 284 AVM LLVM code-generation/MC tests, debugger integration, profiler
integration, and the native instruction-boundary probe pass. The profiler's
exact timing fixture is refreshed for the current firmware while retaining
interval reconciliation and CLI/LLDB equivalence checks.

## Cold-path size reductions after display/system queries

The baseline for this pass includes selectable audio waveforms, raw display
commands, and the three system-configuration query services. Measurements use
the same 16 MHz Ardens configuration and `RelWithDebInfo` build described above.

| Stage | `.text` bytes | Change from preceding stage |
| --- | ---: | ---: |
| Display/system-query baseline | 29648 | — |
| Pack sine/tangent coefficients and OLED boot commands before waveforms | 29568 | -80 |
| Clear contiguous interpreter-private state with one startup loop | 29540 | -28 |
| Share the saturating width/precision decimal parser | 29496 | -44 |
| Initialize audio control registers from a byte-address table | 29472 | -24 |

The complete reduction is **176 bytes (0.59%)**, leaving **224 bytes** below
the 29696-byte boundary. Stage deltas include alignment changes. The 78 bytes
of relocated constants occupy existing padding at `0x00b2`;
waveforms still begin at `0x0100` and primary dispatch still begins at `0x0200`.
Coefficient bytes and floating-point semantics are unchanged. Persistent SRAM
and formatter workspace sizes are unchanged.
SSD1309, Mini, and FX-C builds also occupy 29472 bytes. SH1106 falls from
29672 to **29500 bytes**, saving 172 bytes and leaving 196 bytes free.
Its shorter boot-command sequence leaves three early padding bytes unused.

Arctangent coefficients deliberately remain in the libm region. The existing
polynomial helper restores Z before returning, and the subsequent atan rounder
observes Z's high byte as sticky rounding state. Moving that table into page
zero would change some tie results by one ULP. Four exact checkpoint-result
checks guard against this; changing the underlying rounding behavior is outside
this size-only pass. Sine/tangent finish through a fresh multiplication, so
their table addresses do not affect the rounding state.

The startup loop now clears 126 private bytes, including inactive sprite/font
cache fields, instead of clearing 109 audio bytes plus seven individual
stores. The nonzero text-mode default is installed afterward. Audio setup uses
14 one-byte I/O addresses: timer stop/mask writes precede their other control
resets, and the Timer4 high-byte latch is cleared before counter/compare writes.

| Measurement | Before, cycles | After, cycles | Difference |
| --- | ---: | ---: | ---: |
| Reset to first opcode, native audio fixture | 235529 | 235687 | +158 |
| Isolated audio initialization, including RET | 1750 | 1837 | +87 |
| RAM format `%d`, value 7 | 817 | 817 | 0 |
| RAM format `%12.5d`, value 7 | 1038 | 1053 | +15 |
| Program format `%12.5d`, value 7 | 1441 | 1456 | +15 |
| RAM format `%65536d`, value 7 | 1213 | 1239 | +26 |
| RAM format `%.65536d`, value 7 | 1246 | 1272 | +26 |

Startup costs an additional **9.875 microseconds**: 71 cycles for the broader
private clear and 87 cycles for the audio register loop. Parsing a literal
width or precision digit costs five additional cycles when multiplying, or
six when saturating. Formats without literal fields and `*` fields do not
enter the new shared helper. Its return address uses two transient native
stack bytes; the observed formatter/audio stress peak remains **41 bytes**,
and the dedicated field-formatting checks peak at **27 bytes**.

The full `avm_bench_run` passes all **471 guest fixtures**, **152 PUSH/POP**
cases, **1133 stack-bound** cases, **27 native audio** cases, and **88 display
preservation cases per controller**. Mini/FX-C and all three display-controller
variants build successfully. All **78 C** and **5 C++** benchmark timings are
unchanged. Of **1018 instruction/SYS measurements**, **986** are unchanged;
the remaining **32** are formatting cases with literal fields and increase by
5, 10, or 15 cycles. No arithmetic instruction or libm SYS latency changes.

The native checks cover 46 RAM/program format cases, including zero/leading
zero fields, combined width/precision, 65534/65535/65536 boundaries, and long
overflowing digit sequences. They check parsed values, bounded output,
logical counts, register/flag preservation, stack balance, and cycle counts.
The Timer3 sample ISR remains **178–185 cycles**, and atomic chord commit
remains **120 cycles**. The animated demo still renders **62 frames** and
processes **7811 sample interrupts** in one emulated second.

## Shared CSET decoder

The next pass replaces the 480-byte F8 executable table with a 64-byte shared
decoder and local dispatch. Default firmware falls from **29472 to 29056
bytes**, saving **416 bytes (1.4115%)** and leaving **640 bytes** below the
29696-byte ceiling. SH1106 falls from 29500 to 29084 bytes, saving the same
416 bytes and leaving 612 bytes free.

Every CSET condition, destination, and outcome now takes **41 cycles**, versus
38 previously: **+3 cycles (+7.8947%)**. The other **1006 instruction/SYS
timings are unchanged**. The sum of 78 C benchmark timings increases by
**50667 cycles (+0.036821%)**; 13 cases change, with the largest individual
increase being **15360 cycles (+1.189526%)** in `byte_comparisons.c`. All five
C++ timings are unchanged. Guest benchmark images remain byte-identical after
updating LLVM's CSET scheduling metadata to 41 cycles.

The [complete comparison](cset-benchmarks.md) lists before/after cycles and
percentage differences for every C/C++ benchmark and changed instruction
measurement, with a CSV covering all 1101 measurements. It also records the
16-byte dispatch tradeoff: reusing an existing tail would save 432 bytes but
cost two more cycles per CSET.

Native checks exercise **49152 valid condition/register/flag/PC combinations**
at constant 41-cycle latency and **1664 invalid encodings**. These cover all
eight destinations, every architectural flag byte, byte/word PC carries,
24-bit PC wraparound, register/flag/SRAM preservation, and balanced stack state.

## Hexadecimal float digit loop

The `%a`/`%A` fraction generator now emits two nibbles per iteration over three
bytes instead of using six repeated extraction blocks. The routine shrinks
from **98 to 52 bytes**. Removing the final alignment NOP brings total firmware
savings to **48 bytes**, taking the default image from **29056 to 29008 bytes**
and leaving **688 bytes** below the 29696-byte ceiling. CSET plus this change
save **464 bytes** from the preceding 29472-byte firmware.

Each finite hexadecimal float conversion takes **five additional cycles**
(0.3125 microseconds at 16 MHz). Seventeen SYS benchmark cases change by
**+0.0727% to +0.3695%**; the other **1001 instruction/SYS cases**, all **78 C
benchmarks**, and all **five C++ benchmarks** are unchanged (**0 cycles, 0%**).
Integer hexadecimal and decimal float formatting are unchanged.

The [hex formatter comparison](hex-formatter-benchmarks.md) records all changed
timings. The native digit check passes against both versions for **7192
byte-pattern/random/letter-case/T combinations**, with matching output,
workspace guards, preserved formatter state, and balanced native stack.
