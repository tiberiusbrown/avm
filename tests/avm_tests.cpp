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
#include <system_error>
#include <vector>

#ifndef AVM_TEST_ASM_DIR
#error "AVM_TEST_ASM_DIR must be defined by CMake"
#endif

#ifndef AVM_TEST_BIN_DIR
#error "AVM_TEST_BIN_DIR must be defined by CMake"
#endif

#ifndef AVM_TEST_INTERPRETER_HEX
#error "AVM_TEST_INTERPRETER_HEX must be defined by CMake"
#endif

#ifndef AVM_TEST_ADVANCE_LIMIT
#define AVM_TEST_ADVANCE_LIMIT 10000000000000ull
#endif

namespace {

namespace fs = std::filesystem;

constexpr std::uint64_t kDefaultAdvanceLimit = AVM_TEST_ADVANCE_LIMIT;
constexpr std::string_view kFailBanner[] = {
    "#####    ###    #####  #      ",
    "#       #   #     #    #      ",
    "####    #####     #    #      ",
    "#       #   #     #    #      ",
    "#       #   #   #####  #####  ",
};

struct options_t {
    fs::path interpreter = AVM_TEST_INTERPRETER_HEX;
    fs::path asm_dir = AVM_TEST_ASM_DIR;
    fs::path bin_dir = AVM_TEST_BIN_DIR;
    std::uint64_t advance_limit = kDefaultAdvanceLimit;
    bool verbose = false;
};

struct test_case_t {
    fs::path source;
    fs::path expected;
    fs::path image;
    fs::path actual;
};

struct failure_t {
    std::string label;
    std::string message;
};

[[noreturn]] void usage_error(std::string const& message)
{
    throw std::runtime_error(
        message +
        "\nUsage: avm_tests [--interpreter FILE] [--asm-dir DIR] "
        "[--bin-dir DIR] [--advance-limit CYCLES] [--verbose]");
}

std::uint64_t parse_u64(std::string_view text, std::string_view option)
{
    std::size_t consumed = 0;
    unsigned long long value = 0;
    try {
        value = std::stoull(std::string(text), &consumed, 0);
    }
    catch(std::exception const&) {
        usage_error("Invalid integer for " + std::string(option) + ": " +
                    std::string(text));
    }
    if(consumed != text.size() || value == 0)
        usage_error("Invalid positive integer for " + std::string(option) +
                    ": " + std::string(text));
    return static_cast<std::uint64_t>(value);
}

options_t parse_options(int argc, char** argv)
{
    options_t options;

    for(int i = 1; i < argc; ++i) {
        std::string_view arg(argv[i]);
        auto require_value = [&](std::string_view option) -> std::string_view {
            if(i + 1 >= argc)
                usage_error("Missing value for " + std::string(option));
            return argv[++i];
        };

        if(arg == "--interpreter")
            options.interpreter = require_value(arg);
        else if(arg == "--asm-dir")
            options.asm_dir = require_value(arg);
        else if(arg == "--bin-dir")
            options.bin_dir = require_value(arg);
        else if(arg == "--advance-limit")
            options.advance_limit = parse_u64(require_value(arg), arg);
        else if(arg == "--verbose")
            options.verbose = true;
        else if(arg == "-h" || arg == "--help") {
            std::cout
                << "Usage: avm_tests [--interpreter FILE] [--asm-dir DIR] "
                   "[--bin-dir DIR] [--advance-limit CYCLES] [--verbose]\n";
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
    fs::path absolute = fs::absolute(path, ec);
    if(ec)
        throw std::runtime_error(
            "Unable to resolve " + std::string(description) + ": " +
            path.string() + ": " + ec.message());
    if(!fs::is_regular_file(absolute, ec) || ec)
        throw std::runtime_error(
            std::string(description) + " does not exist: " + absolute.string());
    return absolute;
}

fs::path require_directory(fs::path const& path, std::string_view description)
{
    std::error_code ec;
    fs::path absolute = fs::absolute(path, ec);
    if(ec)
        throw std::runtime_error(
            "Unable to resolve " + std::string(description) + ": " +
            path.string() + ": " + ec.message());
    if(!fs::is_directory(absolute, ec) || ec)
        throw std::runtime_error(
            std::string(description) + " does not exist: " + absolute.string());
    return absolute;
}

std::vector<std::uint8_t> read_binary_file(fs::path const& filename)
{
    std::ifstream input(filename, std::ios::binary);
    if(!input)
        throw std::runtime_error("Unable to open file: " + filename.string());

    input.seekg(0, std::ios::end);
    std::streamoff const length = input.tellg();
    if(length < 0)
        throw std::runtime_error("Unable to determine file size: " + filename.string());
    input.seekg(0, std::ios::beg);

    std::vector<std::uint8_t> data(static_cast<std::size_t>(length));
    if(!data.empty()) {
        input.read(reinterpret_cast<char*>(data.data()),
                   static_cast<std::streamsize>(data.size()));
        if(!input)
            throw std::runtime_error("Unable to read file: " + filename.string());
    }
    return data;
}

void write_binary_file(fs::path const& filename,
                       std::vector<std::uint8_t> const& data)
{
    std::error_code ec;
    if(!filename.parent_path().empty())
        fs::create_directories(filename.parent_path(), ec);
    if(ec)
        throw std::runtime_error(
            "Unable to create output directory for " + filename.string() +
            ": " + ec.message());

    std::ofstream output(filename, std::ios::binary);
    if(!output)
        throw std::runtime_error("Unable to create file: " + filename.string());
    if(!data.empty())
        output.write(reinterpret_cast<char const*>(data.data()),
                     static_cast<std::streamsize>(data.size()));
    if(!output)
        throw std::runtime_error("Unable to write file: " + filename.string());
}

std::vector<std::uint8_t> normalize_newlines(
    std::vector<std::uint8_t> const& data)
{
    std::vector<std::uint8_t> normalized;
    normalized.reserve(data.size());
    for(std::uint8_t byte : data)
        if(byte != static_cast<std::uint8_t>('\r'))
            normalized.push_back(byte);
    return normalized;
}

std::vector<std::string> split_lines(std::vector<std::uint8_t> const& bytes)
{
    std::vector<std::string> lines;
    std::string line;
    for(std::uint8_t byte : bytes) {
        if(byte == static_cast<std::uint8_t>('\n')) {
            lines.push_back(std::move(line));
            line.clear();
        }
        else {
            line.push_back(static_cast<char>(byte));
        }
    }
    if(!line.empty() || (!bytes.empty() && bytes.back() != '\n'))
        lines.push_back(std::move(line));
    return lines;
}

std::string escaped(std::string_view text)
{
    std::ostringstream output;
    for(unsigned char ch : text) {
        switch(ch) {
        case '\\': output << "\\\\"; break;
        case '\t': output << "\\t"; break;
        case '\n': output << "\\n"; break;
        case '\r': output << "\\r"; break;
        default:
            if(std::isprint(ch))
                output << static_cast<char>(ch);
            else
                output << "\\x" << std::hex << std::setw(2)
                       << std::setfill('0') << static_cast<unsigned>(ch)
                       << std::dec << std::setfill(' ');
            break;
        }
    }
    return output.str();
}

std::string output_diff(std::vector<std::uint8_t> const& expected_raw,
                        std::vector<std::uint8_t> const& actual_raw,
                        fs::path const& expected_path,
                        fs::path const& actual_path)
{
    auto const expected = normalize_newlines(expected_raw);
    auto const actual = normalize_newlines(actual_raw);

    std::size_t first_byte = 0;
    while(first_byte < expected.size() && first_byte < actual.size() &&
          expected[first_byte] == actual[first_byte])
        ++first_byte;

    auto const expected_lines = split_lines(expected);
    auto const actual_lines = split_lines(actual);
    std::size_t first_line = 0;
    while(first_line < expected_lines.size() &&
          first_line < actual_lines.size() &&
          expected_lines[first_line] == actual_lines[first_line])
        ++first_line;

    std::ostringstream message;
    message << "serial output did not match\n"
            << "expected: " << expected_path << '\n'
            << "actual:   " << actual_path << '\n'
            << "expected bytes: " << expected_raw.size()
            << " (" << expected.size() << " after CR removal)\n"
            << "actual bytes:   " << actual_raw.size()
            << " (" << actual.size() << " after CR removal)\n"
            << "first differing normalized byte: " << first_byte << '\n';

    if(first_line < expected_lines.size() || first_line < actual_lines.size()) {
        message << "first differing line: " << (first_line + 1) << '\n'
                << "diff (up to 12 differing lines):\n";
        std::size_t const end = std::min<std::size_t>(
            std::max(expected_lines.size(), actual_lines.size()),
            first_line + 12);
        for(std::size_t line = first_line; line < end; ++line) {
            if(line < expected_lines.size())
                message << "- " << std::setw(5) << (line + 1) << "  "
                        << escaped(expected_lines[line]) << '\n';
            else
                message << "- " << std::setw(5) << (line + 1)
                        << "  <missing>\n";

            if(line < actual_lines.size())
                message << "+ " << std::setw(5) << (line + 1) << "  "
                        << escaped(actual_lines[line]) << '\n';
            else
                message << "+ " << std::setw(5) << (line + 1)
                        << "  <missing>\n";
        }
    }

    return message.str();
}

void load_file(absim::arduboy_t& arduboy,
               fs::path const& filename,
               char const* synthetic_name)
{
    std::ifstream input(filename, std::ios::binary);
    if(!input)
        throw std::runtime_error("Unable to open input file: " + filename.string());

    std::string error = arduboy.load_file(synthetic_name, input);
    if(!error.empty())
        throw std::runtime_error(
            "Ardens could not load " + filename.string() + ": " + error);
}

std::vector<std::uint8_t> run_image(fs::path const& interpreter,
                                    fs::path const& image,
                                    std::uint64_t advance_limit)
{
    auto arduboy = std::make_unique<absim::arduboy_t>();
    arduboy->reset();

    load_file(*arduboy, interpreter, "interpreter.hex");
    load_file(*arduboy, image, "fxdata.bin");

    auto& cpu = arduboy->core_state.cpu;
    cpu.serial_bytes.clear();
    cpu.autobreaks.reset();
    cpu.enabled_autobreaks.reset();
    cpu.enabled_autobreaks.set(absim::AB_BREAK);

    arduboy->debugger_state.allow_nonstep_breakpoints = true;
    arduboy->debugger_state.paused = false;
    arduboy->advance(advance_limit);

    if(!arduboy->debugger_state.paused ||
       !cpu.autobreaks.test(absim::AB_BREAK)) {
        std::ostringstream message;
        message << "The emulator did not reach SYS debug_break before the "
                << advance_limit << "-cycle limit"
                << "\nexecuted cycles: " << cpu.cycle_count
                << "\nserial bytes captured: " << cpu.serial_bytes.size();
        throw std::runtime_error(message.str());
    }

    // Match Ardens headless mode: flush delayed peripheral state once after
    // the terminal breakpoint so the final USB serial packet is visible.
    cpu.update_all();
    return cpu.serial_bytes;
}

std::string lowercase(std::string value)
{
    std::transform(value.begin(), value.end(), value.begin(),
        [](unsigned char ch) { return static_cast<char>(std::tolower(ch)); });
    return value;
}

std::vector<test_case_t> discover_tests(fs::path const& asm_dir,
                                        fs::path const& bin_dir)
{
    std::vector<test_case_t> tests;
    std::error_code ec;
    for(fs::directory_iterator it(asm_dir, ec), end; it != end; it.increment(ec)) {
        if(ec)
            throw std::runtime_error(
                "Unable to enumerate test source directory " + asm_dir.string() +
                ": " + ec.message());

        fs::directory_entry const& entry = *it;
        if(!entry.is_regular_file(ec)) {
            if(ec)
                throw std::runtime_error(
                    "Unable to inspect " + entry.path().string() + ": " +
                    ec.message());
            continue;
        }

        fs::path source = entry.path();
        if(lowercase(source.extension().string()) != ".asm")
            continue;

        std::string const stem = source.stem().string();
        tests.push_back({
            source,
            source.parent_path() / (stem + "_output.txt"),
            bin_dir / (stem + ".bin"),
            bin_dir / (stem + "_actual.txt"),
        });
    }
    if(ec)
        throw std::runtime_error(
            "Unable to enumerate test source directory " + asm_dir.string() +
            ": " + ec.message());

    std::sort(tests.begin(), tests.end(),
        [](test_case_t const& lhs, test_case_t const& rhs) {
            return lowercase(lhs.source.filename().string()) <
                   lowercase(rhs.source.filename().string());
        });
    return tests;
}

std::string test_label(test_case_t const& test)
{
    return "[ASM] " + test.source.filename().string();
}

void run_test(test_case_t const& test,
              fs::path const& interpreter,
              std::uint64_t advance_limit,
              bool verbose)
{
    require_file(test.expected, "expected-output file");
    require_file(test.image, "built AVM test image");

    if(verbose) {
        std::cout << "    source:      " << test.source << '\n'
                  << "    image:       " << test.image << '\n'
                  << "    expected:    " << test.expected << '\n';
    }

    std::vector<std::uint8_t> const expected = read_binary_file(test.expected);
    std::vector<std::uint8_t> const actual =
        run_image(interpreter, test.image, advance_limit);

    if(normalize_newlines(actual) != normalize_newlines(expected)) {
        write_binary_file(test.actual, actual);
        throw std::runtime_error(
            output_diff(expected, actual, test.expected, test.actual));
    }

    std::error_code ec;
    fs::remove(test.actual, ec);
}

} // namespace

int main(int argc, char** argv)
{
    try {
        options_t options = parse_options(argc, argv);
        options.interpreter = require_file(
            options.interpreter, "AVM interpreter HEX image");
        options.asm_dir = require_directory(
            options.asm_dir, "assembly test source directory");
        options.bin_dir = require_directory(
            options.bin_dir, "built AVM test binary directory");

        std::vector<test_case_t> const tests =
            discover_tests(options.asm_dir, options.bin_dir);
        if(tests.empty())
            throw std::runtime_error(
                "No .asm tests found in " + options.asm_dir.string());

        std::size_t result_column = 0;
        for(test_case_t const& test : tests)
            result_column = std::max(result_column, test_label(test).size());
        result_column += 2;

        std::cout << "Running " << tests.size()
                  << " AVM assembly test(s) in one process\n";
        if(options.verbose) {
            std::cout << "  interpreter: " << options.interpreter << '\n'
                      << "  sources:     " << options.asm_dir << '\n'
                      << "  binaries:    " << options.bin_dir << '\n'
                      << "  cycle limit: " << options.advance_limit << "\n\n";
        }

        std::vector<failure_t> failures;
        for(test_case_t const& test : tests) {
            std::string const label = test_label(test);
            try {
                run_test(test, options.interpreter, options.advance_limit,
                         options.verbose);
            }
            catch(std::exception const& error) {
                failures.push_back({label, error.what()});
                std::cout << std::left << std::setw(
                    static_cast<int>(result_column)) << label
                          << "FAIL\n\n";
                for(std::string_view line : kFailBanner)
                    std::cout << "    " << line << '\n';
                std::cout << std::right << '\n' << std::flush;
                continue;
            }

            std::cout << std::left << std::setw(
                static_cast<int>(result_column)) << label
                      << "PASS\n" << std::right << std::flush;
        }

        if(!failures.empty()) {
            std::cout << "\n" << failures.size() << " of " << tests.size()
                      << " test(s) failed:\n";
            for(failure_t const& failure : failures)
                std::cout << "\n--- " << failure.label << " ---\n"
                          << failure.message;
            if(!failures.back().message.empty() &&
               failures.back().message.back() != '\n')
                std::cout << '\n';
            return 1;
        }

        std::cout << "\nAll " << tests.size()
                  << " AVM assembly test(s) passed.\n";
        return 0;
    }
    catch(std::exception const& error) {
        std::cerr << "avm_tests: error: " << error.what() << '\n';
        return 2;
    }
}
