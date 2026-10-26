#include <absim.hpp>
#include "../tests/runner_selection.h"

#include <algorithm>
#include <cctype>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <map>
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

#ifndef AVM_BENCH_CXX_DIR
#error "AVM_BENCH_CXX_DIR must be defined by CMake"
#endif

#ifndef AVM_BENCH_CXX_BIN_DIR
#error "AVM_BENCH_CXX_BIN_DIR must be defined by CMake"
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

#ifndef AVM_BENCH_CXX_OUTPUT
#error "AVM_BENCH_CXX_OUTPUT must be defined by CMake"
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
    fs::path cxx_source_dir = AVM_BENCH_CXX_DIR;
    fs::path cxx_image_dir = AVM_BENCH_CXX_BIN_DIR;
    fs::path cxx_output = AVM_BENCH_CXX_OUTPUT;

    bool run_instructions = true;
    bool run_c = true;
    bool run_cxx = true;
    fs::path stack_output;
    fs::path trace_output;
    runner_selection selection;
    bool instruction_output_explicit = false, c_output_explicit = false, cxx_output_explicit = false;
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
        "[--cpp-source-dir DIR] [--cpp-image-dir DIR] [--cpp-output FILE] "
        "[--stack-output FILE] [--trace-output FILE] [--instruction-only | --c-only | --cpp-only] [--filter REGEX] [--list]\n"
        "Filter searches source stems / instruction names. --list needs no built images.\n"
        "Filtered runs default to cycles_*.selected.txt; explicit output paths are used verbatim.\n"
        "Compiled benchmarks use AVM_OPT_LEVEL; --opt is only for avm_tests.";
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
            { options.instruction_output = require_value(arg); options.instruction_output_explicit = true; }
        else if(arg == "--c-source-dir" || arg == "--source-dir")
            options.c_source_dir = require_value(arg);
        else if(arg == "--c-image-dir" || arg == "--image-dir")
            options.c_image_dir = require_value(arg);
        else if(arg == "--c-baseline" || arg == "--baseline")
            options.c_baseline = require_value(arg);
        else if(arg == "--c-output" || arg == "--output")
            { options.c_output = require_value(arg); options.c_output_explicit = true; }
        else if(arg == "--cpp-source-dir")
            options.cxx_source_dir = require_value(arg);
        else if(arg == "--cpp-image-dir")
            options.cxx_image_dir = require_value(arg);
        else if(arg == "--cpp-output")
            { options.cxx_output = require_value(arg); options.cxx_output_explicit = true; }
        else if(arg == "--stack-output")
            options.stack_output = require_value(arg);
        else if(arg == "--trace-output")
            options.trace_output = require_value(arg);
        else if(arg == "--filter")
            options.selection.filter(require_value(arg).string());
        else if(arg == "--list")
            options.selection.list = true;
        else if(arg == "--instruction-only")
        {
            options.run_instructions = true;
            options.run_c = false;
            options.run_cxx = false;
        }
        else if(arg == "--c-only")
        {
            options.run_instructions = false;
            options.run_c = true;
            options.run_cxx = false;
        }
        else if(arg == "--cpp-only")
        {
            options.run_instructions = false;
            options.run_c = false;
            options.run_cxx = true;
        }
        else if(arg == "-h" || arg == "--help")
        {
            std::cout << usage_text() << '\n';
            std::exit(0);
        }
        else
            usage_error("Unknown option: " + std::string(arg));
    }

    if(!options.selection.expression.empty()) {
        auto selected_output = [](fs::path& path, bool explicit_path) {
            if(!explicit_path) path = path.parent_path() / (path.stem().string()+".selected"+path.extension().string());
        };
        selected_output(options.instruction_output, options.instruction_output_explicit);
        selected_output(options.c_output, options.c_output_explicit);
        selected_output(options.cxx_output, options.cxx_output_explicit);
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

std::vector<c_benchmark_t> discover_compiled_benchmarks(
    fs::path const& source_dir,
    fs::path const& image_dir,
    std::string_view extension,
    runner_selection const& selection)
{
    std::vector<c_benchmark_t> benchmarks;
    for(auto const& entry : fs::directory_iterator(source_dir))
    {
        if(!entry.is_regular_file() || entry.path().extension() != extension)
            continue;

        fs::path const source = entry.path();
        if(!selection.matches(source.stem().string())) continue;
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

// One sequential session per language. BIN loading and reset clear CPU and FX
// state; the unchanged interpreter is parsed/decoded only once. Never share this
// session between concurrent measurements.
struct compiled_session {
    std::unique_ptr<absim::arduboy_t> arduboy;
    double setup_seconds = 0, execution_seconds = 0;

    explicit compiled_session(fs::path const& interpreter)
    {
        auto start = std::chrono::steady_clock::now();
        arduboy = std::make_unique<absim::arduboy_t>();
        arduboy->reset();
        load_file(*arduboy, interpreter, "interpreter.hex");
        setup_seconds += std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count();
    }

    std::uint64_t measure(fs::path const& image)
{
    auto start = std::chrono::steady_clock::now();
    arduboy->reset();
    load_file(*arduboy, image, "fxdata.bin");
    auto loaded = std::chrono::steady_clock::now();
    setup_seconds += std::chrono::duration<double>(loaded-start).count();

    run_to_debug_break(*arduboy);
    std::uint64_t const begin = arduboy->core_state.cpu.cycle_count;

    run_to_debug_break(*arduboy);
    std::uint64_t const end = arduboy->core_state.cpu.cycle_count;

    if(end < begin)
        throw std::runtime_error("Ardens cycle counter moved backwards");
    execution_seconds += std::chrono::duration<double>(std::chrono::steady_clock::now()-loaded).count();
    return end - begin;
}
};

void run_instruction_benchmarks(options_t const& options, std::vector<std::string> const& names)
{

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

    std::size_t selected_count = 0;
    auto write_result = [&](std::size_t index, std::uint64_t cycles) {
        if(!options.selection.matches(names[index])) return;
        ++selected_count;
        output << std::setw(5) << cycles << "   " << names[index] << '\n';
        std::cout << std::setw(3) << (index + 1) << "  "
                  << std::setw(5) << cycles << " cycles   "
                  << names[index] << '\n';
    };

    // Entry 001 is SYS DEBUG_BREAK itself, represented by the measured
    // baseline rather than baseline minus itself.
    write_result(0, baseline);

    auto last = names.size()-1;
    while(last && !options.selection.matches(names[last])) --last;
    for(std::size_t i = 1; i <= last; ++i)
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
    std::cout << "Wrote " << selected_count << " instruction timings to "
              << options.instruction_output << "\n\n";
}

// A separate instruction-stepped pass leaves the normal cycle measurement
// unchanged. Y is the guest SP; the hardware SP tracks native helper scratch.
std::pair<unsigned, unsigned> measure_stack(options_t const& options, fs::path const& image,
    std::ofstream* trace, std::string const& name)
{
    auto e = std::make_unique<absim::arduboy_t>();
    e->reset();
    load_file(*e, options.interpreter, "interpreter.hex");
    load_file(*e, image, "fxdata.bin");
    run_to_debug_break(*e);
    auto& c = e->core_state.cpu;
    c.no_merged = true;
    c.autobreaks.reset();
    c.enabled_autobreaks.set(absim::AB_BREAK);
    unsigned minimum = 0xa00, native_minimum = c.sp(), native_start = c.sp();
    auto start = c.cycle_count;
    std::map<uint32_t, uint64_t> executions;
    do {
        // Fixed primary-table slots are guest instruction boundaries, matching
        // the debugger's Emulator::at_boundary()/snapshot() convention.
        if(trace && c.pc >= 0x100 && c.pc < 0x500 && (c.pc-0x100)%4 == 0) {
            uint32_t pc=uint32_t(c.data[4]) | uint32_t(c.data[5])<<8 | uint32_t(c.data[6])<<16;
            ++executions[pc];
        }
        e->cycle(); c.update_all();
        unsigned sp = unsigned(c.data[28]) | unsigned(c.data[29]) << 8;
        if(sp >= 0x900 && sp <= 0xa00) minimum = std::min(minimum, sp);
        native_minimum = std::min(native_minimum, unsigned(c.sp()));
        if(c.cycle_count-start > 160'000'000)
            throw std::runtime_error("Stack measurement did not reach DEBUG_BREAK");
    } while(!c.should_autobreak());
    if(!c.autobreaks.test(absim::AB_BREAK))
        throw std::runtime_error("Native fault during stack measurement");
    if(trace) for(auto const& entry : executions)
        *trace << name << '\t' << entry.first << '\t' << entry.second << '\n';
    return {0xa00-minimum, native_start-native_minimum};
}

void run_compiled_benchmarks(
    options_t const& options,
    fs::path const& source_dir,
    fs::path const& image_dir,
    fs::path const& output_file,
    std::vector<c_benchmark_t> const& benchmarks,
    std::string_view label)
{
    for(auto const& benchmark : benchmarks)
        require_file(benchmark.image, "compiled benchmark image");
    std::ofstream output = open_output(output_file);
    std::ofstream stack;
    std::ofstream trace;
    if(!options.trace_output.empty()) {
        trace.open(options.trace_output, std::ios::app);
        if(!trace) throw std::runtime_error("Cannot open instruction trace output");
        trace.seekp(0, std::ios::end);
        if(trace.tellp() == 0) trace << "benchmark\tpc\texecutions\n";
    }
    if(!options.stack_output.empty()) {
        stack.open(options.stack_output, std::ios::app);
        if(!stack) throw std::runtime_error("Cannot open stack measurement output");
        stack.seekp(0, std::ios::end);
        if(stack.tellp() == 0)
            stack << "benchmark\tguest_bytes\tnative_extra_bytes\n";
    }

    std::cout << "Running AVM " << label << " benchmarks...\n";
    std::cout << "  interpreter: " << options.interpreter << '\n';
    std::cout << "  sources:     " << source_dir << '\n';
    std::cout << "  images:      " << image_dir << '\n';
    std::cout << "  baseline:    " << options.c_baseline << '\n';
    std::cout << "  output:      " << output_file << "\n\n";

    compiled_session session(options.interpreter);
    std::uint64_t const baseline = session.measure(options.c_baseline);

    for(std::size_t i = 0; i < benchmarks.size(); ++i)
    {
        c_benchmark_t const& benchmark = benchmarks[i];
        std::uint64_t const raw =
            session.measure(require_file(benchmark.image, "compiled benchmark image"));

        if(raw < baseline)
        {
            std::ostringstream message;
            message << "Raw interval for " << label << " benchmark " << benchmark.name
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
        if(stack.is_open() || trace.is_open()) {
            auto usage = measure_stack(options, benchmark.image, trace.is_open() ? &trace : nullptr, benchmark.name);
            if(stack.is_open()) stack << benchmark.name << '\t' << usage.first << '\t' << usage.second << '\n';
        }
    }

    output.flush();
    if(!output)
        throw std::runtime_error("Failed while writing " + output_file.string());

    std::cout << '\n' << label << " DEBUG_BREAK baseline: " << baseline
              << " cycles\n";
    std::cout << "Wrote " << benchmarks.size() << ' ' << label << " timings to "
              << output_file << '\n';
    std::cout << "Emulator setup/image loading: " << session.setup_seconds
              << " s; execution: " << session.execution_seconds << " s (sequential session)\n";
}

} // namespace

int main(int argc, char** argv)
{
    try
    {
        options_t options = parse_options(argc, argv);
        std::vector<std::string> names;
        std::vector<c_benchmark_t> c, cpp;
        if(options.run_instructions) names = read_benchmark_names(options.instruction_names);
        if(options.run_c) c = discover_compiled_benchmarks(options.c_source_dir, options.c_image_dir, ".c", options.selection);
        if(options.run_cxx) cpp = discover_compiled_benchmarks(options.cxx_source_dir, options.cxx_image_dir, ".cpp", options.selection);
        auto instruction_count = std::count_if(names.begin(), names.end(), [&](std::string const& name) {
            return options.selection.matches(name);
        });
        if(c.empty() && cpp.empty() && !instruction_count)
            throw std::runtime_error("No benchmarks match the requested selection");
        options.run_instructions = instruction_count != 0;
        options.run_c = !c.empty();
        options.run_cxx = !cpp.empty();
        if(options.selection.list) {
            for(auto const& name : names) if(options.selection.matches(name)) std::cout << "[ASM] " << name << '\n';
            for(auto const& b : c) std::cout << "[C " AVM_BENCH_OPT_LEVEL "] " << b.name << '\n';
            for(auto const& b : cpp) std::cout << "[C++ " AVM_BENCH_OPT_LEVEL "] " << b.name << '\n';
            return 0;
        }
        runner_elapsed elapsed;
        options.interpreter = require_file(options.interpreter, "interpreter image");

        if(options.run_instructions)
        {
            options.instruction_image = require_file(
                options.instruction_image, "instruction benchmark image");
            options.instruction_names = require_file(
                options.instruction_names, "instruction benchmark-name file");
        }

        if(options.run_c || options.run_cxx)
            options.c_baseline = require_file(
                options.c_baseline, "compiled benchmark baseline image");

        if(options.run_c)
        {
            options.c_source_dir = require_directory(
                options.c_source_dir, "C benchmark source directory");
        }
        if(options.run_cxx)
        {
            options.cxx_source_dir = require_directory(
                options.cxx_source_dir, "C++ benchmark source directory");
        }

        if(!options.stack_output.empty())
            (void)open_output(options.stack_output); // Clear once for both languages.
        if(!options.trace_output.empty())
            (void)open_output(options.trace_output);

        if(options.run_instructions)
            run_instruction_benchmarks(options, names);
        if(options.run_c)
            run_compiled_benchmarks(
                options, options.c_source_dir, options.c_image_dir,
                options.c_output, c, "C");
        if(options.run_cxx)
            run_compiled_benchmarks(
                options, options.cxx_source_dir, options.cxx_image_dir,
                options.cxx_output, cpp, "C++");
        return 0;
    }
    catch(std::exception const& error)
    {
        std::cerr << "avm_bench: error: " << error.what() << '\n';
        return 1;
    }
}
