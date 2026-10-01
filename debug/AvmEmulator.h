#pragma once

#include <array>
#include <atomic>
#include <cstddef>
#include <cstdint>
#include <filesystem>
#include <memory>
#include <map>
#include <optional>
#include <set>
#include <string>
#include <vector>

namespace absim { struct arduboy_t; }

namespace avm_debug {

enum Button : uint8_t {
  Up = 1 << 0, Right = 1 << 1, Left = 1 << 2,
  Down = 1 << 3, A = 1 << 4, B = 1 << 5,
};

struct Snapshot {
  uint32_t pc = 0;
  std::array<uint16_t, 8> registers{};
  uint16_t sp = 0;
  uint8_t cc = 0;
  uint64_t cycles = 0;
};

enum class StopReason { Entry, Breakpoint, Watchpoint, DebugBreak, Step, Deadline, Fault, Interrupt };

struct WatchAccess {
  uint64_t id = 0;
  uint32_t instruction_pc = 0;
  uint16_t address = 0;
  uint8_t value = 0;
  uint64_t cycle = 0;
  bool write = false;
};

struct Stop {
  StopReason reason = StopReason::Entry;
  Snapshot state;
  uint64_t requested_cycle = 0;
  std::optional<WatchAccess> access;
  std::optional<uint64_t> fault_cycle;
  std::string detail;
};

struct TimedButtons {
  uint64_t cycle = 0;
  uint8_t pressed = 0;
};

struct ReplayIdentity {
  std::string elf_sha256;
  std::string image_sha256;
  std::string interpreter_sha256;
  std::string eeprom_sha256;
  std::string fxsave_sha256;
  uint32_t adc_seed = 0;
  bool adc_nondeterminism = false;
  uint32_t usb_bus_state = 0;
};

struct ProfileCounter {
  uint64_t cycles = 0;
  uint64_t count = 0;
};

// A copyable, immutable-at-the-call-site view of a measurement window. All
// guest costs are elapsed AVR cycles between coherent AVM boundaries.
struct ProfileSnapshot {
  bool running = false;
  bool complete = false;
  bool native = false;
  uint64_t start_cycle = 0;
  uint64_t end_cycle = 0;
  uint32_t start_pc = 0;
  uint32_t end_pc = 0;
  uint64_t completed_cycles = 0;
  uint64_t partial_cycles = 0;
  uint64_t discontinuities = 0;
  uint64_t native_active_cycles = 0;
  uint64_t native_elapsed_cycles = 0;
  std::string stop_reason;
  std::map<uint32_t, ProfileCounter> pcs;
  // Keys are AVR byte addresses, deliberately separate from AVM PCs.
  std::map<uint32_t, uint64_t> native_pcs;
};

class Emulator {
public:
  Emulator();
  ~Emulator();
  Emulator(Emulator const&) = delete;
  Emulator& operator=(Emulator const&) = delete;

  Stop load(std::filesystem::path const& elf,
            std::filesystem::path const& image,
            std::filesystem::path const& firmware,
            std::filesystem::path const& boundary_metadata);
  Snapshot snapshot() const;
  void write_register(unsigned number, uint64_t value);
  Stop continue_execution();
  Stop step();
  Stop run_for(uint64_t cycles);
  void interrupt() { interrupted_.store(true); }

  void add_breakpoint(uint32_t address);
  void remove_breakpoint(uint32_t address);
  void clear_breakpoints();
  void add_watchpoint(uint64_t id, uint16_t address, uint16_t size,
                      bool read, bool write);
  void remove_watchpoint(uint64_t id);

  void set_buttons(uint8_t pressed);
  uint8_t buttons() const { return buttons_; }
  void schedule_buttons(std::vector<TimedButtons> events);
  void clear_scheduled_buttons();
  size_t pending_events() const;
  void set_realtime(bool enabled) { realtime_ = enabled; }
  bool realtime() const { return realtime_; }
  uint64_t entry_cycle() const { return entry_cycle_; }
  void profile_start(bool native = false);
  ProfileSnapshot profile_stop(Stop const& stop, bool complete = true);
  ProfileSnapshot profile_snapshot() const;
  ReplayIdentity const& replay_identity() const { return replay_identity_; }
  ReplayIdentity const& profile_identity() const { return profile_identity_; }
  std::vector<TimedButtons> const& button_history() const {
    return button_history_;
  }

  std::vector<uint8_t> read_data(uint16_t address, size_t size) const;
  void write_data(uint16_t address, std::vector<uint8_t> const& bytes);
  std::vector<uint8_t> read_program(uint32_t address, size_t size) const;
  size_t program_size() const;
  std::vector<uint8_t> logical_framebuffer() const;
  std::vector<uint8_t> controller_ram() const;
  std::vector<uint8_t> visible_pixels() const;

private:
  Stop run(uint64_t deadline, bool single_step);
  bool at_boundary() const;
  void apply_buttons(uint8_t pressed);
  void apply_due_events();
  void inspect_accesses();
  void rebuild_watchpoint_bits();
  void profile_boundary(Snapshot const& state);
  struct WatchRange {
    uint64_t id;
    uint16_t address;
    uint16_t size;
    bool read;
    bool write;
  };
  std::unique_ptr<absim::arduboy_t> emulator_;
  uint32_t table_word_ = 0;
  uint32_t entry_ = 0;
  uint64_t entry_cycle_ = 0;
  uint8_t buttons_ = 0;
  bool realtime_ = false;
  bool loaded_ = false;
  std::atomic<bool> interrupted_{false};
  std::set<uint32_t> breakpoints_;
  std::vector<WatchRange> watchpoints_;
  std::optional<WatchAccess> pending_watch_;
  bool pending_debug_break_ = false;
  uint32_t active_instruction_pc_ = 0;
  std::vector<TimedButtons> events_;
  std::vector<TimedButtons> button_history_;
  ReplayIdentity replay_identity_;
  ReplayIdentity profile_identity_;
  size_t next_event_ = 0;
  ProfileSnapshot profile_;
  uint64_t profile_anchor_cycle_ = 0;
  uint32_t profile_anchor_pc_ = 0;
  uint64_t native_start_active_ = 0;
  uint64_t native_start_elapsed_ = 0;
};

} // namespace avm_debug
