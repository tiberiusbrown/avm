#include <stdbit.h>

unsigned int stdc_leading_zeros_uc(unsigned char x) {
    unsigned int n = 0; for (unsigned int i = sizeof(x) * 8; i && !(x & ((unsigned char)1 << (i - 1))); --i) ++n; return n;
}

unsigned int stdc_leading_ones_uc(unsigned char x) {
    return stdc_leading_zeros_uc((unsigned char)~x);
}

unsigned int stdc_trailing_zeros_uc(unsigned char x) {
    unsigned int n = 0; if (!x) return sizeof(x) * 8; while (!(x & 1)) { ++n; x >>= 1; } return n;
}

unsigned int stdc_trailing_ones_uc(unsigned char x) {
    return stdc_trailing_zeros_uc((unsigned char)~x);
}

unsigned int stdc_first_leading_zero_uc(unsigned char x) {
    return x == (unsigned char)~(unsigned char)0 ? 0 : stdc_leading_ones_uc(x) + 1;
}

unsigned int stdc_first_leading_one_uc(unsigned char x) {
    return x ? stdc_leading_zeros_uc(x) + 1 : 0;
}

unsigned int stdc_first_trailing_zero_uc(unsigned char x) {
    return x == (unsigned char)~(unsigned char)0 ? 0 : stdc_trailing_ones_uc(x) + 1;
}

unsigned int stdc_first_trailing_one_uc(unsigned char x) {
    return x ? stdc_trailing_zeros_uc(x) + 1 : 0;
}

unsigned int stdc_count_zeros_uc(unsigned char x) {
    return sizeof(x) * 8 - stdc_count_ones_uc(x);
}

unsigned int stdc_count_ones_uc(unsigned char x) {
    unsigned int n = 0; while (x) { x &= x - 1; ++n; } return n;
}

_Bool stdc_has_single_bit_uc(unsigned char x) {
    return x && !(x & (x - 1));
}

unsigned int stdc_bit_width_uc(unsigned char x) {
    return sizeof(x) * 8 - stdc_leading_zeros_uc(x);
}

unsigned char stdc_bit_floor_uc(unsigned char x) {
    return x ? (unsigned char)((unsigned char)1 << (stdc_bit_width_uc(x) - 1)) : 0;
}

unsigned char stdc_bit_ceil_uc(unsigned char x) {
    return x <= 1 ? 1 : (unsigned char)((unsigned char)1 << stdc_bit_width_uc((unsigned char)(x - 1)));
}

unsigned int stdc_leading_zeros_us(unsigned short x) {
    unsigned int n = 0; for (unsigned int i = sizeof(x) * 8; i && !(x & ((unsigned short)1 << (i - 1))); --i) ++n; return n;
}

unsigned int stdc_leading_ones_us(unsigned short x) {
    return stdc_leading_zeros_us((unsigned short)~x);
}

unsigned int stdc_trailing_zeros_us(unsigned short x) {
    unsigned int n = 0; if (!x) return sizeof(x) * 8; while (!(x & 1)) { ++n; x >>= 1; } return n;
}

unsigned int stdc_trailing_ones_us(unsigned short x) {
    return stdc_trailing_zeros_us((unsigned short)~x);
}

unsigned int stdc_first_leading_zero_us(unsigned short x) {
    return x == (unsigned short)~(unsigned short)0 ? 0 : stdc_leading_ones_us(x) + 1;
}

unsigned int stdc_first_leading_one_us(unsigned short x) {
    return x ? stdc_leading_zeros_us(x) + 1 : 0;
}

unsigned int stdc_first_trailing_zero_us(unsigned short x) {
    return x == (unsigned short)~(unsigned short)0 ? 0 : stdc_trailing_ones_us(x) + 1;
}

unsigned int stdc_first_trailing_one_us(unsigned short x) {
    return x ? stdc_trailing_zeros_us(x) + 1 : 0;
}

unsigned int stdc_count_zeros_us(unsigned short x) {
    return sizeof(x) * 8 - stdc_count_ones_us(x);
}

unsigned int stdc_count_ones_us(unsigned short x) {
    unsigned int n = 0; while (x) { x &= x - 1; ++n; } return n;
}

_Bool stdc_has_single_bit_us(unsigned short x) {
    return x && !(x & (x - 1));
}

unsigned int stdc_bit_width_us(unsigned short x) {
    return sizeof(x) * 8 - stdc_leading_zeros_us(x);
}

unsigned short stdc_bit_floor_us(unsigned short x) {
    return x ? (unsigned short)((unsigned short)1 << (stdc_bit_width_us(x) - 1)) : 0;
}

unsigned short stdc_bit_ceil_us(unsigned short x) {
    return x <= 1 ? 1 : (unsigned short)((unsigned short)1 << stdc_bit_width_us((unsigned short)(x - 1)));
}

unsigned int stdc_leading_zeros_ui(unsigned int x) {
    unsigned int n = 0; for (unsigned int i = sizeof(x) * 8; i && !(x & ((unsigned int)1 << (i - 1))); --i) ++n; return n;
}

unsigned int stdc_leading_ones_ui(unsigned int x) {
    return stdc_leading_zeros_ui((unsigned int)~x);
}

unsigned int stdc_trailing_zeros_ui(unsigned int x) {
    unsigned int n = 0; if (!x) return sizeof(x) * 8; while (!(x & 1)) { ++n; x >>= 1; } return n;
}

unsigned int stdc_trailing_ones_ui(unsigned int x) {
    return stdc_trailing_zeros_ui((unsigned int)~x);
}

unsigned int stdc_first_leading_zero_ui(unsigned int x) {
    return x == (unsigned int)~(unsigned int)0 ? 0 : stdc_leading_ones_ui(x) + 1;
}

unsigned int stdc_first_leading_one_ui(unsigned int x) {
    return x ? stdc_leading_zeros_ui(x) + 1 : 0;
}

unsigned int stdc_first_trailing_zero_ui(unsigned int x) {
    return x == (unsigned int)~(unsigned int)0 ? 0 : stdc_trailing_ones_ui(x) + 1;
}

unsigned int stdc_first_trailing_one_ui(unsigned int x) {
    return x ? stdc_trailing_zeros_ui(x) + 1 : 0;
}

unsigned int stdc_count_zeros_ui(unsigned int x) {
    return sizeof(x) * 8 - stdc_count_ones_ui(x);
}

unsigned int stdc_count_ones_ui(unsigned int x) {
    unsigned int n = 0; while (x) { x &= x - 1; ++n; } return n;
}

_Bool stdc_has_single_bit_ui(unsigned int x) {
    return x && !(x & (x - 1));
}

unsigned int stdc_bit_width_ui(unsigned int x) {
    return sizeof(x) * 8 - stdc_leading_zeros_ui(x);
}

unsigned int stdc_bit_floor_ui(unsigned int x) {
    return x ? (unsigned int)((unsigned int)1 << (stdc_bit_width_ui(x) - 1)) : 0;
}

unsigned int stdc_bit_ceil_ui(unsigned int x) {
    return x <= 1 ? 1 : (unsigned int)((unsigned int)1 << stdc_bit_width_ui((unsigned int)(x - 1)));
}

unsigned int stdc_leading_zeros_ul(unsigned long x) {
    unsigned int n = 0; for (unsigned int i = sizeof(x) * 8; i && !(x & ((unsigned long)1 << (i - 1))); --i) ++n; return n;
}

unsigned int stdc_leading_ones_ul(unsigned long x) {
    return stdc_leading_zeros_ul((unsigned long)~x);
}

unsigned int stdc_trailing_zeros_ul(unsigned long x) {
    unsigned int n = 0; if (!x) return sizeof(x) * 8; while (!(x & 1)) { ++n; x >>= 1; } return n;
}

unsigned int stdc_trailing_ones_ul(unsigned long x) {
    return stdc_trailing_zeros_ul((unsigned long)~x);
}

unsigned int stdc_first_leading_zero_ul(unsigned long x) {
    return x == (unsigned long)~(unsigned long)0 ? 0 : stdc_leading_ones_ul(x) + 1;
}

unsigned int stdc_first_leading_one_ul(unsigned long x) {
    return x ? stdc_leading_zeros_ul(x) + 1 : 0;
}

unsigned int stdc_first_trailing_zero_ul(unsigned long x) {
    return x == (unsigned long)~(unsigned long)0 ? 0 : stdc_trailing_ones_ul(x) + 1;
}

unsigned int stdc_first_trailing_one_ul(unsigned long x) {
    return x ? stdc_trailing_zeros_ul(x) + 1 : 0;
}

unsigned int stdc_count_zeros_ul(unsigned long x) {
    return sizeof(x) * 8 - stdc_count_ones_ul(x);
}

unsigned int stdc_count_ones_ul(unsigned long x) {
    unsigned int n = 0; while (x) { x &= x - 1; ++n; } return n;
}

_Bool stdc_has_single_bit_ul(unsigned long x) {
    return x && !(x & (x - 1));
}

unsigned int stdc_bit_width_ul(unsigned long x) {
    return sizeof(x) * 8 - stdc_leading_zeros_ul(x);
}

unsigned long stdc_bit_floor_ul(unsigned long x) {
    return x ? (unsigned long)((unsigned long)1 << (stdc_bit_width_ul(x) - 1)) : 0;
}

unsigned long stdc_bit_ceil_ul(unsigned long x) {
    return x <= 1 ? 1 : (unsigned long)((unsigned long)1 << stdc_bit_width_ul((unsigned long)(x - 1)));
}

unsigned int stdc_leading_zeros_ull(unsigned long long x) {
    unsigned int n = 0; for (unsigned int i = sizeof(x) * 8; i && !(x & ((unsigned long long)1 << (i - 1))); --i) ++n; return n;
}

unsigned int stdc_leading_ones_ull(unsigned long long x) {
    return stdc_leading_zeros_ull((unsigned long long)~x);
}

unsigned int stdc_trailing_zeros_ull(unsigned long long x) {
    unsigned int n = 0; if (!x) return sizeof(x) * 8; while (!(x & 1)) { ++n; x >>= 1; } return n;
}

unsigned int stdc_trailing_ones_ull(unsigned long long x) {
    return stdc_trailing_zeros_ull((unsigned long long)~x);
}

unsigned int stdc_first_leading_zero_ull(unsigned long long x) {
    return x == (unsigned long long)~(unsigned long long)0 ? 0 : stdc_leading_ones_ull(x) + 1;
}

unsigned int stdc_first_leading_one_ull(unsigned long long x) {
    return x ? stdc_leading_zeros_ull(x) + 1 : 0;
}

unsigned int stdc_first_trailing_zero_ull(unsigned long long x) {
    return x == (unsigned long long)~(unsigned long long)0 ? 0 : stdc_trailing_ones_ull(x) + 1;
}

unsigned int stdc_first_trailing_one_ull(unsigned long long x) {
    return x ? stdc_trailing_zeros_ull(x) + 1 : 0;
}

unsigned int stdc_count_zeros_ull(unsigned long long x) {
    return sizeof(x) * 8 - stdc_count_ones_ull(x);
}

unsigned int stdc_count_ones_ull(unsigned long long x) {
    unsigned int n = 0; while (x) { x &= x - 1; ++n; } return n;
}

_Bool stdc_has_single_bit_ull(unsigned long long x) {
    return x && !(x & (x - 1));
}

unsigned int stdc_bit_width_ull(unsigned long long x) {
    return sizeof(x) * 8 - stdc_leading_zeros_ull(x);
}

unsigned long long stdc_bit_floor_ull(unsigned long long x) {
    return x ? (unsigned long long)((unsigned long long)1 << (stdc_bit_width_ull(x) - 1)) : 0;
}

unsigned long long stdc_bit_ceil_ull(unsigned long long x) {
    return x <= 1 ? 1 : (unsigned long long)((unsigned long long)1 << stdc_bit_width_ull((unsigned long long)(x - 1)));
}
