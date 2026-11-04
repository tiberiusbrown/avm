/* C23 revision macros for AVM-owned and compiler-provided headers, plus the
 * width contracts that AVM depends on. */
#include <assert.h>
#include <complex.h>
#include <fenv.h>
#include <float.h>
#include <inttypes.h>
#include <limits.h>
#include <math.h>
#include <setjmp.h>
#include <stdarg.h>
#include <stdatomic.h>
#include <stdbit.h>
#include <stdckdint.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <tgmath.h>
#include <time.h>
#include <uchar.h>
#include <wchar.h>

_Static_assert(__STDC_VERSION__ == 202311L, "C23 language mode");
_Static_assert(__STDC_VERSION_ASSERT_H__ == 202311L, "assert.h revision");
_Static_assert(__STDC_VERSION_COMPLEX_H__ == 202311L, "complex.h revision");
_Static_assert(__STDC_VERSION_FENV_H__ == 202311L, "fenv.h revision");
_Static_assert(__STDC_VERSION_FLOAT_H__ == 202311L, "float.h revision");
_Static_assert(__STDC_VERSION_INTTYPES_H__ == 202311L, "inttypes.h revision");
_Static_assert(__STDC_VERSION_LIMITS_H__ == 202311L, "limits.h revision");
_Static_assert(__STDC_VERSION_MATH_H__ == 202311L, "math.h revision");
_Static_assert(__STDC_VERSION_SETJMP_H__ == 202311L, "setjmp.h revision");
_Static_assert(__STDC_VERSION_STDARG_H__ == 202311L, "stdarg.h revision");
_Static_assert(__STDC_VERSION_STDATOMIC_H__ == 202311L, "stdatomic.h revision");
_Static_assert(__STDC_VERSION_STDBIT_H__ == 202311L, "stdbit.h revision");
_Static_assert(__STDC_VERSION_STDCKDINT_H__ == 202311L, "stdckdint.h revision");
_Static_assert(__STDC_VERSION_STDDEF_H__ == 202311L, "stddef.h revision");
_Static_assert(__STDC_VERSION_STDINT_H__ == 202311L, "stdint.h revision");
_Static_assert(__STDC_VERSION_STDIO_H__ == 202311L, "stdio.h revision");
_Static_assert(__STDC_VERSION_STDLIB_H__ == 202311L, "stdlib.h revision");
_Static_assert(__STDC_VERSION_STRING_H__ == 202311L, "string.h revision");
_Static_assert(__STDC_VERSION_TGMATH_H__ == 202311L, "tgmath.h revision");
_Static_assert(__STDC_VERSION_TIME_H__ == 202311L, "time.h revision");
_Static_assert(__STDC_VERSION_UCHAR_H__ == 202311L, "uchar.h revision");
_Static_assert(__STDC_VERSION_WCHAR_H__ == 202311L, "wchar.h revision");

/* AVM's integer widths: 16-bit int and 8-bit wchar_t, with C23 width macros
 * that the compiler-provided limits and stdint headers derive from them. */
_Static_assert(BOOL_WIDTH == 1 && UINT_WIDTH == 16 && ULLONG_WIDTH == 64, "limits widths");
_Static_assert(INT8_WIDTH == 8 && UINT64_WIDTH == 64, "stdint widths");
_Static_assert(SIZE_WIDTH == 16 && WCHAR_WIDTH == 8, "size and wchar widths");
_Static_assert(sizeof(size_t) == 2 && sizeof(void (*)(void)) == 3, "AVM pointer widths");

int avm_test_main(void) {
    return 0;
}
