# Moving float math into the AVM runtime

The current accuracy policy and phase 1–2 optimization results are in the
[generated math report](math-runtime/report.md). The measurements below describe
the earlier implementation and its former four-ULP acceptance policy.

Measured on 2026-10-25, starting from repository revision
`26b00ca37bbffcd2cae134b4544d0974c9ce6808`.

The implementation saves **2,428 bytes of interpreter flash (8.27%)**. The
optimized runtime is substantially faster than the initial C port, but the
12 measured math functions still take **2.73â€“8.27 times** the cycles of their
former native implementations. This is a useful flash-space tradeoff when
math calls are infrequent; math-heavy programs pay a significant execution cost.

## Implementation

The interpreter retains float add, subtract, multiply, divide, comparisons,
integer conversions, classification, and sign/absolute-value operations.
Square root, rounding, min/max, remainder, and transcendental functions execute
as guest code linked from `libavm.a`. Ordinary calls, function pointers, generic
LLVM math intrinsics, and compatibility `__avm_*f` builtins use the C ABI.

The former `FF 40â€“5F`, `FF 68â€“7B`, and math `SYS 04â€“0E` encodings now trap.
**Existing programs using those encodings must be rebuilt with this compiler
and runtime.** This change does not preserve binary compatibility with them.

The float-only kernels derive from Newlib/fdlibm; source revision and license
notices are recorded in [the kernel directory](../runtime/lib/math/README.md).
The runtime uses binary32 arithmetic with the interpreter's fixed rounding mode
and does not maintain errno or floating-point exception state.

Performance changes deliberately spend guest code space:

- Polynomial kernels inline into their callers. Coefficients and range-reduction
  digits become `ldi` immediates; none of the 12 linked sample programs has an
  allocated `.rodata` section for coefficient tables.
- The large-angle trig reducer uses a fully unrolled 24-by-256-bit integer
  product. Its caller tail-calls it to release the caller's stack frame.
- Internal exponent and quadrant counters use native 16-bit integers where safe.
  Float/integer bitcasts coalesce through the backend's register-class copy.
- Square root uses three explicit Newton steps followed by an exact midpoint
  correction using a split product. It retains bit-exact target results.
- Remainder uses an exact subtraction shortcut when normal operands satisfy
  `abs(y) < abs(x) < 2*abs(y)`.
- Arithmetic whose only purpose was raising unsupported exception flags was
  removed. Math sources compile with `-O3 -ffp-contract=off -fwrapv
  -fno-jump-tables`, including when callers use another optimization level.

## Interpreter flash

| Measurement | Before | After | Change |
| --- | ---: | ---: | ---: |
| Interpreter `.text` | 29,364 B | 26,936 B | âˆ’2,428 B |
| Space below the 29,696 B application limit | 332 B | 2,760 B | +2,428 B |

All 54 measured native FADD/FSUB/FMUL/FDIV variants retain exactly their previous
cycle counts. Guest math code resides in external program memory and does not
consume the interpreter flash saved above.

## Runtime performance

The historical comparison below uses the original small-argument inputs. The
current `math_sin`, `math_cos`, and `math_tan` benchmarks instead cover both signs
from 0.25 through the largest finite binary32 value, with 16 of 32 calls entering
large-angle reduction. Their current cycle counts in `bench/cycles_c.txt` measure
this broader workload and cannot be compared directly with these historical rows.

Each row measures 32 calls, including loop overhead, argument preparation,
result accumulation, and calls. Inputs are `0.25 + i*0.03125`, for `i=0..31`.
Binary functions use a second operand of 0.75, except pow, which uses 1.25.
The runner subtracts the 35-cycle adjacent-debug-break baseline. These are
representative small-argument workloads, not worst-case timings; large trig
arguments take the more expensive range-reduction path.

The native baseline uses the saved pre-change compiler, runtime, interpreter,
and the same benchmark sources. The first runtime column records the initial
working port before performance tuning. Final callers compile at `-O2` and
runtime math at `-O3`. All builds use the RelWithDebInfo CMake configuration.

| Function | Native cycles | First runtime | Optimized runtime | Runtime cycles saved | Optimized/native |
| --- | ---: | ---: | ---: | ---: | ---: |
| atan2f | 138,551 | 677,741 | 674,401 | 0.5% | 4.87Ã— |
| cosf | 104,266 | 419,908 | 363,996 | 13.3% | 3.49Ã— |
| expf | 132,110 | 406,704 | 390,086 | 4.1% | 2.95Ã— |
| fmodf | 53,936 | 236,238 | 147,071 | 37.7% | 2.73Ã— |
| hypotf | 77,794 | 1,131,335 | 643,250 | 43.1% | 8.27Ã— |
| logf | 121,824 | 505,091 | 461,247 | 8.7% | 3.79Ã— |
| log10f | 121,877 | 646,943 | 523,028 | 19.2% | 4.29Ã— |
| log2f | 117,574 | 591,800 | 497,999 | 15.9% | 4.24Ã— |
| powf | 195,205 | 1,604,699 | 1,494,206 | 6.9% | 7.65Ã— |
| sinf | 101,229 | 391,747 | 341,025 | 12.9% | 3.37Ã— |
| sqrtf | 65,514 | 868,472 | 430,649 | 50.4% | 6.57Ã— |
| tanf | 114,199 | 659,218 | 583,863 | 11.4% | 5.11Ã— |

The remaining slowdown includes interpreted integer/float work, register
spills, and range-reduction algorithms as well as call overhead. The former
native AVR routines and the new kernels use different algorithms and need
not produce identical last bits for approximate functions.

## Guest program size

These sizes sum allocated ELF PROGBITS sections, excluding headers, BSS, and
packaging padding. They include the benchmark/startup as well as the selected
math function and its dependencies. They are not standalone function sizes;
programs using several functions can share helpers.

| Sample | Native program | Optimized runtime program | Increase |
| --- | ---: | ---: | ---: |
| atan2 | 303 B | 2,118 B | 1,815 B |
| cos | 299 B | 4,189 B | 3,890 B |
| exp | 299 B | 800 B | 501 B |
| fmod | 303 B | 1,092 B | 789 B |
| hypot | 303 B | 1,033 B | 730 B |
| log | 299 B | 1,005 B | 706 B |
| log10 | 299 B | 1,142 B | 843 B |
| log2 | 299 B | 1,789 B | 1,490 B |
| pow | 303 B | 3,266 B | 2,963 B |
| sin | 299 B | 4,132 B | 3,833 B |
| sqrt | 294 B | 623 B | 329 B |
| tan | 299 B | 3,983 B | 3,684 B |

Packaged development images grow from 5,120 B to 5,376â€“8,960 B. This includes
format/page padding, so the ELF table is the more useful code-size comparison.
Functions link on demand with `--gc-sections`.

## Correctness and regression checks

- All **699** assembly/C/C++ end-to-end tests pass. C/C++ fixtures run at O0,
  O1, O2, O3, Os, and Oz.
- Math fixtures contain **2,702 numeric vectors**, giving 16,212 checks across
  those levels, plus 72 compatibility-builtin comparisons. Existing numeric
  cases were migrated from retired instruction fixtures. Added cases cover
  subnormals, signed zeros, NaNs/infinities, rounding boundaries, random finite
  patterns, and large trig inputs across every large binary32 exponent.
- Sqrt, remainder, rounding, and min/max cases use exact bits; NaNs check class.
  New approximate-function references use a four-ULP tolerance. Some migrated
  native transcendental cases retain their original wider tolerance; per-case
  limits are explicit. This is regression coverage, not an exhaustive error
  bound for every transcendental input.
- The migrated `atan2f(-0, -0)` case now expects the standard result `-pi`;
  the former native fixture expected positive zero.
- A host build of the production sqrt source matches double sqrt rounded to
  float for all **16,777,216** normalized mantissa/parity patterns, finite cases
  from one million random patterns, and **645,278** subnormal samples. Target
  fixtures separately exercise the kernel through the actual interpreter.
- All **125** LLVM AVM code-generation tests pass, including runtime calls,
  compatibility intrinsics, bitcasts, and updated cost estimates.
- Native checks pass for all **63** retired math encodings, **1,133** stack-bound
  cases, **152** PUSH/POP cases, Timer0 hardware presets, display preservation,
  and audio. Audio checks include interrupted guest math and large C/C++ assets.
- The O0 audio fixture's complete static guest-stack bound is **229/256 B**,
  including the large-angle trig path. The range reducer does not require
  relaxing the VM's stack limit.
- Final benchmarks ran **857** instruction, **102** C, and **8** C++ measurements.
  Cycle tables and generated benchmark disassemblies are retained under `bench/`.

Reproduce with the configured compiler environment initialized:

```sh
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_bench avm_runtime llc opt --parallel
python build/llvm-build/bin/llvm-lit.py -v deps/llvm-project/llvm/test/CodeGen/AVM
build/avm_bench
```

Saved native baseline products, initial runtime timings, section measurements,
and validation logs remain locally under the ignored `build/math-runtime-study/`
directory. The current fixtures, benchmark sources, disassemblies, and cycle
tables are part of the working-tree changes.
