cmake_minimum_required(VERSION 3.20)
project(audio_demo LANGUAGES NONE)
if(NOT COMMAND avm_add_program)
    find_package(AVM CONFIG REQUIRED HINTS "${AVM_SDK_ROOT}/share/avm/cmake")
endif()
avm_add_program(avm_audio_demo
    SOURCES main.c STARTUP crt0_sketch.o
    COMPILE_OPTIONS -std=c11 -flto=full
    LINK_OPTIONS -flto=full -Wl,--lto-O2,--avm-print-stack-usage,--avm-print-stack-gaps
    BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}" PACKAGE TITLE "AVM Audio Demo")
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
    foreach(song IN LISTS AUDIO_DEMO_SONGS)
        add_custom_command(TARGET audio_demo_assets PRE_BUILD
            COMMAND "${Python3_EXECUTABLE}" "${AUDIO_DEMO_COMPILER}"
                "${CMAKE_CURRENT_SOURCE_DIR}/songs/${song}.avms"
                "${CMAKE_CURRENT_SOURCE_DIR}/songs/${song}.h" --name "${song}"
            VERBATIM)
    endforeach()
endif()

add_custom_target(avm_audio_demo_update
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${CMAKE_CURRENT_BINARY_DIR}/avm_audio_demo.arduboy"
        "${CMAKE_CURRENT_SOURCE_DIR}/audio_demo.arduboy"
    DEPENDS avm_audio_demo VERBATIM)
