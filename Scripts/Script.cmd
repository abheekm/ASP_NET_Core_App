@echo off
echo === Basic Test Started ===

echo Hello from Windows CI runner!
echo Current directory:
cd

echo Listing files:
dir

echo Environment variables:
set

echo === Basic Test Completed ===

@echo off
echo === System Test Started ===

echo Checking time:
echo %TIME%

echo Checking disk usage:
wmic logicaldisk get size,freespace,caption

echo Checking network connectivity:
ping -n 3 google.com

echo Creating temp file:
echo CI_TEMP > temp_file.txt
type temp_file.txt

echo Deleting temp file:
del temp_file.txt

echo === System Test Completed ===

@echo off
echo === Logic Test Started ===

set count=1
:loop
echo Loop iteration %count%
set /a count=%count% + 1
if %count% LEQ 5 goto loop

echo Checking conditional:
if exist "%SystemRoot%\System32" (
    echo System32 exists!
) else (
    echo System32 is missing!?
)

echo === Logic Test Completed ===

@echo off
setlocal EnableExtensions EnableDelayedExpansion

echo === Complex Windows Test Started ===

echo Creating files...
echo File A > A.txt
echo File B > B.txt

echo Merging files...
copy /b A.txt+B.txt merged.txt >nul

echo Running tasks sequentially (CI-safe)...

echo Task 1 started
ping -n 2 127.0.0.1 >nul
echo Task 1 finished

echo Task 2 started
timeout /t 2 /nobreak >nul
echo Task 2 finished

echo Showing merged file:
type merged.txt

if exist merged.txt (
    echo Merge successful.
) else (
    echo Merge failed.
)

echo Cleaning up...
del A.txt B.txt merged.txt >nul 2>&1

echo === Complex Windows Test Completed ===