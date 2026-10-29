#include "stdio_scan_internal.h"
#include <errno.h>
#include <avm/pgmspace.h>
/* Range reporting must not pull permanent errno storage into an application
 * that never observes errno. An application reference supplies the storage. */
extern int __avm_errno __attribute__((weak));

static float from_bits(uint32_t bits) {
    union { uint32_t u; float f; } v = {bits};
    return v.f;
}
static int peek(avm_scan_state *s, unsigned long width) {
    return width ? scan_peek(s) : EOF;
}
static int lower(int ch) { return ch == EOF ? EOF : ch | 32; }
static int word(avm_scan_state *s, unsigned long *width, const char *text) {
    while(*text) {
        if(lower(peek(s, *width)) != *text++) return 0;
        scan_take(s); --*width;
    }
    return 1;
}
static int digit_value(int ch) {
    if(ch >= '0' && ch <= '9') return ch - '0';
    ch = lower(ch);
    return ch >= 'a' && ch <= 'f' ? ch - 'a' + 10 : -1;
}
int scan_float(avm_scan_state *s, const avm_scan_conversion *c, va_list *args) {
    unsigned long width = c->width;
    uint32_t sign = 0;
    int ch = peek(s, width);
    if(ch == EOF) return SCAN_INPUT;
    if(ch == '+' || ch == '-') {
        if(ch == '-') sign = 0x80000000UL;
        scan_take(s); --width;
    }
    float result;
    ch = lower(peek(s, width));
    if(ch == 'i') {
        if(!word(s, &width, "inf")) return SCAN_MATCH;
        if(lower(peek(s, width)) == 'i' && !word(s, &width, "inity")) return SCAN_MATCH;
        result = from_bits(0x7f800000UL);
    } else if(ch == 'n') {
        if(!word(s, &width, "nan")) return SCAN_MATCH;
        if(peek(s, width) == '(') {
            scan_take(s); --width;
            while((ch = peek(s, width)) != EOF &&
                  (isalnum((unsigned char)ch) || ch == '_')) {
                scan_take(s); --width;
            }
            if(ch != ')') return SCAN_MATCH;
            scan_take(s); --width;
        }
        result = from_bits(0x7fc00000UL);
    } else {
        int hex = 0, any = 0, point = 0, retained = 0, sticky = 0;
        uint32_t mantissa = 0;
        long exponent = 0;
        /* Compare significant decimal digits against the exact binary32
         * overflow midpoint, without retaining the input token. */
        static const char AVM_PROGMEM threshold[] =
            "340282356779733661637539395458142568448";
        unsigned char compared = 0;
        signed char comparison = 0;
        if(peek(s, width) == '0') {
            scan_take(s); --width; any = 1;
            ch = lower(peek(s, width));
            if(ch == 'x') { scan_take(s); --width; hex = 1; any = 0; }
        }
        for(;;) {
            ch = peek(s, width);
            if(ch == '.' && !point) {
                scan_take(s); --width; point = 1; continue;
            }
            int digit = digit_value(ch);
            if(digit < 0 || (!hex && digit >= 10)) break;
            scan_take(s); --width; any = 1;
            int step = hex ? 4 : 1;
            if(point && exponent > -1000000000L) exponent -= step;
            if(!mantissa && !digit) continue;
            if(!hex && compared < sizeof(threshold) - 1) {
                if(!comparison && digit != threshold[compared] - '0')
                    comparison = digit > threshold[compared] - '0' ? 1 : -1;
                ++compared;
            }
            if(retained < (hex ? 8 : 9)) {
                mantissa = mantissa * (hex ? 16u : 10u) + (unsigned)digit;
                ++retained;
            } else {
                if(exponent < 1000000000L) exponent += step;
                sticky |= digit;
            }
        }
        if(!any) return SCAN_MATCH;
        ch = lower(peek(s, width));
        if(ch == (hex ? 'p' : 'e')) {
            scan_take(s); --width;
            int negative = 0;
            ch = peek(s, width);
            if(ch == '+' || ch == '-') {
                negative = ch == '-'; scan_take(s); --width;
            }
            ch = peek(s, width);
            if(ch < '0' || ch > '9') return SCAN_MATCH;
            long value = 0;
            do {
                if(value < 100000000L) value = value * 10 + ch - '0';
                scan_take(s); --width;
                ch = peek(s, width);
            } while(ch >= '0' && ch <= '9');
            exponent += negative ? -value : value;
        }
        /* Missing trailing decimal digits compare as zero. */
        while(!comparison && compared < sizeof(threshold) - 1) {
            if(threshold[compared++] != '0') comparison = -1;
        }
        result = !mantissa ? 0.0f : hex ? __avm_hex_value(mantissa, exponent, sticky) :
            __avm_decimal_value(mantissa, exponent, retained, comparison >= 0);
        if(mantissa) {
            union { float f; uint32_t u; } bits = {result};
            if((bits.u >= 0x7f800000UL || bits.u < 0x00800000UL) && &__avm_errno) errno = ERANGE;
        }
    }
    union { float f; uint32_t u; } bits = {result};
    result = from_bits(bits.u | sign);
    if(!c->suppress) {
        if(c->length == SCAN_L) *va_arg(*args, double *) = result;
        else if(c->length == SCAN_CAPITAL_L) *va_arg(*args, long double *) = result;
        else *va_arg(*args, float *) = result;
    }
    return SCAN_OK;
}
