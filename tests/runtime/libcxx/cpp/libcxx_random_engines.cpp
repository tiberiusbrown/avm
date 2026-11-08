#include <cstdint>
#include <memory>
#include <new>
#include <random>
#include <type_traits>

namespace {

using small_mt = std::mersenne_twister_engine<std::uint32_t, 32, 7, 3, 5,
    0x9908b0dfUL, 11, 0xffffffffUL, 7, 0x9d2c5680UL, 15, 0xefc60000UL, 18, 1812433253UL>;
using small_shuffle = std::shuffle_order_engine<std::minstd_rand0, 7>;
using full32 = std::linear_congruential_engine<std::uint32_t, 1664525, 1013904223, 0>;
using part32 = std::linear_congruential_engine<std::uint32_t, 65535, 65536, 65537>;
using promote32 = std::linear_congruential_engine<std::uint32_t, 4000000000UL, 3999999999UL, 4294967291UL>;
using full16 = std::linear_congruential_engine<unsigned short, 109, 89, 0>;
using promote16 = std::linear_congruential_engine<unsigned short, 40000, 39999, 65521>;

static_assert(sizeof(std::minstd_rand0::result_type) == 4);
static_assert(sizeof(std::minstd_rand::result_type) == 4);
static_assert(std::mt19937::word_size == 32 && std::mt19937::state_size == 624);
static_assert(std::mt19937::max() == 0xffffffffUL);
static_assert(std::knuth_b::table_size == 256);
// Full MT states exceed AVM's RAM. Small-state instances exercise the same
// 32-bit recurrence; the standard aliases retain their required parameters.
static_assert(sizeof(std::mt19937) == 2498);

// Independent fixed-width sequences from the host standard library. The last
// entry follows the first eight draws and discard(31), including ranlux blocks.
constexpr std::minstd_rand0::result_type expected_minstd0[] = {
    16807ULL, 282475249ULL, 1622650073ULL, 984943658ULL, 1144108930ULL, 470211272ULL, 101027544ULL, 1457850878ULL, 784558821ULL};
constexpr std::minstd_rand::result_type expected_minstd[] = {
    48271ULL, 182605794ULL, 1291394886ULL, 1914720637ULL, 2078669041ULL, 407355683ULL, 1105902161ULL, 854716505ULL, 201068705ULL};
constexpr std::ranlux24_base::result_type expected_ranlux24_base[] = {
    15039276ULL, 16323925ULL, 14283486ULL, 7150092ULL, 68089ULL, 8584138ULL, 4918023ULL, 11368221ULL, 14768636ULL};
constexpr std::ranlux48_base::result_type expected_ranlux48_base[] = {
    23459059301164ULL, 28639057539807ULL, 276846226770426ULL, 130971693943559ULL, 84358451161020ULL, 208150879060961ULL, 71914269758754ULL, 242506792212635ULL, 275837149765972ULL};
constexpr std::ranlux24::result_type expected_ranlux24[] = {
    15039276ULL, 16323925ULL, 14283486ULL, 7150092ULL, 68089ULL, 8584138ULL, 4918023ULL, 11368221ULL, 14481645ULL};
constexpr std::ranlux48::result_type expected_ranlux48[] = {
    23459059301164ULL, 28639057539807ULL, 276846226770426ULL, 130971693943559ULL, 84358451161020ULL, 208150879060961ULL, 71914269758754ULL, 242506792212635ULL, 238433913821881ULL};
constexpr small_mt::result_type expected_small_mt[] = {
    204229776ULL, 1348142217ULL, 405137634ULL, 4125885380ULL, 25500030ULL, 908064558ULL, 3784578481ULL, 3995055988ULL, 4106442374ULL};
constexpr small_shuffle::result_type expected_small_shuffle[] = {
    1144108930ULL, 984943658ULL, 2007237709ULL, 101027544ULL, 16807ULL, 1784484492ULL, 470211272ULL, 282475249ULL, 1356425228ULL};
constexpr full32::result_type expected_full32[] = {
    1015568748ULL, 1586005467ULL, 2165703038ULL, 3027450565ULL, 217083232ULL, 1587069247ULL, 3327581586ULL, 2388811721ULL, 3055474921ULL};
constexpr part32::result_type expected_part32[] = {
    65534ULL, 5ULL, 65526ULL, 21ULL, 65494ULL, 85ULL, 65366ULL, 341ULL, 341ULL};
constexpr promote32::result_type expected_promote32[] = {
    3705032708ULL, 2566008944ULL, 3976367830ULL, 1272481169ULL, 3323201959ULL, 4112118671ULL, 815143676ULL, 3560306971ULL, 3933839043ULL};
constexpr full16::result_type expected_full16[] = {
    198ULL, 21671ULL, 2932ULL, 57533ULL, 45266ULL, 18883ULL, 26720ULL, 28985ULL, 19481ULL};
constexpr promote16::result_type expected_promote16[] = {
    14478ULL, 19880ULL, 11622ULL, 48504ULL, 57668ULL, 27673ULL, 48225ULL, 36238ULL, 10977ULL};

template<class Engine> __attribute__((noinline)) int sequence(const typename Engine::result_type* expected)
{
    alignas(Engine) static unsigned char storage[sizeof(Engine)];
    auto* engine = ::new (static_cast<void*>(storage)) Engine();
    int result = 0;
    for(unsigned i = 0; i != 8; ++i)
        if((*engine)() != expected[i])
            result = 1;
    engine->discard(31);
    if((*engine)() != expected[8])
        result = 2;
    std::destroy_at(engine);
    return result;
}

template<class Engine> __attribute__((noinline)) int minstd_long_run(typename Engine::result_type expected)
{
    Engine engine;
    engine.discard(9999);
    if(engine() != expected)
        return 1;
    engine.seed(0);
    if(engine() != Engine::multiplier)
        return 2;
    auto copy = engine;
    engine.discard(3);
    (void)copy();
    (void)copy();
    (void)copy();
    return engine == copy && engine() == copy() ? 0 : 3;
}

constexpr std::ranlux48_base::result_type expected_wide48[] = {
    102559499229719ULL, 268706576733739ULL, 37358452167259ULL, 146820588319972ULL, 120152414401116ULL, 253899509716218ULL, 250078794712628ULL, 109005712464699ULL, 46837622397442ULL};

__attribute__((noinline)) int wide_seed()
{
    alignas(std::ranlux48_base) static unsigned char storage[sizeof(std::ranlux48_base)];
    auto* engine = ::new (static_cast<void*>(storage)) std::ranlux48_base(0xfedcba9876543210ULL);
    int result = 0;
    for(unsigned i = 0; i != 8; ++i)
        if((*engine)() != expected_wide48[i])
            result = 1;
    engine->discard(31);
    if((*engine)() != expected_wide48[8])
        result = 2;
    std::destroy_at(engine);
    return result;
}

const std::uint32_t seed_input[] = {0, 1, 0x12345678UL, 0xffffffffUL};
std::uint32_t seed_output[8];
constexpr std::uint32_t seed_expected[] = {
    382721695UL, 3807779559UL, 201268064UL, 1382660930UL, 3901861073UL, 3233963058UL, 830822225UL, 2171902232UL};

__attribute__((noinline)) int seed_sequence()
{
    std::seed_seq seeds(seed_input, seed_input + 4);
    seeds.generate(seed_output, seed_output + 8);
    for(unsigned i = 0; i != 8; ++i)
        if(seed_output[i] != seed_expected[i])
            return 1;
    seeds.param(seed_output);
    for(unsigned i = 0; i != 4; ++i)
        if(seed_output[i] != seed_input[i])
            return 2;
    return seeds.size() == 4 ? 0 : 3;
}

}

extern "C" int avm_test_main()
{
    if(sequence<std::minstd_rand0>(expected_minstd0) != 0)
        return 1;
    if(sequence<std::minstd_rand>(expected_minstd) != 0)
        return 1;
    if(sequence<std::ranlux24_base>(expected_ranlux24_base) != 0)
        return 1;
    if(sequence<std::ranlux48_base>(expected_ranlux48_base) != 0)
        return 1;
    if(sequence<std::ranlux24>(expected_ranlux24) != 0)
        return 1;
    if(sequence<std::ranlux48>(expected_ranlux48) != 0)
        return 1;
    if(sequence<small_mt>(expected_small_mt) != 0)
        return 1;
    if(sequence<small_shuffle>(expected_small_shuffle) != 0)
        return 1;
    if(sequence<full32>(expected_full32) != 0)
        return 1;
    if(sequence<part32>(expected_part32) != 0)
        return 1;
    if(sequence<promote32>(expected_promote32) != 0)
        return 1;
    if(sequence<full16>(expected_full16) != 0)
        return 1;
    if(sequence<promote16>(expected_promote16) != 0)
        return 1;
    if(minstd_long_run<std::minstd_rand0>(1043618065UL) != 0 ||
       minstd_long_run<std::minstd_rand>(399268537UL) != 0)
        return 2;
    if(wide_seed() != 0 || sequence<std::default_random_engine>(expected_minstd) != 0)
        return 4;
    return seed_sequence() == 0 ? 0 : 3;
}
