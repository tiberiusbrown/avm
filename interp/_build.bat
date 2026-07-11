@echo off
setlocal

set "MAX_INTERP_SIZE=29696"

cd /d "%~dp0"

rem Remove stale final outputs so a failed or oversized build cannot leave them behind.
del /q "build\interp.hex" "build\interp.lst" 2>nul

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

rem Measure the exact raw .text image, including any gaps introduced by .org.
set "SIZE_FILE=build\interp.size.bin"
del /q "%SIZE_FILE%" 2>nul
avr-objcopy -O binary -j .text build\interp.elf "%SIZE_FILE%"
if errorlevel 1 exit /b 1

for %%F in ("%SIZE_FILE%") do set "INTERP_SIZE=%%~zF"
del /q "%SIZE_FILE%" 2>nul

if not defined INTERP_SIZE (
    echo Error: unable to determine interpreter binary size.
    exit /b 1
)

echo Interpreter binary size: %INTERP_SIZE% bytes ^(limit: %MAX_INTERP_SIZE% bytes^)
if %INTERP_SIZE% GTR %MAX_INTERP_SIZE% (
    echo Error: interpreter binary exceeds the 29 KiB limit.
    exit /b 1
)

avr-objdump -D -z -t -j .text build\interp.elf > build\interp.lst
if errorlevel 1 exit /b 1

avr-objcopy -O ihex build\interp.elf build\interp.hex
if errorlevel 1 exit /b 1
