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

// Source state at one transition. The stream offset is relative to the first
// opcode, and the state applies from pc up to the next transition.
struct source_state_t {
    uint32_t pc;
    uint32_t offset;
    uint32_t line;
    uint16_t file;
    bool mapped;
};

// Decodes one transition of the AVD1 source stream. Every opcode is valid. The
// same-file opcodes resume from the retained line, and an unmapped transition
// keeps the file and line it follows. Returns false for malformed data, so the
// test fails rather than trusting a bad stream.
bool decode_transition(std::vector<uint8_t> const& image, size_t stream, size_t bytes,
                       uint32_t files, source_state_t const& in, source_state_t& out)
{
    size_t offset = in.offset;
    auto uleb = [&](uint32_t& value) {
        value = 0;
        for(unsigned count = 0; count < 4; ++count) {
            if(offset >= bytes)
                return false;
            uint8_t byte = image[stream + offset++];
            value |= uint32_t(byte & 0x7f) << (7 * count);
            if(!(byte & 0x80))
                return count == 0 || byte != 0;
        }
        return false;
    };
    auto zigzag = [](uint32_t value) {
        return (value & 1) ? -int64_t((value + 1) >> 1) : int64_t(value >> 1);
    };
    if(offset >= bytes)
        return false;
    uint8_t opcode = image[stream + offset++];
    out = in;
    uint32_t delta = 0;
    int64_t line = in.line;
    uint32_t operand = 0;
    if(opcode < 0x80) {
        if(in.line == 0)
            return false;
        delta = (opcode & 0x0f) + 1;
        line += ((opcode >> 4) & 7) - 4;
        out.mapped = true;
    } else if(opcode == 0x80) {
        if(!uleb(delta) || !uleb(operand) || operand >= files)
            return false;
        out.file = uint16_t(operand);
        if(!uleb(operand))
            return false;
        line = operand;
        out.mapped = true;
    } else if(opcode == 0x81) {
        if(in.line == 0 || !uleb(delta) || !uleb(operand))
            return false;
        line += zigzag(operand);
        out.mapped = true;
    } else if(opcode == 0x82) {
        if(!uleb(delta))
            return false;
        out.mapped = false;
    } else if(opcode <= 0x92) {
        if(in.line == 0 || !uleb(operand))
            return false;
        delta = opcode - 0x82u;
        line += zigzag(operand);
        out.mapped = true;
    } else {
        delta = opcode - 0x92u;
        out.mapped = false;
    }
    if(delta == 0 || delta > 0xffffff - in.pc)
        return false;
    if(out.mapped && (line < 1 || line > 0xffffff))
        return false;
    out.pc = in.pc + delta;
    out.line = uint32_t(line);
    out.offset = uint32_t(offset);
    return true;
}

// Parses the AVD1 block named by header offset 0x0F and checks the layout the
// guest reporter depends on: the section directory, the function index, the
// filename index, the source transition stream, and the checkpoints. The stream
// is decoded in full and must agree with every checkpoint. An image without
// metadata has no records.
crash_t parse_crash(std::vector<uint8_t> const& image)
{
    require(image.size() >= 256, "image shorter than its header");
    crash_t out;
    out.address = u24(image, 0x0f);
    if(out.address == 0)
        return out;

    size_t const base = out.address;
    require(base % 4 == 0, "AVD1 block is not 4-byte aligned");
    require(base + 47 <= image.size(), "AVD1 header lies outside the image");
    require(has_magic(image, base, "AVD1"), "crashInfo does not name an AVD1 block");
    // With --development the tail is followed by an erased save sector.
    size_t tail = image.size() - 8;
    if(!has_magic(image, tail, "AVT\x01"))
        tail = image.size() - 4096 - 8;
    require(has_magic(image, tail, "AVT\x01"), "missing AVM tail");

    uint32_t const size = u24(image, base + 4);
    require(image[base + 7] == 5, "AVD1 section count is not five");
    require(image[base + 8] == 0 && u24(image, base + 9) == 0,
            "nonzero AVD1 flags or reserved bytes");
    require(base + size <= tail, "AVD1 block overlaps the tail");

    // Section offsets are relative to the block and must be consecutive.
    size_t section[5], length[5];
    uint32_t next = 47;
    for(unsigned i = 0; i < 5; ++i) {
        size_t const entry = base + 12 + 7 * i;
        require(image[entry] == i + 1, "AVD1 section type is out of order");
        require(u24(image, entry + 1) == next, "AVD1 sections are not consecutive");
        section[i] = base + next;
        length[i] = u24(image, entry + 4);
        next += length[i];
    }
    require(next == size, "AVD1 sections do not fill the block");

    // Function index: a count, then nine-byte records with pool-relative names.
    // A pool record is a canonical ULEB128 length, its characters, and a NUL, and
    // a reference names the length prefix.
    size_t const pool = section[4];
    uint32_t const pool_size = uint32_t(length[4]);
    auto text_at = [&](uint32_t offset) {
        require(offset < pool_size, "string offset outside the string pool");
        uint32_t length_value = 0;
        uint32_t bytes = 0;
        for(uint32_t shift = 0;; shift += 7) {
            require(offset + bytes < pool_size, "string length prefix is unterminated");
            require(bytes < 4, "string length prefix exceeds four bytes");
            uint8_t byte = image[pool + offset + bytes++];
            length_value |= uint32_t(byte & 0x7f) << shift;
            if(!(byte & 0x80)) {
                require(bytes == 1 || byte != 0, "string length prefix is overlong");
                break;
            }
        }
        uint32_t const first = offset + bytes;
        require(length_value > 0 && first + length_value < pool_size,
                "string record runs past the string pool");
        require(image[pool + first + length_value] == 0, "string record is not NUL terminated");
        auto begin = image.begin() + pool + first;
        return std::string(begin, begin + length_value);
    };

    uint32_t const functions = u16(image, section[0]);
    require(length[0] == 2 + 9 * size_t(functions), "function index size is wrong");
    uint32_t previous_end = 0;
    for(uint32_t i = 0; i < functions; ++i) {
        size_t const record = section[0] + 2 + 9 * size_t(i);
        record_t entry{u24(image, record), u24(image, record + 3),
                       text_at(u24(image, record + 6)), 0};
        require(entry.start < entry.end, "empty AVD1 function range");
        require(entry.start >= previous_end, "AVD1 function ranges overlap or are unsorted");
        previous_end = entry.end;
        out.functions.push_back(entry);
    }

    // Filename index: a count, then 24-bit pool-relative basenames.
    uint32_t const files = u16(image, section[1]);
    require(length[1] == 2 + 3 * size_t(files), "filename index size is wrong");
    std::vector<std::string> names;
    for(uint32_t i = 0; i < files; ++i) {
        names.push_back(text_at(u24(image, section[1] + 2 + 3 * size_t(i))));
        require(names.back().find('/') == std::string::npos, "filename is not a basename");
    }

    // Source transition stream: a count, then opcodes. Every transition is
    // decoded, and each checkpoint is compared with the state it records.
    size_t const stream = section[3] + 3;
    size_t const stream_bytes = length[3] - 3;
    uint32_t const transitions = u24(image, section[3]);
    uint32_t const checkpoints = u16(image, section[2]);
    require(checkpoints == transitions / 64 + 1, "checkpoint count is wrong");
    require(length[2] == 2 + 12 * size_t(checkpoints), "checkpoint section size is wrong");

    std::vector<source_state_t> states{{0, 0, 0, 0, false}};
    std::vector<size_t> ends;
    for(uint32_t i = 0; i < transitions; ++i) {
        source_state_t next{};
        require(decode_transition(image, stream, stream_bytes, files, states.back(), next),
                "malformed AVD1 source transition");
        require(next.pc > states.back().pc, "AVD1 transition PCs do not increase");
        states.push_back(next);
        ends.push_back(next.offset);
    }
    require(ends.empty() ? stream_bytes == 0 : ends.back() == stream_bytes,
            "AVD1 source stream has trailing bytes");
    for(uint32_t i = 0; i < checkpoints; ++i) {
        size_t const record = section[2] + 2 + 12 * size_t(i);
        uint32_t const expected_index = i * 64;
        source_state_t const& state = states[expected_index];
        require(u24(image, record) == state.pc && u16(image, record + 6) == state.file &&
                    u24(image, record + 8) == state.line &&
                    (image[record + 11] != 0) == state.mapped,
                "AVD1 checkpoint disagrees with the stream");
        size_t const offset = expected_index == 0 ? 0 : ends[expected_index - 1];
        require(u24(image, record + 3) == offset, "AVD1 checkpoint offset is wrong");
    }

    // Each mapped run is one interval, from its transition to the next.
    for(uint32_t i = 0; i < transitions; ++i) {
        source_state_t const& state = states[i + 1];
        if(!state.mapped)
            continue;
        uint32_t const end = i + 2 < states.size() ? states[i + 2].pc : 0x1000000;
        out.lines.push_back({state.pc, end, names.at(state.file), state.line});
    }
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
