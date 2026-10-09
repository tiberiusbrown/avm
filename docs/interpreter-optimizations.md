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
