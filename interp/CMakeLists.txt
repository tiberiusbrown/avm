include(AvmFirmware)
set(AVM_INTERPRETER_MAX_SIZE 29696 CACHE STRING "Maximum interpreter image size")
set(AVM_AVR_GCC "" CACHE FILEPATH "AVR C compiler")
set(AVM_AVR_OBJCOPY "" CACHE FILEPATH "AVR objcopy")
set(AVM_AVR_OBJDUMP "" CACHE FILEPATH "AVR objdump")
avm_add_firmware(avm_interpreter DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
avm_add_firmware(avm_interpreter_fxc DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/fxc"
    PREAMBLE "#define AVM_DEVICE_ARDUBOY_FXC\n")
set(AVM_INTERPRETER_ELF "${avm_interpreter_ELF}")
set(AVM_INTERPRETER_ELF "${avm_interpreter_ELF}" PARENT_SCOPE)
set(AVM_INTERPRETER_MAP "${avm_interpreter_MAP}")
set(AVM_INTERPRETER_LISTING "${avm_interpreter_LISTING}" PARENT_SCOPE)
set(AVM_INTERPRETER_FXC_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/fxc")
set(AVM_SDK_INTERPRETER_HEX "${AVM_SDK_BUILD_BIN}/avm/interp.hex")
add_custom_command(
    OUTPUT "${AVM_SDK_INTERPRETER_HEX}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_SDK_BUILD_BIN}/avm"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_HEX}" "${AVM_SDK_INTERPRETER_HEX}"
    DEPENDS avm_interpreter "${AVM_INTERPRETER_HEX}"
    VERBATIM)
set(AVM_SDK_INTERPRETER_FXC_HEX "${AVM_SDK_BUILD_BIN}/avm/interp.fxc.hex")
add_custom_command(
    OUTPUT "${AVM_SDK_INTERPRETER_FXC_HEX}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_SDK_BUILD_BIN}/avm"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${AVM_INTERPRETER_FXC_BUILD_DIR}/interp.hex" "${AVM_SDK_INTERPRETER_FXC_HEX}"
    DEPENDS avm_interpreter_fxc "${AVM_INTERPRETER_FXC_BUILD_DIR}/interp.hex"
    VERBATIM)
add_custom_target(avm_interpreter_sdk
    DEPENDS "${AVM_SDK_INTERPRETER_HEX}" "${AVM_SDK_INTERPRETER_FXC_HEX}")
add_dependencies(avm_toolchain avm_interpreter_sdk)
add_dependencies(avm_sdk_tools avm_interpreter_sdk)
install(FILES "${AVM_SDK_INTERPRETER_HEX}" "${AVM_SDK_INTERPRETER_FXC_HEX}"
    DESTINATION bin/avm COMPONENT avm-sdk)

set(AVM_INTERPRETER_BOUNDARY_METADATA
    "${CMAKE_CURRENT_BINARY_DIR}/interp-boundary.json"
    PARENT_SCOPE)
add_custom_command(
    OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/interp-boundary.json"
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_INTERP_MAP:FILEPATH=${AVM_INTERPRETER_MAP}"
        "-DAVM_INTERP_HEX:FILEPATH=${AVM_INTERPRETER_HEX}"
        "-DAVM_BOUNDARY_OUTPUT:FILEPATH=${CMAKE_CURRENT_BINARY_DIR}/interp-boundary.json"
        -P "${PROJECT_SOURCE_DIR}/cmake/GenerateAvmBoundaryMetadata.cmake"
    DEPENDS avm_interpreter "${AVM_INTERPRETER_MAP}" "${AVM_INTERPRETER_HEX}"
        "${PROJECT_SOURCE_DIR}/cmake/GenerateAvmBoundaryMetadata.cmake"
    VERBATIM)
add_custom_target(avm_interpreter_boundary
    DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/interp-boundary.json")

# Firmware snapshots are updated only on request, never by an SDK build.
add_custom_target(avm_interpreter_update
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${AVM_INTERPRETER_HEX}" "${CMAKE_CURRENT_SOURCE_DIR}/reference/interp.hex"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${AVM_INTERPRETER_MAP}" "${CMAKE_CURRENT_SOURCE_DIR}/reference/interp.map"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${avm_interpreter_LISTING}" "${CMAKE_CURRENT_SOURCE_DIR}/reference/interp.lst"
    DEPENDS avm_interpreter VERBATIM)
