#include <cstdint>
#include <cstring>
#include <exception>
#include <random>

namespace {

std::uint16_t word;
unsigned samples;
bool stuck;
constexpr std::uint16_t words[] = {0, 0xffffu, 0x8000u, 1, 0xa531u};

__attribute__((noinline)) int scripted_source()
{
    std::random_device device("avm");
    for(std::uint16_t value : words) {
        word = value;
        samples = 0;
        if(device() != value || samples != 64)
            return 1;
    }
    return 0;
}

__attribute__((noinline)) int unavailable_source()
{
    std::random_device device("avm");
    stuck = true;
    samples = 0;
    try {
        (void)device();
    } catch(const std::exception& error) {
        stuck = false;
        return samples == 128 && std::strcmp(error.what(), "random_device: AVM entropy unavailable") == 0 ? 0 : 1;
    } catch(...) {
        stuck = false;
        return 2;
    }
    stuck = false;
    return 3;
}

__attribute__((noinline)) int scripted_distribution()
{
    std::random_device device("avm");
    std::uniform_int_distribution<unsigned> distribution;
    for(std::uint16_t value : words) {
        word = value;
        samples = 0;
        if(distribution(device) != value || samples != 64)
            return 1;
    }
    return 0;
}

__attribute__((noinline)) int unavailable_distribution()
{
    std::random_device device("avm");
    std::uniform_int_distribution<int> distribution(1, 9);
    stuck = true;
    samples = 0;
    try {
        (void)distribution(device);
    } catch(const std::exception& error) {
        stuck = false;
        return samples == 128 && std::strcmp(error.what(), "random_device: AVM entropy unavailable") == 0 ? 0 : 1;
    } catch(...) {
        stuck = false;
        return 2;
    }
    stuck = false;
    return 3;
}

__attribute__((noinline)) int invalid_token()
{
    try {
        std::random_device device("bad");
        (void)device;
    } catch(const std::exception& error) {
        return std::strcmp(error.what(), "random_device: unsupported AVM source") == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

}

// Equal pairs precede every useful pair. Check that the extractor rejects
// them, preserves the useful bits, and covers the complete unsigned range.
extern "C" std::uint16_t __avm_random_device_sample() noexcept
{
    const unsigned index = samples++;
    if(stuck || index % 4 < 2)
        return 0;
    const unsigned bit = (word >> (15 - (index / 4) % 16)) & 1;
    return index % 4 == 2 ? bit : bit ^ 1;
}

extern "C" int avm_test_main()
{
    if(scripted_source() != 0 || scripted_distribution() != 0 ||
       unavailable_source() != 0 || unavailable_distribution() != 0 || invalid_token() != 0)
        return 1;
    return scripted_source();
}
