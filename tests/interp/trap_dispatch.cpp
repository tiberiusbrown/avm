#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"

#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <iterator>
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

void write_word(absim::atmega32u4_t& cpu, unsigned address, uint16_t value)
{
    cpu.data[address] = uint8_t(value);
    cpu.data[address + 1] = uint8_t(value >> 8);
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu)
{
    return uint32_t(word(cpu, 4)) | uint32_t(cpu.data[6]) << 16;
}

// Guest registers r0-r7 live at data[8..23]; SP at data[28..29].
constexpr unsigned kRegs = 8;
constexpr unsigned kVmSp = 28;
constexpr unsigned kStartupFlags = 0x0a04;
constexpr unsigned kTrapActive = 1u << 1;
constexpr unsigned kStackBase = 0x0900;
constexpr unsigned kStackSize = 256;
constexpr unsigned kStackSnapshot = 0x0100;
constexpr unsigned kTrapContext = 0x0200;
constexpr unsigned kTrapContextSize = 32;
constexpr unsigned kFramebuffer = 0x0500;
constexpr unsigned kFramebufferSize = 1024;
constexpr uint16_t kTrapStackTop = 0x0a00;
constexpr uint8_t kGuestFlags = 0x13; // C, Z, and S set.

uint8_t stack_pattern(unsigned i)
{
    return uint8_t(0x80 ^ (i * 29 + 7));
}

uint8_t static_pattern(unsigned address)
{
    return uint8_t(0x3c + address * 11);
}

struct fatal_t {
    uint32_t pc;
    uint16_t sp;
    uint8_t flags;
    uint8_t reason;
    std::array<uint16_t, kRegs> regs;
    std::vector<uint8_t> stack;
};

struct machine_t {
    std::unique_ptr<absim::arduboy_t> emulator = std::make_unique<absim::arduboy_t>();
    uint32_t table, dispatch, terminal, display, entry, report;

    machine_t(char const* hex, char const* lst, char const* image)
    {
        table = symbol(lst, "primary_table", true);
        dispatch = symbol(lst, "trap_dispatch_func", true);
        terminal = symbol(lst, "trap_terminal_loop", true);
        display = symbol(lst, "sys_display_impl", true);
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

    // Run until pred() holds, with a bounded number of emulated cycles.
    template<class P> void until(P pred, uint64_t bound, std::string const& what)
    {
        uint64_t start = cpu().cycle_count;
        while(!pred()) {
            require(cpu().cycle_count < start + bound, "timed out waiting for " + what);
            tick();
        }
    }

    // Stop at a guest instruction boundary and freeze the periodic timer.
    absim::arduboy_t::tt_state_t at(uint32_t guest)
    {
        until([&] { return boundary() && guest_pc(cpu()) == guest; }, 20000000,
              "guest instruction boundary");
        cpu().st(absim::reg::addr::TIMSK0, 0);
        cpu().st(absim::reg::addr::TCCR0B, 0);
        absim::arduboy_t::tt_state_t state;
        emulator->save_state_to_vector(state);
        require(!state.state.empty(), "could not save instruction boundary");
        return state;
    }

    void restore(absim::arduboy_t::tt_state_t const& state)
    {
        emulator->load_state_from_vector(state);
        avm_test::observe_spi_writes(cpu());
    }
};

// Seed the complete pre-trap state at the site boundary, then run the
// faulting instruction to the native fatal dispatch and capture it there.
fatal_t fault_at(machine_t& m, uint32_t site, uint16_t sp, uint16_t salt = 0)
{
    auto& cpu = m.cpu();
    require(m.boundary() && guest_pc(cpu) == site, "fault site not at boundary");
    for(unsigned i = 0; i < kRegs; ++i)
        write_word(cpu, 8 + i * 2, uint16_t(0x1234 + i * 0x1123 + salt));
    write_word(cpu, kVmSp, sp);
    cpu.data[absim::reg::addr::GPIOR0] = kGuestFlags;
    for(unsigned i = 0; i < kStackSize; ++i)
        cpu.data[kStackBase + i] = stack_pattern(i);
    for(unsigned address = 0x100; address < 0x500; ++address)
        cpu.data[address] = static_pattern(address);

    m.until([&] { return cpu.pc == m.dispatch; }, 200000, "native trap dispatch");

    fatal_t fatal{};
    fatal.pc = guest_pc(cpu);
    fatal.sp = word(cpu, kVmSp);
    fatal.flags = cpu.data[absim::reg::addr::GPIOR0];
    fatal.reason = cpu.data[25];
    for(unsigned i = 0; i < kRegs; ++i)
        fatal.regs[i] = word(cpu, 8 + i * 2);
    fatal.stack.assign(cpu.data.begin() + kStackBase,
                       cpu.data.begin() + kStackBase + kStackSize);
    return fatal;
}

void check_context(machine_t& m, fatal_t const& fatal)
{
    auto& cpu = m.cpu();
    require(cpu.data[kStartupFlags] & kTrapActive, "trap-active flag not set");
    auto const* ctx = &cpu.data[kTrapContext];
    require(ctx[0] == uint8_t(fatal.pc) && ctx[1] == uint8_t(fatal.pc >> 8) &&
            ctx[2] == uint8_t(fatal.pc >> 16), "context PC differs from raw VM_PC");
    require(ctx[3] == fatal.reason, "context reason differs");
    require(uint16_t(ctx[4] | ctx[5] << 8) == fatal.sp, "context SP differs");
    require(ctx[6] == fatal.flags, "context flags differ");
    require(ctx[7] == 0, "reserved context byte 7 not zero");
    for(unsigned i = 0; i < kRegs; ++i)
        require(uint16_t(ctx[8 + i * 2] | ctx[9 + i * 2] << 8) == fatal.regs[i],
                "context register differs");
    for(unsigned i = 24; i < 32; ++i)
        require(ctx[i] == 0, "reserved context bytes not zero");
    // Static RAM outside the snapshot and context is disposable but not yet
    // changed by the native handoff.
    for(unsigned address = 0x220; address < 0x500; ++address)
        require(cpu.data[address] == static_pattern(address),
                "native handoff modified static RAM");
    for(unsigned i = 0; i < kStackSize; ++i)
        require(cpu.data[0x100 + i] == static_pattern(0x100 + i),
                "stack snapshot written before the guest trampoline");
}

// From the entry boundary, run the trampoline to the reporter and check the
// copied snapshot and reset SP before the reporter touches the stack.
void check_trampoline(machine_t& m, fatal_t const& fatal)
{
    auto& cpu = m.cpu();
    m.until([&] { return m.boundary() && guest_pc(cpu) == m.report; }, 2000000,
            "reporter entry");
    require(word(cpu, kVmSp) == kTrapStackTop, "reporter SP was not reset to 0x0A00");
    require(word(cpu, 16) == kTrapContext, "reporter context argument not in r4");
    for(unsigned i = 0; i < kStackSize; ++i)
        require(cpu.data[0x100 + i] == fatal.stack[i],
                "stack snapshot differs from original guest stack");
}

// Run the reporter to its self-loop; the reporter must reach the SYS display
// service and then loop without returning.
void run_reporter(machine_t& m)
{
    auto& cpu = m.cpu();
    bool saw_display = false;
    uint32_t previous = 0xffffffffu;
    unsigned repeats = 0;
    m.until([&] {
        if(cpu.pc == m.display)
            saw_display = true;
        if(m.boundary()) {
            auto pc = guest_pc(cpu);
            repeats = pc == previous ? repeats + 1 : 0;
            previous = pc;
        }
        return repeats >= 3;
    }, 50000000, "reporter terminal loop");
    require(saw_display, "reporter did not reach the SYS display service");
}

std::vector<uint8_t> framebuffer(machine_t& m)
{
    auto& cpu = m.cpu();
    return {cpu.data.begin() + kFramebuffer,
            cpu.data.begin() + kFramebuffer + kFramebufferSize};
}

// Context and stack snapshot, the state the reporter must leave untouched.
std::vector<uint8_t> diagnostics(machine_t& m)
{
    auto& cpu = m.cpu();
    return {cpu.data.begin() + kStackSnapshot,
            cpu.data.begin() + kTrapContext + kTrapContextSize};
}

// BR5N lines are six pixels tall and their baselines sit at these rows. A
// lit pixel must fall inside one of the bands ending at a baseline, and every
// band must contain text.
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

void check_distinct(std::vector<uint8_t> const& a, std::vector<uint8_t> const& b,
                    std::string const& what)
{
    require(a != b, "framebuffer did not change with " + what);
}

void test_header(char const* image_path, char const* listing)
{
    auto image = read_file(image_path);
    require(image.size() >= 256, "image shorter than its header");
    require(image[4] == 4, "runtimeVersion is not 4");
    uint32_t entry = symbol(listing, "__avm_trap_entry", false);
    require(image_u24(image, 0x0c) == entry, "header trapEntry differs from final symbol");
    require(entry >= 0x100, "trap entry address too low");
    // Images get crash metadata by default, so crashInfo names an AVD1 block.
    uint32_t crash = image_u24(image, 0x0f);
    require(crash != 0 && crash % 4 == 0 && crash + 47 <= image.size() &&
            std::string(image.begin() + crash, image.begin() + crash + 4) == "AVD1",
            "crashInfo does not name the default AVD1 block");
    require(image[crash + 7] == 5, "AVD1 section count is not five");
    for(unsigned i = 0x12; i < 0xfc; ++i)
        require(image[i] == 0, "reserved header byte is not zero");
    uint32_t stored = uint32_t(image[0xfc]) | uint32_t(image[0xfd]) << 8 |
                      uint32_t(image[0xfe]) << 16 | uint32_t(image[0xff]) << 24;
    require(stored == crc32(image.data(), 0xfc), "header CRC32 is wrong");
    symbol(listing, "__avm_trap_report", false);
    std::cout << "Header: runtimeVersion 4, trapEntry 0x" << std::hex << entry
              << ", crashInfo 0x" << crash << std::dec
              << ", CRC32 and reserved bytes verified.\n";
}

// Runs the reporter from a trap and returns the frame it drew.
std::vector<uint8_t> report_frame(machine_t& m)
{
    auto before = diagnostics(m);
    run_reporter(m);
    require(diagnostics(m) == before, "reporter modified the trap context or stack snapshot");
    auto frame = framebuffer(m);
    check_report(frame);
    return frame;
}

std::vector<uint8_t> test_invalid_secondary(char const* hex, char const* lst,
                                            char const* image_path, char const* listing,
                                            uint16_t salt)
{
    machine_t m(hex, lst, image_path);
    m.entry = symbol(listing, "__avm_trap_entry", false);
    m.report = symbol(listing, "__avm_trap_report", false);
    uint32_t site = symbol(listing, "invalid_secondary_site", false);
    m.at(site);
    auto fatal = fault_at(m, site, 0x0950, salt);
    require(fatal.reason == 3, "invalid-secondary reason is not 3");
    m.until([&] { return m.boundary() && guest_pc(m.cpu()) == m.entry; }, 500000,
            "trap entry");
    check_context(m, fatal);
    check_trampoline(m, fatal);
    auto frame = report_frame(m);
    std::cout << "Invalid-secondary trap (register salt 0x" << std::hex << salt << std::dec
              << "): context, stack copy, SP reset, and BR5N report verified.\n";
    return frame;
}

std::vector<uint8_t> test_stack_overflow(char const* hex, char const* lst,
                                         char const* image_path, char const* listing)
{
    machine_t m(hex, lst, image_path);
    m.entry = symbol(listing, "__avm_trap_entry", false);
    m.report = symbol(listing, "__avm_trap_report", false);
    uint32_t site = symbol(listing, "overflow_site", false);
    m.at(site);
    auto fatal = fault_at(m, site, 0x0900);
    require(fatal.reason == 1, "stack-overflow reason is not 1");
    m.until([&] { return m.boundary() && guest_pc(m.cpu()) == m.entry; }, 500000,
            "trap entry");
    check_context(m, fatal);
    check_trampoline(m, fatal);
    auto frame = report_frame(m);
    std::cout << "Stack-overflow trap: post-fault SP, registers, flags, snapshot, and BR5N report verified.\n";
    return frame;
}

void test_reentrant(char const* hex, char const* lst, char const* image_path,
                    char const* listing)
{
    machine_t m(hex, lst, image_path);
    m.entry = symbol(listing, "__avm_trap_entry", false);
    m.report = symbol(listing, "__avm_trap_report", false);
    uint32_t site = symbol(listing, "invalid_secondary_site", false);
    auto site_state = m.at(site);
    auto fatal = fault_at(m, site, 0x0950);
    m.until([&] { return m.boundary() && guest_pc(m.cpu()) == m.entry; }, 500000,
            "trap entry");
    check_context(m, fatal);
    // Capture the first trap's SRAM image, then reenter the same fault site
    // with that image and the trap-active flag. Only the native state comes
    // from the saved boundary, so the second trap is an ordinary fatal dispatch.
    std::vector<uint8_t> first(m.cpu().data.begin(), m.cpu().data.begin() + 0x0b00);
    m.restore(site_state);
    for(unsigned address = 0x100; address < 0x0b00; ++address)
        m.cpu().data[address] = first[address];
    auto& cpu = m.cpu();
    require(cpu.data[kStartupFlags] & kTrapActive, "reentry state lost trap-active flag");
    bool entered = false;
    m.until([&] {
        if(m.boundary() && guest_pc(cpu) == m.entry)
            entered = true;
        return cpu.pc == m.terminal;
    }, 500000, "reentrant trap terminal loop");
    require(!entered, "reentrant trap reentered the guest handler");
    std::vector<uint8_t> frozen(cpu.data.begin(), cpu.data.end());
    uint32_t pc = guest_pc(cpu);
    for(unsigned i = 0; i < 20000; ++i) {
        m.tick();
        require(cpu.pc == m.terminal, "reentrant trap left the terminal loop");
        require(!(m.boundary() && guest_pc(cpu) != pc), "guest instruction executed after reentry");
    }
    require(std::vector<uint8_t>(cpu.data.begin(), cpu.data.end()) == frozen,
            "reentrant trap modified state");
    for(unsigned address = 0x100; address < 0x0b00; ++address)
        require(frozen[address] == first[address], "reentrant trap changed the context or snapshot");
    std::cout << "Reentrant trap: terminal loop reached with no guest reentry, context, snapshot, or state change.\n";
}

void test_high_address(char const* hex, char const* lst, char const* image_path,
                       char const* listing)
{
    machine_t m(hex, lst, image_path);
    auto image = read_file(image_path);
    uint32_t entry = symbol(listing, "__avm_trap_entry", false);
    require(entry > 0xffff, "high trap entry is not above 0xFFFF");
    require(image_u24(image, 0x0c) == entry, "high header trapEntry differs");
    uint32_t site = symbol(listing, "high_site", false);
    m.at(site);
    fault_at(m, site, 0x0950);
    m.until([&] { return m.boundary() && guest_pc(m.cpu()) == entry; }, 500000,
            "high trap entry");
    m.until([&] { return m.cpu().data[0x0220] == 0xa5; }, 500000,
            "high-address handler marker");
    std::cout << "High-address trap: handler at 0x" << std::hex << entry << std::dec
              << " reached and executed its marker.\n";
}
}

int main(int argc, char** argv)
{
    try {
        require(argc == 7, "usage: avm_trap_dispatch_tests interp.hex interp.lst trap.bin trap.asm high.bin high.asm");
        test_header(argv[3], argv[4]);
        auto invalid = test_invalid_secondary(argv[1], argv[2], argv[3], argv[4], 0);
        auto salted = test_invalid_secondary(argv[1], argv[2], argv[3], argv[4], 0x0101);
        check_distinct(invalid, salted, "changed register values");
        auto overflow = test_stack_overflow(argv[1], argv[2], argv[3], argv[4]);
        check_distinct(invalid, overflow, "changed trap reason and PC");
        test_reentrant(argv[1], argv[2], argv[3], argv[4]);
        test_high_address(argv[1], argv[2], argv[5], argv[6]);
        std::cout << "Trap dispatch integration tests passed.\n";
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
