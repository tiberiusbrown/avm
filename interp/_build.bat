@echo off
setlocal
cmake --build "%~dp0..\build" --config RelWithDebInfo --target avm_interpreter %*
