# Native fpoly measurements

Measured on 2026-10-25 with the Ardens AVR emulator, RelWithDebInfo, `-O2`
benchmark callers and `-O3 -ffp-contract=off` production math. Each workload
measures 32 evaluations. Timings include the loop and result accumulation,
subtract the 35-cycle adjacent-break baseline, and exclude asynchronous
interrupt work. Before measurements use the saved original interpreter and
runtime archive with the same workload sources. These are emulated AVR cycle
counts, not wall-clock timings or physical-device measurements.

## Interpreter flash

The complete raw `.text` image, including alignment and `.org` gaps, grows
from **26,936 to 27,176 bytes: +240 bytes**. FX and FX-C final images have the
same size. The instruction is `FF CA`, an unsigned nonzero byte count, and
highest-degree-first inline little-endian binary32 coefficients. Only `q2`
changes; `PC` resumes after the complete coefficient payload.

The active instruction SPI transaction stays open. The reader overlaps the
next coefficient's first-byte transfer with arithmetic, uses the legal
18-cycle standard handoff for its remaining bytes, and advances the 24-bit PC
over the payload once. No coefficient pointer service or guest polynomial
function is involved.

The initial correct extended Horner implementation occupied 27,180 bytes.
After measurement, keeping the low half of `x` in its untouched input
registers removed two native register saves and a copy. The first multiply
uses the existing `__mulsf3x`, since the leading coefficient has a zero
extension; subsequent multiplies retain the extension through a shared core.
Together these changes save **28 cycles per nonconstant invocation** and
four flash bytes, including alignment. The native handler saves seven bytes
on its private stack; this is independent of the guest stack.

## Standalone polynomials

Identical volatile inputs and coefficients compare native evaluation with
ordinary compiler-generated binary32 Horner arithmetic. Saved cycles per
evaluation are the difference between the 32-evaluation workloads divided by
32. Executable text includes common startup code; its difference measures
the guest code saving. Coefficients are included in native executable text.

| Degree | Guest cycles | Native cycles | Saved/evaluation | Cycle reduction | Guest/native text bytes |
|---:|---:|---:|---:|---:|---:|
| 1 | 40,299 | 31,453 | 276.4 | 22.0% | 562 / 540 |
| 2 | 58,866 | 41,434 | 544.8 | 29.6% | 571 / 544 |
| 4 | 89,724 | 60,707 | 906.8 | 32.3% | 571 / 552 |
| 8 | 151,293 | 99,080 | 1,631.7 | 34.5% | 592 / 568 |
| 12 | 209,663 | 137,272 | 2,262.2 | 34.5% | 608 / 584 |

For an isolated instruction with `x=0.5` and coefficients all `0.25`, native
primary-slot-to-primary-slot costs are 169, 433, 718, 1,288, 2,428 and 3,568
cycles for degrees 0, 1, 2, 4, 8 and 12; degree 254 takes 72,544 cycles.
Floating helper timing depends on the actual operands and cancellation.

## Runtime math

`math_sin_small`, `math_cos_small` and `math_tan_small` use paired positive
and negative angles from 0.125 through 128. No input enters large-angle
reduction. Existing broad workloads remain, covering large magnitudes through the
largest finite input. The remaining focused workloads retain their
existing inputs and exceptional/fallback paths.

Guest size is the linked ELF executable text size, excluding ELF container
metadata and package padding. Values in the last column are after minus before.

| Workload | Before cycles | After cycles | Reduction | Guest text before/after | Text delta |
|---|---:|---:|---:|---:|---:|
| `math_atan` | 259,463 | 177,957 | 31.4% | 795 / 698 | -97 |
| `math_atan2` | 536,247 | 458,964 | 14.4% | 1,855 / 1,742 | -113 |
| `math_atan2_ratios` | 420,244 | 375,736 | 10.6% | 1,834 / 1,721 | -113 |
| `math_cos` | 1,512,075 | 1,459,329 | 3.5% | 5,334 / 5,079 | -255 |
| `math_cos_small` | 431,242 | 383,478 | 11.1% | 5,334 / 5,079 | -255 |
| `math_exp` | 390,086 | 346,124 | 11.3% | 792 / 752 | -40 |
| `math_exp_scaled` | 354,886 | 316,356 | 10.9% | 765 / 725 | -40 |
| `math_log` | 397,609 | 344,961 | 13.2% | 708 / 618 | -90 |
| `math_log10` | 424,880 | 369,823 | 13.0% | 749 / 648 | -101 |
| `math_log10_near_one` | 298,734 | 257,825 | 13.7% | 722 / 621 | -101 |
| `math_log2` | 374,524 | 332,074 | 11.3% | 687 / 618 | -69 |
| `math_log2_near_one` | 250,806 | 218,164 | 13.0% | 660 / 591 | -69 |
| `math_log_near_one` | 270,862 | 233,022 | 14.0% | 681 / 591 | -90 |
| `math_pow` | 1,057,962 | 955,533 | 9.7% | 4,367 / 4,121 | -246 |
| `math_pow_bounded` | 808,415 | 751,474 | 7.0% | 4,346 / 4,100 | -246 |
| `math_pow_integer` | 918,318 | 871,687 | 5.1% | 4,346 / 4,100 | -246 |
| `math_sin` | 1,520,611 | 1,464,853 | 3.7% | 5,277 / 4,999 | -278 |
| `math_sin_small` | 427,756 | 376,624 | 12.0% | 5,277 / 4,999 | -278 |
| `math_tan` | 1,580,198 | 1,531,150 | 3.1% | 4,932 / 4,870 | -62 |
| `math_tan_reduced` | 427,542 | 390,942 | 8.6% | 4,932 / 4,870 | -62 |
| `math_tan_small` | 515,954 | 472,802 | 8.4% | 4,932 / 4,870 | -62 |

The unaffected sqrt, hypot, fmod and rounding workloads retain their cycle
counts. Polynomial components use compiler-managed fixed-`q2` inline assembly;
register coalescing supplies `q2` directly or inexpensive `mov32` copies.
The backend inline-assembly test checks a direct float input/return with no
spills or calls and complete guest stack metadata. No guest helper calls were
added. Argument reduction, compensated outer formulas, exceptional handling
and public APIs retain their existing structure. Coefficients were unchanged.

## Accuracy and regression checks

The host reference compiles the production source with a model of the native
extended significand and adder alignment/sticky rules. The real AVR handler is
checked against that model with 3,373 cases, including randomized coefficients,
wide exponents, cancellation, fractional subnormals, nonfinite inputs, count 1
and 255, signed zero, every C/Z/S combination, 16/24-bit PC carries, native
stack balance, architectural state and unchanged guest SRAM. Timer1 interrupts
an active pulse voice in 128 timer phases (195 observed ISR entries).

The expanded mathematical reference target performs **334,419,346 comparisons**
against host double libm rounded to float. Existing reference maxima are
unchanged; the newly expanded sin/cos coverage is reported separately:

| Function | Before max ULP | After max ULP |
|---|---:|---:|
| `sinf` | existing vectors only | 1 |
| `cosf` | existing vectors only | 1 |
| `atanf` | 1 | 1 |
| `atan2f` | 1 | 1 |
| `tanf` | 3 | 3 |
| `expf` | 1 | 1 |
| `logf` | 1 | 1 |
| `log2f` | 2 | 2 |
| `log10f` | 2 | 2 |
| `powf` | 4 | 4 |

The sin/cos reference coverage now includes 22,565,424 inputs each, including
dense reduced inputs and deterministic random bit patterns. Existing interpreter
math vectors also pass at every standard optimization level. Extended Horner
results intentionally differ from repeatedly rounded binary32 results. One
retained cancellation case returns `0x3918e8f1`, matching host double Horner
rounded to float; ordinary guest Horner returns `0x3918e900` (15 ULP away).

Validation:

- `avm_bench_run`: all 736 assembly/C/C++ fixtures at O0/O1/O2/O3/Os/Oz,
  instruction timings, C/C++ benchmarks, full SPI/audio/Timer0/Timer1/interrupt,
  stack and display regressions; Mini/FX/FX-C firmware checks.
- `avm_fpoly_tests_run`: the native instruction checks described above.
- All 342 LLVM AVM MC and CodeGen tests, including float-literal round trips,
  malformed/truncated encodings, reserved opcodes and fixed-register inline asm.
- Existing exhaustive sqrt, large-angle reduction and integral-rounding
  reference targets also pass.

Benchmark sources, numerical inputs and disassemblies accompany the
implementation. Raw comparison data is in
[`fpoly-validation.json`](fpoly-validation.json); benchmark disassemblies and
cycle totals remain under `bench/`. Local build evidence and preserved original
artifacts are under `build/fpoly/`.

The implementation follows the installed avr-libm `__fp_powser` loop structure.
The [avr-libc multiply source](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/mulsf3x.S)
shows that its ordinary extended-result entry multiplies 24-bit input
significands. The additional low-byte partial products retain the accumulator
extension between Horner steps. Only the final `__fp_round` rounds to binary32.
