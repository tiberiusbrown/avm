cmake_minimum_required(VERSION 3.20)

project(audio_demo LANGUAGES NONE)

if(NOT DEFINED AVM_SDK_ROOT)
    set(AVM_SDK_ROOT "" CACHE PATH "Path to the installed AVM SDK")
endif()
if(NOT AVM_SDK_ROOT)
    find_program(AVM_CLANG NAMES avm-clang)
    if(NOT AVM_CLANG)
        message(FATAL_ERROR "Set AVM_SDK_ROOT or add the AVM SDK bin directory to PATH")
    endif()
    file(REAL_PATH "${AVM_CLANG}" AVM_CLANG_REAL)
    get_filename_component(AVM_SDK_BIN "${AVM_CLANG_REAL}" DIRECTORY)
    get_filename_component(AVM_SDK_ROOT "${AVM_SDK_BIN}/.." ABSOLUTE)
endif()
set(AVM_HOST_EXE_SUFFIX "")
if(CMAKE_HOST_WIN32)
    set(AVM_HOST_EXE_SUFFIX ".exe")
endif()
set(AVM_SDK_BIN "${AVM_SDK_ROOT}/bin")
set(AVM_CLANG "${AVM_SDK_BIN}/avm-clang${AVM_HOST_EXE_SUFFIX}")
set(AVM_LD "${AVM_SDK_BIN}/avm-ld${AVM_HOST_EXE_SUFFIX}")
set(AVM_IMAGE "${AVM_SDK_BIN}/avm-image${AVM_HOST_EXE_SUFFIX}")
set(AVM_SYSROOT "${AVM_SDK_ROOT}/sysroot")
set(AVM_INTERPRETER "${AVM_SDK_BIN}/avm/interp.hex")
set(AUDIO_DEMO_FIRMWARE_DEPENDS "${AVM_INTERPRETER}")
if(TARGET avm_sdk_install)
    # Ninja checks installed-file timestamps before SDK installation runs.
    # Track the generated firmware too, so this build packages a fresh HEX.
    list(APPEND AUDIO_DEMO_FIRMWARE_DEPENDS
        avm_sdk_install "${AVM_INTERPRETER_HEX}")
endif()

set(AUDIO_DEMO_DEFAULT_BUILD)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    set(AUDIO_DEMO_DEFAULT_BUILD ALL)
    foreach(required_file IN ITEMS
            "${AVM_CLANG}" "${AVM_LD}" "${AVM_IMAGE}" "${AVM_INTERPRETER}"
            "${AVM_SYSROOT}/include/avm/audio.h" "${AVM_SYSROOT}/lib/crt0_sketch.o"
            "${AVM_SYSROOT}/lib/libavm.a" "${AVM_SYSROOT}/lib/libavm-builtins.a")
        if(NOT EXISTS "${required_file}")
            message(FATAL_ERROR "AVM SDK file not found: ${required_file}")
        endif()
    endforeach()
endif()

# Match ardurogue2: one intermediate directory for parent and standalone builds.
set(AUDIO_DEMO_BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build")
file(MAKE_DIRECTORY "${AUDIO_DEMO_BUILD_DIR}")
set(AUDIO_DEMO_OBJECT "${AUDIO_DEMO_BUILD_DIR}/main.o")
set(AUDIO_DEMO_ELF "${AUDIO_DEMO_BUILD_DIR}/audio_demo.elf")
set(AUDIO_DEMO_BIN "${AUDIO_DEMO_BUILD_DIR}/audio_demo.bin")
set(AUDIO_DEMO_PACKAGE "${AUDIO_DEMO_BUILD_DIR}/audio_demo.arduboy")

add_custom_command(
    OUTPUT "${AUDIO_DEMO_OBJECT}"
    COMMAND "${AVM_CLANG}" --target=avm-unknown-arduboyfx
        -g -std=c11 -O2 -flto -ffreestanding -fomit-frame-pointer
        -fno-stack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables
        -ffunction-sections -fdata-sections -Wall -Wextra -Werror
        -isystem "${AVM_SYSROOT}/include"
        -c "${CMAKE_CURRENT_SOURCE_DIR}/main.c" -o "${AUDIO_DEMO_OBJECT}"
    DEPENDS "${AVM_CLANG}" "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
        "${CMAKE_CURRENT_SOURCE_DIR}/music.h" "${CMAKE_CURRENT_SOURCE_DIR}/effect.h"
    COMMENT "Compiling audio_demo with the AVM SDK"
    VERBATIM)
add_custom_command(
    OUTPUT "${AUDIO_DEMO_ELF}" "${AUDIO_DEMO_BIN}" "${AUDIO_DEMO_PACKAGE}"
    COMMAND "${AVM_LD}" -flavor gnu --entry=_start --gc-sections --lto-O2
        --avm-print-stack-usage --avm-print-stack-gaps
        -o "${AUDIO_DEMO_ELF}" "${AVM_SYSROOT}/lib/crt0_sketch.o"
        "${AUDIO_DEMO_OBJECT}" "${AVM_SYSROOT}/lib/libavm.a"
        "${AVM_SYSROOT}/lib/libavm-builtins.a"
    COMMAND "${AVM_IMAGE}" --development "${AUDIO_DEMO_ELF}" -o "${AUDIO_DEMO_BIN}"
    COMMAND "${AVM_IMAGE}" "${AUDIO_DEMO_ELF}"
        --interpreter "${AVM_INTERPRETER}" --title "AVM Audio Demo"
        --description "Autonomous four-channel music, button sound effects, and animation"
        -o "${AUDIO_DEMO_PACKAGE}"
    DEPENDS "${AUDIO_DEMO_OBJECT}" "${AVM_LD}" "${AVM_IMAGE}" ${AUDIO_DEMO_FIRMWARE_DEPENDS}
        "${AVM_SYSROOT}/lib/crt0_sketch.o" "${AVM_SYSROOT}/lib/libavm.a"
        "${AVM_SYSROOT}/lib/libavm-builtins.a"
    COMMENT "Linking and packaging audio_demo"
    VERBATIM)

# The source package is copied, not a generated output, so clean preserves it.
add_custom_target(avm_audio_demo ${AUDIO_DEMO_DEFAULT_BUILD}
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${AUDIO_DEMO_PACKAGE}" "${CMAKE_CURRENT_SOURCE_DIR}/audio_demo.arduboy"
    DEPENDS "${AUDIO_DEMO_BIN}" "${AUDIO_DEMO_PACKAGE}"
    VERBATIM)

set(AUDIO_DEMO_COMPILER "${CMAKE_CURRENT_SOURCE_DIR}/../../tools/avm_music.py")
find_package(Python3 QUIET COMPONENTS Interpreter)
if(Python3_Interpreter_FOUND AND EXISTS "${AUDIO_DEMO_COMPILER}")
    add_custom_target(audio_demo_assets
        COMMAND "${Python3_EXECUTABLE}" "${AUDIO_DEMO_COMPILER}"
            "${CMAKE_CURRENT_SOURCE_DIR}/music.avms" "${CMAKE_CURRENT_SOURCE_DIR}/music.h" --name music
        COMMAND "${Python3_EXECUTABLE}" "${AUDIO_DEMO_COMPILER}"
            "${CMAKE_CURRENT_SOURCE_DIR}/effect.avms" "${CMAKE_CURRENT_SOURCE_DIR}/effect.h" --name effect
        COMMENT "Regenerating tracked audio headers"
        VERBATIM)
    add_dependencies(avm_audio_demo audio_demo_assets)
endif()
