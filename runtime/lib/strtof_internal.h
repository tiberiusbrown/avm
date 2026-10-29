#ifndef AVM_STRTOF_INTERNAL_H
#define AVM_STRTOF_INTERNAL_H
#include <stdint.h>
float __avm_hex_value(uint32_t mantissa, long exponent, int sticky);
float __avm_decimal_value(uint32_t mantissa, long exponent, int retained, int overflow);
#endif
