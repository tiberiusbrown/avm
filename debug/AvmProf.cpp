#include "AvmEmulator.h"
#include "AvmHost.h"
#include "AvmProfile.h"

#include <lldb/API/SBDebugger.h>

#include <filesystem>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
namespace fs = std::filesystem;

std::string pixels_hash(std::vector<uint8_t> const& pixels) {
  return avm_debug::hash_bytes(std::string(
      reinterpret_cast<char const*>(pixels.data()), pixels.size()));
}

struct TempImage {
  fs::path path;
  ~TempImage() {
    if (!path.empty()) {
      std::error_code ignored;
      fs::remove(path, ignored);
    }
  }
};

struct LldbLifetime {
  LldbLifetime() { lldb::SBDebugger::Initialize(); }
  ~LldbLifetime() { lldb::SBDebugger::Terminate(); }
};

size_t parse_top(std::string const& text) {
  size_t used = 0;
  unsigned long count = std::stoul(text, &used, 10);
  if (used != text.size() || !count || count > 100000)
    throw std::invalid_argument("--top must be an integer from 1 to 100000");
  return size_t(count);
}

avm_debug::SourceMaps parse_maps(std::vector<std::string> const& args,
                                 size_t& i) {
  avm_debug::SourceMaps maps;
  while (i < args.size() && args[i] == "--source-map") {
    if (++i >= args.size())
      throw std::invalid_argument("--source-map requires OLD=NEW");
    size_t separator = args[i].find('=');
    if (separator == std::string::npos || !separator ||
        separator + 1 == args[i].size())
      throw std::invalid_argument("--source-map requires OLD=NEW");
    maps.emplace_back(args[i].substr(0, separator),
                      args[i].substr(separator + 1));
    ++i;
  }
  return maps;
}

int record(std::vector<std::string> const& args) {
  if (args.empty())
    throw std::invalid_argument("usage: avm-prof record <game.elf> --for <duration> [-o run.avmp] [--warmup <duration>] [--replay inputs.json] [--native]");
  fs::path elf(args[0]);
  fs::path output;
  fs::path replay;
  uint64_t duration = 0, warmup = 0;
  bool native = false, have_duration = false;
  avm_debug::SourceMaps maps;
  for (size_t i = 1; i < args.size();) {
    std::string option = args[i++];
    if ((option == "--for" || option == "--warmup" || option == "--replay" ||
         option == "-o") && i >= args.size())
      throw std::invalid_argument("missing value for " + option);
    if (option == "--for") {
      duration = avm_debug::duration_cycles(args[i++]);
      have_duration = true;
    } else if (option == "--warmup") {
      warmup = avm_debug::duration_cycles(args[i++]);
    } else if (option == "--replay") {
      replay = args[i++];
    } else if (option == "-o") {
      output = args[i++];
    } else if (option == "--native") {
      native = true;
    } else if (option == "--source-map") {
      --i;
      auto extra = parse_maps(args, i);
      maps.insert(maps.end(), extra.begin(), extra.end());
    } else {
      throw std::invalid_argument("unknown record option: " + option);
    }
  }
  if (!have_duration || !duration)
    throw std::invalid_argument("record requires a nonzero bounded --for duration");
  if (output.empty()) output = elf.stem().string() + ".avmp";
  if (fs::exists(output))
    throw std::invalid_argument("profile output already exists");
  if (!fs::is_regular_file(elf))
    throw std::invalid_argument("AVM ELF does not exist: " + elf.string());

  auto paths = avm_debug::runtime_paths("avm-prof");
  TempImage image{avm_debug::temporary_image_path("avm-prof")};
  avm_debug::package_image(paths.image_tool, elf, image.path);
  avm_debug::Emulator emulator;
  emulator.load(elf, image.path, paths.firmware, paths.boundary);
  avm_debug::ReplaySchedule schedule;
  if (!replay.empty()) {
    schedule = avm_debug::read_replay(replay, emulator.replay_identity(),
                                      emulator.snapshot().cycles);
    emulator.schedule_buttons(schedule.events);
  } else {
    schedule.event_hash = avm_debug::hash_bytes("");
  }
  if (warmup) {
    auto stopped = emulator.run_for(warmup);
    if (stopped.reason != avm_debug::StopReason::Deadline)
      throw std::runtime_error("warmup stopped early at AVM PC " +
                               std::to_string(stopped.state.pc));
  }
  uint64_t start = emulator.snapshot().cycles;
  if (duration > UINT64_MAX - start)
    throw std::overflow_error("profile deadline overflows cycle counter");
  uint64_t requested_end = start + duration;
  emulator.profile_start(native);
  auto stopped = emulator.run_for(duration);
  bool complete = stopped.reason == avm_debug::StopReason::Deadline &&
                  stopped.state.cycles >= requested_end;
  auto snapshot = emulator.profile_stop(stopped, complete);
  auto profile = avm_debug::make_profile(
      snapshot, emulator.profile_identity(), requested_end,
      schedule.event_hash, pixels_hash(emulator.visible_pixels()),
      schedule.provenance);
  {
    LldbLifetime lldb;
    avm_debug::symbolize_profile(profile, elf, maps);
  }
  if (native)
    avm_debug::symbolize_native(profile, paths.interpreter_elf, paths.firmware);
  avm_debug::write_profile(output, profile);
  std::cout << "Wrote " << fs::absolute(output).string() << '\n';
  avm_debug::print_profile(std::cout, profile, 10);
  return complete ? 0 : 2;
}

int report(std::vector<std::string> const& args) {
  if (args.empty())
    throw std::invalid_argument("usage: avm-prof report <run.avmp> [--html profile.html] [--top N] [--source-map OLD=NEW]");
  fs::path input(args[0]), html;
  size_t top = 20;
  avm_debug::SourceMaps maps;
  for (size_t i = 1; i < args.size();) {
    std::string option = args[i++];
    if (option == "--html" || option == "--top") {
      if (i >= args.size()) throw std::invalid_argument("missing value for " + option);
      if (option == "--html") html = args[i++];
      else top = parse_top(args[i++]);
    } else if (option == "--source-map") {
      --i;
      auto extra = parse_maps(args, i);
      maps.insert(maps.end(), extra.begin(), extra.end());
    } else throw std::invalid_argument("unknown report option: " + option);
  }
  auto profile = avm_debug::read_profile(input);
  if (!maps.empty()) avm_debug::refresh_profile_sources(profile, maps);
  avm_debug::print_profile(std::cout, profile, top);
  if (!html.empty()) {
    avm_debug::write_report_html(html, profile);
    std::cout << "Wrote " << fs::absolute(html).string() << '\n';
  }
  return 0;
}

int diff(std::vector<std::string> const& args) {
  if (args.size() < 2)
    throw std::invalid_argument("usage: avm-prof diff <before.avmp> <after.avmp> [--html diff.html] [--top N]");
  fs::path html;
  size_t top = 20;
  for (size_t i = 2; i < args.size();) {
    std::string option = args[i++];
    if (i >= args.size()) throw std::invalid_argument("missing value for " + option);
    if (option == "--html") html = args[i++];
    else if (option == "--top") top = parse_top(args[i++]);
    else throw std::invalid_argument("unknown diff option: " + option);
  }
  auto before = avm_debug::read_profile(args[0]);
  auto after = avm_debug::read_profile(args[1]);
  avm_debug::print_diff(std::cout, before, after, top);
  if (!html.empty()) {
    avm_debug::write_diff_html(html, before, after);
    std::cout << "Wrote " << fs::absolute(html).string() << '\n';
  }
  return 0;
}

int inputs(std::vector<std::string> const& args) {
  if (args.size() != 4 || args[0] != "portable" || args[2] != "-o")
    throw std::invalid_argument("usage: avm-prof inputs portable exported.json -o inputs.json");
  avm_debug::write_portable_replay(args[1], args[3]);
  std::cout << "Wrote " << fs::absolute(args[3]).string() << '\n';
  return 0;
}
} // namespace

int main(int argc, char** argv) {
  try {
    if (argc < 2)
      throw std::invalid_argument("usage: avm-prof record|report|diff|inputs ...");
    std::string command(argv[1]);
    std::vector<std::string> args(argv + 2, argv + argc);
    if (command == "record") return record(args);
    if (command == "report") return report(args);
    if (command == "diff") return diff(args);
    if (command == "inputs") return inputs(args);
    throw std::invalid_argument("usage: avm-prof record|report|diff|inputs ...");
  } catch (std::exception const& error) {
    std::cerr << "avm-prof: " << error.what() << '\n';
    return 1;
  }
}
