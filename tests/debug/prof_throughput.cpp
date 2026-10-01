#include "AvmEmulator.h"

#include <chrono>
#include <algorithm>
#include <array>
#include <filesystem>
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <vector>

namespace {
struct Trial {
  double seconds = 0;
  avm_debug::Stop stopped;
  std::vector<uint8_t> display;
  std::vector<avm_debug::TimedButtons> history;
};

Trial run(std::filesystem::path const& elf, std::filesystem::path const& image,
          std::filesystem::path const& firmware,
          std::filesystem::path const& boundary, unsigned mode) {
  avm_debug::Emulator emulator;
  emulator.load(elf, image, firmware, boundary);
  auto entry = emulator.snapshot().cycles;
  emulator.schedule_buttons({{entry + 1000, avm_debug::Down},
                             {entry + 5000000, 0}});
  if (mode) emulator.profile_start(mode == 2);
  auto start = std::chrono::steady_clock::now();
  auto stopped = emulator.run_for(20000000);
  auto end = std::chrono::steady_clock::now();
  if (stopped.reason != avm_debug::StopReason::Deadline)
    throw std::runtime_error("throughput fixture stopped early");
  if (mode) {
    auto profile = emulator.profile_stop(stopped);
    if (profile.completed_cycles + profile.partial_cycles !=
        profile.end_cycle - profile.start_cycle)
      throw std::runtime_error("throughput profile did not reconcile");
  }
  Trial result;
  result.seconds = std::chrono::duration<double>(end-start).count();
  result.stopped = stopped;
  result.display = emulator.visible_pixels();
  result.history = emulator.button_history();
  return result;
}
} // namespace

int main(int argc, char** argv) {
  try {
    if (argc != 5)
      throw std::invalid_argument("usage: prof_throughput ELF image interp.hex boundary.json");
    std::array<std::array<Trial, 3>, 3> trials;
    for (unsigned repeat = 0; repeat < 3; ++repeat)
      for (unsigned mode = 0; mode < 3; ++mode)
        trials[mode][repeat] = run(argv[1], argv[2], argv[3], argv[4], mode);
    auto const& disabled = trials[0][0];
    for (unsigned mode = 1; mode < 3; ++mode)
      for (auto const& trial : trials[mode]) {
        if (trial.stopped.state.pc != disabled.stopped.state.pc ||
            trial.stopped.state.cycles != disabled.stopped.state.cycles ||
            trial.display != disabled.display ||
            trial.history.size() != disabled.history.size())
          throw std::runtime_error("collection changed emulated behavior");
        for (size_t i = 0; i < trial.history.size(); ++i)
          if (trial.history[i].cycle != disabled.history[i].cycle ||
              trial.history[i].pressed != disabled.history[i].pressed)
            throw std::runtime_error("collection changed replay timing");
      }
    std::array<double, 3> median{};
    for (unsigned mode = 0; mode < 3; ++mode) {
      std::array<double, 3> elapsed{};
      for (unsigned i = 0; i < 3; ++i)
        elapsed[i] = trials[mode][i].seconds;
      std::sort(elapsed.begin(), elapsed.end());
      median[mode] = elapsed[1];
    }
    std::cout << std::fixed << std::setprecision(3)
              << "Median host time (3 trials, 20,000,000 requested emulated "
              << "cycles): disabled " << median[0] << " s, guest "
              << median[1] << " s ("
              << 100.0 * (median[1] / median[0] - 1) << "% overhead), "
              << "native " << median[2] << " s ("
              << 100.0 * (median[2] / median[0] - 1)
              << "% overhead). Stop PC/cycles, replay trace, and display match.\n";
    return 0;
  } catch (std::exception const& error) {
    std::cerr << error.what() << '\n';
    return 1;
  }
}
