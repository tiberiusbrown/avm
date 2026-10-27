/* Frontend-only checks: the public macros must retain wider host types.
   No host backend or system C++ library is required. */
#include <math.h>
static_assert(isfinite(1e300), "do not narrow double to float");
static_assert(isnormal(1e-300), "do not narrow double to zero");
static_assert(fpclassify(1e-300)==FP_NORMAL, "double classification");
static_assert(signbit(-0.0L), "long double negative zero");
static_assert(!isinf(1e300L), "long double finite");
static_assert(isgreater(1e300L,1e299), "mixed floating types");
static_assert(isless(-1,0.5L), "integer promotion");
static_assert(isfinite(42), "integer classification");
#if __LDBL_MAX_EXP__ > __DBL_MAX_EXP__
static_assert(isfinite(1e4000L), "retain extended long double range");
static_assert(isnormal(1e-4000L), "retain tiny normal long doubles");
static_assert(fpclassify(1e-4000L)==FP_NORMAL, "long double classification");
#endif
