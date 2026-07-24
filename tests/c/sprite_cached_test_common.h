#ifndef AVM_CACHED_SPRITE_TEST_COMMON_H
#define AVM_CACHED_SPRITE_TEST_COMMON_H

#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

extern void __avm_set_sprite(const void AVM_PROGMEM *sprite);
extern void EXPLICIT_DRAW(
    int x, int y, const void AVM_PROGMEM *sprite, unsigned int frame);
extern void CACHED_DRAW(int x, int y, unsigned int frame);

#define FRAMEBUFFER ((uint8_t *)(uintptr_t)0x0500u)
#define FRAMEBUFFER_SIZE 1024u

static void prepare_framebuffer(uint8_t background)
{
    memset(FRAMEBUFFER, background, FRAMEBUFFER_SIZE);
}

static int framebuffer_is_filled_with(uint8_t value)
{
    for(uint16_t i = 0; i != FRAMEBUFFER_SIZE; ++i)
        if(FRAMEBUFFER[i] != value)
            return 0;
    return 1;
}

static void digest_framebuffer(uint16_t *first_out, uint16_t *second_out)
{
    uint16_t first = 0x811cu;
    uint16_t second = 0x9e37u;

    for(uint16_t i = 0; i != FRAMEBUFFER_SIZE; ++i) {
        uint16_t value = FRAMEBUFFER[i];

        /* Two inexpensive native-width rolling mixes. */
        first = (uint16_t)((first << 5) | (first >> 11));
        first ^= (uint16_t)(value + i);

        second = (uint16_t)(second + value + (uint16_t)(i << 1));
        second = (uint16_t)((second << 7) | (second >> 9));
        second ^= first;
    }

    *first_out = first;
    *second_out = second;
}

static int digest_matches(uint16_t lhs_first, uint16_t lhs_second,
                          uint16_t rhs_first, uint16_t rhs_second)
{
    return lhs_first == rhs_first && lhs_second == rhs_second;
}

static int fail_case(uint16_t index)
{
    test_line16("CASE", index);
    return 1;
}

static int compare_one(uint16_t case_index, uint8_t background,
                       int x, int y, const void AVM_PROGMEM *sprite,
                       unsigned int frame)
{
    prepare_framebuffer(background);
    EXPLICIT_DRAW(x, y, sprite, frame);
    uint16_t expected_first;
    uint16_t expected_second;
    uint16_t actual_first;
    uint16_t actual_second;
    digest_framebuffer(&expected_first, &expected_second);

    /* Bind before clearing to verify the selected sprite survives unrelated
       framebuffer/memory work between set_sprite and draw. */
    __avm_set_sprite(sprite);
    prepare_framebuffer(background);
    CACHED_DRAW(x, y, frame);
    digest_framebuffer(&actual_first, &actual_second);

    if(!digest_matches(expected_first, expected_second,
                       actual_first, actual_second))
        return fail_case(case_index);
    return 0;
}

static int test_set_sprite_preserves_framebuffer(void)
{
    prepare_framebuffer(0xa6u);
    __avm_set_sprite(sprite_a);
    if(!framebuffer_is_filled_with(0xa6u))
        return fail_case(0u);
    return 0;
}

static int test_repeated_draws_one_binding(void)
{
    prepare_framebuffer(0x3cu);
    EXPLICIT_DRAW(4, 5, sprite_a, 0u);
    EXPLICIT_DRAW(31, 10, sprite_a, 1u);
    EXPLICIT_DRAW(68, 19, sprite_a, 2u);
    uint16_t expected_first;
    uint16_t expected_second;
    uint16_t actual_first;
    uint16_t actual_second;
    digest_framebuffer(&expected_first, &expected_second);

    __avm_set_sprite(sprite_a);
    prepare_framebuffer(0x3cu);
    CACHED_DRAW(4, 5, 0u);
    CACHED_DRAW(31, 10, 1u);
    CACHED_DRAW(68, 19, 2u);
    digest_framebuffer(&actual_first, &actual_second);

    if(!digest_matches(expected_first, expected_second,
                       actual_first, actual_second))
        return fail_case(6u);
    return 0;
}

static int test_rebinding(void)
{
    prepare_framebuffer(0x69u);
    EXPLICIT_DRAW(2, 7, sprite_a, 1u);
    EXPLICIT_DRAW(54, 23, sprite_b, 0u);
    EXPLICIT_DRAW(101, 49, sprite_a, 2u);
    uint16_t expected_first;
    uint16_t expected_second;
    uint16_t actual_first;
    uint16_t actual_second;
    digest_framebuffer(&expected_first, &expected_second);

    prepare_framebuffer(0x69u);
    __avm_set_sprite(sprite_a);
    CACHED_DRAW(2, 7, 1u);
    __avm_set_sprite(sprite_b);
    CACHED_DRAW(54, 23, 0u);
    __avm_set_sprite(sprite_a);
    CACHED_DRAW(101, 49, 2u);
    digest_framebuffer(&actual_first, &actual_second);

    if(!digest_matches(expected_first, expected_second,
                       actual_first, actual_second))
        return fail_case(7u);
    return 0;
}

static int test_explicit_draw_does_not_rebind(void)
{
    prepare_framebuffer(0x96u);
    EXPLICIT_DRAW(6, 4, sprite_a, 0u);
    EXPLICIT_DRAW(47, 26, sprite_b, 1u);
    EXPLICIT_DRAW(92, 43, sprite_a, 2u);
    uint16_t expected_first;
    uint16_t expected_second;
    uint16_t actual_first;
    uint16_t actual_second;
    digest_framebuffer(&expected_first, &expected_second);

    prepare_framebuffer(0x96u);
    __avm_set_sprite(sprite_a);
    CACHED_DRAW(6, 4, 0u);
    EXPLICIT_DRAW(47, 26, sprite_b, 1u);
    CACHED_DRAW(92, 43, 2u);
    digest_framebuffer(&actual_first, &actual_second);

    if(!digest_matches(expected_first, expected_second,
                       actual_first, actual_second))
        return fail_case(8u);
    return 0;
}

static int test_zero_dimension(uint16_t case_index,
                               const void AVM_PROGMEM *sprite)
{
    __avm_set_sprite(sprite);
    prepare_framebuffer(0x5au);
    CACHED_DRAW(-37, 29, 0x1234u);

    if(!framebuffer_is_filled_with(0x5au))
        return fail_case(case_index);
    return 0;
}

int avm_test_main(void)
{
    if(test_set_sprite_preserves_framebuffer())
        return 1;

    if(compare_one(1u, 0x00u, 10, 8, sprite_a, 0u))
        return 1;
    if(compare_one(2u, 0xa5u, 10, 8, sprite_a, 1u))
        return 1;
    if(compare_one(3u, 0x3cu, 27, 3, sprite_a, 2u))
        return 1;
    if(compare_one(4u, 0x96u, -2, -5, sprite_a, 1u))
        return 1;
    if(compare_one(5u, 0x69u, 126, 58, sprite_a, 2u))
        return 1;

    if(test_repeated_draws_one_binding())
        return 1;
    if(test_rebinding())
        return 1;
    if(test_explicit_draw_does_not_rebind())
        return 1;

    if(test_zero_dimension(9u, sprite_zero_width))
        return 1;
    if(test_zero_dimension(10u, sprite_zero_height))
        return 1;

    /* A fully clipped cached draw must agree with the established explicit
       service and must not disturb the selected state. */
    if(compare_one(11u, 0xc3u, 128, 64, sprite_b, 1u))
        return 1;

    return 0;
}

#endif
