#include "integer_round_kernel.h"
long long llrintf(float x) { return avm_rounded_llong(avm_rint(x)); }
