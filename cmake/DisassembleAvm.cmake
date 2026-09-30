cmake_minimum_required(VERSION 3.20)

foreach(REQUIRED_VARIABLE AVM_OBJDUMP AVM_INPUT AVM_OUTPUT)
    if(NOT DEFINED ${REQUIRED_VARIABLE} OR
       "${${REQUIRED_VARIABLE}}" STREQUAL "")
        message(FATAL_ERROR
            "DisassembleAvm.cmake requires -D${REQUIRED_VARIABLE}=...")
    endif()
endforeach()

execute_process(
    COMMAND
        "${AVM_OBJDUMP}"
        --disassemble
        --source
        --syms
        --symbolize-operands
        --demangle
        --print-imm-hex
        --no-addresses
        "${AVM_INPUT}"
    OUTPUT_VARIABLE AVM_DISASSEMBLY
    ERROR_VARIABLE AVM_OBJDUMP_ERROR
    RESULT_VARIABLE AVM_OBJDUMP_RESULT
)

if(NOT AVM_OBJDUMP_RESULT EQUAL 0)
    file(REMOVE "${AVM_OUTPUT}")
    message(FATAL_ERROR
        "llvm-objdump failed for ${AVM_INPUT} with exit code "
        "${AVM_OBJDUMP_RESULT}:\n${AVM_OBJDUMP_ERROR}")
endif()

# llvm-objdump starts with the absolute ELF path. Keep checked-in output
# independent of the machine and build directory that generated it.
get_filename_component(AVM_INPUT_NAME "${AVM_INPUT}" NAME)
string(REPLACE "${AVM_INPUT}" "${AVM_INPUT_NAME}"
    AVM_DISASSEMBLY "${AVM_DISASSEMBLY}")
file(WRITE "${AVM_OUTPUT}" "${AVM_DISASSEMBLY}")
