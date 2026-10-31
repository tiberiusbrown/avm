#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"

#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <iterator>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
void require(bool condition, std::string const& message)
{
    if(!condition)
        throw std::runtime_error(message);
}

// Reads a symbol from a listing. Native listings hold word addresses, which
// are halved, while disassembly listings hold byte addresses. Symbol-table
// lines end with the name, and disassembly labels read "<name>:".
uint32_t symbol(char const* listing, std::string const& name, bool native)
{
    std::ifstream input(listing);
    require(bool(input), "cannot read symbol listing");
    for(std::string line; std::getline(input, line);) {
        if((line.size() > name.size() &&
            line.compare(line.size() - name.size(), name.size(), name) == 0 &&
            line[line.size() - name.size() - 1] == ' ') ||
           line.find("<" + name + ">:") != std::string::npos) {
            std::istringstream fields(line);
            uint32_t address;
            if(fields >> std::hex >> address)
                return native ? address / 2 : address;
        }
    }
    throw std::runtime_error("missing symbol: " + name);
}

std::vector<uint8_t> read_file(char const* path)
{
    std::ifstream input(path, std::ios::binary);
    require(bool(input), std::string("cannot read ") + path);
    return {std::istreambuf_iterator<char>(input), {}};
}

uint32_t crc32(uint8_t const* data, size_t size)
{
    uint32_t crc = 0xffffffffu;
    for(size_t i = 0; i < size; ++i) {
        crc ^= data[i];
        for(unsigned bit = 0; bit < 8; ++bit)
            crc = (crc >> 1) ^ (0xedb88320u & (0u - (crc & 1)));
    }
    return ~crc;
}

uint32_t image_u24(std::vector<uint8_t> const& image, unsigned offset)
{
    return uint32_t(image.at(offset)) | uint32_t(image.at(offset + 1)) << 8 |
           uint32_t(image.at(offset + 2)) << 16;
}

uint16_t word(absim::atmega32u4_t const& cpu, unsigned address)
{
    return uint16_t(cpu.data[address]) | uint16_t(cpu.data[address + 1]) << 8;
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu)
{
    return uint32_t(word(cpu, 4)) | uint32_t(cpu.data[6]) << 16;
}

// Guest SP is VM register pair 28-29; the reporter stack is 0x0900-0x09FF.
constexpr unsigned kVmSp = 28;
constexpr unsigned kStartupFlags = 0x0a04;
constexpr unsigned kTrapActive = 1u << 1;
constexpr unsigned kStackSnapshot = 0x0100;
constexpr unsigned kTrapContext = 0x0200;
constexpr unsigned kTrapLocation = 0x0220;
constexpr unsigned kLowProbe = 0x0300;
constexpr unsigned kHighProbe = 0x0380;
// Source lines in tests/interp/trap_source.c: the closing braces of the probe
// functions (their first row) and the sys statement in trap_site.
constexpr unsigned kLowProbeLine = 10;
constexpr unsigned kHighProbeLine = 13;
constexpr unsigned kTrapLine = 16;
constexpr unsigned kFramebuffer = 0x0500;
constexpr unsigned kFramebufferSize = 1024;
constexpr unsigned kStackBase = 0x0900;
constexpr uint16_t kTrapStackTop = 0x0a00;

// avm_trap_location_t as the guest wrote it: a 24-bit function pointer at offset
// 0, a 24-bit filename pointer at offset 3, and a 32-bit line at offset 6. The
// pointers are program addresses, so they index the packaged image directly.
struct location_t {
    uint32_t function;
    uint32_t file;
    uint32_t line;
};

uint32_t ram_u24(absim::atmega32u4_t const& cpu, unsigned address)
{
    return uint32_t(cpu.data[address]) | uint32_t(cpu.data[address + 1]) << 8 |
           uint32_t(cpu.data[address + 2]) << 16;
}

location_t read_location(absim::atmega32u4_t const& cpu, unsigned address)
{
    location_t out;
    out.function = ram_u24(cpu, address);
    out.file = ram_u24(cpu, address + 3);
    out.line = uint32_t(cpu.data[address + 6]) | uint32_t(cpu.data[address + 7]) << 8 |
               uint32_t(cpu.data[address + 8]) << 16 | uint32_t(cpu.data[address + 9]) << 24;
    return out;
}

// Decodes every record of the AVD1 string pool. A record is a canonical ULEB128
// length, the characters, and a NUL. The result maps the program address of each
// first character, the value a guest pointer holds, to its text.
std::map<uint32_t, std::string> pool_strings(std::vector<uint8_t> const& image, uint32_t crash)
{
    uint32_t const entry = crash + 12 + 7 * 4;
    uint32_t const pool = crash + image_u24(image, entry + 1);
    uint32_t const pool_end = pool + image_u24(image, entry + 4);
    std::map<uint32_t, std::string> out;
    uint32_t cursor = pool;
    while(cursor < pool_end) {
        uint32_t length = 0;
        unsigned shift = 0;
        uint32_t bytes = 0;
        for(;;) {
            require(cursor + bytes < pool_end, "string length prefix is unterminated");
            require(bytes < 4, "string length prefix exceeds four bytes");
            uint8_t byte = image[cursor + bytes++];
            length |= uint32_t(byte & 0x7f) << shift;
            shift += 7;
            if(!(byte & 0x80)) {
                require(bytes == 1 || byte != 0, "string length prefix is overlong");
                break;
            }
        }
        uint32_t const first = cursor + bytes;
        require(length > 0 && first + length < pool_end, "string record runs past the pool");
        require(image[first + length] == 0, "string record is not NUL terminated");
        std::string text(image.begin() + first, image.begin() + first + length);
        for(unsigned char c : text)
            require(c >= 0x20 && c < 0x7f, "string record holds a nonprintable byte");
        out[first] = text;
        cursor = first + length + 1;
    }
    require(cursor == pool_end, "string pool does not end on a record boundary");
    return out;
}

// Text at a guest program pointer, or the empty string for a null pointer. A
// nonnull pointer that does not start a pool record fails the test.
std::string pooled(std::map<uint32_t, std::string> const& pool, uint32_t pointer)
{
    if(pointer == 0)
        return "";
    auto found = pool.find(pointer);
    require(found != pool.end(), "guest pointer does not name a pool string");
    return found->second;
}

std::string c_string(absim::atmega32u4_t const& cpu, unsigned address, unsigned capacity)
{
    auto begin = cpu.data.begin() + address;
    auto end = std::find(begin, begin + capacity, uint8_t(0));
    require(end != begin + capacity, "location string is not terminated");
    return std::string(begin, end);
}

// Header checks shared by every build. Default builds must point crashInfo at a
// 4-byte-aligned AVD1 block before the tail. NO_CRASH_INFO builds leave it zero.
void check_header(std::vector<uint8_t> const& image, bool metadata)
{
    require(image.size() >= 256, "image shorter than its header");
    require(image[4] == 4, "runtimeVersion is not 4");
    for(unsigned i = 0x12; i < 0xfc; ++i)
        require(image[i] == 0, "reserved header byte is not zero");
    uint32_t stored = uint32_t(image[0xfc]) | uint32_t(image[0xfd]) << 8 |
                      uint32_t(image[0xfe]) << 16 | uint32_t(image[0xff]) << 24;
    require(stored == crc32(image.data(), 0xfc), "header CRC32 is wrong");
    uint32_t crash = image_u24(image, 0x0f);
    if(!metadata) {
        require(crash == 0, "crashInfo is set in a NO_CRASH_INFO build");
        return;
    }
    require(crash != 0 && crash % 4 == 0, "crashInfo is zero or misaligned");
    require(crash + 47 <= image.size(), "AVD1 header lies outside the image");
    require(std::equal(image.begin() + crash, image.begin() + crash + 4,
                       reinterpret_cast<uint8_t const*>("AVD1")),
            "AVD1 magic missing at crashInfo");
    uint32_t size = image_u24(image, crash + 4);
    require(image[crash + 7] == 5, "AVD1 section count is not five");
    require(image[crash + 8] == 0 && image_u24(image, crash + 9) == 0,
            "AVD1 flags or reserved bytes are nonzero");
    // Five section descriptors follow the header. Sections are consecutive in
    // type order and exactly fill the block, starting after the 47-byte prefix.
    uint32_t next = 47;
    for(unsigned i = 0; i < 5; ++i) {
        uint32_t entry = crash + 12 + 7 * i;
        require(image[entry] == i + 1, "AVD1 section type is out of order");
        require(image_u24(image, entry + 1) == next, "AVD1 sections are not consecutive");
        next += image_u24(image, entry + 4);
    }
    require(next == size && crash + size <= image.size(),
            "AVD1 sections do not fill the block inside the image");
    require(image[crash + size - 1] == 0, "AVD1 string pool is not NUL terminated");
}

struct machine_t {
    std::unique_ptr<absim::arduboy_t> emulator = std::make_unique<absim::arduboy_t>();
    uint32_t table, dispatch, terminal, display, entry, report;

    machine_t(char const* hex, char const* lst, char const* image, char const* listing)
    {
        table = symbol(lst, "primary_table", true);
        dispatch = symbol(lst, "trap_dispatch_func", true);
        terminal = symbol(lst, "trap_terminal_loop", true);
        display = symbol(lst, "sys_display_impl", true);
        entry = symbol(listing, "__avm_trap_entry", false);
        report = symbol(listing, "__avm_trap_report", false);
        emulator->reset();
        load(hex, "interpreter.hex");
        load(image, "fxdata.bin");
        cpu().no_merged = true;
        cpu().autobreaks.reset();
        avm_test::observe_spi_writes(cpu());
    }

    void load(char const* path, char const* name)
    {
        auto bytes = read_file(path);
        std::istringstream stream(std::string(bytes.begin(), bytes.end()));
        auto error = emulator->load_file(name, stream);
        if(!error.empty())
            throw std::runtime_error(error);
    }

    absim::atmega32u4_t& cpu() { return emulator->core_state.cpu; }

    bool boundary()
    {
        auto pc = cpu().pc;
        return pc >= table && pc < table + 1024 && (pc - table) % 4 == 0;
    }

    void tick()
    {
        emulator->cycle();
        cpu().update_all();
        require(!cpu().should_autobreak(), "native emulator fault");
    }

    template<class P> void until(P pred, uint64_t bound, std::string const& what)
    {
        uint64_t start = cpu().cycle_count;
        while(!pred()) {
            require(cpu().cycle_count < start + bound, "timed out waiting for " + what);
            tick();
        }
    }
};

struct trapped_t {
    uint32_t raw_pc;
    std::vector<uint8_t> context_and_snapshot;
    std::vector<uint8_t> frame;
    uint16_t lowest_sp;
};

// Runs a complete fatal trap and returns the state the reporter produced.
// The context and snapshot must be identical at reporter entry and afterward.
trapped_t run_trap(machine_t& m)
{
    auto& cpu = m.cpu();
    unsigned entries = 0;
    bool at_entry = false;
    m.until([&] {
        bool now = m.boundary() && guest_pc(cpu) == m.entry;
        if(now && !at_entry)
            ++entries;
        at_entry = now;
        return m.boundary() && guest_pc(cpu) == m.report;
    }, 50000000, "reporter entry");
    require(entries == 1, "trap entry was not reached exactly once");
    require(word(cpu, kVmSp) == kTrapStackTop, "reporter SP was not reset to 0x0A00");
    require(cpu.data[kStartupFlags] & kTrapActive, "trap-active flag not set");

    trapped_t out{};
    out.raw_pc = uint32_t(word(cpu, kTrapContext)) | uint32_t(cpu.data[kTrapContext + 2]) << 16;
    out.context_and_snapshot.assign(cpu.data.begin() + kStackSnapshot,
                                    cpu.data.begin() + kTrapLocation);

    uint32_t previous = 0xffffffffu;
    unsigned repeats = 0;
    bool saw_display = false;
    out.lowest_sp = kTrapStackTop;
    m.until([&] {
        if(cpu.pc == m.display)
            saw_display = true;
        if(m.boundary()) {
            auto pc = guest_pc(cpu);
            repeats = pc == previous ? repeats + 1 : 0;
            previous = pc;
            out.lowest_sp = std::min<uint16_t>(out.lowest_sp, word(cpu, kVmSp));
        }
        return repeats >= 3;
    }, 50000000, "reporter terminal loop");
    require(saw_display, "reporter did not reach the SYS display service");
    require(cpu.pc != m.terminal, "reporter reached the interpreter fatal loop");

    std::vector<uint8_t> after(cpu.data.begin() + kStackSnapshot,
                               cpu.data.begin() + kTrapLocation);
    require(after == out.context_and_snapshot,
            "reporter modified the trap context or stack snapshot");
    out.frame.assign(cpu.data.begin() + kFramebuffer,
                     cpu.data.begin() + kFramebuffer + kFramebufferSize);
    return out;
}

// BR5N lines are six pixels tall, with baselines at these rows. Lit pixels
// must fall inside one of the bands ending at a baseline, and each band must
// contain text.
void check_report(std::vector<uint8_t> const& frame)
{
    constexpr unsigned kBaselines[] = {5, 11, 17, 23, 29, 35, 41, 47, 53};
    bool band_lit[9] = {};
    for(unsigned y = 0; y < 64; ++y) {
        for(unsigned x = 0; x < 128; ++x) {
            if(!(frame[(y / 8) * 128 + x] & (1u << (y % 8))))
                continue;
            bool placed = false;
            for(unsigned line = 0; line < 9; ++line) {
                if(y + 5 >= kBaselines[line] && y <= kBaselines[line]) {
                    band_lit[line] = true;
                    placed = true;
                }
            }
            require(placed, "text pixel outside the BR5N report rows");
        }
    }
    for(unsigned line = 0; line < 9; ++line)
        require(band_lit[line], "BR5N report row has no text pixels");
}

// Checks the probe lookups and the reporter's own lookup at the trap PC. A build
// without metadata must leave every pointer and the line null.
void check_locations(absim::atmega32u4_t const& cpu, uint32_t raw_pc, uint32_t trap_site,
                     bool metadata, unsigned trap_line,
                     std::map<uint32_t, std::string> const& pool)
{
    auto low = read_location(cpu, kLowProbe);
    auto high = read_location(cpu, kHighProbe);
    auto trapped = read_location(cpu, kTrapLocation);
    if(!metadata) {
        for(auto const* location : {&low, &high, &trapped})
            require(location->function == 0 && location->file == 0 && location->line == 0,
                    "fallback pointers or line are not null");
        return;
    }
    require(pooled(pool, low.function) == "probe_site",
            "low probe function differs: " + pooled(pool, low.function));
    require(pooled(pool, low.file) == "trap_source.c" && low.line == kLowProbeLine,
            "low probe source differs");
    require(pooled(pool, high.function) == "high_probe_site",
            "high probe function differs: " + pooled(pool, high.function));
    require(pooled(pool, high.file) == "trap_source.c" && high.line == kHighProbeLine,
            "high probe source differs");
    // The interpreter reports its raw VM_PC, which for this SYS encoding points
    // at the operand byte inside the faulting two-byte instruction. The lookup
    // uses that PC unchanged, so the containing row supplies the line.
    std::ostringstream hex;
    hex << std::hex << "raw trap PC 0x" << raw_pc << " is outside trap_site 0x" << trap_site;
    require(raw_pc >= trap_site && raw_pc < trap_site + 2, hex.str());
    require(pooled(pool, trapped.function) == "trap_site",
            "trap PC function differs: " + pooled(pool, trapped.function));
    require(pooled(pool, trapped.file) == "trap_source.c" && trapped.line == trap_line,
            "trap PC source line differs");
}

void test_build(char const* name, char const* hex, char const* lst, char const* image_path,
                char const* listing, bool metadata, unsigned trap_line,
                std::vector<uint8_t>* frame_out)
{
    auto image = read_file(image_path);
    check_header(image, metadata);
    require(symbol(listing, "high_probe_site", false) > 0xffff,
            "high probe is not above 0xFFFF");
    machine_t m(hex, lst, image_path, listing);
    auto trapped = run_trap(m);
    uint32_t trap_site = symbol(listing, "trap_site", false);
    auto pool = metadata ? pool_strings(image, image_u24(image, 0x0f))
                         : std::map<uint32_t, std::string>();
    check_locations(m.cpu(), trapped.raw_pc, trap_site, metadata, trap_line, pool);
    check_report(trapped.frame);
    require(trapped.lowest_sp >= kStackBase, "reporter stack exceeded its 256-byte block");
    std::cout << name << ": raw trap PC 0x" << std::hex << trapped.raw_pc << std::dec
              << ", lowest reporter SP 0x" << std::hex << trapped.lowest_sp << std::dec
              << (metadata ? ", metadata lookups verified" : ", fallback rows verified")
              << ", BR5N report and state verified.\n";
    if(frame_out)
        *frame_out = trapped.frame;
}

// The long-name fixture traps from a function whose demangled name is longer
// than 128 bytes. The reporter's lookup must return that complete name, and the
// fixture's %.12S rendering must hold only its first 12 bytes. Both checks read
// the pooled text, so the stored name is never shortened.
void test_long_name(char const* hex, char const* lst, char const* image_path,
                    char const* listing)
{
    constexpr char const* kName =
        "avm_trap_long_name_fixture::TiledFramebufferRasterizer<128u, 64u>::trap_site("
        "int const&, unsigned long, char const*, unsigned short)";
    constexpr unsigned kShortText = 0x0320;
    auto image = read_file(image_path);
    check_header(image, true);
    machine_t m(hex, lst, image_path, listing);
    auto trapped = run_trap(m);
    auto pool = pool_strings(image, image_u24(image, 0x0f));
    auto location = read_location(m.cpu(), kTrapLocation);
    std::string name = pooled(pool, location.function);
    require(name == kName, "long function name differs: " + name);
    require(name.size() > 128, "long function name is not longer than 128 bytes");
    require(pooled(pool, location.file) == "trap_long_name.cpp",
            "long-name trap source file differs");
    require(c_string(m.cpu(), kShortText, 16) == name.substr(0, 12),
            "%.12S rendering is not the first 12 bytes of the name");
    require(pooled(pool, ram_u24(m.cpu(), 0x0300)) == name,
            "fixture lookup differs from the reporter's lookup");
    check_report(trapped.frame);
    require(trapped.lowest_sp >= kStackBase, "reporter stack exceeded its 256-byte block");
    std::cout << "long C++ name: " << name.size() << " bytes returned in full, "
                 "%.12S renders the first 12, reporter verified.\n";
}
}

int main(int argc, char** argv)
{
    try {
        require(argc == 11, "usage: avm_trap_source_tests interp.hex interp.lst "
                            "O0.bin O0.asm O2.bin O2.asm nometa.bin nometa.asm "
                            "long.bin long.asm");
        std::vector<uint8_t> o2_frame, nometa_frame;
        test_build("O0", argv[1], argv[2], argv[3], argv[4], true, kTrapLine, nullptr);
        test_build("O2", argv[1], argv[2], argv[5], argv[6], true, kTrapLine, &o2_frame);
        test_build("nometa", argv[1], argv[2], argv[7], argv[8], false, kTrapLine, &nometa_frame);
        require(o2_frame != nometa_frame, "metadata did not change the rendered report");
        test_long_name(argv[1], argv[2], argv[9], argv[10]);
        std::cout << "Source-aware fatal trap tests passed.\n";
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
