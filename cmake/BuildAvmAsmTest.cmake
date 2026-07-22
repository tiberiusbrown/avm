# Build one AVM assembly test through the complete LLVM MC pipeline.
#
# Required -D variables:
#   LLVM_MC, LLD, LLVM_OBJDUMP, LLVM_AVM_IMAGE
#   SOURCE, INCLUDE_DIR
#   OUTPUT_OBJECT, OUTPUT_ELF, OUTPUT_DISASSEMBLY, OUTPUT_IMAGE

cmake_minimum_required(VERSION 3.20)

foreach(REQUIRED_VAR
        LLVM_MC
        LLD
        LLVM_OBJDUMP
        LLVM_AVM_IMAGE
        SOURCE
        INCLUDE_DIR
        OUTPUT_OBJECT
        OUTPUT_ELF
        OUTPUT_DISASSEMBLY
        OUTPUT_IMAGE)
    if(NOT DEFINED ${REQUIRED_VAR} OR "${${REQUIRED_VAR}}" STREQUAL "")
        message(FATAL_ERROR
            "BuildAvmAsmTest.cmake requires -D${REQUIRED_VAR}=...")
    endif()
endforeach()

foreach(INPUT_FILE LLVM_MC LLD LLVM_OBJDUMP LLVM_AVM_IMAGE SOURCE)
    if(NOT EXISTS "${${INPUT_FILE}}")
        message(FATAL_ERROR
            "${INPUT_FILE} does not exist: ${${INPUT_FILE}}")
    endif()
endforeach()

if(NOT IS_DIRECTORY "${INCLUDE_DIR}")
    message(FATAL_ERROR
        "INCLUDE_DIR is not a directory: ${INCLUDE_DIR}")
endif()

get_filename_component(OUTPUT_DIR "${OUTPUT_OBJECT}" DIRECTORY)
file(MAKE_DIRECTORY "${OUTPUT_DIR}")

# Remove all outputs before starting so a failed rebuild cannot leave a stale,
# apparently current artifact from an earlier successful invocation.
file(REMOVE
    "${OUTPUT_OBJECT}"
    "${OUTPUT_ELF}"
    "${OUTPUT_DISASSEMBLY}"
    "${OUTPUT_IMAGE}")

function(run_checked DESCRIPTION)
    execute_process(
        COMMAND ${ARGN}
        RESULT_VARIABLE COMMAND_RESULT
        OUTPUT_VARIABLE COMMAND_STDOUT
        ERROR_VARIABLE COMMAND_STDERR
    )

    if(NOT COMMAND_RESULT EQUAL 0)
        string(REPLACE ";" " " COMMAND_TEXT "${ARGN}")
        message(FATAL_ERROR
            "${DESCRIPTION} failed with exit code ${COMMAND_RESULT}\n"
            "Command: ${COMMAND_TEXT}\n"
            "stdout:\n${COMMAND_STDOUT}\n"
            "stderr:\n${COMMAND_STDERR}")
    endif()
endfunction()

run_checked(
    "Assembling ${SOURCE}"
    "${LLVM_MC}"
    -triple=avm-unknown-arduboyfx
    -filetype=obj
    -I "${INCLUDE_DIR}"
    "${SOURCE}"
    -o "${OUTPUT_OBJECT}")

run_checked(
    "Linking ${OUTPUT_ELF}"
    "${LLD}"
    -flavor gnu
    --entry=_start
    -o "${OUTPUT_ELF}"
    "${OUTPUT_OBJECT}")

# llvm-objdump writes its report to stdout, so capture it directly into the
# declared .dis build product.
execute_process(
    COMMAND
        "${LLVM_OBJDUMP}"
        --disassemble
        --syms
        --symbolize-operands
        --demangle
        --print-imm-hex
        --no-addresses
        "${OUTPUT_ELF}"
    RESULT_VARIABLE OBJDUMP_RESULT
    OUTPUT_FILE "${OUTPUT_DISASSEMBLY}"
    ERROR_VARIABLE OBJDUMP_STDERR
)
if(NOT OBJDUMP_RESULT EQUAL 0)
    file(REMOVE "${OUTPUT_DISASSEMBLY}")
    message(FATAL_ERROR
        "Disassembling ${OUTPUT_ELF} failed with exit code "
        "${OBJDUMP_RESULT}\n"
        "stderr:\n${OBJDUMP_STDERR}")
endif()

run_checked(
    "Packaging ${OUTPUT_IMAGE}"
    "${LLVM_AVM_IMAGE}"
    "${OUTPUT_ELF}"
    -o "${OUTPUT_IMAGE}")

foreach(OUTPUT_FILE
        OUTPUT_OBJECT
        OUTPUT_ELF
        OUTPUT_DISASSEMBLY
        OUTPUT_IMAGE)
    if(NOT EXISTS "${${OUTPUT_FILE}}")
        message(FATAL_ERROR
            "Expected build product was not created: ${${OUTPUT_FILE}}")
    endif()
endforeach()
