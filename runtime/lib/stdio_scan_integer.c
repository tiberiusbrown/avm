#include "stdio_scan_internal.h"
#include <stddef.h>
#include <inttypes.h>

_Static_assert(__builtin_types_compatible_p(size_t, unsigned int), "size_t counterpart is int");
_Static_assert(__builtin_types_compatible_p(ptrdiff_t, int), "ptrdiff_t counterpart is unsigned int");
_Static_assert(sizeof(int) == 2, "AVM integer ABI");

/* Each va_arg names the actual destination pointer type. */
#define SIGNED_STORE(value) do { \
    switch(length) { \
    case SCAN_HH: *va_arg(*args, signed char *) = (signed char)(value); break; \
    case SCAN_H: *va_arg(*args, short *) = (short)(value); break; \
    case SCAN_L: *va_arg(*args, long *) = (long)(value); break; \
    case SCAN_LL: *va_arg(*args, long long *) = (long long)(value); break; \
    case SCAN_J: *va_arg(*args, intmax_t *) = (intmax_t)(value); break; \
    case SCAN_T: *va_arg(*args, ptrdiff_t *) = (ptrdiff_t)(value); break; \
    default: *va_arg(*args, int *) = (int)(value); break; \
    } \
} while(0)
void scan_count(unsigned char length, unsigned long n, va_list *args) {
    SIGNED_STORE(n);
}
static void store_integer(unsigned char length, int sign, int negative,
                          unsigned long long value, va_list *args) {
    if(sign) {
        /* -(minimum + 1) is representable, including for LLONG_MIN. */
        long long n = negative && value ? -(long long)(value - 1) - 1 : (long long)value;
        SIGNED_STORE(n);
    } else {
        if(negative) value = 0ULL - value;
        switch(length) {
        case SCAN_HH: *va_arg(*args, unsigned char *) = (unsigned char)value; break;
        case SCAN_H: *va_arg(*args, unsigned short *) = (unsigned short)value; break;
        case SCAN_L: *va_arg(*args, unsigned long *) = (unsigned long)value; break;
        case SCAN_LL: *va_arg(*args, unsigned long long *) = value; break;
        case SCAN_J: *va_arg(*args, uintmax_t *) = value; break;
        case SCAN_Z: *va_arg(*args, size_t *) = (size_t)value; break;
        default: *va_arg(*args, unsigned int *) = (unsigned int)value; break;
        }
    }
}
static int digit_value(int ch) {
    if(ch >= '0' && ch <= '9') return ch - '0';
    ch |= 32;
    return ch >= 'a' && ch <= 'f' ? ch - 'a' + 10 : -1;
}
int scan_integer(avm_scan_state *s, const avm_scan_conversion *c, va_list *args) {
    unsigned long width = c->width;
    int ch = scan_peek(s), negative = 0, any = 0;
    int sign = c->specifier == 'd' || c->specifier == 'i';
    int base = c->specifier == 'o' ? 8 :
        (c->specifier == 'x' || c->specifier == 'X' || c->specifier == 'p') ? 16 :
        c->specifier == 'i' ? 0 : 10;
    if(ch == EOF) return SCAN_INPUT;
    if(ch == '+' || ch == '-') {
        negative = ch == '-'; scan_take(s); --width;
    }
    unsigned long long limit;
    switch(c->length) {
    case SCAN_HH: limit = sign ? SCHAR_MAX : UCHAR_MAX; break;
    case SCAN_H: limit = sign ? SHRT_MAX : USHRT_MAX; break;
    case SCAN_L: limit = sign ? LONG_MAX : ULONG_MAX; break;
    case SCAN_LL: case SCAN_J: limit = sign ? LLONG_MAX : ULLONG_MAX; break;
    default: limit = sign ? INT_MAX : UINT_MAX; break;
    }
    if(sign && negative) ++limit;
    unsigned long long value = 0;
    int overflow = 0;
    if(width && scan_peek(s) == '0') {
        scan_take(s); --width; any = 1;
        if(base == 0) base = 8;
        if(width && (base == 8 || base == 16) && c->specifier != 'o' &&
           (scan_peek(s) == 'x' || scan_peek(s) == 'X')) {
            scan_take(s); --width; base = 16; any = 0;
        }
    }
    if(!base) base = 10;
    unsigned long long cutoff;
    unsigned int cutlim;
    if(base == 10) {
        /* Constant cutoffs avoid a 64-bit division helper and its stack frame. */
        switch(c->length) {
        case SCAN_HH: cutoff = sign ? 12ULL : 25ULL; break;
        case SCAN_H: cutoff = sign ? 3276ULL : 6553ULL; break;
        case SCAN_L: cutoff = sign ? 214748364ULL : 429496729ULL; break;
        case SCAN_LL: case SCAN_J:
            cutoff = sign ? 922337203685477580ULL : 1844674407370955161ULL; break;
        default: cutoff = sign ? 3276ULL : 6553ULL; break;
        }
        cutlim = sign ? 7 + negative : 5;
    } else {
        cutoff = base == 8 ? limit >> 3 : limit >> 4;
        cutlim = (unsigned int)limit & (base - 1);
    }
    while(width) {
        int digit = digit_value(scan_peek(s));
        if(digit < 0 || digit >= base) break;
        scan_take(s); --width; any = 1;
        if(value > cutoff || (value == cutoff && (unsigned)digit > cutlim)) overflow = 1;
        else if(!overflow) {
            if(base == 10) {
                /* Two native limbs keep decimal accumulation off the deep
                 * generic 64-bit multiplication helper. */
                uint32_t lo = (uint32_t)value, hi = (uint32_t)(value >> 32);
                uint32_t low8 = lo << 3, low = low8 + (lo << 1);
                hi = hi * 10u + (lo >> 29) + (lo >> 31) + (low < low8);
                value = ((unsigned long long)hi << 32) | low;
            }
            else if(base == 8) value <<= 3;
            else value <<= 4;
            value += (unsigned)digit;
        }
    }
    if(!any) return SCAN_MATCH;
    if(overflow) value = limit;
    if(!c->suppress) {
        if(c->specifier == 'p')
            *va_arg(*args, void **) = (void *)(uintptr_t)(negative ? 0ULL - value : value);
        else store_integer(c->length, sign, negative, value, args);
    }
    return SCAN_OK;
}
