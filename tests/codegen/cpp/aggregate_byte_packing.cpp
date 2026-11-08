#include <stdint.h>

struct Bytes2 { uint8_t a, b; };
struct Bytes3 { uint8_t a, b, c; };
struct Bytes4 { uint8_t a, b, c, d; };

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

static volatile uint16_t inputs[] = {
    0x0000, 0x0001, 0x007f, 0x0080, 0x00ff, 0x0100, 0x1234, 0xff80, 0xffff
};

// External linkage keeps every field and the ordinary aggregate ABI observable.
NOINLINE uint16_t consume2(Bytes2 v)
{
    return (uint16_t)(v.a | ((uint16_t)v.b << 8));
}

NOINLINE uint32_t consume3(Bytes3 v)
{
    return v.a | ((uint32_t)v.b << 8) | ((uint32_t)v.c << 16);
}

NOINLINE uint32_t consume4(Bytes4 v)
{
    return v.a | ((uint32_t)v.b << 8) | ((uint32_t)v.c << 16) |
           ((uint32_t)v.d << 24);
}

NOINLINE Bytes2 make2(uint16_t a, uint16_t b)
{
    return {(uint8_t)a, (uint8_t)b};
}

NOINLINE Bytes3 make3(uint16_t a, uint16_t b, uint16_t c)
{
    return {(uint8_t)a, (uint8_t)b, (uint8_t)c};
}

NOINLINE Bytes4 make4(uint16_t a, uint16_t b, uint16_t c, uint16_t d)
{
    return {(uint8_t)a, (uint8_t)b, (uint8_t)c, (uint8_t)d};
}

NOINLINE uint32_t stack3(uint32_t prefix, uint32_t suffix, Bytes3 v)
{
    return consume3(v) ^ prefix ^ suffix;
}

NOINLINE uint32_t bitwise_words(uint32_t a, uint32_t b, uint32_t c)
{
    return ((a & b) | c) ^ b;
}

extern "C" int avm_test_main()
{
    for (uint16_t i = 0; i < 256; ++i) {
        for (uint8_t j = 0; j < 9; ++j) {
            uint16_t a = inputs[j], b = (uint16_t)(i | 0xa500u);
            uint16_t c = (uint16_t)((i ^ 0x80u) | 0x5a00u);
            uint16_t d = (uint16_t)((i ^ 0xffu) | 0xff00u);
            uint16_t low = (uint16_t)((a & 255u) | ((b & 255u) << 8));
            uint16_t high = (uint16_t)((c & 255u) | ((d & 255u) << 8));

            Bytes2 v2 = make2(a, b);
            Bytes3 v3 = make3(a, b, c);
            Bytes4 v4 = make4(a, b, c, d);
            CHECK(v2.a == (uint8_t)a && v2.b == (uint8_t)b);
            CHECK(v3.a == (uint8_t)a && v3.b == (uint8_t)b &&
                  v3.c == (uint8_t)c);
            CHECK(v4.a == (uint8_t)a && v4.b == (uint8_t)b &&
                  v4.c == (uint8_t)c && v4.d == (uint8_t)d);
            CHECK(consume2({(uint8_t)a, (uint8_t)b}) == low);
            uint32_t packed3 = consume3({(uint8_t)a, (uint8_t)b, (uint8_t)c});
            CHECK((uint16_t)packed3 == low &&
                  (uint16_t)(packed3 >> 16) == (c & 255u));
            uint32_t packed4 = consume4({(uint8_t)a, (uint8_t)b,
                                        (uint8_t)c, (uint8_t)d});
            CHECK((uint16_t)packed4 == low && (uint16_t)(packed4 >> 16) == high);
            CHECK(stack3(0x12345678UL, 0x89abcdefUL, v3) ==
                  (packed3 ^ 0x12345678UL ^ 0x89abcdefUL));

            uint32_t left = ((uint32_t)a << 16) | b;
            uint32_t right = ((uint32_t)c << 16) | d;
            uint32_t result = bitwise_words(left, right, 0x80400180UL);
            CHECK((uint16_t)result == (uint16_t)(((b & d) | 0x0180u) ^ d));
            CHECK((uint16_t)(result >> 16) ==
                  (uint16_t)(((a & c) | 0x8040u) ^ c));
        }
    }
    return 0;
}
