# AVM single-precision math

Float kernels adapted from Newlib/fdlibm revision
`1b7c72fdcc4bde7520407d2d3364146f04fb8312`:
https://github.com/mirror/newlib-cygwin/tree/1b7c72fdcc4bde7520407d2d3364146f04fb8312/newlib/libm

Original license notices remain with the kernels, including those moved into
private headers. The runtime has no errno/fenv state and uses fixed
round-to-nearest, ties-to-even arithmetic.

The optimized kernels use float literals at each coefficient use, with no
address-spaced constant objects. Coefficients and 2/pi digits embed in the
instruction stream. Polynomial helpers inline into their callers; the large-angle
24-by-256-bit integer product is fully unrolled into 8-by-8-bit products with
split 16-bit column sums and carries, avoiding general 32-bit multiplication.
Its complete 280-bit result is checked against a reference using 32-bit limbs
and 64-bit arithmetic for every normalized binary32 mantissa. Internal exponents
and quadrants use native 16-bit words. The range reducer tail-calls its large-angle
helper to release its frame before allocating product scratch. Coefficient
selection uses immediate constants, and math builds at -O3 without jump tables
or floating-point contraction.

Square root normalizes to [1,4), performs three Newton steps, then checks exact
rounding midpoints using a split product. A native reference test checks every
normalized binary32 mantissa/parity, plus random exponents and subnormals;
target fixtures check exact results through the real interpreter.

`fmodf` uses exact subtraction in the normal y < x < 2*y interval. Bit-level
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

See [measurements and validation](../../../docs/math-runtime-tradeoff.md).
