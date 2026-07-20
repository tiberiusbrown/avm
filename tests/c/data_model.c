#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>

#define CHECK(expression)                                                      \
    do {                                                                       \
        if(!(expression))                                                      \
            return __LINE__;                                                   \
    } while(0)

typedef const uint8_t AVM_PROGMEM* program_u8_pointer;
typedef int (*function_pointer)(void);

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

enum small_enum {
    enum_negative = -2,
    enum_positive = 0x1234,
};

struct bitfield_record {
    unsigned low : 3;
    unsigned middle : 5;
    unsigned high : 8;
};

static const uint8_t AVM_PROGMEM program_bytes[] = {
    0x12, 0x34, 0x56,
};

_Static_assert(sizeof(int8_t) == 1, "int8_t size");
_Static_assert(sizeof(uint8_t) == 1, "uint8_t size");
_Static_assert(sizeof(int) == 2, "int size");
_Static_assert(sizeof(long) == 4, "long size");
_Static_assert(sizeof(long long) == 8, "long long size");
_Static_assert(sizeof(float) == 4, "float size");
_Static_assert(sizeof(double) == 4, "double size");
_Static_assert(sizeof(long double) == 4, "long double size");
_Static_assert(sizeof(void*) == 2, "AS0 pointer size");
_Static_assert(sizeof(program_u8_pointer) == 3, "AS1 pointer size");
_Static_assert(sizeof(function_pointer) == 3, "function pointer size");

_Static_assert(_Alignof(int8_t) == 1, "int8_t alignment");
_Static_assert(_Alignof(int) == 1, "int alignment");
_Static_assert(_Alignof(long) == 1, "long alignment");
_Static_assert(_Alignof(long long) == 1, "long long alignment");
_Static_assert(_Alignof(float) == 1, "float alignment");
_Static_assert(_Alignof(double) == 1, "double alignment");
_Static_assert(_Alignof(long double) == 1, "long double alignment");
_Static_assert(_Alignof(void*) == 1, "AS0 pointer alignment");
_Static_assert(_Alignof(program_u8_pointer) == 1, "AS1 pointer alignment");

_Static_assert(sizeof(uint8_t[5]) == 5, "array elements are packed");
_Static_assert(sizeof(struct natural_record) == 7, "natural struct size");
_Static_assert(offsetof(struct natural_record, tag) == 0, "tag offset");
_Static_assert(offsetof(struct natural_record, count) == 1, "count offset");
_Static_assert(offsetof(struct natural_record, value) == 3, "value offset");
_Static_assert(sizeof(struct packed_record) == 9, "packed struct size");
_Static_assert(offsetof(struct packed_record, prefix) == 0, "prefix offset");
_Static_assert(offsetof(struct packed_record, words) == 1, "words offset");
_Static_assert(offsetof(struct packed_record, tail) == 5, "tail offset");
_Static_assert(sizeof(struct packed_record[2]) == 18,
               "packed structure array stride");
_Static_assert(sizeof(enum small_enum) == 2, "enum uses 16-bit int layout");
_Static_assert(sizeof(struct bitfield_record) == 2,
               "bit-fields share one 16-bit allocation unit");

static int is_binary32_one(const void* object) {
    const uint8_t* bytes = (const uint8_t*)object;
    return bytes[0] == 0x00 && bytes[1] == 0x00 &&
           bytes[2] == 0x80 && bytes[3] == 0x3f;
}

int avm_test_main(void) {
    volatile int8_t signed8_storage = (int8_t)-101;
    volatile uint8_t unsigned8_storage = (uint8_t)241;
    volatile int int16_storage = -23456;
    volatile long signed32_storage = -123456789L;
    volatile long long signed64_storage = -0x123456789abcdeLL;
    volatile unsigned long long unsigned64_storage = 0xfedcba9876543210ULL;

    CHECK(signed8_storage == (int8_t)-101);
    CHECK(signed8_storage < 0);
    CHECK(unsigned8_storage == (uint8_t)241);
    CHECK(unsigned8_storage > (uint8_t)200);
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

    volatile struct packed_record records[2] = {
        {0x11, {0x2233, 0x4455}, 0x66778899UL},
        {0xaa, {0xbbcc, 0xddee}, 0x10203040UL},
    };
    const volatile uint8_t* packed = (const volatile uint8_t*)&records[0];
    CHECK(packed[0] == 0x11);
    CHECK(packed[1] == 0x33 && packed[2] == 0x22);
    CHECK(packed[3] == 0x55 && packed[4] == 0x44);
    CHECK(packed[5] == 0x99 && packed[8] == 0x66);
    CHECK(((const volatile uint8_t*)&records[1] - packed) == 9);

    volatile enum small_enum enum_storage = enum_positive;
    const enum small_enum enum_value = enum_storage;
    const uint8_t* enum_bytes = (const uint8_t*)&enum_value;
    CHECK(enum_value == enum_positive);
    CHECK(enum_bytes[0] == 0x34 && enum_bytes[1] == 0x12);

    volatile struct bitfield_record bits = {5, 17, 0xa5};
    const volatile uint8_t* bit_bytes =
        (const volatile uint8_t*)&bits;
    CHECK(bits.low == 5 && bits.middle == 17 && bits.high == 0xa5);
    CHECK(bit_bytes[0] == 0x8d);
    CHECK(bit_bytes[1] == 0xa5);

    return 0;
}
