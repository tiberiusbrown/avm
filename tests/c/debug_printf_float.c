#include <avm.h>
#include <stdint.h>

static float float_from_bits(uint32_t bits)
{
    union {
        uint32_t bits;
        float value;
    } conversion;

    conversion.bits = bits;
    return conversion.value;
}

int avm_test_main(void)
{
    const float positive_infinity = float_from_bits(UINT32_C(0x7f800000));
    const float negative_infinity = float_from_bits(UINT32_C(0xff800000));
    const float quiet_nan = float_from_bits(UINT32_C(0x7fc00001));
    const float negative_quiet_nan = float_from_bits(UINT32_C(0xffc00001));
    const float maximum_finite = float_from_bits(UINT32_C(0x7f7fffff));
    const float minimum_normal = float_from_bits(UINT32_C(0x00800000));
    const float largest_subnormal = float_from_bits(UINT32_C(0x007fffff));
    const float half_minimum_normal = float_from_bits(UINT32_C(0x00400000));
    const float minimum_subnormal = float_from_bits(UINT32_C(0x00000001));
    const float negative_zero = float_from_bits(UINT32_C(0x80000000));
    const float general_rounds_to_negative_four =
        float_from_bits(UINT32_C(0x38d1b469));
    int failures = 0;
    int result;

    result = avm_debug_printf_P(
        F("f-basic:%f|%.0f|%#.0f|%.3f|%.12f\n"),
        1.5f, 1.5f, 1.5f, -12.375f, 1.23456789f);
    failures |= result != 45;

    result = avm_debug_printf_P(
        F("f-width:[%+010.2f]|[%-10.2f]|[% 8.1f]|[%*.*f]\n"),
        -12.5f, 3.5f, 2.0f, -10, 3, 1.25f);
    failures |= result != 58;

    result = avm_debug_printf_P(
        F("f-values:%f|%.6f|%.6f|%.1f\n"),
        16777216.0f, 1.0e20f, 1.0e-6f, negative_zero);
    failures |= result != 68;

    result = avm_debug_printf_P(
        F("carry:%.0f|%.2f|%.3f|%.2e\n"),
        999.5f, 9.99609375f, 0.99951171875f, 9.99609375f);
    failures |= result != 32;

    result = avm_debug_printf_P(
        F("decimal-ties:%.0f|%.0f\n"), 2.5f, -2.5f);
    failures |= result != 18;

    result = avm_debug_printf_P(
        F("e-basic:%e|%.0e|%#.0E|%.4E|%.10e\n"),
        123.5f, 123.5f, 123.5f, 65536.0f, 1.23456789f);
    failures |= result != 62;

    result = avm_debug_printf_P(
        F("e-width:[%+015.3e]|[%-14.2E]|[% 12.1e]|[%*.*E]\n"),
        1.25f, -0.03125f, 2.0f, 14, 4, 0.5f);
    failures |= result != 75;

    result = avm_debug_printf_P(
        F("e-zero-exp:%.0e\n"), 0.99951171875f);
    failures |= result != 17;

    result = avm_debug_printf_P(
        F("decimal-range:%.7e|%.7e|%.7e|%.5e\n"),
        maximum_finite, minimum_normal, largest_subnormal, minimum_subnormal);
    failures |= result != 68;

    result = avm_debug_printf_P(
        F("g-basic:%g|%g|%g|%g|%.4g\n"),
        123.45f, 0.00012345f, 0.000012345f, 1234567.0f, 9999.5f);
    failures |= result != 55;

    result = avm_debug_printf_P(
        F("g-flags:%#.6g|%#.10g|%.0g|%.4G|[%+010g]|[%-12.5G]\n"),
        12.3f, 1.23456789f, 12.3f, 0.00001234f, 123.4f, 123456.0f);
    failures |= result != 72;

    result = avm_debug_printf_P(
        F("g-round-threshold:%.4g\n"), general_rounds_to_negative_four);
    failures |= result != 25;

    result = avm_debug_printf_P(
        F("g-zero:%g|%g|%#g|%#.3g\n"),
        0.0f, negative_zero, 0.0f, negative_zero);
    failures |= result != 26;

    result = avm_debug_printf_P(
        F("g-alt-scientific:%#.6g|%#.10G\n"), 1.0e10f, 1.0e10f);
    failures |= result != 45;

    result = avm_debug_printf_P(
        F("special:[%f]|[%+e]|[% E]|[%010g]|[%+G]|[%A]\n"),
        positive_infinity, negative_infinity, positive_infinity,
        positive_infinity, negative_quiet_nan, quiet_nan);
    failures |= result != 54;

    result = avm_debug_printf_P(
        F("a-basic:%a|%a|%a|%A|%a\n"),
        1.0f, 1.5f, 0.1f, 0.1f, maximum_finite);
    failures |= result != 68;

    result = avm_debug_printf_P(
        F("a-range:%a|%a|%a|%a|%a\n"),
        0.0f, minimum_normal, half_minimum_normal,
        minimum_subnormal, negative_zero);
    failures |= result != 50;

    result = avm_debug_printf_P(
        F("a-precision:%.0a|%#.0a|%.1a|%.1a|%.2a|%.8a\n"),
        1.5f, 1.25f, 0x1.08p+0f, 0x1.18p+0f, 0.1f, 1.5f);
    failures |= result != 71;

    result = avm_debug_printf_P(
        F("a-width:[%+016.3a]|[%-16.2A]|[% 14a]|[%#*.*a]\n"),
        1.5f, -2.5f, 2.0f, 16, 4, 0.1f);
    failures |= result != 82;

    result = avm_debug_printf_P(
        F("a-boundaries:%a|%a|%.0a|%.0a|%.1a|%.3a\n"),
        float_from_bits(UINT32_C(0x00000003)), largest_subnormal,
        largest_subnormal, maximum_finite, maximum_finite, 0.0f);
    failures |= result != 80;

    result = avm_debug_printf_P(
        F("negative-precision:%.*f|%.*g|%.*a\n"),
        -1, 1.5f, -1, 1.5f, -1, 1.5f);
    failures |= result != 41;

    result = avm_debug_printf_P(
        F("mixed:%g|%d|%a|%s|%.2E\n"),
        3.25f, -7, 6.0f, "ok", 0.125f);
    failures |= result != 35;

    return failures != 0;
}
