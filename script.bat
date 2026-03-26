@echo off
REM === Check if environment variable MY_ENV_VAR is defined ===
set MY_ENV_VAR=hello_from_script
 
IF DEFINED MY_ENV_VAR (
    echo Environment variable MY_ENV_VAR is defined: %MY_ENV_VAR%
 
    REM === Create directory if it doesn't exist ===
    IF NOT EXIST "C:\build\output" (
        echo Directory does not exist. Creating now...
        mkdir "C:\build\output"
    ) ELSE (
        echo Directory already exists.
    )
) ELSE (
    echo Environment variable MY_ENV_VAR is NOT defined. Skipping directory creation.
)

for %%i in (*.txt) do echo Found file: %%i

@echo off
setlocal enabledelayedexpansion
set BUILD_ENV=hello_script

:: Check multiple preconditions
echo === Pre-Check Validation ===

set FAIL=0

:: Env var check
IF NOT DEFINED BUILD_ENV (
    echo BUILD_ENV not set
    set FAIL=1
) ELSE (
    echo BUILD_ENV=%BUILD_ENV%
)

:: File check
IF NOT EXIST C:\build\output\artifact.zip (
    echo Missing artifact.zip
    set FAIL=1
) ELSE (
    echo artifact.zip found
)

:: Exit early if failed
IF !FAIL! NEQ 0 (
    echo Pre-checks failed
    exit /b 1
)

echo All checks passed
endlocal

@echo off
setlocal enabledelayedexpansion

for %%F in (C:\build\logs\*.log) do (
    findstr /i "ERROR" "%%F" >nul
    IF !errorlevel! EQU 0 (
        echo Error found in %%F
        exit /b 1
    ) ELSE (
        echo No errors in %%F
    )
)

echo All logs are clean
endlocal

set ENV=production

@echo off
:: CI will only pass if ENV=production AND artifact exists
IF "%ENV%"=="production" (
    IF EXIST C:\build\output\artifact.zip (
        echo Correct environment and artifact present
    ) ELSE (
        echo Missing artifact.zip
        exit /b 1
    )
) ELSE (
    echo Wrong ENV: %ENV%
    exit /b 1
)

@echo off
set RETRIES=0

:RETRY
echo Attempt %RETRIES%...
curl -s http://example.com >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Success on attempt %RETRIES%
    goto :END
) ELSE (
    set /a RETRIES+=1
    IF %RETRIES% LEQ 3 (
        echo Retry in 2 seconds...
        timeout /t 2 >nul
        goto :RETRY
    ) ELSE (
        echo Failed after 3 attempts
        exit /b 1
    )
)

:END
echo Finished