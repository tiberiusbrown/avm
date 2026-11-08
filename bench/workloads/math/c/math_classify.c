#define C99_INPUTS -0x1p-149f, 0x1p-149f, -0.0625f, 0.0625f, -0.5f, 0.5f, -1.0f, 1.0f, -8.0f, 8.0f, 0x1.fffffep-1f, 0x1.000002p0f, 0x1p-126f, 0x1.fffffep127f, -27.0f, 27.0f
#define C99_OPERATION integer_result=fpclassify(x)+isfinite(x)+isinf(x)+isnan(x)+isnormal(x)+signbit(x)+isgreater(x,0.5f)+isunordered(x,0.5f)
#include "math_c99_bench.h"
