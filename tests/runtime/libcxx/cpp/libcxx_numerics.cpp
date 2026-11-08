#include <bit>
#include <cmath>
#include <complex>
#include <numbers>
#include <random>

extern "C" int avm_test_main()
{
    if(!std::has_single_bit(16u) || std::bit_width(16u) != 5 ||
       std::bit_cast<uint32_t>(1.0f) != 0x3f800000u)
        return 1;

    const std::complex<float> value(3.0f, 4.0f);
    if(std::abs(value) != 5.0f || std::numbers::pi_v<float> < 3.14f ||
       std::numbers::pi_v<float> > 3.15f)
        return 2;

    std::linear_congruential_engine<unsigned short, 5, 1, 31> engine(7);
    std::uniform_int_distribution<int> distribution(1, 9);
    const int draw = distribution(engine);
    if(draw < 1 || draw > 9)
        return 3;

    return std::hermite(2, 0.0) == -2.0 ? 0 : 4;
}
