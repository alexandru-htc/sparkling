@echo off
echo   Checking winutils.exe for Hadoop on Windows...
echo This is required for PySpark to work on Windows.
echo.


:: Check if winutils.exe exists
if exist "%SCRIPT_HADOOP_HOME%\bin\winutils.exe" (
    echo winutils.exe found at: %SCRIPT_HADOOP_HOME%\bin\winutils.exe
    set WINUTILS_MISSING=false
) else (
    echo ERROR: winutils.exe not found
    echo Please manually download winutils.exe from:
    echo https://github.com/steveloughran/winutils ^(very old versions^)
    echo or
    echo https://github.com/cdarlint/winutils ^(more up-to-date versions^)
    echo.
    echo Recommended steps:
    echo 1. Download winutils.exe for Hadoop version 3.3.1 or later
    echo 2. Place winutils.exe in %SCRIPT_HADOOP_HOME%\bin\
    echo.
    set WINUTILS_MISSING=true
    set HAS_ERROR=true
)

echo.