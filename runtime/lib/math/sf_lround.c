#include "integer_round_kernel.h"
long lroundf(float x) { return avm_rounded_long(avm_round_away(x)); }
