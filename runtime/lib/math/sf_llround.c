#include "integer_round_kernel.h"
long long llroundf(float x) { return avm_rounded_llong(avm_round_away(x)); }
