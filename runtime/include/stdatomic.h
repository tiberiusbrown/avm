/* AVM adds the C23 revision macro to the compiler-provided stdatomic.h. The
 * wrapper has no include guard; Clang's header supplies every atomic interface. */
#include_next <stdatomic.h>
#define __STDC_VERSION_STDATOMIC_H__ 202311L
