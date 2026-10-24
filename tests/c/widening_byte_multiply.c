#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

static volatile uint8_t left_input, right_input;
static volatile int8_t signed_inputs[16];
static volatile int8_t coefficients[16];
static volatile int16_t signed_sink;
static const uint8_t AVM_PROGMEM edges[] = {
    0, 1, 2, 63, 127, 128, 129, 254, 255
};

static NOINLINE int16_t signed_product(int8_t a, int8_t b)
{
    return (int16_t)a * (int16_t)b;
}

static NOINLINE uint16_t unsigned_product(uint8_t a, uint8_t b)
{
    return (uint16_t)a * (uint16_t)b;
}

static NOINLINE int16_t mixed_product(int8_t a, uint8_t b)
{
    return (int16_t)a * (int16_t)b;
}

static NOINLINE int16_t reversed_product(uint8_t a, int8_t b)
{
    return (int16_t)a * (int16_t)b;
}

static NOINLINE int16_t loaded_product(void)
{
    int16_t a = (int8_t)left_input;
    int16_t b = (int8_t)right_input;
    signed_sink = a; /* The full signed word must remain available. */
    return a * b;
}

static NOINLINE int16_t loaded_square(void)
{
    int16_t a = (int8_t)left_input;
    return a * a;
}

static NOINLINE int16_t program_product(const uint8_t AVM_PROGMEM *a,
                                       const uint8_t AVM_PROGMEM *b)
{
    return (int16_t)(int8_t)*a * (int16_t)*b;
}

/* Independent shift/add reference: do not check a multiply against itself. */
static NOINLINE uint16_t reference_product(uint8_t a, uint8_t b)
{
    uint16_t shifted = a;
    uint16_t result = 0;
    for (uint8_t bit = 0; bit < 8; ++bit) {
        if (b & 1u)
            result = (uint16_t)(result + shifted);
        shifted = (uint16_t)(shifted << 1);
        b >>= 1;
    }
    return result;
}

/* Hoisted coefficients exceed the register file and must survive word spills.
 * Distinct volatile samples keep all sixteen products in the loop. */
static NOINLINE uint16_t fir_products(void)
{
#define COEFFICIENT(n) int16_t c##n = coefficients[n]
    COEFFICIENT(0); COEFFICIENT(1); COEFFICIENT(2); COEFFICIENT(3);
    COEFFICIENT(4); COEFFICIENT(5); COEFFICIENT(6); COEFFICIENT(7);
    COEFFICIENT(8); COEFFICIENT(9); COEFFICIENT(10); COEFFICIENT(11);
    COEFFICIENT(12); COEFFICIENT(13); COEFFICIENT(14); COEFFICIENT(15);
#undef COEFFICIENT
    uint16_t sum = 0;
    for (uint8_t repeat = 0; repeat < 3; ++repeat) {
#define PRODUCT(n) sum = (uint16_t)(sum + c##n * (int16_t)signed_inputs[n])
        PRODUCT(0); PRODUCT(1); PRODUCT(2); PRODUCT(3);
        PRODUCT(4); PRODUCT(5); PRODUCT(6); PRODUCT(7);
        PRODUCT(8); PRODUCT(9); PRODUCT(10); PRODUCT(11);
        PRODUCT(12); PRODUCT(13); PRODUCT(14); PRODUCT(15);
#undef PRODUCT
    }
    return sum;
}

int avm_test_main(void)
{
    for (uint16_t a = 0; a < 256; ++a) {
        for (uint8_t j = 0; j < sizeof(edges); ++j) {
            uint8_t b = edges[j];
            left_input = (uint8_t)a;
            right_input = b;
            uint8_t x = left_input;
            uint8_t y = right_input;
            uint16_t uu = reference_product(x, y);
            uint16_t su = (uint16_t)(uu - ((x & 128u) ? (uint16_t)y << 8 : 0));
            uint16_t us = (uint16_t)(uu - ((y & 128u) ? (uint16_t)x << 8 : 0));
            uint16_t ss = (uint16_t)(su - ((y & 128u) ? (uint16_t)x << 8 : 0));
            CHECK(unsigned_product(x, y) == uu);
            CHECK((uint16_t)signed_product((int8_t)x, (int8_t)y) == ss);
            CHECK((uint16_t)mixed_product((int8_t)x, y) == su);
            CHECK((uint16_t)reversed_product(x, (int8_t)y) == us);
            CHECK((uint16_t)loaded_product() == ss);
            CHECK(signed_sink == (int16_t)(int8_t)x);
        }
        left_input = (uint8_t)a;
        uint16_t square = reference_product((uint8_t)a, (uint8_t)a);
        if (a & 128u) {
            square = (uint16_t)(square - (a << 8));
            square = (uint16_t)(square - (a << 8));
        }
        CHECK((uint16_t)loaded_square() == square);
    }

    for (uint8_t i = 0; i < sizeof(edges); ++i)
        for (uint8_t j = 0; j < sizeof(edges); ++j) {
            uint8_t a = edges[i], b = edges[j];
            uint16_t expected = reference_product(a, b);
            if (a & 128u)
                expected = (uint16_t)(expected - ((uint16_t)b << 8));
            CHECK((uint16_t)program_product(edges + i, edges + j) == expected);
        }

    uint16_t expected = 0;
    for (uint8_t i = 0; i < 16; ++i) {
        uint8_t a = edges[i % sizeof(edges)];
        uint8_t b = edges[(i + 4) % sizeof(edges)];
        coefficients[i] = (int8_t)a;
        signed_inputs[i] = (int8_t)b;
        uint16_t product = reference_product(a, b);
        if (a & 128u)
            product = (uint16_t)(product - ((uint16_t)b << 8));
        if (b & 128u)
            product = (uint16_t)(product - ((uint16_t)a << 8));
        expected = (uint16_t)(expected + product);
    }
    expected = (uint16_t)(expected + expected + expected);
    CHECK(fir_products() == expected);
    test_puts("widening-byte-multiply=ok\n");
    return 0;
}
