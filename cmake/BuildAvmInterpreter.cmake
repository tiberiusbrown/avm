cmake_minimum_required(VERSION 3.20)

foreach(REQUIRED_VARIABLE
        SOURCE
        OUTPUT_OBJECT
        OUTPUT_ELF
        OUTPUT_MAP
        OUTPUT_LISTING
        OUTPUT_HEX
        MAX_INTERP_SIZE)
    if(NOT DEFINED ${REQUIRED_VARIABLE} OR
       "${${REQUIRED_VARIABLE}}" STREQUAL "")
        message(FATAL_ERROR "Missing required variable: ${REQUIRED_VARIABLE}")
    endif()
endforeach()

function(find_avr_tool VARIABLE_NAME PROGRAM_NAME)
    if(DEFINED ${VARIABLE_NAME}
       AND NOT "${${VARIABLE_NAME}}" STREQUAL ""
       AND NOT "${${VARIABLE_NAME}}" MATCHES "-NOTFOUND$")
        if(NOT EXISTS "${${VARIABLE_NAME}}")
            message(FATAL_ERROR
                "${VARIABLE_NAME} does not exist: ${${VARIABLE_NAME}}")
        endif()
        set(${VARIABLE_NAME} "${${VARIABLE_NAME}}" PARENT_SCOPE)
        return()
    endif()

    set(SEARCH_HINTS)
    if(DEFINED AVR_GCC
       AND NOT "${AVR_GCC}" STREQUAL ""
       AND NOT "${AVR_GCC}" MATCHES "-NOTFOUND$")
        get_filename_component(AVR_BIN_DIR "${AVR_GCC}" DIRECTORY)
        list(APPEND SEARCH_HINTS "${AVR_BIN_DIR}")
    endif()

    unset(FOUND_PROGRAM)
    unset(FOUND_PROGRAM CACHE)
    find_program(FOUND_PROGRAM
        NAMES "${PROGRAM_NAME}"
        HINTS ${SEARCH_HINTS}
    )
    if(NOT FOUND_PROGRAM)
        message(FATAL_ERROR
            "Unable to find ${PROGRAM_NAME}. Add the AVR toolchain to PATH "
            "or set ${VARIABLE_NAME} in the CMake cache.")
    endif()

    set(${VARIABLE_NAME} "${FOUND_PROGRAM}" PARENT_SCOPE)
endfunction()

get_filename_component(OUTPUT_DIR "${OUTPUT_ELF}" DIRECTORY)
set(TEMP_SIZE_BINARY "${OUTPUT_DIR}/interp.size.bin")
file(MAKE_DIRECTORY "${OUTPUT_DIR}")

set(FINAL_OUTPUTS
    "${OUTPUT_OBJECT}"
    "${OUTPUT_ELF}"
    "${OUTPUT_MAP}"
    "${OUTPUT_LISTING}"
    "${OUTPUT_HEX}"
    "${TEMP_SIZE_BINARY}"
)

# Prevent a failed or oversized rebuild from leaving stale artifacts behind.
file(REMOVE ${FINAL_OUTPUTS})

# Discover tools only after stale products are removed. A missing or invalid
# tool therefore cannot leave artifacts from an earlier successful build.
find_avr_tool(AVR_GCC avr-gcc)
find_avr_tool(AVR_OBJCOPY avr-objcopy)
find_avr_tool(AVR_OBJDUMP avr-objdump)

function(run_checked DESCRIPTION)
    set(options OUTPUT_FILE)
    set(one_value_args FILE)
    cmake_parse_arguments(ARG "${options}" "${one_value_args}" "" ${ARGN})

    set(COMMAND_ARGUMENTS ${ARG_UNPARSED_ARGUMENTS})
    if(ARG_OUTPUT_FILE)
        execute_process(
            COMMAND ${COMMAND_ARGUMENTS}
            RESULT_VARIABLE COMMAND_RESULT
            OUTPUT_FILE "${ARG_FILE}"
            ERROR_VARIABLE COMMAND_STDERR
        )
        set(COMMAND_STDOUT "(written to ${ARG_FILE})")
    else()
        execute_process(
            COMMAND ${COMMAND_ARGUMENTS}
            RESULT_VARIABLE COMMAND_RESULT
            OUTPUT_VARIABLE COMMAND_STDOUT
            ERROR_VARIABLE COMMAND_STDERR
        )
    endif()

    if(NOT COMMAND_RESULT EQUAL 0)
        file(REMOVE ${FINAL_OUTPUTS})
        string(REPLACE ";" " " COMMAND_TEXT "${COMMAND_ARGUMENTS}")
        message(FATAL_ERROR
            "${DESCRIPTION} failed with exit code ${COMMAND_RESULT}\n"
            "Command: ${COMMAND_TEXT}\n"
            "stdout:\n${COMMAND_STDOUT}\n"
            "stderr:\n${COMMAND_STDERR}")
    endif()
endfunction()

run_checked(
    "AVR assembly"
    "${AVR_GCC}"
    -c
    -x assembler-with-cpp
    -mmcu=atmega32u4
    "${SOURCE}"
    -o "${OUTPUT_OBJECT}"
)

# Use the avr-gcc driver for linking so it selects the installed ATmega32U4
# linker emulation and script without relying on a platform-specific AVR_HOME.
run_checked(
    "AVR link"
    "${AVR_GCC}"
    -mmcu=atmega32u4
    -nostartfiles
    -nostdlib
    "-Wl,--gc-sections"
    "-Wl,--entry=__vectors"
    "-Wl,--section-start=.text=0x0000"
    "-Wl,-Tdata=0x800A0B"
    "-Wl,-Map=${OUTPUT_MAP}"
    "${OUTPUT_OBJECT}"
    -o "${OUTPUT_ELF}"
)

run_checked(
    "Interpreter size extraction"
    "${AVR_OBJCOPY}"
    -O binary
    -j .text
    "${OUTPUT_ELF}"
    "${TEMP_SIZE_BINARY}"
)

if(NOT EXISTS "${TEMP_SIZE_BINARY}")
    file(REMOVE ${FINAL_OUTPUTS})
    message(FATAL_ERROR "Unable to determine interpreter binary size")
endif()

file(SIZE "${TEMP_SIZE_BINARY}" INTERP_SIZE)
file(REMOVE "${TEMP_SIZE_BINARY}")

message(STATUS
    "Interpreter binary size: ${INTERP_SIZE} bytes "
    "(limit: ${MAX_INTERP_SIZE} bytes)")

if(INTERP_SIZE GREATER MAX_INTERP_SIZE)
    file(REMOVE ${FINAL_OUTPUTS})
    message(FATAL_ERROR
        "Interpreter binary exceeds the configured ${MAX_INTERP_SIZE}-byte limit")
endif()

run_checked(
    "AVR listing generation"
    OUTPUT_FILE FILE "${OUTPUT_LISTING}"
    "${AVR_OBJDUMP}"
    -D
    -z
    -t
    -j .text
    "${OUTPUT_ELF}"
)

run_checked(
    "Intel HEX generation"
    "${AVR_OBJCOPY}"
    -O ihex
    "${OUTPUT_ELF}"
    "${OUTPUT_HEX}"
)
