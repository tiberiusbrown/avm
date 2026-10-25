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
models this extended precision. Argument reduction, compensated outer arithmetic,
exceptional handling, and public APIs retain their existing structure.
The 2/pi digits also embed in the instruction stream. Polynomial helpers inline into their callers; the large-angle
24-by-256-bit integer product is fully unrolled into 8-by-8-bit products with
split 16-bit column sums and carries, avoiding general 32-bit multiplication.
Its complete 280-bit result is checked against a reference using 32-bit limbs
and 64-bit arithmetic for every normalized binary32 mantissa. Internal exponents
and quadrants use native 16-bit words. The range reducer tail-calls its large-angle
helper to release its frame before allocating product scratch. Coefficient
selection uses immediate constants, and math builds at -O3 without jump tables
or floating-point contraction.

Square root normalizes to [1,4), interpolates a 1.5 KiB program-space table,
then checks exact rounding midpoints using the original split product. It
performs no floating-point divisions. Each exponent parity has 64 quadratic
intervals; the candidate is within one float of the correctly rounded root.
Each record is copied into three stack floats using one uninterrupted
12-byte program-space read. A native 16-bit byte offset avoids expensive wide
record indexing, and a register dependency prevents the compiler from
replacing the copy with three independent loads.
`tests/math/generate_sqrt_table.py` reproduces the table and target boundary
fixtures (`--check` verifies them). A native reference test checks every
normalized binary32 mantissa/parity, every positive subnormal, exponent
boundaries and random bit patterns against both the saved three-Newton-step
implementation and double sqrt. Target fixtures check exact results through
the real interpreter at all six optimization levels.

`hypotf` keeps magnitude ordering, exceptional values and exponent scaling,
then takes the square root of the binary32 sum of squares. `atan2f` divides
the smaller magnitude by the larger and reconstructs the angle with split
pi/2 constants. The atan and tan corrections use float-specific Remez fits
with five and six coefficients; `tests/math/generate_minimax.py` reproduces
them. Tangent retains its reduction tail and compensated reciprocal.

The three logarithms classify and normalize once, then share a mantissa
kernel. Within 1/16 of one, a degree-six log1p polynomial avoids division.
`powf` uses multiplication for exponents +/-3, +/-4 and +/-5 when the base
magnitude is in [2^-15, 2^15]. Larger integer powers retain fdlibm: simple
repeated squaring at -8 exceeded the four-ULP budget. Positive bases in
[0.5, 2] with |y| <= 1.25 use the shared logarithm and exponential; all other
ranges retain the split logarithm/exponential decomposition.

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

`avm_shortcuts_tests_run` compares the production kernels with host double
libm rounded to float, with a four-ULP limit (exact for fmod). It exhausts
reduced logarithm mantissas, dense atan/tan ranges, and mantissas for bounded
integer and fractional powers, plus random inputs, scaling boundaries,
subnormals and exceptional values. The same paths have interpreter fixtures
at all six optimization levels.

See [measurements and validation](../../../docs/math-runtime-tradeoff.md).
