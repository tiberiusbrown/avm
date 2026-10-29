#ifndef _AVM_STDBIT_H
#define _AVM_STDBIT_H

#define __STDC_VERSION_STDBIT_H__ 202311L
#define __STDC_ENDIAN_LITTLE__ 1234
#define __STDC_ENDIAN_BIG__ 4321
#define __STDC_ENDIAN_NATIVE__ __STDC_ENDIAN_LITTLE__

#ifdef __cplusplus
extern "C" {
#define __AVM_STDBIT_BOOL bool
#else
#define __AVM_STDBIT_BOOL _Bool
#endif
unsigned int stdc_leading_zeros_uc(unsigned char value);
unsigned int stdc_leading_ones_uc(unsigned char value);
unsigned int stdc_trailing_zeros_uc(unsigned char value);
unsigned int stdc_trailing_ones_uc(unsigned char value);
unsigned int stdc_first_leading_zero_uc(unsigned char value);
unsigned int stdc_first_leading_one_uc(unsigned char value);
unsigned int stdc_first_trailing_zero_uc(unsigned char value);
unsigned int stdc_first_trailing_one_uc(unsigned char value);
unsigned int stdc_count_zeros_uc(unsigned char value);
unsigned int stdc_count_ones_uc(unsigned char value);
__AVM_STDBIT_BOOL stdc_has_single_bit_uc(unsigned char value);
unsigned int stdc_bit_width_uc(unsigned char value);
unsigned char stdc_bit_floor_uc(unsigned char value);
unsigned char stdc_bit_ceil_uc(unsigned char value);
unsigned int stdc_leading_zeros_us(unsigned short value);
unsigned int stdc_leading_ones_us(unsigned short value);
unsigned int stdc_trailing_zeros_us(unsigned short value);
unsigned int stdc_trailing_ones_us(unsigned short value);
unsigned int stdc_first_leading_zero_us(unsigned short value);
unsigned int stdc_first_leading_one_us(unsigned short value);
unsigned int stdc_first_trailing_zero_us(unsigned short value);
unsigned int stdc_first_trailing_one_us(unsigned short value);
unsigned int stdc_count_zeros_us(unsigned short value);
unsigned int stdc_count_ones_us(unsigned short value);
__AVM_STDBIT_BOOL stdc_has_single_bit_us(unsigned short value);
unsigned int stdc_bit_width_us(unsigned short value);
unsigned short stdc_bit_floor_us(unsigned short value);
unsigned short stdc_bit_ceil_us(unsigned short value);
unsigned int stdc_leading_zeros_ui(unsigned int value);
unsigned int stdc_leading_ones_ui(unsigned int value);
unsigned int stdc_trailing_zeros_ui(unsigned int value);
unsigned int stdc_trailing_ones_ui(unsigned int value);
unsigned int stdc_first_leading_zero_ui(unsigned int value);
unsigned int stdc_first_leading_one_ui(unsigned int value);
unsigned int stdc_first_trailing_zero_ui(unsigned int value);
unsigned int stdc_first_trailing_one_ui(unsigned int value);
unsigned int stdc_count_zeros_ui(unsigned int value);
unsigned int stdc_count_ones_ui(unsigned int value);
__AVM_STDBIT_BOOL stdc_has_single_bit_ui(unsigned int value);
unsigned int stdc_bit_width_ui(unsigned int value);
unsigned int stdc_bit_floor_ui(unsigned int value);
unsigned int stdc_bit_ceil_ui(unsigned int value);
unsigned int stdc_leading_zeros_ul(unsigned long value);
unsigned int stdc_leading_ones_ul(unsigned long value);
unsigned int stdc_trailing_zeros_ul(unsigned long value);
unsigned int stdc_trailing_ones_ul(unsigned long value);
unsigned int stdc_first_leading_zero_ul(unsigned long value);
unsigned int stdc_first_leading_one_ul(unsigned long value);
unsigned int stdc_first_trailing_zero_ul(unsigned long value);
unsigned int stdc_first_trailing_one_ul(unsigned long value);
unsigned int stdc_count_zeros_ul(unsigned long value);
unsigned int stdc_count_ones_ul(unsigned long value);
__AVM_STDBIT_BOOL stdc_has_single_bit_ul(unsigned long value);
unsigned int stdc_bit_width_ul(unsigned long value);
unsigned long stdc_bit_floor_ul(unsigned long value);
unsigned long stdc_bit_ceil_ul(unsigned long value);
unsigned int stdc_leading_zeros_ull(unsigned long long value);
unsigned int stdc_leading_ones_ull(unsigned long long value);
unsigned int stdc_trailing_zeros_ull(unsigned long long value);
unsigned int stdc_trailing_ones_ull(unsigned long long value);
unsigned int stdc_first_leading_zero_ull(unsigned long long value);
unsigned int stdc_first_leading_one_ull(unsigned long long value);
unsigned int stdc_first_trailing_zero_ull(unsigned long long value);
unsigned int stdc_first_trailing_one_ull(unsigned long long value);
unsigned int stdc_count_zeros_ull(unsigned long long value);
unsigned int stdc_count_ones_ull(unsigned long long value);
__AVM_STDBIT_BOOL stdc_has_single_bit_ull(unsigned long long value);
unsigned int stdc_bit_width_ull(unsigned long long value);
unsigned long long stdc_bit_floor_ull(unsigned long long value);
unsigned long long stdc_bit_ceil_ull(unsigned long long value);

#ifdef __cplusplus
}
#else
/* Dispatch matching-width extended/bit-precise types without requiring
 * their spelling to be accepted by the current compiler target. */
#define __AVM_STDBIT_PRECISE(op, value) \
    default: __builtin_choose_expr(sizeof(value) == 1, stdc_##op##_uc, \
        __builtin_choose_expr(sizeof(value) == 2, stdc_##op##_us, \
        __builtin_choose_expr(sizeof(value) == 4, stdc_##op##_ul, stdc_##op##_ull))),
#define stdc_leading_zeros(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(leading_zeros, value) \
    unsigned char: stdc_leading_zeros_uc, unsigned short: stdc_leading_zeros_us, \
    unsigned int: stdc_leading_zeros_ui, unsigned long: stdc_leading_zeros_ul, \
    unsigned long long: stdc_leading_zeros_ull)(value)
#define stdc_leading_ones(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(leading_ones, value) \
    unsigned char: stdc_leading_ones_uc, unsigned short: stdc_leading_ones_us, \
    unsigned int: stdc_leading_ones_ui, unsigned long: stdc_leading_ones_ul, \
    unsigned long long: stdc_leading_ones_ull)(value)
#define stdc_trailing_zeros(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(trailing_zeros, value) \
    unsigned char: stdc_trailing_zeros_uc, unsigned short: stdc_trailing_zeros_us, \
    unsigned int: stdc_trailing_zeros_ui, unsigned long: stdc_trailing_zeros_ul, \
    unsigned long long: stdc_trailing_zeros_ull)(value)
#define stdc_trailing_ones(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(trailing_ones, value) \
    unsigned char: stdc_trailing_ones_uc, unsigned short: stdc_trailing_ones_us, \
    unsigned int: stdc_trailing_ones_ui, unsigned long: stdc_trailing_ones_ul, \
    unsigned long long: stdc_trailing_ones_ull)(value)
#define stdc_first_leading_zero(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(first_leading_zero, value) \
    unsigned char: stdc_first_leading_zero_uc, unsigned short: stdc_first_leading_zero_us, \
    unsigned int: stdc_first_leading_zero_ui, unsigned long: stdc_first_leading_zero_ul, \
    unsigned long long: stdc_first_leading_zero_ull)(value)
#define stdc_first_leading_one(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(first_leading_one, value) \
    unsigned char: stdc_first_leading_one_uc, unsigned short: stdc_first_leading_one_us, \
    unsigned int: stdc_first_leading_one_ui, unsigned long: stdc_first_leading_one_ul, \
    unsigned long long: stdc_first_leading_one_ull)(value)
#define stdc_first_trailing_zero(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(first_trailing_zero, value) \
    unsigned char: stdc_first_trailing_zero_uc, unsigned short: stdc_first_trailing_zero_us, \
    unsigned int: stdc_first_trailing_zero_ui, unsigned long: stdc_first_trailing_zero_ul, \
    unsigned long long: stdc_first_trailing_zero_ull)(value)
#define stdc_first_trailing_one(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(first_trailing_one, value) \
    unsigned char: stdc_first_trailing_one_uc, unsigned short: stdc_first_trailing_one_us, \
    unsigned int: stdc_first_trailing_one_ui, unsigned long: stdc_first_trailing_one_ul, \
    unsigned long long: stdc_first_trailing_one_ull)(value)
#define stdc_count_zeros(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(count_zeros, value) \
    unsigned char: stdc_count_zeros_uc, unsigned short: stdc_count_zeros_us, \
    unsigned int: stdc_count_zeros_ui, unsigned long: stdc_count_zeros_ul, \
    unsigned long long: stdc_count_zeros_ull)(value)
#define stdc_count_ones(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(count_ones, value) \
    unsigned char: stdc_count_ones_uc, unsigned short: stdc_count_ones_us, \
    unsigned int: stdc_count_ones_ui, unsigned long: stdc_count_ones_ul, \
    unsigned long long: stdc_count_ones_ull)(value)
#define stdc_has_single_bit(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(has_single_bit, value) \
    unsigned char: stdc_has_single_bit_uc, unsigned short: stdc_has_single_bit_us, \
    unsigned int: stdc_has_single_bit_ui, unsigned long: stdc_has_single_bit_ul, \
    unsigned long long: stdc_has_single_bit_ull)(value)
#define stdc_bit_width(value) _Generic((value), \
    __AVM_STDBIT_PRECISE(bit_width, value) \
    unsigned char: stdc_bit_width_uc, unsigned short: stdc_bit_width_us, \
    unsigned int: stdc_bit_width_ui, unsigned long: stdc_bit_width_ul, \
    unsigned long long: stdc_bit_width_ull)(value)
#define stdc_bit_floor(value) ((__typeof__(value))_Generic((value), \
    __AVM_STDBIT_PRECISE(bit_floor, value) \
    unsigned char: stdc_bit_floor_uc, unsigned short: stdc_bit_floor_us, \
    unsigned int: stdc_bit_floor_ui, unsigned long: stdc_bit_floor_ul, \
    unsigned long long: stdc_bit_floor_ull)(value))
#define stdc_bit_ceil(value) ((__typeof__(value))_Generic((value), \
    __AVM_STDBIT_PRECISE(bit_ceil, value) \
    unsigned char: stdc_bit_ceil_uc, unsigned short: stdc_bit_ceil_us, \
    unsigned int: stdc_bit_ceil_ui, unsigned long: stdc_bit_ceil_ul, \
    unsigned long long: stdc_bit_ceil_ull)(value))
#endif
#undef __AVM_STDBIT_BOOL
#endif
