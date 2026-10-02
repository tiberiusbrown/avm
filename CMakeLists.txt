cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(AvmBuild)

# The LLVM toolchain also builds when the optional Ardens submodule is absent.
# Keep the Ardens-backed LLDB integration, emulator tests, and benchmarks
# together so a toolchain-only configure has no Ardens dependency.
set(AVM_ARDENS_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/deps/Ardens")
if(EXISTS "${AVM_ARDENS_SOURCE_DIR}/CMakeLists.txt")
    set(AVM_WITH_ARDENS_DEFAULT ON)
else()
    set(AVM_WITH_ARDENS_DEFAULT OFF)
endif()
option(AVM_WITH_ARDENS
    "Build the Ardens-backed LLDB debugger, tests, and benchmarks"
    ${AVM_WITH_ARDENS_DEFAULT})
if(AVM_WITH_ARDENS AND NOT EXISTS "${AVM_ARDENS_SOURCE_DIR}/CMakeLists.txt")
    message(FATAL_ERROR
        "AVM_WITH_ARDENS=ON requires the deps/Ardens submodule. "
        "Initialize it or configure with -DAVM_WITH_ARDENS=OFF.")
endif()

# Build the AVM Clang/LLVM/LLD toolchain in-tree. The target includes a
# SelectionDAG code generator in addition to its MC and linker components.
set(LLVM_TARGETS_TO_BUILD              ""          CACHE STRING "" FORCE)
set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM"       CACHE STRING "" FORCE)
set(LLVM_ENABLE_PIC                     ON          CACHE BOOL   "" FORCE)
set(AVM_LLVM_PROJECTS clang lld)
if(AVM_WITH_ARDENS)
    list(APPEND AVM_LLVM_PROJECTS lldb)
endif()
set(LLVM_ENABLE_PROJECTS "${AVM_LLVM_PROJECTS}" CACHE STRING "" FORCE)
set(LLD_BUILD_ELF_ONLY                  ON          CACHE BOOL   "" FORCE)

# Do not place every LLVM command-line tool in the default build. Explicitly
# requested tools remain available as CMake targets.
set(LLVM_BUILD_TOOLS                   OFF         CACHE BOOL   "" FORCE)
set(CLANG_BUILD_TOOLS                  OFF         CACHE BOOL   "" FORCE)
set(LLD_BUILD_TOOLS                    OFF         CACHE BOOL   "" FORCE)
set(CLANG_ENABLE_STATIC_ANALYZER       OFF         CACHE BOOL   "" FORCE)
set(CLANG_ENABLE_ARCMT                 OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_TESTS                   OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_EXAMPLES                OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_BENCHMARKS              OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_DOCS                    OFF         CACHE BOOL   "" FORCE)
if(AVM_WITH_ARDENS)
    # The SDK debugger uses LLDB's native command interpreter and C++ API.
    # Optional bindings and terminal UI dependencies are unnecessary for it.
    set(LLDB_ENABLE_PYTHON OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_LUA OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_SWIG OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_CURSES OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_LIBEDIT OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_LZMA OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_LIBXML2 OFF CACHE STRING "" FORCE)
    set(LLDB_ENABLE_PROTOCOL_SERVERS OFF CACHE BOOL "" FORCE)

    # Define the adapter before entering LLVM so LLDB can discover it as an
    # ordinary CMake target. Ardens's own LLVM loader remains disabled.
    set(ARDENS_LLVM      OFF CACHE BOOL "" FORCE)
    set(ARDENS_DEBUGGER  ON  CACHE BOOL "" FORCE)
    set(ARDENS_PLAYER    OFF CACHE BOOL "" FORCE)
    set(ARDENS_FLASHCART OFF CACHE BOOL "" FORCE)
    set(ARDENS_LIB       OFF CACHE BOOL "" FORCE)
    set(ARDENS_LIBRETRO  OFF CACHE BOOL "" FORCE)
    set(ARDENS_DIST      OFF CACHE BOOL "" FORCE)
    set(ARDENS_BENCHMARK OFF CACHE BOOL "" FORCE)
    set(ARDENS_CYCLES    OFF CACHE BOOL "" FORCE)
    set(ARDENS_SDL       ON  CACHE BOOL "" FORCE)
    add_subdirectory("${AVM_ARDENS_SOURCE_DIR}" ardens-build EXCLUDE_FROM_ALL)
    # liblldb is shared; its static Ardens dependencies must be PIC.
    set_target_properties(ardensdebuggerlib fmt miniz PROPERTIES
        POSITION_INDEPENDENT_CODE ON)
    add_custom_target(avm_ardens_debugger ALL DEPENDS Ardens)

    add_library(avm_debug_emulator STATIC debug/AvmEmulator.cpp debug/AvmHost.cpp)
    target_compile_features(avm_debug_emulator PUBLIC cxx_std_17)
    target_include_directories(avm_debug_emulator
        PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/debug"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/deps/llvm-project/llvm/include"
                "${CMAKE_BINARY_DIR}/llvm-build/include")
    target_link_libraries(avm_debug_emulator
        PUBLIC ardensdebuggerlib LLVMSupport)

    add_library(avm_profile STATIC
        debug/AvmProfileFormat.cpp
        debug/AvmProfileSymbol.cpp
        debug/AvmProfileReport.cpp)
    set_target_properties(avm_debug_emulator avm_profile PROPERTIES
        POSITION_INDEPENDENT_CODE ON)
    target_compile_features(avm_profile PUBLIC cxx_std_17)
    target_include_directories(avm_profile
        PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/debug"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/deps/llvm-project/lldb/include"
                "${CMAKE_BINARY_DIR}/llvm-build/tools/lldb/include"
                "${CMAKE_CURRENT_SOURCE_DIR}/deps/llvm-project/llvm/include"
                "${CMAKE_BINARY_DIR}/llvm-build/include")
    target_link_libraries(avm_profile PUBLIC avm_debug_emulator LLVMSupport)
endif()
set(BUG_REPORT_URL "https://github.com/tiberiusbrown/llvm-project/issues/" CACHE STRING "" FORCE)

add_subdirectory(deps/llvm-project/llvm llvm-build)

add_custom_target(avm_toolchain
    DEPENDS
        clang
        llvm-ar
        llvm-mc
        llvm-objdump
        llvm-readobj
        lld
        llvm-avm-image
)

# LLD's CMake target is `lld`; on Windows the GNU driver is emitted as the
# ld.lld sibling alias. Keep the invocation explicit and generator-safe.
set(AVM_LD_LLD "$<TARGET_FILE_DIR:lld>/ld.lld${CMAKE_EXECUTABLE_SUFFIX}")
set(AVM_DISASSEMBLE_SCRIPT
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/DisassembleAvm.cmake")

# These paths are consumed by more than one feature subdirectory.
set(AVM_INTERPRETER_HEX
    "${CMAKE_CURRENT_SOURCE_DIR}/interp/build/interp.hex")

add_subdirectory(runtime)

# Each SDK command is a native executable. Keep the AVM names beside the LLVM
# tools in the build tree, but install only the AVM names.
set(AVM_SDK_BUILD_BIN "${CMAKE_BINARY_DIR}/llvm-build/bin")
file(REMOVE "${AVM_SDK_BUILD_BIN}/avm-clang.py"
            "${AVM_SDK_BUILD_BIN}/avm-clang.cmd")
set(AVM_SDK_ALIAS_OUTPUTS)
foreach(AVM_SDK_ALIAS IN ITEMS
        "clang|clang" "ld|lld" "ar|llvm-ar" "mc|llvm-mc"
        "objdump|llvm-objdump" "readobj|llvm-readobj"
        "image|llvm-avm-image")
    string(REPLACE "|" ";" AVM_SDK_ALIAS_FIELDS "${AVM_SDK_ALIAS}")
    list(GET AVM_SDK_ALIAS_FIELDS 0 AVM_SDK_ALIAS_NAME)
    list(GET AVM_SDK_ALIAS_FIELDS 1 AVM_SDK_ALIAS_TARGET)
    set(AVM_SDK_ALIAS_OUTPUT
        "${AVM_SDK_BUILD_BIN}/avm-${AVM_SDK_ALIAS_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
    add_custom_command(
        OUTPUT "${AVM_SDK_ALIAS_OUTPUT}"
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "$<TARGET_FILE:${AVM_SDK_ALIAS_TARGET}>"
                "${AVM_SDK_ALIAS_OUTPUT}"
        DEPENDS ${AVM_SDK_ALIAS_TARGET}
        VERBATIM)
    list(APPEND AVM_SDK_ALIAS_OUTPUTS "${AVM_SDK_ALIAS_OUTPUT}")
endforeach()
add_custom_target(avm_sdk_tools DEPENDS ${AVM_SDK_ALIAS_OUTPUTS})
add_dependencies(avm_toolchain avm_sdk_tools)

install(PROGRAMS ${AVM_SDK_ALIAS_OUTPUTS}
    DESTINATION bin COMPONENT avm-sdk)
# Only Clang's target-independent builtin headers belong in the AVM SDK.
# Get the list and install destination from the Clang header build so they
# track LLVM updates without copying every architecture's resource headers.
get_property(AVM_SDK_CLANG_CORE_HEADERS GLOBAL PROPERTY AVM_SDK_CLANG_CORE_HEADERS)
get_property(AVM_SDK_CLANG_HEADER_DIR GLOBAL PROPERTY AVM_SDK_CLANG_HEADER_DIR)
if(NOT AVM_SDK_CLANG_CORE_HEADERS OR NOT AVM_SDK_CLANG_HEADER_DIR)
    message(FATAL_ERROR "Clang did not provide its core resource headers")
endif()
list(REMOVE_ITEM AVM_SDK_CLANG_CORE_HEADERS module.modulemap)
list(TRANSFORM AVM_SDK_CLANG_CORE_HEADERS PREPEND
    "${CMAKE_CURRENT_SOURCE_DIR}/deps/llvm-project/clang/lib/Headers/")
install(FILES ${AVM_SDK_CLANG_CORE_HEADERS}
    DESTINATION "${AVM_SDK_CLANG_HEADER_DIR}" COMPONENT avm-sdk)
install(DIRECTORY "${AVM_SYSROOT_DIR}/"
    DESTINATION sysroot COMPONENT avm-sdk
    PATTERN ".runtime-stamp" EXCLUDE)

add_subdirectory(interp)
if(AVM_WITH_ARDENS)
    add_subdirectory(debug)
endif()
add_subdirectory(projects)
if(AVM_WITH_ARDENS)
    add_subdirectory(tests)
    add_subdirectory(bench)
endif()
