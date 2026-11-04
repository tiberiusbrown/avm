/* AVM adds the C23 revision macro to the compiler-provided stdint.h. The
 * wrapper has no include guard; Clang's header supplies every type and macro. */
#include_next <stdint.h>
#define __STDC_VERSION_STDINT_H__ 202311L
