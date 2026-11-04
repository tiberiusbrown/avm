/* AVM adds the C23 revision macro to the compiler-provided stddef.h. The
 * wrapper has no include guard, so Clang's __need_ multiple-inclusion rules
 * still apply to every inclusion. */
#include_next <stddef.h>
#define __STDC_VERSION_STDDEF_H__ 202311L
