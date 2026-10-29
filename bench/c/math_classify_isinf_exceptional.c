#define C99_INPUTS -0.0f, 0.0f, -INFINITY, INFINITY, NAN, -NAN, -0x1p-149f, 0x1p-149f, -0x1.fffffcp-127f, 0x1.fffffcp-127f, -0.0f, 0.0f, -INFINITY, INFINITY, NAN, -NAN
#include <math.h>
static __attribute__((noinline)) int classify(float x) { return isinf(x); }
#define C99_OPERATION integer_result=classify(x)
#include "math_c99_bench.h"
