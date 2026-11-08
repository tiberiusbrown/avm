#include <avm.h>
#include <limits>
#include <random>
#include <type_traits>

static_assert(std::is_same_v<std::random_device::result_type, unsigned int>);
static_assert(std::random_device::min() == 0);
static_assert(std::random_device::max() == std::numeric_limits<unsigned int>::max());
static_assert(std::uniform_random_bit_generator<std::random_device>);
static_assert(!std::is_copy_constructible_v<std::random_device>);
static_assert(!std::is_move_constructible_v<std::random_device>);

namespace {

volatile unsigned sink;

__attribute__((noinline)) int hardware_source()
{
    std::random_device device;
    if(device.entropy() != 0.0)
        return 1;
    for(unsigned i = 0; i != 4; ++i)
        sink = device();
    return 0;
}

__attribute__((noinline)) int distribution()
{
    std::random_device device("avm");
    std::uniform_int_distribution<int> distribution(1, 9);
    for(unsigned i = 0; i != 8; ++i) {
        const int value = distribution(device);
        if(value < 1 || value > 9)
            return 1;
    }
    return 0;
}

}

extern "C" int avm_test_main()
{
    avm_set_random_seed(0x1234u);
    const auto first = avm_random();
    const auto second = avm_random();
    avm_set_random_seed(0x1234u);
    if(avm_random() != first || hardware_source() != 0 || distribution() != 0)
        return 1;
    return avm_random() == second ? 0 : 2;
}
