@echo off
setlocal

cd /d "%~dp0"

for /f "delims=" %%G in ('where avr-gcc 2^>nul') do (
    set "AVR_GCC=%%~fG"
    goto :found_avr_gcc
)

:found_avr_gcc
if defined AVR_GCC (
    for %%G in ("%AVR_GCC%") do set "AVR_HOME=%%~dpG.."
)

if not defined AVR_HOME (
    echo Error: add avr-gcc to PATH.
    exit /b 1
)

if not exist "%AVR_HOME%\avr\lib\ldscripts\avr5.x" (
    echo Error: AVR linker script not found under "%AVR_HOME%".
    exit /b 1
)

avr-gcc -c -x assembler-with-cpp -mmcu=atmega32u4 interp.asm -o build\interp.o
if errorlevel 1 exit /b 1

avr-ld -T "%AVR_HOME%\avr\lib\ldscripts\avr5.x" ^
    --section-start=.text=0x0000 ^
    -Tdata=0x800100 ^
    -Map=build\interp.map ^
    build\interp.o -o build\interp.elf
if errorlevel 1 exit /b 1

avr-objdump -D -z -t -j .text build\interp.elf > build\interp.lst
if errorlevel 1 exit /b 1

avr-objcopy -O ihex build\interp.elf build\interp.hex
if errorlevel 1 exit /b 1
