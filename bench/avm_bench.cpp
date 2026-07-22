#include <absim.hpp>

#include <algorithm>
#include <cctype>
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

#ifndef AVM_BENCH_INSTRUCTIONS_BIN
#error "AVM_BENCH_INSTRUCTIONS_BIN must be defined by CMake"
#endif

#ifndef AVM_BENCH_INSTRUCTION_NAMES
#error "AVM_BENCH_INSTRUCTION_NAMES must be defined by CMake"
#endif

#ifndef AVM_BENCH_INSTRUCTION_OUTPUT
#error "AVM_BENCH_INSTRUCTION_OUTPUT must be defined by CMake"
#endif

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

#ifndef AVM_BENCH_C_OUTPUT
#ifdef AVM_BENCH_OUTPUT
#define AVM_BENCH_C_OUTPUT AVM_BENCH_OUTPUT
#else
#error "AVM_BENCH_C_OUTPUT must be defined by CMake"
#endif
#endif

namespace {

namespace fs = std::filesystem;

constexpr std::uint64_t kAdvanceLimit = 10'000'000'000'000ull;

struct options_t {
    fs::path interpreter = AVM_BENCH_INTERPRETER_HEX;

    fs::path instruction_image = AVM_BENCH_INSTRUCTIONS_BIN;
    fs::path instruction_names = AVM_BENCH_INSTRUCTION_NAMES;
    fs::path instruction_output = AVM_BENCH_INSTRUCTION_OUTPUT;

    fs::path c_source_dir = AVM_BENCH_C_DIR;
    fs::path c_image_dir = AVM_BENCH_C_BIN_DIR;
    fs::path c_baseline = AVM_BENCH_BASELINE_BIN;
    fs::path c_output = AVM_BENCH_C_OUTPUT;

    bool run_instructions = true;
    bool run_c = true;
};

struct c_benchmark_t {
    std::string name;
    fs::path source;
    fs::path image;
};

std::string usage_text()
{
    return
        "Usage: avm_bench [--interpreter FILE] "
        "[--instruction-image FILE] [--instruction-names FILE] "
        "[--instruction-output FILE] [--c-source-dir DIR] "
        "[--c-image-dir DIR] [--c-baseline FILE] [--c-output FILE] "
        "[--instruction-only | --c-only]";
}

[[noreturn]] void usage_error(std::string const& message)
{
    throw std::runtime_error(message + '\n' + usage_text());
}

options_t parse_options(int argc, char** argv)
{
    options_t options;

    for(int i = 1; i < argc; ++i)
    {
        std::string_view arg(argv[i]);
        auto require_value = [&](std::string_view option) -> fs::path {
            if(i + 1 >= argc)
                usage_error("Missing value for " + std::string(option));
            return argv[++i];
        };

        if(arg == "--interpreter")
            options.interpreter = require_value(arg);
        else if(arg == "--instruction-image" || arg == "--image")
            options.instruction_image = require_value(arg);
        else if(arg == "--instruction-names" || arg == "--names")
            options.instruction_names = require_value(arg);
        else if(arg == "--instruction-output")
            options.instruction_output = require_value(arg);
        else if(arg == "--c-source-dir" || arg == "--source-dir")
            options.c_source_dir = require_value(arg);
        else if(arg == "--c-image-dir" || arg == "--image-dir")
            options.c_image_dir = require_value(arg);
        else if(arg == "--c-baseline" || arg == "--baseline")
            options.c_baseline = require_value(arg);
        else if(arg == "--c-output" || arg == "--output")
            options.c_output = require_value(arg);
        else if(arg == "--instruction-only")
        {
            options.run_instructions = true;
            options.run_c = false;
        }
        else if(arg == "--c-only")
        {
            options.run_instructions = false;
            options.run_c = true;
        }
        else if(arg == "-h" || arg == "--help")
        {
            std::cout << usage_text() << '\n';
            std::exit(0);
        }
        else
            usage_error("Unknown option: " + std::string(arg));
    }

    return options;
}

fs::path require_file(fs::path const& path, std::string_view description)
{
    std::error_code ec;
    fs::path const absolute = fs::absolute(path, ec);
    if(ec)
    {
        throw std::runtime_error(
            "Unable to resolve " + std::string(description) + ": " +
            path.string() + ": " + ec.message());
    }
    if(!fs::is_regular_file(absolute, ec) || ec)
    {
        throw std::runtime_error(
            std::string(description) + " does not exist: " + absolute.string());
    }
    return absolute;
}

fs::path require_directory(fs::path const& path, std::string_view description)
{
    std::error_code ec;
    fs::path const absolute = fs::absolute(path, ec);
    if(ec)
    {
        throw std::runtime_error(
            "Unable to resolve " + std::string(description) + ": " +
            path.string() + ": " + ec.message());
    }
    if(!fs::is_directory(absolute, ec) || ec)
    {
        throw std::runtime_error(
            std::string(description) + " does not exist: " + absolute.string());
    }
    return absolute;
}

std::ofstream open_output(fs::path const& filename)
{
    fs::path const parent = filename.parent_path();
    if(!parent.empty())
        fs::create_directories(parent);

    std::ofstream output(filename);
    if(!output)
        throw std::runtime_error("Unable to create output file: " + filename.string());
    return output;
}

std::vector<std::string> read_benchmark_names(fs::path const& filename)
{
    std::ifstream input(filename);
    if(!input)
    {
        throw std::runtime_error(
            "Unable to open benchmark-name file: " + filename.string());
    }

    std::vector<std::string> names;
    std::string line;
    while(std::getline(input, line))
    {
        if(!line.empty() && line.back() == '\r')
            line.pop_back();
        if(line.empty())
            continue;

        // benchmark_names.txt uses "001 NAME". Strip the stable numeric
        // ordering prefix before writing the result file.
        std::size_t begin = 0;
        while(begin < line.size() &&
              std::isdigit(static_cast<unsigned char>(line[begin])))
            ++begin;
        while(begin < line.size() &&
              std::isspace(static_cast<unsigned char>(line[begin])))
            ++begin;

        if(begin == line.size())
            throw std::runtime_error("Malformed benchmark-name line: " + line);
        names.emplace_back(line.substr(begin));
    }

    if(names.empty())
    {
        throw std::runtime_error(
            "No instruction benchmark names found in " + filename.string());
    }
    return names;
}

std::vector<c_benchmark_t> discover_c_benchmarks(
    fs::path const& source_dir,
    fs::path const& image_dir)
{
    std::vector<c_benchmark_t> benchmarks;
    for(auto const& entry : fs::directory_iterator(source_dir))
    {
        if(!entry.is_regular_file() || entry.path().extension() != ".c")
            continue;

        fs::path const source = entry.path();
        benchmarks.push_back({
            source.stem().string(),
            source,
            image_dir / (source.stem().string() + ".bin")});
    }

    std::sort(
        benchmarks.begin(), benchmarks.end(),
        [](c_benchmark_t const& lhs, c_benchmark_t const& rhs) {
            return lhs.source.filename() < rhs.source.filename();
        });

    if(benchmarks.empty())
    {
        throw std::runtime_error(
            "No C benchmark sources found in " + source_dir.string());
    }

    for(c_benchmark_t& benchmark : benchmarks)
        benchmark.image = require_file(benchmark.image, "C benchmark image");
    return benchmarks;
}

void load_file(
    absim::arduboy_t& arduboy,
    fs::path const& filename,
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

std::uint64_t measure_next_interval(absim::arduboy_t& arduboy)
{
    // Run through setup to the break immediately preceding the interval.
    run_to_debug_break(arduboy);
    std::uint64_t const begin = arduboy.core_state.cpu.cycle_count;

    run_to_debug_break(arduboy);
    std::uint64_t const end = arduboy.core_state.cpu.cycle_count;

    if(end < begin)
        throw std::runtime_error("Ardens cycle counter moved backwards");
    return end - begin;
}

std::uint64_t measure_image(fs::path const& interpreter, fs::path const& image)
{
    auto arduboy = std::make_unique<absim::arduboy_t>();
    arduboy->reset();

    // The interpreter is the ATmega32U4 program. The AVM image is loaded as FX
    // data, matching the normal AVM test startup path.
    load_file(*arduboy, interpreter, "interpreter.hex");
    load_file(*arduboy, image, "fxdata.bin");

    run_to_debug_break(*arduboy);
    std::uint64_t const begin = arduboy->core_state.cpu.cycle_count;

    run_to_debug_break(*arduboy);
    std::uint64_t const end = arduboy->core_state.cpu.cycle_count;

    if(end < begin)
        throw std::runtime_error("Ardens cycle counter moved backwards");
    return end - begin;
}

void run_instruction_benchmarks(options_t const& options)
{
    std::vector<std::string> const names =
        read_benchmark_names(options.instruction_names);

    auto arduboy = std::make_unique<absim::arduboy_t>();
    arduboy->reset();
    load_file(*arduboy, options.interpreter, "interpreter.hex");
    load_file(*arduboy, options.instruction_image, "fxdata.bin");

    std::ofstream output = open_output(options.instruction_output);

    std::cout << "Running AVM instruction-cycle benchmarks...\n";
    std::cout << "  interpreter: " << options.interpreter << '\n';
    std::cout << "  image:       " << options.instruction_image << '\n';
    std::cout << "  names:       " << options.instruction_names << '\n';
    std::cout << "  output:      " << options.instruction_output << "\n\n";

    // Consume the assembly warm-up interval, then measure the adjacent
    // DEBUG_BREAK-to-DEBUG_BREAK baseline. Every subsequent interval has one
    // trailing DEBUG_BREAK, so subtracting this baseline isolates the tested
    // instruction latency.
    (void)measure_next_interval(*arduboy);
    std::uint64_t const baseline = measure_next_interval(*arduboy);

    auto write_result = [&](std::size_t index, std::uint64_t cycles) {
        output << std::setw(5) << cycles << "   " << names[index] << '\n';
        std::cout << std::setw(3) << (index + 1) << "  "
                  << std::setw(5) << cycles << " cycles   "
                  << names[index] << '\n';
    };

    // Entry 001 is SYS DEBUG_BREAK itself, represented by the measured
    // baseline rather than baseline minus itself.
    write_result(0, baseline);

    for(std::size_t i = 1; i < names.size(); ++i)
    {
        std::uint64_t const raw = measure_next_interval(*arduboy);
        if(raw < baseline)
        {
            std::ostringstream message;
            message << "Raw interval for instruction benchmark " << (i + 1)
                    << " (" << names[i] << ") was " << raw
                    << " cycles, below the " << baseline
                    << "-cycle DEBUG_BREAK baseline";
            throw std::runtime_error(message.str());
        }
        write_result(i, raw - baseline);
    }

    output.flush();
    if(!output)
    {
        throw std::runtime_error(
            "Failed while writing " + options.instruction_output.string());
    }

    std::cout << "\nInstruction DEBUG_BREAK baseline: " << baseline
              << " cycles\n";
    std::cout << "Wrote " << names.size() << " instruction timings to "
              << options.instruction_output << "\n\n";
}

void run_c_benchmarks(options_t const& options)
{
    std::vector<c_benchmark_t> const benchmarks =
        discover_c_benchmarks(options.c_source_dir, options.c_image_dir);
    std::ofstream output = open_output(options.c_output);

    std::cout << "Running AVM C benchmarks...\n";
    std::cout << "  interpreter: " << options.interpreter << '\n';
    std::cout << "  sources:     " << options.c_source_dir << '\n';
    std::cout << "  images:      " << options.c_image_dir << '\n';
    std::cout << "  baseline:    " << options.c_baseline << '\n';
    std::cout << "  output:      " << options.c_output << "\n\n";

    std::uint64_t const baseline =
        measure_image(options.interpreter, options.c_baseline);

    for(std::size_t i = 0; i < benchmarks.size(); ++i)
    {
        c_benchmark_t const& benchmark = benchmarks[i];
        std::uint64_t const raw =
            measure_image(options.interpreter, benchmark.image);

        if(raw < baseline)
        {
            std::ostringstream message;
            message << "Raw interval for C benchmark " << benchmark.name
                    << " was " << raw << " cycles, below the " << baseline
                    << "-cycle DEBUG_BREAK baseline";
            throw std::runtime_error(message.str());
        }

        std::uint64_t const cycles = raw - baseline;
        output << std::setw(12) << cycles << "   "
               << benchmark.source.filename().string() << '\n';
        std::cout << std::setw(3) << (i + 1) << "  "
                  << std::setw(12) << cycles << " cycles   "
                  << benchmark.source.filename().string() << std::endl;
    }

    output.flush();
    if(!output)
        throw std::runtime_error("Failed while writing " + options.c_output.string());

    std::cout << "\nC DEBUG_BREAK baseline: " << baseline << " cycles\n";
    std::cout << "Wrote " << benchmarks.size() << " C timings to "
              << options.c_output << '\n';
}

} // namespace

int main(int argc, char** argv)
{
    try
    {
        options_t options = parse_options(argc, argv);
        options.interpreter = require_file(options.interpreter, "interpreter image");

        if(options.run_instructions)
        {
            options.instruction_image = require_file(
                options.instruction_image, "instruction benchmark image");
            options.instruction_names = require_file(
                options.instruction_names, "instruction benchmark-name file");
        }

        if(options.run_c)
        {
            options.c_source_dir = require_directory(
                options.c_source_dir, "C benchmark source directory");
            options.c_image_dir = require_directory(
                options.c_image_dir, "C benchmark image directory");
            options.c_baseline = require_file(
                options.c_baseline, "C benchmark baseline image");
        }

        if(options.run_instructions)
            run_instruction_benchmarks(options);
        if(options.run_c)
            run_c_benchmarks(options);
        return 0;
    }
    catch(std::exception const& error)
    {
        std::cerr << "avm_bench: error: " << error.what() << '\n';
        return 1;
    }
}
