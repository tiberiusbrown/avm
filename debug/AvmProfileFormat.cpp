#include "AvmProfile.h"

#include <llvm/Support/Error.h>
#include <llvm/Support/FormatVariadic.h>
#include <llvm/Support/JSON.h>

#include <charconv>
#include <fstream>
#include <iterator>
#include <limits>
#include <stdexcept>

namespace avm_debug {
namespace {
namespace fs = std::filesystem;

void add(uint64_t& target, uint64_t value) {
  if (value > UINT64_MAX - target)
    throw std::invalid_argument("profile counters overflow 64 bits");
  target += value;
}

std::string required_string(llvm::json::Object const& object,
                            llvm::StringRef field) {
  auto value = object.getString(field);
  if (!value) throw std::invalid_argument("profile lacks string " + field.str());
  return value->str();
}

uint64_t decimal(llvm::json::Object const& object, llvm::StringRef field) {
  std::string value = required_string(object, field);
  if (value.empty() || (value.size() > 1 && value[0] == '0'))
    throw std::invalid_argument("invalid profile counter " + field.str());
  uint64_t result = 0;
  auto parsed = std::from_chars(value.data(), value.data() + value.size(), result);
  if (parsed.ec != std::errc() || parsed.ptr != value.data() + value.size())
    throw std::invalid_argument("invalid or overflowed profile counter " + field.str());
  return result;
}

uint32_t small(llvm::json::Object const& object, llvm::StringRef field,
               uint32_t maximum) {
  auto value = object.getInteger(field);
  if (!value || *value < 0 || uint64_t(*value) > maximum)
    throw std::invalid_argument("invalid profile field " + field.str());
  return uint32_t(*value);
}

bool boolean(llvm::json::Object const& object, llvm::StringRef field) {
  auto value = object.getBoolean(field);
  if (!value) throw std::invalid_argument("profile lacks boolean " + field.str());
  return *value;
}

llvm::json::Object const& object(llvm::json::Object const& parent,
                                 llvm::StringRef field) {
  auto* value = parent.getObject(field);
  if (!value) throw std::invalid_argument("profile lacks object " + field.str());
  return *value;
}

llvm::json::Array const& array(llvm::json::Object const& parent,
                               llvm::StringRef field) {
  auto* value = parent.getArray(field);
  if (!value) throw std::invalid_argument("profile lacks array " + field.str());
  return *value;
}

bool hash_or_empty(std::string const& value) {
  if (value.empty()) return true;
  if (value.size() != 64) return false;
  for (char digit : value)
    if (!((digit >= '0' && digit <= '9') ||
          (digit >= 'a' && digit <= 'f') ||
          (digit >= 'A' && digit <= 'F')))
      return false;
  return true;
}

void check_hash(std::string const& value, char const* name) {
  if (!hash_or_empty(value))
    throw std::invalid_argument(std::string("invalid profile hash ") + name);
}

void check_required_hash(std::string const& value, char const* name) {
  check_hash(value, name);
  if (value.empty())
    throw std::invalid_argument(std::string("profile lacks hash ") + name);
}

void validate(ProfileDocument const& profile) {
  auto const& window = profile.window;
  if (window.running || window.end_cycle < window.start_cycle ||
      window.start_pc > 0xffffff || window.end_pc > 0xffffff ||
      window.completed_cycles > window.end_cycle - window.start_cycle ||
      window.partial_cycles != window.end_cycle - window.start_cycle -
                                   window.completed_cycles)
    throw std::invalid_argument("profile window does not reconcile");
  if (profile.requested_end_cycle &&
      (profile.requested_end_cycle < window.start_cycle ||
       (window.complete && window.end_cycle < profile.requested_end_cycle)))
    throw std::invalid_argument("profile completion precedes requested end");
  static constexpr char const* reasons[] = {
      "entry", "breakpoint", "watchpoint", "debug_break", "step",
      "deadline", "fault", "interrupt", "boundary_timeout"};
  bool known_reason = false;
  for (auto const* reason : reasons)
    if (window.stop_reason == reason) known_reason = true;
  if (!known_reason ||
      (window.complete && (window.stop_reason == "fault" ||
                           window.stop_reason == "boundary_timeout")))
    throw std::invalid_argument("invalid profile stop reason or completeness");
  uint64_t sum = 0;
  std::map<uint32_t, bool> seen;
  for (auto const& row : profile.pcs) {
    if (row.pc > 0xffffff || !row.cost.count || !seen.emplace(row.pc, true).second)
      throw std::invalid_argument("invalid or duplicate AVM profile PC");
    add(sum, row.cost.cycles);
    check_hash(row.source_hash, "source");
  }
  if (sum != window.completed_cycles)
    throw std::invalid_argument("per-PC profile costs do not reconcile");
  if (!window.native && (!profile.native_pcs.empty() ||
                         window.native_active_cycles ||
                         window.native_elapsed_cycles))
    throw std::invalid_argument("native data in a guest-only profile");
  if (window.native &&
      window.native_active_cycles > window.native_elapsed_cycles)
    throw std::invalid_argument("native active cycles exceed native elapsed cycles");
  uint64_t native_sum = 0;
  std::map<uint32_t, bool> native_seen;
  for (auto const& row : profile.native_pcs) {
    if (!row.cycles || !native_seen.emplace(row.address, true).second)
      throw std::invalid_argument("invalid or duplicate native profile PC");
    add(native_sum, row.cycles);
  }
  if (native_sum > window.native_active_cycles)
    throw std::invalid_argument("native per-PC costs exceed active cycles");
  check_required_hash(profile.identity.elf_sha256, "ELF");
  check_required_hash(profile.identity.image_sha256, "image");
  check_required_hash(profile.identity.interpreter_sha256, "interpreter");
  check_required_hash(profile.identity.eeprom_sha256, "EEPROM");
  check_required_hash(profile.identity.fxsave_sha256, "FX save");
  check_required_hash(profile.replay_event_hash, "replay");
  check_required_hash(profile.end_display_hash, "display");
  check_hash(profile.interpreter_elf_sha256, "interpreter ELF");
}

llvm::json::Object identity_json(ReplayIdentity const& identity) {
  llvm::json::Object object;
  object["elf_sha256"] = identity.elf_sha256;
  object["image_sha256"] = identity.image_sha256;
  object["interpreter_sha256"] = identity.interpreter_sha256;
  object["eeprom_sha256"] = identity.eeprom_sha256;
  object["fxsave_sha256"] = identity.fxsave_sha256;
  object["adc_seed"] = identity.adc_seed;
  object["adc_nondeterminism"] = identity.adc_nondeterminism;
  object["usb_bus_state"] = identity.usb_bus_state;
  return object;
}

ReplayIdentity read_identity(llvm::json::Object const& object) {
  ReplayIdentity identity;
  identity.elf_sha256 = required_string(object, "elf_sha256");
  identity.image_sha256 = required_string(object, "image_sha256");
  identity.interpreter_sha256 = required_string(object, "interpreter_sha256");
  identity.eeprom_sha256 = required_string(object, "eeprom_sha256");
  identity.fxsave_sha256 = required_string(object, "fxsave_sha256");
  identity.adc_seed = small(object, "adc_seed", UINT32_MAX);
  identity.adc_nondeterminism = boolean(object, "adc_nondeterminism");
  identity.usb_bus_state = small(object, "usb_bus_state", UINT32_MAX);
  return identity;
}
} // namespace

ProfileDocument make_profile(ProfileSnapshot const& snapshot,
                             ReplayIdentity const& identity,
                             uint64_t requested_end_cycle,
                             std::string replay_event_hash,
                             std::string end_display_hash,
                             std::string replay_provenance) {
  ProfileDocument profile;
  profile.window = snapshot;
  profile.identity = identity;
  profile.requested_end_cycle = requested_end_cycle;
  profile.replay_event_hash = std::move(replay_event_hash);
  profile.replay_provenance = std::move(replay_provenance);
  profile.end_display_hash = std::move(end_display_hash);
  for (auto const& [pc, cost] : snapshot.pcs) {
    ProfilePC row;
    row.pc = pc;
    row.cost = cost;
    profile.pcs.push_back(std::move(row));
  }
  for (auto const& [address, cycles] : snapshot.native_pcs)
    profile.native_pcs.push_back({address, cycles, {}});
  validate(profile);
  return profile;
}

void write_profile(fs::path const& path, ProfileDocument const& profile) {
  validate(profile);
  if (fs::exists(path))
    throw std::invalid_argument("profile output already exists");
  auto const& w = profile.window;
  llvm::json::Object window;
  window["start_cycle"] = std::to_string(w.start_cycle);
  window["end_cycle"] = std::to_string(w.end_cycle);
  window["requested_end_cycle"] = std::to_string(profile.requested_end_cycle);
  window["start_pc"] = w.start_pc;
  window["end_pc"] = w.end_pc;
  window["completed_cycles"] = std::to_string(w.completed_cycles);
  window["partial_cycles"] = std::to_string(w.partial_cycles);
  window["discontinuities"] = std::to_string(w.discontinuities);
  window["complete"] = w.complete;
  window["stop_reason"] = w.stop_reason;
  window["native"] = w.native;
  window["native_active_cycles"] = std::to_string(w.native_active_cycles);
  window["native_elapsed_cycles"] = std::to_string(w.native_elapsed_cycles);

  llvm::json::Array pcs;
  for (auto const& row : profile.pcs) {
    llvm::json::Object item;
    item["pc"] = row.pc;
    item["cycles"] = std::to_string(row.cost.cycles);
    item["count"] = std::to_string(row.cost.count);
    item["bytes"] = row.bytes;
    item["assembly"] = row.assembly;
    item["function"] = row.function;
    item["linkage"] = row.linkage;
    item["compilation_unit"] = row.compilation_unit;
    item["file"] = row.file;
    item["line"] = row.line;
    item["column"] = row.column;
    item["source_hash"] = row.source_hash;
    item["source_text"] = row.source_text;
    llvm::json::Array chain;
    for (auto const& frame : row.inline_chain) {
      llvm::json::Object entry;
      entry["name"] = frame.name;
      entry["file"] = frame.file;
      entry["line"] = frame.line;
      entry["column"] = frame.column;
      chain.push_back(std::move(entry));
    }
    item["inline_chain"] = std::move(chain);
    pcs.push_back(std::move(item));
  }
  llvm::json::Array native;
  for (auto const& row : profile.native_pcs) {
    llvm::json::Object item;
    item["address"] = row.address;
    item["cycles"] = std::to_string(row.cycles);
    item["symbol"] = row.symbol;
    native.push_back(std::move(item));
  }
  llvm::json::Object root;
  root["version"] = 1;
  root["metric"] = "elapsed emulated cycles";
  root["window"] = std::move(window);
  root["identity"] = identity_json(profile.identity);
  root["replay_event_hash"] = profile.replay_event_hash;
  root["replay_provenance"] = profile.replay_provenance;
  root["end_display_hash"] = profile.end_display_hash;
  root["interpreter_elf_sha256"] = profile.interpreter_elf_sha256;
  root["pcs"] = std::move(pcs);
  root["native_pcs"] = std::move(native);
  std::ofstream output(path, std::ios::binary);
  if (!output) throw std::runtime_error("cannot create profile output");
  output << llvm::formatv("{0:2}\n", llvm::json::Value(std::move(root))).str();
  output.close();
  if (!output) throw std::runtime_error("profile write failed");
}

ProfileDocument read_profile(fs::path const& path) {
  if (fs::file_size(path) > 256 * 1024 * 1024)
    throw std::invalid_argument("profile file exceeds 256 MiB");
  std::ifstream input(path, std::ios::binary);
  if (!input) throw std::runtime_error("cannot open profile");
  std::string bytes{std::istreambuf_iterator<char>(input), {}};
  auto parsed = llvm::json::parse(bytes);
  if (!parsed)
    throw std::invalid_argument("invalid profile JSON: " +
                                llvm::toString(parsed.takeError()));
  auto* root = parsed->getAsObject();
  if (!root || root->getInteger("version") != 1 ||
      root->getString("metric") != "elapsed emulated cycles")
    throw std::invalid_argument("unsupported profile version or metric");
  ProfileDocument profile;
  auto const& window = object(*root, "window");
  auto& w = profile.window;
  w.start_cycle = decimal(window, "start_cycle");
  w.end_cycle = decimal(window, "end_cycle");
  profile.requested_end_cycle = decimal(window, "requested_end_cycle");
  w.start_pc = small(window, "start_pc", 0xffffff);
  w.end_pc = small(window, "end_pc", 0xffffff);
  w.completed_cycles = decimal(window, "completed_cycles");
  w.partial_cycles = decimal(window, "partial_cycles");
  w.discontinuities = decimal(window, "discontinuities");
  w.complete = boolean(window, "complete");
  w.stop_reason = required_string(window, "stop_reason");
  w.native = boolean(window, "native");
  w.native_active_cycles = decimal(window, "native_active_cycles");
  w.native_elapsed_cycles = decimal(window, "native_elapsed_cycles");
  profile.identity = read_identity(object(*root, "identity"));
  profile.replay_event_hash = required_string(*root, "replay_event_hash");
  profile.replay_provenance = required_string(*root, "replay_provenance");
  profile.end_display_hash = required_string(*root, "end_display_hash");
  profile.interpreter_elf_sha256 =
      required_string(*root, "interpreter_elf_sha256");
  for (auto const& value : array(*root, "pcs")) {
    auto* item = value.getAsObject();
    if (!item) throw std::invalid_argument("invalid profile PC row");
    ProfilePC row;
    row.pc = small(*item, "pc", 0xffffff);
    row.cost.cycles = decimal(*item, "cycles");
    row.cost.count = decimal(*item, "count");
    row.bytes = required_string(*item, "bytes");
    row.assembly = required_string(*item, "assembly");
    row.function = required_string(*item, "function");
    row.linkage = required_string(*item, "linkage");
    row.compilation_unit = required_string(*item, "compilation_unit");
    row.file = required_string(*item, "file");
    row.line = small(*item, "line", UINT32_MAX);
    row.column = small(*item, "column", UINT32_MAX);
    row.source_hash = required_string(*item, "source_hash");
    row.source_text = required_string(*item, "source_text");
    for (auto const& value : array(*item, "inline_chain")) {
      auto* frame = value.getAsObject();
      if (!frame) throw std::invalid_argument("invalid inline profile frame");
      row.inline_chain.push_back({required_string(*frame, "name"),
                                  required_string(*frame, "file"),
                                  small(*frame, "line", UINT32_MAX),
                                  small(*frame, "column", UINT32_MAX)});
    }
    w.pcs.emplace(row.pc, row.cost);
    profile.pcs.push_back(std::move(row));
  }
  for (auto const& value : array(*root, "native_pcs")) {
    auto* item = value.getAsObject();
    if (!item) throw std::invalid_argument("invalid native profile row");
    NativePC row{small(*item, "address", UINT32_MAX),
                 decimal(*item, "cycles"),
                 required_string(*item, "symbol")};
    w.native_pcs.emplace(row.address, row.cycles);
    profile.native_pcs.push_back(std::move(row));
  }
  validate(profile);
  return profile;
}

} // namespace avm_debug
