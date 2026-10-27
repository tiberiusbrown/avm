# AVM single-precision math

Float kernels adapted from Newlib/fdlibm revision
`1b7c72fdcc4bde7520407d2d3364146f04fb8312`:
https://github.com/mirror/newlib-cygwin/tree/1b7c72fdcc4bde7520407d2d3364146f04fb8312/newlib/libm

Original license notices remain with the kernels, including those moved into
private headers. The runtime has no errno/fenv state and uses fixed
round-to-nearest, ties-to-even arithmetic.

The polynomial kernels use native `fpoly` through the private `fpoly.h`
inline-assembly macros. Highest-degree-first binary32 coefficients embed in the
instruction stream; the compiler manages the fixed `q2` operand without a guest
helper call. The interpreter retains its eight-bit significand extension across
Horner steps and rounds to binary32 only at the end. The host reference build
models this extended precision. Exceptional handling and public APIs preserve their semantics. See the
[function-specific accuracy policy](../../../docs/math-runtime/README.md).
Polynomial helpers inline into their callers. Internal exponents and quadrants
use native 16-bit words where safe; quotient estimation uses exact-width uint32_t.
The legacy `__ieee754_rem_pio2f` guest reduction uses one rounded 4/pi multiply, unsigned truncation, integer
add/shift, and a split pi/2 reconstruction. The high product is exact through
2^17 radians. Small cancellations use a three-part split; other cancellations
and large angles use an exponent-indexed 2/pi window. The main window retains
32 fractional bits and extends to 48 near cancellation; 24 coefficient guard
bits bound omitted-product error. All integer products use native 8-by-8
instructions, with bounded 16-bit column sums. There is no full-width product,
compensation tail, or general 64-bit guest multiplication. The generator uses
120-digit arithmetic and the full host arithmetic test covers every normalized
mantissa. Math builds at -O3 without jump tables or floating-point contraction.

Square root is a thin FSQRT wrapper on AVM. The native avr-libc restoring
algorithm replaces the 8,192-byte guest lookup table and needs no guest
coefficient reads or floating arithmetic. Host reference builds use an exact
integer restoring reference; the original independent test remains available.
Signed zero, subnormals, perfect squares, infinities, and NaNs retain tests.

Exponential uses centered base-two reduction, a degree-four Remez polynomial
for 2^r through FPOLY, and exponent packing with a staged subnormal multiply.
It performs no division. Tiny arguments retain 1+x. The generator and measured
alternatives are described in the [generated phase 1–2 report](../../../docs/math-runtime/report.md).

`hypotf` takes the square root of the sum of squares without sorting or scaling
for ordinary inputs. Extreme inputs retain scaling and a magnitude-gap shortcut.
A cold exact squared-norm comparison preserves the finite/infinite rounding
boundary despite the approximate square root. Only that boundary uses 64-bit
guest integer helpers.

Sine and cosine retain separate degree-five odd and degree-six even Remez
polynomials evaluated by native FPOLY. The avr-libc
[`sin.S`](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/sin.S) /
[`__fp_sinus`](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/fp_sinus.S)
shared odd-polynomial approach was evaluated with the same native reduction.
Separate polynomials were faster on the mixed sine/cosine workloads and paired
sincos workload, so their coefficients are retained. avr-libc is the precision
baseline, not a required implementation: AVM math.h functions are never
required to exceed its precision.

`sinf`, `cosf`, `tanf`, and `sincosf` each unconditionally call FREMPIO2 once,
then evaluate the reduced polynomial and apply the quadrant. There are no
magnitude checks to select reduction algorithms and no guest fallback, including
at tangent poles. `sincosf` shares one reduction and one squared argument. Native FMA
reconstructs tangent as x+x^3*P2(x^2); it was faster than separate FMUL/FADD
in the measured tangent workloads. The independent legacy guest reducer's
medium reconstruction also uses FMA for its low split product/subtraction.
No native precision or interpreter flash was added. Signed-zero and nonfinite
behavior is preserved. Large-angle and tangent-pole accuracy follows avr-libc's
flt40_t pi/2 constant rather than requiring higher-precision argument reduction.
The kernels always evaluate their polynomials, including for tiny and zero
inputs. Sine's fitted linear coefficient is slightly below one, so tiny inputs
can differ from x within the existing accuracy budget. No tiny-input or
zero-input shortcut adds a branch to these kernels.

`check_trig_accelerators.cmake` verifies that each public trig function emits
exactly one FREMPIO2 before any branch or call, has no guest-reducer reference,
and inlines tangent's FMA. Permanent fixtures cover quadrant boundaries,
pole neighbors, signed zeros, nonfinite inputs, and the full exponent range.

O2 caller cycles for the unconditional paths, compared with the previous
magnitude-dispatched native/guest paths (32 iterations per workload):

| Workload | Previous | Unconditional |
|---|---:|---:|
| Mixed sine | 355,734 | 115,627 |
| Mixed cosine | 360,712 | 118,562 |
| Mixed tangent | 386,302 | 132,625 |
| Small-angle sine | 129,865 | 101,311 |
| Small-angle cosine | 133,421 | 104,327 |
| Small-angle tangent | 158,113 | 117,079 |
| Paired sincos | 199,922 | 175,299 |

`atanf` retains its reciprocal above one and shared four-interval kernel on
[0,1]. `atan2f` divides the smaller magnitude by the larger and uses that
kernel. `tests/math/phase34_coefficients.py` reproduces the selected fits.

The three logarithms classify and normalize once, then inline one division-free
base-two mantissa engine: f*P6(f), where f is the normalized mantissa minus one.
Factoring f preserves log(1), signs and small logarithms. log2 adds the exponent;
log and log10 each use one conversion multiply. One degree-seven polynomial
was faster than two degree-five pieces and than the retained near-one hybrid.
A stable natural-log mantissa wrapper is also available to internal callers.
`powf` replaces the fdlibm general engine with direct 2^(y*log2(x)). It reuses
the phase-two exponential polynomial and logarithm normalization/mantissa core.
Large exponents use a degree-eight logarithm fit to bound amplified errors.
Near one, a short log1p series forms y*(x-1) first. Integer powers through
magnitude 16 use squaring, inverting first for negative powers; bit-level parity
uses native words. A cold two-component atanh-series refinement distinguishes
overflow and zero-underflow neighbors that a single float product cannot resolve.
There are no retained high-precision general implementations or precision modes.

`fmodf` is a thin FMOD wrapper; its native normalized shift/subtract remainder
is exact for valid finite operands across the binary32 exponent range.
`floorf`, `ceilf`, `roundf`, and `truncf` use four entries into one native
bit-level rounding engine. Finite results are exact; `roundf` ties go away
from zero and signed zeros are preserved. Non-AVM reference builds retain
portable bit algorithms and exact comparisons.

`fmaf` uses FMA with fixed q2/q3/q0 inputs and q2 output, preserving q0/q3.
It follows the compact
[avr-libc version](https://github.com/vancegroup-mirrors/avr-libc/blob/master/avr-libc/libm/fplib/fma.S):
extended multiply, extended add, one final binary32 rounding. The selected
flt40_t precision retains a 32-bit significand. It improves many product
residuals but does not guarantee correct rounding after severe cancellation
or intermediate overflow/underflow. Exponent gaps above 32 discard the smaller
operand, even at a rounding midpoint. Tests explicitly distinguish this
contract from both a full-precision FMA and separate binary32 multiply/add.
The host model reproduces those limits. No unrelated expressions are forcibly
contracted. LLVM directly selects sqrt, rounding, remainder, and FMA operations.

FREMPIO2 supplies both remainder and quadrant through an SSA pair. Its native
flt40_t pi/2 constant contributes less than 4.924e-9 absolute error through
128 radians before final rounding; argument error grows with the quotient.
Every binary32 argument in [pi/4,128] is checked for quadrant, zero side, and
error bounds. Trig uses this same reducer throughout the binary32 range.
Independent tests use exact division by avr-libc's constant and host libm or
100-digit mpmath on the remainder. Polynomial tolerances are unchanged.
`generate_trig_regressions.py` refreshes existing trig fixtures against this
reference. Sine/cosine retain their separate native FPOLY coefficients.

`avm_shortcuts_tests_run` compares the production kernels with independent host
double libm using the function-specific policy (exact for fmod). It exhausts
reduced logarithm mantissas, dense atan/tan ranges, and mantissas for bounded
integer and fractional powers, plus random inputs, scaling boundaries,
subnormals and exceptional values. Dense exponential sweeps cover both signs
and the entire scaling range. All failures, maximum absolute/relative/ULP
errors, worst inputs and ULP distributions are reported.

`avm_math_accuracy_tests_run` uses mpmath at 100 decimal digits against the same
production reference objects. Its deterministic corpus and adaptive searches
export worst inputs to interpreter fixtures at all six optimization levels.
[Committed generated accuracy results](../../../docs/math-runtime/accuracy.md)
include the JSON inputs and regeneration commands. Exact remainder, rounding,
classification and sign checks remain unchanged. The window reducer's dense
32/48-bit arithmetic and independent reconstruction checks replace the former
280-bit product acceptance test. Quick/full workflows are documented in the
[fast trig report](../../../docs/math-runtime/trig-fast/report.md).

See [earlier measurements](../../../docs/math-runtime-tradeoff.md) for historical
results, the [phase 1–2 study](../../../docs/math-runtime/report.md), and
[phase 3–4 measurements and validation](../../../docs/math-runtime/phase34/report.md).

The linked native package adds 704 interpreter bytes (26,632 to 27,336),
including 32 bytes of FF table growth; existing FPOLY brings its package total
to 906 bytes. The removed 8,192-byte sqrt table is a separate guest-program
saving. Algorithms, preservation rules, measured per-component sizes, timing,
and validation are recorded in the [interpreter guide](../../../docs/isa_interpreter_implementation.md#compact-native-math-package-ff-17-1e).

## C99 additions

The public header now declares `exp2f`, `expm1f`, `log1pf`, `cbrtf`, `asinf`,
`acosf`, `ldexpf`, `frexpf`, `modff`, and `nextafterf`. These are guest library
functions using the existing ISA. No interpreter accelerators, wider native
arithmetic, errno, or floating-point environment state were added.

| Function | Selected algorithm |
| --- | --- |
| `exp2f` | Direct centered base-two reduction, a degree-four relative Remez FPOLY fit constrained to P(0)=1, and shared exponent packing. All integer powers follow the same polynomial path and remain exact, including subnormals and exp2(±0). Native-word range checks precede integer conversion. |
| `expm1f` | `x+x*x*P4(x)` (degree-six Taylor) for `abs(x)<=1/2`; tiny inputs return x; other inputs call the existing exponential and subtract one. |
| `log1pf` | `x+x*x*P3(x)` (degree-five alternating series) for `abs(x)<=1/16`; tiny inputs return x. Other inputs inline the existing logarithm normalization and degree-seven mantissa engine on `1+x`. |
| `cbrtf` | Normalize the significand to [1,2), divide the exponent by three, evaluate a centered degree-seven FPOLY fit on [-1/2,1/2], apply cube-root-of-two/four for the exponent remainder, and pack the result exponent/sign. Subnormals normalize with one exact multiply. No floating division or Newton refinement. |
| `asinf` | Odd degree-nine approximation `x+x^3*P3(x*x)` on [0,1/2]. Above 1/2, use `pi/2-2*asin(sqrt((1-abs(x))/2))`. FSQRT only runs on the endpoint path. |
| `acosf` | `pi/2-asin(x)` on [-1/2,1/2]; endpoint paths compute `2*asin(sqrt((1-abs(x))/2))`, subtracting from pi for negative x. Shares the small asin polynomial and inline FSQRT wrapper. |

The scale helper remains shared with `powf`; its existing fit and the `expf`
fit are unchanged. `tests/math/c99_coefficients.py` reproduces the new Remez fits
using the existing coefficient generator. All coefficients and guest arithmetic
are binary32; FPOLY uses the already established avr-libc extended accumulator.

The anchored exp2 fit minimizes relative error on [-1/2,1/2] with four free
coefficients and constant exactly one. Equivalently, a cubic approximates
`(2^r-1)/r` with weight `abs(r)/2^r`; constrained Remez exchange uses five active
extrema. Its real-coefficient relative error is 2.81976254e-6. The generated
binary32 coefficients retain the same FPOLY count as the original fit. No
integer detection, extra refinement, or additional native precision is needed.
The old polynomial constant was `1+2^-23`; its integer bypass removed one ULP
of error on normal powers and did not change already-exact subnormal powers.
Anchoring the fit removes the need for that bypass while preserving exactness.

Zeros retain their required signs. NaNs propagate, out-of-domain inverse trig
returns NaN, `log1pf(-1)` returns negative infinity, and `log1pf(x)` below -1
returns NaN. Cube root preserves signed infinities, and `expm1f(-INFINITY)`
returns -1. Exponential overflow returns positive infinity; gradual underflow
uses the existing round-to-nearest, ties-to-even arithmetic.

`ldexpf` is a thin `scalbnf` wrapper. The shared scaling cutoff was corrected:
biased exponent -23 can still round up to the smallest subnormal, so it reaches
the final multiply rather than an early zero return. Permanent tests include
`ldexpf(0x1.fffffcp-127f,-23)`, both sides of the half-quantum boundary, ties
to an even subnormal significand, both signs, and extreme integer exponents.
`frexpf` extracts exponent/significand bits and normalizes subnormal significands
with bounded integer shifts; it stores exponent zero for zero and nonfinite
inputs. `modff` masks fractional significand bits, then uses exact Sterbenz
subtraction; integral inputs and infinities return a zero with the input sign.
`nextafterf` steps the unsigned representation, with explicit zero/equality/NaN
handling. These representation operations are exact, without float-to-int
conversions, signed overflow, or aliasing casts.

### Classification and comparison

The header defines `FP_NAN`, `FP_INFINITE`, `FP_ZERO`, `FP_SUBNORMAL`, and
`FP_NORMAL`, plus `fpclassify`, `isfinite`, `isinf`, `isnan`, `isnormal`, and
`signbit`. The six comparisons are `isgreater`, `isgreaterequal`, `isless`,
`islessequal`, `islessgreater`, and `isunordered`. Compiler builtins retain
FCLASS/FCMP optimization and evaluate each argument once. An unevaluated type
expression supports integer arguments while retaining double/long-double types
on hosts with wider floating types. Classification performs no floating-point
arithmetic. Signaling NaNs are recognized, with no exception-state requirement.
C and C++ tests cover signed zero, both NaN forms, mixed arithmetic types,
side effects for every macro, and wider host types.

### Accuracy policy and reproduction

The [shared policy](../../../tests/math/accuracy_policy.h) remains the acceptance
rule; high-precision references characterize error rather than require correct
rounding. `exp2f` shares the existing exponential relative budget of 1e-5,
including its subnormal allowance. `log1pf` shares the logarithm hybrid budget
of 1e-6 absolute plus 1e-6 relative. Inverse trig shares the established 1e-6
absolute atan budget. `expm1f` allows 3e-5 relative because subtracting one on
the general exponential path amplifies the existing exponential budget near
the crossover; its Taylor path retains useful relative accuracy near zero.
Cube root allows 3e-7 relative for fit/coefficient/reconstruction rounding.
All signs, zeros, exceptional results, and exact representation operations
are checked independently of approximation budgets.

The primary baseline is [avr-libc's published single-precision libm
accuracy](https://avrdudes.github.io/avr-libc/avr-libc-user-manual/benchmarks.html):
its reported relative errors are approximately 3.4e-7 for asin, 2.2e-7 for acos,
and 1.2e-7 for cbrt over its stated benchmark domains. Those measurements are
lower bounds, not universal error guarantees. `exp2f` follows the existing
avr-libc-comparable exp policy; for `expm1f`/`log1pf`, which are absent from
the installed AVR float library, the lightweight baseline is the documented
single-precision series plus the existing exp/log policies. This validation
compares errors against that baseline's policy; it does not run avr-libc on
every input or demand desktop-libm precision.

`avm_c99_tests_run` checks production host-model objects against independent
host libm: exact decompositions, next-float transitions, scaling, every exponent
class, special values, and deterministic random/dense samples. The high-precision
probe uses the same objects and the existing native polynomial model. Its new
corpora cover cancellation regions, all exp2 integer/scaling boundaries, cube
neighbors, and dense inverse-trig endpoint neighbors. Worst inputs become
ordinary interpreter fixtures through `--fixtures`.

From a matching configured compiler environment, use RelWithDebInfo throughout:

```sh
cmake --build build --config RelWithDebInfo --target avm_math_accuracy_probe avm_c99_tests_run --parallel
python tests/math/accuracy_reference.py --functions exp2f expm1f log1pf cbrtf asinf acosf --samples 10000 --rounds 2 --fixtures --output build/tests/c99-accuracy.json
cmake --build build --config RelWithDebInfo --target avm_validation_full avm_bench_run avm_runtime_asm --parallel
```

`avm_math_fast`, `avm_math_full`, and the default accuracy target include the
new cases. Functional fixtures are built at O0, O1, O2, O3, Os, and Oz. The
benchmarks and their disassemblies follow the existing automatic discovery;
representative C99 workloads also join the instruction-mix manifest.

### Measured C99 results (2026-10-27)

All six new approximations pass their policies in both corpora; the complete
21-function high-precision run also reports zero failures. These maxima are
sampled measurements, not exhaustive error bounds. Large absolute errors for
exp/cube-root reflect the full binary32 output range; relative error is the
applicable policy there.

Measured maxima across the 100-digit deterministic/adaptive corpora and
the independent dense host sweep (540,624 inputs per function). Relative
error excludes subnormal results; absolute error includes the full finite range.

| Function | Max absolute | Max relative | Max ULP | Worst abs / relative / ULP input bits |
| --- | ---: | ---: | ---: | --- |
| `exp2f` | 6.90825e+32 | 2.87549e-06 | 43 | `42ff0001` / `41080002` / `3f5481fe` |
| `expm1f` | 1.32263e+33 | 7.25033e-06 | 92 | `42b0f552` / `42a9f5c4` / `42a9f5c4` |
| `log1pf` | 6.79034e-06 | 1.66038e-06 | 28 | `75a165cf` / `3df7bde8` / `3e07f734` |
| `cbrtf` | 783063 | 1.65031e-07 | 2 | `7f271174` / `ab841f6d` / `00000081` |
| `asinf` | 4.11096e-07 | 7.84661e-07 | 7 | `bf001200` / `bf001200` / `3f000011` |
| `acosf` | 5.63349e-07 | 3.50933e-07 | 5 | `bf002480` / `3f001200` / `3f0c02cf` |

O2 callers, O3 runtime kernels, 32 calls per benchmark. Cycles include the
input lookup, loop, and volatile sink; the 35-cycle DEBUG_BREAK baseline
is subtracted. Code bytes are unrelaxed function sections, excluding shared
callees. Stack is the measured guest maximum including the benchmark caller.

| Function | Cycles / 32 calls | Function bytes | Guest stack bytes |
| --- | ---: | ---: | ---: |
| `exp2f` | 166,616 | 180 | 26 |
| `expm1f` | 182,758 | 102 | 37 |
| `log1pf` | 166,496 | 313 | 28 |
| `cbrtf` | 220,280 | 244 | 34 |
| `asinf` | 149,240 | 200 | 28 |
| `acosf` | 168,774 | 217 | 28 |
| `ldexpf` | 149,904 | 4 | 28 |
| `frexpf` | 98,916 | 285 | 36 |
| `modff` | 106,401 | 211 | 44 |
| `nextafterf` | 122,549 | 168 | 32 |
| Classification/comparisons workload | 135,799 | inline | 25 |

The small asin/endpoint implementation measured 149,240 cycles versus 272,362
for the stable atan2/sqrt identity on identical inputs; acos measured 168,774
versus 274,036. The centered cube-root polynomial measured 220,280 versus
225,362 for a cubic seed plus one Newton step. A quarter-unit expm1 crossover
with degree-five Taylor measured 194,432 cycles versus 182,758 for the selected
half-unit, degree-six path. These choices use measured guest cycles, including
fixed-register moves and spills.

Exp2's constrained polynomial removes the integer-input conversion/comparison
and leaves one range-reduction conversion, one FPOLY5, and shared scaling for
all ordinary inputs. The measured relative maximum fell from 3.71398e-6 to
2.87549e-6 (43 ULP maximum), leaving about 3.48 times the policy margin.
Compared with the guarded version using native-word range checks, code shrank
from 239 to 180 bytes. The existing mixed benchmark includes exact integer
inputs and changed from 165,210 to 166,616 cycles; the uniform path prioritizes
the common noninteger case and removes the extra conversion work there.
The earlier 32-bit boundary comparisons measured 171,514 cycles, versus
167,344 with FCMP. Both boundary encodings have zero low words, so the final
implementation uses 16-bit signed/unsigned high-word comparisons, reducing
the cost and removing the range-check FCMP operations.

Bounded 16/8/4/2/1-bit normalization reduced frexp from 154,100 to 98,916 cycles,
at a code-size cost of 133 to 285 bytes. Building modf's mask from 16-bit words
removed both 32-bit shift-helper calls: 117,503 to 106,401 cycles, with function
size increasing from 180 to 211 bytes. The new functions have no 64-bit guest
helpers. Only expm1 calls expf and ldexp tail-calls the shared scaler; the other
new approximations inline their kernels. Native stack scratch is separate from
the guest-stack column and measured at 6–15 additional bytes on these workloads.

The full validation passed 964 interpreter tests across all six optimization
levels, the existing exhaustive/reference suites, all 21 high-precision math
policies, 876 instruction intervals, 289 C workloads, and 8 C++ workloads.
Other existing benchmark cycle rows and disassemblies are unchanged, apart from
the intentional scalbn underflow cutoff and pow's shared exponential range
guards. The six pow workloads improved by 0.06–1.50 percent from the native-word
integer guards, with their polynomial and accuracy policy unchanged.
The instruction-mix report includes the new workloads and reconciles with
cycle timings. `tests/math/report_c99.py` regenerates the tables from build
reports, final benchmark output, stack traces, and object symbols.
