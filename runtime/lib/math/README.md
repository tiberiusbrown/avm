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
Ordinary reduction uses one rounded 4/pi multiply, unsigned truncation, integer
add/shift, and a split pi/2 reconstruction. The high product is exact through
2^17 radians. Small cancellations use a three-part split; other cancellations
and large angles use an exponent-indexed 2/pi window. The main window retains
32 fractional bits and extends to 48 near cancellation; 24 coefficient guard
bits bound omitted-product error. All integer products use native 8-by-8
instructions, with bounded 16-bit column sums. There is no full-width product,
compensation tail, or general 64-bit guest multiplication. The generator uses
120-digit arithmetic and the full host arithmetic test covers every normalized
mantissa. Math builds at -O3 without jump tables or floating-point contraction.

Square root normalizes to [1,4), then uses 512 linear intervals per exponent
parity in an 8 KiB program-space table. One uninterrupted 8-byte coefficient
read, one multiply and one add replace the quadratic and exact-midpoint split
products. Exponent adjustment is exact. Exhaustive mantissa/parity and positive
subnormal tests observe at most 2 ULP; a 1024-interval table achieved 1 ULP but
was slower on the direct root workloads. The table generator also reproduces
the target boundary fixtures (`--check` verifies both). Exact squares and signed
zero retain exact tests.

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

`fmodf` uses exact subtraction in the normal y < x < 2*y interval, native
word leading-zero counts for subnormal exponents, and 16-bit exponent arithmetic.
Exponent packing in exp, pow and hypot uses unsigned shifts, including negative
scale adjustments. Bit-level
rounding does not perform arithmetic solely to raise unsupported exception
flags. `floorf`, `ceilf`, `roundf`, and `truncf` split binary32 bits into two
16-bit words. Exponents below 7 clear fractional bits in both words; exponents
7 through 22 clear only the low word. Masks, rounding increments, and carries
use native word operations without general 32-bit variable-shift helpers.
Host reference tests exhaust every mantissa at exponents 6, 7, and 22 with both
signs, plus exponent boundaries and random inputs. Target tests cover every
fractional exponent, signed zeros, subnormals, infinities, and NaNs; a symbol
check prevents the four kernels from reintroducing shift-helper calls.
`math.c` supplies log2 and number-preferred min/max with signed-zero handling.

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
