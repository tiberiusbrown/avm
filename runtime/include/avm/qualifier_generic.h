#ifndef _AVM_QUALIFIER_GENERIC_H
#define _AVM_QUALIFIER_GENERIC_H

/* Internal helper for the C23 search macros in <string.h> and <wchar.h>.
 * The conditional expression applies array decay without evaluating src, and
 * typeof preserves the pointee qualification of the searched pointer. The
 * parenthesized function name in result keeps the function addressable. */
#define __AVM_SEARCH_RESULT(src, result) \
    ((__typeof__((1 ? (src) : (src)) + 0))(result))

#endif
