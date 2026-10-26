#ifndef AVM_RUNNER_PARALLEL_H
#define AVM_RUNNER_PARALLEL_H

#include <algorithm>
#include <atomic>
#include <cstddef>
#include <exception>
#include <limits>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

// Zero is the internal default: select the number of logical processors.
inline std::size_t runner_worker_count(std::size_t jobs, std::size_t count)
{
    if(!jobs) jobs = std::max(1u, std::thread::hardware_concurrency());
    return std::min(jobs, count);
}

inline std::size_t runner_parse_jobs(std::string const& text)
{
    std::size_t value = 0;
    for(char c : text) {
        if(c < '0' || c > '9' ||
           value > (std::numeric_limits<std::size_t>::max() - (c - '0')) / 10)
            throw std::runtime_error("Invalid positive integer for --jobs: " + text);
        value = value * 10 + (c - '0');
    }
    if(!value) throw std::runtime_error("Invalid positive integer for --jobs: " + text);
    return value;
}

// Each index is owned by one worker. Callers may store results by index and
// keep emulator sessions by worker. Join even if thread creation fails; report
// task exceptions in input order, after every started worker has finished.
template<class Function>
void runner_parallel_for(std::size_t count, std::size_t workers, Function&& function)
{
    if(!count) return;
    if(!workers) throw std::runtime_error("Runner requires at least one worker");
    if(workers == 1) {
        for(std::size_t i = 0; i < count; ++i) function(0, i);
        return;
    }
    std::atomic<std::size_t> next{0};
    std::vector<std::exception_ptr> errors(count);
    std::vector<std::thread> threads;
    threads.reserve(workers);
    try {
        for(std::size_t worker = 0; worker < workers; ++worker) {
            threads.emplace_back([&, worker] {
                for(;;) {
                    auto i = next.fetch_add(1, std::memory_order_relaxed);
                    if(i >= count) break;
                    try { function(worker, i); }
                    catch(...) { errors[i] = std::current_exception(); }
                }
            });
        }
    }
    catch(...) {
        for(auto& thread : threads) thread.join();
        throw;
    }
    for(auto& thread : threads) thread.join();
    for(auto const& error : errors)
        if(error) std::rethrow_exception(error);
}

#endif
