// Crash metadata is part of the default packaging path. These checks cover the
// packaging that LLDB and the profiler request, the --no-crash-info opt-out,
// and the claim that metadata never changes what an image executes.
#include "AvmEmulator.h"
#include "AvmHost.h"

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
namespace fs = std::filesystem;

void require(bool condition, std::string const& message)
{
    if(!condition)
        throw std::runtime_error(message);
}

std::vector<uint8_t> read_file(fs::path const& path)
{
    std::ifstream input(path, std::ios::binary);
    require(bool(input), "cannot read " + path.string());
    return {std::istreambuf_iterator<char>(input), {}};
}

uint32_t u16(std::vector<uint8_t> const& data, size_t offset)
{
    return uint32_t(data.at(offset)) | uint32_t(data.at(offset + 1)) << 8;
}

uint32_t u24(std::vector<uint8_t> const& data, size_t offset)
{
    return uint32_t(data.at(offset)) | uint32_t(data.at(offset + 1)) << 8 |
           uint32_t(data.at(offset + 2)) << 16;
}

bool has_magic(std::vector<uint8_t> const& data, size_t offset, char const* magic)
{
    return offset + 4 <= data.size() &&
           std::equal(magic, magic + 4, data.begin() + offset);
}

struct record_t {
    uint32_t start;
    uint32_t end;
    std::string text;
    uint32_t line;
};

struct crash_t {
    uint32_t address = 0;
    std::vector<record_t> functions;
    std::vector<record_t> lines;
};

// Parses the AVD1 block named by header offset 0x0F and checks the layout the
// guest reporter depends on. An image without metadata has no records.
crash_t parse_crash(std::vector<uint8_t> const& image)
{
    require(image.size() >= 256, "image shorter than its header");
    crash_t out;
    out.address = u24(image, 0x0f);
    if(out.address == 0)
        return out;

    size_t const base = out.address;
    require(base % 4 == 0, "AVD1 block is not 4-byte aligned");
    require(base + 24 <= image.size(), "AVD1 header lies outside the image");
    require(has_magic(image, base, "AVD1"), "crashInfo does not name an AVD1 block");
    // With --development the tail is followed by an erased save sector.
    size_t tail = image.size() - 8;
    if(!has_magic(image, tail, "AVT\x01"))
        tail = image.size() - 4096 - 8;
    require(has_magic(image, tail, "AVT\x01"), "missing AVM tail");

    uint32_t const size = u24(image, base + 4);
    uint32_t const functions = u16(image, base + 8);
    uint32_t const lines = u16(image, base + 10);
    require(image[base + 7] == 0, "nonzero AVD1 flags");
    require(u24(image, base + 12) == 24, "function table is not after the header");
    require(u24(image, base + 15) == 24 + 9 * functions, "line table misplaced");
    require(u24(image, base + 18) == 24 + 9 * functions + 12 * lines,
            "string table misplaced");
    require(size >= 24 + 9 * functions + 12 * lines, "AVD1 size is too small");
    require(base + size <= tail, "AVD1 block overlaps the tail");

    auto text_at = [&](uint32_t offset) {
        size_t const start = base + offset;
        require(offset < size, "string offset outside the AVD1 block");
        auto end = std::find(image.begin() + start, image.begin() + base + size, 0);
        require(end != image.begin() + base + size, "unterminated AVD1 string");
        return std::string(image.begin() + start, end);
    };

    auto read_records = [&](std::vector<record_t> &out_records, uint32_t count,
                            size_t table, size_t stride, bool has_line) {
        uint32_t previous_end = 0;
        for(uint32_t i = 0; i < count; ++i) {
            size_t const record = base + table + stride * i;
            record_t entry{u24(image, record), u24(image, record + 3),
                           text_at(u24(image, record + 6)), 0};
            if(has_line)
                entry.line = u24(image, record + 9);
            require(entry.start < entry.end, "empty AVD1 range");
            require(entry.start >= previous_end, "AVD1 ranges overlap or are unsorted");
            previous_end = entry.end;
            out_records.push_back(entry);
        }
    };
    read_records(out.functions, functions, 24, 9, false);
    read_records(out.lines, lines, 24 + 9 * functions, 12, true);
    return out;
}

record_t const* find_function(crash_t const& crash, std::string const& name)
{
    auto it = std::find_if(crash.functions.begin(), crash.functions.end(),
                           [&](record_t const& r) { return r.text == name; });
    return it == crash.functions.end() ? nullptr : &*it;
}

// Packages as LLDB and the profiler do, through the shared helper.
void package_default(fs::path const& tool, fs::path const& elf, fs::path const& image)
{
    avm_debug::package_image(tool, elf, image);
}

// Packages with extra packer options, using the same argument order.
void package_with_options(fs::path const& tool, std::string const& options,
                          fs::path const& elf, fs::path const& image)
{
    std::string command = "\"" + tool.string() + "\" " + options +
                          " --development -o \"" + image.string() + "\" \"" +
                          elf.string() + "\"";
    require(std::system(command.c_str()) == 0, "packer failed: " + command);
}

// debug_leaf's address range must map to a line of its declaration in fixture.c.
void check_leaf_lines(crash_t const& crash)
{
    record_t const* leaf = find_function(crash, "debug_leaf");
    require(leaf != nullptr, "debug_leaf has no function record");
    bool mapped = false;
    for(record_t const& line : crash.lines) {
        if(line.start < leaf->end && line.end > leaf->start) {
            require(line.text == "fixture.c", "debug_leaf line is not from fixture.c");
            mapped = mapped || (line.line >= 7 && line.line <= 14);
        }
    }
    require(mapped, "debug_leaf has no source line inside its declaration");
}

void test_default_source_lines(fs::path const& tool, fs::path const& debug_elf,
                               fs::path const& cmake_image, fs::path const& scratch)
{
    fs::path image = scratch / "default-debug.bin";
    package_default(tool, debug_elf, image);
    auto bytes = read_file(image);
    require(bytes == read_file(cmake_image),
            "LLDB default packaging differs from the CMake default image");
    crash_t crash = parse_crash(bytes);
    require(crash.address != 0, "default packaging omitted crash metadata");
    require(find_function(crash, "debug_leaf") && find_function(crash, "main"),
            "default metadata lacks fixture function names");
    require(!crash.lines.empty(), "-g build has no source lines");
    check_leaf_lines(crash);
    std::cout << "Default packaging of a -g ELF: " << crash.functions.size()
              << " function and " << crash.lines.size()
              << " source-line records; LLDB packaging matches the CMake image.\n";
}

// Returns the default non-debug image so the execution check can reuse it.
fs::path test_default_function_names(fs::path const& tool, fs::path const& nodebug_elf,
                                     fs::path const& scratch)
{
    fs::path image = scratch / "default-nodebug.bin";
    package_default(tool, nodebug_elf, image);
    crash_t crash = parse_crash(read_file(image));
    require(find_function(crash, "debug_leaf") && find_function(crash, "main"),
            "non-debug build lacks function names");
    require(crash.lines.empty(), "non-debug build has source lines");
    std::cout << "Default packaging of a build without -g: " << crash.functions.size()
              << " function names, no source lines.\n";
    return image;
}

void test_no_crash_info(fs::path const& tool, fs::path const& debug_elf,
                        fs::path const& cmake_payload, fs::path const& scratch)
{
    fs::path image = scratch / "no-crash-info.bin";
    package_with_options(tool, "--no-crash-info", debug_elf, image);
    auto bytes = read_file(image);
    require(u24(bytes, 0x0f) == 0, "--no-crash-info left crashInfo set");
    std::vector<uint8_t> const magic = {'A', 'V', 'D', '1'};
    require(std::search(bytes.begin(), bytes.end(), magic.begin(), magic.end()) ==
                bytes.end(),
            "--no-crash-info appended an AVD1 block");
    require(bytes == read_file(cmake_payload),
            "--no-crash-info image differs from the CMake opt-out image");
    std::cout << "--no-crash-info: crashInfo zero, no AVD1 block, image matches the "
                 "CMake opt-out.\n";
}

struct run_t {
    avm_debug::Snapshot state;
    std::vector<uint8_t> io_and_sram;
    std::vector<uint8_t> frame;
};

run_t run_image(fs::path const& elf, fs::path const& image, fs::path const& firmware,
                fs::path const& boundary, uint64_t cycles)
{
    avm_debug::Emulator emulator;
    avm_debug::Stop loaded = emulator.load(elf, image, firmware, boundary);
    require(loaded.reason != avm_debug::StopReason::Fault,
            "cannot load " + image.string() + ": " + loaded.detail);
    avm_debug::Stop stopped = emulator.run_for(cycles);
    require(stopped.reason != avm_debug::StopReason::Fault,
            "fault while running " + image.string() + ": " + stopped.detail);
    run_t out;
    out.state = emulator.snapshot();
    // Data addresses 0x00-0x1F are the native register file. It holds interpreter
    // scratch, and the startup tail search leaves a page-count-dependent value in
    // r26 that the run never rewrites. Everything else is compared.
    out.io_and_sram = emulator.read_data(0x20, 0x0a00 - 0x20);
    out.frame = emulator.logical_framebuffer();
    return out;
}

void require_same_run(run_t const& a, run_t const& b, std::string const& what)
{
    require(a.state.pc == b.state.pc && a.state.registers == b.state.registers &&
                a.state.sp == b.state.sp && a.state.cc == b.state.cc &&
                a.state.cycles == b.state.cycles,
            what + ": CPU state differs");
    require(a.io_and_sram == b.io_and_sram, what + ": I/O or SRAM state differs");
    require(a.frame == b.frame, what + ": framebuffer differs");
}

void test_metadata_executes_unchanged(fs::path const& elf_with_debug,
                                      fs::path const& debug_image,
                                      fs::path const& debug_payload,
                                      fs::path const& nodebug_elf,
                                      fs::path const& nodebug_image,
                                      fs::path const& nodebug_payload,
                                      fs::path const& firmware, fs::path const& boundary)
{
    constexpr uint64_t kCycles = 2000000;
    auto with_metadata = run_image(elf_with_debug, debug_image, firmware, boundary, kCycles);
    auto without = run_image(elf_with_debug, debug_payload, firmware, boundary, kCycles);
    require_same_run(with_metadata, without, "-g image with and without metadata");
    require(with_metadata.state.cycles >= kCycles, "-g image stopped early");

    auto nodebug_with = run_image(nodebug_elf, nodebug_image, firmware, boundary, kCycles);
    auto nodebug_without = run_image(nodebug_elf, nodebug_payload, firmware, boundary, kCycles);
    require_same_run(nodebug_with, nodebug_without, "non-debug image with and without metadata");
    std::cout << "Metadata leaves execution unchanged after " << kCycles
              << " cycles for -g and non-debug images.\n";
}
} // namespace

int main(int argc, char** argv)
{
    try {
        require(argc == 10,
                "usage: avm_crash_metadata_tests llvm-avm-image debug.elf nodebug.elf "
                "debug.bin debug-no-crash.bin nodebug-no-crash.bin "
                "interp.hex boundary.json scratch-dir");
        fs::path tool = argv[1];
        fs::path debug_elf = argv[2];
        fs::path nodebug_elf = argv[3];
        fs::path debug_image = argv[4];
        fs::path debug_payload = argv[5];
        fs::path nodebug_payload = argv[6];
        fs::path firmware = argv[7];
        fs::path boundary = argv[8];
        fs::path scratch = argv[9];
        fs::create_directories(scratch);

        test_default_source_lines(tool, debug_elf, debug_image, scratch);
        fs::path nodebug_image = test_default_function_names(tool, nodebug_elf, scratch);
        test_no_crash_info(tool, debug_elf, debug_payload, scratch);
        test_metadata_executes_unchanged(debug_elf, debug_image, debug_payload,
                                         nodebug_elf, nodebug_image, nodebug_payload,
                                         firmware, boundary);
        std::cout << "Crash metadata default, opt-out, and execution checks passed.\n";
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
