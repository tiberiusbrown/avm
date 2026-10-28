if(NOT DEFINED AVM_REPORT OR AVM_REPORT STREQUAL "")
    message(FATAL_ERROR "AVM_REPORT is required")
endif()

if(NOT DEFINED AVM_OUTPUT_ELF OR AVM_OUTPUT_ELF STREQUAL "")
    message(FATAL_ERROR "AVM_OUTPUT_ELF is required")
endif()

if(NOT DEFINED AVM_LINKER OR AVM_LINKER STREQUAL "")
    message(FATAL_ERROR "AVM_LINKER is required")
endif()

if(NOT EXISTS "${AVM_LINKER}")
    message(FATAL_ERROR
        "AVM linker executable does not exist: ${AVM_LINKER}")
endif()

set(AVM_COMMAND)
set(AVM_COMMAND_ARGS_BEGIN FALSE)

math(EXPR AVM_LAST_ARG "${CMAKE_ARGC} - 1")

foreach(arg_index RANGE 0 ${AVM_LAST_ARG})
    set(arg "${CMAKE_ARGV${arg_index}}")

    if(AVM_COMMAND_ARGS_BEGIN)
        list(APPEND AVM_COMMAND "${arg}")
    elseif(arg STREQUAL "--")
        set(AVM_COMMAND_ARGS_BEGIN TRUE)
    endif()
endforeach()

if(NOT AVM_COMMAND_ARGS_BEGIN OR NOT AVM_COMMAND)
    message(FATAL_ERROR "Command required after --")
endif()

get_filename_component(report_dir "${AVM_REPORT}" DIRECTORY)
file(MAKE_DIRECTORY "${report_dir}")
file(REMOVE "${AVM_OUTPUT_ELF}")

execute_process(
    COMMAND ${AVM_COMMAND}
    RESULT_VARIABLE result
    OUTPUT_VARIABLE stdout
    ERROR_VARIABLE stderr
)

set(diagnostic "${stdout}${stderr}")
file(WRITE "${AVM_REPORT}" "${diagnostic}")

if(NOT "${result}" MATCHES "^[0-9]+$")
    message(FATAL_ERROR
        "Unable to execute fixture command: ${result}\n${diagnostic}")
endif()

if(diagnostic MATCHES
   "posix_spawn failed|unable to execute command")
    message(FATAL_ERROR
        "Tool execution failed:\n${diagnostic}")
endif()

if(AVM_EXPECT_FAILURE)
    if("${result}" STREQUAL "0")
        message(FATAL_ERROR
            "Expected linker failure, but command succeeded:\n"
            "${AVM_COMMAND}\n${diagnostic}")
    endif()
else()
    if(NOT "${result}" STREQUAL "0")
        message(FATAL_ERROR
            "Fixture compilation/linking failed (exit ${result}):\n"
            "${AVM_COMMAND}\n${diagnostic}")
    endif()

    if(NOT EXISTS "${AVM_OUTPUT_ELF}")
        message(FATAL_ERROR
            "Link succeeded but ELF was not produced: ${AVM_OUTPUT_ELF}")
    endif()
endif()
