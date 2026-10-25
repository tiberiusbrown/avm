#include <stdint.h>

typedef struct {
    uint32_t position;
    uint16_t velocity, flags;
    uint8_t tag;
} sample;

#define NOINLINE __attribute__((noinline))
#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)
#define SAME(a, b) ((a).position == (b).position && \
                    (a).velocity == (b).velocity && \
                    (a).flags == (b).flags && (a).tag == (b).tag)
#define ADVANCE(v, step) do { \
    (v).position += (uint32_t)(v).velocity * (step); \
    (v).velocity = (uint16_t)((v).velocity + (step) + (v).tag); \
    (v).flags ^= (uint16_t)((v).position >> 9); \
    (v).tag = (uint8_t)((v).tag + (uint8_t)(step)); \
} while (0)

static volatile uint16_t seed = 0x1357u;

NOINLINE static sample advance(sample input, uint16_t step)
{
    ADVANCE(input, step);
    return input;
}

// A pointer-based reference retains the ordinary externally visible ABI.
NOINLINE void advance_reference(sample *value, uint16_t step)
{
    ADVANCE(*value, step);
}

NOINLINE static sample preserve(sample input, uint16_t step)
{
    ADVANCE(input, step);
    return input;
}

// The original object remains observable while the private byval copy changes.
NOINLINE static sample aliased(sample input, uint16_t step,
                               const sample *original)
{
    ADVANCE(input, step);
    input.flags ^= original->flags;
    return input;
}

static const sample *global_alias;
NOINLINE static sample globally_aliased(sample input, uint16_t step)
{
    ADVANCE(input, step);
    input.flags ^= global_alias->flags;
    return input;
}

NOINLINE sample external_advance(sample input, uint16_t step)
{
    ADVANCE(input, step);
    return input;
}

// Removing the hidden result argument also changes register/stack placement.
NOINLINE static sample wide_arguments(sample input, uint32_t left,
                                      uint16_t middle, uint32_t right,
                                      uint16_t last)
{
    input.position += left ^ right;
    input.velocity = (uint16_t)(input.velocity + middle);
    input.flags ^= last;
    input.tag = (uint8_t)(input.tag + (uint8_t)(left >> 16));
    return input;
}

typedef struct {
    uint16_t (*action)(uint16_t);
    uint16_t count;
    uint8_t tag;
} program_record;

NOINLINE static uint16_t action(uint16_t value)
{
    return (uint16_t)(value ^ 0xa55au);
}

NOINLINE static program_record advance_program(program_record input,
                                               uint16_t step)
{
    input.count = (uint16_t)(input.count + step);
    input.tag ^= (uint8_t)step;
    return input;
}

NOINLINE static int test_updates(void)
{
    sample current = {0x12345678UL, seed, 0x55aau, 7};
    sample other = {0xfffffff0UL, 0xffffu, 0x8001u, 255};
    sample expected = current, expected_other = other;
    for (uint16_t i = 0; i < 256; ++i) {
        uint16_t step = (uint16_t)(i + 3u);
        current = advance(current, step);
        other = advance(other, (uint16_t)(step + 17u));
        advance_reference(&expected, step);
        advance_reference(&expected_other, (uint16_t)(step + 17u));
        CHECK(SAME(current, expected));
        CHECK(SAME(other, expected_other));
    }
    return 0;
}

NOINLINE static int test_aliases(void)
{
    // Keeping the input after a call requires an independent aggregate value.
    sample original = {0x89abcdefUL, seed, 0xa55au, 128};
    sample saved = original;
    sample result = preserve(original, 19);
    advance_reference(&saved, 19);
    CHECK(SAME(result, saved));
    CHECK(original.position == 0x89abcdefUL && original.velocity == seed &&
          original.flags == 0xa55au && original.tag == 128);

    uint16_t old_flags = original.flags;
    saved = original;
    advance_reference(&saved, 23);
    saved.flags ^= old_flags;
    original = aliased(original, 23, &original);
    CHECK(SAME(original, saved));

    old_flags = original.flags;
    saved = original;
    advance_reference(&saved, 29);
    saved.flags ^= old_flags;
    global_alias = &original;
    original = globally_aliased(original, 29);
    CHECK(SAME(original, saved));

    saved = original;
    advance_reference(&saved, 31);
    original = external_advance(original, 31);
    CHECK(SAME(original, saved));
    return 0;
}

NOINLINE static int test_wide_arguments(void)
{
    sample wide = {0x12345678UL, seed, 0x55aau, 7};
    for (uint16_t i = 0; i < 64; ++i) {
        uint32_t left = ((uint32_t)seed << 16) | i;
        uint32_t right = 0xfedcba98UL - i;
        uint32_t position = wide.position + (left ^ right);
        uint16_t velocity = (uint16_t)(wide.velocity + i);
        uint16_t flags = wide.flags ^ (uint16_t)(i + 0x8000u);
        uint8_t tag = (uint8_t)(wide.tag + (uint8_t)(left >> 16));
        wide = wide_arguments(wide, left, i, right, (uint16_t)(i + 0x8000u));
        CHECK(wide.position == position && wide.velocity == velocity &&
              wide.flags == flags && wide.tag == tag);
    }
    return 0;
}

NOINLINE static int test_program_records(void)
{
    // Three-byte code pointers keep their normal aggregate layout.
    CHECK(sizeof(program_record) == 6);
    program_record program = {action, seed, 0xa5};
    uint16_t count = program.count;
    uint8_t tag = program.tag;
    for (uint16_t i = 0; i < 64; ++i) {
        count = (uint16_t)(count + i);
        tag ^= (uint8_t)i;
        program = advance_program(program, i);
        CHECK(program.action == action && program.count == count &&
              program.tag == tag && program.action(count) == (count ^ 0xa55au));
    }
    return 0;
}

int avm_test_main(void)
{
    int result = test_updates();
    if (result) return result;
    result = test_aliases();
    if (result) return result;
    result = test_wide_arguments();
    if (result) return result;
    return test_program_records();
}
