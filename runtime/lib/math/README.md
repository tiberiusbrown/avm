# AVM single-precision math

Float kernels adapted from Newlib/fdlibm revision
`1b7c72fdcc4bde7520407d2d3364146f04fb8312`:
https://github.com/mirror/newlib-cygwin/tree/1b7c72fdcc4bde7520407d2d3364146f04fb8312/newlib/libm

Original license notices remain with the kernels, including those moved into
private headers. The runtime has no errno/fenv state and uses fixed
round-to-nearest, ties-to-even arithmetic.

The optimized kernels embed coefficients and 2/pi digits in the instruction
stream. Polynomial helpers inline into their callers; the large-angle
24-by-256-bit integer product is fully unrolled. Internal exponents and
quadrants use native 16-bit words. The range reducer tail-calls its large-angle
helper to release its frame before allocating product scratch. Coefficient
selection uses immediate constants, and math builds at -O3 without jump tables
or floating-point contraction.

Square root normalizes to [1,4), performs three Newton steps, then checks exact
rounding midpoints using a split product. A native reference test checks every
normalized binary32 mantissa/parity, plus random exponents and subnormals;
target fixtures check exact results through the real interpreter.

`fmodf` uses exact subtraction in the normal y < x < 2*y interval. Bit-level
rounding does not perform arithmetic solely to raise unsupported exception
flags. The roundf mask is explicitly 32 bits because AVM has 16-bit int.
`math.c` supplies log2 and number-preferred min/max with signed-zero handling.

See [measurements and validation](../../../docs/math-runtime-tradeoff.md).
