#ifndef _AVM_RUNTIME_UCHAR_H
#define _AVM_RUNTIME_UCHAR_H
#define __STDC_VERSION_UCHAR_H__ 202311L

#include <stddef.h>
#include <stdint.h>
#include <wchar.h>

/* C declares these three types here. C++ has them built in. char8_t is the
 * same type as unsigned char, char16_t as uint_least16_t, and char32_t as
 * uint_least32_t. */
#ifndef __cplusplus
typedef unsigned char char8_t;
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* The char8_t, char16_t, and char32_t functions convert between UTF-8,
 * UTF-16, or UTF-32 and the one-byte C locale. Each byte with value v denotes
 * the code point v, so every byte is valid and code points above 255 are not
 * representable. Such characters, and invalid sequences, fail with EILSEQ.
 * mbstate_t is one byte and holds only the pending unit of a partial sequence. */
size_t mbrtoc8(char8_t* __restrict pc8, const char* __restrict s, size_t n,
               mbstate_t* __restrict ps);
size_t c8rtomb(char* __restrict s, char8_t c8, mbstate_t* __restrict ps);
size_t mbrtoc16(char16_t* __restrict pc16, const char* __restrict s, size_t n,
                mbstate_t* __restrict ps);
size_t c16rtomb(char* __restrict s, char16_t c16, mbstate_t* __restrict ps);
size_t mbrtoc32(char32_t* __restrict pc32, const char* __restrict s, size_t n,
                mbstate_t* __restrict ps);
size_t c32rtomb(char* __restrict s, char32_t c32, mbstate_t* __restrict ps);

#ifdef __cplusplus
}
#endif

#endif /* _AVM_RUNTIME_UCHAR_H */
