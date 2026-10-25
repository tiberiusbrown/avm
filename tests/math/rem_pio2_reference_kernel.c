/* Compile the production reducer with host compilers that do not support
   Clang's musttail statement attribute. Keep ordinary header attributes intact. */
#include "../../runtime/lib/math/fdlibm.h"
#if !defined(__clang__)
#undef __attribute__
#define __attribute__(attributes)
#endif
#include "../../runtime/lib/math/ef_rem_pio2.c"
