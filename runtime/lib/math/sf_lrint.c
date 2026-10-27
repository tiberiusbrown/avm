#include "integer_round_kernel.h"
long lrintf(float x) { return avm_rounded_long(avm_rint(x)); }
