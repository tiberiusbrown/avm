#include <stdint.h>

typedef struct {
    uint32_t value;
    uint16_t weight;
    uint8_t kind, enabled;
} item;

#define NOINLINE __attribute__((noinline))
#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)
#define COMBINE(a, b, bias) \
    (((a).enabled ? (a).value * (a).weight : (bias)) ^ \
     ((b).enabled ? (b).value + (b).weight : (bias))) + \
    ((uint32_t)(a).kind << 8) + (b).kind

static volatile uint16_t seed = 0x9357u;
static item items[16];
static item *global_alias;
static item *volatile identity_source;

NOINLINE static uint32_t combine(item a, item b, uint16_t bias)
{
    return COMBINE(a, b, bias);
}

NOINLINE uint32_t reference(const item *a, const item *b, uint16_t bias)
{
    return COMBINE(*a, *b, bias);
}

// Enough borrowed pointers and scalar arguments to exercise stack arguments.
NOINLINE static uint32_t many(item a, uint32_t bias, item b, item c,
                              item d, item e, uint16_t last)
{
    return a.value + b.weight + c.kind + d.value + e.weight + bias + last;
}

NOINLINE static uint32_t write_alias(item snapshot, item *original)
{
    original->value ^= 0xdeadbeefUL;
    return snapshot.value;
}

NOINLINE static uint32_t write_global(item snapshot)
{
    global_alias->value += 0x12345678UL;
    return snapshot.value;
}

NOINLINE void change(item *original)
{
    original->value ^= 0x87654321UL;
}

NOINLINE static uint32_t with_callback(item snapshot, item *original,
                                      void (*callback)(item *))
{
    callback(original);
    return snapshot.value;
}

NOINLINE static uint32_t mutate_copy(item snapshot)
{
    snapshot.value ^= 0xabcdef01UL;
    snapshot.kind++;
    return snapshot.value + snapshot.kind;
}

NOINLINE uint16_t same_address(const item *a, const item *b)
{
    return a == b;
}

NOINLINE static uint16_t observe_address(item snapshot, const item *original)
{
    return same_address(&snapshot, original);
}

NOINLINE static uint32_t volatile_copy(item snapshot)
{
    return ((volatile item *)&snapshot)->value;
}

typedef uint16_t (*action)(uint16_t);
typedef struct {
    action run;
    uint16_t count;
    uint8_t tag;
} program_record;

NOINLINE static uint16_t act(uint16_t value)
{
    return value ^ 0xa55au;
}

NOINLINE static action get_action(program_record record)
{
    return record.run;
}

NOINLINE static int test_borrowed(void)
{
    uint32_t checksum = 0;
    for (uint16_t i = 0; i < 16; ++i) {
        uint16_t j = (i + 5u) & 15u;
        uint16_t bias = (uint16_t)(checksum >> 12);
        uint32_t expected = reference(&items[i], &items[j], bias);
        CHECK(combine(items[i], items[j], bias) == expected);
        CHECK(combine(items[i], items[i], bias) ==
              reference(&items[i], &items[i], bias));
        item local = items[j];
        CHECK(combine(local, items[i], bias) ==
              reference(&local, &items[i], bias));
        checksum += expected;
    }
    return 0;
}

NOINLINE static int test_many(void)
{
    uint16_t initial = seed;
    uint32_t bias = ((uint32_t)initial << 16) | (uint16_t)~initial;
    CHECK(many(items[0], bias, items[1], items[2], items[3], items[4], initial)
          == items[0].value + items[1].weight + items[2].kind + items[3].value
             + items[4].weight + bias + initial);
    return 0;
}

NOINLINE static int test_aliases(void)
{
    for (uint16_t i = 0; i < 16; ++i) {
        uint32_t old = items[i].value;
        CHECK(write_alias(items[i], &items[i]) == old);
        CHECK(items[i].value == (old ^ 0xdeadbeefUL));
        old = items[i].value;
        global_alias = &items[i];
        CHECK(write_global(items[i]) == old);
        CHECK(items[i].value == old + 0x12345678UL);
        old = items[i].value;
        CHECK(with_callback(items[i], &items[i], change) == old);
        CHECK(items[i].value == (old ^ 0x87654321UL));
        old = items[i].value;
        uint8_t kind = items[i].kind;
        CHECK(mutate_copy(items[i]) ==
              (old ^ 0xabcdef01UL) + (uint8_t)(kind + 1u));
        CHECK(items[i].value == old && items[i].kind == kind);
        // Keep both incoming addresses dynamic through interprocedural folding.
        identity_source = &items[i];
        item *original = identity_source;
        CHECK(observe_address(*original, original) == 0);
        CHECK(volatile_copy(items[i]) == old);
    }
    return 0;
}

NOINLINE static int test_program_record(void)
{
    uint16_t initial = seed;
    program_record record = {act, initial, 0x7fu};
    action selected = get_action(record);
    CHECK(sizeof(record.run) == 3);
    CHECK(selected == act && selected(record.count) == (initial ^ 0xa55au));
    return 0;
}

int avm_test_main(void)
{
    uint16_t initial = seed;
    for (uint16_t i = 0; i < 16; ++i) {
        items[i].value = (uint32_t)initial * (i + 257u);
        items[i].weight = (uint16_t)(initial + i * 19u);
        items[i].kind = (uint8_t)(i * 17u);
        items[i].enabled = i & 1u;
    }
    CHECK(test_borrowed() == 0);
    CHECK(test_many() == 0);
    CHECK(test_aliases() == 0);
    CHECK(test_program_record() == 0);
    return 0;
}
