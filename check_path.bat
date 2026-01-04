@echo off
echo   Checking PATH environment variable...
echo.


:: Check if HADOOP_HOME\bin is in PATH
echo Checking if HADOOP_HOME\bin is in PATH...
rem echo PATH contains: %PATH%

:: Convert PATH to lowercase for comparison
set "PATH_LOWERCASE=%PATH: =%"
set "HADOOP_BIN_LOWERCASE=%SCRIPT_HADOOP_HOME%\bin"

echo.
echo Checking PATH for Hadoop bin directory...

:: Simple check - look for the string in PATH
echo %PATH% | findstr /C:"%SCRIPT_HADOOP_HOME%\bin" >nul
if %errorLevel% equ 0 (
    echo HADOOP_HOME\bin is found in PATH
    set PATH_OK=true
) else (
    echo ERROR: HADOOP_HOME\bin is not found in PATH
    echo This is required for PySpark to find winutils.exe
    echo.
    echo Please add %SCRIPT_HADOOP_HOME%\bin to your PATH environment variable
    echo Example: setx PATH "%%PATH%%;%SCRIPT_HADOOP_HOME%\bin" /M
    echo.
    set PATH_OK=false
    set HAS_ERROR=true
)

echo.