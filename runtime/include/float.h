/* AVM adds the C23 revision macro to the compiler-provided float.h. The
 * wrapper has no include guard; Clang's header supplies every limit. */
#include_next <float.h>
#define __STDC_VERSION_FLOAT_H__ 202311L
