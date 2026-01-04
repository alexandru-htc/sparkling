@echo off
echo   Checking Java installation...
echo.

:: Check Java installation
java -version >nul 2>&1
if %errorLevel% equ 0 (
    echo Java found
    set JAVA_MISSING=false
) else (
    echo Java not found - please install
    set JAVA_MISSING=true
)
echo.