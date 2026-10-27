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
A stable natural-log mantissa wrapper is available for later log1pf work.
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
