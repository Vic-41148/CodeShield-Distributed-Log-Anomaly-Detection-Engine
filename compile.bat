@echo off
echo Compiling CodeShield...
gcc -c alert.c -o alert.o
gcc -c analyzer.c -o analyzer.o
gcc -c hashmap.c -o hashmap.o
gcc -c ingestion.c -o ingestion.o
gcc -c main.c -o main.o
gcc -c scorer.c -o scorer.o
gcc -c window.c -o window.o
gcc -o codeshield.exe alert.o analyzer.o hashmap.o ingestion.o main.o scorer.o window.o -lpthread

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Compilation successful! Running...
    echo ========================================
    codeshield.exe
) else (
    echo.
    echo Compilation failed!
    pause
)