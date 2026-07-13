#include <absim.hpp>

#include <cctype>
#include <cinttypes>
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

#ifndef AVM_BENCH_DIR
#error "AVM_BENCH_DIR must be defined by CMake"
#endif

#ifndef AVM_BENCH_INSTRUCTIONS_BIN
#error "AVM_BENCH_INSTRUCTIONS_BIN must be defined by CMake"
#endif

#ifndef AVM_BENCH_INTERPRETER_HEX
#error "AVM_BENCH_INTERPRETER_HEX must be defined by CMake"
#endif

namespace {

constexpr std::uint64_t kAdvanceLimit = 10'000'000'000'000ull;
constexpr std::size_t kExpectedBenchmarkCount = 100;

struct options_t {
    std::filesystem::path interpreter = AVM_BENCH_INTERPRETER_HEX;
    std::filesystem::path image = AVM_BENCH_INSTRUCTIONS_BIN;
    std::filesystem::path names =
        std::filesystem::path(AVM_BENCH_DIR) / "benchmark_names.txt";
    std::filesystem::path output =
        std::filesystem::path(AVM_BENCH_DIR) / "cycles_instruction.txt";
};

[[noreturn]] void usage_error(std::string const& message)
{
    throw std::runtime_error(
        message +
        "\nUsage: avm_bench [--interpreter FILE] [--image FILE] "
        "[--names FILE] [--output FILE]");
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
        else if(arg == "--image")
            options.image = require_value(arg);
        else if(arg == "--names")
            options.names = require_value(arg);
        else if(arg == "--output")
            options.output = require_value(arg);
        else if(arg == "-h" || arg == "--help")
        {
            std::cout
                << "Usage: avm_bench [--interpreter FILE] [--image FILE] "
                   "[--names FILE] [--output FILE]\n";
            std::exit(0);
        }
        else
            usage_error("Unknown option: " + std::string(arg));
    }

    return options;
}

std::vector<std::string> read_benchmark_names(
    std::filesystem::path const& filename)
{
    std::ifstream input(filename);
    if(!input)
        throw std::runtime_error(
            "Unable to open benchmark-name file: " + filename.string());

    std::vector<std::string> names;
    std::string line;
    while(std::getline(input, line))
    {
        if(!line.empty() && line.back() == '\r')
            line.pop_back();
        if(line.empty())
            continue;

        // benchmark_names.txt uses "001 NAME".  Strip the stable numeric
        // ordering prefix before writing the result file.
        std::size_t begin = 0;
        while(begin < line.size() &&
              std::isdigit(static_cast<unsigned char>(line[begin])))
            ++begin;
        while(begin < line.size() &&
              std::isspace(static_cast<unsigned char>(line[begin])))
            ++begin;

        if(begin == line.size())
            throw std::runtime_error(
                "Malformed benchmark-name line: " + line);
        names.emplace_back(line.substr(begin));
    }

    if(names.size() != kExpectedBenchmarkCount)
    {
        std::ostringstream message;
        message << "Expected " << kExpectedBenchmarkCount
                << " benchmark names, but found " << names.size()
                << " in " << filename;
        throw std::runtime_error(message.str());
    }

    return names;
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

    // Match the established ABC cycle benchmark.  The VM benchmark is meant
    // to measure interpreter instruction latency, not interrupt service time.
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

std::uint64_t measure_next_interval(absim::arduboy_t& arduboy)
{
    // First run through any setup code to the break immediately preceding the
    // instruction under test.  Setup latency is therefore excluded.
    run_to_debug_break(arduboy);
    std::uint64_t const begin = arduboy.core_state.cpu.cycle_count;

    // Resume through the tested instruction to its following break.
    run_to_debug_break(arduboy);
    std::uint64_t const end = arduboy.core_state.cpu.cycle_count;

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
        std::vector<std::string> const names =
            read_benchmark_names(options.names);

        auto arduboy = std::make_unique<absim::arduboy_t>();
        arduboy->reset();

        // The interpreter is the ATmega32U4 program.  The generated AVM image
        // is loaded as FX data, matching the emulator startup path used by the
        // existing AVM test driver and the earlier ABC benchmark harness.
        load_file(*arduboy, options.interpreter, "interpreter.hex");
        load_file(*arduboy, options.image, "fxdata.bin");

        std::filesystem::path const output_parent = options.output.parent_path();
        if(!output_parent.empty())
            std::filesystem::create_directories(output_parent);

        std::ofstream output(options.output);
        if(!output)
            throw std::runtime_error(
                "Unable to create output file: " + options.output.string());

        std::cout << "Running AVM instruction-cycle benchmarks...\n";
        std::cout << "  interpreter: " << options.interpreter << '\n';
        std::cout << "  image:       " << options.image << '\n';
        std::cout << "  output:      " << options.output << "\n\n";

        // Consume the assembly's warm-up interval, then measure the adjacent
        // DEBUG_BREAK-to-DEBUG_BREAK baseline.  Every ordinary interval has
        // one trailing DEBUG_BREAK, so subtracting this baseline isolates the
        // bytecode instruction latency just as in abc_benchmarks.cpp.
        (void)measure_next_interval(*arduboy);
        std::uint64_t const baseline = measure_next_interval(*arduboy);

        auto write_result = [&](std::size_t index,
                                std::uint64_t cycles,
                                std::uint64_t raw_cycles) {
            output << std::setw(5) << cycles << "   " << names[index] << '\n';
            std::cout << std::setw(3) << (index + 1) << "  "
                      << std::setw(5) << cycles << " cycles   "
                      << names[index];
            //if(index != 0)
            //    std::cout << "  (raw " << raw_cycles << ')';
            std::cout << '\n';
        };

        // Entry 001 is SYS DEBUG_BREAK itself, represented by the measured
        // baseline rather than baseline-baseline (zero).
        write_result(0, baseline, baseline);

        for(std::size_t i = 1; i < names.size(); ++i)
        {
            std::uint64_t const raw = measure_next_interval(*arduboy);
            if(raw < baseline)
            {
                std::ostringstream message;
                message << "Raw interval for benchmark " << (i + 1)
                        << " (" << names[i] << ") was " << raw
                        << " cycles, below the " << baseline
                        << "-cycle DEBUG_BREAK baseline";
                throw std::runtime_error(message.str());
            }
            write_result(i, raw - baseline, raw);
        }

        output.flush();
        if(!output)
            throw std::runtime_error("Failed while writing " + options.output.string());

        std::cout << "\nDEBUG_BREAK baseline: " << baseline << " cycles\n";
        std::cout << "Wrote " << names.size() << " timings to "
                  << options.output << '\n';
        return 0;
    }
    catch(std::exception const& error)
    {
        std::cerr << "avm_bench: error: " << error.what() << '\n';
        return 1;
    }
}
