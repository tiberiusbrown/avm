#ifndef AVM_RUNNER_SELECTION_H
#define AVM_RUNNER_SELECTION_H

#include <algorithm>
#include <chrono>
#include <iostream>
#include <regex>
#include <stdexcept>
#include <string>
#include <vector>

// ECMAScript regex search on source stems (instruction names for ASM benches).
struct runner_selection {
    std::string expression;
    std::regex pattern;
    bool list = false;

    void filter(std::string const& value) {
        if(value.empty()) throw std::runtime_error("--filter must not be empty");
        try { pattern = std::regex(value); }
        catch(std::regex_error const& e) {
            throw std::runtime_error("Invalid --filter regex: " + std::string(e.what()));
        }
        expression = value;
    }
    bool matches(std::string const& name) const {
        return expression.empty() || std::regex_search(name, pattern);
    }
};

inline std::vector<std::string> runner_optimizations(std::string const& csv) {
    std::vector<std::string> result;
    std::size_t begin = 0;
    do {
        auto end = csv.find(',', begin);
        auto opt = csv.substr(begin, end == std::string::npos ? end : end-begin);
        if(opt != "O0" && opt != "O1" && opt != "O2" && opt != "O3" && opt != "Os" && opt != "Oz")
            throw std::runtime_error("Invalid --opt level: " + opt + " (use O0,O1,O2,O3,Os,Oz)");
        if(std::find(result.begin(), result.end(), opt) == result.end()) result.push_back(opt);
        if(end == std::string::npos) break;
        begin = end+1;
    } while(true);
    return result;
}

struct runner_elapsed {
    std::chrono::steady_clock::time_point start = std::chrono::steady_clock::now();
    ~runner_elapsed() {
        std::cout << "Elapsed wall time: "
                  << std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count()
                  << " s\n";
    }
};
#endif
