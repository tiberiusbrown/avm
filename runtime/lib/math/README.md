# AVM single-precision math

The exact utility functions include `nextafterf`, `fdimf`, `remainderf`,
`remquof`, `nearbyintf`, `rintf`, `lrintf`, `lroundf`, `llrintf`, `llroundf`,
`nanf`, `ilogbf`, `logbf`, `fmaxmagf`, and `fminmagf`. `nextafterf` reuses the
existing bit-step implementation and its adjacency tests.

* Remainder uses one native FMOD reduction modulo `2*abs(y)`; remquo reduces
  modulo `8*abs(y)` and retains the signed low three quotient bits. Exact
  scaled subtraction and a comparison with `abs(y)-r` implement nearest/even
  quotient selection without division or a wide quotient. The complement
  comparison handles odd subnormal divisors without rounding `y/2` to zero.
  If the scaled divisor overflows, FMOD's infinite-divisor behavior returns
  the finite input unchanged. Invalid inputs return NaN, infinite divisors
  return the dividend, and remquo initializes the quotient to zero in both
  cases. Exact-zero remainders preserve the dividend's sign.
* Rint and nearbyint use separate binary32 add/subtract operations with 2^23
  to round to nearest/even, restoring the sign of zero. Larger finite inputs
  are already integers. AVM has fixed rounding and no exception flags, so
  nearbyint and rint have identical behavior. The long variants combine this
  rounding (or native FROUND for ties away from zero) with native signed
  32-bit conversion. As in [avr-libc](https://avrdudes.github.io/avr-libc/avr-libc-user-manual/group__avr__math.html),
  nonfinite and out-of-range values return `LONG_MIN`. Long-long variants
  return `LLONG_MIN` in those cases. Their required 64-bit results are packed
  as two 32-bit halves; they add no float-to-i64 or 64-bit arithmetic helper.
* Ilogb/logb extract normal exponents directly and count subnormal leading
  zeros in native words. `FP_ILOGB0` and `FP_ILOGBNAN` are `INT_MIN`; ilogb
  returns `INT_MAX` for infinity. Logb returns negative infinity for zero,
  positive infinity for either infinity, and quiets NaNs.
* Magnitude extrema compare absolute IEEE words. Equal magnitudes choose
  the ordinary numeric maximum/minimum, including +0/-0 respectively. One
  quiet NaN yields the numeric operand; signaling NaNs propagate as quiet
  NaNs. Fdim propagates NaNs and otherwise returns `x-y` if `x>y`, +0 otherwise.
* Runtime nanf calls ignore the implementation-defined tag payload and
  return a canonical quiet NaN. Constant calls may be folded by the compiler.

[`misc_reference.c`](../../../tests/math/misc_reference.c) compares production
objects with independent host libm over random bits, exponent strata, all
small integer tie neighbors, extreme divisors, conversion endpoints and NaNs.
[`generate_misc_tests.py`](../../../tests/math/generate_misc_tests.py) uses
exact rational arithmetic for remainder/quotient fixtures, tested as C and C++
at all six optimization levels. Math errors use `errno`; floating-point exception state is not provided.

Measured ordinary-input workloads (32 calls, with benchmark setup outside the
timed interval; body bytes exclude shared helpers):

| Function | AVR cycles | Body bytes |
| --- | ---: | ---: |
| `fdimf` | 104,149 | 107 |
| `remainderf` | 194,553 | 232 |
| `remquof` | 257,037 | 344 |
| `nearbyintf` | 80,244 | 75 |
| `rintf` | 80,244 | 75 |
| `lrintf` | 104,076 | 108 |
| `lroundf` | 70,704 | 42 |
| `llrintf` | 123,079 | 288 |
| `llroundf` | 90,603 | 224 |
| `nanf` (indirect call) | 23,380 | 5 |
| `ilogbf` | 67,504 | 217 |
| `logbf` | 79,348 | 225 |
| `fmaxmagf` | 106,497 | 214 |
| `fminmagf` | 107,585 | 216 |

The exact native reference checks 737,295 unary inputs and 590,657 binary
pairs. Integer comparisons reduced the remquo workload from 287,453 to
257,037 cycles (10.6%); remainder's smaller parity-only path measured faster
with native floating comparisons, so it retains them. Inlining the common
nearbyint kernel avoids 4,032 cycles of tail-call overhead in the same workload.

The six hyperbolic functions use short binary32 paths, inspired by avr-libc's
[`sinh.S`](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/sinh.S),
[`cosh.S`](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/cosh.S), and
[`tanh.S`](https://github.com/avrdudes/avr-libc/blob/main/libm/fplib/tanh.S).
`sinhf`, `coshf`, and `tanhf` combine small polynomials with one exponential
and a reciprocal outside the polynomial interval. Large sinh/cosh arguments
use `exp(abs(x)-ln(2))` to retain the full finite output range; tanh saturates.
The last finite sinh/cosh input can round the reduced argument above expf's
threshold; its approximate result saturates to the largest finite float after
the original input has passed the overflow check.
`asinhf` combines an odd polynomial with log/sqrt. Near its endpoint,
`acoshf` uses `sqrt(2*d)*P4(d)` with `d=x-1`, avoiding cancellation and a log
call; above 2 it uses log/sqrt. `atanhf` combines an odd polynomial with one
log1p and division. Large inverse arguments use `log(x)+ln(2)`.

The polynomial constant terms are exactly one. The odd kernels preserve tiny
inputs and signed zeros without a separate dispatch; cosh(0)=1 and acosh(1)=0
also follow directly from their polynomial forms. Coefficients are reproduced by
[`hyperbolic_coefficients.py`](../../../tests/math/hyperbolic_coefficients.py),
and native FPOLY evaluates them with the existing extended significand.
The hyperbolic acceptance budget is 1e-5 relative error, with exceptional
values and zero signs checked separately. No floating-point exception state or correctly-rounded
guarantee is added. The native host sweeps, 100-digit adaptive reference, and
C/C++ fixtures cover cancellation, subnormals, domain endpoints, saturation,
and the adjacent finite/overflow sinh/cosh inputs.

Measured hyperbolic results (32 calls over the ordinary noninteger benchmark
inputs; body size excludes shared exp/log helpers):

| Function | AVR cycles | Body bytes | Maximum measured relative error |
| --- | ---: | ---: | ---: |
| `sinhf` | 189,040 | 200 | 6.273e-6 |
| `coshf` | 180,812 | 171 | 6.273e-6 |
| `tanhf` | 207,504 | 161 | 2.785e-6 |
| `asinhf` | 206,444 | 148 | 4.702e-6 |
| `acoshf` | 214,946 | 161 | 2.270e-6 |
| `atanhf` | 214,224 | 181 | 1.357e-6 |

Errors combine deterministic native host-libm sweeps (557,010–1,067,984
inputs per function) and 100-digit stratified/adaptive comparisons (over
57,000 inputs per function). Zero signs and exceptional results pass exact
classification checks. The acosh endpoint polynomial reduced the same
workload from 295,120 to 214,946 cycles (27.2%). Native 16-bit threshold
comparisons improved sinh/asinh/tanh; the full magnitude comparisons remain
in cosh/atanh because they measured faster after register allocation.

Float kernels adapted from Newlib/fdlibm revision
`1b7c72fdcc4bde7520407d2d3364146f04fb8312`:
https://github.com/mirror/newlib-cygwin/tree/1b7c72fdcc4bde7520407d2d3364146f04fb8312/newlib/libm

Original license notices remain with the kernels, including those moved into
private headers. The runtime reports math errors through `errno` and uses fixed
round-to-nearest, ties-to-even arithmetic.

The polynomial kernels use native `fpoly` through the private `fpoly.h`
inline-assembly macros. Highest-degree-first binary32 coefficients embed in the
instruction stream; the compiler manages the fixed `q2` operand without a guest
helper call. The interpreter retains its eight-bit significand extension across
Horner steps and rounds to binary32 only at the end. The host reference build
models this extended precision. Exceptional handling and public APIs preserve their semantics. See the
[function-specific accuracy policy](../../../tests/math/accuracy_policy.h).
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
It performs no division. The shared unity-anchored fit handles tiny and zero
arguments without a separate 1+x path. The generator and measured
alternatives are described in the [generated phase 1–2 report](../../../docs/math-runtime/report.md).

`hypotf` takes the square root of the sum of squares without sorting or scaling
for ordinary inputs. Extreme inputs retain scaling and a magnitude-gap shortcut.
A cold exact squared-norm comparison preserves the finite/infinite rounding
boundary despite sum-of-squares rounding. That boundary uses exact byte/word
arithmetic, with no 64-bit guest helpers. FSQRT is inlined through the shared
native helper on all paths.

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
Near one, a short log1p series forms y*(x-1) first. General positive bases
use the same log/exp path for integer and noninteger exponents; bit-level parity
classification is needed only for negative bases. The small-integer squaring
loop is removed. A cold two-component atanh-series refinement distinguishes
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
and validation are recorded in the [interpreter guide](../../../docs/isa_interpreter_implementation.md#compact-native-math-package-ff-16-1d).

## C99 additions

The public header now declares `exp2f`, `expm1f`, `log1pf`, `cbrtf`, `asinf`,
`acosf`, `ldexpf`, `frexpf`, `modff`, and `nextafterf`. These are guest library
functions using the existing ISA. No interpreter accelerators, wider native
arithmetic or floating-point environment state were added.

| Function | Selected algorithm |
| --- | --- |
| `exp2f` | Direct centered base-two reduction, a degree-four relative Remez FPOLY fit constrained to P(0)=1, and shared exponent packing. All integer powers follow the same polynomial path and remain exact, including subnormals and exp2(±0). Native-word range checks precede integer conversion. |
| `expm1f` | `x*P5(x)` for `abs(x)<=1`; relative Remez fits expm1(x)/x with P(0)=1. One FPOLY6 and one multiply also handle tiny values and signed zero. Other inputs reuse expf and subtract one. |
| `log1pf` | `x*P5(x)` for `abs(x)<=1/4`; relative Remez fits log1p(x)/x with P(0)=1. One FPOLY6 and one multiply preserve tiny values and signed zero. Other inputs inline the logarithm engine on `1+x`. |
| `cbrtf` | Normalize the significand to [1,2), divide the exponent by three, evaluate a centered degree-seven FPOLY fit on [-1/2,1/2], apply cube-root-of-two/four for the exponent remainder, and pack the result exponent/sign. Subnormals normalize with one exact multiply. No floating division or Newton refinement. |
| `asinf` | Odd degree-nine approximation `x+x^3*P3(x*x)` on [0,1/2]. Above 1/2, use `pi/2-2*asin(sqrt((1-abs(x))/2))`. FSQRT only runs on the endpoint path. |
| `acosf` | `pi/2-asin(x)` on [-1/2,1/2]; endpoint paths compute `2*asin(sqrt((1-abs(x))/2))`, subtracting from pi for negative x. Shares the small asin polynomial and inline FSQRT wrapper. |

The anchored exponential fit and scale helper are shared by `expf`, `exp2f`,
and `powf`. `tests/math/c99_coefficients.py` reproduces the selected Remez fits
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

`ldexpf` is a thin `scalbnf` wrapper. `scalblnf` bounds its `long` exponent
before narrowing to the scaler's native-word exponent. The scaler uses native-word exponents,
clamps extreme n before adding, and constructs signed overflow/zero results
from their bits. Only gradual underflow needs a final exact power-of-two
multiply. The shared scaling cutoff was corrected:
biased exponent -23 can still round up to the smallest subnormal, so it reaches
the final multiply rather than an early zero return. Permanent tests include
`ldexpf(0x1.fffffcp-127f,-23)`, both sides of the half-quantum boundary, ties
to an even subnormal significand, both signs, and extreme integer exponents.
`frexpf` extracts exponent/significand bits and normalizes subnormal significands
with bounded integer shifts; it stores exponent zero for zero and nonfinite
inputs. `modff` masks fractional significand bits, then uses exact Sterbenz
subtraction; integral inputs and infinities return a zero with the input sign.
`nextafterf` steps the unsigned representation, with explicit zero/equality/NaN
handling. `nexttowardf` compares its direction in `long double` before using
the same stepping and range-error handling; equal inputs return the direction's
signed zero. AVM's `long double` currently has the same binary32 format as `float`.
These representation operations are exact, without float-to-int
conversions, signed overflow, or aliasing casts.

### Classification and comparison

The header defines `FP_NAN`, `FP_INFINITE`, `FP_ZERO`, `FP_SUBNORMAL`, and
`FP_NORMAL`, plus `fpclassify`, `isfinite`, `isinf`, `isnan`, `isnormal`, and
`signbit`. The six comparisons are `isgreater`, `isgreaterequal`, `isless`,
`islessequal`, `islessgreater`, and `isunordered`. Compiler builtins lower
classification to native 16-bit integer tests and comparisons to FCMP, while
evaluating each argument once. An unevaluated type expression supports integer
arguments while retaining double/long-double types
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
absolute atan budget. `expm1f` retains its 3e-5 relative policy, including the
amplification from subtracting one on the general exponential path. The
unity-anchored ratio fit retains useful relative accuracy near zero.
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
| `expm1f` | 1.09953e+33 | 7.43936e-06 | 124 | `42b0f552` / `3f568b00` / `3eceffff` |
| `log1pf` | 6.79034e-06 | 1.5601e-06 | 26 | `75a165cf` / `bdf2e400` / `bdf09c00` |
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
| `expm1f` | 143,222 | 78 | 33 |
| `log1pf` | 156,650 | 291 | 28 |
| `cbrtf` | 220,280 | 244 | 34 |
| `asinf` | 159,880 | 194 | 28 |
| `acosf` | 168,774 | 217 | 28 |
| `ldexpf` | 109,867 | 4 | 24 |
| `frexpf` | 98,916 | 285 | 36 |
| `modff` | 106,401 | 211 | 44 |
| `nextafterf` | 122,549 | 168 | 32 |
| Classification/comparisons workload | 135,799 | inline | 25 |

Initial C99 comparisons, before the general-case audit below: the small
asin/endpoint implementation measured 149,240 cycles versus 272,362
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

The initial C99 validation passed 964 interpreter tests across all six optimization
levels, the existing exhaustive/reference suites, all 21 high-precision math
policies, 876 instruction intervals, 289 C workloads, and 8 C++ workloads.
At that point, other benchmark cycle rows and disassemblies were unchanged, apart from
the intentional scalbn underflow cutoff and pow's shared exponential range
guards. The six pow workloads improved by 0.06–1.50 percent from the native-word
integer guards, with their polynomial and accuracy policy unchanged.
The instruction-mix report includes the new workloads and reconciles with
cycle timings. `tests/math/report_c99.py` regenerates the tables from build
reports, final benchmark output, stack traces, and object symbols.

## General-case simplification audit

The Sun Microsystems notices identify the kernels' ancestry; they are retained
with adapted code. Production paths were reviewed by their actual AVM
instructions and measured error, rather than the original fdlibm file names.
Acceptance policies were not relaxed. The chosen changes are:

| Family | Result of review |
| --- | --- |
| exp/exp2 | Share the degree-four unity-anchored relative fit and exponent packing. exp no longer dispatches tiny arguments to a separate `1+x` approximation. |
| expm1/log1p | Fit their ratios to x with constant one, then evaluate `x*P5(x)`. This removes reconstruction multiply/adds and tiny-input dispatch, preserves signed zero, and expands the direct intervals to [-1,1] and [-1/4,1/4]. |
| atan/asin | The existing anchored/factored polynomials already handle tiny values; remove the redundant tiny-input return. Ordinary-input workloads measure this independently of the older tiny/special-heavy workloads. |
| pow | Remove positive-base integer classification and the small-integer squaring loop. General integer and noninteger powers share log/exp; parity is still checked for negative bases. Keep direct elementary identities and the cold boundary check required for correct exceptional results. |
| hypot | Inline existing FSQRT through a shared helper. Replace the cold 64-bit squared-norm comparison with native byte products and word carries. The comparison remains exact; an exponent-gap proof rejects impossible overflow without squaring. |
| scalbn/ldexp | Replace wide exponent arithmetic and arithmetic overflow/underflow construction with bounded native-word exponents and signed bit results. Preserve the single final ties-to-even rounding for subnormal outputs. |
| log/log2/log10 | Already use a division-free mantissa polynomial and factored zero at one. Construct exceptional negative results from bits instead of a runtime zero division. |
| trig/sqrt/fma/fmod/rounding | Already use compact native helpers or short polynomials; retain them. The portable rounding/remainder code and the legacy high-precision guest reducer remain independent reference/benchmark infrastructure, not the public trig path. |
| frexp/modf/nextafter/classification | Exact representation semantics remain required; no approximation is appropriate. |

The expm1/log1p fits have real-coefficient relative bounds of 7.3572023e-6 and
1.4628014e-6, respectively. Binary32/native evaluation is validated separately.
Each ratio fit uses one FPOLY6 and one multiply; the shared exponential stays
at FPOLY5. No refinement, double precision, or new ISA/native interpreter
acceleration is introduced.

Two alternatives were measured before selection. Shorter direct intervals
([−1/2,1/2] for expm1, [−1/8,1/8] for log1p) were slower on ordinary inputs
than the selected wider intervals. A two-piece atan fit reduced cycles but
exceeded the unchanged 1e-6 absolute error policy, so the four-piece fit remains.
Removing tiny-input dispatch improves ordinary atan/asin workloads; their
existing mixed benchmarks contain many tiny inputs and can become slower.
Likewise, pow's integer-only workload loses its shortcut, while general
noninteger workloads benefit.

The rare pow boundary refinement is retained to distinguish finite/infinite
and zero/subnormal neighbors. Its purpose is correct classification, not a
tighter ordinary approximation. Hypot needs the same guarantee, but its exact
comparison now uses six 8x8 products per significand, bounded byte-column sums,
and 16-bit shifts/carries, with no 64-bit guest helpers. The independent host
`avm_hypot_boundary_tests_run` compares 1,023,656 random and targeted crossing
cases against a uint64_t oracle; 64-bit integer arithmetic exists only in that test.
The scaler tests also include both signs at n=276/277 and -277/-278, and exact
subnormal rounding midpoints.

### Audit measurements

O2 benchmark callers, O3 runtime, RelWithDebInfo; identical inputs and 32 calls
per workload, including the existing loop/input/sink overhead. Ordinary-input
baselines use the original implementations with the newly added general-case
input distributions. The other baselines are the measurements captured before
this audit.

| Workload | Before cycles | Selected cycles | Reduction |
| --- | ---: | ---: | ---: |
| `math_exp` | 224,389 | 210,272 | 6.3% |
| `math_exp_primary` | 192,205 | 178,118 | 7.3% |
| `math_expm1_general` | 191,944 | 141,952 | 26.0% |
| `math_log1p_general` | 189,960 | 158,968 | 16.3% |
| `math_atan_general` | 156,306 | 147,218 | 5.8% |
| `math_asin_general` | 172,776 | 165,224 | 4.4% |
| `math_pow` | 564,682 | 492,491 | 12.8% |
| `math_pow_near_one` | 509,588 | 434,193 | 14.8% |
| `math_ldexp` | 149,904 | 109,867 | 26.7% |
| `math_hypot` | 157,051 | 148,923 | 5.2% |
| `math_hypot_scaled` | 173,631 | 166,519 | 4.1% |
| `math_hypot_boundary` | 2,411,451 | 710,755 | 70.5% |

The integer-only pow workload changed from 427,172 to 460,377 cycles (+7.8%);
the tiny-heavy asin mix changed from 149,240 to 159,880 (+7.1%). The selected
implementations prioritize ordinary inputs; the corresponding general-case
workloads improve as shown above. Hypot's ordinary path also benefits from
inlining FSQRT: it no longer calls the sqrtf wrapper or guest integer helpers.
The new scaler is 205 function bytes; expm1 is 78 bytes and log1p 291 bytes.

All 964 interpreter fixtures pass at O0/O1/O2/O3/Os/Oz, all 21 high-precision
policies pass, and the existing exhaustive/reference suites remain enabled.
The exact boundary oracle passes all 1,023,656 cases. Benchmarks, instruction
mix, disassemblies, coefficient generators, and worst-input fixtures are
refreshed; the ISA, interpreter, LLVM code generation, and public ABI are
unchanged. All edits are left uncommitted.

## Math error reporting

`math_errhandling` is `MATH_ERRNO`. Domain errors set `EDOM`; poles and
finite-input overflow set `ERANGE`. Successful calls preserve the previous
`errno`, including NaN propagation and valid infinite inputs. Integer rounding
conversions report `EDOM` for nonfinite or out-of-range results; the exact
negative integer endpoint is valid. `ilogbf` reports `EDOM` for zero, infinity,
and NaN.

Underflow reporting is implementation-defined: `expf`, `exp2f`, `expm1f`, `sinhf`,
`erff`, `erfcf`, `powf`, and scaling operations report `ERANGE` for subnormal results (including
rounded zero from a nonzero mathematical result). `nextafterf` reports
`ERANGE` when a step produces infinity, a subnormal, or zero. Other tiny
results preserve `errno`. A zero input or a no-op scaling call preserves
`errno`. Internal helper errors do not escape an otherwise successful public
operation. Floating-point exception flags and rounding-mode state are not
provided.

Error stores share the kernels' existing exceptional paths. The private
`__avm_expf_noerrno` engine is used for intermediate exponential operations,
including the saturated `sinhf`/`coshf` boundary and negative `expm1f` inputs.
It cannot modify `errno`. Public entry points do not save and restore `errno`.
Classification and native-word guards use 16-bit integer bit tests; rare native-math validation is outlined where it would
otherwise force argument spills on every call.

`AVM_MATH_UNLIKELY` supplies Clang/GCC branch weights on error guards selected
by benchmark measurement, with an ordinary boolean fallback for MSVC host
reference builds. These are layout hints, not assumptions that permit skipping
validation. Broad annotations slowed the shared exponential engine, so its
existing branch weights are retained. Hints inside an already exceptional path
are evaluated separately: an error need not be unlikely conditional on reaching
that path.

`remainderf` and `remquof` report domain errors in their shared classification
path. After excluding NaNs, infinite dividends, and zero divisors, they use
`avm_native_fmod` without repeating public-entry validation. The scaled divisor
can become infinity, which is valid for a finite dividend. Their existing
quotient-bit reduction and tie-to-even adjustments are unchanged. Tiny-input
`expm1f` reporting, stepped `nextafterf` results, and negative-input `sqrtf`
classification use native words while preserving zero and NaN distinctions.

### Trigonometric register reconstruction

The sine polynomial result is multiplied by the reduced argument through
`avm_native_mul`, preserving FPOLY's `q2` result and the argument in `q3`.
An ordinary commuted C multiplication is canonicalized back to the swapping
sequence; the native wrapper avoids that shuffle and its saved register pair.
Standalone sine/cosine reconstruct the quadrant sign with a high-word XOR,
using an explicit `cc` clobber. Coefficients, reduction, rounding points, and
accuracy budgets are unchanged. The native ABI fixture also checks paired
versus standalone results, odd/even symmetry, signed zeros, quadrant neighbors,
and preserved errno for finite inputs.


## Error functions

`erff` and `erfcf` use lightweight binary32 degree-six approximations, each
computed by `AVM_FPOLY7`. For `abs(x) < 1.25`, the shared polynomial evaluates
`erf(x) = x*P(x*x)`; `erfcf` uses `1-x*P(x*x)`. The positive tail uses
`t = 1/(1+x)` and `erfc(x) = exp(-x*x)*t*Q(t)`, with exactly one call to the
private `__avm_expf_noerrno` engine. Negative tails use symmetry. `erff`
saturates at magnitude 4; positive `erfcf` returns zero at 11.

The relative error budgets are `1e-5` for `erff` and `2e-5` for `erfcf`.
Subnormal references allow the same relative budget plus one binary32
subnormal quantum (`0x1p-149`). Signed zero, infinities and NaNs have exact
specified behavior. Successful results preserve `errno`; finite inputs
producing subnormal `erff` results or subnormal/zero positive `erfcf` results
set `ERANGE`. Negative `erfcf` results preserve `errno`. No public function
saves or restores `errno`, and intermediate exponential underflow is private.


RelWithDebInfo measurements use O2 callers, O3 runtime kernels, and 32 calls
with runtime-loaded inputs. Cycles include loop/input/sink overhead and subtract
the 35-cycle DEBUG_BREAK baseline. Linked `.text` includes startup, caller,
private exponential and other shared callees; each workload also has 64 bytes
of input rodata. Packaged images are padded to 5,632 bytes. Guest stack maxima
include the benchmark caller; native extra stack is reported separately.

| Workload | AVR cycles / 32 calls | Linked `.text` bytes | Guest stack bytes | Native extra stack bytes |
| --- | ---: | ---: | ---: | ---: |
| `math_erf` | 159,340 | 791 | 26 | 15 |
| `math_erf_tail` | 350,766 | 791 | 50 | 14 |
| `math_erfc` | 283,030 | 875 | 58 | 14 |
| `math_erfc_tail` | 419,940 | 875 | 58 | 15 |
| `math_erfc_special` | 128,696 | 875 | 58 | 12 |

The kernel object has 227 unrelaxed bytes for `erff`, 317 for `erfcf`, and 86
for their shared tail helper. In the benchmark links, relaxation reduces the
public functions to 188 and 270 bytes respectively; the shared helper occupies
84 or 85 bytes depending on layout. Disassembly confirms native `fpoly 7`
evaluations and one private exponential call in the shared tail helper.

Across the 100-digit deterministic/adaptive corpus (over 81,000 inputs per
function) and independent host libm sweep (90,065 inputs per function), the
largest normal-result relative errors are `2.46646416e-7` for `erff` at input
bits `0x3fa53a47` and `9.86428727e-6` for `erfcf` at `0x410989a0`.
Boundary neighbors at both signs of 1.25, 4, 9, 10 and 11 pass the error budgets,
including the small/tail crossover; no excessive boundary discontinuity was
observed. Subnormal and zero transitions use the stated absolute allowance.


## Gamma functions

`lgammaf` and `tgammaf` use the anchored approximation
`Gamma(1+t) = 1+t*(1-t)*P6(t)` on `[0,1]`, evaluated by `AVM_FPOLY7`.
Both endpoints return exactly one. Positive arguments below 8 use the gamma
recurrence; `tgammaf` in this interval needs no logarithm or exponential.
For arguments below one, the polynomial receives `x` directly before division
by `x`, avoiding loss of tiny increments in `1+x`.

At 8 the implementation switches to Stirling's logarithmic approximation with
three correction terms evaluated by `AVM_FPOLY3`. For extremely large inputs,
the leading expression is rearranged to avoid intermediate overflow before
subtracting `x`. Negative nonintegers use reflection with
`d=min(frac(-x),1-frac(-x))` and a degree-five `sincpi` polynomial evaluated
by `AVM_FPOLY6`. Magnitudes below 7 use direct gamma reflection; larger ones
use logarithmic reflection and, for `tgammaf`, the private exponential engine.
Integer parity uses a 32-bit unsigned conversion only below `2^23`; larger
negative binary32 values are integers and are classified without conversion.
No permanent scratch storage or global gamma sign state is allocated.

For nonzero `abs(x)<2^-17`, gamma uses `1/x` and logarithmic gamma uses
`-log(abs(x))`. NaNs propagate with `x+x`. Logarithmic gamma returns positive
infinity for either infinity, either zero, and negative integer poles; zeros
and poles set `ERANGE`. Gamma preserves positive infinity, reports `EDOM`
with quiet NaN for negative infinity and negative integer poles, and returns
signed infinity with `ERANGE` for signed zero or reciprocal overflow.
Positive logarithmic gamma overflow is guarded at `0x7c44af8e` to keep
classification independent of rounded logarithm arithmetic. Positive finite gamma overflow begins at input bits `0x420c2910`; computed
overflow is also checked. Negative subnormal or zero gamma sets `ERANGE`,
with parity preserving its sign. Negative nonintegers of magnitude at least
43 return signed zero directly. Logarithmic gamma reports `ERANGE` if its
finite positive argument produces infinity. Successful calls preserve errno
without saving or restoring it; intermediate exponential range errors remain
private. `lgammaf(1)` and `lgammaf(2)` return exact positive zero.

The acceptance budgets are `1e-5 + 1e-5*abs(reference)` for logarithmic gamma
and `3e-5*abs(reference)` for gamma. Subnormal gamma adds one binary32
subnormal quantum (`2^-149`). Exceptional classifications and required signs
are checked exactly. The host tests inspect the shipped base, recurrence,
Stirling and reflection polynomials independently against double host libm;
end-to-end tests additionally use 100-digit mpmath references and generated
guest fixtures.


Independent host-kernel sweeps (65,537 samples each) measured maximum relative
errors of `8.86177985e-7` for the base at `0x3ec4f600`, `1.01252526e-6`
for positive recurrence at `0x40ec5c27`, and `1.11350994e-7` for sincpi at
`0x3effd400`. Stirling's maximum absolute error over `[8,35.1]` was
`1.97016345e-5` at `0x41af3202`, within the combined logarithmic allowance.

The extended deterministic/adaptive 100-digit run checked 349,748 logarithmic
gamma inputs and 349,809 gamma inputs with no failures. Gamma's maximum normal
relative error was `2.9479691844e-5` at `0xc208580f`. Logarithmic gamma used
at most `0.208901386` of its combined absolute/relative budget, at
`0xc1200001`. Its maximum absolute error across the very large finite domain
was `2.66100122e31` at `0x7c351512`; the allowance scales with result size.
Its maximum relative error of `2.46491203` at `0x3f7fffff` occurs next to a
zero and is covered by the absolute allowance. Gamma's largest absolute error
was `5.09210545e33` at `0x420bd688`, likewise within its relative budget.

RelWithDebInfo measurements use O2 callers and O3 runtime kernels, with
32 runtime-dependent calls per workload. The special workload calls each
function on the same 16 inputs. Cycles include loop/input/sink overhead and
subtract the 35-cycle DEBUG_BREAK baseline. Linked `.text` includes startup
and shared callees; each workload also has 64 bytes of flash input rodata
and 6 bytes of static guest data (errno and the result sink). The gamma kernel
itself adds no static RAM. Guest stack maxima include the caller; native extra
stack is reported separately.

| Workload | AVR cycles / 32 calls | Linked `.text` bytes | Guest stack bytes | Native extra stack bytes |
| --- | ---: | ---: | ---: | ---: |
| `math_lgamma` | 437,682 | 1,721 | 74 | 15 |
| `math_lgamma_negative` | 714,306 | 1,721 | 76 | 15 |
| `math_lgamma_large` | 453,586 | 1,721 | 74 | 14 |
| `math_tgamma` | 319,096 | 1,998 | 78 | 13 |
| `math_tgamma_negative` | 661,508 | 1,998 | 80 | 15 |
| `math_tgamma_large` | 610,462 | 1,998 | 78 | 15 |
| `math_gamma_special` | 191,663 | 2,418 | 76 | 15 |

The retained benchmark and runtime disassemblies confirm native FPOLY7,
FPOLY6 and FPOLY3 operations. Positive gamma below 8 reaches neither log nor
exp; the private exponential is used only after Stirling or logarithmic
reflection. Public entry points contain conditional errno stores on error
paths and no errno loads or save/restore sequences.

Validation passed `avm_math_fast`, `avm_math_full`,
`avm_math_accuracy_tests_run`, `avm_c99_tests_run`, and `avm_bench_run` in
RelWithDebInfo. The full math suite ran 438 guest tests across all six
optimization levels; the broader benchmark dependency suite ran 1,491 guest
tests. The full high-precision target checked 1,591,205 cases across 31
functions with zero failures. Generated accuracy fixtures and C/C++ errno
fixtures passed; no ISA, interpreter, LLVM backend, or pointer ABI changes
were needed.
