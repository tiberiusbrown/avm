set(AVM_INTERPRETER_BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build")
set(AVM_INTERPRETER_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp.asm")
set(AVM_INTERPRETER_BUILD_CMAKE
    "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake")
set(AVM_INTERPRETER_OBJECT "${AVM_INTERPRETER_BUILD_DIR}/interp.o")
set(AVM_INTERPRETER_ELF "${AVM_INTERPRETER_BUILD_DIR}/interp.elf")
set(AVM_INTERPRETER_ELF "${AVM_INTERPRETER_ELF}" PARENT_SCOPE)
set(AVM_INTERPRETER_MAP "${AVM_INTERPRETER_BUILD_DIR}/interp.map")
set(AVM_INTERPRETER_LISTING "${AVM_INTERPRETER_BUILD_DIR}/interp.lst")

set(AVM_INTERPRETER_MAX_SIZE 29696 CACHE STRING "")
set(AVM_AVR_GCC     "" CACHE FILEPATH "")
set(AVM_AVR_OBJCOPY "" CACHE FILEPATH "")
set(AVM_AVR_OBJDUMP "" CACHE FILEPATH "")

set(AVM_INTERPRETER_OUTPUTS
    "${AVM_INTERPRETER_OBJECT}"
    "${AVM_INTERPRETER_ELF}"
    "${AVM_INTERPRETER_MAP}"
    "${AVM_INTERPRETER_LISTING}"
    "${AVM_INTERPRETER_HEX}"
)

# Tool discovery occurs inside the script when this command is built, so an
# AVR toolchain is not required to configure or build unrelated targets.
add_custom_command(
    OUTPUT ${AVM_INTERPRETER_OUTPUTS}
    COMMAND
        "${CMAKE_COMMAND}"
        "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
        "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
        "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
        "-DSOURCE:FILEPATH=${AVM_INTERPRETER_SOURCE}"
        "-DOUTPUT_OBJECT:FILEPATH=${AVM_INTERPRETER_OBJECT}"
        "-DOUTPUT_ELF:FILEPATH=${AVM_INTERPRETER_ELF}"
        "-DOUTPUT_MAP:FILEPATH=${AVM_INTERPRETER_MAP}"
        "-DOUTPUT_LISTING:FILEPATH=${AVM_INTERPRETER_LISTING}"
        "-DOUTPUT_HEX:FILEPATH=${AVM_INTERPRETER_HEX}"
        "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
        -P "${AVM_INTERPRETER_BUILD_CMAKE}"
    DEPENDS
        "${AVM_INTERPRETER_SOURCE}"
        "${AVM_INTERPRETER_BUILD_CMAKE}"
    COMMENT "Building the AVR AVM interpreter"
    USES_TERMINAL
    VERBATIM
)

add_custom_target(avm_interpreter
    DEPENDS ${AVM_INTERPRETER_OUTPUTS}
)

set(AVM_SDK_INTERPRETER_HEX "${AVM_SDK_BUILD_BIN}/avm/interp.hex")
add_custom_command(
    OUTPUT "${AVM_SDK_INTERPRETER_HEX}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_SDK_BUILD_BIN}/avm"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_HEX}" "${AVM_SDK_INTERPRETER_HEX}"
    DEPENDS avm_interpreter
    VERBATIM)
add_custom_target(avm_interpreter_sdk DEPENDS "${AVM_SDK_INTERPRETER_HEX}")
add_dependencies(avm_toolchain avm_interpreter_sdk)
add_dependencies(avm_sdk_tools avm_interpreter_sdk)
install(FILES "${AVM_SDK_INTERPRETER_HEX}"
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
    DEPENDS avm_interpreter "${PROJECT_SOURCE_DIR}/cmake/GenerateAvmBoundaryMetadata.cmake"
    VERBATIM)
add_custom_target(avm_interpreter_boundary
    DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/interp-boundary.json")
