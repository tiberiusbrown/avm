#include <math.h>
static float (*volatile make_nan)(const char *)=nanf;
#define C99_INPUTS -12.75f,-8.5f,-4.625f,-2.5f,-1.5f,-0.625f,-0.5f,-0.125f,0.125f,0.5f,0.625f,1.5f,2.5f,4.625f,8.5f,12.75f
#define C99_OPERATION (void)x; result=make_nan("runtime")
#include "math_c99_bench.h"
