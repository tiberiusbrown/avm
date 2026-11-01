/* Tail-call fixtures for the unwind verifier. This file is compiled without
 * -fno-optimize-sibling-calls, so its returns of direct calls become tail jumps
 * when the optimizer allows them. unwind_cfi_fixture.c still disables the
 * optimization, which keeps its own call chains intact. */

#include <stdint.h>

#define UNWIND_NOINLINE __attribute__((noinline))

extern volatile uint16_t unwind_sink;
uint16_t unwind_leaf(uint16_t value);
uint16_t unwind_nested_middle(uint16_t value);
uint16_t unwind_many_args(uint16_t a, uint16_t b, uint16_t c, uint16_t d,
                          uint16_t e, uint16_t f, uint16_t g, uint16_t h,
                          uint16_t i, uint16_t j);

/* The tail jump to unwind_leaf replaces this frame, so no physical frame for
 * unwind_tail_direct remains. */
UNWIND_NOINLINE uint16_t unwind_tail_direct(uint16_t value)
{
    return unwind_leaf((uint16_t)(value + unwind_sink));
}

/* Two returns that are both direct tail calls, plus a return after a call. */
UNWIND_NOINLINE uint16_t unwind_tail_select(uint16_t value)
{
    if (value == 0u)
        return unwind_tail_direct(value);
    if (value == 1u)
        return unwind_nested_middle(value);
    return (uint16_t)(unwind_leaf(value) + unwind_sink);
}

/* Ten arguments need stack space in the caller, so this return cannot become a
 * tail jump and must remain a call followed by an epilogue. */
UNWIND_NOINLINE uint16_t unwind_tail_stack_args(uint16_t value)
{
    return unwind_many_args(value, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u,
                            (uint16_t)(value + 10u));
}
