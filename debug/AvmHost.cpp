#include "AvmHost.h"

#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/Support/Error.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/FormatVariadic.h>
#include <llvm/Support/JSON.h>
#include <llvm/Support/Program.h>
#include <llvm/Support/SHA256.h>

#include <array>
#include <chrono>
#include <cstdlib>
#include <fstream>
#include <iterator>
#include <limits>
#include <stdexcept>

namespace avm_debug {
namespace {
namespace fs = std::filesystem;

std::string read_file(fs::path const& path) {
  std::ifstream input(path, std::ios::binary);
  if (!input) throw std::runtime_error("cannot open " + path.string());
  return {std::istreambuf_iterator<char>(input), {}};
}

fs::path override_path(char const* preferred, char const* legacy,
                       fs::path fallback) {
  if (char const* value = std::getenv(preferred); value && *value)
    return value;
  if (char const* value = std::getenv(legacy); value && *value)
    return value;
  return fallback;
}

uint8_t button_bit(llvm::StringRef name) {
  std::string upper = name.upper();
  if (upper == "UP") return Up;
  if (upper == "RIGHT") return Right;
  if (upper == "LEFT") return Left;
  if (upper == "DOWN") return Down;
  if (upper == "A") return A;
  if (upper == "B") return B;
  throw std::invalid_argument("unknown AVM button: " + name.str());
}

llvm::json::Object& parse_replay(std::string const& bytes,
                                llvm::json::Value& parsed) {
  auto value = llvm::json::parse(bytes);
  if (!value)
    throw std::invalid_argument("invalid replay JSON: " +
                                llvm::toString(value.takeError()));
  parsed = std::move(*value);
  auto* root = parsed.getAsObject();
  if (!root || root->getInteger("version") != 1 || !root->getArray("events"))
    throw std::invalid_argument("unsupported replay schema version or events");
  return *root;
}

std::vector<TimedButtons> parse_events(llvm::json::Object const& root,
                                       uint64_t start_cycle) {
  uint64_t previous = 0;
  std::vector<TimedButtons> events;
  for (auto const& entry : *root.getArray("events")) {
    auto* item = entry.getAsObject();
    if (!item) throw std::invalid_argument("replay event must be an object");
    auto when = item->getInteger("cycle");
    auto* buttons = item->getArray("pressed");
    if (!when || *when < 0 || !buttons || uint64_t(*when) < previous ||
        uint64_t(*when) > UINT64_MAX - start_cycle)
      throw std::invalid_argument("invalid replay cycle or pressed array");
    uint8_t mask = 0;
    for (auto const& button : *buttons) {
      auto name = button.getAsString();
      if (!name) throw std::invalid_argument("replay button must be a name");
      mask |= button_bit(*name);
    }
    previous = uint64_t(*when);
    events.push_back({start_cycle + previous, mask});
  }
  return events;
}

void check_identity(llvm::json::Object const& identity,
                    ReplayIdentity const& actual) {
  auto require_hash = [&](llvm::StringRef name, std::string const& expected) {
    if (identity.getString(name) != expected)
      throw std::invalid_argument("replay identity mismatch: " + name.str());
  };
  require_hash("elf_sha256", actual.elf_sha256);
  require_hash("image_sha256", actual.image_sha256);
  require_hash("interpreter_sha256", actual.interpreter_sha256);
  require_hash("eeprom_sha256", actual.eeprom_sha256);
  require_hash("fxsave_sha256", actual.fxsave_sha256);
  if (identity.getInteger("adc_seed") != actual.adc_seed ||
      identity.getBoolean("adc_nondeterminism") != actual.adc_nondeterminism ||
      identity.getInteger("usb_bus_state") != actual.usb_bus_state)
    throw std::invalid_argument("replay peripheral identity mismatch");
}

std::string schedule_hash(std::vector<TimedButtons> const& events,
                          uint64_t start) {
  std::string canonical;
  for (auto const& event : events)
    canonical += std::to_string(event.cycle - start) + ":" +
                 std::to_string(event.pressed) + ";";
  return hash_bytes(canonical);
}
} // namespace

RuntimePaths runtime_paths(char const* program_name) {
  fs::path bin_dir = fs::path(llvm::sys::fs::getMainExecutable(
                                  program_name, nullptr)).parent_path();
#ifdef _WIN32
  constexpr char image_name[] = "avm-image.exe";
#else
  constexpr char image_name[] = "avm-image";
#endif
  return {
      override_path("AVM_PROF_IMAGE_TOOL", "AVM_LLDB_IMAGE_TOOL",
                    bin_dir / image_name),
      override_path("AVM_PROF_INTERP", "AVM_LLDB_INTERP",
                    bin_dir / "avm" / "interp.hex"),
      override_path("AVM_PROF_BOUNDARY", "AVM_LLDB_BOUNDARY",
                    bin_dir / "avm" / "interp-boundary.json"),
      override_path("AVM_PROF_INTERP_ELF", "AVM_LLDB_INTERP_ELF",
                    bin_dir / "avm" / "interp.elf")};
}

fs::path temporary_image_path(char const* prefix) {
  return fs::temp_directory_path() /
      (std::string(prefix) + "-" +
       std::to_string(std::chrono::steady_clock::now().time_since_epoch().count()) +
       ".bin");
}

void package_image(fs::path const& tool, fs::path const& elf,
                   fs::path const& image) {
  std::string tool_arg = tool.string(), elf_arg = elf.string();
  std::string image_arg = image.string();
  std::vector<llvm::StringRef> args =
      {tool_arg, "--development", "-o", image_arg, elf_arg};
  std::string error;
  int result = llvm::sys::ExecuteAndWait(tool_arg, args, std::nullopt,
                                          {}, 0, 0, &error);
  if (result != 0)
    throw std::runtime_error("AVM image packer failed (" +
                             std::to_string(result) + "): " + error);
}

uint64_t duration_cycles(std::string text) {
  llvm::StringRef value(text);
  uint64_t scale = 1;
  if (value.consume_back("ms")) scale = 16000;
  else if (value.consume_back("cycles")) scale = 1;
  else if (value.consume_back("s")) scale = 16000000;
  uint64_t amount = 0;
  if (value.empty() || value.getAsInteger(10, amount) ||
      amount > UINT64_MAX / scale)
    throw std::invalid_argument("AVM duration must be an integer number of cycles, milliseconds, or seconds");
  return amount * scale;
}

std::string hash_bytes(std::string const& bytes) {
  auto hash = llvm::SHA256::hash(llvm::ArrayRef<uint8_t>(
      reinterpret_cast<uint8_t const*>(bytes.data()), bytes.size()));
  return llvm::toHex(llvm::ArrayRef<uint8_t>(hash), true);
}

std::string hash_file(fs::path const& path) { return hash_bytes(read_file(path)); }

ReplaySchedule read_replay(fs::path const& path,
                           ReplayIdentity const& actual, uint64_t start_cycle) {
  llvm::json::Value parsed(nullptr);
  auto& root = parse_replay(read_file(path), parsed);
  if (root.get("identity") && !root.getObject("identity"))
    throw std::invalid_argument("replay identity must be an object");
  if (root.get("provenance") && !root.getObject("provenance"))
    throw std::invalid_argument("replay provenance must be an object");
  if (auto* identity = root.getObject("identity"))
    check_identity(*identity, actual);
  ReplaySchedule result;
  result.events = parse_events(root, start_cycle);
  result.event_hash = schedule_hash(result.events, start_cycle);
  if (auto* provenance = root.getObject("provenance"))
    result.provenance = llvm::formatv(
        "{0}", llvm::json::Value(std::move(*provenance))).str();
  return result;
}

void write_portable_replay(fs::path const& input, fs::path const& output) {
  if (fs::exists(output))
    throw std::invalid_argument("portable replay output already exists");
  llvm::json::Value parsed(nullptr);
  auto& source = parse_replay(read_file(input), parsed);
  // Validate every event before preserving the original JSON representation.
  parse_events(source, 0);
  auto* identity = source.getObject("identity");
  if (!identity)
    throw std::invalid_argument("portable conversion requires an exported replay identity");
  llvm::json::Object document;
  document["version"] = 1;
  document["events"] = std::move(*source.getArray("events"));
  document["provenance"] = std::move(*identity);
  std::ofstream stream(output, std::ios::binary);
  if (!stream) throw std::runtime_error("cannot create portable replay");
  stream << llvm::formatv("{0:2}\n", llvm::json::Value(std::move(document))).str();
  stream.close();
  if (!stream) throw std::runtime_error("portable replay write failed");
}

} // namespace avm_debug
