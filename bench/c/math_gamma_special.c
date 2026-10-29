#define C99_INPUTS 0.0f,-0.0f,-1,-2,-100000,INFINITY,-INFINITY,NAN,36,40,-43.5f,-44.5f,0x1p-149f,-0x1p-149f,-0x1p32f,-0x1p64f
#define C99_OPERATION result=(i < 16 ? tgammaf(x) : lgammaf(x))
#include "math_c99_bench.h"
