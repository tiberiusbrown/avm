cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

set(LLVM_TARGETS_TO_BUILD "" CACHE STRING
    "LLVM in-tree targets to build")

set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM" CACHE STRING
    "LLVM experimental targets to build")

set(LLVM_ENABLE_PROJECTS "lld" CACHE STRING
    "LLVM projects to build")

set(LLVM_BUILD_TOOLS ON CACHE BOOL
    "Build LLVM tools")

add_subdirectory(deps/llvm-project/llvm llvm-build)
