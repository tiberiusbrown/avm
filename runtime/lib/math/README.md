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
The guest fallback reduction uses one rounded 4/pi multiply, unsigned truncation, integer
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

Sine and cosine use degree-five odd and degree-six even Remez polynomials on
the existing reduced interval. The low reduction tail is unnecessary for their
absolute error budget. Tangent uses x+x^3*P2(x^2) and
one ordinary reciprocal in odd quadrants. Pole neighbors use the documented
1e-4 absolute/relative hybrid budget with exact sign/classification checks. `atanf` uses a reciprocal above one and a shared four-interval kernel on
[0,1], with a degree-seven odd first interval and centered degree-four fits in
the other intervals. Endpoint anchoring prevents backward jumps at the tested
branch boundaries. Native-word comparisons select intervals. `atan2f` divides
the smaller magnitude by the larger and shares this kernel. `sincosf` shares
one reduction and one square without adding work to standalone sin/cos.
`tests/math/phase34_coefficients.py` reproduces the selected coefficients.
The current reducer measurements and workflows are in
[the fast trig report](../../../docs/math-runtime/trig-fast/report.md).

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

FREMPIO2 supplies both remainder and quadrant through an SSA pair. Trig calls
it for |x|<=128; tangent accepts this path only when |r|>=2^-12. The native
flt40_t pi/2 constant contributes less than 4.924e-9 absolute error in this
range before final rounding. Every binary32 argument in [pi/4,128] is checked
for quadrant, zero side, and error bounds. The existing split-constant and
exponent-window guest reduction handles pole neighbors and larger inputs.
There is no additional native reducer. Polynomial coefficients are unchanged,
and sincos still shares one reduction and squared argument.

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
