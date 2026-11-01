/* Focused call-frame fixtures for the unwind verifier and the LLDB tests. Each
 * noinline function is named for the frame shape its comment describes, and
 * some combine shapes, such as stack arguments inside a dynamic frame. Volatile
 * accesses keep the stack traffic alive, and main calls every function so that
 * --gc-sections keeps them. Every frame stays below AVM::StackLimit. */

#include <stdint.h>

#define UNWIND_NOINLINE __attribute__((noinline))

/* Defined in unwind_tail_fixture.c, which is compiled without disabling
 * sibling-call optimization so that its returns become tail jumps. */
uint16_t unwind_tail_select(uint16_t value);
uint16_t unwind_tail_stack_args(uint16_t value);

volatile uint16_t unwind_sink = 3u;
volatile uint16_t unwind_dynamic_count = 5u;

/* A frameless leaf: it saves no register and adjusts no stack. */
UNWIND_NOINLINE uint16_t unwind_leaf(uint16_t value)
{
    return (uint16_t)(value + 1u);
}

/* Four values stay live across calls, so the prologue pushes several
 * callee-saved registers and the epilogue pops them in reverse order. */
UNWIND_NOINLINE uint16_t unwind_save_regs(uint16_t value)
{
    uint16_t a = (uint16_t)(unwind_sink + 1u);
    uint16_t b = (uint16_t)(unwind_sink + 2u);
    uint16_t c = (uint16_t)(unwind_sink + 3u);
    uint16_t d = (uint16_t)(unwind_sink + 4u);

    value = unwind_leaf(value);
    value = unwind_leaf(value);
    return (uint16_t)(value + a + b + c + d);
}

/* Eight words form a fixed local frame of one ADJSP. */
UNWIND_NOINLINE uint16_t unwind_fixed_frame(uint16_t value)
{
    volatile uint16_t local[8];
    uint16_t index;

    for (index = 0u; index < 8u; index++)
        local[index] = (uint16_t)(value + index);
    value = unwind_leaf(local[3]);
    return (uint16_t)(value + local[7]);
}

/* A 200-byte frame stays below the stack limit but needs two ADJSP chunks. */
UNWIND_NOINLINE uint16_t unwind_large_frame(uint16_t value)
{
    volatile uint8_t buffer[200];
    uint16_t index;

    for (index = 0u; index < 200u; index++)
        buffer[index] = (uint8_t)(value + index);
    return (uint16_t)(unwind_leaf(buffer[199]) + buffer[0]);
}

/* A variable-length allocation makes the stack pointer move dynamically, so
 * the frame must be addressed through the saved frame pointer. */
UNWIND_NOINLINE uint16_t unwind_dynamic_frame(uint16_t value)
{
    volatile uint8_t *buffer = __builtin_alloca(unwind_dynamic_count);
    uint16_t index;

    for (index = 0u; index < unwind_dynamic_count; index++)
        buffer[index] = (uint8_t)(value + index);
    return (uint16_t)(unwind_leaf(buffer[0]) +
                      buffer[unwind_dynamic_count - 1u]);
}

/* Nested calls keep three frames on the stack, so each return address must
 * unwind in turn. */
UNWIND_NOINLINE uint16_t unwind_nested_inner(uint16_t value)
{
    return unwind_leaf(value);
}

UNWIND_NOINLINE uint16_t unwind_nested_middle(uint16_t value)
{
    uint16_t local = (uint16_t)(value + unwind_sink);

    return (uint16_t)(unwind_nested_inner(local) + local);
}

UNWIND_NOINLINE uint16_t unwind_nested_outer(uint16_t value)
{
    return (uint16_t)(unwind_nested_middle(value) +
                      unwind_nested_middle((uint16_t)(value + 1u)));
}

/* Ten arguments put the last six on the stack, so each call adjusts SP around
 * its outgoing argument area. */
UNWIND_NOINLINE uint16_t unwind_many_args(uint16_t a, uint16_t b, uint16_t c,
                                          uint16_t d, uint16_t e, uint16_t f,
                                          uint16_t g, uint16_t h, uint16_t i,
                                          uint16_t j)
{
    volatile uint16_t sum =
        (uint16_t)(a + b + c + d + e + f + g + h + i + j);

    return sum;
}

UNWIND_NOINLINE uint16_t unwind_stack_args(uint16_t value)
{
    uint16_t first = unwind_many_args(value, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u,
                                      (uint16_t)(value + 10u));
    uint16_t second = unwind_many_args(1u, 2u, 3u, 4u, 5u, 6u, value, 8u, 9u,
                                       10u);

    return (uint16_t)(first + second);
}

/* Two exits. Each epilogue restores the stack state for its own return. */
UNWIND_NOINLINE uint16_t unwind_multi_exit(uint16_t value)
{
    uint16_t a = (uint16_t)(unwind_sink + 5u);
    uint16_t b = (uint16_t)(unwind_sink + 6u);

    if (value == 0u)
        return unwind_leaf(a);
    value = unwind_leaf(value);
    return (uint16_t)(value + a + b);
}

/* Sixteen-bit arguments beyond the four in registers go on the stack, so these
 * two callees carry two and four stack arguments. The _alt callee differs from
 * unwind_many_args so that the compiler cannot merge calls from both branches. */
UNWIND_NOINLINE uint16_t unwind_six_args(uint16_t a, uint16_t b, uint16_t c,
                                         uint16_t d, uint16_t e, uint16_t f)
{
    volatile uint16_t sum = (uint16_t)(a + b + c + d + e + f);

    return sum;
}

UNWIND_NOINLINE uint16_t unwind_many_args_alt(uint16_t a, uint16_t b, uint16_t c,
                                              uint16_t d, uint16_t e, uint16_t f,
                                              uint16_t g, uint16_t h, uint16_t i,
                                              uint16_t j)
{
    volatile uint16_t sum = (uint16_t)(a ^ b ^ c ^ d ^ e ^ f ^ g ^ h ^ i ^ j);

    return sum;
}

/* Calls with differently sized stack-argument areas, in sequence, with a call
 * that needs no stack arguments between them. */
UNWIND_NOINLINE uint16_t unwind_varied_args(uint16_t value)
{
    uint16_t first = unwind_many_args(value, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u,
                                      10u);
    uint16_t second = unwind_six_args(first, 2u, 3u, 4u, 5u, value);
    uint16_t third = unwind_leaf(second);

    return (uint16_t)(second + third + unwind_six_args(third, 1u, 2u, 3u, 4u,
                                                       5u));
}

/* Each branch makes a call with stack arguments, and the join then calls again
 * with none. The stack adjustments must balance at the join. */
UNWIND_NOINLINE uint16_t unwind_branch_args(uint16_t value)
{
    uint16_t result;

    if (value & 1u)
        result = unwind_many_args(value, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u, 10u);
    else
        result = unwind_many_args_alt(10u, 9u, 8u, 7u, 6u, 5u, 4u, 3u, 2u,
                                      value);
    return (uint16_t)(result + unwind_leaf(value));
}

/* Each branch returns after its own call with stack arguments. */
UNWIND_NOINLINE uint16_t unwind_branch_return_args(uint16_t value)
{
    if (value & 1u)
        return unwind_many_args(value, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u, 10u);
    return unwind_many_args_alt(10u, 9u, 8u, 7u, 6u, 5u, 4u, 3u, 2u, value);
}

/* Two runtime-sized allocations with a call between them. Each allocation
 * moves SP by a run-time amount, so the second must restore SP from r3 before
 * its own adjustment. */
UNWIND_NOINLINE uint16_t unwind_dynamic_twice(uint16_t value)
{
    volatile uint8_t *first = __builtin_alloca(unwind_dynamic_count);
    volatile uint8_t *second;

    first[0] = (uint8_t)value;
    value = unwind_leaf(first[0]);
    second = __builtin_alloca((uint16_t)(unwind_dynamic_count + 2u));
    second[0] = (uint8_t)value;
    return (uint16_t)(unwind_leaf(second[0]) + first[0] + second[1]);
}

/* A call with stack arguments made while SP is dynamically adjusted. */
UNWIND_NOINLINE uint16_t unwind_dynamic_args(uint16_t value)
{
    volatile uint8_t *buffer = __builtin_alloca(unwind_dynamic_count);

    buffer[0] = (uint8_t)value;
    value = unwind_many_args(buffer[0], value, 3u, 4u, 5u, 6u, 7u, 8u, 9u,
                             10u);
    return (uint16_t)(value + buffer[unwind_dynamic_count - 1u]);
}

/* Several exits share one return block, so the compiler may copy the move and
 * return into each predecessor. */
UNWIND_NOINLINE uint16_t unwind_return_tails(uint16_t value)
{
    uint16_t a = (uint16_t)(unwind_sink + 7u);
    uint16_t b = (uint16_t)(unwind_sink + 8u);
    uint16_t result;

    switch (value & 3u) {
    case 0u:
        result = unwind_leaf(a);
        break;
    case 1u:
        result = (uint16_t)(a + b);
        break;
    case 2u:
        result = unwind_leaf(b);
        break;
    default:
        result = a;
        break;
    }
    return result;
}

/* A deterministic chain for the LLDB tests, nested from main. The leaf is
 * frameless and stops the debugger. unwind_chain_args has six stack arguments.
 * unwind_chain_dynamic moves SP at run time and calls while that adjustment
 * is live, so its caller is recovered through r3. unwind_chain_top is
 * frameless. */
/* main arms the leaf's debug break only for the second run of the chain, so the
 * first run reaches every boundary without an earlier stop. */
volatile uint16_t unwind_break_armed = 0u;

UNWIND_NOINLINE uint16_t unwind_chain_leaf(uint16_t value)
{
    /* The builtin emits SYS debug_break inline at every optimization level. */
    if (unwind_break_armed)
        __avm_debug_break();
    return (uint16_t)(value + 1u);
}

UNWIND_NOINLINE uint16_t unwind_chain_args(uint16_t a, uint16_t b, uint16_t c,
                                           uint16_t d, uint16_t e, uint16_t f,
                                           uint16_t g, uint16_t h, uint16_t i,
                                           uint16_t j)
{
    volatile uint16_t sum =
        (uint16_t)(a + b + c + d + e + f + g + h + i + j);

    return unwind_chain_leaf(sum);
}

UNWIND_NOINLINE uint16_t unwind_chain_dynamic(uint16_t value)
{
    volatile uint8_t *buffer = __builtin_alloca(unwind_dynamic_count);

    buffer[0] = (uint8_t)value;
    return unwind_chain_args(buffer[0], 2u, 3u, 4u, 5u, 6u, 7u, 8u, 9u, 10u);
}

UNWIND_NOINLINE uint16_t unwind_chain_top(uint16_t value)
{
    return (uint16_t)(unwind_chain_dynamic(value) + 1u);
}

int main(void)
{
    uint16_t value = 1u;

    value = unwind_leaf(value);
    value = unwind_save_regs(value);
    value = unwind_fixed_frame(value);
    value = unwind_large_frame(value);
    value = unwind_dynamic_frame(value);
    value = unwind_nested_outer(value);
    value = unwind_stack_args(value);
    value = unwind_multi_exit(value);
    value = unwind_varied_args(value);
    value = unwind_branch_args(value);
    value = unwind_branch_return_args(value);
    value = unwind_dynamic_twice(value);
    value = unwind_dynamic_args(value);
    value = unwind_return_tails(value);
    value = unwind_tail_select(value);
    value = unwind_tail_stack_args(value);
    value = unwind_chain_top(value);
    value = unwind_tail_select(0u);
    unwind_break_armed = 1u;
    value = unwind_chain_top(value);
    unwind_sink = value;
    return 0;
}
