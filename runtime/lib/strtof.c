#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <float.h>
#include <stdint.h>
#include <avm/pgmspace.h>
#include "strtof_internal.h"

_Static_assert(sizeof(double) == sizeof(float) && DBL_MANT_DIG == FLT_MANT_DIG,
               "AVM strtod shares the binary32 strtof implementation");

static float from_bits(uint32_t bits) {
    union { uint32_t u; float f; } value = {bits};
    return value.f;
}

static int matches(const char* text, const char* word) {
    while(*word) {
        if(((unsigned char)*text | 0x20u) != (unsigned char)*word) return 0;
        ++text;
        ++word;
    }
    return 1;
}

static int hex_digit(unsigned char c) {
    if(c >= '0' && c <= '9') return c - '0';
    c |= 0x20u;
    return c >= 'a' && c <= 'f' ? c - 'a' + 10 : -1;
}

static int decimal_overflows(const char* text) {
    /* Exact midpoint between FLT_MAX and infinity. Compare decimal text at
     * this boundary so scaling roundoff cannot spuriously report overflow. */
    static const char AVM_PROGMEM threshold[] =
        "340282356779733661637539395458142568448";
    while(*text == '0' || *text == '.') ++text;
    for(unsigned int i = 0; i < sizeof(threshold) - 1; ++i) {
        if(*text == '.') ++text;
        unsigned char digit = *text >= '0' && *text <= '9' ? (unsigned char)*text++ : '0';
        if(digit != (unsigned char)threshold[i]) return digit > (unsigned char)threshold[i];
    }
    return 1;
}

float strtof(const char* str, char** endptr) {
    const char* p = str;
    if(endptr) *endptr = (char*)str;
    while(isspace((unsigned char)*p)) ++p;
    uint32_t sign = 0;
    if(*p == '-' || *p == '+') {
        if(*p == '-') sign = 0x80000000UL;
        ++p;
    }
    if(matches(p, "inf")) {
        p += 3;
        if(matches(p, "inity")) p += 5;
        if(endptr) *endptr = (char*)p;
        return from_bits(sign | 0x7f800000UL);
    }
    if(matches(p, "nan")) {
        p += 3;
        if(*p == '(') {
            const char* payload = p + 1;
            while(isalnum((unsigned char)*payload) || *payload == '_') ++payload;
            if(*payload == ')') p = payload + 1;
        }
        if(endptr) *endptr = (char*)p;
        return from_bits(sign | 0x7fc00000UL);
    }
    int hexadecimal = 0;
    const char* number = p;
    if(p[0] == '0' && (p[1] == 'x' || p[1] == 'X')) {
        const char* digits = p + 2;
        if(*digits == '.') ++digits;
        if(hex_digit((unsigned char)*digits) >= 0) {
            hexadecimal = 1;
            p += 2;
        }
    }
    uint32_t mantissa = 0;
    long exponent = 0;
    int retained = 0, any = 0, point = 0, sticky = 0;
    int step = hexadecimal ? 4 : 1;
    for(;; ++p) {
        if(*p == '.' && !point) {
            point = 1;
            continue;
        }
        int digit = hex_digit((unsigned char)*p);
        if(digit < 0 || (!hexadecimal && digit >= 10)) break;
        any = 1;
        if(point) exponent -= step;
        if(!mantissa && !digit) continue;
        if(retained < (hexadecimal ? 8 : 9)) {
            mantissa = mantissa * (hexadecimal ? 16u : 10u) + (unsigned int)digit;
            ++retained;
        } else {
            exponent += step;
            sticky |= digit;
        }
    }
    if(!any) return 0.0f;
    if((!hexadecimal && (*p == 'e' || *p == 'E')) ||
       (hexadecimal && (*p == 'p' || *p == 'P'))) {
        const char* e = p + 1;
        int negative = 0;
        if(*e == '+' || *e == '-') {
            negative = *e == '-';
            ++e;
        }
        if(*e >= '0' && *e <= '9') {
            long value = 0;
            do {
                if(value < 1000000L) value = value * 10 + (*e - '0');
                ++e;
            } while(*e >= '0' && *e <= '9');
            exponent += negative ? -value : value;
            p = e;
        }
    }
    if(endptr) *endptr = (char*)p;
    if(!mantissa) return from_bits(sign);
    float result = hexadecimal ? __avm_hex_value(mantissa, exponent, sticky) :
                                __avm_decimal_value(mantissa, exponent, retained,
                                    exponent + retained - 1 == 38 && decimal_overflows(number));
    union { float f; uint32_t u; } bits = {result};
    if(bits.u >= 0x7f800000UL || bits.u < 0x00800000UL) errno = ERANGE;
    return from_bits(bits.u | sign);
}

double strtod(const char* str, char** endptr) {
    return strtof(str, endptr);
}

_Static_assert(sizeof(long double) == sizeof(float) && LDBL_MANT_DIG == FLT_MANT_DIG,
               "AVM strtold shares the binary32 strtof implementation");

long double strtold(const char* str, char** endptr) {
    return strtof(str, endptr);
}
