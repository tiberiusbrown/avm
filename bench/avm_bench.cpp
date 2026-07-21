#include <absim.hpp>

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

#ifndef AVM_BENCH_C_DIR
#error "AVM_BENCH_C_DIR must be defined by CMake"
#endif

#ifndef AVM_BENCH_C_BIN_DIR
#error "AVM_BENCH_C_BIN_DIR must be defined by CMake"
#endif

#ifndef AVM_BENCH_BASELINE_BIN
#error "AVM_BENCH_BASELINE_BIN must be defined by CMake"
#endif

#ifndef AVM_BENCH_INTERPRETER_HEX
#error "AVM_BENCH_INTERPRETER_HEX must be defined by CMake"
#endif

#ifndef AVM_BENCH_OUTPUT
#error "AVM_BENCH_OUTPUT must be defined by CMake"
#endif

namespace {

constexpr std::uint64_t kAdvanceLimit = 10'000'000'000'000ull;

struct options_t {
    std::filesystem::path interpreter = AVM_BENCH_INTERPRETER_HEX;
    std::filesystem::path source_dir = AVM_BENCH_C_DIR;
    std::filesystem::path image_dir = AVM_BENCH_C_BIN_DIR;
    std::filesystem::path baseline = AVM_BENCH_BASELINE_BIN;
    std::filesystem::path output = AVM_BENCH_OUTPUT;
};

struct benchmark_t {
    std::string name;
    std::filesystem::path source;
    std::filesystem::path image;
};

[[noreturn]] void usage_error(std::string const& message)
{
    throw std::runtime_error(
        message +
        "\nUsage: avm_bench [--interpreter FILE] [--source-dir DIR] "
        "[--image-dir DIR] [--baseline FILE] [--output FILE]");
}

options_t parse_options(int argc, char** argv)
{
    options_t options;

    for(int i = 1; i < argc; ++i)
    {
        std::string_view arg(argv[i]);
        auto require_value = [&](std::string_view option) -> std::filesystem::path {
            if(i + 1 >= argc)
                usage_error("Missing value for " + std::string(option));
            return argv[++i];
        };

        if(arg == "--interpreter")
            options.interpreter = require_value(arg);
        else if(arg == "--source-dir")
            options.source_dir = require_value(arg);
        else if(arg == "--image-dir")
            options.image_dir = require_value(arg);
        else if(arg == "--baseline")
            options.baseline = require_value(arg);
        else if(arg == "--output")
            options.output = require_value(arg);
        else if(arg == "-h" || arg == "--help")
        {
            std::cout
                << "Usage: avm_bench [--interpreter FILE] [--source-dir DIR] "
                   "[--image-dir DIR] [--baseline FILE] [--output FILE]\n";
            std::exit(0);
        }
        else
            usage_error("Unknown option: " + std::string(arg));
    }

    return options;
}

std::vector<benchmark_t> discover_benchmarks(
    std::filesystem::path const& source_dir,
    std::filesystem::path const& image_dir)
{
    if(!std::filesystem::is_directory(source_dir))
    {
        throw std::runtime_error(
            "Benchmark source directory does not exist: " +
            source_dir.string());
    }

    std::vector<benchmark_t> benchmarks;
    for(auto const& entry : std::filesystem::directory_iterator(source_dir))
    {
        if(!entry.is_regular_file() || entry.path().extension() != ".c")
            continue;

        std::filesystem::path const source = entry.path();
        benchmarks.push_back({
            source.stem().string(),
            source,
            image_dir / (source.stem().string() + ".bin")});
    }

    std::sort(
        benchmarks.begin(), benchmarks.end(),
        [](benchmark_t const& lhs, benchmark_t const& rhs) {
            return lhs.source.filename() < rhs.source.filename();
        });

    if(benchmarks.empty())
    {
        throw std::runtime_error(
            "No C benchmark sources found in " + source_dir.string());
    }

    return benchmarks;
}

void load_file(
    absim::arduboy_t& arduboy,
    std::filesystem::path const& filename,
    char const* synthetic_name)
{
    std::ifstream input(filename, std::ios::binary);
    if(!input)
        throw std::runtime_error("Unable to open input file: " + filename.string());

    std::string error = arduboy.load_file(synthetic_name, input);
    if(!error.empty())
    {
        throw std::runtime_error(
            "Ardens could not load " + filename.string() + ": " + error);
    }
}

void suppress_interrupt_noise(absim::arduboy_t& arduboy)
{
    auto& data = arduboy.core_state.cpu.data;

    // Benchmark interpreter execution only, not asynchronous AVR interrupt
    // service time.
    data[absim::reg::addr::SREG] &= ~absim::reg::bit::SREG::I;
    data[0x6e] = 0;
    data[0x6f] = 0;
    data[0x71] = 0;
    data[0x72] = 0;
}

void run_to_debug_break(absim::arduboy_t& arduboy)
{
    suppress_interrupt_noise(arduboy);
    arduboy.debugger_state.allow_nonstep_breakpoints = true;
    arduboy.core_state.cpu.enabled_autobreaks.set(absim::AB_BREAK);
    arduboy.debugger_state.paused = false;
    arduboy.advance(kAdvanceLimit);

    if(!arduboy.debugger_state.paused)
    {
        throw std::runtime_error(
            "The emulator did not reach SYS DEBUG_BREAK before the cycle limit");
    }
}

std::uint64_t measure_image(
    std::filesystem::path const& interpreter,
    std::filesystem::path const& image)
{
    auto arduboy = std::make_unique<absim::arduboy_t>();
    arduboy->reset();

    // The interpreter is the ATmega32U4 program. The generated AVM image is
    // loaded as FX data, matching the normal AVM test startup path.
    load_file(*arduboy, interpreter, "interpreter.hex");
    load_file(*arduboy, image, "fxdata.bin");

    // Startup and benchmark setup execute before the first call. Only the
    // interval between the source program's two DEBUG_BREAK calls is measured.
    run_to_debug_break(*arduboy);
    std::uint64_t const begin = arduboy->core_state.cpu.cycle_count;

    run_to_debug_break(*arduboy);
    std::uint64_t const end = arduboy->core_state.cpu.cycle_count;

    if(end < begin)
        throw std::runtime_error("Ardens cycle counter moved backwards");
    return end - begin;
}

} // namespace

int main(int argc, char** argv)
{
    try
    {
        options_t const options = parse_options(argc, argv);
        std::vector<benchmark_t> const benchmarks =
            discover_benchmarks(options.source_dir, options.image_dir);

        std::filesystem::path const output_parent = options.output.parent_path();
        if(!output_parent.empty())
            std::filesystem::create_directories(output_parent);

        std::ofstream output(options.output);
        if(!output)
        {
            throw std::runtime_error(
                "Unable to create output file: " + options.output.string());
        }

        std::cout << "Running AVM C benchmarks...\n";
        std::cout << "  interpreter: " << options.interpreter << '\n';
        std::cout << "  sources:     " << options.source_dir << '\n';
        std::cout << "  images:      " << options.image_dir << '\n';
        std::cout << "  output:      " << options.output << "\n\n";

        std::uint64_t const baseline =
            measure_image(options.interpreter, options.baseline);

        for(std::size_t i = 0; i < benchmarks.size(); ++i)
        {
            benchmark_t const& benchmark = benchmarks[i];
            std::uint64_t const raw =
                measure_image(options.interpreter, benchmark.image);

            if(raw < baseline)
            {
                std::ostringstream message;
                message << "Raw interval for benchmark " << benchmark.name
                        << " was " << raw << " cycles, below the "
                        << baseline << "-cycle DEBUG_BREAK baseline";
                throw std::runtime_error(message.str());
            }

            std::uint64_t const cycles = raw - baseline;
            output << std::setw(12) << cycles << "   "
                   << benchmark.source.filename().string() << '\n';
            std::cout << std::setw(3) << (i + 1) << "  "
                      << std::setw(12) << cycles << " cycles   "
                      << benchmark.source.filename().string() << '\n';
        }

        output.flush();
        if(!output)
            throw std::runtime_error("Failed while writing " + options.output.string());

        std::cout << "\nDEBUG_BREAK baseline: " << baseline << " cycles\n";
        std::cout << "Wrote " << benchmarks.size() << " timings to "
                  << options.output << '\n';
        return 0;
    }
    catch(std::exception const& error)
    {
        std::cerr << "avm_bench: error: " << error.what() << '\n';
        return 1;
    }
}
