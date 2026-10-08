set(AVM_SDK_ROOT "${CMAKE_BINARY_DIR}/avm-sdk-install")

add_custom_target(avm_sdk_install
    COMMAND "${CMAKE_COMMAND}" --install "${CMAKE_BINARY_DIR}"
        --config RelWithDebInfo --component avm-sdk --prefix "${AVM_SDK_ROOT}"
    DEPENDS avm_sdk
    COMMENT "Installing the AVM SDK for projects"
    VERBATIM
)

add_subdirectory(ardurogue2)
add_dependencies(ardurogue2 avm_sdk_install)

# Native sequencer demonstration: rendering and idle require no audio update.
find_package(Python3 COMPONENTS Interpreter REQUIRED)
set(audio_demo_dir "${CMAKE_CURRENT_BINARY_DIR}/audio_demo")
foreach(asset music effect)
    add_custom_command(
        OUTPUT "${audio_demo_dir}/${asset}.h"
        COMMAND "${Python3_EXECUTABLE}" "${PROJECT_SOURCE_DIR}/tools/avm_music.py"
            "${CMAKE_CURRENT_SOURCE_DIR}/audio_demo/${asset}.json"
            "${audio_demo_dir}/${asset}.h" --name "${asset}"
        DEPENDS "${PROJECT_SOURCE_DIR}/tools/avm_music.py"
            "${CMAKE_CURRENT_SOURCE_DIR}/audio_demo/${asset}.json"
        VERBATIM)
endforeach()
avm_add_object(
    OUTPUT "${audio_demo_dir}/main.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/audio_demo/main.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include" "${audio_demo_dir}"
    DEPENDS avm_sysroot "${audio_demo_dir}/music.h" "${audio_demo_dir}/effect.h")
avm_add_image(
    OBJECTS "${audio_demo_dir}/main.o"
    OUTPUT_ELF "${audio_demo_dir}/audio_demo.elf"
    OUTPUT_IMAGE "${audio_demo_dir}/audio_demo.bin"
    ENTRY _start STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_sketch.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS DEPENDS avm_sysroot)
add_custom_target(avm_audio_demo DEPENDS "${audio_demo_dir}/audio_demo.bin")
