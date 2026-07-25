if(NOT DEFINED AVM_STDERR_OUTPUT OR AVM_STDERR_OUTPUT STREQUAL "")
    message(FATAL_ERROR "AVM_STDERR_OUTPUT must be defined")
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
    message(FATAL_ERROR "A command must be provided after --")
endif()

execute_process(
    COMMAND ${AVM_COMMAND}
    OUTPUT_QUIET
    ERROR_FILE "${AVM_STDERR_OUTPUT}"
    RESULT_VARIABLE AVM_COMMAND_RESULT
)

if(NOT AVM_COMMAND_RESULT EQUAL 0)
    message(FATAL_ERROR
        "Command failed with exit code ${AVM_COMMAND_RESULT}; "
        "see ${AVM_STDERR_OUTPUT}")
endif()
