#define C99_INPUTS -27.0f, 27.0f, -0.0625f, 0.0625f, -0.5f, 0.5f, -1.0f, 1.0f, -8.0f, 8.0f, 0x1.fffffep-1f, 0x1.000002p0f, 0x1p-126f, 0x1.fffffep127f, -2.0f, 2.0f
#include <math.h>
static __attribute__((noinline)) int classify(float x) { return isnan(x); }
#define C99_OPERATION integer_result=classify(x)
#include "math_c99_bench.h"
