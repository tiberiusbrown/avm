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

avr-gcc -c -x assembler-with-cpp -mmcu=atmega32u4 interp.asm -o interp.o
if errorlevel 1 exit /b 1

avr-ld --section-start=.text=0x0000 -Tdata=0x800100 interp.o -o interp.elf
if errorlevel 1 exit /b 1

avr-objdump -d -j .text interp.elf > interp.bin.asm
if errorlevel 1 exit /b 1

avr-objcopy -O ihex interp.elf interp.hex
if errorlevel 1 exit /b 1

echo Built interp.elf, interp.bin.asm, and interp.hex
