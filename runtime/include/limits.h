/* AVM adds the C23 revision macro to the compiler-provided limits.h. The
 * wrapper has no include guard; Clang's header supplies every limit. */
#include_next <limits.h>
#define __STDC_VERSION_LIMITS_H__ 202311L
