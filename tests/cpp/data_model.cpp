#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>

#define CHECK(expression)                                                      \
    do {                                                                       \
        if(!(expression))                                                      \
            return __LINE__;                                                   \
    } while(false)

using program_u8_pointer = const uint8_t AVM_PROGMEM*;
using function_pointer = int (*)(void);

struct natural_record {
    uint8_t tag;
    uint16_t count;
    uint32_t value;
};

struct __attribute__((packed)) packed_record {
    uint8_t prefix;
    uint16_t words[2];
    uint32_t tail;
};

enum class small_enum {
    negative = -2,
    positive = 0x1234,
};

struct bitfield_record {
    unsigned low : 3;
    unsigned middle : 5;
    unsigned high : 8;
};

static const uint8_t AVM_PROGMEM program_bytes[] = {
    0x12, 0x34, 0x56,
};

static_assert(sizeof(int8_t) == 1, "int8_t size");
static_assert(sizeof(uint8_t) == 1, "uint8_t size");
static_assert(sizeof(int) == 2, "int size");
static_assert(sizeof(long) == 4, "long size");
static_assert(sizeof(long long) == 8, "long long size");
static_assert(sizeof(float) == 4, "float size");
static_assert(sizeof(double) == 4, "double size");
static_assert(sizeof(long double) == 4, "long double size");
static_assert(sizeof(void*) == 2, "AS0 pointer size");
static_assert(sizeof(program_u8_pointer) == 3, "AS1 pointer size");
static_assert(sizeof(function_pointer) == 3, "function pointer size");

static_assert(alignof(int8_t) == 1, "int8_t alignment");
static_assert(alignof(int) == 1, "int alignment");
static_assert(alignof(long) == 1, "long alignment");
static_assert(alignof(long long) == 1, "long long alignment");
static_assert(alignof(float) == 1, "float alignment");
static_assert(alignof(double) == 1, "double alignment");
static_assert(alignof(long double) == 1, "long double alignment");
static_assert(alignof(void*) == 1, "AS0 pointer alignment");
static_assert(alignof(program_u8_pointer) == 1, "AS1 pointer alignment");

static_assert(sizeof(uint8_t[5]) == 5, "array elements are packed");
static_assert(sizeof(natural_record) == 7, "natural struct size");
static_assert(offsetof(natural_record, tag) == 0, "tag offset");
static_assert(offsetof(natural_record, count) == 1, "count offset");
static_assert(offsetof(natural_record, value) == 3, "value offset");
static_assert(sizeof(packed_record) == 9, "packed struct size");
static_assert(offsetof(packed_record, prefix) == 0, "prefix offset");
static_assert(offsetof(packed_record, words) == 1, "words offset");
static_assert(offsetof(packed_record, tail) == 5, "tail offset");
static_assert(sizeof(packed_record[2]) == 18,
               "packed structure array stride");
static_assert(sizeof(small_enum) == 2, "enum uses 16-bit int layout");
static_assert(sizeof(bitfield_record) == 2,
               "bit-fields share one 16-bit allocation unit");

static bool is_binary32_one(const void* object) {
    const auto* bytes = static_cast<const uint8_t*>(object);
    return bytes[0] == 0x00 && bytes[1] == 0x00 &&
           bytes[2] == 0x80 && bytes[3] == 0x3f;
}

extern "C" int avm_test_main() {
    volatile int8_t signed8_storage = static_cast<int8_t>(-101);
    volatile uint8_t unsigned8_storage = static_cast<uint8_t>(241);
    volatile int int16_storage = -23456;
    volatile long signed32_storage = -123456789L;
    volatile long long signed64_storage = -0x123456789abcdeLL;
    volatile unsigned long long unsigned64_storage = 0xfedcba9876543210ULL;

    CHECK(signed8_storage == static_cast<int8_t>(-101));
    CHECK(signed8_storage < 0);
    CHECK(unsigned8_storage == static_cast<uint8_t>(241));
    CHECK(unsigned8_storage > static_cast<uint8_t>(200));
    CHECK(int16_storage == -23456);
    CHECK(signed32_storage == -123456789L);
    CHECK(signed64_storage == -0x123456789abcdeLL);
    CHECK(signed64_storage != 0x123456789abcdeLL);
    CHECK(unsigned64_storage == 0xfedcba9876543210ULL);
    CHECK(unsigned64_storage != 0x0123456789abcdefULL);

    volatile float float_storage = 1.0f;
    volatile double double_storage = 1.0;
    volatile long double long_double_storage = 1.0L;
    const float float_value = float_storage;
    const double double_value = double_storage;
    const long double long_double_value = long_double_storage;

    CHECK(float_value == 1.0f);
    CHECK(double_value == 1.0);
    CHECK(long_double_value == 1.0L);
    CHECK(is_binary32_one(&float_value));
    CHECK(is_binary32_one(&double_value));
    CHECK(is_binary32_one(&long_double_value));

    uint8_t data_bytes[3] = {0x21, 0x43, 0x65};
    uint8_t* volatile data_pointer = data_bytes;
    program_u8_pointer volatile program_pointer = program_bytes;
    CHECK(data_pointer == data_bytes);
    CHECK(data_pointer[2] == 0x65);
    CHECK(program_pointer == program_bytes);
    CHECK(program_pointer[1] == 0x34);

    volatile packed_record records[2] = {
        {0x11, {0x2233, 0x4455}, 0x66778899UL},
        {0xaa, {0xbbcc, 0xddee}, 0x10203040UL},
    };
    const volatile uint8_t* packed =
        reinterpret_cast<const volatile uint8_t*>(&records[0]);
    CHECK(packed[0] == 0x11);
    CHECK(packed[1] == 0x33 && packed[2] == 0x22);
    CHECK(packed[3] == 0x55 && packed[4] == 0x44);
    CHECK(packed[5] == 0x99 && packed[8] == 0x66);
    CHECK((reinterpret_cast<const volatile uint8_t*>(&records[1]) - packed) ==
          9);

    volatile small_enum enum_storage = small_enum::positive;
    const small_enum enum_value = enum_storage;
    const auto* enum_bytes = reinterpret_cast<const uint8_t*>(&enum_value);
    CHECK(enum_value == small_enum::positive);
    CHECK(enum_bytes[0] == 0x34 && enum_bytes[1] == 0x12);

    volatile bitfield_record bits = {5, 17, 0xa5};
    const volatile uint8_t* bit_bytes =
        reinterpret_cast<const volatile uint8_t*>(&bits);
    CHECK(bits.low == 5 && bits.middle == 17 && bits.high == 0xa5);
    CHECK(bit_bytes[0] == 0x8d);
    CHECK(bit_bytes[1] == 0xa5);

    return 0;
}
