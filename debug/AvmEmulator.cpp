#include "AvmEmulator.h"

#include <absim.hpp>
#include <absim_regs.hpp>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/Support/SHA256.h>

#include <algorithm>
#include <array>
#include <chrono>
#include <fstream>
#include <iterator>
#include <limits>
#include <regex>
#include <stdexcept>
#include <string>
#include <thread>

namespace avm_debug {
namespace {
namespace fs = std::filesystem;

std::string read_file(fs::path const& path) {
  std::ifstream stream(path, std::ios::binary);
  if (!stream)
    throw std::runtime_error("cannot open " + path.string());
  return {std::istreambuf_iterator<char>(stream), {}};
}

std::string sha256(llvm::ArrayRef<uint8_t> bytes) {
  auto hash = llvm::SHA256::hash(bytes);
  return llvm::toHex(llvm::ArrayRef<uint8_t>(hash), true);
}

std::string sha256(std::string const& bytes) {
  return sha256(llvm::ArrayRef<uint8_t>(
      reinterpret_cast<uint8_t const*>(bytes.data()), bytes.size()));
}

uint32_t number(std::string const& json, char const* key) {
  std::smatch match;
  if (!std::regex_search(json, match,
                         std::regex(std::string("\"") + key + "\"\\s*:\\s*([0-9]+)")))
    throw std::runtime_error(std::string("boundary metadata lacks ") + key);
  return static_cast<uint32_t>(std::stoul(match[1]));
}

std::string quoted(std::string const& json, char const* key) {
  std::smatch match;
  if (!std::regex_search(json, match,
                         std::regex(std::string("\"") + key + "\"\\s*:\\s*\"([^\"]+)\"")))
    throw std::runtime_error(std::string("boundary metadata lacks ") + key);
  return match[1];
}

uint32_t read_entry(fs::path const& path) {
  std::string bytes = read_file(path);
  if (bytes.size() < 52 || bytes[0] != '\x7f' || bytes.substr(1, 3) != "ELF" ||
      uint8_t(bytes[4]) != 1 || uint8_t(bytes[5]) != 1 ||
      uint8_t(bytes[16]) != 2 || uint8_t(bytes[18]) != 0x56 ||
      uint8_t(bytes[19]) != 0x41 || uint8_t(bytes[36]) != 1)
    throw std::runtime_error("expected an AVM ABI-v1 ELF32LE executable");
  uint32_t entry = 0;
  for (unsigned i = 0; i < 4; ++i)
    entry |= uint32_t(uint8_t(bytes[24 + i])) << (i * 8);
  if (entry > 0xffffff)
    throw std::runtime_error("AVM entry exceeds program address space");
  return entry;
}

void load_file(absim::arduboy_t& arduboy, fs::path const& path,
               char const* name) {
  std::ifstream stream(path, std::ios::binary);
  if (!stream)
    throw std::runtime_error("cannot open " + path.string());
  std::string error = arduboy.load_file(name, stream);
  if (!error.empty())
    throw std::runtime_error(path.string() + ": " + error);
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu) {
  uint32_t next = uint32_t(cpu.data[4]) |
                  uint32_t(cpu.data[5]) << 8 |
                  uint32_t(cpu.data[6]) << 16;
  return next;
}

void checked_add(uint64_t& destination, uint64_t increment) {
  if (increment > UINT64_MAX - destination)
    throw std::overflow_error("AVM profile counter overflow");
  destination += increment;
}

char const* stop_name(StopReason reason) {
  switch (reason) {
  case StopReason::Entry: return "entry";
  case StopReason::Breakpoint: return "breakpoint";
  case StopReason::Watchpoint: return "watchpoint";
  case StopReason::DebugBreak: return "debug_break";
  case StopReason::Step: return "step";
  case StopReason::Deadline: return "deadline";
  case StopReason::Fault: return "fault";
  case StopReason::Interrupt: return "interrupt";
  }
  return "unknown";
}
} // namespace

Emulator::Emulator() : emulator_(std::make_unique<absim::arduboy_t>()) {}
Emulator::~Emulator() = default;

Stop Emulator::load(fs::path const& elf, fs::path const& image,
                    fs::path const& firmware, fs::path const& boundary_metadata) {
  loaded_ = false;
  profile_ = {};
  emulator_->profiler_state.enabled = false;
  std::string metadata = read_file(boundary_metadata);
  if (number(metadata, "schema") != 1 ||
      number(metadata, "primary_slot_words") != 4 ||
      number(metadata, "primary_slot_count") != 256)
    throw std::runtime_error("unsupported interpreter boundary metadata");
  table_word_ = number(metadata, "primary_table_avr_word");
  std::string hex = read_file(firmware);
  if (sha256(hex) != quoted(metadata, "interpreter_hex_sha256"))
    throw std::runtime_error("interpreter firmware hash does not match boundary metadata");
  entry_ = read_entry(elf);
  std::string image_bytes = read_file(image);
  if (image_bytes.size() < 0x100 || image_bytes.substr(0, 4) != "AVM\x01" ||
      uint8_t(image_bytes[5]) != (entry_ & 0xff) ||
      uint8_t(image_bytes[6]) != ((entry_ >> 8) & 0xff) ||
      uint8_t(image_bytes[7]) != (entry_ >> 16))
    throw std::runtime_error("packaged image does not match ELF entry");

  emulator_->reset();
  load_file(*emulator_, firmware, "interpreter.hex");
  load_file(*emulator_, image, "fxdata.bin");
  auto& cpu = emulator_->core_state.cpu;
  cpu.no_merged = true;
  cpu.autobreaks.reset();
  pending_watch_.reset();
  pending_debug_break_ = false;
  buttons_ = 0;
  events_.clear();
  button_history_.clear();
  replay_identity_ = {};
  profile_identity_ = {};
  next_event_ = 0;
  interrupted_ = false;
  for (uint64_t advances = 0; advances < 20000000; ++advances) {
    if (at_boundary() && guest_pc(cpu) == entry_) {
      entry_cycle_ = cpu.cycle_count;
      loaded_ = true;
      active_instruction_pc_ = entry_;
      rebuild_watchpoint_bits();
      replay_identity_.elf_sha256 = sha256(read_file(elf));
      replay_identity_.image_sha256 = sha256(image_bytes);
      replay_identity_.interpreter_sha256 = sha256(hex);
      replay_identity_.eeprom_sha256 = sha256(llvm::ArrayRef<uint8_t>(cpu.eeprom));
      replay_identity_.fxsave_sha256 = sha256(llvm::ArrayRef<uint8_t>(
          emulator_->program_state.fxsave));
      replay_identity_.adc_seed = cpu.adc_seed;
      replay_identity_.adc_nondeterminism = cpu.adc_nondeterminism;
      replay_identity_.usb_bus_state = unsigned(cpu.usb.bus_state);
      return {StopReason::Entry, snapshot(), entry_cycle_};
    }
    emulator_->cycle();
    cpu.update_all();
    if (cpu.should_autobreak())
      throw std::runtime_error("interpreter fault before AVM entry");
  }
  throw std::runtime_error("AVM entry boundary was not reached");
}

bool Emulator::at_boundary() const {
  uint32_t pc = emulator_->core_state.cpu.pc;
  return pc >= table_word_ && pc < table_word_ + 1024 &&
         (pc - table_word_) % 4 == 0;
}

Snapshot Emulator::snapshot() const {
  if (!loaded_ && !at_boundary())
    throw std::runtime_error("emulator is not stopped at an AVM boundary");
  auto const& cpu = emulator_->core_state.cpu;
  Snapshot result;
  result.pc = guest_pc(cpu);
  for (unsigned i = 0; i < 8; ++i)
    result.registers[i] = uint16_t(cpu.data[8 + 2*i]) |
                          uint16_t(cpu.data[9 + 2*i]) << 8;
  result.sp = uint16_t(cpu.data[28]) | uint16_t(cpu.data[29]) << 8;
  result.cc = cpu.data[absim::reg::addr::GPIOR0] & 7;
  result.cycles = cpu.cycle_count;
  return result;
}

void Emulator::write_register(unsigned number, uint64_t value) {
  if (!loaded_ || !at_boundary())
    throw std::runtime_error("AVM registers can only be written at a stop boundary");
  auto& cpu = emulator_->core_state.cpu;
  auto write16 = [&](unsigned index, uint16_t word) {
    cpu.data[index] = uint8_t(word);
    cpu.data[index + 1] = uint8_t(word >> 8);
  };
  if (number < 8) {
    if (value > UINT16_MAX)
      throw std::out_of_range("AVM general register is 16 bits");
    write16(8 + number * 2, uint16_t(value));
  } else if (number == 8) {
    if (value < 0x100 || value > 0xa00)
      throw std::out_of_range("AVM stack pointer is outside data RAM");
    write16(28, uint16_t(value));
  } else if (number == 9) {
    if (value > 0xffffff || value >= program_size())
      throw std::out_of_range("AVM program counter is outside the image");
    uint32_t address = uint32_t(value);
    uint8_t opcode = read_program(address, 1)[0];
    cpu.data[4] = uint8_t(address);
    cpu.data[5] = uint8_t(address >> 8);
    cpu.data[6] = uint8_t(address >> 16);
    cpu.pc = table_word_ + 4u * opcode;
    active_instruction_pc_ = address;
    if (profile_.running) {
      // A debugger PC write changes the next instruction without advancing
      // emulated time. Keep the discontinuity visible in the profile.
      checked_add(profile_.discontinuities, 1);
      profile_anchor_pc_ = address;
      profile_anchor_cycle_ = cpu.cycle_count;
    }
    pending_watch_.reset();
  } else if (number == 10) {
    if (value > 7)
      throw std::out_of_range("AVM condition codes use three bits");
    cpu.data[absim::reg::addr::GPIOR0] =
        (cpu.data[absim::reg::addr::GPIOR0] & ~uint8_t(7)) | uint8_t(value);
  } else if (number < 15) {
    if (value > UINT32_MAX)
      throw std::out_of_range("AVM register pair is 32 bits");
    unsigned first = (number - 11) * 2;
    write16(8 + first * 2, uint16_t(value));
    write16(8 + (first + 1) * 2, uint16_t(value >> 16));
  } else {
    throw std::out_of_range("unknown AVM register");
  }
}

void Emulator::add_breakpoint(uint32_t address) {
  if (address > 0xffffff) throw std::out_of_range("AVM breakpoint address");
  breakpoints_.insert(address);
}
void Emulator::remove_breakpoint(uint32_t address) { breakpoints_.erase(address); }
void Emulator::clear_breakpoints() { breakpoints_.clear(); }

void Emulator::add_watchpoint(uint64_t id, uint16_t address, uint16_t size,
                              bool read, bool write) {
  if (!loaded_ || !size || address < 0x100 ||
      uint32_t(address) + size > 0xa00 || (!read && !write))
    throw std::invalid_argument("unsupported AVM watchpoint range or access");
  remove_watchpoint(id);
  watchpoints_.push_back({id, address, size, read, write});
  rebuild_watchpoint_bits();
}

void Emulator::remove_watchpoint(uint64_t id) {
  watchpoints_.erase(std::remove_if(watchpoints_.begin(), watchpoints_.end(),
                                   [id](WatchRange const& range) {
                                     return range.id == id;
                                   }), watchpoints_.end());
  rebuild_watchpoint_bits();
}

void Emulator::rebuild_watchpoint_bits() {
  auto& debugger = emulator_->debugger_state;
  debugger.breakpoints_rd.reset();
  debugger.breakpoints_wr.reset();
  for (WatchRange const& range : watchpoints_) {
    for (uint32_t address = range.address;
         address < uint32_t(range.address) + range.size; ++address) {
      if (range.read) debugger.breakpoints_rd.set(address);
      if (range.write) debugger.breakpoints_wr.set(address);
    }
  }
  debugger.allow_nonstep_breakpoints = !watchpoints_.empty();
}

void Emulator::inspect_accesses() {
  if (pending_watch_ || watchpoints_.empty())
    return;
  auto const& cpu = emulator_->core_state.cpu;
  auto const& debugger = emulator_->debugger_state;
  for (bool write : {false, true}) {
    uint32_t address = write ? cpu.just_written : cpu.just_read;
    if (address >= cpu.data.size() ||
        !(write ? debugger.breakpoints_wr.test(address)
                 : debugger.breakpoints_rd.test(address)))
      continue;
    for (WatchRange const& range : watchpoints_) {
      if (address >= range.address &&
          address < uint32_t(range.address) + range.size &&
          (write ? range.write : range.read)) {
        pending_watch_ = WatchAccess{range.id, active_instruction_pc_,
                                     uint16_t(address), cpu.data[address],
                                     cpu.cycle_count, write};
        return;
      }
    }
  }
}

void Emulator::apply_buttons(uint8_t pressed) {
  if (pressed & ~uint8_t(0x3f))
    throw std::invalid_argument("unknown AVM button bit");
  buttons_ = pressed;
  auto& cpu = emulator_->core_state.cpu;
  button_history_.push_back({cpu.cycle_count, pressed});
  uint8_t pinf = 0xf0;
  if (pressed & Up) pinf &= ~uint8_t(0x80);
  if (pressed & Right) pinf &= ~uint8_t(0x40);
  if (pressed & Left) pinf &= ~uint8_t(0x20);
  if (pressed & Down) pinf &= ~uint8_t(0x10);
  uint8_t pine = (pressed & A) ? 0 : 0x40;
  uint8_t pinb = (pressed & B) ? 0 : 0x10;
  cpu.data[absim::reg::addr::PINF] = pinf;
  cpu.data[absim::reg::addr::PINE] = pine;
  cpu.data[absim::reg::addr::PINB] = pinb;
  emulator_->debugger_state.input_history.push_back(
      {cpu.cycle_count, pinb, pine, pinf});
}

void Emulator::set_buttons(uint8_t pressed) {
  if (!loaded_) throw std::runtime_error("AVM image is not loaded");
  apply_buttons(pressed);
}

void Emulator::schedule_buttons(std::vector<TimedButtons> events) {
  if (!loaded_) throw std::runtime_error("AVM image is not loaded");
  uint64_t last = emulator_->core_state.cpu.cycle_count;
  for (auto const& event : events) {
    if (event.cycle < last || event.pressed & ~uint8_t(0x3f))
      throw std::invalid_argument("button events must be ordered future cycles with valid masks");
    last = event.cycle;
  }
  events_ = std::move(events);
  next_event_ = 0;
}

size_t Emulator::pending_events() const { return events_.size() - next_event_; }

void Emulator::clear_scheduled_buttons() {
  events_.clear();
  next_event_ = 0;
}

void Emulator::apply_due_events() {
  uint64_t cycle = emulator_->core_state.cpu.cycle_count;
  while (next_event_ < events_.size() && events_[next_event_].cycle <= cycle)
    apply_buttons(events_[next_event_++].pressed);
}

void Emulator::profile_start(bool native) {
  if (!loaded_ || !at_boundary())
    throw std::runtime_error("profiling requires a stopped AVM boundary");
  if (profile_.running)
    throw std::runtime_error("AVM profile is already running");
  Snapshot state = snapshot();
  profile_ = {};
  profile_.running = true;
  profile_.native = native;
  profile_.start_cycle = profile_.end_cycle = state.cycles;
  profile_.start_pc = profile_.end_pc = state.pc;
  profile_anchor_cycle_ = state.cycles;
  profile_anchor_pc_ = state.pc;
  profile_identity_ = replay_identity_;
  auto const& cpu = emulator_->core_state.cpu;
  profile_identity_.eeprom_sha256 = sha256(llvm::ArrayRef<uint8_t>(cpu.eeprom));
  profile_identity_.fxsave_sha256 = sha256(llvm::ArrayRef<uint8_t>(
      emulator_->program_state.fxsave));
  profile_identity_.adc_seed = cpu.adc_seed;
  profile_identity_.adc_nondeterminism = cpu.adc_nondeterminism;
  profile_identity_.usb_bus_state = unsigned(cpu.usb.bus_state);
  if (native) {
    auto& native_state = emulator_->profiler_state;
    native_state.counts.fill(0);
    native_start_active_ = native_state.total;
    native_start_elapsed_ = native_state.total_with_sleep;
    native_state.enabled = true;
  }
}

void Emulator::profile_boundary(Snapshot const& state) {
  if (!profile_.running) return;
  if (state.cycles < profile_anchor_cycle_)
    throw std::overflow_error("AVM profile cycle counter moved backwards");
  uint64_t delta = state.cycles - profile_anchor_cycle_;
  auto& counter = profile_.pcs[profile_anchor_pc_];
  checked_add(counter.cycles, delta);
  checked_add(counter.count, 1);
  checked_add(profile_.completed_cycles, delta);
  profile_anchor_cycle_ = state.cycles;
  profile_anchor_pc_ = state.pc;
  profile_.end_cycle = state.cycles;
  profile_.end_pc = state.pc;
}

ProfileSnapshot Emulator::profile_stop(Stop const& stop, bool complete) {
  if (!profile_.running)
    throw std::runtime_error("no AVM profile is running");
  if (stop.reason != StopReason::Fault && !at_boundary())
    throw std::runtime_error("profile stop requires an AVM boundary");
  // The last LLDB stop predates any register edits made while stopped.
  // Read the current boundary so a PC write is reflected in the end state.
  Snapshot end_state = stop.reason == StopReason::Fault ? stop.state : snapshot();
  uint64_t end_cycle = stop.fault_cycle.value_or(end_state.cycles);
  if (end_cycle < profile_anchor_cycle_)
    throw std::overflow_error("AVM profile stop precedes its anchor");
  profile_.partial_cycles = end_cycle - profile_anchor_cycle_;
  profile_.end_cycle = end_cycle;
  profile_.end_pc = end_state.pc;
  profile_.complete = complete && stop.reason != StopReason::Fault;
  profile_.stop_reason = stop.detail.empty() ? stop_name(stop.reason) : stop.detail;
  profile_.running = false;
  if (profile_.native) {
    auto& native_state = emulator_->profiler_state;
    native_state.enabled = false;
    if (native_state.total < native_start_active_ ||
        native_state.total_with_sleep < native_start_elapsed_)
      throw std::overflow_error("native profiler totals moved backwards");
    profile_.native_active_cycles = native_state.total - native_start_active_;
    profile_.native_elapsed_cycles = native_state.total_with_sleep - native_start_elapsed_;
    for (size_t i = 0; i < native_state.counts.size(); ++i)
      if (native_state.counts[i])
        profile_.native_pcs.emplace(uint32_t(i * 2), native_state.counts[i]);
  }
  if (profile_.completed_cycles > end_cycle - profile_.start_cycle ||
      profile_.partial_cycles != end_cycle - profile_.start_cycle -
                                 profile_.completed_cycles)
    throw std::runtime_error("AVM profile cycle reconciliation failed");
  return profile_;
}

ProfileSnapshot Emulator::profile_snapshot() const {
  if (!loaded_)
    throw std::runtime_error("AVM image is not loaded");
  ProfileSnapshot result = profile_;
  if (result.running && at_boundary()) {
    auto state = snapshot();
    result.end_cycle = state.cycles;
    result.end_pc = state.pc;
  }
  return result;
}

Stop Emulator::run(uint64_t deadline, bool single_step) {
  if (!loaded_) throw std::runtime_error("AVM image is not loaded");
  auto& cpu = emulator_->core_state.cpu;
  interrupted_ = false;
  Snapshot last_coherent = snapshot();
  uint64_t advances_without_boundary = 0;
  auto anchor = std::chrono::steady_clock::now();
  uint64_t anchor_cycle = cpu.cycle_count;
  for (;;) {
    apply_due_events();
    emulator_->cycle();
    inspect_accesses();
    cpu.update_all();
    // An invalid dispatch can spin inside the interpreter without another
    // guest boundary or an Ardens autobreak. Bound that case explicitly.
    if (++advances_without_boundary > 2000000) {
      Stop stalled{StopReason::Fault, last_coherent, deadline};
      stalled.fault_cycle = cpu.cycle_count;
      stalled.detail = "boundary_timeout";
      return stalled;
    }
    if (cpu.autobreaks.test(absim::AB_BREAK)) {
      cpu.autobreaks.reset(absim::AB_BREAK);
      pending_debug_break_ = true;
    }
    if (cpu.should_autobreak()) {
      Stop fault{StopReason::Fault, last_coherent, deadline};
      fault.fault_cycle = cpu.cycle_count;
      return fault;
    }
    if (!at_boundary()) continue;
    advances_without_boundary = 0;
    apply_due_events();
    Snapshot state = snapshot();
    profile_boundary(state);
    last_coherent = state;
    if (pending_watch_) {
      Stop stopped{StopReason::Watchpoint, state, deadline, pending_watch_};
      pending_watch_.reset();
      active_instruction_pc_ = state.pc;
      return stopped;
    }
    if (pending_debug_break_) {
      pending_debug_break_ = false;
      active_instruction_pc_ = state.pc;
      return {StopReason::DebugBreak, state, deadline};
    }
    active_instruction_pc_ = state.pc;
    if (interrupted_.load())
      return {StopReason::Interrupt, state, deadline};
    if (single_step)
      return {StopReason::Step, state, deadline};
    if (breakpoints_.find(state.pc) != breakpoints_.end())
      return {StopReason::Breakpoint, state, deadline};
    if (state.cycles >= deadline)
      return {StopReason::Deadline, state, deadline};
    if (realtime_ && state.cycles - anchor_cycle >= 16000) {
      uint64_t elapsed_cycles = state.cycles - anchor_cycle;
      auto elapsed = std::chrono::seconds(elapsed_cycles / 16000000ULL) +
          std::chrono::nanoseconds((elapsed_cycles % 16000000ULL) *
                                   1000000000ULL / 16000000ULL);
      std::this_thread::sleep_until(anchor + elapsed);
    }
  }
}

Stop Emulator::continue_execution() {
  return run(std::numeric_limits<uint64_t>::max(), false);
}
Stop Emulator::step() { return run(std::numeric_limits<uint64_t>::max(), true); }
Stop Emulator::run_for(uint64_t cycles) {
  uint64_t now = snapshot().cycles;
  if (!cycles)
    return {StopReason::Deadline, snapshot(), now};
  if (cycles > std::numeric_limits<uint64_t>::max() - now)
    throw std::overflow_error("AVM run duration overflows cycle counter");
  return run(now + cycles, false);
}

std::vector<uint8_t> Emulator::read_data(uint16_t address, size_t size) const {
  if (!loaded_ || uint64_t(address) + size > 0xa00)
    throw std::out_of_range("AVM data read is outside supported RAM");
  auto const& data = emulator_->core_state.cpu.data;
  return {data.begin() + address, data.begin() + address + size};
}

void Emulator::write_data(uint16_t address, std::vector<uint8_t> const& bytes) {
  if (!loaded_ || address < 0x100 || uint64_t(address) + bytes.size() > 0xa00)
    throw std::out_of_range("AVM data write is outside supported RAM");
  auto& data = emulator_->core_state.cpu.data;
  std::copy(bytes.begin(), bytes.end(), data.begin() + address);
}

std::vector<uint8_t> Emulator::read_program(uint32_t address, size_t size) const {
  if (!loaded_ || address > 0xffffff ||
      uint64_t(address) + size > emulator_->program_state.fxdata.size())
    throw std::out_of_range("AVM program read is outside packaged image");
  absim::w25q128_t::fx_data_save_layout_t layout{};
  if (!absim::w25q128_t::make_data_save_layout(
          emulator_->program_state.fxdata.size(),
          emulator_->program_state.fxsave.size(), layout))
    throw std::runtime_error("invalid Ardens FX data/save layout");
  std::vector<uint8_t> result(size);
  for (size_t i = 0; i < size; ++i)
    result[i] = emulator_->peripherals.fx.read_byte(layout.data_offset +
                                                    address + i);
  return result;
}

size_t Emulator::program_size() const {
  return loaded_ ? emulator_->program_state.fxdata.size() : 0;
}

std::vector<uint8_t> Emulator::logical_framebuffer() const {
  return read_data(0x500, 1024);
}
std::vector<uint8_t> Emulator::controller_ram() const {
  if (!loaded_) throw std::runtime_error("AVM image is not loaded");
  auto const& ram = emulator_->peripherals.display.ram;
  return {ram.begin(), ram.end()};
}
std::vector<uint8_t> Emulator::visible_pixels() const {
  if (!loaded_) throw std::runtime_error("AVM image is not loaded");
  auto const& pixels = emulator_->peripherals.display.filtered_pixels;
  return {pixels.begin(), pixels.end()};
}

} // namespace avm_debug
