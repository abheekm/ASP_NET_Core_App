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